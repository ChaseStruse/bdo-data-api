import Vapor
import Fluent

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
            adventurerRoute.put(use: updateCharacter)
        }
    }
    
    @Sendable func getGearScore(_req: Request) async throws -> String {
        return "157"
    }
    
    @Sendable func calculateGearScore(_req: Request) async throws -> String {
        let request = try _req.content.decode(gearScoreRequest.self)
        return String((request.ap + request.aap)/2 + request.dp)
    }
    
    @Sendable func getCharacter(_req: Request) async throws -> CharacterResponse {
        let character = Character(familyName: "Test", familyFame: 1, mainClass: "Striker", gearScore: 100)
        return CharacterResponse(message: "Successfully found Character", characterCreated: character)
    }
    
    @Sendable func createCharacter(_req: Request) async throws -> CharacterResponse {
        let request = try _req.content.decode(Character.self)
        return CharacterResponse(message: "Successfully created", characterCreated: request)
    }
    
    @Sendable func updateCharacter(_req: Request) async throws -> CharacterResponse {
        let request = try _req.content.decode(Character.self)
        return CharacterResponse(message: "Successfully updated", characterCreated: request)
    }
    

}
