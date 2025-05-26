class EndPoints {
  static String baseUrl = "https://dummyjson.com";
  static String Login = "/users/7";
  static String Logout = "/logOut";
  static String signUp = "/SignUp";
  static String fetchAllProperties = "/getAllPropereties";
  // static String Logout = "/logOut";
  // static String Logout = "/logOut";

  // static String getUserData(id) {
  //   return "ddwdwdwdwdwdwd/user/$id";
  // }

  const EndPoints();
}


class ApiKey {
  static String status = "status"; // must be the same with the response
  static String email = "email";
  static String password = "password";
  static String confirmPassword = "password";

  static String token = "token";
  static String errorMessage = "errorMessage";
  static String number = "number";

  const ApiKey();
}
// login 
// register 
// get code 
// verify code 
// logout 

