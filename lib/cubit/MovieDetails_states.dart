import 'package:movies_appp/models/MovieDetailResponse.dart';

abstract class MovieDetailsStates {}

class InitialState extends MovieDetailsStates {}

class LadingState extends MovieDetailsStates {}

class ErrorState extends MovieDetailsStates {
  String errorMessage;

  ErrorState({required this.errorMessage});


}

class SuccessState extends MovieDetailsStates {
  MovieDetailResponse response;

  SuccessState({required this.response});
}
