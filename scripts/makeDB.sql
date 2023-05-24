-- Adminer 4.8.1 PostgreSQL 14.7 (Ubuntu 14.7-0ubuntu0.22.04.1) dump

DROP TABLE IF EXISTS "bla";
CREATE TABLE "public"."bla" (
    "bla_id" integer NOT NULL,
    "type_bla_id" integer NOT NULL,
    "skn_id" integer NOT NULL,
    "cargo_id" integer NOT NULL,
    "smk_id" integer NOT NULL,
    "max_time_flight" integer NOT NULL,
    "speed" integer NOT NULL,
    "min_angle" integer NOT NULL,
    "max_angle" integer NOT NULL,
    "max_ppm" integer NOT NULL,
    "min_time_stab" integer NOT NULL,
    "min_r" integer NOT NULL,
    "data_angle_start" integer NOT NULL,
    "start_dist" integer NOT NULL,
    CONSTRAINT "bla_pkey" PRIMARY KEY ("bla_id")
) WITH (oids = false);


DROP TABLE IF EXISTS "bz";
CREATE TABLE "public"."bz" (
    "bz_id" integer NOT NULL,
    "vehicle_bla_id" integer NOT NULL,
    "flight_data_id" integer NOT NULL,
    "data_create" date NOT NULL,
    CONSTRAINT "bz_pkey" PRIMARY KEY ("bz_id")
) WITH (oids = false);


DROP TABLE IF EXISTS "bz_flight_task";
CREATE TABLE "public"."bz_flight_task" (
    "bz_flight_task_id" integer NOT NULL,
    "bz_id" integer NOT NULL,
    "flight_task_id" integer NOT NULL,
    CONSTRAINT "bz_flight_task_pkey" PRIMARY KEY ("bz_flight_task_id")
) WITH (oids = false);


DROP TABLE IF EXISTS "cargo";
CREATE TABLE "public"."cargo" (
    "cargo_id" integer NOT NULL,
    "name_cargo" character varying(50) NOT NULL,
    "type_cargo_id" integer NOT NULL,
    CONSTRAINT "cargo_pkey" PRIMARY KEY ("cargo_id")
) WITH (oids = false);


DROP TABLE IF EXISTS "country";
CREATE TABLE "public"."country" (
    "country_id" integer NOT NULL,
    "name_country" character varying(50) NOT NULL,
    CONSTRAINT "country_pkey" PRIMARY KEY ("country_id")
) WITH (oids = false);


DROP TABLE IF EXISTS "elem_obj";
CREATE TABLE "public"."elem_obj" (
    "elem_obj_id" integer NOT NULL,
    "group_obj_id" integer NOT NULL,
    "type_elem_obj" integer NOT NULL,
    "name_elem_obj" character varying(50) NOT NULL,
    "mean_height" integer NOT NULL,
    "coord_abris" integer,
    CONSTRAINT "elem_obj_pkey" PRIMARY KEY ("elem_obj_id")
) WITH (oids = false);


DROP TABLE IF EXISTS "end_part";
CREATE TABLE "public"."end_part" (
    "end_part_id" integer NOT NULL,
    "point_target_id" integer NOT NULL,
    "type_aim_id" integer NOT NULL,
    "etalon_path" character varying(50) NOT NULL,
    "alpha_azim" double precision NOT NULL,
    "alpha_pik" double precision NOT NULL,
    CONSTRAINT "end_part_pkey" PRIMARY KEY ("end_part_id")
) WITH (oids = false);


DROP TABLE IF EXISTS "flight_data";
CREATE TABLE "public"."flight_data" (
    "flight_data_id" integer NOT NULL,
    "vehicle_bla_id" integer NOT NULL,
    "point_start" integer NOT NULL,
    "rzp_path" character varying(50) NOT NULL,
    "date_create" date NOT NULL,
    CONSTRAINT "flight_data_pkey" PRIMARY KEY ("flight_data_id")
) WITH (oids = false);


