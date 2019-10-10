import wollok.game.*

class Carta{	
	var property nombre
	var property position
	var property arriba = false
	
	method image () = if (arriba) nombre + ".jpg" else "nemoCarta.jpg"	
	
	method darVuelta() {
		arriba = not arriba
	}	
}

object gameControl {
	
	var cartas = []

	var personajes = [
		"carta01", 
		"carta02",
		"carta03", 
		"carta04",
		"carta1", 
		"carta2", 
		"carta3", 
		"carta4"
	]

	var property combinaciones = [
		game.at(1,1), 
		game.at(1,7), 
		game.at(7,1), 
		game.at(7,7), 
		game.at(13,1), 
		game.at(13,7), 
		game.at(19,1), 
		game.at(19,7)
	]	

	method position() {
		var x
		x = combinaciones.anyOne()
		combinaciones.remove(x)
		return x		
	}
	
	method inicializar() {
		personajes.forEach {carta => self.asignarPosicion(carta)}
	}
	
	method asignarPosicion(nombreCarta) {
		const carta = new Carta( nombre = nombreCarta, position = self.position())
		cartas.add(carta)
		game.addVisual(carta)
	}
	
	method darVueltaCarta(posicion) {
		cartas.get(posicion).darVuelta()
	}
	
	method darVueltaTodo() {
		cartas.forEach {carta => carta.darVuelta()}
	}
}
	


