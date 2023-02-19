-- Table: public.cycle_times

-- DROP TABLE IF EXISTS public.cycle_times;

CREATE TABLE IF NOT EXISTS public.cycle_times
(
    match_id integer NOT NULL,
    cycle_time numeric(4,1) NOT NULL
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.cycle_times
    OWNER to root;