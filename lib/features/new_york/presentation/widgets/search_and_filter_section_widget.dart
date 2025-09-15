part of 'widgets.dart';

class SearchAndFilterSection extends StatelessWidget {
  final TextEditingController searchController;
  final List<String> sections;

  const SearchAndFilterSection({
    super.key,
    required this.searchController,
    required this.sections,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          CustomSearchField(
            hintText: 'Search articles by title or author...',
            controller: searchController,
            onChanged: (query) {
              context.read<TopStoriesCubit>().searchStories(query);
            },
            suffixIcon: searchController.text.isNotEmpty
                ? IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      searchController.clear();
                      context.read<TopStoriesCubit>().searchStories('');
                    },
                  )
                : null,
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 40,
            child: BlocBuilder<TopStoriesCubit, TopStoriesState>(
              builder: (context, state) {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: sections.length,
                  itemBuilder: (context, index) {
                    final section = sections[index];
                    final isSelected = section == state.selectedSection;
                    return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: FilterChip(
                        label: Text(
                          section.toUpperCase(),
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        selected: isSelected,
                        onSelected: (selected) {
                          if (selected) {
                            context.read<TopStoriesCubit>().filterBySection(
                              section,
                            );
                          }
                        },
                        selectedColor: Theme.of(context).primaryColor,
                        backgroundColor: Colors.grey[200],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
