import 'package:flutter/material.dart';
import 'package:promdi_fe/helpers/style.dart';
import 'package:promdi_fe/widgets/custom_button.dart';

class ProductDetail extends StatelessWidget {
  final productDetail;
  const ProductDetail({Key? key, this.productDetail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(productDetail['name']),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_cart),
          )
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  image: DecorationImage(
                    image: AssetImage(productDetail['image']),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Container(
              height: 260,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          productDetail['name'],
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          productDetail['price'],
                          style: TextStyle(
                            color: Colors.lightBlueAccent,
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          productDetail['description'],
                          style: TextStyle(
                            color: dark,
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        CustomButton(
                          title: 'Add to Cart',
                          onTap: () {},
                          customcolor: lightBlue,
                        ),
                        SizedBox(height: 5.0),
                        CustomButton(
                          title: 'Purchase',
                          onTap: () {},
                          customcolor: greenCustom,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
