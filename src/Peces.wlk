import wollok.game.*


class Carta{	
	var property nombre
	var property posicion
	
	method image () = nombre + ".jpg"	
	method position() = posicion
	
}
object gameControl {
//	var cartas = [
//		new Carta (nombre = "carta01", posicion = self.position()),
//		new Carta (nombre = "carta1", posicion = self.position()),
//		new Carta (nombre = "carta02", posicion = self.position()),
//		new Carta (nombre = "carta2", posicion = self.position()),
//		new Carta (nombre = "carta03", posicion = self.position()),
//		new Carta (nombre = "carta3", posicion = self.position()),
//		new Carta (nombre = "carta04", posicion = self.position()),
//		new Carta (nombre = "carta4", posicion = self.position())	
//	]
	var combinaciones = [game.at(1,1), game.at(1,7), game.at(7,1), game.at(7,7), game.at(13,1), game.at(13,7), game.at(19,1), game.at(19,7)]
	
	method position() {
		var x
		x = combinaciones.anyOne()
		combinaciones.remove(x)
		return x		
	}
	
	method iniciar(personajes) {
		return 	personajes.forEach {carta => game.addVisualIn(new Carta( nombre = carta, posicion = self.position()), carta.position())
				}
	}
	
}
