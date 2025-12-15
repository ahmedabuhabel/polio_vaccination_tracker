import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class RegistrarController extends GetxController {
  final storage = GetStorage();

  late RxInt newbornBoy;
  late RxInt newbornGirl;
  late RxInt youngBoy;
  late RxInt youngGirl;
  late RxInt oldBoy;
  late RxInt oldGirl;
  late RxInt bottles;
  late RxInt usedBottles;

  // Computed properties
  int get oldTotal => oldBoy.value + oldGirl.value;
  int get youngTotal => youngBoy.value + youngGirl.value;
  int get newbornTotal => newbornBoy.value + newbornGirl.value;
  int get total => oldTotal + youngTotal + newbornTotal;
  int get bottlesDifference => bottles.value - usedBottles.value;

  @override
  void onInit() {
    super.onInit();
    newbornBoy = (storage.read<int>('newbornBoy') ?? 0).obs;
    newbornGirl = (storage.read<int>('newbornGirl') ?? 0).obs;
    youngBoy = (storage.read<int>('youngBoy') ?? 0).obs;
    youngGirl = (storage.read<int>('youngGirl') ?? 0).obs;
    oldBoy = (storage.read<int>('oldBoy') ?? 0).obs;
    oldGirl = (storage.read<int>('oldGirl') ?? 0).obs;
    bottles = (storage.read<int>('bottles') ?? 0).obs;
    usedBottles = (storage.read<int>('usedBottles') ?? 0).obs;

    // Persist changes automatically
    ever(newbornBoy, (val) => storage.write('newbornBoy', val));
    ever(newbornGirl, (val) => storage.write('newbornGirl', val));
    ever(youngBoy, (val) => storage.write('youngBoy', val));
    ever(youngGirl, (val) => storage.write('youngGirl', val));
    ever(oldBoy, (val) => storage.write('oldBoy', val));
    ever(oldGirl, (val) => storage.write('oldGirl', val));
    ever(bottles, (val) => storage.write('bottles', val));
    ever(usedBottles, (val) => storage.write('usedBottles', val));
  }

  void incrementBottles() => bottles.value++;

  void decrementBottles() {
    if (bottles.value > 0) bottles.value--;
  }

  void incrementUsedBottles() {
    if (usedBottles.value < bottles.value) usedBottles.value++;
  }

  void decrementUsedBottles() {
    if (usedBottles.value > 0) usedBottles.value--;
  }

  void incrementNewbornBoy() => newbornBoy.value++;
  void decrementNewbornBoy() {
    if (newbornBoy.value > 0) newbornBoy.value--;
  }

  void incrementNewbornGirl() => newbornGirl.value++;
  void decrementNewbornGirl() {
    if (newbornGirl.value > 0) newbornGirl.value--;
  }

  void youngBoyIncrement() => youngBoy.value++;
  void youngBoyDecrement() {
    if (youngBoy.value > 0) youngBoy.value--;
  }

  void youngGirlIncrement() => youngGirl.value++;
  void youngGirlDecrement() {
    if (youngGirl.value > 0) youngGirl.value--;
  }

  void oldBoyIncrement() => oldBoy.value++;
  void oldBoyDecrement() {
    if (oldBoy.value > 0) oldBoy.value--;
  }

  void oldGirlIncrement() => oldGirl.value++;
  void oldGirlDecrement() {
    if (oldGirl.value > 0) oldGirl.value--;
  }

  void clearAllFields() {
    newbornBoy.value = 0;
    newbornGirl.value = 0;
    youngBoy.value = 0;
    youngGirl.value = 0;
    oldBoy.value = 0;
    oldGirl.value = 0;
    bottles.value = 0;
    usedBottles.value = 0;

    // Clear specific keys to avoid wiping other data in GetStorage
    storage.remove('newbornBoy');
    storage.remove('newbornGirl');
    storage.remove('youngBoy');
    storage.remove('youngGirl');
    storage.remove('oldBoy');
    storage.remove('oldGirl');
    storage.remove('bottles');
    storage.remove('usedBottles');
    storage.remove('oldTotal');
    storage.remove('youngTotal');
    storage.remove('newbornTotal');
    storage.remove('total');
  }
}
