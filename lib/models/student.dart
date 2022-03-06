class Student{
  late String firstName ;
  late String lastName;
  late int grade ;
  late String status;
  late String image;

  Student(String firstName, String lastName, int grade, String image){
  this.firstName = firstName;
  this.lastName=lastName;
  this.grade=grade;
  status="Geçti";
  this.image=image;
  }
  String get getStatus{
    String message ="";
    if (this.grade >= 50) {
      message = "Geçti";
    } else if (grade >= 45) {
      message = "Bütünlemeye kaldı";
    } else {
      message = "Kaldı. Daha çok çalışman gerekli.";
    }
    return message;
  }
}