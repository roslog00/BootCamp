import SwiftUI

final class TabBarRouter: ObservableObject {
    @Published var selectionTabBar = 1
    @Published var id = ""
    @Published var productId = ""
    @Published var categoryNumber: Double = 0
}

struct ForAllTabBarView: View {
    @Environment(\.colorScheme) var colorScheme
    
    @State var userStyle: Int = 0
    @State var isAnimated: Bool = false
    
    @State var search: Bool = false
    @StateObject var router = TabBarRouter()
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            //Main TabBar For Screens
            TabView(selection: $router.selectionTabBar) {
                Main()
                    .tag(1)
                Menu()
                    .tag(2)
                Settings()
                    .tag(3)
            }.ignoresSafeArea(.keyboard)
                .onDisappear {
                    isAnimated = false
                }
            
            
            iconOnOffSwitcherForBuyer(tag: router.selectionTabBar)
                .ignoresSafeArea(.keyboard)
                .opacity(router.selectionTabBar == 15 || router.selectionTabBar == 16 ? 0 : 1)
                .opacity(router.selectionTabBar == 212 ? 0 : 1)
                .opacity(router.selectionTabBar == 221 || router.selectionTabBar == 222 ? 0 : 1)
            
        }
    }
}

#Preview {
    ForAllTabBarView()
}

extension ForAllTabBarView {
    @ViewBuilder
    func iconOnOffSwitcherForBuyer(tag: Int) -> some View {
        ZStack {
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 260, height: 64)
                .background(colorScheme == .light ? .white :
                                Color(red: 0.13, green: 0.13, blue: 0.13))
                .cornerRadius(50)
                .shadow(color: colorScheme == .light ?
                        Color(red: 0.87, green: 0.87, blue: 0.87).opacity(0.4) :
                            Color(red: 0.03, green: 0.03, blue: 0.03).opacity(0.58), radius: 10, x: 0, y: 3)
            
            
            HStack(alignment: .center, spacing: 36) {
                
                //Bag on icon, because tag = 1
                HStack(alignment: .center, spacing: 0) {
                    Button(action: {
                        withAnimation(.spring(duration: 0.5)) {
                            router.selectionTabBar = 1
                        }
                    }, label: {
                        if tag == 1 || tag == 11 || tag == 12 || tag == 13 || tag == 14 || tag == 15 || tag == 16  {
                            Image("bagON")
                                .foregroundColor(Color("GreenMain"))
                                .frame(width: 20.8, height: 23.5)
                        } else {
                            if colorScheme == .light {
                                Image("bagOFF_ThemeOFF")
                                    .foregroundColor(Color("LightGrey"))
                                    .frame(width: 20.8, height: 23.5)
                            } else {
                                Image("bagOFF_ThemeON")
                                    .foregroundColor(Color("LightGrey"))
                                    .frame(width: 20.8, height: 23.5)
                            }
                        }
                    })
                    
                }
                .padding(10)
                .frame(width: 48, height: 48, alignment: .center)
                
                //Human off icon
                Button(action: {
                    withAnimation(.spring(duration: 0.5)) {
                        router.selectionTabBar = 2
                    }
                }, label: {
                    if tag == 2  || tag == 21 || tag == 22 || tag == 222 || tag == 221 || tag == 211 {
                        Image(colorScheme == .light ? "humanON" : "humanON_ThemeON")
                            .foregroundColor(Color("GreenMain"))
                            .frame(width: 28, height: 28)
                    } else {
                        if colorScheme == .light {
                            Image("humanOFF_ThemeOFF")
                                .foregroundColor(Color("LightGrey"))
                                .frame(width: 28, height: 28)
                        } else {
                            Image("humanOFF_ThemeON")
                                .foregroundColor(Color("LightGrey"))
                                .frame(width: 28, height: 28)
                        }
                    }
                })
                .padding([.leading, .bottom], 10)
                .padding([.trailing, .top], 11)
                .frame(width: 48, height: 48, alignment: .center)
                
                //Settings off icon
                Button(action: {
                    withAnimation(.spring(duration: 0.5)) {
                        router.selectionTabBar = 3
                    }
                }, label: {
                    if tag == 3 || tag == 31 || tag == 32 || tag == 33 || tag == 34 {
                        Image("settingsON")
                            .foregroundColor(Color("GreenMain"))
                            .frame(width: 20.8, height: 23.5)
                    } else {
                        if colorScheme == .light {
                            Image("settingsOFF_ThemeOFF")
                                .foregroundColor(Color("LightGrey"))
                                .frame(width: 20.8, height: 23.5)
                        } else {
                            Image("settingsOFF_ThemeON")
                                .foregroundColor(Color("LightGrey"))
                                .frame(width: 20.8, height: 23.5)
                        }
                    }
                })
                .padding([.leading, .bottom], 10)
                .padding([.trailing, .top], 11)
                .frame(width: 48, height: 48, alignment: .center)
                
            }
        }.frame(width: 260, height: 64)
    }
}

