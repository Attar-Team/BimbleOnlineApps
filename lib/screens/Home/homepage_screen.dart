import 'package:bumn_muda/screens/Course/course_screen.dart';
import 'package:bumn_muda/screens/Home/paket_screen.dart';
import 'package:bumn_muda/screens/Paket/detail_paket.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:bumn_muda/card/product_card.dart';
import 'package:bumn_muda/card/product.dart';
import 'package:lottie/lottie.dart';

import '../../data/paket.dart';

class HomePageScreen extends StatefulWidget {

  final List<Package> packages;

  const HomePageScreen({Key? key, required this.packages}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}


class _HomePageScreenState extends State<HomePageScreen> {
  ScrollController _scrollController = ScrollController();
  int selectedIndex = 0;

  void handleContainerTap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    print("Home Page Packages : ${widget.packages.length}");
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  final myItems = [
    Image.asset('images/poster1.png'),
    Image.asset('images/poster2.png'),
    Image.asset('images/poster3.png'),
  ];

  int myCurrentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 330,
                  child: SingleChildScrollView(
                    physics: NeverScrollableScrollPhysics(),
                    child: Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 270,
                          decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.centerRight,
                                end: Alignment.centerLeft,
                                colors: [Color(0xff2E3D64), Color(0xff0093AC)],
                              ),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(100),
                                bottomRight: Radius.circular(100),
                              )),
                        ),
                        Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 30,),
                              Text(
                                'Hi, Rahmat',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 22,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Mulai belajar dan berlangganan untuk kesuksesanmu',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Row(children: [
                                  Icon(Icons.search),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                      child: TextField(
                                    style: TextStyle(
                                        fontFamily: 'Poppins', fontSize: 14),
                                    decoration: InputDecoration(
                                        hintText:
                                            'What skills are you looking to improve',
                                        contentPadding:
                                            EdgeInsets.only(bottom: 5, left: 10),
                                        hintStyle: TextStyle(
                                            fontFamily: 'Poppins', fontSize: 12),
                                        border: InputBorder.none),
                                  ))
                                ]),
                              ),
                              SizedBox(height: 20),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 3,
                                        blurRadius: 4,
                                        offset: Offset(0, 3),
                                      )
                                    ]),
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    children: [
                                      const Text(
                                        '100+ Kursus ditambahkan setiap harinya, Explore sekarang juga',
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 20),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: GestureDetector(
                                              onTap: (){
                                                setState(() {
                                                  _scrollController.animateTo(
                                                  _scrollController.position.maxScrollExtent,
                                                  duration: Duration(milliseconds: 500),
                                                  curve: Curves.easeInOut);
                                                });
                                              },
                                              child: InkWell(
                                                onTap: (){
                                                  Navigator.push(
                                                      context, MaterialPageRoute(
                                                      builder: (context) => CourseScreen())
                                                  );
                                                },
                                                child: Container(
                                                  padding: EdgeInsets.symmetric(vertical: 5),
                                                  decoration: BoxDecoration(
                                                    color: Color(0xff2E3D60),
                                                    borderRadius:
                                                    BorderRadius.circular(12),
                                                  ),
                                                  child: const Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                    children: [
                                                      Text(
                                                        'Beli Paket',
                                                        style: TextStyle(
                                                            fontFamily: 'Poppins',
                                                            color: Colors.white,
                                                            fontWeight: FontWeight.bold,
                                                            fontSize: 13
                                                        ),
                                                      ),
                                                      Icon(Icons.arrow_forward,
                                                          color: Colors.white),
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CarouselSlider(
                        options: CarouselOptions(
                            autoPlay: true,
                            height: 200,
                            autoPlayCurve: Curves.fastOutSlowIn,
                            autoPlayAnimationDuration:
                                const Duration(milliseconds: 800),
                            autoPlayInterval: const Duration(seconds: 2),
                            enlargeCenterPage: true,
                            aspectRatio: 2.0,
                            onPageChanged: (index, reason) {
                              setState(() {
                                myCurrentIndex = index;
                              });
                            }),
                        items: myItems,
                      ),
                      AnimatedSmoothIndicator(
                        activeIndex: myCurrentIndex,
                        count: myItems.length,
                        effect: WormEffect(
                            dotHeight: 8,
                            dotWidth: 8,
                            spacing: 10,
                            dotColor: Colors.grey.shade400,
                            activeDotColor: Colors.grey.shade900,
                            paintStyle: PaintingStyle.fill),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.25,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            color: Color(0xff2E3D64),
                            borderRadius: BorderRadius.circular(20.0)),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.assessment,
                              color: Colors.white,
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Text(
                              'Simulasi Ujian',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: Colors.white),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.25,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            color: Color(0xff2E3D64),
                            borderRadius: BorderRadius.circular(20.0)),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.assignment,
                              color: Colors.white,
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Text(
                              'Latihan Soal',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: Colors.white),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.25,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            color: Color(0xff2E3D64),
                            borderRadius: BorderRadius.circular(20.0)),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.book,
                              color: Colors.white,
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Text(
                              'Materi Soal',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Popular Courses',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(
                            context, MaterialPageRoute(
                              builder: (context) => CourseScreen()));
                        },
                        child: Text(
                          'See All >',
                          style: TextStyle(
                            color: Color(0xff0093AC),
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildContainer('All', 0),
                      buildContainer('BUMN', 1),
                      buildContainer('CPNS', 2),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    child: Row(
                      children: widget.packages.map((package) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailPaket(
                                  productName: package.name,
                                  productType: package.type, 
                                  productDesc: package.description, 
                                  listExam: package.exam,
                                  price: int.parse(package.price),
                                  discount: int.parse(package.discount),
                                  imageURL: package.photo
                                ),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0), // Padding antara setiap card
                            child: ProductCard(
                              imageURL: package.photo,
                              name: package.name,
                              description: package.description,
                              price: int.parse(package.price),
                              discount: int.parse(package.discount),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildContainer(String label, int index) {
    bool isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () => handleContainerTap(index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xff0093AC) : Colors.white,
          borderRadius: BorderRadius.circular(13),
          border: Border.all(
            color: Color(0xff0093AC),
            width: 2,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            fontSize: 13,
            color: isSelected ? Colors.white : Color(0xff0093AC),
          ),
        ),
      ),
    );
  }
}
