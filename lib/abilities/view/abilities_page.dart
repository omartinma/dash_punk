import 'package:dash_punk/abilities/bloc/abilities_bloc.dart';
import 'package:dash_punk/abilities/widgets/stat_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../theme/colors.dart';

class AbilitiesPage extends StatelessWidget {
  const AbilitiesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AbilitiesBloc>(
      create: (context) => AbilitiesBloc(),
      child: const AbilitiesView(),
    );
  }
}

class AbilitiesView extends StatelessWidget {
  const AbilitiesView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AbilitiesBloc, AbilitiesState>(
        builder: (context, state) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Gap(16),
                  Header(),
                  Gap(32),
                  RemainingPoints(),
                  Gap(16),
                  StatCounter(
                    label: 'STRENGTH',
                    currentStatValue: state.stats[Stat.strength] ?? 0,
                    currentValueToLevelUp: 0,
                    onDecrement: () => print("onDecrement"),
                    onIncrement: () => print("onIncrement"),
                    stat: Stat.strength,
                  ),
                  LevelUpButton(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

@visibleForTesting
class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Flexible(
          child: Dashatar(),
        ),
        const Gap(8),
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              DashatarName(),
              Level(),
            ],
          ),
        )
      ],
    );
  }
}

@visibleForTesting
class Dashatar extends StatelessWidget {
  const Dashatar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(20);
    return AspectRatio(
      aspectRatio: 1,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: borderRadius),
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            border: Border.all(
              color: FlutterColors.secondary,
              width: 4,
            ),
          ),
          position: DecorationPosition.foreground,
          child: Image.asset(
            'assets/dashatar.png',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

@visibleForTesting
class DashatarName extends StatelessWidget {
  const DashatarName({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Text(
      'Dash Punk',
      style: textTheme.headline3!.copyWith(color: FlutterColors.blue),
    );
  }
}

@visibleForTesting
class Level extends StatelessWidget {
  const Level({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return BlocBuilder<AbilitiesBloc, AbilitiesState>(
      builder: (context, state) {
        return Text(
          'Level ${state.level}',
          style: textTheme.headline6,
        );
      },
    );
  }
}

@visibleForTesting
class RemainingPoints extends StatelessWidget {
  const RemainingPoints({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return BlocBuilder<AbilitiesBloc, AbilitiesState>(
      builder: (context, state) {
        return Text(
          '${state.unaffectedPoints} points remaining',
          style: textTheme.headline5,
        );
      },
    );
  }
}

@visibleForTesting
class LevelUpButton extends StatelessWidget {
  const LevelUpButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final enabled = true;

    return OutlinedButton(
      onPressed: enabled ? () => print("Level up") : null,
      child: const Text('Level up'),
    );
  }
}
