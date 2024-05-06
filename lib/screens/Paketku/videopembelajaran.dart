import 'package:bumn_muda/card/lessons.dart';
import 'package:bumn_muda/card/lessons_card.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPembelajaran extends StatefulWidget {
  final String videoId = 'XZxvpf9-RTU';
  const VideoPembelajaran({super.key});

  @override
  State<VideoPembelajaran> createState() => _VideoPembelajaranState();
}

class _VideoPembelajaranState extends State<VideoPembelajaran> {
  late YoutubePlayerController _controller;
  bool _isFullScreen = false;
  @override
  void initState(){
    super.initState();
    _controller = YoutubePlayerController(initialVideoId: widget.videoId,
    flags: const YoutubePlayerFlags(
      autoPlay: false,
      mute: false,
      isLive: false
    )
    )..addListener(_onPlayerStateChange);
  }

  void _onPlayerStateChange(){
    if (_controller.value.isFullScreen != _isFullScreen) {
      setState(() {
        _isFullScreen = _controller.value.isFullScreen;
      });
    }
  }
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
                text: 'Video ',
                style: TextStyle(
                  // Gaya teks untuk "Video"
                  fontWeight: FontWeight.w500,
                  // Atur gaya teks sesuai keinginan Anda
                ),
              ),
              TextSpan(
                text: 'Pembelajaran',
                // Gaya teks untuk "Pembelajaran"
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                decoration: BoxDecoration(
                    gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.topRight,
                        colors: [Color(0xff5D7BCA), Color(0xff2E3D64)]),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset: const Offset(0, 3),
                      )
                    ]),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 2,
                          blurRadius: 4,
                          offset: const Offset(0, 3),
                        )
                      ]),
                    child: YoutubePlayer(
                      controller: _controller,
                      showVideoProgressIndicator: true,
                      progressIndicatorColor: Colors.red,
                      progressColors: ProgressBarColors(
                        playedColor: Colors.red,
                        handleColor: Colors.redAccent
                      ),),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Yang Perlu Disiapkan',
                      style: TextStyle(
                          fontFamily: 'Urbanist',
                          fontSize: 19,
                          fontWeight: FontWeight.w800,
                          color: Colors.black),
                    ),
                    const Text(
                      '2.1K Students Views',
                      style: TextStyle(
                          fontFamily: 'Urbanist',
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
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
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: products.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: LessonsCard(
                              nomer: products[index].nomer,
                              judul: products[index].judul,
                              waktu: products[index].waktu,
                            ),
                          );
                        },
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
