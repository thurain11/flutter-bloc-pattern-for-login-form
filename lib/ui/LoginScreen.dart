import 'package:flutter/material.dart';
import '../blocs/bloc.dart';
import '../blocs/provider.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     final bloc = Provider.of(context);

    return Container(
        margin: EdgeInsets.all(20.0),
        child: ListView(
          children: <Widget>[
            emailField(bloc),
            Container(margin: EdgeInsets.only(top: 10.0),),
            passwordField(bloc),
            Container(margin: EdgeInsets.only(top: 10.0),),
            Column(
              children: <Widget>[
                submitButton(bloc)
              ],
            )
          ],
        ),
      );
  }

  Widget emailField(Bloc bloc){
     return StreamBuilder(
       stream: bloc.email,
       builder: (context,snapshot){
        return TextField(
        decoration: InputDecoration(
          icon: Icon( Icons.person),
          labelText: 'E-Mail',
          errorText: snapshot.error
          ), 
        keyboardType: TextInputType.emailAddress,
        onChanged: bloc.changeEmail,
   );
       },
     );
  }

  Widget passwordField(Bloc bloc){
    return StreamBuilder(
      stream: bloc.password,
      builder: (context,snapshot){
        return TextField(
        decoration: InputDecoration(
          icon: Icon( Icons.lock),
          labelText: 'Password',
          errorText: snapshot.error
          ),
        obscureText: true,
        onChanged: bloc.changePassword,
   );
      },
    );
  }

  Widget submitButton(Bloc bloc){
    return StreamBuilder(
      stream: bloc.submitValidate,
      builder: (context,snapshot){
        return RaisedButton(
      child: Text("Login"),
      onPressed: snapshot.hasData ? bloc.submit  : null
        );
      },
    );
  }
}