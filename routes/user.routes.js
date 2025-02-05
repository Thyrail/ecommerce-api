import express from 'express';
import { createUser, getUsers, updateUser, deleteUser, getUserById } from '../controllers/user.controller.js';
import { validateSchema } from '../middleware/validate.middleware.js';
import { userSchema } from '../schemas/user.schema.js';

const router = express.Router();

router.get('/', getUsers);
router.get('/:id', getUserById);
router.post('/', validateSchema(userSchema), createUser); 
router.put('/:id', validateSchema(userSchema), updateUser);
router.delete('/:id', deleteUser);

export default router;