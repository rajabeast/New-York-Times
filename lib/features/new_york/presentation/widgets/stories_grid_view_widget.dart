part of 'widgets.dart';

class StoriesGridView extends StatelessWidget {
  final List<TopStoriesModel> stories;

  const StoriesGridView({super.key, required this.stories});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: stories.length,
      itemBuilder: (context, index) {
        return StoryCardItem(story: stories[index]);
      },
    );
  }
}
