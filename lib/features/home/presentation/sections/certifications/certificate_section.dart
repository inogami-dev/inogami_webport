import 'package:flutter/material.dart';
import 'package:my_portfolio/core/constants/size.dart';
import 'package:my_portfolio/core/widgets/hero.dart';
import 'package:my_portfolio/core/widgets/text.dart';
import 'package:my_portfolio/features/home/presentation/sections/certifications/widgets/certificate_corner_decoration.dart';
import 'package:my_portfolio/features/home/presentation/sections/certifications/widgets/certificate_dialog.dart';

class MyCertificateSection extends StatefulWidget {
  final double width;
  final double height;

  const MyCertificateSection({
    super.key,
    required this.width,
    required this.height,
  });

  @override
  State<MyCertificateSection> createState() => _MyCertificateSectionState();
}

class _MyCertificateSectionState extends State<MyCertificateSection> {
  // 1. Current active page (0-indexed)
  int _currentPage = 0;
  static const int _itemsPerPage = 6;

  // Your full list of items (e.g., 24 items)
  final List<String> _allCertificates = [
    "assets/images/certificates/Startup Appearance During The Tagum Startup Week 2026.png",
    "assets/images/certificates/Tagum Startup Week 2026 Day 2.png",
    "assets/images/certificates/Hackathon Challenge 2026.jpg",
    "assets/images/certificates/Information Technology Specialist - Database Certification Exam.png",
    "assets/images/certificates/Academic Award - Dean's Lister.png",
    "assets/images/certificates/Innovation Connect 2026.jpg",
    "assets/images/certificates/Design Thinking and Mobile App Wireframing.png",
    "assets/images/certificates/UI and UX Design.png",
    "assets/images/certificates/Understanding MVC Architecture.png",
    "assets/images/certificates/Software Development and Design Thinking.png",
    "assets/images/certificates/Startup 100 Introduction to Startups.png",
    "assets/images/certificates/Officer Service Appreciation.png",
    "assets/images/certificates/Cebu Educational Tour 2025.jpg",
    "assets/images/certificates/CODES Officers Team Building and Evaluation 2025.jpg",
    "assets/images/certificates/DCE Academic and Sports Festival.jpg",
    "assets/images/certificates/Web 3 Seminar.jpg",
    // "assets/images/logo/dart_logo.png",
    // "assets/images/logo/flutter_logo.png",
    // "assets/images/logo/firebase_logo.png",
    // "assets/images/logo/android_studio_logo.png",
    // "assets/images/logo/mapbox_logo.png",
    // "assets/images/logo/mistral_ai_logo.png",
    // "assets/images/logo/riverpod_logo.png",
    // "assets/images/logo/sqlite_logo.png",
    // "assets/images/logo/vscode_logo.png",
    // "assets/images/placeholder_app_icon.png",
    "assets/images/certificates/Hour of Code - AI Ready ASEAN.png",
    "assets/images/certificates/Hour of Code - Music Lab.jpg",
    "assets/images/certificates/Hour of Code - Computer Science.jpg",
    "assets/images/certificates/AI for Beginners.png",
    "assets/images/certificates/Amplify Your Impact.png",
    "assets/images/certificates/Blockchain for Digital Workforce.png",
    "assets/images/certificates/Blockchain for Government Workforce.png",
    "assets/images/certificates/Canva EskweLive.png",
    "assets/images/certificates/Cybercrime & Cybersecurity Awareness.png",
    "assets/images/certificates/Cybersecurity Basics.png",
    "assets/images/certificates/Digital Citizenship Training.png",
    "assets/images/certificates/Empowering Freelancers Leveraging AI for Success.png",
    "assets/images/certificates/From Code to Intelligence.png",
    "assets/images/certificates/Game Dev in the Modern Era.png",
    "assets/images/certificates/Graphic Design for Beginners with AI-Powered Canva.png",
    "assets/images/certificates/Intellectual Property Strategy Protection and Registration Essentials.png",
    "assets/images/certificates/Internet of Things in Smart Citites.png",
    "assets/images/certificates/IoT & LoRaWAN Workshop Series.png",
    "assets/images/certificates/Revolutionizing Teaching and Learning Efficiency with AI-Powered Tools.png",
  ];
  // Total pages formula: e.g. (24 / 6).ceil() = 4 pages
  int get _totalPages => (_allCertificates.length / _itemsPerPage).ceil();

