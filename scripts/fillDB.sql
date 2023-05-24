-- Adminer 4.8.1 PostgreSQL 14.7 (Ubuntu 14.7-0ubuntu0.22.04.1) dump

\connect "gep2";

TRUNCATE "bla";

TRUNCATE "bz";

TRUNCATE "bz_flight_task";

TRUNCATE "cargo";

TRUNCATE "country";
INSERT INTO "country" ("country_id", "name_country") VALUES
(0,	' РФ'),
(1,	'Китай'),
(2,	'США');

TRUNCATE "elem_obj";

TRUNCATE "end_part";

TRUNCATE "flight_data";

TRUNCATE "flight_task";

TRUNCATE "group_obj";
INSERT INTO "group_obj" ("group_obj_id", "type_group_obj_id", "country_id", "name_group_obj", "coord_x", "coord_y") VALUES
(0,	0,	0,	'конкретный_завод',	255,	125),
(1,	1,	2,	'конкретный_аэропорт',	1253,	23),
(2,	1,	1,	'конкретный_аэропорт',	2424,	211);

TRUNCATE "kp";

TRUNCATE "point_target";

TRUNCATE "ref_route";

TRUNCATE "skn";

TRUNCATE "smk";

TRUNCATE "source_data";
INSERT INTO "source_data" ("source_data_id", "group_obj_id", "type_source_data_id", "source_data_path", "data_create", "checked") VALUES
(0,	0,	0,	'./source_data/1.png',	'2023-04-01',	0),
(1,	0,	0,	'./source_data/2.png',	'2023-04-01',	0),
(2,	1,	0,	'./source_data/3.png',	'2023-04-01',	0);

TRUNCATE "storage_bla";

TRUNCATE "storage_cargo";

TRUNCATE "storage_skn";

TRUNCATE "storage_smk";

TRUNCATE "type_aim";

TRUNCATE "type_bla";

TRUNCATE "type_cargo";

TRUNCATE "type_etalon";

TRUNCATE "type_group_obj";
INSERT INTO "type_group_obj" ("type_group_obj_id", "name_type_group_obj") VALUES
(0,	'завод'),
(1,	'аэропорт');

TRUNCATE "type_skn";

TRUNCATE "type_smk";

TRUNCATE "type_source_data";
INSERT INTO "type_source_data" ("type_source_data_id", "name_type_source_data") VALUES
(0,	'карта');

TRUNCATE "type_world_map";

TRUNCATE "vehicle_bla";

TRUNCATE "vehicle_bla_type_bla";

TRUNCATE "vf";

TRUNCATE "world_map";

TRUNCATE "zi";

TRUNCATE "zk";

TRUNCATE "zzp";

TRUNCATE "zzpr";

-- 2023-04-03 22:09:18.573139+03