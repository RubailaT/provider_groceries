class Model_todo{
  String Todotask;
  bool completed;
  Model_todo({required this.Todotask,this.completed = false});

  void completedcheckbox(){
    completed=!completed;
  }
}