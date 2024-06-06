import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:midtrans_sdk/midtrans_sdk.dart';
import '../../data/ujian.dart';
import '../../services/token_service.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as dot_env;

class AboutScreen extends StatefulWidget {
  final int price;
  final String productDescription;
  final List<Exam> listExam;
  final int discount;
  const AboutScreen({super.key, required this.productDescription, required this.listExam, required this.price, required this.discount, });

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
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
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
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
                widget.productDescription,
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
                widget.listExam.asMap().entries.map((entry) => '${entry.key + 1}. ${entry.value.name}').join('\n'),                
                  style: TextStyle(
                  fontFamily: 'Urbanist',
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.black
                ),
              ),
              SizedBox(height: 20,),
              GestureDetector(
                onTap: () async {
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
                      'Daftar Kursus - Rp${widget.price - widget.discount}',
                      style: const TextStyle(
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
      ),
    );
  }
}
