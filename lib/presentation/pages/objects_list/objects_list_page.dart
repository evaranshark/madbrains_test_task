import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../domain/repository/buildings_repository.dart';
import '../../../utils/services.dart';
import '../../../utils/theme_values.dart';
import '../../widgets/app_bar_with_search.dart';
import '../../widgets/object_list_item.dart';
import 'bloc/building_objects_bloc.dart';

class ObjectsListPage extends StatelessWidget {
  const ObjectsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => BuildingObjectsBloc(
            repository: services.get<BuildingsRepository>(),
          )
            ..add(
              BuildingObjectsLoad(),
            )
            ..add(BuildingObjectsLoadMemoryInfo()),
        ),
      ],
      child: const _Body(),
    );
  }
}

class _Body extends StatefulWidget {
  const _Body();

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  late final TextEditingController _searchController;
  final searchFocus = FocusNode();
  final appBarSearchFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _searchController.addListener(onSearchFieldChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(onSearchFieldChanged);
    _searchController.dispose();
    searchFocus.dispose();
    super.dispose();
  }

  void onSearchFieldChanged() {
    context
        .read<BuildingObjectsBloc>()
        .add(BuildingObjectsFilter(pattern: _searchController.text));
  }

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
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              if (innerBoxIsScrolled && searchFocus.hasFocus) {
                appBarSearchFocus.requestFocus();
              }
              return <Widget>[
                _AppBar(
                  searchController: _searchController,
                  appBarSearchFocus: appBarSearchFocus,
                  searchFocus: searchFocus,
                  isScrolled: innerBoxIsScrolled,
                ),
              ];
            },
            body: const _ItemsView(),
          ),
        ),
      ),
    );
  }
}

class _AppBar extends StatelessWidget {
  const _AppBar({
    required TextEditingController searchController,
    required this.appBarSearchFocus,
    required this.searchFocus,
    required this.isScrolled,
  }) : _searchController = searchController;

  final TextEditingController _searchController;
  final FocusNode appBarSearchFocus;
  final FocusNode searchFocus;
  final bool isScrolled;

  @override
  Widget build(BuildContext context) {
    return SliverOverlapAbsorber(
      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
      sliver: SliverAppBar(
        forceElevated: isScrolled,
        elevation: 10.0,
        expandedHeight: 176.0,
        pinned: true,
        backgroundColor: isScrolled
            ? services.get<ThemeValues>().colors.surfaceMain
            : services.get<ThemeValues>().colors.background,
        title: isScrolled
            ? AppBarWithSearch(
                controller: _searchController,
                initialCollapsed: _searchController.text.isEmpty,
                focusNode: appBarSearchFocus,
              )
            : null,
        flexibleSpace: FlexibleSpaceBar(
          // centerTitle: true,
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
                  controller: _searchController,
                  focusNode: searchFocus,
                  style: Theme.of(context).textTheme.bodyLarge,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    filled: true,
                    border: Theme.of(context)
                        .inputDecorationTheme
                        .border
                        ?.copyWith(borderSide: BorderSide.none),
                    // TODO: Should be used from icon pack or as svg
                    // Use like this to save time
                    suffixIcon: Image.asset('assets/search_suffix.png'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ItemsView extends StatelessWidget {
  const _ItemsView();

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator.adaptive(
      onRefresh: () async {
        if (context.read<BuildingObjectsBloc>().state
            is! BuildingObjectsLoading) {
          context.read<BuildingObjectsBloc>()
            ..add(BuildingObjectsLoad())
            ..add(BuildingObjectsLoadMemoryInfo());
        }
      },
      child: CustomScrollView(
        slivers: [
          SliverOverlapInjector(
            // This is the flip side of the SliverOverlapAbsorber above.
            handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
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
                  if (state.objects.isEmpty) {
                    return const SliverFillRemaining(
                      child: Center(
                        child: Text('Ничего не найдено'),
                      ),
                    );
                  }
                  return SliverList.separated(
                    itemBuilder: (context, index) {
                      final item = state.objects[index];
                      return ObjectListItem(
                        title: item.title,
                        pointsTotal: item.totalPointsCount,
                        pointsRemain: item.remainingPoints,
                        memoryPredict: item.totalPointsCount * 5,
                        memoryRemain: state.freeMemory ?? 0,
                        onTap: () {
                          context.read<BuildingObjectsBloc>().add(
                                BuildingObjectsSelectObject(
                                  object: item,
                                ),
                              );
                          context.push('/object');
                        },
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 12.0,
                      );
                    },
                    itemCount: state.objects.length,
                  );
                }
                return const SliverToBoxAdapter();
              },
            ),
          ),
        ],
      ),
    );
  }
}
