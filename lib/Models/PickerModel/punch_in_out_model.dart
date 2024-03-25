import 'dart:convert';

class PickerPunchInOutModel {
  bool status;
  List<Datum> data;
  String message;

  PickerPunchInOutModel({
    required this.status,
    required this.data,
    required this.message,
  });

  PickerPunchInOutModel copyWith({
    bool? status,
    List<Datum>? data,
    String? message,
  }) =>
      PickerPunchInOutModel(
        status: status ?? this.status,
        data: data ?? this.data,
        message: message ?? this.message,
      );

  factory PickerPunchInOutModel.fromRawJson(String str) => PickerPunchInOutModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PickerPunchInOutModel.fromJson(Map<String, dynamic> json) => PickerPunchInOutModel(
    status: json["status"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message,
  };
}

class Datum {
  String attendanceId;
  Staff staff;
  String createdBy;
  DateTime createdDate;
  DateTime punchInDate;
  String punchInTime;
  dynamic punchOutDate;
  dynamic punchOutTime;

  Datum({
    required this.attendanceId,
    required this.staff,
    required this.createdBy,
    required this.createdDate,
    required this.punchInDate,
    required this.punchInTime,
    required this.punchOutDate,
    required this.punchOutTime,
  });

  Datum copyWith({
    String? attendanceId,
    Staff? staff,
    String? createdBy,
    DateTime? createdDate,
    DateTime? punchInDate,
    String? punchInTime,
    dynamic punchOutDate,
    dynamic punchOutTime,
  }) =>
      Datum(
        attendanceId: attendanceId ?? this.attendanceId,
        staff: staff ?? this.staff,
        createdBy: createdBy ?? this.createdBy,
        createdDate: createdDate ?? this.createdDate,
        punchInDate: punchInDate ?? this.punchInDate,
        punchInTime: punchInTime ?? this.punchInTime,
        punchOutDate: punchOutDate ?? this.punchOutDate,
        punchOutTime: punchOutTime ?? this.punchOutTime,
      );

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    attendanceId: json["attendance_id"],
    staff: Staff.fromJson(json["staff"]),
    createdBy: json["created_by"],
    createdDate: DateTime.parse(json["created_date"]),
    punchInDate: DateTime.parse(json["punch_in_date"]),
    punchInTime: json["punch_in_time"],
    punchOutDate: json["punch_out_date"],
    punchOutTime: json["punch_out_time"],
  );

  Map<String, dynamic> toJson() => {
    "attendance_id": attendanceId,
    "staff": staff.toJson(),
    "created_by": createdBy,
    "created_date": createdDate.toIso8601String(),
    "punch_in_date": "${punchInDate.year.toString().padLeft(4, '0')}-${punchInDate.month.toString().padLeft(2, '0')}-${punchInDate.day.toString().padLeft(2, '0')}",
    "punch_in_time": punchInTime,
    "punch_out_date": punchOutDate,
    "punch_out_time": punchOutTime,
  };
}

class Staff {
  String staffId;
  User user;
  String createdBy;
  DateTime createdDate;
  String name;
  String nationality;
  String staffIdNo;
  String curAddress;
  String perAddress;
  String curMobile;
  String perMobile;
  String bloodGroup;
  String passportNo;
  DateTime passportExpDate;
  String emirateId;
  DateTime emirateExpDate;
  String driveLicenceNo;
  DateTime driveLicenceExp;
  String healthCertNo;
  DateTime healthCertExp;
  String insuranceNo;
  DateTime insuranceExpDate;
  String emergencyContactPhn;
  String emergencyContactMob;
  dynamic staffPicLocation;
  String status;
  String location;
  String branch;

  Staff({
    required this.staffId,
    required this.user,
    required this.createdBy,
    required this.createdDate,
    required this.name,
    required this.nationality,
    required this.staffIdNo,
    required this.curAddress,
    required this.perAddress,
    required this.curMobile,
    required this.perMobile,
    required this.bloodGroup,
    required this.passportNo,
    required this.passportExpDate,
    required this.emirateId,
    required this.emirateExpDate,
    required this.driveLicenceNo,
    required this.driveLicenceExp,
    required this.healthCertNo,
    required this.healthCertExp,
    required this.insuranceNo,
    required this.insuranceExpDate,
    required this.emergencyContactPhn,
    required this.emergencyContactMob,
    required this.staffPicLocation,
    required this.status,
    required this.location,
    required this.branch,
  });

