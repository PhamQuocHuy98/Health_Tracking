class User {
  String token;
  String name;
  int weight;
  int height;
  bool enableNoti;
  String timeWakeup;
  String timeSleep;
  String timeNoti;
  int target;
  bool isMale;

  User.init({
    this.enableNoti,
    this.height,
    this.name,
    this.target,
    this.timeNoti,
    this.timeSleep,
    this.timeWakeup,
    this.token,
    this.weight,
    this.isMale,
  });
  User.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    name = json['name'];
    weight = json['weight'];
    height = json['height'];
    enableNoti = json['enableNoti'];
    timeWakeup = json['timeWakeup'];
    timeSleep = json['timeSleep'];
    timeNoti = json['timeNoti'];
    target = json['target'];
    isMale = json['isMale'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();

    data['token'] = this.token;
    data['name'] = this.name;
    data['weight'] = this.weight;
    data['height'] = this.height;
    data['enableNoti'] = this.enableNoti;
    data['timeWakeup'] = this.timeWakeup;
    data['timeSleep'] = this.timeSleep;
    data['timeNoti'] = this.timeNoti;
    data['target'] = this.target;
    data['isMale'] = this.isMale;
    return data;
  }
}
