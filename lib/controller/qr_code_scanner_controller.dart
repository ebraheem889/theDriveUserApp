import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QrCodeScannerController extends GetxController implements GetxService {
  bool _canProcess = true;
  bool _isBusy = false;
  bool _isDetect = false;

  String? _name;
  String? _phone;
  String? _type;
  String? _image;

  String? get name => _name;
  String? get phone => _phone;
  String? get type => _type;
  String? get image => _image;
  String? _transactionType;
  String? get transactionType => _transactionType;

  // Future<void> processImage(InputImage inputImage) async {
  //   print('transaction type : $_transactionType');
  //   final BarcodeScanner _barcodeScanner = BarcodeScanner();
  //   if (!_canProcess) return;
  //   if (_isBusy) return;
  //   _isBusy = true;

  //   final barcodes = await _barcodeScanner.processImage(inputImage);
  //   if (inputImage.inputImageData?.size != null &&
  //       inputImage.inputImageData?.imageRotation != null) {
  //     for (final barcode in barcodes) {
  //       print('barcode row value : ${barcode.rawValue}');
  //       // _name = jsonDecode(barcode.rawValue!)['name'];
  //       // _phone = jsonDecode(barcode.rawValue!)['phone'];
  //       // _type = jsonDecode(barcode.rawValue!)['type'];
  //       // _image = jsonDecode(barcode.rawValue!)['image'];
  //       // if (_name != null &&
  //       //     _phone != null &&
  //       //     _type != null &&
  //       //     _image != null) {}
  //     }
  //   } else {}
  //   _isBusy = false;
  // }

}
