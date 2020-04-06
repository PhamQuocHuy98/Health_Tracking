

import 'package:hive/hive.dart';
part 'water_model.g.dart';
@HiveType()
class Water {

  @HiveField(0)
  String time;

  @HiveField(1)
  int ml;

  Water(this.time,this.ml);

  
}