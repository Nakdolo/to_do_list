import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_less4/models/item.dart';

class NewToDoItem extends StatefulWidget {
  const NewToDoItem({super.key, required this.addItem});

  final void Function(Item item) addItem;

  @override
  State<NewToDoItem> createState() {
    return _NewToDoItem();
  }
}

class _NewToDoItem extends State<NewToDoItem> {
  final _textControler = TextEditingController();
  Priority _selectedPriority = Priority.low;

  @override
  void dispose() {
    _textControler.dispose();
    super.dispose();
  }

  void _showDialog() {
    if (Platform.isIOS) {
      showCupertinoDialog(
          context: context,
          builder: (ctx) => CupertinoAlertDialog(
                title: const Text('Invalid input'),
                content:
                    const Text('Please make sure a valid text was entered'),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(ctx);
                      },
                      child: const Text('Okay'))
                ],
              ));
    } else {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Invalid input'),
          content: const Text('Please make sure a valid text was entered'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(ctx);
                },
                child: const Text('Okay'))
          ],
        ),
      );
    }
  }

  void sumbitItem() {
    if (_textControler.text.trim().isEmpty) {
      _showDialog();
      return;
    }
    widget.addItem(
      Item(text: _textControler.text, isComplete: false, _selectedPriority),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textControler,
                    maxLength: 50,
                    decoration: const InputDecoration(
                      label: Text(
                        'Text',
                        style: TextStyle(
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                DropdownButton(
                  alignment: AlignmentDirectional.topStart,
                  value: _selectedPriority,
                  items: Priority.values
                      .map(
                        (priority) => DropdownMenuItem(
                          value: priority,
                          child: Text(
                            priority.name.toUpperCase(),
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    if (value == null) return;
                    setState(() {
                      _selectedPriority = value;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: ElevatedButton(
                    onPressed: () {
                      sumbitItem();
                    },
                    child: const Text('Save to-do Text'),
                  ),
                ),
                const Spacer(),
                Align(
                  alignment: Alignment.topLeft,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Cancel'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
