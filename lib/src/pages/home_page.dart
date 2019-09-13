import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jaguar/src/bloc/provider.dart';

/*class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    /*return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Jaguar', style: TextStyle(fontFamily: 'Moderna'),),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Email: ${bloc.email}'),
          Divider(),
          Text('Password: ${bloc.password}'),
        ],
      ),
    );*/
    return CupertinoApp(
      
    );
  }
}
*/
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          backgroundColor: CupertinoColors.lightBackgroundGray,
          //activeColor: CupertinoColors.activeGreen,
          //inactiveColor: CupertinoColors.black,
          items: [
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.home), title: Text('Inicio')),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.settings), title: Text('Acerca de'))
          ],
        ),
        tabBuilder: (context, index) {
          return CupertinoTabView(
            builder: (context) {
              switch (index) {
                case 0:
                  return CupertinoPageExampleOne();
                  break;
                case 1:
                  return CupertinoPageExampleTwo();
                  break;
                default:
                  return Container();
              }
            },
          );
        },
      ),
    );
  }
}

class CupertinoPageExampleOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: <Widget>[
          CupertinoSliverNavigationBar(
            largeTitle: Text('Aprende'),
            trailing: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  'Bienvenido ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(bloc.email)
              ],
            ),
            //middle: Text('Welcome Home'),
          ),
          SliverPadding(
            padding: MediaQuery.of(context)
                .removePadding(
                    removeTop: true, removeLeft: true, removeRight: true)
                .padding,
            sliver: SliverList(
                delegate: SliverChildListDelegate(
              [
                _featuredCourses(context),
                //Container(color: Colors.purple, height: 150.0),
                //Container(color: Colors.green, height: 150.0),
              ],
            )),
          )
        ],
      ),
    );
  }

  Widget _featuredCourses(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        height: 260.0,
        width: size.width,
        child: PageView(
          controller: PageController(viewportFraction: 0.40),
          children: <Widget>[
            _featuredCourseCard(context, 'Aprende Java',
                'https://www.muylinux.com/wp-content/uploads/2017/09/java.png'),
            _featuredCourseCard(context, 'Aprende JavaScrpt',
                'https://miro.medium.com/max/785/1*tPxRxw3EECtw9arNtY_2IQ.png'),
            _featuredCourseCard(context, 'Aprende CSS',
                'https://hostproton.com/hosting/media/2018/04/Utilidades-CSS-A%C3%B1adir-Modificar-CSS-Animaciones-CSS.jpg'),
            _featuredCourseCard(context, 'Aprende HTML',
                'https://www.plasticwebs.com/plastic/stock/Post/7-image/7-image_web.jpg'),
            _featuredCourseCard(context, 'Aprende Git',
                'https://i.blogs.es/672fa7/git-logo/1366_2000.png'),
          ],
        ),
      ),
    );
  }

  Widget _featuredCourseCard(context, title, image) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 25.0, horizontal: 5.0),
      elevation: 15,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Image(
              image: NetworkImage(image),
              fit: BoxFit.cover,
            ),
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.subtitle,
          ),
          SizedBox(
            height: 5.0,
          ),
          CupertinoButton.filled(
            minSize: 5.0,
            padding: EdgeInsets.symmetric(vertical: 3.0, horizontal: 15.0),
            child: Text('Ver'),
            onPressed: () {},
          ),
          SizedBox(
            height: 5.0,
          ),
        ],
      ),
    );
  }
}

class CupertinoPageExampleTwo extends StatefulWidget {
  @override
  _CupertinoPageExampleTwoState createState() =>
      _CupertinoPageExampleTwoState();
}

class _CupertinoPageExampleTwoState extends State<CupertinoPageExampleTwo> {
  double _value = 50.0;
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Acerca de"),
        //trailing: Icon(CupertinoIcons.back),
        //leading: Icon(CupertinoIcons.battery_full),
      ),
      child: SingleChildScrollView(
        padding: EdgeInsets.only(top: 50.0, left: 15.0, right: 15.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                'Jaguar',
                style: TextStyle(
                    fontFamily: 'Moderna', color: Colors.black, fontSize: 60),
              ),
              Text(
                  'Jaguar es una plataforma WEB y móvil para al aprendizaje en el campo de la programación ya que se prende ser un complemento, una guía teórica y práctica para todos los usuarios.La idea principal del proyecto viene de la actual necesidad de adquirir conocimientos tecnológicos por parte de muchos adultos, pero, sobre todo por parte de los niños y adolescentes que se encuentran en una etapa escolar. Aunque este proyecto va principalmente enfocado en aquellas personas (sin importar su edad), que se sientan atraídas por el mundo de la programación y también para quienes actualmente están empezando sus estudios en este campo.', style: Theme.of(context).textTheme.body1,),
              Image(
                image: AssetImage('assets/images/mascota.png'),
                width: 250.0,
              )
              /*CupertinoButton(
                child: Text('button'),
                onPressed: () {},
                //color: CupertinoColors.activeBlue,
              ),
              CupertinoSlider(
                value: _value,
                min: 0.0,
                max: 100.0,
                onChanged: (double value) {
                  setState(() {
                    _value = value;
                  });
                },
                //activeColor: Colors.orange,
              )*/
            ],
          ),
        ),
      ),
    );
  }
}
