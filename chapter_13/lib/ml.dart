import 'dart:io';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:firebase_mlkit_language/firebase_mlkit_language.dart';

class MLHelper {
  Future<String> textFromImage(File image) async {
    final FirebaseVision vision = FirebaseVision.instance;
    final FirebaseVisionImage visionImage = FirebaseVisionImage.fromFile(image);
    TextRecognizer recognizer = vision.textRecognizer();
    final results = await recognizer.processImage(visionImage);
    return results.text;
  }

  Future<String> readBarcode(File image) async {
    String result = '';
    final FirebaseVision vision = FirebaseVision.instance;
    final FirebaseVisionImage visionImage = FirebaseVisionImage.fromFile(image);
    BarcodeDetector detector = vision.barcodeDetector();
    try {
      List<Barcode> results = await detector.detectInImage(visionImage);
      results.forEach((Barcode barcode) {
        result += barcode.displayValue + '\n';
      });
    } catch (error) {
      print(error.toString());
    }
    return result;
  }

  Future<String> labelImage(File image) async {
    String result = '';
    final FirebaseVision vision = FirebaseVision.instance;
    final FirebaseVisionImage visionImage = FirebaseVisionImage.fromFile(image);
    ImageLabeler labeler = vision.imageLabeler();
    try {
      List<ImageLabel> labels = await labeler.processImage(visionImage);
      labels.forEach((label) {
        result += label.text +
            ' - Confidence ' +
            (label.confidence * 100).toString() +
            '%\n';
      });
    } catch (error) {
      print(error.toString());
    }

    return result;
  }

  Future<String> faceRecognition(File image) async {
    String result = '';
    final FirebaseVision vision = FirebaseVision.instance;
    final FirebaseVisionImage visionImage = FirebaseVisionImage.fromFile(image);
    FaceDetector detector = vision.faceDetector(const FaceDetectorOptions(
        enableClassification: true,
        enableLandmarks: true,
        enableTracking: true,
        mode: FaceDetectorMode.accurate));
    try {
      List<Face> results = await detector.processImage(visionImage);
      int count = results.length;
      result = 'There are $count face(s) in your picture \n';
      int num = 1;
      results.forEach((Face face) {
        result += 'Face #$num: \n';
        result += 'Smiling: ${face.smilingProbability * 100}% \n';
        result += 'Left Eye Open: ${face.leftEyeOpenProbability * 100}% \n';
        result += 'Right Eye Open: ${face.rightEyeOpenProbability * 100}% \n';
      });
    } catch (error) {
      print(error.toString());
    }
    return result;
  }

  Future<String> identifyLanguage(String text) async {
    String result = '';
    final language = FirebaseLanguage.instance;
    final identifier = language.languageIdentifier();
    List<LanguageLabel> languages;

    try {
      languages = await identifier.processText(text);
      languages.forEach((LanguageLabel label) {
        result +=
            'Language: ${label.languageCode} - Confidence: ${label.confidence * 100}% \n';
      });
    } catch (error) {
      print(error.toString());
    }
    return result;
  }
}
