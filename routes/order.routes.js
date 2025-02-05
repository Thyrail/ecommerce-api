import express from 'express';
import { createOrder, getOrders, getOrderById, updateOrder, deleteOrder } from '../controllers/order.controller.js';
import { validateSchema } from '../middleware/validate.middleware.js';
import { orderSchema } from '../schemas/order.schema.js';

const router = express.Router();

router.get('/', getOrders);
router.get('/:id', getOrderById);
router.post('/', validateSchema(orderSchema), createOrder);
router.put('/:id', validateSchema(orderSchema), updateOrder);
router.delete('/:id', deleteOrder);

export default router;