// This file should only contain error codes used for exception handling
/*
  EventCodeDatabase usage:
     - Each error corresponds to an integer which maps to a message String
     - Each error should contain information about what went wrong and suggestions on how to correct the issue
     - Errors are organized by error type
      - Ex: Errors with code: 1xxxx correspond to Authentication errors
      - Ex: Errors with code: 2xxxx correspond to FireBase Firestore errors (writing/reading)
 */


enum EventCodes {
  UNABLE_TO_SEND_PASSWORD_EMAIL,
  INVALID_CREDENTIALS,
  PASSWORD_TOO_WEAK,
  USER_NOT_FOUND_INVALID_UNAME,
  CREDENTIALS_IN_USE,
  SIGN_IN_FAILED,
  UNABLE_TO_WRITE_TO_DB,
  USER_NOT_FOUND_IN_DB,
}
// TODO: This can be made into a class with getters to obfuscate the actual implementation
const Map<EventCodes,String> EventCodeDatabase =
{
  EventCodes.UNABLE_TO_SEND_PASSWORD_EMAIL : 'Unable to send Password Reset Email. Please check your connection and try again',
  EventCodes.INVALID_CREDENTIALS : 'Invalid credentials. Please try again',
  EventCodes.PASSWORD_TOO_WEAK : 'This Password is too weak. Please Choose a stronger Password',
  EventCodes.USER_NOT_FOUND_INVALID_UNAME : 'User not found. Please enter a valid user name',
  EventCodes.CREDENTIALS_IN_USE : 'These credentials appear to be in use by another user. Please verify the email address provided',
  EventCodes.SIGN_IN_FAILED : 'Sign in Failed. Please try again',
  EventCodes.UNABLE_TO_WRITE_TO_DB : 'Unable to write to the Database. Please try again later',
  EventCodes.USER_NOT_FOUND_IN_DB : 'User not found. Please enter another user'
};