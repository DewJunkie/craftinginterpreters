# User Story: Dart 3 Sound Null Safety Migration

**As an** author
**I want to** migrate the Dart build tools and test runner to Dart 3 with Sound Null Safety
**So that** the project remains compatible with modern Dart SDKs and benefits from a more robust, crash-resistant codebase.

## Context / Description
The current Dart tools (`tool/`) are pinned to Dart 2.19 and rely on non-null-safe behaviors. With Dart 3 making Sound Null Safety mandatory, the tools must be updated to prevent compilation errors and enable the use of modern development environments (like `--pure` nix-shells).

This update involves:
- Updating `tool/pubspec.yaml` SDK constraints and dependencies.
- Refactoring `tool/` source code to include necessary null-safety markers (`?`, `!`, `late`).
- Ensuring the generated book and interpreter tests remain behaviorally identical.

## Acceptance Criteria

**Background:**  
  **Given** a golden master git worktree at `../craftinginterpreters-master`  
  **And** a git worktree feature branch at `./craftinginterpreters`  

**Scenario Outline:** Generated output of the build scripts in README.md remain identical  
  **Given** the author has run `make <target>` in the golden master  
  **And** the author has run `make <target>` in the feature branch   
  **When** the outputs in `<output-dir>` from the golden master and the feature branches are compared  
  **Then** there are no differences in the generated files (ignoring trivial whitespace or timestamp-only changes)  

  **Examples:**
  | target        | output-dir               |
  | ------        | ------                   |
  | book          | site/                    |
  | clox          | clox                     |
  | jlox          | build/java/              |
  | c_chapters    | build/, gen/             |
  | java_chapters | build/gen/, gen/         |
  | (default)     | site/, clox, build/java/ |

**Scenario:** All existing Lox tests pass under the new Dart runner  
  **Given** the author is in the feature branch worktree  
  **When** the author runs `make test`  
  **Then** all 246 clox tests and 239 jlox tests pass successfully  
  **And** the test runner completes without any internal null-pointer exceptions  
