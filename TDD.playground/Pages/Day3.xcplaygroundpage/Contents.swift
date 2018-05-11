/*:
 [Previous](@previous)
 
 Exercício de Outside In TDD (London school, mockist approach)
 
 Método de TDD usado quando já temos algumas coisas definidas como o input ou output da nossa aplicação.
 
 Por exemplo, em um microservice, já sabemos que é o input é um HTTP e o output provavelmente será uma alteração no banco de dados.
 
 Em uma aplicação de pagamento, o input será a ação do usuário, e muitas coisas acontecem até o output, validar o usuário, dar baixa no estoque, calcular frete, emitir nota...
 
 Para praticar esse método vamos fazer um kata.
 
 ---
 
 Bank Account kata
 
 Crie uma simples aplicação bancaria que siga os requisitos seguintes:

 * depositar na conta
 * sacar da conta
 * imprimir o extrato no console
 
 Critérios para aceitação:
 
 O extrato deve possuir o seguinte formato:

 ````
 DATA       | VALOR    | TOTAL
 09/05/2018 | 500.00   | 1400.00
 02/05/2018 | -100.00  | 900.00
 01/05/2018 | 1000.00  | 1000.00
 ````
 
 Regras:
 
 1. Você deve iniciar com a seguinte estrutura:
 
 ````
 public struct Account {
     public func deposit(amount: Int) {}
     public func withdraw(amount: Int) {}
     public func printStatement()
 }
 ````
 2. Não é permitido adicionar métodos públicos na estrutura Account
 3. Não é permitido alterar a assinatura dos métodos na estrutura Account
 4. Use String e Int para data e valores, vamos manter simples
 5. Não se preocupe com espaçamento e tabulação do extrato impresso no console
 
 */

import Foundation
import XCTest

class TestObserver: NSObject, XCTestObservation {
    func testCase(_ testCase: XCTestCase,
                  didFailWithDescription description: String,
                  inFile filePath: String?,
                  atLine lineNumber: Int) {
        assertionFailure(description, line: UInt(lineNumber))
    }
}


// Code


XCTestObservationCenter.shared.addTestObserver(TestObserver())
// TestClass.defaultTestSuite.run()

//: [Next](@next)
