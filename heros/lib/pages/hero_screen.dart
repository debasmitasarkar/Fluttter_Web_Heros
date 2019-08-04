import 'package:flutter/material.dart';
import 'package:heros/pages/hero_details_screen.dart';
import './hero.dart';
import '../global.dart';

class HeroScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HeroScreenState();
  }
}

class _HeroScreenState extends State<HeroScreen> {
  Widget _buildAppbar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Color(0xffCEA0E4),
      title: Text('Heros', style: TextStyle(color: Colors.white)),
    );
  }

  @override
  Widget build(BuildContext context) {
    _navigateToDetailsScreen(image) {
      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) {
        return HeroDetailsScreen(image: image);
      }));
    }

    return Scaffold(
      appBar: _buildAppbar(),
      body: SingleChildScrollView(
        child: Container(
          color: Color(0xffCEA0E4),
          height: MediaQuery.of(context).size.height,
          child: StreamBuilder(
            stream: Global().getData().asStream(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return HeroCard(
                        onTap: _navigateToDetailsScreen,
                        name: snapshot.data[index]['name'],
                        details: snapshot.data[index]['details'],
                        image: snapshot.data[index]['image'],
                      );
                    });
              }
              return Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xffCA2C68),
        child: Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
