

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_groceries/Groceries%20page1.dart';
import 'package:provider_groceries/provider_fun.dart';

void main() {
  runApp( 
      ChangeNotifierProvider(
          create: (context)=>provider_class(),
          child:MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Groceries(),
      )
  )
  );
}

