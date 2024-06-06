import 'package:bumn_muda/screens/Paket/about_screen.dart';
import 'package:bumn_muda/screens/Paket/lessons.screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../data/ujian.dart';

class DetailPaket extends StatefulWidget {
  final String productName;
  final String productType;
  final String productDesc;
  final List<Exam> listExam;
  final int price;
  final int discount;
  final String imageURL;
  const DetailPaket({Key? key, required this.productName, required this.productType, required this.productDesc, required this.listExam, required this.price, required this.discount, required this.imageURL}) : super(key: key);

  @override
  State<DetailPaket> createState() => _DetailPaketState();
}

class _DetailPaketState extends State<DetailPaket> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 240,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                    ),
                    child: Image.network(
                      "https://bimbel.adzazarif.my.id/storage/${widget.imageURL}",
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey,
                          child: Center(
                            child: Text(error.toString()),
                          ),
                        );
                      },
                    ),
                  ),
                )
                ,
                Positioned(
                  top: 40,
                  left: 10,
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 1,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.productName,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xffD2E5FF),
                    ),
                    child: Text(
                      widget.productType,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: Color(0xff2E3D64),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildInfoItem(icon: Icons.people, text: '142 Students'),
                      _buildInfoItem(icon: Icons.access_time, text: '6 Hours'),
                      _buildInfoItem(icon: Icons.assignment, text: 'Certificate'),
                    ],
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    height: 1,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                    ),
                  ),
                  DefaultTabController(
                    length: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TabBar(
                          unselectedLabelColor: Colors.grey,
                          labelColor: Color(0xff2E3D64),
                          indicatorColor: Color(0xff2E3D64),
                          tabs: [
                            Tab(
                              child: Text(
                                'About',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Tab(
                              child: Text(
                                'Lessons',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Container(
                          height: 380, // or adjust according to your content
                          child: TabBarView(
                            children: [
                              AboutScreen(
                                productDescription: widget.productDesc,
                                listExam: widget.listExam,
                                price: widget.price,
                                discount: widget.discount,
                              ),
                              LessonsScreen(listExam: widget.listExam,),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoItem({required IconData icon, required String text}) {
    return Row(
      children: [
        Icon(
          icon,
          size: 20,
          color: Color(0xff2E3D64),
        ),
        SizedBox(width: 5),
        Text(
          text,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
            fontSize: 12,
            color: Color(0xff2E3D64),
          ),
        ),
      ],
    );
  }
}