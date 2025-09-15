part of 'widgets.dart';

class StoryTags extends StatelessWidget {
  final List<String> tags;

  const StoryTags({super.key, required this.tags});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: tags
          .take(5) // Limit to 5 tags
          .map(
            (tag) => Chip(
              label: CustomText(tag, fontSize: 12, color: Colors.grey[700]),
              backgroundColor: Colors.grey[200],
              side: BorderSide.none,
            ),
          )
          .toList(),
    );
  }
}
