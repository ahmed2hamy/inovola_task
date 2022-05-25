import 'package:inovola_task/features/course/data/models/course_model.dart';

class Course {
  int? id;
  String? title;
  List<String>? img;
  String? interest;
  int? price;
  String? date;
  String? address;
  String? trainerName;
  String? trainerImg;
  String? trainerInfo;
  String? occasionDetail;
  String? latitude;
  String? longitude;
  bool? isLiked;
  bool? isSold;
  bool? isPrivateEvent;
  bool? hiddenCashPayment;
  int? specialForm;
  dynamic questionnaire;
  dynamic questExplanation;
  List<ReservTypesModel>? reservTypesModelList;

  Course({
    this.id,
    this.title,
    this.img,
    this.interest,
    this.price,
    this.date,
    this.address,
    this.trainerName,
    this.trainerImg,
    this.trainerInfo,
    this.occasionDetail,
    this.latitude,
    this.longitude,
    this.isLiked,
    this.isSold,
    this.isPrivateEvent,
    this.hiddenCashPayment,
    this.specialForm,
    this.questionnaire,
    this.questExplanation,
    this.reservTypesModelList,
  });
}

class ReservTypes {
  int? id;
  String? name;
  int? count;
  int? price;

  ReservTypes({
    this.id,
    this.name,
    this.count,
    this.price,
  });
}
