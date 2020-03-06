//
//  ProjectThumbnail.swift
//  CryptoFunding
//
//  Created by Emil on 03/03/2020.
//  Copyright © 2020 student5308. All rights reserved.
//

import Foundation

final class ProjectThumbnail {
    
    let category: String
    let projectTitle: String
    let fundedRatio: Double
    let imageName: String
    
    init(category: String, projectTitle: String, fundedRatio: Double, imageName: String) {
        self.category = category
        self.projectTitle = projectTitle
        self.fundedRatio = fundedRatio
        self.imageName = imageName
    }
    
    static let pathfinderProjects =
            [ProjectThumbnail(category: "Jeux", projectTitle: "Pathfinder | The Video Game", fundedRatio: 30.2, imageName: "pathfinder"),
            ProjectThumbnail(category: "Jeux", projectTitle: "Pathfinder | The Video Game", fundedRatio: 30.2, imageName: "pathfinder"),
            ProjectThumbnail(category: "Jeux", projectTitle: "Pathfinder | The Video Game", fundedRatio: 30.2, imageName: "pathfinder"),
            ProjectThumbnail(category: "Jeux", projectTitle: "Pathfinder | The Video Game", fundedRatio: 30.2, imageName: "pathfinder"),
            ProjectThumbnail(category: "Jeux", projectTitle: "Pathfinder | The Video Game", fundedRatio: 30.2, imageName: "pathfinder"),]
    
}
