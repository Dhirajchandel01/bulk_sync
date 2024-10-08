
class   AppUrl {
//  static String checkPendingOrder;

  static var getSaveData;

  static String get getSchemeByMobile => "v1/getSchemeDetails";

  static String get createCustomer => "CustomerMaster/CreateCustomers";

  static String get getUnixTimestampsData => "getUnixTimestampsData";

  // static String getLeaveData;

  static String get getPettyCashId => "v1/pettyCash/createPettyCashId";

  //static String approveRegularization;

  //static String regularizationData;


  // static String urlBase() {
  //   return App.instance.devMode
  //        ? "http://125.23.186.50/connectus-dummy/api/"
  //        : "http://125.23.186.50/connectus-dummy/api/";
  //   // ? "http://114.29.232.154/connectus_live/api/"
  //  //  : "http://114.29.232.154/connectus_live/api/";
  //
  // }

  // static String urlBaseLiveRate() {
  //   return App.instance.devMode
  //       ? "http://114.29.232.154/connectus_live/api/"
  //       : "http://114.29.232.154/connectus_live/api/";
  //   //114.29.232.154/connectus-dummy/api/v1/pettyCash/getPettyCashEmployee
  // }




  // // local url
  // static String urlBaseApI(){
  //   return "http://10.2.11.90:8085/api/";
  // }


  // global url dot net api base url
  static String urlBaseApI() {
    // http://125.23.186.50
    return "http://125.23.186.50:8085/api/";
  }

  static String baseUrl() {
    return "http://125.23.186.50/connectus-dummy/api/";
  }

  static String urlBaseRoot() {
    return "http://10.2.11.90:8085/";
  }

  static String urlFaceBase() {
    return "http://test.csjewellers.com:81/cspl/";
  }

  static String urlDummyBase() {
    return "http://182.76.32.122/connectus-dummy/api/";
  }

  // static String uploadPath() {
  //   return urlBase().replaceAll("api/", "");
  // }

  static String get getAttendance => "getTotalInOut";

  // static String urlFaceBase() {
  //   return "http://test.csjewellers.com:81/cspl/";
  // }
  //
  // static String uploadPath() {
  //   return "http://114.29.232.154/connectus/";
  // }

  static String urlConnectUsDummy() {
    return "http://13.126.136.155";
  }

  static String subPath() {
    return '/connectus-dummy/api/v1/';
  }

  static String subDummyPath({bool temp = false}) {
    return subPath();
  }

  static String get login => "v1/login";

  static String get getCustomerDetails => "CustomerMaster/getCustomer";

  static String get getDeliveryNoteDetails => "CustomerMaster/getDeleveryNoteDetails";

  static String get createDynamicQR => "CustomerMaster/createDynamicQR";

  static String get createSchemeDynamicQR => "Scheme/createDynamicQR";

//  static String get getOrderStatus => "CustomerMaster/getOrderStatus";

  static String get getOrderStatus => "CustomerMaster/getPaymentStatusFromBillingApp";

  static String get getSchemeOrderDetails => "Scheme/GetOrderDetails";

  static String get getSchemeList => "Scheme/GetAllSchemeList";

  static String get addNewScheme => "Scheme/AddNewScheme";

  static String get crateCustomerScheme => "Scheme/AddNewScheme";

  static String get getSchemeOrderStatus => "Scheme/getOrderStatus";

