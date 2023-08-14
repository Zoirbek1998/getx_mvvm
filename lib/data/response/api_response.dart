import 'package:getx_mvvm/data/response/status.dart';

class ApiResonse<T> {
  Status? status;
  T? data;
  String? message;

  ApiResonse(this.status, this.data, this.message);

  ApiResonse.loading() : status = Status.LOADING;

  ApiResonse.completed() : status = Status.COMPLETED;

  ApiResonse.error(this.message) : status = Status.ERROR;

  @override
  String toString() {
    return "Status : $status \n Message: $message \n Data: $data";
  }
}
