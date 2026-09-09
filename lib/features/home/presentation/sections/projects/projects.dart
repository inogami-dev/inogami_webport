import 'package:flutter/material.dart';
import 'package:my_portfolio/core/utilities/dimension.dart';
import 'package:my_portfolio/features/home/data/model/project_model.dart';
import 'package:my_portfolio/features/home/presentation/sections/projects/widgets/project_card.dart';

class MyProjectsSection extends StatelessWidget {
  final double screenHeight;
  final String sectionTitle;

  const MyProjectsSection({
    super.key,
    required this.screenHeight,
    required this.sectionTitle,
  });

  @override
  Widget build(BuildContext context) {
    final double width = MyDimensions.width(context);
    final double widthPerProject = width / 3;
    // final ColorScheme myColorScheme = Theme.of(context).colorScheme;

    return Container(
      width: width,
      height: screenHeight,
      // color: Colors.orange,
      padding: const EdgeInsets.only(left: 32, right: 32, bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _myProjects.map((project) {
          return Expanded(
            child: MyProjectCard(
              screenHeight: screenHeight,
              widthPerProject: widthPerProject,
              title: project.title,
              description: project.shortDescription,
              fullDescription: project.fullDescription,
              images: project.images,
            ),
          );
        }).toList(),
      ),
    );
  }

  final List<MyProjectModel> _myProjects = const [
    MyProjectModel(
      title: "WanderHuman",
      shortDescription:
          "A specialized companion app designed to support caregivers of individuals with dementia by providing real-time location tracking and customizable safety alerts through a paired wearable device.",
      fullDescription:
          "WanderHuman is a comprehensive, highly intuitive mobile application engineered to provide peace of mind for caregivers of individuals living with dementia. Paired seamlessly with a dedicated wearable device, the app delivers robust real-time location tracking, customizable geofence boundaries, and instant danger notifications if a patient wanders outside of designated safe zones. Beyond its core tracking capabilities, WanderHuman integrates daily task management and automated care alerts. By prioritizing both patient safety and caregiver support, the application transforms a highly stressful responsibility into a manageable, data-supported routine.",
      images: [
        "assets/images/wanderhuman_project/into_animation.jpe",
        "assets/images/wanderhuman_project/alert_wide_view.jpe",
        "assets/images/wanderhuman_project/alert_notification.jpe",
        "assets/images/wanderhuman_project/alert.jpe",
        "assets/images/wanderhuman_project/caregiver_tasks.jpe",
        "assets/images/wanderhuman_project/creating_safezone.jpe",
        "assets/images/wanderhuman_project/emergency_hotlines.jpe",
        "assets/images/wanderhuman_project/existing_safezones.jpe",
        // "assets/images/wanderhuman_project/logo_designing.jpe",
        "assets/images/wanderhuman_project/map_wide_view_2.jpe",
        "assets/images/wanderhuman_project/map_wide_view.jpe",
        "assets/images/wanderhuman_project/medical_history.jpe",
        "assets/images/wanderhuman_project/medication.jpe",
        "assets/images/wanderhuman_project/menu.jpe",
        "assets/images/wanderhuman_project/other_map_view_option.jpe",
        "assets/images/wanderhuman_project/patient_info_at_glance.jpe",
        "assets/images/wanderhuman_project/roles.jpe",
        "assets/images/wanderhuman_project/safezone.jpe",
        "assets/images/wanderhuman_project/tasks_left.jpe",
      ],
    ),
    MyProjectModel(
      title: "Mobile POS System",
      shortDescription:
          "A lightweight, mobile-first Point of Sale (POS) application designed to empower small businesses by transforming their everyday smartphones into complete sales and inventory management hubs.",
      fullDescription:
          "Recognizing that traditional POS hardware is often cost-prohibitive for emerging businesses, this Mobile POS System bridges the technology gap by leveraging the devices entrepreneurs already own. The application modernizes small retail operations, smoothly transitioning them away from inefficient, error-prone pen-and-paper tracking. It provides a robust digital platform featuring seamless sales processing, digital receipt generation, and real-time transaction logging. Packaged in an accessible, user-friendly interface, it provides startups and micro-businesses with enterprise-level financial tracking without the enterprise-level overhead.",
    ),
    MyProjectModel(
      title: "Aquation",
      shortDescription:
          "An AI-driven mobile application dedicated to optimizing crayfish farming, designed to help aquaculturists reduce species mortality rates and maximize yield through smart, data-backed insights.",
      fullDescription:
          "Aquation is an innovative, AI-powered mobile platform built specifically to address the unique challenges of the crayfish farming industry. Because crayfish are highly sensitive to their environment, the app acts as a digital consultant for both novice and experienced farmers. By leveraging artificial intelligence, Aquation guides users through the complexities of aquaculture—from optimizing water conditions to managing feeding schedules and detecting early signs of distress. This proactive, data-driven approach significantly reduces the fragility-related mortality rates of the stock, lowers the barrier to entry for beginners, and promotes a sustainable, high-yield farming ecosystem.",
    ),
  ];
}