DROP TABLE IF EXISTS "flight_task";
CREATE TABLE "public"."flight_task" (
    "flight_task_id" integer NOT NULL,
    "end_part_id" integer NOT NULL,
    "ref_route_id" integer NOT NULL,
    "bla_id" integer NOT NULL,
    "data_create" date NOT NULL,
    CONSTRAINT "flight_task_pkey" PRIMARY KEY ("flight_task_id")
) WITH (oids = false);


DROP TABLE IF EXISTS "group_obj";
CREATE TABLE "public"."group_obj" (
    "group_obj_id" integer NOT NULL,
    "type_group_obj_id" integer NOT NULL,
    "country_id" integer NOT NULL,
    "name_group_obj" character varying(50) NOT NULL,
    "coord_x" integer NOT NULL,
    "coord_y" integer NOT NULL,
    CONSTRAINT "group_obj_pkey" PRIMARY KEY ("group_obj_id")
) WITH (oids = false);


DROP TABLE IF EXISTS "kp";
CREATE TABLE "public"."kp" (
    "kp_id" integer NOT NULL,
    "kp_name" character varying(50) NOT NULL,
    "kp_path" character varying(50) NOT NULL,
    CONSTRAINT "kp_pkey" PRIMARY KEY ("kp_id")
) WITH (oids = false);


DROP TABLE IF EXISTS "point_target";
CREATE TABLE "public"."point_target" (
    "point_target" integer NOT NULL,
    "elem_obj_id" integer NOT NULL,
    "coord_x" integer NOT NULL,
    "coord_y" integer NOT NULL,
    CONSTRAINT "point_target_pkey" PRIMARY KEY ("point_target")
) WITH (oids = false);


DROP TABLE IF EXISTS "ref_route";
CREATE TABLE "public"."ref_route" (
    "ref_route_id" integer NOT NULL,
    "ref_route_path" character varying(50) NOT NULL,
    CONSTRAINT "ref_route_pkey" PRIMARY KEY ("ref_route_id")
) WITH (oids = false);


DROP TABLE IF EXISTS "skn";
CREATE TABLE "public"."skn" (
    "skn_id" integer NOT NULL,
    "type_skn_id" integer NOT NULL,
    "name_skn" character varying(50) NOT NULL,
    CONSTRAINT "skn_pkey" PRIMARY KEY ("skn_id")
) WITH (oids = false);


DROP TABLE IF EXISTS "smk";
CREATE TABLE "public"."smk" (
    "smk_id" integer NOT NULL,
    "name_smk" character varying(50) NOT NULL,
    "size_x" integer NOT NULL,
    "size_y" integer NOT NULL,
    "type_smk_id" integer NOT NULL,
    CONSTRAINT "smk_pkey" PRIMARY KEY ("smk_id")
) WITH (oids = false);


DROP TABLE IF EXISTS "source_data";
CREATE TABLE "public"."source_data" (
    "source_data_id" integer NOT NULL,
    "group_obj_id" integer NOT NULL,
    "type_source_data_id" integer NOT NULL,
    "source_data_path" character varying(50) NOT NULL,
    "data_create" date NOT NULL,
    "checked" integer NOT NULL,
    CONSTRAINT "source_data_pkey" PRIMARY KEY ("source_data_id")
) WITH (oids = false);


DROP TABLE IF EXISTS "storage_bla";
CREATE TABLE "public"."storage_bla" (
    "storage_bla_id" integer NOT NULL,
    "bla_id" integer NOT NULL,
    "amount" integer NOT NULL,
    CONSTRAINT "storage_bla_pkey" PRIMARY KEY ("storage_bla_id")
) WITH (oids = false);


DROP TABLE IF EXISTS "storage_cargo";
CREATE TABLE "public"."storage_cargo" (
    "storage_cargo_id" integer NOT NULL,
    "cargo_id" integer NOT NULL,
    "amount" integer NOT NULL,
    CONSTRAINT "storage_cargo_pkey" PRIMARY KEY ("storage_cargo_id")
) WITH (oids = false);


