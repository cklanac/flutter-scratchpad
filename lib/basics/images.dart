import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:transparent_image/transparent_image.dart';

// Requires packages in pubspec.yaml
// dependencies:
//   transparent_image:
//   cached_network_image:

void main() {
  runApp(MaterialApp(
    title: 'Images Basics',
    home: ImageDemos(),
  ));
}

class ImageDemos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Demo"),
      ),
      body: Center(
        child: ListView(
          children: [
            // Local image asset
            // requires configuring pubspec.yaml
            // flutter:
            //   assets:
            //     - assets/   # Add all images in assets folder;
            Text('Image.asset'),
            Image.asset('assets/5-250x250.jpg'),

            // Network Image
            Text('Image.network'),
            Image.network(
                'https://i.picsum.photos/id/4/250/250.jpg?hmac=Iq_fT8GfNppnAwtFci4Tr49Zv4su-vwSTCgk-RMteQc'),

            Text('CachedNetworkImage'),
            CachedNetworkImage(
              imageUrl: 'https://picsum.photos/250?image=6',
            ),

            // FadeInImage using 'transparent_image' package
            Text('FadeInImage.memoryNetwork'),
            FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: 'https://picsum.photos/250?image=9',
            ),

            // FadeInImage using local asset
            Text('FadeInImage.assetNetwork'),
            FadeInImage.assetNetwork(
                placeholder: 'assets/circular_progress_indicator_small.gif',
                image: 'https://picsum.photos/250?image=7'),
          ],
        ),
      ),
    );
  }
}
