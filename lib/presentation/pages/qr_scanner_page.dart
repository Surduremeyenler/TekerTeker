import 'dart:io';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:teker_teker/presentation/pages/ride_map.dart';

class QrScannerPage extends StatefulWidget {
  const QrScannerPage({Key? key}) : super(key: key);

  @override
  State<QrScannerPage> createState() => _QrScannerPageState();
}

class _QrScannerPageState extends State<QrScannerPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  bool isFlashOpen = false;
  @override
  Widget build(BuildContext context) {
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          QRView(
            key: qrKey,
            onQRViewCreated: _onQRViewCreated,
            overlay: QrScannerOverlayShape(
                borderColor: Colors.red,
                borderRadius: 10,
                borderLength: 30,
                borderWidth: 10,
                cutOutSize: scanArea),
          ),
          Positioned(
            width: MediaQuery.of(context).size.width,
            bottom: 40,
            child: Center(
              child: InkWell(
                onTap: () async {
                  try {
                    await controller?.toggleFlash();
                    setState(() {
                      isFlashOpen ? isFlashOpen = false : isFlashOpen = true;
                    });
                  // ignore: empty_catches
                  } catch (e) {}
                },
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.white,
                  child: isFlashOpen
                      ? Icon(
                          Icons.flashlight_on,
                          size: 40,
                        )
                      : Icon(
                          Icons.flashlight_off_sharp,
                          size: 40,
                        ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
        //this part mocked this will change will real bicycle id
        if (result?.code != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const RideMap()),
          );
        }
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
