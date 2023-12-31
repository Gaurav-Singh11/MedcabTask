import 'dart:ui';

import 'package:medcab_task/src/data_layer/local_db/hive_database_helper.dart';
import 'package:medcab_task/src/data_layer/res/strings.dart';
import 'package:hive/hive.dart';

/// Helper class to save user information locally on the device
class UserStateHiveHelper {
  /// Private constructor for singleton
  UserStateHiveHelper._privateConstructor();

  /// Singleton instance creation
  static final _instance = UserStateHiveHelper._privateConstructor();

  /// Get the singleton instance
  static UserStateHiveHelper get instance => _instance;

  /// Method used to open the user box [Boxes.userBox].
  /// The box is opened only when Hive is initialized.
  /// Hive is already initialized in the [main.dart] file
  /// inside the main method before the [runApp] method is called.
  Future<Box<dynamic>> _openHiveBox() async {
    try {
      return await Hive.openBox(
        Boxes.userBox,
      );
    } catch (e) {
      /// If Hive DB gives some error, it is initialized and opened again.
      await HiveDatabaseHelper.instance.initializeHiveAndRegisterAdapters();
      return await Hive.openBox(
        Boxes.userBox,
      );
    }
  }

  /// Method used to close the Hive box [Boxes.userBox].
  Future<void> close() async {
    _openHiveBox().then((box) {
      box.close();
    });
  }

  /// Method used to set that the user is logged in inside
  /// the box [Boxes.userBox].
  Future<void> setLoggedIn() async {
    final Box<dynamic> box = await _openHiveBox();
    box.put(UserStateKeys.loggedIn, true);
  }

  /// Method used to check if the user is logged in or not
  /// from the box [Boxes.userBox].
  Future<bool> isLoggedIn() async {
    final Box<dynamic> box = await _openHiveBox();
    final loggedIn = box.get(UserStateKeys.loggedIn);
    return loggedIn ?? false;
  }

  /// Method used to log out and delete data from the box [Boxes.userBox].
  Future<void> logOut() async {
    final Box<dynamic> box = await _openHiveBox();
    box.put(UserStateKeys.loggedIn, false);
    await _deleteUser();
  }

  /// Method used for deleting data from the box [Boxes.userBox].
  Future<void> _deleteUser() async {
    final Box<dynamic> box = await _openHiveBox();
    box.delete(UserStateKeys.loggedIn);
    box.delete(UserStateKeys.userData);
    box.clear();
  }

  /// Method used to set the user's preferred locale inside
  /// the box [Boxes.userBox].
  Future<void> setLocale(Locale locale) async {
    final Box<dynamic> box = await _openHiveBox();
    box.put(UserStateKeys.languageCode, locale.languageCode);
    box.put(UserStateKeys.languageCountryCode, locale.countryCode);
  }

  /// Method used to get the user's preferred locale from
  /// the box [Boxes.userBox].
  Future<Locale> getLocale() async {
    final Box<dynamic> box = await _openHiveBox();
    final languageCode = box.get(UserStateKeys.languageCode);
    final languageCountryCode = box.get(
      UserStateKeys.languageCountryCode,
    );
    return Locale(
      languageCode ?? LanguageConstants.englishLanguageCode,
      languageCountryCode ?? LanguageConstants.englishCountryCode,
    );
  }
}
