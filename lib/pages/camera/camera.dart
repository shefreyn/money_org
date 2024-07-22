import 'dart:async';
import 'package:upi_india/upi_india.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> with WidgetsBindingObserver {
  final MobileScannerController controller = MobileScannerController(
    facing: CameraFacing.front,
    // required options for the scanner
  );
  UpiIndia upiIndia = UpiIndia();
  List<UpiApp>? apps;
  UpiApp app = UpiApp.phonePe;
  var barcode;

  late BarcodeCapture bCodes;

  @override
  void initState() {
    super.initState();
    // Start listening to lifecycle changes.
    WidgetsBinding.instance.addObserver(this);

    // Start listening to the barcode events.
    _subscription = controller.barcodes.listen(barcode);

    // Finally, start the scanner itself.
    unawaited(controller.start());

    initUPI();
  }

  @override
  Future<void> dispose() async {
    // Stop listening to lifecycle changes.
    WidgetsBinding.instance.removeObserver(this);
    // Stop listening to the barcode events.
    unawaited(_subscription?.cancel());
    _subscription = null;
    // Dispose the widget itself.
    super.dispose();
    // Finally, dispose of the controller.
    await controller.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // If the controller is not ready, do not try to start or stop it.
    // Permission dialogs can trigger lifecycle changes before the controller is ready.
    if (!controller.value.isInitialized) {
      return;
    }

    switch (state) {
      case AppLifecycleState.detached:
      case AppLifecycleState.hidden:
      case AppLifecycleState.paused:
        return;
      case AppLifecycleState.resumed:
        // Restart the scanner when the app is resumed.
        // Don't forget to resume listening to the barcode events.
        _subscription = controller.barcodes.listen(barcode);

        unawaited(controller.start());
      case AppLifecycleState.inactive:
        // Stop the scanner when the app is paused.
        // Also stop the barcode events subscription.
        unawaited(_subscription?.cancel());
        _subscription = null;
        unawaited(controller.stop());
    }
  }

  Future<String> createOrder(String upiID) async {
    // UPIDetails upiDetails = UPIDetails(upiID: upiID, payeeName: upiID);
    // UPIPaymentQRCode(upiDetails: upiDetails);
    return '';
  }

  initUPI() async {
    await upiIndia.getAllUpiApps(mandatoryTransactionId: false).then((value) {
      setState(() {
        apps = value;
      });
    }).catchError((e) {
      apps = [];
    });
  }

  Future<UpiResponse> initiateTransaction(
      UpiApp app, String upiId, String name) async {
    return upiIndia.startTransaction(
      app: app,
      receiverUpiId: upiId.trim(),
      receiverName: name,
      transactionRefId: '',
      transactionNote: '',
      amount: 1000.00,
      flexibleAmount: true,
    );
  }

  StreamSubscription<Object?>? _subscription;
  @override
  Widget build(BuildContext context) {
    return MobileScanner(
      controller: controller,
      onDetect: (barcodes) {
        bCodes = barcodes;

        String upiID = bCodes.barcodes[0].rawValue.toString();
        List<String> values = upiID.split('&');
        String vpa = values[0].replaceAll("upi://pay?pa=", '');
        String name = values[1].replaceAll('pn=', '').replaceAll('%20', ' ');
        // upiIndia.startTransaction(app: app, receiverUpiId: receiverUpiId, receiverName: receiverName, transactionRefId: transactionRefId);
        initiateTransaction(app, vpa, name);
      },
    );
  }
}
