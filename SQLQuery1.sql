--TRIGGER DML 
CREATE OR ALTER TRIGGER tgClienteAlterado
ON dCliente 
AFTER INSERT, UPDATE, DELETE
AS
BEGIN

	PRINT 'Os dados da tabela foram alterados'

END