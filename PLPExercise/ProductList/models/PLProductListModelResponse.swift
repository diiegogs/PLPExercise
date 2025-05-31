//
//  PLProductListModelResponse.swift
//  PLPExercise
//
//  Created by Juan Diego Garcia Serrano on 30/05/25.
//

import Foundation

// MARK: - PLProductListModelResponse
class PLProductListModelResponse: Codable {
    let mensaje: String
    let advertencia: String
    let resultado: Resultado

    init(mensaje: String, advertencia: String, resultado: Resultado) {
        self.mensaje = mensaje
        self.advertencia = advertencia
        self.resultado = resultado
    }
}

// MARK: - Resultado
class Resultado: Codable {
    let paginacion: Paginacion
    let categoria: String
    let productos: [Producto]

    init(paginacion: Paginacion, categoria: String, productos: [Producto]) {
        self.paginacion = paginacion
        self.categoria = categoria
        self.productos = productos
    }
}

// MARK: - Paginacion
class Paginacion: Codable {
    let pagina, totalPaginas, totalRegistros, totalRegistrosPorPagina: Int

    init(pagina: Int, totalPaginas: Int, totalRegistros: Int, totalRegistrosPorPagina: Int) {
        self.pagina = pagina
        self.totalPaginas = totalPaginas
        self.totalRegistros = totalRegistros
        self.totalRegistrosPorPagina = totalRegistrosPorPagina
    }
}

// MARK: - Producto
class Producto: Codable {
    let id: String
    let idLinea: Int
    let codigoCategoria: CodigoCategoria
    let idModalidad, relevancia: Int
    let lineaCredito: String
    let pagoSemanalPrincipal, plazoPrincipal: Int
    let disponibleCredito: Bool
    let abonosSemanales: [AbonosSemanale]
    let sku, nombre: String
    let urlImagenes: [String]
    let precioRegular: Int
    let precioFinal, porcentajeDescuento: Double
    let descuento: Bool
    let precioCredito, montoDescuento: Double

    init(id: String, idLinea: Int, codigoCategoria: CodigoCategoria, idModalidad: Int, relevancia: Int, lineaCredito: String, pagoSemanalPrincipal: Int, plazoPrincipal: Int, disponibleCredito: Bool, abonosSemanales: [AbonosSemanale], sku: String, nombre: String, urlImagenes: [String], precioRegular: Int, precioFinal: Double, porcentajeDescuento: Double, descuento: Bool, precioCredito: Double, montoDescuento: Double) {
        self.id = id
        self.idLinea = idLinea
        self.codigoCategoria = codigoCategoria
        self.idModalidad = idModalidad
        self.relevancia = relevancia
        self.lineaCredito = lineaCredito
        self.pagoSemanalPrincipal = pagoSemanalPrincipal
        self.plazoPrincipal = plazoPrincipal
        self.disponibleCredito = disponibleCredito
        self.abonosSemanales = abonosSemanales
        self.sku = sku
        self.nombre = nombre
        self.urlImagenes = urlImagenes
        self.precioRegular = precioRegular
        self.precioFinal = precioFinal
        self.porcentajeDescuento = porcentajeDescuento
        self.descuento = descuento
        self.precioCredito = precioCredito
        self.montoDescuento = montoDescuento
    }
}

// MARK: - AbonosSemanale
class AbonosSemanale: Codable {
    let plazo, montoAbono, montoDescuentoAbono, montoUltimoAbono: Int
    let montoFinalCredito, idPromocion, montoDescuentoElektra, montoDescuentoBanco: Int
    let precio, montoAbonoDigital: Int

    init(plazo: Int, montoAbono: Int, montoDescuentoAbono: Int, montoUltimoAbono: Int, montoFinalCredito: Int, idPromocion: Int, montoDescuentoElektra: Int, montoDescuentoBanco: Int, precio: Int, montoAbonoDigital: Int) {
        self.plazo = plazo
        self.montoAbono = montoAbono
        self.montoDescuentoAbono = montoDescuentoAbono
        self.montoUltimoAbono = montoUltimoAbono
        self.montoFinalCredito = montoFinalCredito
        self.idPromocion = idPromocion
        self.montoDescuentoElektra = montoDescuentoElektra
        self.montoDescuentoBanco = montoDescuentoBanco
        self.precio = precio
        self.montoAbonoDigital = montoAbonoDigital
    }
}

enum CodigoCategoria: String, Codable {
    case c = "C"
    case ma = "MA"
    case tl = "TL"
}
