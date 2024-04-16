import Alamofire

final class APIPokemon {

    @discardableResult
    static func getListPokemons(limit: Int, offset: Int, completionHandler: APICompletion<PokemonList>?) -> Request? {
        return NetworkingController.shared
            .performRequest(APIService.listPokemons(limit: limit, offset: offset),
                            for: PokemonList.self) { result in
                completionHandler?(result)
            }
    }
    
    static func getListPost(limit: Int, offset: Int, completionHandler: APICompletion<Post>?) -> Request? {
        return NetworkingController.shared.performRequest(APIService.getPostList(limit: limit, offset: offset), for: Post.self) { result in
            completionHandler?(result)
        }
    }
    
    static func getUserLogin(withEmail email: String, password: String, completionHandler: APICompletion<User>?) -> Request? {
        return NetworkingController.shared.performRequest(APIService.getUserLogin(email: email, password: password), for: User.self) { result in
            completionHandler?(result)
        }
    }
}
