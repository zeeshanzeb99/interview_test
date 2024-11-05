import 'package:adv_test/helper/resources/constant_resources.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../repository/data_manager.dart';


class HiveBox {
  Future<void> openBoxes() async {
    await Hive.initFlutter();
    await Hive.openBox(ConstantResources.HIVE_BOX);
  }

  setValue({required String key, required dynamic value}) async {
    var box = Hive.box(ConstantResources.HIVE_BOX);
    await box.put(key, value);
  }

  getValue({required String key, dynamic defaultValue}) {
    var box = Hive.box(ConstantResources.HIVE_BOX);
    return box.get(key, defaultValue: defaultValue);
  }

  deleteValue({required String key}) async {
    var box = Hive.box(ConstantResources.HIVE_BOX);
    await box.delete(key);
  }


}
