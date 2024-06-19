import 'package:flutter/material.dart';
import 'package:bumn_muda/card/lessons_card.dart';
import 'package:bumn_muda/card/lessons.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:midtrans_sdk/midtrans_sdk.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as dot_env;
import '../../card/soal_card.dart';
import '../../card/tryout_card.dart';
import '../../card/video_card.dart';
import '../../data/ujian.dart';
import '../../services/token_service.dart';

class LessonsScreen extends StatefulWidget {

  final List<Exam> listExam;

  const LessonsScreen({Key? key, required this.listExam}) : super(key: key);

  @override
  State<LessonsScreen> createState() => _LessonsScreenState();
}

class _LessonsScreenState extends State<LessonsScreen> {
  late final MidtransSDK? _midtrans;

  @override
  void initState() {
    super.initState();
    _initSDK();
  }

  void _initSDK() async {

    _midtrans = await MidtransSDK.init(
      config: MidtransConfig(
        clientKey: dot_env.dotenv.env['MIDTRANS_CLIENT_KEY'] ?? "",
        merchantBaseUrl: "",
        colorTheme: ColorTheme(
          colorPrimary: Colors.blue,
          colorPrimaryDark: Colors.blue,
          colorSecondary: Colors.blue,
        ),
      ),
    );
    _midtrans?.setUIKitCustomSetting(
      skipCustomerDetailsPages: true,
    );
    _midtrans!.setTransactionFinishedCallback((result) {
      print("TRANSACTION STATUS: ${result}");
      print("TRANSACTION STATUS: ${result.transactionStatus}");
      print("TRANSACTION STATUS: ${result.transactionStatus}");
      print("TRANSACTION STATUS: ${result.transactionStatus}");

      if (result.transactionStatus == TransactionResultStatus.settlement) {
        _showToast('Pembayaran Berhasil', false);
      } else if (result.isTransactionCanceled) {
        _showToast('Pembayaran Gagal', true);
      }
    });

  }

  void _showToast(String msg, bool isError) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: isError ? Colors.red : Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '18 Lessons',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'See All',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    color: Color(0xff0093AC),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            const Text(
              'Section 1 - Introduction',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
            
            Container(
              transform: Matrix4.translationValues(0.0, -30.0, 0.0),
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: widget.listExam.length,
                itemBuilder: (context, index) {
                  final item = widget.listExam[index];
                  Widget card;

                  if (item.jenis == 'exam') {
                    card = TryoutCard(
                      nomer: "${index + 1}",
                      judul: item.name,
                      waktu: "",
                    );
                  } else {
                    switch (item.typeCourse) {
                      case 'videos':
                        card = TryoutCard(
                          nomer: "${index + 1}",
                          judul: item.name,
                          waktu: "",
                        );
                        break;
                      case 'file pdf':
                        card = TryoutCard(
                          nomer: "${index + 1}",
                          judul: item.name,
                          waktu: "",
                        );
                        break;
                      default:
                        card = Container(); // Optional: Handle unknown types
                        break;
                    }
                  }

                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: card,
                  );
                },
              )
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: ()  async {
                final result = await TokenService().getToken("Paket 1", 100000, 1);

                if (result.isRight()) {
                  String? token = result.fold((l) => null, (r) => r.token);

                  if (token == null) {
                    _showToast('Token cannot null', true);
                    return;
                  }

                  _midtrans?.startPaymentUiFlow(
                    token: token,
                  );
                } else {
                  print("RESULT" + result.toString());
                  _showToast('Transaction Failed', true);
                }
              },
              child: Container(
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
                ),
            )
          ],
        ),
      ),
    );
  }
}