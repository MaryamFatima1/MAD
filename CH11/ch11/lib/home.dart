/*import 'package:flutter/material.dart';
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Layouts',
          style: TextStyle(color: Colors.black87),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black54),
        leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
        actions: [IconButton(icon: Icon(Icons.cloud_queue), onPressed: () {})],
      ),
 body: SafeArea(
 child: SingleChildScrollView(
 child: Column(
 children: <Widget>[
 _buildGestureDetector(),
 Divider(
 color: Colors.black, height: 44.0,
 ),
 _buildDraggable(),
 Divider(
 height: 40.0,
 ),
 //_buildDragTarget(),
 Divider(
 color: Colors.black,
 ),
 ],
 ),
 ),
 ),
    );
  }
}
 GestureDetector _buildGestureDetector() {
 return GestureDetector(
 onTap: () {
 print('onTap');
 _displayGestureDetected('onTap');
 },
 onDoubleTap: () {
 print('onDoubleTap');_displayGestureDetected('onDoubleTap');
 },
 onLongPress: () {
 print('onLongPress');
 _displayGestureDetected('onLongPress');
 },
 onPanUpdate: (DragUpdateDetails details) {
 print('onPanUpdate: $details');
 _displayGestureDetected('onPanUpdate:\n$details');
 },
 //onVerticalDragUpdate: ((DragUpdateDetails details) {
 // print('onVerticalDragUpdate: $details');
 // _displayGestureDetected('onVerticalDragUpdate:\n$details');
 //}),
 //onHorizontalDragUpdate: (DragUpdateDetails details) {
 // print('onHorizontalDragUpdate: $details');
 // _displayGestureDetected('onHorizontalDragUpdate:\n$details');
 //},
 //onHorizontalDragEnd: (DragEndDetails details) {
 // print('onHorizontalDragEnd: $details');
 // if (details.primaryVelocity < 0) {
 // print('Dragging Right to Left: ${details.velocity}');
 // } else if (details.primaryVelocity > 0) {
 // print('Dragging Left to Right: ${details.velocity}');
 // }
 //},child: Container(
 //color: Colors.lightGreen.shade100,
 //width: double.infinity,
 //padding: EdgeInsets.all(24.0),
 child: Column(
 children: <Widget>[
 Icon(
 Icons.access_alarm,
 size: 98.0,
 ),
 Text('$_gestureDetected'),
 ],
 ),
 );
 //);
 }
 void _displayGestureDetected(String gesture) {
 setState(() {
 _gestureDetected = gesture;
 });
 }
 Draggable<int> _buildDraggable() {
 return Draggable(
 child: Column(
 children: <Widget>[
 Icon(
 Icons.palette,
 color: Colors.deepOrange,
 size: 48.0,
 ),
 Text(
 'Drag Me below to change color',
 ),
 ],
 ),
 childWhenDragging: Icon(
 Icons.palette,
 color: Colors.grey,
 size: 48.0,
 ),
 feedback: Icon(
 Icons.brush,
 color: Colors.deepOrange,
 size: 80.0,
 ),
 data: Colors.deepOrange.value,
 );
 }
  DragTarget<int> _buildDragTarget() {
 return DragTarget<int>(
 onAccept: (colorValue) { _paintedColor = Color(colorValue);
 },
 builder: (BuildContext context, List<dynamic> acceptedData, List<dynamic> 
rejectedData) => acceptedData.isEmpty
 ? Text(
 'Drag To and see color change',
 style: TextStyle(color: _paintedColor),
 )
 : Text(
 'Painting Color: $acceptedData',
 style: TextStyle(
 color: Color(acceptedData[0]),
 fontWeight: FontWeight.bold,
 ),
 ),
 );
 }*/
 /*import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _gestureDetected = '';
  Color _paintedColor = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Layouts',
          style: TextStyle(color: Colors.black87),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black54),
        leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
        actions: [IconButton(icon: Icon(Icons.cloud_queue), onPressed: () {})],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _buildGestureDetector(),
              Divider(
                color: Colors.black,
                height: 44.0,
              ),
              _buildDraggable(),
              Divider(
                height: 40.0,
              ),
              // _buildDragTarget(),
              Divider(
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector _buildGestureDetector() {
    return GestureDetector(
      onTap: () {
        print('onTap');
        _displayGestureDetected('onTap');
      },
      onDoubleTap: () {
        print('onDoubleTap');
        _displayGestureDetected('onDoubleTap');
      },
      onLongPress: () {
        print('onLongPress');
        _displayGestureDetected('onLongPress');
      },
      onPanUpdate: (DragUpdateDetails details) {
        print('onPanUpdate: $details');
        _displayGestureDetected('onPanUpdate:\n$details');
      },
      child: Column(
        children: <Widget>[
          Icon(
            Icons.access_alarm,
            size: 98.0,
          ),
          Text('$_gestureDetected'),
        ],
      ),
    );
  }

  void _displayGestureDetected(String gesture) {
    setState(() {
      _gestureDetected = gesture;
    });
  }

  Draggable<int> _buildDraggable() {
    return Draggable(
      child: Column(
        children: <Widget>[
          Icon(
            Icons.palette,
            color: Colors.deepOrange,
            size: 48.0,
          ),
          Text(
            'Drag Me below to change color',
          ),
        ],
      ),
      childWhenDragging: Icon(
        Icons.palette,
        color: Colors.grey,
        size: 48.0,
      ),
      feedback: Icon(
        Icons.brush,
        color: Colors.deepOrange,
        size: 80.0,
      ),
      data: Colors.deepOrange.value,
    );
  }
}*/
import 'package:flutter/material.dart';