  Staff copyWith({
    String? staffId,
    User? user,
    String? createdBy,
    DateTime? createdDate,
    String? name,
    String? nationality,
    String? staffIdNo,
    String? curAddress,
    String? perAddress,
    String? curMobile,
    String? perMobile,
    String? bloodGroup,
    String? passportNo,
    DateTime? passportExpDate,
    String? emirateId,
    DateTime? emirateExpDate,
    String? driveLicenceNo,
    DateTime? driveLicenceExp,
    String? healthCertNo,
    DateTime? healthCertExp,
    String? insuranceNo,
    DateTime? insuranceExpDate,
    String? emergencyContactPhn,
    String? emergencyContactMob,
    dynamic staffPicLocation,
    String? status,
    String? location,
    String? branch,
  }) =>
      Staff(
        staffId: staffId ?? this.staffId,
        user: user ?? this.user,
        createdBy: createdBy ?? this.createdBy,
        createdDate: createdDate ?? this.createdDate,
        name: name ?? this.name,
        nationality: nationality ?? this.nationality,
        staffIdNo: staffIdNo ?? this.staffIdNo,
        curAddress: curAddress ?? this.curAddress,
        perAddress: perAddress ?? this.perAddress,
        curMobile: curMobile ?? this.curMobile,
        perMobile: perMobile ?? this.perMobile,
        bloodGroup: bloodGroup ?? this.bloodGroup,
        passportNo: passportNo ?? this.passportNo,
        passportExpDate: passportExpDate ?? this.passportExpDate,
        emirateId: emirateId ?? this.emirateId,
        emirateExpDate: emirateExpDate ?? this.emirateExpDate,
        driveLicenceNo: driveLicenceNo ?? this.driveLicenceNo,
        driveLicenceExp: driveLicenceExp ?? this.driveLicenceExp,
        healthCertNo: healthCertNo ?? this.healthCertNo,
        healthCertExp: healthCertExp ?? this.healthCertExp,
        insuranceNo: insuranceNo ?? this.insuranceNo,
        insuranceExpDate: insuranceExpDate ?? this.insuranceExpDate,
        emergencyContactPhn: emergencyContactPhn ?? this.emergencyContactPhn,
        emergencyContactMob: emergencyContactMob ?? this.emergencyContactMob,
        staffPicLocation: staffPicLocation ?? this.staffPicLocation,
        status: status ?? this.status,
        location: location ?? this.location,
        branch: branch ?? this.branch,
      );

  factory Staff.fromRawJson(String str) => Staff.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Staff.fromJson(Map<String, dynamic> json) => Staff(
    staffId: json["staff_id"],
    user: User.fromJson(json["user"]),
    createdBy: json["created_by"],
    createdDate: DateTime.parse(json["created_date"]),
    name: json["name"],
    nationality: json["nationality"],
    staffIdNo: json["staff_idNo"],
    curAddress: json["cur_address"],
    perAddress: json["per_address"],
    curMobile: json["cur_mobile"],
    perMobile: json["per_mobile"],
    bloodGroup: json["blood_group"],
    passportNo: json["passport_no"],
    passportExpDate: DateTime.parse(json["passport_exp_date"]),
    emirateId: json["emirate_id"],
    emirateExpDate: DateTime.parse(json["emirate_exp_date"]),
    driveLicenceNo: json["drive_licence_no"],
    driveLicenceExp: DateTime.parse(json["drive_licence_exp"]),
    healthCertNo: json["health_cert_no"],
    healthCertExp: DateTime.parse(json["health_cert_exp"]),
    insuranceNo: json["insurance_no"],
    insuranceExpDate: DateTime.parse(json["insurance_exp_date"]),
    emergencyContactPhn: json["emergency_contact_phn"],
    emergencyContactMob: json["emergency_contact_mob"],
    staffPicLocation: json["staff_pic_location"],
    status: json["status"],
    location: json["location"],
    branch: json["branch"],
  );

