import parcelas.*

object inta{
	const parcelas = []
	
	method agregar(parcela){
		parcelas.add(parcela)
	}
	
	method promedioDePlantas() = parcelas.sum({ parcela => parcela.plantas().size() }) / parcelas.size()
	
	method parcelaMasAutosustentable(){
		const parcelasConMasDe4Plantas = parcelas.filter({ parcela => parcela.plantas().size() > 4 })
		
		parcelasConMasDe4Plantas.max({ parcela =>   
			parcela.plantas().count({ planta => parcela.bienAsociada(planta) })
		})
	}
}