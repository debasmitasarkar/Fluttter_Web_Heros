import 'package:flutter_web/material.dart';
import 'package:heros_web/pages/hero_details_screen.dart';
import './hero.dart';
import '../global.dart';

class HeroScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HeroScreenState();
  }
}

class _HeroScreenState extends State<HeroScreen> {
  List<Map<String, String>> _heros = [];
  String _heroName = '';
  Widget _buildAppbar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Color(0xffCEA0E4),
      title: Text('Heros', style: TextStyle(color: Colors.white)),
    );
  }

  @override
  Widget build(BuildContext context) {
    _navigateToDetailsScreen(name, image) {
      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) {
        return HeroDetailsScreen(name: name, image: image);
      }));
    }

    _addHero() {
      Map<String, String> _hero = {
        'name': _heroName,
        'details': 'I am $_heroName',
        'image': 'spider_man.png'
      };
      _heros.add(_hero);
      setState(() {});
    }

    _showFormDialog() {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              actions: <Widget>[
                FlatButton(
                  child: Text('Add'),
                  onPressed: () {
                    _addHero();
                    Navigator.pop(context);
                  },
                )
              ],
              content: TextFormField(
                onFieldSubmitted: (value) {
                  _heroName = value;
                },
                decoration: InputDecoration(
                    labelText: 'Hero Name', hintText: 'It should be a Hero'),
              ),
            );
          });
    }

    return Scaffold(
      appBar: _buildAppbar(),
      body: SingleChildScrollView(
        child: Container(
          color: Color(0xffCEA0E4),
          height: MediaQuery.of(context).size.height - 100,
          child: StreamBuilder(
            stream: Global().getData().asStream(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                snapshot.data.addAll(_heros);
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
        onPressed: () {
          _showFormDialog();
        },
      ),
    );
  }
}
