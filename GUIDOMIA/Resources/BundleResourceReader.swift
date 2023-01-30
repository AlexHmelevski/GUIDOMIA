import Foundation


final class BundleResourceReader {
    let bundle: Bundle = .main

    
    func getJSONResource<T: Decodable>(named: String) async throws -> T {
        guard let url = bundle.url(forResource: named, withExtension: "json") else {
            fatalError()
        }
        let data = try Data(contentsOf: url)
        let jsonDecoder = JSONDecoder()
        do {
            return try jsonDecoder.decode(T.self, from: data)
        } catch {
            fatalError(error.localizedDescription)
        }
    }
}
