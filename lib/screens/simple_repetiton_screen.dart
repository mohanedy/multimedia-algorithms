import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multimedia/services/simple_repetition.dart';

class SimpleRepetitionScreen extends StatefulWidget {
  @override
  _SimpleRepetitionScreenState createState() => _SimpleRepetitionScreenState();
}

class _SimpleRepetitionScreenState extends State<SimpleRepetitionScreen> {
  String _data = '';
  String _res = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Simple Repetition',
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
                onChanged: (s) => _data = s,
                decoration: InputDecoration(
                  hasFloatingPlaceholder: true,
                  labelText: 'Enter data',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RaisedButton(
                      onPressed: () => action(true),
                      color: Colors.amber,
                      child: Text(
                        'Encode',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    RaisedButton(
                      onPressed: () => action(false),
                      color: Colors.redAccent,
                      child: Text(
                        'Decode',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                _res,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.normal,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void action(bool isEncode) {
    if (_data.isNotEmpty) {
      final service = SimpleRepetitionAlgorithm(_data);
      if (isEncode) {
        final str = service.encode();
        setState(() {
          _res = str;
        });
      } else {}
    }
  }
}
