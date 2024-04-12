import Alamofire

final class APIPokemon {

    @discardableResult
    static func getListPokemons(limit: Int, offset: Int, completionHandler: APICompletion<PokemonList>?) -> Request? {
        return NetworkingController.shared
            .performRequest(PokemonService.listPokemons(limit: limit, offset: offset),
                            for: PokemonList.self) { result in
                completionHandler?(result)
            }
    }
}
