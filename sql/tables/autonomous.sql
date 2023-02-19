-- Table: public.autonomous

-- DROP TABLE IF EXISTS public.autonomous;

CREATE TABLE IF NOT EXISTS public.autonomous
(
    match_id integer NOT NULL,
    grid_id integer NOT NULL,
    cross_charging_station boolean NOT NULL DEFAULT 'false',
    mobility boolean NOT NULL DEFAULT 'false',
    docked character(1) COLLATE pg_catalog."default" NOT NULL DEFAULT 'x'::bpchar
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.autonomous
    OWNER to root;