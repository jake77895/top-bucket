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
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: jacobspitzer
--

INSERT INTO public.ar_internal_metadata (key, value, created_at, updated_at) VALUES ('environment', 'development', '2025-02-13 21:32:04.069439', '2025-02-13 21:32:04.069441');
INSERT INTO public.ar_internal_metadata (key, value, created_at, updated_at) VALUES ('schema_sha1', 'ca3190b10f65b6d4cd3f9d134ba6927c566087e5', '2025-02-04 17:21:59.602996', '2025-02-04 17:21:59.602997');


--
-- Data for Name: career_aggregate_jobs; Type: TABLE DATA; Schema: public; Owner: jacobspitzer
--



--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: jacobspitzer
--

INSERT INTO public.users (id, user_name, admin, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, created_at, updated_at, is_interview_coach) VALUES (1, 'jake_the_tank', true, 'jspitz77@gmail.com', '$2a$12$dMe6S3f7kjv3F2LruxFZUeiG4qaqYz07VEHlUU4VBT.UAlYhqBlRW', NULL, NULL, '2025-02-08 16:07:46.822189', '2025-02-04 20:50:00.503307', '2025-02-08 16:07:46.823845', false);


--
-- Data for Name: career_jobs; Type: TABLE DATA; Schema: public; Owner: jacobspitzer
--

INSERT INTO public.career_jobs (id, user_id, company, industry, start_year, years_at_job, created_at, updated_at, location, job_grouping, job_order, previous_undergrad, previous_grad, previous_mba) VALUES (1, 1, 'Goldman Sachs', 'Investment Banking', 2024, 1, '2025-02-11 19:10:31.038028', '2025-02-11 19:10:31.038028', 'New York', 1739301031, 1, '', '', '');


--
-- Data for Name: career_compensations; Type: TABLE DATA; Schema: public; Owner: jacobspitzer
--

INSERT INTO public.career_compensations (id, career_job_id, year, level, sub_level, salary, bonus, hours_worked_per_week, created_at, updated_at, "group") VALUES (1, 1, NULL, 'Analyst', '1', 110000.00, 30000.00, 70, '2025-02-11 19:10:31.042161', '2025-02-11 19:10:31.042161', 'Not Specified');


--
-- Data for Name: tier_list_templates; Type: TABLE DATA; Schema: public; Owner: jacobspitzer
--



--
-- Data for Name: tier_lists; Type: TABLE DATA; Schema: public; Owner: jacobspitzer
--

INSERT INTO public.tier_lists (id, name, description, published, custom_fields, created_at, updated_at, tier_list_template_id, category, picture) VALUES (2, 'All Investment Banks', 'This tier list reflects the most sought-after opportunities based on factors like post-banking exits (especially into buy-side roles), compensation, overall analyst experience, and general industry reputation. It isn’t group-dependent, except in cases where group selection significantly impacts outcomes. Within each tier, personal preference is the main differentiator, as different roles and firms appeal to individuals for varying reasons.', true, NULL, '2025-02-20 20:35:45.87778', '2025-02-20 20:35:51.433074', NULL, 'Investment Banking', 'image/upload/v1740083746/yff4krdlvdubbs1d5ita.jpg');
INSERT INTO public.tier_lists (id, name, description, published, custom_fields, created_at, updated_at, tier_list_template_id, category, picture) VALUES (3, 'Top Banks for PE Exits from Analyst Roles', 'This ranking highlights the investment banks that offer the strongest pathways to private equity exits for analysts coming straight from undergrad. The list is based on factors such as placement rates into top PE firms, compensation, analyst experience, and overall industry reputation. While firm prestige and exit opportunities are the primary considerations, the level of support banks provide—through networking opportunities, modeling training, and cultural aspects—is also a minor factor. Group selection is generally not a primary factor, except in cases where it significantly impacts outcomes. Ultimately, personal preference will play a key role in determining the best fit.', true, NULL, '2025-02-20 20:46:38.204362', '2025-02-20 20:46:41.543918', NULL, 'Investment Banking', 'image/upload/v1740084398/lvjne4yu4icshbtorffp.jpg');


--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: jacobspitzer
--



--
-- Data for Name: position_types; Type: TABLE DATA; Schema: public; Owner: jacobspitzer
--

INSERT INTO public.position_types (id, name, description, created_at, updated_at) VALUES (1, 'Investment Banking', NULL, '2025-02-08 16:22:19.464887', '2025-02-08 16:22:19.464887');
INSERT INTO public.position_types (id, name, description, created_at, updated_at) VALUES (2, 'Private Equity', '', '2025-02-08 19:46:15.3241', '2025-02-08 19:46:15.3241');
INSERT INTO public.position_types (id, name, description, created_at, updated_at) VALUES (3, 'Venture Capital', '', '2025-02-08 19:46:23.30504', '2025-02-08 19:46:23.30504');
INSERT INTO public.position_types (id, name, description, created_at, updated_at) VALUES (4, 'Corporate Development', '', '2025-02-08 19:46:30.661357', '2025-02-08 19:46:30.661357');
INSERT INTO public.position_types (id, name, description, created_at, updated_at) VALUES (5, 'Hedge Fund', '', '2025-02-08 19:46:57.704658', '2025-02-08 19:46:57.704658');
INSERT INTO public.position_types (id, name, description, created_at, updated_at) VALUES (6, 'Investment Management', '', '2025-02-08 19:47:09.186807', '2025-02-08 19:47:09.186807');
INSERT INTO public.position_types (id, name, description, created_at, updated_at) VALUES (7, 'FP&A', '', '2025-02-08 19:47:19.032631', '2025-02-08 19:47:19.032631');
INSERT INTO public.position_types (id, name, description, created_at, updated_at) VALUES (8, 'Consulting', '', '2025-02-08 19:47:25.853327', '2025-02-08 19:47:25.853327');
INSERT INTO public.position_types (id, name, description, created_at, updated_at) VALUES (9, 'Other', '', '2025-02-08 19:47:34.44186', '2025-02-08 19:47:34.44186');


--
-- Data for Name: companies; Type: TABLE DATA; Schema: public; Owner: jacobspitzer
--

INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (1, 'Goldman Sachs', '2025-02-08 21:50:03.599496', '2025-02-08 21:50:03.599496', 1);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (2, 'JPMorgan Chase', '2025-02-08 21:50:03.60791', '2025-02-08 21:50:03.60791', 1);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (3, 'Morgan Stanley', '2025-02-08 21:50:03.615944', '2025-02-08 21:50:03.615944', 1);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (5, 'Citigroup', '2025-02-08 21:50:03.635579', '2025-02-08 21:50:03.635579', 1);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (6, 'Credit Suisse', '2025-02-08 21:50:03.643012', '2025-02-08 21:50:03.643012', 1);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (7, 'Deutsche Bank', '2025-02-08 21:50:03.650167', '2025-02-08 21:50:03.650167', 1);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (8, 'Barclays', '2025-02-08 21:50:03.65668', '2025-02-08 21:50:03.65668', 1);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (9, 'UBS', '2025-02-08 21:50:03.66228', '2025-02-08 21:50:03.66228', 1);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (10, 'Lazard', '2025-02-08 21:50:03.66989', '2025-02-08 21:50:03.66989', 1);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (11, 'Evercore', '2025-02-08 21:50:03.675641', '2025-02-08 21:50:03.675641', 1);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (12, 'Jefferies', '2025-02-08 21:50:03.681742', '2025-02-08 21:50:03.681742', 1);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (13, 'Houlihan Lokey', '2025-02-08 21:50:03.688044', '2025-02-08 21:50:03.688044', 1);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (14, 'Rothschild & Co', '2025-02-08 21:50:03.692818', '2025-02-08 21:50:03.692818', 1);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (15, 'Guggenheim Partners', '2025-02-08 21:50:03.697855', '2025-02-08 21:50:03.697855', 1);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (16, 'Moelis & Company', '2025-02-08 21:50:03.703006', '2025-02-08 21:50:03.703006', 1);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (17, 'Perella Weinberg Partners', '2025-02-08 21:50:03.708178', '2025-02-08 21:50:03.708178', 1);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (18, 'PJT Partners', '2025-02-08 21:50:03.713155', '2025-02-08 21:50:03.713155', 1);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (19, 'Greenhill & Co', '2025-02-08 21:50:03.718224', '2025-02-08 21:50:03.718224', 1);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (20, 'Raymond James', '2025-02-08 21:50:03.723231', '2025-02-08 21:50:03.723231', 1);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (21, 'HSBC', '2025-02-08 21:50:03.728154', '2025-02-08 21:50:03.728154', 1);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (22, 'Macquarie Group', '2025-02-08 21:50:03.733518', '2025-02-08 21:50:03.733518', 1);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (23, 'Nomura', '2025-02-08 21:50:03.739449', '2025-02-08 21:50:03.739449', 1);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (24, 'Societe Generale', '2025-02-08 21:50:03.744661', '2025-02-08 21:50:03.744661', 1);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (25, 'BNP Paribas', '2025-02-08 21:50:03.749927', '2025-02-08 21:50:03.749927', 1);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (26, 'Wells Fargo Securities', '2025-02-08 21:50:03.755078', '2025-02-08 21:50:03.755078', 1);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (27, 'CIBC World Markets', '2025-02-08 21:50:03.760193', '2025-02-08 21:50:03.760193', 1);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (28, 'Mizuho Financial Group', '2025-02-08 21:50:03.765232', '2025-02-08 21:50:03.765232', 1);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (29, 'BMO', '2025-02-08 21:50:03.770257', '2025-02-08 21:50:03.770257', 1);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (30, 'RBC', '2025-02-08 21:50:03.775134', '2025-02-08 21:50:03.775134', 1);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (31, 'Truist', '2025-02-08 21:50:03.78049', '2025-02-08 21:50:03.78049', 1);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (32, 'Santander', '2025-02-08 21:50:03.786351', '2025-02-08 21:50:03.786351', 1);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (33, 'LionTree', '2025-02-08 21:50:03.791355', '2025-02-08 21:50:03.791355', 1);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (34, 'Qatalyst', '2025-02-08 21:50:03.796423', '2025-02-08 21:50:03.796423', 1);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (35, 'Raine Group', '2025-02-08 21:50:03.801447', '2025-02-08 21:50:03.801447', 1);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (36, 'Allen & Company', '2025-02-08 21:50:03.806269', '2025-02-08 21:50:03.806269', 1);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (37, 'Blackstone', '2025-02-08 21:50:03.811124', '2025-02-08 21:50:03.811124', 2);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (38, 'KKR', '2025-02-08 21:50:03.816012', '2025-02-08 21:50:03.816012', 2);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (39, 'Carlyle Group', '2025-02-08 21:50:03.820897', '2025-02-08 21:50:03.820897', 2);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (40, 'TPG Capital', '2025-02-08 21:50:03.826225', '2025-02-08 21:50:03.826225', 2);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (41, 'Apollo', '2025-02-08 21:50:03.832042', '2025-02-08 21:50:03.832042', 2);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (42, 'Warburg Pincus', '2025-02-08 21:50:03.837075', '2025-02-08 21:50:03.837075', 2);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (43, 'Bain Capital', '2025-02-08 21:50:03.842092', '2025-02-08 21:50:03.842092', 2);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (44, 'Advent International', '2025-02-08 21:50:03.847179', '2025-02-08 21:50:03.847179', 2);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (45, 'Hellman & Friedman', '2025-02-08 21:50:03.852192', '2025-02-08 21:50:03.852192', 2);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (46, 'Silver Lake Partners', '2025-02-08 21:50:03.857093', '2025-02-08 21:50:03.857093', 2);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (47, 'Thoma Bravo', '2025-02-08 21:50:03.861966', '2025-02-08 21:50:03.861966', 2);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (48, 'Clayton, Dubilier & Rice (CD&R)', '2025-02-08 21:50:03.867084', '2025-02-08 21:50:03.867084', 2);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (49, 'EQT Partners', '2025-02-08 21:50:03.872584', '2025-02-08 21:50:03.872584', 2);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (50, 'General Atlantic', '2025-02-08 21:50:03.878325', '2025-02-08 21:50:03.878325', 2);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (51, 'Vista Equity Partners', '2025-02-08 21:50:03.883341', '2025-02-08 21:50:03.883341', 2);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (52, 'Brookfield Asset Management', '2025-02-08 21:50:03.888387', '2025-02-08 21:50:03.888387', 2);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (53, 'CVC Capital Partners', '2025-02-08 21:50:03.893497', '2025-02-08 21:50:03.893497', 2);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (54, 'Permira', '2025-02-08 21:50:03.898561', '2025-02-08 21:50:03.898561', 2);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (55, 'Ares Management', '2025-02-08 21:50:03.903555', '2025-02-08 21:50:03.903555', 2);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (56, 'Oaktree Capital Management', '2025-02-08 21:50:03.908518', '2025-02-08 21:50:03.908518', 2);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (57, 'L Catterton', '2025-02-08 21:50:03.913315', '2025-02-08 21:50:03.913315', 2);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (58, 'Partners Group', '2025-02-08 21:50:03.918845', '2025-02-08 21:50:03.918845', 2);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (59, 'HarbourVest Partners', '2025-02-08 21:50:03.924738', '2025-02-08 21:50:03.924738', 2);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (60, 'Apollo Global Management', '2025-02-08 21:50:03.929851', '2025-02-08 21:50:03.929851', 2);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (61, 'Ardian', '2025-02-08 21:50:03.934916', '2025-02-08 21:50:03.934916', 2);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (62, 'Kohlberg & Company', '2025-02-08 21:50:03.939979', '2025-02-08 21:50:03.939979', 2);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (63, 'Francisco Partners', '2025-02-08 21:50:03.944917', '2025-02-08 21:50:03.944917', 2);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (64, 'HG Capital', '2025-02-08 21:50:03.949874', '2025-02-08 21:50:03.949874', 2);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (65, 'ICG (Intermediate Capital Group)', '2025-02-08 21:50:03.954744', '2025-02-08 21:50:03.954744', 2);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (66, 'Providence Equity Partners', '2025-02-08 21:50:03.959553', '2025-02-08 21:50:03.959553', 2);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (67, 'Charterhouse Capital Partners', '2025-02-08 21:50:03.964996', '2025-02-08 21:50:03.964996', 2);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (68, 'Sun Capital Partners', '2025-02-08 21:50:03.970801', '2025-02-08 21:50:03.970801', 2);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (69, 'Lion Capital', '2025-02-08 21:50:03.976147', '2025-02-08 21:50:03.976147', 2);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (70, 'Cerberus Capital Management', '2025-02-08 21:50:03.98112', '2025-02-08 21:50:03.98112', 2);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (71, 'HIG Capital', '2025-02-08 21:50:03.986116', '2025-02-08 21:50:03.986116', 2);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (72, 'Adams Street Partners', '2025-02-08 21:50:03.991037', '2025-02-08 21:50:03.991037', 2);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (73, 'Madison Dearborn Partners', '2025-02-08 21:50:03.995734', '2025-02-08 21:50:03.995734', 2);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (74, 'Audax Group', '2025-02-08 21:50:04.00073', '2025-02-08 21:50:04.00073', 2);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (75, 'American Securities', '2025-02-08 21:50:04.005771', '2025-02-08 21:50:04.005771', 2);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (76, 'Paine Schwartz Partners', '2025-02-08 21:50:04.011259', '2025-02-08 21:50:04.011259', 2);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (77, 'GTCR', '2025-02-08 21:50:04.016891', '2025-02-08 21:50:04.016891', 2);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (78, 'Welsh, Carson, Anderson & Stowe (WCAS)', '2025-02-08 21:50:04.021944', '2025-02-08 21:50:04.021944', 2);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (79, 'Accel-KKR', '2025-02-08 21:50:04.026772', '2025-02-08 21:50:04.026772', 2);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (80, 'Sequoia Capital', '2025-02-08 21:50:04.031993', '2025-02-08 21:50:04.031993', 3);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (81, 'Andreessen Horowitz', '2025-02-08 21:50:04.037339', '2025-02-08 21:50:04.037339', 3);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (82, 'Accel Partners', '2025-02-08 21:50:04.042511', '2025-02-08 21:50:04.042511', 3);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (83, 'Benchmark', '2025-02-08 21:50:04.047574', '2025-02-08 21:50:04.047574', 3);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (84, 'Greylock Partners', '2025-02-08 21:50:04.054105', '2025-02-08 21:50:04.054105', 3);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (85, 'Lightspeed Venture Partners', '2025-02-08 21:50:04.059255', '2025-02-08 21:50:04.059255', 3);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (86, 'Kleiner Perkins', '2025-02-08 21:50:04.064724', '2025-02-08 21:50:04.064724', 3);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (87, 'Union Square Ventures', '2025-02-08 21:50:04.071219', '2025-02-08 21:50:04.071219', 3);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (88, 'Bessemer Venture Partners', '2025-02-08 21:50:04.076474', '2025-02-08 21:50:04.076474', 3);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (89, 'Insight Partners', '2025-02-08 21:50:04.08152', '2025-02-08 21:50:04.08152', 3);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (90, 'GV (Google Ventures)', '2025-02-08 21:50:04.08663', '2025-02-08 21:50:04.08663', 3);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (91, 'SoftBank Vision Fund', '2025-02-08 21:50:04.091675', '2025-02-08 21:50:04.091675', 3);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (92, 'Index Ventures', '2025-02-08 21:50:04.096832', '2025-02-08 21:50:04.096832', 3);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (93, 'IVP (Institutional Venture Partners)', '2025-02-08 21:50:04.102352', '2025-02-08 21:50:04.102352', 3);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (94, 'NEA (New Enterprise Associates)', '2025-02-08 21:50:04.107235', '2025-02-08 21:50:04.107235', 3);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (95, 'General Catalyst', '2025-02-08 21:50:04.112702', '2025-02-08 21:50:04.112702', 3);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (96, 'Redpoint Ventures', '2025-02-08 21:50:04.118515', '2025-02-08 21:50:04.118515', 3);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (97, 'Balderton Capital', '2025-02-08 21:50:04.123659', '2025-02-08 21:50:04.123659', 3);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (98, 'Forerunner Ventures', '2025-02-08 21:50:04.128407', '2025-02-08 21:50:04.128407', 3);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (99, 'Craft Ventures', '2025-02-08 21:50:04.133437', '2025-02-08 21:50:04.133437', 3);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (100, 'First Round Capital', '2025-02-08 21:50:04.138435', '2025-02-08 21:50:04.138435', 3);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (101, '500 Global (formerly 500 Startups)', '2025-02-08 21:50:04.143378', '2025-02-08 21:50:04.143378', 3);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (102, 'Hummingbird Ventures', '2025-02-08 21:50:04.148321', '2025-02-08 21:50:04.148321', 3);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (103, 'Foundry Group', '2025-02-08 21:50:04.153327', '2025-02-08 21:50:04.153327', 3);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (104, 'RRE Ventures', '2025-02-08 21:50:04.15824', '2025-02-08 21:50:04.15824', 3);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (105, 'Tiger Global Management', '2025-02-08 21:50:04.163476', '2025-02-08 21:50:04.163476', 3);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (106, 'Battery Ventures', '2025-02-08 21:50:04.169219', '2025-02-08 21:50:04.169219', 3);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (107, 'Menlo Ventures', '2025-02-08 21:50:04.174383', '2025-02-08 21:50:04.174383', 3);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (108, 'Norwest Venture Partners', '2025-02-08 21:50:04.179386', '2025-02-08 21:50:04.179386', 3);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (109, 'Sapphire Ventures', '2025-02-08 21:50:04.184416', '2025-02-08 21:50:04.184416', 3);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (110, 'Alkeon Capital', '2025-02-08 21:50:04.189374', '2025-02-08 21:50:04.189374', 3);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (111, 'Thrive Capital', '2025-02-08 21:50:04.194413', '2025-02-08 21:50:04.194413', 3);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (112, 'Founders Fund', '2025-02-08 21:50:04.19951', '2025-02-08 21:50:04.19951', 3);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (113, '8VC', '2025-02-08 21:50:04.204274', '2025-02-08 21:50:04.204274', 3);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (114, 'DCM Ventures', '2025-02-08 21:50:04.209714', '2025-02-08 21:50:04.209714', 3);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (115, 'Shasta Ventures', '2025-02-08 21:50:04.21558', '2025-02-08 21:50:04.21558', 3);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (116, 'Wing Venture Capital', '2025-02-08 21:50:04.220625', '2025-02-08 21:50:04.220625', 3);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (117, 'Altos Ventures', '2025-02-08 21:50:04.225612', '2025-02-08 21:50:04.225612', 3);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (118, 'Matrix Partners', '2025-02-08 21:50:04.230752', '2025-02-08 21:50:04.230752', 3);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (119, 'GGV Capital', '2025-02-08 21:50:04.235841', '2025-02-08 21:50:04.235841', 3);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (120, 'Aspect Ventures', '2025-02-08 21:50:04.240745', '2025-02-08 21:50:04.240745', 3);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (121, 'Crosslink Capital', '2025-02-08 21:50:04.245815', '2025-02-08 21:50:04.245815', 3);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (122, 'Scale Venture Partners', '2025-02-08 21:50:04.250879', '2025-02-08 21:50:04.250879', 3);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (123, 'Eurazeo', '2025-02-08 21:50:04.256323', '2025-02-08 21:50:04.256323', 3);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (124, 'Palo Alto Networks Ventures', '2025-02-08 21:50:04.262172', '2025-02-08 21:50:04.262172', 3);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (125, 'Google', '2025-02-08 21:50:04.266906', '2025-02-08 21:50:04.266906', 4);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (126, 'Amazon', '2025-02-08 21:50:04.27202', '2025-02-08 21:50:04.27202', 4);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (127, 'Microsoft', '2025-02-08 21:50:04.277114', '2025-02-08 21:50:04.277114', 4);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (128, 'Apple', '2025-02-08 21:50:04.282096', '2025-02-08 21:50:04.282096', 4);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (129, 'Meta (formerly Facebook)', '2025-02-08 21:50:04.287198', '2025-02-08 21:50:04.287198', 4);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (130, 'Netflix', '2025-02-08 21:50:04.292218', '2025-02-08 21:50:04.292218', 4);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (131, 'Adobe', '2025-02-08 21:50:04.297245', '2025-02-08 21:50:04.297245', 4);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (132, 'Salesforce', '2025-02-08 21:50:04.302134', '2025-02-08 21:50:04.302134', 4);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (133, 'Intel', '2025-02-08 21:50:04.307419', '2025-02-08 21:50:04.307419', 4);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (134, 'Cisco Systems', '2025-02-08 21:50:04.313219', '2025-02-08 21:50:04.313219', 4);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (135, 'AIG', '2025-02-08 21:50:04.318398', '2025-02-08 21:50:04.318398', 4);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (136, 'MetLife', '2025-02-08 21:50:04.323537', '2025-02-08 21:50:04.323537', 4);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (137, 'Prudential Financial', '2025-02-08 21:50:04.328539', '2025-02-08 21:50:04.328539', 4);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (138, 'Allstate', '2025-02-08 21:50:04.333536', '2025-02-08 21:50:04.333536', 4);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (139, 'State Farm', '2025-02-08 21:50:04.338621', '2025-02-08 21:50:04.338621', 4);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (140, 'The Hartford', '2025-02-08 21:50:04.343518', '2025-02-08 21:50:04.343518', 4);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (141, 'Chubb Limited', '2025-02-08 21:50:04.348549', '2025-02-08 21:50:04.348549', 4);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (142, 'Liberty Mutual', '2025-02-08 21:50:04.354153', '2025-02-08 21:50:04.354153', 4);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (143, 'Progressive', '2025-02-08 21:50:04.360155', '2025-02-08 21:50:04.360155', 4);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (144, 'Travelers Companies', '2025-02-08 21:50:04.36527', '2025-02-08 21:50:04.36527', 4);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (145, 'General Electric (GE)', '2025-02-08 21:50:04.370358', '2025-02-08 21:50:04.370358', 4);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (146, 'Honeywell', '2025-02-08 21:50:04.375196', '2025-02-08 21:50:04.375196', 4);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (147, '3M', '2025-02-08 21:50:04.380471', '2025-02-08 21:50:04.380471', 4);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (148, 'Caterpillar', '2025-02-08 21:50:04.385578', '2025-02-08 21:50:04.385578', 4);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (149, 'Deere & Company', '2025-02-08 21:50:04.39066', '2025-02-08 21:50:04.39066', 4);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (150, 'Eaton Corporation', '2025-02-08 21:50:04.395782', '2025-02-08 21:50:04.395782', 4);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (151, 'Emerson Electric', '2025-02-08 21:50:04.401292', '2025-02-08 21:50:04.401292', 4);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (152, 'Parker Hannifin', '2025-02-08 21:50:04.407258', '2025-02-08 21:50:04.407258', 4);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (153, 'Rockwell Automation', '2025-02-08 21:50:04.412338', '2025-02-08 21:50:04.412338', 4);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (154, 'Textron', '2025-02-08 21:50:04.417365', '2025-02-08 21:50:04.417365', 4);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (155, 'Pfizer', '2025-02-08 21:50:04.422615', '2025-02-08 21:50:04.422615', 4);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (156, 'Johnson & Johnson', '2025-02-08 21:50:04.427741', '2025-02-08 21:50:04.427741', 4);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (157, 'Merck', '2025-02-08 21:50:04.432743', '2025-02-08 21:50:04.432743', 4);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (158, 'AbbVie', '2025-02-08 21:50:04.437794', '2025-02-08 21:50:04.437794', 4);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (159, 'Bristol-Myers Squibb', '2025-02-08 21:50:04.442924', '2025-02-08 21:50:04.442924', 4);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (160, 'Amgen', '2025-02-08 21:50:04.448471', '2025-02-08 21:50:04.448471', 4);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (161, 'Gilead Sciences', '2025-02-08 21:50:04.508451', '2025-02-08 21:50:04.508451', 4);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (162, 'Novartis', '2025-02-08 21:50:04.515464', '2025-02-08 21:50:04.515464', 4);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (163, 'Eli Lilly', '2025-02-08 21:50:04.523047', '2025-02-08 21:50:04.523047', 4);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (164, 'Roche', '2025-02-08 21:50:04.531177', '2025-02-08 21:50:04.531177', 4);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (165, 'Walmart', '2025-02-08 21:50:04.535925', '2025-02-08 21:50:04.535925', 4);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (166, 'Target', '2025-02-08 21:50:04.541893', '2025-02-08 21:50:04.541893', 4);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (167, 'Costco Wholesale', '2025-02-08 21:50:04.547433', '2025-02-08 21:50:04.547433', 4);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (168, 'Home Depot', '2025-02-08 21:50:04.552968', '2025-02-08 21:50:04.552968', 4);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (169, 'Lowe’s', '2025-02-08 21:50:04.558886', '2025-02-08 21:50:04.558886', 4);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (170, 'CVS Health', '2025-02-08 21:50:04.564896', '2025-02-08 21:50:04.564896', 4);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (171, 'Walgreens Boots Alliance', '2025-02-08 21:50:04.57035', '2025-02-08 21:50:04.57035', 4);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (172, 'Kroger', '2025-02-08 21:50:04.600365', '2025-02-08 21:50:04.600365', 4);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (173, 'Macy’s', '2025-02-08 21:50:04.606649', '2025-02-08 21:50:04.606649', 4);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (174, 'Nordstrom', '2025-02-08 21:50:04.61191', '2025-02-08 21:50:04.61191', 4);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (175, 'Citadel', '2025-02-08 21:50:04.617688', '2025-02-08 21:50:04.617688', 5);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (176, 'Bridgewater Associates', '2025-02-08 21:50:04.622774', '2025-02-08 21:50:04.622774', 5);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (177, 'Two Sigma', '2025-02-08 21:50:04.627917', '2025-02-08 21:50:04.627917', 5);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (178, 'Millennium Management', '2025-02-08 21:50:04.633067', '2025-02-08 21:50:04.633067', 5);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (179, 'D.E. Shaw & Co.', '2025-02-08 21:50:04.637987', '2025-02-08 21:50:04.637987', 5);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (180, 'Renaissance Technologies', '2025-02-08 21:50:04.642853', '2025-02-08 21:50:04.642853', 5);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (181, 'Point72 Asset Management', '2025-02-08 21:50:04.64787', '2025-02-08 21:50:04.64787', 5);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (182, 'AQR Capital Management', '2025-02-08 21:50:04.652591', '2025-02-08 21:50:04.652591', 5);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (183, 'Elliott Management Corporation', '2025-02-08 21:50:04.659358', '2025-02-08 21:50:04.659358', 5);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (184, 'Man Group', '2025-02-08 21:50:04.66413', '2025-02-08 21:50:04.66413', 5);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (185, 'Balyasny Asset Management', '2025-02-08 21:50:04.670276', '2025-02-08 21:50:04.670276', 5);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (186, 'Pershing Square Capital Management', '2025-02-08 21:50:04.678249', '2025-02-08 21:50:04.678249', 5);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (187, 'BlueCrest Capital Management', '2025-02-08 21:50:04.684401', '2025-02-08 21:50:04.684401', 5);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (188, 'Caxton Associates', '2025-02-08 21:50:04.689497', '2025-02-08 21:50:04.689497', 5);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (189, 'Marshall Wace', '2025-02-08 21:50:04.694531', '2025-02-08 21:50:04.694531', 5);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (190, 'Davidson Kempner Capital Management', '2025-02-08 21:50:04.699438', '2025-02-08 21:50:04.699438', 5);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (191, 'Hudson Bay Capital Management', '2025-02-08 21:50:04.704304', '2025-02-08 21:50:04.704304', 5);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (192, 'Anchorage Capital Partners', '2025-02-08 21:50:04.709268', '2025-02-08 21:50:04.709268', 5);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (193, 'Third Point LLC', '2025-02-08 21:50:04.714263', '2025-02-08 21:50:04.714263', 5);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (194, 'Adage Capital Management', '2025-02-08 21:50:04.719255', '2025-02-08 21:50:04.719255', 5);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (195, 'King Street Capital Management', '2025-02-08 21:50:04.725911', '2025-02-08 21:50:04.725911', 5);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (196, 'Canyon Partners', '2025-02-08 21:50:04.732025', '2025-02-08 21:50:04.732025', 5);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (197, 'Farallon Capital', '2025-02-08 21:50:04.73732', '2025-02-08 21:50:04.73732', 5);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (198, 'Och-Ziff Capital Management (Sculptor)', '2025-02-08 21:50:04.742566', '2025-02-08 21:50:04.742566', 5);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (199, 'Lone Pine Capital', '2025-02-08 21:50:04.74768', '2025-02-08 21:50:04.74768', 5);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (200, 'Tiger Global Management', '2025-02-08 21:50:04.753066', '2025-02-08 21:50:04.753066', 5);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (201, 'Greenlight Capital', '2025-02-08 21:50:04.75814', '2025-02-08 21:50:04.75814', 5);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (202, 'Highbridge Capital Management', '2025-02-08 21:50:04.763292', '2025-02-08 21:50:04.763292', 5);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (203, 'ValueAct Capital', '2025-02-08 21:50:04.768277', '2025-02-08 21:50:04.768277', 5);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (204, 'Viking Global Investors', '2025-02-08 21:50:04.773329', '2025-02-08 21:50:04.773329', 5);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (205, 'Glennmont Partners', '2025-02-08 21:50:04.778294', '2025-02-08 21:50:04.778294', 5);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (206, 'Tudor Investment Corporation', '2025-02-08 21:50:04.784871', '2025-02-08 21:50:04.784871', 5);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (207, 'Soros Fund Management', '2025-02-08 21:50:04.789755', '2025-02-08 21:50:04.789755', 5);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (208, 'York Capital Management', '2025-02-08 21:50:04.795759', '2025-02-08 21:50:04.795759', 5);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (209, 'GMO LLC', '2025-02-08 21:50:04.801072', '2025-02-08 21:50:04.801072', 5);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (210, 'Perry Capital', '2025-02-08 21:50:04.806261', '2025-02-08 21:50:04.806261', 5);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (211, 'Fidelity Investments', '2025-02-08 21:50:04.811427', '2025-02-08 21:50:04.811427', 6);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (212, 'Vanguard', '2025-02-08 21:50:04.816623', '2025-02-08 21:50:04.816623', 6);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (213, 'BlackRock', '2025-02-08 21:50:04.821731', '2025-02-08 21:50:04.821731', 6);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (214, 'T. Rowe Price', '2025-02-08 21:50:04.826687', '2025-02-08 21:50:04.826687', 6);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (215, 'Schroders', '2025-02-08 21:50:04.83166', '2025-02-08 21:50:04.83166', 6);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (216, 'AllianceBernstein (Bernstein)', '2025-02-08 21:50:04.836706', '2025-02-08 21:50:04.836706', 6);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (217, 'Dodge & Cox', '2025-02-08 21:50:04.841749', '2025-02-08 21:50:04.841749', 6);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (218, 'Neuberger Berman', '2025-02-08 21:50:04.848258', '2025-02-08 21:50:04.848258', 6);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (219, 'PIMCO', '2025-02-08 21:50:04.854421', '2025-02-08 21:50:04.854421', 6);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (220, 'Franklin Templeton Investments', '2025-02-08 21:50:04.859708', '2025-02-08 21:50:04.859708', 6);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (221, 'Invesco', '2025-02-08 21:50:04.865392', '2025-02-08 21:50:04.865392', 6);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (222, 'State Street Global Advisors', '2025-02-08 21:50:04.870585', '2025-02-08 21:50:04.870585', 6);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (223, 'Northern Trust Asset Management', '2025-02-08 21:50:04.875834', '2025-02-08 21:50:04.875834', 6);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (224, 'Charles Schwab Investment Management', '2025-02-08 21:50:04.880957', '2025-02-08 21:50:04.880957', 6);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (225, 'Janus Henderson Investors', '2025-02-08 21:50:04.885998', '2025-02-08 21:50:04.885998', 6);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (226, 'Capital Group (American Funds)', '2025-02-08 21:50:04.890974', '2025-02-08 21:50:04.890974', 6);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (227, 'J.P. Morgan Asset Management', '2025-02-08 21:50:04.896205', '2025-02-08 21:50:04.896205', 6);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (228, 'Morgan Stanley Investment Management', '2025-02-08 21:50:04.90158', '2025-02-08 21:50:04.90158', 6);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (229, 'Goldman Sachs Asset Management', '2025-02-08 21:50:04.909298', '2025-02-08 21:50:04.909298', 6);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (230, 'UBS Asset Management', '2025-02-08 21:50:04.915663', '2025-02-08 21:50:04.915663', 6);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (231, 'Barings', '2025-02-08 21:50:04.920505', '2025-02-08 21:50:04.920505', 6);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (232, 'Nuveen', '2025-02-08 21:50:04.925838', '2025-02-08 21:50:04.925838', 6);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (233, 'Wellington Management', '2025-02-08 21:50:04.931182', '2025-02-08 21:50:04.931182', 6);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (234, 'Principal Global Investors', '2025-02-08 21:50:04.936442', '2025-02-08 21:50:04.936442', 6);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (235, 'Amundi Asset Management', '2025-02-08 21:50:04.941572', '2025-02-08 21:50:04.941572', 6);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (236, 'Legg Mason', '2025-02-08 21:50:04.946602', '2025-02-08 21:50:04.946602', 6);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (237, 'Macquarie Asset Management', '2025-02-08 21:50:04.951546', '2025-02-08 21:50:04.951546', 6);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (238, 'Putnam Investments', '2025-02-08 21:50:04.956586', '2025-02-08 21:50:04.956586', 6);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (239, 'Manulife Investment Management', '2025-02-08 21:50:04.961669', '2025-02-08 21:50:04.961669', 6);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (240, 'MFS Investment Management', '2025-02-08 21:50:04.966722', '2025-02-08 21:50:04.966722', 6);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (241, 'Dimensional Fund Advisors', '2025-02-08 21:50:04.97318', '2025-02-08 21:50:04.97318', 6);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (242, 'AQR Capital Management', '2025-02-08 21:50:04.979998', '2025-02-08 21:50:04.979998', 6);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (243, 'DoubleLine Capital', '2025-02-08 21:50:04.985304', '2025-02-08 21:50:04.985304', 6);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (244, 'Voya Investment Management', '2025-02-08 21:50:04.990551', '2025-02-08 21:50:04.990551', 6);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (245, 'Brandywine Global', '2025-02-08 21:50:04.995747', '2025-02-08 21:50:04.995747', 6);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (246, 'Eaton Vance', '2025-02-08 21:50:05.000971', '2025-02-08 21:50:05.000971', 6);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (247, 'Robeco', '2025-02-08 21:50:05.006003', '2025-02-08 21:50:05.006003', 6);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (248, 'Loomis Sayles', '2025-02-08 21:50:05.011055', '2025-02-08 21:50:05.011055', 6);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (249, 'Federated Hermes', '2025-02-08 21:50:05.016149', '2025-02-08 21:50:05.016149', 6);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (250, 'ClearBridge Investments', '2025-02-08 21:50:05.020966', '2025-02-08 21:50:05.020966', 6);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (251, 'Datadog', '2025-02-08 21:50:05.026088', '2025-02-08 21:50:05.026088', 7);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (252, 'Databricks', '2025-02-08 21:50:05.032834', '2025-02-08 21:50:05.032834', 7);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (253, 'Microsoft', '2025-02-08 21:50:05.039082', '2025-02-08 21:50:05.039082', 7);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (254, 'Amazon', '2025-02-08 21:50:05.044451', '2025-02-08 21:50:05.044451', 7);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (255, 'Google', '2025-02-08 21:50:05.049758', '2025-02-08 21:50:05.049758', 7);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (256, 'Apple', '2025-02-08 21:50:05.054966', '2025-02-08 21:50:05.054966', 7);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (257, 'Meta (formerly Facebook)', '2025-02-08 21:50:05.060179', '2025-02-08 21:50:05.060179', 7);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (258, 'Adobe', '2025-02-08 21:50:05.065', '2025-02-08 21:50:05.065', 7);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (259, 'Salesforce', '2025-02-08 21:50:05.070037', '2025-02-08 21:50:05.070037', 7);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (260, 'Intel', '2025-02-08 21:50:05.075073', '2025-02-08 21:50:05.075073', 7);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (261, 'General Electric', '2025-02-08 21:50:05.080219', '2025-02-08 21:50:05.080219', 7);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (262, '3M', '2025-02-08 21:50:05.085266', '2025-02-08 21:50:05.085266', 7);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (263, 'Caterpillar', '2025-02-08 21:50:05.090601', '2025-02-08 21:50:05.090601', 7);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (264, 'Honeywell', '2025-02-08 21:50:05.096962', '2025-02-08 21:50:05.096962', 7);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (265, 'Emerson Electric', '2025-02-08 21:50:05.103173', '2025-02-08 21:50:05.103173', 7);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (266, 'Deere & Company', '2025-02-08 21:50:05.108527', '2025-02-08 21:50:05.108527', 7);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (267, 'Parker Hannifin', '2025-02-08 21:50:05.113728', '2025-02-08 21:50:05.113728', 7);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (268, 'Rockwell Automation', '2025-02-08 21:50:05.118914', '2025-02-08 21:50:05.118914', 7);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (269, 'Eaton Corporation', '2025-02-08 21:50:05.124137', '2025-02-08 21:50:05.124137', 7);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (270, 'Textron', '2025-02-08 21:50:05.129218', '2025-02-08 21:50:05.129218', 7);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (271, 'Procter & Gamble', '2025-02-08 21:50:05.134302', '2025-02-08 21:50:05.134302', 7);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (272, 'Coca-Cola', '2025-02-08 21:50:05.139385', '2025-02-08 21:50:05.139385', 7);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (273, 'PepsiCo', '2025-02-08 21:50:05.144485', '2025-02-08 21:50:05.144485', 7);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (274, 'Unilever', '2025-02-08 21:50:05.149441', '2025-02-08 21:50:05.149441', 7);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (275, 'Nestlé', '2025-02-08 21:50:05.156004', '2025-02-08 21:50:05.156004', 7);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (276, 'Colgate-Palmolive', '2025-02-08 21:50:05.162147', '2025-02-08 21:50:05.162147', 7);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (277, 'Kimberly-Clark', '2025-02-08 21:50:05.167333', '2025-02-08 21:50:05.167333', 7);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (278, 'Mondelez International', '2025-02-08 21:50:05.172564', '2025-02-08 21:50:05.172564', 7);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (279, 'The Hershey Company', '2025-02-08 21:50:05.177856', '2025-02-08 21:50:05.177856', 7);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (280, 'Kraft Heinz', '2025-02-08 21:50:05.182987', '2025-02-08 21:50:05.182987', 7);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (281, 'Johnson & Johnson', '2025-02-08 21:50:05.188861', '2025-02-08 21:50:05.188861', 7);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (282, 'Pfizer', '2025-02-08 21:50:05.193971', '2025-02-08 21:50:05.193971', 7);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (283, 'Merck & Co.', '2025-02-08 21:50:05.199111', '2025-02-08 21:50:05.199111', 7);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (284, 'AbbVie', '2025-02-08 21:50:05.204258', '2025-02-08 21:50:05.204258', 7);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (285, 'Bristol-Myers Squibb', '2025-02-08 21:50:05.209122', '2025-02-08 21:50:05.209122', 7);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (286, 'Amgen', '2025-02-08 21:50:05.215836', '2025-02-08 21:50:05.215836', 7);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (287, 'Gilead Sciences', '2025-02-08 21:50:05.222066', '2025-02-08 21:50:05.222066', 7);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (288, 'Eli Lilly', '2025-02-08 21:50:05.227463', '2025-02-08 21:50:05.227463', 7);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (289, 'Medtronic', '2025-02-08 21:50:05.232791', '2025-02-08 21:50:05.232791', 7);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (290, 'Roche', '2025-02-08 21:50:05.238076', '2025-02-08 21:50:05.238076', 7);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (291, 'Walmart', '2025-02-08 21:50:05.242901', '2025-02-08 21:50:05.242901', 7);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (292, 'Target', '2025-02-08 21:50:05.248131', '2025-02-08 21:50:05.248131', 7);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (293, 'Costco Wholesale', '2025-02-08 21:50:05.253199', '2025-02-08 21:50:05.253199', 7);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (294, 'Home Depot', '2025-02-08 21:50:05.258314', '2025-02-08 21:50:05.258314', 7);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (295, 'Lowe’s', '2025-02-08 21:50:05.263326', '2025-02-08 21:50:05.263326', 7);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (296, 'CVS Health', '2025-02-08 21:50:05.268361', '2025-02-08 21:50:05.268361', 7);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (297, 'Walgreens Boots Alliance', '2025-02-08 21:50:05.273465', '2025-02-08 21:50:05.273465', 7);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (298, 'Kroger', '2025-02-08 21:50:05.280057', '2025-02-08 21:50:05.280057', 7);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (299, 'Macy’s', '2025-02-08 21:50:05.286119', '2025-02-08 21:50:05.286119', 7);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (300, 'Nordstrom', '2025-02-08 21:50:05.291476', '2025-02-08 21:50:05.291476', 7);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (301, 'McKinsey & Company', '2025-02-08 21:50:05.296661', '2025-02-08 21:50:05.296661', 8);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (302, 'Boston Consulting Group (BCG)', '2025-02-08 21:50:05.301905', '2025-02-08 21:50:05.301905', 8);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (303, 'Bain & Company', '2025-02-08 21:50:05.307098', '2025-02-08 21:50:05.307098', 8);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (304, 'Roland Berger', '2025-02-08 21:50:05.3122', '2025-02-08 21:50:05.3122', 8);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (305, 'Oliver Wyman', '2025-02-08 21:50:05.317325', '2025-02-08 21:50:05.317325', 8);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (306, 'L.E.K. Consulting', '2025-02-08 21:50:05.322416', '2025-02-08 21:50:05.322416', 8);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (307, 'Arthur D. Little', '2025-02-08 21:50:05.327405', '2025-02-08 21:50:05.327405', 8);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (308, 'Deloitte Consulting', '2025-02-08 21:50:05.332635', '2025-02-08 21:50:05.332635', 8);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (309, 'PwC Advisory', '2025-02-08 21:50:05.339174', '2025-02-08 21:50:05.339174', 8);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (310, 'EY-Parthenon', '2025-02-08 21:50:05.345615', '2025-02-08 21:50:05.345615', 8);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (311, 'KPMG Strategy', '2025-02-08 21:50:05.350985', '2025-02-08 21:50:05.350985', 8);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (312, 'Grant Thornton Advisory', '2025-02-08 21:50:05.356344', '2025-02-08 21:50:05.356344', 8);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (313, 'BDO Consulting', '2025-02-08 21:50:05.361669', '2025-02-08 21:50:05.361669', 8);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (314, 'Cornerstone Research', '2025-02-08 21:50:05.366868', '2025-02-08 21:50:05.366868', 8);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (315, 'NERA Economic Consulting', '2025-02-08 21:50:05.371887', '2025-02-08 21:50:05.371887', 8);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (316, 'Compass Lexecon', '2025-02-08 21:50:05.377041', '2025-02-08 21:50:05.377041', 8);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (317, 'Analysis Group', '2025-02-08 21:50:05.382179', '2025-02-08 21:50:05.382179', 8);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (318, 'Brattle Group', '2025-02-08 21:50:05.387233', '2025-02-08 21:50:05.387233', 8);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (319, 'FTI Consulting', '2025-02-08 21:50:05.392421', '2025-02-08 21:50:05.392421', 8);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (320, 'AlixPartners', '2025-02-08 21:50:05.398612', '2025-02-08 21:50:05.398612', 8);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (321, 'Booz Allen Hamilton', '2025-02-08 21:50:05.404865', '2025-02-08 21:50:05.404865', 8);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (322, 'Zeb Consulting', '2025-02-08 21:50:05.410188', '2025-02-08 21:50:05.410188', 8);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (323, 'Simon-Kucher & Partners', '2025-02-08 21:50:05.415438', '2025-02-08 21:50:05.415438', 8);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (324, 'Keystone Strategy', '2025-02-08 21:50:05.420791', '2025-02-08 21:50:05.420791', 8);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (325, 'Putnam Associates', '2025-02-08 21:50:05.426019', '2025-02-08 21:50:05.426019', 8);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (326, 'Teneo', '2025-02-08 21:50:05.431107', '2025-02-08 21:50:05.431107', 8);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (327, 'Mars & Co', '2025-02-08 21:50:05.436223', '2025-02-08 21:50:05.436223', 8);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (328, 'OC&C Strategy Consultants', '2025-02-08 21:50:05.441045', '2025-02-08 21:50:05.441045', 8);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (329, 'Leerink Partners', '2025-02-10 03:16:36.086414', '2025-02-10 03:16:36.086414', 1);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (330, 'Centerview', '2025-02-11 16:05:21.0946', '2025-02-11 16:05:21.0946', 1);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (331, 'Baird', '2025-02-11 17:02:05.335846', '2025-02-11 17:02:05.335846', 1);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (332, 'Accenture', '2025-02-16 23:30:12.208719', '2025-02-16 23:30:12.208719', 8);
INSERT INTO public.companies (id, name, created_at, updated_at, position_type_id) VALUES (4, 'Bank of America', '2025-02-08 21:50:03.627561', '2025-02-18 14:48:29.952151', 1);


