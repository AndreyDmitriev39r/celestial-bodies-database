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
    galaxy_id smallint NOT NULL,
    name character varying(45) NOT NULL,
    "real" boolean NOT NULL,
    apparent_magnitude numeric(3,1),
    constellation character varying(30),
    galaxy_group_id integer NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS smallint
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
-- Name: galaxy_group; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_group (
    galaxy_group_id smallint NOT NULL,
    name character varying(30) NOT NULL,
    description text
);


ALTER TABLE public.galaxy_group OWNER TO freecodecamp;

--
-- Name: galaxy_group_galaxy_group_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_group_galaxy_group_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_group_galaxy_group_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_group_galaxy_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_group_galaxy_group_id_seq OWNED BY public.galaxy_group.galaxy_group_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id smallint NOT NULL,
    name character varying(50) NOT NULL,
    habitable boolean,
    radius_km integer,
    species character varying(50),
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS smallint
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
    planet_id smallint NOT NULL,
    name character varying(50) NOT NULL,
    habitable boolean,
    radius_km integer,
    species character varying(50),
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS smallint
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
    name character varying(50) NOT NULL,
    home_system boolean,
    spectral_class character varying(20),
    radius_1000_km integer,
    galaxy_id integer NOT NULL,
    star_id smallint NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS smallint
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
-- Name: galaxy_group galaxy_group_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_group ALTER COLUMN galaxy_group_id SET DEFAULT nextval('public.galaxy_group_galaxy_group_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'NGC 7317', true, 14.6, 'Pegasus', 2);
INSERT INTO public.galaxy VALUES (2, 'Milky Way', true, NULL, 'Sagittarius', 1);
INSERT INTO public.galaxy VALUES (3, 'Messier 84', true, 9.1, 'Virgo', 4);
INSERT INTO public.galaxy VALUES (4, 'NGC 4477', true, 11.4, 'Coma Berenices', 4);
INSERT INTO public.galaxy VALUES (5, 'Battletech Milky Way', false, NULL, 'Sagittarius', 1);
INSERT INTO public.galaxy VALUES (6, 'Mass Effect Milky Way', false, NULL, 'Sagittarius', 1);


--
-- Data for Name: galaxy_group; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_group VALUES (1, 'Local Group', 'The group where the Milky Way, including the Earth, is located');
INSERT INTO public.galaxy_group VALUES (2, 'Stephan''s Quintet', 'One of the most photogenic groups');
INSERT INTO public.galaxy_group VALUES (3, 'Bullet Group', 'The merging group exhibits separation of dark matter from normal matter');
INSERT INTO public.galaxy_group VALUES (4, 'Markarian''s chain', 'Stretch of galaxies that forms part of the Virgo Cluster. When viewed from Earth, the galaxies lie along a smoothly curved line');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', false, 1737, 'human', 1);
INSERT INTO public.moon VALUES (2, 'Phobos', false, NULL, NULL, 12);
INSERT INTO public.moon VALUES (3, 'Deimos', false, NULL, NULL, 12);
INSERT INTO public.moon VALUES (5, 'Nanus', false, NULL, NULL, 2);
INSERT INTO public.moon VALUES (4, 'Menae', true, NULL, 'turian', 2);
INSERT INTO public.moon VALUES (6, 'Neville', false, NULL, NULL, 5);
INSERT INTO public.moon VALUES (7, 'Io', false, NULL, NULL, 3);
INSERT INTO public.moon VALUES (8, 'Ganimed', false, NULL, NULL, 3);
INSERT INTO public.moon VALUES (9, 'Callisto', false, NULL, NULL, 3);
INSERT INTO public.moon VALUES (10, 'Europa', false, NULL, NULL, 3);
INSERT INTO public.moon VALUES (11, 'Himalia', false, NULL, NULL, 3);
INSERT INTO public.moon VALUES (12, 'Elara', false, NULL, NULL, 3);
INSERT INTO public.moon VALUES (13, 'Carme', false, NULL, NULL, 3);
INSERT INTO public.moon VALUES (14, 'Ananke', false, NULL, NULL, 3);
INSERT INTO public.moon VALUES (15, 'Leda', false, NULL, NULL, 3);
INSERT INTO public.moon VALUES (16, 'Titania', false, NULL, NULL, 7);
INSERT INTO public.moon VALUES (17, 'Oberon', false, NULL, NULL, 7);
INSERT INTO public.moon VALUES (18, 'Ariel', false, NULL, NULL, 7);
INSERT INTO public.moon VALUES (19, 'Titan', false, NULL, NULL, 10);
INSERT INTO public.moon VALUES (20, 'Thetis', false, NULL, NULL, 10);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', true, 6371, 'human', 1);
INSERT INTO public.planet VALUES (2, 'Palaven', true, 8990, 'turian', 4);
INSERT INTO public.planet VALUES (3, 'Jupiter', false, 69911, '', 1);
INSERT INTO public.planet VALUES (5, 'New Home I', true, NULL, 'human', 5);
INSERT INTO public.planet VALUES (4, 'Tuchanka', true, 8293, 'krogan', 6);
INSERT INTO public.planet VALUES (6, 'Mercury', false, 2439, '', 1);
INSERT INTO public.planet VALUES (7, 'Uranus', false, 25362, '', 1);
INSERT INTO public.planet VALUES (8, 'Caelax', false, 6349, '', 4);
INSERT INTO public.planet VALUES (9, 'Kruban', false, 5443, '', 6);
INSERT INTO public.planet VALUES (11, 'Essenus', false, 74000, '', 4);
INSERT INTO public.planet VALUES (10, 'Saturn', false, 58232, '', 1);
INSERT INTO public.planet VALUES (12, 'Mars', false, 3389, '', 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('Sun', true, 'G2V', 696, 2, 1);
INSERT INTO public.star VALUES ('Alpha Centauri A', false, 'G2V', 851, 2, 2);
INSERT INTO public.star VALUES ('Alpha Centauri B', false, 'K1V', 600, 2, 3);
INSERT INTO public.star VALUES ('Trebia', true, NULL, NULL, 6, 4);
INSERT INTO public.star VALUES ('New Home', false, 'G4IV', NULL, 5, 5);
INSERT INTO public.star VALUES ('Aralakh', true, 'F', NULL, 6, 6);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: galaxy_group_galaxy_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_group_galaxy_group_id_seq', 4, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy_group galaxy_group_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_group
    ADD CONSTRAINT galaxy_group_name_key UNIQUE (name);


--
-- Name: galaxy_group galaxy_group_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_group
    ADD CONSTRAINT galaxy_group_pkey PRIMARY KEY (galaxy_group_id);


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
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: galaxy fk_galaxy_group; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT fk_galaxy_group FOREIGN KEY (galaxy_group_id) REFERENCES public.galaxy_group(galaxy_group_id);


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

