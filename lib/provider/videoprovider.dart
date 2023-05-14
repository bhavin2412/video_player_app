import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:video_player/video_player.dart';
import '../model/videomodel_provider.dart';


class VideoProvider extends ChangeNotifier {
  VideoPlayerController? videoPlayerController;
  ChewieController? chewieController;

  List<VideoModel> videoinfo = [
    VideoModel(
        imagepath: 'assets/images/Mehabooba.jpg',
        name: "Mehabooba",
        movie: "KGF Chapter 2",
        videopath: 'assets/video/Mehabooba.mp4'),
    VideoModel(
        imagepath: 'assets/images/Barbaadiyan.jpg',
        name: "Barbaadiyan",
        movie: "Shiddat",
        videopath: 'assets/video/Barbaadiyan.mp4'),
    VideoModel(
        imagepath: 'assets/images/Jhoome_Jo_Pathaan.jpg',
        name: "Jhoome Jo Pathaan",
        movie: "Pathaan",
        videopath: 'assets/video/Jhoome_Jo_Pathaan.mp4'),
    VideoModel(
        imagepath: 'assets/images/Mere-Rashke_Qamar.jpg',
        name: "Mere Rashke Qamar",
        movie: "Baadshaho",
        videopath: 'assets/video/Mere-Rashke_Qamar.mp4'),
    VideoModel(
        imagepath: 'assets/images/O_Bedardeya.jpg',
        name: "O Bedardeya",
        movie: "Tu Jhoothi Main Makkaar",
        videopath: 'assets/video/O_Bedardeya.mp4'),
    VideoModel(
        imagepath: 'assets/images/Apna_Bana_Le.jpg',
        name: "Apna Bana Le",
        movie: "Bhediya",
        videopath: 'assets/video/Apna_Bana_Le.mp4'),
    VideoModel(
        imagepath: 'assets/images/Kesariya.jpg',
        name: "Kesariya",
        movie: "Brahmāstra",
        videopath: 'assets/video/Kesariya.mp4'),
  ];
  int indexforvideo=0;
  int sliderindex=0;
  void loadVideo() {
    videoPlayerController =
        VideoPlayerController.asset("${videoinfo[indexforvideo].videopath}");
    chewieController = ChewieController(
        videoPlayerController: videoPlayerController!,
        autoPlay: true,
        materialProgressColors: ChewieProgressColors(
            backgroundColor: CupertinoColors.lightBackgroundGray,
            playedColor: CupertinoColors.activeBlue),
        showOptions: true);
    notifyListeners();
  }
  void chnageindex(int index)
  {
    indexforvideo=index;
    notifyListeners();
  }
  void sliderindexchnage(int index)
  {
    sliderindex=index;
    notifyListeners();
  }
}
