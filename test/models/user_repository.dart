class UserRepository {
  static int _counter = 0;
  final int value;


  UserRepository() :
      this.value = _counter++;

  void test() => print(value);
}