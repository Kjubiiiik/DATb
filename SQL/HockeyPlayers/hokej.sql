CREATE TABLE hockeyPlayers(
    id AUTOINCREMENT PRIMARY KEY,
    fname VARCHAR(50) NOT NULL,
    lname VARCHAR(50) NOT NULL,
    team VARCHAR(50) NOT NULL,
)

DELIMITER //

CREATE PROCEDURE insert_players(
    p_fname VARCHAR(50) NOT NULL,
    p_lname VARCHAR(50) NOT NULL,
    p_team VARCHAR(50) NOT NULL,
)

BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SET autocommit = 1;
        SELECT 'Chyba při vkládání záznamu' AS zprava;
    END;

    SET autocommit = 0;

    START TRANSACTION;

    INSERT INTO hockeyPlayers(fname, lname, p_team) VALUES (p_model, p_speed, p_horse_power);
    COMMIT;
    SET autocommit = 1;
END//

DELIMITER ;

CALL insert_vehicle("David", "Pastrňák", "Boston Bruins")
CALL insert_vehicle("Pavel", "Zacha", NULL)

-- Insert Davida Pastrňáka se zapíše bez chyby.
-- Insert Pavla Zacha se nezapíše a vypíše chybu "Chyba při vkládání záznamu"
