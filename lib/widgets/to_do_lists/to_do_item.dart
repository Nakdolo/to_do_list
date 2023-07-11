import 'package:flutter/material.dart';
import 'package:flutter_less4/models/item.dart';

class ToDoItem extends StatelessWidget {
  const ToDoItem({
    super.key,
    required this.item,
    required this.isComp,
  });

  final void Function(Item item) isComp;
  final Item item;
  checkPriority() {
    if (item.priority == Priority.high) {
      return Colors.red;
    } else if (item.priority == Priority.medium) {
      return Colors.blue;
    } else {
      return Colors.green;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(12),
      color: checkPriority(),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                isComp(item);
              },
              icon: item.isComplete
                  ? const Icon(
                      Icons.check_box_outlined,
                      size: 32,
                    )
                  : const Icon(
                      Icons.check_box_outline_blank,
                      size: 32,
                    ),
            ),
            Expanded(
              child: Text(
                item.text,
                style: TextStyle(
                  fontSize: 18,
                  decoration:
                      item.isComplete ? TextDecoration.lineThrough : null,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
