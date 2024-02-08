-- Utilizando o Before
-- Adicionando o ASSERT para fazer validação de que não pode ter um salario maior do que os que já estão na tabela

CREATE FUNCTION cria_instrutor_trigger() RETURNS TRIGGER AS $$
	DECLARE
		media_salarial DECIMAL;
		instrutores_recebem_menos INTEGER DEFAULT 0;
		total_instrutores INTEGER DEFAULT 0;
		salario DECIMAL;
		percentual DECIMAL(5, 2);
	BEGIN
		SELECT AVG(instrutor.salario) 
			INTO media_salarial 
			FROM instrutor 
			WHERE id <> NEW.id;
			
		IF NEW.salario > media_salarial THEN
			INSERT INTO log_instrutores (informacoes) 
			VALUES (NEW.nome || ' recebe acima da média');
		END IF;
		
		FOR salario IN SELECT instrutor.salario 
			FROM instrutor 
			WHERE id <> NEW.id
			LOOP total_instrutores := total_instrutores + 1;
			
			IF NEW.salario > salario THEN
				instrutores_recebem_menos := instrutores_recebem_menos + 1;
			END IF;
		END LOOP;
		
		percentual = instrutores_recebem_menos::DECIMAL / total_instrutores::DECIMAL * 100;
		
		ASSERT percentual < 100::DECIMAL, 'Instrutores novos não podem receber mais do que o teto';
		
		
		INSERT INTO log_instrutores (informacoes) 
			VALUES (NEW.nome || ' recebe mais do que ' || percentual || '% da grade de instrutores');
		RETURN NEW;
			
			RETURN NEW;
	END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER cria_log_instrutores_before BEFORE INSERT ON instrutor
	FOR EACH ROW EXECUTE FUNCTION cria_instrutor_trigger();
	