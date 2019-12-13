import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multimedia/services/lzw.dart';

class LZWCodingScreen extends StatefulWidget {
  @override
  _LZWCodingScreenState createState() => _LZWCodingScreenState();
}

class _LZWCodingScreenState extends State<LZWCodingScreen> {
  final _numOfVariablesController = TextEditingController();
  String _res = '';
  int numOfVar = 0;
  Map<String, dynamic> _map;

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
          'LZW Compression',
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
                    RaisedButton(
                      color: Colors.red,
                      onPressed: () => action(false),
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
              DataTable(
                onSelectAll: null,
                columns: generateColumns(),
                rows: generateRows(),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  _res,
                  style: TextStyle(fontSize: 19),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  List<DataRow> generateRows() {
    List<DataRow> rows = [];

    if (_map != null && _map.isNotEmpty) {
      List<String> symbols = _map['sym'];

      List<int> codes = _map['code'];
      for (int i = 0; i < symbols.length; i++) {
        List<DataCell> cells = [];
        cells.add(DataCell(Text(symbols[i])));
        cells.add(DataCell(Text(codes[i].toString())));
        rows.add(DataRow(cells: cells));
      }
    }
    return rows;
  }

  List<DataColumn> generateColumns() {
    List<DataColumn> columns = [];

    columns.add(DataColumn(label: Text('Symbol')));
    columns.add(DataColumn(label: Text('Output Code')));
    return columns;
  }

  void action(bool isEncode) {
    setState(() {
      _res = '';
    });
    if (_numOfVariablesController.text != null &&
        _numOfVariablesController.text.isNotEmpty) {
      if (isEncode) {
        final service = LZW(_numOfVariablesController.text);
        _map = service.encode();
        setState(() {
//          _frequencyMap = service.frequencyMap;
//          _map = service.codeMap;
        });
      } else {
        final service = LZW(_numOfVariablesController.text);
        _map = service.decode();
        _res = _map['res'];
        setState(() {
//          _frequencyMap = service.frequencyMap;
//          _map = service.codeMap;
        });
      }
    }
  }
}
