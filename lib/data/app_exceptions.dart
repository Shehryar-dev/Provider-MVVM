class AppException implements Exception {
  final _message;
  final _prefix;
  AppException([this._message, this._prefix]);

  String toString(){
    return '$_prefix$_message';
  }

}

class FetchDataException extends AppException{
   FetchDataException([String? message]) : super(message, 'Error During Communication');
}

class InternetException extends AppException {
  InternetException([String? message]) : super(message, 'No internet') ;
}


class BadRequestException extends AppException{
  BadRequestException([String? message]) : super(message, 'Invalid Request');
}

class UnAuthorisedException extends AppException{
  UnAuthorisedException([String? message]) : super(message, 'UnAuthorised Exception');
}

class InvalidInputException extends AppException{
  InvalidInputException([String? message]) : super(message, 'Invalid Input');
}

