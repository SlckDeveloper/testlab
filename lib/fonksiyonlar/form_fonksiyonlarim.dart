class FormFonksiyonlarim {
String? value;

FormFonksiyonlarim(this.value){}

  String? Function(String?)? validateFonksiyonu(value){
  this.value = value;
    return (value) {
      if (value != null && value.length < 3)
        return "İsim alanı en az 3 karakter olmalıdır";
      return null;
    };
  }
}