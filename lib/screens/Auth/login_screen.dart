import 'dart:async';

import 'package:bumn_muda/data/user.dart';
import 'package:bumn_muda/screens/Auth/login2_screen.dart';
import 'package:bumn_muda/screens/Home/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final List<String> imagePaths = [
    "images/loginslideone.png",
    "images/loginslidetwo.png",
    "images/loginslidethree.png"
  ];

  late List<Widget> _pages;
  int _activePage = 0;
  late PageController _pageController;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    _pages = imagePaths.map((path) => Image.asset(path)).toList();
    startTimer();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  void GoogleSignIn() async {
    UserData user_data = UserData(id: 12,
      socialId: null,
      name: "Budi Kopling",
      email: "budikopling@gmail.com",
      image: "uploads/foto_profile/UstIcvCrgRh2SWksw8StKpuApk0xvxw89L8Nj9gd.jpg",
      phone: "0882",
      emailVerifiedAt: null,
      createdAt: DateTime(2024, 6, 1, 18, 53, 17),
      updatedAt: DateTime(2024, 6, 1, 18, 53, 17),
      role: "user",);

    User? user = await AuthService().LoginGoogle(context: context);
    if (user != null) {
      print('User berhasil login: ${user.displayName}');
      Navigator.pop(context);
      Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(user: user_data,)));
    } else {
      print('Gagal login dengan Google');
    }
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      if (_pageController.page == imagePaths.length - 1) {
        _pageController.animateTo(0,
            duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
      } else {
        _pageController.nextPage(
            duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(color: Color(0xff2E3D64)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 50.0, left: 30.0),
                      child: Text(
                        ('BumnMuda.'),
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 80.0, left: 50.0, right: 50.0),
                      child: Stack(
                        children: [
                          SizedBox(
                              height: 250,
                              width: double.infinity,
                              child: PageView.builder(
                                  controller: _pageController,
                                  itemCount: imagePaths.length,
                                  onPageChanged: (value) {
                                    setState(() {
                                      _activePage = value;
                                    });
                                  },
                                  itemBuilder: (context, index) {
                                    return _pages[index];
                                  })),
                          Padding(
                            padding: const EdgeInsets.only(top: 270.0),
                            child: Container(
                              color: Colors.transparent,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List<Widget>.generate(
                                    _pages.length,
                                    (index) => Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5),
                                          child: InkWell(
                                            onTap: () {
                                              _pageController.animateToPage(index,
                                                  duration:
                                                      Duration(milliseconds: 300),
                                                  curve: Curves.easeIn);
                                            },
                                            child: CircleAvatar(
                                              radius: 4,
                                              backgroundColor:
                                                  _activePage == index
                                                      ? Colors.white
                                                      : Colors.grey,
                                            ),
                                          ),
                                        )),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 30.0, top: 30.0),
                      child: Text(
                        ('BUMN Muda'),
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          fontSize: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 30.0, top: 10.0, right: 30),
                      child: Text(
                        ('BumnMuda menyediakan layanan bimble yang dimana bisa kalian gunakan untuk persiapan test seperti BUMN, CPNS, ataupun Polri'),
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40.0),
                      child: Container(
                          height: 50,
                          margin: EdgeInsets.symmetric(horizontal: 40),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.white
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: (){
                                GoogleSignIn();
                              },
                              borderRadius: BorderRadius.circular(5),
                              // onTap: dapatData, // Panggil method dapatData di sini
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10.0),
                                    child: Image.asset(
                                      'images/logogoogle.png',
                                      height: 20,
                                      width: 20,
                                    ),
                                  ),
                                  const Text(
                                  "Login dengan Google",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600
                                  ),
                                ),
                                ]

                              ),
                            ),
                          ),
                        ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Container(
                          height: 50,
                          margin: EdgeInsets.symmetric(horizontal: 40),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.transparent,
                            border: Border.all(color: Colors.white)
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(5),
                              onTap: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const Login2Screen()),
                                );
                              }, // Panggil method dapatData di sini
                              child: const Center(
                                  child: Text(
                                  "Login dengan Email",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ImagePlaceHolder extends StatelessWidget {
  final String? imagePath;
  const ImagePlaceHolder({super.key, this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagePath!,
      fit: BoxFit.cover,
    );
  }
}
