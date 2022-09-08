library animated_image_list;

import 'package:flutter/material.dart';

class ImageSlider extends StatefulWidget {
  final List<String> images;
  final BoxFit? fit;
  const ImageSlider({Key? key, required this.images, this.fit = BoxFit.none})
      : super(key: key);

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider>
    with SingleTickerProviderStateMixin {
  Animation<double>? animation;
  AnimationController? animationController;
  List? images = [];
  int imageIndex = 0;

  imgIndex() {
    if (imageIndex < images!.length - 1) {
      imageIndex++;
    } else {
      imageIndex = 0;
    }
    // print("$imageIndex }");
  }

  animate() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 4));
    CurvedAnimation curve =
        CurvedAnimation(parent: animationController!, curve: Curves.linear);
    animation = Tween(begin: 0.0, end: 1.0).animate(curve)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        switch (status) {
          case AnimationStatus.completed:
            animationController!.reverse();
            Future.delayed(const Duration(milliseconds: 200)).whenComplete(() {
              imgIndex();
              imageIndex = imageIndex;
            });
            break;
          case AnimationStatus.dismissed:
            animationController!.forward();
            break;
          case AnimationStatus.forward:
            break;
          case AnimationStatus.reverse:
            break;
        }
      });
  }

  setAds() {
    setState(() {
      images = widget.images;
      animationController!.forward();
      imgIndex();
      imageIndex = imageIndex;
      // print("imageIndex $imageIndex");
    });
  }

  @override
  void initState() {
    animate();

    setAds();
    super.initState();
  }

  @override
  void dispose() {
    animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double shortestSide = MediaQuery.of(context).size.shortestSide;
    double height = MediaQuery.of(context).size.height;
    return (images!.isNotEmpty)
        ? AnimatedOpacity(
            curve: Curves.fastOutSlowIn,
            duration: const Duration(seconds: 1),
            opacity: (animationController!.value <= 0.9) ? 1 : 0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(0),
              child: Image.network(
                images![imageIndex],
                fit: widget.fit,
                loadingBuilder: loadingBuilder,
              ),
            ),
          )
        : SizedBox(
            height: (shortestSide < 550) ? shortestSide * 1 : height * 0.6,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
  }

  Widget loadingBuilder(
      BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
    if (loadingProgress == null) {
      return child;
    }
    return Center(
      child: CircularProgressIndicator(
        value: loadingProgress.expectedTotalBytes != null
            ? loadingProgress.cumulativeBytesLoaded /
                loadingProgress.expectedTotalBytes!
            : null,
      ),
    );
  }
}
