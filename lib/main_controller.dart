import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palette_generator/palette_generator.dart';

class MainController extends GetxController {
  String _imageUrl = 'assets/4.png';
  PaletteGenerator? _paletteGenerator;

  Future<PaletteGenerator> updatePaletteGenerator() async {
    return paletteGenerator = await PaletteGenerator.fromImageProvider(
      Image.asset(imageUrl).image,
    );
  }

  String get imageUrl => _imageUrl;
  set imageUrl(String value) => {_imageUrl = value, update()};
  PaletteGenerator? get paletteGenerator => _paletteGenerator;
  set paletteGenerator(PaletteGenerator? paletteGenerator) {
    _paletteGenerator = paletteGenerator;
    update();
  }
}
