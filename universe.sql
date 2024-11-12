--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: cluster; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.cluster (
    cluster_id integer NOT NULL,
    name character varying(80) NOT NULL,
    description text,
    visible_from_earth boolean DEFAULT (1)::boolean,
    discovered integer
);


ALTER TABLE public.cluster OWNER TO freecodecamp;

--
-- Name: cluster_cluster_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.cluster_cluster_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cluster_cluster_id_seq OWNER TO freecodecamp;

--
-- Name: cluster_cluster_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.cluster_cluster_id_seq OWNED BY public.cluster.cluster_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(80) NOT NULL,
    age_in_millions_years integer NOT NULL,
    diameter_in_ly numeric NOT NULL,
    cluster_id integer NOT NULL
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
    name character varying(80) NOT NULL,
    distance_from_planet_in_km integer NOT NULL,
    diameter_in_km numeric NOT NULL,
    description text,
    has_life boolean DEFAULT (0)::boolean,
    temperature_avg integer,
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
    name character varying(80) NOT NULL,
    age_in_millions_years integer NOT NULL,
    diameter_in_km numeric NOT NULL,
    description text,
    has_life boolean DEFAULT (0)::boolean,
    temperature_avg numeric,
    star_id integer NOT NULL
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(80) NOT NULL,
    age_in_millions_years integer NOT NULL,
    diameter_in_km numeric NOT NULL,
    type text,
    galaxy_id integer NOT NULL
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
-- Name: cluster cluster_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.cluster ALTER COLUMN cluster_id SET DEFAULT nextval('public.cluster_cluster_id_seq'::regclass);


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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: cluster; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.cluster VALUES (1, 'Laniakea', 'Es un supercúmulo de galaxias que contiene a la Vía Láctea y tiene un diámetro de 520 millones de años luz', true, 2014);
INSERT INTO public.cluster VALUES (2, 'Gran Muralla del Sloan', 'Es una estructura cósmica formada por una pared de galaxias de casi 1500 millones de años luz de largo', false, 2003);
INSERT INTO public.cluster VALUES (3, 'Muro del Polo Sur', 'Se extiende a lo largo de 1400 millones de años luz', false, 2020);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Vía Lactea', 13600, 105700, 1);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 10000, 220000, 1);
INSERT INTO public.galaxy VALUES (3, 'Enana del Can Mayor', 8500, 20500, 1);
INSERT INTO public.galaxy VALUES (4, 'Galaxia del Triangulo', 14600, 205700, 3);
INSERT INTO public.galaxy VALUES (5, 'M83', 8500, 120000, 2);
INSERT INTO public.galaxy VALUES (6, 'M58', 9500, 80600, 2);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 300000, 3476, 'Nuestra luna, que nos acompaña siempre', false, -96, 1);
INSERT INTO public.moon VALUES (2, 'Io', 421800, 3643, 'Superficie volcánica muy activa, la más interna de las lunas galileanas de Júpiter', false, -130, 4);
INSERT INTO public.moon VALUES (3, 'Europa', 671000, 3138, 'Superficie de hielo, se cree que puede albergar un océano líquido bajo la superficie', false, -102, 4);
INSERT INTO public.moon VALUES (4, 'Ganímedes', 1070000, 5268, 'La luna más grande del Sistema Solar', false, -110, 4);
INSERT INTO public.moon VALUES (5, 'Calisto', 1883000, 4821, 'Superficie muy antigua y craterizada, la más externa de las lunas galileanas', false, -100, 4);
INSERT INTO public.moon VALUES (6, 'Titán', 1221800, 5150, 'La única luna con una atmósfera densa, compuesta principalmente de nitrógeno', false, -94, 5);
INSERT INTO public.moon VALUES (7, 'Encélado', 238000, 504, 'Pequeña luna con géiseres de agua que alimentan los anillos de Saturno', false, -77, 5);
INSERT INTO public.moon VALUES (8, 'Miranda', 129900, 472, 'Luna de Urano con una superficie muy variada y caótica', false, -59, 6);
INSERT INTO public.moon VALUES (9, 'Ariel', 191200, 1158, 'Segunda luna más grande de Urano, con una superficie joven y relativamente lisa', false, -58, 6);
INSERT INTO public.moon VALUES (10, 'Umbriel', 266000, 1170, 'Luna de Urano con una superficie muy oscura y craterizada', false, -53, 6);
INSERT INTO public.moon VALUES (11, 'Titania', 436000, 1578, 'La luna más grande de Urano', false, -54, 6);
INSERT INTO public.moon VALUES (12, 'Oberón', 583000, 1523, 'La segunda luna más grande de Urano, con una superficie muy antigua y craterizada', false, -53, 6);
INSERT INTO public.moon VALUES (13, 'Tritón', 354759, 2707, 'La luna más grande de Neptuno, con una órbita retrógrada', false, -38, 7);
INSERT INTO public.moon VALUES (14, 'Proteus', 117600, 416, 'La segunda luna más grande de Neptuno, con forma irregular', false, -38, 7);
INSERT INTO public.moon VALUES (15, 'Fobos', 9377, 222, 'La luna más grande de Marte, con forma irregular y una superficie muy craterizada', false, -230, 3);
INSERT INTO public.moon VALUES (16, 'Deimos', 23460, 126, 'La segunda luna de Marte, más pequeña y menos estudiada que Fobos', false, -230, 3);
INSERT INTO public.moon VALUES (17, 'Mimas', 185500, 396, 'Luna de Saturno con un gran cráter que le da un aspecto de "Estrella de la Muerte"', false, -77, 5);
INSERT INTO public.moon VALUES (18, 'Jápeto', 3561000, 1436, 'Luna de Saturno con dos caras muy diferentes: una clara y otra oscura', false, -99, 5);
INSERT INTO public.moon VALUES (19, 'Dione', 377400, 1123, 'Luna de Saturno con una superficie helada y fracturada', false, 87, 5);
INSERT INTO public.moon VALUES (20, 'Rea', 527000, 1528, 'Segunda luna más grande de Saturno, con una superficie helada y craterizada', false, -73, 5);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Tierra', 4500, 12750, 'Es el planeta donde vivimos, el más lindo de todos', true, 25, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 4500, 12104, 'Planeta cercano a la tierra, con muchas nubes, rocoso y caliente', true, 390, 1);
INSERT INTO public.planet VALUES (3, 'Marte', 4500, 6703, 'Planeta rocoso y rojo', false, -69, 1);
INSERT INTO public.planet VALUES (4, 'Jupiter', 4500, 142900, 'Planeta gaseoso, es el más grande del sistema solar', false, -121, 1);
INSERT INTO public.planet VALUES (5, 'Saturno', 4000, 116000, 'Saturno es conocido por sus anillos', false, -169, 1);
INSERT INTO public.planet VALUES (6, 'Urano', 4500, 51800, 'Planeta azul, que gira de costado', false, -224, 1);
INSERT INTO public.planet VALUES (7, 'Neptuno', 4500, 49400, 'Es el planeta donde vivimos, el más lindo de todos', false, -218, 1);
INSERT INTO public.planet VALUES (8, 'Teegarden b', 7500, 13500, 'Es el planeta donde vivimos, el más lindo de todos', true, 25, 2);
INSERT INTO public.planet VALUES (9, 'KOI-487801', 4500, 12750, 'Es el planeta donde vivimos, el más lindo de todos', true, 25, 2);
INSERT INTO public.planet VALUES (10, 'GJ 3323 b', 4500, 12750, 'Es el planeta donde vivimos, el más lindo de todos', true, 25, 3);
INSERT INTO public.planet VALUES (11, 'Próxima Centauri d', 4500, 12750, 'Es el planeta donde vivimos, el más lindo de todos', true, 25, 3);
INSERT INTO public.planet VALUES (12, 'K2-72 e', 4500, 12750, 'Es el planeta donde vivimos, el más lindo de todos', true, 25, 4);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sol', 4603, 139000000, 'Enana amarilla', 1);
INSERT INTO public.star VALUES (2, 'Alfa Centauri A', 6603, 170970000.00, 'Enana amarilla', 1);
INSERT INTO public.star VALUES (3, 'Antares', 11000, 946000000, 'Supergigante roja', 1);
INSERT INTO public.star VALUES (4, 'Alpheratz', 7500, 220000000, 'Subgigante blanco-azulada', 2);
INSERT INTO public.star VALUES (5, 'Betelgeuse', 12500, 1230000000, 'Supergigante roja', 1);
INSERT INTO public.star VALUES (6, 'Sirio', 6603, 230000000, 'Blanca caliente', 1);


--
-- Name: cluster_cluster_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.cluster_cluster_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


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
-- Name: cluster cluster_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.cluster
    ADD CONSTRAINT cluster_name_key UNIQUE (name);


--
-- Name: cluster cluster_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.cluster
    ADD CONSTRAINT cluster_pkey PRIMARY KEY (cluster_id);


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
-- Name: galaxy galaxy_cluster_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_cluster_id_fkey FOREIGN KEY (cluster_id) REFERENCES public.cluster(cluster_id);


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

