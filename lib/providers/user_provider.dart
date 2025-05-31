import 'dart:async';
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:task2/model/user.dart';
import 'package:task2/services/api_service.dart';
import 'package:task2/services/local_storage_service.dart';


class UserProvider with ChangeNotifier {
  List<User> users = [];
  bool isOnline = false;
  final _localStorage = LocalStorageService();

  UserProvider() {
    _init();
  }

  Future<void> _init() async {
    _monitorConnection();
    await _loadUsers();
  }

  Future<void> _loadUsers() async {
    final connectivity = await Connectivity().checkConnectivity();
    if (connectivity != ConnectivityResult.none) {
      await _fetchOnline();
    } else {
      await _fetchOffline();
    }
  }

  Future<void> _fetchOnline() async {
    try {
      users = await ApiService.fetchUsers();
      await _localStorage.saveUsers(users);
      isOnline = true;
      notifyListeners();
    } catch (e) {
      await _fetchOffline(); 
    }
  }

  Future<void> _fetchOffline() async {
    users = await _localStorage.getUsers();
    isOnline = false;
    notifyListeners();
  }

  void _monitorConnection() {
    Connectivity().onConnectivityChanged.listen((result) async {
      if (result != ConnectivityResult.none) {
        await _fetchOnline();
      }
    });
  }
}
