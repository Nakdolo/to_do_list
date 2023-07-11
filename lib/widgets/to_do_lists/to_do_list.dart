import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_less4/models/item.dart';
import 'package:flutter_less4/widgets/to_do_lists/to_do_item.dart';

class ToDoList extends StatelessWidget {
  const ToDoList(
      {super.key,
      required this.onRemoveItem,
      required this.itemsList,
      required this.isComplete,
      });

  final void Function(Item item) onRemoveItem;
  final List<Item> itemsList;
  final void Function(Item item) isComplete;
  

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: itemsList.length,
      itemBuilder: (BuildContext context, int index) => Dismissible(
        key: ValueKey(itemsList[index]),
        direction: DismissDirection.horizontal,
        onDismissed: (direction) {
          onRemoveItem(itemsList[index]);
        },
        child: ToDoItem(
            item: itemsList[index], isComp: isComplete),
      ),
    );
  }
}
