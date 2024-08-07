--TRIGGER DML 
/*
CREATE OR ALTER TRIGGER tgClienteAlterado
ON dCliente 
AFTER INSERT, UPDATE, DELETE
AS
BEGIN

	PRINT 'Os dados da tabela foram alterados'

END

DROP TRIGGER TgClienteAlterado


SELECT * FROM dCliente

INSERT INTO dCliente(nome_cliente,genero, data_de_nascimento, cpf) 
VALUES
	('Luiz Felipe','M','16/08/2002', 11122233346)

UPDATE dCliente
SET cpf = '111.222.333-46'
WHERE id_cliente = 11

DELETE FROM dCliente
WHERE id_cliente = 11

-- 


CREATE OR ALTER TRIGGER tgClientes
ON dCliente 
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
	IF EXISTS (SELECT * FROM INSERTED) AND EXISTS (SELECT * FROM DELETED)
		PRINT 'Os dados da tabela foram alterados - UPDATE'
	ELSE IF EXISTS (SELECT * FROM INSERTED)
		PRINT 'Os dados foram INSERIDOS na tabela'
	ELSE IF EXISTS (SELECT * FROM DELETED)
		PRINT 'Os dados foram Excluidos na tabela'

END


INSERT INTO dCliente(nome_cliente,genero, data_de_nascimento, cpf) 
VALUES
	('Julio Stefano','M','16/04/2002', '111.333.333-99')

DELETE FROM dCliente
WHERE id_cliente = 12


*/

-- Criando uma Trigger com INSTEAD OF 

SELECT FORMAT(GETDATE(), 'dddd')

CREATE OR ALTER TRIGGER tgControleRegistros 
ON dCliente
INSTEAD OF INSERT
AS
BEGIN
	IF  FORMAT(GETDATE(), 'dddd') IN ('sábado', 'domingo')
	BEGIN
		RAISERROR('O cadastro de clientes só pode ser feito em dias úteis',1,1)
		ROLLBACK
	END


END