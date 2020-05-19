extension Formatime on String {
  String toFormatTime() {
    DateTime dateTime = DateTime.parse(this);
    String temp = dateTime.hour.toString() + ":" + dateTime.minute.toString();
    return temp;
  }
}
