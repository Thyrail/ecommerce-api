import { DataTypes } from 'sequelize';
import { sequelize } from '../connection.js';

export const Order = sequelize.define('Order', {
    id: { type: DataTypes.INTEGER, autoIncrement: true, primaryKey: true },
    userId: { type: DataTypes.INTEGER, allowNull: false },
    products: {
        type: DataTypes.JSONB,
        allowNull: false
    },
    total: { type: DataTypes.FLOAT, allowNull: false }
});