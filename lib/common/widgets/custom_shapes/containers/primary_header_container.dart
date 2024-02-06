import 'package:flutter/cupertino.dart';

import '../../../../utils/constants/app_colors.dart';
import '../curved_edges/curved_edge_widget.dart';
import 'circular_container.dart';

class AppPrimaryHeaderContainer extends StatelessWidget {
  const AppPrimaryHeaderContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AppCurvedEdgeWidget(
      child: Container(
        color: AppColors.primary,
        padding: const EdgeInsets.all(0),
        child: Stack(
          children: [
            Positioned(
              top: -150,
              right: -250,
              child: CircularContainer(
                backgroundColor: AppColors.textWhite.withOpacity(0.1),
              ),
            ),
            Positioned(
                top: 100,
                right: -300,
                child: CircularContainer(
                  backgroundColor: AppColors.textWhite.withOpacity(0.1),
                )),
            child,
          ],
        ),
      ),
    );
  }
}
