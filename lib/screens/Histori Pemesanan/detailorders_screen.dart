import 'package:flutter/material.dart';

class DetailOrders extends StatefulWidget {
  final String judulPaket;
  
  const DetailOrders({required this.judulPaket});

  @override
  State<DetailOrders> createState() => _DetailOrdersState();
}

class _DetailOrdersState extends State<DetailOrders> {
  final String id = '#515214';
  final DateTime tanggal = DateTime(2024, 9, 21);
  final String paymentMethode = 'ShopeePay';
  final String username = 'Rizky Asyam';
  final int harga = 100000;
  final String status = 'Sudah Dibayar';
  final String imageURL = 'images/gambarpaket.png';
  final String deskripsiPaket = '* Tes Kemampuan Dasar (TKD)  *Tes Ujian Simulasi *Tes Logika *Paket Soal Lengkap';

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
                text: 'Order ',
                style: TextStyle(
                  // Gaya teks untuk "Video"
                  fontWeight: FontWeight.w500,
                  // Atur gaya teks sesuai keinginan Anda
                ),
              ),
              TextSpan(
                text: 'Detail',
                // Gaya teks untuk "Pembelajaran"
              ),
            ],
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      id,
                      style: TextStyle(
                          fontFamily: "Urbanist",
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                    Text(
                      _formatDate(tanggal),
                      style: TextStyle(
                          fontFamily: 'Urbanist',
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Status',
                      style: TextStyle(
                          fontFamily: "Urbanist",
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey),
                    ),
                    Text(
                      status,
                      style: TextStyle(
                          fontFamily: 'Urbanist',
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.green),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Metode Pembayaran',
                      style: TextStyle(
                          fontFamily: "Urbanist",
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey),
                    ),
                    Text(
                      paymentMethode,
                      style: TextStyle(
                          fontFamily: 'Urbanist',
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dipesan Oleh',
                      style: TextStyle(
                          fontFamily: "Urbanist",
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Text(
                      status,
                      style: TextStyle(
                          fontFamily: 'Urbanist',
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.green),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              // Garis paling bawah
              color: Colors.grey,
              thickness: 1,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Paket Pembelian',
              style: TextStyle(
                  fontFamily: 'Urbanist',
                  color: Colors.grey,
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 180,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage(imageURL))
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 5,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.judulPaket,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 10,),
                      Text(
                        deskripsiPaket,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: Colors.black
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              // Garis paling bawah
              color: Colors.grey,
              thickness: 1,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Harga Paket',
                  style: TextStyle(
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    color: Colors.grey
                  ),
                ),
                Text(
                  'Rp$harga,00',
                  style: TextStyle(
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    color: Colors.green
                  ),
                ),
              ],
            ),
            SizedBox(height: 20,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: BoxDecoration(
                color: Color(0xffE9EFFF),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        size: 40,
                        Icons.bubble_chart,
                        color: Color(0xff2E3D64),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Ada Pertanyaan ?',
                            style: TextStyle(
                              fontFamily: 'Urbanist',
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: Colors.black
                            ),
                          ),
                          Text(
                            'Chat Admin',
                            style: TextStyle(
                              fontFamily: 'Urbanist',
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              color: Colors.grey
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Text(
                    'Chat',
                    style: TextStyle(
                      fontFamily: 'Urbanist',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff2E3D64),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    String day = date.day.toString();
    String month = '';
    switch (date.month) {
      case 1:
        month = 'Januari';
        break;
      case 2:
        month = 'Februari';
        break;
      case 3:
        month = 'Maret';
        break;
      case 4:
        month = 'April';
        break;
      case 5:
        month = 'Mei';
        break;
      case 6:
        month = 'Juni';
        break;
      case 7:
        month = 'Juli';
        break;
      case 8:
        month = 'Agustus';
        break;
      case 9:
        month = 'September';
        break;
      case 10:
        month = 'Oktober';
        break;
      case 11:
        month = 'November';
        break;
      case 12:
        month = 'Desember';
        break;
      default:
        month = '';
    }
    String year = date.year.toString();
    return '$day $month $year';
  }
}
