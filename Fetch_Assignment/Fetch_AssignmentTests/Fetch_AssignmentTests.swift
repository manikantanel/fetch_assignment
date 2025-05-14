//
//  Fetch_AssignmentTests.swift
//  Fetch_AssignmentTests
//
//  Created by Manikantan Eakiri Lakshmanan on 5/13/25.
//

import XCTest
@testable import Fetch_Assignment

final class RecipeServiceTests: XCTestCase {

    func testFetchRecipesFromValidURL() async throws {
        let service = RecipeService(urlString: "https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json")
        let recipes = try await service.fetchRecipes()
        XCTAssertFalse(recipes.isEmpty)
    }

    func testFetchRecipesFromEmptyURL() async throws {
        let service = RecipeService(urlString: "https://d3jbb8n5wk0qxi.cloudfront.net/recipes-empty.json")
        do {
            _ = try await service.fetchRecipes()
            XCTFail("Expected emptyRecipes error not thrown.")
        } catch let error as RecipeServiceError {
            XCTAssertEqual(error, .decodingFailed, "Expected .emptyRecipes, got \(error)")
        }
    }




    func testFetchRecipesFromMalformedURL() async throws {
        let service = RecipeService(urlString: "https://d3jbb8n5wk0qxi.cloudfront.net/recipes-malformed.json")
        do {
            _ = try await service.fetchRecipes()
            XCTFail("Expected decodingFailed error not thrown.")
        } catch let error as RecipeServiceError {
            XCTAssertEqual(error, .decodingFailed)
        }
    }
}
