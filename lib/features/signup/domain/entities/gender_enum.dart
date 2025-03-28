enum Gender {
  male("Male", 0),
  female('Female', 1);

  final String genderName;
  final int genderValue;
  const Gender(this.genderName, this.genderValue);
}
