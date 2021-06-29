INSERT INTO `jobs` (name, label) VALUES
	('offpolice','OFF-Duty: LSPD'),
    ('offambulance', 'OFF-Duty: Ambulance')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('offpolice',0,'recruit','Recrue',20,'{}','{}'),
	('offpolice',1,'officer','Officier',30,'{}','{}'),
	('offpolice',2,'sergeant','Sergent',40,'{}','{}'),
	('offpolice',3,'lieutenant','Lieutenant',50,'{}','{}'),
	('offpolice',4,'boss','Commandant',60,'{}','{}'),
    ('offambulance', 0, 'ambulance', 'Ambulance', 20,'{}','{}'),
    ('offambulance', 1, 'doctor', 'Doctor', 30,'{}','{}'),
    ('offambulance', 2, 'chief_doctor', 'Chief Doctor', 40,'{}','{}'),
    ('offambulance', 3, 'boss', 'Boss', 60,'{}','{}')
;