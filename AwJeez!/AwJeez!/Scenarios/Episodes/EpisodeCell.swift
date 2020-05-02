//
//  EpisodeCell.swift
//  AwJeez!
//
//  Created by Farbod on 4/29/20.
//  Copyright © 2020 Farbod. All rights reserved.
//

import UIKit
import Spring
enum EpisodeState:Int {
     case normal = 0
     case expanded = 1
}
protocol EpisodeDelegate {
    func pressedEpisode(epName:String,state:EpisodeState)
}
class EpisodeCell: UITableViewCell {
    @IBOutlet weak var imgExpand: UIImageView!
    @IBOutlet weak var vwWhole: DesignableView!
    @IBOutlet weak var lblEpName: UILabel!
    @IBOutlet weak var lblEpTitle: UILabel!
    @IBOutlet weak var lblEpDate: UILabel!
    @IBOutlet weak var lblEpNumber: UILabel!
    var delegate:EpisodeDelegate? = nil
    var episodeName = String()
    var state = EpisodeState.normal
    lazy var epVM = EpisodeVM(self)
    override func awakeFromNib() {
        super.awakeFromNib()
        lblEpTitle.alpha = 0
        lblEpNumber.alpha = 0
        lblEpDate.alpha = 0
        let extendTap = UITapGestureRecognizer(target: self, action: #selector(changeCellHeight))
        vwWhole.addGestureRecognizer(extendTap)
    }
    @objc func changeCellHeight() {
        switch state {
        case .normal:
            expandCell()
        case .expanded:
            shrinkBack()
        }
    }
    @objc func expandCell() {
        state = .expanded
        updateUI()
        delegate?.pressedEpisode(epName: episodeName, state: .expanded)
        epVM.getEpisodeDetails(epUrl: episodeName)
        
    }
    @objc func shrinkBack() {
        state = .normal
        updateUI()
        delegate?.pressedEpisode(epName: episodeName, state: .normal)
    }
    func updateUI() {
        switch state {
               case .normal:
                   self.state = .normal
                   imgExpand.image = UIImage(named: "arrowDown")
                    UIView.animate(withDuration: 0.2) {
                        self.layoutIfNeeded()
                        self.lblEpTitle.alpha = 0
                        self.lblEpNumber.alpha = 0
                        self.lblEpDate.alpha = 0
                    }
               case .expanded:
                   self.state = .expanded
                   imgExpand.image = UIImage(named: "arrowUp")
                   UIView.animate(withDuration: 0.2) {
                       self.layoutIfNeeded()
                       self.lblEpTitle.alpha = 1
                       self.lblEpNumber.alpha = 1
                       self.lblEpDate.alpha = 1
                   }
                   epVM.getEpisodeDetails(epUrl: episodeName)
               }
    }
    func configure(with episodeName:String,delegate:EpisodeDelegate, needsDetaildInfo:Bool ,cellHeight:CGFloat) {
        self.delegate = delegate
        self.episodeName = episodeName
        let episodeNumber =  episodeName.components(separatedBy: "https://rickandmortyapi.com/api/episode/")
        if episodeNumber.indices.contains(1) {
            lblEpName.text = "Episode \(episodeNumber[1])"
        }
        imgExpand.isHidden = !needsDetaildInfo
        switch cellHeight {
        case 210:
            state = .expanded
            updateUI()
        case 110:
            state = .normal
            updateUI()
        default:
            break
        }
    }
    func configureEpDetail(with episode:JEpisode) {
        lblEpTitle.text = "Name: \(episode.name)"
        lblEpDate.text = "Air Date: \(episode.airDate)"
        lblEpNumber.text = "Episode: \(episode.episode)"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
