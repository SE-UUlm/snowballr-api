# Changelog

## [0.10.0] - 2025-10-27

### Changed

- Update `FAILED_PRECONDITION` description to include the case where the user to be deleted is the last project admin ([#100](https://github.com/SE-UUlm/snowballr-api/issues/100)) (Leonhard Alkewitz)

### Added

- Add `GetAvailableExportFormats` call to get available export formats for a project ([#102](https://github.com/SE-UUlm/snowballr-api/issues/102)) (Felix Schlegel)

## [0.9.0] - 2025-10-23

### Changed

- Update description of `GetProjectInformation` ([#95](https://github.com/SE-UUlm/snowballr-api/issues/95)) (Felix Schlegel)
- Update validation details of `CreatePaper` and `UpdatePaper` ([#95](https://github.com/SE-UUlm/snowballr-api/issues/95)) (Felix Schlegel)

### Removed

- Remove `orcid` field from `Author` message ([#97](https://github.com/SE-UUlm/snowballr-api/issues/97)) (Felix Schlegel)

## [0.8.0] - 2025-10-01

### Changed

- Improve description of calls and add missing error codes ([#81](https://github.com/SE-UUlm/snowballr-api/issues/81)) (Leonhard Alkewitz)
- Fix spelling mistakes, bad wording and wrong call descriptions ([#81](https://github.com/SE-UUlm/snowballr-api/issues/81)) (Leonhard Alkewitz)
- Move explanation of user- and project-criteria from the `CreateCriterion` call to the `Criterion` message. ([#64](https://github.com/SE-UUlm/snowballr-api/issues/64)) (Leonhard Alkewitz)

### Added

- Add `NOT_YET_VERIFIED` error to `Login` call ([#80](https://github.com/SE-UUlm/snowballr-api/issues/80)) (Moritz Wieland)

### Fixed

- Update `UpdateProject` call description to correctly reflect the allowed actions depending on the project `status` ([#92](https://github.com/SE-UUlm/snowballr-api/issues/92)) (Moritz Wieland)
- Swap the description of `GetForwardReferencedPapers` and `GetBackwardReferencedPapers` ([#82](https://github.com/SE-UUlm/snowballr-api/issues/82)) (Dominik Enderle)

## [0.7.0] - 2025-08-04

### Added

- Add `VerifyEmail` call ([#74](https://github.com/SE-UUlm/snowballr-api/issues/74)) (Moritz Wieland)
- Add `AcceptProjectInvitation` call ([#76](https://github.com/SE-UUlm/snowballr-api/issues/76)) (Moritz Wieland)

## [0.6.0] - 2025-07-24

### Added

- **Breaking:** Introduce fetcher options ([#69](https://github.com/SE-UUlm/snowballr-api/issues/69)) (Luca Schlecker)
  - Move fetcher-related messages to `fetcher.proto` file
  - Add `FetcherOptions` message to represent option names and their associated values
  - Add `GetAvailableFetcherOptions` call to get FetcherOptions representing option names associated with their default values
  - Change `Project.Settings.fetcher_apis` to `Project.Settings.fetchers`, replacing the string-list type with a map that associates a fetcher name with FetcherOptions. The values in the FetcherOptions represent the actual values of the option

### Changed

- Add differentiation between user-criteria and project-criteria in the description as well as the requirement of the project to be in `ACTIVE` state in the error specification for the CRUD criterion calls ([#65](https://github.com/SE-UUlm/snowballr-api/issues/65)) (Luca Schlecker)
- **Breaking:** Drop `api` suffix for fetcher related calls (e.g., `GetAvailableFetcherApis` was renamed to `GetAvailableFetchers`), messages and fields ([!73](https://github.com/SE-UUlm/snowballr-api/pull/73)) (Luca Schlecker)

## [0.5.1] - 2025-07-23

### Changed

- **Breaking:** Add `project_id` parameter to the request of `GetInviteCandidates` to filter out possible project members ([#66](https://github.com/SE-UUlm/snowballr-api/issues/66)) (Leonhard Alkewitz)
- Replace textual descriptions of auth requirement with **@auth** tag ([#49](https://github.com/SE-UUlm/snowballr-api/issues/49)) (Luca Schlecker)
- Show full name instead of nested hint for messages ([!59](https://github.com/SE-UUlm/snowballr-api/pull/59)) (Luca Schlecker)
- Fix links to nested messages ([#55](https://github.com/SE-UUlm/snowballr-api/issues/55)) (Luca Schlecker)

### Added

- Add table and heading styling ([#51](https://github.com/SE-UUlm/snowballr-api/issues/51)) (Luca Schlecker)
- Add docker compose file ([#60](https://github.com/SE-UUlm/snowballr-api/issues/60)) (Felix Schlegel)

## [0.5.0] - 2025-06-23

### Changed

- Correct outdated note about the authorization header in API documentation ([#37](https://github.com/SE-UUlm/snowballr-api/issues/37)) (Luca Schlecker)

### Added

- Add `GetInviteCandidates` call to get a list of users that match a search query and can be invited ([#50](https://github.com/SE-UUlm/snowballr-api/issues/50)) (Leonhard Alkewitz)
- Add structured error specifications to every call in the API documentation ([#37](https://github.com/SE-UUlm/snowballr-api/issues/37)) (Luca Schlecker)
- Add a module title and a copyright notice to the API documentation ([#37](https://github.com/SE-UUlm/snowballr-api/issues/37)) (Leonhard Alkewitz)
- Add `USER_STATUS_ACTIVE_UNCONFIRMED` to the `UserStatus` enum to represent users that are registered successfully but did not confirm their email yet ([#45](https://github.com/SE-UUlm/snowballr-api/issues/45)) (Felix Schlegel)
- Add the base type `Email` and use `Email` as request parameter type instead of `Id` in the call `GetUserByEmail` ([#46](https://github.com/SE-UUlm/snowballr-api/issues/46)) (Felix Schlegel)

## [0.4.0] - 2025-05-30

### Added

- Add `PROJECT_STATUS_ACTIVE_LOCKED` to the `ProjectStatus` enum to represent projects where SLR settings can no longer be changed after the first review ([#38](https://github.com/SE-UUlm/snowballr-api/issues/38)) (Moritz Wieland)

## [0.3.0] - 2025-05-16

### Added

- Add `GetNextPaper` to get the next paper (if review mode is disabled) ([#23](https://github.com/SE-UUlm/snowballr-api/issues/23)) (Dominik Enderle)
- Add `GetNextPaperToReview` to get the next paper (if review mode is enabled) ([#23](https://github.com/SE-UUlm/snowballr-api/issues/23)) (Dominik Enderle)
- Add `GetPreviousPaper` to get the previous paper (if review mode is disabled) ([#23](https://github.com/SE-UUlm/snowballr-api/issues/23)) (Dominik Enderle)

    **Note**: There is no method to get a paper if the review mode is enabled, because this functionality is directly handled in the frontend

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

[0.10.0]: https://github.com/SE-UUlm/snowballr-api/releases/tag/v0.10.0

[0.9.0]: https://github.com/SE-UUlm/snowballr-api/releases/tag/v0.9.0

[0.8.0]: https://github.com/SE-UUlm/snowballr-api/releases/tag/v0.8.0

[0.7.0]: https://github.com/SE-UUlm/snowballr-api/releases/tag/v0.7.0

[0.6.0]: https://github.com/SE-UUlm/snowballr-api/releases/tag/v0.6.0

[0.5.1]: https://github.com/SE-UUlm/snowballr-api/releases/tag/v0.5.1

[0.5.0]: https://github.com/SE-UUlm/snowballr-api/releases/tag/v0.5.0

[0.4.0]: https://github.com/SE-UUlm/snowballr-api/releases/tag/v0.4.0

[0.3.0]: https://github.com/SE-UUlm/snowballr-api/releases/tag/v0.3.0

[0.2.0]: https://github.com/SE-UUlm/snowballr-api/releases/tag/v0.2.0

[0.1.0]: https://github.com/SE-UUlm/snowballr-api/releases/tag/v0.1.0
