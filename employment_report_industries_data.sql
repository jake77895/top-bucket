--
-- PostgreSQL database dump
--

-- Dumped from database version 14.15 (Homebrew)
-- Dumped by pg_dump version 14.15 (Homebrew)

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

--
-- Data for Name: employment_report_industries; Type: TABLE DATA; Schema: public; Owner: jacobspitzer
--

INSERT INTO public.employment_report_industries (id, employment_report_id, consulting, investment_banking, private_equity, venture_capital, marketing, created_at, updated_at, diversified_financial, investment_management, technology) VALUES (2, 1, 33.8, 9.4, 6.4, 1.4, 3.2, '2025-02-16 04:14:11.365049', '2025-02-16 04:14:11.365049', 11.4, 3.9, 14.8);
INSERT INTO public.employment_report_industries (id, employment_report_id, consulting, investment_banking, private_equity, venture_capital, marketing, created_at, updated_at, diversified_financial, investment_management, technology) VALUES (3, 2, 34.8066298342541, 4.69613259668508, 3.86740331491713, 0.552486187845304, 22.3926380368098, '2025-02-16 04:29:52.072851', '2025-02-16 04:29:52.072851', 3.31491712707182, 1.65745856353591, 20.4419889502762);


--
-- Name: employment_report_functions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jacobspitzer
--

SELECT pg_catalog.setval('public.employment_report_functions_id_seq', 3, true);


--
-- PostgreSQL database dump complete
--

