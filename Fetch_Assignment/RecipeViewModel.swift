//
//  RecipeViewModel.swift
//  Fetch_Assignment
//
//  Created by Manikantan Eakiri Lakshmanan on 5/13/25.
//

import Foundation

@MainActor
class RecipeViewModel: ObservableObject {
    @Published var recipes: [Recipe] = []
    @Published var errorMessage: String?
    @Published var isEmpty = false

    private let service = RecipeService()

    func loadRecipes() async {
        do {
            let result = try await service.fetchRecipes()
            recipes = result
            isEmpty = result.isEmpty
        } catch {
            if let fetchError = error as? RecipeServiceError {
                errorMessage = fetchError.localizedDescription
            } else {
                errorMessage = "An unknown error occurred."
            }
        }
    }
}