DROP TABLE IF EXISTS "storage_skn";
CREATE TABLE "public"."storage_skn" (
    "storage_skn_id" integer NOT NULL,
    "smk_id" integer NOT NULL,
    "amount" integer NOT NULL,
    CONSTRAINT "storage_skn_pkey" PRIMARY KEY ("storage_skn_id")
) WITH (oids = false);


DROP TABLE IF EXISTS "storage_smk";
CREATE TABLE "public"."storage_smk" (
    "storage_smk_id" integer NOT NULL,
    "smk_id" integer NOT NULL,
    "amount" integer NOT NULL,
    CONSTRAINT "storage_smk_pkey" PRIMARY KEY ("storage_smk_id")
) WITH (oids = false);


DROP TABLE IF EXISTS "type_aim";
CREATE TABLE "public"."type_aim" (
    "type_aim_id" integer NOT NULL,
    "type_etalon_id" integer NOT NULL,
    "skn_id" integer NOT NULL,
    "name_type_aim" character varying(50) NOT NULL,
    CONSTRAINT "type_aim_pkey" PRIMARY KEY ("type_aim_id")
) WITH (oids = false);


DROP TABLE IF EXISTS "type_bla";
CREATE TABLE "public"."type_bla" (
    "type_bla_id" integer NOT NULL,
    "name_type_bla" character varying(50) NOT NULL,
    CONSTRAINT "type_bla_pkey" PRIMARY KEY ("type_bla_id")
) WITH (oids = false);


DROP TABLE IF EXISTS "type_cargo";
CREATE TABLE "public"."type_cargo" (
    "type_cargo_id" integer NOT NULL,
    "name_type_cargo" character varying(50) NOT NULL,
    CONSTRAINT "type_cargo_pkey" PRIMARY KEY ("type_cargo_id")
) WITH (oids = false);


DROP TABLE IF EXISTS "type_etalon";
CREATE TABLE "public"."type_etalon" (
    "type_etalon_id" integer NOT NULL,
    "type_source_data_id" integer NOT NULL,
    "name_type_etalon" character varying(50) NOT NULL,
    CONSTRAINT "type_etalon_pkey" PRIMARY KEY ("type_etalon_id")
) WITH (oids = false);


DROP TABLE IF EXISTS "type_group_obj";
CREATE TABLE "public"."type_group_obj" (
    "type_group_obj_id" integer NOT NULL,
    "name_type_group_obj" character varying(50),
    CONSTRAINT "type_group_obj_pkey" PRIMARY KEY ("type_group_obj_id")
) WITH (oids = false);


DROP TABLE IF EXISTS "type_skn";
CREATE TABLE "public"."type_skn" (
    "type_skn_id" integer NOT NULL,
    "name_type_skn" character varying(50) NOT NULL,
    "sknskn_id" integer NOT NULL,
    CONSTRAINT "type_skn_pkey" PRIMARY KEY ("type_skn_id")
) WITH (oids = false);


DROP TABLE IF EXISTS "type_smk";
CREATE TABLE "public"."type_smk" (
    "type_smk_id" integer NOT NULL,
    "name_type_smk" character varying(50) NOT NULL,
    CONSTRAINT "type_smk_pkey" PRIMARY KEY ("type_smk_id")
) WITH (oids = false);


DROP TABLE IF EXISTS "type_source_data";
CREATE TABLE "public"."type_source_data" (
    "type_source_data_id" integer NOT NULL,
    "name_type_source_data" character varying(50) NOT NULL,
    CONSTRAINT "type_source_data_pkey" PRIMARY KEY ("type_source_data_id")
) WITH (oids = false);


DROP TABLE IF EXISTS "type_world_map";
CREATE TABLE "public"."type_world_map" (
    "type_world_map_id" integer NOT NULL,
    "name_type_world_map" character varying(50) NOT NULL,
    CONSTRAINT "type_world_map_pkey" PRIMARY KEY ("type_world_map_id")
) WITH (oids = false);


