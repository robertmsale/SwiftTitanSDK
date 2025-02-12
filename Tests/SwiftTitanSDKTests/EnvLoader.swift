//
//  EnvLoader.swift
//  SwiftTitanSDK
//
//  Created by Robert Sale on 2/12/25.
//

import Foundation

struct EnvLoader {
    static func load() {
        let projectRoot = findProjectRoot()
        let envPath = "\(projectRoot)/.env"
        print(envPath)
        
        guard let envContents = try? String(contentsOfFile: envPath, encoding: .utf8) else {
            print("⚠️ Warning: .env file not found or unreadable")
            return
        }
        
        envContents.split(separator: "\n").forEach { line in
            let parts = line.split(separator: "=", maxSplits: 1).map { String($0).trimmingCharacters(in: .whitespacesAndNewlines) }
            if parts.count == 2 {
                setenv(parts[0], parts[1], 1)
            }
        }
    }
    
    private static func findProjectRoot() -> String {
        var url = URL(fileURLWithPath: #filePath)
        
        while url.pathComponents.count > 1 {
            url.deleteLastPathComponent()
            let gitPath = url.appendingPathComponent(".git").path
            let packageSwiftPath = url.appendingPathComponent("Package.swift").path
            
            if FileManager.default.fileExists(atPath: gitPath) || FileManager.default.fileExists(atPath: packageSwiftPath) {
                return url.path
            }
        }
        
        return FileManager.default.currentDirectoryPath // Fallback
    }
    
    static var tenant: String? {
        ProcessInfo.processInfo.environment["ST_TENANT"]
    }
    static var appKey: String? {
        ProcessInfo.processInfo.environment["ST_APPKEY"]
    }
    static var clientId: String? {
        ProcessInfo.processInfo.environment["ST_CLIENTID"]
    }
    static var clientSecret: String? {
        ProcessInfo.processInfo.environment["ST_CLIENTSECRET"]
    }
}
