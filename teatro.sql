create table pecas_teatro(
id_peca integer primary key auto_increment,
nome_peca text not null,
descricao text,
duracao float not null
);

create table agendamentos (
id_agendamento integer primary key auto_increment,
id_peca integer,
data_hora datetime,
foreign key (id_peca) references pecas_teatro (id_peca)
);

DELIMITER //

CREATE FUNCTION verificar_disponibilidade(p_data_hora DATETIME)
RETURNS BOOLEAN
DETERMINISTIC
BEGIN
    DECLARE v_count INT;

    -- Contar quantos agendamentos existem para a data e hora fornecida
    SELECT COUNT(*)
    INTO v_count
    FROM agendamentos
    WHERE data_hora = p_data_hora;

    -- Se houver algum agendamento, retornar FALSE; caso contrário, TRUE
    RETURN v_count = 0;
END //

DELIMITER ;

DELIMITER //

CREATE FUNCTION calcular_media_duracao()
RETURNS FLOAT
BEGIN
    DECLARE media_duracao FLOAT;
    
    -- Calcular a média da duração de todas as peças
    SELECT AVG(duracao) INTO media_duracao
    FROM pecas_teatro;
    
    RETURN media_duracao;
END //

DELIMITER ;




 