DROP TABLE IF EXISTS "vehicle_bla";
CREATE TABLE "public"."vehicle_bla" (
    "vehicle_bla_id" integer NOT NULL,
    "name_vehicle_bla" character varying(50) NOT NULL,
    "max_distance" integer NOT NULL,
    CONSTRAINT "vehicle_bla_pkey" PRIMARY KEY ("vehicle_bla_id")
) WITH (oids = false);


DROP TABLE IF EXISTS "vehicle_bla_type_bla";
CREATE TABLE "public"."vehicle_bla_type_bla" (
    "vehicle_bla_type_bla_id" integer NOT NULL,
    "vehicle_bla_id" integer NOT NULL,
    "type_bla_id" integer NOT NULL,
    CONSTRAINT "vehicle_bla_type_bla_pkey" PRIMARY KEY ("vehicle_bla_type_bla_id")
) WITH (oids = false);


DROP TABLE IF EXISTS "vf";
CREATE TABLE "public"."vf" (
    "vf_id" integer NOT NULL,
    "name_vf" character varying(50) NOT NULL,
    "coord_x" integer NOT NULL,
    "coord_y" integer NOT NULL,
    "storage_bla_id" integer NOT NULL,
    "storage_skn_id" integer NOT NULL,
    "storage_cargo_id" integer NOT NULL,
    "storage_smk_id" integer NOT NULL,
    CONSTRAINT "vf_pkey" PRIMARY KEY ("vf_id")
) WITH (oids = false);


DROP TABLE IF EXISTS "world_map";
CREATE TABLE "public"."world_map" (
    "world_map_id" integer NOT NULL,
    "world_map_name" character varying(50) NOT NULL,
    "world_map_path" character varying(50) NOT NULL,
    "type_world_map_id" integer NOT NULL,
    CONSTRAINT "world_map_pkey" PRIMARY KEY ("world_map_id")
) WITH (oids = false);

COMMENT ON COLUMN "public"."world_map"."type_world_map_id" IS 'foreign key';


DROP TABLE IF EXISTS "zi";
CREATE TABLE "public"."zi" (
    "zi_id" integer NOT NULL,
    "zi_name" character varying(50) NOT NULL,
    "zi_path" character varying(50) NOT NULL,
    "type_smk_id" integer NOT NULL,
    CONSTRAINT "zi_pkey" PRIMARY KEY ("zi_id")
) WITH (oids = false);


DROP TABLE IF EXISTS "zk";
CREATE TABLE "public"."zk" (
    "zk_id" integer NOT NULL,
    "flight_task_id" integer NOT NULL,
    "zk_path" character varying(50) NOT NULL,
    CONSTRAINT "zk_pkey" PRIMARY KEY ("zk_id")
) WITH (oids = false);


DROP TABLE IF EXISTS "zzp";
CREATE TABLE "public"."zzp" (
    "zzpr_id" integer NOT NULL,
    "zzpr_name" character varying(50) NOT NULL,
    "zzpr_path" character varying(50) NOT NULL,
    CONSTRAINT "zzp_pkey" PRIMARY KEY ("zzpr_id")
) WITH (oids = false);


DROP TABLE IF EXISTS "zzpr";
CREATE TABLE "public"."zzpr" (
    "zzpr_id" integer NOT NULL,
    "zzpr_name" character varying(50) NOT NULL,
    "zzpr_path" character varying(50) NOT NULL,
    CONSTRAINT "zzpr_pkey" PRIMARY KEY ("zzpr_id")
) WITH (oids = false);


ALTER TABLE ONLY "public"."bla" ADD CONSTRAINT "bla_smk" FOREIGN KEY (smk_id) REFERENCES smk(smk_id) NOT DEFERRABLE;
ALTER TABLE ONLY "public"."bla" ADD CONSTRAINT "bla_cargo" FOREIGN KEY (cargo_id) REFERENCES cargo(cargo_id) NOT DEFERRABLE;
ALTER TABLE ONLY "public"."bla" ADD CONSTRAINT "bla_skn" FOREIGN KEY (skn_id) REFERENCES skn(skn_id) NOT DEFERRABLE;
ALTER TABLE ONLY "public"."bla" ADD CONSTRAINT "bla_type_bla" FOREIGN KEY (type_bla_id) REFERENCES type_bla(type_bla_id) NOT DEFERRABLE;

