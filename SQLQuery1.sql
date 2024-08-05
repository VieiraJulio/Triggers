--TRIGGER DML 
CREATE OR ALTER TRIGGER tgClienteAlterado
ON dCliente 
AFTER INSERT, UPDATE, DELETE
AS
BEGIN

	PRINT 'Os dados da tabela foram alterados'

END


SELECT * FROM dCliente

INSERT INTO dCliente(nome_cliente,genero, data_de_nascimento, cpf) 
VALUES
	('Julio Stefano','M','16/04/2000', 11122233345)

UPDATE dCliente
SET cpf = '111.222.333-46'
WHERE id_cliente = 11

DELETE FROM dCliente
WHERE id_cliente = 11