import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:midtrans_sdk/midtrans_sdk.dart';
import '../../services/token_service.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as dot_env;

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

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
      if (result.transactionStatus == Transaction.success(result.transactionId)) {
        _showToast('Pembayaran Berhasil', false);
      } else if (result.transactionStatus == Transaction.abort()) {
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
              const Text(
                '1. Tes Kewawasan Bangsa (TWK) \n2. Tes Intelegensi Umum (TIU) \n3. Tes Karakteristik Pribadi (TKP)',
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
              final result = await TokenService().getToken("Paket 1", 1000, 1);

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
                  child: const Center(
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
      ),
    );
  }
}
