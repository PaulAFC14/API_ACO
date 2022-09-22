
import 'dart:ffi';

import 'package:aco/src/reusable/widgets/dialogs.dart';
import 'package:http/http.dart' as http;
import 'package:aco/src/reusable/methods/filters.dart';
import 'package:aco/src/reusable/widgets/input_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../reusable/methods/routes.dart';
import '../reusable/widgets/roundedButton.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final formKey = GlobalKey<FormState>();

  final userController = TextEditingController();
  final passController = TextEditingController();

  Color userColor = Color.fromARGB(255, 233, 233, 233);
  Color passColor = Color.fromARGB(255, 233, 233, 233);
  
  String user = '';
  String pass = '';

  bool emptyUser = false;
  bool emptyPass = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 25.0, vertical: 80.0),
            child: SizedBox(
              width: double.infinity,
              child: ListView(
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const <Widget>[
                          //WELCOME TEXT
                          Padding(
                            padding: EdgeInsets.only(bottom: 12.0),
                            child: Text('Welcome Back!',
                                style: TextStyle(fontSize: 24)),
                          ),
              
                          //INSTRUCTION TEXT
                          Padding(
                            padding: EdgeInsets.only(bottom: 5.0),
                            child: Text('Please sign in to your account',
                                style: TextStyle(
                                    fontSize: 27, fontWeight: FontWeight.w500)),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Form(
                        key: formKey,
                        child: Column(
                          children: <Widget>[
                            InputText()
                            .generateInputForm(context,controller: userController,hide: false, hint: 'Email or Phone Number', width: 0, 
                              color: userColor
                            ),
                            SizedBox(height: 5),
                            InputText().EmptyLabel(context, label: 'Missing email or phone', active: emptyUser),
                            SizedBox(height: 20),
                            InputText()
                            .generateInputForm(context,controller: passController,hide: true, hint: 'Password', width: 0,
                              color: passColor
                            ),
                            SizedBox(height: 5),
                            InputText().EmptyLabel(context, label: 'Missing password', active: emptyPass),
                          ],
                        )
                      ),
                      Container(
                        width: double.infinity,
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.zero,
                        child: TextButton(
                          style: TextButton.styleFrom(primary: Colors.black),
                          onPressed: (() => Routes(context).goToForgotPass()),
                          child: const Text('Forget Password?',
                              textAlign: TextAlign.right,
                              style: TextStyle(fontWeight: FontWeight.w600)),
                        ),
                      ),
                      SizedBox(height: 50,),
                      RoundedButton(
                        backgroundColor: Theme.of(context).primaryColor, 
                        color: Colors.white, txt: 'Sign in', height: 60, width: 0)
                        .TextButton(context, onPressed: goToLogin, fontSize: 18),
                      SizedBox(height: 20),
                      RoundedButton(
                        backgroundColor: Theme.of(context).primaryColorDark, 
                        color: Colors.white, txt: 'Sign in with Google', height: 60, width: 0)
                        .ImgTextButton(context, onPressed: (() => Routes(context).goToLogin()), fontSize: 18, path: 'assets/img/google.png'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text('Don´t have an Account?'),
                          TextButton(
                            style: TextButton.styleFrom(
                                primary: Theme.of(context).primaryColor),
                            onPressed: () {}, //(() => Routes(context).goToSignUp()),
                            child: Text('Sign Up', style: TextStyle(fontWeight: FontWeight.bold),),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            )));
  }

  goToLogin(){
    user = Filters().getInputValue(userController);
    pass = Filters().getInputValue(passController);

    setState(() {
      userColor = Filters().EmptyInputColor(context, user);
      passColor = Filters().EmptyInputColor(context, pass);
      emptyUser = Filters().EmptyInputLabel(user);
      emptyPass = Filters().EmptyInputLabel(pass);
    });

    List<String> colecctcion = [user, pass];
    if(Filters().checkColection(colecctcion: colecctcion)){
      login();
    }

  }

  Future<void> login() async {
    var request = http.MultipartRequest('POST', Uri.parse('https://crud.jonathansoto.mx/api/login'));
    request.fields.addAll({
      'email': user,
      'password': pass
    });


    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      MyDialog(context).SuccessfulLogin();
      
      Future.delayed(Duration(seconds: 3)).then((value) {
        Navigator.pop(context);
      });
      
    }
    else {
      print(response.reasonPhrase);
      MyDialog(context).LoginFailed();

      Future.delayed(Duration(seconds: 2)).then((value) {
        Navigator.pop(context);
      });
      
    }
  }

  

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    userController.dispose();
    passController.dispose();
  }
  
}
