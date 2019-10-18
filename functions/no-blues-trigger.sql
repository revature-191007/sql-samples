
CREATE TABLE IF NOT EXISTS colors (
	id SERIAL PRIMARY KEY,
	color varchar(40)
);

insert into colors (color) values ('green'), ('red'), ('blue'), ('orange'),
	('beige'), ('yellow'), ('black'), ('purple'), ('white'), ('grey'),
	('peach');

insert into colors (color) values ('blue');
update colors set color = 'blue' where color = 'beige';
select * from colors;


















-- TG_OP -- Trigger Operation - Holds kind of operation data
-- NEW -- new row data, data trying to be inserted or updated to
-- OLD -- old row data, data that will be replaced or removed
CREATE OR REPLACE FUNCTION no_blues_process()
RETURNS trigger AS $$
	BEGIN
		IF(TG_OP = 'INSERT') THEN
			IF(UPPER(NEW.color) = 'BLUE') THEN
				RETURN NULL;
			END IF;
		END IF;
		IF(UPPER(NEW.color) = 'BLUE') THEN
			RETURN OLD;
		END IF;
		RETURN NEW;
	END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER no_blues
	BEFORE INSERT OR UPDATE ON colors
	FOR EACH ROW
	EXECUTE PROCEDURE no_blues_process();
