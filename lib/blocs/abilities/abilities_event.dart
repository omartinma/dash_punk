part of 'abilities_bloc.dart';

@immutable
abstract class AbilitiesEvent {}

class AbilityIncremented extends AbilitiesEvent {
  final Stat stat;
  AbilityIncremented(this.stat);
}

class AbilityDecremented extends AbilitiesEvent {
  final Stat stat;
  AbilityDecremented(this.stat);
}

class LevelUp extends AbilitiesEvent {
  LevelUp();
}
