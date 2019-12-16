import wollok.game.*

class Carta{	
	var property nombre
	var property position
	var property arriba = false
	var property bloqueada = false
	var property alias = ""
	
	method image () = if (arriba) nombre + ".jpg" else "nemoCarta.jpg"	
	
	method setAlias() {
		alias = nombre.substring(0,1)
	}
	
	method darVuelta() {
		if (not bloqueada) {
			arriba = not arriba		
		}
	}
	
	method bloquear() {
		bloqueada = true
	}
	
}

object gameControl {
	
	var cartas = []
	
	var property habilitado = true
	
	var ultimoAlias = ""
	
	var gano = false

	var personajes = [
		"1carta", 
		"2carta",
		"3carta", 
		"4carta",
		"1cartaDoble", 
		"2cartaDoble", 
		"3cartaDoble", 
		"4cartaDoble"
	]

	var property combinaciones2 = [
		game.at(1,1), 
		game.at(1,7), 
		game.at(7,1), 
		game.at(7,7), 
		game.at(13,1), 
		game.at(13,7), 
		game.at(19,1), 
		game.at(19,7)
	]
	
	var property combinaciones = []

	method position() {
		var x
		x = combinaciones.anyOne()
		combinaciones.remove(x)
		combinaciones2.add(x)
		return x		
	}
	
	method cargarCombinaciones() {
		combinaciones2.forEach {combinacion => combinaciones.add(combinacion)}
	}
	
	method inicializar() {
		self.cargarCombinaciones()
		personajes.forEach {carta => self.asignarPosicion(carta)}
	}
	
	method asignarPosicion(nombreCarta) {
		const carta = new Carta( nombre = nombreCarta, position = self.position())
		carta.setAlias()
		cartas.add(carta)
		game.addVisual(carta)
	}
	
	method bloquearODarVuelta() {
		var cartasDadasVuelta = cartas.filter({carta => carta.arriba() && not carta.bloqueada()})
		var esaCartaDadaVuelta = cartasDadasVuelta.filter({carta => carta.alias() == ultimoAlias})
		if (esaCartaDadaVuelta.size() > 1) {
			esaCartaDadaVuelta.forEach {cartaVolteada => cartaVolteada.bloquear()}
		} else {
			if (cartasDadasVuelta.size() > 1) {
				habilitado = false
				game.schedule(300, {cartasDadasVuelta.forEach {cartaVolteada => cartaVolteada.darVuelta()}})
				game.schedule(310, {habilitado = true})
			}
		}
	}
	
	method darVueltaCarta(posicion) {
		var pos = combinaciones2.get(posicion)
		cartas.find{x => x.position() == pos}.darVuelta()
		ultimoAlias = cartas.find{x => x.position() == pos}.alias()
	}
	
	method darVueltaTodo() {
		cartas.forEach {carta => carta.darVuelta()}
	}
	
	method chequearSiGano() {
		if (cartas.filter({carta => not carta.arriba()}).size() == 0 && 
			cartas.filter({carta => not carta.bloqueada()}).size() == 0
		) {
			gano = true
			var pos = combinaciones2.get(1)
			var primeraCarta = cartas.find{x => x.position() == pos}
			var carta = new Carta(nombre = "NemoDory", position = game.at(8,5), arriba = true)
			game.addVisual(carta)
			game.say(carta, "GANASTE!")
		}
	}
	
	method timer(){
			var carta = new Carta(nombre = "perdiste", position = game.at(4,3), arriba = true)
			game.schedule(12000, {if (not gano) {self.darVueltaTodo()}})
			game.schedule(12000, {if (not gano) {game.addVisual(carta)}})
			game.schedule(12500, {if (not gano) {game.say(carta, "PERDISTE")}})
	}
}
	
//SCHEDULE

