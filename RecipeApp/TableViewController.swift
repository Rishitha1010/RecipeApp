//
//  TableViewController.swift
//  RecipeApp
//
//  Created by West Agile Labs on 08/04/25.
//

import UIKit

class TableViewController: UITableViewController {
    
    let dishes: [(name: String, imageName: String)] = [
        ("Chicken Biryani", "Chickenbiryani"),
        ("Momos", "moms"),
        ("White Sauce Pasta", "pasta"),
        ("Samosa", "samosa"),
        ("Andhra Special Pongadalu", "pongadalu"),
        ("Pizza", "pizza"),
        ("Cheese Cake", "cheesecake"),
        ("Pan Cake", "pancakes"),
        ("Jilebi", "jilebi"),
        ("Mango MilkShake", "mango"),
        ("Watermelon Juice", "watermelon")
    ]
    
    let screenHeight = UIScreen.main.bounds.height

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Dishes"
        tableView.register(PlaceCell.self, forCellReuseIdentifier: "PlaceCell")
        tableView.rowHeight = screenHeight * 0.085
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dishes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlaceCell", for: indexPath) as! PlaceCell
        let dish = dishes[indexPath.row]
        cell.placeImageView.image = UIImage(named: dish.imageName)
        cell.nameLabel.text = dish.name
        return cell
    }
}



class PlaceCell: UITableViewCell {
    
    let placeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 6
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        let screenWidth = UIScreen.main.bounds.width
        label.font = UIFont.systemFont(ofSize: screenWidth * 0.035, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(placeImageView)
        contentView.addSubview(nameLabel)
        
        let screenWidth = UIScreen.main.bounds.width
        let imageSize = screenWidth * 0.1
        
        NSLayoutConstraint.activate([
            placeImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            placeImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            placeImageView.widthAnchor.constraint(equalToConstant: imageSize),
            placeImageView.heightAnchor.constraint(equalToConstant: imageSize),
            
            nameLabel.leadingAnchor.constraint(equalTo: placeImageView.trailingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

