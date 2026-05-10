import 'dart:async';
import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../features/auth/data/models/user_model/user_model.dart';
import '../strings/app_strings.dart';

abstract interface class SessionManager {
  Future<void> init();
  Future<void> saveSession({
    required String jwtToken,
    required String expiryDate,
    required UserModel user,
  });
  Future<String?> getToken();
  Future<void> signOut();
  void dispose();
}

class SessionManagerImpl implements SessionManager {
  final FlutterSecureStorage _secureStorageInstance;
  SessionManagerImpl({required FlutterSecureStorage secureStorageInstance})
    : _secureStorageInstance = secureStorageInstance;

  // Stream controller for user state change
  final _authStateController = StreamController<UserModel?>.broadcast();
  Stream<UserModel?> get authStateChanged => _authStateController.stream;

  UserModel? _currentUser;
  UserModel? get currentUser => _currentUser;
  bool get isAuthenticated => _currentUser != null;

  // cache token and expiry data for speed data access
  DateTime? _expiryDate;
  String? _jwtToken;

  /// Initializing the session by getting the data
  /// and check on it from secure storage
  @override
  Future<void> init() async {
    // read data from secure storage
    final rawExpiryDate = await _secureStorageInstance.read(
      key: StorageKeys.jwtExpiryDate,
    );
    final sessionUser = await _secureStorageInstance.read(
      key: StorageKeys.sessionUser,
    );

    final jwtToken = await _secureStorageInstance.read(
      key: StorageKeys.jwtToken,
    );

    // check if the returned data is not null
    if (jwtToken == null || rawExpiryDate == null || sessionUser == null) {
      _emit(null);
      return;
    }

    // check on the token expiry date
    final expiry = DateTime.tryParse(rawExpiryDate);
    if (_isExpired(expiry)) {
      await signOut();
      return;
    }

    // all things fine get the current user and emit in the stream
    _currentUser = UserModel.fromJson(
      jsonDecode(sessionUser) as Map<String, Object?>,
    );
    _expiryDate = expiry;
    _jwtToken = jwtToken;
    _emit(_currentUser);
  }

  /// Save session data to secure storage
  /// and create new session.
  @override
  Future<void> saveSession({
    required String jwtToken,
    required String expiryDate,
    required UserModel user,
  }) async {
    await Future.wait([
      _secureStorageInstance.write(key: StorageKeys.jwtToken, value: jwtToken),
      _secureStorageInstance.write(
        key: StorageKeys.jwtExpiryDate,
        value: expiryDate,
      ),
      _secureStorageInstance.write(
        key: StorageKeys.sessionUser,
        value: jsonEncode(user.toJson()),
      ),
    ]);

    _jwtToken = jwtToken;
    _expiryDate = DateTime.tryParse(expiryDate);
    _currentUser = user;
    _emit(_currentUser);
  }

  /// get jwt token to use with DioAuthInterceptor
  @override
  Future<String?> getToken() async {
    if (_isExpired(_expiryDate)) {
      await signOut();
      return null;
    }
    return _jwtToken;
  }

  /// sign out user by deleting all saved entries
  @override
  Future<void> signOut() async {
    await Future.wait([
      _secureStorageInstance.delete(key: StorageKeys.jwtToken),
      _secureStorageInstance.delete(key: StorageKeys.jwtExpiryDate),
      _secureStorageInstance.delete(key: StorageKeys.sessionUser),
    ]);

    _currentUser = null;
    _jwtToken = null;
    _expiryDate = null;
    _emit(null);
  }
  
  /// HELPER FUNCTIONS

  /// emit new user state to the stream
  void _emit(UserModel? user) {
    if (!_authStateController.isClosed) {
      _authStateController.add(user);
    }
  }

  /// helper to check if token is expired
  bool _isExpired(DateTime? expiryDate) {
    return expiryDate == null || DateTime.now().isAfter(expiryDate);
  }

  @override
  void dispose() {
    _authStateController.close();
  }
}
