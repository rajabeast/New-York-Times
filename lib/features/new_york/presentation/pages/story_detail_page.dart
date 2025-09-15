part of 'pages.dart';

class StoryDetailPage extends StatelessWidget {
  final TopStoriesModel story;

  const StoryDetailPage({super.key, required this.story});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          StoryDetailAppBar(story: story),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Section Badge
                  if (story.section != null) ...[
                    StorySectionBadge(section: story.section!),
                    const SizedBox(height: 16),
                  ],

                  // Title
                  CustomText(
                    story.title ?? 'No Title',
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  const SizedBox(height: 16),

                  // Author and Date
                  StoryMetadata(
                    byline: story.byline,
                    publishedDate: story.publishedDate,
                  ),
                  const SizedBox(height: 20),

                  // Abstract/Description
                  if (story.abstract != null && story.abstract!.isNotEmpty) ...[
                    CustomText(
                      story.abstract!,
                      fontSize: 16,
                      color: Colors.black87,
                      fontWeight: FontWeight.w400,
                    ),
                    const SizedBox(height: 20),
                  ],

                  // Additional info
                  if (story.kicker != null && story.kicker!.isNotEmpty) ...[
                    StoryInfoBox(kicker: story.kicker!),
                    const SizedBox(height: 20),
                  ],

                  // Tags
                  if (story.desFacet != null && story.desFacet!.isNotEmpty) ...[
                    CustomText(
                      'Related Topics',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                    const SizedBox(height: 8),
                    StoryTags(tags: story.desFacet!),
                    const SizedBox(height: 30),
                  ],

                  // See More Button
                  if (story.url != null && story.url!.isNotEmpty)
                    ReadFullArticleButton(
                      url: story.url!,
                      title: story.title ?? 'Article',
                    ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
