import 'package:flutter/material.dart';
import 'package:flutter_task_app/views/add_task_ui.dart';

class ShowAllTaskUi extends StatefulWidget {
  const ShowAllTaskUi({super.key});

  @override
  State<ShowAllTaskUi> createState() => _ShowAllTaskUiState();
}

class _ShowAllTaskUiState extends State<ShowAllTaskUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //ส่วนของ appbar
      appBar: AppBar(//สีพื้นหลังของ appbar
        backgroundColor: const Color.fromARGB(255, 11, 62, 139),
        title: Text(
          'TASK ME',
          style: TextStyle(
            color: Colors.white,
          ),
          ),
          centerTitle: true, //จัดตำแหน่งกลาง
      ),
      //floating ac buttom 
      floatingActionButton: FloatingActionButton(//สีพื้นหลังของปุ่ม  FloatingActionButton
        onPressed: (){
          //เปิดไปหน้าจอ AddTaskUi เมื่อกดปุ่ม แบบย้อนกลับได้
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddTaskUi(),
            ),
          );
        },//ฟังก์ชันเมื่อกดปุ่ม
        child: Icon(  
          Icons.add,
          color: Colors.white,//สีของไอคอน
          ),
        backgroundColor: Colors.blue[900],//สีพื้นหลังของปุ่ม
      ),
      //ตำแหน่งของ floating ac buttom
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}