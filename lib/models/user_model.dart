class User {
  late int? id;
  late String? fname;
  late String? lname;
  late String? account;
  late String? tel;
  late String? email;
  late String? actor;

  User(
      {this.id,
      this.fname,
      this.lname,
      this.account,
      this.tel,
      this.email,
      this.actor});

  User.fromJSON(Map<String, dynamic> json) {
    this.fname = json["fname"];
    this.lname = json["lname"];
    this.account = json["account"];
    this.tel = json["tel"];
    this.email = json["email"];
    this.actor = json["actor"];
  }
}
// {"id": 2,"fname": "nammarin","lname": "tepin","account": "accout","tel": "0981311077","email": "boatbot.seven@gmail.com","actor": "1","tokenVersion": 10,"resetPasswordCode": null,"resetCodeExpiredIn": null,"createdAt": "2022-03-02T08:32:31.000Z","updatedAt": "2022-03-02T09:19:16.000Z" }