//
//  RecipeListView.swift
//  Fetch_Assignment
//
//  Created by Manikantan Eakiri Lakshmanan on 5/13/25.
//

import SwiftUI

struct RecipeListView: View {
    @StateObject private var viewModel = RecipeViewModel()

    var body: some View {
        NavigationView {
            Group {
                if let message = viewModel.errorMessage {
                    Text(message).foregroundColor(.red)
                } else if viewModel.isEmpty {
                    Text("No recipes available.")
                } else {
                    List(viewModel.recipes) { recipe in
                        RecipeRowView(recipe: recipe)
                    }
                }
            }
            .navigationTitle("Recipes")
            .task {
                await viewModel.loadRecipes()
            }
        }
    }
}

