part of 'abilities_bloc.dart';

class AbilitiesState extends Equatable {
  final Map<Stat, int> stats;
  final Map<Stat, int> statsToLevelUp;
  final int level;
  final int unaffectedPoints;
  const AbilitiesState(
      this.stats, this.statsToLevelUp, this.level, this.unaffectedPoints);

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class AbilitiesInitial extends AbilitiesState {
  AbilitiesInitial()
      : super(
          <Stat, int>{
            Stat.strength: 1,
            Stat.agility: 1,
            Stat.wisdom: 1,
            Stat.charisma: 1,
          },
          <Stat, int>{},
          1,
          8,
        );
}
