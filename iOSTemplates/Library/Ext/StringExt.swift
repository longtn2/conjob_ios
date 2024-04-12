import Foundation
import UIKit

extension Optional where Wrapped == String {
    var content: String {
        switch self {
        case .some(let value):
            return String(describing: value)
        case _:
            return ""
        }
    }
}

extension String {

    enum Process {
        case encode
        case decode
    }

    // MARK: Trimmed

    var trimmed: String {
        return trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }

    func trimmedTextByLimit(limit: Int) -> String {
        if isEmpty || count <= limit {
            return self
        } else {
            return String(prefix(limit))
        }
    }

    // The offset into a string's UTF-16 encoding for endIndex of self
    var endEncodedOffset: Int {
        return endIndex.utf16Offset(in: self)
    }

    func base64(_ method: Process) -> String? {
        switch method {
        case .encode:
            return data(using: .utf8)?.base64EncodedString()
        case .decode:
            guard let data = Data(base64Encoded: self) else { return nil }
            return String(data: data, encoding: .utf8)
        }
    }

    // MARK: String size

    func contentHeight(contentWidth: CGFloat, attributes: [NSAttributedString.Key: Any]) -> CGFloat {
        let attributedString = NSAttributedString(string: self, attributes: attributes)
        let constraintRect = CGSize(width: contentWidth, height: .greatestFiniteMagnitude)
        let boundingBox = attributedString.boundingRect(with: constraintRect, options: [.usesLineFragmentOrigin, .usesFontLeading], context: nil)
        return boundingBox.height
    }

    func contentWidth(font: UIFont) -> CGFloat {
        let size = (self as NSString).size(withAttributes: [.font: font])
        return size.width
    }
}

func / (lhs: String, rhs: String) -> String {
    return lhs + "/" + rhs
}
