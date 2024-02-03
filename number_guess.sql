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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    username character varying(22),
    games_played integer,
    best_game integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES ('user_1706978251246', 1, 176);
INSERT INTO public.users VALUES ('user_1706978251245', 1, 589);
INSERT INTO public.users VALUES ('user_1706979350469', 1, 444);
INSERT INTO public.users VALUES ('user_1706979350468', 1, 374);
INSERT INTO public.users VALUES ('user_1706979391933', 1, 524);
INSERT INTO public.users VALUES ('user_1706979391934', 1, 294);
INSERT INTO public.users VALUES ('user_1706979425364', 1, 114);
INSERT INTO public.users VALUES ('user_1706979425363', 1, 52);
INSERT INTO public.users VALUES ('user_1706978251246', 1, 176);
INSERT INTO public.users VALUES ('user_1706978251245', 1, 589);
INSERT INTO public.users VALUES ('user_1706979789400', 1, 369);
INSERT INTO public.users VALUES ('user_1706979789401', 1, 320);
INSERT INTO public.users VALUES ('user_1706979856686', 1, 101);
INSERT INTO public.users VALUES ('user_1706979856687', 1, 207);
INSERT INTO public.users VALUES ('user_1706979880051', 1, 360);
INSERT INTO public.users VALUES ('user_1706979880052', 1, 130);
INSERT INTO public.users VALUES ('user_1706979933257', 1, 375);
INSERT INTO public.users VALUES ('user_1706979933258', 1, 375);
INSERT INTO public.users VALUES ('user_1706979968681', 1, 492);
INSERT INTO public.users VALUES ('user_1706979968682', 1, 170);
INSERT INTO public.users VALUES ('user_1706980188151', 1, 366);
INSERT INTO public.users VALUES ('user_1706980188150', 1, 150);


--
-- PostgreSQL database dump complete
--