  static String get  getSalesEmpData => "getSalesEmpData";


// static String get target => "v1/target";
//
// static String get period => "v1/period";
//
// static String get getEmpName => "v1/getEmpName";
//
// static String get submitFeedback => "v1/SendMail";
//
// //static String get index => "v1/index1";
// static String get uploadProfile => "v1/updateProfile";
//
// static String get attendanceReport => "v1/monthly_attendance";
//
// static String get getPromocodeCategories =>
//     "v1/my_goal/promocode/category_list";
//
// static String get getViewPettycash =>
//     "v1/pettyCash/getPettyCashVoucherDetails";
//
// static String get getemployeepettycashdropdown =>
//       "v1/pettyCash/getPettyCashEmployee";
//
// static String get getPettyCashreRaiseEmployeeList =>
//     "v1/pettyCash/getPettyCashreRaiseEmployeeList";
//
// static String get getemployeedebtorscashdropdown =>
//     "v1/pettyCash/getPettyCashEmployee";
//
// static String get getexpensepettycashdropdown =>
//     "v1/pettyCash/getExpenseData";
//
// static String get generatePromocode =>
//     "v1/my_goal/promocode/generate_promocode";
//
// static String get opinionList => "v1/my_goal/opinion/opinion_list";
//
// static String get questionsList => "v1/my_goal/opinion/opinion_questions";
//
// static String get opinionSubmit => "v1/my_goal/opinion/opinion_submit";
//
// static String get opinionSubmitedQuestions =>
//     "v1/my_goal/opinion/opinion_submited_questions";
//
// static String get regularization => "v1/regularization";
//
// static String get regularizationData => "v1/getRegularization";
//
// static String get salarySlipData => "v1/postExportMySalarySlip";
//
// static String get approveRegularization => "v1/postRegularizedData";
//
// static String get getFaceData =>
//     kDebugMode ? "emb_cspl.json" : "emb_new.json";
//
// // static String get getFaceData => kDebugMode ? "emb_new.json" : "emb_new.json";
//
// static String get oldFaceData => "emb.json";
//
// //static String get addFaceDataOld => "AddUserFace.php";
//
// //static String get addFaceData => "AddUserFace.php";
// static String get addFaceData =>
//     kDebugMode ? "AddUserFaceCspl.php" : "AddUserFaceNew.php";
//
// // static String get addFaceData => "AddUserFaceNew.php";
//
// static String get empId => "getEmpId";
//
// static String get uploadImage => "uploadImg";
//
// // static String get saveAttendance => "attendanceApi";
// static String get saveAttendance => "insertAttendanceData";
//
// static String get saveLocation => "saveLocation.php";
//
// static String get getReportAttendance => "getAttendanceData";
//
// static String get validateEmployee => "v1/GetEmpDetails";
//
// static String get todayApprovalReport => "todayApprovalReport";
//
// static String get getTotalInOutData => "getTotalInOut";
//
// static String get getRejectApproval => "getRejectApproval";
//
// static String get getApproval => "getApproval";
//
// static String get getApprovalData => "getApprovalData";
//
// static String get getAllEmployeeAttendancesReport => "attendanceReport";
//
// static String get getCalenderReport => "calenderReport";
//
// static String get getAllEmployee => "getAllEmployee";
//
// static String get createPettyCash => "v1/pettyCash/createPettyCashVoucher";
//
// static String get getNotifications => "v1/getNotification";
//
// static String get updateNotificationStatus => "v1/updateNotificationStatus";
//
// static String get getPettyCash => "v1/pettyCash/getPettyCashVoucherDetails";
//
// static String get updatePettyCash => "v1/pettyCash/updatePettyCashVoucher/id";
//
// static String get updatePettyCashStatus => "v1/pettyCash/updateStatus";
//
// static String get reReaiseActionFromUser =>
//     "v1/pettyCash/reReaiseActionFromUser";
//
// static String get getPettyCashVoucherDetails =>
//     "v1/pettyCash/getPettyCashVoucherDetailsById/1";
//
// static String get getPettyCashBalance => "v1/pettyCash/getBalance/id";
//
// static String get pettyCashAddBalance => "v1/pettyCash/addBalance";
//
// static String get postingDataToBillCheck =>
//     "v1/pettyCash/postingDataToBillCheck";
//
// static String get getDebtorReport => "v1/getDebtorReport";
//
// static String get getBranches => "getBranches";
//
// static String get addRemark => "v1/getAddRemark/";
//
// static String get getEmpPaymentAuthority => "v1/pettyCash/getEmpPaymentAuthority/";
}
