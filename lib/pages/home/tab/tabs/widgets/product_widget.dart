import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uzum_market/deta/models/product_model.dart';

import '../../../../../components/constants/mediaquater.dart';

class ProductWidget extends StatefulWidget {
  Product product ;
   ProductWidget({super.key, required this.product,});

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(0, 4), // So'ya yo'nalishi
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Rasm qismi
          Container(
            width: double.infinity,
            height: m_w(context) * 0.55,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: NetworkImage(widget.product.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 10),
          // Mahsulot nomi
           Text(
            widget.product.title ,
            maxLines: 2,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 15),
          // Narx qismi
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.product.price.toString(),
                    style: TextStyle(
                      decoration: TextDecoration.lineThrough,
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    widget.product.price.toString(),
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
              // Savat tugmasi
              InkWell(
                onTap: () {
                  // Savatchaga qo'shish
                },
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.green.shade50,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.green,
                    ),
                  ),
                  child: const Icon(
                    Icons.add_shopping_cart,
                    color: Colors.green,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
