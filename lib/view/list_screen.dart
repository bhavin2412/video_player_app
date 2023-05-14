import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player_app/provider/videoprovider.dart';

class VideoListScreen extends StatefulWidget {
  const VideoListScreen({Key? key}) : super(key: key);

  @override
  State<VideoListScreen> createState() => _VideoListScreenState();
}

class _VideoListScreenState extends State<VideoListScreen> {
  VideoProvider? videoProviderFalse;
  VideoProvider? videoProviderTrue;

  @override
  Widget build(BuildContext context) {
    videoProviderFalse = Provider.of<VideoProvider>(context, listen: false);
    videoProviderTrue = Provider.of<VideoProvider>(context, listen: true);
    return SafeArea(
        child: Scaffold(
            backgroundColor: Color(0xff222C32),
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Color(0xff222C32),
              title: Text(
                "Welcome Back",
                style: TextStyle(
                    letterSpacing: 1,
                    fontSize: 25,
                    fontFamily: 'pr',
                    color: Colors.white),
              ),
              actions: [
                Icon(
                  Icons.notifications_none,
                  size: 30,
                  color: Colors.white,
                ),
                SizedBox(width: 10),
              ],
            ),
            body: ListView.builder(
              itemBuilder: (context, index) => printImage(index),
              itemCount: videoProviderTrue!.videoinfo.length,
            )));
  }

  Widget printImage(int index) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  spreadRadius: 3,
                  blurRadius: 5,
                )
              ]
          ),
          margin: EdgeInsets.symmetric(horizontal: 5,vertical: 10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: InkWell(
              onTap: () {
                videoProviderFalse!.chnageindex(index);
                Navigator.pushNamed(context, 'play',arguments: index);
              },
              child: Image.asset(
                "${videoProviderFalse!.videoinfo[index].imagepath}",
                height: 250,
                width: 300,
                fit: BoxFit.fill,
              ),
            ),
          )),
    );
  }
}
