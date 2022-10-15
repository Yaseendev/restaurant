import 'package:flavor/flavor_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:restaurant_app/Shared/presentation/widgets/custom_app_bar.dart';
import 'package:restaurant_app/QR/presentation/widgets/flash_button.dart';

class QRScreen extends StatefulWidget {
  const QRScreen({Key? key}) : super(key: key);

  @override
  State<QRScreen> createState() => _QRScreenState();
}

class _QRScreenState extends State<QRScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;
  bool isFlashOn = false;

  // @override
  // void reassemble() {
  //   super.reassemble();
  //   if (Platform.isAndroid) {
  //     controller!.pauseCamera();
  //   } else if (Platform.isIOS) {
  //     controller!.resumeCamera();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.appBarWithBackBttn(context, 'QR Scan'),
      body: Stack(
        children: [
          QRView(
            key: qrKey,
            onQRViewCreated: _onQRViewCreated,
            onPermissionSet: (camController, isGranted) {
              if (isGranted) camController.resumeCamera();
            },
            overlay: QrScannerOverlayShape(
              borderColor: AppColors.PRIMARY_COLOR,
              borderRadius: 12,
            ),
            overlayMargin: EdgeInsets.only(top: 35),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(height: 25.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FlashButton(
                        isFlashOn: isFlashOn,
                        onToggle: () async {
                          await controller?.toggleFlash();
                          controller?.getFlashStatus().then((isOn) {
                            setState(() {
                              isFlashOn = isOn ?? false;
                            });
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      extendBody: true,
      extendBodyBehindAppBar: true,
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    if (controller.hasPermissions) controller.resumeCamera();
    controller.scannedDataStream.listen((scanData) {
      // setState(() {
      //   result = scanData;
      // });

      print('QR result: ${scanData.code}');
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
