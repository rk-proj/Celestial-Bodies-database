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
-- Name: exoplanet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.exoplanet (
    exoplanet_id integer NOT NULL,
    name character varying(60) NOT NULL,
    star_id integer NOT NULL,
    discovery_year integer,
    mass_in_jupiter_mass numeric,
    is_habitable boolean,
    description text
);


ALTER TABLE public.exoplanet OWNER TO freecodecamp;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(60) NOT NULL,
    distance_mly numeric,
    number_of_stars_in_billions integer,
    discovery_year integer,
    is_observable boolean,
    is_active boolean,
    description text,
    galaxy_type character varying(40) NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(60) NOT NULL,
    description text,
    planet_id integer NOT NULL,
    diameter_km numeric,
    has_atmosphere boolean,
    is_geologically_active boolean
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(60) NOT NULL,
    star_id integer NOT NULL,
    description text,
    has_life boolean,
    is_terrestrial boolean,
    mass_in_earth_mass numeric
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(60) NOT NULL,
    description text,
    temperature_k numeric,
    is_variable boolean,
    is_part_of_binary boolean,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Data for Name: exoplanet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.exoplanet VALUES (1, 'Kepler-452b', 2, 2015, 5.0, false, 'An exoplanet orbiting a Sun-like star, located about 1,400 light-years away from Earth.');
