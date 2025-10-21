//
//  CoreDataError.swift
//  CleanArchitecture_Tutorial
//
//  Created by 이병훈 on 10/22/25.
//

import Foundation

public enum CoreDataError: Error {
    case entityNotFound(String)
    case saveError(String)
    case readError(String)
    case deleteError(String)
    
    public var description: String {
        switch self {
        case .entityNotFound(let objectName):
            return "객체를 찾을수 없습니다 \(objectName)"
            
        case .saveError(let message):
            return "객체 저장 에러 \(message)"
            
        case .readError(let message):
            return "객체 조회 에러 \(message)"
            
        case .deleteError(let message):
            return "객체 삭제 에러 \(message)"
        }
    }
}
