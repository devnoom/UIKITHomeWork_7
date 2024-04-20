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
        //setImageConstraints()
        setTitleConstraints()
        setTimeConstraints()
        setupCellBorders()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

      

        private func setupCellBorders() {
            
            self.contentView.layer.borderWidth = 2.0
            self.contentView.layer.cornerRadius = 20
            
            self.contentView.layer.borderColor = UIColor.gray.cgColor
            self.contentView.layer.masksToBounds = true
        }
    override func layoutSubviews() {
           super.layoutSubviews()
           contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 15, left: 20, bottom: 15, right: 20))
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
        timeForNews.textColor = .gray
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
        titleForNews.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30).isActive = true
        titleForNews.topAnchor.constraint(equalTo: topAnchor, constant: 50).isActive = true
        titleForNews.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30).isActive = true
        titleForNews.font = .boldSystemFont(ofSize: 20)
        titleForNews.numberOfLines = 3
        //titleForNews.textColor = .white
        titleForNews.lineBreakMode = .byTruncatingTail
       
        
    }
    
    func setTimeConstraints() {
        timeForNews.translatesAutoresizingMaskIntoConstraints = false
        timeForNews.topAnchor.constraint(equalTo: topAnchor, constant: 25).isActive = true
        timeForNews.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 200).isActive = true

    }
}
