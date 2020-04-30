import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class Carousel extends StatelessWidget {
  final String placeholder = 'http://via.placeholder.com/288x188';
  final List<Map> list;
  final int length;

  Carousel({this.list, this.length = 0});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 270,
      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          var item = list[index];
          return Stack(
            children: [
              Container(
                height: 240,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: item['image'] != null
                      ? Image.asset(
                          'lib/assets/${item['image']}',
                          fit: BoxFit.cover,
                        )
                      : Image.network(
                          placeholder,
                          fit: BoxFit.cover,
                        ),
                ),
              ),
              Positioned(
                child: Text(
                  '${item['type']}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
                left: 25,
                bottom: 30,
              )
            ],
          );
        },
        itemCount: length,
        loop: false,
        viewportFraction: 0.65,
        scale: 0.9,
      ),
    );
  }
}