class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  String _gestureDetected = '';
  Color _paintedColor = Colors.deepOrange;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _buildGestureDetector(),
              Divider(
                color: Colors.black,
                height: 44.0,
              ),
              _buildDraggable(),
              Divider(
                height: 40.0,
              ),
              _buildDragTarget(),
              Divider(
                color: Colors.black,
              ),
              /*IconButton(
                icon: Icon(Icons.check),
                onPressed: () => Navigator.pop(context, HomeState()),
              ),*/
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector _buildGestureDetector() {
    return GestureDetector(
      onTap: () {
        print('onTap');
        _displayGestureDetected('onTap');
      },
      onDoubleTap: () {
        print('onDoubleTap');
        _displayGestureDetected('onDoubleTap');
      },
      onLongPress: () {
        print('onLongPress');
        _displayGestureDetected('onLongPress');
      },
      onPanUpdate: (DragUpdateDetails details) {
        print('onPanUpdate: $details');
        _displayGestureDetected('onPanUpdate:\n$details');
      },
      //onVerticalDragUpdate: ((DragUpdateDetails details) {
      // print('onVerticalDragUpdate: $details');
      // _displayGestureDetected('onVerticalDragUpdate:\n$details');
      //}),
      //onHorizontalDragUpdate: (DragUpdateDetails details) {
      // print('onHorizontalDragUpdate: $details');
      // _displayGestureDetected('onHorizontalDragUpdate:\n$details');
      //},
      //onHorizontalDragEnd: (DragEndDetails details) {
      // print('onHorizontalDragEnd: $details');
      // if (details.primaryVelocity < 0) {
      // print('Dragging Right to Left: ${details.velocity}');
      // } else if (details.primaryVelocity > 0) {
      // print('Dragging Left to Right: ${details.velocity}');
      // }
      //},
      child: Container(
        color: Colors.lightGreen.shade100,
        width: double.infinity,
        padding: EdgeInsets.all(24.0),
        child: Column(
          children: <Widget>[
            Icon(
              Icons.access_alarm,
              size: 98.0,
            ),
            Text('$_gestureDetected'),
          ],
        ),
      ),
    );
  }

  void _displayGestureDetected(String gesture) {
    setState(() {
      _gestureDetected = gesture;
    });
  }

  Draggable<int> _buildDraggable() {
    return Draggable(
      child: Column(
        children: <Widget>[
          Icon(
            Icons.palette,
            color: Colors.deepOrange,
            size: 48.0,
          ),
          Text(
            'Drag Me below to change color',
          ),
        ],
      ),
      childWhenDragging: Icon(
        Icons.palette,
        color: Colors.grey,
        size: 48.0,
      ),
      feedback: Icon(
        Icons.brush,
        color: Colors.deepOrange,
        size: 80.0,
      ),
      data: Colors.deepOrange.value,
    );
  }

  DragTarget<int> _buildDragTarget() {
    return DragTarget<int>(
      onAccept: (colorValue) {
        _paintedColor = Color(colorValue);
      },
      builder: (BuildContext context, List<dynamic> acceptedData,
              List<dynamic> rejectedData) =>
          acceptedData.isEmpty
              ? Text(
                  'Drag To and see color change',
                  style: TextStyle(color: _paintedColor),
                )
              : Text(
                  'Painting Color: $acceptedData',
                  style: TextStyle(
                    color: Color(acceptedData[0]),
                    fontWeight: FontWeight.bold,
                  ),
                ),
    );
  }
}

