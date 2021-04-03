class Employee {
  int _id;
  String _name;
  double _salary;

  Employee(this._id, this._name, this._salary);

  set id(int value) {
    _id = value;
  }

  set name(String value) {
    _name = value;
  }

  set salary(double value) {
    _salary = value;
  }

  int get id => _id;
  String get name => _name;
  double get salary => _salary;
}
