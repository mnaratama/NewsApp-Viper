//
//  CategoryCollectionViewCell.swift
//  NewsApp-Viper
//
//  Created by Naratama on 29/07/23.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var categoryButton: UIButton!
    
    var callback: ((String) -> Void)?

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setupContent(category: CategoryType) {
        categoryButton.setTitle(category.rawValue.capitalized, for: .normal)
    }
    
    @IBAction func categoryButtonTapped(_ sender: Any) {
        callback?(categoryButton.titleLabel?.text ?? "")
    }
}
