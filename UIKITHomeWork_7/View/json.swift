//import UIKit
//
//struct news: Codable {
//    let title: String
//    let time: String
//    let url: URL
//    let type: Int
//    let photoUrl: URL
//    let photoAlt: String
// 
//    enum CodingKeys: String, CodingKey {
//        case title = "Title"
//        case time = "Time"
//        case url = "Url"
//        case type = "Type"
//        case photoUrl = "PhotoUrl"
//        case photoAlt = "PhotoAlt"
//    }
//}
// 
//struct newsData: Decodable {
//    let List: [news]
//}
// 
//func getNewsData() {
//    let urlString = "https://imedinews.ge/api/categorysidebarnews/get"
//    let urlObject = URL(string: urlString)
//    let urlRequest = URLRequest(url: urlObject!)
//    
//    URLSession.shared.dataTask(with: urlRequest) { data, response, error in
//        
//        let newsResponseData = try? JSONDecoder().decode(newsData.self, from: data!)
//        let news = newsResponseData?.List
//        
//        for new in news! {
//            print(new.title)
//        }
//        
//    }.resume()
//}
//
//
//