INSERT INTO public.exoplanet VALUES (2, 'Proxima Centauri b', 3, 2016, 1.3, false, 'An exoplanet orbiting Proxima Centauri, the closest known star to the Sun.');
INSERT INTO public.exoplanet VALUES (3, 'TRAPPIST-1d', 4, 2017, 0.297, true, 'An exoplanet in the TRAPPIST-1 system, known for its potential habitability and proximity to its star.');
INSERT INTO public.exoplanet VALUES (4, 'HD 209458 b', 5, 1999, 0.69, false, 'An exoplanet with an atmosphere that has been extensively studied by astronomers.');
INSERT INTO public.exoplanet VALUES (5, 'Gliese 581c', 6, 2007, 5.03, true, 'A potentially habitable exoplanet in the Gliese 581 system.');
INSERT INTO public.exoplanet VALUES (6, 'HD 40307g', 6, 2012, 7.1, false, 'A super-Earth exoplanet located within the habitable zone of its star.');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 0, 100, -400, true, true, 'The
galaxy that contains our Solar System.', 'Spiral');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 2.537, 1000, 964, true, true, 'The nearest spiral galaxy to the Milky Way.', 'Spiral');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 3, 40, 1654, true, true, 'A member of the Local Group of galaxies.', 'Spiral');
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 53.5, 1200, 1781, true, true, 'A supergiant elliptical galaxy in the Virgo Cluster.', 'Elliptical');
INSERT INTO public.galaxy VALUES (5, 'Whirlpool Galaxy', 23.16, 100, 1773, true, true, 'An interacting grand-design spiral galaxy with a companion galaxy.', 'Spiral');
INSERT INTO public.galaxy VALUES (6, 'Sombrero Galaxy', 29.3, 80, 1781, true, false, 'A spiral galaxy in the constellation Virgo with a bright nucleus and a prominent dust lane.', 'Spiral');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'The Earth’s only natural satellite.', 1, 3474.2, false, false);
INSERT INTO public.moon VALUES (2, 'Phobos', 'The larger of Mars’ two moons.', 2, 22.4, false, false);
INSERT INTO public.moon VALUES (3, 'Deimos', 'The smaller and outermost moon of Mars.', 2, 12.4, false, false);
INSERT INTO public.moon VALUES (4, 'Europa', 'One of Jupiter’s largest moons, thought to have a subsurface ocean.', 3, 3121.6, true, true);
INSERT INTO public.moon VALUES (5, 'Ganymede', 'The largest moon of Jupiter and the largest in the Solar System.', 3, 5262.4, true, true);
INSERT INTO public.moon VALUES (6, 'Callisto', 'A heavily cratered moon of Jupiter.', 3, 4820.6, true, false);
INSERT INTO public.moon VALUES (7, 'Io', 'The most volcanically active body in the Solar System.', 3, 3643.2, true, true);
INSERT INTO public.moon VALUES (8, 'Titan', 'The largest moon of Saturn and the second-largest moon in the Solar System.', 4, 5150, true, true);
INSERT INTO public.moon VALUES (9, 'Enceladus', 'A small, icy moon of Saturn with active water geysers.', 4, 504.2, true, true);
INSERT INTO public.moon VALUES (10, 'Mimas', 'A small moon of Saturn known for its large crater, Herschel.', 4, 396.4, false, false);
INSERT INTO public.moon VALUES (11, 'Triton', 'The largest moon of Neptune, with a retrograde orbit and geysers.', 5, 2706.8, true, true);
INSERT INTO public.moon VALUES (12, 'Charon', 'The largest moon of Pluto, in a binary system with Pluto.', 6, 1208, false, false);
INSERT INTO public.moon VALUES (13, 'Phoebe', 'A distant irregular moon of Saturn, known for its retrograde orbit.', 4, 213, false, false);
INSERT INTO public.moon VALUES (14, 'Dione', 'A moon of Saturn, known for its bright ice cliffs and impact basins.', 4, 1123.4, true, false);
INSERT INTO public.moon VALUES (15, 'Miranda', 'A small and icy moon of Uranus, with a chaotic terrain of cliffs and valleys.', 7, 471.6, false, true);
INSERT INTO public.moon VALUES (16, 'Ariel', 'A moon of Uranus, with a young and smooth surface.', 7, 1157.8, false, false);
INSERT INTO public.moon VALUES (17, 'Rhea', 'A heavily cratered moon of Saturn, with a wispy atmosphere of oxygen and carbon dioxide.', 4, 1527.6, true, false);
INSERT INTO public.moon VALUES (18, 'Tethys', 'A medium-sized moon of Saturn, known for its large impact basin, Odysseus.', 4, 1062.2, true, false);
INSERT INTO public.moon VALUES (19, 'Oberon', 'The outermost and second largest moon of Uranus, with a heavily cratered surface and icy cliffs.', 7, 1522.8, false, false);
INSERT INTO public.moon VALUES (20, 'Titania', 'The largest moon of Uranus, with a surface of water ice and some rocky material.', 7, 1577.8, false, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 'The smallest planet in the Solar System and closest to the Sun.', false, true, 0.0553);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 'The second planet from the Sun, known for its thick atmosphere of carbon dioxide.', false, true, 0.815);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 'Our home planet, the third from the Sun, with a diverse biosphere.', true, true, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 'The fourth planet from the Sun, with a thin atmosphere and evidence of past liquid water.', false, true, 0.107);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 'The largest planet in the Solar System, known for its Great Red Spot and numerous moons.', false, false, 317.8);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 'The sixth planet from the Sun, with prominent rings composed mostly of ice particles and dust.', false, false, 95.2);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 'The seventh planet from the Sun, with a tilted axis of rotation and faint ring system.', false, false, 14.6);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 'The eighth and farthest planet from the Sun, known for its blue color and strong winds.', false, false, 17.2);
INSERT INTO public.planet VALUES (9, 'Kepler-452b', 2, 'An exoplanet orbiting a Sun-like star, located about 1,400 light-years away from Earth.', false, true, NULL);
INSERT INTO public.planet VALUES (10, 'Proxima Centauri b', 3, 'An exoplanet orbiting Proxima Centauri, the closest known star to the Sun.', false, true, NULL);
INSERT INTO public.planet VALUES (11, 'TRAPPIST-1d', 4, 'An exoplanet in the TRAPPIST-1 system, known for its potential habitability and proximity to its star.', true, true, NULL);
INSERT INTO public.planet VALUES (12, 'HD 209458 b', 5, 'An exoplanet with an atmosphere that has been extensively studied by astronomers.', false, false, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'The star at the center of the Solar System.', 5778, false, false, 1);
INSERT INTO public.star VALUES (2, 'Sirius', 'The brightest star in the night sky.', 9940, true, true, 1);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 'A prominent red supergiant star in the constellation Orion, known for its variable brightness and impending supernova status.', 3500, true, false, 1);
INSERT INTO public.star VALUES (4, 'Alpha Centauri', 'The primary star of the Alpha Centauri system, the closest star system to the Solar System.', 5790, false, true, 1);
INSERT INTO public.star VALUES (5, 'Proxima Centauri', 'The closest known star to the Sun, part of the Alpha Centauri system.', 3042, true, false, 1);
INSERT INTO public.star VALUES (6, 'Vega', 'A bright star in the constellation Lyra, one of the most luminous stars in the vicinity of the Sun.', 9602, true, false, 1);


--
-- Name: exoplanet exoplanet_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.exoplanet
    ADD CONSTRAINT exoplanet_description_key UNIQUE (description);


--
-- Name: exoplanet exoplanet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.exoplanet
    ADD CONSTRAINT exoplanet_pkey PRIMARY KEY (exoplanet_id);


--
-- Name: galaxy galaxy_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_description_key UNIQUE (description);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_description_key UNIQUE (description);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_description_key UNIQUE (description);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_description_key UNIQUE (description);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: exoplanet exoplanet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.exoplanet
    ADD CONSTRAINT exoplanet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


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

