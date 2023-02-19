-- Table: public.post_match

-- DROP TABLE IF EXISTS public.post_match;

CREATE TABLE IF NOT EXISTS public.post_match
(
    match_id integer NOT NULL,
    driver_skill character(1) COLLATE pg_catalog."default" NOT NULL DEFAULT 'x'::bpchar,
    defense_rating character(1) COLLATE pg_catalog."default" NOT NULL DEFAULT 'x'::bpchar,
    swerve_drive boolean NOT NULL DEFAULT 'false',
    speed_rating smallint,
    died boolean NOT NULL DEFAULT 'false',
    tippy boolean NOT NULL DEFAULT 'false',
    dropped_cones boolean NOT NULL DEFAULT 'false',
    comments character varying(500) COLLATE pg_catalog."default"
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.post_match
    OWNER to root;