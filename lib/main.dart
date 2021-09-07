import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.landscapeLeft,DeviceOrientation.landscapeRight]
  );
  runApp(Tranfor());
}

