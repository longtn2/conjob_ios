import Alamofire

protocol TargetType {

    var baseURL: String { get }

    var version: String { get }

    var path: String? { get }

    var method: HTTPMethod { get }

    var parameters: Parameters? { get }

    var headers: HTTPHeaders? { get }
}

extension TargetType {

    var headers: HTTPHeaders? {
        return HTTPHeaders(["Authorization": "Bearer eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6IjEzIiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoiSm9iIFNlZWtlciIsImV4cCI6MTcxMzk0Mjc0Mn0.rc9qn7NB_pG-xrRWvZDVeZbkwAg_Z8_3oKxizNXnqzI"])
    }
}
