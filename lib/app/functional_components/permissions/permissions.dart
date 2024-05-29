import 'dart:io';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class AppPermissions {
  static AppPermissions get to => Get.find();

  AppPermissions() {
    _fillLists();
  }

  final List<Permission> _listPermissions = List<Permission>.empty(growable: true);

  void _fillLists() {
    Platform.isIOS ? null : _listPermissions.add(Permission.location);
    Platform.isIOS ? null : _listPermissions.add(Permission.locationAlways);
    _listPermissions.add(Permission.phone);
    _listPermissions.add(Permission.storage);
    _listPermissions.add(Permission.sms);
    _listPermissions.add(Permission.notification);
    _listPermissions.add(Permission.criticalAlerts);
    _listPermissions.add(Permission.microphone);
    _listPermissions.add(Permission.ignoreBatteryOptimizations);
    _listPermissions.add(Permission.sensors);
    _listPermissions.add(Permission.mediaLibrary);
    _listPermissions.add(Permission.photos);
    _listPermissions.add(Permission.videos);
    _listPermissions.add(Permission.activityRecognition);
  }

  Future<String> checkAllPermissions() async {
    String permissionMessage = PermissionStatus.granted.name.toLowerCase();
    await _checkPermissionsList(_listPermissions);
    return permissionMessage;
  }

  List<String> get _listManifestPermissions => [
        'ACCESS_COARSE_LOCATION',
        'ACCESS_FINE_LOCATION',
        'ACCESS_LOCATION_EXTRA_COMMANDS',
        'ACCESS_NETWORK_STATE',
        'ACCESS_NOTIFICATION_POLICY',
        'ACCESS_WIFI_STATE',
        'ANSWER_PHONE_CALLS',
        'CALL_PHONE',
        'READ_CALL_LOG',
        'ANSWER_PHONE_CALLS',
        'CAMERA',
        'CHANGE_WIFI_STATE',
        'INTERNET',
        'READ_EXTERNAL_STORAGE',
        'READ_PHONE_STATE',
        'READ_SMS',
        'SEND_SMS',
        'VIBRATE',
      ];

  //Check single permission function
  Future<String> checkPermission(Permission permission) async {
    late String result;
    await permission.request().then((permission) => result = permission.name);
    return await permission.request().then((permission) => result = permission.name);
  }

  //Check list of permissions function
  Future<String> _checkPermissionsList(List<Permission> permissions) async {
    String permissionMessage = PermissionStatus.granted.name.toLowerCase();
    for (var permission in permissions) {
      await permission.request() == PermissionStatus.granted ? null : permissionMessage = permission.toString().toLowerCase().split('.').lastOrNull.toString();
    }
    return permissionMessage;
  }
}
