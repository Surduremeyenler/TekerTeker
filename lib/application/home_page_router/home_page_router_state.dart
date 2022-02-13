part of 'home_page_router_cubit.dart';

@freezed
class HomePageRouterState with _$HomePageRouterState {
  const factory HomePageRouterState.initial({
    required int pageIndex,
  }) = _Initial;
}
