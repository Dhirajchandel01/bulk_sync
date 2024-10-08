class CustomerSchemeModel {
  int? _status;
  String? _message;
  List<Data>? _data;
  bool? _hasmore;

  CustomerSchemeModel({int? status, String? message, List<Data>? data, bool? hasmore}) {
    if (status != null) {
      this._status = status;
    }
    if (message != null) {
      this._message = message;
    }
    if (data != null) {
      this._data = data;
    }
    if (hasmore != null) {
      this._hasmore = hasmore;
    }
  }

  int? get status => _status;
  set status(int? status) => _status = status;
  String? get message => _message;
  set message(String? message) => _message = message;
  List<Data>? get data => _data;
  set data(List<Data>? data) => _data = data;
  bool? get hasmore => _hasmore;
  set hasmore(bool? hasmore) => _hasmore = hasmore;

  CustomerSchemeModel.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = <Data>[];
      json['data'].forEach((v) {
        _data!.add(new Data.fromJson(v));
      });
    }
    _hasmore = json['hasmore'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this._status;
    data['message'] = this._message;
    if (this._data != null) {
      data['data'] = this._data!.map((v) => v.toJson()).toList();
    }
    data['hasmore'] = this._hasmore;
    return data;
  }
}

class Data {
  int? _id;
  String? _schemeOpeningDate;
  String? _savingSchemeNo;
  String? _customerMobileNo;
  String? _customerName;
  String? _maturityDate;
  String? _discountForGold;
  String? _discountForDiamondJewellery;
  String? _installmentAmount;
  String? _totalInstallmentAmount;
  String? _unixTimestamp;
  int? _isActive;
  String? _remark;
  String? _createdAt;
  dynamic _createdBy;
  String? _updatedAt;
  dynamic _updatedBy;

  Data(
      {int? id,
        String? schemeOpeningDate,
        String? savingSchemeNo,
        String? customerMobileNo,
        String? customerName,
        String? maturityDate,
        String? discountForGold,
        String? discountForDiamondJewellery,
        String? installmentAmount,
        String? totalInstallmentAmount,
        String? unixTimestamp,
        int? isActive,
        String? remark,
        String? createdAt,
        dynamic createdBy,
        dynamic updatedAt,
        dynamic updatedBy}) {
    if (id != null) {
      this._id = id;
    }
    if (schemeOpeningDate != null) {
      this._schemeOpeningDate = schemeOpeningDate;
    }
    if (savingSchemeNo != null) {
      this._savingSchemeNo = savingSchemeNo;
    }
    if (customerMobileNo != null) {
      this._customerMobileNo = customerMobileNo;
    }
    if (customerName != null) {
      this._customerName = customerName;
    }
    if (maturityDate != null) {
      this._maturityDate = maturityDate;
    }
    if (discountForGold != null) {
      this._discountForGold = discountForGold;
    }
    if (discountForDiamondJewellery != null) {
      this._discountForDiamondJewellery = discountForDiamondJewellery;
    }
    if (installmentAmount != null) {
      this._installmentAmount = installmentAmount;
    }
    if (totalInstallmentAmount != null) {
      this._totalInstallmentAmount = totalInstallmentAmount;
    }
    if (unixTimestamp != null) {
      this._unixTimestamp = unixTimestamp;
    }
    if (isActive != null) {
      this._isActive = isActive;
    }
    if (remark != null) {
      this._remark = remark;
    }
    if (createdAt != null) {
      this._createdAt = createdAt;
    }
    if (createdBy != null) {
      this._createdBy = createdBy;
    }
    if (updatedAt != null) {
      this._updatedAt = updatedAt;
    }
    if (updatedBy != null) {
      this._updatedBy = updatedBy;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get schemeOpeningDate => _schemeOpeningDate;
  set schemeOpeningDate(String? schemeOpeningDate) =>
      _schemeOpeningDate = schemeOpeningDate;
  String? get savingSchemeNo => _savingSchemeNo;
  set savingSchemeNo(String? savingSchemeNo) =>
      _savingSchemeNo = savingSchemeNo;
  String? get customerMobileNo => _customerMobileNo;
  set customerMobileNo(String? customerMobileNo) =>
      _customerMobileNo = customerMobileNo;
  String? get customerName => _customerName;
  set customerName(String? customerName) => _customerName = customerName;
  String? get maturityDate => _maturityDate;
  set maturityDate(String? maturityDate) => _maturityDate = maturityDate;
  String? get discountForGold => _discountForGold;
  set discountForGold(String? discountForGold) =>
      _discountForGold = discountForGold;
  String? get discountForDiamondJewellery => _discountForDiamondJewellery;
  set discountForDiamondJewellery(String? discountForDiamondJewellery) =>
      _discountForDiamondJewellery = discountForDiamondJewellery;
  String? get installmentAmount => _installmentAmount;
  set installmentAmount(String? installmentAmount) =>
      _installmentAmount = installmentAmount;
  String? get totalInstallmentAmount => _totalInstallmentAmount;
  set totalInstallmentAmount(String? totalInstallmentAmount) =>
      _totalInstallmentAmount = totalInstallmentAmount;
  String? get unixTimestamp => _unixTimestamp;
  set unixTimestamp(String? unixTimestamp) => _unixTimestamp = unixTimestamp;
  int? get isActive => _isActive;
  set isActive(int? isActive) => _isActive = isActive;
  String? get remark => _remark;
  set remark(String? remark) => _remark = remark;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get createdBy => _createdBy;
  set createdBy(String? createdBy) => _createdBy = createdBy;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;
  String? get updatedBy => _updatedBy;
  set updatedBy(String? updatedBy) => _updatedBy = updatedBy;

  Data.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _schemeOpeningDate = json['scheme_opening_date'];
    _savingSchemeNo = json['saving_scheme_no'];
    _customerMobileNo = json['customer_mobile_no'];
    _customerName = json['customer_name'];
    _maturityDate = json['maturity_date'];
    _discountForGold = json['discount_for_gold'];
    _discountForDiamondJewellery = json['discount_for_diamond_jewellery'];
    _installmentAmount = json['installment_amount'];
    _totalInstallmentAmount = json['total_installment_amount'];
    _unixTimestamp = json['unix_timestamp'];
    _isActive = json['is_active'];
    _remark = json['remark'];
    _createdAt = json['created_at'];
    _createdBy = json['created_by'];
    _updatedAt = json['updated_at'];
    _updatedBy = json['updated_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['scheme_opening_date'] = this._schemeOpeningDate;
    data['saving_scheme_no'] = this._savingSchemeNo;
    data['customer_mobile_no'] = this._customerMobileNo;
    data['customer_name'] = this._customerName;
    data['maturity_date'] = this._maturityDate;
    data['discount_for_gold'] = this._discountForGold;
    data['discount_for_diamond_jewellery'] = this._discountForDiamondJewellery;
    data['installment_amount'] = this._installmentAmount;
    data['total_installment_amount'] = this._totalInstallmentAmount;
    data['unix_timestamp'] = this._unixTimestamp;
    data['is_active'] = this._isActive;
    data['remark'] = this._remark;
    data['created_at'] = this._createdAt;
    data['created_by'] = this._createdBy;
    data['updated_at'] = this._updatedAt;
    data['updated_by'] = this._updatedBy;
    return data;
  }
}
