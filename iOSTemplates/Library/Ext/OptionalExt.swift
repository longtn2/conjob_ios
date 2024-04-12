import Foundation

extension Optional {

    func unwrapped(or defaultValue: Wrapped) -> Wrapped {
        return self ?? defaultValue
    }

    func unwrapped(or error: Error) throws -> Wrapped {
        guard let this = self else { throw error }
        return this
    }
}
