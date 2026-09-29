const express = require('express');
const stripe = require('stripe')(process.env.STRIPE_SECRET_KEY);
const cors = require('cors');
require('dotenv').config();

const app = express();
const PORT = process.env.PORT || 5000;

// IMPORTANT: Register webhook route BEFORE express.json() middleware
app.post(
  '/webhook',
  express.raw({ type: 'application/json' }),
  async (req, res) => {
    const sig = req.headers['stripe-signature'];

    let event;

    try {
      event = stripe.webhooks.constructEvent(
        req.body,
        sig,
        process.env.STRIPE_WEBHOOK_SECRET
      );
    } catch (err) {
      console.error(`Webhook Error: ${err.message}`);
      return res.status(400).send(`Webhook Error: ${err.message}`);
    }

    // Handle payment success
    if (event.type === 'payment_intent.succeeded') {
      const paymentIntent = event.data.object;
      console.log('💰 Payment Intent Succeeded:', paymentIntent.id);
      console.log('Metadata:', paymentIntent.metadata);
    }

    // Handle payment failure
    if (event.type === 'payment_intent.payment_failed') {
      const paymentIntent = event.data.object;
      console.log('❌ Payment Intent Failed:', paymentIntent.id);
    }

    res.json({ received: true });
  }
);

// Apply general middleware AFTER webhook route
app.use(express.json());
app.use(cors());

// Create Payment Intent
app.post('/api/v1/stripe/create-payment-intent', async (req, res) => {
  try {
    const { amount, currency = 'usd', metadata = {} } = req.body;

    if (!amount || amount <= 0) {
      return res.status(400).json({ error: 'Invalid amount' });
    }

    const paymentIntent = await stripe.paymentIntents.create({
      amount: Math.round(amount),
      currency: currency.toLowerCase(),
      payment_method_types: ['card'],
      metadata: { service: 'Travel Visa Processing', ...metadata },
    });

    res.json({
      clientSecret: paymentIntent.client_secret,
      id: paymentIntent.id,
      amount: paymentIntent.amount,
      currency: paymentIntent.currency,
    });
  } catch (error) {
    console.error('Error creating PaymentIntent:', error.message);
    res.status(500).json({ error: error.message });
  }
});

// Get Visa Requirements
app.get('/api/v1/visa/requirements', (req, res) => {
  const { passportCode, destinationCode } = req.query;

  const visaDatabase = {
    'DZ_TUN': { status: 'visaFree', allowedDays: 90, visaFee: 0 },
    'DZ_TUR': { status: 'visaRequired', allowedDays: 0, visaFee: 60, officialUrl: 'https://www.evisa.gov.tr' },
    'DZ_SAU': { status: 'eVisa', allowedDays: 90, visaFee: 120, officialUrl: 'https://mofa.gov.sa' },
    'FR_TUN': { status: 'visaFree', allowedDays: 90, visaFee: 0 },
    'FR_TUR': { status: 'visaFree', allowedDays: 90, visaFee: 0 },
    'FR_SAU': { status: 'eVisa', allowedDays: 90, visaFee: 120, officialUrl: 'https://mofa.gov.sa' },
  };

  const result = visaDatabase[`${passportCode}_${destinationCode}`];

  if (result) {
    res.json({ success: true, ...result });
  } else {
    res.status(404).json({ success: false, error: 'Not found' });
  }
});

app.get('/health', (req, res) => {
  res.json({ status: 'OK', timestamp: new Date().toISOString() });
});

app.listen(PORT, () => {
  console.log(`✅ Aldjawal API Server running on http://localhost:${PORT}`);
});

module.exports = app;
