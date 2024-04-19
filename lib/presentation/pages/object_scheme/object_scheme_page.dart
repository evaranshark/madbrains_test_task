import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/buildingpoint.dart';
import '../../../domain/repository/buildings_repository.dart';
import '../../../utils/services.dart';
import '../../widgets/camera_point.dart';
import 'cubit/object_scheme_cubit.dart';

class ObjectSchemePage extends StatelessWidget {
  const ObjectSchemePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ObjectSchemeCubit(
        repository: services.get<BuildingsRepository>(),
      )..getObjectData(),
      child: const _Page(),
    );
  }
}

class _Page extends StatelessWidget {
  const _Page();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<ObjectSchemeCubit, ObjectSchemeState>(
          buildWhen: (previous, current) => current.object != null,
          builder: (context, state) => Text(
            state.object!.title,
          ),
        ),
      ),
      body: const SafeArea(child: _Body()),
    );
  }
}

class _Body extends StatefulWidget {
  const _Body();

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  final _controller = TransformationController();
  double _scale = 1.0;

  void onControllerChanged() {
    if (_scale != _controller.value.getMaxScaleOnAxis()) {
      setState(() {
        _scale = _controller.value.getMaxScaleOnAxis();
      });
    }
  }

  @override
  void initState() {
    _controller.addListener(onControllerChanged);
    super.initState();
  }

  @override
  void dispose() {
    _controller.removeListener(onControllerChanged);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
      clipBehavior: Clip.none,
      constrained: false,
      boundaryMargin: const EdgeInsets.all(
        8.0,
      ),
      minScale: 1.0,
      maxScale: 3.0,
      transformationController: _controller,
      child: BlocBuilder<ObjectSchemeCubit, ObjectSchemeState>(
        builder: (context, state) {
          final points = state.object!.points;
          return Stack(
            children: [
              Image.asset(
                'assets/mock_scheme.png',
              ),
              ...points.map(
                (e) => Positioned(
                  left: e.x.toDouble(),
                  bottom: e.y.toDouble(),
                  child: CameraPoint(
                    isCompleted: e.status == BuildingPointStatus.completed,
                    scaleFactor: _scale,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
