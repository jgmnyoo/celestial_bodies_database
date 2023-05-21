--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40) NOT NULL,
    fun_fact text,
    galaxy_type character varying(20),
    is_spiral boolean,
    distance_from_earth_in_light_years integer,
    diameter_in_light_years integer,
    constellation character varying(30),
    number_of_stars_in_billions integer,
    diameter_greater_than_that_of_milky_way boolean,
    mass_in_billions_of_solar_mass numeric
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_body_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_body_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_body_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_body_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_body_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(40) NOT NULL,
    planet_id integer,
    fun_fact text,
    diameter_in_km integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(40) NOT NULL,
    star_id integer,
    fun_fact text,
    diameter_in_km integer,
    number_of_moons integer,
    planet_type character varying(30)
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_facts; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_facts (
    planet_facts_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer,
    orbit_in_days numeric,
    length_of_day_in_hours numeric
);


ALTER TABLE public.planet_facts OWNER TO freecodecamp;

--
-- Name: planet_facts_planet_facts_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_facts_planet_facts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_facts_planet_facts_id_seq OWNER TO freecodecamp;

--
-- Name: planet_facts_planet_facts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_facts_planet_facts_id_seq OWNED BY public.planet_facts.planet_facts_id;


--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(40) NOT NULL,
    galaxy_id integer,
    fun_fact text,
    evolutionary_stage character varying(30),
    distance_from_earth_in_light_years numeric
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_body_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_facts planet_facts_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_facts ALTER COLUMN planet_facts_id SET DEFAULT nextval('public.planet_facts_planet_facts_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'The Milky Way moves through space at a velocity of about 552 kilometres per second with respect to Cosmic Microwave Background radiation', 'Barred Spiral', true, 0, 140000, 'Sagittarius', 250, false, 0.000001150);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'The Andromeda Galaxy is approaching the Milky Way at approximately 100 to 140 kilometres per second', 'Spiral', true, 2540000, 220000, 'Andromeda', 1000, true, 1230);
INSERT INTO public.galaxy VALUES (3, 'Messier 87', 'The black hole at M87''s heart has the mass of about 3.5 billion Suns', 'Elliptical', false, 53000000, 12000, 'Virgo', 1000, false, 2400);
INSERT INTO public.galaxy VALUES (4, 'Antennae', 'The Antennae are the closest colliding galaxies to the Milky Way', 'Interacting Spirals', true, 45000000, 350000, 'Corvus', NULL, true, NULL);
INSERT INTO public.galaxy VALUES (5, 'Large Magellanic Cloud', 'The LMC contains a highly active starbirth region called the Tarantula Nebula', 'Barred Spiral', true, 163000, 14000, 'Dorado & Mensa', 30, false, 10);
INSERT INTO public.galaxy VALUES (6, 'Small Magellanic Cloud', 'Recent studies of the SMC indicate that it might be a former single galaxy split into two remnants', 'Dwarf Galaxy', false, 197000, 7000, 'Tucana & Hydrus', 3, false, 6.5);
INSERT INTO public.galaxy VALUES (7, 'Pinwheel', 'While many galaxies have a central supermassive black hole, astronomers have not found one at the heart of the Pinwheel', 'Spiral', true, 21000000, 170000, 'Ursa Major', 1000, true, 1000);
INSERT INTO public.galaxy VALUES (8, 'Sombrero', 'The Sombrero is a favourite target for well-equipped amateur astronomers. If you have a good dark-sky sight, it can be spotted through binoculars', 'Spiral', true, 29000000, 50000, 'Virgo', NULL, false, 800);
INSERT INTO public.galaxy VALUES (9, 'Triangulum', 'The Triangulum and Andromeda are linked by streams of hydrogen gas and embedded stars. The two galaxies may have had a close interaction in the past and may do so again in about 2.5 billion years', 'Spiral', true, 3000000, 6000, 'Triangulum', 40, false, 50);
INSERT INTO public.galaxy VALUES (10, 'Whirlpool', 'The Whirlpool was initially discovered in 1773 by Charles Messier, who was charting the skies searching for objects that might be confused with comets', 'Spiral', true, 23000000, 60000, 'Canes Venatici', NULL, false, 160);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Earth''s Moon', 3, 'If Earth were the size of a nickel, the Moon would be about as big as a coffee bean', 3475);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 'Phobos orbits Mars three times a day', 22);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 'Deimos rotates around Mars every thirty hours', 13);
INSERT INTO public.moon VALUES (4, 'Io', 5, 'Io is the most volcanically active world in our solar system and has hundreds of volcanoes', 3643);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 'Europa is thought to possess an iron core, a rocky mantle, and an ocean of salty water', 3122);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 'Ganymede is the largest moon in our solar system and the only moon with its own magnetic field', 5268);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 'Callisto is the most heavily cratered object in our solar system', 4821);
INSERT INTO public.moon VALUES (8, 'Mimas', 6, 'Mimas is the smallest and innermost of Saturn''s major moons', 396);
INSERT INTO public.moon VALUES (9, 'Enceladus', 6, 'Enceladus is named after a giant in Greek Mythology', 504);
INSERT INTO public.moon VALUES (10, 'Tethys', 6, 'Tethys'' density is 0.97 times that of liquid water, which suggests that Tethys is composed almost entirely of water ice plus a small amount of rock', 1062);
INSERT INTO public.moon VALUES (11, 'Dione', 6, 'Dione has an average temperature of -186 degrees Celsius', 1123);
INSERT INTO public.moon VALUES (12, 'Ariel', 7, 'Ariel has the brightest surface of the five largest Uranian moons', 1158);
INSERT INTO public.moon VALUES (14, 'Titania', 7, 'Titania is Uranus'' largest moon and has a neutral gray colour', 1577);
INSERT INTO public.moon VALUES (15, 'Oberon', 7, 'Oberon is composed of half ice and half rock', 1523);
INSERT INTO public.moon VALUES (16, 'Miranda', 7, 'Miranda looks like it was pieced together from parts that did not merge quite properly, like Frankenstein''s monster', 472);
INSERT INTO public.moon VALUES (13, 'Umbriel', 7, 'Umbriel is the darkest of Uranus'' largest moons and reflects only sixteen percent of the light that strikes its surface', 1169);
INSERT INTO public.moon VALUES (17, 'Triton', 8, 'Triton is the largest of the Neptune''s thirteen moons', 2705);
INSERT INTO public.moon VALUES (18, 'Nereid', 8, 'Nereid is so far from Neptune that it requires 360 Earth days to complete one orbit', 357);
INSERT INTO public.moon VALUES (19, 'Naiad', 8, 'Naiad is potato-shaped and is most likely made up of fragments of Neptune''s original satellites', 60);
INSERT INTO public.moon VALUES (20, 'Thalassa', 8, 'Thalassa was named after a daughter of Aether and Hemera from Greek mythology. Thalassa is also the Greek word for sea', 81);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 'Mercury is only slightly larger than Earth''s moon', 4879, 0, 'Primary');
INSERT INTO public.planet VALUES (2, 'Venus', 1, 'Venus spins slowly in the opposite direction from most other planets', 12104, 0, 'Primary');
INSERT INTO public.planet VALUES (3, 'Earth', 1, 'Earth is the only planet in our solar system with liquid water at the surface level', 12756, 1, 'Primary');
INSERT INTO public.planet VALUES (4, 'Mars', 1, 'Mars is a dusty, cold, desert world with a very thin atmosphere', 6792, 2, 'Primary');
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 'Jupiter is more than twice as massive than other planets of our solar system combined', 142984, 92, 'Primary');
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 'Saturn is adorned with a prominent, complex system of icy rings', 120536, 83, 'Primary');
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 'Uranus rotates at a nearly ninety-degree angle from the plane of its orbit', 51118, 27, 'Primary');
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 'Neptune was the first planet located through mathematical calculations', 49528, 14, 'Primary');
INSERT INTO public.planet VALUES (9, 'Pluto', 1, 'Pluto used to be considered the ninth planet in our solar system, but is now classified as a dwarf planet', 2376, 5, 'Dwarf');
INSERT INTO public.planet VALUES (10, 'Ceres', 1, 'Ceres makes up almost a third of the asteroid belt''s total mass', 280, 0, 'Dwarf');
INSERT INTO public.planet VALUES (11, 'Makemake', 1, 'It takes 310 Earth years for Makemake to complete one orbit around our Sun', 715, 0, 'Dwarf');
INSERT INTO public.planet VALUES (12, 'Eris', 1, 'Eris is about the same size as Pluto but is three times farther from the Sun', 1163, 1, 'Dwarf');
INSERT INTO public.planet VALUES (13, 'Haumea', 1, 'Haumea is one of the fastest rotating large objects in our solar system', 620, 2, 'Dwarf');


