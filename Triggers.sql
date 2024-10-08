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




-- Criando uma Trigger com INSTEAD OF 
-- APLICADA SOMENTE EM CADASTROS EM DIAS �TEIS

SELECT FORMAT(GETDATE(), 'dddd')

CREATE OR ALTER TRIGGER tgControleRegistros 
ON dCliente
INSTEAD OF INSERT, UPDATE, DELETE
AS
BEGIN
	IF  FORMAT(GETDATE(), 'dddd') IN ('s�bado', 'domingo')
	BEGIN
		RAISERROR('O cadastro de clientes s� pode ser feito em dias �teis',1,1)
		ROLLBACK
	END
	ELSE
	BEGIN
		
		INSERT INTO dCliente(nome_cliente,genero, data_de_nascimento, cpf)
		SELECT nome_cliente,genero, data_de_nascimento, cpf FROM INSERTED 
	END

END


INSERT INTO dCliente(nome_cliente,genero, data_de_nascimento, cpf) 
VALUES
	('Vinicius Carvalho','M','16/07/1996', '111.444.366-99')


-- Habilitando uma/ALL Trigger e excluindo : 

DISABLE TRIGGER tgControleRegistros ON dCliente

ENABLE TRIGGER ALL  ON dCliente

-- Drop: 

DROP TRIGGER tgControleRegistros


*/

-- TRIGGER DDL CREATE, DROP E ALTER


CREATE OR ALTER TRIGGER tgRecusartabelas
ON DATABASE
FOR CREATE_TABLE, ALTER_TABLE, DROP_TABLE
AS
BEGIN
	
	PRINT 'N�o � permitado altera��o, exclus�o e inclus�o de tabelas'
	ROLLBACK
END

CREATE TABLE Teste(ID INT)
DROP TABLE Teste
