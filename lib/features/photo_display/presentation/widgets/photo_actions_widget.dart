import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/photo/app_photo_cubit.dart';
import '../../../../../core/presentation/widgets/widgets.dart';

class PhotoActionsWidget extends StatelessWidget {
  final DateTime? captureTime;

  const PhotoActionsWidget({super.key, this.captureTime});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          if (captureTime != null)
            Text(
              'Captured: ${captureTime!.toString().substring(0, 19)}',
              style: TextStyle(color: Colors.grey[600], fontSize: 12),
            ),
          const SizedBox(height: 16),
          AppActionButtonsWidget(
            buttons: [
              AppActionButton(
                onPressed: () {
                  // Clear current photo and go back to camera
                  context.read<AppPhotoCubit>().clearCapturedPhoto();
                  context.pushReplacement('/camera');
                },
                icon: Icons.camera_alt,
                label: 'Retake Photo',
                backgroundColor: Colors.orange,
              ),
              AppActionButton(
                onPressed: () {
                  // TODO: Implement photo analysis
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Photo analysis not implemented yet'),
                      backgroundColor: Colors.blue,
                    ),
                  );
                },
                icon: Icons.analytics,
                label: 'Analyze Photo',
                backgroundColor: Colors.green,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
