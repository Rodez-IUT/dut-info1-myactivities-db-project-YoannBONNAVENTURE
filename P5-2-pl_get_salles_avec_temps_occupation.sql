CREATE OR REPLACE FUNCTION gds.pl_get_salles_avec_temps_occupation (
    curs refcursor
) RETURNS TABLE(nom_salle varchar(250), temps_occupation interval) AS $$
BEGIN
		OPEN curs FOR SELECT nom, tps_occupation 
			FROM gds.salle salle, gds.pl_calcule_temps_occupation(salle.nom) tps_occupation
			ORDER BY tps_occupation DESC, nom;
		RETURN;
	END;
$$
LANGUAGE plpgsql;