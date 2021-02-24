import 'package:flutter/material.dart';
import 'package:flutter_app_sqlite/scr/services/scanlist_provider.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';

class ScanButton extends StatelessWidget {
  const ScanButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      key: key,
      child: Icon(Icons.search),
      onPressed: () async {
        String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
            '#42cef5', 'Cancelar', true, ScanMode.QR);

        /* final barcodeScanRes = 'http://albertoangel.dev'; */
        final scanListProvider =
            Provider.of<ScanListProvider>(context, listen: false);
        scanListProvider.newScan(barcodeScanRes);
      },
    );
  }
}
