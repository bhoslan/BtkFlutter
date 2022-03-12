import 'package:deneme_2/models/student.dart';
import 'package:deneme_2/validation/student_validator.dart';
import 'package:flutter/material.dart';

class StudentAdd extends StatefulWidget {
  late List<Student> students;
  StudentAdd(List<Student> students) {
    this.students = students;
  }

  @override
  State<StatefulWidget> createState() {
    return _StudentAddState(students);
  }
}

class _StudentAddState extends State with StudentValidationMixin {
  final _formKey = GlobalKey<FormState>();
      var student = Student.withoutInfo();

  late List<Student> students;
  _StudentAddState(List<Student> students) {
    this.students = students;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Öğrenci Ekleme Sayfası"),
      ),
      body: Container(
        margin: EdgeInsets.all(5.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              buildFirstNameField(),
              buildLastNameField(),
              buildGradeField(),
              buildElevatedButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildFirstNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Öğrenci adı", hintText: "Ali"),
      validator: validateFirstName,
      onSaved: (value) {
        student.firstName = value!;
      },
    );
  }

  Widget buildLastNameField() {
    return TextFormField(
      decoration:
          InputDecoration(labelText: "Öğrenci soyadı", hintText: "Yılmaz"),
      validator: validateLastName,
      onSaved: (value) {
        student.lastName = value!;
      },
    );
  }

  Widget buildGradeField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Öğrenci notu", hintText: "75"),
      validator: validateGrade,
      onSaved: (value) {
        student.grade = int.parse(value!);
      },
    );
  }

  Widget buildElevatedButton() {
    return ElevatedButton(
      child: const Text('Kaydet'),
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          _formKey.currentState!.save();
          students.add(student);
          Navigator.pop(context);
        }
      },
    );
  }
}
