# Flutter Isolate Lab

This project demonstrates the use of isolates in Flutter to improve app performance.

It consists of three labs:
1. Main Isolate Execution: Showcases UI freezing when running time-consuming tasks directly on the main isolate.
2. Compute Function: Uses Flutter's `compute` function to move heavy tasks to a separate isolate, preventing UI freezes and improving performance.
3. Isolate.run: Similar to `compute`, but uses the `Isolate.run` API to offload heavy tasks to a background isolate, enhancing performance and responsiveness.
