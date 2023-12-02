import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImageSlider extends StatefulWidget {
  const ImageSlider({super.key});

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
   List imageList = [
    {"id": 1, "imagepath": 'assets/images/pic1.png'},
    {"id": 2, "imagepath": 'assets/images/pic2.png'},
    {"id": 3, "imagepath": 'assets/images/pic3.png'},
    {"id": 4, "imagepath": 'assets/images/pic4.png'},
  ];

  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
              children: [
                InkWell(
                  onTap: () {
                    debugPrint(currentIndex.toString());
                  },
                  child: SizedBox(
                    width: 410,
                    height: 182,
                    child: CarouselSlider(
                      items: imageList
                          .map(
                            ((item) => Image.asset(
                                  item['imagepath'],
                                  fit: BoxFit.contain,
                                  width: double.infinity,
                                )),
                          )
                          .toList(),
                      carouselController: carouselController,
                      options: CarouselOptions(
                          scrollPhysics: const BouncingScrollPhysics(),
                          autoPlay: true,
                          aspectRatio: 2,
                          viewportFraction: 1,
                          onPageChanged: (index, reason) {
                            setState(() {
                              currentIndex = index;
                            });
                          }),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 8,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: imageList.asMap().entries.map((entry) {
                      print(entry);
                      print(entry.key);
                      return GestureDetector(
                        onTap: () =>
                            carouselController.animateToPage(entry.key),
                        child: Container(
                          width: currentIndex == entry.key ? 17 : 7,
                          height: 7.0,
                          margin: const EdgeInsets.symmetric(horizontal: 3.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: currentIndex == entry.key
                                  ? Colors.black
                                  : Colors.teal),
                        ),
                      );
                    }).toList(),
                  ),
                )
              ],
            );
  }
}