import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController emailController = TextEditingController();

  Future<void> ForgotPassword() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: emailController.text.trim(),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Reset Password Email Has Been Sent'),
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else {
        print('Error: ${e.code}');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        // Tambahkan tombol back di sini
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // Gunakan ikon panah ke kiri di sini
          onPressed: () {
            Navigator.pop(
                context); // Menggunakan Navigator.pop untuk kembali ke halaman sebelumnya
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(color: Colors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 0),
              const Center(
                child: Image(
                  image: AssetImage('images/logoapps.png'),
                  width: 200,
                  height: 50,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 30.0, top: 50.0),
                child: Text(
                  ('Forgot Password'),
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 30.0),
                child: Text(
                  ('Recovery your account'),
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
              ),
              SizedBox(height: 50),
              buildEmail(),
              SizedBox(height: 50),
              buildLoginBtn(),
            ],
          ),
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
                fontSize: 14),
          ),
          const SizedBox(height: 10),
          Container(
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            height: 46,
            child: TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              style: const TextStyle(
                color: Colors.black87,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 10),
                  prefixIcon: Icon(
                    Icons.email,
                    color: Color(0xff2E3D64),
                  ),
                  hintText: 'Email',
                  hintStyle: TextStyle(color: Colors.black38)
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildLoginBtn() {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 30),
        padding: const EdgeInsets.only(top: 0, bottom: 0),
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            ForgotPassword();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xff2E3D64), // Warna latar belakang tombol
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15), // Bentuk tombol
            ),
          ),
          child: const Text(
            'Submit',
            style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500
            ),
          ),
        ));
  }
}
