//
//  RateCell.swift
//  InterviewProject
//
//  Created by Dmitry Volevodz on 01.12.2021.
//

import Foundation
import UIKit

class RateCell: UITableViewCell {
    
    func setModel(_ model: RateCellViewModel) {
        
        var content = UIListContentConfiguration.subtitleCell()
        content.text = model.name
        content.secondaryText = model.price
        
        contentConfiguration = content
    }
}
