import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TentangScreen extends StatefulWidget {
  const TentangScreen({super.key});

  @override
  State<TentangScreen> createState() => _TentangScreenState();
}

class _TentangScreenState extends State<TentangScreen> {
  final TextStyle textKecil = const TextStyle(
    fontFamily: 'Urbanist',
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );
  Widget buildBulletPoint(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 6),
          height: 6,
          width: 6,
          decoration: const BoxDecoration(
            color: Colors.black,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: textKecil,
            textAlign: TextAlign.justify,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: RichText(
          text: const TextSpan(
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Color(0xff2E3D64),
            ),
            children: [
              TextSpan(
                text: 'Tentang ',
                style: TextStyle(
                  // Gaya teks untuk "Video"
                  fontWeight: FontWeight.w500,
                  // Atur gaya teks sesuai keinginan Anda
                ),
              ),
              TextSpan(
                text: 'Kami',
                // Gaya teks untuk "Pembelajaran"
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Tentang BUMNMUDA',
                style: TextStyle(
                    fontFamily: 'Urbanist',
                    fontSize: 19,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
              Text(
                'BUMNMUDA adalah aplikasi bimbingan belajar yang berfokus pada persiapan tes masuk BUMN. Kami terdiri dari tim ahli yang berpengalaman dalam bidang pendidikan dan teknologi, yang berkomitmen untuk memberikan pengalaman belajar terbaik bagi para pengguna kami. Dengan menggunakan pendekatan inovatif dan konten yang komprehensif, kami bertujuan untuk membantu setiap peserta mencapai impian mereka untuk bekerja di BUMN.',
                style: textKecil,
                textAlign: TextAlign.justify,
              ),
              const Text(
                'Visi Kami',
                style: TextStyle(
                    fontFamily: 'Urbanist',
                    fontSize: 19,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
              Text(
                'Menjadi platform pembelajaran terdepan yang membantu para calon profesional mempersiapkan diri untuk bergabung dengan Badan Usaha Milik Negara (BUMN) di Indonesia.',
                style: textKecil,
                textAlign: TextAlign.justify,
              ),
              const Text(
                'Misi Kami',
                style: TextStyle(
                    fontFamily: 'Urbanist',
                    fontSize: 19,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildBulletPoint(
                        'Menyediakan materi pembelajaran berkualitas tinggi yang dirancang khusus untuk mempersiapkan peserta menghadapi tes masuk BUMN.'),
                    SizedBox(
                      height: 5,
                    ),
                    buildBulletPoint(
                        'Membantu pengguna memahami dan menguasai berbagai konsep penting melalui metode pembelajaran yang interaktif dan mudah diakses.'),
                    SizedBox(
                      height: 5,
                    ),
                    buildBulletPoint(
                        'Mendukung pengembangan pribadi dan profesional para peserta dengan menyediakan alat dan sumber daya yang relevan dan terkini.'),
                  ],
                ),
              ),
              const Text(
                'Apa Yang Kami Tawarkan',
                style: TextStyle(
                    fontFamily: 'Urbanist',
                    fontSize: 19,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildBulletPoint(
                        'Materi Pembelajaran Lengkap: Kami menyediakan berbagai materi pembelajaran yang mencakup semua aspek penting dari tes masuk BUMN, termasuk soal latihan, simulasi ujian, dan penjelasan mendetail.'),
                    SizedBox(
                      height: 5,
                    ),
                    buildBulletPoint(
                        'Platform Interaktif: Dengan antarmuka yang user-friendly, aplikasi kami dirancang untuk memberikan pengalaman belajar yang menyenangkan dan efektif.'),
                    SizedBox(
                      height: 5,
                    ),
                    buildBulletPoint(
                        'Akses Fleksibel: Belajar kapan saja dan di mana saja dengan aplikasi mobile kami, yang memungkinkan Anda untuk mengakses materi belajar tanpa batasan waktu dan tempat.'),
                    SizedBox(
                      height: 5,
                    ),
                    buildBulletPoint(
                        'Dukungan Pengguna: Tim dukungan kami siap membantu Anda dengan pertanyaan dan masalah yang mungkin Anda hadapi selama penggunaan aplikasi.'),
                  ],
                ),
              ),
              SizedBox(height: 30,)
            ],
          ),
        ),
      ),
    );
  }
}
