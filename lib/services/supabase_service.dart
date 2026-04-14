//ไฟล์ที่ใช้สำหรับเชื่อมต่อและจัดการข้อมูลกับฐานข้อมูล Supabase ในแอปพลิเคชัน Flutter ทำงานร่วมกับโมเดล Task เพื่อให้สามารถทำการ CRUD (Create, Read, Update, Delete) ข้อมูลในตารางของฐานข้อมูล Supabase ได้อย่างง่ายดาย
//กรณี table ก็ CRUD ( create, read, update, delete ) ในฐานข้อมูลมีการเปลี่ยนแปลง เช่น เพิ่มคอลัมน์ใหม่ หรือเปลี่ยนชื่อคอลัมน์ ให้แก้ไขโค้ดในส่วนนี้ให้ตรงกับโครงสร้างของตารางในฐานข้อมูลด้วย
//กรณี bucket ก็ upload, download, geturl, delete ไฟล์ใน bucket ของ Supabase มีการเปลี่ยนแปลง เช่น เปลี่ยนชื่อ bucket หรือเปลี่ยนโครงสร้างของไฟล์ที่จัดเก็บ ให้แก้ไขโค้ดในส่วนนี้ให้ตรงกับโครงสร้างของ bucket ใน Supabase ด้วย
import 'dart:io';

import 'package:flutter_task_app/models/task.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  //สร้าง instance/object/ต้วแทน ของ supabase_flutter เพื่อใช้ในการเชื่อมต่อและจัดการข้อมูลกับฐานข้อมูล Supabase โดยการสร้างตัวแปร static final ที่ชื่อว่า instance ซึ่งเป็น instance ของ SupabaseService และใช้ factory constructor เพื่อให้สามารถเข้าถึง instance นี้ได้จากทุกที่ในแอปพลิเคชัน โดยไม่ต้องสร้าง instance ใหม่ทุกครั้งที่ต้องการใช้งาน
  final supabase = Supabase.instance.client;
  
  //(มีเยอะหน่อย)เมธอดการทำงานต่างๆ ที่เกี่ยวข้องกับการจัดการข้อมูลในฐานข้อมูล Supabase เช่น การดึงข้อมูลทั้งหมดจากตาราง, การเพิ่มข้อมูลใหม่, การอัปเดตข้อมูลที่มีอยู่, และการลบข้อมูล โดยแต่ละเมธอดจะใช้ instance ของ SupabaseService เพื่อเรียกใช้งานฟังก์ชันที่เกี่ยวข้องกับฐานข้อมูล Supabase และทำการจัดการข้อมูลตามที่ต้องการ
  //เมดธอดดึงข้อมูลทั้งหมดจากตาราง task_tb เพื่อไปใช้กับหน้า showallTaskUi
  Future<List<Task>> getAllTask() async {
    //ดึงข้อมมูลทั้งหมดจากตาราง task_tb โดยใช้ instance ของ SupabaseService เพื่อเรียกใช้งานฟังก์ชันที่เกี่ยวข้องกับฐานข้อมูล Supabase และทำการจัดการข้อมูลตามที่ต้องการ
    final data = await supabase.from('task_tb').select('*');
    //ส่งข้อมมูลที่ดึงกลับไปใช้งานอย่้างที่ต้องการ
    return data.map((e) => Task.fromJson(e)).toList();
  }

  //เมธอด upload ไฟล์รูปไปยังบักเก็ต tasl_bk และ GetUrlของไฟล์รูป เพื่อไปใช้กับหน้า addTaskUi และ updatedetailTaskUi
  Future<String?> uploadFileToBucket(File file) async { //ต้อง import 'dart:io'; เพื่อใช้ File ในการอับโหลดไฟล์รูปไปยังบักเก็ต tasl_bk โดยใช้ instance ของ SupabaseService เพื่อเรียกใช้งานฟังก์ชันที่เกี่ยวข้องกับฐานข้อมูล Supabase และทำการจัดการข้อมูลตามที่ต้องการ
    //ตั้งชื่อไฟล์ใหม่เพื่อไม่ให้ซ้ำก่อนอับโหลด
    final newFileName = '${DateTime.now()}_${file.path.split('/').last}';

    //อับโหลดไฟล์รูปไปยังบักเก็ต tasl_bk โดยใช้ instance ของ SupabaseService เพื่อเรียกใช้งานฟังก์ชันที่เกี่ยวข้องกับฐานข้อมูล Supabase และทำการจัดการข้อมูลตามที่ต้องการ
    await supabase.storage.from('task_bk').upload(newFileName, file);
    
    //ส่งค่าข้อมูล Url ของไฟล์ที่อับโหลดกลับไปใช้งานอย่้างที่ต้องการ
    return supabase.storage.from('task_bk').getPublicUrl(newFileName);
  }

  //เมธอด เพิ่ม ข้อมูลใหม่ลงในตาราง task_tb เพื่อไปใช้กับหน้า addTaskUi
  Future<void> inserTask(Task task) async {
    //เพิ่มข้อมูลใหม่ลงในตาราง task_tb โดยใช้ instance ของ SupabaseService เพื่อเรียกใช้งานฟังก์ชันที่เกี่ยวข้องกับฐานข้อมูล Supabase และทำการจัดการข้อมูลตามที่ต้องการ
    await supabase.from('task_tb').insert(task.toJson());
  }

  //เมธอด ลบ ไฟล์รูปจากบักเก็ต tasl_bk เพื่อไปใช้กับหน้า UpdateDeleteTaskU
  Future<void> deleteFileFromBucket(String task_image_url) async {
    //การลบจะตัดเอาไฟล์ เฉพาะชื่อ
    final fileName = task_image_url.split('/').last;
    await supabase.storage.from('task_bk').remove([fileName]);
  }

  //เมธอด แก้ไข ข้อมูลในตาราง task_tb เพื่อไปใช้กับหน้า  UpdateDeleteTaskUi 
  Future<void> updateTask(String id, Task task) async {
    //แก้ไขข้อมูลในตาราง task_tb โดยใช้ instance ของ SupabaseService เพื่อเรียกใช้งานฟังก์ชันที่เกี่ยวข้องกับฐานข้อมูล Supabase และทำการจัดการข้อมูลตามที่ต้องการ
    await supabase.from('task_tb').update(task.toJson()).eq('id',id);
  }

  //เมธอด ลบ ข้อมูลออกจากตาราง task_tb เพื่อไปใช้กับหน้า  UpdateDeleteTaskUi
  Future<void> deleteTask(String id) async {
    //แก้ไขข้อมูลในตาราง task_tb โดยใช้ instance ของ SupabaseService เพื่อเรียกใช้งานฟังก์ชันที่เกี่ยวข้องกับฐานข้อมูล Supabase และทำการจัดการข้อมูลตามที่ต้องการ
    await supabase.from('task_tb').delete().eq('id',id);
  }

}
  











