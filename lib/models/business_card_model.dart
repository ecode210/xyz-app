class BusinessCardModel {
  BusinessCardModel({
    String? id,
    String? fullName,
    String? photo,
    String? notes,
    num? timestamp,
  }) {
    _id = id;
    _fullName = fullName;
    _photo = photo;
    _notes = notes;
    _timestamp = timestamp;
  }

  BusinessCardModel.fromJson(dynamic json) {
    _id = json['id'];
    _fullName = json['full_name'];
    if (_fullName != null) {
      _fullName = _fullName![0].toUpperCase() + _fullName!.substring(1);
    }
    _photo = json['photo'];
    _notes = json['notes'];
    if (_notes != null) {
      _notes = _notes![0].toUpperCase() + _notes!.substring(1);
    }
    _timestamp = json['timestamp'];
  }

  String? _id;
  String? _fullName;
  String? _photo;
  String? _notes;
  num? _timestamp;

  String get id => _id ?? "---";

  String get fullName => _fullName ?? "--- ---";

  String get photo => _photo ?? "---";

  String get notes => _notes ?? "---";

  num get timestamp => _timestamp ?? 0;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_id != null) map['id'] = _id;
    if (_fullName != null) map['full_name'] = _fullName;
    if (_photo != null) map['photo'] = _photo;
    if (_notes != null) map['notes'] = _notes;
    if (_timestamp != null) map['timestamp'] = _timestamp;
    return map;
  }
}