ALTER TABLE ONLY "public"."bz" ADD CONSTRAINT "bz_flight_data" FOREIGN KEY (flight_data_id) REFERENCES flight_data(flight_data_id) NOT DEFERRABLE;
ALTER TABLE ONLY "public"."bz" ADD CONSTRAINT "bz_vehicle_bla" FOREIGN KEY (vehicle_bla_id) REFERENCES vehicle_bla(vehicle_bla_id) NOT DEFERRABLE;

ALTER TABLE ONLY "public"."bz_flight_task" ADD CONSTRAINT "bz_flight_flight_task" FOREIGN KEY (flight_task_id) REFERENCES flight_task(flight_task_id) NOT DEFERRABLE;
ALTER TABLE ONLY "public"."bz_flight_task" ADD CONSTRAINT "bz_flight_bz" FOREIGN KEY (bz_id) REFERENCES bz(bz_id) NOT DEFERRABLE;

ALTER TABLE ONLY "public"."cargo" ADD CONSTRAINT "cargo_type_cargo" FOREIGN KEY (type_cargo_id) REFERENCES type_cargo(type_cargo_id) NOT DEFERRABLE;

ALTER TABLE ONLY "public"."elem_obj" ADD CONSTRAINT "elem_obj_group_obj" FOREIGN KEY (group_obj_id) REFERENCES group_obj(group_obj_id) NOT DEFERRABLE;

ALTER TABLE ONLY "public"."end_part" ADD CONSTRAINT "end_part_point_target" FOREIGN KEY (point_target_id) REFERENCES point_target(point_target) NOT DEFERRABLE;
ALTER TABLE ONLY "public"."end_part" ADD CONSTRAINT "end_part_type_aim" FOREIGN KEY (type_aim_id) REFERENCES type_aim(type_aim_id) NOT DEFERRABLE;

ALTER TABLE ONLY "public"."flight_task" ADD CONSTRAINT "flight_task_ref_route" FOREIGN KEY (ref_route_id) REFERENCES ref_route(ref_route_id) NOT DEFERRABLE;
ALTER TABLE ONLY "public"."flight_task" ADD CONSTRAINT "flight_task_end_part" FOREIGN KEY (end_part_id) REFERENCES end_part(end_part_id) NOT DEFERRABLE;
ALTER TABLE ONLY "public"."flight_task" ADD CONSTRAINT "flight_task_bla" FOREIGN KEY (bla_id) REFERENCES bla(bla_id) NOT DEFERRABLE;

ALTER TABLE ONLY "public"."group_obj" ADD CONSTRAINT "group_obj_country" FOREIGN KEY (country_id) REFERENCES country(country_id) NOT DEFERRABLE;
ALTER TABLE ONLY "public"."group_obj" ADD CONSTRAINT "group_obj_type_group_obj" FOREIGN KEY (type_group_obj_id) REFERENCES type_group_obj(type_group_obj_id) NOT DEFERRABLE;

ALTER TABLE ONLY "public"."point_target" ADD CONSTRAINT "point_target_elem_obj" FOREIGN KEY (elem_obj_id) REFERENCES elem_obj(elem_obj_id) NOT DEFERRABLE;

ALTER TABLE ONLY "public"."smk" ADD CONSTRAINT "smk_type_smk" FOREIGN KEY (type_smk_id) REFERENCES type_smk(type_smk_id) NOT DEFERRABLE;

ALTER TABLE ONLY "public"."source_data" ADD CONSTRAINT "source_data_type_source_data" FOREIGN KEY (type_source_data_id) REFERENCES type_source_data(type_source_data_id) NOT DEFERRABLE;
ALTER TABLE ONLY "public"."source_data" ADD CONSTRAINT "source_data_group_obj" FOREIGN KEY (group_obj_id) REFERENCES group_obj(group_obj_id) NOT DEFERRABLE;

