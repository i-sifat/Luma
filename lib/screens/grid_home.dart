import 'package:flutter/material.dart';
import 'package:luma/core/themes/app_theme.dart';
// ^ Adjust the import to match your actual path for AppColorTheme.

class GridHomeScreen extends StatefulWidget {
  const GridHomeScreen({Key? key}) : super(key: key);

  @override
  State<GridHomeScreen> createState() => _GridHomeScreenState();
}

class _GridHomeScreenState extends State<GridHomeScreen> {
  // Simulating tab selection. Index 1 => "All (32)" is selected by default.
  int _selectedTabIndex = 1;

  final List<String> _tabs = ['UiUX (14)', 'All (32)', 'Lifestyle (3)'];

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).extension<AppColorTheme>()!;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: colorTheme.surface,
      appBar: AppBar(
        backgroundColor: colorTheme.surface,
        elevation: 0,
        centerTitle: false,
        title: Text(
          'Your Notes',
          style: TextStyle(
            color: colorTheme.textPrimary,
            fontWeight: FontWeight.bold,
            fontSize: size.width * 0.05,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.more_vert, // Or any icon you prefer
              color: colorTheme.textPrimary,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.05,
          vertical: size.height * 0.02,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // "Hey" + Crown Icon
            Row(
              children: [
                Text(
                  'Hey ',
                  style: TextStyle(
                    color: colorTheme.textPrimary,
                    fontSize: size.width * 0.05,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Icon(
                  Icons.crop, // You may use a custom crown icon if desired
                  color: colorTheme.primary,
                  size: size.width * 0.06,
                ),
              ],
            ),
            SizedBox(height: size.height * 0.005),
            Text(
              'Welcome Back',
              style: TextStyle(
                color: colorTheme.textPrimary,
                fontSize: size.width * 0.08,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: size.height * 0.03),

            // Horizontal Tabs
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(_tabs.length, (index) {
                  final isSelected = index == _selectedTabIndex;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedTabIndex = index;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: size.width * 0.04),
                      padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.04,
                        vertical: size.height * 0.01,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? colorTheme.primary.withOpacity(0.1)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        _tabs[index],
                        style: TextStyle(
                          color: isSelected
                              ? colorTheme.primary
                              : colorTheme.textSecondary,
                          fontWeight:
                              isSelected ? FontWeight.w600 : FontWeight.normal,
                          fontSize: size.width * 0.04,
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
            SizedBox(height: size.height * 0.03),

            // Pastel Cards
            _buildTaskCard(
              context,
              backgroundColor: const Color(0xffEEF0FE),
              title: 'Favorite UX Book',
              subtitle:
                  'Lean UX: Applying Lean Principles\nto Improve User Experience',
              listsText: '10+ lists',
              date: '3 Apr 24',
              tag: 'Research',
            ),
            _buildTaskCard(
              context,
              backgroundColor: const Color(0xffFEECEC),
              title: '2024 Fashion Trend',
              subtitle: 'Men\'s Casual Dress',
              listsText: '10+ lists',
            ),
            _buildTaskCard(
              context,
              backgroundColor: const Color(0xffFFFCEB),
              title: 'Webflow Web Design',
              subtitle: 'Follow the modern Styles',
              listsText: '12+ lists',
            ),
            _buildTaskCard(
              context,
              backgroundColor: const Color(0xffECFDF3),
              title: 'Smart Home UX/UI Project',
              subtitle: 'Interview with Stakeholders',
              listsText: '8+ lists',
            ),
          ],
        ),
      ),
    );
  }

  /// Builds a single task card with the pastel background, checkbox, title, etc.
  Widget _buildTaskCard(
    BuildContext context, {
    required Color backgroundColor,
    required String title,
    required String subtitle,
    required String listsText,
    String? date,
    String? tag,
  }) {
    final colorTheme = Theme.of(context).extension<AppColorTheme>()!;
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: size.height * 0.02),
      padding: EdgeInsets.all(size.width * 0.04),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(size.width * 0.06),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Row: Checkbox icon, Title, and "lists" on the right
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.check_box_outline_blank,
                color: colorTheme.textSecondary,
              ),
              SizedBox(width: size.width * 0.03),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    color: colorTheme.textPrimary,
                    fontSize: size.width * 0.045,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Text(
                listsText,
                style: TextStyle(
                  color: colorTheme.textSecondary,
                  fontSize: size.width * 0.04,
                ),
              ),
            ],
          ),
          SizedBox(height: size.height * 0.01),

          // Subtitle
          Padding(
            padding: EdgeInsets.only(left: size.width * 0.12),
            child: Text(
              subtitle,
              style: TextStyle(
                color: colorTheme.textSecondary,
                fontSize: size.width * 0.037,
              ),
            ),
          ),

          // Optional date + tag row
          if (date != null && tag != null) ...[
            SizedBox(height: size.height * 0.01),
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.12),
              child: Row(
                children: [
                  Text(
                    date,
                    style: TextStyle(
                      color: colorTheme.textSecondary,
                      fontSize: size.width * 0.035,
                    ),
                  ),
                  SizedBox(width: size.width * 0.03),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.03,
                      vertical: size.height * 0.003,
                    ),
                    decoration: BoxDecoration(
                      color: colorTheme.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      tag,
                      style: TextStyle(
                        color: colorTheme.primary,
                        fontSize: size.width * 0.035,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
