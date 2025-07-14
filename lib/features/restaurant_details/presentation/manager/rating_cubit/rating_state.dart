part of 'rating_cubit.dart';

@immutable
sealed class RatingState {}

final class RatingInitial extends RatingState {}

final class RatingLoading extends RatingState {}

final class RatingFailure extends RatingState {
  RatingFailure({required this.err});

  final String err;
}

final class RatingSuccess extends RatingState {
  RatingSuccess({required this.entity});

  final RatingEntity? entity;
}
