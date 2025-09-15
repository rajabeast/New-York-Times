part of 'widgets.dart';

class StoriesContent extends StatelessWidget {
  const StoriesContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<TopStoriesCubit, TopStoriesState>(
        builder: (context, state) {
          switch (state.status) {
            case AppStateStatus.loading:
              return const Center(child: CircularProgressIndicator());
            case AppStateStatus.failure:
              return ErrorStateWidget(
                message: state.message,
                onRetry: () {
                  context.read<TopStoriesCubit>().refreshStories();
                },
              );
            case AppStateStatus.success:
              if (state.filteredStories.isEmpty) {
                return const Center(
                  child: Text(
                    'No stories found',
                    style: TextStyle(fontSize: 18),
                  ),
                );
              }
              return RefreshIndicator(
                onRefresh: () async {
                  await context.read<TopStoriesCubit>().refreshStories();
                },
                child: state.isListView
                    ? StoriesListView(stories: state.filteredStories)
                    : StoriesGridView(stories: state.filteredStories),
              );
            default:
              return const Center(
                child: Text('Welcome to NY Times Top Stories'),
              );
          }
        },
      ),
    );
  }
}
