part of 'local_cubit.dart';

@immutable
abstract class LocalState {}

class LocalInitial extends LocalState {}

class ChangeLocaleState  extends LocalState{
  final Locale locale;
  ChangeLocaleState({
    required this.locale,
  });

  
}
