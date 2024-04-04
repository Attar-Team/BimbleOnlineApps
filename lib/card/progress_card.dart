import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:percent_indicator/percent_indicator.dart';

const Color firstColor = Color(0xff2E3D64);
const Color secondColor = Color(0xff0093AC);
const Color thirdColor = Color(0xffD2E5FF);

class ProgressCard extends StatelessWidget {
  final String imageURL;
  final String judul;
  final String progress;
  final TextStyle textStyle = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 16,
    color: firstColor,
    fontWeight: FontWeight.bold
  );

  ProgressCard({
    required this.imageURL,
    required this.judul,
    required this.progress
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 6,
            offset: Offset(1, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              image: DecorationImage(
                image: AssetImage(imageURL), fit: BoxFit.cover)
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10,),
                Text(judul,
                style: textStyle,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Progress Kamu : ',
                      style: textStyle.copyWith(fontSize: 12, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      progress,
                      style: textStyle.copyWith(fontSize: 12, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                SizedBox(height: 10,),
                LinearPercentIndicator(
                  lineHeight: 10,
                  percent: 0.7,
                  progressColor: firstColor,
                  backgroundColor: thirdColor,
                ),
                SizedBox(height: 10,)
              ],
            ),
          )
        ],
      ),
    );
  }
}