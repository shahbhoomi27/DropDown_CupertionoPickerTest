import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'package:dropdown_dem0/Constants.dart';

class DropDownScreen extends StatelessWidget {
  DropDownScreen({this.selectedOs});

  osEnum selectedOs;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Company List"),
        ),
        body: DropDownPage(selectedOs),
      ),
    );
  }
}

class DropDownPage extends StatefulWidget {
  DropDownPage(this.selectedOs);

  osEnum selectedOs;

  @override
  _DropDownPageState createState() => _DropDownPageState();
}

class _DropDownPageState extends State<DropDownPage> {
  String _value;

  DropdownButton<String> getDropDownButton() {
    List<DropdownMenuItem<String>> itemsArr = [];
    for (String companyName in kCompanyList) {
      itemsArr.add(DropdownMenuItem<String>(
        child: Text(companyName),
        value: companyName,
      ));
    }

    return DropdownButton<String>(
      hint: Text("Select Company"),
      value: _value,
      items: itemsArr,
      onChanged: (String value) {
        setState(() {
          _value = value;
        });
      },
    );
  }


  CupertinoPicker getCupertinoPicker() {
    List<Text> itemArr = [];

    for (String companyName in kCompanyList) {
      itemArr.add(Text(companyName,style: TextStyle(color: Colors.white),));
    }
    return CupertinoPicker(
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) {
        setState(() {
          _value = kCompanyList[selectedIndex];
        });

      },
      children: itemArr,
    );
  }

  Widget getChild() {
    if (widget.selectedOs == osEnum.Android) {
      return getDropDownButton();
    } else if (widget.selectedOs == osEnum.Ios) {
      return getCupertinoPicker();
    } else {
      if (Platform.isAndroid) {
        return getDropDownButton();
      } else
        return getCupertinoPicker();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text("Selected Company is $_value.", textAlign: TextAlign.center,
          style: TextStyle(fontSize: 30,
          color: Colors.green),),
          SizedBox(
            height: 90,
          ),
          getChild(),
        ],
      ),
    );
  }
}
