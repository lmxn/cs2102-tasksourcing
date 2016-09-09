--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.4
-- Dumped by pg_dump version 9.5.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: task_db; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE task_db IS 'task database';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: book; Type: TABLE; Schema: public; Owner: forge
--

CREATE TABLE book (
    title character varying(256) NOT NULL,
    format character(9),
    pages integer,
    language character varying(32),
    authors character varying(256),
    publisher character varying(64),
    year date,
    isbn10 character(10) NOT NULL,
    isbn13 character(14) NOT NULL,
    CONSTRAINT book_format_check CHECK (((format = 'paperback'::bpchar) OR (format = 'hardcover'::bpchar)))
);


ALTER TABLE book OWNER TO forge;

--
-- Name: task; Type: TABLE; Schema: public; Owner: forge
--

CREATE TABLE task (
    task_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    category character varying(255)
);


ALTER TABLE task OWNER TO forge;

--
-- Name: task_name_seq; Type: SEQUENCE; Schema: public; Owner: forge
--

CREATE SEQUENCE task_name_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE task_name_seq OWNER TO forge;

--
-- Name: task_name_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: forge
--

ALTER SEQUENCE task_name_seq OWNED BY task.name;


--
-- Name: task_task_id_seq; Type: SEQUENCE; Schema: public; Owner: forge
--

CREATE SEQUENCE task_task_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE task_task_id_seq OWNER TO forge;

--
-- Name: task_task_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: forge
--

ALTER SEQUENCE task_task_id_seq OWNED BY task.task_id;


--
-- Name: task_id; Type: DEFAULT; Schema: public; Owner: forge
--

ALTER TABLE ONLY task ALTER COLUMN task_id SET DEFAULT nextval('task_task_id_seq'::regclass);


--
-- Name: name; Type: DEFAULT; Schema: public; Owner: forge
--

ALTER TABLE ONLY task ALTER COLUMN name SET DEFAULT nextval('task_name_seq'::regclass);


--
-- Data for Name: book; Type: TABLE DATA; Schema: public; Owner: forge
--

COPY book (title, format, pages, language, authors, publisher, year, isbn10, isbn13) FROM stdin;
Photoshop Elements 9: The Missing Manual	paperback	640	English	Barbara Brundage	Pogue Press	2012-09-10	1449389678	978-1449389673
Where Good Ideas Come From: The Natural History of Innovation	hardcover	336	English	Steven Johnson	Riverhead Hardcover	2010-01-01	1594487715	978-1594487712
The Digital Photography Book	paperback	219	English	Scott Kelby	Peachpit Press	2006-01-01	032147404X	978-0321474049
The Great Gatsby	hardcover	216	English	F. Scott Fitzgerald	Scribner	1995-01-01	0684801523	978-0684801520
Davis s Drug Guide For Nurses (book With Cd-rom) And Mednotes: Nurse s Pocket Pharmacology Guide	hardcover	182	English	Judith Hopfer Deglin, April Hazard Vallerand	F. A. Davis Company	2004-05-06	0803612257	978-0803612259
Microsoft Office 2007: Introductory Concepts and Techniques, Premium Video Edition (Book Only)	paperback	1368	English	Gary B. Shelly, Thomas J. Cashman, Misty E. Vermaat	Course Technology	2010-09-09	1111529027	978-1111529024
The Future of Learning Institutions in a Digital Age (John D. and Catherine T. MacArthur Foundation Reports on Digital Media and Learning)	paperback	81	English	Cathy N. Davidson, David Theo Goldberg	The MIT Press 	2009-01-01	0262513595	978-0262513593
The New Rules of Marketing and PR: How to Use Social Media, Blogs, News Releases, Online Video, and Viral Marketing to Reach Buyers Directly, 2nd Edition	paperback	320	English	David Meerman Scott	Wiley	2010-10-02	0470547812	978-0470547816
\.


--
-- Data for Name: task; Type: TABLE DATA; Schema: public; Owner: forge
--

COPY task (task_id, name, category) FROM stdin;
1	Clean your house	General Cleaning
2	Run your errands	Delivery & Shopping
\.


--
-- Name: task_name_seq; Type: SEQUENCE SET; Schema: public; Owner: forge
--

SELECT pg_catalog.setval('task_name_seq', 1, false);


--
-- Name: task_task_id_seq; Type: SEQUENCE SET; Schema: public; Owner: forge
--

SELECT pg_catalog.setval('task_task_id_seq', 2, true);


--
-- Name: book_isbn10_key; Type: CONSTRAINT; Schema: public; Owner: forge
--

ALTER TABLE ONLY book
    ADD CONSTRAINT book_isbn10_key UNIQUE (isbn10);


--
-- Name: book_pkey; Type: CONSTRAINT; Schema: public; Owner: forge
--

ALTER TABLE ONLY book
    ADD CONSTRAINT book_pkey PRIMARY KEY (isbn13);


--
-- Name: task_pkey; Type: CONSTRAINT; Schema: public; Owner: forge
--

ALTER TABLE ONLY task
    ADD CONSTRAINT task_pkey PRIMARY KEY (task_id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;
GRANT ALL ON SCHEMA public TO forge;


--
-- PostgreSQL database dump complete
--

