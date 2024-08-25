class UserState{
  late String name;
  late String email;
  late String image;
  UserState(){
    name ="";
    email = "";
    image ="";
  }
  UserState.init(String name,String email,String image){
    this.name = name;
    this.email = email;
    this.image = image;
  }
}