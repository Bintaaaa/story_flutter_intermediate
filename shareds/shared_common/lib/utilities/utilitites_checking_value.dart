extension UtilititiesCheckingValue on dynamic {
  bool isNull() => this == null;
  bool isNotNull() => this != null;
  bool isEmpty() => this.trim() == "";
  bool isNotEmpty() => this.trim() != "";
}
