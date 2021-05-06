import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import './picture.dart';

class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  List<CameraDescription> cameras;
  List<Widget> cameraButtons;
  CameraDescription activeCamera;
  CameraController cameraController;
  CameraPreview preview;

  Image image;

  @override
  void initState() {
    listCameras().then((result) {
      setState(() {
        cameraButtons = result;
        setCameraController();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // final deviceRatio = size.width / size.height;

    // Transform scaledPreview = Transform.scale(
    //   scale: (cameraController == null)
    //       ? 1
    //       : (cameraController.value.isInitialized)
    //           ? 1.2 //(cameraController.value.aspectRatio / deviceRatio) /4
    //           : 1,
    //   child: preview,
    // );

    return Scaffold(
      appBar: AppBar(
        title: Text('Camera View'),
      ),
      body: Container(
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: cameraButtons ??
                  [Container(child: Text('No cameras available'))],
            ),
            Container(height: size.height / 2, child: preview) ?? Container(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    child: Text('Take Picture'),
                    onPressed: () {
                      if (cameraController != null) {
                        takePicture().then((dynamic picture) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      PictureScreen(picture)));
                        });
                      }
                    })
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }

  Future<List<Widget>> listCameras() async {
    List<Widget> buttons = [];
    cameras = await availableCameras();
    if (cameras == null) return null;

    if (activeCamera == null) activeCamera = cameras.first;
    if (cameras.length > 0) {
      for (CameraDescription camera in cameras) {
        buttons.add(ElevatedButton(
            onPressed: () {
              setState(() {
                activeCamera = camera;
                setCameraController();
              });
            },
            child: Row(
              children: [
                Icon(Icons.camera_alt),
                Text(camera == null ? '' : camera.name)
              ],
            )));
      }
      return buttons;
    } else {
      return [];
    }
  }

  Future setCameraController() async {
    if (activeCamera == null) return;
    cameraController =
        CameraController(activeCamera, ResolutionPreset.veryHigh);
    await cameraController.initialize();
    setState(() {
      preview = CameraPreview(
        cameraController,
      );
    });
  }

  Future takePicture() async {
    if (!cameraController.value.isInitialized) {
      return null;
    }
    if (cameraController.value.isTakingPicture) {
      return null;
    }
    try {
      await cameraController.setFlashMode(FlashMode.off);
      XFile picture = await cameraController.takePicture();
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => PictureScreen(picture)));
    } catch (exception) {
      print(exception.toString());
    }
  }

}
