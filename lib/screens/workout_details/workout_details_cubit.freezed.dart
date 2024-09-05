// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workout_details_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$WorkoutDetailsViewState {
  Workout get workout => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isModified => throw _privateConstructorUsedError;
  ViewMode get viewMode => throw _privateConstructorUsedError;
  List<Exercise> get availableExercises => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WorkoutDetailsViewStateCopyWith<WorkoutDetailsViewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkoutDetailsViewStateCopyWith<$Res> {
  factory $WorkoutDetailsViewStateCopyWith(WorkoutDetailsViewState value,
          $Res Function(WorkoutDetailsViewState) then) =
      _$WorkoutDetailsViewStateCopyWithImpl<$Res, WorkoutDetailsViewState>;
  @useResult
  $Res call(
      {Workout workout,
      bool isLoading,
      bool isModified,
      ViewMode viewMode,
      List<Exercise> availableExercises});

  $WorkoutCopyWith<$Res> get workout;
}

/// @nodoc
class _$WorkoutDetailsViewStateCopyWithImpl<$Res,
        $Val extends WorkoutDetailsViewState>
    implements $WorkoutDetailsViewStateCopyWith<$Res> {
  _$WorkoutDetailsViewStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? workout = null,
    Object? isLoading = null,
    Object? isModified = null,
    Object? viewMode = null,
    Object? availableExercises = null,
  }) {
    return _then(_value.copyWith(
      workout: null == workout
          ? _value.workout
          : workout // ignore: cast_nullable_to_non_nullable
              as Workout,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isModified: null == isModified
          ? _value.isModified
          : isModified // ignore: cast_nullable_to_non_nullable
              as bool,
      viewMode: null == viewMode
          ? _value.viewMode
          : viewMode // ignore: cast_nullable_to_non_nullable
              as ViewMode,
      availableExercises: null == availableExercises
          ? _value.availableExercises
          : availableExercises // ignore: cast_nullable_to_non_nullable
              as List<Exercise>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $WorkoutCopyWith<$Res> get workout {
    return $WorkoutCopyWith<$Res>(_value.workout, (value) {
      return _then(_value.copyWith(workout: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WorkoutDetailsViewStateImplCopyWith<$Res>
    implements $WorkoutDetailsViewStateCopyWith<$Res> {
  factory _$$WorkoutDetailsViewStateImplCopyWith(
          _$WorkoutDetailsViewStateImpl value,
          $Res Function(_$WorkoutDetailsViewStateImpl) then) =
      __$$WorkoutDetailsViewStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Workout workout,
      bool isLoading,
      bool isModified,
      ViewMode viewMode,
      List<Exercise> availableExercises});

  @override
  $WorkoutCopyWith<$Res> get workout;
}

/// @nodoc
class __$$WorkoutDetailsViewStateImplCopyWithImpl<$Res>
    extends _$WorkoutDetailsViewStateCopyWithImpl<$Res,
        _$WorkoutDetailsViewStateImpl>
    implements _$$WorkoutDetailsViewStateImplCopyWith<$Res> {
  __$$WorkoutDetailsViewStateImplCopyWithImpl(
      _$WorkoutDetailsViewStateImpl _value,
      $Res Function(_$WorkoutDetailsViewStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? workout = null,
    Object? isLoading = null,
    Object? isModified = null,
    Object? viewMode = null,
    Object? availableExercises = null,
  }) {
    return _then(_$WorkoutDetailsViewStateImpl(
      workout: null == workout
          ? _value.workout
          : workout // ignore: cast_nullable_to_non_nullable
              as Workout,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isModified: null == isModified
          ? _value.isModified
          : isModified // ignore: cast_nullable_to_non_nullable
              as bool,
      viewMode: null == viewMode
          ? _value.viewMode
          : viewMode // ignore: cast_nullable_to_non_nullable
              as ViewMode,
      availableExercises: null == availableExercises
          ? _value._availableExercises
          : availableExercises // ignore: cast_nullable_to_non_nullable
              as List<Exercise>,
    ));
  }
}

/// @nodoc

class _$WorkoutDetailsViewStateImpl implements _WorkoutDetailsViewState {
  const _$WorkoutDetailsViewStateImpl(
      {required this.workout,
      this.isLoading = false,
      this.isModified = false,
      this.viewMode = ViewMode.viewing,
      final List<Exercise> availableExercises = const []})
      : _availableExercises = availableExercises;

  @override
  final Workout workout;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isModified;
  @override
  @JsonKey()
  final ViewMode viewMode;
  final List<Exercise> _availableExercises;
  @override
  @JsonKey()
  List<Exercise> get availableExercises {
    if (_availableExercises is EqualUnmodifiableListView)
      return _availableExercises;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_availableExercises);
  }

  @override
  String toString() {
    return 'WorkoutDetailsViewState(workout: $workout, isLoading: $isLoading, isModified: $isModified, viewMode: $viewMode, availableExercises: $availableExercises)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkoutDetailsViewStateImpl &&
            (identical(other.workout, workout) || other.workout == workout) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isModified, isModified) ||
                other.isModified == isModified) &&
            (identical(other.viewMode, viewMode) ||
                other.viewMode == viewMode) &&
            const DeepCollectionEquality()
                .equals(other._availableExercises, _availableExercises));
  }

  @override
  int get hashCode => Object.hash(runtimeType, workout, isLoading, isModified,
      viewMode, const DeepCollectionEquality().hash(_availableExercises));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkoutDetailsViewStateImplCopyWith<_$WorkoutDetailsViewStateImpl>
      get copyWith => __$$WorkoutDetailsViewStateImplCopyWithImpl<
          _$WorkoutDetailsViewStateImpl>(this, _$identity);
}

abstract class _WorkoutDetailsViewState implements WorkoutDetailsViewState {
  const factory _WorkoutDetailsViewState(
      {required final Workout workout,
      final bool isLoading,
      final bool isModified,
      final ViewMode viewMode,
      final List<Exercise> availableExercises}) = _$WorkoutDetailsViewStateImpl;

  @override
  Workout get workout;
  @override
  bool get isLoading;
  @override
  bool get isModified;
  @override
  ViewMode get viewMode;
  @override
  List<Exercise> get availableExercises;
  @override
  @JsonKey(ignore: true)
  _$$WorkoutDetailsViewStateImplCopyWith<_$WorkoutDetailsViewStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
