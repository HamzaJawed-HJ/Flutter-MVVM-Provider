
import 'package:mvvm_project/data/response/status.dart';

class ApiResponse<T> {
  String? message;
  Status? status;
  T? data;

  ApiResponse(this.message,  this.status);



  ApiResponse.loading() : status = Status.LOADING;
  ApiResponse.completed(this.data) : status = Status.COMPLETED;
  ApiResponse.error(this.message) : status = Status.ERROR;

  @override
  String toString() {
    return "STATUS: $status \n  Message: $message \n Data: $data";
  }
}
