
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:hexcolor/hexcolor.dart';

import '../models/boarding_model.dart';
import 'component/component.dart';

List<BoardingModel> boarding = [
  BoardingModel(
    image: 'assets/images/books.png',
    body:
   ' Hey in this app you find a wonderful books in any field you want',
  ),
  BoardingModel(
    image: 'assets/images/books.png',
    body: 'Read your favourite Books in free time ',

  ),
  BoardingModel(
      image: 'assets/images/books.png',
      body: 'Give your self pause of time to relax.... let\'s read '
  )
];

class BoardingItem extends StatelessWidget {
  BoardingItem({ Key? key, required this.model}) : super(key: key);
 final BoardingModel model;


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Image(
          image: AssetImage(model.image),
          width: double.infinity,
          height: height* .35,
          fit: BoxFit.fill,
        ),
        SizedBox(
          height: height*.05,
        ),
        Text(
          model.body,
          textAlign: TextAlign.center,
          style: defaultTextStyle(fontSize: 28, textColor: Colors.white, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}


Color backgroundColor= HexColor('#2B475E');

