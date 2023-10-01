import 'dart:io';

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

// A screen that allows users to take a picture using a given camera.
class TakePictureScreen extends StatefulWidget {
  const TakePictureScreen({
    super.key,
    required this.cameras,
    required this.cameraLensDirection,
    required this.onSave,
  });

  final List<CameraDescription> cameras;
  final Function(String value) onSave;
  final CameraLensDirection cameraLensDirection;

  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}

class TakePictureScreenState extends State<TakePictureScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    
    for (final cameraDescription in widget.cameras) {
      if (cameraDescription.lensDirection == widget.cameraLensDirection) {
        _controller = CameraController(
          cameraDescription,
          ResolutionPreset.medium,
        );
        break;
      } else {
        _controller = CameraController(
          widget.cameras[0],
          ResolutionPreset.medium,
        );
      }
    }

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Fill this out in the next steps.
    return Scaffold(
      appBar: AppBar(title: const Text('Take a picture')),
      body: Column(
        children: [
          FutureBuilder<void>(
            future: _initializeControllerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                // If the Future is complete, display the preview.
                return CameraPreview(_controller);
              } else {
                // Otherwise, display a loading indicator.
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
            child: Center(
              child: ElevatedButton(
                onPressed: () async {
                  try {
                    await _initializeControllerFuture;
                    final image = await _controller.takePicture();
            
                    if (!mounted) return;
            
                    await Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => DisplayPictureScreen(
                          imagePath: image.path,
                          onSave: widget.onSave,
                        ),
                      ),
                    );
                  } catch (e) {
                    print(e);
                  }
                },
                style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  // ignore: prefer_const_constructors
                  fixedSize: MaterialStatePropertyAll(const Size(70, 70)),
                ),
                child: const Icon(Icons.camera_alt),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DisplayPictureScreen extends StatelessWidget {
  const DisplayPictureScreen({super.key, required this.imagePath, required this.onSave});

  final String imagePath;
  final Function(String value) onSave;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text('Display the Picture')),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.75,
            child: Image.file(File(imagePath))
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
                      backgroundColor: const MaterialStatePropertyAll<Color>(Color(0xFFFD413C)),
                      foregroundColor: const MaterialStatePropertyAll<Color>(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      fixedSize: const MaterialStatePropertyAll(Size(70, 70)),
                    ),
                    child: const Icon(Icons.replay_outlined),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      onSave(imagePath);
                      Navigator.popUntil(context, ModalRoute.withName('/register'));
                    },
                    style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      fixedSize: const MaterialStatePropertyAll(Size(70, 70)),
                    ),
                    child: const Icon(Icons.check),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}