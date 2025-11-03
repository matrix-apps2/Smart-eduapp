class BaseResponse<T> {
  final T? data;
  final String message;
  final int code;
  final bool success;
  // final String type;

  BaseResponse({
    required this.success,
    required this.code,
    required this.data,
    required this.message,
  });

  factory BaseResponse.fromJson(Map<String, dynamic> json) => BaseResponse(
        data: json["data"],
        success: json["success"],
        code: json["code"] ?? 0,
        message: json["message"] ?? "",
      );
}
