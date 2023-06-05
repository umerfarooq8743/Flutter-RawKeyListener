import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class two extends StatefulWidget {
  const two({super.key});

  @override
  State<two> createState() => _twoState();
}

class _twoState extends State<two> {
  List<FocusNode> _focusNodes = [];

  @override
  void initState() {
    super.initState();
    _focusNodes = List.generate(12, (_) => FocusNode());
  }

  @override
  void dispose() {
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  void moveFocus(int index) {
    if (index >= 0 && index < _focusNodes.length) {
      _focusNodes[index].requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
      focusNode: FocusNode(),
      onKey: (RawKeyEvent event) {
        if (event is RawKeyDownEvent) {
          if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
            final currentFocusIndex =
                _focusNodes.indexWhere((node) => node.hasFocus);
            if (currentFocusIndex >= 0 && currentFocusIndex < 9) {
              moveFocus(currentFocusIndex + 3);
            }
          } else if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
            final currentFocusIndex =
                _focusNodes.indexWhere((node) => node.hasFocus);
            if (currentFocusIndex >= 3 && currentFocusIndex < 12) {
              moveFocus(currentFocusIndex - 3);
            }
          }
        }
      },
      child: ListView.builder(
        itemCount: 2,
        itemBuilder: (context, rowIndex) {
          final startIndex = rowIndex * 6;
          final endIndex = startIndex + 6;

          return Card(
            child: Row(
              children: _focusNodes
                  .sublist(startIndex, endIndex)
                  .asMap()
                  .entries
                  .map((entry) {
                final index = entry.key;
                final focusNode = entry.value;
                final isTextField = index % 2 != 0;

                return Expanded(
                  flex: isTextField ? 3 : 1,
                  child: isTextField
                      ? Padding(
                          padding: EdgeInsets.symmetric(horizontal: 7),
                          child: TextField(
                            focusNode: focusNode,
                            decoration: InputDecoration(
                              labelText: index == 1
                                  ? "name"
                                  : (index == 3
                                      ? "age"
                                      : (index == 5 ? "roll" : "fax")),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                        )
                      : Text("$index"),
                );
              }).toList(),
            ),
          );
        },
      ),
    );
  }
}
