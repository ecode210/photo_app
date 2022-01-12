import 'package:flutter/material.dart';
import 'package:photo_app/view/home.dart';
import 'package:photo_app/viewmodel/photo.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Photo(),
        )
      ],
      builder: (context, child){
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "A Photo App",
          color: Colors.white,
          home: Home(),
        );
      },
    );
  }
}
