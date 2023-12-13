import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import '../widgets/tag_selector.dart';

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
  String? _tag;

  @override
  void initState() {
    super.initState();
    _tag = null;

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
    final size = MediaQuery.of(context).size;

    return Scaffold(
			backgroundColor: Colors.black,
      body: FutureBuilder<void>(
          future: _initializeControllerFuture,
          builder: (context, snapshot) {
            return Stack(
              alignment: Alignment.center,
              children: [
                cameraView(controller, snapshot, size),
                Padding(
									 // Hacky way to deal with FAB and Safe Areas on iPhone.
									 // This at least looks decent on an iPhone 11.
                    padding: EdgeInsets.fromLTRB(0, 60.0, 0, 80.0),
                    child: Column(children: [
                      Container(
                        padding:
                            EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white, // Box color
                          borderRadius:
                              BorderRadius.circular(10), // Rounded corners
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // position of shadow
                            ),
                          ],
                        ),
                        child: Text(
                          'Item Added to Your Closet',
                          style: TextStyle(
                            color: Colors.black, // Text color
                            fontSize: 16, 
                          ),
                        ),
                      ),
                      Spacer(),
                      TagSelector(onTagSelected: (newTag) {
                        _tag = newTag;
                      }),
                    ]))
              ],
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {},
        child: const Icon(Icons.camera),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

// Helper method to deal with camera loading, or the fact that there may not be a
// camera on a simulator.
Widget cameraView<T>(
    CameraController? controller, AsyncSnapshot<T> snapshot, Size size) {
  if (controller == null) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0.0, 0, 0),
      child: Center(child: Icon(Icons.videocam_off)),
    );
  } else if (snapshot.connectionState == ConnectionState.done) {
    return CameraPreviewWidget(controller: controller, size: size);
  } else {
    return const Center(child: CircularProgressIndicator());
  }
}

class CameraPreviewWidget extends StatelessWidget {
  final CameraController controller;
  final Size size;

  const CameraPreviewWidget(
      {Key? key, required this.controller, required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      clipper: _MediaSizeClipper(size),
      child: Transform.scale(
        scale: 1 / (controller.value.aspectRatio * size.aspectRatio),
        alignment: Alignment.topCenter,
        child: CameraPreview(controller),
      ),
    );
  }
}

class _MediaSizeClipper extends CustomClipper<Rect> {
  final Size mediaSize;
  const _MediaSizeClipper(this.mediaSize);
  @override
  Rect getClip(Size size) {
    return Rect.fromLTWH(0, 0, mediaSize.width, mediaSize.height);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return true;
  }
}
