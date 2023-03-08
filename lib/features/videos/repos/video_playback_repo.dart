// only save data , read data
// disk 역할
import 'package:shared_preferences/shared_preferences.dart';

class PlaybackConfigRepository {
  static const String _autoplay = "autoplay";
  static const String _muted = "muted";

  final SharedPreferences _preferences;

  PlaybackConfigRepository(this._preferences);

// saving data repo

  Future<void> setMuted(bool value) async {
    _preferences.setBool(_muted, value);
  }

  Future<void> setAutoplay(bool value) async {
    _preferences.setBool(_autoplay, value);
  }

// reading data repo

  bool isMuted() {
    return _preferences.getBool(_muted) ?? false;
    // disk에 없을시 false
  }

  bool isAuto() {
    return _preferences.getBool(_autoplay) ?? false;
  }
}
