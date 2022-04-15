class CelebrityModel {
  String? status;
  String? message;
 late List<Info> info;
  int? count;
  int? badgeCount;

  CelebrityModel(
      {this.status, this.message,required this.info, this.count, this.badgeCount});

  CelebrityModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['info'] != null) {
      info = <Info>[];
      json['info'].forEach((v) {
        info.add(new Info.fromJson(v));
      });
    }
    count = json['count'];
    badgeCount = json['badge_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.info != null) {
      data['info'] = this.info.map((v) => v.toJson()).toList();
    }
    data['count'] = this.count;
    data['badge_count'] = this.badgeCount;
    return data;
  }
}

class Info {
  String? userId;
  String? profilePic;
  String? celebrityDescription;
  String? celebrityLocation;
  String? coverPic;
  String? username;
  int? likes;
  int? favs;
  int? photoSelfiesCount;
  int? videoMessagesCount;
  int? liveVideosCount;
  int? livePhotoSelfiesCount;
 late List<String> categoriesOfCelebrity;
   late List<ServicesOffering> servicesOffering;

  Info(
      {this.userId,
        this.profilePic,
        this.celebrityDescription,
        this.celebrityLocation,
        this.coverPic,
        this.username,
        this.likes,
        this.favs,
        this.photoSelfiesCount,
        this.videoMessagesCount,
        this.liveVideosCount,
        this.livePhotoSelfiesCount,
      required   this.categoriesOfCelebrity,
      required  this.servicesOffering});

  Info.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    profilePic = json['profile_pic'];
    celebrityDescription = json['celebrity_description'];
    celebrityLocation = json['celebrity_location'];
    coverPic = json['cover_pic'];
    username = json['username'];
    likes = json['likes'];
    favs = json['favs'];
    photoSelfiesCount = json['photo_selfies_count'];
    videoMessagesCount = json['video_messages_count'];
    liveVideosCount = json['live_videos_count'];
    livePhotoSelfiesCount = json['live_photo_selfies_count'];
    categoriesOfCelebrity = json['categories_of_celebrity'].cast<String>();
    if (json['services_offering'] != null) {
      servicesOffering = <ServicesOffering>[];
      json['services_offering'].forEach((v) {
        servicesOffering.add(new ServicesOffering.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['profile_pic'] = this.profilePic;
    data['celebrity_description'] = this.celebrityDescription;
    data['celebrity_location'] = this.celebrityLocation;
    data['cover_pic'] = this.coverPic;
    data['username'] = this.username;
    data['likes'] = this.likes;
    data['favs'] = this.favs;
    data['photo_selfies_count'] = this.photoSelfiesCount;
    data['video_messages_count'] = this.videoMessagesCount;
    data['live_videos_count'] = this.liveVideosCount;
    data['live_photo_selfies_count'] = this.livePhotoSelfiesCount;
    data['categories_of_celebrity'] = this.categoriesOfCelebrity;
    if (this.servicesOffering != null) {
      data['services_offering'] =
          this.servicesOffering.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ServicesOffering {
  int? id;
  String? userId;
  int? serviceId;
  double? serviceCost;
 late ServiceDetails serviceDetails;

  ServicesOffering(
      {this.id,
        this.userId,
        this.serviceId,
        this.serviceCost,
       required this.serviceDetails});

  ServicesOffering.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    serviceId = json['service_id'];
    serviceCost = json['service_cost'];
    serviceDetails = (json['service_details'] != null
        ? new ServiceDetails.fromJson(json['service_details'])
        : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['service_id'] = this.serviceId;
    data['service_cost'] = this.serviceCost;
    if (this.serviceDetails != null) {
      data['service_details'] = this.serviceDetails.toJson();
    }
    return data;
  }
}

class ServiceDetails {
  int? serviceId;
  String? serviceName;
  bool? active;

  ServiceDetails({this.serviceId, this.serviceName, this.active});

  ServiceDetails.fromJson(Map<String, dynamic> json) {
    serviceId = json['service_id'];
    serviceName = json['service_name'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['service_id'] = this.serviceId;
    data['service_name'] = this.serviceName;
    data['active'] = this.active;
    return data;
  }
}