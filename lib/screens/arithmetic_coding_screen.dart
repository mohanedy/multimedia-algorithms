import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multimedia/services/arithmetic_coding.dart';

class ArithmeticCodingScreen extends StatefulWidget {
  @override
  _ArithmeticCodingScreenState createState() => _ArithmeticCodingScreenState();
}

class _ArithmeticCodingScreenState extends State<ArithmeticCodingScreen> {
  final _numOfVariablesController = TextEditingController();
  String _res = '';
  int numOfVar = 0;
  Map<String, List<double>> _map = {};
  LinkedHashMap _frequencyMap;

  @override
  void dispose() {
    _numOfVariablesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Arithmetic Coding',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              TextField(
                controller: _numOfVariablesController,
                decoration: InputDecoration(
                  hasFloatingPlaceholder: true,
                  labelText: 'Enter Code',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RaisedButton(
                      color: Colors.amber,
                      onPressed: () => action(true),
                      child: Text(
                        'Encode',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ListView.separated(
                  itemBuilder: (context, index) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Flexible(
                          child: Text(
                            _map.keys.toList()[index],
                            style: TextStyle(
                              fontSize: 19,
                            ),
                          ),
                        ),
                        Flexible(
                          child: Text(
                            _map[_map.keys.toList()[index]].toString(),
                            style: TextStyle(
                              fontSize: 19,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                  physics: ClampingScrollPhysics(),
                  separatorBuilder: (context, index) {
                    return Divider();
                  },
                  shrinkWrap: true,
                  itemCount: _map.keys.length)
            ],
          ),
        ),
      ),
    );
  }

  void action(bool isEncode) {
    if (_numOfVariablesController.text != null &&
        _numOfVariablesController.text.isNotEmpty) {
      if (isEncode) {
        final service = ArithmeticCoding(_numOfVariablesController.text);
        setState(() {
          _map = service.ranges;
        });
      }
    }
  }
}
