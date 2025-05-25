class EndPoints {
  static String baseUrl = "";
  static String Login = "/login";
  static String Logout = "/logOut";
  static String signUp = "/logOut";
  static String fetchAllProperties = "/logOut";
  // static String Logout = "/logOut";
  // static String Logout = "/logOut";

  static String getUserData(id) {
    return "apiURL/user/$id";
  }

  const EndPoints();
}

class ApiKey {
  static String status = "status"; // must be the same with the response
  static String email = "email";
  static String password = "password";
  static String token = "token";
  static String errorMessage = "errorMessage";
  const ApiKey();
}
// login 
// register 
// get code 
// verify code 
// logout 

