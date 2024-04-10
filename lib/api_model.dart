class Assignment  {
  int? userId;
  String? id;
  String? title;

  Assignment ({
    this.userId,
    this.id,
    this.title,
  });

  Assignment .fromjson(Map<String, dynamic> json) {
    userId = json['userid'];
    id = json['createdAt'];
    title = json['title'];
  }

  Map<String, dynamic> tojson() {
    print('-----------tojson');
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userid'] = this.userId;
    data['createdAt'] = this.id;
    data['title'] = this.title;
    return data;
  }
}
