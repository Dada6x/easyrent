class EndPoints {
  static String baseUrl = "";
  static String Signin = "";
  static String Logout = "";
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
