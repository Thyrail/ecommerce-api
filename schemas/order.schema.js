import Joi from 'joi';

export const orderSchema = Joi.object({
    userId: Joi.number().integer().positive().required(),
    products: Joi.array().items(
        Joi.object({
            productId: Joi.number().integer().positive().required(),
            quantity: Joi.number().integer().min(1).required()
        })
    ).required(),
    total: Joi.number().positive().required()
});