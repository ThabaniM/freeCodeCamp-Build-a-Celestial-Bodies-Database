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
    name character varying(30) NOT NULL,
    age numeric,
    distance_from_solar_system_in_lightyears integer,
    type text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    size integer,
    color character varying(20),
    distance_from_nearest_planet integer,
    planet_id integer NOT NULL
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
    name character varying(30) NOT NULL,
    size_in_earths numeric,
    type character varying(20),
    has_life boolean,
    day_length_earth_days integer,
    at_least_one_moon boolean,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

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
-- Name: planetary_system; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planetary_system (
    planetary_system_id integer NOT NULL,
    name character varying(30) NOT NULL,
    number_of_stars numeric,
    number_of_planets integer,
    age numeric
);


ALTER TABLE public.planetary_system OWNER TO freecodecamp;

--
-- Name: planetary_system_planetary_system_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planetary_system_planetary_system_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planetary_system_planetary_system_id_seq OWNER TO freecodecamp;

--
-- Name: planetary_system_planetary_system_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planetary_system_planetary_system_id_seq OWNED BY public.planetary_system.planetary_system_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    name character varying(30) NOT NULL,
    type character varying(20),
    constellation character varying(20),
    galaxy_id integer NOT NULL,
    star_id integer NOT NULL
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

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planetary_system planetary_system_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planetary_system ALTER COLUMN planetary_system_id SET DEFAULT nextval('public.planetary_system_planetary_system_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13200000000, 25000, 'barred spiral galaxy');
INSERT INTO public.galaxy VALUES (3, 'Antennea Galaxy', 300000000, 60000000, 'spiral galaxy');
INSERT INTO public.galaxy VALUES (4, 'Backward Galaxy', NULL, 111000000, 'unbarred spiral galaxy');
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 10000000000, 152000, 'unbarred spiral galaxy');
INSERT INTO public.galaxy VALUES (5, 'Black Eye Galaxy', NULL, 17000000, 'unbarred spiral galaxy');
INSERT INTO public.galaxy VALUES (6, 'Cartwheel Galaxy', NULL, 144300, 'lenticular ring galaxy');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 3474, NULL, 384400, 1);
INSERT INTO public.moon VALUES (2, 'Deimos', 13, NULL, 23460, 2);
INSERT INTO public.moon VALUES (3, 'Phobos', 23, NULL, 6000, 2);
INSERT INTO public.moon VALUES (14, 'Titan', 5149, NULL, 1200000, 6);
INSERT INTO public.moon VALUES (15, 'Enceladus', 500, NULL, 238000, 6);
INSERT INTO public.moon VALUES (16, 'Mimas', 40, NULL, 186000, 6);
INSERT INTO public.moon VALUES (17, 'Tethys', 1066, NULL, 295000, 6);
INSERT INTO public.moon VALUES (18, 'Phoebe', 213, NULL, 1295200, 6);
INSERT INTO public.moon VALUES (19, 'Atlas', 30, NULL, 1400000, 6);
INSERT INTO public.moon VALUES (20, 'Titania', 1578, NULL, 436000, 7);
INSERT INTO public.moon VALUES (4, 'Europa', 3122, NULL, 670900, 5);
INSERT INTO public.moon VALUES (5, 'Ganymede', 5260, NULL, 10700000, 5);
INSERT INTO public.moon VALUES (6, 'Callisto', 4821, NULL, 1880000, 5);
INSERT INTO public.moon VALUES (7, 'Metis', 40, NULL, 128000, 5);
INSERT INTO public.moon VALUES (8, 'Adrastea', 20, NULL, 129000, 5);
INSERT INTO public.moon VALUES (9, 'Thebe', 3475, NULL, 220000, 5);
INSERT INTO public.moon VALUES (10, 'Themisto', 7300000, NULL, 220000, 5);
INSERT INTO public.moon VALUES (11, 'Leda', 10000, NULL, 11200000, 5);
INSERT INTO public.moon VALUES (12, 'Lysithea', 18, NULL, 7300000, 5);
INSERT INTO public.moon VALUES (13, 'Carpo', 3, NULL, 17000000, 5);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (3, 'Proxima Centauri b', 1.03, 'Super Earth', true, 11, false, NULL);
INSERT INTO public.planet VALUES (1, 'Earth', 1, 'terrestial', true, 1, true, NULL);
INSERT INTO public.planet VALUES (2, 'Iota Horologii b', 720, NULL, false, 1, NULL, NULL);
INSERT INTO public.planet VALUES (4, 'Mars', 0.5, 'terrestial', false, 1, true, NULL);
INSERT INTO public.planet VALUES (5, 'Jupiter', 11, 'gas giant', false, 0, true, NULL);
INSERT INTO public.planet VALUES (6, 'Saturn', 9, 'gas giant', false, 0, true, NULL);
INSERT INTO public.planet VALUES (7, 'Uranus', 4, 'ice giant', false, 1, true, NULL);
INSERT INTO public.planet VALUES (8, 'Neptune', 4, 'ice giant', false, 1, true, NULL);
INSERT INTO public.planet VALUES (9, 'Mercury', 0.38, 'terrestial', false, 176, false, NULL);
INSERT INTO public.planet VALUES (10, 'Venus', 0.95, 'terrestial', false, 117, false, NULL);
INSERT INTO public.planet VALUES (12, 'Kepler-62f', 1.4, 'Super Earth', true, 267, NULL, NULL);
INSERT INTO public.planet VALUES (11, '47 Ursa Majoris b', 27.83, 'gas giant', false, 1078, NULL, NULL);


--
-- Data for Name: planetary_system; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planetary_system VALUES (1, 'Solar System', 1000000000, 9, 4600000000);
INSERT INTO public.planetary_system VALUES (2, 'Alpha Centauri Star System', 3, 3, 5000000000);
INSERT INTO public.planetary_system VALUES (3, 'TRAPPIST-1', NULL, 7, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('Sun', 'yellow dwarf', 'No constellation', 1, 1);
INSERT INTO public.star VALUES ('Proxima Centauri', 'red dwarf', 'Centaurus', 1, 2);
INSERT INTO public.star VALUES ('Kepler-62', 'orange dwarf', 'Lyra', 1, 3);
INSERT INTO public.star VALUES ('47 Ursa Majoris', 'yellow dwarf', 'Ursa Majoris', 1, 4);
INSERT INTO public.star VALUES ('Iota Horologii', 'yellow dwarf', 'Horologium', 1, 5);
INSERT INTO public.star VALUES ('COROT-7', 'yellow dwarf', 'Monoceros', 1, 6);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 3, true);


--
-- Name: planetary_system_planetary_system_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planetary_system_planetary_system_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


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
-- Name: planetary_system planetary_system_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planetary_system
    ADD CONSTRAINT planetary_system_name_key UNIQUE (name);


--
-- Name: planetary_system planetary_system_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planetary_system
    ADD CONSTRAINT planetary_system_pkey PRIMARY KEY (planetary_system_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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