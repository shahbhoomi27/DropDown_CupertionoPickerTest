import 'package:flutter/material.dart';
import 'package:dropdown_dem0/DropDownScreen.dart';
import 'package:dropdown_dem0/Constants.dart';

void main() => runApp(
      MaterialApp(
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text("Select Style"),
          ),
          body: OptionPage(),
        ),
      ),
    );

class OptionPage extends StatelessWidget {
  void goDropDownScreen(BuildContext context, osEnum os) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DropDownScreen(
          selectedOs: os,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  goDropDownScreen(context, osEnum.Android);
                },
                child: Text("ANDROID"),
              ),
              SizedBox(
                height: 15,
              ),
              RaisedButton(
                onPressed: () {
                  goDropDownScreen(context, osEnum.Ios);
                },
                child: Text("IOS"),
              ),
              SizedBox(
                height: 15,
              ),
              RaisedButton(
                onPressed: () {
                  goDropDownScreen(context, osEnum.Default);
                },
                child: Text("DEFAULT"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
