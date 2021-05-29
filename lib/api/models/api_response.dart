class ApiResponse {
  late bool isError;
  late String message;

  ApiResponse({required this.isError, required this.message});

  ApiResponse.fromJson(Map<String, dynamic> json) {
    isError = json['isError'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isError'] = this.isError;
    data['message'] = this.message;
    return data;
  }
}
