import plantas.*

class Parcela{
	var ancho
	var largo
	const property superficie = ancho * largo
	const property horasDeSol
	const property plantas = []
	const tipoDeParcela //String "Ecológica" o "Industrial"
	
	method cantMaxPlantas() = if (ancho > largo) superficie/5 else superficie/3 + largo
	
	method tieneComplicaciones() = plantas.any({ p => p.toleranciaAlSol() < horasDeSol })
	
	method plantar(planta){
		if( plantas.size() < self.cantMaxPlantas() or horasDeSol+2 < planta.toleranciaAlSol() ){
				plantas.add(planta)
		}else{
			console.println("No se puede plantar esta planta")
		}		
	}

	method bienAsociada(planta) = 
	if (tipoDeParcela == "Ecológica"){!self.tieneComplicaciones() and planta.esIdeal(self)}
	else{plantas.size() <= 2 and planta.esFuerte()}
	
}
