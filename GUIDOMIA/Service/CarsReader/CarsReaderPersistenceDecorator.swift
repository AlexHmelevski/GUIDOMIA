import Foundation

struct FilePaths {
    var baseDir: URL {
        FileManager.getCacheDirectoryPath()
    }

    var carsURL: URL {
        return baseDir.appendingPathComponent("Cars.txt")
    }
}

final class CarsReaderPersistenceDecorator: CarsReader {
    let original: CarsReader
    let manager: FileManager = .default
    let paths = FilePaths()
    init(original: CarsReader) {
        self.original = original
    }
    
    func carModels() async throws -> [CarDataModel] {
        do  {
            return try manager.readDecodable(fromFile: paths.carsURL)
        } catch {
            let cars = try await original.carModels()
            try manager.saveEncodable(obj: cars, toFile: paths.carsURL)
            return cars
        }
    }
}
