class FavouratiesModel {
  String? status;
  String? message;
  InfoData? info;
  int? count;
  int? badgeCount;

  FavouratiesModel(
      {this.status, this.message, this.info, this.count, this.badgeCount});

  FavouratiesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    info = json['info'] != null ? new InfoData.fromJson(json['info']) : null;
    count = json['count'];
    badgeCount = json['badge_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.info != null) {
      data['info'] = this.info!.toJson();
    }
    data['count'] = this.count;
    data['badge_count'] = this.badgeCount;
    return data;
  }
}

class InfoData {
  int?id;
  String? userId;
  String? celebrityId;

  InfoData({this.id, this.userId, this.celebrityId});

  InfoData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    celebrityId = json['celebrity_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['celebrity_id'] = this.celebrityId;
    return data;
  }
}