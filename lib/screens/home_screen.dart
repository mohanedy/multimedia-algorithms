import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:multimedia/components/service_card.dart';
import 'package:multimedia/screens/2d_transformation_screen.dart';
import 'package:multimedia/screens/arithmetic_coding_screen.dart';
import 'package:multimedia/screens/huffman_coding_screen.dart';
import 'package:multimedia/screens/lzw_screen.dart';
import 'package:multimedia/screens/quant_screen.dart';
import 'package:multimedia/screens/rln_binary.dart';
import 'package:multimedia/screens/rln_screen.dart';
import 'package:multimedia/screens/shannon_screen.dart';
import 'package:multimedia/screens/simple_repetiton_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Multimedia Algorithms',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 8.0, right: 8.0),
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          children: <Widget>[
            ServiceCard(
              'Quantization Algorithm',
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => QuantizationScreen()));
              },
              icon: Icon(
                Octicons.file_binary,
                color: Colors.white,
                size: 80,
              ),
            ),
            ServiceCard(
              'Transformations',
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (c) => TransformationsScreen()));
              },
              icon: Icon(
                Entypo.layers,
                color: Colors.white,
                size: 80,
              ),
            ),
            ServiceCard(
              'Simple Repetition',
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (c) => SimpleRepetitionScreen()));
              },
              icon: Icon(
                AntDesign.shrink,
                color: Colors.white,
                size: 80,
              ),
            ),
            ServiceCard(
              'Run-length Encoding (RLN)',
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (c) => RLNScreen()));
              },
              icon: Icon(
                AntDesign.shrink,
                color: Colors.white,
                size: 80,
              ),
            ),
            ServiceCard(
              'RLN Binary Images',
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (c) => RLNBinary()));
              },
              icon: Icon(
                AntDesign.shrink,
                color: Colors.white,
                size: 80,
              ),
            ),
            ServiceCard(
              'Shannon-Fano',
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (c) => ShannonFanoScreen()));
              },
              icon: Icon(
                AntDesign.shrink,
                color: Colors.white,
                size: 80,
              ),
            ),
            ServiceCard(
              'Huffman Coding',
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (c) => HuffmanCodingScreen()));
              },
              icon: Icon(
                AntDesign.shrink,
                color: Colors.white,
                size: 80,
              ),
            ),
            ServiceCard(
              'Arithmetic Coding',
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (c) => ArithmeticCodingScreen()));
              },
              icon: Icon(
                AntDesign.shrink,
                color: Colors.white,
                size: 80,
              ),
            ),
            ServiceCard(
              'LZW Compression',
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (c) => LZWCodingScreen()));
              },
              icon: Icon(
                AntDesign.shrink,
                color: Colors.white,
                size: 80,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
