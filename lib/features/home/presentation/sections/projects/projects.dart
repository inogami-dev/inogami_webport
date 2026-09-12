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
              project: project,
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
          "An academic capstone project featuring an IoT-enabled mobile application engineered to help caregivers track dementia patients in real time through custom geofencing, proactive alerts, and a paired wearable device called WanderHuman Device and its companion WanderHuman Beacon.",
      fullDescription:
          "Developed as an academic capstone project, WanderHuman is an integrated IoT and mobile solution engineered to provide peace of mind to caregivers of individuals living with dementia. Paired seamlessly with a dedicated wearable hardware device, the application delivers reliable real-time GPS tracking, customizable geofence boundaries, and immediate emergency notifications if a patient wanders outside designated safe zones. Beyond safety tracking, the app incorporates daily routine schedules and automated care alerts. The project demonstrates comprehensive end-to-end system design—bridging hardware telemetry with a polished, accessible mobile interface to solve a critical, real-world healthcare challenge.",
      features: [
        "Real-time Location Tracking",
        "Real-time Alerts",
        "Location Filter",
        "Patient/Staff Finder",
        "Notification",
        "Geofence Configuration",
        "Role Based Authorization",
        "Currently Supports 4 Roles: Admin, Social Service, Medical Services, Home Life",
      ],
      notableProblemsEncountered: [
        "The GPS module used in the WanderHuman device has issues in the accuracy of its coordinates when: near a wall, something is covering above, or in an enclosed space. So it will give false coordinates, making the person wearing the device flickering a bit far from its exact location in the WanderHuman App.",
      ],
      notableSolutions: [
        "Added a custom filtering algorithm that stores N location then calculates where the data provided by the WanderHuman device is false or true position where the patient currently is. The algorithm works by identifying which data seems too far for the patient to move in an amount of time.",
      ],
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
      techStackImages: [
        // "assets/images/placeholder_app_icon.png",
        "assets/images/logo/flutter_logo.png",
        "assets/images/logo/dart_logo.png",
        "assets/images/logo/mapbox_logo.png",
        "assets/images/logo/firebase_logo.png",
        "assets/images/logo/vscode_logo.png",
        "assets/images/logo/android_studio_logo.png",
      ],
    ),
    MyProjectModel(
      title: "Mobile POS System",
      shortDescription:
          "A client-commissioned mobile Point of Sale (POS) system designed to empower small retail merchants by replacing manual pen-and-paper records with instant, smartphone-driven sales and inventory tracking.",
      fullDescription:
          "Engineered as a custom client project, this Mobile POS System bridges the digital divide for small and growing retailers who cannot justify the high expense of traditional terminal hardware. Built around the devices entrepreneurs already own, the application transitions business owners away from error-prone pen-and-paper logging into an automated digital workflow. Key features include rapid sales checkout, digital transaction records, and real-time sales logging tailored to the everyday pace of retail operations. Developed to meet strict client requirements, the project emphasizes offline accessibility, minimal operational friction, and production-grade reliability without enterprise overhead.",
      features: [
        "Offline-friendly",
        "Has the capability of traditional POS System but more portable",
      ],
      images: [
        "assets/images/mobile_pos_system_project/inventory.jpe",
        "assets/images/mobile_pos_system_project/add_product.jpe",
        "assets/images/mobile_pos_system_project/cashier_edit_quantity.jpe",
        "assets/images/mobile_pos_system_project/sales_piechart_light_mode.jpe",
        "assets/images/mobile_pos_system_project/sales_piechart.jpe",
        "assets/images/mobile_pos_system_project/scanner_scanning.jpe",
        "assets/images/mobile_pos_system_project/scanner.jpe",
        "assets/images/mobile_pos_system_project/to_checkout_items.jpe",
        "assets/images/mobile_pos_system_project/to_counter_items.jpe",
      ],
      techStackImages: [
        "assets/images/logo/flutter_logo.png",
        "assets/images/logo/dart_logo.png",
        "assets/images/logo/sqlite_logo.png",
        "assets/images/logo/riverpod_logo.png",
        "assets/images/logo/vscode_logo.png",
        "assets/images/logo/android_studio_logo.png",
      ],
    ),
    MyProjectModel(
      title: "Aquation",
      shortDescription:
          "An award-winning hackathon build (4th place out of 14 competing teams): an AI-powered aquaculture platform designed to help crayfish farmers monitor environmental conditions and reduce high stock mortality rates.",
      fullDescription:
          "Built during the Hackathon Challenge 2026—where it secured 4th place out of 14 competing teams—Aquation is an integrated IoT and AI-powered mobile solution engineered to prevent severe stock loss in crayfish farming. The platform pairs directly with a companion hardware device deployed on-site in the pond or tank, capturing real-time environmental telemetry to fuel an automated analytical engine. Rather than relying on guesswork, farmers receive predictive water condition assessments, species distress warnings, and dynamic feeding schedules backed by live sensor metrics. \nDeveloped under rapid hackathon constraints, Aquation also served as a milestone project in modern development workflows: it was built using AI-assisted development (vibe coding) to accelerate architecture, logic generation, and integration at record speed. The project demonstrates not only cross-disciplinary problem-solving across hardware and mobile software, but also the ability to harness cutting-edge AI engineering workflows to build and validate working prototypes under pressure.",
      features: ["AI Insights", "With IoT Device"],
      images: [
        "assets/images/aquation_project/dashboarad.jpe",
        "assets/images/aquation_project/insights.jpe",
        "assets/images/aquation_project/insights_with_response_1.jpe",
        "assets/images/aquation_project/insights_with_response_2.jpe",
        "assets/images/aquation_project/history.jpe",
        "assets/images/aquation_project/profile_page.jpe",
        "assets/images/aquation_project/login_page.jpe",
      ],
      techStackImages: [
        "assets/images/logo/flutter_logo.png",
        "assets/images/logo/dart_logo.png",
        "assets/images/logo/sqlite_logo.png",
        "assets/images/logo/riverpod_logo.png",
        "assets/images/logo/mistral_ai_logo.png",
        "assets/images/logo/vscode_logo.png",
        "assets/images/logo/android_studio_logo.png",
      ],
    ),
  ];
}
