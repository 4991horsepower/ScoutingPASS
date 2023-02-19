-- Table: public.end_game

-- DROP TABLE IF EXISTS public.end_game;

CREATE TABLE IF NOT EXISTS public.end_game
(
    match_id integer NOT NULL,
    docking_timer numeric(4,1),
    final_status character(1) COLLATE pg_catalog."default" NOT NULL DEFAULT 'x'::bpchar,
    num_alliance_docked integer NOT NULL DEFAULT 0
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.end_game
    OWNER to root;