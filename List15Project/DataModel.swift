//==============================================================================
//  DataModel.swift
//
//  List15Project
//  Created by Champlin Technologies LLC on 2021/10/06.
//  Copyright © 2021 Champlin Technologies LLC. All rights reserved.
//==============================================================================
import Foundation

class DataModel: ObservableObject {

    @Published var faves: [Fave] = [
        Fave(id: UUID(uuidString: "0A9E9653-EECD-40F4-8A84-098FB6B3D748")!, category: "vehicle" , favoriteID: UUID(uuidString: "6AB85272-BDFE-43D7-861F-C909645185FA")!, favorite: "67 Mustang Shelby"),
        Fave(id: UUID(uuidString: "60CF8770-7F9D-4FC5-AED3-24486B8A5884")!, category: "vacation", favoriteID: UUID(uuidString: "68011499-76D5-4C0D-BD84-A4AE59E280AD")!, favorite: "summer in Lugano" ),
        Fave(id: UUID(uuidString: "97B2E421-B5F4-4F63-B660-0D9D557E6EDD")!, category: "laptop"  , favoriteID: UUID(uuidString: "CD8F983A-0E09-4A11-9670-E4BBAA8151C6")!, favorite: "MacBook Pro"      ),
        Fave(id: UUID(uuidString: "30EE6385-0D18-44DE-A50D-D0DE3F8494A3")!, category: "bicycle" , favoriteID: UUID(uuidString: "93D25C54-1060-478C-930D-055C67C2B22A")!, favorite: "Tommaso"          ),
        Fave(id: UUID(uuidString: "201672F5-0C69-4191-96AE-3538017A9560")!, category: "food"    , favoriteID: UUID(uuidString: "EAF42D25-564A-4C68-BBC0-9F1E06E8752A")!, favorite: "Salmon"           ),
        Fave(id: UUID(uuidString: "95DC21AF-7499-4FAF-AEDF-CDFEC95E6CC8")!, category: "dessert" , favoriteID: UUID(uuidString: "CEF82743-DDE4-40D7-97E0-64CE4019395B")!, favorite: "Lemon pie"        ),
        Fave(id: UUID(uuidString: "906EFF74-7869-4F87-ACDB-7A91512AF7B8")!, category: "movies"  , favoriteID: UUID(uuidString: "28BE42F2-0ED1-4027-A757-B4D4E43311A1")!, favorite: "Star Wars"        ),
        Fave(id: UUID(uuidString: "01145D68-316D-4ECF-985F-B5EE5CD1A937")!, category: "TV show" , favoriteID: UUID(uuidString: "E3991215-862B-43A2-828D-24EFB00DD746")!, favorite: "Game of Thrones"  ),
        Fave(id: UUID(uuidString: "E71AC9C3-669C-4931-BC4A-6101240A9873")!, category: "Code"    , favoriteID: UUID(uuidString: "840E4C09-E578-4B11-BE35-3D0B61075116")!, favorite: "Swift, SwiftUI"   ),
        Fave(id: UUID(uuidString: "FB39164D-003A-4D40-815D-F24861EB8F94")!, category: "Color"   , favoriteID: UUID(uuidString: "12B89178-6F5D-44EB-8929-FB6F09C6FC74")!, favorite: "Blue"             )
    ]
    
    func relocate(from source: IndexSet, to destination: Int) {
        DispatchQueue.main.async {
            self.faves.move(fromOffsets: source, toOffset: destination)
        }
    }
    
    func delete(from source: IndexSet) {
        DispatchQueue.main.async {
            self.faves.remove(atOffsets: source)
        }
    }
    
}

struct Fave: Identifiable, Hashable, Equatable {
    var id: UUID
    var category: String
    var favoriteID: UUID
    var favorite: String
    
    init() {
        id = UUID.init()
        category = ""
        favoriteID = UUID.init()
        favorite = ""
    }
    
    init(id: UUID, category: String, favoriteID: UUID, favorite: String) {
        self.id = id
        self.category = category
        self.favoriteID = favoriteID
        self.favorite = favorite
    }
}
