import 'package:flutter/cupertino.dart';
import 'package:shimmer/shimmer.dart';

class HomeEventLoading extends StatelessWidget {
  const HomeEventLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Color.fromRGBO(255, 255, 255, 0.5),
        highlightColor: Color.fromRGBO(255, 255, 255, 0.8),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 320,
                height: 188,
                decoration: BoxDecoration(
                  color: Color(0x27FFFFFF),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ],
        ));
  }
}
