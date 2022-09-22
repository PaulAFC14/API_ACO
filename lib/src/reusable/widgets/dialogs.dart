import 'package:flutter/material.dart';

class MyDialog {
  late BuildContext context;
  
  MyDialog(this.context);

  Future<void> LoginFailed() async{
    return showDialog(
      context: context, 
      builder: ((context) {
        return AlertDialog(
          
          contentPadding: EdgeInsets.zero,
          iconPadding: EdgeInsets.only(top: 10),
          icon: Icon(
            Icons.error,
            size: 100,
            color: Colors.red,
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          content: Container(
            height: 80,
            decoration: BoxDecoration(
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const <Widget>[
                  Text(
                    'Login Failed',
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      })
      );
      await Future.delayed(Duration(seconds: 2));
      Navigator.pop(context);
    
    
  }

  Future<void> SuccessfulLogin() async{
    return showDialog(
      context: context, 
      builder: ((context) {
        return AlertDialog(
          
          contentPadding: EdgeInsets.zero,
          iconPadding: EdgeInsets.only(top: 10),
          icon: Icon(
            Icons.check_circle_rounded,
            size: 100,
            color: Colors.green,
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          content: Container(
            height: 80,
            decoration: BoxDecoration(
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const <Widget>[
                  Text(
                    'Successful Login',
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      })
      );
  }

  Future<void> SuccessfullySent() async{
    return showDialog(
      context: context, 
      builder: ((context) {
        return AlertDialog(
          
          contentPadding: EdgeInsets.all(10),
          iconPadding: EdgeInsets.only(top: 10),
          icon: Icon(
            Icons.send_rounded,
            size: 100,
            color: Theme.of(context).primaryColor,
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          content: Container(
            height: 80,
            decoration: BoxDecoration(
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const <Widget>[
                  Text(
                    'We have sent an email to your address, please check your mailbox',
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
        );
      })
      );
  }

}