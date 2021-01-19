// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let dc = try? newJSONDecoder().decode(Dc.self, from: jsonData)

import Foundation

// MARK: - Dc
  struct GithubUserModel: Decodable {
      let totalCount: Int
      let incompleteResults: Bool
      let items: [Item]

      enum CodingKeys: String, CodingKey {
          case totalCount = "total_count"
          case incompleteResults = "incomplete_results"
          case items
      }
  }

  // MARK: - Item
  struct Item: Decodable {
      let id: Int
      let nodeID, name, fullName: String
      let owner: Owner
      let itemDescription: String?
      let forks: Int
      let size, stargazersCount, watchersCount, open_issues: Int
      let language: String
      let issuesURL: String

      enum CodingKeys: String, CodingKey {
          case open_issues = "open_issues"
          case id
          case nodeID = "node_id"
          case name
          case language
          case fullName = "full_name"
          case owner
          case itemDescription = "description"
          case forks
          case issuesURL = "issues_url"
          case size
          case stargazersCount = "stargazers_count"
          case watchersCount = "watchers_count"
      }
  }

  // MARK: - License
  // MARK: - Owner
  struct Owner: Decodable {
      let login: String
      let id: Int
      let nodeID: String
      let avatarURL: String

      enum CodingKeys: String, CodingKey {
          case login, id
          case nodeID = "node_id"
          case avatarURL = "avatar_url"
      }
  }

