import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bumn_muda/screens/Auth/login2_screen.dart';
import '../../data/response/register_response.dart';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:http_parser/http_parser.dart';

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
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  final databaseReference = FirebaseDatabase.instance.reference();
  File? _image;

  Future<void> addDatatoDatabase() async {
    String? uid = FirebaseAuth.instance.currentUser?.uid;

    if (nameController.text.isNotEmpty && emailController.text.isNotEmpty && uid != null) {
      DatabaseReference usersRef = databaseReference.child("users/$uid");

      Map<String, dynamic> userData = {
        "id": uid,
        "name": nameController.text,
        "email": emailController.text
      };

      await usersRef.set(userData);
      print("Data added successfully");
    } else {
      throw Exception('Failed to add data to database');
    }
  }

  Future<void> registerUser({
    required String name,
    required String email,
    required String noTelp,
    required File? image,
    required String role,
    required String password,
  }) async {
    final uri = Uri.parse('http://bimbel.adzazarif.my.id/api/register'); // Ganti dengan URL API Anda
    final request = http.MultipartRequest('POST', uri);

    // Tambahkan field
    request.fields['name'] = name;
    request.fields['email'] = email;
    request.fields['no_telp'] = noTelp;
    request.fields['role'] = role;
    request.fields['password'] = password;

    // Tambahkan file jika ada
    if (image != null) {
      request.files.add(
        await http.MultipartFile.fromPath(
          'image',
          image.path,
          contentType: MediaType('image', 'jpeg'), // Sesuaikan dengan tipe file Anda
        ),
      );
    }

    // Kirim request
    final response = await request.send();

    if (response.statusCode == 200) {
      final responseBody = await response.stream.bytesToString();
      print('Success: $responseBody');
    } else {
      final responseBody = await response.stream.bytesToString();
      print('Error: ${response.statusCode} - $responseBody');
      throw Exception('Failed to register user');
    }
  }

  void SignUp() {
    // Menampilkan dialog loading
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    // Memastikan password dan konfirmasi password sesuai
    if (passwordController.text == confirmPasswordController.text) {
      // Memanggil fungsi registerUser untuk mendaftarkan pengguna
      registerUser(
        name: nameController.text,
        email: emailController.text,
        noTelp: phoneController.text,
        image: _image,
        role: "user",
        password: passwordController.text,
      ).then((value) async {
        print("User created");

        try {
          // Menghapus dialog loading
          Navigator.pop(context);

          // Menampilkan dialog sukses registrasi
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Register Successful'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Login2Screen(),
                        ),
                      );
                    },
                    child: const Text('OK'),
                  ),
                ],
              );
            },
          );
        } catch (e) {
          // Menangani kesalahan dan menampilkan pesan error
          print("Error: $e");
          Navigator.pop(context);
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Register Failed'),
                content: Text(e.toString()),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('OK'),
                  ),
                ],
              );
            },
          );
        }
      }).catchError((error) {
        // Menangani kesalahan saat pendaftaran pengguna
        print("Error ${error.toString()}");
        Navigator.pop(context);
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Register Failed'),
              content: Text(error.toString()),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      });
    } else {
      // Menangani kesalahan jika password tidak sesuai
      Navigator.pop(context);
      print("Password doesn't match");
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Register Failed'),
            content: const Text("Password doesn't match"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }



  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    } else {
      print('No image selected.');
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
              const Padding(
                padding: EdgeInsets.only(left: 30.0, top:0.0),
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
              SizedBox(height: 30),
              Center(
                child:
                GestureDetector(
                  onTap: () => _pickImage(),
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: _image == null ? Center(child: Icon(Icons.add_a_photo))  : ClipOval(
                      child: Image.file(
                        _image!,
                        fit: BoxFit.cover,
                        width: 100,
                        height: 100,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 50),
              buildName(),
              SizedBox(height: 10,),
              buildEmail(),
              SizedBox(height: 10),
              buildPhone(),
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
              ),
              SizedBox(height: 30)
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPhone() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            'Phone Number',
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
              controller: phoneController ,
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
                    Icons.phone,
                    color: Color(0xff2E3D64),
                  ),
                  hintText: 'Phone Number',
                  hintStyle: TextStyle(color: Colors.black38)
              ),
            ),
          )
        ],
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
