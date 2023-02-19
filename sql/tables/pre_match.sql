-- Table: public.pre_match

-- DROP TABLE IF EXISTS public.pre_match;

CREATE TABLE IF NOT EXISTS public.pre_match
(
    match_id integer NOT NULL,
    scouter_initials character varying(3) COLLATE pg_catalog."default" NOT NULL,
    event character varying(20) COLLATE pg_catalog."default" NOT NULL,
    level character(2) COLLATE pg_catalog."default" NOT NULL,
    match_num integer NOT NULL,
    robot character(2) COLLATE pg_catalog."default" NOT NULL,
    team_num integer NOT NULL,
    auto_start_pos integer
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.pre_match
    OWNER to root;