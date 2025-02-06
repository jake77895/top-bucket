--
-- PostgreSQL database dump
--

-- Dumped from database version 16.6 (Ubuntu 16.6-1.pgdg20.04+1)
-- Dumped by pg_dump version 16.6 (Ubuntu 16.6-1.pgdg20.04+1)

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
-- Name: active_storage_attachments; Type: TABLE; Schema: public; Owner: student
--

CREATE TABLE public.active_storage_attachments (
    id bigint NOT NULL,
    name character varying NOT NULL,
    record_type character varying NOT NULL,
    record_id bigint NOT NULL,
    blob_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.active_storage_attachments OWNER TO student;

--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: student
--

CREATE SEQUENCE public.active_storage_attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.active_storage_attachments_id_seq OWNER TO student;

--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: student
--

ALTER SEQUENCE public.active_storage_attachments_id_seq OWNED BY public.active_storage_attachments.id;


--
-- Name: active_storage_blobs; Type: TABLE; Schema: public; Owner: student
--

CREATE TABLE public.active_storage_blobs (
    id bigint NOT NULL,
    key character varying NOT NULL,
    filename character varying NOT NULL,
    content_type character varying,
    metadata text,
    service_name character varying NOT NULL,
    byte_size bigint NOT NULL,
    checksum character varying,
    created_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.active_storage_blobs OWNER TO student;

--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE; Schema: public; Owner: student
--

CREATE SEQUENCE public.active_storage_blobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.active_storage_blobs_id_seq OWNER TO student;

--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: student
--

ALTER SEQUENCE public.active_storage_blobs_id_seq OWNED BY public.active_storage_blobs.id;


--
-- Name: active_storage_variant_records; Type: TABLE; Schema: public; Owner: student
--

CREATE TABLE public.active_storage_variant_records (
    id bigint NOT NULL,
    blob_id bigint NOT NULL,
    variation_digest character varying NOT NULL
);


ALTER TABLE public.active_storage_variant_records OWNER TO student;

--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE; Schema: public; Owner: student
--

CREATE SEQUENCE public.active_storage_variant_records_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.active_storage_variant_records_id_seq OWNER TO student;

--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: student
--

ALTER SEQUENCE public.active_storage_variant_records_id_seq OWNED BY public.active_storage_variant_records.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: student
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO student;

--
-- Name: career_aggregate_jobs; Type: TABLE; Schema: public; Owner: student
--

CREATE TABLE public.career_aggregate_jobs (
    id bigint NOT NULL,
    job_title character varying,
    company character varying,
    industry character varying,
    "group" character varying,
    average_salary numeric(10,2),
    average_bonus numeric(10,2),
    average_hours_worked_per_week integer,
    sample_size integer,
    year integer,
    level character varying,
    sub_level character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    location character varying,
    previous_undergrad character varying,
    previous_grad character varying,
    previous_mba character varying
);


ALTER TABLE public.career_aggregate_jobs OWNER TO student;

--
-- Name: career_aggregate_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: student
--

CREATE SEQUENCE public.career_aggregate_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.career_aggregate_jobs_id_seq OWNER TO student;

--
-- Name: career_aggregate_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: student
--

ALTER SEQUENCE public.career_aggregate_jobs_id_seq OWNED BY public.career_aggregate_jobs.id;


--
-- Name: career_compensations; Type: TABLE; Schema: public; Owner: student
--

CREATE TABLE public.career_compensations (
    id bigint NOT NULL,
    career_job_id bigint NOT NULL,
    year integer,
    level character varying,
    sub_level character varying,
    salary numeric(10,2),
    bonus numeric(10,2),
    hours_worked_per_week integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    "group" character varying
);


ALTER TABLE public.career_compensations OWNER TO student;

--
-- Name: career_compensations_id_seq; Type: SEQUENCE; Schema: public; Owner: student
--

CREATE SEQUENCE public.career_compensations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.career_compensations_id_seq OWNER TO student;

--
-- Name: career_compensations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: student
--

ALTER SEQUENCE public.career_compensations_id_seq OWNED BY public.career_compensations.id;


--
-- Name: career_jobs; Type: TABLE; Schema: public; Owner: student
--

CREATE TABLE public.career_jobs (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    company character varying,
    industry character varying,
    start_year integer,
    years_at_job integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    location character varying,
    job_grouping integer,
    job_order integer,
    previous_undergrad character varying,
    previous_grad character varying,
    previous_mba character varying
);


ALTER TABLE public.career_jobs OWNER TO student;

--
-- Name: career_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: student
--

CREATE SEQUENCE public.career_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.career_jobs_id_seq OWNER TO student;

--
-- Name: career_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: student
--

ALTER SEQUENCE public.career_jobs_id_seq OWNED BY public.career_jobs.id;


--
-- Name: combined_jobs; Type: VIEW; Schema: public; Owner: student
--

CREATE VIEW public.combined_jobs AS
 SELECT cj.id AS job_id,
    cj.industry,
    cj.company,
    cj.location,
    NULL::character varying AS job_title,
    NULL::character varying AS "group",
    cc.level,
    cc.sub_level,
    cc.salary AS average_salary,
    cc.bonus AS average_bonus,
    cc.hours_worked_per_week AS average_hours_worked_per_week,
    1 AS sample_size,
    cj.years_at_job AS year,
    cj.previous_undergrad,
    cj.previous_grad,
    cj.previous_mba,
    'regular'::text AS source_type
   FROM (public.career_jobs cj
     LEFT JOIN public.career_compensations cc ON ((cj.id = cc.career_job_id)))
UNION ALL
 SELECT caj.id AS job_id,
    caj.industry,
    caj.company,
    caj.location,
    caj.job_title,
    caj."group",
    caj.level,
    caj.sub_level,
    caj.average_salary,
    caj.average_bonus,
    caj.average_hours_worked_per_week,
    caj.sample_size,
    caj.year,
    caj.previous_undergrad,
    caj.previous_grad,
    caj.previous_mba,
    'aggregate'::text AS source_type
   FROM public.career_aggregate_jobs caj;


ALTER VIEW public.combined_jobs OWNER TO student;

--
-- Name: comments; Type: TABLE; Schema: public; Owner: student
--

CREATE TABLE public.comments (
    id bigint NOT NULL,
    tier_list_id bigint NOT NULL,
    commentable_type character varying,
    commentable_id bigint,
    user_id bigint,
    content text NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.comments OWNER TO student;

--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: student
--

CREATE SEQUENCE public.comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.comments_id_seq OWNER TO student;

--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: student
--

ALTER SEQUENCE public.comments_id_seq OWNED BY public.comments.id;


--
-- Name: companies; Type: TABLE; Schema: public; Owner: student
--

CREATE TABLE public.companies (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    position_type_id bigint NOT NULL
);


ALTER TABLE public.companies OWNER TO student;

--
-- Name: companies_id_seq; Type: SEQUENCE; Schema: public; Owner: student
--

CREATE SEQUENCE public.companies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.companies_id_seq OWNER TO student;

--
-- Name: companies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: student
--

ALTER SEQUENCE public.companies_id_seq OWNED BY public.companies.id;


--
-- Name: employee_views; Type: TABLE; Schema: public; Owner: student
--

CREATE TABLE public.employee_views (
    id bigint NOT NULL,
    name character varying,
    description text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.employee_views OWNER TO student;

--
-- Name: employee_views_employees; Type: TABLE; Schema: public; Owner: student
--

CREATE TABLE public.employee_views_employees (
    id bigint NOT NULL,
    employee_id bigint NOT NULL,
    employee_view_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.employee_views_employees OWNER TO student;

--
-- Name: employee_views_employees_id_seq; Type: SEQUENCE; Schema: public; Owner: student
--

CREATE SEQUENCE public.employee_views_employees_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.employee_views_employees_id_seq OWNER TO student;

--
-- Name: employee_views_employees_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: student
--

ALTER SEQUENCE public.employee_views_employees_id_seq OWNED BY public.employee_views_employees.id;


--
-- Name: employee_views_id_seq; Type: SEQUENCE; Schema: public; Owner: student
--

CREATE SEQUENCE public.employee_views_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.employee_views_id_seq OWNER TO student;

--
-- Name: employee_views_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: student
--

ALTER SEQUENCE public.employee_views_id_seq OWNED BY public.employee_views.id;


--
-- Name: employees; Type: TABLE; Schema: public; Owner: student
--

CREATE TABLE public.employees (
    id bigint NOT NULL,
    name character varying NOT NULL,
    job_level_id bigint,
    company_id bigint,
    previous_company_id bigint,
    linkedin_url character varying,
    flagged integer DEFAULT 0 NOT NULL,
    flag_comment text,
    group_id bigint,
    location_id bigint,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    position_type_id bigint,
    undergraduate_school_id bigint,
    graduate_school_id bigint
);


ALTER TABLE public.employees OWNER TO student;

--
-- Name: employees_id_seq; Type: SEQUENCE; Schema: public; Owner: student
--

CREATE SEQUENCE public.employees_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.employees_id_seq OWNER TO student;

--
-- Name: employees_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: student
--

ALTER SEQUENCE public.employees_id_seq OWNED BY public.employees.id;


--
-- Name: flags; Type: TABLE; Schema: public; Owner: student
--

CREATE TABLE public.flags (
    id bigint NOT NULL,
    flaggable_type character varying NOT NULL,
    flaggable_id bigint NOT NULL,
    user_id bigint NOT NULL,
    reason character varying,
    status character varying DEFAULT 'pending'::character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    text character varying
);


ALTER TABLE public.flags OWNER TO student;

--
-- Name: flags_id_seq; Type: SEQUENCE; Schema: public; Owner: student
--

CREATE SEQUENCE public.flags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.flags_id_seq OWNER TO student;

--
-- Name: flags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: student
--

ALTER SEQUENCE public.flags_id_seq OWNED BY public.flags.id;


--
-- Name: form_templates; Type: TABLE; Schema: public; Owner: student
--

CREATE TABLE public.form_templates (
    id bigint NOT NULL,
    form_context character varying NOT NULL,
    question_text character varying NOT NULL,
    response_type character varying NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    position_type_id bigint NOT NULL,
    "position" integer
);


ALTER TABLE public.form_templates OWNER TO student;

--
-- Name: form_templates_id_seq; Type: SEQUENCE; Schema: public; Owner: student
--

CREATE SEQUENCE public.form_templates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.form_templates_id_seq OWNER TO student;

--
-- Name: form_templates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: student
--

ALTER SEQUENCE public.form_templates_id_seq OWNED BY public.form_templates.id;


--
-- Name: forum_comments; Type: TABLE; Schema: public; Owner: student
--

CREATE TABLE public.forum_comments (
    id bigint NOT NULL,
    body text,
    post_id bigint NOT NULL,
    user_id bigint NOT NULL,
    parent_id integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.forum_comments OWNER TO student;

--
-- Name: forum_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: student
--

CREATE SEQUENCE public.forum_comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.forum_comments_id_seq OWNER TO student;

--
-- Name: forum_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: student
--

ALTER SEQUENCE public.forum_comments_id_seq OWNED BY public.forum_comments.id;


--
-- Name: forum_rooms; Type: TABLE; Schema: public; Owner: student
--

CREATE TABLE public.forum_rooms (
    id bigint NOT NULL,
    name character varying,
    description text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.forum_rooms OWNER TO student;

--
-- Name: forum_rooms_id_seq; Type: SEQUENCE; Schema: public; Owner: student
--

CREATE SEQUENCE public.forum_rooms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.forum_rooms_id_seq OWNER TO student;

--
-- Name: forum_rooms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: student
--

ALTER SEQUENCE public.forum_rooms_id_seq OWNED BY public.forum_rooms.id;


--
-- Name: groups; Type: TABLE; Schema: public; Owner: student
--

CREATE TABLE public.groups (
    id bigint NOT NULL,
    name character varying NOT NULL,
    company_id bigint,
    location_id bigint,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    position_type_id bigint,
    position_type_default boolean DEFAULT false
);


ALTER TABLE public.groups OWNER TO student;

--
-- Name: groups_id_seq; Type: SEQUENCE; Schema: public; Owner: student
--

CREATE SEQUENCE public.groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.groups_id_seq OWNER TO student;

--
-- Name: groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: student
--

ALTER SEQUENCE public.groups_id_seq OWNED BY public.groups.id;


--
-- Name: interview_coaches; Type: TABLE; Schema: public; Owner: student
--

CREATE TABLE public.interview_coaches (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    name character varying NOT NULL,
    linkedin_url character varying,
    industry character varying NOT NULL,
    description text,
    languages character varying,
    other_industries character varying,
    highlighted_job character varying NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.interview_coaches OWNER TO student;

--
-- Name: interview_coaches_id_seq; Type: SEQUENCE; Schema: public; Owner: student
--

CREATE SEQUENCE public.interview_coaches_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.interview_coaches_id_seq OWNER TO student;

--
-- Name: interview_coaches_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: student
--

ALTER SEQUENCE public.interview_coaches_id_seq OWNED BY public.interview_coaches.id;


--
-- Name: item_ranks; Type: TABLE; Schema: public; Owner: student
--

CREATE TABLE public.item_ranks (
    id bigint NOT NULL,
    item_id bigint NOT NULL,
    tier_list_id bigint NOT NULL,
    custom_values json,
    rank integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    user_id bigint
);


ALTER TABLE public.item_ranks OWNER TO student;

--
-- Name: item_ranks_id_seq; Type: SEQUENCE; Schema: public; Owner: student
--

CREATE SEQUENCE public.item_ranks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.item_ranks_id_seq OWNER TO student;

--
-- Name: item_ranks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: student
--

ALTER SEQUENCE public.item_ranks_id_seq OWNED BY public.item_ranks.id;


--
-- Name: items; Type: TABLE; Schema: public; Owner: student
--

CREATE TABLE public.items (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.items OWNER TO student;

--
-- Name: items_id_seq; Type: SEQUENCE; Schema: public; Owner: student
--

CREATE SEQUENCE public.items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.items_id_seq OWNER TO student;

--
-- Name: items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: student
--

ALTER SEQUENCE public.items_id_seq OWNED BY public.items.id;


--
-- Name: job_levels; Type: TABLE; Schema: public; Owner: student
--

CREATE TABLE public.job_levels (
    id bigint NOT NULL,
    name character varying,
    company_id bigint,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    level_rank integer,
    is_global_default boolean DEFAULT false NOT NULL,
    is_position_type_default boolean DEFAULT false NOT NULL,
    position_type_id bigint
);


ALTER TABLE public.job_levels OWNER TO student;

--
-- Name: job_levels_id_seq; Type: SEQUENCE; Schema: public; Owner: student
--

CREATE SEQUENCE public.job_levels_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.job_levels_id_seq OWNER TO student;

--
-- Name: job_levels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: student
--

ALTER SEQUENCE public.job_levels_id_seq OWNED BY public.job_levels.id;


--
-- Name: locations; Type: TABLE; Schema: public; Owner: student
--

CREATE TABLE public.locations (
    id bigint NOT NULL,
    name character varying NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.locations OWNER TO student;

--
-- Name: locations_id_seq; Type: SEQUENCE; Schema: public; Owner: student
--

CREATE SEQUENCE public.locations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.locations_id_seq OWNER TO student;

--
-- Name: locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: student
--

ALTER SEQUENCE public.locations_id_seq OWNED BY public.locations.id;


--
-- Name: mock_interview_profiles; Type: TABLE; Schema: public; Owner: student
--

CREATE TABLE public.mock_interview_profiles (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    first_name character varying,
    recruiting_for character varying,
    technical_prep_level character varying,
    organization character varying,
    linkedin_url character varying,
    preferred_language character varying,
    english_proficiency integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    reliability_metric integer DEFAULT 50 NOT NULL,
    time_zone character varying DEFAULT 'Eastern Time (US & Canada)'::character varying,
    no_show_count integer DEFAULT 0 NOT NULL,
    late_count integer DEFAULT 0 NOT NULL,
    total_completes integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.mock_interview_profiles OWNER TO student;

--
-- Name: mock_interview_profiles_id_seq; Type: SEQUENCE; Schema: public; Owner: student
--

CREATE SEQUENCE public.mock_interview_profiles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.mock_interview_profiles_id_seq OWNER TO student;

--
-- Name: mock_interview_profiles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: student
--

ALTER SEQUENCE public.mock_interview_profiles_id_seq OWNED BY public.mock_interview_profiles.id;


--
-- Name: mock_interviews; Type: TABLE; Schema: public; Owner: student
--

CREATE TABLE public.mock_interviews (
    id bigint NOT NULL,
    start_date date NOT NULL,
    start_time time without time zone NOT NULL,
    status character varying DEFAULT 'pending'::character varying NOT NULL,
    created_by_id bigint NOT NULL,
    accepted_by_id bigint,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    time_zone character varying,
    check_date_time timestamp(6) without time zone,
    creator_reliability_flag character varying,
    acceptor_reliability_flag character varying
);


ALTER TABLE public.mock_interviews OWNER TO student;

--
-- Name: mock_interviews_id_seq; Type: SEQUENCE; Schema: public; Owner: student
--

CREATE SEQUENCE public.mock_interviews_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.mock_interviews_id_seq OWNER TO student;

--
-- Name: mock_interviews_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: student
--

ALTER SEQUENCE public.mock_interviews_id_seq OWNED BY public.mock_interviews.id;


--
-- Name: page_associations; Type: TABLE; Schema: public; Owner: student
--

CREATE TABLE public.page_associations (
    id bigint NOT NULL,
    page_id bigint NOT NULL,
    tier_list_id bigint,
    association_type character varying,
    metadata jsonb DEFAULT '{}'::jsonb,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    employee_view_id bigint
);


ALTER TABLE public.page_associations OWNER TO student;

--
-- Name: page_associations_id_seq; Type: SEQUENCE; Schema: public; Owner: student
--

CREATE SEQUENCE public.page_associations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.page_associations_id_seq OWNER TO student;

--
-- Name: page_associations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: student
--

ALTER SEQUENCE public.page_associations_id_seq OWNED BY public.page_associations.id;


--
-- Name: pages; Type: TABLE; Schema: public; Owner: student
--

CREATE TABLE public.pages (
    id bigint NOT NULL,
    name character varying NOT NULL,
    slug character varying NOT NULL,
    parent_id integer,
    created_by integer,
    category character varying DEFAULT 'general'::character varying NOT NULL,
    short_description text,
    about text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.pages OWNER TO student;

--
-- Name: pages_id_seq; Type: SEQUENCE; Schema: public; Owner: student
--

CREATE SEQUENCE public.pages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pages_id_seq OWNER TO student;

--
-- Name: pages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: student
--

ALTER SEQUENCE public.pages_id_seq OWNED BY public.pages.id;


--
-- Name: position_types; Type: TABLE; Schema: public; Owner: student
--

CREATE TABLE public.position_types (
    id bigint NOT NULL,
    name character varying NOT NULL,
    description text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.position_types OWNER TO student;

--
-- Name: position_types_id_seq; Type: SEQUENCE; Schema: public; Owner: student
--

CREATE SEQUENCE public.position_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.position_types_id_seq OWNER TO student;

--
-- Name: position_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: student
--

ALTER SEQUENCE public.position_types_id_seq OWNED BY public.position_types.id;


--
-- Name: posts; Type: TABLE; Schema: public; Owner: student
--

CREATE TABLE public.posts (
    id bigint NOT NULL,
    title character varying,
    body text,
    forum_room_id bigint NOT NULL,
    user_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.posts OWNER TO student;

--
-- Name: posts_id_seq; Type: SEQUENCE; Schema: public; Owner: student
--

CREATE SEQUENCE public.posts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.posts_id_seq OWNER TO student;

--
-- Name: posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: student
--

ALTER SEQUENCE public.posts_id_seq OWNED BY public.posts.id;


--
-- Name: question_packet_memberships; Type: TABLE; Schema: public; Owner: student
--

CREATE TABLE public.question_packet_memberships (
    id bigint NOT NULL,
    question_id bigint NOT NULL,
    question_packet_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.question_packet_memberships OWNER TO student;

--
-- Name: question_packet_memberships_id_seq; Type: SEQUENCE; Schema: public; Owner: student
--

CREATE SEQUENCE public.question_packet_memberships_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.question_packet_memberships_id_seq OWNER TO student;

--
-- Name: question_packet_memberships_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: student
--

ALTER SEQUENCE public.question_packet_memberships_id_seq OWNED BY public.question_packet_memberships.id;


--
-- Name: question_packets; Type: TABLE; Schema: public; Owner: student
--

CREATE TABLE public.question_packets (
    id bigint NOT NULL,
    name character varying NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.question_packets OWNER TO student;

--
-- Name: question_packets_id_seq; Type: SEQUENCE; Schema: public; Owner: student
--

CREATE SEQUENCE public.question_packets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.question_packets_id_seq OWNER TO student;

--
-- Name: question_packets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: student
--

ALTER SEQUENCE public.question_packets_id_seq OWNED BY public.question_packets.id;


--
-- Name: questions; Type: TABLE; Schema: public; Owner: student
--

CREATE TABLE public.questions (
    id bigint NOT NULL,
    question_text character varying NOT NULL,
    answer_choice_1 character varying NOT NULL,
    answer_choice_2 character varying NOT NULL,
    answer_choice_3 character varying NOT NULL,
    answer_choice_4 character varying NOT NULL,
    correct_answer integer NOT NULL,
    explanation_text text NOT NULL,
    technical boolean DEFAULT false NOT NULL,
    behavior boolean DEFAULT false NOT NULL,
    category character varying NOT NULL,
    position_type_id bigint NOT NULL,
    difficulty_level integer,
    related_organization character varying,
    question_link character varying,
    question_link_order integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.questions OWNER TO student;

--
-- Name: questions_id_seq; Type: SEQUENCE; Schema: public; Owner: student
--

CREATE SEQUENCE public.questions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.questions_id_seq OWNER TO student;

--
-- Name: questions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: student
--

ALTER SEQUENCE public.questions_id_seq OWNED BY public.questions.id;


--
-- Name: questions_users; Type: TABLE; Schema: public; Owner: student
--

CREATE TABLE public.questions_users (
    id bigint NOT NULL,
    question_id bigint NOT NULL,
    user_id bigint NOT NULL,
    starred boolean DEFAULT true,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.questions_users OWNER TO student;

--
-- Name: questions_users_id_seq; Type: SEQUENCE; Schema: public; Owner: student
--

CREATE SEQUENCE public.questions_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.questions_users_id_seq OWNER TO student;

--
-- Name: questions_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: student
--

ALTER SEQUENCE public.questions_users_id_seq OWNED BY public.questions_users.id;


--
-- Name: ratings; Type: TABLE; Schema: public; Owner: student
--

CREATE TABLE public.ratings (
    id bigint NOT NULL,
    employee_id bigint NOT NULL,
    user_id bigint NOT NULL,
    form_context character varying NOT NULL,
    responses jsonb DEFAULT '{}'::jsonb,
    comment text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.ratings OWNER TO student;

--
-- Name: ratings_id_seq; Type: SEQUENCE; Schema: public; Owner: student
--

CREATE SEQUENCE public.ratings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ratings_id_seq OWNER TO student;

--
-- Name: ratings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: student
--

ALTER SEQUENCE public.ratings_id_seq OWNED BY public.ratings.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: student
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO student;

--
-- Name: schools; Type: TABLE; Schema: public; Owner: student
--

CREATE TABLE public.schools (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    undergraduate boolean DEFAULT false NOT NULL,
    mba boolean DEFAULT false NOT NULL,
    other_graduate boolean DEFAULT false NOT NULL,
    other boolean DEFAULT false NOT NULL
);


ALTER TABLE public.schools OWNER TO student;

--
-- Name: schools_id_seq; Type: SEQUENCE; Schema: public; Owner: student
--

CREATE SEQUENCE public.schools_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.schools_id_seq OWNER TO student;

--
-- Name: schools_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: student
--

ALTER SEQUENCE public.schools_id_seq OWNED BY public.schools.id;


--
-- Name: tier_list_templates; Type: TABLE; Schema: public; Owner: student
--

CREATE TABLE public.tier_list_templates (
    id bigint NOT NULL,
    name character varying NOT NULL,
    short_description text,
    custom_fields json DEFAULT '[]'::json,
    created_by_id integer NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    tag character varying
);


ALTER TABLE public.tier_list_templates OWNER TO student;

--
-- Name: tier_list_templates_id_seq; Type: SEQUENCE; Schema: public; Owner: student
--

CREATE SEQUENCE public.tier_list_templates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tier_list_templates_id_seq OWNER TO student;

--
-- Name: tier_list_templates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: student
--

ALTER SEQUENCE public.tier_list_templates_id_seq OWNED BY public.tier_list_templates.id;


--
-- Name: tier_lists; Type: TABLE; Schema: public; Owner: student
--

CREATE TABLE public.tier_lists (
    id bigint NOT NULL,
    name character varying NOT NULL,
    description text,
    published boolean,
    custom_fields json,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    tier_list_template_id bigint,
    category character varying
);


ALTER TABLE public.tier_lists OWNER TO student;

--
-- Name: tier_lists_id_seq; Type: SEQUENCE; Schema: public; Owner: student
--

CREATE SEQUENCE public.tier_lists_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tier_lists_id_seq OWNER TO student;

--
-- Name: tier_lists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: student
--

ALTER SEQUENCE public.tier_lists_id_seq OWNED BY public.tier_lists.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: student
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    user_name character varying DEFAULT ''::character varying NOT NULL,
    admin boolean DEFAULT false,
    email character varying DEFAULT ''::character varying,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp(6) without time zone,
    remember_created_at timestamp(6) without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    is_interview_coach boolean DEFAULT false NOT NULL
);


ALTER TABLE public.users OWNER TO student;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: student
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO student;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: student
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: active_storage_attachments id; Type: DEFAULT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.active_storage_attachments ALTER COLUMN id SET DEFAULT nextval('public.active_storage_attachments_id_seq'::regclass);


--
-- Name: active_storage_blobs id; Type: DEFAULT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.active_storage_blobs ALTER COLUMN id SET DEFAULT nextval('public.active_storage_blobs_id_seq'::regclass);


--
-- Name: active_storage_variant_records id; Type: DEFAULT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.active_storage_variant_records ALTER COLUMN id SET DEFAULT nextval('public.active_storage_variant_records_id_seq'::regclass);


--
-- Name: career_aggregate_jobs id; Type: DEFAULT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.career_aggregate_jobs ALTER COLUMN id SET DEFAULT nextval('public.career_aggregate_jobs_id_seq'::regclass);


--
-- Name: career_compensations id; Type: DEFAULT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.career_compensations ALTER COLUMN id SET DEFAULT nextval('public.career_compensations_id_seq'::regclass);


--
-- Name: career_jobs id; Type: DEFAULT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.career_jobs ALTER COLUMN id SET DEFAULT nextval('public.career_jobs_id_seq'::regclass);


--
-- Name: comments id; Type: DEFAULT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.comments ALTER COLUMN id SET DEFAULT nextval('public.comments_id_seq'::regclass);


--
-- Name: companies id; Type: DEFAULT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.companies ALTER COLUMN id SET DEFAULT nextval('public.companies_id_seq'::regclass);


--
-- Name: employee_views id; Type: DEFAULT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.employee_views ALTER COLUMN id SET DEFAULT nextval('public.employee_views_id_seq'::regclass);


--
-- Name: employee_views_employees id; Type: DEFAULT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.employee_views_employees ALTER COLUMN id SET DEFAULT nextval('public.employee_views_employees_id_seq'::regclass);


--
-- Name: employees id; Type: DEFAULT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.employees ALTER COLUMN id SET DEFAULT nextval('public.employees_id_seq'::regclass);


--
-- Name: flags id; Type: DEFAULT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.flags ALTER COLUMN id SET DEFAULT nextval('public.flags_id_seq'::regclass);


--
-- Name: form_templates id; Type: DEFAULT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.form_templates ALTER COLUMN id SET DEFAULT nextval('public.form_templates_id_seq'::regclass);


--
-- Name: forum_comments id; Type: DEFAULT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.forum_comments ALTER COLUMN id SET DEFAULT nextval('public.forum_comments_id_seq'::regclass);


--
-- Name: forum_rooms id; Type: DEFAULT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.forum_rooms ALTER COLUMN id SET DEFAULT nextval('public.forum_rooms_id_seq'::regclass);


--
-- Name: groups id; Type: DEFAULT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.groups ALTER COLUMN id SET DEFAULT nextval('public.groups_id_seq'::regclass);


--
-- Name: interview_coaches id; Type: DEFAULT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.interview_coaches ALTER COLUMN id SET DEFAULT nextval('public.interview_coaches_id_seq'::regclass);


--
-- Name: item_ranks id; Type: DEFAULT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.item_ranks ALTER COLUMN id SET DEFAULT nextval('public.item_ranks_id_seq'::regclass);


--
-- Name: items id; Type: DEFAULT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.items ALTER COLUMN id SET DEFAULT nextval('public.items_id_seq'::regclass);


--
-- Name: job_levels id; Type: DEFAULT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.job_levels ALTER COLUMN id SET DEFAULT nextval('public.job_levels_id_seq'::regclass);


--
-- Name: locations id; Type: DEFAULT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.locations ALTER COLUMN id SET DEFAULT nextval('public.locations_id_seq'::regclass);


--
-- Name: mock_interview_profiles id; Type: DEFAULT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.mock_interview_profiles ALTER COLUMN id SET DEFAULT nextval('public.mock_interview_profiles_id_seq'::regclass);


--
-- Name: mock_interviews id; Type: DEFAULT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.mock_interviews ALTER COLUMN id SET DEFAULT nextval('public.mock_interviews_id_seq'::regclass);


--
-- Name: page_associations id; Type: DEFAULT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.page_associations ALTER COLUMN id SET DEFAULT nextval('public.page_associations_id_seq'::regclass);


--
-- Name: pages id; Type: DEFAULT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.pages ALTER COLUMN id SET DEFAULT nextval('public.pages_id_seq'::regclass);


--
-- Name: position_types id; Type: DEFAULT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.position_types ALTER COLUMN id SET DEFAULT nextval('public.position_types_id_seq'::regclass);


--
-- Name: posts id; Type: DEFAULT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.posts ALTER COLUMN id SET DEFAULT nextval('public.posts_id_seq'::regclass);


--
-- Name: question_packet_memberships id; Type: DEFAULT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.question_packet_memberships ALTER COLUMN id SET DEFAULT nextval('public.question_packet_memberships_id_seq'::regclass);


--
-- Name: question_packets id; Type: DEFAULT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.question_packets ALTER COLUMN id SET DEFAULT nextval('public.question_packets_id_seq'::regclass);


--
-- Name: questions id; Type: DEFAULT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.questions ALTER COLUMN id SET DEFAULT nextval('public.questions_id_seq'::regclass);


--
-- Name: questions_users id; Type: DEFAULT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.questions_users ALTER COLUMN id SET DEFAULT nextval('public.questions_users_id_seq'::regclass);


--
-- Name: ratings id; Type: DEFAULT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.ratings ALTER COLUMN id SET DEFAULT nextval('public.ratings_id_seq'::regclass);


--
-- Name: schools id; Type: DEFAULT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.schools ALTER COLUMN id SET DEFAULT nextval('public.schools_id_seq'::regclass);


--
-- Name: tier_list_templates id; Type: DEFAULT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.tier_list_templates ALTER COLUMN id SET DEFAULT nextval('public.tier_list_templates_id_seq'::regclass);


--
-- Name: tier_lists id; Type: DEFAULT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.tier_lists ALTER COLUMN id SET DEFAULT nextval('public.tier_lists_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: active_storage_attachments; Type: TABLE DATA; Schema: public; Owner: student
--

COPY public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at) FROM stdin;
2	picture	Item	2	2	2025-02-05 23:12:43.561164
\.


--
-- Data for Name: active_storage_blobs; Type: TABLE DATA; Schema: public; Owner: student
--

COPY public.active_storage_blobs (id, key, filename, content_type, metadata, service_name, byte_size, checksum, created_at) FROM stdin;
2	1vnasmxutrllxxapc62rbm6nlllz	girafee.jpg	image/jpeg	{"identified":true,"analyzed":true}	amazon	771268	LA/wL6tZJFBI3kvSL4b6zg==	2025-02-05 23:12:43.558546
\.


--
-- Data for Name: active_storage_variant_records; Type: TABLE DATA; Schema: public; Owner: student
--

COPY public.active_storage_variant_records (id, blob_id, variation_digest) FROM stdin;
\.


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: student
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2025-02-04 17:21:59.599968	2025-02-04 17:21:59.599972
schema_sha1	ca3190b10f65b6d4cd3f9d134ba6927c566087e5	2025-02-04 17:21:59.602996	2025-02-04 17:21:59.602997
\.


--
-- Data for Name: career_aggregate_jobs; Type: TABLE DATA; Schema: public; Owner: student
--

COPY public.career_aggregate_jobs (id, job_title, company, industry, "group", average_salary, average_bonus, average_hours_worked_per_week, sample_size, year, level, sub_level, created_at, updated_at, location, previous_undergrad, previous_grad, previous_mba) FROM stdin;
\.


--
-- Data for Name: career_compensations; Type: TABLE DATA; Schema: public; Owner: student
--

COPY public.career_compensations (id, career_job_id, year, level, sub_level, salary, bonus, hours_worked_per_week, created_at, updated_at, "group") FROM stdin;
\.


--
-- Data for Name: career_jobs; Type: TABLE DATA; Schema: public; Owner: student
--

COPY public.career_jobs (id, user_id, company, industry, start_year, years_at_job, created_at, updated_at, location, job_grouping, job_order, previous_undergrad, previous_grad, previous_mba) FROM stdin;
\.


--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: student
--

COPY public.comments (id, tier_list_id, commentable_type, commentable_id, user_id, content, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: companies; Type: TABLE DATA; Schema: public; Owner: student
--

COPY public.companies (id, name, created_at, updated_at, position_type_id) FROM stdin;
\.


--
-- Data for Name: employee_views; Type: TABLE DATA; Schema: public; Owner: student
--

COPY public.employee_views (id, name, description, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: employee_views_employees; Type: TABLE DATA; Schema: public; Owner: student
--

COPY public.employee_views_employees (id, employee_id, employee_view_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: employees; Type: TABLE DATA; Schema: public; Owner: student
--

COPY public.employees (id, name, job_level_id, company_id, previous_company_id, linkedin_url, flagged, flag_comment, group_id, location_id, created_at, updated_at, position_type_id, undergraduate_school_id, graduate_school_id) FROM stdin;
\.


--
-- Data for Name: flags; Type: TABLE DATA; Schema: public; Owner: student
--

COPY public.flags (id, flaggable_type, flaggable_id, user_id, reason, status, created_at, updated_at, text) FROM stdin;
\.


--
-- Data for Name: form_templates; Type: TABLE DATA; Schema: public; Owner: student
--

COPY public.form_templates (id, form_context, question_text, response_type, created_at, updated_at, position_type_id, "position") FROM stdin;
\.


--
-- Data for Name: forum_comments; Type: TABLE DATA; Schema: public; Owner: student
--

COPY public.forum_comments (id, body, post_id, user_id, parent_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: forum_rooms; Type: TABLE DATA; Schema: public; Owner: student
--

COPY public.forum_rooms (id, name, description, created_at, updated_at) FROM stdin;
1	General Discussion	A place to talk about anything!	2025-02-04 17:22:01.233788	2025-02-04 17:22:01.233788
2	Tech Talk	Discuss the latest in technology.	2025-02-04 17:22:01.242564	2025-02-04 17:22:01.242564
3	Help Desk	Ask questions and get help.	2025-02-04 17:22:01.249559	2025-02-04 17:22:01.249559
\.


--
-- Data for Name: groups; Type: TABLE DATA; Schema: public; Owner: student
--

COPY public.groups (id, name, company_id, location_id, created_at, updated_at, position_type_id, position_type_default) FROM stdin;
\.


--
-- Data for Name: interview_coaches; Type: TABLE DATA; Schema: public; Owner: student
--

COPY public.interview_coaches (id, user_id, name, linkedin_url, industry, description, languages, other_industries, highlighted_job, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: item_ranks; Type: TABLE DATA; Schema: public; Owner: student
--

COPY public.item_ranks (id, item_id, tier_list_id, custom_values, rank, created_at, updated_at, user_id) FROM stdin;
\.


--
-- Data for Name: items; Type: TABLE DATA; Schema: public; Owner: student
--

COPY public.items (id, name, created_at, updated_at) FROM stdin;
2	Giraffe	2025-02-05 23:12:43.542949	2025-02-05 23:12:44.101096
\.


--
-- Data for Name: job_levels; Type: TABLE DATA; Schema: public; Owner: student
--

COPY public.job_levels (id, name, company_id, created_at, updated_at, level_rank, is_global_default, is_position_type_default, position_type_id) FROM stdin;
\.


--
-- Data for Name: locations; Type: TABLE DATA; Schema: public; Owner: student
--

COPY public.locations (id, name, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: mock_interview_profiles; Type: TABLE DATA; Schema: public; Owner: student
--

COPY public.mock_interview_profiles (id, user_id, first_name, recruiting_for, technical_prep_level, organization, linkedin_url, preferred_language, english_proficiency, created_at, updated_at, reliability_metric, time_zone, no_show_count, late_count, total_completes) FROM stdin;
\.


--
-- Data for Name: mock_interviews; Type: TABLE DATA; Schema: public; Owner: student
--

COPY public.mock_interviews (id, start_date, start_time, status, created_by_id, accepted_by_id, created_at, updated_at, time_zone, check_date_time, creator_reliability_flag, acceptor_reliability_flag) FROM stdin;
\.


--
-- Data for Name: page_associations; Type: TABLE DATA; Schema: public; Owner: student
--

COPY public.page_associations (id, page_id, tier_list_id, association_type, metadata, created_at, updated_at, employee_view_id) FROM stdin;
\.


--
-- Data for Name: pages; Type: TABLE DATA; Schema: public; Owner: student
--

COPY public.pages (id, name, slug, parent_id, created_by, category, short_description, about, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: position_types; Type: TABLE DATA; Schema: public; Owner: student
--

COPY public.position_types (id, name, description, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: student
--

COPY public.posts (id, title, body, forum_room_id, user_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: question_packet_memberships; Type: TABLE DATA; Schema: public; Owner: student
--

COPY public.question_packet_memberships (id, question_id, question_packet_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: question_packets; Type: TABLE DATA; Schema: public; Owner: student
--

COPY public.question_packets (id, name, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: questions; Type: TABLE DATA; Schema: public; Owner: student
--

COPY public.questions (id, question_text, answer_choice_1, answer_choice_2, answer_choice_3, answer_choice_4, correct_answer, explanation_text, technical, behavior, category, position_type_id, difficulty_level, related_organization, question_link, question_link_order, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: questions_users; Type: TABLE DATA; Schema: public; Owner: student
--

COPY public.questions_users (id, question_id, user_id, starred, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: ratings; Type: TABLE DATA; Schema: public; Owner: student
--

COPY public.ratings (id, employee_id, user_id, form_context, responses, comment, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: student
--

COPY public.schema_migrations (version) FROM stdin;
20250203183853
20250203174455
20250203174147
20250203173218
20250203172009
20250202230142
20250131164634
20250128221219
20250128220650
20250128215917
20250128215016
20250128183345
20250128175352
20250128142942
20250128142810
20250128023204
20250128022203
20250128022112
20250122221427
20250121024312
20250121012347
20250121011347
20250120183055
20250120022524
20250120022409
20250120014711
20250119234747
20250119230953
20250118050019
20250118014452
20250117044945
20250117043812
20250117005209
20250115000041
20250114234015
20250114224847
20250114055825
20250114054141
20250113211357
20250113193142
20250113193056
20250113185643
20250112045321
20250111040115
20250111005345
20250111004613
20250111004413
20250110005355
20250109233552
20250109153837
20250108212119
20250108210656
20250108203532
20250108203400
20250108202714
20250108191926
20250107220510
20250107192050
20250107191111
20250107180711
20250107180315
20250107173524
20250107164417
20250107164337
20250107163648
20250105012034
20250105011759
20250105011546
20250105011404
20250105011256
20250105010839
20250105010629
20250105010347
20250105005426
20250104205326
20250104040032
20250103211721
20250102153124
20250101202902
20250101200705
20241231135017
20241231122525
20241231003132
20241231000036
20241230225132
20241230120049
20250202230831
\.


--
-- Data for Name: schools; Type: TABLE DATA; Schema: public; Owner: student
--

COPY public.schools (id, name, created_at, updated_at, undergraduate, mba, other_graduate, other) FROM stdin;
\.


--
-- Data for Name: tier_list_templates; Type: TABLE DATA; Schema: public; Owner: student
--

COPY public.tier_list_templates (id, name, short_description, custom_fields, created_by_id, created_at, updated_at, tag) FROM stdin;
\.


--
-- Data for Name: tier_lists; Type: TABLE DATA; Schema: public; Owner: student
--

COPY public.tier_lists (id, name, description, published, custom_fields, created_at, updated_at, tier_list_template_id, category) FROM stdin;
1	Testing again		t	\N	2025-02-04 22:04:05.352875	2025-02-04 22:04:07.797336	\N	Consulting
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: student
--

COPY public.users (id, user_name, admin, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, created_at, updated_at, is_interview_coach) FROM stdin;
1	jake_the_tank	t	jspitz77@gmail.com	$2a$12$dMe6S3f7kjv3F2LruxFZUeiG4qaqYz07VEHlUU4VBT.UAlYhqBlRW	\N	\N	\N	2025-02-04 20:50:00.503307	2025-02-04 20:51:02.632538	f
\.


--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: student
--

SELECT pg_catalog.setval('public.active_storage_attachments_id_seq', 2, true);


--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: student
--

SELECT pg_catalog.setval('public.active_storage_blobs_id_seq', 2, true);


--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE SET; Schema: public; Owner: student
--

SELECT pg_catalog.setval('public.active_storage_variant_records_id_seq', 1, false);


--
-- Name: career_aggregate_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: student
--

SELECT pg_catalog.setval('public.career_aggregate_jobs_id_seq', 1, false);


--
-- Name: career_compensations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: student
--

SELECT pg_catalog.setval('public.career_compensations_id_seq', 1, false);


--
-- Name: career_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: student
--

SELECT pg_catalog.setval('public.career_jobs_id_seq', 1, false);


--
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: student
--

SELECT pg_catalog.setval('public.comments_id_seq', 1, false);


--
-- Name: companies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: student
--

SELECT pg_catalog.setval('public.companies_id_seq', 1, false);


--
-- Name: employee_views_employees_id_seq; Type: SEQUENCE SET; Schema: public; Owner: student
--

SELECT pg_catalog.setval('public.employee_views_employees_id_seq', 1, false);


--
-- Name: employee_views_id_seq; Type: SEQUENCE SET; Schema: public; Owner: student
--

SELECT pg_catalog.setval('public.employee_views_id_seq', 1, false);


--
-- Name: employees_id_seq; Type: SEQUENCE SET; Schema: public; Owner: student
--

SELECT pg_catalog.setval('public.employees_id_seq', 1, false);


--
-- Name: flags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: student
--

SELECT pg_catalog.setval('public.flags_id_seq', 1, false);


--
-- Name: form_templates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: student
--

SELECT pg_catalog.setval('public.form_templates_id_seq', 1, false);


--
-- Name: forum_comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: student
--

SELECT pg_catalog.setval('public.forum_comments_id_seq', 1, false);


--
-- Name: forum_rooms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: student
--

SELECT pg_catalog.setval('public.forum_rooms_id_seq', 3, true);


--
-- Name: groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: student
--

SELECT pg_catalog.setval('public.groups_id_seq', 1, false);


--
-- Name: interview_coaches_id_seq; Type: SEQUENCE SET; Schema: public; Owner: student
--

SELECT pg_catalog.setval('public.interview_coaches_id_seq', 1, false);


--
-- Name: item_ranks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: student
--

SELECT pg_catalog.setval('public.item_ranks_id_seq', 1, false);


--
-- Name: items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: student
--

SELECT pg_catalog.setval('public.items_id_seq', 2, true);


--
-- Name: job_levels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: student
--

SELECT pg_catalog.setval('public.job_levels_id_seq', 1, false);


--
-- Name: locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: student
--

SELECT pg_catalog.setval('public.locations_id_seq', 1, false);


--
-- Name: mock_interview_profiles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: student
--

SELECT pg_catalog.setval('public.mock_interview_profiles_id_seq', 1, false);


--
-- Name: mock_interviews_id_seq; Type: SEQUENCE SET; Schema: public; Owner: student
--

SELECT pg_catalog.setval('public.mock_interviews_id_seq', 1, false);


--
-- Name: page_associations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: student
--

SELECT pg_catalog.setval('public.page_associations_id_seq', 1, false);


--
-- Name: pages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: student
--

SELECT pg_catalog.setval('public.pages_id_seq', 1, false);


--
-- Name: position_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: student
--

SELECT pg_catalog.setval('public.position_types_id_seq', 1, false);


--
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: student
--

SELECT pg_catalog.setval('public.posts_id_seq', 1, false);


--
-- Name: question_packet_memberships_id_seq; Type: SEQUENCE SET; Schema: public; Owner: student
--

SELECT pg_catalog.setval('public.question_packet_memberships_id_seq', 1, false);


--
-- Name: question_packets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: student
--

SELECT pg_catalog.setval('public.question_packets_id_seq', 1, false);


--
-- Name: questions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: student
--

SELECT pg_catalog.setval('public.questions_id_seq', 1, false);


--
-- Name: questions_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: student
--

SELECT pg_catalog.setval('public.questions_users_id_seq', 1, false);


--
-- Name: ratings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: student
--

SELECT pg_catalog.setval('public.ratings_id_seq', 1, false);


--
-- Name: schools_id_seq; Type: SEQUENCE SET; Schema: public; Owner: student
--

SELECT pg_catalog.setval('public.schools_id_seq', 1, false);


--
-- Name: tier_list_templates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: student
--

SELECT pg_catalog.setval('public.tier_list_templates_id_seq', 1, false);


--
-- Name: tier_lists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: student
--

SELECT pg_catalog.setval('public.tier_lists_id_seq', 1, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: student
--

SELECT pg_catalog.setval('public.users_id_seq', 1, true);


--
-- Name: active_storage_attachments active_storage_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT active_storage_attachments_pkey PRIMARY KEY (id);


--
-- Name: active_storage_blobs active_storage_blobs_pkey; Type: CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.active_storage_blobs
    ADD CONSTRAINT active_storage_blobs_pkey PRIMARY KEY (id);


--
-- Name: active_storage_variant_records active_storage_variant_records_pkey; Type: CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.active_storage_variant_records
    ADD CONSTRAINT active_storage_variant_records_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: career_aggregate_jobs career_aggregate_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.career_aggregate_jobs
    ADD CONSTRAINT career_aggregate_jobs_pkey PRIMARY KEY (id);


--
-- Name: career_compensations career_compensations_pkey; Type: CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.career_compensations
    ADD CONSTRAINT career_compensations_pkey PRIMARY KEY (id);


--
-- Name: career_jobs career_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.career_jobs
    ADD CONSTRAINT career_jobs_pkey PRIMARY KEY (id);


--
-- Name: comments comments_pkey; Type: CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: companies companies_pkey; Type: CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.companies
    ADD CONSTRAINT companies_pkey PRIMARY KEY (id);


--
-- Name: employee_views_employees employee_views_employees_pkey; Type: CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.employee_views_employees
    ADD CONSTRAINT employee_views_employees_pkey PRIMARY KEY (id);


--
-- Name: employee_views employee_views_pkey; Type: CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.employee_views
    ADD CONSTRAINT employee_views_pkey PRIMARY KEY (id);


--
-- Name: employees employees_pkey; Type: CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (id);


--
-- Name: flags flags_pkey; Type: CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.flags
    ADD CONSTRAINT flags_pkey PRIMARY KEY (id);


--
-- Name: form_templates form_templates_pkey; Type: CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.form_templates
    ADD CONSTRAINT form_templates_pkey PRIMARY KEY (id);


--
-- Name: forum_comments forum_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.forum_comments
    ADD CONSTRAINT forum_comments_pkey PRIMARY KEY (id);


--
-- Name: forum_rooms forum_rooms_pkey; Type: CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.forum_rooms
    ADD CONSTRAINT forum_rooms_pkey PRIMARY KEY (id);


--
-- Name: groups groups_pkey; Type: CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (id);


--
-- Name: interview_coaches interview_coaches_pkey; Type: CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.interview_coaches
    ADD CONSTRAINT interview_coaches_pkey PRIMARY KEY (id);


--
-- Name: item_ranks item_ranks_pkey; Type: CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.item_ranks
    ADD CONSTRAINT item_ranks_pkey PRIMARY KEY (id);


--
-- Name: items items_pkey; Type: CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_pkey PRIMARY KEY (id);


--
-- Name: job_levels job_levels_pkey; Type: CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.job_levels
    ADD CONSTRAINT job_levels_pkey PRIMARY KEY (id);


--
-- Name: locations locations_pkey; Type: CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (id);


--
-- Name: mock_interview_profiles mock_interview_profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.mock_interview_profiles
    ADD CONSTRAINT mock_interview_profiles_pkey PRIMARY KEY (id);


--
-- Name: mock_interviews mock_interviews_pkey; Type: CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.mock_interviews
    ADD CONSTRAINT mock_interviews_pkey PRIMARY KEY (id);


--
-- Name: page_associations page_associations_pkey; Type: CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.page_associations
    ADD CONSTRAINT page_associations_pkey PRIMARY KEY (id);


--
-- Name: pages pages_pkey; Type: CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.pages
    ADD CONSTRAINT pages_pkey PRIMARY KEY (id);


--
-- Name: position_types position_types_pkey; Type: CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.position_types
    ADD CONSTRAINT position_types_pkey PRIMARY KEY (id);


--
-- Name: posts posts_pkey; Type: CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);


--
-- Name: question_packet_memberships question_packet_memberships_pkey; Type: CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.question_packet_memberships
    ADD CONSTRAINT question_packet_memberships_pkey PRIMARY KEY (id);


--
-- Name: question_packets question_packets_pkey; Type: CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.question_packets
    ADD CONSTRAINT question_packets_pkey PRIMARY KEY (id);


--
-- Name: questions questions_pkey; Type: CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_pkey PRIMARY KEY (id);


--
-- Name: questions_users questions_users_pkey; Type: CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.questions_users
    ADD CONSTRAINT questions_users_pkey PRIMARY KEY (id);


--
-- Name: ratings ratings_pkey; Type: CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.ratings
    ADD CONSTRAINT ratings_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: schools schools_pkey; Type: CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.schools
    ADD CONSTRAINT schools_pkey PRIMARY KEY (id);


--
-- Name: tier_list_templates tier_list_templates_pkey; Type: CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.tier_list_templates
    ADD CONSTRAINT tier_list_templates_pkey PRIMARY KEY (id);


--
-- Name: tier_lists tier_lists_pkey; Type: CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.tier_lists
    ADD CONSTRAINT tier_lists_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_active_storage_attachments_on_blob_id; Type: INDEX; Schema: public; Owner: student
--

CREATE INDEX index_active_storage_attachments_on_blob_id ON public.active_storage_attachments USING btree (blob_id);


--
-- Name: index_active_storage_attachments_uniqueness; Type: INDEX; Schema: public; Owner: student
--

CREATE UNIQUE INDEX index_active_storage_attachments_uniqueness ON public.active_storage_attachments USING btree (record_type, record_id, name, blob_id);


--
-- Name: index_active_storage_blobs_on_key; Type: INDEX; Schema: public; Owner: student
--

CREATE UNIQUE INDEX index_active_storage_blobs_on_key ON public.active_storage_blobs USING btree (key);


--
-- Name: index_active_storage_variant_records_uniqueness; Type: INDEX; Schema: public; Owner: student
--

CREATE UNIQUE INDEX index_active_storage_variant_records_uniqueness ON public.active_storage_variant_records USING btree (blob_id, variation_digest);


--
-- Name: index_career_compensations_on_career_job_id; Type: INDEX; Schema: public; Owner: student
--

CREATE INDEX index_career_compensations_on_career_job_id ON public.career_compensations USING btree (career_job_id);


--
-- Name: index_career_jobs_on_user_id; Type: INDEX; Schema: public; Owner: student
--

CREATE INDEX index_career_jobs_on_user_id ON public.career_jobs USING btree (user_id);


--
-- Name: index_comments_on_commentable; Type: INDEX; Schema: public; Owner: student
--

CREATE INDEX index_comments_on_commentable ON public.comments USING btree (commentable_type, commentable_id);


--
-- Name: index_comments_on_tier_list_id; Type: INDEX; Schema: public; Owner: student
--

CREATE INDEX index_comments_on_tier_list_id ON public.comments USING btree (tier_list_id);


--
-- Name: index_comments_on_user_id; Type: INDEX; Schema: public; Owner: student
--

CREATE INDEX index_comments_on_user_id ON public.comments USING btree (user_id);


--
-- Name: index_companies_on_position_type_id; Type: INDEX; Schema: public; Owner: student
--

CREATE INDEX index_companies_on_position_type_id ON public.companies USING btree (position_type_id);


--
-- Name: index_employee_views_employees_on_employee_id; Type: INDEX; Schema: public; Owner: student
--

CREATE INDEX index_employee_views_employees_on_employee_id ON public.employee_views_employees USING btree (employee_id);


--
-- Name: index_employee_views_employees_on_employee_view_id; Type: INDEX; Schema: public; Owner: student
--

CREATE INDEX index_employee_views_employees_on_employee_view_id ON public.employee_views_employees USING btree (employee_view_id);


--
-- Name: index_employees_on_company_id; Type: INDEX; Schema: public; Owner: student
--

CREATE INDEX index_employees_on_company_id ON public.employees USING btree (company_id);


--
-- Name: index_employees_on_flagged; Type: INDEX; Schema: public; Owner: student
--

CREATE INDEX index_employees_on_flagged ON public.employees USING btree (flagged);


--
-- Name: index_employees_on_graduate_school_id; Type: INDEX; Schema: public; Owner: student
--

CREATE INDEX index_employees_on_graduate_school_id ON public.employees USING btree (graduate_school_id);


--
-- Name: index_employees_on_group_id; Type: INDEX; Schema: public; Owner: student
--

CREATE INDEX index_employees_on_group_id ON public.employees USING btree (group_id);


--
-- Name: index_employees_on_job_level_id; Type: INDEX; Schema: public; Owner: student
--

CREATE INDEX index_employees_on_job_level_id ON public.employees USING btree (job_level_id);


--
-- Name: index_employees_on_linkedin_url; Type: INDEX; Schema: public; Owner: student
--

CREATE INDEX index_employees_on_linkedin_url ON public.employees USING btree (linkedin_url);


--
-- Name: index_employees_on_location_id; Type: INDEX; Schema: public; Owner: student
--

CREATE INDEX index_employees_on_location_id ON public.employees USING btree (location_id);


--
-- Name: index_employees_on_name; Type: INDEX; Schema: public; Owner: student
--

CREATE INDEX index_employees_on_name ON public.employees USING btree (name);


--
-- Name: index_employees_on_previous_company_id; Type: INDEX; Schema: public; Owner: student
--

CREATE INDEX index_employees_on_previous_company_id ON public.employees USING btree (previous_company_id);


--
-- Name: index_employees_on_undergraduate_school_id; Type: INDEX; Schema: public; Owner: student
--

CREATE INDEX index_employees_on_undergraduate_school_id ON public.employees USING btree (undergraduate_school_id);


--
-- Name: index_flags_on_flaggable; Type: INDEX; Schema: public; Owner: student
--

CREATE INDEX index_flags_on_flaggable ON public.flags USING btree (flaggable_type, flaggable_id);


--
-- Name: index_flags_on_user_id; Type: INDEX; Schema: public; Owner: student
--

CREATE INDEX index_flags_on_user_id ON public.flags USING btree (user_id);


--
-- Name: index_form_templates_on_position_type_id; Type: INDEX; Schema: public; Owner: student
--

CREATE INDEX index_form_templates_on_position_type_id ON public.form_templates USING btree (position_type_id);


--
-- Name: index_forum_comments_on_parent_id; Type: INDEX; Schema: public; Owner: student
--

CREATE INDEX index_forum_comments_on_parent_id ON public.forum_comments USING btree (parent_id);


--
-- Name: index_forum_comments_on_post_id; Type: INDEX; Schema: public; Owner: student
--

CREATE INDEX index_forum_comments_on_post_id ON public.forum_comments USING btree (post_id);


--
-- Name: index_forum_comments_on_user_id; Type: INDEX; Schema: public; Owner: student
--

CREATE INDEX index_forum_comments_on_user_id ON public.forum_comments USING btree (user_id);


--
-- Name: index_groups_on_company_id; Type: INDEX; Schema: public; Owner: student
--

CREATE INDEX index_groups_on_company_id ON public.groups USING btree (company_id);


--
-- Name: index_groups_on_location_id; Type: INDEX; Schema: public; Owner: student
--

CREATE INDEX index_groups_on_location_id ON public.groups USING btree (location_id);


--
-- Name: index_groups_on_position_type_id; Type: INDEX; Schema: public; Owner: student
--

CREATE INDEX index_groups_on_position_type_id ON public.groups USING btree (position_type_id);


--
-- Name: index_interview_coaches_on_user_id; Type: INDEX; Schema: public; Owner: student
--

CREATE INDEX index_interview_coaches_on_user_id ON public.interview_coaches USING btree (user_id);


--
-- Name: index_item_ranks_on_item_id; Type: INDEX; Schema: public; Owner: student
--

CREATE INDEX index_item_ranks_on_item_id ON public.item_ranks USING btree (item_id);


--
-- Name: index_item_ranks_on_tier_list_id; Type: INDEX; Schema: public; Owner: student
--

CREATE INDEX index_item_ranks_on_tier_list_id ON public.item_ranks USING btree (tier_list_id);


--
-- Name: index_item_ranks_on_user_id; Type: INDEX; Schema: public; Owner: student
--

CREATE INDEX index_item_ranks_on_user_id ON public.item_ranks USING btree (user_id);


--
-- Name: index_job_levels_on_company_id; Type: INDEX; Schema: public; Owner: student
--

CREATE INDEX index_job_levels_on_company_id ON public.job_levels USING btree (company_id);


--
-- Name: index_job_levels_on_name_and_company_and_type; Type: INDEX; Schema: public; Owner: student
--

CREATE UNIQUE INDEX index_job_levels_on_name_and_company_and_type ON public.job_levels USING btree (name, company_id, position_type_id);


--
-- Name: index_job_levels_on_position_type_id; Type: INDEX; Schema: public; Owner: student
--

CREATE INDEX index_job_levels_on_position_type_id ON public.job_levels USING btree (position_type_id);


--
-- Name: index_mock_interview_profiles_on_user_id; Type: INDEX; Schema: public; Owner: student
--

CREATE INDEX index_mock_interview_profiles_on_user_id ON public.mock_interview_profiles USING btree (user_id);


--
-- Name: index_mock_interviews_on_accepted_by_id; Type: INDEX; Schema: public; Owner: student
--

CREATE INDEX index_mock_interviews_on_accepted_by_id ON public.mock_interviews USING btree (accepted_by_id);


--
-- Name: index_mock_interviews_on_created_by_id; Type: INDEX; Schema: public; Owner: student
--

CREATE INDEX index_mock_interviews_on_created_by_id ON public.mock_interviews USING btree (created_by_id);


--
-- Name: index_page_associations_on_employee_view_id; Type: INDEX; Schema: public; Owner: student
--

CREATE INDEX index_page_associations_on_employee_view_id ON public.page_associations USING btree (employee_view_id);


--
-- Name: index_page_associations_on_page_id; Type: INDEX; Schema: public; Owner: student
--

CREATE INDEX index_page_associations_on_page_id ON public.page_associations USING btree (page_id);


--
-- Name: index_page_associations_on_page_id_and_employee_view_id; Type: INDEX; Schema: public; Owner: student
--

CREATE UNIQUE INDEX index_page_associations_on_page_id_and_employee_view_id ON public.page_associations USING btree (page_id, employee_view_id) WHERE (employee_view_id IS NOT NULL);


--
-- Name: index_page_associations_on_page_id_and_tier_list_id; Type: INDEX; Schema: public; Owner: student
--

CREATE UNIQUE INDEX index_page_associations_on_page_id_and_tier_list_id ON public.page_associations USING btree (page_id, tier_list_id);


--
-- Name: index_page_associations_on_tier_list_id; Type: INDEX; Schema: public; Owner: student
--

CREATE INDEX index_page_associations_on_tier_list_id ON public.page_associations USING btree (tier_list_id);


--
-- Name: index_pages_on_created_by; Type: INDEX; Schema: public; Owner: student
--

CREATE INDEX index_pages_on_created_by ON public.pages USING btree (created_by);


--
-- Name: index_pages_on_parent_id; Type: INDEX; Schema: public; Owner: student
--

CREATE INDEX index_pages_on_parent_id ON public.pages USING btree (parent_id);


--
-- Name: index_pages_on_slug; Type: INDEX; Schema: public; Owner: student
--

CREATE UNIQUE INDEX index_pages_on_slug ON public.pages USING btree (slug);


--
-- Name: index_posts_on_forum_room_id; Type: INDEX; Schema: public; Owner: student
--

CREATE INDEX index_posts_on_forum_room_id ON public.posts USING btree (forum_room_id);


--
-- Name: index_posts_on_user_id; Type: INDEX; Schema: public; Owner: student
--

CREATE INDEX index_posts_on_user_id ON public.posts USING btree (user_id);


--
-- Name: index_question_packet_memberships_on_question_id; Type: INDEX; Schema: public; Owner: student
--

CREATE INDEX index_question_packet_memberships_on_question_id ON public.question_packet_memberships USING btree (question_id);


--
-- Name: index_question_packet_memberships_on_question_packet_id; Type: INDEX; Schema: public; Owner: student
--

CREATE INDEX index_question_packet_memberships_on_question_packet_id ON public.question_packet_memberships USING btree (question_packet_id);


--
-- Name: index_question_packets_on_name; Type: INDEX; Schema: public; Owner: student
--

CREATE UNIQUE INDEX index_question_packets_on_name ON public.question_packets USING btree (name);


--
-- Name: index_questions_on_position_type_id; Type: INDEX; Schema: public; Owner: student
--

CREATE INDEX index_questions_on_position_type_id ON public.questions USING btree (position_type_id);


--
-- Name: index_questions_users_on_question_id; Type: INDEX; Schema: public; Owner: student
--

CREATE INDEX index_questions_users_on_question_id ON public.questions_users USING btree (question_id);


--
-- Name: index_questions_users_on_question_id_and_user_id; Type: INDEX; Schema: public; Owner: student
--

CREATE UNIQUE INDEX index_questions_users_on_question_id_and_user_id ON public.questions_users USING btree (question_id, user_id);


--
-- Name: index_questions_users_on_user_id; Type: INDEX; Schema: public; Owner: student
--

CREATE INDEX index_questions_users_on_user_id ON public.questions_users USING btree (user_id);


--
-- Name: index_ratings_on_employee_id; Type: INDEX; Schema: public; Owner: student
--

CREATE INDEX index_ratings_on_employee_id ON public.ratings USING btree (employee_id);


--
-- Name: index_ratings_on_user_id; Type: INDEX; Schema: public; Owner: student
--

CREATE INDEX index_ratings_on_user_id ON public.ratings USING btree (user_id);


--
-- Name: index_tier_list_templates_on_created_by_id; Type: INDEX; Schema: public; Owner: student
--

CREATE INDEX index_tier_list_templates_on_created_by_id ON public.tier_list_templates USING btree (created_by_id);


--
-- Name: index_tier_lists_on_tier_list_template_id; Type: INDEX; Schema: public; Owner: student
--

CREATE INDEX index_tier_lists_on_tier_list_template_id ON public.tier_lists USING btree (tier_list_template_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: student
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: student
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON public.users USING btree (reset_password_token);


--
-- Name: index_users_on_user_name; Type: INDEX; Schema: public; Owner: student
--

CREATE UNIQUE INDEX index_users_on_user_name ON public.users USING btree (user_name);


--
-- Name: unique_employee_view_per_page; Type: INDEX; Schema: public; Owner: student
--

CREATE UNIQUE INDEX unique_employee_view_per_page ON public.page_associations USING btree (page_id) WHERE (employee_view_id IS NOT NULL);


--
-- Name: unique_item_rank_per_user; Type: INDEX; Schema: public; Owner: student
--

CREATE UNIQUE INDEX unique_item_rank_per_user ON public.item_ranks USING btree (item_id, tier_list_id, user_id);


--
-- Name: mock_interview_profiles fk_rails_02bb583da3; Type: FK CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.mock_interview_profiles
    ADD CONSTRAINT fk_rails_02bb583da3 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: comments fk_rails_03de2dc08c; Type: FK CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT fk_rails_03de2dc08c FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: item_ranks fk_rails_09ec12924f; Type: FK CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.item_ranks
    ADD CONSTRAINT fk_rails_09ec12924f FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: page_associations fk_rails_133caf873f; Type: FK CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.page_associations
    ADD CONSTRAINT fk_rails_133caf873f FOREIGN KEY (tier_list_id) REFERENCES public.tier_lists(id);


--
-- Name: employees fk_rails_15ca1438d5; Type: FK CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT fk_rails_15ca1438d5 FOREIGN KEY (company_id) REFERENCES public.companies(id);


--
-- Name: page_associations fk_rails_1de35c3fab; Type: FK CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.page_associations
    ADD CONSTRAINT fk_rails_1de35c3fab FOREIGN KEY (page_id) REFERENCES public.pages(id);


--
-- Name: question_packet_memberships fk_rails_3105da02db; Type: FK CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.question_packet_memberships
    ADD CONSTRAINT fk_rails_3105da02db FOREIGN KEY (question_id) REFERENCES public.questions(id) ON DELETE CASCADE;


--
-- Name: job_levels fk_rails_3fdcb0e728; Type: FK CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.job_levels
    ADD CONSTRAINT fk_rails_3fdcb0e728 FOREIGN KEY (position_type_id) REFERENCES public.position_types(id);


--
-- Name: item_ranks fk_rails_484f99e59f; Type: FK CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.item_ranks
    ADD CONSTRAINT fk_rails_484f99e59f FOREIGN KEY (tier_list_id) REFERENCES public.tier_lists(id);


--
-- Name: questions_users fk_rails_4a314af399; Type: FK CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.questions_users
    ADD CONSTRAINT fk_rails_4a314af399 FOREIGN KEY (question_id) REFERENCES public.questions(id) ON DELETE CASCADE;


--
-- Name: career_compensations fk_rails_55d945a5fa; Type: FK CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.career_compensations
    ADD CONSTRAINT fk_rails_55d945a5fa FOREIGN KEY (career_job_id) REFERENCES public.career_jobs(id) ON DELETE CASCADE;


--
-- Name: page_associations fk_rails_5abf2a1573; Type: FK CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.page_associations
    ADD CONSTRAINT fk_rails_5abf2a1573 FOREIGN KEY (employee_view_id) REFERENCES public.employee_views(id);


--
-- Name: posts fk_rails_5b5ddfd518; Type: FK CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT fk_rails_5b5ddfd518 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: item_ranks fk_rails_5be82fdc1e; Type: FK CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.item_ranks
    ADD CONSTRAINT fk_rails_5be82fdc1e FOREIGN KEY (item_id) REFERENCES public.items(id);


--
-- Name: comments fk_rails_6087eb4b64; Type: FK CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT fk_rails_6087eb4b64 FOREIGN KEY (tier_list_id) REFERENCES public.tier_lists(id);


--
-- Name: groups fk_rails_62e6ddec83; Type: FK CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT fk_rails_62e6ddec83 FOREIGN KEY (position_type_id) REFERENCES public.position_types(id);


--
-- Name: employees fk_rails_63f6ce9581; Type: FK CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT fk_rails_63f6ce9581 FOREIGN KEY (previous_company_id) REFERENCES public.companies(id);


--
-- Name: employee_views_employees fk_rails_67cab04521; Type: FK CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.employee_views_employees
    ADD CONSTRAINT fk_rails_67cab04521 FOREIGN KEY (employee_view_id) REFERENCES public.employee_views(id);


--
-- Name: question_packet_memberships fk_rails_6814203250; Type: FK CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.question_packet_memberships
    ADD CONSTRAINT fk_rails_6814203250 FOREIGN KEY (question_packet_id) REFERENCES public.question_packets(id) ON DELETE CASCADE;


--
-- Name: questions_users fk_rails_70eb0c164c; Type: FK CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.questions_users
    ADD CONSTRAINT fk_rails_70eb0c164c FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: questions fk_rails_7c726326aa; Type: FK CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT fk_rails_7c726326aa FOREIGN KEY (position_type_id) REFERENCES public.position_types(id);


--
-- Name: companies fk_rails_7c881646c8; Type: FK CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.companies
    ADD CONSTRAINT fk_rails_7c881646c8 FOREIGN KEY (position_type_id) REFERENCES public.position_types(id);


--
-- Name: groups fk_rails_7d1e321398; Type: FK CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT fk_rails_7d1e321398 FOREIGN KEY (company_id) REFERENCES public.companies(id);


--
-- Name: interview_coaches fk_rails_824a68b624; Type: FK CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.interview_coaches
    ADD CONSTRAINT fk_rails_824a68b624 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: employees fk_rails_8d63bd3a3b; Type: FK CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT fk_rails_8d63bd3a3b FOREIGN KEY (graduate_school_id) REFERENCES public.schools(id);


--
-- Name: employees fk_rails_975432394f; Type: FK CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT fk_rails_975432394f FOREIGN KEY (group_id) REFERENCES public.groups(id);


--
-- Name: active_storage_variant_records fk_rails_993965df05; Type: FK CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.active_storage_variant_records
    ADD CONSTRAINT fk_rails_993965df05 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- Name: employees fk_rails_9aae45b25f; Type: FK CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT fk_rails_9aae45b25f FOREIGN KEY (undergraduate_school_id) REFERENCES public.schools(id);


--
-- Name: employees fk_rails_a5315c1d86; Type: FK CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT fk_rails_a5315c1d86 FOREIGN KEY (job_level_id) REFERENCES public.job_levels(id);


--
-- Name: forum_comments fk_rails_a7a0199ea1; Type: FK CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.forum_comments
    ADD CONSTRAINT fk_rails_a7a0199ea1 FOREIGN KEY (post_id) REFERENCES public.posts(id);


--
-- Name: tier_lists fk_rails_a7a4730293; Type: FK CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.tier_lists
    ADD CONSTRAINT fk_rails_a7a4730293 FOREIGN KEY (tier_list_template_id) REFERENCES public.tier_list_templates(id);


--
-- Name: ratings fk_rails_a7dfeb9f5f; Type: FK CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.ratings
    ADD CONSTRAINT fk_rails_a7dfeb9f5f FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: career_jobs fk_rails_b04fc243d4; Type: FK CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.career_jobs
    ADD CONSTRAINT fk_rails_b04fc243d4 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: job_levels fk_rails_b55f743482; Type: FK CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.job_levels
    ADD CONSTRAINT fk_rails_b55f743482 FOREIGN KEY (company_id) REFERENCES public.companies(id);


--
-- Name: mock_interviews fk_rails_b77a59066b; Type: FK CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.mock_interviews
    ADD CONSTRAINT fk_rails_b77a59066b FOREIGN KEY (accepted_by_id) REFERENCES public.users(id);


--
-- Name: ratings fk_rails_b7dcfcb9fe; Type: FK CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.ratings
    ADD CONSTRAINT fk_rails_b7dcfcb9fe FOREIGN KEY (employee_id) REFERENCES public.employees(id);


--
-- Name: employees fk_rails_bcc817cea2; Type: FK CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT fk_rails_bcc817cea2 FOREIGN KEY (location_id) REFERENCES public.locations(id);


--
-- Name: form_templates fk_rails_bd84353002; Type: FK CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.form_templates
    ADD CONSTRAINT fk_rails_bd84353002 FOREIGN KEY (position_type_id) REFERENCES public.position_types(id);


--
-- Name: active_storage_attachments fk_rails_c3b3935057; Type: FK CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT fk_rails_c3b3935057 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- Name: employee_views_employees fk_rails_c5c0eb6aba; Type: FK CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.employee_views_employees
    ADD CONSTRAINT fk_rails_c5c0eb6aba FOREIGN KEY (employee_id) REFERENCES public.employees(id) ON DELETE CASCADE;


--
-- Name: posts fk_rails_c73eb16fa7; Type: FK CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT fk_rails_c73eb16fa7 FOREIGN KEY (forum_room_id) REFERENCES public.forum_rooms(id);


--
-- Name: groups fk_rails_c9ba0cf64b; Type: FK CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT fk_rails_c9ba0cf64b FOREIGN KEY (location_id) REFERENCES public.locations(id);


--
-- Name: forum_comments fk_rails_ce6ed0c47a; Type: FK CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.forum_comments
    ADD CONSTRAINT fk_rails_ce6ed0c47a FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: flags fk_rails_d7842de637; Type: FK CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.flags
    ADD CONSTRAINT fk_rails_d7842de637 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: mock_interviews fk_rails_f835e197e4; Type: FK CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.mock_interviews
    ADD CONSTRAINT fk_rails_f835e197e4 FOREIGN KEY (created_by_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

