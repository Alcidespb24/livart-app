// This file should only contain error codes used for exception handling
/*
  EventCodeDatabase usage:
     - Each error corresponds to an integer which maps to a message String
     - Each error should contain information about what went wrong and suggestions on how to correct the issue
     - Errors are organized by error type
      - Ex: Errors with code: 1xxxx correspond to Authentication errors
      - Ex: Errors with code: 2xxxx correspond to FireBase Firestore errors (writing/reading)
 */

// TODO: This can be made into a class with getters to obfuscate the actual implementation
const Map<int,String> EventCodeDatabase =
{
  10000 : 'Unable to send Password Reset Email. Please check your connection and try again',
  10010 : 'Invalid credentials. Please try again',
  10011 : 'This Password is too weak. Please Choose a stronger Password',
  10020 : 'User not found. Please enter a valid user name',
  10030 : 'These credentials appear to be in use by another user. Please verify the email address provided',
  10040 : 'Sign in Failed. Please try again',
  20000 : 'Unable to write to the Database. Please try again later',
  20001 : 'User not found. Please enter another user'
};