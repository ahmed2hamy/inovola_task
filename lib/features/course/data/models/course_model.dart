import 'package:inovola_task/features/course/domain/entities/course.dart';

class CourseModel extends Course {
  CourseModel({
    int? id,
    String? title,
    List<String>? img,
    String? interest,
    int? price,
    String? date,
    String? address,
    String? trainerName,
    String? trainerImg,
    String? trainerInfo,
    String? occasionDetail,
    String? latitude,
    String? longitude,
    bool? isLiked,
    bool? isSold,
    bool? isPrivateEvent,
    bool? hiddenCashPayment,
    int? specialForm,
    dynamic questionnaire,
    dynamic questExplanation,
    List<ReservTypesModel>? reservTypesModelList,
  }) : super(
          id: id,
          title: title,
          img: img,
          interest: interest,
          price: price,
          date: date,
          address: address,
          trainerName: trainerName,
          trainerImg: trainerImg,
          trainerInfo: trainerInfo,
          occasionDetail: occasionDetail,
          latitude: latitude,
          longitude: longitude,
          isLiked: isLiked,
          isSold: isSold,
          isPrivateEvent: isPrivateEvent,
          hiddenCashPayment: hiddenCashPayment,
          specialForm: specialForm,
          questionnaire: questionnaire,
          questExplanation: questExplanation,
          reservTypesModelList: reservTypesModelList,
        );

  CourseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    img = json['img'] != null ? json['img'].cast<String>() : [];
    interest = json['interest'];
    price = json['price'];
    date = json['date'];
    address = json['address'];
    trainerName = json['trainerName'];
    trainerImg = json['trainerImg'];
    trainerInfo = json['trainerInfo'];
    occasionDetail = json['occasionDetail'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    isLiked = json['isLiked'];
    isSold = json['isSold'];
    isPrivateEvent = json['isPrivateEvent'];
    hiddenCashPayment = json['hiddenCashPayment'];
    specialForm = json['specialForm'];
    questionnaire = json['questionnaire'];
    questExplanation = json['questExplanation'];
    if (json['reservTypes'] != null) {
      reservTypesModelList = [];
      json['reservTypes'].forEach((v) {
        reservTypesModelList?.add(ReservTypesModel.fromJson(v));
      });
    }
  }

  factory CourseModel.fromCourse(Course course) {
    return CourseModel(
      id: course.id,
      title: course.title,
      img: course.img,
      interest: course.interest,
      price: course.price,
      date: course.date,
      address: course.address,
      trainerName: course.trainerName,
      trainerImg: course.trainerImg,
      trainerInfo: course.trainerInfo,
      occasionDetail: course.occasionDetail,
      latitude: course.latitude,
      longitude: course.longitude,
      isLiked: course.isLiked,
      isSold: course.isSold,
      isPrivateEvent: course.isPrivateEvent,
      hiddenCashPayment: course.hiddenCashPayment,
      specialForm: course.specialForm,
      questionnaire: course.questionnaire,
      questExplanation: course.questExplanation,
      reservTypesModelList: course.reservTypesModelList,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['img'] = img;
    map['interest'] = interest;
    map['price'] = price;
    map['date'] = date;
    map['address'] = address;
    map['trainerName'] = trainerName;
    map['trainerImg'] = trainerImg;
    map['trainerInfo'] = trainerInfo;
    map['occasionDetail'] = occasionDetail;
    map['latitude'] = latitude;
    map['longitude'] = longitude;
    map['isLiked'] = isLiked;
    map['isSold'] = isSold;
    map['isPrivateEvent'] = isPrivateEvent;
    map['hiddenCashPayment'] = hiddenCashPayment;
    map['specialForm'] = specialForm;
    map['questionnaire'] = questionnaire;
    map['questExplanation'] = questExplanation;
    if (reservTypesModelList != null) {
      map['reservTypes'] =
          reservTypesModelList?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class ReservTypesModel extends ReservTypes {
  ReservTypesModel({
    int? id,
    String? name,
    int? count,
    int? price,
  }) : super(
          id: id,
          name: name,
          count: count,
          price: price,
        );

  ReservTypesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    count = json['count'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['count'] = count;
    map['price'] = price;
    return map;
  }
}
