part of 'add_rating_cubit.dart';

@immutable
sealed class AddRatingState {}

final class AddRatingInitial extends AddRatingState {}

final class AddRatingLoading extends AddRatingState {}

final class AddRatingFailure extends AddRatingState {
  AddRatingFailure({required this.err});

  final String err;
}

final class AddRatingSuccess extends AddRatingState {}
