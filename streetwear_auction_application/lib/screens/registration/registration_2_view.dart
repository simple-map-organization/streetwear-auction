import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:streetwear_auction_application/main.dart';
import 'package:streetwear_auction_application/widgets/custom_authetication_button.dart';

class RegistrationScreen2 extends StatefulWidget {
  static const routeName = '/registration_2';
  final CameraDescription camera;
  static MaterialPageRoute createRoute(args) => MaterialPageRoute(
      builder: (_) => RegistrationScreen2(
            camera: firstCamera,
          ));
  const RegistrationScreen2({key, @required this.camera}) : super(key: key);

  @override
  _RegistrationScreen2State createState() => _RegistrationScreen2State();
}

class _RegistrationScreen2State extends State<RegistrationScreen2> {
  CameraController _controller;
  Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      // Get a specific camera from the list of available cameras.
      widget.camera,
      // Define the resolution to use.
      ResolutionPreset.medium,
    );

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
    return Scaffold(
      backgroundColor: Color.fromRGBO(217, 217, 217, 1),
      body: FutureBuilder(
          future: _initializeControllerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              Stack(children: [
                Positioned(
                    top: 10,
                    left: 10,
                    child: IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        })),
                Column(
                  children: [
                    Container(
                      height: 30,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 40, right: 40),
                      child: Container(
                        height: 200,
                        child: Image.asset(
                          'assets/img/logo-01.png',
                        ),
                      ),
                    ),
                    Text(
                      'Registration',
                      style: TextStyle(fontSize: 30),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                      child: Text(
                          'Hereby, you have to provide 3 photos for the prove of your identity: \n\n' +
                              '1. Front view of the IC/Passport/License\n\n' +
                              '2. Back view of the IC/Passport/License\n\n' +
                              '3. A selfie of yourself holding your IC/Passport/Licence with a piece of paper writing today\'s date and \"SWA registration\"',
                          style: TextStyle(fontSize: 14)),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Text(
                          '*Make sure the photos taken are clear, so that your face and name are both clear and legible.',
                          style: TextStyle(fontSize: 12, color: Colors.red)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 60),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomAuthenticationButton(
                              text: 'Take Photo',
                              onPressed: () async {
                                try {
                                  // Ensure that the camera is initialized.
                                  await _initializeControllerFuture;

                                  // Attempt to take a picture and get the file `image`
                                  // where it was saved.
                                  final image = await _controller.takePicture();

                                  // If the picture was taken, display it on a new screen.
                                  await Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          DisplayPictureScreen(
                                        // Pass the automatically generated path to
                                        // the DisplayPictureScreen widget.
                                        imagePath: image.path,
                                      ),
                                    ),
                                  );
                                } catch (e) {
                                  // If an error occurs, log the error to the console.
                                  print(e);
                                }
                                Navigator.pushNamed(context, '/registration_3');
                              })
                        ],
                      ),
                    ),
                  ],
                ),
              ]);
            }
            return const Center(child: CircularProgressIndicator());
          }),
    );
  }
}

class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({key, @required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Display the Picture')),
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      body: Image.file(File(imagePath)),
    );
  }
}
