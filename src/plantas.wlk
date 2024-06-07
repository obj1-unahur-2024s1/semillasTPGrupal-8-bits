import parcelas.*

class Planta{
	const anioOrigen
	const property altura
	
	method toleranciaAlSol()
	
	method esFuerte() = self.toleranciaAlSol() > 10
	
	method daNuevasSemillas() = self.esFuerte()
	
}

class Menta inherits Planta{
	
	override method toleranciaAlSol() = 6
	
	override method daNuevasSemillas() = super() or altura > 0.4
	
	method espacioOcupado() = 4
	
	method esIdeal(parcela) = parcela.superficie() > 6
}

class Soja inherits Planta{
	
	override method toleranciaAlSol() = if (altura < 0.5) 6 else if (altura.between(0.5,1)) 7 else 9
	
	override method daNuevasSemillas() = super() or anioOrigen >= 2007 and altura > 1
	
	method espacioOcupado() = altura / 2
	
	method esIdeal(parcela) = parcela.horasDeSol() == self.toleranciaAlSol()
}

class Quinoa inherits Planta{
	var toleranciaAlSol

	override method toleranciaAlSol() = toleranciaAlSol
	
	override method daNuevasSemillas() = super() or anioOrigen < 2005
	
	method espacioOcupado() = 0.5
	
	method esIdeal(parcela) = parcela.plantas().all({ plant => plant.altura() <= 1.5 })
}

class SojaTransgenica inherits Soja{
	override method daNuevasSemillas() = false
	
	override method esIdeal(parcela) = parcela.cantMaxPlantas() == 1
}

class Hierbabuena inherits Menta{
	override method espacioOcupado() = super() * 2
}
