//The entry point of the application, containing the runApp method.

// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/closet_screen.dart';
import 'screens/camera_screen.dart';

Future<void> main() async {
	  WidgetsFlutterBinding.ensureInitialized();
		final cameras = await availableCameras();
		final firstCamera = cameras.firstOrNull;
		runApp(MyApp(camera: firstCamera));
}

class MyApp extends StatelessWidget {

	final CameraDescription? camera;

  const MyApp({super.key, required this.camera});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WeatherWear',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 58, 183, 98)),
        useMaterial3: true,
      ),
      home: RootView(camera: camera)
    );
  }
}

class RootView extends StatefulWidget {

	final CameraDescription? camera;

  const RootView({super.key, required this.camera});

  @override
  State<RootView> createState() => _RootViewState();
}

class _RootViewState extends State<RootView> {

	int _index = 0;

  final List<Widget> _children = [
    HomeScreen(),
    CameraScreen(camera: null),
    ClosetScreen()
  ];

	@override
	void initState() {
		super.initState();
		_children[1] = CameraScreen(camera: widget.camera);
	}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_index],
			bottomNavigationBar: BottomNavigationBar(
				onTap: (index) {
					setState(() {
						_index = index;
					});
				},
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.thermostat_outlined),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
          ),
        ],
			),
    );
  }
}
