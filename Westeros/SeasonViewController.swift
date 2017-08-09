//
//  SeasonViewController.swift
//  Westeros
//
//  Created by Carlos on 4/8/17.
//  Copyright © 2017 THO. All rights reserved.
//

import UIKit


// MARK: - SeasonVC Class

class SeasonViewController: UIViewController {

    @IBOutlet weak var seasonNameView: UILabel!
    @IBOutlet weak var releaseDateView: UILabel!
    @IBOutlet weak var episodesDescriptionView: UITextView!
    
    let model : Season
    
    init(model: Season) {
        self.model = model
        
        super.init(nibName: nil, bundle: nil)
        
        title = model.description
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func SetupUI(model: Season){
        let episodes = UIBarButtonItem(title: "Episodes",
                                   style: .plain,
                                   target: self,
                                   action: #selector(displayEpisodes))
        navigationItem.rightBarButtonItem = episodes
    }
    
    @objc func displayEpisodes(){
        
        let episodesDS = DataSources.episodeDataSource(model: model.sortedEpisodes())
        let episodesVC = ArrayTableViewController(dataSource: episodesDS,
                                                 delegate: EpisodesDelegate(),
                                                 title: "Episodes",
                                                 style: .plain)
        
        navigationController?.pushViewController(episodesVC,
                                                 animated: true)
    }
    
    func syncViewWithModel(){
        
        seasonNameView.text = "Season: " + model.name
        // Formato personalizado en UIKitExtensions
        releaseDateView.text = "Premiere Date: " + model.releaseDate.formatDate2StringYYYYMMdd()
        
        let episodesMultilineText = model.sortedEpisodes().map {$0.description}.joined(separator: "\n")
        episodesDescriptionView.text = "Episodes: " + "\n" + episodesMultilineText
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        SetupUI(model: model)
        syncViewWithModel()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
