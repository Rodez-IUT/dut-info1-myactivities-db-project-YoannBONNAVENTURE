CREATE OR REPLACE FUNCTION gds.insert_reservation (
    une_date_debut timestamp without time ZONE,
    une_date_fin timestamp without time ZONE,
    un_nom_de_salle character varying(250)
) RETURNS gds.reservation AS $$
INSERT INTO gds.reservation(id, date_debut, date_fin, date_creation, date_modification, salle_id)
VALUES (nextval('gds.reservation_seq'),une_date_debut, 
				une_date_fin,now(),now(), gds.get_salle_id(un_nom_de_salle)
                )
returning *;
$$
LANGUAGE SQL;

