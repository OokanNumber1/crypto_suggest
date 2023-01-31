import 'package:get_storage/get_storage.dart';

abstract class IStorageService {
  Future<void> save({required String key, required dynamic value});

  T? read<T>({required String key});

  void clear();
}

class LocalStorage implements IStorageService {
  GetStorage storage;
  LocalStorage({required this.storage});

  @override
  T? read<T>({required String key}) {
    final data = storage.read(key);
    if (data != null) return data;
    return null;
  }

  @override
  Future<void> save({required String key, required value}) async {
    await storage.write(key, value);
  }

  @override
  void clear()async{
    await storage.erase();
  }
}

