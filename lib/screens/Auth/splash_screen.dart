import 'package:bumn_muda/data/response/login_response.dart';
import 'package:bumn_muda/screens/Auth/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import '../../data/user.dart';
import '../Home/home_screen.dart';
import 'dart:convert';
import '../../services/user_shared_prev.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {

  bool isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    _initialize();
  }

  void _initialize() async {
    bool isLoggedIn = await UserPreferences.getLoginStatus();
    UserData? userdata = await UserPreferences.getUser();
    print("Login Status : $isLoggedIn");
    print("User Data : ${userdata?.toJson()}");
    if (isLoggedIn && userdata != null) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (_) => HomeScreen(user: userdata,),
      ));
    } else {
      // Navigate to LoginScreen if not logged in
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (_) => const LoginScreen(),
      ));
    }
  }

  Future<void> _loginAndNavigate() async {
    UserData user_data = UserData(
      id: 12,
      socialId: null,
      name: "Budi Kopling",
      email: "budikopling@gmail.com",
      image: "uploads/foto_profile/UstIcvCrgRh2SWksw8StKpuApk0xvxw89L8Nj9gd.jpg",
      phone: "0882",
      emailVerifiedAt: null,
      createdAt: DateTime(2024, 6, 1, 18, 53, 17),
      updatedAt: DateTime(2024, 6, 1, 18, 53, 17),
      role: "user",
    );

    try {
      LoginResponse login_response = await postFormData("admin@gmail.com", "12345");

      // Simulate a delay for the splash screen
      await Future.delayed(Duration(seconds: 2));

      FirebaseAuth.instance.authStateChanges().listen((User? user) async {
        if (user != null) {
          await UserPreferences.saveLoginStatus(true);
          // Jika pengguna telah login, arahkan ke layar beranda atau layar utama
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (_) => HomeScreen(user: user_data),
          ));
        } else {
          // Jika pengguna belum login, arahkan ke layar login
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (_) => const LoginScreen(),
          ));
        }
      });
    } catch (e) {
      print('Login failed: $e');
      // Navigate to LoginScreen if login fails
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (_) => const LoginScreen(),
      ));
    }
  }

  Future<LoginResponse> postFormData(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('http://bimbel.adzazarif.my.id/api/login'),
        headers: <String, String>{
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        print('Form data sent successfully');
        return LoginResponse.fromJson(json.decode(response.body));
      } else {
        print('Failed to send form data: ${response.statusCode} ${response.reasonPhrase}');
        print('Response body: ${response.body}');
        throw Exception('Failed to send form data: ${response.statusCode} ${response.reasonPhrase}');
      }
    } catch (e) {
      print('An error occurred: $e');
      throw Exception('Failed to send form data: $e');
    }
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      width: 300,
                      height: 150,
                      image: AssetImage('images/logoapps.png'),
                    ),
                    SizedBox(height: 10),
                    Text('Siap Kerja, Siap Berkarya untuk Bangsa',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ))
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10.0),
              child: Image(
                  width: 200,
                  height: 100,
                  image: AssetImage('images/logobumn.png')),
            ),
          ],
        ),
      ),
    );
  }
}
