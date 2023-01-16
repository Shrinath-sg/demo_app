///
/// Code generated by jsonToDartModel https://ashamp.github.io/jsonToDartModel/
///
class HomeDataModelEcoscoreList {
/*
{
  "tripDate": "10",
  "score": 100
} 
*/

  String? tripDate;
  int? score;

  HomeDataModelEcoscoreList({
    this.tripDate,
    this.score,
  });
  HomeDataModelEcoscoreList.fromJson(Map<String, dynamic> json) {
    tripDate = json['tripDate']?.toString();
    score = json['score']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['tripDate'] = tripDate;
    data['score'] = score;
    return data;
  }
}

class HomeDataModelErrorDetail {
/*
{
  "id": "",
  "message": ""
} 
*/

  String? id;
  String? message;

  HomeDataModelErrorDetail({
    this.id,
    this.message,
  });
  HomeDataModelErrorDetail.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    message = json['message']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['message'] = message;
    return data;
  }
}

class HomeDataModel {
/*
{
  "status": "200",
  "errorDetail": {
    "id": "",
    "message": ""
  },
  "statusMessage": "",
  "accidentsCount": 119,
  "alertsCount": 0,
  "tripsCount": 9,
  "dayDriveCount": 9,
  "nightDriveCount": 0,
  "duration": "3:41",
  "distance": "56",
  "haCount": 0,
  "hbCount": 0,
  "htCount": 0,
  "avgSafetyScore": 100,
  "avgLastSafetyScore": 100,
  "accidentFlag": 0,
  "alertsFlag": 0,
  "avgSafetyScoreFlag": 0,
  "tripsFlag": 0,
  "distanceFlag": 0,
  "durationFlag": 0,
  "haFlag": 0,
  "hbFlag": 0,
  "htFlag": 0,
  "policyIssueDate": "12/07/2019",
  "policyDuration": "1281",
  "totalDistanceTravelled": "791.3829999999998",
  "remainingDistanceLeft": null,
  "rectSnippetFlag": 0,
  "circularSnippetFlag": 0,
  "schemeName": "Ten Thousands",
  "allowedKM": "NA",
  "timeLeft": -915,
  "topUpName": "0 KM",
  "overSpeedCount": 0,
  "overSpeedFlag": 0,
  "ecoscoreList": [
    {
      "tripDate": "10",
      "score": 100
    }
  ]
} 
*/

  String? status;
  HomeDataModelErrorDetail? errorDetail;
  String? statusMessage;
  int? accidentsCount;
  int? alertsCount;
  int? tripsCount;
  int? dayDriveCount;
  int? nightDriveCount;
  String? duration;
  String? distance;
  int? haCount;
  int? hbCount;
  int? htCount;
  int? avgSafetyScore;
  int? avgLastSafetyScore;
  int? accidentFlag;
  int? alertsFlag;
  int? avgSafetyScoreFlag;
  int? tripsFlag;
  int? distanceFlag;
  int? durationFlag;
  int? haFlag;
  int? hbFlag;
  int? htFlag;
  String? policyIssueDate;
  String? policyDuration;
  String? totalDistanceTravelled;
  String? remainingDistanceLeft;
  int? rectSnippetFlag;
  int? circularSnippetFlag;
  String? schemeName;
  String? allowedKM;
  int? timeLeft;
  String? topUpName;
  int? overSpeedCount;
  int? overSpeedFlag;
  List<HomeDataModelEcoscoreList?>? ecoscoreList;

