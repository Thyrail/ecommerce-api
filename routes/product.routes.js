import express from 'express';

const router = express.Router();

router.get('/', (req, res) =>
{
    res.json({ message: 'Product routes working!' });
});

export default router;