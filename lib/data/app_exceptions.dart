class AppException implements Exception{

  final _message ;
  final  _prefix;

  AppException([this._message,this._prefix]);

@override
String toString(){
  return "$_prefix $_message "; 

}
  
}


class FetchDataExcaeption extends AppException{

  FetchDataExcaeption([String? message]): super (message,'Error During Comunication');

}

class BadRequestException extends AppException{

  BadRequestException([String? message]): super(message,"Invalid Request");

}

class UnAuthorizedException extends AppException{

  UnAuthorizedException([String ? message]):super(message, "Unauthorized Request");
}