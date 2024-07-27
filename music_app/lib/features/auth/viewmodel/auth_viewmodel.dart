import 'package:fpdart/fpdart.dart' as fpdart;
import 'package:music_app/features/auth/model/user_model.dart';
import 'package:music_app/features/auth/repository/auth_remote_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'auth_viewmodel.g.dart';

@riverpod
class AuthViewModel extends _$AuthViewModel {
  late AuthRemoteRepository _authRemoteRepository;
  @override
  AsyncValue<UserModel>? build() {
    _authRemoteRepository = ref.watch(authRemoteRepositoryProvider);
    return null;
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
      fpdart.Right(value: final r) => state = AsyncValue.data(r),
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
      fpdart.Right(value: final r) => AsyncValue.data(r),
    };
    print(val);
  }
}
