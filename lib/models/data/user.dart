class User {
  final String firstName;
  final String lastName;
  final int age;

  const User({
    required this.firstName,
    required this.lastName,
    required this.age,
  });

  User copy({
    String? firstName,
    String? lastName,
    int? age,
  }) =>
      User(
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        age: age ?? this.age,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User &&
          runtimeType == other.runtimeType &&
          firstName == other.firstName &&
          lastName == other.lastName &&
          age == other.age;

  @override
  int get hashCode => firstName.hashCode ^ lastName.hashCode ^ age.hashCode;
}


final allUsers = <User>[
  User(firstName: '12/6/2000', lastName: '120', age: 37),
  User(firstName: '12/6/2000', lastName: '120', age: 27),
  User(firstName: '12/6/2000', lastName: '120', age: 20),
  User(firstName: '12/6/2000', lastName: '120', age: 21),
  User(firstName: '12/6/2000', lastName: '120', age: 18),
  User(firstName: '12/6/2000', lastName: '120', age: 32),
  User(firstName: '12/6/2000', lastName: '120', age: 24),
  User(firstName: '12/6/2000', lastName: '120', age: 42),
  User(firstName: '12/6/2000', lastName: '120', age: 47),
  User(firstName: '12/6/2000', lastName: '120', age: 18),
  User(firstName: '12/6/2000', lastName: '120', age: 33),
  User(firstName: '12/6/2000', lastName: '120', age: 19),
  User(firstName: '12/6/2000', lastName: '120', age: 27),
  User(firstName: '12/6/2000', lastName: '120', age: 25),
  User(firstName: '12/6/2000', lastName: '120', age: 53),
  User(firstName: '12/6/2000', lastName: '120', age: 58),
  User(firstName: '12/6/2000', lastName: '120', age: 44),
  User(firstName: '12/6/2000', lastName: '120', age: 41),
];
