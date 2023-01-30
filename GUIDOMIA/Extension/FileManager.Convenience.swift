import Foundation

extension FileManager {
    static func getCacheDirectoryPath() -> URL {
        let arrayPaths = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)
        let cacheDirectoryPath = arrayPaths[0]
        return cacheDirectoryPath
    }

    func readDecodable<T>(fromFile url: URL) throws -> T where T: Decodable {
        try JSONDecoder().decode(T.self, from: try data(fromFile: url))
    }

    func saveEncodable<T>(obj: T, toFile url: URL) throws where T: Encodable {
        try JSONEncoder().encode(obj).write(to: url)
    }

    func data(fromFile url: URL) throws -> Data {
        guard fileExists(atPath: url.path) else {
            throw FileError.notFound(url.absoluteString)
        }

        return try Data(contentsOf: url)
    }
}

extension FileManager {
    enum FileError: Error {
        case notFound(String)
    }
}
