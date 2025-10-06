String listToString(dynamic data) {
  String msg = '';

  if (data is List<dynamic>) {
    msg = (data as List<dynamic>).join(",");
  } else if (data is String) {
    msg = data;
  }
  return msg;
}
