import Vapor
import Fluent

struct gearScoreRequest: Content {
    var ap: Int
    var dp: Int
    var aap: Int
}

struct AdventurerController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let adventurerRoutes = routes.grouped("adventurer")
        
        // /adventurer/gearScore
        adventurerRoutes.group("gearScore") { adventurerRoute in
            adventurerRoute.get(use: getGearScore)
            adventurerRoute.post(use: calculateGearScore)
        }
        
    }
    
    @Sendable func getGearScore(_req: Request) async throws -> String {
        return "157"
    }
    
    @Sendable func calculateGearScore(_req: Request) async throws -> String {
        let request = try _req.content.decode(gearScoreRequest.self)
        return String((request.ap + request.aap)/2 + request.dp)
    }
    

}
