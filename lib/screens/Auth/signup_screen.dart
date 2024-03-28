import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:bumn_muda/screens/Auth/login2_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _obscureText = true;
  bool _obscureText2 = true;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  final databaseReference = FirebaseDatabase.instance.reference();

  Future<void> addDatatoDatabase() async {
    String? uid = FirebaseAuth.instance.currentUser?.uid;

    if (nameController.text.isNotEmpty && emailController.text.isNotEmpty && uid != null) {
      DatabaseReference usersRef = databaseReference.child("users/$uid");

      Map<String, dynamic> userData = {
        "id": uid,
        "name": nameController.text,
        "email": emailController.text
      };

      await usersRef.set(
          userData
      ).then((value) => print("Data added successfully"));
    }}

  void SignUp(){

    showDialog(
        context: context,
        builder: (context){
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
    );

    if (passwordController.text == confirmPasswordController.text) {
      FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text
      ).then((value) {
        print("User created");
        addDatatoDatabase();
        Navigator.pop(context);

        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Register Successful'),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login2Screen()));
                      },
                      child: const Text('OK')
                  )
                ],
              );
            }
        );

      }).onError((error, stackTrace) {
        print("Error ${error.toString()}");
        Navigator.pop(context);
      });
    } else {
      Navigator.pop(context);
      print("Password doesn't match");
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
                  height:   50,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 30.0, top: 50.0),
                child: Text(
                  ('Sign Up'),
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
                  ('Register for to get work'),
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
              ),
              SizedBox(height: 50),
              buildName(),
              SizedBox(height: 10,),
              buildEmail(),
              SizedBox(height: 10),
              buildPassword(),
              SizedBox(height: 10),
              buildRePassword(),
              SizedBox(height: 30),
              buildRegisterBtn(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account?",
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

  Widget buildName() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            'Full Name',
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
              controller: nameController,
              keyboardType: TextInputType.name,
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
                    Icons.person,
                    color: Color(0xff2E3D64),
                  ),
                  hintText: 'Full Name',
                  hintStyle: TextStyle(color: Colors.black38)
              ),
            ),
          )
        ],
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
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: 12),
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

  Widget buildRePassword() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            'Re-Password',
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
              controller: confirmPasswordController,
              obscureText: _obscureText2,
              style:  const TextStyle(
                  color: Colors.black87,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: 12),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.only(top: 10),
                  prefixIcon: const Icon(
                    Icons.lock,
                    color: Color(0xff2E3D64),
                  ),
                  hintText: 'Re-Password',
                  hintStyle: const TextStyle(color: Colors.black38),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        _obscureText2 = !_obscureText2;
                      });
                    },
                    child: Icon(
                      _obscureText2 ? Icons.visibility_off : Icons.visibility,
                      color: const Color(0xff2E3D64),
                    ),
                  )),
            ),
          )
        ],
      ),
    );
  }

  Widget buildRegisterBtn() {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 30),
        padding: const EdgeInsets.only(top: 0, bottom: 0),
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            SignUp();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xff2E3D64), // Warna latar belakang tombol
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15), // Bentuk tombol
            ),
          ),
          child: const Text(
            'Register',
            style: TextStyle(
                color: Colors.white,
                fontSize: 15,
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
            MaterialPageRoute(builder: (context) => const Login2Screen()),
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
