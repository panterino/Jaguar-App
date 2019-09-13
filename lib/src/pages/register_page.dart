import 'package:flutter/material.dart';
import 'package:jaguar/src/bloc/provider.dart';
import 'package:jaguar/src/providers/user_provider.dart';
import 'package:jaguar/src/utils/utils.dart';

class RegisterPage extends StatelessWidget {
  final usuarioProvider = UsuarioProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[_createBckground(context), _loginForm(context)],
    ));
  }

  Widget _loginForm(BuildContext context) {
    final bloc = Provider.of(context);
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SafeArea(
            child: Container(
              height: 200.0,
            ),
          ),
          Container(
            width: size.width * 0.85,
            padding: EdgeInsets.symmetric(vertical: 20.0),
            margin: EdgeInsets.symmetric(vertical: 20.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.0),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 3.0,
                      offset: Offset(0.0, 5.0),
                      spreadRadius: 3.0)
                ]),
            child: Column(
              children: <Widget>[
                Text(
                  'Crear nueva cuenta',
                  style: TextStyle(fontSize: 20.0),
                ),
                SizedBox(height: 30.0),
                _createEmailField(bloc),
                SizedBox(height: 20.0),
                _createPasswordField(bloc),
                SizedBox(height: 30.0),
                _createSubmitButton(bloc)
              ],
            ),
          ),
          FlatButton(
            child: Text('Ya tengo cuenta', style: TextStyle(color: Colors.white),),
            onPressed: () => Navigator.pushReplacementNamed(context, 'login'),
          ),
          SizedBox(height: 100.0),
        ],
      ),
    );
  }

  Widget _createEmailField(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.emailStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                icon: Icon(
                  Icons.alternate_email,
                  color:  Color(0xff4863FF),
                ),
                hintText: 'mail@example.com',
                labelText: 'Ingresa tu correo',
                counterText: snapshot.data,
                errorText: snapshot.error),
            onChanged: bloc.changeEmail,
          ),
        );
      },
    );
  }

  Widget _createPasswordField(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.passwordStream,
      builder: (context, snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
                icon: Icon(
                  Icons.lock_outline,
                  color:  Color(0xff4863FF),
                ),
                labelText: 'Ingresa tu contraseña',
                //counterText: snapshot.data,
                errorText: snapshot.error),
            onChanged: bloc.changePassword,
          ),
        );
      },
    );
  }

  Widget _createSubmitButton(LoginBloc bloc) {
    return StreamBuilder<Object>(
        stream: bloc.formValidStream,
        builder: (context, snapshot) {
          return RaisedButton(
            onPressed: snapshot.hasData ? () => _register(bloc, context) : null,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
              child: Text('Registrarme'),
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
            elevation: 0.0,
            color:  Color(0xff4863FF),
            textColor: Colors.white,
          );
        });
  }

  _register(LoginBloc bloc, BuildContext context) async {
    Map info = await usuarioProvider.newUser(bloc.email, bloc.password);
    if (info['ok']) {
      Navigator.pushNamed(context, 'home');
    } else {
      showAlert(context, info['message']);
    }
  }

  Widget _createBckground(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final background = Container(
      height: size.height,
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: <Color>[
         Color(0xff4863FF),
         Color(0xff4863FF),
      ])),
    );

    final squareRounded = Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Color.fromRGBO(255, 255, 255, .05)),
    );

    return Stack(
      children: <Widget>[
        background,
        Positioned(top: 90.0, left: 30.0, child: squareRounded),
        Positioned(top: -40.0, right: -30.0, child: squareRounded),
        Positioned(top: -50.0, left: 100.0, child: squareRounded),
        Positioned(
            top: 250.0,
            left: -20.0,
            child: Transform.rotate(angle: 12.0, child: squareRounded)),
        Positioned(top: 250.0, right: -20.0, child: squareRounded),
        Container(
          padding: EdgeInsets.only(top: 60.0),
          child: Column(
            children: <Widget>[
              Text(
                'Jaguar',
                style: TextStyle(
                    fontFamily: 'Moderna', color: Colors.white, fontSize: 60),
              ),
              SizedBox(
                height: 8.0,
                width: size.width,
              ),
              Text(
                'Únete',
                style: TextStyle(color: Colors.white, fontSize: 25.0),
              )
            ],
          ),
        )
      ],
    );
  }
}
