import 'package:bumn_muda/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:bumn_muda/screens/login_screen.dart';

class Login2Screen extends StatefulWidget {
  const Login2Screen({super.key});

  @override
  State<Login2Screen> createState() => _Login2ScreenState();
}

class _Login2ScreenState extends State<Login2Screen> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Tambahkan tombol back di sini
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // Gunakan ikon panah ke kiri di sini
          onPressed: () {
            Navigator.pop(
                context); // Menggunakan Navigator.pop untuk kembali ke halaman sebelumnya
          },
        ),
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 25),
            const Center(
              child: Image(
                image: AssetImage('images/logoapps.png'),
                width: 300,
                height: 150,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 30.0, top: 50.0),
              child: Text(
                ('Log In'),
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.black),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 30.0),
              child: Text(
                ('Lets get to work'),
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
            ),
            SizedBox(height: 50),
            buildEmail(),
            SizedBox(height: 10),
            buildPassword(),
            SizedBox(height: 10),
            buildForgotPassBtn(),
            SizedBox(height: 10),
            buildLoginBtn(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have account?",
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: Colors.grey),
                ),
                SizedBox(width: 10),
                buildSignUpBtn()
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildEmail() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            'Email',
            style: TextStyle(
                color: Colors.black,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                fontSize: 16),
          ),
          const SizedBox(height: 10),
          Container(
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
              // boxShadow: [
              //   BoxShadow(
              //     color: Colors.black26,
              //     blurRadius: 6,
              //     offset: Offset(0, 2),
              //   )
              // ]
            ),
            height: 60,
            child: const TextField(
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(
                  color: Colors.black87,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 10),
                  prefixIcon: Icon(
                    Icons.email,
                    color: Color(0xff2E3D64),
                  ),
                  hintText: 'Email',
                  hintStyle: TextStyle(color: Colors.black38)),
            ),
          )
        ],
      ),
    );
  }

  Widget buildPassword() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            'Password',
            style: TextStyle(
                color: Colors.black,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                fontSize: 16),
          ),
          const SizedBox(height: 10),
          Container(
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
              // boxShadow: [
              //   BoxShadow(
              //     color: Colors.black26,
              //     blurRadius: 6,
              //     offset: Offset(0, 2),
              //   )
              // ]
            ),
            height: 60,
            child: TextField(
              obscureText: _obscureText,
              style: const TextStyle(
                  color: Colors.black87,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.only(top: 10),
                  prefixIcon: const Icon(
                    Icons.lock,
                    color: Color(0xff2E3D64),
                  ),
                  hintText: 'Password',
                  hintStyle: const TextStyle(color: Colors.black38),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                    child: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                      color: Color(0xff2E3D64),
                    ),
                  )),
            ),
          )
        ],
      ),
    );
  }

  Widget buildForgotPassBtn() {
    return Container(
      alignment: Alignment.centerRight,
      margin: const EdgeInsets.only(right: 30.0),
      child: TextButton(
        onPressed: () {
          //Ke Halaman Lupa
        },
        child: const Text(
          'Forgot Password ?',
          style: TextStyle(
              color: Color(0xff2E3D64),
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              fontSize: 14),
        ),
      ),
    );
  }

  Widget buildLoginBtn() {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 30),
        padding: EdgeInsets.symmetric(vertical: 25),
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            // Logika yang akan dijalankan saat tombol ditekan
            print('Button Pressed!');
          },
          child: Text(
            'Login',
            style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500),
          ),
          style: ElevatedButton.styleFrom(
            primary: Color(0xff2E3D64), // Warna latar belakang tombol
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15), // Bentuk tombol
            ),
          ),
        ));
  }

  Widget buildSignUpBtn() {
    return Container(
      child: TextButton( 
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SignUpScreen()),
          );
        },
        child: const Text(
          'Sign Up',
          style: TextStyle(
              color: Color(0xff2E3D64),
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              fontSize: 15),
        ),
      ),
    );
  }
}
