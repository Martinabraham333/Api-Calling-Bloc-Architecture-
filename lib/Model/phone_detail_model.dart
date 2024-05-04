class phone_detail_model {
  var name;
  var color;
  var capacity;
  phone_detail_model({required var name,  required this.color, required this.capacity});

  phone_detail_model.fromJson(Map<String, dynamic> json) {
    print("Model");
    print(json['name']);
    name = json['name'];
    color = json['data']?['color'];
   capacity= json['data']?["capacity"];
  }
}
