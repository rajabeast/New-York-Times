part of 'widgets.dart';

class StoriesListView extends StatelessWidget {
  final List<TopStoriesModel> stories;

  const StoriesListView({super.key, required this.stories});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: stories.length,
      itemBuilder: (context, index) {
        return StoryListItem(story: stories[index]);
      },
    );
  }
}
