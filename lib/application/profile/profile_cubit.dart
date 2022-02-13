import 'package:bloc/bloc.dart';
import 'package:teker_teker/application/profile/profile_state.dart';
import 'package:teker_teker/infrastructure/profile_service/profile_service.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  ProfileService profileService = ProfileService();

  void getProfileInformations() async {
    emit(ProfileLoading());
    var userData = await profileService.getUserInformation();
    emit(ProfileLoaded(userData));
  }
}
