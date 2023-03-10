class EmailValidator {
  static bool validEmail(String email) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern as String);
    return (regex.hasMatch(email)) ? true : false;
  }
}

class PasswordValidator {
  static bool validPassword(String pwd) {
    return pwd.length > 6 ? true : false;
  }
}
