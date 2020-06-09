class User{
  String name;
  String email;
  String password;
  String type;
  
  User(this.name, this.email,this.password,this.type);
  User.toLogin(this.email,this.password,this.type);
}