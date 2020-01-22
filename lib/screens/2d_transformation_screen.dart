import 'package:flutter/material.dart';

class TransformationsScreen extends StatefulWidget {
  @override
  _TransformationsScreenState createState() => _TransformationsScreenState();
}

class _TransformationsScreenState extends State<TransformationsScreen> {
  double scale = 1;
  double angle = 360;
  double originX = 0;
  double originY = 0;
  double tx = 0;
  double ty = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '2D Transformations',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Flexible(
                    child: TextField(
                  keyboardType: TextInputType.number,
                  onChanged: (s) {
                    if (s.isNotEmpty) {
                      scale = double.parse(s);
                    }
                  },
                  decoration: InputDecoration(
                    hasFloatingPlaceholder: true,
                    labelText: 'Scale value',
                  ),
                )),
                Container(
                  width: 5,
                ),
                RaisedButton(
                    onPressed: () {
                      if (scale > 0) {
                        setState(() {});
                      }
                    },
                    color: Colors.deepOrange,
                    child: Text('Scale',
                        style: TextStyle(
                          color: Colors.white,
                        ))),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Flexible(
                    child: TextField(
                  keyboardType: TextInputType.number,
                  onChanged: (s) {
                    if (s.isNotEmpty) {
                      angle = double.parse(s);
                    }
                  },
                  decoration: InputDecoration(
                    hasFloatingPlaceholder: true,
                    labelText: 'Angle °',
                  ),
                )),
                Text(
                  '(',
                  style: TextStyle(fontSize: 30),
                ),
                Flexible(
                    child: TextField(
                  keyboardType: TextInputType.number,
                  onChanged: (s) {
                    if (s.isNotEmpty) {
                      originX = double.parse(s);
                    }
                  },
                  decoration: InputDecoration(
                    hasFloatingPlaceholder: true,
                    labelText: 'offset x',
                  ),
                )),
                Text(
                  ', ',
                  style: TextStyle(fontSize: 30),
                ),
                Container(
                  width: 5,
                ),
                Flexible(
                    child: TextField(
                  keyboardType: TextInputType.number,
                  onChanged: (s) {
                    if (s.isNotEmpty) {
                      originY = double.parse(s);
                    }
                  },
                  decoration: InputDecoration(
                    hasFloatingPlaceholder: true,
                    labelText: 'offset y',
                  ),
                )),
                Text(
                  ')',
                  style: TextStyle(fontSize: 30),
                ),
                Container(
                  width: 5,
                ),
                RaisedButton(
                  onPressed: () {
                    setState(() {});
                  },
                  color: Colors.amber,
                  child: Text(
                    'Rotate',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Text(
                  '(',
                  style: TextStyle(fontSize: 30),
                ),
                Flexible(
                    child: TextField(
                  keyboardType: TextInputType.number,
                  onChanged: (s) {
                    if (s.isNotEmpty) {
                      tx = double.parse(s);
                    }
                  },
                  decoration: InputDecoration(
                    hasFloatingPlaceholder: true,
                    labelText: 'Translate x (Tx)',
                  ),
                )),
                Text(
                  ', ',
                  style: TextStyle(fontSize: 30),
                ),
                Container(
                  width: 5,
                ),
                Flexible(
                    child: TextField(
                  keyboardType: TextInputType.number,
                  onChanged: (s) {
                    if (s.isNotEmpty) {
                      ty = double.parse(s);
                    }
                  },
                  decoration: InputDecoration(
                    hasFloatingPlaceholder: true,
                    labelText: 'Translate y (Ty)',
                  ),
                )),
                Text(
                  ')',
                  style: TextStyle(fontSize: 30),
                ),
                Container(
                  width: 5,
                ),
                RaisedButton(
                  onPressed: () {
                    setState(() {});
                  },
                  color: Colors.green,
                  child: Text(
                    'Translate',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 60,
            ),
            Transform.rotate(
              angle: angle,
              origin: Offset(originX, originY),
              child: Transform.translate(
                offset: Offset(tx, ty),
                child: AnimatedContainer(
                  duration: Duration(seconds: 3),
                  decoration: BoxDecoration(color: Colors.amber, boxShadow: [
                    BoxShadow(
                      color: Colors.amberAccent,
                      blurRadius: 25,
                    )
                  ]),
                  width: 100 * scale,
                  height: 100 * scale,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
