// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class RegisterResponse {

  String id;
  String name;
  String email;
  String token;
  RegisterResponse({
    required this.id,
    required this.name,
    required this.email,
    required this.token,
  });
  

  RegisterResponse copyWith({
    String? id,
    String? name,
    String? email,
    String? token,
  }) {
    return RegisterResponse(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': id,
      'name': name,
      'email': email,
      'token': token,
    };
  }

  factory RegisterResponse.fromMap(Map<String, dynamic> map) {
    return RegisterResponse(
      id: map['_id'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      token: map['token'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterResponse.fromJson(String source) => RegisterResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'RegisterResponse(_id: $id, name: $name, email: $email, token: $token)';
  }

  @override
  bool operator ==(covariant RegisterResponse other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.email == email &&
      other.token == token;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      email.hashCode ^
      token.hashCode;
  }
}



class RegisterRequest {
  String name;
  String email;
  String password;
  RegisterRequest({
    required this.name,
    required this.email,
    required this.password,
  });
  

  RegisterRequest copyWith({
    String? name,
    String? email,
    String? password,
  }) {
    return RegisterRequest(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'password': password,
    };
  }

  factory RegisterRequest.fromMap(Map<String, dynamic> map) {
    return RegisterRequest(
      name: map['name'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterRequest.fromJson(String source) => RegisterRequest.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'RegisterRequest(name: $name, email: $email, password: $password)';

  @override
  bool operator ==(covariant RegisterRequest other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.email == email &&
      other.password == password;
  }

  @override
  int get hashCode => name.hashCode ^ email.hashCode ^ password.hashCode;
}
