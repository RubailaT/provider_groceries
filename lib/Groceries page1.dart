 
 import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_groceries/Model_todo.dart';
import 'package:provider_groceries/provider_fun.dart';
 import 'package:provider_groceries/Model_todo.dart';

class Groceries extends StatefulWidget {
  const Groceries({Key? key}) : super(key: key);

  @override
  State<Groceries> createState() => _GroceriesState();
}

class _GroceriesState extends State<Groceries> {
  TextEditingController addedup = TextEditingController();
  String newitem = '';

  @override
  void initState() {
    super.initState();
   addedup.addListener(() {
newitem = addedup.text;
    });
  }

  //disposing the controller
  @override
  void dispose() {
   addedup.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    Future<void> _showAddTextDialog() async {
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Add a new  item"),
              content: TextField(
                autofocus: true,
                controller: addedup,
                decoration: const InputDecoration(hintText: "Add Item"),
                onSubmitted: (_) => submit(),
              ),
              actions: [
                ElevatedButton(
                  onPressed: submit,
                  child: const Text("Submit"),
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(120, 40)),
                )
              ],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              actionsAlignment: MainAxisAlignment.center,
            );
          });
    }
    final object1 = Provider.of<provider_class>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {

          _showAddTextDialog();
        },
        backgroundColor: Colors.grey,
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        backgroundColor: Color(0xcff192A2C),
        title: Text("Groceries"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20, top: 10),
              child: Text(object1.GrocerryItem.length.toString(),
                style: TextStyle(color: Colors.black, fontSize: 30,
                    fontWeight: FontWeight.bold),),
            ),
            Divider(
              thickness: 2,
            ),
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: object1.GrocerryItem.length,
                itemBuilder: (context, index) {
                  print(object1.GrocerryItem[index].Todotask);
                  return ListTile(
                    leading: Text(object1.GrocerryItem[index].Todotask,
                      style: TextStyle(fontSize: 20),
                    ),
                    title: Checkbox(
                      checkColor: Colors.white,
                      activeColor: Colors.grey,
                      value: object1.GrocerryItem[index].completed,
                      onChanged: (_) =>
                      // onChanged: (bool? value) {
                      object1.checkcompletebox(object1.GrocerryItem[index]),
                      // },
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        object1.delete(object1.GrocerryItem[index]);
                      },
                    ),

                  );
                }),


          ],
        ),
      ),


    );
  }

  // void showmodelbottomsheet() {
  //   showModalBottomSheet(
  //       context: context,
  //       builder: (builder) {
  //         return Container(
  //           height: 200,
  //           child: Column(
  //             children: [
  //               Container(
  //                 height: 100,
  //                 child: Center(
  //                   child: TextField(
  //                     controller: addedup,
  //                      autofocus: true,
  //                     obscureText: false,
  //                     decoration: InputDecoration(
  //                       border: OutlineInputBorder(
  //                         borderSide: BorderSide(
  //                           color: Colors
  //                               .grey, // Set your desired border color here
  //                         ),
  //                       ),
  //
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //               ElevatedButton(onPressed: () {
  //                 submit();
  //               },
  //                   child: Text("Submit")),
  //             ],
  //           ),
  //         );
  //       }
  //   );
  // }

  void submit() {
    Provider.of<provider_class>(context, listen: false).additems(newitem);
    Navigator.pop(context);
    addedup.clear();
  }
}



