class APIResponse<T> {
  final data;
  final error;
  final errorMessage;
  APIResponse({
    this.data,
    this.error = false,
    this.errorMessage,
  });
}
