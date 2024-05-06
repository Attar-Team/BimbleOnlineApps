import 'package:bumn_muda/screens/Quiz/quiz_screen.dart';
import 'package:flutter/material.dart';

class DetailTryOut extends StatefulWidget {
  final String judulTryOut;

  const DetailTryOut({required this.judulTryOut});

  @override
  State<DetailTryOut> createState() => _DetailTryOutState();
}

class _DetailTryOutState extends State<DetailTryOut> {
  int sortIndex = 0;
  List<TryOutItem> tryoutItem = [
    TryOutItem(selesai: true, nilai: 80, waktuSelesai: DateTime.now()),
    TryOutItem(selesai: false, nilai: null, waktuSelesai: null),
    TryOutItem(selesai: true, nilai: 90, waktuSelesai: DateTime.now()),

  ];

  @override
  void initState(){
    super.initState();
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
                text: 'Materi ',
                style: TextStyle(
                  // Gaya teks untuk "Video"
                  fontWeight: FontWeight.w500,
                  // Atur gaya teks sesuai keinginan Anda
                ),
              ),
              TextSpan(
                text: 'Try Out',
                // Gaya teks untuk "Pembelajaran"
              ),
            ],
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15)
              ),
              child: const Image(
                image: AssetImage('images/gambarpaket.png')),
            ),
            const SizedBox(height: 10,),
            Text(
              widget.judulTryOut,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black
              ),),
            SizedBox(height: 10,),
            const Row(
              children: [
                Icon(
                  Icons.play_lesson,
                  color: Colors.black,
                  size: 18,),
                SizedBox(width: 10,),
                Text(
                  '20 Soal',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Colors.black
                  ),
                ),
              ],
            ),
            SizedBox(height: 5,),
            const Row(
              children: [
                Icon(
                  Icons.timer,
                  color: Colors.black,
                  size: 18,),
                SizedBox(width: 10,),
                Text(
                  '2 Jam',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Colors.black
                  ),
                ),
              ],
            ),
            SizedBox(height: 5,),
            const Row(
              children: [
                Icon(
                  Icons.type_specimen_sharp,
                  color: Colors.black,
                  size: 18,),
                SizedBox(width: 10,),
                Text(
                  'Pilihan Ganda',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Colors.black
                  ),
                ),
              ],
            ),
            SizedBox(height: 10,),
            Container(
              width: double.infinity,
              child: DataTable(
                // sortColumnIndex: sortIndex,
                // sortAscending: true,
                columns: [
                  DataColumn(label: Text('Deskripsi')),
                  DataColumn(label: Text('Nilai')),
                  DataColumn(label: Text('Action')),
                ],
                dataRowHeight: 90,
                rows: tryoutItem.map((e) => DataRow(cells: [
                  DataCell(
                    e.selesai
                      ? Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            child: Text(
                              'Selesai',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.white
                              ),
                            ),
                            ),
                            Text('Selesai pada : ${e.waktuSelesai.toString()}',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 10),)
                          ],
                        ),
                      )
                      :
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                            child: Text(
                              'Belum Selesai',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white
                              ),
                            ),
                          ),
                          Text(e.waktuSelesai != null ? 'Selesai pada : ${e.waktuSelesai.toString()}' : '---',
                            style: TextStyle(fontSize: 10),)
                        ],
                      ),
                      ),
                  DataCell(Text(e.nilai != null ? e.nilai.toString() : '---')),
                  DataCell(
                    e.selesai 
                      ? GestureDetector(
                        onTap: (){
                          //PINDAH KE HALAMAN REVIEW PEMBAHASAN
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            'Pembahasan',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.white
                            ),
                          ),
                        ),
                      )
                      : GestureDetector(
                        onTap: (){
                          Navigator.push(
                            context, 
                            MaterialPageRoute(builder: (context) => QuizScreen()));
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                          decoration: BoxDecoration(
                            color: Color(0xff2E3D64),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            'Attempt Quiz',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.white
                            ),
                          ),
                        ),
                      )
                      
                      )
                  ])).toList()
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TryOutItem {
  final bool selesai;
  final int? nilai;
  final DateTime? waktuSelesai;
  
  TryOutItem({required this.selesai, required this.nilai, required this.waktuSelesai});
}