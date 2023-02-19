CREATE OR REPLACE PROCEDURE save_match(
 	s character varying(3),
	e character varying(20),
	l character varying(20),
	m integer,
	r character varying(2),
	t integer,
	"as" integer,
	asg integer ARRAY,
	acs boolean,
	am boolean,
	ad character(1),
	tct numeric(4,1) ARRAY,
	tsg integer ARRAY,
	wf boolean,
	wd boolean,
	who character varying(200),
	fpu character(1),
	dt numeric(4,1),
	fs character(1),
	dn integer,
	ds character(1),
	dr character(1),
	sd boolean,
	sr smallint,
	die boolean,
	tip boolean,
	dc boolean,
	co character varying(500)
)
LANGUAGE plpgsql AS 
$$
DECLARE
	_match_id int;
	_cur_grid_id int;
BEGIN
	SELECT nextval('matchid') INTO _match_id;
	
	INSERT INTO pre_match (match_id, scouter_initials, event, level, match_num, robot, team_num, auto_start_pos)
	VALUES (_match_id, s, e, l, m, r, t, "as");
	
	SELECT nextval('gridid') INTO _cur_grid_id;	
	INSERT INTO scoring_grid (grid_id, place) SELECT _cur_grid_id, UNNEST(asg);
	
	INSERT INTO autonomous (match_id, grid_id, cross_charging_station, mobility, docked)
		VALUES (_match_id, _cur_grid_id, acs, am, ad);
	
	INSERT INTO cycle_times (match_id, cycle_time) SELECT _match_id, UNNEST(tct);
	
	SELECT nextval('gridid') INTO _cur_grid_id;	
	INSERT INTO scoring_grid (grid_id, place) SELECT _cur_grid_id, UNNEST(tsg);
	
	INSERT INTO teleop (match_id, grid_id, was_fed_pieces, was_defended, who_defended, floor_pickup)
		VALUES (_match_id, _cur_grid_id, wf, wd, who, fpu);
	
	INSERT INTO end_game (match_id, docking_timer, final_status, num_alliance_docked)
		VALUES (_match_id, dt, fs, dn);
	
	INSERT INTO post_match (match_id, driver_skill, defense_rating, swerve_drive, speed_rating, died, tippy, dropped_cones, comments)
		VALUES (_match_id, ds, dr, sd, sr, die, tip, dc, co);
END
$$;