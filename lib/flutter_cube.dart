// import 'dart:async';
// import 'package:arkit_plugin/arkit_plugin.dart';
// import 'package:flutter/material.dart';
// import 'package:vector_math/vector_math_64.dart';

// class ARView extends StatefulWidget {
//   @override
//   _ARViewState createState() => _ARViewState();
// }

// class _ARViewState extends State<ARView> {
//   late ARKitController arkitController;
//   late ARKitNode modelNode;
//   double moveDistance = 0.0;
//   bool forward = true;
//   Timer? timer;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ARKitSceneView(
//         onARKitViewCreated: (controller) {
//           arkitController = controller;
//           _add3DModel();
//         },
//       ),
//     );
//   }

//   void _add3DModel() {
//     final node = ARKitReferenceNode(
//       url: 'assets/models/animation.usdz',
//       scale: Vector3(1, 1, 1), // O‘lchamni moslash
//       position: Vector3(1, 2, 0.5), // Joylashuv
//     );

//     arkitController.add(node);
//   }

//   void _startAnimation() {
//     timer = Timer.periodic(Duration(milliseconds: 50), (timer) {
//       if (forward) {
//         moveDistance += 0.01;
//         if (moveDistance >= 0.2) forward = false;
//       } else {
//         moveDistance -= 0.01;
//         if (moveDistance <= 0.0) forward = true;
//       }
//       modelNode.position = Vector3(0, 0, -0.5 + moveDistance);
//     });
//   }

//   @override
//   void dispose() {
//     timer?.cancel();
//     super.dispose();
//   }
// }
