import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player_app/provider/videoprovider.dart';
import 'view/list_screen.dart';
import 'view/play_screen.dart';
void main()
{
  runApp(DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) {
      return ChangeNotifierProvider(
        create: (context) => VideoProvider(),
        builder: (context, child) => MaterialApp(
          useInheritedMediaQuery: true,
          debugShowCheckedModeBanner: false,
          // initialRoute: 'play',
          routes: {
            '/':(context) => VideoListScreen(),
            'play':(context) => VideoPlayScreen(),
          },
        ),
      );
    },
  ));
}