-- Table: public.scoring_grid

-- DROP TABLE IF EXISTS public.scoring_grid;

CREATE TABLE IF NOT EXISTS public.scoring_grid
(
    grid_id integer NOT NULL,
    place integer NOT NULL
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.scoring_grid
    OWNER to root;