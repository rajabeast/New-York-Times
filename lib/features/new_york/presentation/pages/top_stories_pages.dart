part of 'pages.dart';

class TopStoriesPage extends StatefulWidget {
  const TopStoriesPage({super.key});

  @override
  State<TopStoriesPage> createState() => _TopStoriesPageState();
}

class _TopStoriesPageState extends State<TopStoriesPage> {
  final TextEditingController _searchController = TextEditingController();

  final List<String> sections = [
    'home',
    'world',
    'politics',
    'business',
    'technology',
    'science',
    'health',
    'sports',
    'arts',
    'books',
    'movies',
    'travel',
    'food',
    'fashion',
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopStoriesAppBar(),
      body: Column(
        children: [
          SearchAndFilterSection(
            searchController: _searchController,
            sections: sections,
          ),
          const StoriesContent(),
        ],
      ),
    );
  }
}
