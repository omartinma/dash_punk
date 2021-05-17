import 'package:dash_punk/abilities/bloc/abilities_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../theme/colors.dart';

const minStat = 0.0;
const maxStat = 4.0;

class StatCounter extends StatelessWidget {
  const StatCounter({
    Key? key,
    required this.label,
    required this.currentStatValue,
    required this.currentValueToLevelUp,
    required this.onDecrement,
    required this.onIncrement,
    required this.stat,
  }) : super(key: key);

  final String label;
  final int currentStatValue;
  final int currentValueToLevelUp;
  final Function onDecrement;
  final Function onIncrement;
  final Stat stat;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AbilitiesBloc, AbilitiesState>(
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.all(8),
          decoration: ShapeDecoration(
            color: FlutterColors.secondary.withOpacity(0.1),
            shape: const StadiumBorder(
              side: BorderSide(
                color: FlutterColors.secondary,
                width: 2,
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Gap(16),
              Expanded(
                  child: StatName(
                label: label,
              )),
              StatValue(
                value: state.stats[stat] ?? 0,
              ),
              Gap(16),
              Difference(
                value: state.statsToLevelUp[stat] ?? 0,
              ),
              Gap(32),
              DecrementButton(
                enabled: currentStatValue > minStat,
                onPressed: onDecrement,
              ),
              IncrementButton(
                enabled: currentStatValue < maxStat,
                onPressed: onIncrement,
              ),
            ],
          ),
        );
      },
    );
  }
}

@visibleForTesting
class StatName extends StatelessWidget {
  const StatName({
    Key? key,
    required this.label,
  }) : super(key: key);

  final String label;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Text(
      label,
      style: textTheme.subtitle1!.copyWith(fontWeight: FontWeight.bold),
    );
  }
}

@visibleForTesting
class StatValue extends StatelessWidget {
  const StatValue({
    Key? key,
    required this.value,
  }) : super(key: key);

  final int value;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Text(
      '$value',
      style: textTheme.headline6!.copyWith(
        fontWeight: FontWeight.bold,
        color: FlutterColors.blue,
      ),
    );
  }
}

@visibleForTesting
class Difference extends StatelessWidget {
  const Difference({
    Key? key,
    required this.value,
  }) : super(key: key);

  final int value;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    Color color = FlutterColors.secondary;
    if (value == 0) {
      color = FlutterColors.gray600;
    } else if (value == maxStat) {
      color = FlutterColors.primary;
    }

    return Text(
      '+ $value',
      style: textTheme.headline6!.copyWith(
        color: color,
      ),
    );
  }
}

@visibleForTesting
class DecrementButton extends StatelessWidget {
  const DecrementButton({
    Key? key,
    required this.enabled,
    required this.onPressed,
  }) : super(key: key);

  final bool enabled;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return _StatButton(
      icon: Icons.remove,
      onPressed: enabled ? () => onPressed.call : null,
    );
  }
}

@visibleForTesting
class IncrementButton extends StatelessWidget {
  const IncrementButton({
    Key? key,
    required this.enabled,
    required this.onPressed,
  }) : super(key: key);

  final bool enabled;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return _StatButton(
      icon: Icons.add,
      onPressed: enabled ? () => onPressed.call : null,
    );
  }
}

class _StatButton extends StatelessWidget {
  const _StatButton({
    Key? key,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  final IconData icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
      ).copyWith(
        foregroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return FlutterColors.gray900;
          }
          return FlutterColors.white;
        }),
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return FlutterColors.gray100;
          }
          return FlutterColors.primary;
        }),
      ),
      child: Icon(icon),
    );
  }
}
