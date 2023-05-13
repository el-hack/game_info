import 'dart:typed_data';
import 'package:flutter/services.dart';
Future<Uint8List> getBytesFromAsset(String path, int width) async {
  ByteData data = await rootBundle.load(path);
  Uint8List bytes = data.buffer.asUint8List();
  return bytes;
}