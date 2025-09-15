part of 'widgets.dart';

class StoryMetadata extends StatelessWidget {
  final String? byline;
  final DateTime? publishedDate;

  const StoryMetadata({super.key, this.byline, this.publishedDate});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (byline != null && byline!.isNotEmpty) ...[
          Expanded(
            child: CustomText(
              byline!,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.grey[700],
            ),
          ),
        ],
        if (publishedDate != null)
          CustomText(
            DateFormat('MMM dd, yyyy').format(publishedDate!),
            fontSize: 14,
            color: Colors.grey[600],
          ),
      ],
    );
  }
}
