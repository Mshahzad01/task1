
// ignore: camel_case_types
enum Drivertype {


public,

private;



String get title => switch(this){

  public => "Public Driver",
  private => "Private Driver"
};
}


class UsersinfoModel {



String name;
final Drivertype drivertype;


String address;

String createdat;
double ratting;



UsersinfoModel({required this.name, required this.drivertype ,required this.address ,required this.createdat,required this.ratting});
}



//dumy data 

List<UsersinfoModel> userinformation = [


  UsersinfoModel(name: "MJ Lee", drivertype: Drivertype.private, address: "Bondi Beach", createdat: "Since July 2020", ratting: 4.5)
];





