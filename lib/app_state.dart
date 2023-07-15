import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'backend/supabase/supabase.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      if (await secureStorage.read(key: 'ff_authedProfile') != null) {
        try {
          final serializedData =
              await secureStorage.getString('ff_authedProfile') ?? '{}';
          _authedProfile =
              ProfileStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    await _safeInitAsync(() async {
      _cart = (await secureStorage.getStringList('ff_cart'))
              ?.map((x) {
                try {
                  return CartProductStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _cart;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  ProfileStruct _authedProfile = ProfileStruct();
  ProfileStruct get authedProfile => _authedProfile;
  set authedProfile(ProfileStruct _value) {
    _authedProfile = _value;
    secureStorage.setString('ff_authedProfile', _value.serialize());
  }

  void deleteAuthedProfile() {
    secureStorage.delete(key: 'ff_authedProfile');
  }

  void updateAuthedProfileStruct(Function(ProfileStruct) updateFn) {
    updateFn(_authedProfile);
    secureStorage.setString('ff_authedProfile', _authedProfile.serialize());
  }

  LatLng? _selectedLatLng = LatLng(-6.186909600000001, 106.8276708);
  LatLng? get selectedLatLng => _selectedLatLng;
  set selectedLatLng(LatLng? _value) {
    _selectedLatLng = _value;
  }

  String _selectedLocationName = '';
  String get selectedLocationName => _selectedLocationName;
  set selectedLocationName(String _value) {
    _selectedLocationName = _value;
  }

  String _selectedLocationAddress = '';
  String get selectedLocationAddress => _selectedLocationAddress;
  set selectedLocationAddress(String _value) {
    _selectedLocationAddress = _value;
  }

  List<TeammateStruct> _myTeammates = [];
  List<TeammateStruct> get myTeammates => _myTeammates;
  set myTeammates(List<TeammateStruct> _value) {
    _myTeammates = _value;
  }

  void addToMyTeammates(TeammateStruct _value) {
    _myTeammates.add(_value);
  }

  void removeFromMyTeammates(TeammateStruct _value) {
    _myTeammates.remove(_value);
  }

  void removeAtIndexFromMyTeammates(int _index) {
    _myTeammates.removeAt(_index);
  }

  void updateMyTeammatesAtIndex(
    int _index,
    TeammateStruct Function(TeammateStruct) updateFn,
  ) {
    _myTeammates[_index] = updateFn(_myTeammates[_index]);
  }

  String _searchKeywords = '';
  String get searchKeywords => _searchKeywords;
  set searchKeywords(String _value) {
    _searchKeywords = _value;
  }

  List<CartProductStruct> _cart = [];
  List<CartProductStruct> get cart => _cart;
  set cart(List<CartProductStruct> _value) {
    _cart = _value;
    secureStorage.setStringList(
        'ff_cart', _value.map((x) => x.serialize()).toList());
  }

  void deleteCart() {
    secureStorage.delete(key: 'ff_cart');
  }

  void addToCart(CartProductStruct _value) {
    _cart.add(_value);
    secureStorage.setStringList(
        'ff_cart', _cart.map((x) => x.serialize()).toList());
  }

  void removeFromCart(CartProductStruct _value) {
    _cart.remove(_value);
    secureStorage.setStringList(
        'ff_cart', _cart.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromCart(int _index) {
    _cart.removeAt(_index);
    secureStorage.setStringList(
        'ff_cart', _cart.map((x) => x.serialize()).toList());
  }

  void updateCartAtIndex(
    int _index,
    CartProductStruct Function(CartProductStruct) updateFn,
  ) {
    _cart[_index] = updateFn(_cart[_index]);
    secureStorage.setStringList(
        'ff_cart', _cart.map((x) => x.serialize()).toList());
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
