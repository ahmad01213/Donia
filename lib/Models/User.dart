class User{

  late String id;
  late String name;
  late String phone;
  late String email;

  User();
  User.fromJson(json){
    id=json['id'];
    email=json['email'];
    phone=json['phone'];
    name=json['name'];
  }


}