import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MainController extends GetxController {
  final storage = GetStorage();

  int _newbornBoy = GetStorage().read('newbornBoy') ?? 0;
  int _newbornGirl = GetStorage().read('newbornGirl') ?? 0;
  int _youngBoy = GetStorage().read('youngBoy') ?? 0;
  int _youngGirl = GetStorage().read('youngGirl') ?? 0;
  int _oldBoy = GetStorage().read('oldBoy') ?? 0;
  int _oldGirl = GetStorage().read('oldGirl') ?? 0;
  int _oldTotal = GetStorage().read('oldTotal') ?? 0;
  int _youngTotal = GetStorage().read('youngTotal') ?? 0;
  int _newbornTotal = GetStorage().read('newbornTotal') ?? 0;
  int _total = GetStorage().read('total') ?? 0;
  int _bottles = GetStorage().read('bottles') ?? 0;
  int _usedBottles = GetStorage().read('usedBottles') ?? 0;

  void updateTotals() {
    _oldTotal = _oldBoy + _oldGirl;
    _youngTotal = _youngBoy + _youngGirl;
    _newbornTotal = _newbornBoy + _newbornGirl;
    _total = _oldTotal + _youngTotal + _newbornTotal;

    storage.write('oldTotal', _oldTotal);
    storage.write('youngTotal', _youngTotal);
    storage.write('newbornTotal', _newbornTotal);
    storage.write('total', _total);
  }

  int getBottlesDifference() => _bottles - _usedBottles;

  void incrementBottles() {
    _bottles++;
    storage.write('bottles', _bottles);
    update();
  }

  void decrementBottles() {
    if (_bottles > 0) {
      _bottles--;
      storage.write('bottles', _bottles);
      update();
    }
  }

  void incrementUsedBottles() {
    if (_usedBottles < _bottles) {
      _usedBottles++;
      storage.write('usedBottles', _usedBottles);
      update();
    }
  }

  void decrementUsedBottles() {
    if (_usedBottles > 0) {
      _usedBottles--;
      storage.write('usedBottles', _usedBottles);
      update();
    }
  }

  void incrementNewbornBoy() {
    _newbornBoy++;
    storage.write('newbornBoy', _newbornBoy);
    updateTotals();
    update();
  }

  void incrementNewbornGirl() {
    _newbornGirl++;
    storage.write('newbornGirl', _newbornGirl);
    updateTotals();
    update();
  }

  void decrementNewbornBoy() {
    if (_newbornBoy > 0) {
      _newbornBoy--;
      storage.write('newbornBoy', _newbornBoy);
      updateTotals();
      update();
    }
  }

  void decrementNewbornGirl() {
    if (_newbornGirl > 0) {
      _newbornGirl--;
      storage.write('newbornGirl', _newbornGirl);
      updateTotals();
      update();
    }
  }

  void youngBoyIncrement() {
    _youngBoy++;
    storage.write('youngBoy', _youngBoy);
    updateTotals();
    update();
  }

  void youngGirlIncrement() {
    _youngGirl++;
    storage.write('youngGirl', _youngGirl);
    updateTotals();
    update();
  }

  void oldBoyIncrement() {
    _oldBoy++;
    storage.write('oldBoy', _oldBoy);
    updateTotals();
    update();
  }

  void oldGirlIncrement() {
    _oldGirl++;
    storage.write('oldGirl', _oldGirl);
    updateTotals();
    update();
  }

  void youngBoyDecrement() {
    if (_youngBoy > 0) {
      _youngBoy--;
      storage.write('youngBoy', _youngBoy);
      updateTotals();
      update();
    }
  }

  void youngGirlDecrement() {
    if (_youngGirl > 0) {
      _youngGirl--;
      storage.write('youngGirl', _youngGirl);
      updateTotals();
      update();
    }
  }

  void oldBoyDecrement() {
    if (_oldBoy > 0) {
      _oldBoy--;
      storage.write('oldBoy', _oldBoy);
      updateTotals();
      update();
    }
  }

  void oldGirlDecrement() {
    if (_oldGirl > 0) {
      _oldGirl--;
      storage.write('oldGirl', _oldGirl);
      updateTotals();
      update();
    }
  }

  void clearAllFields() {
    _newbornBoy = 0;
    _newbornGirl = 0;
    _youngBoy = 0;
    _youngGirl = 0;
    _oldBoy = 0;
    _oldGirl = 0;
    _oldTotal = 0;
    _youngTotal = 0;
    _newbornTotal = 0;
    _total = 0;
    _usedBottles = 0;
    _bottles = 0;

    storage.erase();
    updateTotals();
    update();
  }

  int get getTotal => _total;
  int get getNewbornBoy => _newbornBoy;
  int get getNewbornGirl => _newbornGirl;
  int get getYoungBoy => _youngBoy;
  int get getYoungGirl => _youngGirl;
  int get getOldBoy => _oldBoy;
  int get getOldGirl => _oldGirl;
  int get getOldTotal => _oldTotal;
  int get getYoungTotal => _youngTotal;
  int get getNewbornTotal => _newbornTotal;
  int get getUsedBottles => _usedBottles;
  int get getBottles => _bottles;
}
