import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palette_generator/palette_generator.dart';

import 'main_controller.dart';

main() {
  runApp(
    const MaterialApp(
      home: ImageColorGenartor(),
    ),
  );
}

class ImageColorGenartor extends StatelessWidget {
  const ImageColorGenartor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<MainController>(
        init: MainController(),
        builder: (_) {
          return SafeArea(
            child: Column(
              children: [
                Image.asset(
                  _.imageUrl,
                  height: Get.height * 0.3,
                ),
                ElevatedButton(
                  onPressed: () async => _.updatePaletteGenerator(),
                  child: const Text('Make Palette'),
                ),
                if (_.paletteGenerator != null) ...[
                  PaletteColorWidget(
                    colorName: 'Dominant',
                    controller: _,
                    paletteColor: _.paletteGenerator!.dominantColor,
                  ),
                  PaletteColorWidget(
                    colorName: 'darkMutedColor',
                    controller: _,
                    paletteColor: _.paletteGenerator!.darkMutedColor,
                  ),
                  PaletteColorWidget(
                    colorName: 'darkVibrantColor',
                    controller: _,
                    paletteColor: _.paletteGenerator!.darkVibrantColor,
                  ),
                  PaletteColorWidget(
                    colorName: 'lightMutedColor',
                    controller: _,
                    paletteColor: _.paletteGenerator!.lightMutedColor,
                  ),
                  PaletteColorWidget(
                    colorName: 'lightVibrantColor',
                    controller: _,
                    paletteColor: _.paletteGenerator!.lightVibrantColor,
                  ),
                  PaletteColorWidget(
                    colorName: 'mutedColor',
                    controller: _,
                    paletteColor: _.paletteGenerator!.mutedColor,
                  ),
                  PaletteColorWidget(
                    colorName: 'vibrantColor',
                    controller: _,
                    paletteColor: _.paletteGenerator!.vibrantColor,
                  ),
                ],
              ],
            ),
          );
        },
      ),
    );
  }
}

class PaletteColorWidget extends StatelessWidget {
  const PaletteColorWidget({
    Key? key,
    required this.controller,
    required this.colorName,
    required this.paletteColor,
  }) : super(key: key);

  final MainController controller;
  final String colorName;
  final PaletteColor? paletteColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(child: Text(colorName)),
          Expanded(
            child: Container(
              height: 30,
              color: paletteColor?.color ?? Colors.transparent,
            ),
          ),
        ],
      ),
    );
  }
}
