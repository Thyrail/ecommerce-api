import express from 'express';
import { createUser, getUsers, updateUser, deleteUser, getUserById } from '../controllers/user.controller.js';

const router = express.Router();

router.get('/', getUsers);
router.get('/:id', getUserById);
router.post('/', createUser);
router.put('/:id', updateUser);
router.delete('/:id', deleteUser);

export default router;