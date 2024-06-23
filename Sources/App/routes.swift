import Vapor

func routes(_ app: Application) throws {

    try app.register(collection: AdventurerController())

    print(app.routes.all)
}
