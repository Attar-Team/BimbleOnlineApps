import 'package:flutter/material.dart';

class PrivasiScreen extends StatefulWidget {
  const PrivasiScreen({super.key});

  @override
  State<PrivasiScreen> createState() => _PrivasiScreenState();
}

class _PrivasiScreenState extends State<PrivasiScreen> {

  final TextStyle textKecil = const TextStyle(
    fontFamily: 'Urbanist',
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  ); 
  final TextStyle textHeader2 = const TextStyle(
    fontFamily: 'Urbanist',
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.black
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
                text: 'Kebijakan ',
                style: TextStyle(
                  // Gaya teks untuk "Video"
                  fontWeight: FontWeight.w500,
                  // Atur gaya teks sesuai keinginan Anda
                ),
              ),
              TextSpan(
                text: 'Privasi',
                // Gaya teks untuk "Pembelajaran"
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10,),
              const Text(
                'Kebijakan Privasi BUMNMUDA',
                style: TextStyle(
                  fontFamily: 'Urbanist',
                  fontSize: 19,
                  fontWeight: FontWeight.w600,
                  color: Colors.black
                ),
              ),
              Text(
                'Kami di BUMNMUDA menghargai privasi Anda dan berkomitmen untuk melindungi informasi pribadi Anda. Kebijakan Privasi ini menjelaskan bagaimana kami mengumpulkan, menggunakan, dan mengamankan informasi Anda saat Anda menggunakan aplikasi mobile BUMNMUDA.',
                style: textKecil,
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 5,),
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '1. Informasi yang Kami Kumpulkan',
                      style: textHeader2,
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      'Kami mengumpulkan beberapa jenis informasi untuk memberikan dan meningkatkan layanan kami kepada Anda:',
                      style: textKecil,
                      textAlign: TextAlign.justify,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildBulletPoint('Informasi Pribadi: Saat mendaftar, kami mungkin meminta Anda untuk memberikan informasi pribadi seperti nama, alamat email, nomor telepon, dan informasi identifikasi lainnya.'),
                          SizedBox(height: 5,),
                          buildBulletPoint('Informasi Penggunaan: Kami mengumpulkan informasi tentang bagaimana Anda menggunakan aplikasi kami, termasuk halaman yang Anda kunjungi, fitur yang Anda gunakan, dan waktu serta durasi aktivitas Anda.'),
                          SizedBox(height: 5,),
                          buildBulletPoint('Informasi Perangkat: Kami mengumpulkan informasi tentang perangkat yang Anda gunakan untuk mengakses aplikasi kami, termasuk model perangkat, sistem operasi, pengenal perangkat unik, dan alamat IP.'),
                        ],
                      ),
                    ),
                    SizedBox(height: 5,),
                    Text(
                      '2. Penggunaan Informasi',
                      style: textHeader2,
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      'Kami menggunakan informasi yang kami kumpulkan untuk:',
                      style: textKecil,
                      textAlign: TextAlign.justify,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildBulletPoint('Memberikan, mengoperasikan, dan memelihara aplikasi dan layanan kami.'),
                          SizedBox(height: 5,),
                          buildBulletPoint('Memproses transaksi dan mengelola akun Anda.'),
                          SizedBox(height: 5,),
                          buildBulletPoint('Meningkatkan pengalaman pengguna dengan menganalisis bagaimana Anda menggunakan aplikasi kami.'),
                          SizedBox(height: 5,),
                          buildBulletPoint('Berkomunikasi dengan Anda, termasuk mengirimkan pemberitahuan, pembaruan, dan informasi terkait layanan.'),
                          SizedBox(height: 5,),
                          buildBulletPoint('Menjaga keamanan dan integritas aplikasi kami.')
                        ],
                      ),
                    ),
                    SizedBox(height: 5,),
                    Text(
                      '3. Berbagi Informasi Anda',
                      style: textHeader2,
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      'Kami tidak akan membagikan informasi pribadi Anda dengan pihak ketiga kecuali dalam keadaan berikut:',
                      style: textKecil,
                      textAlign: TextAlign.justify,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildBulletPoint('Dengan persetujuan Anda.'),
                          SizedBox(height: 5,),
                          buildBulletPoint('Untuk mematuhi hukum, peraturan, atau permintaan pemerintah yang berlaku.'),
                          SizedBox(height: 5,),
                          buildBulletPoint('Dengan penyedia layanan yang bekerja atas nama kami untuk tujuan bisnis internal kami.'),
                          SizedBox(height: 5,),
                          buildBulletPoint('Untuk melindungi hak, privasi, keamanan, atau properti BUMNMUDA, pengguna kami, atau publik.'),
                        ],
                      ),
                    ),
                    SizedBox(height: 5,),
                    Text(
                      '4. Keamanan Informasi',
                      style: textHeader2,
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      'Kami mengambil langkah-langkah yang wajar untuk melindungi informasi pribadi Anda dari akses yang tidak sah, penggunaan, atau pengungkapan. Namun, tidak ada metode transmisi data melalui internet atau metode penyimpanan elektronik yang 100% aman. Oleh karena itu, kami tidak dapat menjamin keamanan absolut dari informasi Anda.',
                      style: textKecil,
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      '5. Hak Anda',
                      style: textHeader2,
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      'Anda memiliki hak untuk mengakses, memperbaiki, atau menghapus informasi pribadi Anda yang kami miliki. Anda juga dapat menolak pemrosesan data pribadi Anda dalam kondisi tertentu. Untuk menggunakan hak-hak ini, silakan hubungi kami melalui informasi kontak yang disediakan di bawah.',
                      style: textKecil,
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      '6. Perubahan Kebijakan Privasi',
                      style: textHeader2,
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      'Kami dapat memperbarui Kebijakan Privasi ini dari waktu ke waktu. Kami akan memberi tahu Anda tentang perubahan dengan memposting Kebijakan Privasi yang baru di aplikasi ini. Anda disarankan untuk meninjau Kebijakan Privasi ini secara berkala untuk mengetahui perubahan apa pun.',
                      style: textKecil,
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      '7. Hubungi Kami',
                      style: textHeader2,
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      'Jika Anda memiliki pertanyaan atau kekhawatiran tentang Kebijakan Privasi ini atau praktik privasi kami, silakan hubungi kami di:',
                      style: textKecil,
                      textAlign: TextAlign.justify,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildBulletPoint('Email: riskyasyam@gmail.com'),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}