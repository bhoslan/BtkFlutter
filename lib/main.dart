//görüntüde android istiyoruz.

import 'package:deneme_2/models/student.dart';
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
  String secilenOgrenci="";

  List<Student> students = [
    Student("Ali", "Kemal", 85,"https://cdn.pixabay.com/photo/2017/06/05/07/58/butterfly-2373175_960_720.png"),
    Student("Veli", "Ali", 25,"https://cdn.pixabay.com/photo/2019/10/14/22/58/ukraine-4550155_960_720.jpg"),
    Student("Halil", "Veli", 48,"https://cdn.pixabay.com/photo/2014/12/16/22/25/woman-570883_960_720.jpg")
  ];

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Öğrenci Takip Sistemi"),
        ),
        body: buildBody(context));
  }

  String sinavHesapla(int puan) {
    String mesaj = "";
    if (puan > 50) {
      mesaj = "geçti";
    } else if (puan > 45) {
      mesaj = "bütünlemeye kaldı";
    } else {
      mesaj = "kaldı";
    }
    return mesaj;
  }

  void mesajGoster(BuildContext context, String mesaj) {
    var alert = AlertDialog(title: Text("Sonucu gör!"), content: Text(mesaj));
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
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(students[index].image)
                    ),
                    title: Text(students[index].firstName +" "+students[index].lastName),
                    subtitle: Text("Sınavdan aldığı not : " +students[index].grade.toString()+"["+students[index].getStatus+"]"),
                    trailing: buildStatusIcon(students[index].grade),
                    onTap: (){
                      setState(() {
                        secilenOgrenci=(students[index].firstName +" "+students[index].lastName) ;
                      });

                      print(secilenOgrenci);
                    },
                  );
                })),

        Text("Seçilen öğrenci : "+secilenOgrenci),
        Row(
          children: [
            Flexible(
              fit: FlexFit.tight,
              flex: 2 ,
             child: ElevatedButton(
                  child: Text("Yeni Öğrenci"),
                  onPressed: () {
                    var mesaj = sinavHesapla(55);
                    mesajGoster(context, mesaj);
                  },
                ),
              ),

            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: ElevatedButton(
                child: Text("Güncelle"),
                onPressed: () {
                  var mesaj = sinavHesapla(55);
                  mesajGoster(context, mesaj);
                },
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: ElevatedButton(
                child: Text("Kayıt sil!"),
                onPressed: () {
                  var mesaj = sinavHesapla(55);
                  mesajGoster(context, mesaj);
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