--
-- Data for Name: planet_facts; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_facts VALUES (1, 'Mercury', 1, 88.0, 4222.6);
INSERT INTO public.planet_facts VALUES (2, 'Venus', 2, 224.7, 2802.0);
INSERT INTO public.planet_facts VALUES (3, 'Earth', 3, 365.2, 24.0);
INSERT INTO public.planet_facts VALUES (5, 'Jupiter', 5, 4331, 9.9);
INSERT INTO public.planet_facts VALUES (4, 'Mars', 4, 687.0, 24.7);
INSERT INTO public.planet_facts VALUES (6, 'Saturn', 6, 10747, 10.7);
INSERT INTO public.planet_facts VALUES (7, 'Uranus', 7, 30589, 17.2);
INSERT INTO public.planet_facts VALUES (8, 'Neptune', 8, 59800, 16.1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'The Sun', 1, 'The Sun is a yellow-white dwarf that will continue its hydrogen-burning phase for another 5 or so billion years', 'Main Sequence', 0.00001578);
INSERT INTO public.star VALUES (2, 'Alpha Centauri System', 1, 'The Alpha Centauri System holds the closest stars to the Sun', 'Main Sequence', 4.3);
INSERT INTO public.star VALUES (3, 'Sirius', 1, 'Sirius is the brightest star in our night sky', 'Main Sequence', 8.3);
INSERT INTO public.star VALUES (4, 'UY Scuti', 1, 'The UY Scuti is the largest known star by radius', 'Red Giant', 5070);
INSERT INTO public.star VALUES (5, 'R136a1', 5, 'R136a1 is the most massive star known to date, more than 300 times the size of our Sun', 'Wolf-Rayet', 163000);
INSERT INTO public.star VALUES (6, 'Vega', 1, 'Vega is only about 400 million years old, which is fairly young', 'Main Sequence', 25);
INSERT INTO public.star VALUES (7, 'Betelgeuse', 1, 'The Betelgeuse is visible to stargazers in many parts of Earth from November through April', 'Red Giant', 650);
INSERT INTO public.star VALUES (8, 'Antares', 1, 'The name of the Antares star literally means ''equal to Mars'' in ancient Greek', 'Red Giant', 550);
INSERT INTO public.star VALUES (9, 'Rigel', 1, 'Rigel has 120000 times the luminosity of the Sun and is the seventh brightest star in the sky', 'Main Sequence', 1600);


--
-- Name: galaxy_body_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_body_id_seq', 10, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_facts_planet_facts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_facts_planet_facts_id_seq', 8, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 9, true);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet_facts planet_facts_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_facts
    ADD CONSTRAINT planet_facts_pkey PRIMARY KEY (planet_facts_id);


--
-- Name: planet_facts planet_facts_planet_facts_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_facts
    ADD CONSTRAINT planet_facts_planet_facts_id_key UNIQUE (planet_facts_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet_facts planet_facts_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_facts
    ADD CONSTRAINT planet_facts_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

