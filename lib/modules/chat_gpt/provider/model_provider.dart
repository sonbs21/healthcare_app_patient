import 'package:flutter/cupertino.dart';
import 'package:healthcare_mobile/api/api_service.dart';
import 'package:healthcare_mobile/models/chats/OpenApiModel.dart';

class ModelProvider with ChangeNotifier {
  String currentModel = "text-davinci-001";
  String get getCurrentModel => currentModel;

  List<OpenApiModel> modelList = [];
  List<OpenApiModel> get getModelList => modelList;

  void setCurrentModel(String model) {
    currentModel = model;
    print(currentModel);
    notifyListeners();
  }

  Future<List<OpenApiModel>> getAllModels() async {
    modelList = await ApiServices.getModel();
    print("currentModel");
    return modelList;
  }
}
