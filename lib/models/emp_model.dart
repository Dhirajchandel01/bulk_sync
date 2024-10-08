
class EmpModel {
  EmpModel({
    int? status,
    String? message,
    List<Data>? data,
    bool? hasmore,
  }) {
    _status = status;
    _message = message;
    _data = data;
    _hasmore = hasmore;
  }

  EmpModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
    _hasmore = json['hasmore'];
  }

  int? _status;
  String? _message;
  List<Data>? _data;
  bool? _hasmore;

  EmpModel copyWith({
    int? status,
    String? message,
    List<Data>? data,
    bool? hasmore,
  }) =>
      EmpModel(
        status: status ?? _status,
        message: message ?? _message,
        data: data ?? _data,
        hasmore: hasmore ?? _hasmore,
      );

  int? get status => _status;

  String? get message => _message;

  List<Data>? get data => _data;

  bool? get hasmore => _hasmore;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['hasmore'] = _hasmore;
    return map;
  }
}

/// id : 1
/// unix_timestamp : "1728030605144"
/// empid : 1548
/// emp_name : "1548 SAGAR SANJAY PATIL"
/// is_active : 1
/// remark : null
/// created_at : null
/// created_by : null
/// updated_at : null
/// updated_by : null

class Data {
  int? _id;
  String? _unixTimestamp;  // Changed to int
  int? _empid;
  String? _empName;
  int? _isActive;
  dynamic _remark;
  dynamic _createdAt;
  dynamic _createdBy;
  dynamic _updatedAt;
  dynamic _updatedBy;

  Data({
    int? id,
    String? unixTimestamp,  // Changed to int
    int? empid,
    String? empName,
    int? isActive,
    dynamic remark,
    dynamic createdAt,
    dynamic createdBy,
    dynamic updatedAt,
    dynamic updatedBy,
  }) {
    _id = id;
    _unixTimestamp = unixTimestamp;  // Changed to int
    _empid = empid;
    _empName = empName;
    _isActive = isActive;
    _remark = remark;
    _createdAt = createdAt;
    _createdBy = createdBy;
    _updatedAt = updatedAt;
    _updatedBy = updatedBy;
  }

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _unixTimestamp = json['unix_timestamp'];  // Assuming it's an int from the API
    _empid = json['empid'];
    _empName = json['emp_name'];
    _isActive = json['is_active'];
    _remark = json['remark'];
    _createdAt = json['created_at'];
    _createdBy = json['created_by'];
    _updatedAt = json['updated_at'];
    _updatedBy = json['updated_by'];
  }

  // Getter and setter for unix_timestamp
  String? get unixTimestamp => _unixTimestamp;
  set unixTimestamp(String? unixTimestamp) => _unixTimestamp = unixTimestamp;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['unix_timestamp'] = _unixTimestamp;  // Now properly handles int
    map['empid'] = _empid;
    map['emp_name'] = _empName;
    map['is_active'] = _isActive;
    map['remark'] = _remark;
    map['created_at'] = _createdAt;
    map['created_by'] = _createdBy;
    map['updated_at'] = _updatedAt;
    map['updated_by'] = _updatedBy;
    return map;
  }
}

