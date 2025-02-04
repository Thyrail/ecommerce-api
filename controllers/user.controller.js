import { User } from '../db/models/user.model.js';

export const getUsers = async (req, res) =>
{
    try
    {
        const users = await User.findAll();
        res.json(users);
    } catch (error)
    {
        res.status(500).json({ error: 'Error fetching users' });
    }
};

export const createUser = async (req, res) =>
{
    try
    {
        const { name, email, password } = req.body;
        const newUser = await User.create({ name, email, password });
        res.status(201).json(newUser);
    } catch (error)
    {
        res.status(500).json({ error: 'Error creating user' });
    }
};