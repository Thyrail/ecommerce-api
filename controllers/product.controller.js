import { Product } from '../db/models/product.model.js';

export const getProducts = async (req, res) =>
{
    try
    {
        const products = await Product.findAll();
        res.json(products);
    } catch (error)
    {
        res.status(500).json({ error: 'Error fetching products' });
    }
};

export const getProductById = async (req, res) =>
{
    try
    {
        const product = await Product.findByPk(req.params.id);
        if (!product) return res.status(404).json({ error: 'Product not found' });
        res.json(product);
    } catch (error)
    {
        res.status(500).json({ error: 'Error fetching product' });
    }
};

export const createProduct = async (req, res) =>
{
    try
    {
        const { name, description, price, categoryId } = req.body;
        const newProduct = await Product.create({ name, description, price, categoryId });
        res.status(201).json(newProduct);
    } catch (error)
    {
        res.status(500).json({ error: 'Error creating product' });
    }
};

export const updateProduct = async (req, res) =>
{
    try
    {
        const product = await Product.findByPk(req.params.id);
        if (!product) return res.status(404).json({ error: 'Product not found' });

        await product.update(req.body);
        res.json(product);
    } catch (error)
    {
        res.status(500).json({ error: 'Error updating product' });
    }
};

export const deleteProduct = async (req, res) =>
{
    try
    {
        const product = await Product.findByPk(req.params.id);
        if (!product) return res.status(404).json({ error: 'Product not found' });

        await product.destroy();
        res.json({ message: 'Product deleted successfully' });
    } catch (error)
    {
        res.status(500).json({ error: 'Error deleting product' });
    }
};