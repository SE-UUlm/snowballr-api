
**`rpc SoftDeleteProject (Id) returns (Nothing);`**

- UNAUTHENTICATED (16)
- NOT_FOUND (5): Project with ID not found.
- PERMISSION_DENIED (7): Calling user is not a project admin.
- FAILED_PRECONDITION (9): Project is already deleted or in a state that prevents deletion

**`rpc SoftUndeleteProject (Id) returns (Nothing);`**

- UNAUTHENTICATED (16)
- NOT_FOUND (5): Project with ID not found.
- PERMISSION_DENIED (7): Calling user is not a project admin.
- FAILED_PRECONDITION (9): Project is not in a soft-deleted state.

**`rpc GetProjectInformation (Project.Information.Get) returns (Project.Information);`**

- UNAUTHENTICATED (16)
- NOT_FOUND (5): Project with ID in request not found.
- PERMISSION_DENIED (7): If user is not a member of the project.

**`rpc GetDecisionStatisticsForStage (Project.Information.DecisionStatistics.Get) returns (Project.Information.DecisionStatistics);`**

- UNAUTHENTICATED (16)
- NOT_FOUND (5): Project with ID in request not found.
- PERMISSION_DENIED (7): If user is not a member of the project.
- OUT_OF_RANGE (11): If specified stage is invalid.

**`rpc GetCriterionById (Id) returns (Criterion);`**

- UNAUTHENTICATED (16)
- NOT_FOUND (5): Criterion with ID not found.
- (PERMISSION_DENIED (7): If criterion belongs to a project the user cannot access.)

**`rpc GetAllCriteriaForProject (Id) returns (Criterion.List);`**

- UNAUTHENTICATED (16)
- NOT_FOUND (5): Project with ID not found.
- PERMISSION_DENIED (7): If user is not a member of the project.

**`rpc CreateCriterion (Criterion.Create) returns (Criterion);`**

- UNAUTHENTICATED (16)
- NOT_FOUND (5): Project ID specified in `Criterion.Create` not found.
- PERMISSION_DENIED (7): Calling user is not a project admin.
- INVALID_ARGUMENT (3): Any field unspecified or empty.

**`rpc UpdateCriterion (Criterion.Update) returns (Criterion);`**

- UNAUTHENTICATED (16)
- NOT_FOUND (5): Criterion with ID in request not found.
- PERMISSION_DENIED (7): Calling user is not a project admin of the criterion's project.
- INVALID_ARGUMENT (3): Any field specified in mask is unspecified or empty.

**`rpc DeleteCriterion (Id) returns (Nothing);`**

- UNAUTHENTICATED (16)
- NOT_FOUND (5): Criterion with ID not found.
- PERMISSION_DENIED (7): Sollte vielleicht nur durch SuperAdmin möglich sein? Zumindest für die globalen Kriterien und sonst nur project admins

**`rpc GetProjectPaperById (Id) returns (Project.Paper);`**

- UNAUTHENTICATED (16)
- NOT_FOUND (5): Project paper with ID not found.
- PERMISSION_DENIED (7): If user cannot access the project this paper belongs to.

**`rpc GetProjectPaperByRelativeId (Project.Paper.Get) returns (Project.Paper);`**

- UNAUTHENTICATED (16)
- NOT_FOUND (5): Project with `project_id` not found, or no paper with `local_id` in that project.
- PERMISSION_DENIED (7): If user cannot access the project this paper belongs to.

**`rpc GetAllProjectPapersForProject (Id) returns (Project.Paper.List);`**

- UNAUTHENTICATED (16)
- NOT_FOUND (5): Project with ID not found.
- PERMISSION_DENIED (7): If user is not a member of the project.

**`rpc AddPaperToProject (Project.Paper.Add) returns (Project.Paper);`**

- UNAUTHENTICATED (16)
- NOT_FOUND (5): Project ID or Paper ID in request not found.
- PERMISSION_DENIED (7): Calling user is not part of the project
- ALREADY_EXISTS (6): Paper is already in the project.
- INVALID_ARGUMENT (3): Stage is > `max_stage` or < 0

**`rpc UpdateProjectPaper (Project.Paper.Update) returns (Project.Paper);`**

- UNAUTHENTICATED (16)
- NOT_FOUND (5): Project paper with ID in request not found.
- PERMISSION_DENIED (7): Calling user is not a project admin for the paper's project.
- INVALID_ARGUMENT (3): Invalid field mask, trying to update forbidden fields (`local_id`, `decision`, `reviews`).

