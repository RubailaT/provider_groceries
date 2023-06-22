 import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:provider_groceries/Model_todo.dart';

class provider_class extends ChangeNotifier{
  List<Model_todo> groceries=[];
UnmodifiableListView<Model_todo>get GrocerryItem=>UnmodifiableListView(groceries);

  void additems(String item) {
    groceries.add(Model_todo(Todotask: item, completed: false));
    notifyListeners();
  }
  void checkcompletebox(Model_todo item){
 final itemindex=groceries.indexOf(item);
 groceries[itemindex].completedcheckbox();
 notifyListeners();
  }
  void delete(Model_todo item)
  {
    groceries.remove(item);
    notifyListeners();

  }
}