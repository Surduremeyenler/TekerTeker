import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:teker_teker/infrastructure/profile_service/profile_service.dart';

part 'profile_state.dart';
part 'profile_cubit.freezed.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit()
      : super(ProfileState.initial(
            profileInformation: {}, isLoaded: false, isLoading: true));

  ProfileService profileService = ProfileService();

  void getProfileInformations() async {
    try {
      var userData = await profileService.getUserInformation();
      emit(state.copyWith(
          isLoaded: true, profileInformation: userData, isLoading: false));
    } catch (e) {
      print(e);
    }
  }
}
