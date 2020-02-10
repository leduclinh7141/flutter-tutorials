import 'package:scoped_guide/enums/view_state.dart';
import 'package:scoped_guide/services/storage_service.dart';
import 'package:scoped_model/scoped_model.dart';

import '../service_locator.dart';
import 'base_model.dart';

class HomeModel extends BaseModel {
  StorageService storageService = locator<StorageService>();
  String title = "HomeModel";

  Future saveData() async {
    setState(ViewState.Busy);
    title = "Saving Data";
    await storageService.saveData();
    title = "Data saved";
    setState(ViewState.Retrieved);
  }

}