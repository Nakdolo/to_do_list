import 'package:uuid/uuid.dart';

enum Priority { high, medium, low }

const uuid = Uuid();

class Item {
  Item(this.priority, {required this.text, required this.isComplete})
      : id = uuid.v4();
  final String id;
  final String text;
  bool isComplete;
  final Priority priority;
}

void heapSort(List<Item> items) {
  int n = items.length;

  for (int i = n ~/ 2 - 1; i >= 0; i--) {
    heapify(items, n, i);
  }

  for (int i = n - 1; i >= 0; i--) {
    Item temp = items[0];
    items[0] = items[i];
    items[i] = temp;
    heapify(items, i, 0);
  }
}

void heapify(List<Item> items, int n, int i) {
  int largest = i;
  int left = 2 * i + 1;
  int right = 2 * i + 2;

  if (left < n &&
      comparePriority(items[left].priority, items[largest].priority) > 0) {
    largest = left;
  }

  if (right < n &&
      comparePriority(items[right].priority, items[largest].priority) > 0) {
    largest = right;
  }

  if (largest != i) {
    Item swap = items[i];
    items[i] = items[largest];
    items[largest] = swap;
    heapify(items, n, largest);
  }
}

int comparePriority(Priority p1, Priority p2) {
  List<Priority> priorityOrder = [Priority.high, Priority.medium, Priority.low];
  return priorityOrder.indexOf(p1) - priorityOrder.indexOf(p2);
}
