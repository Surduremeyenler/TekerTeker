import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_page_router_state.dart';
part 'home_page_router_cubit.freezed.dart';

class HomePageRouterCubit extends Cubit<HomePageRouterState> {
  HomePageRouterCubit() : super(HomePageRouterState.initial(pageIndex: 1));

  void changeThePage({required int newPageIndex}) {
    emit(state.copyWith(pageIndex: newPageIndex));
  }
}
