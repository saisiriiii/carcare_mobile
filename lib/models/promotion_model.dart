class Promotion {
  late String? title;
  late String? images;

  Promotion({
    this.title,
    this.images
  });

  Promotion.fromJSON(Map<String, dynamic> json) {
    this.title = json["title"];
    this.images = json["images"];
  }
}
// {"id": 2,"fname": "nammarin","lname": "tepin","account": "accout","tel": "0981311077","email": "boatbot.seven@gmail.com","actor": "1","tokenVersion": 10,"resetPasswordCode": null,"resetCodeExpiredIn": null,"createdAt": "2022-03-02T08:32:31.000Z","updatedAt": "2022-03-02T09:19:16.000Z" }