ALTER TABLE ONLY "public"."storage_bla" ADD CONSTRAINT "storage_bla_bla" FOREIGN KEY (bla_id) REFERENCES bla(bla_id) NOT DEFERRABLE;

ALTER TABLE ONLY "public"."storage_cargo" ADD CONSTRAINT "storage_cargo_cargo" FOREIGN KEY (cargo_id) REFERENCES cargo(cargo_id) NOT DEFERRABLE;

ALTER TABLE ONLY "public"."storage_skn" ADD CONSTRAINT "storage_skn_skn" FOREIGN KEY (smk_id) REFERENCES skn(skn_id) NOT DEFERRABLE;

ALTER TABLE ONLY "public"."storage_smk" ADD CONSTRAINT "storage_smk_smk" FOREIGN KEY (smk_id) REFERENCES smk(smk_id) NOT DEFERRABLE;

ALTER TABLE ONLY "public"."type_aim" ADD CONSTRAINT "type_aim_skn" FOREIGN KEY (skn_id) REFERENCES skn(skn_id) NOT DEFERRABLE;
ALTER TABLE ONLY "public"."type_aim" ADD CONSTRAINT "type_aim_type_etalon" FOREIGN KEY (type_etalon_id) REFERENCES type_etalon(type_etalon_id) NOT DEFERRABLE;

ALTER TABLE ONLY "public"."type_etalon" ADD CONSTRAINT "type_etalon_type_source_data" FOREIGN KEY (type_source_data_id) REFERENCES type_source_data(type_source_data_id) NOT DEFERRABLE;

ALTER TABLE ONLY "public"."type_skn" ADD CONSTRAINT "type_skn_skn" FOREIGN KEY (sknskn_id) REFERENCES skn(skn_id) NOT DEFERRABLE;

ALTER TABLE ONLY "public"."vehicle_bla_type_bla" ADD CONSTRAINT "vehicle_bla_vehicle_bla" FOREIGN KEY (vehicle_bla_id) REFERENCES vehicle_bla(vehicle_bla_id) NOT DEFERRABLE;
ALTER TABLE ONLY "public"."vehicle_bla_type_bla" ADD CONSTRAINT "vehicle_bla_type_bla" FOREIGN KEY (type_bla_id) REFERENCES type_bla(type_bla_id) NOT DEFERRABLE;

ALTER TABLE ONLY "public"."vf" ADD CONSTRAINT "vf_storage_cargo" FOREIGN KEY (storage_cargo_id) REFERENCES storage_cargo(storage_cargo_id) NOT DEFERRABLE;
ALTER TABLE ONLY "public"."vf" ADD CONSTRAINT "vf_storage_skn" FOREIGN KEY (storage_skn_id) REFERENCES storage_skn(storage_skn_id) NOT DEFERRABLE;
ALTER TABLE ONLY "public"."vf" ADD CONSTRAINT "vf_storage_smk" FOREIGN KEY (storage_smk_id) REFERENCES storage_smk(storage_smk_id) NOT DEFERRABLE;
ALTER TABLE ONLY "public"."vf" ADD CONSTRAINT "vf_storage_bla" FOREIGN KEY (storage_bla_id) REFERENCES storage_bla(storage_bla_id) NOT DEFERRABLE;

ALTER TABLE ONLY "public"."world_map" ADD CONSTRAINT "world_map_type_world_map" FOREIGN KEY (type_world_map_id) REFERENCES type_world_map(type_world_map_id) NOT DEFERRABLE;

ALTER TABLE ONLY "public"."zi" ADD CONSTRAINT "zi_type_smk(" FOREIGN KEY (type_smk_id) REFERENCES type_smk(type_smk_id) NOT DEFERRABLE;

ALTER TABLE ONLY "public"."zk" ADD CONSTRAINT "zk_flight_task" FOREIGN KEY (flight_task_id) REFERENCES flight_task(flight_task_id) NOT DEFERRABLE;

-- 2023-03-20 15:44:39.247065+03