  Map<String, dynamic> toJson() => {
    "staff_id": staffId,
    "user": user.toJson(),
    "created_by": createdBy,
    "created_date": createdDate.toIso8601String(),
    "name": name,
    "nationality": nationality,
    "staff_idNo": staffIdNo,
    "cur_address": curAddress,
    "per_address": perAddress,
    "cur_mobile": curMobile,
    "per_mobile": perMobile,
    "blood_group": bloodGroup,
    "passport_no": passportNo,
    "passport_exp_date": "${passportExpDate.year.toString().padLeft(4, '0')}-${passportExpDate.month.toString().padLeft(2, '0')}-${passportExpDate.day.toString().padLeft(2, '0')}",
    "emirate_id": emirateId,
    "emirate_exp_date": "${emirateExpDate.year.toString().padLeft(4, '0')}-${emirateExpDate.month.toString().padLeft(2, '0')}-${emirateExpDate.day.toString().padLeft(2, '0')}",
    "drive_licence_no": driveLicenceNo,
    "drive_licence_exp": "${driveLicenceExp.year.toString().padLeft(4, '0')}-${driveLicenceExp.month.toString().padLeft(2, '0')}-${driveLicenceExp.day.toString().padLeft(2, '0')}",
    "health_cert_no": healthCertNo,
    "health_cert_exp": "${healthCertExp.year.toString().padLeft(4, '0')}-${healthCertExp.month.toString().padLeft(2, '0')}-${healthCertExp.day.toString().padLeft(2, '0')}",
    "insurance_no": insuranceNo,
    "insurance_exp_date": insuranceExpDate.toIso8601String(),
    "emergency_contact_phn": emergencyContactPhn,
    "emergency_contact_mob": emergencyContactMob,
    "staff_pic_location": staffPicLocation,
    "status": status,
    "location": location,
    "branch": branch,
  };
}

class User {
  int id;
  String password;
  DateTime lastLogin;
  bool isSuperuser;
  String username;
  String firstName;
  String lastName;
  String email;
  bool isStaff;
  bool isActive;
  DateTime dateJoined;
  String userType;
  List<dynamic> groups;
  List<dynamic> userPermissions;

  User({
    required this.id,
    required this.password,
    required this.lastLogin,
    required this.isSuperuser,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.isStaff,
    required this.isActive,
    required this.dateJoined,
    required this.userType,
    required this.groups,
    required this.userPermissions,
  });

  User copyWith({
    int? id,
    String? password,
    DateTime? lastLogin,
    bool? isSuperuser,
    String? username,
    String? firstName,
    String? lastName,
    String? email,
    bool? isStaff,
    bool? isActive,
    DateTime? dateJoined,
    String? userType,
    List<dynamic>? groups,
    List<dynamic>? userPermissions,
  }) =>
      User(
        id: id ?? this.id,
        password: password ?? this.password,
        lastLogin: lastLogin ?? this.lastLogin,
        isSuperuser: isSuperuser ?? this.isSuperuser,
        username: username ?? this.username,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        isStaff: isStaff ?? this.isStaff,
        isActive: isActive ?? this.isActive,
        dateJoined: dateJoined ?? this.dateJoined,
        userType: userType ?? this.userType,
        groups: groups ?? this.groups,
        userPermissions: userPermissions ?? this.userPermissions,
      );

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    password: json["password"],
    lastLogin: DateTime.parse(json["last_login"]),
    isSuperuser: json["is_superuser"],
    username: json["username"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    email: json["email"],
    isStaff: json["is_staff"],
    isActive: json["is_active"],
    dateJoined: DateTime.parse(json["date_joined"]),
    userType: json["user_type"],
    groups: List<dynamic>.from(json["groups"].map((x) => x)),
    userPermissions: List<dynamic>.from(json["user_permissions"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "password": password,
    "last_login": lastLogin.toIso8601String(),
    "is_superuser": isSuperuser,
    "username": username,
    "first_name": firstName,
    "last_name": lastName,
    "email": email,
    "is_staff": isStaff,
    "is_active": isActive,
    "date_joined": dateJoined.toIso8601String(),
    "user_type": userType,
    "groups": List<dynamic>.from(groups.map((x) => x)),
    "user_permissions": List<dynamic>.from(userPermissions.map((x) => x)),
  };
}
