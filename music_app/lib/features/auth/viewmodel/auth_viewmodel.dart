import 'package:fpdart/fpdart.dart' as fpdart;
import 'package:music_app/core/providers/current_user_notifier.dart';
import 'package:music_app/core/models/user_model.dart';
import 'package:music_app/features/auth/repository/auth_local_repository.dart';
import 'package:music_app/features/auth/repository/auth_remote_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'auth_viewmodel.g.dart';

@riverpod
class AuthViewModel extends _$AuthViewModel {
  late AuthRemoteRepository _authRemoteRepository;
  late AuthLocalRepository _authLocalRepository;
  late CurrentUserNotifier _currentUserNotifier;
  @override
  AsyncValue<UserModel>? build() {
    _authRemoteRepository = ref.watch(authRemoteRepositoryProvider);
    _authLocalRepository = ref.watch(authLocalRepositoryProvider);
    _currentUserNotifier = ref.watch(currentUserNotifierProvider.notifier);
    _authLocalRepository.init();
    return null;
  }

  Future<void> initSharedPreferences() async {
    await _authLocalRepository.init();
  }

  Future<void> signUp(
      {required String name,
      required String email,
      required String password}) async {
    final res = await _authRemoteRepository.signUp(
      name: name,
      email: email,
      password: password,
    );
    final val = switch (res) {
      fpdart.Left(value: final l) => state = AsyncValue.error(
          l.message,
          StackTrace.current,
        ),
      fpdart.Right(value: final r) => _loginSuccess(r),
    };
    print(val);
  }

  Future<void> loginUser({
    required String email,
    required String password,
  }) async {
    state = const AsyncValue.loading();
    final res = await _authRemoteRepository.login(
      email: email,
      password: password,
    );

    final val = switch (res) {
      fpdart.Left(value: final l) => state = AsyncValue.error(
          l.message,
          StackTrace.current,
        ),
      fpdart.Right(value: final r) => _loginSuccess(r),
    };
    print(val);
  }

  AsyncValue<UserModel>? _loginSuccess(UserModel user) {
    _authLocalRepository.setToken(user.token);
    ref.read(currentUserNotifierProvider.notifier).addUser(user);
    return state = AsyncValue.data(user);
  }

  Future<UserModel?> getData() async {
    state = const AsyncValue.loading();
    final token = _authLocalRepository.getToken();

    if (token != null) {
      try {
        final res = await _authRemoteRepository.getCurrentUserData(token);
        final val = switch (res) {
          fpdart.Left(value: final l) => state = AsyncValue.error(
              l.message,
              StackTrace.current,
            ),
          fpdart.Right(value: final r) => _getDataSuccess(r),
        };

        return val.value;
      } catch (e) {
        return null;
      }
    }

    return null;
  }

  AsyncValue<UserModel> _getDataSuccess(UserModel user) {
    _currentUserNotifier.addUser(user);
    return state = AsyncValue.data(user);
  }
}
