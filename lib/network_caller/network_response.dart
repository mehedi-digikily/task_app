class NetworkResponse{
  final int? statusCode;
  final bool isSuccess;
  final String? eroMsg;
  final dynamic? jsonResponse;
  NetworkResponse({
    this.statusCode = -1,
    required this.isSuccess,
    this.eroMsg = 'something went wrong',
    this.jsonResponse,
  });
}