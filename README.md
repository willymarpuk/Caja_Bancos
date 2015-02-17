Caja_Bancos
===========
Universidad Nacional de Itapúa- Facultad de ingenieria
Sistema de Gestión - Prof Doc. Horacio Kuna
Sistema de caja y bancos

Enunciado del modulo 
____________________
Se desea desarrollar un sistema de Caja y Bancos para una empresa que se dedica al ensamblado 

y venta de computadoras. Las características funcionales del sistema son las siguientes:

La empresa tiene muchas cajas, cada caja tiene un proceso de apertura de la caja y al 

final del día de cierre de la caja, una vez cerrada no se pueden realizar operaciones en la 

misma en ese día.

En la caja se debe registrar al momento de la apertura de la misma el total de efectivo y 

de cheques.

Cada vez que se cobra desde la cuenta corriente ventas se ingresa en forma automática 

en la caja los valores, en el caso de cobrarse en cheques se registra cada uno de los 

valores ingresados.

El sistema debe prever “movimientos varios de caja, podrán ser egresos o ingresos 

(tanto de efectivo como de cheques), los movimientos varios de caja podrán ser por 

diferentes motivos, por ejemplo egresos por retiro, ingreso por aporte de los socios, etc. 

El sistema debe emitir un libro de caja, el mismo registra el saldo inicial de efectivo y 

cheques y los movimientos de caja, tanto de ingreso (por cobro o movimientos varios) o 

de egreso (por depósito bancario o movimientos varios), o sea cada movimiento de caja 

debe ser registrado en un renglón del libro de caja. En el caso que una factura de ventas 

se cobre con varios cheques y efectivo, se debe registrar cada cheque en un renglón del 

libro de caja y un renglón por el efectivo, en el libro de caja debe figurar el número de 

cheque, el importe, el tipo de valor, el concepto (factura que se cobra por ejemplo o tipo 

de movimiento cario de caja) y la fecha. Al final del libro de caja debe figurar el saldo 

final de cheques y efectivo, al cerrar el libro de caja el saldo final de los valores deberá 

ser el saldo inicial del libro del día siguiente.

Los egresos de caja podrán realizarse a través de depósitos bancarios o movimientos 

varios de caja y por pago en efectivo a proveedores.

La empresa trabaja con muchos bancos y en cada banco puede haber muchas cuentas 

bancarias. El sistema debe considerar la apertura de esas cuentas bancarias.

La empresa realiza depósitos bancarios (que serán automáticamente egresos de la caja), 

los depósitos bancarios se realizan con una “boleta de depósito”, esa boleta registra los 

depósitos del día para cada cuenta de un banco, o sea en una misma boleta de depósito 

no se puede registrar depósitos de más de una cuenta bancaria, la boleta de depósito 

tiene el número de cuenta bancaria, el banco, un numero de depósito, y en una boleta 

se pueden registrar muchos cheques que se depositen en esa cuenta (los cheques y 

efectivo siempre salen de alguna de las cajas que tiene la empresa) y un renglón donde 

se registra el efectivo que se deposita ese día en esa cuenta bancaria.

La empresa le paga a los proveedores en efectivo (que siempre sale de alguna 

caja) o con cheques propios, nunca se paga con cheques de terceros que se 

encuentran en la caja producto del pago de clientes, es decir solo se puede pagar 

a un proveedor en efectivo o con cheque propios, es decir cheques de alguna de 

las cuentas bancarias que tiene la empresa.

El sistema debe prever que se realicen “Movimientos varios de bancos” que podrán ser 

de ingresos o egresos, por ejemplo un egreso podrá ser “Gastos bancarios” o “intereses 

por cheque rechazado”.

El sistema debe emitir un libro de bancos por cada cuenta de cada banco, el libro 

podrá emitirse por día, deberá registrar el saldo de inicio, un renglón por cada cheque 

depositado o efectivo depositado, cada movimiento vario de banco (ingreso o egreso), 

y cada cheque emitido de esa cuenta con el objetivo de pagar a un proveedor, en el 

libro de bancos debe registrarse la fecha, el tipo de valor el importe y un concepto que 

especifique el origen del movimiento.

Estado del Proyecto

Se ha tenido bastante problemas con el diseño según los requerimientos del enunciado ya que nunca antes habíamos visto un sistema de tal tipo ni teoría en las clases de Contabilidad, lo cual dificulto mucho y tardamos mucho tiempo en realizarlo. Hemos también tenido problemas en la hora de diseño de interfaz para el usuario, con los pocos conocimientos de programación y de diseño que cada uno tenia decidimos tener el costado izquierdo acceso a las distintas partes que consta un modulo de caja y banco, y agregar varios modals o popups en caso de se que quisiera agregar nuevos datos sin estar cambiando constantemente de ventanas.

No se logro lo siguiente:
*Manejo de Roles para los usuarios y sus asignación de permisos segun el rol.
*Usuario que esta realizando modificaciones en el log de auditoria.
*Reportes Filtrados.
*Validaciones del lado del Cliente.
*Asiento Automático.
*Calculo diario de los movimientos de caja y banco.
*Realizar correctamente la apertura y el cierre correctamente de caja.
*No se llego a implementar el libro de bancos.
