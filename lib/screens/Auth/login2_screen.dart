import 'package:bumn_muda/screens/Auth/forgot_password_screen.dart';
import 'package:bumn_muda/screens/Home/home_screen.dart';
import 'package:bumn_muda/screens/Auth/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


class Login2Screen extends StatefulWidget {
  const Login2Screen({super.key});

  @override
  State<Login2Screen> createState() => _Login2ScreenState();
}

class _Login2ScreenState extends State<Login2Screen> {
  bool _obscureText = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void logData(String tag, data){
    print("$tag : $data");
  }

  void SignIn() async{

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Lottie.asset(
              'assets/animations/loading_anim.json',
              width: 200,
              height: 200
            ),
          ),
        );
      },
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim()
      );
      Navigator.pop(context);
      Navigator.pop(context);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen(token: "",)));
    } on FirebaseAuthException catch(e) {
      if (e.code == 'user-not-found') {
        Navigator.pop(context);
        invalidLogin();
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        Navigator.pop(context);
        invalidLogin();
        print('Wrong password provided for that user.');
      } else {
        Navigator.pop(context);
        invalidLogin();
        print('Error: ${e.code}');
      }
    } catch (e) {
      Navigator.pop(context);
      invalidLogin();
      print('Unexpected error occurred: $e');
    }
  }

  @override
  void dispose(){
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void invalidLogin() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Invalid Login'),
            content: const Text('Please check your email and password'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('OK')
              )
            ],
          );
        }
    );
  }

  void ForgotPassword() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ForgotPasswordScreen()),
    );
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
                  ('Log In'),
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
                        fontSize: 14,
                        color: Colors.grey),
                  ),
                  SizedBox(width: 10),
                  buildSignUpBtn()
                ],
              )
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
                fontFamily: 'Urbanist',
                fontWeight: FontWeight.w500,
                fontSize: 14,
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
              controller: passwordController,
              obscureText: _obscureText,
              style:  const TextStyle(
                  color: Colors.black87,
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.w500,
                  fontSize: 14),
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
                      color: const Color(0xff2E3D64),
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
          ForgotPassword();
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
        margin: const EdgeInsets.symmetric(horizontal: 30),
        padding: const EdgeInsets.only(top: 0, bottom: 0),
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            // Logika yang akan dijalankan saat tombol ditekan
            print('Button Pressed!');
            String email = emailController.text;
            String password = passwordController.text;
            logData("Login Data", "$email, $password");
            SignIn();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xff2E3D64), // Warna latar belakang tombol
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15), // Bentuk tombol
            ),
          ),
          child: const Text(
            'Login',
            style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500
            ),
          ),
        ));
  }


  Widget buildSignUpBtn() {
    return Container(
      child: TextButton(
        onPressed: () {
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SignUpScreen()),
          );
        },
        child: const Text(
          'Sign Up',
          style: TextStyle(
              color: Color(0xff2E3D64),
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              fontSize: 12),
        ),
      ),
    );
  }
}
