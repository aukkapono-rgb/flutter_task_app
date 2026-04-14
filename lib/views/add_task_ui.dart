import 'package:flutter/material.dart';

class AddTaskUi extends StatefulWidget {
  const AddTaskUi({super.key});

  @override
  State<AddTaskUi> createState() => _AddTaskUiState();
}

class _AddTaskUiState extends State<AddTaskUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //ส่วนของ appbar
      appBar: AppBar(
        //สีพื้นหลังของ appbar
        backgroundColor: const Color.fromARGB(255, 11, 62, 139),
        title: Text(
          'TASK ME (เพิ่ม)',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true, //จัดตำแหน่งกลาง
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context); //ย้อนกลับไปหน้าก่อนหน้า show_all_task_ui
          },
          icon: Icon(
            Icons.arrow_back_ios, //ไอคอนลูกศรย้อนกลับ
            color: Colors.white, //สีของไอคอน
          ),
        ),
      ),
      //ส่วนของ body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 40,
            bottom: 50,
            left: 40,
            right: 40,
          ),
          child: Center(
            child: Column(
              children: [
                //ไอคอนรูปภาพ และรูปภาพที่แสดงเมื่อยังไม่มีการเพิ่มข้อมูลเข้ามา
                Icon(
                  Icons.add_a_photo_rounded,
                  size: 150,
                  color: Colors.grey[300],
                ),
                SizedBox(height: 20), //เว้นระยะห่างระหว่างไอคอนกับข้อความ
                //ส่วนป้อนข้อมูลชื่อเรื่องทำอะไร
                Align(
                  alignment: Alignment.centerLeft, //จัดตำแหน่งซ้าย
                  child: Text(
                    'ทำอะไร',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ), //เส้นขอบของ TextField
                    hintText: 'เช่น ซักผ้า ซ่อมหลอดไฟ',
                  ),
                ),
                SizedBox(height: 20), //เว้นระยะห่างระหว่างส่วนป้อนข้อมูล
                //ส่วนป้อนข้อมูลชื่อเรื่องทำที่ไหน
                Align(
                  alignment: Alignment.centerLeft, //จัดตำแหน่งซ้าย
                  child: Text(
                    'ทำที่ไหน',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ), //เส้นขอบของ TextField
                    hintText: 'เช่น บ้าน สำนักงาน',
                  ),
                ),
                SizedBox(height: 20), //เว้นระยะห่างระหว่างส่วนป้อนข้อมูล
                //ส่วนป้อนข้อมูลชื่อเรื่องทำทกันกี่คน
                Align(
                  alignment: Alignment.centerLeft, //จัดตำแหน่งซ้าย
                  child: Text(
                    'ทำกับใคร',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ), //เส้นขอบของ TextField
                    hintText: 'เช่น 2, 5, 10 คน',
                  ),
                ),
                SizedBox(height: 20), //เว้นระยะห่างระหว่างส่วนป้อนข้อมูล
                //ส่วนของทำเสร็จหรือยัง
                Align(
                  alignment: Alignment.centerLeft, //จัดตำแหน่งซ้าย
                  child: Text(
                    'ทำเสร็จหรือยัง',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold, //ตัวหนา
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment
                      .spaceBetween, //จัดตำแหน่งให้ห่างกันเท่าๆกัน
                  children: [
                    ElevatedButton(
                      onPressed: () {}, // ฟังก์ชันเมื่อกดปุ่ม "ทำเสร็จ"
                      style: ElevatedButton.styleFrom(
                        //การกำหนดรูปแบบของปุ่ม ElevatedButton แนวนอน
                        backgroundColor: Colors.grey,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        fixedSize: Size(
                          MediaQuery.of(context).size.width * 0.35,
                          50,
                        ), //ขนาดของปุ่ม
                      ),
                      child: Text(
                        'เสร็จแล้ว',
                        style: TextStyle(
                          color: Colors.white, //สีของข้อความในปุ่ม
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {}, // ฟังก์ชันเมื่อกดปุ่ม "ยังไม่เสร็จ"
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        fixedSize: Size(
                          MediaQuery.of(context).size.width * 0.35,
                          50,
                        ), //ขนาดของปุ่ม
                      ),
                      child: Text(
                        'ยังไม่เสร็จ',
                        style: TextStyle(
                          color: Colors.white, //สีของข้อความในปุ่ม
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20), //เว้นระยะห่างระหว่างส่วนป้อนข้อมูล
                //เสร็จเมื่อไหร
                Align(
                  alignment: Alignment.centerLeft, //จัดตำแหน่งซ้าย
                  child: Text(
                    'เสร็จเมื่อไหร่',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                TextField(
                  onTap: () {
                    //ฟังก์ชันเมื่อกด TextField จะเปิดปฏิทินขึ้นมาให้เลือกวันที่
                    showDatePicker(
                      context: context,
                      initialDate:
                          DateTime.now(), //วันที่เริ่มต้นเป็นวันที่ปัจจุบัน
                      firstDate:
                          DateTime(2000), //วันที่เลือกได้เริ่มต้นที่ปี 2000
                      lastDate:
                          DateTime(2100), //วันที่เลือกได้สิ้นสุดที่ปี 2100
                    );
                  },
                  readOnly:
                      true, //ไม่สามารถแก้ไขข้อความได้  คีย์บอร์ดจะไม่แสดงขึ้นเมื่อกด TextField
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ), //เส้นขอบของ TextField
                    hintText: '2024-06-30',
                    suffixIcon: Icon(
                      Icons
                          .calendar_month_rounded, //ไอคอนปฏิทินที่อยู่ด้านขวาของ TextField
                    ),
                  ),
                ),
                SizedBox(height: 20), //เว้นระยะห่างระหว่างส่วนป้อนข้อมูล
                //ส่วนของปุ่มบันทึกข้อมูล
                ElevatedButton(
                  onPressed: () {}, //ฟังก์ชันเมื่อกดปุ่มบันทึกข้อมูล
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    fixedSize: Size(
                      MediaQuery.of(context)
                          .size
                          .width, //ขนาดของปุ่มให้เต็มความกว้างของหน้าจอ
                      50,
                    ),
                  ),
                  child: Text(
                    'บันทึกข้อมูล',
                    style: TextStyle(
                      color: Colors.white, //สีของข้อความในปุ่ม
                    ),
                  ),
                ),
                SizedBox(height: 10), //เว้นระยะห่างระหว่างส่วนป้อนข้อมูล
                //ส่วนของปุ่มยกเลิก
                ElevatedButton(
                  onPressed: () {}, //ฟังก์ชันเมื่อกดปุ่มบันทึกข้อมูล
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    fixedSize: Size(
                      MediaQuery.of(context)
                          .size
                          .width, //ขนาดของปุ่มให้เต็มความกว้างของหน้าจอ
                      50,
                    ),
                  ),
                  child: Text(
                    'ยกเลิก',
                    style: TextStyle(
                      color: Colors.white, //สีของข้อความในปุ่ม
                    ),
                  ),
                ),
                SizedBox(height: 10), //เว้นระยะห่างระหว่างส่วนป้อนข้อมูล
              ],
            ),
          ),
        ),
      ),
    );
  }
}
