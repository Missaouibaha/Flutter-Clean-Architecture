class SpecializationEntity {
  int? id;
  String? name;
  bool? isSelected = false;
  SpecializationEntity({this.id, this.name, this.isSelected});

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is SpecializationEntity &&
            runtimeType == other.runtimeType &&
            id == other.id &&
            isSelected == other.isSelected;
  }

  @override
  int get hashCode => id.hashCode;
}
