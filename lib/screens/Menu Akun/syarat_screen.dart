import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SyaratScreen extends StatefulWidget {
  const SyaratScreen({super.key});

  @override
  State<SyaratScreen> createState() => _SyaratScreenState();
}

class _SyaratScreenState extends State<SyaratScreen> {
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
      color: Colors.black);
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
                text: 'Syarat dan ',
                style: TextStyle(
                  // Gaya teks untuk "Video"
                  fontWeight: FontWeight.w500,
                  // Atur gaya teks sesuai keinginan Anda
                ),
              ),
              TextSpan(
                text: 'Ketentuan',
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
                'Syarat & Ketentuan Layanan',
                style: TextStyle(
                    fontFamily: 'Urbanist',
                    fontSize: 19,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
              Text(
                'Selamat datang di aplikasi BUMNMUDA. Dengan mengunduh dan menggunakan aplikasi ini, Anda setuju untuk mematuhi dan terikat oleh syarat dan ketentuan berikut ("Syarat dan Ketentuan"). Mohon baca dengan seksama.',
                style: textKecil,
                textAlign: TextAlign.justify,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '1. Penerimaan Syarat',
                      style: textHeader2,
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      'Dengan mengakses dan menggunakan aplikasi BUMNMUDA, Anda menerima dan setuju untuk terikat oleh syarat dan ketentuan yang berlaku. Jika Anda tidak setuju dengan syarat dan ketentuan ini, mohon untuk tidak menggunakan aplikasi ini.',
                      style: textKecil,
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      '2. Perubahan Syarat dan Ketentuan',
                      style: textHeader2,
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      'Kami berhak untuk mengubah syarat dan ketentuan ini kapan saja tanpa pemberitahuan terlebih dahulu. Perubahan akan berlaku segera setelah diposting di aplikasi. Penggunaan Anda yang berkelanjutan terhadap aplikasi ini setelah perubahan diposting dianggap sebagai penerimaan Anda terhadap perubahan tersebut.',
                      style: textKecil,
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      '3. Penggunaan Aplikasi',
                      style: textHeader2,
                      textAlign: TextAlign.justify,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildBulletPoint(
                              'Aplikasi ini hanya boleh digunakan untuk tujuan yang sah dan sesuai dengan semua peraturan perundang-undangan yang berlaku.'),
                          SizedBox(
                            height: 5,
                          ),
                          buildBulletPoint(
                              'Anda dilarang untuk menggunakan aplikasi ini untuk tujuan yang melanggar hukum atau menipu.'),
                          SizedBox(
                            height: 5,
                          ),
                          buildBulletPoint(
                              'Anda setuju untuk tidak mengganggu atau mengacaukan aplikasi atau server atau jaringan yang terhubung ke aplikasi.'),
                        ],
                      ),
                    ),
                    Text(
                      '4. Pendaftaran Pengguna',
                      style: textHeader2,
                      textAlign: TextAlign.justify,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildBulletPoint(
                              'Untuk menggunakan beberapa fitur dari aplikasi ini, Anda mungkin perlu mendaftar dan membuat akun pengguna.'),
                          SizedBox(
                            height: 5,
                          ),
                          buildBulletPoint(
                              'Anda harus memberikan informasi yang akurat dan lengkap selama proses pendaftaran.'),
                          SizedBox(
                            height: 5,
                          ),
                          buildBulletPoint(
                              'Anda bertanggung jawab untuk menjaga kerahasiaan informasi akun Anda dan semua aktivitas yang terjadi di bawah akun Anda.'),
                        ],
                      ),
                    ),
                    Text(
                      '5. Privasi',
                      style: textHeader2,
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      'Kebijakan Privasi kami menjelaskan bagaimana kami mengumpulkan, menggunakan, dan melindungi informasi pribadi Anda. Dengan menggunakan aplikasi ini, Anda setuju dengan pengumpulan dan penggunaan informasi sesuai dengan Kebijakan Privasi kami.',
                      style: textKecil,
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      '6. Hak Kekayaan Intelektual',
                      style: textHeader2,
                      textAlign: TextAlign.justify,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildBulletPoint(
                              'Semua konten yang disediakan di aplikasi ini, termasuk teks, grafis, logo, ikon, dan gambar, adalah milik BUMNMUDA atau penyedia kontennya dan dilindungi oleh hukum hak cipta.'),
                          SizedBox(
                            height: 5,
                          ),
                          buildBulletPoint(
                              'Anda tidak diperbolehkan untuk menyalin, mendistribusikan, atau mengubah konten tanpa izin tertulis dari BUMNMUDA.'),
                        ],
                      ),
                    ),
                    Text(
                      '7. Batasan Tanggung Jawab',
                      style: textHeader2,
                      textAlign: TextAlign.justify,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildBulletPoint(
                              'Aplikasi ini disediakan "sebagaimana adanya" dan "sebagaimana tersedia" tanpa jaminan apa pun.'),
                          SizedBox(
                            height: 5,
                          ),
                          buildBulletPoint(
                              'BUMNMUDA tidak bertanggung jawab atas kerugian atau kerusakan yang timbul dari penggunaan aplikasi ini.'),
                        ],
                      ),
                    ),
                    Text(
                      '8. Penghentian Akses',
                      style: textHeader2,
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      'Kami berhak untuk menghentikan atau menangguhkan akses Anda ke aplikasi ini kapan saja, tanpa pemberitahuan sebelumnya, jika kami yakin bahwa Anda telah melanggar syarat dan ketentuan ini atau hukum yang berlaku.',
                      style: textKecil,
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      '9. Hukum yang Berlaku',
                      style: textHeader2,
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      'Syarat dan ketentuan ini diatur oleh dan ditafsirkan sesuai dengan hukum yang berlaku di Indonesia.',
                      style: textKecil,
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      '10. Pembayaran',
                      style: textHeader2,
                      textAlign: TextAlign.justify,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildBulletPoint(
                              'Anda setuju untuk membayar paket belajar sesuai dengan waktu yang ditetapkan oleh BUMNMUDA.'),
                          SizedBox(
                            height: 5,
                          ),
                          buildBulletPoint(
                              'Apabila Anda tidak membayar dalam waktu yang ditentukan, maka pemesanan dianggap dibatalkan.'),
                          SizedBox(
                            height: 5,
                          ),
                          buildBulletPoint(
                              'BUMNMUDA tidak menjamin pengembalian pembayaran apabila terjadi pembatalan belajar.'),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    )
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
