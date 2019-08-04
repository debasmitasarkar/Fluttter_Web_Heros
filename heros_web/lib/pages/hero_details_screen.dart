import 'package:flutter_web/material.dart';

class HeroDetailsScreen extends StatelessWidget {
  String name;
  String image;
  HeroDetailsScreen({this.name, this.image});

  _buildHeroImage() {
    return Hero(
        tag: '$name',
        child: Image.asset('images/$image', height: 200, width: 180));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Container(
          color: Color(0xffCEA0E4),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: _buildHeroImage(),
        ));
  }
}
