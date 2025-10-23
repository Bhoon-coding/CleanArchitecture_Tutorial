//
//  UserRepositoryProtocol.swift
//  CleanArchitecture_Tutorial
//
//  Created by 이병훈 on 10/15/25.
//

import Foundation

public protocol UserListRepositoryProtocol {
    func fetchUser(q: String, page: Int) async -> Result<UserListResult, NetworkError>
    func getFavoriteUsers() -> Result<[UserListItem], CoreDataError>
    func saveFavoriteUser(user: UserListItem) -> Result<Bool, CoreDataError>
    func deleteFavoriteUser(userID: Int) -> Result<Bool, CoreDataError>
}
