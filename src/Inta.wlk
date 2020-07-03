import parcelas.*
object inta{
	var property coleccionDeParcelas = #{}
	
	method promedioDePlantasPorParcelas(){
		return  self.cantidadTotalDePlantas() / self.coleccionDeParcelas().size()
		
	}
	method cantidadTotalDePlantas() {
	 return self.coleccionDeParcelas().sum({ parcela => parcela.cantidadDePlantas()} )
	}
	
	
	method ParcelaMasAutoSus(){
		 self.parcelasConMasDe4().max({ parcela => parcela.cantPlantasAsociadas()})
	}
	method parcelasConMasDe4(){
		return self.coleccionDeParcelas().filter({parcela => parcela.cantidadDePlantas() > 4})
	}
}
