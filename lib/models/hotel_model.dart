class HotelModel {
  List<Room>? _rooms;

  List<Room>? get rooms => _rooms;

  set rooms(List<Room>? value) {
    _rooms = value;
  }
}

class Room {
  List<Member>? _members;
  List<Member>? _children;
  int? _pets;

  List<Member>? get members => _members;

  set members(List<Member>? value) {
    _members = value;
  }

  List<Member>? get children => _children;

  set children(List<Member>? value) {
    _children = value;
  }

  int? get pets => _pets?? 0;

  set pets(int? value) {
    _pets = value;
  }
}

class Member {
  String? _firstName;
  String? _lastName;
  String? _dob;

  String? get firstName => _firstName;

  set firstName(String? value) {
    _firstName = value;
  }

  String? get lastName => _lastName;

  set lastName(String? value) {
    _lastName = value;
  }

  String? get dob => _dob;

  set dob(String? value) {
    _dob = value;
  }
}
