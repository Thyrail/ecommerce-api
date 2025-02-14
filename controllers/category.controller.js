import { Category } from '../db/models/category.model.js';

export const getCategories = async (req, res) =>
{
    try
    {
        const categories = await Category.findAll();
        res.json(categories);
    } catch (error)
    {
        res.status(500).json({ error: 'Error fetching categories' });
    }
};

export const getCategoryById = async (req, res) =>
{
    try
    {
        const category = await Category.findByPk(req.params.id);
        if (!category) return res.status(404).json({ error: 'Category not found' });
        res.json(category);
    } catch (error)
    {
        res.status(500).json({ error: 'Error fetching category' });
    }
};

export const createCategory = async (req, res) =>
{
    try
    {
        const { name } = req.body;
        const newCategory = await Category.create({ name });
        res.status(201).json(newCategory);
    } catch (error)
    {
        res.status(500).json({ error: 'Error creating category' });
    }
};

export const updateCategory = async (req, res) =>
{
    try
    {
        const category = await Category.findByPk(req.params.id);
        if (!category) return res.status(404).json({ error: 'Category not found' });

        await category.update(req.body);
        res.json(category);
    } catch (error)
    {
        res.status(500).json({ error: 'Error updating category' });
    }
};

export const deleteCategory = async (req, res) =>
{
    try
    {
        const category = await Category.findByPk(req.params.id);
        if (!category) return res.status(404).json({ error: 'Category not found' });

        await category.destroy();
        res.json({ message: 'Category deleted successfully' });
    } catch (error)
    {
        res.status(500).json({ error: 'Error deleting category' });
    }
};