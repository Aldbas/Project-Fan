import 'package:hive/hive.dart';
import 'package:build_runner/build_runner.dart';

part 'contact.g.dart';

@HiveType(typeId: 1)
class Contact {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final int age;

  Contact(this.name,this.age);
}