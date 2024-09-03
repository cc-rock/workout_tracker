// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_workouts_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MyWorkoutsViewState {
  List<Workout> get workouts => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MyWorkoutsViewStateCopyWith<MyWorkoutsViewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyWorkoutsViewStateCopyWith<$Res> {
  factory $MyWorkoutsViewStateCopyWith(
          MyWorkoutsViewState value, $Res Function(MyWorkoutsViewState) then) =
      _$MyWorkoutsViewStateCopyWithImpl<$Res, MyWorkoutsViewState>;
  @useResult
  $Res call({List<Workout> workouts, bool isLoading});
}

/// @nodoc
class _$MyWorkoutsViewStateCopyWithImpl<$Res, $Val extends MyWorkoutsViewState>
    implements $MyWorkoutsViewStateCopyWith<$Res> {
  _$MyWorkoutsViewStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? workouts = null,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      workouts: null == workouts
          ? _value.workouts
          : workouts // ignore: cast_nullable_to_non_nullable
              as List<Workout>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MyWorkoutsViewStateImplCopyWith<$Res>
    implements $MyWorkoutsViewStateCopyWith<$Res> {
  factory _$$MyWorkoutsViewStateImplCopyWith(_$MyWorkoutsViewStateImpl value,
          $Res Function(_$MyWorkoutsViewStateImpl) then) =
      __$$MyWorkoutsViewStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Workout> workouts, bool isLoading});
}

/// @nodoc
class __$$MyWorkoutsViewStateImplCopyWithImpl<$Res>
    extends _$MyWorkoutsViewStateCopyWithImpl<$Res, _$MyWorkoutsViewStateImpl>
    implements _$$MyWorkoutsViewStateImplCopyWith<$Res> {
  __$$MyWorkoutsViewStateImplCopyWithImpl(_$MyWorkoutsViewStateImpl _value,
      $Res Function(_$MyWorkoutsViewStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? workouts = null,
    Object? isLoading = null,
  }) {
    return _then(_$MyWorkoutsViewStateImpl(
      workouts: null == workouts
          ? _value._workouts
          : workouts // ignore: cast_nullable_to_non_nullable
              as List<Workout>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$MyWorkoutsViewStateImpl implements _MyWorkoutsViewState {
  const _$MyWorkoutsViewStateImpl(
      {final List<Workout> workouts = const [], this.isLoading = false})
      : _workouts = workouts;

  final List<Workout> _workouts;
  @override
  @JsonKey()
  List<Workout> get workouts {
    if (_workouts is EqualUnmodifiableListView) return _workouts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_workouts);
  }

  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'MyWorkoutsViewState(workouts: $workouts, isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyWorkoutsViewStateImpl &&
            const DeepCollectionEquality().equals(other._workouts, _workouts) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_workouts), isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MyWorkoutsViewStateImplCopyWith<_$MyWorkoutsViewStateImpl> get copyWith =>
      __$$MyWorkoutsViewStateImplCopyWithImpl<_$MyWorkoutsViewStateImpl>(
          this, _$identity);
}

abstract class _MyWorkoutsViewState implements MyWorkoutsViewState {
  const factory _MyWorkoutsViewState(
      {final List<Workout> workouts,
      final bool isLoading}) = _$MyWorkoutsViewStateImpl;

  @override
  List<Workout> get workouts;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$MyWorkoutsViewStateImplCopyWith<_$MyWorkoutsViewStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
