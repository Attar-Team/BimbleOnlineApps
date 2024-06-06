import 'package:flutter/material.dart';

class TryoutCard extends StatelessWidget {
  final String nomer;
  final String judul;
  final String waktu;
  final TextStyle textStyle = TextStyle(
      fontFamily: 'Poppins',
      color: Colors.black,
      fontWeight: FontWeight.bold
  );

  TryoutCard({
    required this.nomer,
    required this.judul,
    required this.waktu,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 6,
            offset: Offset(1, 1),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const CircleAvatar(
                backgroundColor: Color(0xffD2E5FF),
                radius: 20,
                child: Icon(
                  Icons.play_arrow,
                  size: 20,
                  color: Colors.indigo,
                ),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    judul,
                    style: textStyle.copyWith(fontSize: 16),
                  ),
                ],
              ),
            ],
          ),
          Icon(
            Icons.lock,
            size: 20,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}