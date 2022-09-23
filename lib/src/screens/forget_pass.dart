import 'package:aco/src/reusable/methods/filters.dart';
import 'package:aco/src/reusable/methods/routes.dart';
import 'package:aco/src/reusable/widgets/input_text.dart';
import 'package:aco/src/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;

import '../reusable/widgets/Win/dialogs.dart';
import '../reusable/widgets/Win/roundedButton.dart';

class ForgetPassScreen extends StatefulWidget {
  const ForgetPassScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPassScreen> createState() => _ForgetPassScreenState();
}

class _ForgetPassScreenState extends State<ForgetPassScreen> {
  final formKey = GlobalKey<FormState>();

  final mailController = TextEditingController();
  Color mailColor = Color.fromARGB(255, 233, 233, 233);
  String mail = '';
  bool empty = false;

  @override
  Widget build(BuildContext context) {
    double wd = MediaQuery.of(context).size.width;
    wd = wd - 50;

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white10,
          leading: IconButton(
            onPressed: (() => Routes(context).goToLogin()),
            icon: const Icon(Icons.arrow_back_ios),
            color: Colors.black,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
          child: ListView(
            children: <Widget>[
              Container(
                width: wd * (.6),
                height: wd * (.6),
                margin: EdgeInsets.symmetric(horizontal: wd * (.2)),
                child: Image.asset(
                  'assets/img/forgot_guy.png',
                ),
              ),
              const SizedBox(height: 25),
              const Text(
                'Forget password?',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),
              ),
              const SizedBox(height: 15),
              const Text(
                'Don´t worry! it happens. Please enter the address associated with your account',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 50),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    InputText().generateInputForm(context,
                        controller: mailController,
                        hide: false,
                        hint: 'Email',
                        width: 0,
                        color: mailColor),
                    SizedBox(height: 5),
                    InputText().EmptyLabel(context,
                        label: 'Missing email', active: empty)
                  ],
                ),
              ),
              SizedBox(height: 50),
              WinRoundedButton(
                      backgroundColor: Theme.of(context).primaryColor,
                      color: Colors.white,
                      txt: 'Submit',
                      height: 60,
                      width: 0)
                  .TextButton(context, onPressed: submit, fontSize: 16)
            ],
          ),
        ));
  }

  submit() {
    mail = Filters().getInputValue(mailController);

    setState(() {
      mailColor = Filters().EmptyInputColor(context, mail);
      empty = Filters().EmptyInputLabel(mail);
    });

    List<String> colecctcion = [mail];
    if (Filters().checkColection(colecctcion: colecctcion)) {
      send();
    }
  }

  Future<void> send() async {
    var request = http.MultipartRequest(
        'POST', Uri.parse('https://crud.jonathansoto.mx/api/forgot-password'));
    request.fields.addAll({'email': mail});

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      WinDialog(context).SuccessfullySent();
    } else {
      print(response.reasonPhrase);
    }
  }
}
