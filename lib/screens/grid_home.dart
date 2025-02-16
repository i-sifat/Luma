import 'package:flutter/material.dart';
import 'package:luma/screens/calendar_screen.dart';
import 'package:luma/screens/category_screen.dart';
import 'package:luma/screens/profile_screen.dart';

class GridHomeScreen extends StatefulWidget {
  const GridHomeScreen({Key? key}) : super(key: key);

  @override
  State<GridHomeScreen> createState() => _GridHomeScreenState();
}

class _GridHomeScreenState extends State<GridHomeScreen> {
  int _selectedTabIndex = 1;
  int _currentIndex = 0;
  final List<String> _tabs = ['UiUX (14)', 'All (32)', 'Lifestyle (3)'];

  final List<Widget> _screens = [
    const _HomeContent(),
    const CalendarScreen(),
    const SizedBox(), // Placeholder for add button
    const CategoryScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _screens[_currentIndex],
      floatingActionButton: Container(
        height: 68,
        width: 68,
        margin: const EdgeInsets.only(top: 20),
        child: FloatingActionButton(
          backgroundColor: const Color(0xFF5B67CA),
          elevation: 0,
          onPressed: () {
            // Add new note functionality
          },
          child: const Icon(Icons.add, size: 32),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildBottomNavBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: BottomNavigationBar(
        currentIndex: _currentIndex == 2 ? 0 : _currentIndex,
        onTap: (index) {
          if (index >= 2) index++;
          setState(() => _currentIndex = index);
        },
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: const Color(0xFF5B67CA),
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.transparent,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        items: [
          _buildNavItem(Icons.view_list, 'Home'),
          _buildNavItem(Icons.calendar_today_outlined, 'Calendar'),
          const BottomNavigationBarItem(
            icon: SizedBox(width: 50, height: 30),
            label: '',
          ),
          _buildNavItem(Icons.grid_view, 'Category'),
          _buildNavItem(Icons.person_outline, 'Profile'),
        ],
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem(IconData icon, String label) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label,
    );
  }
}

class _HomeContent extends StatelessWidget {
  const _HomeContent();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const padding = 20.0;

    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      Text(
                        'Hey ',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        '👋',
                        style: TextStyle(fontSize: 24),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width: 44,
                        height: 44,
                        decoration: const BoxDecoration(
                          color: Color(0xFFFFB800),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.crop_square,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                      const SizedBox(width: 16),
                      const Icon(Icons.menu, size: 28),
                      const SizedBox(width: 16),
                      const Icon(Icons.search, size: 28),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 8),
              const Text(
                'Welcome Back',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24),
              _buildTabs(context),
              const SizedBox(height: 24),
              _buildNotesList(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTabs(BuildContext context) {
    return Container(
      height: 40,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildTab('UiUX (14)', true),
          const SizedBox(width: 12),
          _buildTab('All (32)', false),
          const SizedBox(width: 12),
          _buildTab('Lifestyle (3)', false),
        ],
      ),
    );
  }

  Widget _buildTab(String text, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? Colors.black : Colors.transparent,
        borderRadius: BorderRadius.circular(50),
        border: Border.all(
          color: isSelected ? Colors.transparent : Colors.grey.shade300,
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.grey.shade600,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildNotesList(BuildContext context) {
    return Column(
      children: [
        _buildNoteCard(
          context,
          title: 'Favorite UX Book',
          subtitle:
              'Lean UX: Applying Lean Principles to\nImprove User Experience.',
          color: const Color(0xFFEEF0FE),
          date: '3 Apr 24',
          stats: const ['3', '2', '4'],
          tags: const ['UX', 'Research', 'UI'],
        ),
        const SizedBox(height: 16),
        _buildNoteCard(
          context,
          title: '2024 Fashion Trend',
          subtitle: 'Mes Casual Dress',
          color: const Color(0xFFFEECEC),
        ),
        const SizedBox(height: 16),
        _buildNoteCard(
          context,
          title: 'Webflow Web Design',
          subtitle: 'Follow the modern Styles\n12+ lists',
          color: const Color(0xFFFFFCEB),
        ),
        const SizedBox(height: 16),
        _buildNoteCard(
          context,
          title: 'Smart Home UX/UI Project',
          subtitle: 'Interview with Stake Holders\n46+ lists',
          color: const Color(0xFFECFDF3),
        ),
      ],
    );
  }

  Widget _buildNoteCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    required Color color,
    String? date,
    List<String>? stats,
    List<String>? tags,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(32),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey.shade600,
                    height: 1.5,
                  ),
                ),
              ),
            ],
          ),
          if (date != null && stats != null && tags != null) ...[
            const SizedBox(height: 20),
            Row(
              children: [
                Icon(Icons.calendar_today,
                    size: 18, color: Colors.grey.shade600),
                const SizedBox(width: 4),
                Text(date),
                const SizedBox(width: 16),
                Icon(Icons.people_outline,
                    size: 18, color: Colors.grey.shade600),
                const SizedBox(width: 4),
                Text(stats[0]),
                const SizedBox(width: 16),
                Icon(Icons.mic_none, size: 18, color: Colors.grey.shade600),
                const SizedBox(width: 4),
                Text(stats[1]),
                const SizedBox(width: 16),
                Icon(Icons.link, size: 18, color: Colors.grey.shade600),
                const SizedBox(width: 4),
                Text(stats[2]),
              ],
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              children: tags
                  .map((tag) => Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          tag,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ))
                  .toList(),
            ),
          ],
        ],
      ),
    );
  }
}
