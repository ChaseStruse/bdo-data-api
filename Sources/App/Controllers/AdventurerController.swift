import Vapor
import Fluent

struct AdventurerController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let adventurerRoutes = routes.grouped("adventurer")
        
        // /adventurer/gearScore
        adventurerRoutes.group("gearScore") { adventurerRoute in
            adventurerRoute.get(use: getGearScoreHandler)
        }
        
    }
    
    func getGearScoreHandler(_req: Request) async throws -> String {
        return "157"
    }
    

}
