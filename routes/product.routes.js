import express from 'express';
import { createProduct, getProducts, getProductById, updateProduct, deleteProduct } from '../controllers/product.controller.js';
import { validateSchema } from '../middleware/validate.middleware.js';
import { productSchema } from '../schemas/product.schema.js';

const router = express.Router();

router.get('/', getProducts);
router.get('/:id', getProductById);
router.post('/', validateSchema(productSchema), createProduct);
router.put('/:id', validateSchema(productSchema), updateProduct);
router.delete('/:id', deleteProduct);

export default router;