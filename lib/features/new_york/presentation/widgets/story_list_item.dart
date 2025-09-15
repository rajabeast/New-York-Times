part of 'widgets.dart';

class StoryListItem extends StatelessWidget {
  final TopStoriesModel story;

  const StoryListItem({super.key, required this.story});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => StoryDetailPage(story: story),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Thumbnail
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: SizedBox(
                  width: 80,
                  height: 80,
                  child: story.thumbnailUrl.isNotEmpty
                      ? CachedNetworkImage(
                          imageUrl: story.thumbnailUrl,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Container(
                            color: Colors.grey[300],
                            child: const Icon(Icons.image, color: Colors.grey),
                          ),
                          errorWidget: (context, url, error) => Container(
                            color: Colors.grey[300],
                            child: const Icon(
                              Icons.broken_image,
                              color: Colors.grey,
                            ),
                          ),
                        )
                      : Container(
                          color: Colors.grey[300],
                          child: const Icon(Icons.article, color: Colors.grey),
                        ),
                ),
              ),
              const SizedBox(width: 12),
              // Content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      story.title ?? 'No Title',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      maxLines: 2,
                    ),
                    const SizedBox(height: 4),
                    if (story.byline != null && story.byline!.isNotEmpty) ...[
                      CustomText(
                        story.byline!,
                        fontSize: 12,
                        color: Colors.grey[600],
                        maxLines: 1,
                      ),
                      const SizedBox(height: 4),
                    ],
                    if (story.abstract != null && story.abstract!.isNotEmpty)
                      CustomText(
                        story.abstract!,
                        fontSize: 14,
                        color: Colors.grey[700],
                        maxLines: 2,
                      ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        if (story.section != null) ...[
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: Theme.of(
                                context,
                              ).primaryColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: CustomText(
                              story.section!.toUpperCase(),
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          const SizedBox(width: 8),
                        ],
                        if (story.publishedDate != null)
                          CustomText(
                            _formatDate(story.publishedDate!),
                            fontSize: 10,
                            color: Colors.grey[500],
                          ),
                      ],
                    ),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inDays > 0) {
      return '${difference.inDays}d ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}m ago';
    } else {
      return 'Just now';
    }
  }
}
