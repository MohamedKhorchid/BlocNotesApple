import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _lastTimeNoteBlocNote = prefs.containsKey('ff_lastTimeNoteBlocNote')
          ? DateTime.fromMillisecondsSinceEpoch(
              prefs.getInt('ff_lastTimeNoteBlocNote')!)
          : _lastTimeNoteBlocNote;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  DateTime? _lastTimeNoteBlocNote;
  DateTime? get lastTimeNoteBlocNote => _lastTimeNoteBlocNote;
  set lastTimeNoteBlocNote(DateTime? value) {
    _lastTimeNoteBlocNote = value;
    value != null
        ? prefs.setInt('ff_lastTimeNoteBlocNote', value.millisecondsSinceEpoch)
        : prefs.remove('ff_lastTimeNoteBlocNote');
  }
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
