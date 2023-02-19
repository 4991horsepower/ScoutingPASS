-- Table: public.teleop

-- DROP TABLE IF EXISTS public.teleop;

CREATE TABLE IF NOT EXISTS public.teleop
(
    match_id integer NOT NULL,
    grid_id integer NOT NULL,
    was_fed_pieces boolean NOT NULL DEFAULT 'false',
    was_defended boolean NOT NULL DEFAULT 'false',
    who_defended character varying(200) COLLATE pg_catalog."default",
    floor_pickup character(1) COLLATE pg_catalog."default" NOT NULL DEFAULT 'x'::bpchar
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.teleop
    OWNER to root;