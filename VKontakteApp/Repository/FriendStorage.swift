//
//  FriendStorage.swift
//  VKontakteApp
//
//  Created by Olga Chumakova on 15.07.2021.
//

import Foundation

class FriendStorage {
    let friends: [FriendModel]
    let allFriends: [FriendModel]
    
    init() {
        friends = [
            FriendModel(name: "Abe", avatarName: "Abe",
                               photos: [
                PhotoModel(place: "Sea", imageName: "view1", date: "01.06"),
                PhotoModel(place: "Country", imageName: "view2", date: "25.08"),
                PhotoModel(place: "Museum", imageName: "view4", date: "13.04"),
                PhotoModel(place: "Restaurant", imageName: "view5", date: "30.12"),
                PhotoModel(place: "Party", imageName: "view6", date: "26.02"),
                PhotoModel(place: "Disco", imageName: "view3", date: "04.05"),
            ])
        ]
        
        
        allFriends = [
            FriendModel(name: "Abe", avatarName: "Abe",
                        photos: [
                PhotoModel(place: "Sea", imageName: "view1", date: "01.06"),
                PhotoModel(place: "Country", imageName: "view2", date: "25.08"),
                PhotoModel(place: "Disco", imageName: "view3", date: "04.05"),
                PhotoModel(place: "Museum", imageName: "view4", date: "13.04"),
                PhotoModel(place: "Restaurant", imageName: "view5", date: "30.12"),
                PhotoModel(place: "Party", imageName: "view6", date: "26.02"),
                        ]),
            
            
            
            FriendModel(name: "Andrew", avatarName: "Andrew",
                               photos: [
                PhotoModel(place: "Museum", imageName: "view4", date: "13.04"),
                PhotoModel(place: "Restaurant", imageName: "view5", date: "30.12"),
                PhotoModel(place: "Fising", imageName: "view7", date: "24.05"),
                PhotoModel(place: "Hunting", imageName: "view8", date: "16.09"),
                PhotoModel(place: "Date", imageName: "view9", date: "08.03"),
                PhotoModel(place: "Party", imageName: "view6", date: "26.02"),
                                
            ]),
            
            
            FriendModel(name: "Bob", avatarName: "Bob",
                               photos: [
                PhotoModel(place: "Sea", imageName: "view1", date: "01.06"),
                PhotoModel(place: "Country", imageName: "view2", date: "25.08"),
                PhotoModel(place: "Disco", imageName: "view3", date: "04.05"),
                PhotoModel(place: "Fising", imageName: "view7", date: "24.05"),
                PhotoModel(place: "Hunting", imageName: "view8", date: "16.09"),
                PhotoModel(place: "Date", imageName: "view9", date: "08.03"),
                                
            ]),
            FriendModel(name: "Bill", avatarName: "Est",
                               photos: [
                PhotoModel(place: "Museum", imageName: "view4", date: "13.04"),
                PhotoModel(place: "Restaurant", imageName: "view5", date: "30.12"),
                PhotoModel(place: "Party", imageName: "view6", date: "26.02"),
                PhotoModel(place: "Fising", imageName: "view7", date: "24.05"),
                PhotoModel(place: "Hunting", imageName: "view8", date: "16.09"),
                PhotoModel(place: "Date", imageName: "view9", date: "08.03"),
                                
            ]),
            FriendModel(name: "Cal", avatarName: "Clive",
                               photos: [
                PhotoModel(place: "Sea", imageName: "view1", date: "01.06"),
                PhotoModel(place: "Country", imageName: "view2", date: "25.08"),
                PhotoModel(place: "Disco", imageName: "view3", date: "04.05"),
                PhotoModel(place: "Fising", imageName: "view7", date: "24.05"),
                PhotoModel(place: "Hunting", imageName: "view8", date: "16.09"),
                PhotoModel(place: "Date", imageName: "view9", date: "08.03"),
                                
            ]),
            FriendModel(name: "Clive", avatarName: "Dereck",
                               photos: [
                PhotoModel(place: "Museum", imageName: "view4", date: "13.04"),
                PhotoModel(place: "Restaurant", imageName: "view5", date: "30.12"),
                PhotoModel(place: "Party", imageName: "view6", date: "26.02"),
                PhotoModel(place: "Fising", imageName: "view7", date: "24.05"),
                PhotoModel(place: "Hunting", imageName: "view8", date: "16.09"),
                PhotoModel(place: "Date", imageName: "view9", date: "08.03"),
                                
            ]),
            
            FriendModel(name: "Don", avatarName: "Don",
                               photos: [
                PhotoModel(place: "Fising", imageName: "view7", date: "24.05"),
                PhotoModel(place: "Hunting", imageName: "view8", date: "16.09"),
                PhotoModel(place: "Date", imageName: "view9", date: "08.03"),
                                
            ]),
            FriendModel(name: "Dereck", avatarName: "Cal",
                               photos: [
                PhotoModel(place: "Museum", imageName: "view4", date: "13.04"),
                PhotoModel(place: "Restaurant", imageName: "view5", date: "30.12"),
                PhotoModel(place: "Party", imageName: "view6", date: "26.02"),
                PhotoModel(place: "Fising", imageName: "view7", date: "24.05"),
                PhotoModel(place: "Hunting", imageName: "view8", date: "16.09"),
                PhotoModel(place: "Date", imageName: "view9", date: "08.03"),
                                
            ]),
            FriendModel(name: "Evan", avatarName: "Don",
                               photos: [
                PhotoModel(place: "Fising", imageName: "view7", date: "24.05"),
                PhotoModel(place: "Hunting", imageName: "view8", date: "16.09"),
                PhotoModel(place: "Date", imageName: "view9", date: "08.03"),
                                
            ]),
            FriendModel(name: "Est", avatarName: "Est",
                               photos: [
                PhotoModel(place: "Museum", imageName: "view4", date: "13.04"),
                PhotoModel(place: "Restaurant", imageName: "view5", date: "30.12"),
                PhotoModel(place: "Party", imageName: "view6", date: "26.02"),
                PhotoModel(place: "Fising", imageName: "view7", date: "24.05"),
                PhotoModel(place: "Hunting", imageName: "view8", date: "16.09"),
                PhotoModel(place: "Date", imageName: "view9", date: "08.03"),
                                
            ]),
            
            FriendModel(name: "Fred", avatarName: "Cal",
                               photos: [
                PhotoModel(place: "Fising", imageName: "view7", date: "24.05"),
                PhotoModel(place: "Hunting", imageName: "view8", date: "16.09"),
                PhotoModel(place: "Date", imageName: "view9", date: "08.03"),
                                
            ]),
            FriendModel(name: "Flip", avatarName: "Clive",
                               photos: [
                PhotoModel(place: "Fising", imageName: "view7", date: "24.05"),
                PhotoModel(place: "Hunting", imageName: "view8", date: "16.09"),
                PhotoModel(place: "Date", imageName: "view9", date: "08.03"),
                                
            ]),
            FriendModel(name: "George", avatarName: "Don",
                               photos: [
                PhotoModel(place: "Fising", imageName: "view7", date: "24.05"),
                PhotoModel(place: "Hunting", imageName: "view8", date: "16.09"),
                PhotoModel(place: "Date", imageName: "view9", date: "08.03"),
                                
            ]),
            FriendModel(name: "Greg", avatarName: "Dereck",
                               photos: [
                PhotoModel(place: "Fising", imageName: "view7", date: "24.05"),
                PhotoModel(place: "Hunting", imageName: "view8", date: "16.09"),
                PhotoModel(place: "Date", imageName: "view9", date: "08.03"),
                                
            ]),
            FriendModel(name: "Hue", avatarName: "Cal",
                               photos: [
                PhotoModel(place: "Fising", imageName: "view7", date: "24.05"),
                PhotoModel(place: "Hunting", imageName: "view8", date: "16.09"),
                PhotoModel(place: "Date", imageName: "view9", date: "08.03"),
                                
            ]),
            FriendModel(name: "Holl", avatarName: "Est",
                               photos: [
                PhotoModel(place: "Fising", imageName: "view7", date: "24.05"),
                PhotoModel(place: "Hunting", imageName: "view8", date: "16.09"),
                PhotoModel(place: "Date", imageName: "view9", date: "08.03"),
                                
            ]),
            FriendModel(name: "Ive", avatarName: "Don",
                               photos: [
                PhotoModel(place: "Fising", imageName: "view7", date: "24.05"),
                PhotoModel(place: "Hunting", imageName: "view8", date: "16.09"),
                PhotoModel(place: "Date", imageName: "view9", date: "08.03"),
                                
            ]),
            FriendModel(name: "Illy", avatarName: "Dereck",
                               photos: [
                PhotoModel(place: "Fising", imageName: "view7", date: "24.05"),
                PhotoModel(place: "Hunting", imageName: "view8", date: "16.09"),
                PhotoModel(place: "Date", imageName: "view9", date: "08.03"),
                                
            ]),
            
            FriendModel(name: "Josh", avatarName: "Josh",
                               photos: [
                PhotoModel(place: "Fising", imageName: "view7", date: "28.06"),
                PhotoModel(place: "Date", imageName: "view9", date: "05.10"),
                PhotoModel(place: "Restaurant", imageName: "view5", date: "18.04"),
                                
            ]),
            FriendModel(name: "Jeck", avatarName: "Cal",
                               photos: [
                PhotoModel(place: "Fising", imageName: "view7", date: "28.06"),
                PhotoModel(place: "Date", imageName: "view9", date: "05.10"),
                PhotoModel(place: "Restaurant", imageName: "view5", date: "18.04"),
                                
            ]),
            FriendModel(name: "Kile", avatarName: "Bob",
                               photos: [
                PhotoModel(place: "Fising", imageName: "view7", date: "24.05"),
                PhotoModel(place: "Hunting", imageName: "view8", date: "16.09"),
                PhotoModel(place: "Date", imageName: "view9", date: "08.03"),
                                
            ]),
            FriendModel(name: "Kit", avatarName: "Don",
                               photos: [
                PhotoModel(place: "Fising", imageName: "view7", date: "24.05"),
                PhotoModel(place: "Hunting", imageName: "view8", date: "16.09"),
                PhotoModel(place: "Date", imageName: "view9", date: "08.03"),
                                
            ]),
            
            FriendModel(name: "Lesly", avatarName: "Josh",
                               photos: [
                PhotoModel(place: "Fising", imageName: "view7", date: "28.06"),
                PhotoModel(place: "Date", imageName: "view9", date: "05.10"),
                PhotoModel(place: "Restaurant", imageName: "view5", date: "18.04"),
                                
            ]),
            FriendModel(name: "Lloyd", avatarName: "Clive",
                               photos: [
                PhotoModel(place: "Fising", imageName: "view7", date: "28.06"),
                PhotoModel(place: "Date", imageName: "view9", date: "05.10"),
                PhotoModel(place: "Restaurant", imageName: "view5", date: "18.04"),
                                
            ]),
            FriendModel(name: "Mile", avatarName: "Est",
                               photos: [
                PhotoModel(place: "Fising", imageName: "view7", date: "24.05"),
                PhotoModel(place: "Hunting", imageName: "view8", date: "16.09"),
                PhotoModel(place: "Date", imageName: "view9", date: "08.03"),
                                
            ]),
            FriendModel(name: "Mitch", avatarName: "Dereck",
                               photos: [
                PhotoModel(place: "Fising", imageName: "view7", date: "24.05"),
                PhotoModel(place: "Hunting", imageName: "view8", date: "16.09"),
                PhotoModel(place: "Date", imageName: "view9", date: "08.03"),
                                
            ]),
            
            FriendModel(name: "Nick", avatarName: "Josh",
                               photos: [
                PhotoModel(place: "Fising", imageName: "view7", date: "28.06"),
                PhotoModel(place: "Date", imageName: "view9", date: "05.10"),
                PhotoModel(place: "Restaurant", imageName: "view5", date: "18.04"),
                                
            ]),
            FriendModel(name: "Nil", avatarName: "Cal",
                               photos: [
                PhotoModel(place: "Fising", imageName: "view7", date: "28.06"),
                PhotoModel(place: "Date", imageName: "view9", date: "05.10"),
                PhotoModel(place: "Restaurant", imageName: "view5", date: "18.04"),
                                
            ]),
            
            FriendModel(name: "Owen", avatarName: "Est",
                               photos: [
                PhotoModel(place:  "Disco", imageName: "view3", date: "04.05"),
                PhotoModel(place: "Country", imageName: "view2", date: "25.08"),
                PhotoModel(place: "Hunting", imageName: "view8", date: "16.09"),
                                
            ]),
            FriendModel(name: "Oak", avatarName: "Dereck",
                               photos: [
                PhotoModel(place:  "Disco", imageName: "view3", date: "04.05"),
                PhotoModel(place: "Country", imageName: "view2", date: "25.08"),
                PhotoModel(place: "Hunting", imageName: "view8", date: "16.09"),
                                
            ]),
            FriendModel(name: "Pete", avatarName: "Pete",
                               photos: [
                PhotoModel(place:  "Disco", imageName: "view3", date: "04.05"),
                PhotoModel(place: "Country", imageName: "view2", date: "25.08"),
                PhotoModel(place: "Hunting", imageName: "view8", date: "16.09"),
                                
            ]),
            FriendModel(name: "Prue", avatarName: "Cal",
                               photos: [
                PhotoModel(place:  "Disco", imageName: "view3", date: "04.05"),
                PhotoModel(place: "Country", imageName: "view2", date: "25.08"),
                PhotoModel(place: "Hunting", imageName: "view8", date: "16.09"),
                                
            ]),
        ]
    }
}
