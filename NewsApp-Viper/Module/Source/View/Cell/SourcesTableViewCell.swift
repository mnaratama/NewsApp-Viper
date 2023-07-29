//
//  SourcesTableViewCell.swift
//  NewsApp-Viper
//
//  Created by Naratama on 29/07/23.
//

import UIKit

class SourcesTableViewCell: UITableViewCell {

    @IBOutlet weak var newsView: UIView!
    @IBOutlet weak var newsNameLabel: UILabel!
    @IBOutlet weak var categoryNewsLabel: UILabel!
    @IBOutlet weak var descriptionNewsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupContent(sources: SourcesNewsModel) {
        newsView.roundedCorner(cornerRadius: 8)
        newsNameLabel.text = sources.name
        categoryNewsLabel.text = sources.category?.capitalized
        descriptionNewsLabel.text = sources.descriptionNews
    }
}
