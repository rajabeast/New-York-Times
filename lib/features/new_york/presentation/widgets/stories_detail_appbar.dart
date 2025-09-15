part of 'widgets.dart';

class StoryDetailAppBar extends StatelessWidget {
  final TopStoriesModel story;

  const StoryDetailAppBar({super.key, required this.story});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 300,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: story.largeImageUrl.isNotEmpty
            ? CachedNetworkImage(
                imageUrl: story.largeImageUrl,
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(
                  color: Colors.grey[300],
                  child: const Icon(Icons.image, color: Colors.grey, size: 60),
                ),
                errorWidget: (context, url, error) => Container(
                  color: Colors.grey[300],
                  child: const Icon(
                    Icons.broken_image,
                    color: Colors.grey,
                    size: 60,
                  ),
                ),
              )
            : Container(
                color: Colors.grey[300],
                child: const Icon(Icons.article, color: Colors.grey, size: 60),
              ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.share),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Share functionality not implemented'),
              ),
            );
          },
        ),
      ],
    );
  }
}
