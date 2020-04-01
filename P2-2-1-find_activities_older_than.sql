 - *Nom de la fonction* :  
    "find_activities_older_than"  
    - *Argument de la fonction* :  
    "old_date" de type "date"  
    - *Description* :   
    la fonction retourne la liste des activités qui n'ont pas été modifiées depuis la date "old_date" passée en paramètre.

    CREATE FUNCTION find_activities_older_than (
        old_date DATE)
    RETURNS activity AS $$
    WHERE modification_date < old_date
    RETURNING activity;
    $$