import 'dart:io';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';
import 'package:permission_handler/permission_handler.dart';


class UnduhPDFCard extends StatelessWidget {
  final String namaFile;
  final int halaman;

  UnduhPDFCard({
    required this.namaFile,
    required this.halaman
  });

  Future<void> downloadAndOpenPDF(String url, String fileName) async {
    try {
      // Meminta izin
      var status = await Permission.storage.request();

      if (status.isGranted) {
        final dir = await getExternalStorageDirectory();
        final filePath = '${dir?.path}/Download/$fileName';

        // Membuat instance dio
        var dio = Dio();

        // Mengunduh file
        await dio.download(url, filePath);

        print('File berhasil diunduh ke $filePath');

        // Membuka file PDF setelah diunduh
        final result = await OpenFile.open(filePath);
        print('Hasil membuka file: $result');
      } else {
        print('Izin ditolak');
      }
    } catch (e) {
      print('Error saat mengunduh atau membuka file: $e');
    }
  }

  String link() {
    String fullPath = namaFile;
    List<String> parts = fullPath.split('/');
    String fileName = parts.last;
    print(fileName);
    return fileName;
  }

  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color(0xffE7F0FD),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                Icons.picture_as_pdf,
                color: Colors.red,
                size: 25,
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 150, // Ubah lebar sesuai kebutuhan
                    child: Text(
                      link(),
                      maxLines: 2,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Text(
                    '$halaman Halaman',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  const Text(
                    '23 MB',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
          GestureDetector(
            onTap: () {downloadAndOpenPDF("https://bimbel.adzazarif.my.id/storage/$namaFile", namaFile);},
            child: const Icon(
              Icons.download_for_offline_sharp,
              color: Color(0xff2E3D64),
              size: 25,
            ),
          ),
        ],
      )
      ,
    );
  }
}