--
-- Data for Name: employee_views; Type: TABLE DATA; Schema: public; Owner: jacobspitzer
--

INSERT INTO public.employee_views (id, name, description, created_at, updated_at, picture) VALUES (2, 'Evercore', 'Comprehensive networking and interview recaps for Evercore investment bankers. Easily filter by group, seniority level, location, alma mater, and more.', '2025-02-10 17:39:51.123229', '2025-02-10 17:39:51.385283', NULL);
INSERT INTO public.employee_views (id, name, description, created_at, updated_at, picture) VALUES (1, 'Investment Banking', 'Comprehensive networking and interview recaps for investment bankers across all firms. Easily filter by bank, group, seniority level, location, alma mater, and more.', '2025-02-10 17:39:15.10809', '2025-02-10 17:39:59.975324', NULL);


--
-- Data for Name: locations; Type: TABLE DATA; Schema: public; Owner: jacobspitzer
--

INSERT INTO public.locations (id, name, created_at, updated_at) VALUES (1, 'Alabama', '2025-02-08 19:56:39.317011', '2025-02-08 19:56:39.317011');
INSERT INTO public.locations (id, name, created_at, updated_at) VALUES (2, 'Alaska', '2025-02-08 19:56:39.322621', '2025-02-08 19:56:39.322621');
INSERT INTO public.locations (id, name, created_at, updated_at) VALUES (3, 'Arizona', '2025-02-08 19:56:39.326352', '2025-02-08 19:56:39.326352');
INSERT INTO public.locations (id, name, created_at, updated_at) VALUES (4, 'Arkansas', '2025-02-08 19:56:39.33008', '2025-02-08 19:56:39.33008');
INSERT INTO public.locations (id, name, created_at, updated_at) VALUES (5, 'California', '2025-02-08 19:56:39.333929', '2025-02-08 19:56:39.333929');
INSERT INTO public.locations (id, name, created_at, updated_at) VALUES (6, 'Colorado', '2025-02-08 19:56:39.337611', '2025-02-08 19:56:39.337611');
INSERT INTO public.locations (id, name, created_at, updated_at) VALUES (7, 'Connecticut', '2025-02-08 19:56:39.341294', '2025-02-08 19:56:39.341294');
INSERT INTO public.locations (id, name, created_at, updated_at) VALUES (8, 'Delaware', '2025-02-08 19:56:39.345579', '2025-02-08 19:56:39.345579');
INSERT INTO public.locations (id, name, created_at, updated_at) VALUES (9, 'Florida', '2025-02-08 19:56:39.355968', '2025-02-08 19:56:39.355968');
INSERT INTO public.locations (id, name, created_at, updated_at) VALUES (10, 'Georgia', '2025-02-08 19:56:39.359789', '2025-02-08 19:56:39.359789');
INSERT INTO public.locations (id, name, created_at, updated_at) VALUES (11, 'Hawaii', '2025-02-08 19:56:39.363428', '2025-02-08 19:56:39.363428');
INSERT INTO public.locations (id, name, created_at, updated_at) VALUES (12, 'Idaho', '2025-02-08 19:56:39.367366', '2025-02-08 19:56:39.367366');
INSERT INTO public.locations (id, name, created_at, updated_at) VALUES (13, 'Illinois', '2025-02-08 19:56:39.37093', '2025-02-08 19:56:39.37093');
INSERT INTO public.locations (id, name, created_at, updated_at) VALUES (14, 'Indiana', '2025-02-08 19:56:39.378897', '2025-02-08 19:56:39.378897');
INSERT INTO public.locations (id, name, created_at, updated_at) VALUES (15, 'Iowa', '2025-02-08 19:56:39.382713', '2025-02-08 19:56:39.382713');
INSERT INTO public.locations (id, name, created_at, updated_at) VALUES (16, 'Kansas', '2025-02-08 19:56:39.386844', '2025-02-08 19:56:39.386844');
INSERT INTO public.locations (id, name, created_at, updated_at) VALUES (17, 'Kentucky', '2025-02-08 19:56:39.390734', '2025-02-08 19:56:39.390734');
INSERT INTO public.locations (id, name, created_at, updated_at) VALUES (18, 'Louisiana', '2025-02-08 19:56:39.39454', '2025-02-08 19:56:39.39454');
INSERT INTO public.locations (id, name, created_at, updated_at) VALUES (19, 'Maine', '2025-02-08 19:56:39.40026', '2025-02-08 19:56:39.40026');
INSERT INTO public.locations (id, name, created_at, updated_at) VALUES (20, 'Maryland', '2025-02-08 19:56:39.412272', '2025-02-08 19:56:39.412272');
INSERT INTO public.locations (id, name, created_at, updated_at) VALUES (21, 'Massachusetts', '2025-02-08 19:56:39.417306', '2025-02-08 19:56:39.417306');
INSERT INTO public.locations (id, name, created_at, updated_at) VALUES (22, 'Michigan', '2025-02-08 19:56:39.420951', '2025-02-08 19:56:39.420951');
INSERT INTO public.locations (id, name, created_at, updated_at) VALUES (23, 'Minnesota', '2025-02-08 19:56:39.424911', '2025-02-08 19:56:39.424911');
INSERT INTO public.locations (id, name, created_at, updated_at) VALUES (24, 'Mississippi', '2025-02-08 19:56:39.428898', '2025-02-08 19:56:39.428898');
INSERT INTO public.locations (id, name, created_at, updated_at) VALUES (25, 'Missouri', '2025-02-08 19:56:39.432366', '2025-02-08 19:56:39.432366');
INSERT INTO public.locations (id, name, created_at, updated_at) VALUES (26, 'Montana', '2025-02-08 19:56:39.436167', '2025-02-08 19:56:39.436167');
INSERT INTO public.locations (id, name, created_at, updated_at) VALUES (27, 'Nebraska', '2025-02-08 19:56:39.439703', '2025-02-08 19:56:39.439703');
INSERT INTO public.locations (id, name, created_at, updated_at) VALUES (28, 'Nevada', '2025-02-08 19:56:39.443551', '2025-02-08 19:56:39.443551');
INSERT INTO public.locations (id, name, created_at, updated_at) VALUES (29, 'New Hampshire', '2025-02-08 19:56:39.447261', '2025-02-08 19:56:39.447261');
INSERT INTO public.locations (id, name, created_at, updated_at) VALUES (30, 'New Jersey', '2025-02-08 19:56:39.450835', '2025-02-08 19:56:39.450835');
INSERT INTO public.locations (id, name, created_at, updated_at) VALUES (31, 'New Mexico', '2025-02-08 19:56:39.454814', '2025-02-08 19:56:39.454814');
INSERT INTO public.locations (id, name, created_at, updated_at) VALUES (32, 'New York', '2025-02-08 19:56:39.459303', '2025-02-08 19:56:39.459303');
INSERT INTO public.locations (id, name, created_at, updated_at) VALUES (33, 'North Carolina', '2025-02-08 19:56:39.464092', '2025-02-08 19:56:39.464092');
INSERT INTO public.locations (id, name, created_at, updated_at) VALUES (34, 'North Dakota', '2025-02-08 19:56:39.467712', '2025-02-08 19:56:39.467712');
INSERT INTO public.locations (id, name, created_at, updated_at) VALUES (35, 'Ohio', '2025-02-08 19:56:39.471575', '2025-02-08 19:56:39.471575');
INSERT INTO public.locations (id, name, created_at, updated_at) VALUES (36, 'Oklahoma', '2025-02-08 19:56:39.475293', '2025-02-08 19:56:39.475293');
INSERT INTO public.locations (id, name, created_at, updated_at) VALUES (37, 'Oregon', '2025-02-08 19:56:39.478958', '2025-02-08 19:56:39.478958');
INSERT INTO public.locations (id, name, created_at, updated_at) VALUES (38, 'Pennsylvania', '2025-02-08 19:56:39.485004', '2025-02-08 19:56:39.485004');
INSERT INTO public.locations (id, name, created_at, updated_at) VALUES (39, 'Rhode Island', '2025-02-08 19:56:39.490939', '2025-02-08 19:56:39.490939');
INSERT INTO public.locations (id, name, created_at, updated_at) VALUES (40, 'South Carolina', '2025-02-08 19:56:39.496009', '2025-02-08 19:56:39.496009');
INSERT INTO public.locations (id, name, created_at, updated_at) VALUES (41, 'South Dakota', '2025-02-08 19:56:39.499775', '2025-02-08 19:56:39.499775');
INSERT INTO public.locations (id, name, created_at, updated_at) VALUES (42, 'Tennessee', '2025-02-08 19:56:39.50327', '2025-02-08 19:56:39.50327');
INSERT INTO public.locations (id, name, created_at, updated_at) VALUES (43, 'Texas', '2025-02-08 19:56:39.507024', '2025-02-08 19:56:39.507024');
INSERT INTO public.locations (id, name, created_at, updated_at) VALUES (44, 'Utah', '2025-02-08 19:56:39.511287', '2025-02-08 19:56:39.511287');
INSERT INTO public.locations (id, name, created_at, updated_at) VALUES (45, 'Vermont', '2025-02-08 19:56:39.514877', '2025-02-08 19:56:39.514877');
INSERT INTO public.locations (id, name, created_at, updated_at) VALUES (46, 'Virginia', '2025-02-08 19:56:39.519913', '2025-02-08 19:56:39.519913');
INSERT INTO public.locations (id, name, created_at, updated_at) VALUES (47, 'Washington', '2025-02-08 19:56:39.523858', '2025-02-08 19:56:39.523858');
INSERT INTO public.locations (id, name, created_at, updated_at) VALUES (48, 'West Virginia', '2025-02-08 19:56:39.527831', '2025-02-08 19:56:39.527831');
INSERT INTO public.locations (id, name, created_at, updated_at) VALUES (49, 'Wisconsin', '2025-02-08 19:56:39.531865', '2025-02-08 19:56:39.531865');
INSERT INTO public.locations (id, name, created_at, updated_at) VALUES (50, 'Wyoming', '2025-02-08 19:56:39.535687', '2025-02-08 19:56:39.535687');
INSERT INTO public.locations (id, name, created_at, updated_at) VALUES (51, 'London', '2025-02-08 19:56:39.539347', '2025-02-08 19:56:39.539347');
INSERT INTO public.locations (id, name, created_at, updated_at) VALUES (52, 'India', '2025-02-08 19:56:39.543012', '2025-02-08 19:56:39.543012');
INSERT INTO public.locations (id, name, created_at, updated_at) VALUES (53, 'Other', '2025-02-08 19:56:39.546829', '2025-02-08 19:56:39.546829');


--
-- Data for Name: groups; Type: TABLE DATA; Schema: public; Owner: jacobspitzer
--

INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (1, 'TMT', NULL, NULL, '2025-02-08 23:46:54.672292', '2025-02-08 23:46:54.672292', 1, true);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (2, 'Healthcare', NULL, NULL, '2025-02-08 23:46:54.677001', '2025-02-08 23:46:54.677001', 1, true);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (3, 'M&A', NULL, NULL, '2025-02-08 23:46:54.680321', '2025-02-08 23:46:54.680321', 1, true);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (4, 'LevFin', NULL, NULL, '2025-02-08 23:46:54.684246', '2025-02-08 23:46:54.684246', 1, true);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (5, 'Restructuring', NULL, NULL, '2025-02-08 23:46:54.687288', '2025-02-08 23:46:54.687288', 1, true);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (6, 'ECM', NULL, NULL, '2025-02-08 23:46:54.693177', '2025-02-08 23:46:54.693177', 1, true);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (7, 'DCM', NULL, NULL, '2025-02-08 23:46:54.698324', '2025-02-08 23:46:54.698324', 1, true);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (8, 'Private Capital Advisory', NULL, NULL, '2025-02-08 23:46:54.701726', '2025-02-08 23:46:54.701726', 1, true);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (9, 'Financial Sponsors', NULL, NULL, '2025-02-08 23:46:54.705472', '2025-02-08 23:46:54.705472', 1, true);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (10, 'FIG', NULL, NULL, '2025-02-08 23:46:54.710296', '2025-02-08 23:46:54.710296', 1, true);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (11, 'Energy & Natural Resources', NULL, NULL, '2025-02-08 23:46:54.713903', '2025-02-08 23:46:54.713903', 1, true);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (12, 'Consumer & Retail', NULL, NULL, '2025-02-08 23:46:54.71916', '2025-02-08 23:46:54.71916', 1, true);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (13, 'Real Estate, Gaming, & Lodging', NULL, NULL, '2025-02-08 23:46:54.722838', '2025-02-08 23:46:54.722838', 1, true);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (14, 'Public Sector & Infrastructure', NULL, NULL, '2025-02-08 23:46:54.727198', '2025-02-08 23:46:54.727198', 1, true);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (27, 'Consumer / Retail', 1, NULL, '2025-02-08 23:52:34.959455', '2025-02-08 23:52:34.959455', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (28, 'Financial and Strategic Investors', 1, NULL, '2025-02-08 23:52:34.963145', '2025-02-08 23:52:34.963145', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (29, 'Financial Institutions', 1, NULL, '2025-02-08 23:52:34.966491', '2025-02-08 23:52:34.966491', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (30, 'Healthcare', 1, NULL, '2025-02-08 23:52:34.97105', '2025-02-08 23:52:34.97105', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (31, 'Industrials', 1, NULL, '2025-02-08 23:52:34.974597', '2025-02-08 23:52:34.974597', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (32, 'Natural Resources', 1, NULL, '2025-02-08 23:52:34.978276', '2025-02-08 23:52:34.978276', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (33, 'Public Sector and Infrastructure', 1, NULL, '2025-02-08 23:52:34.981554', '2025-02-08 23:52:34.981554', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (34, 'Real Estate', 1, NULL, '2025-02-08 23:52:34.985293', '2025-02-08 23:52:34.985293', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (35, 'TMT', 1, NULL, '2025-02-08 23:52:34.989341', '2025-02-08 23:52:34.989341', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (36, 'ECM', 1, NULL, '2025-02-08 23:54:17.131436', '2025-02-08 23:54:17.131436', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (37, 'Investment Grade Capital Markets', 1, NULL, '2025-02-08 23:54:17.135547', '2025-02-08 23:54:17.135547', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (38, 'Leveraged Finance Capital Markets', 1, NULL, '2025-02-08 23:54:17.138729', '2025-02-08 23:54:17.138729', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (39, 'Corporate Derivatives', 1, NULL, '2025-02-08 23:54:17.142167', '2025-02-08 23:54:17.142167', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (40, 'Structured Finance', 1, NULL, '2025-02-08 23:54:17.145614', '2025-02-08 23:54:17.145614', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (41, 'Real Estate Financing', 1, NULL, '2025-02-08 23:54:17.148414', '2025-02-08 23:54:17.148414', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (42, 'Sustainable Banking', 1, NULL, '2025-02-08 23:54:17.151978', '2025-02-08 23:54:17.151978', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (43, 'Consumer retail', 2, NULL, '2025-02-08 23:56:17.425337', '2025-02-08 23:56:17.425337', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (44, 'Energy and infrastructure', 2, NULL, '2025-02-08 23:56:17.429361', '2025-02-08 23:56:17.429361', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (45, 'Financial institutions', 2, NULL, '2025-02-08 23:56:17.432886', '2025-02-08 23:56:17.432886', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (46, 'Financial investors', 2, NULL, '2025-02-08 23:56:17.436', '2025-02-08 23:56:17.436', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (47, 'Healthcare', 2, NULL, '2025-02-08 23:56:17.439768', '2025-02-08 23:56:17.439768', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (48, 'Industrials', 2, NULL, '2025-02-08 23:56:17.443011', '2025-02-08 23:56:17.443011', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (49, 'Media and communications', 2, NULL, '2025-02-08 23:56:17.448072', '2025-02-08 23:56:17.448072', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (50, 'Public sector', 2, NULL, '2025-02-08 23:56:17.452465', '2025-02-08 23:56:17.452465', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (51, 'Real estate', 2, NULL, '2025-02-08 23:56:17.456523', '2025-02-08 23:56:17.456523', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (52, 'Technology', 2, NULL, '2025-02-08 23:56:17.46004', '2025-02-08 23:56:17.46004', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (53, 'Business Services', 3, NULL, '2025-02-09 00:03:16.508172', '2025-02-09 00:03:16.508172', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (54, 'Consumer Retail', 3, NULL, '2025-02-09 00:03:16.512417', '2025-02-09 00:03:16.512417', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (55, 'Financial Institutions', 3, NULL, '2025-02-09 00:03:16.515969', '2025-02-09 00:03:16.515969', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (56, 'Financial Sponsors', 3, NULL, '2025-02-09 00:03:16.519505', '2025-02-09 00:03:16.519505', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (57, 'Global Power & Utilities', 3, NULL, '2025-02-09 00:03:16.522855', '2025-02-09 00:03:16.522855', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (58, 'Healthcare', 3, NULL, '2025-02-09 00:03:16.526724', '2025-02-09 00:03:16.526724', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (59, 'Industrials', 3, NULL, '2025-02-09 00:03:16.533371', '2025-02-09 00:03:16.533371', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (60, 'Latin America', 3, NULL, '2025-02-09 00:03:16.537364', '2025-02-09 00:03:16.537364', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (61, 'Media & Communications', 3, NULL, '2025-02-09 00:03:16.541604', '2025-02-09 00:03:16.541604', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (62, 'M&A', 3, NULL, '2025-02-09 00:03:16.5446', '2025-02-09 00:03:16.5446', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (63, 'Oil & Gas', 3, NULL, '2025-02-09 00:03:16.548223', '2025-02-09 00:03:16.548223', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (64, 'Real Estate', 3, NULL, '2025-02-09 00:03:16.551843', '2025-02-09 00:03:16.551843', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (65, 'Shareholder Activism', 3, NULL, '2025-02-09 00:03:16.556769', '2025-02-09 00:03:16.556769', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (66, 'Transportation', 3, NULL, '2025-02-09 00:03:16.56008', '2025-02-09 00:03:16.56008', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (67, 'Technology', 3, NULL, '2025-02-09 00:03:16.566738', '2025-02-09 00:03:16.566738', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (70, 'Natural resources and energy transition', 4, NULL, '2025-02-09 00:06:01.991483', '2025-02-09 00:06:01.991483', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (71, 'Financial institutions', 4, NULL, '2025-02-09 00:06:01.994834', '2025-02-09 00:06:01.994834', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (73, 'Industrials', 4, NULL, '2025-02-09 00:06:02.001721', '2025-02-09 00:06:02.001721', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (75, 'TMT', 4, NULL, '2025-02-09 00:06:02.00854', '2025-02-09 00:06:02.00854', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (76, 'Financial Sponsors', 4, NULL, '2025-02-09 00:06:02.011597', '2025-02-09 00:06:02.011597', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (77, 'Metals & Mining', 5, NULL, '2025-02-09 00:11:59.726804', '2025-02-09 00:11:59.726804', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (78, 'Consumer & Health', 5, NULL, '2025-02-09 00:11:59.731408', '2025-02-09 00:11:59.731408', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (79, 'Power, Utilities & Renewables Group', 5, NULL, '2025-02-09 00:11:59.734756', '2025-02-09 00:11:59.734756', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (80, 'M&A', 5, NULL, '2025-02-09 00:11:59.738308', '2025-02-09 00:11:59.738308', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (81, 'Tech', 5, NULL, '2025-02-09 00:11:59.741609', '2025-02-09 00:11:59.741609', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (82, 'Financial Sponsors', 5, NULL, '2025-02-09 00:11:59.746223', '2025-02-09 00:11:59.746223', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (83, 'Healthcare', 8, NULL, '2025-02-09 00:14:09.775939', '2025-02-09 00:14:09.775939', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (84, 'Industrials', 8, NULL, '2025-02-09 00:14:09.780796', '2025-02-09 00:14:09.780796', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (16, 'Communications', 11, NULL, '2025-02-08 23:50:00', '2025-02-08 23:50:00', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (18, 'Financial Services', 11, NULL, '2025-02-08 23:50:00', '2025-02-08 23:50:00', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (17, 'Consumer / Retail', 11, NULL, '2025-02-08 23:50:00', '2025-02-08 23:50:00', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (19, 'Healthcare', 11, NULL, '2025-02-08 23:50:00', '2025-02-08 23:50:00', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (20, 'Industrials', 11, NULL, '2025-02-08 23:50:00', '2025-02-08 23:50:00', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (21, 'Infrastructure, Utilities & Renewables (IUR)', 11, NULL, '2025-02-08 23:50:00', '2025-02-08 23:50:00', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (22, 'Insurance', 11, NULL, '2025-02-08 23:50:00', '2025-02-08 23:50:00', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (23, 'Information & Media', 11, NULL, '2025-02-08 23:50:00', '2025-02-08 23:50:00', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (24, 'Metals, Materials & Mining', 11, NULL, '2025-02-08 23:50:00', '2025-02-08 23:50:00', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (25, 'Technology', 11, NULL, '2025-02-08 23:50:00', '2025-02-08 23:50:00', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (26, 'Transportation', 11, NULL, '2025-02-08 23:50:00', '2025-02-08 23:50:00', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (85, 'Financial Institutions', 8, NULL, '2025-02-09 00:14:09.785864', '2025-02-09 00:14:09.785864', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (86, 'Real Estate', 8, NULL, '2025-02-09 00:14:09.79191', '2025-02-09 00:14:09.79191', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (87, 'TMT', 8, NULL, '2025-02-09 00:14:09.797448', '2025-02-09 00:14:09.797448', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (88, 'Consumer Retail', 8, NULL, '2025-02-09 00:14:09.802659', '2025-02-09 00:14:09.802659', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (89, 'Infrastructure', 8, NULL, '2025-02-09 00:14:09.808664', '2025-02-09 00:14:09.808664', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (90, 'Energy Transition', 8, NULL, '2025-02-09 00:14:09.821955', '2025-02-09 00:14:09.821955', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (91, 'Financial Sponsors', 8, NULL, '2025-02-09 00:14:09.825192', '2025-02-09 00:14:09.825192', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (92, 'TMT', NULL, NULL, '2025-02-09 00:16:28.868989', '2025-02-09 00:16:28.868989', 2, true);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (93, 'Healthcare', NULL, NULL, '2025-02-09 00:16:28.872462', '2025-02-09 00:16:28.872462', 2, true);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (94, 'Consumer & Retail', NULL, NULL, '2025-02-09 00:16:28.875703', '2025-02-09 00:16:28.875703', 2, true);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (95, 'Industrials', NULL, NULL, '2025-02-09 00:16:28.879173', '2025-02-09 00:16:28.879173', 2, true);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (96, 'Financial Services', NULL, NULL, '2025-02-09 00:16:28.882127', '2025-02-09 00:16:28.882127', 2, true);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (97, 'Energy & Infrastructure', NULL, NULL, '2025-02-09 00:16:28.885494', '2025-02-09 00:16:28.885494', 2, true);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (98, 'Real Estate', NULL, NULL, '2025-02-09 00:16:28.888203', '2025-02-09 00:16:28.888203', 2, true);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (99, 'Business Services', NULL, NULL, '2025-02-09 00:16:28.891536', '2025-02-09 00:16:28.891536', 2, true);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (100, 'Growth Equity', NULL, NULL, '2025-02-09 00:16:28.89501', '2025-02-09 00:16:28.89501', 2, true);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (101, 'Distressed / Special Situations', NULL, NULL, '2025-02-09 00:16:28.898265', '2025-02-09 00:16:28.898265', 2, true);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (111, 'Technology', NULL, NULL, '2025-02-09 00:20:39.568992', '2025-02-09 00:20:39.568992', 3, true);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (112, 'Healthcare & Life Sciences', NULL, NULL, '2025-02-09 00:20:39.572647', '2025-02-09 00:20:39.572647', 3, true);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (113, 'Deep Tech & Frontier Tech', NULL, NULL, '2025-02-09 00:20:39.575885', '2025-02-09 00:20:39.575885', 3, true);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (114, 'Consumer & Entertainment', NULL, NULL, '2025-02-09 00:20:39.57933', '2025-02-09 00:20:39.57933', 3, true);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (115, 'Pre-Seed', NULL, NULL, '2025-02-09 00:20:39.585741', '2025-02-09 00:20:39.585741', 3, true);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (116, 'Seed', NULL, NULL, '2025-02-09 00:20:39.588477', '2025-02-09 00:20:39.588477', 3, true);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (117, 'Series A', NULL, NULL, '2025-02-09 00:20:39.59224', '2025-02-09 00:20:39.59224', 3, true);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (118, 'Series B', NULL, NULL, '2025-02-09 00:20:39.605807', '2025-02-09 00:20:39.605807', 3, true);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (119, 'Series C+', NULL, NULL, '2025-02-09 00:20:39.612', '2025-02-09 00:20:39.612', 3, true);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (120, 'Technology', NULL, NULL, '2025-02-09 00:22:20.010639', '2025-02-09 00:22:20.010639', 4, true);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (121, 'Healthcare & Life Sciences', NULL, NULL, '2025-02-09 00:22:20.014329', '2025-02-09 00:22:20.014329', 4, true);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (122, 'Financial Services', NULL, NULL, '2025-02-09 00:22:20.01768', '2025-02-09 00:22:20.01768', 4, true);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (123, 'Consumer & Retail', NULL, NULL, '2025-02-09 00:22:20.021029', '2025-02-09 00:22:20.021029', 4, true);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (124, 'Energy & Infrastructure', NULL, NULL, '2025-02-09 00:22:20.024322', '2025-02-09 00:22:20.024322', 4, true);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (125, 'Media, Entertainment, & Gaming', NULL, NULL, '2025-02-09 00:22:20.032193', '2025-02-09 00:22:20.032193', 4, true);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (126, 'Industrial & Manufacturing', NULL, NULL, '2025-02-09 00:22:20.04199', '2025-02-09 00:22:20.04199', 4, true);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (127, 'TMT', NULL, NULL, '2025-02-09 00:23:59.164875', '2025-02-09 00:23:59.164875', 5, true);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (128, 'Healthcare & Biotech', NULL, NULL, '2025-02-09 00:23:59.169145', '2025-02-09 00:23:59.169145', 5, true);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (129, 'Financial Services & Fintech', NULL, NULL, '2025-02-09 00:23:59.17226', '2025-02-09 00:23:59.17226', 5, true);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (130, 'Energy & Natural Resources', NULL, NULL, '2025-02-09 00:23:59.1757', '2025-02-09 00:23:59.1757', 5, true);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (131, 'Consumer, Retail & E-Commerce', NULL, NULL, '2025-02-09 00:23:59.17883', '2025-02-09 00:23:59.17883', 5, true);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (132, 'Industrials & Aerospace', NULL, NULL, '2025-02-09 00:23:59.182238', '2025-02-09 00:23:59.182238', 5, true);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (133, 'Real Estate & REITs', NULL, NULL, '2025-02-09 00:23:59.186068', '2025-02-09 00:23:59.186068', 5, true);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (134, 'Global Macro & Multi-Industry', NULL, NULL, '2025-02-09 00:23:59.19076', '2025-02-09 00:23:59.19076', 5, true);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (135, 'Long / Short', NULL, NULL, '2025-02-09 00:23:59.196678', '2025-02-09 00:23:59.196678', 5, true);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (136, 'Quantitative', NULL, NULL, '2025-02-09 00:23:59.200289', '2025-02-09 00:23:59.200289', 5, true);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (137, 'Long only', NULL, NULL, '2025-02-09 00:24:43.312253', '2025-02-09 00:24:43.312253', 5, true);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (138, 'Short only', NULL, NULL, '2025-02-09 00:24:43.315754', '2025-02-09 00:24:43.315754', 5, true);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (154, 'TMT', NULL, NULL, '2025-02-09 00:29:22.349205', '2025-02-09 00:29:22.349205', 7, true);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (155, 'Healthcare & Life Sciences', NULL, NULL, '2025-02-09 00:29:22.353283', '2025-02-09 00:29:22.353283', 7, true);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (156, 'Financial Services & Fintech', NULL, NULL, '2025-02-09 00:29:22.356559', '2025-02-09 00:29:22.356559', 7, true);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (157, 'Energy & Natural Resources', NULL, NULL, '2025-02-09 00:29:22.359881', '2025-02-09 00:29:22.359881', 7, true);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (158, 'Consumer, Retail & E-Commerce', NULL, NULL, '2025-02-09 00:29:22.362965', '2025-02-09 00:29:22.362965', 7, true);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (159, 'Industrials & Manufacturing', NULL, NULL, '2025-02-09 00:29:22.366413', '2025-02-09 00:29:22.366413', 7, true);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (160, 'Real Estate & REITs', NULL, NULL, '2025-02-09 00:29:22.369854', '2025-02-09 00:29:22.369854', 7, true);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (161, 'TMT', NULL, NULL, '2025-02-09 00:30:42.677026', '2025-02-09 00:30:42.677026', 8, true);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (162, 'Healthcare & Life Sciences', NULL, NULL, '2025-02-09 00:30:42.680651', '2025-02-09 00:30:42.680651', 8, true);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (163, 'Financial Services', NULL, NULL, '2025-02-09 00:30:42.686395', '2025-02-09 00:30:42.686395', 8, true);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (164, 'Fintech', NULL, NULL, '2025-02-09 00:30:42.690527', '2025-02-09 00:30:42.690527', 8, true);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (165, 'Energy & Natural Resources', NULL, NULL, '2025-02-09 00:30:42.695633', '2025-02-09 00:30:42.695633', 8, true);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (166, 'Consumer, Retail & E-Commerce', NULL, NULL, '2025-02-09 00:30:42.701245', '2025-02-09 00:30:42.701245', 8, true);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (167, 'Industrials, Manufacturing & Aerospace', NULL, NULL, '2025-02-09 00:30:42.716992', '2025-02-09 00:30:42.716992', 8, true);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (168, 'Real Estate & Infrastructure', NULL, NULL, '2025-02-09 00:30:42.722289', '2025-02-09 00:30:42.722289', 8, true);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (169, 'Public Sector & Government', NULL, NULL, '2025-02-09 00:30:42.728165', '2025-02-09 00:30:42.728165', 8, true);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (170, 'TMT', NULL, NULL, '2025-02-09 00:32:06.210826', '2025-02-09 00:32:06.210826', 9, true);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (171, 'Healthcare & Life Sciences', NULL, NULL, '2025-02-09 00:32:06.214569', '2025-02-09 00:32:06.214569', 9, true);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (172, 'Financial Services & Fintech', NULL, NULL, '2025-02-09 00:32:06.218195', '2025-02-09 00:32:06.218195', 9, true);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (173, 'Energy & Industrials', NULL, NULL, '2025-02-09 00:32:06.221774', '2025-02-09 00:32:06.221774', 9, true);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (174, 'Consumer, Retail & Real Estate', NULL, NULL, '2025-02-09 00:32:06.22474', '2025-02-09 00:32:06.22474', 9, true);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (139, 'Buy Side', NULL, NULL, '2025-02-09 00:27:52.033607', '2025-02-09 00:27:52.033607', 6, true);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (140, 'Sell Side', NULL, NULL, '2025-02-09 00:27:52.037206', '2025-02-09 00:27:52.037206', 6, true);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (141, 'Equity', NULL, NULL, '2025-02-09 00:27:52.040235', '2025-02-09 00:27:52.040235', 6, true);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (142, 'Fixed Income', NULL, NULL, '2025-02-09 00:27:52.043195', '2025-02-09 00:27:52.043195', 6, true);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (143, 'Private Equity & Alternative Investments', NULL, NULL, '2025-02-09 00:27:52.046709', '2025-02-09 00:27:52.046709', 6, true);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (144, 'Real Estate & REITs', NULL, NULL, '2025-02-09 00:27:52.04991', '2025-02-09 00:27:52.04991', 6, true);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (145, 'Infrastructure', NULL, NULL, '2025-02-09 00:27:52.052609', '2025-02-09 00:27:52.052609', 6, true);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (146, 'ESG', NULL, NULL, '2025-02-09 00:27:52.056281', '2025-02-09 00:27:52.056281', 6, true);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (147, 'Multi-Asset', NULL, NULL, '2025-02-09 00:27:52.060171', '2025-02-09 00:27:52.060171', 6, true);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (148, 'TMT', NULL, NULL, '2025-02-09 00:27:52.066581', '2025-02-09 00:27:52.066581', 6, true);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (149, 'Healthcare & Life Sciences', NULL, NULL, '2025-02-09 00:27:52.069785', '2025-02-09 00:27:52.069785', 6, true);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (150, 'Financial Services & Fintech', NULL, NULL, '2025-02-09 00:27:52.073205', '2025-02-09 00:27:52.073205', 6, true);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (151, 'Energy & Natural Resources', NULL, NULL, '2025-02-09 00:27:52.077383', '2025-02-09 00:27:52.077383', 6, true);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (152, 'Consumer, Retail, & E-Commerce', NULL, NULL, '2025-02-09 00:27:52.081084', '2025-02-09 00:27:52.081084', 6, true);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (153, 'Industrials & Infrastructure', NULL, NULL, '2025-02-09 00:27:52.084213', '2025-02-09 00:27:52.084213', 6, true);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (175, 'Generalist', NULL, NULL, '2025-02-11 16:02:52.066896', '2025-02-11 16:02:52.066896', 1, true);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (176, 'M&A', 4, NULL, '2025-02-18 14:55:44.088445', '2025-02-18 14:55:44.088445', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (177, 'Healthcare', 4, NULL, '2025-02-18 14:55:44.094096', '2025-02-18 14:55:44.094096', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (178, 'EGRC (Emerging Growth and Regional Coverage)', 4, NULL, '2025-02-18 14:55:44.095956', '2025-02-18 14:55:44.095956', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (179, 'Consumer & Retail', 4, NULL, '2025-02-18 14:55:44.097662', '2025-02-18 14:55:44.097662', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (181, 'FIG', 4, NULL, '2025-02-18 14:55:44.101243', '2025-02-18 14:55:44.101243', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (183, 'Leveraged Finance', 4, NULL, '2025-02-18 14:55:44.104932', '2025-02-18 14:55:44.104932', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (184, 'FSG (Sponsors)', 4, NULL, '2025-02-18 14:55:44.106674', '2025-02-18 14:55:44.106674', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (185, 'ECM', 4, NULL, '2025-02-18 14:55:44.108413', '2025-02-18 14:55:44.108413', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (186, 'DCM', 4, NULL, '2025-02-18 14:55:44.110987', '2025-02-18 14:55:44.110987', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (187, 'Structured Products', 4, NULL, '2025-02-18 14:55:44.11282', '2025-02-18 14:55:44.11282', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (188, 'REGL (Real Estate Gaming & Lodging)', 4, NULL, '2025-02-18 14:55:44.11445', '2025-02-18 14:55:44.11445', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (189, 'Other', 4, NULL, '2025-02-18 14:55:44.115808', '2025-02-18 14:55:44.115808', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (15, 'Chemicals', 11, NULL, '2025-02-08 23:50:00', '2025-02-08 23:50:00', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (190, 'PCA (Private Capital Advisory)', 11, NULL, '2025-02-18 14:58:26.317766', '2025-02-18 14:58:26.317766', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (191, 'PCM (Private Capital Markets)', 11, NULL, '2025-02-18 14:58:26.320231', '2025-02-18 14:58:26.320231', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (192, 'Structured Products', 11, NULL, '2025-02-18 14:58:26.322741', '2025-02-18 14:58:26.322741', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (193, 'Healthcare', 18, NULL, '2025-02-18 15:04:04.406422', '2025-02-18 15:04:04.406422', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (194, 'Industrials', 18, NULL, '2025-02-18 15:04:04.409033', '2025-02-18 15:04:04.409033', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (195, 'Consumer', 18, NULL, '2025-02-18 15:04:04.411178', '2025-02-18 15:04:04.411178', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (196, 'REGL (Real Estate Gaming Lodging)', 18, NULL, '2025-02-18 15:04:04.412715', '2025-02-18 15:04:04.412715', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (197, 'Media & Communications', 18, NULL, '2025-02-18 15:04:04.414067', '2025-02-18 15:04:04.414067', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (198, 'Technology', 18, NULL, '2025-02-18 15:04:04.415797', '2025-02-18 15:04:04.415797', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (199, 'Fintech', 18, NULL, '2025-02-18 15:04:04.418043', '2025-02-18 15:04:04.418043', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (200, 'Power & Insurance', 18, NULL, '2025-02-18 15:04:04.420068', '2025-02-18 15:04:04.420068', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (201, 'Fintech', 18, NULL, '2025-02-18 15:04:04.421452', '2025-02-18 15:04:04.421452', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (202, 'Capital Markets Group', 18, NULL, '2025-02-18 15:04:04.422747', '2025-02-18 15:04:04.422747', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (203, 'Generalist', 330, NULL, '2025-02-18 15:06:33.018509', '2025-02-18 15:06:33.018509', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (204, 'Healthcare', 330, NULL, '2025-02-18 15:06:33.021205', '2025-02-18 15:06:33.021205', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (205, 'FIG', 330, NULL, '2025-02-18 15:06:33.023161', '2025-02-18 15:06:33.023161', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (206, 'Consumer', 330, NULL, '2025-02-18 15:06:33.024751', '2025-02-18 15:06:33.024751', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (207, 'Technology', 330, NULL, '2025-02-18 15:06:33.026199', '2025-02-18 15:06:33.026199', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (208, 'Generalist (TMT Focus)', 35, NULL, '2025-02-18 15:07:09.735927', '2025-02-18 15:07:09.735927', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (209, 'Generalist (TMT Focus)', 33, NULL, '2025-02-18 15:07:29.687178', '2025-02-18 15:07:29.687178', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (210, 'Generalist (TMT Focus)', 36, NULL, '2025-02-18 15:07:45.016328', '2025-02-18 15:07:45.016328', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (211, 'Consumer', 12, NULL, '2025-02-18 15:12:43.592653', '2025-02-18 15:12:43.592653', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (212, 'Energy & Power', 12, NULL, '2025-02-18 15:12:43.596937', '2025-02-18 15:12:43.596937', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (213, 'Financial Institutions', 12, NULL, '2025-02-18 15:12:43.598192', '2025-02-18 15:12:43.598192', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (214, 'Financial Sponsors', 12, NULL, '2025-02-18 15:12:43.600361', '2025-02-18 15:12:43.600361', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (215, 'Healthcare', 12, NULL, '2025-02-18 15:12:43.601781', '2025-02-18 15:12:43.601781', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (216, 'Industrials', 12, NULL, '2025-02-18 15:12:43.603792', '2025-02-18 15:12:43.603792', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (217, 'Leveraged Finance', 12, NULL, '2025-02-18 15:12:43.605488', '2025-02-18 15:12:43.605488', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (218, 'Municipal Finance', 12, NULL, '2025-02-18 15:12:43.607475', '2025-02-18 15:12:43.607475', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (219, 'REGL (Real Estate, Gaming & Lodging) ', 12, NULL, '2025-02-18 15:12:43.608597', '2025-02-18 15:12:43.608597', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (220, 'TMT', 12, NULL, '2025-02-18 15:12:43.610574', '2025-02-18 15:12:43.610574', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (221, 'M&A', 12, NULL, '2025-02-18 15:12:43.612004', '2025-02-18 15:12:43.612004', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (222, 'Leveraged Finance', 32, NULL, '2025-02-18 15:24:49.502602', '2025-02-18 15:24:49.502602', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (223, 'M&A', 32, NULL, '2025-02-18 15:24:49.505934', '2025-02-18 15:24:49.505934', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (224, 'Technolody', 32, NULL, '2025-02-18 15:24:49.508546', '2025-02-18 15:24:49.508546', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (225, 'Consumer & Retail', 32, NULL, '2025-02-18 15:24:49.510502', '2025-02-18 15:24:49.510502', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (226, 'Energy', 32, NULL, '2025-02-18 15:24:49.513359', '2025-02-18 15:24:49.513359', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (227, 'Financial Institutions', 32, NULL, '2025-02-18 15:24:49.516861', '2025-02-18 15:24:49.516861', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (228, 'Healthcare', 32, NULL, '2025-02-18 15:24:49.520287', '2025-02-18 15:24:49.520287', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (229, 'Industrials', 32, NULL, '2025-02-18 15:24:49.522136', '2025-02-18 15:24:49.522136', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (230, 'Infrastructure', 32, NULL, '2025-02-18 15:24:49.528546', '2025-02-18 15:24:49.528546', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (231, 'Media & Communications', 32, NULL, '2025-02-18 15:24:49.530692', '2025-02-18 15:24:49.530692', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (232, 'REGL (Real Estate, Gaming & Lodging)', 32, NULL, '2025-02-18 15:24:49.532745', '2025-02-18 15:24:49.532745', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (233, 'Structured Products', 31, NULL, '2025-02-18 15:27:32.177268', '2025-02-18 15:27:32.177268', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (234, 'Consumer & Retail', 31, NULL, '2025-02-18 15:27:32.179656', '2025-02-18 15:27:32.179656', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (235, 'Financial Institutions', 31, NULL, '2025-02-18 15:27:32.181131', '2025-02-18 15:27:32.181131', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (236, 'Healthcare', 31, NULL, '2025-02-18 15:27:32.182417', '2025-02-18 15:27:32.182417', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (237, 'Media, Telecom & Entertainment', 31, NULL, '2025-02-18 15:27:32.184115', '2025-02-18 15:27:32.184115', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (238, 'Sustainability', 31, NULL, '2025-02-18 15:27:32.185395', '2025-02-18 15:27:32.185395', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (239, 'Energy', 31, NULL, '2025-02-18 15:27:32.186817', '2025-02-18 15:27:32.186817', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (240, 'Financial Sponsors', 31, NULL, '2025-02-18 15:27:32.187817', '2025-02-18 15:27:32.187817', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (241, 'Real Estate', 31, NULL, '2025-02-18 15:27:32.189049', '2025-02-18 15:27:32.189049', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (242, 'Technology', 31, NULL, '2025-02-18 15:27:32.19103', '2025-02-18 15:27:32.19103', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (243, 'Leveraged Finance', 7, NULL, '2025-02-18 15:29:54.448052', '2025-02-18 15:29:54.448052', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (244, 'Financial Sponsors Group', 7, NULL, '2025-02-18 15:29:54.450741', '2025-02-18 15:29:54.450741', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (245, 'Real Estate, Gaming and Lodging', 7, NULL, '2025-02-18 15:29:54.452802', '2025-02-18 15:29:54.452802', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (246, 'Industrials', 7, NULL, '2025-02-18 15:31:13.706948', '2025-02-18 15:31:13.706948', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (247, 'M&A', 7, NULL, '2025-02-18 15:31:13.709107', '2025-02-18 15:31:13.709107', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (248, 'Consumer & Retail', 7, NULL, '2025-02-18 15:31:13.71116', '2025-02-18 15:31:13.71116', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (249, 'FIG', 7, NULL, '2025-02-18 15:31:13.712718', '2025-02-18 15:31:13.712718', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (250, 'TMT', 7, NULL, '2025-02-18 15:31:13.71427', '2025-02-18 15:31:13.71427', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (251, 'Natural Resources Group', 7, NULL, '2025-02-18 15:31:13.716024', '2025-02-18 15:31:13.716024', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (252, 'TMT', 9, NULL, '2025-02-18 15:37:59.36545', '2025-02-18 15:37:59.36545', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (253, 'Leveraged Finance', 9, NULL, '2025-02-18 15:37:59.367664', '2025-02-18 15:37:59.367664', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (254, 'FIG', 9, NULL, '2025-02-18 15:37:59.369104', '2025-02-18 15:37:59.369104', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (255, 'Industrials', 9, NULL, '2025-02-18 15:37:59.370753', '2025-02-18 15:37:59.370753', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (256, 'M&A', 9, NULL, '2025-02-18 15:37:59.372341', '2025-02-18 15:37:59.372341', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (257, 'LatAm', 9, NULL, '2025-02-18 15:37:59.373771', '2025-02-18 15:37:59.373771', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (258, 'Healthcare', 9, NULL, '2025-02-18 15:37:59.375286', '2025-02-18 15:37:59.375286', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (259, 'Sponsors', 9, NULL, '2025-02-18 15:37:59.376684', '2025-02-18 15:37:59.376684', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (260, 'Natural Resources', 9, NULL, '2025-02-18 15:37:59.378399', '2025-02-18 15:37:59.378399', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (261, 'LatAm', 4, NULL, '2025-02-18 15:38:14.75228', '2025-02-18 15:38:14.75228', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (262, 'Consumer & Retail', 10, NULL, '2025-02-18 15:44:02.016638', '2025-02-18 15:44:02.016638', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (263, 'Financial Institutions', 10, NULL, '2025-02-18 15:44:02.019025', '2025-02-18 15:44:02.019025', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (264, 'Financial Sponsors', 10, NULL, '2025-02-18 15:44:02.020315', '2025-02-18 15:44:02.020315', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (265, 'Healthcare', 10, NULL, '2025-02-18 15:44:02.021696', '2025-02-18 15:44:02.021696', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (266, 'Industrials', 10, NULL, '2025-02-18 15:44:02.022935', '2025-02-18 15:44:02.022935', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (267, 'Media, Entertainment & Sports', 10, NULL, '2025-02-18 15:44:02.025175', '2025-02-18 15:44:02.025175', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (268, 'Power, Energy and Infrastructure', 10, NULL, '2025-02-18 15:44:02.026825', '2025-02-18 15:44:02.026825', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (269, 'REGL (Real Estate, Gaming and Lodging)', 10, NULL, '2025-02-18 15:44:02.028205', '2025-02-18 15:44:02.028205', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (270, 'Technology', 10, NULL, '2025-02-18 15:44:02.029509', '2025-02-18 15:44:02.029509', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (271, 'Telecom & Digital Infrastructure', 10, NULL, '2025-02-18 15:44:02.030554', '2025-02-18 15:44:02.030554', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (272, 'Consumer & Retail', 17, NULL, '2025-02-18 15:46:27.029138', '2025-02-18 15:46:27.029138', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (273, 'Energy', 17, NULL, '2025-02-18 15:46:27.03159', '2025-02-18 15:46:27.03159', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (274, 'Financial Institutions', 17, NULL, '2025-02-18 15:46:27.03318', '2025-02-18 15:46:27.03318', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (275, 'Healthcare', 17, NULL, '2025-02-18 15:46:27.034744', '2025-02-18 15:46:27.034744', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (276, 'Industrials', 17, NULL, '2025-02-18 15:46:27.035946', '2025-02-18 15:46:27.035946', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (277, 'Technology', 17, NULL, '2025-02-18 15:46:27.037737', '2025-02-18 15:46:27.037737', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (278, 'Media & Communications', 17, NULL, '2025-02-18 15:46:27.039291', '2025-02-18 15:46:27.039291', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (279, 'Healthcare', 15, NULL, '2025-02-18 15:49:24.413968', '2025-02-18 15:49:24.413968', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (280, 'Mid-Markets', 15, NULL, '2025-02-18 15:49:24.416018', '2025-02-18 15:49:24.416018', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (281, 'TMT', 15, NULL, '2025-02-18 15:49:24.417833', '2025-02-18 15:49:24.417833', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (282, 'Energy', 15, NULL, '2025-02-18 15:49:24.419225', '2025-02-18 15:49:24.419225', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (283, 'Industrials', 15, NULL, '2025-02-18 15:49:24.421049', '2025-02-18 15:49:24.421049', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (284, 'Restructuring', 15, NULL, '2025-02-18 15:49:24.422399', '2025-02-18 15:49:24.422399', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (285, 'Leveraged Finance', 15, NULL, '2025-02-18 15:49:24.424276', '2025-02-18 15:49:24.424276', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (286, 'Private Equity Advisory Group', 15, NULL, '2025-02-18 15:49:24.425945', '2025-02-18 15:49:24.425945', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (287, 'FIG', 15, NULL, '2025-02-18 15:49:24.427333', '2025-02-18 15:49:24.427333', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (288, 'Power & Utilities', 15, NULL, '2025-02-18 15:49:24.429002', '2025-02-18 15:49:24.429002', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (289, 'Restructuring', 11, NULL, '2025-02-18 15:49:49.601747', '2025-02-18 15:49:49.601747', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (290, 'Restructuring', 330, NULL, '2025-02-18 15:50:02.645175', '2025-02-18 15:50:02.645175', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (291, 'Restructuring', 18, NULL, '2025-02-18 15:50:22.603248', '2025-02-18 15:50:22.603248', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (292, 'Restructuring', 10, NULL, '2025-02-18 15:50:35.658011', '2025-02-18 15:50:35.658011', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (293, 'Restructuring', 12, NULL, '2025-02-18 15:50:50.639155', '2025-02-18 15:50:50.639155', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (294, 'Restructuring', 17, NULL, '2025-02-18 15:52:22.95189', '2025-02-18 15:52:22.95189', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (295, 'Business Services', 13, NULL, '2025-02-18 15:57:03.509038', '2025-02-18 15:57:03.509038', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (296, 'Consumer', 13, NULL, '2025-02-18 15:57:03.510994', '2025-02-18 15:57:03.510994', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (297, 'Energy', 13, NULL, '2025-02-18 15:57:03.512737', '2025-02-18 15:57:03.512737', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (298, 'Financial Services', 13, NULL, '2025-02-18 15:57:03.514447', '2025-02-18 15:57:03.514447', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (299, 'FinTech', 13, NULL, '2025-02-18 15:57:03.515975', '2025-02-18 15:57:03.515975', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (300, 'Healthcare', 13, NULL, '2025-02-18 15:57:03.517061', '2025-02-18 15:57:03.517061', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (301, 'Industrials', 13, NULL, '2025-02-18 15:57:03.518621', '2025-02-18 15:57:03.518621', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (302, 'Real Estate, Lodging, and Leisure', 13, NULL, '2025-02-18 15:57:03.519866', '2025-02-18 15:57:03.519866', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (303, 'Technology', 13, NULL, '2025-02-18 15:57:03.520963', '2025-02-18 15:57:03.520963', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (304, 'Restructuring', 13, NULL, '2025-02-18 15:57:03.522443', '2025-02-18 15:57:03.522443', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (305, 'Leveraged Finance', 13, NULL, '2025-02-18 15:57:03.523777', '2025-02-18 15:57:03.523777', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (306, 'Consumer', 23, NULL, '2025-02-18 16:04:28.128926', '2025-02-18 16:04:28.128926', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (307, 'Industrials', 23, NULL, '2025-02-18 16:04:28.146204', '2025-02-18 16:04:28.146204', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (308, 'Healthcare', 23, NULL, '2025-02-18 16:04:28.148773', '2025-02-18 16:04:28.148773', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (309, 'Natural Resources & Power', 23, NULL, '2025-02-18 16:04:28.150452', '2025-02-18 16:04:28.150452', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (310, 'TMT', 23, NULL, '2025-02-18 16:04:28.152752', '2025-02-18 16:04:28.152752', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (311, 'Financial Institutions', 23, NULL, '2025-02-18 16:04:28.166368', '2025-02-18 16:04:28.166368', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (312, 'REGL (Real Estate, Gaming & Lodging)', 23, NULL, '2025-02-18 16:04:28.168474', '2025-02-18 16:04:28.168474', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (313, 'Financial Sponsors', 23, NULL, '2025-02-18 16:04:28.17061', '2025-02-18 16:04:28.17061', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (314, 'Leveraged Finance', 23, NULL, '2025-02-18 16:04:28.172143', '2025-02-18 16:04:28.172143', 1, false);
INSERT INTO public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) VALUES (315, 'FIG', 5, NULL, '2025-02-18 19:08:00', '2025-02-18 19:08:00', 1, false);


--
-- Data for Name: job_levels; Type: TABLE DATA; Schema: public; Owner: jacobspitzer
--

INSERT INTO public.job_levels (id, name, company_id, created_at, updated_at, level_rank, is_global_default, is_position_type_default, position_type_id) VALUES (1, 'Intern', NULL, '2025-02-08 22:13:14.731269', '2025-02-08 22:13:14.731269', 0, false, true, 1);
INSERT INTO public.job_levels (id, name, company_id, created_at, updated_at, level_rank, is_global_default, is_position_type_default, position_type_id) VALUES (2, 'Analyst', NULL, '2025-02-08 22:13:14.735887', '2025-02-08 22:13:14.735887', 1, false, true, 1);
INSERT INTO public.job_levels (id, name, company_id, created_at, updated_at, level_rank, is_global_default, is_position_type_default, position_type_id) VALUES (3, 'Associate', NULL, '2025-02-08 22:13:14.739321', '2025-02-08 22:13:14.739321', 2, false, true, 1);
INSERT INTO public.job_levels (id, name, company_id, created_at, updated_at, level_rank, is_global_default, is_position_type_default, position_type_id) VALUES (4, 'Vice President', NULL, '2025-02-08 22:13:14.74264', '2025-02-08 22:13:14.74264', 3, false, true, 1);
INSERT INTO public.job_levels (id, name, company_id, created_at, updated_at, level_rank, is_global_default, is_position_type_default, position_type_id) VALUES (5, 'Executive Director', NULL, '2025-02-08 22:13:14.746247', '2025-02-08 22:13:14.746247', 4, false, true, 1);
INSERT INTO public.job_levels (id, name, company_id, created_at, updated_at, level_rank, is_global_default, is_position_type_default, position_type_id) VALUES (6, 'Managing Director', NULL, '2025-02-08 22:13:14.749182', '2025-02-08 22:13:14.749182', 5, false, true, 1);
INSERT INTO public.job_levels (id, name, company_id, created_at, updated_at, level_rank, is_global_default, is_position_type_default, position_type_id) VALUES (7, 'Intern', NULL, '2025-02-08 22:17:42.020426', '2025-02-08 22:17:42.020426', 0, false, true, 2);
INSERT INTO public.job_levels (id, name, company_id, created_at, updated_at, level_rank, is_global_default, is_position_type_default, position_type_id) VALUES (8, 'Analyst', NULL, '2025-02-08 22:17:42.024149', '2025-02-08 22:17:42.024149', 1, false, true, 2);
INSERT INTO public.job_levels (id, name, company_id, created_at, updated_at, level_rank, is_global_default, is_position_type_default, position_type_id) VALUES (9, 'Associate', NULL, '2025-02-08 22:17:42.027359', '2025-02-08 22:17:42.027359', 2, false, true, 2);
INSERT INTO public.job_levels (id, name, company_id, created_at, updated_at, level_rank, is_global_default, is_position_type_default, position_type_id) VALUES (10, 'Vice President', NULL, '2025-02-08 22:17:42.030991', '2025-02-08 22:17:42.030991', 3, false, true, 2);
INSERT INTO public.job_levels (id, name, company_id, created_at, updated_at, level_rank, is_global_default, is_position_type_default, position_type_id) VALUES (11, 'Principal', NULL, '2025-02-08 22:17:42.034382', '2025-02-08 22:17:42.034382', 4, false, true, 2);
INSERT INTO public.job_levels (id, name, company_id, created_at, updated_at, level_rank, is_global_default, is_position_type_default, position_type_id) VALUES (12, 'Partner', NULL, '2025-02-08 22:17:42.038143', '2025-02-08 22:17:42.038143', 5, false, true, 2);
INSERT INTO public.job_levels (id, name, company_id, created_at, updated_at, level_rank, is_global_default, is_position_type_default, position_type_id) VALUES (13, 'Intern', NULL, '2025-02-08 22:18:42.415532', '2025-02-08 22:18:42.415532', 0, false, true, 3);
INSERT INTO public.job_levels (id, name, company_id, created_at, updated_at, level_rank, is_global_default, is_position_type_default, position_type_id) VALUES (14, 'Analyst', NULL, '2025-02-08 22:18:42.419311', '2025-02-08 22:18:42.419311', 1, false, true, 3);
INSERT INTO public.job_levels (id, name, company_id, created_at, updated_at, level_rank, is_global_default, is_position_type_default, position_type_id) VALUES (15, 'Associate', NULL, '2025-02-08 22:18:42.422599', '2025-02-08 22:18:42.422599', 2, false, true, 3);
INSERT INTO public.job_levels (id, name, company_id, created_at, updated_at, level_rank, is_global_default, is_position_type_default, position_type_id) VALUES (16, 'Senior Associate', NULL, '2025-02-08 22:18:42.426096', '2025-02-08 22:18:42.426096', 3, false, true, 3);
INSERT INTO public.job_levels (id, name, company_id, created_at, updated_at, level_rank, is_global_default, is_position_type_default, position_type_id) VALUES (17, 'Principal', NULL, '2025-02-08 22:18:42.429141', '2025-02-08 22:18:42.429141', 4, false, true, 3);
INSERT INTO public.job_levels (id, name, company_id, created_at, updated_at, level_rank, is_global_default, is_position_type_default, position_type_id) VALUES (18, 'Partner', NULL, '2025-02-08 22:18:42.432103', '2025-02-08 22:18:42.432103', 5, false, true, 3);
INSERT INTO public.job_levels (id, name, company_id, created_at, updated_at, level_rank, is_global_default, is_position_type_default, position_type_id) VALUES (19, 'Intern', NULL, '2025-02-08 22:19:53.256813', '2025-02-08 22:19:53.256813', 0, false, true, 4);
INSERT INTO public.job_levels (id, name, company_id, created_at, updated_at, level_rank, is_global_default, is_position_type_default, position_type_id) VALUES (20, 'Analyst', NULL, '2025-02-08 22:19:53.26128', '2025-02-08 22:19:53.26128', 1, false, true, 4);
INSERT INTO public.job_levels (id, name, company_id, created_at, updated_at, level_rank, is_global_default, is_position_type_default, position_type_id) VALUES (21, 'Associate', NULL, '2025-02-08 22:19:53.266294', '2025-02-08 22:19:53.266294', 2, false, true, 4);
INSERT INTO public.job_levels (id, name, company_id, created_at, updated_at, level_rank, is_global_default, is_position_type_default, position_type_id) VALUES (22, 'Manager', NULL, '2025-02-08 22:19:53.271134', '2025-02-08 22:19:53.271134', 3, false, true, 4);
INSERT INTO public.job_levels (id, name, company_id, created_at, updated_at, level_rank, is_global_default, is_position_type_default, position_type_id) VALUES (23, 'Director', NULL, '2025-02-08 22:19:53.275637', '2025-02-08 22:19:53.275637', 4, false, true, 4);
INSERT INTO public.job_levels (id, name, company_id, created_at, updated_at, level_rank, is_global_default, is_position_type_default, position_type_id) VALUES (24, 'Vice President', NULL, '2025-02-08 22:19:53.279677', '2025-02-08 22:19:53.279677', 5, false, true, 4);
INSERT INTO public.job_levels (id, name, company_id, created_at, updated_at, level_rank, is_global_default, is_position_type_default, position_type_id) VALUES (25, 'Intern', NULL, '2025-02-08 22:38:12.957855', '2025-02-08 22:38:12.957855', 0, false, true, 6);
INSERT INTO public.job_levels (id, name, company_id, created_at, updated_at, level_rank, is_global_default, is_position_type_default, position_type_id) VALUES (26, 'Analyst', NULL, '2025-02-08 22:38:12.961777', '2025-02-08 22:38:12.961777', 1, false, true, 6);
INSERT INTO public.job_levels (id, name, company_id, created_at, updated_at, level_rank, is_global_default, is_position_type_default, position_type_id) VALUES (27, 'Associate', NULL, '2025-02-08 22:38:12.965542', '2025-02-08 22:38:12.965542', 2, false, true, 6);
INSERT INTO public.job_levels (id, name, company_id, created_at, updated_at, level_rank, is_global_default, is_position_type_default, position_type_id) VALUES (28, 'Senior Associate', NULL, '2025-02-08 22:38:12.968972', '2025-02-08 22:38:12.968972', 3, false, true, 6);
INSERT INTO public.job_levels (id, name, company_id, created_at, updated_at, level_rank, is_global_default, is_position_type_default, position_type_id) VALUES (29, 'Portfolio Manager', NULL, '2025-02-08 22:38:12.971769', '2025-02-08 22:38:12.971769', 4, false, true, 6);
INSERT INTO public.job_levels (id, name, company_id, created_at, updated_at, level_rank, is_global_default, is_position_type_default, position_type_id) VALUES (30, 'Director', NULL, '2025-02-08 22:38:12.975515', '2025-02-08 22:38:12.975515', 5, false, true, 6);
INSERT INTO public.job_levels (id, name, company_id, created_at, updated_at, level_rank, is_global_default, is_position_type_default, position_type_id) VALUES (31, 'Intern', NULL, '2025-02-08 22:44:44.11668', '2025-02-08 22:44:44.11668', 0, false, true, 7);
INSERT INTO public.job_levels (id, name, company_id, created_at, updated_at, level_rank, is_global_default, is_position_type_default, position_type_id) VALUES (32, 'Analyst', NULL, '2025-02-08 22:44:44.12071', '2025-02-08 22:44:44.12071', 1, false, true, 7);
INSERT INTO public.job_levels (id, name, company_id, created_at, updated_at, level_rank, is_global_default, is_position_type_default, position_type_id) VALUES (33, 'Senior Analyst / Associate', NULL, '2025-02-08 22:44:44.124419', '2025-02-08 22:44:44.124419', 2, false, true, 7);
INSERT INTO public.job_levels (id, name, company_id, created_at, updated_at, level_rank, is_global_default, is_position_type_default, position_type_id) VALUES (34, 'Manager', NULL, '2025-02-08 22:44:44.129676', '2025-02-08 22:44:44.129676', 3, false, true, 7);
INSERT INTO public.job_levels (id, name, company_id, created_at, updated_at, level_rank, is_global_default, is_position_type_default, position_type_id) VALUES (35, 'Director', NULL, '2025-02-08 22:44:44.134025', '2025-02-08 22:44:44.134025', 4, false, true, 7);
INSERT INTO public.job_levels (id, name, company_id, created_at, updated_at, level_rank, is_global_default, is_position_type_default, position_type_id) VALUES (36, 'Vice President', NULL, '2025-02-08 22:44:44.138872', '2025-02-08 22:44:44.138872', 5, false, true, 7);
INSERT INTO public.job_levels (id, name, company_id, created_at, updated_at, level_rank, is_global_default, is_position_type_default, position_type_id) VALUES (37, 'Intern', 11, '2025-02-08 22:46:51.434978', '2025-02-08 22:46:51.434978', 0, false, false, 1);
INSERT INTO public.job_levels (id, name, company_id, created_at, updated_at, level_rank, is_global_default, is_position_type_default, position_type_id) VALUES (38, 'Analyst', 11, '2025-02-08 22:46:51.440973', '2025-02-08 22:46:51.440973', 1, false, false, 1);
INSERT INTO public.job_levels (id, name, company_id, created_at, updated_at, level_rank, is_global_default, is_position_type_default, position_type_id) VALUES (39, 'Associate', 11, '2025-02-08 22:46:51.444349', '2025-02-08 22:46:51.444349', 2, false, false, 1);
INSERT INTO public.job_levels (id, name, company_id, created_at, updated_at, level_rank, is_global_default, is_position_type_default, position_type_id) VALUES (40, 'Vice President', 11, '2025-02-08 22:46:51.448187', '2025-02-08 22:46:51.448187', 3, false, false, 1);
INSERT INTO public.job_levels (id, name, company_id, created_at, updated_at, level_rank, is_global_default, is_position_type_default, position_type_id) VALUES (41, 'Managing Director', 11, '2025-02-08 22:46:51.451631', '2025-02-08 22:46:51.451631', 4, false, false, 1);
INSERT INTO public.job_levels (id, name, company_id, created_at, updated_at, level_rank, is_global_default, is_position_type_default, position_type_id) VALUES (42, 'Senior Managing Director', 11, '2025-02-08 22:46:51.455097', '2025-02-08 22:46:51.455097', 5, false, false, 1);
INSERT INTO public.job_levels (id, name, company_id, created_at, updated_at, level_rank, is_global_default, is_position_type_default, position_type_id) VALUES (43, 'Intern', NULL, '2025-02-08 22:48:47.929663', '2025-02-08 22:48:47.929663', 0, false, true, 8);
INSERT INTO public.job_levels (id, name, company_id, created_at, updated_at, level_rank, is_global_default, is_position_type_default, position_type_id) VALUES (44, 'Analyst', NULL, '2025-02-08 22:48:47.933506', '2025-02-08 22:48:47.933506', 1, false, true, 8);
INSERT INTO public.job_levels (id, name, company_id, created_at, updated_at, level_rank, is_global_default, is_position_type_default, position_type_id) VALUES (45, 'Associate', NULL, '2025-02-08 22:48:47.938456', '2025-02-08 22:48:47.938456', 2, false, true, 8);
INSERT INTO public.job_levels (id, name, company_id, created_at, updated_at, level_rank, is_global_default, is_position_type_default, position_type_id) VALUES (46, 'Manager', NULL, '2025-02-08 22:48:47.941625', '2025-02-08 22:48:47.941625', 3, false, true, 8);
INSERT INTO public.job_levels (id, name, company_id, created_at, updated_at, level_rank, is_global_default, is_position_type_default, position_type_id) VALUES (47, 'Director', NULL, '2025-02-08 22:48:47.945277', '2025-02-08 22:48:47.945277', 4, false, true, 8);
INSERT INTO public.job_levels (id, name, company_id, created_at, updated_at, level_rank, is_global_default, is_position_type_default, position_type_id) VALUES (48, 'Partner', NULL, '2025-02-08 22:48:47.950289', '2025-02-08 22:48:47.950289', 5, false, true, 8);
INSERT INTO public.job_levels (id, name, company_id, created_at, updated_at, level_rank, is_global_default, is_position_type_default, position_type_id) VALUES (49, 'Intern', NULL, '2025-02-08 23:28:16.359975', '2025-02-08 23:28:16.359975', 0, true, false, NULL);
INSERT INTO public.job_levels (id, name, company_id, created_at, updated_at, level_rank, is_global_default, is_position_type_default, position_type_id) VALUES (50, 'Analyst', NULL, '2025-02-08 23:28:16.364332', '2025-02-08 23:28:16.364332', 1, true, false, NULL);
INSERT INTO public.job_levels (id, name, company_id, created_at, updated_at, level_rank, is_global_default, is_position_type_default, position_type_id) VALUES (51, 'Senior Analyst / Associate', NULL, '2025-02-08 23:28:16.367493', '2025-02-08 23:28:16.367493', 2, true, false, NULL);
INSERT INTO public.job_levels (id, name, company_id, created_at, updated_at, level_rank, is_global_default, is_position_type_default, position_type_id) VALUES (52, 'Manager', NULL, '2025-02-08 23:28:16.371113', '2025-02-08 23:28:16.371113', 3, true, false, NULL);
INSERT INTO public.job_levels (id, name, company_id, created_at, updated_at, level_rank, is_global_default, is_position_type_default, position_type_id) VALUES (53, 'Director', NULL, '2025-02-08 23:28:16.374776', '2025-02-08 23:28:16.374776', 4, true, false, NULL);
INSERT INTO public.job_levels (id, name, company_id, created_at, updated_at, level_rank, is_global_default, is_position_type_default, position_type_id) VALUES (54, 'Vice President', NULL, '2025-02-08 23:28:16.378587', '2025-02-08 23:28:16.378587', 5, true, false, NULL);


--
-- Data for Name: schools; Type: TABLE DATA; Schema: public; Owner: jacobspitzer
--

INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (52, 'Amherst College', '2025-02-09 03:02:11.782838', '2025-02-09 03:02:11.782838', true, false, true, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (53, 'Harvard University', '2025-02-09 03:02:11.789395', '2025-02-09 03:02:11.789395', true, false, true, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (54, 'Harvard Business School', '2025-02-09 03:02:11.793545', '2025-02-09 03:02:11.793545', false, true, false, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (56, 'Holy Cross', '2025-02-09 03:02:11.80117', '2025-02-09 03:02:11.80117', true, false, false, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (57, 'Georgetown', '2025-02-09 03:02:11.80461', '2025-02-09 03:02:11.80461', true, false, true, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (58, 'Georgetown McDonough', '2025-02-09 03:02:11.80835', '2025-02-09 03:02:11.80835', false, true, false, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (59, 'Dartmouth', '2025-02-09 03:02:11.819267', '2025-02-09 03:02:11.819267', true, false, true, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (60, 'Tuck School of Business', '2025-02-09 03:02:11.82309', '2025-02-09 03:02:11.82309', false, true, false, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (61, 'Cornell', '2025-02-09 03:02:11.82716', '2025-02-09 03:02:11.82716', true, false, true, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (62, 'S.C. Johnson Graduate School of Management', '2025-02-09 03:02:11.831045', '2025-02-09 03:02:11.831045', false, true, false, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (63, 'Vanderbilt University', '2025-02-09 03:02:11.834537', '2025-02-09 03:02:11.834537', true, false, true, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (64, 'Owen Graduate School of Management', '2025-02-09 03:02:11.838402', '2025-02-09 03:02:11.838402', false, true, false, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (65, 'Washington University in St. Louis', '2025-02-09 03:02:11.842187', '2025-02-09 03:02:11.842187', true, false, true, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (66, 'Olin Business School', '2025-02-09 03:02:11.845761', '2025-02-09 03:02:11.845761', false, true, false, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (67, 'Emory University', '2025-02-09 03:02:11.849756', '2025-02-09 03:02:11.849756', true, false, true, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (68, 'Goizueta School of Business', '2025-02-09 03:02:11.85361', '2025-02-09 03:02:11.85361', false, true, false, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (69, 'University of California--Berkeley', '2025-02-09 03:02:11.857517', '2025-02-09 03:02:11.857517', true, false, true, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (70, 'Haas School of Business', '2025-02-09 03:02:11.867257', '2025-02-09 03:02:11.867257', false, true, false, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (71, 'University of Southern California', '2025-02-09 03:02:11.872784', '2025-02-09 03:02:11.872784', true, false, true, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (72, 'USC Marshall School of Business', '2025-02-09 03:02:11.876962', '2025-02-09 03:02:11.876962', false, true, false, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (73, 'Carnegie Mellon University', '2025-02-09 03:02:11.881278', '2025-02-09 03:02:11.881278', true, false, true, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (74, 'Tepper School of Business', '2025-02-09 03:02:11.885912', '2025-02-09 03:02:11.885912', false, true, false, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (75, 'University of California--Los Angeles', '2025-02-09 03:02:11.889544', '2025-02-09 03:02:11.889544', true, false, true, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (76, 'UCLA Anderson School of Management', '2025-02-09 03:02:11.893548', '2025-02-09 03:02:11.893548', false, true, false, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (77, 'University of Virginia', '2025-02-09 03:02:11.897422', '2025-02-09 03:02:11.897422', true, false, true, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (78, 'UVA Darden School of Business', '2025-02-09 03:02:11.900879', '2025-02-09 03:02:11.900879', false, true, false, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (79, 'University of Michigan', '2025-02-09 03:02:11.904617', '2025-02-09 03:02:11.904617', true, false, true, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (80, 'Ross School of Business', '2025-02-09 03:02:11.908329', '2025-02-09 03:02:11.908329', false, true, false, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (81, 'Wake Forest University', '2025-02-09 03:02:11.912313', '2025-02-09 03:02:11.912313', true, false, true, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (82, 'Wake Forest University School of Business', '2025-02-09 03:02:11.917082', '2025-02-09 03:02:11.917082', false, true, false, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (83, 'University of North Carolina--Chapel Hill', '2025-02-09 03:02:11.923254', '2025-02-09 03:02:11.923254', true, false, true, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (84, 'UNC Kenan-Flagler Business School', '2025-02-09 03:02:11.927783', '2025-02-09 03:02:11.927783', false, true, false, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (85, 'Boston College', '2025-02-09 03:02:11.931773', '2025-02-09 03:02:11.931773', true, false, true, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (86, 'Carroll School of Management', '2025-02-09 03:02:11.935894', '2025-02-09 03:02:11.935894', false, true, false, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (87, 'College of William & Mary', '2025-02-09 03:02:11.93944', '2025-02-09 03:02:11.93944', true, false, true, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (88, 'Mason School of Business', '2025-02-09 03:02:11.945493', '2025-02-09 03:02:11.945493', false, true, false, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (89, 'University of Rochester', '2025-02-09 03:02:11.950271', '2025-02-09 03:02:11.950271', true, false, true, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (90, 'Simon Business School', '2025-02-09 03:02:11.954151', '2025-02-09 03:02:11.954151', false, true, false, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (91, 'Brandeis University', '2025-02-09 03:02:11.958132', '2025-02-09 03:02:11.958132', true, false, true, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (92, 'Brandeis International Business School', '2025-02-09 03:02:11.961826', '2025-02-09 03:02:11.961826', false, true, false, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (93, 'Georgia Institute of Technology', '2025-02-09 03:02:11.965717', '2025-02-09 03:02:11.965717', true, false, true, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (94, 'Scheller College of Business', '2025-02-09 03:02:11.970202', '2025-02-09 03:02:11.970202', false, true, false, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (95, 'New York University', '2025-02-09 03:02:11.975244', '2025-02-09 03:02:11.975244', true, false, true, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (96, 'NYU Stern School of Business', '2025-02-09 03:02:11.979058', '2025-02-09 03:02:11.979058', false, true, false, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (97, 'Fordham University', '2025-02-09 03:02:11.98318', '2025-02-09 03:02:11.98318', true, false, true, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (98, 'Fordham Gabelli School of Business', '2025-02-09 03:02:11.987316', '2025-02-09 03:02:11.987316', false, true, false, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (99, 'Syracuse University', '2025-02-09 03:02:11.990999', '2025-02-09 03:02:11.990999', true, false, true, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (100, 'Whitman School of Management', '2025-02-09 03:02:11.994989', '2025-02-09 03:02:11.994989', false, true, false, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (101, 'Rutgers University', '2025-02-09 03:02:12.000502', '2025-02-09 03:02:12.000502', true, false, true, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (102, 'Rutgers Business School', '2025-02-09 03:02:12.004313', '2025-02-09 03:02:12.004313', false, true, false, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (103, 'George Washington University', '2025-02-09 03:02:12.008141', '2025-02-09 03:02:12.008141', true, false, true, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (104, 'GW School of Business', '2025-02-09 03:02:12.011704', '2025-02-09 03:02:12.011704', false, true, false, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (105, 'University of Texas', '2025-02-09 03:02:12.015628', '2025-02-09 03:02:12.015628', true, false, true, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (106, 'McCombs School of Business', '2025-02-09 03:02:12.020382', '2025-02-09 03:02:12.020382', false, true, false, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (107, 'University of Florida', '2025-02-09 03:02:12.025081', '2025-02-09 03:02:12.025081', true, false, true, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (108, 'UF Warrington College of Business', '2025-02-09 03:02:12.028798', '2025-02-09 03:02:12.028798', false, true, false, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (109, 'Southern Methodist University', '2025-02-09 03:02:12.032833', '2025-02-09 03:02:12.032833', true, false, true, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (110, 'Cox School of Business', '2025-02-09 03:02:12.036837', '2025-02-09 03:02:12.036837', false, true, false, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (111, 'Babson College', '2025-02-09 03:02:12.040531', '2025-02-09 03:02:12.040531', true, true, true, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (112, 'Bentley University', '2025-02-09 03:02:12.044535', '2025-02-09 03:02:12.044535', true, true, true, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (113, 'Tufts University', '2025-02-09 03:02:12.048165', '2025-02-09 03:02:12.048165', true, false, true, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (114, 'Brown University', '2025-02-09 03:02:12.052931', '2025-02-09 03:02:12.052931', true, false, true, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (115, 'Rice University', '2025-02-09 03:02:12.057262', '2025-02-09 03:02:12.057262', true, false, true, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (116, 'Jones Graduate School of Business', '2025-02-09 03:02:12.060865', '2025-02-09 03:02:12.060865', false, true, false, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (117, 'California Institute of Technology', '2025-02-09 03:02:12.064849', '2025-02-09 03:02:12.064849', true, false, true, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (118, 'Johns Hopkins', '2025-02-09 03:02:12.069183', '2025-02-09 03:02:12.069183', true, false, true, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (119, 'Johns Hopkins Carey Business School', '2025-02-09 03:02:12.072808', '2025-02-09 03:02:12.072808', false, true, false, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (120, 'Stanford University', '2025-02-09 03:02:12.077735', '2025-02-09 03:02:12.077735', true, false, true, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (121, 'Stanford Graduate School of Business', '2025-02-09 03:02:12.081866', '2025-02-09 03:02:12.081866', false, true, false, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (122, 'Yale University', '2025-02-09 03:02:12.085586', '2025-02-09 03:02:12.085586', true, false, true, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (123, 'Yale School of Management', '2025-02-09 03:02:12.089554', '2025-02-09 03:02:12.089554', false, true, false, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (124, 'Princeton University', '2025-02-09 03:02:12.093643', '2025-02-09 03:02:12.093643', true, false, true, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (125, 'Columbia University', '2025-02-09 03:02:12.097264', '2025-02-09 03:02:12.097264', true, false, true, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (126, 'Columbia Business School', '2025-02-09 03:02:12.100987', '2025-02-09 03:02:12.100987', false, true, false, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (127, 'University of Chicago', '2025-02-09 03:02:12.104907', '2025-02-09 03:02:12.104907', true, false, true, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (128, 'Booth School of Business', '2025-02-09 03:02:12.108492', '2025-02-09 03:02:12.108492', false, true, false, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (129, 'Massachusetts Institute of Technology (MIT)', '2025-02-09 03:02:12.112514', '2025-02-09 03:02:12.112514', true, false, true, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (130, 'MIT Sloan School of Management', '2025-02-09 03:02:12.11687', '2025-02-09 03:02:12.11687', false, true, false, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (131, 'The London School of Economics and Political Science', '2025-02-09 03:10:41.699325', '2025-02-09 03:10:41.699325', true, false, true, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (132, 'University of Cambridge', '2025-02-09 03:16:44.118352', '2025-02-09 03:16:44.118352', true, false, true, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (134, 'University of Oxford', '2025-02-09 03:17:03.923628', '2025-02-09 03:17:03.923628', true, false, true, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (135, 'Oxford MBA Saïd Business School', '2025-02-09 03:17:14.329164', '2025-02-09 03:17:14.329164', false, true, false, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (136, 'The University of Pennsylvania', '2025-02-09 03:20:08.750381', '2025-02-09 03:20:08.750381', true, false, true, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (137, 'The Wharton School of the University of Pennsylvania', '2025-02-09 03:20:16.75943', '2025-02-09 03:20:16.75943', false, true, false, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (138, 'London Business School', '2025-02-09 03:28:11.304032', '2025-02-09 03:28:11.304032', true, true, true, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (140, 'Williams College', '2025-02-09 03:48:58.981865', '2025-02-09 13:20:33.344364', true, false, true, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (139, 'Villanova University', '2025-02-09 03:46:32.419843', '2025-02-09 13:20:34.187915', true, true, true, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (141, 'University of Toronto', '2025-02-09 12:34:59.491451', '2025-02-09 12:34:59.491451', true, false, true, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (142, 'Boston University', '2025-02-09 12:44:59.540611', '2025-02-09 12:44:59.540611', true, false, true, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (143, 'Boston University Questrom School of Business', '2025-02-09 12:45:14.158786', '2025-02-09 12:45:14.158786', false, true, false, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (144, 'University of Georgia', '2025-02-09 12:49:13.026906', '2025-02-09 12:49:13.026906', true, false, true, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (145, 'Terry College of Business', '2025-02-09 12:49:52.204821', '2025-02-09 12:49:52.204821', false, true, false, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (146, 'Elon University', '2025-02-09 12:53:46.173566', '2025-02-09 12:53:46.173566', true, false, true, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (147, 'University of Pennsylvania', '2025-02-09 13:20:33.357253', '2025-02-09 13:20:33.36225', true, false, true, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (148, 'Wharton School', '2025-02-09 13:20:33.669085', '2025-02-09 13:20:33.673277', false, true, false, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (149, 'Dartmouth College', '2025-02-09 13:20:33.678012', '2025-02-09 13:20:33.681705', true, false, true, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (150, 'Northwestern University', '2025-02-09 13:20:33.691132', '2025-02-09 13:20:33.69525', true, false, true, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (151, 'Kellogg School of Management', '2025-02-09 13:20:33.699787', '2025-02-09 13:20:33.703951', false, true, false, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (204, 'Howard University', '2025-02-09 13:58:52.049665', '2025-02-09 13:58:52.049665', true, true, true, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (205, 'University of Illinois', '2025-02-09 18:46:13.707861', '2025-02-09 18:46:13.707861', true, false, true, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (154, 'London Business School (LBS)', '2025-02-09 13:20:33.733067', '2025-02-09 13:20:33.737908', false, true, true, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (155, 'Indian Institute of Technology (IIT)', '2025-02-09 13:20:33.742615', '2025-02-09 13:20:33.746758', true, false, true, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (156, 'Indian Institute of Management Ahmedabad (IIM Ahmedabad)', '2025-02-09 13:20:33.751252', '2025-02-09 13:20:33.75627', false, true, true, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (157, 'Indian Institute of Management Bangalore (IIM Bangalore)', '2025-02-09 13:20:33.761053', '2025-02-09 13:20:33.765058', false, true, true, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (158, 'Indian Institute of Management Calcutta (IIM Calcutta)', '2025-02-09 13:20:33.769472', '2025-02-09 13:20:33.773556', false, true, true, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (159, 'Indian School of Business (ISB)', '2025-02-09 13:20:33.778848', '2025-02-09 13:20:33.783825', false, true, true, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (160, 'HEC Paris', '2025-02-09 13:20:33.790134', '2025-02-09 13:20:33.795843', false, true, true, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (161, 'INSEAD', '2025-02-09 13:20:33.801727', '2025-02-09 13:20:33.805885', false, true, true, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (162, 'University of London', '2025-02-09 13:20:33.810721', '2025-02-09 13:20:33.81439', true, false, true, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (163, 'Rotman School of Management', '2025-02-09 13:20:33.822723', '2025-02-09 13:20:33.826443', false, true, false, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (164, 'University of Melbourne', '2025-02-09 13:20:33.831493', '2025-02-09 13:20:33.837307', true, false, true, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (165, 'Melbourne Business School', '2025-02-09 13:20:33.842451', '2025-02-09 13:20:33.846526', false, true, false, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (166, 'University of Sydney', '2025-02-09 13:20:33.850875', '2025-02-09 13:20:33.855058', true, false, true, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (167, 'Australian Graduate School of Management', '2025-02-09 13:20:33.859972', '2025-02-09 13:20:33.863961', false, true, false, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (168, 'National University of Singapore (NUS)', '2025-02-09 13:20:33.868491', '2025-02-09 13:20:33.873097', true, false, true, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (169, 'NUS Business School', '2025-02-09 13:20:33.878227', '2025-02-09 13:20:33.88481', false, true, false, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (170, 'University of Hong Kong', '2025-02-09 13:20:33.889518', '2025-02-09 13:20:33.893283', true, false, true, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (171, 'HKU Business School', '2025-02-09 13:20:33.898756', '2025-02-09 13:20:33.902875', false, true, false, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (172, 'Seoul National University', '2025-02-09 13:20:33.90758', '2025-02-09 13:20:33.911242', true, false, true, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (173, 'KAIST Business School', '2025-02-09 13:20:33.915905', '2025-02-09 13:20:33.919961', false, true, false, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (174, 'University of Tokyo', '2025-02-09 13:20:33.925014', '2025-02-09 13:20:33.928861', true, false, true, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (175, 'Tokyo Business School', '2025-02-09 13:20:33.934436', '2025-02-09 13:20:33.938564', false, true, false, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (176, 'University of British Columbia', '2025-02-09 13:20:33.943465', '2025-02-09 13:20:33.947512', true, false, true, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (177, 'Sauder School of Business', '2025-02-09 13:20:33.952058', '2025-02-09 13:20:33.95618', false, true, false, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (178, 'Duke University', '2025-02-09 13:20:33.960623', '2025-02-09 13:20:33.964328', true, false, true, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (179, 'Fuqua School of Business', '2025-02-09 13:20:33.968994', '2025-02-09 13:20:33.973386', false, true, false, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (180, 'Darden School of Business', '2025-02-09 13:20:33.98177', '2025-02-09 13:20:33.985841', false, true, false, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (181, 'Cornell University', '2025-02-09 13:20:33.996977', '2025-02-09 13:20:34.001047', true, false, true, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (182, 'Johnson Graduate School of Management', '2025-02-09 13:20:34.00579', '2025-02-09 13:20:34.009571', false, true, false, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (183, 'University of California, Berkeley', '2025-02-09 13:20:34.014252', '2025-02-09 13:20:34.022315', true, false, true, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (184, 'Stern School of Business', '2025-02-09 13:20:34.042722', '2025-02-09 13:20:34.048768', false, true, false, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (185, 'University of Notre Dame', '2025-02-09 13:20:34.056312', '2025-02-09 13:20:34.062116', true, false, true, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (186, 'Mendoza College of Business', '2025-02-09 13:20:34.06809', '2025-02-09 13:20:34.073453', false, true, false, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (187, 'Goizueta Business School', '2025-02-09 13:20:34.081425', '2025-02-09 13:20:34.085982', false, true, false, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (188, 'University of Texas at Austin', '2025-02-09 13:20:34.091593', '2025-02-09 13:20:34.095718', true, false, true, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (189, 'Carleton College', '2025-02-09 13:20:34.103599', '2025-02-09 13:20:34.107685', true, false, true, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (190, 'Swarthmore College', '2025-02-09 13:20:34.115517', '2025-02-09 13:20:34.11954', true, false, true, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (191, 'Wesleyan University', '2025-02-09 13:20:34.124317', '2025-02-09 13:20:34.128097', true, false, true, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (192, 'Davidson College', '2025-02-09 13:20:34.133163', '2025-02-09 13:20:34.138019', true, false, true, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (193, 'Bowdoin College', '2025-02-09 13:20:34.142749', '2025-02-09 13:20:34.146906', true, false, true, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (194, 'Middlebury College', '2025-02-09 13:20:34.151624', '2025-02-09 13:20:34.155514', true, false, true, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (195, 'Claremont McKenna College', '2025-02-09 13:20:34.160366', '2025-02-09 13:20:34.164457', true, false, true, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (196, 'Haverford College', '2025-02-09 13:20:34.168899', '2025-02-09 13:20:34.172984', true, false, true, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (197, 'Washington and Lee University', '2025-02-09 13:20:34.178104', '2025-02-09 13:20:34.182977', true, false, true, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (198, 'Colgate University', '2025-02-09 13:20:34.192679', '2025-02-09 13:20:34.196619', true, false, true, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (199, 'University of Richmond', '2025-02-09 13:20:34.201503', '2025-02-09 13:20:34.206166', true, false, true, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (133, 'Cambridge Judge Business School', '2025-02-09 03:16:53.417166', '2025-02-09 13:20:34.218314', true, false, true, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (200, 'Other', '2025-02-09 13:20:34.226847', '2025-02-09 13:20:34.232025', true, true, true, true);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (201, 'Ohio State University', '2025-02-09 13:53:23.310028', '2025-02-09 13:53:23.310028', true, false, true, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (202, 'Ohio State University Fisher College of Business', '2025-02-09 13:54:56.492621', '2025-02-09 13:54:56.492621', false, true, false, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (203, 'Morehouse College', '2025-02-09 13:58:42.598065', '2025-02-09 13:58:42.598065', true, false, true, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (206, 'Indiana University', '2025-02-09 19:32:28.539421', '2025-02-09 19:32:28.539421', true, false, true, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (207, 'Indiana University Kelley School of Business', '2025-02-09 19:32:47.634762', '2025-02-09 19:32:47.634762', false, true, false, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (208, 'Suny Binghamton', '2025-02-09 19:49:35.190878', '2025-02-09 19:49:35.190878', true, false, true, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (209, 'Penn State University', '2025-02-10 01:06:21.777512', '2025-02-10 01:06:21.777512', true, false, true, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (210, 'Penn State Smeal College of Business', '2025-02-10 01:06:33.405107', '2025-02-10 01:06:33.405107', false, true, false, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (211, 'Northeastern University', '2025-02-10 01:21:01.616948', '2025-02-10 01:21:01.616948', true, false, true, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (212, 'University of Miami', '2025-02-10 03:10:54.91044', '2025-02-10 03:10:54.91044', true, false, true, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (213, 'Naval Academy', '2025-02-10 04:20:56.113777', '2025-02-10 04:20:56.113777', true, false, true, false);
INSERT INTO public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) VALUES (214, 'West Point', '2025-02-10 04:21:00', '2025-02-10 04:21:00', true, false, true, false);


--
-- Data for Name: employees; Type: TABLE DATA; Schema: public; Owner: jacobspitzer
--

INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (1, 'Tom Massey', 42, 11, 5, 'https://www.linkedin.com/in/tom-massey-873420150/?originalSubdomain=uk', 0, NULL, 15, 51, '2025-02-09 03:03:35.608629', '2025-02-09 03:03:35.608629', 1, 56, 58, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (2, 'Stephen Schalbe', 42, 11, 5, 'https://www.linkedin.com/in/stephen-schaible-b4b70613/', 0, NULL, 15, 32, '2025-02-09 03:05:36.684433', '2025-02-09 03:05:36.684433', 1, 124, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (3, 'Kirtan Pansari', 42, 11, 7, 'https://www.linkedin.com/in/kirtan-pansari-69975a45/?originalSubdomain=uk', 0, NULL, 15, 51, '2025-02-09 03:11:22.922854', '2025-02-09 03:11:22.922854', 1, 131, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (4, 'Greg-Henri Bize', 41, 11, 12, 'https://www.linkedin.com/in/greg-henri-bize-1a76254/', 0, NULL, 15, 51, '2025-02-09 03:12:45.449488', '2025-02-09 03:12:45.449488', 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (5, 'Egor Nikolaev', 41, 11, 5, 'https://www.linkedin.com/in/george-nikolaev/?originalSubdomain=uk', 0, NULL, 15, 51, '2025-02-09 03:17:22.164982', '2025-02-09 03:17:34.980562', 1, 131, 135, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (6, 'Ranga Covindassamy', 41, 11, 309, 'https://www.linkedin.com/in/ranga-covindassamy-5b920312/', 0, NULL, 15, 32, '2025-02-09 03:20:20.991782', '2025-02-09 03:21:05.669934', 1, 57, 137, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (7, 'Divashen Kandan', 41, 11, 6, 'https://www.linkedin.com/in/divashen-kandan-26a5326b/?originalSubdomain=uk', 0, NULL, 15, 51, '2025-02-09 03:22:23.293973', '2025-02-09 03:22:23.293973', 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (8, 'Cesar Bustillos', 40, 11, 5, 'https://www.linkedin.com/in/cesarbustillos/', 0, NULL, 15, 32, '2025-02-09 03:24:17.946618', '2025-02-09 03:24:17.946618', 1, NULL, 62, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (9, 'Eleni Kontosi', 40, 11, NULL, 'https://www.linkedin.com/in/elenikontosi/', 0, NULL, 15, 51, '2025-02-09 03:25:39.894617', '2025-02-09 03:25:39.894617', 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (10, 'Michael Blessing', 40, 11, NULL, 'https://www.linkedin.com/in/michaelblessing1/?originalSubdomain=uk', 0, NULL, 15, 51, '2025-02-09 03:27:11.381899', '2025-02-09 03:28:21.426162', 1, NULL, 138, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (11, 'Emirhan Ozkan', 40, 11, 4, 'https://www.linkedin.com/in/emirhanozkan/', 0, NULL, 15, 51, '2025-02-09 03:30:00.943926', '2025-02-09 03:30:00.943926', 1, NULL, 138, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (12, 'Pierre Lafitte', 39, 11, NULL, 'https://www.linkedin.com/in/pierre-laffitte/?locale=en_US', 0, NULL, 15, 51, '2025-02-09 03:31:48.399326', '2025-02-09 03:31:55.107864', 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (13, 'Sean Vashi', 39, 11, 5, 'https://www.linkedin.com/in/sean-vashi-59bb81123/', 0, NULL, 15, 32, '2025-02-09 03:33:03.276532', '2025-02-09 03:33:03.276532', 1, 72, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (15, 'Patrick O''Neill', 39, 11, NULL, 'https://www.linkedin.com/in/patrick-o-neill-9905/', 0, NULL, 15, 32, '2025-02-09 03:36:37.895048', '2025-02-09 03:36:37.895048', 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (16, 'Mattia Coccato', 39, 11, NULL, 'https://www.linkedin.com/in/mattia-coccato/?originalSubdomain=gh', 0, NULL, 15, 51, '2025-02-09 03:37:49.51905', '2025-02-09 03:37:49.51905', 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (17, 'Mantas Mieliauskas', 39, 11, NULL, 'https://www.linkedin.com/in/mantas-mieliauskas-96558b113/?originalSubdomain=uk', 0, NULL, 15, 51, '2025-02-09 03:38:47.670894', '2025-02-09 03:38:47.670894', 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (18, 'Leonardo Kim', 39, 11, 12, 'https://www.linkedin.com/in/leokim396/', 0, NULL, 15, 32, '2025-02-09 03:41:31.041484', '2025-02-09 03:41:31.041484', 1, 85, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (19, 'Louis Bustin', 39, 11, NULL, 'https://www.linkedin.com/in/louis-bustin/?originalSubdomain=uk', 0, NULL, 15, 51, '2025-02-09 03:42:47.326296', '2025-02-09 03:42:47.326296', 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (20, 'Nikita Khanna', 38, 11, NULL, 'https://www.linkedin.com/in/nikitakhanna23/?originalSubdomain=uk', 0, NULL, 15, 51, '2025-02-09 03:43:58.922792', '2025-02-09 03:43:58.922792', 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (21, 'Max Davis', 38, 11, NULL, 'https://www.linkedin.com/in/max-davis-5b8ba6202/?originalSubdomain=uk', 0, NULL, 15, 51, '2025-02-09 03:45:20.398823', '2025-02-09 03:45:20.398823', 1, 132, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (22, 'Sarah Yoon', 38, 11, NULL, 'https://www.linkedin.com/in/sarah-y-308781108/', 0, NULL, 15, 32, '2025-02-09 03:46:18.042547', '2025-02-09 03:47:36.814694', 1, 139, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (23, 'Pedro Rodriguez', 38, 11, NULL, 'https://www.linkedin.com/in/pedro-rodriguez10/', 0, NULL, 15, 32, '2025-02-09 03:49:03.117268', '2025-02-09 03:49:12.990977', 1, 140, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (24, 'Daniel Mendelow', 42, 11, NULL, 'https://www.linkedin.com/in/daniel-mendelow-0b4408/', 0, NULL, 16, 32, '2025-02-09 12:33:01.936441', '2025-02-09 12:33:01.936441', 1, 124, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (25, 'Justin Singh', 42, 11, 14, 'https://www.linkedin.com/in/justinsingh/', 0, NULL, 16, 32, '2025-02-09 12:34:42.770504', '2025-02-09 12:35:51.282008', 1, NULL, 141, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (26, 'Jason Lee', 41, 11, 16, 'https://www.linkedin.com/in/jasondamianlee/', 0, NULL, 16, 32, '2025-02-09 12:39:16.056226', '2025-02-09 12:39:16.056226', 1, 79, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (29, 'Bill Stafford', 40, 11, 3, 'https://www.linkedin.com/in/williamfstafford/', 0, NULL, 16, 32, '2025-02-09 12:47:39.275073', '2025-02-09 12:52:03.041129', 1, 144, 83, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (30, 'Clint Collins', 40, 11, 6, 'https://www.linkedin.com/in/clintbcollins/', 0, NULL, 16, 32, '2025-02-09 12:54:02.342955', '2025-02-09 12:54:18.142793', 1, 146, 84, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (31, 'Melody Tan', 39, 11, NULL, '', 0, NULL, 16, 32, '2025-02-09 12:58:51.762597', '2025-02-09 12:58:51.762597', 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (32, 'Reese Mullins', 39, 11, 3, 'https://www.linkedin.com/in/reese-mullins/', 0, NULL, 16, 32, '2025-02-09 13:01:30.588841', '2025-02-09 13:01:30.588841', 1, 77, 84, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (28, 'Mark Reynolds', 41, 11, 18, 'https://www.linkedin.com/in/mark-reynolds-81676320/', 0, NULL, 16, 32, '2025-02-09 12:42:56.536554', '2025-02-09 13:14:35.424109', 1, 85, 126, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (14, 'Lamine Nwal', 39, 11, 3, 'https://www.linkedin.com/in/lamine-nwal-048902132/', 0, NULL, 15, 32, '2025-02-09 03:34:10.435965', '2025-02-09 13:16:09.456519', 1, 125, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (33, 'Sophie Li', 39, 11, 6, 'https://www.linkedin.com/in/sophieyxli/', 0, NULL, 16, 32, '2025-02-09 13:07:27.269578', '2025-02-09 13:21:29.130325', 1, NULL, 151, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (34, 'Michael McCann', 39, 11, NULL, '', 0, NULL, 16, 32, '2025-02-09 13:23:08.632762', '2025-02-09 13:23:08.632762', 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (35, 'Andrea Candidato', 38, 11, NULL, 'https://www.linkedin.com/in/andreacandidato/', 0, NULL, 16, 32, '2025-02-09 13:24:10.473226', '2025-02-09 13:24:10.473226', 1, 61, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (36, 'Baron Cao', 38, 11, NULL, 'https://www.linkedin.com/in/baron-c-09333b1a4/', 0, NULL, 16, 32, '2025-02-09 13:25:48.079925', '2025-02-09 13:25:48.079925', 1, 127, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (37, 'Gabrielle Lau', 38, 11, NULL, 'https://www.linkedin.com/in/gabby-lau/', 0, NULL, 16, 32, '2025-02-09 13:26:41.909151', '2025-02-09 13:26:41.909151', 1, 61, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (38, 'Wilco Faessen', 42, 11, 8, 'https://www.linkedin.com/in/wilco-faessen-5b02a710/', 0, NULL, 17, 32, '2025-02-09 13:48:07.21129', '2025-02-09 13:48:23.141827', 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (39, 'Ari Berger', 42, 11, 8, 'https://www.linkedin.com/in/ari-berger-62873112/', 0, NULL, 17, 32, '2025-02-09 13:49:17.774659', '2025-02-09 13:49:17.774659', 1, 178, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (40, 'Vasu Pinnamaneni', 41, 11, 8, '', 0, NULL, 17, 13, '2025-02-09 13:50:42.040112', '2025-02-09 13:50:42.040112', 1, 57, 128, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (41, 'Scott Meyer', 41, 11, NULL, 'https://www.linkedin.com/in/scott-meyer-15b90747/', 0, NULL, 17, 32, '2025-02-09 13:51:44.93436', '2025-02-09 13:55:19.924009', 1, 201, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (42, 'Will Jurist', 41, 11, 3, 'https://www.linkedin.com/in/willjurist/', 0, NULL, 17, 32, '2025-02-09 13:59:00.910022', '2025-02-09 13:59:09.022566', 1, 203, 54, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (43, 'Steve Segall', 41, 11, 16, 'https://www.linkedin.com/in/stevesegall/', 0, NULL, 17, 32, '2025-02-09 14:00:34.364708', '2025-02-09 14:00:34.364708', 1, 61, 62, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (44, 'George Phillips', 41, 11, 310, 'https://www.linkedin.com/in/george-phillips-b7a95340/', 0, NULL, 17, 32, '2025-02-09 14:01:50.541823', '2025-02-09 14:02:18.582521', 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (45, 'Rosabella Magat', 40, 11, 19, 'https://www.linkedin.com/in/rosabella-magat-69923320/', 0, NULL, 17, 32, '2025-02-09 14:03:55.852056', '2025-02-09 14:03:55.852056', 1, 195, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (46, 'Sanam Mechkat', 40, 11, NULL, 'https://www.linkedin.com/in/sanammechkat/details/education/', 0, NULL, 17, 32, '2025-02-09 14:05:28.724375', '2025-02-09 14:05:28.724375', 1, 191, 184, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (47, 'Jack Chapman', 40, 11, 15, 'https://www.linkedin.com/in/jackrchapman/', 0, NULL, 17, 32, '2025-02-09 14:06:43.771241', '2025-02-09 14:06:43.771241', 1, 67, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (48, 'Aditya Gupta', 40, 11, NULL, 'https://www.linkedin.com/in/adityagupta72/', 0, NULL, 17, 32, '2025-02-09 14:07:54.561111', '2025-02-09 14:07:54.561111', 1, 69, 184, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (49, 'Ivy Ke', 39, 11, NULL, 'https://www.linkedin.com/in/ivyke/', 0, NULL, 17, 32, '2025-02-09 14:09:17.371191', '2025-02-09 14:09:17.371191', 1, 198, 126, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (50, 'Sonia Wahi', 39, 11, NULL, 'https://www.linkedin.com/in/sonia-wahi-8b964b46/', 0, NULL, 17, 32, '2025-02-09 14:15:31.937915', '2025-02-09 14:15:48.157252', 1, 147, 148, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (51, 'Megan Schwarzkopf', 39, 11, 8, 'https://www.linkedin.com/in/megan-schwarzkopf-668051138/', 0, NULL, 17, 32, '2025-02-09 14:18:52.324391', '2025-02-09 14:18:52.324391', 1, 81, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (52, 'Alisandra Tieke', 39, 11, NULL, 'https://www.linkedin.com/in/alisandra-tieke-6b9671b2/', 0, NULL, 17, 32, '2025-02-09 14:20:23.866035', '2025-02-09 14:20:23.866035', 1, 73, 54, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (53, 'Eric Norman', 39, 11, 27, 'https://www.linkedin.com/in/eric-norman/', 0, NULL, 17, 32, '2025-02-09 14:21:37.628321', '2025-02-09 14:21:37.628321', 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (54, 'David Seo', 3, 1, 11, 'https://www.linkedin.com/in/david-seo/', 0, NULL, 27, 32, '2025-02-09 14:23:24.969128', '2025-02-09 14:23:24.969128', 1, 185, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (55, 'Max Ingerman', 38, 11, NULL, 'https://www.linkedin.com/in/maxingerman/', 0, NULL, 17, 32, '2025-02-09 14:26:20.198719', '2025-02-09 14:26:20.198719', 1, 65, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (56, 'Samuel Richardson', 38, 11, NULL, 'https://www.linkedin.com/in/samuel-richardson-590969151/', 0, NULL, 17, 32, '2025-02-09 14:27:56.783116', '2025-02-09 14:27:56.783116', 1, 193, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (57, 'Yvette Ye', 38, 11, NULL, 'https://www.linkedin.com/in/yvetteye/', 0, NULL, 17, 32, '2025-02-09 14:29:27.253181', '2025-02-09 14:29:27.253181', 1, 69, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (58, 'Rahul Agarwal', 38, 11, NULL, '', 0, NULL, 17, 32, '2025-02-09 14:33:00.42363', '2025-02-09 14:33:00.42363', 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (59, 'Chloe Johnson', 38, 11, NULL, 'https://www.linkedin.com/in/chloe-johnson-089779196/', 0, NULL, 17, 32, '2025-02-09 14:36:29.128942', '2025-02-09 14:36:29.128942', 1, 107, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (60, 'Julia Martin', 38, 11, NULL, 'https://www.linkedin.com/in/julia-martin/', 0, NULL, 17, 32, '2025-02-09 14:38:17.651979', '2025-02-09 14:38:17.651979', 1, 53, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (61, 'Constanze Boehm', 38, 11, NULL, 'https://www.linkedin.com/in/constanze-boehm-239a1318a/', 0, NULL, 17, 32, '2025-02-09 14:40:01.118778', '2025-02-09 14:40:01.118778', 1, 178, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (62, 'Annie Lai', 38, 11, NULL, 'https://www.linkedin.com/in/-annie-lai/?originalSubdomain=ca', 0, NULL, 17, 32, '2025-02-09 14:40:50.168944', '2025-02-09 14:40:50.168944', 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (63, 'Carl Vestberg', 38, 11, NULL, 'https://www.linkedin.com/in/carl-vestberg/', 0, NULL, 17, 32, '2025-02-09 14:41:43.783251', '2025-02-09 14:41:43.783251', 1, 65, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (64, 'Ben Eldredge', 42, 11, 6, 'https://www.linkedin.com/in/benjamin-eldredge-a187675/', 0, NULL, 20, 32, '2025-02-09 17:36:43.346482', '2025-02-09 17:36:43.346482', 1, 150, 126, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (65, 'Daniel Levy', 42, 11, 1, 'https://www.linkedin.com/in/daniellevy2/', 0, NULL, 20, 32, '2025-02-09 17:38:38.850584', '2025-02-09 17:38:38.850584', 1, 95, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (66, 'Anthony (Tony) Magro', 42, 11, 4, '', 0, NULL, 20, 32, '2025-02-09 17:40:42.221114', '2025-02-09 17:40:42.221114', 1, 59, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (67, 'Abhinav Poddar', 42, 11, 7, 'https://www.linkedin.com/in/abhinav-poddar-25b7aa5/', 0, NULL, 20, 32, '2025-02-09 17:42:26.285879', '2025-02-09 17:42:26.285879', 1, NULL, 126, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (68, 'Paul-Emmanuel Prunet', 42, 11, 14, 'https://www.linkedin.com/in/paul-emmanuel-prunet-21598411/', 0, NULL, 20, 32, '2025-02-09 17:44:05.094866', '2025-02-09 17:44:05.094866', 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (69, 'Ira Wolfson', 42, 11, 14, '', 0, NULL, 20, 32, '2025-02-09 17:45:02.188607', '2025-02-09 17:45:02.188607', 1, 178, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (70, 'Luke Byrnes', 39, 11, NULL, 'https://www.linkedin.com/in/luke-byrnes-92090137/', 0, NULL, 20, 32, '2025-02-09 17:46:39.721458', '2025-02-09 17:46:39.721458', 1, 57, 126, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (71, 'Trip Killinger', 39, 11, NULL, '', 0, NULL, 20, 32, '2025-02-09 17:47:56.810264', '2025-02-09 17:47:56.810264', 1, NULL, 128, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (72, 'Aziz Bediri', 39, 11, NULL, 'https://www.linkedin.com/in/aziz-b-0805a658/?originalSubdomain=ca', 0, NULL, 20, 32, '2025-02-09 17:49:10.475698', '2025-02-09 17:49:10.475698', 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (73, 'Rijbergen (Jeff) Desroches', 39, 11, 3, 'https://www.linkedin.com/in/rijbergen-desroches-60354243/', 0, NULL, 20, 32, '2025-02-09 17:51:46.781444', '2025-02-09 17:52:09.455443', 1, 125, 148, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (74, 'Tom Kramer', 39, 11, 4, 'https://www.linkedin.com/in/thomasmkramer/', 0, NULL, 20, 32, '2025-02-09 17:53:52.159641', '2025-02-09 17:53:52.159641', 1, 193, 178, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (75, 'Luciano Lu', 39, 11, 27, 'https://www.linkedin.com/in/luciano-lu-998b5084/?originalSubdomain=ca', 0, NULL, 20, 32, '2025-02-09 17:55:39.701715', '2025-02-09 17:55:39.701715', 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (76, 'Vlad Preobrazhensky', 39, 11, 27, 'https://www.linkedin.com/in/vlad-preobrazhensky-982b47128/', 0, NULL, 20, 32, '2025-02-09 17:56:49.254039', '2025-02-09 17:56:49.254039', 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (77, 'Shriya Ravishankar', 39, 11, NULL, 'https://www.linkedin.com/in/shriyaravishankar/', 0, NULL, 20, 32, '2025-02-09 17:59:04.800018', '2025-02-09 17:59:04.800018', 1, NULL, 184, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (78, 'Jay Barden', 39, 11, NULL, 'https://www.linkedin.com/in/jaybarden/', 0, NULL, 20, 32, '2025-02-09 17:59:59.831297', '2025-02-09 18:00:41.454296', 1, 144, 180, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (79, 'John Kinsella', 39, 11, 13, 'https://www.linkedin.com/in/johnkinsellacolumbia/', 0, NULL, 20, 32, '2025-02-09 18:02:18.536164', '2025-02-09 18:02:18.536164', 1, 125, 106, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (80, 'Alexey Kruglov', 39, 11, NULL, 'https://www.linkedin.com/in/alexey-kruglov-36955176/', 0, NULL, 20, 32, '2025-02-09 18:03:29.053581', '2025-02-09 18:03:39.915521', 1, 101, 62, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (81, 'Woo Jin Lee', 39, 11, NULL, '', 0, NULL, 20, 32, '2025-02-09 18:05:34.179661', '2025-02-09 18:05:34.179661', 1, NULL, 126, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (82, 'Abigail (Abby) Charlton', 39, 11, NULL, 'https://www.linkedin.com/in/abigailcharlton/', 0, NULL, 20, 32, '2025-02-09 18:06:55.640289', '2025-02-09 18:07:06.208269', 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (83, 'Ben Pickle', 39, 11, NULL, 'https://www.linkedin.com/in/ben-pickle-89560a190/', 0, NULL, 20, 32, '2025-02-09 18:08:14.936351', '2025-02-09 18:08:14.936351', 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (84, 'Mark Williamson', 42, 11, 4, 'https://www.linkedin.com/in/mark-williamson-b5207a16/', 0, NULL, 21, 32, '2025-02-09 18:12:50.640452', '2025-02-09 18:12:50.640452', 1, 83, 126, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (85, 'Stephen Azoulay', 42, 11, NULL, 'https://www.linkedin.com/in/azoulaystephane/', 0, NULL, 21, 32, '2025-02-09 18:13:57.461346', '2025-02-09 18:13:57.461346', 1, NULL, 53, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (86, 'Jonathon Kaufman', 42, 11, 6, 'https://www.linkedin.com/in/jonathon-kaufman-a484605b/', 0, NULL, 21, 32, '2025-02-09 18:15:23.91051', '2025-02-09 18:15:23.91051', 1, 147, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (87, 'Ted Michaels', 42, 11, 6, 'https://www.linkedin.com/in/ted-michaels-92732418/', 0, NULL, 21, 32, '2025-02-09 18:19:24.646918', '2025-02-09 18:19:24.646918', 1, 77, 184, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (88, 'Andreas Burdach', 41, 11, NULL, 'https://www.linkedin.com/in/andreasburdach/', 0, NULL, 21, 32, '2025-02-09 18:20:57.121391', '2025-02-09 18:20:57.121391', 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (89, 'John Favorite', 41, 11, 22, 'https://www.linkedin.com/in/john-favorite-28124212/', 0, NULL, 21, 32, '2025-02-09 18:22:21.070203', '2025-02-09 18:22:21.070203', 1, 79, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (90, 'Joseph Salvatore', 41, 11, 6, 'https://www.linkedin.com/in/jsalvatore2/', 0, NULL, 21, 32, '2025-02-09 18:25:26.139107', '2025-02-09 18:25:26.139107', 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (91, 'Guilherme Musa', 41, 11, 6, 'https://www.linkedin.com/in/guilherme-musa-47086b21/', 0, NULL, 21, 32, '2025-02-09 18:27:11.415896', '2025-02-09 18:27:11.415896', 1, NULL, 184, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (92, 'Christopher Larmore', 40, 11, 4, 'https://www.linkedin.com/in/christopher-larmore-8a276742/', 0, NULL, 21, 32, '2025-02-09 18:28:28.310039', '2025-02-09 18:28:28.310039', 1, 61, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (93, 'Nicholas Salzman', 40, 11, NULL, 'https://www.linkedin.com/in/nicholassalzman/', 0, NULL, 21, 32, '2025-02-09 18:29:47.696746', '2025-02-09 18:29:47.696746', 1, 118, 184, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (94, 'Ariel Olyan', 40, 11, 27, 'https://www.linkedin.com/in/arielolyan/', 0, NULL, 21, 32, '2025-02-09 18:31:17.834427', '2025-02-09 18:31:17.834427', 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (95, 'David Steenwinkel', 5, 16, 11, 'https://www.linkedin.com/in/david-steenwinkel-a55b3573/', 0, NULL, 11, 32, '2025-02-09 18:33:08.506272', '2025-02-09 18:33:08.506272', 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (96, 'Steven Moroff', 40, 11, 27, 'https://www.linkedin.com/in/stevenmoroff/', 0, NULL, 21, 32, '2025-02-09 18:35:01.408737', '2025-02-09 18:35:01.408737', 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (97, 'Kanak Sarda', 40, 11, NULL, 'https://www.linkedin.com/in/kanaksarda/', 0, NULL, 21, 32, '2025-02-09 18:36:19.930001', '2025-02-09 18:36:19.930001', 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (98, 'Marcos Toti', 41, 11, NULL, 'https://www.linkedin.com/in/marcos-toti/', 0, NULL, NULL, 53, '2025-02-09 18:39:25.0248', '2025-02-09 18:39:25.0248', 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (99, 'Allison Hawkins', 39, 11, NULL, 'https://www.linkedin.com/in/allison-hawkins-9147b28b/', 0, NULL, 21, 32, '2025-02-09 18:44:17.714544', '2025-02-09 18:47:30.384403', 1, 205, 151, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (100, 'Taylor Carkner', 39, 11, NULL, 'https://www.linkedin.com/in/taylorcarkner/', 0, NULL, 21, 32, '2025-02-09 18:48:51.103101', '2025-02-09 18:48:51.103101', 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (101, 'Yil Krasniqi', 39, 11, NULL, 'https://www.linkedin.com/in/yll-krasniqi/', 0, NULL, 21, 32, '2025-02-09 18:50:46.261047', '2025-02-09 18:50:46.261047', 1, 101, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (102, 'Seth Cooper', 39, 11, NULL, 'https://www.linkedin.com/in/seth-cooper-714b04122/', 0, NULL, 21, 32, '2025-02-09 18:51:51.70284', '2025-02-09 18:51:51.70284', 1, 193, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (103, 'Duncan Colterjohn', 39, 11, 4, 'https://www.linkedin.com/in/duncancolterjohn/', 0, NULL, NULL, 32, '2025-02-09 18:53:06.038367', '2025-02-09 18:53:06.038367', 1, NULL, 126, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (104, 'Kush Gupta', 39, 11, NULL, 'https://www.linkedin.com/in/guptakush5/', 0, NULL, 21, 32, '2025-02-09 18:56:30.992447', '2025-02-09 18:56:30.992447', 1, NULL, 62, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (105, 'Yun Chen', 39, 11, NULL, 'https://www.linkedin.com/in/yunchenmba/', 0, NULL, 21, 32, '2025-02-09 19:00:34.79052', '2025-02-09 19:00:34.79052', 1, NULL, 106, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (106, 'Christian Magherby', 39, 11, NULL, 'https://www.linkedin.com/in/christian-m-225601154/', 0, NULL, 21, 32, '2025-02-09 19:02:05.024254', '2025-02-09 19:02:05.024254', 1, 199, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (107, 'Cole Roseborough', 39, 11, NULL, 'https://www.linkedin.com/in/cole-roseborough/', 0, NULL, 21, 32, '2025-02-09 19:06:15.380569', '2025-02-09 19:06:15.380569', 1, 95, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (108, 'Kamil Skrzypek', 39, 11, NULL, 'https://www.linkedin.com/in/kamilskrzypek/', 0, NULL, 21, 32, '2025-02-09 19:08:04.591151', '2025-02-09 19:08:04.591151', 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (109, 'Varun Sehgal', 39, 11, 22, 'https://www.linkedin.com/in/varun-sehgal-2021/', 0, NULL, 21, 32, '2025-02-09 19:10:19.033397', '2025-02-09 19:10:19.033397', 1, NULL, 150, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (110, 'Conor Commons', 39, 11, 27, 'https://www.linkedin.com/in/conor-commons/', 0, NULL, 21, 32, '2025-02-09 19:14:36.93952', '2025-02-09 19:14:36.93952', 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (111, 'Filippo Botta', 39, 11, NULL, 'https://www.linkedin.com/in/filippo-botta-249882133/', 0, NULL, 21, 32, '2025-02-09 19:15:57.581257', '2025-02-09 19:15:57.581257', 1, 95, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (112, 'Justin Bai', 38, 11, NULL, 'https://www.linkedin.com/in/justinbai01/', 0, NULL, 21, 32, '2025-02-09 19:28:12.048702', '2025-02-09 19:28:12.048702', 1, 77, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (113, 'Pratha Bodas', 38, 11, NULL, 'https://www.linkedin.com/in/prathabodas/', 0, NULL, 21, 32, '2025-02-09 19:32:53.078052', '2025-02-09 19:33:14.004005', 1, 206, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (114, 'Evelyn Cai', 38, 11, NULL, 'https://www.linkedin.com/in/evcai/', 0, NULL, 21, 32, '2025-02-09 19:34:34.453926', '2025-02-09 19:34:34.453926', 1, 105, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (115, 'Pamela Duke', 38, 11, NULL, 'https://www.linkedin.com/in/pameladuke/', 0, NULL, 21, 32, '2025-02-09 19:35:50.023842', '2025-02-09 19:35:50.023842', 1, 129, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (116, 'Sanjana Ramaswamy', 38, 11, NULL, 'https://www.linkedin.com/in/sanjana-v-ramaswamy/', 0, NULL, 21, 32, '2025-02-09 19:36:48.55689', '2025-02-09 19:36:48.55689', 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (117, 'Joseph Daly', 38, 11, NULL, 'https://www.linkedin.com/in/joseph-d-566852187/', 0, NULL, 21, 32, '2025-02-09 19:44:00.885023', '2025-02-09 19:44:13.221257', 1, 127, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (118, 'Constanza Estrada-Navarro', 38, 11, NULL, 'https://www.linkedin.com/in/constanza-estrada-navarro/', 0, NULL, 21, 32, '2025-02-09 19:46:34.873949', '2025-02-09 19:47:08.320407', 1, 150, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (119, 'Kaily Ishikawa', 38, 11, NULL, 'https://www.linkedin.com/in/kaily-i-5b934318b/', 0, NULL, 21, 32, '2025-02-09 19:48:44.854767', '2025-02-09 19:49:50.650738', 1, 208, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (120, 'Sergi Sainz-Barrionuevo', 38, 11, NULL, 'https://www.linkedin.com/in/sergisainz/', 0, NULL, 21, 32, '2025-02-09 19:51:16.707327', '2025-02-09 19:51:16.707327', 1, 150, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (121, 'Matt Wright', 38, 11, NULL, 'https://www.linkedin.com/in/matt-wright-757372208/', 0, NULL, 21, 32, '2025-02-09 19:52:40.374204', '2025-02-09 19:52:40.374204', 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (122, 'Stuart Britton', 42, 11, NULL, '', 0, NULL, 22, 32, '2025-02-09 23:25:43.639072', '2025-02-09 23:25:43.639072', 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (123, 'Jin Kwon', 41, 11, 8, '', 0, NULL, 22, 32, '2025-02-09 23:28:25.255627', '2025-02-09 23:28:25.255627', 1, 140, 151, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (124, 'David Oppenheim', 41, 11, NULL, 'https://www.linkedin.com/in/david-m-oppenheim/', 0, NULL, 22, 32, '2025-02-09 23:29:24.207435', '2025-02-09 23:29:24.207435', 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (125, 'Brendan Gilbert', 40, 11, 135, 'https://www.linkedin.com/in/brendan-gilbert-06059a17/', 0, NULL, 22, 32, '2025-02-09 23:30:54.81018', '2025-02-09 23:30:54.81018', 1, 61, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (126, 'Charles (Charlie) Lee', 40, 11, NULL, 'https://www.linkedin.com/in/charles-lee-70b273b1/', 0, NULL, 22, 32, '2025-02-09 23:32:35.236188', '2025-02-09 23:32:50.532619', 1, 85, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (127, 'Sean Jarvis', 39, 11, NULL, '', 0, NULL, 22, 32, '2025-02-09 23:34:40.812431', '2025-02-09 23:34:40.812431', 1, 125, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (128, 'Alasdair Brown', 39, 11, NULL, 'https://www.linkedin.com/in/alasdair-brown-aa6aa0103/', 0, NULL, 22, 32, '2025-02-09 23:36:13.145924', '2025-02-09 23:36:13.145924', 1, 131, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (129, 'Keegan Brockman', 39, 11, NULL, 'https://www.linkedin.com/in/keeganbrockman-488939b4/', 0, NULL, 22, 32, '2025-02-09 23:37:39.320805', '2025-02-09 23:37:39.320805', 1, 107, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (130, 'Siddharth Singh', 39, 11, NULL, 'https://www.linkedin.com/in/siddharth-singh-a83636135/', 0, NULL, 22, 32, '2025-02-09 23:39:03.504019', '2025-02-09 23:39:03.504019', 1, 125, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (131, 'Jasmine Xing', 38, 11, NULL, '', 0, NULL, 22, 32, '2025-02-09 23:40:04.492994', '2025-02-09 23:40:04.492994', 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (132, 'Andrew Wong', 38, 11, NULL, 'https://www.linkedin.com/in/andrew-wong-86a7b8152/', 0, NULL, 22, 5, '2025-02-09 23:41:42.456691', '2025-02-09 23:41:42.456691', 1, 61, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (133, 'Matt Gandy', 42, 11, NULL, 'https://www.linkedin.com/in/matt-gandy-7b002b9/', 0, NULL, 22, 32, '2025-02-09 23:48:01.056796', '2025-02-09 23:48:01.056796', 1, 61, 179, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (134, 'John Harrington', 41, 11, NULL, '', 0, NULL, 22, 5, '2025-02-09 23:49:20.64942', '2025-02-09 23:49:20.64942', 1, 53, 126, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (135, 'Christopher Ross', 41, 11, 5, 'https://www.linkedin.com/in/christopher-ross-58600432/', 0, NULL, 22, 5, '2025-02-09 23:50:31.75432', '2025-02-09 23:50:31.75432', 1, 81, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (136, 'Gordon (Trey) Linke', 40, 11, 2, 'https://www.linkedin.com/in/gordon-trey-linke-a4a42b83/', 0, NULL, 22, 5, '2025-02-09 23:51:49.120499', '2025-02-09 23:51:49.120499', 1, 193, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (137, 'Sharon Kavjin', 39, 11, NULL, 'https://www.linkedin.com/in/sharon-kavjian-5b9356118/', 0, NULL, 22, 32, '2025-02-09 23:54:11.176046', '2025-02-09 23:54:11.176046', 1, 125, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (138, 'Teddy Friedman', 39, 11, NULL, 'https://www.linkedin.com/in/teddyfriedman/', 0, NULL, 22, 32, '2025-02-09 23:55:42.251813', '2025-02-09 23:55:42.251813', 1, 59, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (139, 'Alessia Russo', 38, 11, NULL, 'https://www.linkedin.com/in/alessia-russo/', 0, NULL, 22, 32, '2025-02-09 23:57:38.967147', '2025-02-09 23:57:38.967147', 1, 125, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (140, 'Alex Klippel', 38, 11, NULL, 'https://www.linkedin.com/in/alex-klippel/', 0, NULL, 22, 32, '2025-02-09 23:58:31.057287', '2025-02-09 23:58:31.057287', 1, 139, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (141, 'Jason Sobol', 42, 11, NULL, 'https://www.linkedin.com/in/jason-sobol-ab3a802/', 0, NULL, 23, 32, '2025-02-10 00:03:18.604733', '2025-02-10 00:03:18.604733', 1, 53, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (142, 'Nathan Graf', 42, 11, 4, 'https://www.linkedin.com/in/nathan-graf-2b0677/', 0, NULL, 23, 32, '2025-02-10 00:04:46.691112', '2025-02-10 00:04:46.691112', 1, 53, 126, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (143, 'Richard Hoyle', 42, 11, 10, 'https://www.linkedin.com/in/richardhoyle/?originalSubdomain=uk', 0, NULL, 23, 51, '2025-02-10 00:05:51.860754', '2025-02-10 00:06:14.72933', 1, 134, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (144, 'Alex Foster', 42, 11, 8, 'https://www.linkedin.com/in/alex-foster-8146283/', 0, NULL, 23, 32, '2025-02-10 00:08:18.916817', '2025-02-10 00:08:18.916817', 1, 103, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (145, 'Jonathan Knee', 42, 11, 3, '', 0, NULL, 23, 32, '2025-02-10 00:10:05.869899', '2025-02-10 00:10:05.869899', 1, 85, 121, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (146, 'Jaison Thomas', 41, 11, 4, 'https://www.linkedin.com/in/jaison-thomas-1199201/', 0, NULL, 23, 32, '2025-02-10 00:11:48.052945', '2025-02-10 00:11:58.922526', 1, NULL, 106, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (147, 'Ryan Schoenig', 41, 11, NULL, 'https://www.linkedin.com/in/ryan-schoenig-8392944/', 0, NULL, 23, 32, '2025-02-10 00:13:08.096383', '2025-02-10 00:13:08.096383', 1, 124, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (148, 'Eli Sevin', 41, 11, NULL, 'https://www.linkedin.com/in/eli-sevin-5b240715/', 0, NULL, 23, 32, '2025-02-10 00:14:18.703176', '2025-02-10 00:14:18.703176', 1, 61, 151, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (149, 'Arjun Perumalpillai', 41, 11, NULL, 'https://www.linkedin.com/in/arjun-perumalpillai-5b500439/?originalSubdomain=uk', 0, NULL, 23, 51, '2025-02-10 00:38:31.60512', '2025-02-10 00:38:31.60512', 1, 134, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (150, 'Natasha Pai', 40, 11, NULL, '', 0, NULL, 23, 32, '2025-02-10 00:40:09.143932', '2025-02-10 00:40:09.143932', 1, NULL, 151, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (151, 'Louisa Hertz', 40, 11, NULL, 'https://www.linkedin.com/in/louisa-hertz-97941123/', 0, NULL, 23, 32, '2025-02-10 00:41:30.306351', '2025-02-10 00:41:30.306351', 1, 52, 128, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (152, 'Justin Roman', 40, 11, 323, 'https://www.linkedin.com/in/justin-roman-10048514/', 0, NULL, 23, 32, '2025-02-10 00:43:54.458932', '2025-02-10 00:43:54.458932', 1, 71, 151, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (153, 'Andrey Simonyan', 40, 11, 16, 'https://www.linkedin.com/in/andrey-simonyan-89402423/', 0, NULL, 23, 32, '2025-02-10 00:45:37.089457', '2025-02-10 00:45:37.089457', 1, NULL, 128, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (154, 'Spencer Flajser', 40, 11, NULL, 'https://www.linkedin.com/in/spencer-flajser-1199a410/', 0, NULL, 23, 32, '2025-02-10 00:47:07.461404', '2025-02-10 00:47:07.461404', 1, NULL, 126, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (155, 'Robert Birns', 40, 11, NULL, 'https://www.linkedin.com/in/robert-birns-05336752/', 0, NULL, 23, 32, '2025-02-10 00:48:38.586912', '2025-02-10 00:48:38.586912', 1, 61, 126, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (156, 'Elizabeth Goodman', 40, 11, 10, 'https://www.linkedin.com/in/elizabeth-c-goodman-710b4865/?originalSubdomain=uk', 0, NULL, 23, 51, '2025-02-10 00:50:12.106542', '2025-02-10 00:50:19.459118', 1, NULL, 126, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (157, 'Michael Lizza', 40, 11, NULL, '', 0, NULL, 23, 32, '2025-02-10 00:51:24.627353', '2025-02-10 00:51:24.627353', 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (158, 'Anirban Neog', 40, 11, NULL, 'https://www.linkedin.com/in/anirbanneog/', 0, NULL, 23, 32, '2025-02-10 00:52:38.133607', '2025-02-10 00:52:38.133607', 1, NULL, 148, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (159, 'Holly Jackson', 39, 11, 6, 'https://www.linkedin.com/in/holly-jackson-39bb5a153/?originalSubdomain=uk', 0, NULL, 23, 51, '2025-02-10 00:53:57.996419', '2025-02-10 00:54:03.853936', 1, 122, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (160, 'Flora Yu', 39, 11, 310, 'https://www.linkedin.com/in/flora-k-yu/', 0, NULL, 23, 32, '2025-02-10 01:00:22.568277', '2025-02-10 01:00:22.568277', 1, 79, 60, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (161, 'Everett Allen', 39, 11, 213, 'https://www.linkedin.com/in/everettallen/', 0, NULL, 23, 32, '2025-02-10 01:02:26.706363', '2025-02-10 01:02:26.706363', 1, NULL, 126, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (162, 'Michael Adams', 39, 11, NULL, 'https://www.linkedin.com/in/michael-adams-68677019/', 0, NULL, 23, 32, '2025-02-10 01:09:13.990463', '2025-02-10 01:09:26.289847', 1, 209, 148, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (163, 'Gabrielle Bass', 39, 11, NULL, 'https://www.linkedin.com/in/gabrielle-bass-/', 0, NULL, 23, 32, '2025-02-10 01:15:24.63451', '2025-02-10 01:15:24.63451', 1, 147, 78, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (164, 'Jonathan Lanman', 39, 11, 4, 'https://www.linkedin.com/in/jonathanlanman/', 0, NULL, 23, 32, '2025-02-10 01:17:18.441964', '2025-02-10 01:17:18.441964', 1, 71, 126, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (165, 'Cady Lee', 39, 11, NULL, 'https://www.linkedin.com/in/cady-lee-cfa/', 0, NULL, 23, 32, '2025-02-10 01:21:08.423325', '2025-02-10 01:21:20.337159', 1, 211, 148, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (166, 'Dada Huang', 39, 11, 11, 'https://www.linkedin.com/in/dadahuang/', 0, NULL, 23, 32, '2025-02-10 01:23:04.522725', '2025-02-10 01:24:13.467869', 1, NULL, 151, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (167, 'Matthew Leslie', 39, 11, NULL, 'https://www.linkedin.com/in/matthew--leslie/?originalSubdomain=uk', 0, NULL, 23, 51, '2025-02-10 01:25:11.085383', '2025-02-10 01:25:19.408208', 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (169, 'Marek Hornak', 38, 11, NULL, 'https://www.linkedin.com/in/marekhornak/', 0, NULL, 23, 32, '2025-02-10 01:28:35.900007', '2025-02-10 01:28:35.900007', 1, 107, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (168, 'Vincente Ballester', 38, 11, NULL, 'https://www.linkedin.com/in/vicente-ballester/?originalSubdomain=es', 0, NULL, 23, 51, '2025-02-10 01:27:02.666715', '2025-02-10 01:28:44.295856', 1, NULL, 138, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (170, 'Chloe Macklin', 38, 11, NULL, 'https://www.linkedin.com/in/chloemacklin/', 0, NULL, 23, 32, '2025-02-10 01:29:35.01439', '2025-02-10 01:29:35.01439', 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (171, 'Lisa Qin', 38, 11, NULL, 'https://www.linkedin.com/in/lisa-qin/', 0, NULL, 23, 32, '2025-02-10 01:30:36.921518', '2025-02-10 01:30:36.921518', 1, 77, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (172, 'Pedro Saltos', 38, 11, NULL, 'https://www.linkedin.com/in/pedro-saltos/', 0, NULL, 23, 32, '2025-02-10 01:33:00.477056', '2025-02-10 01:33:00.477056', 1, 147, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (173, 'Simon Walton', 38, 11, NULL, 'https://www.linkedin.com/in/simon-walton-158606215/?originalSubdomain=uk', 0, NULL, 23, 32, '2025-02-10 01:35:21.94754', '2025-02-10 01:35:21.94754', 1, 134, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (174, 'Baptiste Audenaert', 38, 11, NULL, 'https://www.linkedin.com/in/baptiste-audenaert-89bb44173/', 0, NULL, 23, 32, '2025-02-10 01:36:40.914707', '2025-02-10 01:36:40.914707', 1, 147, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (175, 'Hugh Milam', 38, 11, NULL, 'https://www.linkedin.com/in/hugh-milam-2021561b9/', 0, NULL, 23, 32, '2025-02-10 01:37:53.842016', '2025-02-10 01:37:53.842016', 1, 147, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (176, 'Maxim Mounier', 38, 11, NULL, 'https://www.linkedin.com/in/maxim-mounier/', 0, NULL, 23, 32, '2025-02-10 01:38:59.057079', '2025-02-10 01:38:59.057079', 1, 57, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (177, 'Daniel Shi', 38, 11, NULL, 'https://www.linkedin.com/in/danieltshi/', 0, NULL, 23, 32, '2025-02-10 01:40:04.284457', '2025-02-10 01:40:04.284457', 1, 147, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (178, 'Leah Teichholtz', 38, 11, NULL, 'https://www.linkedin.com/in/teichholtz/', 0, NULL, 23, 32, '2025-02-10 01:41:15.840171', '2025-02-10 01:41:15.840171', 1, 53, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (179, 'John Startin', 42, 11, 1, 'https://www.linkedin.com/in/john-startin-35370b1/', 0, NULL, 24, 32, '2025-02-10 01:53:33.39707', '2025-02-10 01:53:33.39707', 1, 134, 148, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (180, 'Stephen Withnell', 42, 11, NULL, '', 0, NULL, 24, 32, '2025-02-10 01:54:54.633729', '2025-02-10 01:54:54.633729', 1, NULL, 134, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (181, 'Andrew Frame', 41, 11, 6, 'https://www.linkedin.com/in/andrew-frame-14637526/', 0, NULL, 24, 32, '2025-02-10 01:56:04.890024', '2025-02-10 01:56:04.890024', 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (182, 'Pavel Te', 41, 11, 6, 'https://www.linkedin.com/in/pavel-te-b065912b/', 0, NULL, 24, 32, '2025-02-10 01:57:20.215522', '2025-02-10 01:57:20.215522', 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (183, 'Jonathan Edelstein', 40, 11, 15, 'https://www.linkedin.com/in/jonathanedelstein/', 0, NULL, 24, 32, '2025-02-10 01:58:28.330021', '2025-02-10 01:58:28.330021', 1, 61, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (184, 'Paul Hans', 39, 11, 27, 'https://www.linkedin.com/in/paul-hans/', 0, NULL, 24, 32, '2025-02-10 02:00:20.569397', '2025-02-10 02:00:20.569397', 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (185, 'Alexandre Labelle', 39, 11, NULL, '', 0, NULL, 24, 32, '2025-02-10 02:01:21.642619', '2025-02-10 02:01:21.642619', 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (186, 'Gabriela Harris', 38, 11, NULL, 'https://www.linkedin.com/in/gabriela-harris-3176351a7/', 0, NULL, 24, 32, '2025-02-10 02:02:37.424407', '2025-02-10 02:02:37.424407', 1, 191, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (187, 'Fabrizio Mata', 38, 11, NULL, 'https://www.linkedin.com/in/fabriziomata/', 0, NULL, 24, 32, '2025-02-10 02:04:10.407036', '2025-02-10 02:04:10.407036', 1, 105, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (188, 'Sebastian Murray', 38, 11, NULL, 'https://www.linkedin.com/in/sebastian-murray/', 0, NULL, 24, 32, '2025-02-10 02:05:12.703184', '2025-02-10 02:05:12.703184', 1, 178, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (189, 'Gavin McElhennon', 38, 11, NULL, 'https://www.linkedin.com/in/gavin-mcelhennon/', 0, NULL, 24, 32, '2025-02-10 02:06:16.469638', '2025-02-10 02:06:16.469638', 1, 118, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (190, 'Tannon Krumpelman', 42, 11, 9, 'https://www.linkedin.com/in/tannon-krumpelman-8a718b153/', 0, NULL, 18, 32, '2025-02-10 02:24:51.834169', '2025-02-10 02:24:51.834169', 1, 114, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (191, 'Jeff Haller', 42, 11, 1, 'https://www.linkedin.com/in/jeff-haller-75029b6/', 0, NULL, 18, 32, '2025-02-10 02:28:40.733669', '2025-02-10 02:28:40.733669', 1, 206, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (192, 'Muhammad Siddiqui', 41, 11, 4, 'https://www.linkedin.com/in/masiddiqui1/', 0, NULL, 18, 32, '2025-02-10 02:30:45.651654', '2025-02-10 02:30:45.651654', 1, NULL, 62, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (193, 'Hillary Powers', 40, 11, NULL, 'https://www.linkedin.com/in/hillarypowers/', 0, NULL, 18, 32, '2025-02-10 02:32:47.646799', '2025-02-10 02:32:47.646799', 1, NULL, 62, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (194, 'Pavan Rao', 40, 11, 31, 'https://www.linkedin.com/in/pavan-rao-b2230182/', 0, NULL, 18, 32, '2025-02-10 02:34:10.737217', '2025-02-10 02:34:10.737217', 1, 79, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (195, 'Kanika Vaidya', 39, 11, NULL, '', 0, NULL, 18, 32, '2025-02-10 02:35:45.696574', '2025-02-10 02:35:45.696574', 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (196, 'Frances Litvak', 39, 11, NULL, 'https://www.linkedin.com/in/frances-litvak-fitzgerald-290ab736/', 0, NULL, 18, 32, '2025-02-10 02:37:33.335744', '2025-02-10 02:37:33.335744', 1, 79, 126, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (197, 'Kush Patel', 39, 11, 12, 'https://www.linkedin.com/in/kush-patel-nyustern/', 0, NULL, 18, 32, '2025-02-10 02:38:55.44384', '2025-02-10 02:38:55.44384', 1, 101, 184, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (198, 'Julie Ferguson', 39, 11, NULL, 'https://www.linkedin.com/in/julieferguson023/', 0, NULL, 18, 32, '2025-02-10 02:40:12.813437', '2025-02-10 02:40:12.813437', 1, NULL, 58, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (199, 'Lynette Wu', 38, 11, NULL, 'https://www.linkedin.com/in/lynette-d-wu/', 0, NULL, 18, 32, '2025-02-10 02:48:15.012424', '2025-02-10 02:48:15.012424', 1, 127, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (200, 'Nikita Popik', 38, 11, NULL, 'https://www.linkedin.com/in/nikitapopik/', 0, NULL, 18, 32, '2025-02-10 02:53:23.692096', '2025-02-10 02:53:23.692096', 1, 93, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (201, 'Parv Golwelker', 38, 11, NULL, 'https://www.linkedin.com/in/parv-golwelkar/', 0, NULL, 18, 32, '2025-02-10 02:55:24.383848', '2025-02-10 02:55:24.383848', 1, 127, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (202, 'Jungwoo Park', 38, 11, NULL, 'https://www.linkedin.com/in/jungwoopark/', 0, NULL, 18, 32, '2025-02-10 02:57:31.14107', '2025-02-10 02:58:18.375947', 1, 125, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (203, 'Viraj Kathuria', 38, 11, NULL, 'https://www.linkedin.com/in/viraj-kathuria-825597168/', 0, NULL, 18, 32, '2025-02-10 02:59:10.275593', '2025-02-10 02:59:10.275593', 1, 114, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (204, 'Parmis Rouzbahani', 38, 11, NULL, 'https://www.linkedin.com/in/parmis-rouzbahani/', 0, NULL, 18, 32, '2025-02-10 03:00:23.754255', '2025-02-10 03:00:23.754255', 1, 52, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (205, 'Wes Blabey', 38, 11, NULL, 'https://www.linkedin.com/in/weston-blabey/', 0, NULL, 18, 32, '2025-02-10 03:01:18.896431', '2025-02-10 03:01:18.896431', 1, 65, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (206, 'Francois Maisonrouge', 42, 11, 6, 'https://www.linkedin.com/in/francois-maisonrouge-0a371510/', 0, NULL, 19, 32, '2025-02-10 03:03:34.441274', '2025-02-10 03:03:34.441274', 1, NULL, 54, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (207, 'Mark Hanson', 42, 11, 8, '', 0, NULL, 19, 32, '2025-02-10 03:04:39.621868', '2025-02-10 03:04:39.621868', 1, NULL, 60, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (208, 'John Honts', 42, 11, NULL, 'https://www.linkedin.com/in/john-honts-b8270314/', 0, NULL, 19, 32, '2025-02-10 03:05:47.842185', '2025-02-10 03:05:47.842185', 1, 105, 121, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (209, 'Maren Winnick', 42, 11, 1, '', 0, NULL, 19, 32, '2025-02-10 03:07:09.70127', '2025-02-10 03:07:09.70127', 1, 59, 126, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (210, 'Ted Omlid', 42, 11, NULL, 'https://www.linkedin.com/in/ted-omlid-723a401/', 0, NULL, 19, 32, '2025-02-10 03:09:48.974208', '2025-02-10 03:11:14.775846', 1, 212, 80, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (211, 'Matthew McAskin', 42, 11, 1, 'https://www.linkedin.com/in/matthew-mcaskin-74874189/', 0, NULL, 19, 32, '2025-02-10 03:12:54.042747', '2025-02-10 03:12:54.042747', 1, 79, 126, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (212, 'Bernhard Sakmann', 6, 329, 11, 'https://www.linkedin.com/in/bernhard-sakmann-8a0292/', 0, NULL, 2, 32, '2025-02-10 03:15:46.730676', '2025-02-10 03:16:46.871853', 1, NULL, 134, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (213, 'Anand Marathe', 42, 11, NULL, 'https://www.linkedin.com/in/anand-marathe-1673011/', 0, NULL, 19, 32, '2025-02-10 03:18:10.923483', '2025-02-10 03:20:05.117844', 1, 73, 126, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (214, 'Ed Baxter', 42, 11, 4, 'https://www.linkedin.com/in/edbaxter/', 0, NULL, 19, 5, '2025-02-10 03:21:14.281145', '2025-02-10 03:21:14.281145', 1, NULL, 148, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (215, 'Bradley Wolff', 42, 11, 5, 'https://www.linkedin.com/in/bradley-wolff-293144/', 0, NULL, 19, 5, '2025-02-10 03:22:40.983194', '2025-02-10 03:22:40.983194', 1, NULL, 76, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (216, 'Simon Elliott', 41, 11, 11, 'https://www.linkedin.com/in/simon-elliott-91359919/?originalSubdomain=uk', 0, NULL, 19, 51, '2025-02-10 03:24:53.643738', '2025-02-10 03:24:53.643738', 1, 134, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (217, 'Naveen Nataraj', 42, 11, NULL, 'https://www.linkedin.com/in/naveen-nataraj-45119a14b/', 0, NULL, 25, 32, '2025-02-10 03:50:12.959328', '2025-02-10 03:50:12.959328', 1, 89, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (218, 'Tom Stokes', 42, 11, 1, 'https://www.linkedin.com/in/tom-stokes-304b279/', 0, NULL, 25, 32, '2025-02-10 03:52:35.676662', '2025-02-10 03:52:35.676662', 1, 132, 151, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (219, 'Adi Jayaraman', 42, 11, 5, 'https://www.linkedin.com/in/adi-jayaraman-533a213/', 0, NULL, 25, 32, '2025-02-10 03:55:31.78655', '2025-02-10 03:55:31.78655', 1, NULL, 148, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (220, 'Seth Bergstein', 42, 11, 3, '', 0, NULL, 25, 32, '2025-02-10 03:57:39.440386', '2025-02-10 03:57:39.440386', 1, 191, 151, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (221, 'Nick Pomponi', 42, 11, 1, '', 0, NULL, 25, 32, '2025-02-10 04:05:46.354456', '2025-02-10 04:06:11.523486', 1, 139, 180, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (222, 'Michelle McKenna', 42, 11, NULL, 'https://www.linkedin.com/in/michelle-mckenna-194472a/', 0, NULL, 25, 32, '2025-02-10 04:07:38.938965', '2025-02-10 04:07:38.938965', 1, NULL, 68, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (223, 'Fausto Borotto', 41, 11, 3, 'https://www.linkedin.com/in/fausto-borotto-91b546/', 0, NULL, 25, 32, '2025-02-10 04:10:00.402788', '2025-02-10 04:10:00.402788', 1, 142, 126, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (224, 'Kunal Chakrabarti', 41, 11, 9, '', 0, NULL, 25, 32, '2025-02-10 04:11:15.420048', '2025-02-10 04:11:15.420048', 1, NULL, 62, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (225, 'Victor Chan', 41, 11, 5, '', 0, NULL, 25, 32, '2025-02-10 04:12:54.274555', '2025-02-10 04:12:54.274555', 1, 57, 58, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (226, 'Vinay Kameswaran', 41, 11, 5, '', 0, NULL, 25, 32, '2025-02-10 04:14:48.852427', '2025-02-10 04:14:48.852427', 1, NULL, 128, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (227, 'Faith Serrano-Pierre', 41, 11, NULL, 'https://www.linkedin.com/in/faithserrano/', 0, NULL, 25, 32, '2025-02-10 04:16:04.658395', '2025-02-10 04:16:04.658395', 1, 191, 54, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (228, 'Sandeep Sharma', 41, 11, 3, 'https://www.linkedin.com/in/sandeep-sharma-67642411/', 0, NULL, 25, 32, '2025-02-10 04:17:27.823043', '2025-02-10 04:17:27.823043', 1, NULL, 184, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (229, 'Stella Yoo', 41, 11, NULL, 'https://www.linkedin.com/in/sominyoo/', 0, NULL, 25, 32, '2025-02-10 04:18:27.703046', '2025-02-10 04:18:27.703046', 1, 79, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (230, 'Anthony Arguelles', 41, 11, NULL, 'https://www.linkedin.com/in/anthony-arguelles-a8375390/', 0, NULL, 25, 32, '2025-02-10 04:20:37.007497', '2025-02-10 04:21:21.305203', 1, 213, 54, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (231, 'Jaskaran Bakshi', 40, 11, NULL, '', 0, NULL, 25, 32, '2025-02-10 04:25:48.009647', '2025-02-10 04:25:48.009647', 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (232, 'Stefano Combi', 40, 11, NULL, 'https://www.linkedin.com/in/stefano-combi-a40a9248/', 0, NULL, 25, 32, '2025-02-10 04:27:13.125806', '2025-02-10 04:27:13.125806', 1, 211, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (233, 'Jonathan Fung', 40, 11, NULL, 'https://www.linkedin.com/in/jonfung/', 0, NULL, 25, 32, '2025-02-10 04:28:30.743002', '2025-02-10 04:28:30.743002', 1, NULL, 128, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (234, 'James Hyland', 40, 11, 1, 'https://www.linkedin.com/in/james-hyland-jr-93ab9a27/', 0, NULL, 25, 32, '2025-02-10 04:31:52.947974', '2025-02-10 04:31:52.947974', 1, 81, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (235, 'Alex Kirshenbaum', 40, 11, NULL, 'https://www.linkedin.com/in/akirshenbaum/', 0, NULL, 25, 32, '2025-02-10 04:33:34.355713', '2025-02-10 04:33:34.355713', 1, 79, 126, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (236, 'Mara Bollenbacher', 40, 11, NULL, 'https://www.linkedin.com/in/marabollenbacher/', 0, NULL, 25, 32, '2025-02-10 04:36:56.44869', '2025-02-10 04:36:56.44869', 1, 146, 126, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (237, 'Ike Ngwudo', 40, 11, NULL, 'https://www.linkedin.com/in/ikemefunangwudo/', 0, NULL, 25, 32, '2025-02-10 04:38:47.022374', '2025-02-10 04:38:47.022374', 1, 59, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (238, 'Michael Smith', 40, 11, NULL, 'https://www.linkedin.com/in/michael-p-smith-cfa/', 0, NULL, 25, 32, '2025-02-10 04:41:10.508661', '2025-02-10 04:41:10.508661', 1, 101, 58, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (239, 'Eli Ben-Shushan', 39, 11, NULL, 'https://www.linkedin.com/in/eli-ben-shushan-759440140/', 0, NULL, 25, 32, '2025-02-10 04:42:23.489744', '2025-02-10 04:42:23.489744', 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (240, 'Afreen Ghauri', 39, 11, 302, 'https://www.linkedin.com/in/afreenghauri/', 0, NULL, 25, 32, '2025-02-10 04:43:46.048353', '2025-02-10 04:43:46.048353', 1, NULL, 148, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (241, 'Zachary Hickey', 39, 11, NULL, 'https://www.linkedin.com/in/zacharyhickey/', 0, NULL, 25, 32, '2025-02-10 04:47:04.714804', '2025-02-10 04:47:04.714804', 1, NULL, 148, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (242, 'Jia Hu', 39, 11, NULL, '', 0, NULL, 25, 32, '2025-02-10 04:48:09.731759', '2025-02-10 04:48:09.731759', 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (243, 'Austin Muller', 39, 11, NULL, 'https://www.linkedin.com/in/austinsmuller/', 0, NULL, 25, 32, '2025-02-10 04:49:37.308452', '2025-02-10 04:49:37.308452', 1, 212, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (244, 'Sam Murphy', 39, 11, 311, 'https://www.linkedin.com/in/smurphy9/', 0, NULL, 25, 32, '2025-02-10 04:51:20.019844', '2025-02-10 04:51:20.019844', 1, NULL, 126, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (245, 'John Oh', 39, 11, NULL, 'https://www.linkedin.com/in/johnjinoh/', 0, NULL, 25, 32, '2025-02-10 04:52:19.713673', '2025-02-10 04:52:19.713673', 1, NULL, 148, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (246, 'Avika Saraf', 39, 11, NULL, 'https://www.linkedin.com/in/avikasaraf/', 0, NULL, 25, 32, '2025-02-10 04:53:45.753657', '2025-02-10 04:53:45.753657', 1, 69, 130, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (247, 'Sam Sadeghi', 39, 11, NULL, 'https://www.linkedin.com/in/ssadeghi/', 0, NULL, 25, 32, '2025-02-10 04:54:51.540957', '2025-02-10 04:54:51.540957', 1, NULL, 58, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (248, 'Greta Simons', 39, 11, 2, 'https://www.linkedin.com/in/gretasimons/', 0, NULL, 25, 32, '2025-02-10 04:56:14.491117', '2025-02-10 04:56:14.491117', 1, 103, 126, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (249, 'Max Spector', 39, 11, 30, 'https://www.linkedin.com/in/max-spector/', 0, NULL, 25, 32, '2025-02-10 04:57:25.92714', '2025-02-10 04:57:25.92714', 1, 101, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (250, 'Reena Xue', 39, 11, NULL, '', 0, NULL, 25, 32, '2025-02-10 04:59:59.3723', '2025-02-10 04:59:59.3723', 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (251, 'Joey Yu', 22, 252, 11, 'https://www.linkedin.com/in/joey-yu-cfa-12540478/', 0, NULL, NULL, 5, '2025-02-10 05:02:18.756476', '2025-02-10 05:02:18.756476', 4, 128, 195, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (252, 'Aintzane Aboitiz', 38, 11, NULL, 'https://www.linkedin.com/in/aintzane-aboitiz-braun/', 0, NULL, 25, 32, '2025-02-10 05:03:34.803431', '2025-02-10 05:03:34.803431', 1, 122, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (253, 'Eric Brand', 38, 11, NULL, 'https://www.linkedin.com/in/eric-brand-86300a16a/', 0, NULL, 25, 32, '2025-02-10 05:04:45.316018', '2025-02-10 05:04:45.316018', 1, 79, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (254, 'Oliver Effron', 38, 11, NULL, 'https://www.linkedin.com/in/oliver-effron-39b9561b8/', 0, NULL, 25, 32, '2025-02-10 05:05:44.924292', '2025-02-10 05:05:44.924292', 1, 124, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (255, 'Ryan Hering', 38, 11, NULL, 'https://www.linkedin.com/in/ryanhering/', 0, NULL, 25, 32, '2025-02-10 05:07:19.722678', '2025-02-10 05:07:19.722678', 1, 185, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (256, 'Jeanne Lauer', 38, 11, NULL, 'https://www.linkedin.com/in/jeanne-lauer-96bbb01a5/', 0, NULL, 25, 32, '2025-02-10 05:08:37.101972', '2025-02-10 05:08:37.101972', 1, 53, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (257, 'Starry Qie', 38, 11, NULL, 'https://www.linkedin.com/in/starry-q/?trk=public_profile_browsemap', 0, NULL, 25, 32, '2025-02-10 05:10:30.260482', '2025-02-10 05:10:30.260482', 1, 95, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (258, 'Grant Schwartz', 38, 11, NULL, 'https://www.linkedin.com/in/grant-schwartz-943b46128/', 0, NULL, 25, 32, '2025-02-10 05:11:25.964564', '2025-02-10 05:11:25.964564', 1, 53, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (259, 'Jenny Tan', 38, 11, NULL, 'https://www.linkedin.com/in/jenny-tan-b61888150/', 0, NULL, 25, 32, '2025-02-10 05:12:20.045408', '2025-02-10 05:12:20.045408', 1, 122, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (260, 'Jo Tong', 38, 11, NULL, 'https://www.linkedin.com/in/jieyingtong/', 0, NULL, NULL, 32, '2025-02-10 05:13:21.394488', '2025-02-10 05:13:21.394488', 1, 95, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (261, 'Naveen Vimalathas', 38, 11, NULL, 'https://www.linkedin.com/in/naveen-vimalathas-1892121b4/', 0, NULL, 25, 32, '2025-02-10 05:14:40.987396', '2025-02-10 05:14:40.987396', 1, 79, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (262, 'Eric Wu', 38, 11, NULL, 'https://www.linkedin.com/in/wueric22/', 0, NULL, 25, 32, '2025-02-10 05:15:36.632955', '2025-02-10 05:15:36.632955', 1, 147, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (263, 'Matthew Connelly', 38, 11, NULL, 'https://www.linkedin.com/in/matthewgconnelly/', 0, NULL, 25, 32, '2025-02-10 05:16:49.699487', '2025-02-10 05:16:49.699487', 1, 79, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (264, 'Margarita Demkina', 38, 11, NULL, 'https://www.linkedin.com/in/margarita-demkina/', 0, NULL, 25, 32, '2025-02-10 05:18:06.354706', '2025-02-10 05:18:06.354706', 1, 125, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (265, 'Mahamat Djour', 38, 11, NULL, 'https://www.linkedin.com/in/mdjour/', 0, NULL, 25, 32, '2025-02-10 05:20:54.375619', '2025-02-10 05:21:09.391416', 1, 185, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (266, 'Anne Fang', 38, 11, NULL, '', 0, NULL, 25, 32, '2025-02-10 05:24:15.304534', '2025-02-10 05:24:15.304534', 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (267, 'Dylan Fitzgerald', 38, 11, NULL, 'https://www.linkedin.com/in/dylan-fitzgerald/', 0, NULL, 25, 32, '2025-02-10 05:25:55.322471', '2025-02-10 05:25:55.322471', 1, 185, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (268, 'Noah Lin', 38, 11, NULL, 'https://www.linkedin.com/in/noah--lin/', 0, NULL, 25, 32, '2025-02-10 05:26:48.396348', '2025-02-10 05:26:48.396348', 1, 191, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (269, 'Arie Serrant', 38, 11, NULL, 'https://www.linkedin.com/in/arieserrant/', 0, NULL, 25, 32, '2025-02-10 05:28:11.722613', '2025-02-10 05:28:11.722613', 1, 61, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (270, 'Athena Wu', 38, 11, NULL, 'https://www.linkedin.com/in/athena-w/', 0, NULL, 25, 32, '2025-02-10 05:29:01.790371', '2025-02-10 05:29:01.790371', 1, 93, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (271, 'Angela Young', 38, 11, NULL, 'https://www.linkedin.com/in/aqyang/', 0, NULL, 25, 32, '2025-02-10 05:29:51.162409', '2025-02-10 05:29:51.162409', 1, 129, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (272, 'Lawrence Young', 38, 11, NULL, 'https://www.linkedin.com/in/lawrencezyoung/', 0, NULL, 25, 32, '2025-02-10 05:30:43.159001', '2025-02-10 05:30:43.159001', 1, 105, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (273, 'Mark Friedman', 42, 11, 4, '', 0, NULL, 26, 32, '2025-02-10 05:32:22.477547', '2025-02-10 05:32:22.477547', 1, 101, 95, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (274, 'Mark Whatley', 42, 11, 4, '', 0, NULL, 26, 32, '2025-02-10 05:33:26.053615', '2025-02-10 05:33:26.053615', 1, NULL, 106, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (275, 'Christopher Lynch', 41, 11, 4, '', 0, NULL, 26, 32, '2025-02-10 05:34:39.749543', '2025-02-10 05:34:39.749543', 1, 204, 80, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (276, 'Jon Weinstein', 41, 11, 4, '', 0, NULL, 26, 32, '2025-02-10 05:35:54.329762', '2025-02-10 05:35:54.329762', 1, 61, NULL, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (277, 'Jack Eshelman', 41, 11, 6, 'https://www.linkedin.com/in/jackeshelman/', 0, NULL, 26, 32, '2025-02-10 05:37:14.585513', '2025-02-10 05:37:14.585513', 1, 77, 180, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (27, 'Seth Fromer', 41, 11, NULL, 'https://www.linkedin.com/in/seth-fromer-7899bb102/', 0, '', 16, 32, '2025-02-09 12:41:00', '2025-02-09 13:17:00', 1, 136, 126, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (278, 'James Black', 3, 330, NULL, 'https://www.linkedin.com/in/james-black-64458367/', 0, NULL, 175, 32, '2025-02-11 16:06:00.27432', '2025-02-11 16:06:00.27432', 1, NULL, 128, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (279, 'Timothy Tam', 3, 17, 309, 'https://www.linkedin.com/in/timothyhtam/', 0, NULL, 1, 5, '2025-02-11 16:47:21.584333', '2025-02-11 16:47:21.584333', 1, NULL, 128, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (280, 'Jessica Heller', 3, 15, NULL, 'https://www.linkedin.com/in/jessica-sloane-heller/', 0, NULL, 175, 32, '2025-02-11 16:49:11.119214', '2025-02-11 16:49:11.119214', 1, 150, 128, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (281, 'Mattia Lanzi', 3, 1, 301, 'https://www.linkedin.com/in/mattialanzi/', 0, NULL, 35, 32, '2025-02-11 16:51:50.529531', '2025-02-11 16:51:50.529531', 1, NULL, 128, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (282, 'Irene Jiang', 3, 9, NULL, 'https://www.linkedin.com/in/irene-j/', 0, NULL, 1, 32, '2025-02-11 16:53:15.920251', '2025-02-11 16:53:15.920251', 1, NULL, 128, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (283, 'Andrew Brown', 3, 1, NULL, 'https://www.linkedin.com/in/andrew-brown-c/', 0, NULL, NULL, 32, '2025-02-11 16:55:51.56806', '2025-02-11 16:55:51.56806', 1, 65, 128, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (284, 'Zoey Wang', 3, 1, NULL, '', 0, NULL, 32, 32, '2025-02-11 16:57:42.725322', '2025-02-11 16:57:42.725322', 1, 105, 128, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (285, 'Matthew Dingens', 3, 5, NULL, 'https://www.linkedin.com/in/matthew-dingens-522b3546/', 0, NULL, 81, 32, '2025-02-11 17:02:41.733437', '2025-02-11 17:02:41.733437', 1, NULL, 128, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (286, 'Finch Yuan', 3, 19, NULL, 'https://www.linkedin.com/in/finch-yuan/', 0, NULL, NULL, 32, '2025-02-11 17:16:48.183604', '2025-02-11 17:16:48.183604', 1, NULL, 128, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (287, 'Giancarlo Ladi', 3, 10, 219, 'https://www.linkedin.com/in/giancarlo-junior-ladi/', 0, NULL, 1, 32, '2025-02-11 17:21:49.485218', '2025-02-11 17:21:49.485218', 1, 131, 128, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (289, 'Daniel Cellars', 4, 17, 137, 'https://www.linkedin.com/in/danielcellars/', 0, NULL, 12, 32, '2025-02-11 17:32:32.406387', '2025-02-11 17:32:32.406387', 1, NULL, 128, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (290, 'Habeeb Kazeem', 3, 18, NULL, 'https://www.linkedin.com/in/habeelity/', 0, NULL, NULL, 32, '2025-02-11 17:55:40.424789', '2025-02-11 17:55:40.424789', 1, NULL, 128, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (291, 'Pete Randaccio', 4, 35, 1, 'https://www.linkedin.com/in/peterrandaccio/', 0, NULL, 1, 5, '2025-02-11 18:00:13.507919', '2025-02-11 18:00:13.507919', 1, 71, 128, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (292, 'Jeff Gaard', 3, 1, 332, 'https://www.linkedin.com/in/jeff-gaard-1900316b/', 1, NULL, 35, 32, '2025-02-16 23:38:50.441016', '2025-02-16 23:38:50.441016', 1, NULL, 128, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (293, 'Shelly Strasberg', 40, 11, 309, 'https://www.linkedin.com/in/shelly-strasberg-4b076672/', 1, NULL, NULL, 32, '2025-02-16 23:49:27.554222', '2025-02-16 23:49:27.554222', 1, NULL, 128, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (294, 'Alina Yuan', 3, 3, NULL, '', 1, 'Added by user. Needs Review', 62, 32, '2025-02-17 23:17:46.86784', '2025-02-17 23:17:46.86784', 1, NULL, 128, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (295, 'Michael Morris', 4, 16, NULL, 'https://www.linkedin.com/in/michael-morris-45a97213/', 1, 'Added by user. Needs Review', 13, 32, '2025-02-17 23:23:01.070875', '2025-02-17 23:23:01.070875', 1, NULL, 128, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (299, 'Robert Stenz', 5, 10, NULL, 'https://www.linkedin.com/in/rjstenz/', 1, 'Added by user. Needs Review', 271, 32, '2025-02-20 19:45:47.936732', '2025-02-20 19:45:47.936732', 1, 61, 128, NULL, 'robert.stenz@lazard.com', true);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (300, 'Richard Steinman', 6, 19, 3, 'https://www.linkedin.com/in/richard-steinman-0778941a9/', 1, 'Added by user. Needs Review', NULL, 32, '2025-02-20 19:49:48.592704', '2025-02-20 19:49:48.592704', 1, 114, 148, NULL, 'rsteinman@greenhill.com', true);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (288, 'Gerardo Mendez', 3, 5, NULL, '', 0, NULL, 315, 32, '2025-02-11 17:27:20.669293', '2025-02-18 19:20:40.040183', 1, 200, 128, NULL, NULL, NULL);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (296, 'Nicholas Pellicciaro', 3, 1, 19, 'https://www.linkedin.com/in/nicholas-pellicciaro-0b72b495/', 0, NULL, 31, 32, '2025-02-20 19:22:30.756607', '2025-02-20 19:22:30.756607', 1, NULL, 128, 'image/upload/v1740079353/rxlzizau6q0yhqb1vgum.jpg', '', false);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (297, 'Arvind Ramaiah', 3, 2, NULL, 'https://www.linkedin.com/in/arvind-ramaiah-23280689/', 0, NULL, 47, 32, '2025-02-20 19:24:47.603604', '2025-02-20 19:27:14.793887', 1, NULL, 128, 'image/upload/v1740079492/gvenitki2icuhgt5zoc4.jpg', 'arvind.ramaiah@jpmorgan.com', true);
INSERT INTO public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id, picture, email, email_used) VALUES (298, 'Nisha Mulay', 3, 330, 1, 'https://www.linkedin.com/in/nisha-mulay-896b5ba2/', 1, 'Added by user. Needs Review', 203, 32, '2025-02-20 19:40:05.432777', '2025-02-20 19:40:05.432777', 1, 61, 128, NULL, 'nmulay@centerview.com', true);


--
-- Data for Name: employee_views_employees; Type: TABLE DATA; Schema: public; Owner: jacobspitzer
--

INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (1, 1, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (2, 2, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (3, 3, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (4, 4, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (5, 5, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (6, 6, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (7, 7, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (8, 8, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (9, 9, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (10, 10, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (11, 11, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (12, 12, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (13, 13, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (14, 15, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (15, 16, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (16, 17, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (17, 18, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (18, 19, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (19, 20, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (20, 21, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (21, 22, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (22, 23, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (23, 24, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (24, 25, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (25, 26, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (26, 29, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (27, 30, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (28, 31, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (29, 32, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (30, 28, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (31, 14, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (32, 33, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (33, 34, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (34, 35, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (35, 36, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (36, 37, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (37, 38, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (38, 39, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (39, 40, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (40, 41, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (41, 42, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (42, 43, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (43, 44, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (44, 45, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (45, 46, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (46, 47, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (47, 48, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (48, 49, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (49, 50, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (50, 51, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (51, 52, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (52, 53, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (53, 54, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (54, 55, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (55, 56, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (56, 57, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (57, 58, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (58, 59, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (59, 60, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (60, 61, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (61, 62, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (62, 63, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (63, 64, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (64, 65, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (65, 66, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (66, 67, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (67, 68, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (68, 69, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (69, 70, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (70, 71, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (71, 72, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (72, 73, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (73, 74, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (74, 75, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (75, 76, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (76, 77, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (77, 78, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (78, 79, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (79, 80, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (80, 81, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (81, 82, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (82, 83, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (83, 84, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (84, 85, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (85, 86, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (86, 87, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (87, 88, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (88, 89, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (89, 90, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (90, 91, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (91, 92, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (92, 93, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (93, 94, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (94, 95, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (95, 96, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (96, 97, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (97, 98, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (98, 99, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (99, 100, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (100, 101, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (101, 102, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (102, 103, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (103, 104, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (104, 105, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (105, 106, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (106, 107, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (107, 108, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (108, 109, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (109, 110, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (110, 111, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (111, 112, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (112, 113, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (113, 114, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (114, 115, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (115, 116, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (116, 117, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (117, 118, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (118, 119, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (119, 120, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (120, 121, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (121, 122, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (122, 123, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (123, 124, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (124, 125, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (125, 126, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (126, 127, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (127, 128, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (128, 129, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (129, 130, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (130, 131, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (131, 132, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (132, 133, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (133, 134, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (134, 135, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (135, 136, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (136, 137, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (137, 138, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (138, 139, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (139, 140, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (140, 141, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (141, 142, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (142, 143, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (143, 144, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (144, 145, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (145, 146, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (146, 147, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (147, 148, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (148, 149, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (149, 150, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (150, 151, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (151, 152, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (152, 153, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (153, 154, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (154, 155, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (155, 156, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (156, 157, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (157, 158, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (158, 159, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (159, 160, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (160, 161, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (161, 162, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (162, 163, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (163, 164, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (164, 165, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (165, 166, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (166, 167, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (167, 169, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (168, 168, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (169, 170, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (170, 171, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (171, 172, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (172, 173, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (173, 174, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (174, 175, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (175, 176, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (176, 177, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (177, 178, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (178, 179, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (179, 180, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (180, 181, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (181, 182, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (182, 183, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (183, 184, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (184, 185, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (185, 186, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (186, 187, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (187, 188, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (188, 189, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (189, 190, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (190, 191, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (191, 192, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (192, 193, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (193, 194, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (194, 195, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (195, 196, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (196, 197, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (197, 198, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (198, 199, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (199, 200, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (200, 201, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (201, 202, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (202, 203, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (203, 204, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (204, 205, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (205, 206, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (206, 207, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (207, 208, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (208, 209, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (209, 210, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (210, 211, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (211, 212, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (212, 213, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (213, 214, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (214, 215, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (215, 216, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (216, 217, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (217, 218, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (218, 219, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (219, 220, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (220, 221, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (221, 222, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (222, 223, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (223, 224, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (224, 225, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (225, 226, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (226, 227, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (227, 228, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (228, 229, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (229, 230, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (230, 231, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (231, 232, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (232, 233, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (233, 234, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (234, 235, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (235, 236, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (236, 237, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (237, 238, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (238, 239, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (239, 240, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (240, 241, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (241, 242, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (242, 243, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (243, 244, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (244, 245, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (245, 246, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (246, 247, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (247, 248, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (248, 249, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (249, 250, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (250, 252, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (251, 253, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (252, 254, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (253, 255, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (254, 256, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (255, 257, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (256, 258, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (257, 259, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (258, 260, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (259, 261, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (260, 262, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (261, 263, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (262, 264, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (263, 265, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (264, 266, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (265, 267, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (266, 268, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (267, 269, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (268, 270, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (269, 271, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (270, 272, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (271, 273, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (272, 274, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (273, 275, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (274, 276, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (275, 277, 1, '2025-02-10 17:44:02.381254', '2025-02-10 17:44:02.381254');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (276, 27, 1, '2025-02-10 17:46:09.56171', '2025-02-10 17:46:09.56171');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (277, 1, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (278, 2, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (279, 3, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (280, 4, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (281, 5, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (282, 6, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (283, 7, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (284, 8, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (285, 9, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (286, 10, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (287, 11, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (288, 12, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (289, 13, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (290, 15, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (291, 16, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (292, 17, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (293, 18, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (294, 19, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (295, 20, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (296, 21, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (297, 22, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (298, 23, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (299, 24, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (300, 25, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (301, 26, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (302, 29, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (303, 30, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (304, 31, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (305, 32, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (306, 28, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (307, 14, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (308, 33, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (309, 34, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (310, 35, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (311, 36, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (312, 37, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (313, 38, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (314, 39, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (315, 40, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (316, 41, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (317, 42, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (318, 43, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (319, 44, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (320, 45, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (321, 46, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (322, 47, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (323, 48, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (324, 49, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (325, 50, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (326, 51, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (327, 52, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (328, 53, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (329, 55, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (330, 56, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (331, 57, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (332, 58, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (333, 59, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (334, 60, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (335, 61, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (336, 62, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (337, 63, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (338, 64, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (339, 65, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (340, 66, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (341, 67, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (342, 68, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (343, 69, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (344, 70, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (345, 71, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (346, 72, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (347, 73, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (348, 74, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (349, 75, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (350, 76, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (351, 77, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (352, 78, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (353, 79, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (354, 80, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (355, 81, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (356, 82, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (357, 83, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (358, 84, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (359, 85, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (360, 86, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (361, 87, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (362, 88, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (363, 89, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (364, 90, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (365, 91, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (366, 92, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (367, 93, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (368, 94, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (369, 96, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (370, 97, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (371, 98, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (372, 99, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (373, 100, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (374, 101, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (375, 102, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (376, 103, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (377, 104, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (378, 105, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (379, 106, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (380, 107, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (381, 108, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (382, 109, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (383, 110, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (384, 111, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (385, 112, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (386, 113, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (387, 114, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (388, 115, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (389, 116, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (390, 117, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (391, 118, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (392, 119, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (393, 120, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (394, 121, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (395, 122, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (396, 123, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (397, 124, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (398, 125, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (399, 126, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (400, 127, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (401, 128, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (402, 129, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (403, 130, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (404, 131, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (405, 132, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (406, 133, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (407, 134, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (408, 135, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (409, 136, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (410, 137, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (411, 138, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (412, 139, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (413, 140, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (414, 141, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (415, 142, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (416, 143, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (417, 144, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (418, 145, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (419, 146, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (420, 147, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (421, 148, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (422, 149, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (423, 150, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (424, 151, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (425, 152, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (426, 153, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (427, 154, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (428, 155, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (429, 156, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (430, 157, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (431, 158, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (432, 159, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (433, 160, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (434, 161, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (435, 162, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (436, 163, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (437, 164, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (438, 165, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (439, 166, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (440, 167, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (441, 169, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (442, 168, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (443, 170, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (444, 171, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (445, 172, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (446, 173, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (447, 174, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (448, 175, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (449, 176, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (450, 177, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (451, 178, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (452, 179, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (453, 180, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (454, 181, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (455, 182, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (456, 183, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (457, 184, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (458, 185, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (459, 186, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (460, 187, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (461, 188, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (462, 189, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (463, 190, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (464, 191, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (465, 192, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (466, 193, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (467, 194, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (468, 195, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (469, 196, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (470, 197, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (471, 198, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (472, 199, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (473, 200, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (474, 201, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (475, 202, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (476, 203, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (477, 204, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (478, 205, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (479, 206, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (480, 207, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (481, 208, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (482, 209, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (483, 210, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (484, 211, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (485, 213, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (486, 214, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (487, 215, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (488, 216, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (489, 217, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (490, 218, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (491, 219, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (492, 220, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (493, 221, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (494, 222, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (495, 223, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (496, 224, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (497, 225, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (498, 226, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (499, 227, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (500, 228, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (501, 229, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (502, 230, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (503, 231, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (504, 232, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (505, 233, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (506, 234, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (507, 235, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (508, 236, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (509, 237, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (510, 238, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (511, 239, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (512, 240, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (513, 241, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (514, 242, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (515, 243, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (516, 244, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (517, 245, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (518, 246, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (519, 247, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (520, 248, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (521, 249, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (522, 250, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (523, 252, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (524, 253, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (525, 254, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (526, 255, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (527, 256, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (528, 257, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (529, 258, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (530, 259, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (531, 260, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (532, 261, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (533, 262, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (534, 263, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (535, 264, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (536, 265, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (537, 266, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (538, 267, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (539, 268, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (540, 269, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (541, 270, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (542, 271, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (543, 272, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (544, 273, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (545, 274, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (546, 275, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (547, 276, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (548, 277, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (549, 27, 2, '2025-02-10 19:38:31.248788', '2025-02-10 19:38:31.248788');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (550, 278, 1, '2025-02-11 16:06:56.078638', '2025-02-11 16:06:56.078638');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (551, 279, 1, '2025-02-11 17:03:20.121399', '2025-02-11 17:03:20.121399');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (552, 282, 1, '2025-02-11 17:03:27.386216', '2025-02-11 17:03:27.386216');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (553, 280, 1, '2025-02-11 17:03:33.025992', '2025-02-11 17:03:33.025992');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (554, 281, 1, '2025-02-11 17:03:37.36626', '2025-02-11 17:03:37.36626');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (555, 283, 1, '2025-02-11 17:03:42.492459', '2025-02-11 17:03:42.492459');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (556, 284, 1, '2025-02-11 17:03:46.177818', '2025-02-11 17:03:46.177818');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (557, 285, 1, '2025-02-11 17:03:50.987495', '2025-02-11 17:03:50.987495');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (558, 286, 1, '2025-02-11 17:17:01.130385', '2025-02-11 17:17:01.130385');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (559, 287, 1, '2025-02-11 17:22:06.54886', '2025-02-11 17:22:06.54886');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (560, 288, 1, '2025-02-11 17:27:31.278681', '2025-02-11 17:27:31.278681');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (561, 289, 1, '2025-02-11 17:32:39.30631', '2025-02-11 17:32:39.30631');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (562, 290, 1, '2025-02-11 17:58:07.969068', '2025-02-11 17:58:07.969068');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (563, 291, 1, '2025-02-11 18:00:34.851136', '2025-02-11 18:00:34.851136');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (564, 292, 1, '2025-02-16 23:38:50.457228', '2025-02-16 23:38:50.457228');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (565, 293, 1, '2025-02-16 23:49:27.679338', '2025-02-16 23:49:27.679338');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (566, 295, 1, '2025-02-17 23:23:01.174216', '2025-02-17 23:23:01.174216');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (567, 294, 1, '2025-02-20 19:25:40.270975', '2025-02-20 19:25:40.270975');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (568, 296, 1, '2025-02-20 19:25:45.811307', '2025-02-20 19:25:45.811307');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (569, 297, 1, '2025-02-20 19:25:49.298784', '2025-02-20 19:25:49.298784');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (570, 298, 1, '2025-02-20 19:40:05.479745', '2025-02-20 19:40:05.479745');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (571, 299, 1, '2025-02-20 19:45:47.946589', '2025-02-20 19:45:47.946589');
INSERT INTO public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) VALUES (572, 300, 1, '2025-02-20 19:49:48.629551', '2025-02-20 19:49:48.629551');


--
-- Data for Name: employment_report_programs; Type: TABLE DATA; Schema: public; Owner: jacobspitzer
--

INSERT INTO public.employment_report_programs (id, name, program_type, created_at, updated_at) VALUES (1, 'University of Chicago Booth', 'MBA', '2025-02-16 02:38:56.149776', '2025-02-16 02:38:56.149776');
INSERT INTO public.employment_report_programs (id, name, program_type, created_at, updated_at) VALUES (2, 'Northwestern Kellogg', 'MBA', '2025-02-16 04:25:00', '2025-02-16 04:25:00');


--
-- Data for Name: employment_reports; Type: TABLE DATA; Schema: public; Owner: jacobspitzer
--

INSERT INTO public.employment_reports (id, employment_report_program_id, year, created_at, updated_at) VALUES (1, 1, 2024, '2025-02-16 02:39:06.842993', '2025-02-16 02:39:06.842993');
INSERT INTO public.employment_reports (id, employment_report_program_id, year, created_at, updated_at) VALUES (2, 2, 2024, '2025-02-16 04:25:59.278826', '2025-02-16 04:25:59.278826');


--
-- Data for Name: employment_report_details; Type: TABLE DATA; Schema: public; Owner: jacobspitzer
--



--
-- Data for Name: employment_report_employers; Type: TABLE DATA; Schema: public; Owner: jacobspitzer
--

INSERT INTO public.employment_report_employers (id, employment_report_id, bcg, mckinsey, bain, amazon, goldman_sachs, jpmorgan, bank_of_america, citigroup, deloitte, lek, capital_one, parthenon, tiktok, evercore, google, morgan_stanley, guggenheim, lazard, samsung, ubs, walmart, kearney, oliver_wyman, alixpartners, analysis_group, pwc, accenture, alvarez_marsal, wells_fargo, barclays, jefferies, visa, blackarch, vanguard, dell, adobe, microsoft, davita, unitedhealth, cigna, eli_lilly, pg, pepsico, conagra, hershey, created_at, updated_at, amgen, apple, johnson_and_johnson, kimberly_clark, kraft_heinz, mcmaster_carr, nike) VALUES (1, 1, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-16 02:52:22.592796', '2025-02-16 02:52:22.592796', false, false, false, false, false, false, false);
INSERT INTO public.employment_report_employers (id, employment_report_id, bcg, mckinsey, bain, amazon, goldman_sachs, jpmorgan, bank_of_america, citigroup, deloitte, lek, capital_one, parthenon, tiktok, evercore, google, morgan_stanley, guggenheim, lazard, samsung, ubs, walmart, kearney, oliver_wyman, alixpartners, analysis_group, pwc, accenture, alvarez_marsal, wells_fargo, barclays, jefferies, visa, blackarch, vanguard, dell, adobe, microsoft, davita, unitedhealth, cigna, eli_lilly, pg, pepsico, conagra, hershey, created_at, updated_at, amgen, apple, johnson_and_johnson, kimberly_clark, kraft_heinz, mcmaster_carr, nike) VALUES (3, 2, true, true, true, true, false, true, false, false, true, true, true, true, true, true, true, false, false, false, false, false, true, true, true, false, false, true, false, false, false, false, false, false, false, false, false, true, false, false, true, false, false, true, false, false, true, '2025-02-16 04:44:17.355528', '2025-02-16 04:44:17.355528', true, true, true, true, true, true, true);


--
-- Data for Name: employment_report_industries; Type: TABLE DATA; Schema: public; Owner: jacobspitzer
--

INSERT INTO public.employment_report_industries (id, employment_report_id, consulting, investment_banking, private_equity, venture_capital, marketing, created_at, updated_at, diversified_financial, investment_management, technology) VALUES (2, 1, 33.8, 9.4, 6.4, 1.4, 3.2, '2025-02-16 04:14:11.365049', '2025-02-16 04:14:11.365049', 11.4, 3.9, 14.8);
INSERT INTO public.employment_report_industries (id, employment_report_id, consulting, investment_banking, private_equity, venture_capital, marketing, created_at, updated_at, diversified_financial, investment_management, technology) VALUES (3, 2, 34.8066298342541, 4.69613259668508, 3.86740331491713, 0.552486187845304, 22.3926380368098, '2025-02-16 04:29:52.072851', '2025-02-16 04:29:52.072851', 3.31491712707182, 1.65745856353591, 20.4419889502762);


--
-- Data for Name: employment_report_locations; Type: TABLE DATA; Schema: public; Owner: jacobspitzer
--

INSERT INTO public.employment_report_locations (id, employment_report_id, united_states, northeast, midwest, west, southwest, south, mid_atlantic, international, created_at, updated_at) VALUES (1, 1, 94.10, 29.90, 29.90, 20.78, 5.90, 4.30, 3.20, 5.90, '2025-02-16 02:47:11.135739', '2025-02-16 02:47:11.135739');
INSERT INTO public.employment_report_locations (id, employment_report_id, united_states, northeast, midwest, west, southwest, south, mid_atlantic, international, created_at, updated_at) VALUES (2, 2, 93.5779816513762, 18.0428134556575, 36.3914373088685, 26.2996941896024, 5.5045871559633, 3.6697247706422, 3.36391437308868, 6.42201834862385, '2025-02-16 04:28:39.309623', '2025-02-16 04:28:39.309623');


--
-- Data for Name: employment_report_overviews; Type: TABLE DATA; Schema: public; Owner: jacobspitzer
--

INSERT INTO public.employment_report_overviews (id, employment_report_id, class_size, seeking_employment, not_seeking_employment, sponsored, starting_own_business, continuing_education, postponing_job_search, not_seeking_other, job_offers_3_months, created_at, updated_at, average_salary) VALUES (1, 1, 641, 521, 15.40, 10.30, 3.90, 0.50, 0.50, 0.30, 86.80, '2025-02-16 02:42:00', '2025-02-16 02:42:00', 175000);
INSERT INTO public.employment_report_overviews (id, employment_report_id, class_size, seeking_employment, not_seeking_employment, sponsored, starting_own_business, continuing_education, postponing_job_search, not_seeking_other, job_offers_3_months, created_at, updated_at, average_salary) VALUES (2, 2, 504, 423.0, 14.8936170212766, 2.83687943262411, 0.472813238770686, 0.0, 0.236406619385343, 0.0, 89.83, '2025-02-16 04:27:00', '2025-02-16 04:27:00', 166366);


--
-- Data for Name: exit_opportunity_mappings; Type: TABLE DATA; Schema: public; Owner: jacobspitzer
--

INSERT INTO public.exit_opportunity_mappings (id, source_category, target_node_name, likelihood, created_at, updated_at, target_industry) VALUES (1, 'Investment Banking', 'Associate', 1, '2025-02-15 16:00:32.860519', '2025-02-15 16:00:32.860519', 'Private Equity');
INSERT INTO public.exit_opportunity_mappings (id, source_category, target_node_name, likelihood, created_at, updated_at, target_industry) VALUES (2, 'Investment Banking', 'Associate', 2, '2025-02-15 16:00:32.864389', '2025-02-17 14:15:31.123441', 'Private Credit');


--
-- Data for Name: exit_opportunities_details; Type: TABLE DATA; Schema: public; Owner: jacobspitzer
--

INSERT INTO public.exit_opportunities_details (id, exit_opportunity_mapping_id, target_company_name, target_group, source_company_name, source_group, created_at, updated_at, likelihood) VALUES (3, 1, 'Apollo', '', 'Goldman Sachs', '', '2025-02-17 15:33:26.552218', '2025-02-17 15:33:26.552218', 1);
INSERT INTO public.exit_opportunities_details (id, exit_opportunity_mapping_id, target_company_name, target_group, source_company_name, source_group, created_at, updated_at, likelihood) VALUES (4, 1, 'Apollo', '', 'Evercore', 'Technology', '2025-02-17 15:37:22.441197', '2025-02-17 15:37:22.441197', 1);


--
-- Data for Name: flags; Type: TABLE DATA; Schema: public; Owner: jacobspitzer
--

INSERT INTO public.flags (id, flaggable_type, flaggable_id, user_id, reason, status, created_at, updated_at, text) VALUES (1, 'Employee', 3, 1, 'Duplicate Entry', 'resolved', '2025-02-16 22:48:19.265157', '2025-02-16 22:48:19.265157', 'Testing flag');
INSERT INTO public.flags (id, flaggable_type, flaggable_id, user_id, reason, status, created_at, updated_at, text) VALUES (2, 'Employee', 293, 1, 'User Submitted Profile', 'pending', '2025-02-16 23:49:27.58315', '2025-02-16 23:49:27.58315', 'This profile was created by a user and needs review.');
INSERT INTO public.flags (id, flaggable_type, flaggable_id, user_id, reason, status, created_at, updated_at, text) VALUES (3, 'Employee', 294, 1, 'User Submission', 'pending', '2025-02-17 23:17:46.954944', '2025-02-17 23:17:46.954944', 'New professional added by user. Needs review.');
INSERT INTO public.flags (id, flaggable_type, flaggable_id, user_id, reason, status, created_at, updated_at, text) VALUES (4, 'Employee', 295, 1, 'User Submission', 'pending', '2025-02-17 23:23:01.152336', '2025-02-17 23:23:01.152336', 'New professional added by user. Needs review.');
INSERT INTO public.flags (id, flaggable_type, flaggable_id, user_id, reason, status, created_at, updated_at, text) VALUES (5, 'Employee', 298, 1, 'User Submission', 'pending', '2025-02-20 19:40:05.46569', '2025-02-20 19:40:05.46569', 'New professional added by user. Needs review.');
INSERT INTO public.flags (id, flaggable_type, flaggable_id, user_id, reason, status, created_at, updated_at, text) VALUES (6, 'Employee', 299, 1, 'User Submission', 'pending', '2025-02-20 19:45:47.942584', '2025-02-20 19:45:47.942584', 'New professional added by user. Needs review.');
INSERT INTO public.flags (id, flaggable_type, flaggable_id, user_id, reason, status, created_at, updated_at, text) VALUES (7, 'Employee', 300, 1, 'User Submission', 'pending', '2025-02-20 19:49:48.619496', '2025-02-20 19:49:48.619496', 'New professional added by user. Needs review.');


--
-- Data for Name: form_templates; Type: TABLE DATA; Schema: public; Owner: jacobspitzer
--

INSERT INTO public.form_templates (id, form_context, question_text, response_type, created_at, updated_at, position_type_id, "position") VALUES (1, 'networking', 'How would you describe the tone of the conversation?', 'dropdown', '2025-02-11 16:13:22.215715', '2025-02-11 16:13:22.215715', 1, 1);
INSERT INTO public.form_templates (id, form_context, question_text, response_type, created_at, updated_at, position_type_id, "position") VALUES (3, 'networking', 'Were you asked any technical questions?', 'yes/no', '2025-02-11 16:15:29.016242', '2025-02-11 16:15:29.016242', 1, 2);
INSERT INTO public.form_templates (id, form_context, question_text, response_type, created_at, updated_at, position_type_id, "position") VALUES (4, 'networking', 'Were you asked about a deal?', 'yes/no', '2025-02-11 16:15:45.674507', '2025-02-11 16:15:45.674507', 1, 3);
INSERT INTO public.form_templates (id, form_context, question_text, response_type, created_at, updated_at, position_type_id, "position") VALUES (5, 'networking', 'Were you asked about a market trend?', 'yes/no', '2025-02-11 16:17:17.626626', '2025-02-11 16:17:17.626626', 1, 4);
INSERT INTO public.form_templates (id, form_context, question_text, response_type, created_at, updated_at, position_type_id, "position") VALUES (2, 'networking', 'How would you rate your interaction?', 'dropdown', '2025-02-11 16:13:37.443419', '2025-02-11 16:17:25.830205', 1, 5);
INSERT INTO public.form_templates (id, form_context, question_text, response_type, created_at, updated_at, position_type_id, "position") VALUES (6, 'networking', 'Were you referred to another colleague?', 'yes/no', '2025-02-11 16:17:55.252451', '2025-02-11 16:17:55.252451', 1, 6);
INSERT INTO public.form_templates (id, form_context, question_text, response_type, created_at, updated_at, position_type_id, "position") VALUES (7, 'interview', 'How would you describe the tone of the interview?', 'dropdown', '2025-02-11 16:18:54.326428', '2025-02-11 16:18:54.326428', 1, 1);
INSERT INTO public.form_templates (id, form_context, question_text, response_type, created_at, updated_at, position_type_id, "position") VALUES (8, 'interview', 'Were you asked about a deal?', 'yes/no', '2025-02-11 16:19:15.102465', '2025-02-11 16:19:15.102465', 1, 2);
INSERT INTO public.form_templates (id, form_context, question_text, response_type, created_at, updated_at, position_type_id, "position") VALUES (9, 'interview', 'Were you asked about a market trend?', 'yes/no', '2025-02-11 16:19:29.257341', '2025-02-11 16:19:29.257341', 1, 3);
INSERT INTO public.form_templates (id, form_context, question_text, response_type, created_at, updated_at, position_type_id, "position") VALUES (10, 'interview', 'Did you receive a job offer?', 'dropdown', '2025-02-11 16:20:02.484813', '2025-02-11 16:20:02.484813', 1, 7);
INSERT INTO public.form_templates (id, form_context, question_text, response_type, created_at, updated_at, position_type_id, "position") VALUES (11, 'interview', 'What was your overall impression of the interview?', 'dropdown', '2025-02-11 16:21:12.142516', '2025-02-11 16:21:12.142516', 1, 6);
INSERT INTO public.form_templates (id, form_context, question_text, response_type, created_at, updated_at, position_type_id, "position") VALUES (12, 'interview', 'How difficult were the technical questions?', 'dropdown', '2025-02-11 16:21:38.820379', '2025-02-11 16:21:38.820379', 1, 4);
INSERT INTO public.form_templates (id, form_context, question_text, response_type, created_at, updated_at, position_type_id, "position") VALUES (13, 'interview', 'Was this part of a superday or final round interview?', 'yes/no', '2025-02-11 16:26:26.846755', '2025-02-11 16:26:26.846755', 1, 5);


--
-- Data for Name: forum_rooms; Type: TABLE DATA; Schema: public; Owner: jacobspitzer
--

INSERT INTO public.forum_rooms (id, name, description, created_at, updated_at) VALUES (1, 'General Discussion', 'A place to talk about anything!', '2025-02-04 17:22:01.233788', '2025-02-04 17:22:01.233788');
INSERT INTO public.forum_rooms (id, name, description, created_at, updated_at) VALUES (2, 'Tech Talk', 'Discuss the latest in technology.', '2025-02-04 17:22:01.242564', '2025-02-04 17:22:01.242564');
INSERT INTO public.forum_rooms (id, name, description, created_at, updated_at) VALUES (3, 'Help Desk', 'Ask questions and get help.', '2025-02-04 17:22:01.249559', '2025-02-04 17:22:01.249559');


--
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: jacobspitzer
--



--
-- Data for Name: forum_comments; Type: TABLE DATA; Schema: public; Owner: jacobspitzer
--



--
-- Data for Name: interview_coaches; Type: TABLE DATA; Schema: public; Owner: jacobspitzer
--



--
-- Data for Name: items; Type: TABLE DATA; Schema: public; Owner: jacobspitzer
--

INSERT INTO public.items (id, name, created_at, updated_at, picture) VALUES (32, 'Rothschild', '2025-02-20 20:50:45.403776', '2025-02-20 20:50:45.403776', 'image/upload/v1740084645/ifkaczzxygfoqshmph5t.png');
INSERT INTO public.items (id, name, created_at, updated_at, picture) VALUES (33, 'UBS', '2025-02-20 20:50:52.717087', '2025-02-20 20:50:52.717087', 'image/upload/v1740084652/hdbghrgtbuu6jtjpznvg.png');
INSERT INTO public.items (id, name, created_at, updated_at, picture) VALUES (34, 'Wells Fargo', '2025-02-20 20:51:04.30088', '2025-02-20 20:51:04.30088', 'image/upload/v1740084664/uicorckaopmfspymmmi5.png');
INSERT INTO public.items (id, name, created_at, updated_at, picture) VALUES (5, 'Goldman Sachs', '2025-02-20 19:58:34.038498', '2025-02-20 19:59:10.089902', 'image/upload/v1740081550/mhmqqfkdqn82hnpp3ma3.png');
INSERT INTO public.items (id, name, created_at, updated_at, picture) VALUES (4, 'Evercore', '2025-02-20 19:56:00.433128', '2025-02-20 19:59:50.732842', 'image/upload/v1740081590/mib8g9cthoj9pspo2v87.jpg');
INSERT INTO public.items (id, name, created_at, updated_at, picture) VALUES (6, 'JPMorgan', '2025-02-20 20:22:04.965127', '2025-02-20 20:22:04.965127', 'image/upload/v1740082925/wadg7kbdamlcdwrgfmto.png');
INSERT INTO public.items (id, name, created_at, updated_at, picture) VALUES (7, 'Allen & Company', '2025-02-20 20:22:18.081039', '2025-02-20 20:22:18.081039', 'image/upload/v1740082938/qi3te7bc1xde22aqgsut.png');
INSERT INTO public.items (id, name, created_at, updated_at, picture) VALUES (8, 'Baird', '2025-02-20 20:22:26.023028', '2025-02-20 20:22:26.023028', 'image/upload/v1740082946/jf4hizbngboa1147stow.png');
INSERT INTO public.items (id, name, created_at, updated_at, picture) VALUES (9, 'Barclays', '2025-02-20 20:22:38.303063', '2025-02-20 20:22:38.303063', 'image/upload/v1740082958/f4yrnykxsyo0zpluozoh.png');
INSERT INTO public.items (id, name, created_at, updated_at, picture) VALUES (10, 'BNP Paribas', '2025-02-20 20:22:48.93822', '2025-02-20 20:22:48.93822', 'image/upload/v1740082969/omrmaycx5q9kwn9ub7lj.jpg');
INSERT INTO public.items (id, name, created_at, updated_at, picture) VALUES (11, 'Bank of America', '2025-02-20 20:22:57.780644', '2025-02-20 20:22:57.780644', 'image/upload/v1740082978/soopjlqvyfuadbyroh8p.png');
INSERT INTO public.items (id, name, created_at, updated_at, picture) VALUES (12, 'Centerview', '2025-02-20 20:23:06.695689', '2025-02-20 20:23:06.695689', 'image/upload/v1740082986/vinvawzydn3ctqqzazuw.png');
INSERT INTO public.items (id, name, created_at, updated_at, picture) VALUES (13, 'Citi', '2025-02-20 20:23:14.36722', '2025-02-20 20:23:14.36722', 'image/upload/v1740082994/jc2sc5et1qtpxnvhzhgv.png');
INSERT INTO public.items (id, name, created_at, updated_at, picture) VALUES (14, 'Deutsche Bank', '2025-02-20 20:23:25.387013', '2025-02-20 20:23:25.387013', 'image/upload/v1740083005/fuv6dpcwvogepd6vtifh.png');
INSERT INTO public.items (id, name, created_at, updated_at, picture) VALUES (15, 'DC Advisory', '2025-02-20 20:23:47.047153', '2025-02-20 20:23:47.047153', 'image/upload/v1740083027/zorewrfwhbzcoqjloijm.png');
INSERT INTO public.items (id, name, created_at, updated_at, picture) VALUES (16, 'Greenhill', '2025-02-20 20:24:20.08859', '2025-02-20 20:24:20.08859', 'image/upload/v1740083060/gxd3qjheshsjxcocf1e0.png');
INSERT INTO public.items (id, name, created_at, updated_at, picture) VALUES (17, 'Guggenheim', '2025-02-20 20:24:36.819027', '2025-02-20 20:24:36.819027', 'image/upload/v1740083077/azmxn5szlkkzmpdjjlym.png');
INSERT INTO public.items (id, name, created_at, updated_at, picture) VALUES (18, 'Houlihan Lokey', '2025-02-20 20:24:46.925925', '2025-02-20 20:24:46.925925', 'image/upload/v1740083087/u6h1mh2hg1vubjl229mx.png');
INSERT INTO public.items (id, name, created_at, updated_at, picture) VALUES (19, 'HSBC', '2025-02-20 20:24:55.640637', '2025-02-20 20:24:55.640637', 'image/upload/v1740083095/ald9yswyxf50qp0vigmr.png');
INSERT INTO public.items (id, name, created_at, updated_at, picture) VALUES (20, 'Jefferies', '2025-02-20 20:25:05.886899', '2025-02-20 20:25:05.886899', 'image/upload/v1740083106/etn1qgyb11sv1266wruf.png');
INSERT INTO public.items (id, name, created_at, updated_at, picture) VALUES (21, 'Lazard', '2025-02-20 20:25:16.818578', '2025-02-20 20:25:16.818578', 'image/upload/v1740083117/pj9ufeya9yup61hvdwk4.png');
INSERT INTO public.items (id, name, created_at, updated_at, picture) VALUES (22, 'LionTree', '2025-02-20 20:25:26.343511', '2025-02-20 20:25:26.343511', 'image/upload/v1740083126/ojqa0hpregdnkwdq3tsm.png');
INSERT INTO public.items (id, name, created_at, updated_at, picture) VALUES (23, 'Moelis', '2025-02-20 20:25:39.880205', '2025-02-20 20:25:39.880205', 'image/upload/v1740083140/wfqigfqxw221fuz4dez7.png');
INSERT INTO public.items (id, name, created_at, updated_at, picture) VALUES (24, 'Morgan Stanley', '2025-02-20 20:25:55.030716', '2025-02-20 20:25:55.030716', 'image/upload/v1740083155/ebbnxnika4ljschs0lk6.jpg');
INSERT INTO public.items (id, name, created_at, updated_at, picture) VALUES (25, 'Piper Sandler', '2025-02-20 20:26:06.825287', '2025-02-20 20:26:06.825287', 'image/upload/v1740083167/ca6gjredxztjpefnkbup.png');
INSERT INTO public.items (id, name, created_at, updated_at, picture) VALUES (26, 'PJT', '2025-02-20 20:47:36.94589', '2025-02-20 20:47:36.94589', 'image/upload/v1740084457/r2ld6hf1xb6x5i1zugll.png');
INSERT INTO public.items (id, name, created_at, updated_at, picture) VALUES (27, 'PWP', '2025-02-20 20:49:56.068224', '2025-02-20 20:49:56.068224', 'image/upload/v1740084596/konblf4ml4z6h8a9tcpj.png');
INSERT INTO public.items (id, name, created_at, updated_at, picture) VALUES (28, 'Qatalyst', '2025-02-20 20:50:06.840174', '2025-02-20 20:50:06.840174', 'image/upload/v1740084606/t1msexi4sbqnnbcuwf29.png');
INSERT INTO public.items (id, name, created_at, updated_at, picture) VALUES (29, 'Raine Group', '2025-02-20 20:50:17.558395', '2025-02-20 20:50:17.558395', 'image/upload/v1740084617/n0v8p5tmzwqa2slq2k77.png');
INSERT INTO public.items (id, name, created_at, updated_at, picture) VALUES (30, 'Raymond James', '2025-02-20 20:50:26.023585', '2025-02-20 20:50:26.023585', 'image/upload/v1740084626/tsxodl9am93sxcze3edm.png');
INSERT INTO public.items (id, name, created_at, updated_at, picture) VALUES (31, 'RBC', '2025-02-20 20:50:33.768827', '2025-02-20 20:50:33.768827', 'image/upload/v1740084633/mfpd6tlthdf1liocphq7.png');


--
-- Data for Name: item_ranks; Type: TABLE DATA; Schema: public; Owner: jacobspitzer
--

INSERT INTO public.item_ranks (id, item_id, tier_list_id, custom_values, rank, created_at, updated_at, user_id) VALUES (26, 4, 3, '[]', 1, '2025-02-20 20:47:02.460693', '2025-02-20 20:52:02.624386', 1);
INSERT INTO public.item_ranks (id, item_id, tier_list_id, custom_values, rank, created_at, updated_at, user_id) VALUES (4, 4, 2, '[]', 1, '2025-02-20 20:36:13.491376', '2025-02-20 20:36:30.235452', 1);
INSERT INTO public.item_ranks (id, item_id, tier_list_id, custom_values, rank, created_at, updated_at, user_id) VALUES (3, 5, 2, '[]', 1, '2025-02-20 20:36:13.483784', '2025-02-20 20:36:35.945495', 1);
INSERT INTO public.item_ranks (id, item_id, tier_list_id, custom_values, rank, created_at, updated_at, user_id) VALUES (5, 6, 2, '[]', 2, '2025-02-20 20:36:13.496043', '2025-02-20 20:36:42.703114', 1);
INSERT INTO public.item_ranks (id, item_id, tier_list_id, custom_values, rank, created_at, updated_at, user_id) VALUES (6, 7, 2, '[]', 2, '2025-02-20 20:36:13.502203', '2025-02-20 20:36:52.252877', 1);
INSERT INTO public.item_ranks (id, item_id, tier_list_id, custom_values, rank, created_at, updated_at, user_id) VALUES (7, 8, 2, '[]', 4, '2025-02-20 20:36:13.506308', '2025-02-20 20:37:01.188608', 1);
INSERT INTO public.item_ranks (id, item_id, tier_list_id, custom_values, rank, created_at, updated_at, user_id) VALUES (8, 9, 2, '[]', 5, '2025-02-20 20:36:13.509918', '2025-02-20 20:37:08.047834', 1);
INSERT INTO public.item_ranks (id, item_id, tier_list_id, custom_values, rank, created_at, updated_at, user_id) VALUES (25, 5, 3, '[]', 1, '2025-02-20 20:47:02.454813', '2025-02-20 20:52:07.435524', 1);
INSERT INTO public.item_ranks (id, item_id, tier_list_id, custom_values, rank, created_at, updated_at, user_id) VALUES (9, 10, 2, '[]', 5, '2025-02-20 20:36:13.513232', '2025-02-20 20:37:18.195436', 1);
INSERT INTO public.item_ranks (id, item_id, tier_list_id, custom_values, rank, created_at, updated_at, user_id) VALUES (10, 11, 2, '[]', 3, '2025-02-20 20:36:13.516574', '2025-02-20 20:37:23.418575', 1);
INSERT INTO public.item_ranks (id, item_id, tier_list_id, custom_values, rank, created_at, updated_at, user_id) VALUES (11, 12, 2, '[]', 1, '2025-02-20 20:36:13.519454', '2025-02-20 20:37:27.105024', 1);
INSERT INTO public.item_ranks (id, item_id, tier_list_id, custom_values, rank, created_at, updated_at, user_id) VALUES (12, 13, 2, '[]', 4, '2025-02-20 20:36:13.522397', '2025-02-20 20:37:31.606029', 1);
INSERT INTO public.item_ranks (id, item_id, tier_list_id, custom_values, rank, created_at, updated_at, user_id) VALUES (13, 14, 2, '[]', 6, '2025-02-20 20:36:13.525076', '2025-02-20 20:37:38.225297', 1);
INSERT INTO public.item_ranks (id, item_id, tier_list_id, custom_values, rank, created_at, updated_at, user_id) VALUES (14, 15, 2, '[]', 4, '2025-02-20 20:36:13.528033', '2025-02-20 20:37:44.28176', 1);
INSERT INTO public.item_ranks (id, item_id, tier_list_id, custom_values, rank, created_at, updated_at, user_id) VALUES (15, 16, 2, '[]', 4, '2025-02-20 20:36:13.531676', '2025-02-20 20:37:48.525913', 1);
INSERT INTO public.item_ranks (id, item_id, tier_list_id, custom_values, rank, created_at, updated_at, user_id) VALUES (16, 17, 2, '[]', 3, '2025-02-20 20:36:13.53705', '2025-02-20 20:37:52.502911', 1);
INSERT INTO public.item_ranks (id, item_id, tier_list_id, custom_values, rank, created_at, updated_at, user_id) VALUES (17, 18, 2, '[]', 3, '2025-02-20 20:36:13.540082', '2025-02-20 20:37:57.954352', 1);
INSERT INTO public.item_ranks (id, item_id, tier_list_id, custom_values, rank, created_at, updated_at, user_id) VALUES (18, 19, 2, '[]', 5, '2025-02-20 20:36:13.543126', '2025-02-20 20:38:02.518932', 1);
INSERT INTO public.item_ranks (id, item_id, tier_list_id, custom_values, rank, created_at, updated_at, user_id) VALUES (19, 20, 2, '[]', 4, '2025-02-20 20:36:13.546304', '2025-02-20 20:38:15.22911', 1);
INSERT INTO public.item_ranks (id, item_id, tier_list_id, custom_values, rank, created_at, updated_at, user_id) VALUES (20, 21, 2, '[]', 2, '2025-02-20 20:36:13.549543', '2025-02-20 20:38:27.771702', 1);
INSERT INTO public.item_ranks (id, item_id, tier_list_id, custom_values, rank, created_at, updated_at, user_id) VALUES (21, 22, 2, '[]', 3, '2025-02-20 20:36:13.552615', '2025-02-20 20:38:33.258663', 1);
INSERT INTO public.item_ranks (id, item_id, tier_list_id, custom_values, rank, created_at, updated_at, user_id) VALUES (22, 23, 2, '[]', 2, '2025-02-20 20:36:13.555543', '2025-02-20 20:38:37.605168', 1);
INSERT INTO public.item_ranks (id, item_id, tier_list_id, custom_values, rank, created_at, updated_at, user_id) VALUES (23, 24, 2, '[]', 2, '2025-02-20 20:36:13.558593', '2025-02-20 20:38:41.329067', 1);
INSERT INTO public.item_ranks (id, item_id, tier_list_id, custom_values, rank, created_at, updated_at, user_id) VALUES (24, 25, 2, '[]', 5, '2025-02-20 20:36:13.561677', '2025-02-20 20:38:46.521332', 1);
INSERT INTO public.item_ranks (id, item_id, tier_list_id, custom_values, rank, created_at, updated_at, user_id) VALUES (47, 32, 2, '[]', NULL, '2025-02-20 20:51:24.864845', '2025-02-20 20:51:24.864845', 1);
INSERT INTO public.item_ranks (id, item_id, tier_list_id, custom_values, rank, created_at, updated_at, user_id) VALUES (48, 33, 2, '[]', NULL, '2025-02-20 20:51:24.870665', '2025-02-20 20:51:24.870665', 1);
INSERT INTO public.item_ranks (id, item_id, tier_list_id, custom_values, rank, created_at, updated_at, user_id) VALUES (49, 34, 2, '[]', NULL, '2025-02-20 20:51:24.875652', '2025-02-20 20:51:24.875652', 1);
INSERT INTO public.item_ranks (id, item_id, tier_list_id, custom_values, rank, created_at, updated_at, user_id) VALUES (50, 26, 2, '[]', NULL, '2025-02-20 20:51:24.904952', '2025-02-20 20:51:24.904952', 1);
INSERT INTO public.item_ranks (id, item_id, tier_list_id, custom_values, rank, created_at, updated_at, user_id) VALUES (51, 27, 2, '[]', NULL, '2025-02-20 20:51:24.908612', '2025-02-20 20:51:24.908612', 1);
INSERT INTO public.item_ranks (id, item_id, tier_list_id, custom_values, rank, created_at, updated_at, user_id) VALUES (52, 28, 2, '[]', NULL, '2025-02-20 20:51:24.9141', '2025-02-20 20:51:24.9141', 1);
INSERT INTO public.item_ranks (id, item_id, tier_list_id, custom_values, rank, created_at, updated_at, user_id) VALUES (53, 29, 2, '[]', NULL, '2025-02-20 20:51:24.917088', '2025-02-20 20:51:24.917088', 1);
INSERT INTO public.item_ranks (id, item_id, tier_list_id, custom_values, rank, created_at, updated_at, user_id) VALUES (54, 30, 2, '[]', NULL, '2025-02-20 20:51:24.922904', '2025-02-20 20:51:24.922904', 1);
INSERT INTO public.item_ranks (id, item_id, tier_list_id, custom_values, rank, created_at, updated_at, user_id) VALUES (55, 31, 2, '[]', NULL, '2025-02-20 20:51:24.926745', '2025-02-20 20:51:24.926745', 1);
INSERT INTO public.item_ranks (id, item_id, tier_list_id, custom_values, rank, created_at, updated_at, user_id) VALUES (27, 6, 3, '[]', 3, '2025-02-20 20:47:02.466013', '2025-02-20 20:52:11.600209', 1);
INSERT INTO public.item_ranks (id, item_id, tier_list_id, custom_values, rank, created_at, updated_at, user_id) VALUES (28, 7, 3, '[]', 3, '2025-02-20 20:47:02.470404', '2025-02-20 20:52:19.174575', 1);
INSERT INTO public.item_ranks (id, item_id, tier_list_id, custom_values, rank, created_at, updated_at, user_id) VALUES (29, 8, 3, '[]', 5, '2025-02-20 20:47:02.474961', '2025-02-20 20:52:24.32322', 1);
INSERT INTO public.item_ranks (id, item_id, tier_list_id, custom_values, rank, created_at, updated_at, user_id) VALUES (30, 9, 3, '[]', 4, '2025-02-20 20:47:02.479139', '2025-02-20 20:52:28.599235', 1);
INSERT INTO public.item_ranks (id, item_id, tier_list_id, custom_values, rank, created_at, updated_at, user_id) VALUES (31, 10, 3, '[]', 5, '2025-02-20 20:47:02.482651', '2025-02-20 20:52:33.681126', 1);
INSERT INTO public.item_ranks (id, item_id, tier_list_id, custom_values, rank, created_at, updated_at, user_id) VALUES (32, 11, 3, '[]', 3, '2025-02-20 20:47:02.486261', '2025-02-20 20:52:39.245134', 1);
INSERT INTO public.item_ranks (id, item_id, tier_list_id, custom_values, rank, created_at, updated_at, user_id) VALUES (33, 12, 3, '[]', 1, '2025-02-20 20:47:02.489906', '2025-02-20 20:52:43.011803', 1);
INSERT INTO public.item_ranks (id, item_id, tier_list_id, custom_values, rank, created_at, updated_at, user_id) VALUES (34, 13, 3, '[]', 3, '2025-02-20 20:47:02.493345', '2025-02-20 20:52:47.463564', 1);
INSERT INTO public.item_ranks (id, item_id, tier_list_id, custom_values, rank, created_at, updated_at, user_id) VALUES (35, 14, 3, '[]', 5, '2025-02-20 20:47:02.496656', '2025-02-20 20:52:51.291369', 1);
INSERT INTO public.item_ranks (id, item_id, tier_list_id, custom_values, rank, created_at, updated_at, user_id) VALUES (36, 15, 3, '[]', 5, '2025-02-20 20:47:02.499619', '2025-02-20 20:52:54.38807', 1);
INSERT INTO public.item_ranks (id, item_id, tier_list_id, custom_values, rank, created_at, updated_at, user_id) VALUES (37, 16, 3, '[]', 4, '2025-02-20 20:47:02.506761', '2025-02-20 20:52:58.479869', 1);
INSERT INTO public.item_ranks (id, item_id, tier_list_id, custom_values, rank, created_at, updated_at, user_id) VALUES (38, 17, 3, '[]', 3, '2025-02-20 20:47:02.512342', '2025-02-20 20:53:03.644386', 1);
INSERT INTO public.item_ranks (id, item_id, tier_list_id, custom_values, rank, created_at, updated_at, user_id) VALUES (39, 18, 3, '[]', 4, '2025-02-20 20:47:02.516045', '2025-02-20 20:53:09.485824', 1);
INSERT INTO public.item_ranks (id, item_id, tier_list_id, custom_values, rank, created_at, updated_at, user_id) VALUES (40, 19, 3, '[]', 5, '2025-02-20 20:47:02.520773', '2025-02-20 20:53:13.97225', 1);
INSERT INTO public.item_ranks (id, item_id, tier_list_id, custom_values, rank, created_at, updated_at, user_id) VALUES (41, 20, 3, '[]', 4, '2025-02-20 20:47:02.524281', '2025-02-20 20:53:22.867938', 1);
INSERT INTO public.item_ranks (id, item_id, tier_list_id, custom_values, rank, created_at, updated_at, user_id) VALUES (42, 21, 3, '[]', 2, '2025-02-20 20:47:02.526958', '2025-02-20 20:53:26.505974', 1);
INSERT INTO public.item_ranks (id, item_id, tier_list_id, custom_values, rank, created_at, updated_at, user_id) VALUES (43, 22, 3, '[]', 4, '2025-02-20 20:47:02.529793', '2025-02-20 20:53:31.114916', 1);
INSERT INTO public.item_ranks (id, item_id, tier_list_id, custom_values, rank, created_at, updated_at, user_id) VALUES (44, 23, 3, '[]', 2, '2025-02-20 20:47:02.532968', '2025-02-20 20:53:35.240373', 1);
INSERT INTO public.item_ranks (id, item_id, tier_list_id, custom_values, rank, created_at, updated_at, user_id) VALUES (45, 24, 3, '[]', 2, '2025-02-20 20:47:02.535808', '2025-02-20 20:53:39.214263', 1);
INSERT INTO public.item_ranks (id, item_id, tier_list_id, custom_values, rank, created_at, updated_at, user_id) VALUES (46, 25, 3, '[]', 5, '2025-02-20 20:47:02.538865', '2025-02-20 20:53:43.919551', 1);
INSERT INTO public.item_ranks (id, item_id, tier_list_id, custom_values, rank, created_at, updated_at, user_id) VALUES (59, 26, 3, '[]', 1, '2025-02-20 20:51:39.297257', '2025-02-20 20:53:48.268623', 1);
INSERT INTO public.item_ranks (id, item_id, tier_list_id, custom_values, rank, created_at, updated_at, user_id) VALUES (60, 27, 3, '[]', 2, '2025-02-20 20:51:39.30039', '2025-02-20 20:53:52.54461', 1);
INSERT INTO public.item_ranks (id, item_id, tier_list_id, custom_values, rank, created_at, updated_at, user_id) VALUES (61, 28, 3, '[]', 1, '2025-02-20 20:51:39.305467', '2025-02-20 20:53:55.947731', 1);
INSERT INTO public.item_ranks (id, item_id, tier_list_id, custom_values, rank, created_at, updated_at, user_id) VALUES (62, 29, 3, '[]', 3, '2025-02-20 20:51:39.310035', '2025-02-20 20:54:02.293761', 1);
INSERT INTO public.item_ranks (id, item_id, tier_list_id, custom_values, rank, created_at, updated_at, user_id) VALUES (63, 30, 3, '[]', 4, '2025-02-20 20:51:39.314207', '2025-02-20 20:54:06.831191', 1);
INSERT INTO public.item_ranks (id, item_id, tier_list_id, custom_values, rank, created_at, updated_at, user_id) VALUES (64, 31, 3, '[]', 4, '2025-02-20 20:51:39.330332', '2025-02-20 20:54:10.851039', 1);
INSERT INTO public.item_ranks (id, item_id, tier_list_id, custom_values, rank, created_at, updated_at, user_id) VALUES (56, 32, 3, '[]', 5, '2025-02-20 20:51:39.264013', '2025-02-20 20:54:16.303581', 1);
INSERT INTO public.item_ranks (id, item_id, tier_list_id, custom_values, rank, created_at, updated_at, user_id) VALUES (57, 33, 3, '[]', 4, '2025-02-20 20:51:39.268642', '2025-02-20 20:54:21.189984', 1);
INSERT INTO public.item_ranks (id, item_id, tier_list_id, custom_values, rank, created_at, updated_at, user_id) VALUES (58, 34, 3, '[]', 6, '2025-02-20 20:51:39.272538', '2025-02-20 20:54:24.310213', 1);


--
-- Data for Name: mock_interview_profiles; Type: TABLE DATA; Schema: public; Owner: jacobspitzer
--



--
-- Data for Name: mock_interviews; Type: TABLE DATA; Schema: public; Owner: jacobspitzer
--



--
-- Data for Name: pages; Type: TABLE DATA; Schema: public; Owner: jacobspitzer
--

INSERT INTO public.pages (id, name, slug, parent_id, created_by, category, short_description, about, created_at, updated_at, cover_image, profile_image) VALUES (2, 'Evercore', 'evercore', 1, 1, 'Banking', 'Evercore is a leading global independent investment banking advisory firm, specializing in mergers and acquisitions (M&A), capital raising, restructuring, and strategic advisory. Founded in 1995, the firm has advised on over $4.7 trillion in transactions.
', 'Evercore has experienced tremendous growth, emerging as a top-tier M&A advisor and now competes neck and neck with Morgan Stanley for the #3 spot in overall M&A transaction size, behind only Goldman Sachs and JPMorgan. The firm is known for its high-profile deals, strong compensation, and elite exit opportunities, making it one of the most attractive destinations for ambitious finance professionals. However, Evercore is also recognized for its demanding culture and long hours—intense even by investment banking standards.', '2025-02-11 19:36:56.311645', '2025-02-12 03:18:32.120914', NULL, NULL);
INSERT INTO public.pages (id, name, slug, parent_id, created_by, category, short_description, about, created_at, updated_at, cover_image, profile_image) VALUES (1, 'Investment Banking', 'investment-banking', NULL, 1, 'Banking', 'Investment banking offers fast-paced, high-stakes work, helping companies raise capital, execute mergers and acquisitions, and navigate major financial transactions. While the job comes with long hours and intense pressure, it also provides high compensation, top-tier exit opportunities, and exposure to complex deals and executive decision-making. Many investment bankers leverage their experience to move into private equity, hedge funds, venture capital, or corporate leadership, making it a premier career path for ambitious finance professionals.', 'Investment banks act as financial advisors and intermediaries, helping companies raise capital through stock and bond offerings. They also guide businesses through mergers, acquisitions, and corporate restructuring to support growth and efficiency.

Investment banks are typically divided into product groups and industry groups:

- Product Groups specialize in a type of transaction, such as Mergers & Acquisitions (M&A), Equity Capital Markets (ECM), and Debt Capital Markets (DCM). These teams focus on structuring and executing deals, regardless of the industry.
- Industry Groups focus on specific sectors, such as Technology, Healthcare, Energy, and Consumer & Retail. They develop deep industry expertise and work alongside product teams to execute deals.

Most investment bankers work on the sell side, advising companies that are raising capital or selling themselves —especially helping businesses find buyers for a sale or strategic exit. The sell side is more common because companies selling themselves generate more certain fees compared to the buy side, where a company may or may not complete an acquisition.

The buy side is less common in investment banking but involves working with private equity firms, hedge funds, and asset managers to evaluate potential acquisitions or investments. Unlike the sell side, where fees are typically transaction-based, the buy side involves more selective deal-making, with firms conducting extensive due diligence before deciding to buy a company or asset.', '2025-02-11 19:30:59.078199', '2025-02-14 14:38:23.716861', 'NYC+background.png', NULL);


--
-- Data for Name: page_associations; Type: TABLE DATA; Schema: public; Owner: jacobspitzer
--



--
-- Data for Name: question_packets; Type: TABLE DATA; Schema: public; Owner: jacobspitzer
--



--
-- Data for Name: questions; Type: TABLE DATA; Schema: public; Owner: jacobspitzer
--

INSERT INTO public.questions (id, question_text, answer_choice_1, answer_choice_2, answer_choice_3, answer_choice_4, correct_answer, explanation_text, technical, behavior, category, position_type_id, difficulty_level, related_organization, question_link, question_link_order, created_at, updated_at, related_group) VALUES (1, 'What usually happens to company valuations when the federal reserve increases the fed funds rate? Valuations typically:', 'Increase, because higher rates signal a stronger economy and higher corporate earnings', 'Remain unchanged, since valuations are primarily driven by company fundamentals', 'Decrease, because higher discount rates reduce the present value of future cash flows', 'Fluctuate randomly, as interest rates have no predictable impact on valuations', 3, 'When interest rates rise, the Weighted Average Cost of Capital (WACC) increases due to:

Higher cost of debt – Borrowing becomes more expensive as interest rates go up, making it costlier for companies to finance operations with debt.

Higher cost of equity – According to the Capital Asset Pricing Model (CAPM), when risk-free rates (like Treasury yields) increase, investors demand higher returns on stocks, raising the cost of equity.

Since valuations depend on discounting future cash flows, a higher WACC means future earnings are discounted at a higher rate, lowering their present value. This impact is especially strong for growth stocks, which rely on long-term earnings projections.', true, false, 'Interest Rates', 1, 2, 'Barclays', '', NULL, '2025-02-08 16:25:58.072162', '2025-02-08 16:28:27.746206', 'Tech');


--
-- Data for Name: question_packet_memberships; Type: TABLE DATA; Schema: public; Owner: jacobspitzer
--



--
-- Data for Name: questions_users; Type: TABLE DATA; Schema: public; Owner: jacobspitzer
--



--
-- Data for Name: ratings; Type: TABLE DATA; Schema: public; Owner: jacobspitzer
--

INSERT INTO public.ratings (id, employee_id, user_id, form_context, responses, comment, created_at, updated_at) VALUES (1, 278, 1, 'interview', '{"7": "Casual and Friendly", "8": "no", "9": "no", "10": "No", "11": "Positive", "12": "Hard", "13": "no"}', 'I had spoken to James in a networking call and a Centerview dinner previously. The interview questions were hard but fair, and made me think outside of the box. For example, he asked about how I would improve the Enterprise Value for the University I go to, and ran through different scenarios of ''if this happened, how would this impact Enterprise Value''. I got flustered a bit and made some math mistakes (probably why I didn''t make it to the next round), but he did a good job guiding me to the correct answer when I got suck.', '2025-02-11 16:31:39.030673', '2025-02-11 16:31:39.030673');
INSERT INTO public.ratings (id, employee_id, user_id, form_context, responses, comment, created_at, updated_at) VALUES (2, 278, 1, 'networking', '{"1": "Casual and Friendly", "2": "Positive", "3": "no", "4": "no", "5": "no", "6": "yes"}', 'James was very engaged and friendly during my networking call. I mostly led the networking call and asked him basic questions about his work at Centerview, such as "How does Centerview compare to other banks" what was the "Most interesting deal you have been a part of?". One thing to note, I asked him about his previous background in music which he did not seem to like, so I would avoid that topic unless you actually know something about music.', '2025-02-11 16:41:46.603973', '2025-02-11 16:41:46.603973');
INSERT INTO public.ratings (id, employee_id, user_id, form_context, responses, comment, created_at, updated_at) VALUES (3, 284, 1, 'networking', '{"1": "Casual and Friendly", "2": "Positive", "3": "no", "4": "no", "5": "yes", "6": "yes"}', 'This was my first coffee chat during the recruiting cycle. I was a bit nervous but she was friendly and nice. It was a typical coffee chat where I asked most of the questions, asking about what she likes to do in NY, her job at GS, etc... I fumbled a lot when she asked about a market trend, as I was not fully prepared for that question, but she was nice and did not seem to care that much that I was not fully prepared for the question.', '2025-02-11 17:06:39.367469', '2025-02-11 17:06:39.367469');
INSERT INTO public.ratings (id, employee_id, user_id, form_context, responses, comment, created_at, updated_at) VALUES (4, 285, 1, 'networking', '{"1": "Casual and Friendly", "2": "Positive", "3": "no", "4": "no", "5": "yes", "6": "yes"}', 'We mainly spoke about his work in software and the different trends in the industry. He did most of the talking, and I just asked follow up questions to what he was talking about.', '2025-02-11 17:09:41.950518', '2025-02-11 17:09:41.950518');
INSERT INTO public.ratings (id, employee_id, user_id, form_context, responses, comment, created_at, updated_at) VALUES (5, 286, 1, 'networking', '{"1": "Casual and Friendly", "2": "Positive", "3": "no", "4": "no", "5": "no", "6": "yes"}', 'Finch was very nice and was easy to talk to. He asked a decent number of questions and seemed genuinely interested into what I had to say. The questions were mostly around why I wanted to do banking and why I was interested in Greenhill.', '2025-02-11 17:19:15.197416', '2025-02-11 17:19:15.197416');
INSERT INTO public.ratings (id, employee_id, user_id, form_context, responses, comment, created_at, updated_at) VALUES (6, 287, 1, 'networking', '{"1": "Tense or Confrontational", "2": "Negative", "3": "no", "4": "yes", "5": "yes", "6": "yes"}', 'My conversation with Giancarlo was intense. He asked tough questions asking me to describe a deal and a related market trend. There were multiple follow ups going deep into the financials and strategic rationale for the deal.', '2025-02-11 17:23:47.560184', '2025-02-11 17:23:47.560184');
INSERT INTO public.ratings (id, employee_id, user_id, form_context, responses, comment, created_at, updated_at) VALUES (7, 288, 1, 'networking', '{"1": "Unengaged", "2": "Neutral", "3": "no", "4": "no", "5": "no", "6": "yes"}', 'Overall, average conversation. The chat was over Zoom and he was working on other stuff the entire time.', '2025-02-11 17:29:04.354091', '2025-02-11 17:29:04.354091');
INSERT INTO public.ratings (id, employee_id, user_id, form_context, responses, comment, created_at, updated_at) VALUES (8, 289, 1, 'networking', '{"1": "Casual and Friendly", "2": "Very Positive", "3": "no", "4": "no", "5": "yes", "6": "no"}', 'Asked about his experience on the consumer team and what he enjoyed most about the team. He was very engaged and gave thoughtful answers to all my questions. I ended up using some of the details he gave me in my interview with PWP later, such as the group''s focus on working with client''s long term, almost serving as exclusive banking advisor to several large brands.', '2025-02-11 17:37:29.273574', '2025-02-11 17:37:29.273574');
INSERT INTO public.ratings (id, employee_id, user_id, form_context, responses, comment, created_at, updated_at) VALUES (9, 289, 1, 'interview', '{"7": "Professional", "8": "yes", "9": "yes", "10": "Yes", "11": "Positive", "12": "Medium", "13": "yes"}', 'I had several parts to the PWP final round interview, with each interviewer focused on different things. Daniel was focused on technical questions. The technical questions involved mostlty merger math questions which had multi parts. The questions were not hard but they were multipart with a lot of moving parts.', '2025-02-11 17:40:30.994197', '2025-02-11 17:40:30.994197');
INSERT INTO public.ratings (id, employee_id, user_id, form_context, responses, comment, created_at, updated_at) VALUES (10, 292, 1, 'networking', '{"1": "Casual and Friendly", "2": "Positive", "3": "no", "4": "no", "5": "no", "6": "yes"}', 'Jeff was very easy to talk to. He was slightly disengaged during our call but that was because he was on a tight deadline and had to work while chatting. I met him at a later networking event and he went out of his way to give me advice for the recruiting process.', '2025-02-16 23:40:36.352758', '2025-02-16 23:40:36.352758');
INSERT INTO public.ratings (id, employee_id, user_id, form_context, responses, comment, created_at, updated_at) VALUES (11, 293, 1, 'networking', '{"1": "Professional", "2": "Positive", "3": "no", "4": "no", "5": "no", "6": "no"}', '', '2025-02-16 23:50:53.735502', '2025-02-16 23:50:53.735502');


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: jacobspitzer
--

INSERT INTO public.schema_migrations (version) VALUES ('20241230120049');
INSERT INTO public.schema_migrations (version) VALUES ('20241230225132');
INSERT INTO public.schema_migrations (version) VALUES ('20241231000036');
INSERT INTO public.schema_migrations (version) VALUES ('20241231003132');
INSERT INTO public.schema_migrations (version) VALUES ('20241231122525');
INSERT INTO public.schema_migrations (version) VALUES ('20241231135017');
INSERT INTO public.schema_migrations (version) VALUES ('20250101200705');
INSERT INTO public.schema_migrations (version) VALUES ('20250101202902');
INSERT INTO public.schema_migrations (version) VALUES ('20250102153124');
INSERT INTO public.schema_migrations (version) VALUES ('20250103211721');
INSERT INTO public.schema_migrations (version) VALUES ('20250104040032');
INSERT INTO public.schema_migrations (version) VALUES ('20250104205326');
INSERT INTO public.schema_migrations (version) VALUES ('20250105005426');
INSERT INTO public.schema_migrations (version) VALUES ('20250105010347');
INSERT INTO public.schema_migrations (version) VALUES ('20250105010629');
INSERT INTO public.schema_migrations (version) VALUES ('20250105010839');
INSERT INTO public.schema_migrations (version) VALUES ('20250105011256');
INSERT INTO public.schema_migrations (version) VALUES ('20250105011404');
INSERT INTO public.schema_migrations (version) VALUES ('20250105011546');
INSERT INTO public.schema_migrations (version) VALUES ('20250105011759');
INSERT INTO public.schema_migrations (version) VALUES ('20250105012034');
INSERT INTO public.schema_migrations (version) VALUES ('20250107163648');
INSERT INTO public.schema_migrations (version) VALUES ('20250107164337');
INSERT INTO public.schema_migrations (version) VALUES ('20250107164417');
INSERT INTO public.schema_migrations (version) VALUES ('20250107173524');
INSERT INTO public.schema_migrations (version) VALUES ('20250107180315');
INSERT INTO public.schema_migrations (version) VALUES ('20250107180711');
INSERT INTO public.schema_migrations (version) VALUES ('20250107191111');
INSERT INTO public.schema_migrations (version) VALUES ('20250107192050');
INSERT INTO public.schema_migrations (version) VALUES ('20250107220510');
INSERT INTO public.schema_migrations (version) VALUES ('20250108191926');
INSERT INTO public.schema_migrations (version) VALUES ('20250108202714');
INSERT INTO public.schema_migrations (version) VALUES ('20250108203400');
INSERT INTO public.schema_migrations (version) VALUES ('20250108203532');
INSERT INTO public.schema_migrations (version) VALUES ('20250108210656');
INSERT INTO public.schema_migrations (version) VALUES ('20250108212119');
INSERT INTO public.schema_migrations (version) VALUES ('20250109153837');
INSERT INTO public.schema_migrations (version) VALUES ('20250109233552');
INSERT INTO public.schema_migrations (version) VALUES ('20250110005355');
INSERT INTO public.schema_migrations (version) VALUES ('20250111004413');
INSERT INTO public.schema_migrations (version) VALUES ('20250111004613');
INSERT INTO public.schema_migrations (version) VALUES ('20250111005345');
INSERT INTO public.schema_migrations (version) VALUES ('20250111040115');
INSERT INTO public.schema_migrations (version) VALUES ('20250112045321');
INSERT INTO public.schema_migrations (version) VALUES ('20250113185643');
INSERT INTO public.schema_migrations (version) VALUES ('20250113193056');
INSERT INTO public.schema_migrations (version) VALUES ('20250113193142');
INSERT INTO public.schema_migrations (version) VALUES ('20250113211357');
INSERT INTO public.schema_migrations (version) VALUES ('20250114054141');
INSERT INTO public.schema_migrations (version) VALUES ('20250114055825');
INSERT INTO public.schema_migrations (version) VALUES ('20250114224847');
INSERT INTO public.schema_migrations (version) VALUES ('20250114234015');
INSERT INTO public.schema_migrations (version) VALUES ('20250115000041');
INSERT INTO public.schema_migrations (version) VALUES ('20250117005209');
INSERT INTO public.schema_migrations (version) VALUES ('20250117043812');
INSERT INTO public.schema_migrations (version) VALUES ('20250117044945');
INSERT INTO public.schema_migrations (version) VALUES ('20250118014452');
INSERT INTO public.schema_migrations (version) VALUES ('20250118050019');
INSERT INTO public.schema_migrations (version) VALUES ('20250119230953');
INSERT INTO public.schema_migrations (version) VALUES ('20250119234747');
INSERT INTO public.schema_migrations (version) VALUES ('20250120014711');
INSERT INTO public.schema_migrations (version) VALUES ('20250120022409');
INSERT INTO public.schema_migrations (version) VALUES ('20250120022524');
INSERT INTO public.schema_migrations (version) VALUES ('20250120183055');
INSERT INTO public.schema_migrations (version) VALUES ('20250121011347');
INSERT INTO public.schema_migrations (version) VALUES ('20250121012347');
INSERT INTO public.schema_migrations (version) VALUES ('20250121024312');
INSERT INTO public.schema_migrations (version) VALUES ('20250122221427');
INSERT INTO public.schema_migrations (version) VALUES ('20250128022112');
INSERT INTO public.schema_migrations (version) VALUES ('20250128022203');
INSERT INTO public.schema_migrations (version) VALUES ('20250128023204');
INSERT INTO public.schema_migrations (version) VALUES ('20250128142810');
INSERT INTO public.schema_migrations (version) VALUES ('20250128142942');
INSERT INTO public.schema_migrations (version) VALUES ('20250128175352');
INSERT INTO public.schema_migrations (version) VALUES ('20250128183345');
INSERT INTO public.schema_migrations (version) VALUES ('20250128215016');
INSERT INTO public.schema_migrations (version) VALUES ('20250128215917');
INSERT INTO public.schema_migrations (version) VALUES ('20250128220650');
INSERT INTO public.schema_migrations (version) VALUES ('20250128221219');
INSERT INTO public.schema_migrations (version) VALUES ('20250131164634');
INSERT INTO public.schema_migrations (version) VALUES ('20250202230142');
INSERT INTO public.schema_migrations (version) VALUES ('20250202230831');
INSERT INTO public.schema_migrations (version) VALUES ('20250203172009');
INSERT INTO public.schema_migrations (version) VALUES ('20250203173218');
INSERT INTO public.schema_migrations (version) VALUES ('20250203174147');
INSERT INTO public.schema_migrations (version) VALUES ('20250203174455');
INSERT INTO public.schema_migrations (version) VALUES ('20250203183853');
INSERT INTO public.schema_migrations (version) VALUES ('20250208160945');
INSERT INTO public.schema_migrations (version) VALUES ('20250214000042');
INSERT INTO public.schema_migrations (version) VALUES ('20250214132031');
INSERT INTO public.schema_migrations (version) VALUES ('20250214132544');
INSERT INTO public.schema_migrations (version) VALUES ('20250214132545');
INSERT INTO public.schema_migrations (version) VALUES ('20250214133054');
INSERT INTO public.schema_migrations (version) VALUES ('20250214183703');
INSERT INTO public.schema_migrations (version) VALUES ('20250215154511');
INSERT INTO public.schema_migrations (version) VALUES ('20250215155910');
INSERT INTO public.schema_migrations (version) VALUES ('20250216004704');
INSERT INTO public.schema_migrations (version) VALUES ('20250216004705');
INSERT INTO public.schema_migrations (version) VALUES ('20250216021957');
INSERT INTO public.schema_migrations (version) VALUES ('20250216022347');
INSERT INTO public.schema_migrations (version) VALUES ('20250216022724');
INSERT INTO public.schema_migrations (version) VALUES ('20250216022848');
INSERT INTO public.schema_migrations (version) VALUES ('20250216023006');
INSERT INTO public.schema_migrations (version) VALUES ('20250216023101');
INSERT INTO public.schema_migrations (version) VALUES ('20250216023643');
INSERT INTO public.schema_migrations (version) VALUES ('20250216004706');
INSERT INTO public.schema_migrations (version) VALUES ('20250216193411');
INSERT INTO public.schema_migrations (version) VALUES ('20250216193541');
INSERT INTO public.schema_migrations (version) VALUES ('20250217015811');
INSERT INTO public.schema_migrations (version) VALUES ('20250217144243');
INSERT INTO public.schema_migrations (version) VALUES ('20250218193103');
INSERT INTO public.schema_migrations (version) VALUES ('20250220191034');


--
-- Name: career_aggregate_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jacobspitzer
--

SELECT pg_catalog.setval('public.career_aggregate_jobs_id_seq', 1, false);


--
-- Name: career_compensations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jacobspitzer
--

SELECT pg_catalog.setval('public.career_compensations_id_seq', 1, true);


--
-- Name: career_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jacobspitzer
--

SELECT pg_catalog.setval('public.career_jobs_id_seq', 1, true);


--
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jacobspitzer
--

SELECT pg_catalog.setval('public.comments_id_seq', 1, false);


--
-- Name: companies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jacobspitzer
--

SELECT pg_catalog.setval('public.companies_id_seq', 332, true);


--
-- Name: employee_views_employees_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jacobspitzer
--

SELECT pg_catalog.setval('public.employee_views_employees_id_seq', 572, true);


--
-- Name: employee_views_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jacobspitzer
--

SELECT pg_catalog.setval('public.employee_views_id_seq', 2, true);


--
-- Name: employees_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jacobspitzer
--

SELECT pg_catalog.setval('public.employees_id_seq', 300, true);


--
-- Name: employment_report_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jacobspitzer
--

SELECT pg_catalog.setval('public.employment_report_details_id_seq', 1, false);


--
-- Name: employment_report_employers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jacobspitzer
--

SELECT pg_catalog.setval('public.employment_report_employers_id_seq', 3, true);


--
-- Name: employment_report_functions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jacobspitzer
--

SELECT pg_catalog.setval('public.employment_report_functions_id_seq', 3, true);


--
-- Name: employment_report_locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jacobspitzer
--

SELECT pg_catalog.setval('public.employment_report_locations_id_seq', 2, true);


--
-- Name: employment_report_overviews_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jacobspitzer
--

SELECT pg_catalog.setval('public.employment_report_overviews_id_seq', 2, true);


--
-- Name: employment_report_programs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jacobspitzer
--

SELECT pg_catalog.setval('public.employment_report_programs_id_seq', 2, true);


--
-- Name: employment_reports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jacobspitzer
--

SELECT pg_catalog.setval('public.employment_reports_id_seq', 2, true);


--
-- Name: exit_opportunities_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jacobspitzer
--

SELECT pg_catalog.setval('public.exit_opportunities_details_id_seq', 4, true);


--
-- Name: exit_opportunity_mappings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jacobspitzer
--

SELECT pg_catalog.setval('public.exit_opportunity_mappings_id_seq', 2, true);


--
-- Name: flags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jacobspitzer
--

SELECT pg_catalog.setval('public.flags_id_seq', 7, true);


--
-- Name: form_templates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jacobspitzer
--

SELECT pg_catalog.setval('public.form_templates_id_seq', 13, true);


--
-- Name: forum_comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jacobspitzer
--

SELECT pg_catalog.setval('public.forum_comments_id_seq', 1, false);


--
-- Name: forum_rooms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jacobspitzer
--

SELECT pg_catalog.setval('public.forum_rooms_id_seq', 3, true);


--
-- Name: groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jacobspitzer
--

SELECT pg_catalog.setval('public.groups_id_seq', 315, true);


--
-- Name: interview_coaches_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jacobspitzer
--

SELECT pg_catalog.setval('public.interview_coaches_id_seq', 1, false);


--
-- Name: item_ranks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jacobspitzer
--

SELECT pg_catalog.setval('public.item_ranks_id_seq', 64, true);


--
-- Name: items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jacobspitzer
--

SELECT pg_catalog.setval('public.items_id_seq', 34, true);


--
-- Name: job_levels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jacobspitzer
--

SELECT pg_catalog.setval('public.job_levels_id_seq', 54, true);


--
-- Name: locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jacobspitzer
--

SELECT pg_catalog.setval('public.locations_id_seq', 53, true);


--
-- Name: mock_interview_profiles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jacobspitzer
--

SELECT pg_catalog.setval('public.mock_interview_profiles_id_seq', 1, false);


--
-- Name: mock_interviews_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jacobspitzer
--

SELECT pg_catalog.setval('public.mock_interviews_id_seq', 1, false);


--
-- Name: page_associations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jacobspitzer
--

SELECT pg_catalog.setval('public.page_associations_id_seq', 1, false);


--
-- Name: pages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jacobspitzer
--

SELECT pg_catalog.setval('public.pages_id_seq', 2, true);


--
-- Name: position_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jacobspitzer
--

SELECT pg_catalog.setval('public.position_types_id_seq', 9, true);


--
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jacobspitzer
--

SELECT pg_catalog.setval('public.posts_id_seq', 1, false);


--
-- Name: question_packet_memberships_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jacobspitzer
--

SELECT pg_catalog.setval('public.question_packet_memberships_id_seq', 1, false);


--
-- Name: question_packets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jacobspitzer
--

SELECT pg_catalog.setval('public.question_packets_id_seq', 1, false);


--
-- Name: questions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jacobspitzer
--

SELECT pg_catalog.setval('public.questions_id_seq', 1, true);


--
-- Name: questions_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jacobspitzer
--

SELECT pg_catalog.setval('public.questions_users_id_seq', 1, false);


--
-- Name: ratings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jacobspitzer
--

SELECT pg_catalog.setval('public.ratings_id_seq', 11, true);


--
-- Name: schools_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jacobspitzer
--

SELECT pg_catalog.setval('public.schools_id_seq', 214, true);


--
-- Name: tier_list_templates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jacobspitzer
--

SELECT pg_catalog.setval('public.tier_list_templates_id_seq', 1, false);


--
-- Name: tier_lists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jacobspitzer
--

SELECT pg_catalog.setval('public.tier_lists_id_seq', 3, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jacobspitzer
--

SELECT pg_catalog.setval('public.users_id_seq', 1, true);


--
-- PostgreSQL database dump complete
--

