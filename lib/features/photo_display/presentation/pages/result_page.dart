import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/../../core/photo/app_photo_cubit.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Résultat de l'analyse")),
      body: Center(
        child: BlocBuilder<AppPhotoCubit, AppPhotoState>(
          builder: (context, state) {
            if (state.capturedPhotoPath == null) {
              return const Text("Aucune photo à analyser");
            }

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.file(
                  File(state.capturedPhotoPath!),
                  width: 250,
                  height: 250,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 16),
                Text(
                  "Classe prédite : ${state.predictedLabel ?? "Inconnue"}",
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                if (state.probability != null)
                  Text(
                    "Probabilité : ${(state.probability! * 100).toStringAsFixed(1)}%",
                    style: const TextStyle(fontSize: 16, color: Colors.grey),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
