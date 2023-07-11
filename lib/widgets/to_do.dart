import 'package:flutter/material.dart';
import 'package:flutter_less4/models/item.dart';
import 'package:flutter_less4/widgets/new_to_do_item.dart';
import 'package:flutter_less4/widgets/to_do_lists/to_do_list.dart';

class ToDo extends StatefulWidget {
  const ToDo({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ToDo();
  }
}

class _ToDo extends State<ToDo> {
  final List<Item> itemsList = [];
  bool isSorted = false;
  final List<Item> sortItemList = [];

  void _onRemoveItem(Item item) {
    final indexItem = itemsList.indexOf(item);
    final indexItemForSorted = sortItemList.indexOf(item);
    setState(
      () {
        sortItemList.remove(item);
        itemsList.remove(item);
      },
    );
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Your to-do reminder is deleted'),
        duration: const Duration(seconds: 4),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(
              () {
                itemsList.insert(indexItem, item);
                sortItemList.insert(indexItemForSorted, item);
              },
            );
          },
        ),
      ),
    );
  }

  void _addItem(Item item) {
    setState(() {
      itemsList.add(item);
      sortItemList.add(item);
      heapSort(sortItemList);
    });
  }

  void _openAddToDoItemOverlay() {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: false,
      context: context,
      builder: (ctx) => NewToDoItem(
        addItem: _addItem,
      ),
    );
  }

  void _itemIsComplete(Item item) {
    if (!item.isComplete) {
      setState(() {
        item.isComplete = true;
      });
    } else {
      setState(() {
        item.isComplete = false;
      });
    }
  }

  void _sortWithPriority() {
    setState(
      () {
        if (!isSorted) {
          isSorted = true;
        } else {
          isSorted = false;
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To-Do list'),
        actions: [
          isSorted ? const Text('Sorted') : const Text('Sort'),
          IconButton(
            onPressed: _sortWithPriority,
            icon: isSorted
                ? const Icon(Icons.arrow_downward_rounded)
                : const Icon(Icons.arrow_upward_rounded),
          ),
        ],
      ),
      floatingActionButton: SizedBox(
        width: 70,
        height: 70,
        child: FloatingActionButton(
          onPressed: _openAddToDoItemOverlay,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(360),
          ),
          child: const Icon(Icons.add),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: ToDoList(
        itemsList: isSorted ? sortItemList : itemsList,
        onRemoveItem: _onRemoveItem,
        isComplete: _itemIsComplete,
      ),
    );
  }
}
