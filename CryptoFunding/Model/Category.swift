//
//  Category.swift
//  CryptoFunding
//
//  Created by Emil on 25/02/2020.
//  Copyright © 2020 student5308. All rights reserved.
//

final class Category {
    let name: String
    let imageName: String
    
    init(name: String, imageName: String) {
        self.name = name
        self.imageName = imageName
    }
    
    static let categories = [
        Category(name: "Jeux", imageName: "jeux"),
        Category(name: "Artisanat", imageName: "artisanat"),
        Category(name: "Tech", imageName: "tech"),
        Category(name: "Photo", imageName: "photo"),
        Category(name: "Cinéma", imageName: "cinema"),
        Category(name: "Livre", imageName: "livre")]
}
