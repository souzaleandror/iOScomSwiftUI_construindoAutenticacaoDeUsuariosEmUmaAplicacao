//
//  UserDefaultsHelper.swift
//  Vollmed
//
//  Created by Leandro Rodrigues on 15.04.2024.
//

import Foundation

struct UserDefaultsHelper {
    static func save(value: String, key: String) {
        UserDefaults.standard.set(value, forKey: key)
    }
    
    static func get(for key: String) -> String? {
        return UserDefaults.standard.string(forKey: key)
    }
    
    static remove(for key: String) {
        return UserDefaults.standard.removeObject(forKey: key)
    }
}
