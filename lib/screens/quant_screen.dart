import 'package:flutter/material.dart';
import 'package:multimedia/services/quantization.dart';

class QuantizationScreen extends StatefulWidget {
  @override
  _QuantizationScreenState createState() => _QuantizationScreenState();
}

class _QuantizationScreenState extends State<QuantizationScreen> {
  String _samples = '';
  String _bitsNumber = '';
  String data = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Quantization Algorithm',
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
                onChanged: (s) => _samples = s,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hasFloatingPlaceholder: true,
                  labelText: 'Enter samples sperated by comma ( , )',
                ),
              ),
              TextField(
                onChanged: (s) => _bitsNumber = s,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hasFloatingPlaceholder: true,
                  labelText: 'Number of bits/sample',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  onPressed: onButtonPressed,
                  color: Colors.amber,
                  child: Text(
                    'Calculate !',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Text(
                data,
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

  void onButtonPressed() {
    if (_samples.isNotEmpty && _bitsNumber.isNotEmpty) {
      final samplesNumbers = _samples.split(',').map(double.parse).toList();
      final bits = int.parse(_bitsNumber);
      final service = QuantizationService(bits, samplesNumbers);
      final binary = service.quantize();
      final error = service.calculateError();
      setState(() {
        data = 'Step 1) Sorting Samples\n' +
            service.sortedSamples.toString() +
            '\n\nStep 2) Calculating variables\nNumber of levels=' +
            service.levels.toString() +
            '\nRange = ' +
            service.range.toString() +
            '\nDelta =' +
            service.delta.toString() +
            '\n\nStep 3) Initialize Levels\n' +
            service.levelsRanges.toString() +
            '\n\nStep 4) Quantization\n' +
            binary +
            '\n\nStep 5) Calculate the error\nConverting binary values\n' +
            service.resampling.toString() +
            '\n\nError=\n' +
            error.toString();
      });
    }
  }
}
