// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'home_page_router_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$HomePageRouterStateTearOff {
  const _$HomePageRouterStateTearOff();

  _Initial initial({required int pageIndex}) {
    return _Initial(
      pageIndex: pageIndex,
    );
  }
}

/// @nodoc
const $HomePageRouterState = _$HomePageRouterStateTearOff();

/// @nodoc
mixin _$HomePageRouterState {
  int get pageIndex => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int pageIndex) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int pageIndex)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int pageIndex)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomePageRouterStateCopyWith<HomePageRouterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomePageRouterStateCopyWith<$Res> {
  factory $HomePageRouterStateCopyWith(
          HomePageRouterState value, $Res Function(HomePageRouterState) then) =
      _$HomePageRouterStateCopyWithImpl<$Res>;
  $Res call({int pageIndex});
}

/// @nodoc
class _$HomePageRouterStateCopyWithImpl<$Res>
    implements $HomePageRouterStateCopyWith<$Res> {
  _$HomePageRouterStateCopyWithImpl(this._value, this._then);

  final HomePageRouterState _value;
  // ignore: unused_field
  final $Res Function(HomePageRouterState) _then;

  @override
  $Res call({
    Object? pageIndex = freezed,
  }) {
    return _then(_value.copyWith(
      pageIndex: pageIndex == freezed
          ? _value.pageIndex
          : pageIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$InitialCopyWith<$Res>
    implements $HomePageRouterStateCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
  @override
  $Res call({int pageIndex});
}

/// @nodoc
class __$InitialCopyWithImpl<$Res>
    extends _$HomePageRouterStateCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(_Initial _value, $Res Function(_Initial) _then)
      : super(_value, (v) => _then(v as _Initial));

  @override
  _Initial get _value => super._value as _Initial;

  @override
  $Res call({
    Object? pageIndex = freezed,
  }) {
    return _then(_Initial(
      pageIndex: pageIndex == freezed
          ? _value.pageIndex
          : pageIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial({required this.pageIndex});

  @override
  final int pageIndex;

  @override
  String toString() {
    return 'HomePageRouterState.initial(pageIndex: $pageIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Initial &&
            const DeepCollectionEquality().equals(other.pageIndex, pageIndex));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(pageIndex));

  @JsonKey(ignore: true)
  @override
  _$InitialCopyWith<_Initial> get copyWith =>
      __$InitialCopyWithImpl<_Initial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int pageIndex) initial,
  }) {
    return initial(pageIndex);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int pageIndex)? initial,
  }) {
    return initial?.call(pageIndex);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int pageIndex)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(pageIndex);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements HomePageRouterState {
  const factory _Initial({required int pageIndex}) = _$_Initial;

  @override
  int get pageIndex;
  @override
  @JsonKey(ignore: true)
  _$InitialCopyWith<_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}
