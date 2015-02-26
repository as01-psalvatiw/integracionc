Feature: Pay bus
El bus se detiene abre su puerta entro y deslizo la Bus card por el lector de tarjeta para pagar por el transporte. Simple. 
Primer escenario: Debito exitoso (hay saldo)
Scenario: Successful debit
La cuenta de usuario de la Bus card tiene saldo disponible y mayor al costo del pasaje.
Given I have chosen to pay bus
When I pay bus with card of user X there is equal or more balance than bus passage price
Then I should receive a confirmation of debit made
And I should see a personalized greeting message
Scenario: Insuccesfull debit 
La tarjeta que tengo no tiene suficiente saldo para pagar el valor del pasaje del transporte
Given I have chosen to pay bus
But I use a card with not enough balance to pay for bus passage price
Then I should be indicated the card is valid but does not have enough balance to pay 
And I should be asked to recharge my card for future use
Scenario: Stolen bus card
Alguien intenta usar una tarjeta de bus que fue reportada como robada o extraviada.
Given I have chosen to pay bus
But I use a bus card that was reported as missing/stolen
Then I should be told that the card is reported as missing/stolen so it’s blocked 
And I should be asked to dispose of the card as it no longer works.
