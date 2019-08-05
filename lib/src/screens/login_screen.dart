import 'package:flutter/material.dart';
import 'package:login_bloc_flutter/src/blocs/bloc.dart';
import 'package:login_bloc_flutter/src/blocs/provider.dart';

class LoginScreen extends StatelessWidget{
  build(context){
    final bloc = Provider.of(context);

    return Container(
      margin: EdgeInsets.all(20.0),
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          emailField(bloc),
          passwordField(bloc),
          Container(margin: EdgeInsets.only(top: 25.0),),
          submitButton(bloc),
        ],
      ),
    );
  }

  Widget emailField(Bloc bloc) {
    return StreamBuilder(
        stream: bloc.email,
        builder: (context, snapshot) {
          return TextField(
            onChanged: bloc.changeEmail,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                labelText: 'Email Address',
                hintText: 'email@example.com',
                errorText: snapshot.error
            ),
          );
        }
    );
  }

  Widget passwordField(Bloc bloc){
    return StreamBuilder(
      stream: bloc.password,
      builder: (context, snapshot) {
        return TextField(
          onChanged: bloc.changePassword,
          obscureText: true,
          decoration: InputDecoration(
              labelText: 'Password',
              hintText: '*********',
              errorText: snapshot.error
          ),
        );
      },
    );
  }

  Widget submitButton(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.submitValid,
      builder: (context, snapshot){
        return RaisedButton(
          color: Colors.blue,
          child: Text('Submit'),
          onPressed: snapshot.hasData
              ? bloc.submit
          : null,
        );
      },
    );
  }
}