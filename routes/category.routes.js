import express from 'express';
import { createCategory, getCategories, getCategoryById, updateCategory, deleteCategory } from '../controllers/category.controller.js';
import { validateSchema } from '../middleware/validate.middleware.js';
import { categorySchema } from '../schemas/category.schema.js';

const router = express.Router();

router.get('/', getCategories);
router.get('/:id', getCategoryById);
router.post('/', validateSchema(categorySchema), createCategory);
router.put('/:id', validateSchema(categorySchema), updateCategory);
router.delete('/:id', deleteCategory);

export default router;