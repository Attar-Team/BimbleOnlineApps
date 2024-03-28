import 'package:flutter/material.dart';

const Color firstColor = Color(0xff2E3D64);
const Color secondColor = Color(0xff0093AC);

class ProductCard extends StatelessWidget {
  final String imageURL;
  final String name;
  final String description;
  final String price;
  final TextStyle textStyle = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.black
  );

  ProductCard({
    required this.imageURL,
    required this.name,
    required this.description,
    required this.price,
  });
    
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //notifikasi
        Container(
          width: 180,
          height: 260,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 6,
              offset: Offset(1, 1)
            )]
          ),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 200,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5)
                      ),
                      image: DecorationImage(
                        image: AssetImage(imageURL), fit: BoxFit.cover)
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    child: Text(name, style: textStyle.copyWith(color: firstColor),),
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    child: Text(
                      description, 
                      style: 
                        textStyle.copyWith(fontSize: 10, fontWeight: FontWeight.w500),),
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    child: Text(
                      price,
                      style: 
                        textStyle.copyWith(color: firstColor),),)
                ],
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(right: 5, left: 5, top: 10),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                  color: firstColor,
                  borderRadius: BorderRadius.circular(5)
                ),
                child: Center(
                  child: Text(
                    'Beli',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.white
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}