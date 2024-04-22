import UIKit

class PostImageCollectionViewCell: UICollectionViewCell {
    //MARK: - IBOutlets
    @IBOutlet private weak var postImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpUI()
    }
    
    private func setUpUI() {
        postImageView.customRoundCorners(radius: 16)
    }

}
