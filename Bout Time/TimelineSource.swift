//
//  TimelineSource.swift
//  Bout Time
//
//  Created by Michael Guatambu Davis on 3/31/17.
//  Copyright © 2017 leme group. All rights reserved.
//

import Foundation
import GameKit


// protocol to establish timeline events

protocol TimeLineEvent {
    var order: Int { get }
    var event: String { get}
    var year: Int { get }
    var link: String { get }
}


// class setting up timeline objects

class TimelineSource: TimeLineEvent {
    var order: Int
    var event: String
    var year: Int
    var link: String
    
    init(order: Int, event: String, year: Int, link: String) {
        self.order = order
        self.event = event
        self.year = year
        self.link = link
    }
}

//  events as instances of timeline source

let event1 = TimelineSource(order: 1, event: "Assassination of William McKinley", year: 1901, link: "https://en.wikipedia.org/wiki/Assassination_of_William_McKinley")
let event2 = TimelineSource(order: 2, event: "First controlled heavier-than-air flight of the Wright Brothers", year: 1903, link: "https://en.wikipedia.org/wiki/Wright_Brothers")
let event3 = TimelineSource(order: 3, event: "Albert Einstein's formulation of relativity", year: 1905, link: "https://en.wikipedia.org/wiki/Theory_of_relativity")
let event4 = TimelineSource(order: 4, event: "Elections in Finland first in the world with woman candidates", year: 1907, link: "https://en.wikipedia.org/wiki/Universal_suffrage")
let event5 = TimelineSource(order: 5, event: "Niels Bohr formulates the first cohesive model of the atomic nucleus", year: 1913, link: "https://en.wikipedia.org/wiki/Niels_Bohr")
let event6 = TimelineSource(order: 6, event: "Gavrilo Princip assassinates Archduke Ferdinand starts World War I", year: 1914, link: "https://en.wikipedia.org/wiki/Gavrilo_Princip")
let event7 = TimelineSource(order: 7, event: "Treaty of Versailles redraws European borders", year: 1919, link: "https://en.wikipedia.org/wiki/Treaty_of_Versailles")
let event8 = TimelineSource(order: 8, event: "Mohandas Gandhi launches Non-cooperation movement", year: 1920, link: "https://en.wikipedia.org/wiki/Non-cooperation_movement")
let event9 = TimelineSource(order: 9, event: "Howard Carter discovers Tutankhamen's tomb", year: 1922, link: "https://en.wikipedia.org/wiki/Howard_Carter")
let event10 = TimelineSource(order: 10, event: "\"The Jazz Singer\", the first \"talkie\", is released", year: 1927, link: "https://en.wikipedia.org/wiki/The_Jazz_Singer")
let event11 = TimelineSource(order: 11, event: "Wall Street crash of 1929 and start of Great Depression", year: 1929, link: "https://en.wikipedia.org/wiki/Wall_Street_crash_of_1929")
let event12 = TimelineSource(order: 12, event: "First FIFA World Cup hosted", year: 1930, link: "https://en.wikipedia.org/wiki/1930_FIFA_World_Cup")
let event13 = TimelineSource(order: 13, event: "Bonnie and Clyde are shot to death in a police ambush", year: 1934, link: "https://en.wikipedia.org/wiki/Bonnie_and_Clyde")
let event14 = TimelineSource(order: 14, event: "DC Comics hero Superman has its first appearance", year: 1938, link: "https://en.wikipedia.org/wiki/Superman")
let event15 = TimelineSource(order: 15, event: "Nazi invasion of Poland begins World War II in Europe", year: 1939, link: "https://en.wikipedia.org/wiki/Invasion_of_Poland")
let event16 = TimelineSource(order: 16, event: "Manhattan Project begins", year: 1942, link: "https://en.wikipedia.org/wiki/Manhattan_Project")
let event17 = TimelineSource(order: 17, event: "Yalta Conference - End of World War II in Europe", year: 1945, link: "https://en.wikipedia.org/wiki/Yalta_Conference")
let event18 = TimelineSource(order: 18, event: "Beginning of the Korean War", year: 1950, link: "https://en.wikipedia.org/wiki/Korean_War")
let event19 = TimelineSource(order: 19, event: "Discovery of the three-dimensional structure of DNA", year: 1953, link: "https://en.wikipedia.org/wiki/DNA")
let event20 = TimelineSource(order: 20, event: "Launch of Sputnik 1 begins of the Space Age", year: 1957, link: "https://en.wikipedia.org/wiki/Space_Age")
let event21 = TimelineSource(order: 21, event: "First documented AIDS cases", year: 1959, link: "https://en.wikipedia.org/wiki/AIDS")
let event22 = TimelineSource(order: 22, event: "Construction of the Berlin Wall", year: 1961, link: "https://en.wikipedia.org/wiki/Berlin_Wall")
let event23 = TimelineSource(order: 23, event: "Tet Offensive occurs in South Vietnam", year: 1968, link: "https://en.wikipedia.org/wiki/Tet_Offensive")
let event24 = TimelineSource(order: 24, event: "Completion of the World Trade Center", year: 1971, link: "https://en.wikipedia.org/wiki/World_Trade_Center_(1973–2001)")
let event25 = TimelineSource(order: 25, event: "Smallpox eradicated", year: 1979, link: "https://en.wikipedia.org/wiki/Smallpox")
let event26 = TimelineSource(order: 26, event: "World population reaches 5 billion", year: 1987, link: "https://en.wikipedia.org/wiki/World_population")
let event27 = TimelineSource(order: 27, event: "Tiananmen Square Massacre in China", year: 1989, link: "https://en.wikipedia.org/wiki/Tiananmen_Square_Massacre")
let event28 = TimelineSource(order: 28, event: "Intergovernmental Panel on Climate Change first assessment report", year: 1990, link: "https://en.wikipedia.org/wiki/IPCC_First_Assessment_Report")
let event29 = TimelineSource(order: 29, event: "The first Website is online available to the public", year: 1991, link: "https://en.wikipedia.org/wiki/Website")
let event30 = TimelineSource(order: 30, event: "End of apartheid in South Africa and Nelson Mandela elected", year: 1994, link: "https://en.wikipedia.org/wiki/Apartheid")


// struct to establish array of events and randomness functionality

struct TimelineEvents {
    
    let timelineEvent = "0"
    
    
    var timelineArray = [
     event1, event2, event3, event4, event5, event6, event7, event8, event9, event10, event11, event12, event13, event14, event15, event16, event17, event18, event19, event20, event21, event22, event23, event24, event25, event26, event27, event28, event29, event30
    ]
    
    
    func randomQuestion1() -> TimeLineEvent {
        let randomIndexNumber = GKRandomSource.sharedRandom().nextInt(upperBound: timelineArray.count)
        return timelineArray[randomIndexNumber]
    }
    
    
    /// func generates a random number based on questionAnswerArray's contents
    func randomIndexNumberGenerator() -> Int {
        let randomIndexNumber = GKRandomSource.sharedRandom().nextInt(upperBound: timelineArray.count)
        return randomIndexNumber
    }
    
    /// func generates question from instance of questionAnswerArray based on provided index value
    func randomQuestion(at index: Int) -> TimelineSource {
        let randomQuestion = timelineArray[index]
        return randomQuestion
    }
    
    /// func removes question from instance of questionAnswerArray based on provided index value
    mutating func arrayItemRemover(at index: Int) -> TimelineSource {
        let removedArrayItem = timelineArray.remove(at: index)
        return removedArrayItem
    }

}










