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

export const getUserById = async (req, res) =>
{
    try
    {
        const user = await User.findByPk(req.params.id);
        if (!user) return res.status(404).json({ error: 'User not found' });
        res.json(user);
    } catch (error)
    {
        res.status(500).json({ error: 'Error fetching user' });
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

export const updateUser = async (req, res) =>
{
    try
    {
        const { id } = req.params;
        const { name, email } = req.body;

        const user = await User.findByPk(id);
        if (!user) return res.status(404).json({ error: 'User not found' });

        await user.update({ name, email });
        res.json(user);
    } catch (error)
    {
        res.status(500).json({ error: 'Error updating user' });
    }
};

export const deleteUser = async (req, res) =>
{
    try
    {
        const { id } = req.params;

        const user = await User.findByPk(id);
        if (!user) return res.status(404).json({ error: 'User not found' });

        await user.destroy();
        res.json({ message: 'User deleted successfully' });
    } catch (error)
    {
        res.status(500).json({ error: 'Error deleting user' });
    }
};