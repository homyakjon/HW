--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

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
-- Name: departments; Type: TABLE; Schema: public; Owner: sergej
--

CREATE TABLE public.departments (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.departments OWNER TO sergej;

--
-- Name: departments_id_seq; Type: SEQUENCE; Schema: public; Owner: sergej
--

CREATE SEQUENCE public.departments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.departments_id_seq OWNER TO sergej;

--
-- Name: departments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sergej
--

ALTER SEQUENCE public.departments_id_seq OWNED BY public.departments.id;


--
-- Name: groups; Type: TABLE; Schema: public; Owner: sergej
--

CREATE TABLE public.groups (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    department_id integer
);


ALTER TABLE public.groups OWNER TO sergej;

--
-- Name: groups_id_seq; Type: SEQUENCE; Schema: public; Owner: sergej
--

CREATE SEQUENCE public.groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.groups_id_seq OWNER TO sergej;

--
-- Name: groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sergej
--

ALTER SEQUENCE public.groups_id_seq OWNED BY public.groups.id;


--
-- Name: students; Type: TABLE; Schema: public; Owner: sergej
--

CREATE TABLE public.students (
    id integer NOT NULL,
    first_name character varying(100) NOT NULL,
    last_name character varying(100) NOT NULL,
    group_id integer
);


ALTER TABLE public.students OWNER TO sergej;

--
-- Name: students_id_seq; Type: SEQUENCE; Schema: public; Owner: sergej
--

CREATE SEQUENCE public.students_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.students_id_seq OWNER TO sergej;

--
-- Name: students_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sergej
--

ALTER SEQUENCE public.students_id_seq OWNED BY public.students.id;


--
-- Name: teachers; Type: TABLE; Schema: public; Owner: sergej
--

CREATE TABLE public.teachers (
    id integer NOT NULL,
    first_name character varying(100) NOT NULL,
    last_name character varying(100) NOT NULL,
    department_id integer
);


ALTER TABLE public.teachers OWNER TO sergej;

--
-- Name: teachers_id_seq; Type: SEQUENCE; Schema: public; Owner: sergej
--

CREATE SEQUENCE public.teachers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teachers_id_seq OWNER TO sergej;

--
-- Name: teachers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sergej
--

ALTER SEQUENCE public.teachers_id_seq OWNED BY public.teachers.id;


--
-- Name: departments id; Type: DEFAULT; Schema: public; Owner: sergej
--

ALTER TABLE ONLY public.departments ALTER COLUMN id SET DEFAULT nextval('public.departments_id_seq'::regclass);


--
-- Name: groups id; Type: DEFAULT; Schema: public; Owner: sergej
--

ALTER TABLE ONLY public.groups ALTER COLUMN id SET DEFAULT nextval('public.groups_id_seq'::regclass);


--
-- Name: students id; Type: DEFAULT; Schema: public; Owner: sergej
--

ALTER TABLE ONLY public.students ALTER COLUMN id SET DEFAULT nextval('public.students_id_seq'::regclass);


--
-- Name: teachers id; Type: DEFAULT; Schema: public; Owner: sergej
--

ALTER TABLE ONLY public.teachers ALTER COLUMN id SET DEFAULT nextval('public.teachers_id_seq'::regclass);


--
-- Data for Name: departments; Type: TABLE DATA; Schema: public; Owner: sergej
--

COPY public.departments (id, name) FROM stdin;
1	Computer Science
2	Mathematics
3	Physics
\.


--
-- Data for Name: groups; Type: TABLE DATA; Schema: public; Owner: sergej
--

COPY public.groups (id, name, department_id) FROM stdin;
1	CS50	1
2	Math101	2
3	Phys101	3
4	CS101	1
5	CS50	1
6	Math101	2
7	Phys101	3
8	CS101	1
\.


--
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: sergej
--

COPY public.students (id, first_name, last_name, group_id) FROM stdin;
1	Alice	Johnson	1
2	Bob	Smith	2
3	Charlie	Williams	3
4	David	Brown	1
5	Eva	Davis	2
6	Frank	Miller	3
7	Grace	Jones	4
8	Henry	Anderson	1
9	Ivy	Moore	2
10	Jack	Taylor	3
11	Kate	White	4
12	Leo	Martin	1
13	Mia	Young	2
14	Noah	Lee	3
15	Olivia	Harris	4
16	Paul	Clark	1
17	Quinn	Evans	2
18	Ryan	Wright	3
19	Sophia	Walker	4
20	Tyler	Hill	1
\.


--
-- Data for Name: teachers; Type: TABLE DATA; Schema: public; Owner: sergej
--

COPY public.teachers (id, first_name, last_name, department_id) FROM stdin;
1	John	Doe	1
2	Jane	Smith	2
3	Robert	Johnson	3
4	Emily	Williams	1
5	Michael	Brown	2
\.


--
-- Name: departments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sergej
--

SELECT pg_catalog.setval('public.departments_id_seq', 3, true);


--
-- Name: groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sergej
--

SELECT pg_catalog.setval('public.groups_id_seq', 8, true);


--
-- Name: students_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sergej
--

SELECT pg_catalog.setval('public.students_id_seq', 20, true);


--
-- Name: teachers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sergej
--

SELECT pg_catalog.setval('public.teachers_id_seq', 5, true);


--
-- Name: departments departments_pkey; Type: CONSTRAINT; Schema: public; Owner: sergej
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_pkey PRIMARY KEY (id);


--
-- Name: groups groups_pkey; Type: CONSTRAINT; Schema: public; Owner: sergej
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (id);


--
-- Name: students students_pkey; Type: CONSTRAINT; Schema: public; Owner: sergej
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (id);


--
-- Name: teachers teachers_pkey; Type: CONSTRAINT; Schema: public; Owner: sergej
--

ALTER TABLE ONLY public.teachers
    ADD CONSTRAINT teachers_pkey PRIMARY KEY (id);


--
-- Name: groups groups_department_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sergej
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_department_id_fkey FOREIGN KEY (department_id) REFERENCES public.departments(id);


--
-- Name: students students_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sergej
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_group_id_fkey FOREIGN KEY (group_id) REFERENCES public.groups(id);


--
-- Name: teachers teachers_department_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sergej
--

ALTER TABLE ONLY public.teachers
    ADD CONSTRAINT teachers_department_id_fkey FOREIGN KEY (department_id) REFERENCES public.departments(id);


--
-- PostgreSQL database dump complete
--

