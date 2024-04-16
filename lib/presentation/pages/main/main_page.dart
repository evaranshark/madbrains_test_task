import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/repository/buildings_repository.dart';
import '../../../utils/services.dart';
import '../../widgets/object_list_item.dart';
import 'bloc/building_objects_bloc.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => BuildingObjectsBloc(
            repository: services.get<BuildingsRepository>(),
          )..add(
              BuildingObjectsLoad(),
            ),
        ),
      ],
      child: const _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<BuildingObjectsBloc, BuildingObjectsState>(
        listener: (context, state) {
          ScaffoldMessenger.maybeOf(context)?.showSnackBar(
            const SnackBar(
              content: Text(
                'Что-то пошло не так',
              ),
            ),
          );
        },
        listenWhen: (previous, current) => current is BuildingObjectsError,
        child: RefreshIndicator.adaptive(
          onRefresh: () async {
            if (context.read<BuildingObjectsBloc>().state
                is! BuildingObjectsLoading) {
              context.read<BuildingObjectsBloc>().add(BuildingObjectsLoad());
            }
          },
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                expandedHeight: 176,
                flexibleSpace: FlexibleSpaceBar(
                  background: Padding(
                    padding: const EdgeInsets.only(
                      left: 16.0,
                      right: 16.0,
                      top: 76,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Объекты',
                              style: Theme.of(context).textTheme.headlineLarge,
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.info_outline_rounded,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12.0,
                        ),
                        TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                sliver: BlocBuilder<BuildingObjectsBloc, BuildingObjectsState>(
                  builder: (context, state) {
                    if (state is BuildingObjectsLoading) {
                      return const SliverFillRemaining(
                        child: Center(
                          child: CircularProgressIndicator.adaptive(),
                        ),
                      );
                    }
                    if (state is BuildingObjectsDataRetrieved) {
                      return SliverList.separated(
                        itemBuilder: (context, index) {
                          final item = state.objects[index];
                          return ObjectListItem(
                            title: item.title,
                            pointsTotal: item.totalPointsCount,
                            pointsRemain: item.remainingPoints,
                            memoryPredict: item.totalPointsCount * 5,
                            memoryRemain: 0,
                            onTap: () {},
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            height: 12.0,
                          );
                        },
                      );
                    }
                    return const SliverToBoxAdapter();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
