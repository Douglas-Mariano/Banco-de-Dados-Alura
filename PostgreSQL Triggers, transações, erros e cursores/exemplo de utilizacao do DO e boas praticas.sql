-- Comando DO

-- É utilizado para executar um script pontual, que não vai ser mais executado(para gerar um relatório)
-- Ou  é quando precisamos testar uma função que estamos criando antes de efetivamente criar.
-- Então crio o DO e defino todo o corpo, vou executando, vou corrigindo os erros que vou causando, 
-- e no final minha função está pronta, só venho aqui e ao invés de utilizar o DO crio todo aquele cabeçalho de CREATE FUNCTION.

-- O DO declara um bloco de código sem retorno. 
-- Para recuperar o resultado que precisávamos, utilizamos a funcionalidade de mensagens com o RAISE.

DO $$
	DECLARE
		cursor_salarios refcursor;
		salario DECIMAL;
		total_instrutores INTEGER DEFAULT 0;
		instrutores_recebem_menos INTEGER DEFAULT 0;
		percentual DECIMAL(5, 2);
	BEGIN
		SELECT instrutores_internos(5) INTO cursor_salarios;
		LOOP
			FETCH cursor_salarios INTO salario;
			EXIT WHEN NOT FOUND;
			
			total_instrutores := total_instrutores + 1;
		
			IF NEW.salario > salario THEN
				instrutores_recebem_menos := instrutores_recebem_menos + 1;
			END IF;
		END LOOP;
		percentual = instrutores_recebem_menos::DECIMAL / total_instrutores::DECIMAL * 100;
		
		RAISE NOTICE 'percentual: % %%', percentual;
	END;
$$;

-- Boas Práticas

-- Uma das boas práticas sugeridas foi utilizar Early Return.
-- Documentação https://www.alura.com.br/artigos/quanto-mais-simples-melhor

