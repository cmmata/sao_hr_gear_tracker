# Agent Instructions

## Critical Workflow
Before starting any task, you **MUST** read the following files to understand the project requirements and context:
1. `specs/requirements.md`: The primary source of truth for functional and non-functional requirements.
2. `GEMINI.md`: Context about the project scope, status, and specific policies.

## Implementation Guidelines
- Follow the requirements in `specs/requirements.md` strictly.
- If a user's request contradicts the specs, prioritize the user's request but also update the specs to maintain consistency.
- Maintain the "Aincrad" aesthetic (SAO style) as described in the requirements.
- Use Isar for local storage and Riverpod for state management.
