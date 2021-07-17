//
//  GroupStorage.swift
//  VKontakteApp
//
//  Created by Olga Chumakova on 10.07.2021.
//

import Foundation

class  GroupStorage {
    let groups: [GroupModel]
    let allGroups: [GroupModel]
    
    init() {
        groups = [
            GroupModel(name: "Boys", avatarName: "boys", peoples: [PeopleModel(date: " since 1987", iconName: "car", number: "23785")
        ]
        )
           
                  
        ]
        allGroups =  [
            GroupModel(name: "Boys", avatarName: "boys", peoples: [PeopleModel(date: "since 1987", iconName: "car", number: "23785")
        ]
        ),
            GroupModel(name: "Girls", avatarName: "girls", peoples: [PeopleModel(date: "sincw 1989", iconName: "house.fill", number: "13756")
        ]
        ),
            GroupModel(name: "Dogs", avatarName: "dogs", peoples: [PeopleModel(date: "since 1998", iconName: "circle", number: "46376")
        ]
        ),
            GroupModel(name: "Cats", avatarName: "cats", peoples: [PeopleModel(date: "since 2004", iconName: "triangle", number: "56372")
        ]
        ),
            GroupModel(name: "Birds", avatarName: "birds", peoples: [PeopleModel(date: "since 2020", iconName: "envelope", number: "47389")
        ]
        ),
            GroupModel(name: "Cartoons", avatarName: "cartoons", peoples: [PeopleModel(date: "since 2010", iconName: "heart.fill", number: "14235")
        ]
        ),
                  
        ]
    }
}
