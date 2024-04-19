//
//  detailsPageVC.swift
//  UIKITHomeWork_7
//
//  Created by MacBook Air on 19.04.24.
//

import UIKit

class detailsPageVC: UIViewController {
    var mainTittle: UILabel = {
        let mainTittle = UILabel()
        mainTittle.translatesAutoresizingMaskIntoConstraints = false
        mainTittle.text = "Details"
        mainTittle.font = .systemFont(ofSize: 40)
        return mainTittle
    }()
    var detailsImage = UIImageView()
    var detailsDescription = UITextView()
    var detailsTime: UILabel = {
        let detailsTime = UILabel()
        detailsTime.translatesAutoresizingMaskIntoConstraints = false
        return detailsTime
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
      
    }
    func setUI() {
        //view.backgroundColor = .cyan
        view.addSubview(mainTittle)
        view.addSubview(detailsTime)
        view.addSubview(detailsImage)
        view.addSubview(detailsDescription)
        detailsTime.text = "22:33"
        detailsImage.backgroundColor = .black
        detailsDescription.backgroundColor = .red
        detailsImage.translatesAutoresizingMaskIntoConstraints = false
        detailsDescription.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        NSLayoutConstraint.activate([
            mainTittle.topAnchor.constraint(equalTo: view.topAnchor, constant: 90),
            mainTittle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            mainTittle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 20),
            
            detailsImage.topAnchor.constraint(equalTo: mainTittle.bottomAnchor, constant: 20),
            detailsImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            detailsImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            detailsImage.heightAnchor.constraint(equalToConstant: 200),
            
            detailsTime.topAnchor.constraint(equalTo: detailsImage.bottomAnchor, constant: 20),
            detailsTime.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            detailsDescription.topAnchor.constraint(equalTo: detailsTime.bottomAnchor, constant: 20),
            detailsDescription.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            detailsDescription.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            detailsDescription.heightAnchor.constraint(equalToConstant: 300)
            
            
            
        ])
        
    }
    
}

#Preview {
    detailsPageVC()
}
