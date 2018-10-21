

class User {
  int id;
  String name;
  String username;
  String email;
  // String address;
  String phone;
  String website;
  // String company;

  User({
    this.id,
    this.name,
    this.username,
    this.email,
    // this.address,
    this.phone,
    this.website,
    // this.company,
  });

  static User fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      email: json['email'],
      // address: json['address'],
      phone: json['phone'],
      website: json['website'],
      // company: json['company'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'username': username,
        'email': email,
        // 'address': address,
        'phone': phone,
        'website': website,
        // 'company': company,
      };
}