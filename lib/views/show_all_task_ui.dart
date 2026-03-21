import 'package:flutter/material.dart';

class ShowAllTaskUi extends StatefulWidget {
  const ShowAllTaskUi({super.key});

  @override
  State<ShowAllTaskUi> createState() => _ShowAllTaskUiState();
}

class _ShowAllTaskUiState extends State<ShowAllTaskUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text(
          'TASK ME',
          style: TextStyle(
            color: Colors.white,
          ),
          ),
          centerTitle: true,
      ),
      //floating ac buttom
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(  
          Icons.add,
          color: Colors.blue[900],
          ),
      ),
      //ตำแหน่ง
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}