**`rpc RemovePaperFromProject (Id) returns (Nothing);`**

- UNAUTHENTICATED (16)
- PERMISSION_DENIED (7): Calling user is not a project admin for the paper's project? Oder blockiert das zu viel, wenn ein Nutzer ausversehen ein Paper hinzugefügt hat und es wieder löschen möchte? Wahrscheinlich nur PERMISSION_DENIED für user, die nicht in dem Projekt sind

**`rpc GetReviewById (Id) returns (Review);`**

- UNAUTHENTICATED (16)
- NOT_FOUND (5): Review with ID not found.
- PERMISSION_DENIED (7): If user cannot access the project/paper this review belongs to.

**`rpc GetAllReviewsForProjectPaper (Id) returns (Review.List);`**

- UNAUTHENTICATED (16)
- NOT_FOUND (5): Project paper with ID not found.
- PERMISSION_DENIED (7): If user cannot access the project paper.

**`rpc CreateReview (Review.Create) returns (Review);`**

- UNAUTHENTICATED (16)
- NOT_FOUND (5): Project paper ID in request not found
- PERMISSION_DENIED (7): User is not a member of the project paper's project.
- INVALID_ARGUMENT (3): `selected_criteria_ids` contains invalid id. Wie damit umgehen, wenn man ein Inklusionkriterion wählt und dann eine ablehnende Entscheidung eigentlich? Sollte man wahrscheinlich eher im Frontend eine Warnung anzeigen, als das über die API irgendwie anzuzeigen oder?
- FAILED_PRECONDITION (9): User already has a review for this paper, paper decision is not `UNREVIEWED` or `IN_REVIEW` / maximum number of reviews reached

**`rpc UpdateReview (Review.Update) returns (Review);`**

- UNAUTHENTICATED (16)
- NOT_FOUND (5): Review with ID in request not found
- PERMISSION_DENIED (7): User is not the owner of the review
- INVALID_ARGUMENT (3): `selected_criteria_ids` contains invalid id, try to change `user_id`
- FAILED_PRECONDITION (9): Review or paper in a state that prevents update (e.g. stage completed, aber dann ist die Frage ob es nicht eher ein PERMISSION_DENIED ist, weil man kann ja am State eigentlich nichts mehr ändern, damit failed precondition aufgehoben wird)

**`rpc DeleteReview (Id) returns (Nothing);`**

- UNAUTHENTICATED (16)
- NOT_FOUND (5): Review with ID not found.
- PERMISSION_DENIED (7): User is not the owner of the review
- FAILED_PRECONDITION (9): Review or paper in a state that prevents deletion (e.g. stage completed).

**`rpc GetPaperById (Id) returns (Paper);`**

- UNAUTHENTICATED (16)
- NOT_FOUND (5): Paper with ID not found.

**`rpc CreatePaper (Paper) returns (Paper);`**

- UNAUTHENTICATED (16)
- INVALID_ARGUMENT (3): (Potentially, if data is inconsistent, e.g. invalid DOI format if provided).

**`rpc UpdatePaper (Paper.Update) returns (Paper);`**

- UNAUTHENTICATED (16)
- NOT_FOUND (5): Paper with ID in request not found.
- INVALID_ARGUMENT (3): Invalid field mask, trying to update `has_pdf`.
- PERMISSION_DENIED (7): Das hier könnte gefährlich werden, weil ja dann auch die Projektpaper von anderen Projekten aktualisiert werden würden. Also wahrscheinlich sollte das nicht erlaubt sein und sollte das nur in dem eigenem Projekt anpassen können oder so

**`rpc GetForwardReferencedPapers (Id) returns (Paper.List);`**

- UNAUTHENTICATED (16)
- NOT_FOUND (5): Paper with ID not found.

**`rpc GetBackwardReferencedPapers (Id) returns (Paper.List);`**

- UNAUTHENTICATED (16)
- NOT_FOUND (5): Paper with ID not found.

**`rpc GetPaperPdf (Id) returns (Blob);`**

- UNAUTHENTICATED (16)
- NOT_FOUND (5): Paper with ID not found.
- FAILED_PRECONDITION (9): Paper `has_pdf == false`.
- RESOURCE_EXHAUSTED (8): If PDF is very large and strains server bandwidth/memory to serve.

**`rpc SetPaperPdf (Paper.PdfUpdate) returns (Nothing);`**

- UNAUTHENTICATED (16)
- NOT_FOUND (5): Paper with ID in request not found.
- RESOURCE_EXHAUSTED (8): If server storage for PDF is full, or PDF exceeds size limits.
