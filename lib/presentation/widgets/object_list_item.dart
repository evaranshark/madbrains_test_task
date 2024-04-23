import 'package:flutter/material.dart';

class ObjectListItem extends StatelessWidget {
  const ObjectListItem({
    super.key,
    required this.title,
    required this.pointsTotal,
    required this.pointsRemain,
    required this.memoryPredict,
    required this.memoryRemain,
    required this.onTap,
  });

  final String title;
  final int pointsTotal;
  final int pointsRemain;
  final double memoryPredict;
  final double memoryRemain;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 3.0,
        child: Padding(
          padding: const EdgeInsets.all(
            16.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(
                height: 8.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _Work(
                    pointsRemain: pointsRemain,
                    pointsTotal: pointsTotal,
                  ),
                  const SizedBox(
                    width: 16.0,
                  ),
                  _Memory(
                    memoryPredict: memoryPredict,
                    memoryRemain: memoryRemain,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Memory extends StatelessWidget {
  const _Memory({
    required this.memoryPredict,
    required this.memoryRemain,
  });

  final double memoryPredict;
  final double memoryRemain;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Съёмка займёт',
          style: Theme.of(context).textTheme.labelSmall,
        ),
        Text.rich(
          TextSpan(
            text: memoryPredict.toStringAsFixed(1),
            style: Theme.of(context).textTheme.bodyMedium,
            children: [
              TextSpan(
                text: ' ГБ',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              TextSpan(
                text: ' / ',
                style: Theme.of(context).textTheme.labelSmall,
              ),
              TextSpan(
                text: memoryRemain.toStringAsFixed(1),
                style: Theme.of(context).textTheme.labelSmall,
              ),
              TextSpan(
                text: ' ГБ доступно',
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _Work extends StatelessWidget {
  const _Work({
    required this.pointsRemain,
    required this.pointsTotal,
  });

  final int pointsRemain;
  final int pointsTotal;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Отснято сегодня',
          style: Theme.of(context).textTheme.labelSmall,
        ),
        Text.rich(
          TextSpan(
            text: pointsRemain.toString(),
            style: Theme.of(context).textTheme.bodyMedium,
            children: [
              TextSpan(
                text: ' / ',
                style: Theme.of(context).textTheme.labelSmall,
              ),
              TextSpan(
                text: pointsTotal.toString(),
                style: Theme.of(context).textTheme.labelSmall,
              ),
              TextSpan(
                text: ' доступно',
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
