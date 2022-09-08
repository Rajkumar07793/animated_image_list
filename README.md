<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

It helps developers to show animated faded image list in the application

## Features

you have to pass list of images and it has property of fit for scale

## Getting started

simply call ImageSlider() and pass list of Strings url

### Show some :heart: and star the repo to support the project


## Screenshots
<img src="https://raw.githubusercontent.com/Rajkumar07793/animated_image_list/master/image.gif"/>


## Usage

```dart

import 'package:animated_image_list/animated_image_list.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

List<String> images = [
  faker.image.image(),
];

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var faker = Faker();
    String image = faker.image.image();
    images.add(
        'https://images.unsplash.com/photo-1659993890273-e56bdc2b720f?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=480&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTY2MjYzMTU4Mw&ixlib=rb-1.2.1&q=80&w=640');
    images.add(
        'https://images.unsplash.com/photo-1660335767235-9a4988cc7451?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=480&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTY2MjYzMTU2MQ&ixlib=rb-1.2.1&q=80&w=640');
    images.add(image);
    // print(image);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Animated image list',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ImageSlider(
        images: images,
      ),
    );
  }
}

```

## Additional information

I am welcoming all the contributors to add functionalities in this package

mail me if any query

Rajkumar07793@gmail.com