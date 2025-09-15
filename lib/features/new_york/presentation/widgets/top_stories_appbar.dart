part of 'widgets.dart';

class TopStoriesAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize = const Size.fromHeight(kToolbarHeight);

  const TopStoriesAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('NY Times Top Stories'),
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      actions: [
        BlocBuilder<TopStoriesCubit, TopStoriesState>(
          builder: (context, state) {
            return IconButton(
              icon: Icon(state.isListView ? Icons.grid_view : Icons.list),
              onPressed: () {
                context.read<TopStoriesCubit>().toggleView();
              },
            );
          },
        ),
      ],
    );
  }
}
