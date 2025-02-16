import 'package:flutter/material.dart';
import 'package:luma/core/themes/app_theme.dart';
import 'package:luma/screens/grid_home.dart';

class ListHome extends StatelessWidget {
  const ListHome({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorTheme>()!;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context),
            const SizedBox(height: 20),
            _buildTitle(),
            const SizedBox(height: 20),
            _buildFilterSection(),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildCategorySection(
                      title: '#work',
                      notes: const [
                        NoteData(
                          title: 'Not sure where this is going',
                          content:
                              'Don\'t read the caption. Its all same, you dumb dumb, did you even read this though',
                          date: '4th Jan 2050',
                          color: Color(0xFFE4D5F5),
                          icon: Icons.add_circle_outline,
                        ),
                        NoteData(
                          title: 'Yes, created all notes on same day 😊',
                          content:
                              'Don\'t read the caption. Its all same, you dumb dumb, did you even read this though',
                          date: '4th Jan 2050',
                          color: Color(0xFFD5F5D8),
                          icon: Icons.check_circle_outline,
                        ),
                        NoteData(
                          title: 'This is a mockup stupid',
                          content:
                              'Don\'t read the caption. Its all same, you dumb dumb, did you even read this though',
                          date: '4th Jan 2050',
                          color: Color(0xFFD5EFF5),
                          icon: Icons.settings_outlined,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    _buildCategorySection(
                      title: '#Personal',
                      notes: const [
                        NoteData(
                          title: 'Not sure where this is going',
                          content:
                              'Don\'t read the caption. Its all same, you dumb dumb, did you even read this though',
                          date: '4th Jan 2050',
                          color: Color(0xFFE4D5F5),
                          icon: Icons.add_circle_outline,
                        ),
                        NoteData(
                          title: 'Yes, created all notes on same day 😊',
                          content:
                              'Don\'t read the caption. Its all same, you dumb dumb, did you even read this though',
                          date: '4th Jan 2050',
                          color: Color(0xFFD5F5D8),
                          icon: Icons.check_circle_outline,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          const Icon(Icons.face, size: 24),
          const SizedBox(width: 8),
          const Text(
            'Welcome back ',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black54,
            ),
          ),
          const Text(
            'Chad',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.grid_view),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const GridHomeScreen()),
              );
            },
            tooltip: 'Switch to Grid View',
          ),
          IconButton(
            icon: const Icon(Icons.search, size: 24),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.notifications_outlined, size: 24),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Your Notes',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              fontFamily: 'Helvetica',
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.add, size: 24),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Personal',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 8),
                Icon(Icons.keyboard_arrow_down, color: Colors.grey.shade600),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              _buildFilterChip('#All', true),
              _buildFilterChip('#work', false),
              _buildFilterChip('#Personal', false),
              _buildFilterChip('#Fitness', false),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFilterChip(String label, bool isSelected) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFFE8FFA8) : Colors.transparent,
        border: Border.all(
          color: isSelected ? Colors.transparent : Colors.grey.shade300,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.black : Colors.grey.shade600,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildCategorySection({
    required String title,
    required List<NoteData> notes,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(height: 4),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Divider(
            color: Colors.grey.shade300,
            thickness: 1,
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Wrap(
            spacing: 16,
            runSpacing: 16,
            children: notes.map((note) => _buildNoteCard(note)).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildNoteCard(NoteData note) {
    return Container(
      width: 160,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: note.color,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            note.title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              height: 1.2,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 8),
          Text(
            note.content,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey.shade700,
              height: 1.5,
            ),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Text(
                note.date,
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.grey.shade700,
                ),
              ),
              const Spacer(),
              Icon(note.icon, size: 20, color: Colors.grey.shade700),
            ],
          ),
        ],
      ),
    );
  }
}

class NoteData {
  final String title;
  final String content;
  final String date;
  final Color color;
  final IconData icon;

  const NoteData({
    required this.title,
    required this.content,
    required this.date,
    required this.color,
    required this.icon,
  });
}
