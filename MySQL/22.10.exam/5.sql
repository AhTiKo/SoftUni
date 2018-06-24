DELIMITER $$
CREATE FUNCTION udf_get_reports_count(employee_id_param INT, status_id_param INT)
RETURNS INT(11)                                  
BEGIN    
	RETURN (SELECT COUNT(id)
					FROM reports
					WHERE employee_id = employee_id_param
					AND status_id = status_id_param);            
END$$