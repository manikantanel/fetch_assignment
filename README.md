# fetch_assignment

# Fetch Mobile Take Home Project

## Summary
This is a SwiftUI-based Recipe App using Swift Concurrency and custom caching.
- Users can browse a list of recipes with cuisine, names, and thumbnails.
- Pull-to-refresh functionality included.
- Disk-based image cache implemented without external libraries.
- Malformed and empty data gracefully handled.



---

## Focus Areas
- **Concurrency with async/await:** Core data loading and image fetching.
- **Image caching:** Implemented a custom file-based cache.
- **SwiftUI architecture:** Clear separation of model, view, and view model.

---

## Time Spent
- Total time: ~12 hours
  - API/Model/Networking: 3 hours
  - SwiftUI views: 3 hours
  - Image Caching: 3 hours
  - Error handling + testing: 2 hours
  - README + polishing: 1 hour

---

## Trade-offs and Decisions
- Skipped integration tests due to time constraints and prompt guidance.
- Only `photo_url_small` is shown to reduce memory and bandwidth usage.

---

## Weakest Part of the Project
- Cache invalidation is not yet implemented (e.g., stale image detection).
- The UI can be improved visually for better UX.

---

## Additional Information
- The app is built using 100% native Swift and SwiftUI.
- Tested with normal, malformed, and empty JSON endpoints.
- The code follows MVVM for clarity and testability.


