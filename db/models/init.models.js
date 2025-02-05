import { sequelize } from '../connection.js';
import { User } from './user.model.js';
import { Product } from './product.model.js';
import { Category } from './category.model.js';
import { Order } from './order.model.js';

Category.hasMany(Product, { foreignKey: 'categoryId' });
Product.belongsTo(Category, { foreignKey: 'categoryId' });

User.hasMany(Order, { foreignKey: 'userId' });
Order.belongsTo(User, { foreignKey: 'userId' });

export { sequelize, User, Product, Category, Order };