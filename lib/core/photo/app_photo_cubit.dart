import 'package:flutter_bloc/flutter_bloc.dart';

// State for sharing captured photos across the app
class AppPhotoState {
  final String? capturedPhotoPath;
  final DateTime? captureTime;
  final String? predictedLabel;
  final double? probability;

  AppPhotoState({this.capturedPhotoPath, this.captureTime, this.predictedLabel, this.probability,});

  AppPhotoState copyWith({String? capturedPhotoPath, DateTime? captureTime, String? predictedLabel, double? probability,}) {
    return AppPhotoState(
      capturedPhotoPath: capturedPhotoPath ?? this.capturedPhotoPath,
      captureTime: captureTime ?? this.captureTime,
      predictedLabel: predictedLabel ?? this.predictedLabel,
      probability: probability ?? this.probability,
    );
  }
}

// Cubit to manage global photo state
class AppPhotoCubit extends Cubit<AppPhotoState> {
  AppPhotoCubit() : super(AppPhotoState());

  void setCapturedPhoto(String imagePath) {
    emit(
      state.copyWith(capturedPhotoPath: imagePath, captureTime: DateTime.now(), predictedLabel: null, probability: null,),
    );
  }

  void clearCapturedPhoto() {
    emit(AppPhotoState());
  }

  void analyzePhoto(String label, double prob) {
    emit(
      state.copyWith(
        predictedLabel: label,
        probability: prob,
      ),
    );
  }

  String? get currentPhotoPath => state.capturedPhotoPath;
  DateTime? get captureTime => state.captureTime;
  String? get predictedLabel => state.predictedLabel;
  double? get probability => state.probability;
}
