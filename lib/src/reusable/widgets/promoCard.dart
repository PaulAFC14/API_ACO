import 'dart:math';

import 'package:aco/src/reusable/widgets/roundedButton.dart';
import 'package:flutter/material.dart';

class PromoCard{
  late BuildContext context;
  PromoCard(this.context);

  Widget Home(double vh, double vw){
    Random random = Random();
    late int randomNumber = random.nextInt(66) + 10;

    return GestureDetector(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(2*vh)
        ),
        child: Padding(
          padding: EdgeInsets.all(3*vw),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'New collection with',
                style: TextStyle(
                  fontSize: 3*vh
                )
              ),
              SizedBox(height: .5*vh),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: 42*vw,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(height: 1.5*vh),
                          Container(
                            child: Row(
                              children: <Widget>[
                                Text(
                                  '$randomNumber',
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 4*vh,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                                Text(
                                  '% discount',
                                  style: TextStyle(
                                    fontSize: 2.75*vh,
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 1.5*vh),
                          WinRoundedButton(
                            backgroundColor: Theme.of(context).primaryColor, color: Colors.white, 
                            txt: 'Shop now', height: 2.5*vh, width: 20*vw)
                            .TextButton(context, onPressed: () {}, fontSize: 1.9*vh)
                        ],
                      ),
                    ),
                    Container(
                      width: 42*vw,
                      height: 22.9*vh,
                      color: Theme.of(context).backgroundColor,
                      child: Center(child: Text('ImageProduct'),),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        
    
      ),
    );
  }

}