  // 2. Safe slice of items for the active page
  List<String> get _currentPageItems {
    final int startIndex = _currentPage * _itemsPerPage;
    final int endIndex = (startIndex + _itemsPerPage).clamp(
      0,
      _allCertificates.length,
    );
    return _allCertificates.sublist(startIndex, endIndex);
  }

  void _goToPage(int pageIndex) {
    if (pageIndex >= 0 && pageIndex < _totalPages) {
      setState(() => _currentPage = pageIndex);
    }
  }

  @override
  Widget build(BuildContext context) {
    final myColorScheme = Theme.of(context).colorScheme;
    final currentItems = _currentPageItems;

    final int startItemNumber = (_currentPage * _itemsPerPage) + 1;
    final int endItemNumber = (startItemNumber + currentItems.length - 1);

    return Container(
      width: widget.width,
      height: widget.height,
      // color: Colors.amber,
      padding: const EdgeInsets.symmetric(
        horizontal: MySizeConstants.genericHorizontalPadding,
      ),
      child: Column(
        children: [
          const SizedBox(height: 12),

          // Header showing range: e.g. "Showing 1-6 of 24"
          MyText(
            text:
                "Certificates ( $startItemNumber-$endItemNumber of ${_allCertificates.length} )",
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
          const SizedBox(height: 12),

          // Grid showing only the 6 items for this page
          Expanded(
            child: Center(
              child: GridView.builder(
                shrinkWrap: true,
                itemCount: currentItems.length,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // 3 columns
                  mainAxisExtent:
                      widget.height *
                      0.33, // Exact height of each card in pixels
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      showMyCertificateModal(
                        context: context,
                        certificateImage: currentItems[index],
                      );
                    },
                    child: MyHero(
                      tag: currentItems[index],
                      child: Container(
                        decoration: BoxDecoration(
                          color: myColorScheme.surfaceContainerHigh,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: myColorScheme.outlineVariant.withValues(
                              alpha: 0.3,
                            ),
                          ),
                        ),
                        padding: const EdgeInsets.all(16),
                        child: Center(
                          child: MyCertificateCornerDecoration(
                            cornerSize: 24,
                            cornerColor: myColorScheme.primary,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: Image.asset(
                                currentItems[index],
                                // Ensures image touches the corners
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          const SizedBox(height: 8),

          // Pagination Controls Bar
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Previous Button
              IconButton(
                onPressed: _currentPage > 0
                    ? () => _goToPage(_currentPage - 1)
                    : null,
                icon: const Icon(Icons.chevron_left_rounded),
              ),

              const SizedBox(width: 8),

              // Page Number Buttons [ 1 ] [ 2 ] [ 3 ] [ 4 ]
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (int i = 0; i < _totalPages; i++)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(8),
                        onTap: () => _goToPage(i),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: i == _currentPage
                                ? myColorScheme.primary
                                : myColorScheme.surfaceContainer,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text('${i + 1}'),
                        ),
                      ),
                    ),
                ],
              ),

              // Row(
              //   mainAxisSize: MainAxisSize.min,
              //   children: List.generate(_totalPages, (pageIndex) {
              //     final bool isSelected = pageIndex == _currentPage;
              //     return Padding(
              //       padding: const EdgeInsets.symmetric(horizontal: 4),
              //       child: InkWell(
              //         borderRadius: BorderRadius.circular(8),
              //         onTap: () => _goToPage(pageIndex),
              //         child: Container(
              //           padding: const EdgeInsets.symmetric(
              //             horizontal: 14,
              //             vertical: 8,
              //           ),
              //           decoration: BoxDecoration(
              //             color: isSelected
              //                 ? myColorScheme.primary
              //                 : myColorScheme.surfaceContainer,
              //             borderRadius: BorderRadius.circular(8),
              //           ),
              //           child: Text(
              //             '${pageIndex + 1}',
              //             style: TextStyle(
              //               fontWeight: FontWeight.bold,
              //               color: isSelected
              //                   ? myColorScheme.onPrimary
              //                   : myColorScheme.onSurface,
              //             ),
              //           ),
              //         ),
              //       ),
              //     );
              //   }),
              // ),
              const SizedBox(width: 8),

              // Next Button
              IconButton(
                onPressed: _currentPage < _totalPages - 1
                    ? () => _goToPage(_currentPage + 1)
                    : null,
                icon: const Icon(Icons.chevron_right_rounded),
              ),
            ],
          ),

          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
