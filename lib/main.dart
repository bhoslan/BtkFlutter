//görüntüde android istiyoruz.

import 'package:deneme_2/models/student.dart';
import 'package:deneme_2/screens/student_add.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  late Student selectedStudent = Student.withId(0, "", "", 0, "");
  List<Student> students = [
    Student.withId(1, "Ali", "Kemal", 85,
        "https://cdn.pixabay.com/photo/2017/06/05/07/58/butterfly-2373175_960_720.png"),
    Student.withId(2, "Veli", "Ali", 25,
        "https://cdn.pixabay.com/photo/2019/10/14/22/58/ukraine-4550155_960_720.jpg"),
    Student.withId(3, "Halil", "Veli", 48,
        "https://cdn.pixabay.com/photo/2014/12/16/22/25/woman-570883_960_720.jpg")
  ];


  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Öğrenci Takip Sistemi"),
        ),
        body: buildBody(context));
  }

  void showMessage(BuildContext context, String mesaj) {
    var alert =
        AlertDialog(title: const Text("İşlem sonucu!"), content: Text(mesaj));
    showDialog(
        context: context,
        builder: (BuildContext context) => alert); //context te alerti göster.
  }

  buildBody(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: ListView.builder(
                //Listview sınıfının builder isimli constructor ı çalışıyor
                itemCount: students.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                   // leading: CircleAvatar(
                     //   backgroundImage: NetworkImage(students[index].image)),
                    title: Text(students[index].firstName +
                        " " +
                        students[index].lastName),
                    subtitle: Text("Sınavdan aldığı not : " +
                        students[index].grade.toString() +
                        "[" +
                        students[index].getStatus +
                        "]"),
                    trailing: buildStatusIcon(students[index].grade),
                    onTap: () {
                      setState(() {
                        selectedStudent = students[index];
                      });

                      print(selectedStudent.firstName);
                    },
                  );
                })),
        Text("Seçilen öğrenci : " + selectedStudent.firstName),
        Row(
          children: <Widget>[
            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green)),
                child: Row(children: <Widget>[Text("Yeni Öğrenci")]),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentAdd(students)));
                },
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.amber)),
                child: Row(
                  children: <Widget>[Text("Güncelle")],
                ),
                onPressed: () {
                  var message = "Updated";
                  showMessage(context, message);
                },
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black12)),
                child: Text("Kayıt sil!"),
                onPressed: () {
                  setState(() {
                    students.remove(selectedStudent);
                  });

                  var message = selectedStudent.firstName + " Deleted";
                  showMessage(context, message);
                },
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget buildStatusIcon(int grade) {
    if (grade >= 50) {
      return Icon(Icons.done_outline_outlined);
    } else if (grade >= 45) {
      return Icon(Icons.arrow_forward);
    } else {
      return Icon(Icons.clear);
    }
  }
}
