-- Criando Cursors para a function "exemplo da função com cursor ao invés do for mais usual nesse caso usar o for"
-- Documentação para consulta: https://www.postgresql.org/docs/current/plpgsql-control-structures.html

CREATE FUNCTION instrutores_internos(id_instrutor INTEGER) RETURNS refcursor AS $$
	DECLARE
		cursor_salarios refcursor;
	BEGIN
		OPEN cursor_salarios FOR SELECT instrutor.salario FROM instrutor WHERE id <> id_instrutor AND salario > 0;
		
		RETURN cursor_salarios;
	END;
$$ LANGUAGE plpgsql;

-- Diferença entre a instrução FETCH e a instrução MOVE:
-- FETCH além de mover o “ponteiro” do cursor, devolve o valor após mover. 
-- O MOVE apenas move o “ponteiro” sem devolver nenhum valor
-- https://www.postgresql.org/docs/current/plpgsql-cursors.html#PLPGSQL-CURSOR-USING

-- Utilizando o cursor

CREATE FUNCTION cria_instrutor_trigger() RETURNS TRIGGER AS $$
	DECLARE
		media_salarial DECIMAL;
		instrutores_recebem_menos INTEGER DEFAULT 0;
		total_instrutores INTEGER DEFAULT 0;
		salario DECIMAL;
		percentual DECIMAL(5, 2);
		cursor_salarios refcursor;
	BEGIN
		SELECT AVG(instrutor.salario) 
			INTO media_salarial FROM instrutor WHERE id <> NEW.id;
			
		IF NEW.salario > media_salarial THEN
			INSERT INTO log_instrutores (informacoes) VALUES (NEW.nome || ' recebe acima da média');
		END IF;
		
		SELECT instrutores_internos(NEW.id) INTO cursor_salarios;
		
		LOOP
			FETCH cursor_salarios INTO salario;
			EXIT WHEN NOT FOUND;
			
			total_instrutores := total_instrutores + 1;
		
			IF NEW.salario > salario THEN
				instrutores_recebem_menos := instrutores_recebem_menos + 1;
			END IF;
		END LOOP;
		
		percentual = instrutores_recebem_menos::DECIMAL / total_instrutores::DECIMAL * 100;
		
		ASSERT percentual < 100::DECIMAL, 'Instrutores novos não podem receber mais do que os antigos';
		
		
		INSERT INTO log_instrutores (informacoes) 
			VALUES (NEW.nome || ' recebe mais do que ' || percentual || '% da grade de instrutores');
		RETURN NEW;
			
			RETURN NEW;
	END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER cria_log_instrutores_before BEFORE INSERT ON instrutor
	FOR EACH ROW EXECUTE FUNCTION cria_instrutor_trigger();
	

INSERT INTO instrutor (nome, salario) VALUES ('João', 10000);