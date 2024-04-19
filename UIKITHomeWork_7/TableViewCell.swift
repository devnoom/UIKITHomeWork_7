import UIKit

class TableViewCell: UITableViewCell {
    var imageForNews = UIImageView()
    var titleForNews = UILabel()
    var timeForNews = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(imageForNews)
        addSubview(titleForNews)
        addSubview(timeForNews)
        configureImageForNews()
        configureTitleForNews()
        configureTimeForNews()
        setImageConstraints()
        setTitleConstraints()
        setTimeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureImageForNews() {
        imageForNews.layer.cornerRadius = 10
        imageForNews.clipsToBounds = true
    }
    
    func configureTitleForNews() {
        titleForNews.numberOfLines = 0
        titleForNews.adjustsFontSizeToFitWidth = true
    }
    
    func configureTimeForNews() {
        timeForNews.numberOfLines = 1
        timeForNews.adjustsFontSizeToFitWidth = true
        timeForNews.textColor = .gray // Adjust color if needed
    }
    
    func setImageConstraints() {
        imageForNews.translatesAutoresizingMaskIntoConstraints = false
        imageForNews.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        imageForNews.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        imageForNews.widthAnchor.constraint(equalToConstant: 100).isActive = true
        imageForNews.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    func setTitleConstraints() {
        titleForNews.translatesAutoresizingMaskIntoConstraints = false
        titleForNews.leadingAnchor.constraint(equalTo: imageForNews.trailingAnchor, constant: 10).isActive = true
        titleForNews.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        titleForNews.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
    }
    
    func setTimeConstraints() {
        timeForNews.translatesAutoresizingMaskIntoConstraints = false
        timeForNews.leadingAnchor.constraint(equalTo: titleForNews.leadingAnchor).isActive = true
        timeForNews.topAnchor.constraint(equalTo: titleForNews.bottomAnchor, constant: 5).isActive = true
        timeForNews.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        timeForNews.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
    }
}
