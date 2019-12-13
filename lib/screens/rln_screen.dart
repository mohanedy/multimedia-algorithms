import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multimedia/services/rln.dart';

class RLNScreen extends StatefulWidget {
  @override
  _RLNScreenState createState() => _RLNScreenState();
}

class _RLNScreenState extends State<RLNScreen> {
  String _data = '';
  String _res = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Run-length Encoding (RLN)',
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
      if (isEncode) {
        final service = RLN(_data);
        final freq = service.encode();
        setState(() {
          _res =
              'Result organised in pairs (c,L) where c is the number/char and L is the frequency\n ' +
                  freq.toString();
        });
      } else {
        final service = RLN(_data);
        final result = service.decode();
        setState(() {
          _res = 'Result\n ' + result.toString();
        });
      }
    }
  }
}
