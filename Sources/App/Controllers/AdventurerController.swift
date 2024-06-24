import Vapor
import Fluent

struct gearScoreRequest: Content {
    var ap: Int
    var dp: Int
    var aap: Int
}

struct Character: Content {
    var familyName: String
    var familyFame: Int
    var mainClass: String
    var gearScore: Int
    
    init(familyName: String, familyFame: Int, mainClass: String, gearScore: Int) {
        self.familyName = familyName
        self.familyFame = familyFame
        self.mainClass = mainClass
        self.gearScore = gearScore
    }
}

struct CharacterPostResponse: Content {
    var message: String
    var characterCreated: Character
}

struct AdventurerController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let adventurerRoutes = routes.grouped("adventurer")
        
        // /adventurer/gearScore
        adventurerRoutes.group("gearScore") { adventurerRoute in
            adventurerRoute.get(use: getGearScore)
            adventurerRoute.post(use: calculateGearScore)
        }
        
        // /adventurer/character
        adventurerRoutes.group("character") { adventurerRoute in
            adventurerRoute.get(use: getCharacter)
            adventurerRoute.post(use: createCharacter)
        }
    }
    
    @Sendable func getGearScore(_req: Request) async throws -> String {
        return "157"
    }
    
    @Sendable func calculateGearScore(_req: Request) async throws -> String {
        let request = try _req.content.decode(gearScoreRequest.self)
        return String((request.ap + request.aap)/2 + request.dp)
    }
    
    @Sendable func getCharacter(_req: Request) async throws -> Character {
        return Character(familyName: "Test", familyFame: 1, mainClass: "Striker", gearScore: 100)
    }
    
    @Sendable func createCharacter(_req: Request) async throws -> CharacterPostResponse {
        let request = try _req.content.decode(Character.self)
        return CharacterPostResponse(message: "Successfully created", characterCreated: request)
    }
    

}
