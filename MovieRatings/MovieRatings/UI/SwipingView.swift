//
//  SwiftUIView.swift
//  MovieRatings
//
//  Created by Marco Inniger on 02.06.20.
//  Copyright © 2020 FHNW. All rights reserved.
//

import SwiftUI

struct SwipingView : View {

    @EnvironmentObject var observer : SwipeObserver
    
    var body : some View{
        
        GeometryReader{geo in
            
            ZStack{
                
                ForEach(self.observer.cards){card in
                    
                    
                    Rectangle()
                        .foregroundColor(card.color)
                        .cornerRadius(20)
                        .frame(width: geo.size.width-40, height: geo.size.height - 80, alignment: .center)
                        .gesture(DragGesture()
                            
                            .onChanged({ (value) in
                                
                                if value.translation.width > 0{
                                    
                                    if value.translation.width > 30{
                                        self.observer.update(id: card, value: value.translation.width, degree: 12)
                                    }
                                    else{
                                        self.observer.update(id: card, value: value.translation.width, degree: 0)
                                    }
                                }
                                else{
                                    
                                    if value.translation.width < -30{
                                        self.observer.update(id: card, value: value.translation.width, degree: -12)
                                    }
                                    else{
                                        self.observer.update(id: card, value: value.translation.width, degree: 0)
                                    }
                                }
                                
                            }).onEnded({ (value) in
                                
                                if card.drag > 0{

                                    if card.drag > geo.size.width / 2 - 40{
                                        self.observer.update(id: card, value: 500, degree: 0)
                                    }
                                    else{
                                        self.observer.update(id: card, value: 0, degree: 0)
                                    }
                                }
                                else{

                                    if -card.drag > geo.size.width / 2 - 40{
                                        self.observer.update(id: card, value: -500, degree: 0)
                                    }
                                    else{

                                        self.observer.update(id: card, value: 0, degree: 0)
                                    }
                                }
                                
                            })
                    ).offset(x: card.drag)
                        .scaleEffect(abs(card.drag) > 100 ? 0.8 : 1)
                        .rotationEffect(.init(degrees:card.degree))
                        .animation(.spring())
                    
                }
            }
        }
    }
}
