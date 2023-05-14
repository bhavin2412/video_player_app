import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player_app/provider/videoprovider.dart';

class VideoPlayScreen extends StatefulWidget {
  const VideoPlayScreen({Key? key}) : super(key: key);

  @override
  State<VideoPlayScreen> createState() => _VideoPlayScreenState();
}

class _VideoPlayScreenState extends State<VideoPlayScreen> {
  VideoProvider? videoProviderFalse;
  VideoProvider? videoProviderTrue;

  @override
  void initState() {
    super.initState();
    Provider.of<VideoProvider>(context, listen: false).loadVideo();
  }

  @override
  Widget build(BuildContext context) {
    // int index = 0;
    int index = ModalRoute.of(context)!.settings.arguments as int;
    videoProviderFalse = Provider.of<VideoProvider>(context, listen: false);
    videoProviderTrue = Provider.of<VideoProvider>(context, listen: true);
    return SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xff222C32),
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            backgroundColor: Color(0xff222C32),
            title: Text(
              "PLAYING",
              style: TextStyle(
                  letterSpacing: 1,
                  fontSize: 20,
                  fontFamily: 'pr',
                  color: Colors.white),
            ),
            leading: Center(
              child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios_new_outlined,
                    size: 25,
                    color: Colors.white,
                  )),
            ),
          ),
          body: Center(
            child: Column(
              children: [
                Container(
                  height: 400,
                  width: double.infinity,
                  child: Consumer<VideoProvider>(
                    builder: (context, value, child) => Chewie(
                      controller: videoProviderTrue!.chewieController!,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "${videoProviderTrue!.videoinfo[videoProviderTrue!.indexforvideo].name}",
                  style: TextStyle(
                      letterSpacing: 1,
                      fontFamily: 'pr',
                      fontSize: 30,
                      color: Colors.white),
                ),
                SizedBox(height: 10),
                Text(
                  "${videoProviderTrue!.videoinfo[videoProviderTrue!.indexforvideo].movie}",
                  style: TextStyle(
                      letterSpacing: 1,
                      fontFamily: 'pr',
                      fontSize: 20,
                      color: Colors.white70),
                ),
                SizedBox(height: 10),
                CarouselSlider.builder(
                    itemCount: videoProviderTrue!.videoinfo.length,
                    itemBuilder: (context, index, realIndex) {
                      return InkWell(
                        onTap: () {
                          videoProviderFalse!.chnageindex(index);

                          videoProviderFalse!.loadVideo();
                        },
                        child: Image.asset(
                            "${videoProviderFalse!.videoinfo[index].imagepath}"),
                      );
                    },
                    options: CarouselOptions(
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 2),
                      enlargeCenterPage: true,
                      viewportFraction: 0.7,
                      onPageChanged: (index, reason) {
                        videoProviderFalse!.sliderindexchnage(index);
                      },
                    )),
                SizedBox(height: 10),
                CarouselIndicator(
                  space: 5,
                  count: videoProviderFalse!.videoinfo.length,
                  index: videoProviderTrue!.sliderindex,
                )
              ],
            ),
          ),
        ));
  }
}
