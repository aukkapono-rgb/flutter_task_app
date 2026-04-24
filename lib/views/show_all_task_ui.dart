// ignore_for_file: sort_child_properties_last
 
import 'package:flutter/material.dart';
import 'package:flutter_task_app/models/task.dart';
import 'package:flutter_task_app/services/supabase_service.dart';
import 'package:flutter_task_app/views/Update_delete_task_ui.dart';
import 'package:flutter_task_app/views/add_task_ui.dart';
 
class ShowAllTaskUi extends StatefulWidget {
  const ShowAllTaskUi({super.key});
 
  @override
  State<ShowAllTaskUi> createState() => _ShowAllTaskUiState();
}
 
class _ShowAllTaskUiState extends State<ShowAllTaskUi> {
  // สร้าง instance/object/ตัวแทนของ SupabaseService เพื่อเรียกใช้ฟังก์ชันการทำงานต่างๆ กับ Supabase
  final service = SupabaseService();
 
  // สร้างตัวแปรเพื่อเก็บข้อมูลที่จะดึงมาจาก Supabase เพื่อไปแสดงใน ListView
  List<Task> tasks = [];
 
  // สร้างเมธอดเพื่อดึงข้อมูล แล้วเอาข้อมูลที่ดึงมากำหนดให้กับตัวแปร
  void loadTasks() async {
    //ดึงข้อมูลจาก Supabase
    final data = await service.getAllTask();
 
    //เอาข้อมูลที่ดึงมา กำหนดให้กับตัวแปร
    setState(() {
      tasks = data;
    });
  }
 
  @override
  void initState() {
    super.initState();
 
    //เรียกใช้เมธอด loadTasks() ใ้หทำงานตอนหน้าจอถูกเปิด
    loadTasks();
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //ส่วนของ AppBar
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
      //FloatingActionButton
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //เปิดไปหน้า AddTaskUi แบบย้อนกลับได้
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddTaskUi(),
            ),
          );
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.blue[900],
      ),
      //ตำแหน่งของ FloatingActionButton
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // ส่วนของ Body
      body: Center(
        child: Column(
          children: [
            //ส่วนแสดงรูปโลโก้
            SizedBox(height: 50),
            Image.asset(
              'assets/images/logo.png',
              width: 120,
              height: 120,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 50),
            //ส่วนของ ListView แสดงรายการข้อมูลงานที่ดึงมาจาก Supabase
            Expanded(
              child: ListView.builder(
                // จำนวนรายการใน ListView
                itemCount: tasks.length,
                // สร้างหน้าตาของแต่ละรายการใน ListView
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                      left: 40,
                      right: 40,
                      top: 5,
                      bottom: 5,
                    ),
                    child: ListTile(
                      onTap: (){
                        //เปิดไปหน้า updateTaskUi แบบย้อนกลับได้ พร้อมส่งข้อมูลของงานที่ถูกกดไปด้วย
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UpdateDeleteTaskUi(),
                          ),
                        ); // เมื่อกลับมาจากหน้า AddTaskUi ให้เรียกใช้เมธอด loadTasks() เพื่อรีเฟรชข้อมูลใน ListView
                      },
                      title: Text(
                        'งาน: ${tasks[index].task_name}',
                      ),
                      subtitle: Text(// ternary operator ____ ? ____ : ______
                        'สถานะ: ${tasks[index].task_status == true ? 'เสร็จแล้ว' : 'ยังไม่เสร็จ'}',
                      ),
                      trailing: Icon(
                        Icons.info,
                        color: Colors.green,
                      ),
                      leading:  tasks[index].task_image_url == ''
                          ? Image.asset(
                            'assets/images/task.png',
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          )
                          : Image.network(
                            tasks[index].task_image_url!,
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                          //
                          tileColor: index % 2 == 0 ? Colors.green[200] : Colors.amber[50],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}