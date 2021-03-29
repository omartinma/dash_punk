part of 'abilities_bloc.dart';

class AbilitiesState extends Equatable {
  final Map<dynamic, int> stats;
  final Map<dynamic, int> currentLevelup;
  final int level;
  const AbilitiesState(this.stats, this.currentLevelup, this.level);

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class AbilitiesInitial extends AbilitiesState {
  AbilitiesInitial()
      : super(<Stat, int>{
          Stat.strength: 1,
          Stat.agility: 1,
          Stat.wisdom: 1,
          Stat.charisma: 1,
        }, <Stat, int>{}, 1);
}
