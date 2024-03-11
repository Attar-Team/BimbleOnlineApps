import 'package:bumn_muda/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.delayed(Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (_) => const LoginScreen(),
      ));
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

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
