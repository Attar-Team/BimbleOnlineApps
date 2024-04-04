import 'package:flutter/material.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Mentor',
                style: TextStyle(
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black),
              ),
              SizedBox(height: 5,),
              const Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(
                        'images/asyam.jpg'), 
                  ),
                  SizedBox(width: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Admin',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                        ),
                      ),
                      Text(
                        'Pelatih BUMN, CPNS',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey
                        ),
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(height: 15,),
              const Text(
                'About Courses',
                style: TextStyle(
                  fontFamily: 'Urbanist',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black
                ),
              ),
              Text(
                'Cupidatat tempor ex magna laborum duis dolor aliquip incididunt sit voluptate minim sunt laborum magna. Exercitation pariatur quis id cillum duis officia ullamco et magna proident ut deserunt ipsum. Laborum elit commodo duis Lorem voluptate laboris deserunt nisi elit commodo. Id amet Lorem excepteur dolore laboris Lorem amet. Tempor duis mollit qui voluptate dolor ex anim cupidatat et. Et labore enim exercitation ipsum reprehenderit fugiat. Reprehenderit tempor officia sunt consequat.',
                style: TextStyle(
                  fontFamily: 'Urbanist',
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.black
                ),
              ),
              const SizedBox(height: 10,),
              const Text(
                'Jenis Tes',
                style: TextStyle(
                  fontFamily: 'Urbanist',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black
                ),
              ),
              Text(
                '1. Tes Kewawasan Bangsa (TWK) \n2. Tes Intelegensi Umum (TIU) \n3. Tes Karakteristik Pribadi (TKP)',
                style: TextStyle(
                  fontFamily: 'Urbanist',
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.black
                ),
              ),
              SizedBox(height: 20,),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                  color: Color(0xff2E3D64),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Center(
                  child: Text(
                    'Daftar Kursus - Rp500.000',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.white
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
