import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rawkey/2.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: KeyboardFocusScreen(),
    );
  }
}

class KeyboardFocusScreen extends StatefulWidget {
  @override
  _KeyboardFocusScreenState createState() => _KeyboardFocusScreenState();
}

class _KeyboardFocusScreenState extends State<KeyboardFocusScreen> {
  final int rowCount = 5;
  final int textFieldCount = 4;
  final List<FocusNode> _focusNodes = [];
  final List<String> _labels = [
    'Country',
    'Age',
    'Roll',
    'Pin',
  ];

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < rowCount * textFieldCount; i++) {
      _focusNodes.add(FocusNode());
    }
  }

  @override
  void dispose() {
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  void requestFocus(int index) {
    FocusScope.of(context).requestFocus(_focusNodes[index]);
  }

  void handleKeyDownEvent(RawKeyEvent event) {
    if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
      final currentFocusIndex =
          _focusNodes.indexWhere((focusNode) => focusNode.hasFocus);
      if (currentFocusIndex != -1) {
        final nextFocusIndex = currentFocusIndex + textFieldCount;
        if (nextFocusIndex < _focusNodes.length) {
          requestFocus(nextFocusIndex);
        }
      }
    } else if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
      final currentFocusIndex =
          _focusNodes.indexWhere((focusNode) => focusNode.hasFocus);
      if (currentFocusIndex != -1) {
        final previousFocusIndex = currentFocusIndex - textFieldCount;
        if (previousFocusIndex >= 0) {
          requestFocus(previousFocusIndex);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Keyboard Focus ',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: RawKeyboardListener(
        focusNode: FocusNode(),
        onKey: (RawKeyEvent event) {
          if (event.runtimeType == RawKeyDownEvent) {
            handleKeyDownEvent(event);
          }
        },
        child: ListView.builder(
          itemCount: rowCount,
          itemBuilder: (context, rowIndex) {
            return Column(children: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => two()));
                  },
                  child: Text("data")),
              Row(
                children: List.generate(textFieldCount, (textFieldIndex) {
                  final index = rowIndex * textFieldCount + textFieldIndex;
                  return Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextField(
                        focusNode: _focusNodes[index],
                        decoration: InputDecoration(
                          labelText: _labels[textFieldIndex],
                        ),
                        onEditingComplete: () {
                          final nextFocusIndex = index + textFieldCount;
                          if (nextFocusIndex < _focusNodes.length) {
                            requestFocus(nextFocusIndex);
                          }
                        },
                      ),
                    ),
                  );
                }),
              ),
            ]);
          },
        ),
      ),
    );
  }
}
