// import { Product } from '../models/products.js';

import { PrismaClient } from '@prisma/client';

const prisma = new PrismaClient();


export async function getProducts (req, res) {
    try {
        const allProduct = await prisma.product.findMany();
        if(!allProduct) {
            res.status(204).json({
                message: 'Product tidak ada'
            })
        } else {
            res.status(200).json({
                status: 200,
                message: 'Product ada',
                data : allProduct
            })
        }
    } catch (error){
        console.error(error);
    }
}

export async function getDetailsProd (req, res) {
    const { id } = req.params;

    try {
        const product = await prisma.product.findUnique({
          where: { id: String(id) },
        });
        if(!product) {
            res.status(200).json({
                message: 'ID tidak sesuai dengan request'
            })
        } else {
            res.status(200).json({
                status: 200,
                message :'ID Sesuai dengan request',
                data : product
            })
        }
    } catch (error){
        console.error(error);
    }
}


export async function addProduct(req, res) {
    // const value  = addProductValidate(req.body);
    try {
        const { title, harga, deskripsi, qty } = req.body;
    
        const product = await prisma.product.create({
          data: {
            title,
            harga,
            deskripsi,
            qty,
          },
        });
    
        res.status(201).json({
          status: 201,
          message: 'Product berhasil ditambahkan',
          data: product
        });
      } catch (error) {
        console.error(error);
        res.status(500).json({
          message: 'Internal server error'
        });
      }
  }


export async function editProduct(req, res) {
    const { id } = req.params;
    const { title, harga, deskripsi, qty } = req.body;

    try {
        const update = await prisma.product.update({
          where: { id: String(id) },
          data: {
            title,
            harga,
            deskripsi,
            qty,
          },
        });
        console.log('product updated');
        res.status(200).json({
        message: 'Berhasil mengubah product'
        });
    } catch (error) {
        console.error(error);
    }
}
export async function deleteProduct(req, res) {
    const { id } = req.params;
  
    try {
      const product = await prisma.product.delete({ where: { id: String(id)} });
      if (!product) {
        console.error('Product id tidak benar');
        res.status(200).json({
          message: 'Product id tidak benar',
        });
      } else {
        console.log('Berhasil menghapus product');
        res.status(200).json({
          status: 200,
          message: 'Berhasil menghapus product',
        });
      }
    } catch (error) {
      console.error(error);
      res.status(404).json({
        message: 'ada kesalahan',
      });
    }
  }