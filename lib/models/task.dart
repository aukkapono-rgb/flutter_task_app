//ไฟล์ที่ใช้แมปข้อมูลจากฐานข้อมูลในตาราง supabase มาเป็นโมเดล Task เพื่อให้สามารถใช้งานในแอปพลิเคชันได้ง่ายขึ้น
class Task {
  //ตัวแปรที่ตรงกับคอลัมน์ในตารางของฐานข้อมูล supabase  สำคัญที่สุด ห้ามพิมพ์ผิด และต้องตรงกับชื่อ คอลัมน์ในตารางของฐานข้อมูล supabase ด้วย
  String? id;
  String? task_name;
  String? task_where;
  int? task_person;
  bool? task_status;
  String? task_duedate;
  String? task_image_url;


  Task({
    //constructor กำหนดตัวแปรที่ตรงกับคอลัมน์ในตารางของฐานข้อมูล supabase
    //ที่เอาไว้แพคข้อมูลเวลาส่งไป insert/update  ไในตารางฐานข้อมูล supabase โดยการสร้างฟังก์ชัน factory ที่ชื่อว่า fromJson ซึ่งรับพารามิเตอร์เป็น Map<String, dynamic> ที่เป็นข้อมูลในรูปแบบ JSON และแปลงข้อมูลนั้นมาเป็นโมเดล Task โดยการแมปค่าจากคีย์ใน JSON ให้ตรงกับตัวแปรในโมเดล Task
    //ที่เอาไว้แพคข้อมูลเวลาส่งค่าระหว่างหน้าจอ หรือ ส่งค่าข้อมูลไปมาใด
    this.id,
    this.task_name,
    this.task_where,
    this.task_person,
    this.task_status,
    this.task_duedate,
    this.task_image_url,
  });
    //คำสั่งในการแปลงข้อมูลจากฐานข้อมูล supabase ซึ่งเป็น Json มาใช้ในแอป -> fromJson 
  
  factory Task.fromJson(Map<String, dynamic> json) => Task(
        id: json['id'],
        task_name: json['task_name'],
        task_where: json['task_where'],
        task_person: json['task_person'],
        task_status: json['task_status'],
        task_duedate: json['task_duedate'],
        task_image_url: json['task_image_url'],
      );

    //คำสั่งในการแปลงข้อมูลจาก แอป   ไปเป็น Jason เพื่อส่งไปยังฐานข้อมูล supabase โดยการสร้างฟังก์ชัน -> toJson ที่จะทำการแปลงข้อมูลจากโมเดล Task เป็นรูปแบบ JSON ที่สามารถส่งไปยังฐานข้อมูล supabase ได้
  Map<String, dynamic> toJson() => {
        'id': id,
        'task_name': task_name,
        'task_where': task_where,
        'task_person': task_person,
        'task_status': task_status,
        'task_duedate': task_duedate,
        'task_image_url': task_image_url,
      };
  }