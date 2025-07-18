import 'package:flutter/material.dart';
import 'package:restaurants/features/restaurant_details/domain/entites/rating_entity.dart';

@immutable
sealed class GetRatingState {}

final class GetRatingInitial extends GetRatingState {}

final class GetRatingLoading extends GetRatingState {}

final class GetRatingFailure extends GetRatingState {
  GetRatingFailure({required this.err});

  final String err;
}

final class GetRatingSuccess extends GetRatingState {
  GetRatingSuccess({required this.entity});

  final List<RatingEntity> entity;
}
