import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:percent_indicator/percent_indicator.dart';

const Color firstColor = Color(0xff2E3D64);
const Color secondColor = Color(0xff0093AC);
const Color thirdColor = Color(0xffD2E5FF);

class ProgressCard extends StatelessWidget {
  final String imageURL;
  final String judul;
  final String progress;
  final double percent;
  final TextStyle textStyle = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 16,
    color: firstColor,
    fontWeight: FontWeight.bold
  );
  final VoidCallback onPressed;

  ProgressCard({
    required this.imageURL,
    required this.judul,
    required this.progress,
    required this.percent,
    required this.onPressed
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
          GestureDetector(
            onTap: onPressed,
            child: Container(
              width: double.infinity,
              height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  image: DecorationImage(
                    image: NetworkImage(
                      "https://bimbel.adzazarif.my.id/storage/$imageURL",
                    ),
                    fit: BoxFit.cover,
                    onError: (exception, stackTrace) {
                      // You can't directly handle error here, so you need to use a fallback mechanism
                    },
                  ),
                ),
                child: Image.network(
                  "https://bimbel.adzazarif.my.id/storage/$imageURL",
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey,
                      child: Center(
                        child: Text('Error loading image'),
                      ),
                    );
                  },
                  loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                            : null,
                      ),
                    );
                  },
                ),
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
                  percent: percent,
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