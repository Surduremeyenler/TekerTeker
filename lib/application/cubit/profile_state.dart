part of 'profile_cubit.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.initial(
      {required bool isLoading,
      required bool isLoaded,
      required Map<String, dynamic> profileInformation}) = _Initial;
}
