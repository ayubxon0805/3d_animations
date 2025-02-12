import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

class QRScannerScreen extends StatefulWidget {
  const QRScannerScreen({super.key});
  @override
  _QRScannerScreenState createState() => _QRScannerScreenState();
}

class _QRScannerScreenState extends State<QRScannerScreen> {
  String? qrText;

  Future<void> requestMotionPermission() async {
    var status = await Permission.sensors.request();
    var status1 = await Permission.camera.request();

    if (status.isGranted) {
      print("📱 Motion sensor ruxsat berildi!");
    } else {
      print("🚫 Motion sensor ruxsat berilmadi.");
    }

    if (status1.isGranted) {
      print("📱 camer  ruxsat berildi!");
    } else {
      print("🚫 camera ruxsat berilmadi.");
    }
  }

  @override
  void initState() {
    super.initState();
    requestMotionPermission();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          MobileScanner(
            onDetect: (capture) {
              print(capture.barcodes.first);
              final List<Barcode> barcodes = capture.barcodes;
              if (barcodes.isNotEmpty) {
                final String? scannedText = barcodes.first.rawValue;
                if (scannedText != null) {
                  // print('bu scannedText == $scannedText');
                  launchUrl(Uri.parse("https://$scannedText"));
                } else {
                  Text('qr code noto\'g\'ri kiritildi');
                }
              }
            },
          ),
          if (qrText != null)
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  padding: EdgeInsets.all(10),

                  // ignore: deprecated_member_use
                  color: Colors.white.withOpacity(0.7),
                  child: Text(
                    'Scanned: $qrText',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
