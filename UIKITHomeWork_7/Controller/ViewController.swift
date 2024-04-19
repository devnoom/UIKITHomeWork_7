import UIKit

class ViewController: UIViewController {
    var newsArray = [news]()
    let table: UITableView = {
        let table = UITableView()
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "News"
        configureTableView()
        getNewsData()
    }
    
    func configureTableView() {
        view.addSubview(table)
        setTableViewDelegates()
        table.rowHeight = 150
        table.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        table.pin(to: view)
    }
    
    func setTableViewDelegates() {
        table.delegate = self
        table.dataSource = self
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        newsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell else {
            return UITableViewCell()
        }
        
        let currentNews = newsArray[indexPath.row]
        
        cell.titleForNews.text = currentNews.title
        cell.timeForNews.text = currentNews.time
        // cell.imageForNews.load(url: currentNews.photoUrl)
        // Load image from URL if needed
        // Example:
        
        
        return cell
    }

}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150 // Height of the table view cell
    }
}

extension ViewController {
    struct news: Codable {
        let title: String
        let time: String
        let url: URL
        let type: Int
        let photoUrl: URL
        let photoAlt: String
        
        enum CodingKeys: String, CodingKey {
            case title = "Title"
            case time = "Time"
            case url = "Url"
            case type = "Type"
            case photoUrl = "PhotoUrl"
            case photoAlt = "PhotoAlt"
        }
    }
    
    struct newsData: Decodable {
        let List: [news]
    }
    
    func getNewsData() {
        let urlString = "https://imedinews.ge/api/categorysidebarnews/get"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Error fetching news data: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            do {
                let newsResponseData = try JSONDecoder().decode(newsData.self, from: data)
                self.newsArray = newsResponseData.List
                
                DispatchQueue.main.async {
                    self.table.reloadData() // Reload table view on main thread
                }
            } catch {
                print("Error decoding news data: \(error.localizedDescription)")
            }
        }.resume()
    }
}
