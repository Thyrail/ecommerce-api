import { DataTypes } from 'sequelize';
import { sequelize } from '../connection.js';
import { Category } from './category.model.js';

export const Product = sequelize.define('Product', {
    id: { type: DataTypes.INTEGER, autoIncrement: true, primaryKey: true },
    name: { type: DataTypes.STRING, allowNull: false },
    description: { type: DataTypes.STRING, allowNull: false },
    price: { type: DataTypes.FLOAT, allowNull: false },
    categoryId: { type: DataTypes.INTEGER, allowNull: false, references: { model: Category, key: 'id' } }
});