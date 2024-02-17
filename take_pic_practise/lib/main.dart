import 'package:flutter/material.dart';
import 'package:take_pic_practise/camera_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const TakePic(),
    );
  }
}

class TakePic extends StatefulWidget {
  const TakePic({super.key});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TakePicState();
  }
}

class _TakePicState extends State<TakePic> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const CameraScreen(),
              ),
            );
          },
          child: const Text("Go to Take the Picture"),
        ),
      ),
    );
  }
}
