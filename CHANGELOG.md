# Changelog

## [0.3.0] - 2025-05-16

### Added

- Add `GetNextPaper` to get the next paper (if review mode is disabled) ([#23](https://github.com/SE-UUlm/snowballr-api/issues/23)) (Dominik Enderle)
- Add `GetNextPaperToReview` to get the next paper (if review mode is enabled) ([#23](https://github.com/SE-UUlm/snowballr-api/issues/23)) (Dominik Enderle)
- Add `GetPreviousPaper` to get the previous paper (if review mode is disabled) ([#23](https://github.com/SE-UUlm/snowballr-api/issues/23)) (Dominik Enderle)

    **Note**: There is no method to get a paper if the review mode is enabled, because this functionality 
is directly handled in the frontend 

- Add: API documentation ([#3](https://github.com/SE-UUlm/snowballr-api/issues/3)) (Luca Schlecker)

## [0.2.0] - 2025-04-16

### Changed

- **Breaking:** Replace `IsAuthenticated` by `GetAuthenticationStatus` enum ([#14](https://github.com/SE-UUlm/snowballr-api/pull/14)) (Luca Schlecker)
- **Breaking:** Count `ReviewDecision`s for `Pattern` in `ReviewDecisionMatrix` instead of repeating the decisions ([#18](https://github.com/SE-UUlm/snowballr-api/pull/18)) (Luca Schlecker)
- **Breaking:** Rename `PAPER_DECISION_UNDECIDED` to `PAPER_DECISION_IN_REVIEW` and add `PAPER_DECISION_UNREVIEWED` enum field ([#12](https://github.com/SE-UUlm/snowballr-api/pull/12)) (Luca Schlecker)
- **Breaking:** Rename `Project.Statistics` to `Project.Information` and adjust according call `GetProjectStatistics` to `GetProjectInformation` ([#12](https://github.com/SE-UUlm/snowballr-api/pull/12)) (Luca Schlecker)

### Added

- Add initial _CHANGELOG.md_ and setup and document release workflow ([#20](https://github.com/SE-UUlm/snowballr-api/issues/20)) (Leonhard Alkewitz)
- Add `AuthenticationStatus` enum ([#14](https://github.com/SE-UUlm/snowballr-api/pull/14)) (Luca Schlecker)
- Add `GetDecisionStatisticsForStage` call to retrieve the paper count by decision for a stage ([#12](https://github.com/SE-UUlm/snowballr-api/pull/12)) (Luca Schlecker)
- Store timestamps for project creation and beginning of latest stage in `Project.Information` ([#12](https://github.com/SE-UUlm/snowballr-api/pull/12)) (Luca Schlecker)
- Add `UpdateProjectMemberRole` call to change the role of a project member ([#11](https://github.com/SE-UUlm/snowballr-api/pull/11)) (Luca Schlecker)
- Add `Paper.Project.local_id` field and `GetProjectPaperByRelativeId` call to request paper by local id ([#10](https://github.com/SE-UUlm/snowballr-api/pull/10)) (Luca Schlecker)

### Removed

- **Breaking:** Remove messages `LoginSecret` and `RenewRequest` ([#14](https://github.com/SE-UUlm/snowballr-api/pull/14)) (Luca Schlecker)

## [0.1.0] - 2025-01-30

_:seedling: Initial release._

[0.3.0]: https://github.com/SE-UUlm/snowballr-api/releases/tag/v0.3.0

[0.2.0]: https://github.com/SE-UUlm/snowballr-api/releases/tag/v0.2.0

[0.1.0]: https://github.com/SE-UUlm/snowballr-api/releases/tag/v0.1.0
