import '../../../../utils/translations/strings.dart';
import 'package:equatable/equatable.dart';

abstract class ErrorModel extends Equatable {
  const ErrorModel();

  @override
  List<Object> get props => [];
}

class JsonFailure extends ErrorModel {
  final String message;

  const JsonFailure({
    required this.message,
  });
}

class ReadableFailure extends ErrorModel {
  final String message;

  const ReadableFailure({
    required this.message,
  });
}

class ErrorElement {
  ErrorElement({
    required this.body,
  });

  final String body;

  factory ErrorElement.fromJson(Map<String, dynamic> json) => ErrorElement(
        body: json["body"] ?? 'N/A Body',
      );

  Map<String, dynamic> toJson() => {
        "body": body,
      };
}

String getErrorsAsString(ErrorModel? error) {
  String errorMesage = '';
  if (error == null) return Strings().somethingWentWrong;
  if (error is JsonFailure) errorMesage = error.message;
  if (error is ReadableFailure) errorMesage = error.message;
  return errorMesage;
}
