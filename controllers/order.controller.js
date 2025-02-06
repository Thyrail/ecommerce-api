import { Order } from '../db/models/order.model.js';

export const getOrders = async (req, res) =>
{
    try
    {
        const orders = await Order.findAll();
        res.json(orders);
    } catch (error)
    {
        console.error(error);
        res.status(500).json({ error: 'Error fetching orders' });
    }
};

export const getOrderById = async (req, res) =>
{
    try
    {
        const order = await Order.findByPk(req.params.id);
        if (!order)
        {
            return res.status(404).json({ error: 'Order not found' });
        }

        res.json(order);
    } catch (error)
    {
        console.error(error);
        res.status(500).json({ error: 'Error fetching order' });
    }
};

export const createOrder = async (req, res) =>
{
    try
    {
        const { userId, products, total } = req.body;

        if (!Array.isArray(products))
        {
            return res.status(400).json({ error: 'Products must be an array' });
        }

        const newOrder = await Order.create({
            userId,
            products, //:JSON.stringify(products),
            total
        });

        res.status(201).json(newOrder);
    } catch (error)
    {
        console.error(error);
        res.status(500).json({ error: 'Error creating order' });
    }
};

export const updateOrder = async (req, res) =>
{
    try
    {
        const order = await Order.findByPk(req.params.id);
        if (!order) return res.status(404).json({ error: 'Order not found' });

        await order.update(req.body);
        res.json(order);
    } catch (error)
    {
        res.status(500).json({ error: 'Error updating order' });
    }
};

export const deleteOrder = async (req, res) =>
{
    try
    {
        const order = await Order.findByPk(req.params.id);
        if (!order) return res.status(404).json({ error: 'Order not found' });

        await order.destroy();
        res.json({ message: 'Order deleted successfully' });
    } catch (error)
    {
        res.status(500).json({ error: 'Error deleting order' });
    }
};