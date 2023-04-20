import { Router } from 'express';
import * as productController from '../controllers/products.js';
// import { verifyToken } from '../middleware/authenticateToken.js';
import { authenticateToken } from '../middleware/authenticateToken.js';
export const productRouter = Router();

productRouter.get('/',productController.getProducts);
productRouter.get('/:id',productController.getDetailsProd);
productRouter.post('/' , authenticateToken,productController.addProduct);
productRouter.put('/:id', authenticateToken,productController.editProduct);
productRouter.delete('/:id', authenticateToken,productController.deleteProduct);