  HomeDataModel({
    this.status,
    this.errorDetail,
    this.statusMessage,
    this.accidentsCount,
    this.alertsCount,
    this.tripsCount,
    this.dayDriveCount,
    this.nightDriveCount,
    this.duration,
    this.distance,
    this.haCount,
    this.hbCount,
    this.htCount,
    this.avgSafetyScore,
    this.avgLastSafetyScore,
    this.accidentFlag,
    this.alertsFlag,
    this.avgSafetyScoreFlag,
    this.tripsFlag,
    this.distanceFlag,
    this.durationFlag,
    this.haFlag,
    this.hbFlag,
    this.htFlag,
    this.policyIssueDate,
    this.policyDuration,
    this.totalDistanceTravelled,
    this.remainingDistanceLeft,
    this.rectSnippetFlag,
    this.circularSnippetFlag,
    this.schemeName,
    this.allowedKM,
    this.timeLeft,
    this.topUpName,
    this.overSpeedCount,
    this.overSpeedFlag,
    this.ecoscoreList,
  });
  HomeDataModel.fromJson(Map<String, dynamic> json) {
    status = json['status']?.toString();
    errorDetail = (json['errorDetail'] != null)
        ? HomeDataModelErrorDetail.fromJson(json['errorDetail'])
        : null;
    statusMessage = json['statusMessage']?.toString();
    accidentsCount = json['accidentsCount']?.toInt();
    alertsCount = json['alertsCount']?.toInt();
    tripsCount = json['tripsCount']?.toInt();
    dayDriveCount = json['dayDriveCount']?.toInt();
    nightDriveCount = json['nightDriveCount']?.toInt();
    duration = json['duration']?.toString();
    distance = json['distance']?.toString();
    haCount = json['haCount']?.toInt();
    hbCount = json['hbCount']?.toInt();
    htCount = json['htCount']?.toInt();
    avgSafetyScore = json['avgSafetyScore']?.toInt();
    avgLastSafetyScore = json['avgLastSafetyScore']?.toInt();
    accidentFlag = json['accidentFlag']?.toInt();
    alertsFlag = json['alertsFlag']?.toInt();
    avgSafetyScoreFlag = json['avgSafetyScoreFlag']?.toInt();
    tripsFlag = json['tripsFlag']?.toInt();
    distanceFlag = json['distanceFlag']?.toInt();
    durationFlag = json['durationFlag']?.toInt();
    haFlag = json['haFlag']?.toInt();
    hbFlag = json['hbFlag']?.toInt();
    htFlag = json['htFlag']?.toInt();
    policyIssueDate = json['policyIssueDate']?.toString();
    policyDuration = json['policyDuration']?.toString();
    totalDistanceTravelled = json['totalDistanceTravelled']?.toString();
    remainingDistanceLeft = json['remainingDistanceLeft']?.toString();
    rectSnippetFlag = json['rectSnippetFlag']?.toInt();
    circularSnippetFlag = json['circularSnippetFlag']?.toInt();
    schemeName = json['schemeName']?.toString();
    allowedKM = json['allowedKM']?.toString();
    timeLeft = json['timeLeft']?.toInt();
    topUpName = json['topUpName']?.toString();
    overSpeedCount = json['overSpeedCount']?.toInt();
    overSpeedFlag = json['overSpeedFlag']?.toInt();
    if (json['ecoscoreList'] != null) {
      final v = json['ecoscoreList'];
      final arr0 = <HomeDataModelEcoscoreList>[];
      v.forEach((v) {
        arr0.add(HomeDataModelEcoscoreList.fromJson(v));
      });
      ecoscoreList = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    if (errorDetail != null) {
      data['errorDetail'] = errorDetail!.toJson();
    }
    data['statusMessage'] = statusMessage;
    data['accidentsCount'] = accidentsCount;
    data['alertsCount'] = alertsCount;
    data['tripsCount'] = tripsCount;
    data['dayDriveCount'] = dayDriveCount;
    data['nightDriveCount'] = nightDriveCount;
    data['duration'] = duration;
    data['distance'] = distance;
    data['haCount'] = haCount;
    data['hbCount'] = hbCount;
    data['htCount'] = htCount;
    data['avgSafetyScore'] = avgSafetyScore;
    data['avgLastSafetyScore'] = avgLastSafetyScore;
    data['accidentFlag'] = accidentFlag;
    data['alertsFlag'] = alertsFlag;
    data['avgSafetyScoreFlag'] = avgSafetyScoreFlag;
    data['tripsFlag'] = tripsFlag;
    data['distanceFlag'] = distanceFlag;
    data['durationFlag'] = durationFlag;
    data['haFlag'] = haFlag;
    data['hbFlag'] = hbFlag;
    data['htFlag'] = htFlag;
    data['policyIssueDate'] = policyIssueDate;
    data['policyDuration'] = policyDuration;
    data['totalDistanceTravelled'] = totalDistanceTravelled;
    data['remainingDistanceLeft'] = remainingDistanceLeft;
    data['rectSnippetFlag'] = rectSnippetFlag;
    data['circularSnippetFlag'] = circularSnippetFlag;
    data['schemeName'] = schemeName;
    data['allowedKM'] = allowedKM;
    data['timeLeft'] = timeLeft;
    data['topUpName'] = topUpName;
    data['overSpeedCount'] = overSpeedCount;
    data['overSpeedFlag'] = overSpeedFlag;
    if (ecoscoreList != null) {
      final v = ecoscoreList;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v!.toJson());
      });
      data['ecoscoreList'] = arr0;
    }
    return data;
  }
}
