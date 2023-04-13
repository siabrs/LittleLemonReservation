import SwiftUI

struct LocationsView: View {
    @EnvironmentObject var model:Model
    var body: some View {
        VStack {
            LittleLemonLogo() // 1
                .padding(.top, 50)
            
            (model.displayingReservationForm ? Text("Reservation Details") : Text("Select a location"))
            .padding([.leading, .trailing], 40)
            .padding([.top, .bottom], 8)
            .background(Color.gray.opacity(0.2))
            .cornerRadius(20)
            
            NavigationView {
                List {
                    ForEach(model.restaurants, id: \.self) { rest in
                        NavigationLink(destination:
                            ReservationForm(
                                RestaurantLocation(city: rest.city,
                                                   neighborhood: rest.neighborhood,
                                                   phoneNumber: rest.phoneNumber)))
                        {
                                RestaurantView(
                                RestaurantLocation(city: rest.city,
                                                   neighborhood: rest.neighborhood,
                                                   phoneNumber: rest.phoneNumber))
                        }
                    }
                } // 3
                .navigationBarTitle("")
                .navigationBarHidden(true)
            }
        }
        .padding(.top, -10)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView().environmentObject(Model())
    }
}

