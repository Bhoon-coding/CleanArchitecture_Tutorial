//
//  UserListUsecase.swift
//  CleanArchitecture_Tutorial
//
//  Created by 이병훈 on 10/15/25.
//

import Foundation

public protocol UserListUsecaseProtocol {
    func fetchUser(q: String, page: Int) async -> Result<UserListResult, NetworkError> // 유저 리스트 불러오기 (remote)
    func getFavoriteUsers() -> Result<[UserListItem], CoreDataError> // 전체 즐겨찾기 리스트 불러오기
    func saveFavoriteUser(user: UserListItem) -> Result<Bool, CoreDataError>
    func deleteFavoriteUser(userID: Int) -> Result<Bool, CoreDataError>
    
    // TODO: 배열 -> 딕셔너리 [초성: [유저리스트]]
    // TODO: 유저리스트 - 즐겨찾기에 포함된 유저인지
}

public struct UserListUsecase: UserListUsecaseProtocol {
    
    private let repository: UserListRepositoryProtocol
    
    init(repository: UserListRepositoryProtocol) {
        self.repository = repository
    }
    
    public func fetchUser(q: String, page: Int) async -> Result<UserListResult, NetworkError> {
        return await self.repository.fetchUser(q: q, page: page)
    }
    
    public func getFavoriteUsers() -> Result<[UserListItem], CoreDataError> {
        return self.repository.getFavoriteUsers()
    }
    
    public func saveFavoriteUser(user: UserListItem) -> Result<Bool, CoreDataError> {
        return self.repository.saveFavoriteUser(user: user)
    }
    
    public func deleteFavoriteUser(userID: Int) -> Result<Bool, CoreDataError> {
        return self.repository.deleteFavoriteUser(userID: userID)
    }
    
    
}
