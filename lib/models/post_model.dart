class PostModel {
  final int id;
  final String name;
  final String job;
  final String admission_date;
  final String phone;
  final String image;

  PostModel(this.id, this.name, this.job, this.admission_date, this.phone, this.image);

  factory PostModel.fromJson(Map json) {
    return PostModel(json['id'], json['name'], json['job'], json['admission_date'], json['phone'], json['image']);

  }


  @override
  String toString() {
    return 'ID: $id';
  }
}