import Foundation
final class MatchingViewModel {
    var posts: [Post] = []
    func listPost() {
        let post1 = Post(id: "postid_1",type: "video", url: "https://test-videos.co.uk/vids/bigbuckbunny/mp4/h264/720/Big_Buck_Bunny_720_10s_5MB.mp4", name: "Văn Hào", description: "Hôm nay tôi mệt rả rời muốn tìm gì đó chơi vui được hông tìm gì đó chơi vui được hôngtìm gì đó chơi vui được hông", avartar: "image_avatar1", numberHeart: 200, numberMessage: 100, numberShare: 50)
        let post2 = Post(id: "postid_2",type: "image", url: "image_post1", name: "Văn Hào Trương", description: "muốn tìm gì đó chơi vui được hông muốn tìm gì đó chơi vui được hông", avartar: "image_avatar2", numberHeart: 250, numberMessage: 10, numberShare: 70)
        let post3 = Post(id: "postid_3",type: "image", url: "image_post1", name: "Trương Văn Hào", description: "Hôm nay tôi mệt rả rời muốn tìm gì đó chơi vui được hông", avartar: "image_avatar1", numberHeart: 200, numberMessage: 100, numberShare: 50)
        let post4 = Post(id: "postid_4",type: "video", url: "https://test-videos.co.uk/vids/bigbuckbunny/mp4/h264/720/Big_Buck_Bunny_720_10s_5MB.mp4", name: "Văn Bi iiii", description: "hihihi hông", avartar: "image_avatar2", numberHeart: 250, numberMessage: 10, numberShare: 70)
        posts = [post1, post2, post3, post4]
    }
    
    func listPost2() {
        let post1 = Post(id: "postid_1",type: "video", url: "https://test-videos.co.uk/vids/bigbuckbunny/mp4/h264/720/Big_Buck_Bunny_720_10s_5MB.mp4", name: "Văn Hào", description: "Hôm nay tôi mệt rả rời muốn tìm gì đó chơi vui được hông tìm gì đó chơi vui được hôngtìm gì đó chơi vui được hông", avartar: "image_avatar1", numberHeart: 200, numberMessage: 100, numberShare: 50)
        let post2 = Post(id: "postid_2",type: "image", url: "image_post1", name: "Văn Hào Trương", description: "muốn tìm gì đó chơi vui được hông muốn tìm gì đó chơi vui được hông", avartar: "image_avatar2", numberHeart: 250, numberMessage: 10, numberShare: 70)
        let post3 = Post(id: "postid_3",type: "image", url: "image_post1", name: "Trương Văn Hào", description: "Hôm nay tôi mệt rả rời muốn tìm gì đó chơi vui được hông", avartar: "image_avatar1", numberHeart: 200, numberMessage: 100, numberShare: 50)
        let post4 = Post(id: "postid_4",type: "video", url: "https://test-videos.co.uk/vids/bigbuckbunny/mp4/h264/720/Big_Buck_Bunny_720_10s_5MB.mp4", name: "Văn Bi iiii", description: "hihihi hông", avartar: "image_avatar2", numberHeart: 250, numberMessage: 10, numberShare: 70)
        let post5 = Post(id: "postid_1",type: "video", url: "https://test-videos.co.uk/vids/bigbuckbunny/mp4/h264/720/Big_Buck_Bunny_720_10s_5MB.mp4", name: "Văn Hào", description: "Hôm nay tôi mệt rả rời muốn tìm gì đó chơi vui được hông tìm gì đó chơi vui được hôngtìm gì đó chơi vui được hông", avartar: "image_avatar1", numberHeart: 200, numberMessage: 100, numberShare: 50)
        let post6 = Post(id: "postid_2",type: "image", url: "image_post1", name: "Văn Hào Trương", description: "muốn tìm gì đó chơi vui được hông muốn tìm gì đó chơi vui được hông", avartar: "image_avatar2", numberHeart: 250, numberMessage: 10, numberShare: 70)
        let post7 = Post(id: "postid_3",type: "image", url: "image_post1", name: "Trương Văn Hào", description: "Hôm nay tôi mệt rả rời muốn tìm gì đó chơi vui được hông", avartar: "image_avatar1", numberHeart: 200, numberMessage: 100, numberShare: 50)
        let post8 = Post(id: "postid_4",type: "video", url: "https://test-videos.co.uk/vids/bigbuckbunny/mp4/h264/720/Big_Buck_Bunny_720_10s_5MB.mp4", name: "Văn Bi iiii", description: "hihihi hông", avartar: "image_avatar2", numberHeart: 250, numberMessage: 10, numberShare: 70)
        posts = [post1, post2, post3, post4, post5, post6, post7, post8]
    }
    
    func viewModelForMatching(at index: Int) -> Post {
        return posts[index]
    }
    
    func removePost(at index: Int) {
        posts.remove(at: index)
    }
}
