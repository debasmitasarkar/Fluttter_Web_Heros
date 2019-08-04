import 'package:flutter_web/material.dart';

class HeroCard extends StatelessWidget {
  String name;
  String details;
  String image;
  Function onTap;
  HeroCard({this.name, this.details, this.image, this.onTap});

  final regularTextStyle = TextStyle(
      color: const Color(0xffb6b2df),
      fontSize: 9.0,
      fontWeight: FontWeight.w400);

  final subHeaderTextStyle = TextStyle(fontSize: 12.0, color: Colors.grey);

  final headerTextStyle = TextStyle(
      color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.w600);

  _buildHeroThumbnail(assetImage) {
    return Positioned(
        top: -20,
        child: Hero(
            tag: '$name',
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 16.0),
              alignment: FractionalOffset.centerLeft,
              child: Image(
                image: AssetImage(assetImage),
                height: 120.0,
                width: 120.0,
              ),
            )));
  }

  _buildHeroCardContent() {
    return Container(
      margin: EdgeInsets.fromLTRB(76.0, 16.0, 16.0, 16.0),
      constraints: BoxConstraints.expand(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 4.0),
          Text(name, style: headerTextStyle),
          SizedBox(height: 10.0),
          Text(details, style: subHeaderTextStyle),
          Container(
              margin: EdgeInsets.symmetric(vertical: 8.0),
              height: 2.0,
              width: 18.0,
              color: Color(0xff00c6ff)),
        ],
      ),
    );
  }

  _buildHeroCard() {
    return Container(
      child: _buildHeroCardContent(),
      margin: EdgeInsets.only(left: 46.0),
      decoration: BoxDecoration(
        color: Color(0xFF333366),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            offset: Offset(0.0, 10.0),
          ),
        ],
      ),
    );
  }

  _buildHeroRow() {
    return GestureDetector(
        onTap: () {
          onTap(name, image);
        },
        child: Container(
            height: 120,
            margin: const EdgeInsets.symmetric(
              vertical: 16.0,
              horizontal: 24.0,
            ),
            child: Stack(
              children: <Widget>[
                _buildHeroCard(),
                _buildHeroThumbnail('images/$image'),
              ],
            )));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: _buildHeroRow(),
    );
  }
}
