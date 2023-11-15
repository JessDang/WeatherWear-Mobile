import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

/// A widget that manages using the camera.
class CameraScreen extends StatefulWidget {

  // Constructor requires item name, image URL, and category.
  const CameraScreen({
    Key? key,
		required this.camera,
  }) : super(key: key);

	final CameraDescription? camera;

	@override
  CameraScreenState createState() => CameraScreenState();
}

class CameraScreenState extends State<CameraScreen> {
  late CameraController? _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();

		final camera = widget.camera;

		if (camera != null) {
			_controller = CameraController(
				// Get a specific camera from the list of available cameras.
				camera,
				// Define the resolution to use.
				ResolutionPreset.medium,
			);

		} else {
			_controller = null;
		}

		_initializeControllerFuture = _controller?.initialize() ?? Future.value();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
		final controller = _controller;
		return Scaffold(
			body: FutureBuilder<void>(
				future: _initializeControllerFuture,
				builder: (context, snapshot) {
					if (controller == null) {
						return const Center(child: Icon(Icons.videocam_off));
					} else if (snapshot.connectionState == ConnectionState.done) {
						return CameraPreview(controller);
					} else {
						return const Center(child: CircularProgressIndicator());  
					}
				}
			)
		);
  }

}
