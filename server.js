import express from 'express';
import cors from 'cors';
import dotenv from 'dotenv';
import { sequelize } from './db/connection.js';
import userRoutes from './routes/user.routes.js';
import productRoutes from './routes/product.routes.js';
import categoryRoutes from './routes/category.routes.js';
import orderRoutes from './routes/order.routes.js';

dotenv.config();
const app = express();

app.use(express.json());
app.use(cors());

sequelize
    .sync()
    .then(() => console.log('Database synchronized...'))
    .catch(err => console.error('Database sync error:', err));

app.use('/users', userRoutes);
app.use('/products', productRoutes);
app.use('/categories', categoryRoutes);
app.use('/orders', orderRoutes);

app.get('/', (req, res) =>
{
    res.send('Welcome to the eCommerce API!');
});

const PORT = process.env.PORT || 5000;
app.listen(PORT, () =>
{
    console.log(`Server running on port ${PORT}`);
});