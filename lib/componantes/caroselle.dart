// ignore_for_file: non_constant_identifier_names

import 'package:amoi/componantes/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

Widget CAROUSEL(BuildContext context, CarouselController controler,
    List<Widget> listItems, double height, getCurrentIndex) {
  return CarouselSlider(
    carouselController: controler,
    options: CarouselOptions(
      scrollPhysics: const NeverScrollableScrollPhysics(),
      height: height,
      enlargeCenterPage: true,
      enableInfiniteScroll: false,
      viewportFraction: 1,
      initialPage: 0,
      onPageChanged: (index, reason) {
        getCurrentIndex(index);
      },
    ),
    items: listItems.map((i) {
      return Builder(
        builder: (BuildContext context) {
          return Container(
              decoration: const BoxDecoration(color: Colors.transparent),
              child: i);
        },
      );
    }).toList(),
  );
}

// =========================================

Widget CAROUSEL_BOITE(BuildContext context, CarouselController controler,
    List<Widget> listItems, getCurrentIndex, double height, int currentIndex) {
  return Column(
    children: [
      CarouselSlider(
        carouselController: controler,
        options: CarouselOptions(
          height: height,
          enlargeCenterPage: true,
          enableInfiniteScroll: true,
          viewportFraction: 1,
          initialPage: 0,
          pageSnapping: true,
          onPageChanged: (index, reason) {
            getCurrentIndex(index);
          },
        ),
        items: listItems.map((i) {
          return Builder(
            builder: (BuildContext context) {
              return SizedBox(
                  width: double.maxFinite,
                  height: double.maxFinite,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 15, 20, 20),
                    child: Material(
                        elevation: 10,
                        color: colorWhite,
                        shadowColor: colorPrimaryShadow,
                        borderRadius: BorderRadius.circular(20),
                        child: i),
                  ));
            },
          );
        }).toList(),
      ),
      SizedBox(
        height: 0,
        child: AnimatedSmoothIndicator(
          activeIndex: currentIndex,
          count: listItems.length,
          effect: WormEffect(
              dotWidth: 10,
              dotHeight: 10,
              dotColor: colorSecondary,
              activeDotColor: colorPrimary),
        ),
      )
    ],
  );
}
