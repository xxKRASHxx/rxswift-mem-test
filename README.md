# MemoryTest

*MemoryTest* is an SPM package that provides a set of tools for measuring memory usage and timing using different approaches of reducers.
This package is designed to help you analyze the performance of reducers in various scenarios.

## Overview

Reducers play a crucial role in state management within Swift applications. 
They are responsible for handling actions and updating application state. 
However, the choice of how you implement reducers can impact performance. 
This package provides a test suite for comparing different approaches to reducers, such as using plain structs or heap-allocated objects, and measures their memory usage and execution time.

Have fun!

### Key features of MemTest:
- Testing different reducer implementations.
- Measuring memory usage and execution time.

## How to run

### Xcode
1. Open `Package.swift` file in MacOS.
2. Run target and see the results in console

### Terminal
1. (With Swift toolchain installed)
2. `cd project_root_folder`
3. `swift build`
4. `swift run`

## Test Results
The test results will be displayed in the console, including memory usage and execution time for each test run. 
Use these results to analyze the performance of different reducer implementations.

16-inch, 2021 MBP results with Apple M1 Pro chip:

| Test case | Timing (sec) | Memory usage (Mb) |
|---|---|---|
| Multiple assigments ON HEAP | 2.436770042 | 19.33014 |
| Multiple assigments PLAIN STRUCT | 2.381588167 (-2.5%) | 16.923828 (-12%) |
| Single assigment ON HEAP | 0.169398917 *(-93%)* | 14.814514 *(-23%)* |
| Single assigment PLAIN STRUCT | 0.116925916 *(-95%)* | 14.783142 *(-23.5%)* |

## Configuration

1. There is an option to log addresses. In could be enabled in `Stores.swift` file by changing `Logging` options.
2. It is also possible to adjust amount of testing actions at the top of `main.swift` by changing `sequence` variable.

## Contact

If you have questions or need further assistance, you can contact me at daniel.lisovoy@gmail.com !
