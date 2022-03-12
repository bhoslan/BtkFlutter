  class StudentValidationMixin {

    String? validateFirstName(value){
      if(value.length<2){
      return "İsim en az iki harfli olmalıdır";
    }
      return null;
  }

    String? validateLastName(value){
      if(value.length<2){
        return "Soyadı en az iki harfli olmalıdır";
      }
      return null;
    }

    String? validateGrade(value){
      int grade = int.parse(value!);
      if (grade < 0 || grade > 100) {
        return "Aldığı not 0 ile 100 arasında olmalıdır";
      }
      return null;
    }
}
