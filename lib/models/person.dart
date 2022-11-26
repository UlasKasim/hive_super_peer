abstract class Person {
  String name;
  double height;
  double weight;
  Person({
    required this.name,
    required this.height,
    required this.weight,
  });

  void think() {
    print('person thinks');
  }
}
