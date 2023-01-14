--
-- PostgreSQL database dump
--

-- Dumped from database version 14.3
-- Dumped by pg_dump version 14.3

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
-- Name: account_emailaddress; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.account_emailaddress (
    id integer NOT NULL,
    email character varying(254) NOT NULL,
    verified boolean NOT NULL,
    "primary" boolean NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.account_emailaddress OWNER TO postgres;

--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.account_emailaddress_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_emailaddress_id_seq OWNER TO postgres;

--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.account_emailaddress_id_seq OWNED BY public.account_emailaddress.id;


--
-- Name: account_emailconfirmation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.account_emailconfirmation (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    sent timestamp with time zone,
    key character varying(64) NOT NULL,
    email_address_id integer NOT NULL
);


ALTER TABLE public.account_emailconfirmation OWNER TO postgres;

--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.account_emailconfirmation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_emailconfirmation_id_seq OWNER TO postgres;

--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.account_emailconfirmation_id_seq OWNED BY public.account_emailconfirmation.id;


--
-- Name: accounts_blogger; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounts_blogger (
    user_id bigint NOT NULL,
    birthday date NOT NULL,
    country character varying(500) NOT NULL
);


ALTER TABLE public.accounts_blogger OWNER TO postgres;

--
-- Name: accounts_blogger_category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounts_blogger_category (
    id bigint NOT NULL,
    blogger_id bigint NOT NULL,
    category_id bigint NOT NULL
);


ALTER TABLE public.accounts_blogger_category OWNER TO postgres;

--
-- Name: accounts_blogger_category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.accounts_blogger_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_blogger_category_id_seq OWNER TO postgres;

--
-- Name: accounts_blogger_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.accounts_blogger_category_id_seq OWNED BY public.accounts_blogger_category.id;


--
-- Name: accounts_category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounts_category (
    id bigint NOT NULL,
    category character varying(30) NOT NULL
);


ALTER TABLE public.accounts_category OWNER TO postgres;

--
-- Name: accounts_category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.accounts_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_category_id_seq OWNER TO postgres;

--
-- Name: accounts_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.accounts_category_id_seq OWNED BY public.accounts_category.id;


--
-- Name: accounts_interests; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounts_interests (
    id bigint NOT NULL,
    interests character varying(30) NOT NULL
);


ALTER TABLE public.accounts_interests OWNER TO postgres;

--
-- Name: accounts_interests_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.accounts_interests_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_interests_id_seq OWNER TO postgres;

--
-- Name: accounts_interests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.accounts_interests_id_seq OWNED BY public.accounts_interests.id;


--
-- Name: accounts_reader; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounts_reader (
    user_id bigint NOT NULL,
    is_adult boolean NOT NULL
);


ALTER TABLE public.accounts_reader OWNER TO postgres;

--
-- Name: accounts_reader_interests; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounts_reader_interests (
    id bigint NOT NULL,
    reader_id bigint NOT NULL,
    interests_id bigint NOT NULL
);


ALTER TABLE public.accounts_reader_interests OWNER TO postgres;

--
-- Name: accounts_reader_interests_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.accounts_reader_interests_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_reader_interests_id_seq OWNER TO postgres;

--
-- Name: accounts_reader_interests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.accounts_reader_interests_id_seq OWNED BY public.accounts_reader_interests.id;


--
-- Name: accounts_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounts_user (
    id bigint NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    is_blogger boolean NOT NULL,
    is_reader boolean NOT NULL,
    file character varying(100)
);


ALTER TABLE public.accounts_user OWNER TO postgres;

--
-- Name: accounts_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounts_user_groups (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.accounts_user_groups OWNER TO postgres;

--
-- Name: accounts_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.accounts_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_user_groups_id_seq OWNER TO postgres;

--
-- Name: accounts_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.accounts_user_groups_id_seq OWNED BY public.accounts_user_groups.id;


--
-- Name: accounts_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.accounts_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_user_id_seq OWNER TO postgres;

--
-- Name: accounts_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.accounts_user_id_seq OWNED BY public.accounts_user.id;


--
-- Name: accounts_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounts_user_user_permissions (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.accounts_user_user_permissions OWNER TO postgres;

--
-- Name: accounts_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.accounts_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: accounts_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.accounts_user_user_permissions_id_seq OWNED BY public.accounts_user_user_permissions.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: boards_board; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.boards_board (
    id bigint NOT NULL,
    name character varying(30) NOT NULL,
    description character varying(100) NOT NULL,
    is_active boolean NOT NULL
);


ALTER TABLE public.boards_board OWNER TO postgres;

--
-- Name: boards_board_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.boards_board_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.boards_board_id_seq OWNER TO postgres;

--
-- Name: boards_board_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.boards_board_id_seq OWNED BY public.boards_board.id;


--
-- Name: boards_historicalboard; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.boards_historicalboard (
    id bigint NOT NULL,
    name character varying(30) NOT NULL,
    description character varying(100) NOT NULL,
    history_id integer NOT NULL,
    history_date timestamp with time zone NOT NULL,
    history_change_reason character varying(100),
    history_type character varying(1) NOT NULL,
    history_user_id bigint,
    is_active boolean NOT NULL
);


ALTER TABLE public.boards_historicalboard OWNER TO postgres;

--
-- Name: boards_historicalboard_history_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.boards_historicalboard_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.boards_historicalboard_history_id_seq OWNER TO postgres;

--
-- Name: boards_historicalboard_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.boards_historicalboard_history_id_seq OWNED BY public.boards_historicalboard.history_id;


--
-- Name: boards_photo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.boards_photo (
    id bigint NOT NULL,
    title character varying(255) NOT NULL,
    uploaded_at timestamp with time zone NOT NULL,
    file character varying(1000),
    topic_id bigint
);


ALTER TABLE public.boards_photo OWNER TO postgres;

--
-- Name: boards_photo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.boards_photo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.boards_photo_id_seq OWNER TO postgres;

--
-- Name: boards_photo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.boards_photo_id_seq OWNED BY public.boards_photo.id;


--
-- Name: boards_post; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.boards_post (
    id bigint NOT NULL,
    message text NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone,
    created_by_id bigint NOT NULL,
    topic_id bigint NOT NULL,
    updated_by_id bigint
);


ALTER TABLE public.boards_post OWNER TO postgres;

--
-- Name: boards_post_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.boards_post_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.boards_post_id_seq OWNER TO postgres;

--
-- Name: boards_post_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.boards_post_id_seq OWNED BY public.boards_post.id;


--
-- Name: boards_topic; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.boards_topic (
    id bigint NOT NULL,
    subject character varying(255) NOT NULL,
    last_updated timestamp with time zone NOT NULL,
    views integer NOT NULL,
    board_id bigint NOT NULL,
    starter_id bigint NOT NULL,
    CONSTRAINT boards_topic_views_check CHECK ((views >= 0))
);


ALTER TABLE public.boards_topic OWNER TO postgres;

--
-- Name: boards_topic_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.boards_topic_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.boards_topic_id_seq OWNER TO postgres;

--
-- Name: boards_topic_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.boards_topic_id_seq OWNED BY public.boards_topic.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id bigint NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_celery_results_chordcounter; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_celery_results_chordcounter (
    id integer NOT NULL,
    group_id character varying(255) NOT NULL,
    sub_tasks text NOT NULL,
    count integer NOT NULL,
    CONSTRAINT django_celery_results_chordcounter_count_check CHECK ((count >= 0))
);


ALTER TABLE public.django_celery_results_chordcounter OWNER TO postgres;

--
-- Name: django_celery_results_chordcounter_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_celery_results_chordcounter_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_celery_results_chordcounter_id_seq OWNER TO postgres;

--
-- Name: django_celery_results_chordcounter_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_celery_results_chordcounter_id_seq OWNED BY public.django_celery_results_chordcounter.id;


--
-- Name: django_celery_results_groupresult; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_celery_results_groupresult (
    id integer NOT NULL,
    group_id character varying(255) NOT NULL,
    date_created timestamp with time zone NOT NULL,
    date_done timestamp with time zone NOT NULL,
    content_type character varying(128) NOT NULL,
    content_encoding character varying(64) NOT NULL,
    result text
);


ALTER TABLE public.django_celery_results_groupresult OWNER TO postgres;

--
-- Name: django_celery_results_groupresult_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_celery_results_groupresult_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_celery_results_groupresult_id_seq OWNER TO postgres;

--
-- Name: django_celery_results_groupresult_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_celery_results_groupresult_id_seq OWNED BY public.django_celery_results_groupresult.id;


--
-- Name: django_celery_results_taskresult; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_celery_results_taskresult (
    id integer NOT NULL,
    task_id character varying(255) NOT NULL,
    status character varying(50) NOT NULL,
    content_type character varying(128) NOT NULL,
    content_encoding character varying(64) NOT NULL,
    result text,
    date_done timestamp with time zone NOT NULL,
    traceback text,
    meta text,
    task_args text,
    task_kwargs text,
    task_name character varying(255),
    worker character varying(100),
    date_created timestamp with time zone NOT NULL
);


ALTER TABLE public.django_celery_results_taskresult OWNER TO postgres;

--
-- Name: django_celery_results_taskresult_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_celery_results_taskresult_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_celery_results_taskresult_id_seq OWNER TO postgres;

--
-- Name: django_celery_results_taskresult_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_celery_results_taskresult_id_seq OWNED BY public.django_celery_results_taskresult.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_flatpage; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_flatpage (
    id integer NOT NULL,
    url character varying(100) NOT NULL,
    title character varying(200) NOT NULL,
    content text NOT NULL,
    enable_comments boolean NOT NULL,
    template_name character varying(70) NOT NULL,
    registration_required boolean NOT NULL
);


ALTER TABLE public.django_flatpage OWNER TO postgres;

--
-- Name: django_flatpage_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_flatpage_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_flatpage_id_seq OWNER TO postgres;

--
-- Name: django_flatpage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_flatpage_id_seq OWNED BY public.django_flatpage.id;


--
-- Name: django_flatpage_sites; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_flatpage_sites (
    id bigint NOT NULL,
    flatpage_id integer NOT NULL,
    site_id integer NOT NULL
);


ALTER TABLE public.django_flatpage_sites OWNER TO postgres;

--
-- Name: django_flatpage_sites_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_flatpage_sites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_flatpage_sites_id_seq OWNER TO postgres;

--
-- Name: django_flatpage_sites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_flatpage_sites_id_seq OWNED BY public.django_flatpage_sites.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: django_site; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.django_site OWNER TO postgres;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_site_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_site_id_seq OWNER TO postgres;

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_site_id_seq OWNED BY public.django_site.id;


--
-- Name: socialaccount_socialaccount; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.socialaccount_socialaccount (
    id integer NOT NULL,
    provider character varying(30) NOT NULL,
    uid character varying(191) NOT NULL,
    last_login timestamp with time zone NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    extra_data text NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.socialaccount_socialaccount OWNER TO postgres;

--
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.socialaccount_socialaccount_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialaccount_id_seq OWNER TO postgres;

--
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.socialaccount_socialaccount_id_seq OWNED BY public.socialaccount_socialaccount.id;


--
-- Name: socialaccount_socialapp; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.socialaccount_socialapp (
    id integer NOT NULL,
    provider character varying(30) NOT NULL,
    name character varying(40) NOT NULL,
    client_id character varying(191) NOT NULL,
    secret character varying(191) NOT NULL,
    key character varying(191) NOT NULL
);


ALTER TABLE public.socialaccount_socialapp OWNER TO postgres;

--
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.socialaccount_socialapp_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialapp_id_seq OWNER TO postgres;

--
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.socialaccount_socialapp_id_seq OWNED BY public.socialaccount_socialapp.id;


--
-- Name: socialaccount_socialapp_sites; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.socialaccount_socialapp_sites (
    id bigint NOT NULL,
    socialapp_id integer NOT NULL,
    site_id integer NOT NULL
);


ALTER TABLE public.socialaccount_socialapp_sites OWNER TO postgres;

--
-- Name: socialaccount_socialapp_sites_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.socialaccount_socialapp_sites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialapp_sites_id_seq OWNER TO postgres;

--
-- Name: socialaccount_socialapp_sites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.socialaccount_socialapp_sites_id_seq OWNED BY public.socialaccount_socialapp_sites.id;


--
-- Name: socialaccount_socialtoken; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.socialaccount_socialtoken (
    id integer NOT NULL,
    token text NOT NULL,
    token_secret text NOT NULL,
    expires_at timestamp with time zone,
    account_id integer NOT NULL,
    app_id integer NOT NULL
);


ALTER TABLE public.socialaccount_socialtoken OWNER TO postgres;

--
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.socialaccount_socialtoken_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialtoken_id_seq OWNER TO postgres;

--
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.socialaccount_socialtoken_id_seq OWNED BY public.socialaccount_socialtoken.id;


--
-- Name: account_emailaddress id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailaddress ALTER COLUMN id SET DEFAULT nextval('public.account_emailaddress_id_seq'::regclass);


--
-- Name: account_emailconfirmation id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailconfirmation ALTER COLUMN id SET DEFAULT nextval('public.account_emailconfirmation_id_seq'::regclass);


--
-- Name: accounts_blogger_category id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_blogger_category ALTER COLUMN id SET DEFAULT nextval('public.accounts_blogger_category_id_seq'::regclass);


--
-- Name: accounts_category id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_category ALTER COLUMN id SET DEFAULT nextval('public.accounts_category_id_seq'::regclass);


--
-- Name: accounts_interests id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_interests ALTER COLUMN id SET DEFAULT nextval('public.accounts_interests_id_seq'::regclass);


--
-- Name: accounts_reader_interests id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_reader_interests ALTER COLUMN id SET DEFAULT nextval('public.accounts_reader_interests_id_seq'::regclass);


--
-- Name: accounts_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_user ALTER COLUMN id SET DEFAULT nextval('public.accounts_user_id_seq'::regclass);


--
-- Name: accounts_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_user_groups ALTER COLUMN id SET DEFAULT nextval('public.accounts_user_groups_id_seq'::regclass);


--
-- Name: accounts_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.accounts_user_user_permissions_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: boards_board id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.boards_board ALTER COLUMN id SET DEFAULT nextval('public.boards_board_id_seq'::regclass);


--
-- Name: boards_historicalboard history_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.boards_historicalboard ALTER COLUMN history_id SET DEFAULT nextval('public.boards_historicalboard_history_id_seq'::regclass);


--
-- Name: boards_photo id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.boards_photo ALTER COLUMN id SET DEFAULT nextval('public.boards_photo_id_seq'::regclass);


--
-- Name: boards_post id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.boards_post ALTER COLUMN id SET DEFAULT nextval('public.boards_post_id_seq'::regclass);


--
-- Name: boards_topic id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.boards_topic ALTER COLUMN id SET DEFAULT nextval('public.boards_topic_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_celery_results_chordcounter id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_celery_results_chordcounter ALTER COLUMN id SET DEFAULT nextval('public.django_celery_results_chordcounter_id_seq'::regclass);


--
-- Name: django_celery_results_groupresult id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_celery_results_groupresult ALTER COLUMN id SET DEFAULT nextval('public.django_celery_results_groupresult_id_seq'::regclass);


--
-- Name: django_celery_results_taskresult id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_celery_results_taskresult ALTER COLUMN id SET DEFAULT nextval('public.django_celery_results_taskresult_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_flatpage id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_flatpage ALTER COLUMN id SET DEFAULT nextval('public.django_flatpage_id_seq'::regclass);


--
-- Name: django_flatpage_sites id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_flatpage_sites ALTER COLUMN id SET DEFAULT nextval('public.django_flatpage_sites_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: django_site id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_site ALTER COLUMN id SET DEFAULT nextval('public.django_site_id_seq'::regclass);


--
-- Name: socialaccount_socialaccount id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialaccount ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialaccount_id_seq'::regclass);


--
-- Name: socialaccount_socialapp id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialapp ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialapp_id_seq'::regclass);


--
-- Name: socialaccount_socialapp_sites id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialapp_sites_id_seq'::regclass);


--
-- Name: socialaccount_socialtoken id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialtoken ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialtoken_id_seq'::regclass);


--
-- Data for Name: account_emailaddress; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.account_emailaddress (id, email, verified, "primary", user_id) FROM stdin;
\.


--
-- Data for Name: account_emailconfirmation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.account_emailconfirmation (id, created, sent, key, email_address_id) FROM stdin;
\.


--
-- Data for Name: accounts_blogger; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accounts_blogger (user_id, birthday, country) FROM stdin;
3	1960-02-01	blogger1
4	2004-03-07	blogger2
5	2006-02-07	blogger1
6	2021-12-25	blogger4
23	2005-10-21	blogger9
24	2005-10-21	blogger9
25	2022-01-04	blohh
26	2022-01-04	blooo
29	2022-01-04	blogger00
31	2022-09-09	Blogger
32	2022-01-04	GR
\.


--
-- Data for Name: accounts_blogger_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accounts_blogger_category (id, blogger_id, category_id) FROM stdin;
103	3	1
104	4	1
105	5	1
106	6	1
107	23	4
108	24	4
109	25	6
110	25	7
111	26	1
112	26	6
113	29	4
114	29	6
115	31	1
116	31	4
117	31	5
118	32	4
119	32	7
\.


--
-- Data for Name: accounts_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accounts_category (id, category) FROM stdin;
1	AI
2	GAI
3	Technology
4	Gaming
5	Sport
6	Politics
7	Economic
\.


--
-- Data for Name: accounts_interests; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accounts_interests (id, interests) FROM stdin;
1	Programming
2	Gaming
3	Sport
4	Reading
\.


--
-- Data for Name: accounts_reader; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accounts_reader (user_id, is_adult) FROM stdin;
2	f
7	f
16	f
17	f
18	f
19	f
20	f
21	f
22	f
27	f
28	f
30	f
\.


--
-- Data for Name: accounts_reader_interests; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accounts_reader_interests (id, reader_id, interests_id) FROM stdin;
115	2	1
116	7	1
117	16	2
118	16	4
119	17	2
120	17	4
121	18	2
122	18	4
123	19	1
124	19	3
125	20	2
126	21	2
127	22	2
128	22	3
129	27	3
130	28	1
131	28	4
132	30	2
133	30	4
\.


--
-- Data for Name: accounts_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accounts_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined, is_blogger, is_reader, file) FROM stdin;
1	pbkdf2_sha256$260000$GFyaoOOelnKX0q8mR1wnD4$8SAL6YZ2MXRMzWZMMpicw/uwudg8N3lgTDTQFbBUz1A=	2022-01-24 21:08:32.046+01	t	admin	admin	admin	dianamatkava7@gmail.com	t	t	2021-12-25 10:26:38+01	t	f	avatar/person-icon1_6xZhc2F.png
2	pbkdf2_sha256$320000$NKC9yljKfTsOe12c7rv7Iu$BUSzJ4640uKIT6xWHB5s00VJeM0lze/SeWo2cg/W6lg=	2021-12-25 10:34:06.629+01	f	blogger	reader	reader		f	t	2021-12-25 10:34:06.072+01	f	t	
3	pbkdf2_sha256$260000$k8fK0A1eh4ziqjgMKnhOJA$9QXPuDb5/NmvfvPPXtUyJDVhu+M+dZ3yMYJ0U8qqEcc=	2022-01-04 13:46:50.59+01	f	blogger1	q	q	dianamatkava@gmail.com	f	t	2021-12-25 10:37:33.917+01	t	f	
4	pbkdf2_sha256$320000$9c2sRoSy2Wiu5H5BWymzwu$DIrfm4Yx8jCBXvRSlUQJmCc6S+lFv8FqMNx/h9Ay1pA=	2021-12-25 10:38:02.018+01	f	blogger2				f	t	2021-12-25 10:38:01.206+01	t	f	
5	pbkdf2_sha256$260000$4AhGZsDFjUokKP9lhq1paP$aUyKFfwuIuTi4DbRj6fechpe3hOZaY5PmZL0xIc6aE0=	2022-01-04 12:09:44.911+01	f	blogger3			dianamatkava7@gmail.com	f	t	2021-12-25 10:39:43.044+01	t	f	avatar/person-icon1_CwM9DJv.png
6	pbkdf2_sha256$320000$EcC5XVGCga8MPGHkeygQR1$0FovlcD1fwQpP1FJVnjeoDIl0XbP1uebTiiSr81JGPw=	2021-12-25 20:58:39.539+01	f	blogger4	blogger4	blogger4	blogger4@blogger4.com	f	t	2021-12-25 10:40:05.717+01	t	f	
7	pbkdf2_sha256$260000$OwD60FVlhtDZ8NCpRdgVck$S5X2mWKryq3fROzgyxOqHoJGUPK8Ms0YhTm47dfDMKY=	2022-01-04 14:16:21.245+01	f	reader1	reader1	reader1	reader1@gmail.com	f	t	2021-12-25 10:43:40.478+01	f	t	
8	!dxSXca638rKbY9iFf9gzW9se8bMxrx8AQ4QeZh1g	2021-12-26 11:35:16+01	f	user2				f	t	2021-12-26 11:04:52+01	f	f	
13	!8tLwhehSsaBblGhDRZ121dtb4uny2c1aZ8NQhz5H	2022-01-04 15:37:29.899+01	f	dia	dia	na	dianamatkava@gmail.com	f	t	2021-12-27 17:34:34.111+01	f	f	
14	!7Yud6HMF1oSTMF2wizcTPpdMD5Icoi0u3FYfKG7D	2022-08-28 22:07:55.733+02	t	dianaGera			dianamatkava@gmail.com	t	t	2021-12-27 17:35:19+01	f	f	avatar/person-icon.png
15	AjEs3fiFuNPWPaUfVpRgeNaL3kNJ4VWhk72E5e9AVsqTpL0nhI	\N	f	user_AwoYKaLsUk			user_AwoYKaLsUk@example.com	f	t	2021-12-28 14:52:10.212+01	f	f	
16	pbkdf2_sha256$260000$yieGvxJJZe9EsKjyCV6leK$X19+m13qwS7axz6F1TW+o/H1pPdwzWJp3j9NxBMD2NQ=	\N	f	reader2				f	t	2022-01-04 12:11:55.17+01	f	t	
17	pbkdf2_sha256$260000$kSp1Xkn7vkldcWDxt0X7im$KUm2ovwEqSjdaC5y3IWH+1ghJSdcV6Jo831SzsCHSEg=	\N	f	reader3				f	t	2022-01-04 12:13:21.789+01	f	t	
18	pbkdf2_sha256$260000$JBPBvi0wQJEIAjt0E6UOl6$hZy8hNw7NSMIXNEGqeFpJL6Pi74ZavnDw2SncjGEyY8=	\N	f	reader4				f	t	2022-01-04 12:21:22.286+01	f	t	
19	pbkdf2_sha256$260000$knZLPDZ0QNHcwvdlFfM3my$JsZo5BXw5Zbhhet1R2IQg6OYJLLdGzaqYmI9P0trIu0=	\N	f	reader5				f	t	2022-01-04 12:28:14.044+01	f	t	
20	pbkdf2_sha256$260000$iunnmNleVW7TrLczA9r2gV$89nExpM7XvAMZlJO+oPDu/CJNGBgSXjuizZijAylQgU=	\N	f	reader6				f	t	2022-01-04 12:33:28.734+01	f	t	
21	pbkdf2_sha256$260000$Eaudd60cMiZryyb9RnDNI4$Rw19Ehifp2t7NJZO4iDCybfrhGxHfIssvCHemJprbaA=	\N	f	reader7				f	t	2022-01-04 12:35:37.367+01	f	t	
22	pbkdf2_sha256$260000$a3OrDjKfW8WXZOBoIoyW2j$tX7DD9u4JNrzVEQr4DH4tUdiYzS8rlBbdC2afjTXUXg=	\N	f	reader8				f	t	2022-01-04 12:37:30.995+01	f	t	
23	pbkdf2_sha256$260000$7B0ADcJ2S3H3dsEedXjj0L$OSYxU931dTO7INI+uTluBItsh2Zstc5vIica1M6jOqM=	\N	f	blogger9				f	t	2022-01-04 12:39:23.077+01	t	f	
24	pbkdf2_sha256$260000$qh5oxS201zvsmNDz4nMpcW$7wfLlS1Z4KkleHNF2gBgKhes7ZHxBjVbXkt+7FY5L9I=	\N	f	blogger8				f	t	2022-01-04 12:40:43.574+01	t	f	
25	pbkdf2_sha256$260000$xU7zPXCntZEl8VH2ul5SAR$BgrvPrUBuXoA6zCkGbCElMs7l3orn/Nr3Z/vCuqd170=	2022-01-04 12:57:10.495+01	f	blohh				f	t	2022-01-04 12:57:09.514+01	t	f	
26	pbkdf2_sha256$260000$KjP9tLrqAP5NPQWE5t5x2v$/kusDSjTUG37Wt/b1VPzhlKUpdYgspua6uZQ0p+F1HI=	2022-01-04 12:57:56.56+01	f	blooo				f	t	2022-01-04 12:57:55.51+01	t	f	
27	pbkdf2_sha256$260000$GxG8WKRnQMIckTL8L3tya3$mlUs1QlLWB6+DmQpc+RiQVMprsiS1IiTUlbxQgY4Hdo=	2022-01-04 13:02:30.001+01	f	reader77				f	t	2022-01-04 13:02:29.223+01	f	t	
28	pbkdf2_sha256$260000$9lVH3zvVT7gTWa4MFsAWYs$wZEr8eojqTZ4rv4RHQp6zX7/GjC4WxHSiqU72zsRU6Y=	2022-01-04 13:11:12.219+01	f	reader111			dianamatkava7@gmail.com	f	t	2022-01-04 13:11:11.531+01	f	t	
29	pbkdf2_sha256$260000$nH46pIip6rXMUUYIWTm23x$zR7NLWRSzeto7gFEn7NDXJQbfSm/9BE6M7lZHWulr7s=	2022-01-04 13:14:07.87+01	f	blogger00			dianamatkava7@gmail.com	f	t	2022-01-04 13:14:06.617+01	t	f	
30	pbkdf2_sha256$260000$WdY6nV4CfxU42Hdacw074u$QogH2KycmcmIQXCXfe+VPhFi40sibhS9D+aN+vl6moc=	2022-01-04 13:47:41.754+01	f	readef			readef@gmail.com	f	t	2022-01-04 13:47:40.889+01	f	t	
31	pbkdf2_sha256$260000$uP1KL0WakVLUOFoWxpSc20$k0EZ0XzUdYR9TmY+4fu1q5PcpP8wR/w///cVWy5CpAI=	2022-01-04 14:02:10.964+01	f	Blogger1			dianamatkava7@gmail.com	f	t	2022-01-04 14:02:10.184+01	t	f	avatar/person-icon1_bMjVM86.png
32	pbkdf2_sha256$260000$3iXvYiswBd0pDpS7MwxT4f$pVdJRdrcoiu0dUnXP+uvxxcit96y3uRzHPPSF0eKioE=	2022-01-04 15:55:15.196+01	f	blog				f	t	2022-01-04 15:04:49.119+01	t	f	
\.


--
-- Data for Name: accounts_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accounts_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: accounts_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accounts_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add content type	4	add_contenttype
14	Can change content type	4	change_contenttype
15	Can delete content type	4	delete_contenttype
16	Can view content type	4	view_contenttype
17	Can add session	5	add_session
18	Can change session	5	change_session
19	Can delete session	5	delete_session
20	Can view session	5	view_session
21	Can add task result	6	add_taskresult
22	Can change task result	6	change_taskresult
23	Can delete task result	6	delete_taskresult
24	Can view task result	6	view_taskresult
25	Can add chord counter	7	add_chordcounter
26	Can change chord counter	7	change_chordcounter
27	Can delete chord counter	7	delete_chordcounter
28	Can view chord counter	7	view_chordcounter
29	Can add group result	8	add_groupresult
30	Can change group result	8	change_groupresult
31	Can delete group result	8	delete_groupresult
32	Can view group result	8	view_groupresult
33	Can add site	9	add_site
34	Can change site	9	change_site
35	Can delete site	9	delete_site
36	Can view site	9	view_site
37	Can add email address	10	add_emailaddress
38	Can change email address	10	change_emailaddress
39	Can delete email address	10	delete_emailaddress
40	Can view email address	10	view_emailaddress
41	Can add email confirmation	11	add_emailconfirmation
42	Can change email confirmation	11	change_emailconfirmation
43	Can delete email confirmation	11	delete_emailconfirmation
44	Can view email confirmation	11	view_emailconfirmation
45	Can add social account	12	add_socialaccount
46	Can change social account	12	change_socialaccount
47	Can delete social account	12	delete_socialaccount
48	Can view social account	12	view_socialaccount
49	Can add social application	13	add_socialapp
50	Can change social application	13	change_socialapp
51	Can delete social application	13	delete_socialapp
52	Can view social application	13	view_socialapp
53	Can add social application token	14	add_socialtoken
54	Can change social application token	14	change_socialtoken
55	Can delete social application token	14	delete_socialtoken
56	Can view social application token	14	view_socialtoken
57	Can add flat page	15	add_flatpage
58	Can change flat page	15	change_flatpage
59	Can delete flat page	15	delete_flatpage
60	Can view flat page	15	view_flatpage
61	Can add user	16	add_user
62	Can change user	16	change_user
63	Can delete user	16	delete_user
64	Can view user	16	view_user
65	Can add category	17	add_category
66	Can change category	17	change_category
67	Can delete category	17	delete_category
68	Can view category	17	view_category
69	Can add interests	18	add_interests
70	Can change interests	18	change_interests
71	Can delete interests	18	delete_interests
72	Can view interests	18	view_interests
73	Can add reader	19	add_reader
74	Can change reader	19	change_reader
75	Can delete reader	19	delete_reader
76	Can view reader	19	view_reader
77	Can add blogger	20	add_blogger
78	Can change blogger	20	change_blogger
79	Can delete blogger	20	delete_blogger
80	Can view blogger	20	view_blogger
81	Can add board	21	add_board
82	Can change board	21	change_board
83	Can delete board	21	delete_board
84	Can view board	21	view_board
85	Can add topic	22	add_topic
86	Can change topic	22	change_topic
87	Can delete topic	22	delete_topic
88	Can view topic	22	view_topic
89	Can add post	23	add_post
90	Can change post	23	change_post
91	Can delete post	23	delete_post
92	Can view post	23	view_post
93	Can add historical board	24	add_historicalboard
94	Can change historical board	24	change_historicalboard
95	Can delete historical board	24	delete_historicalboard
96	Can view historical board	24	view_historicalboard
97	Can add photo	25	add_photo
98	Can change photo	25	change_photo
99	Can delete photo	25	delete_photo
100	Can view photo	25	view_photo
\.


--
-- Data for Name: boards_board; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.boards_board (id, name, description, is_active) FROM stdin;
3	Board from shell #1	Some description for Bo	t
4	Board from shell #2	Some description for Board	t
5	Board from shell #3	Some description for Board #{i}	t
6	Board from shell #4	Some description for Board #{i}	t
7	Board from shell #5	Some description for Board #{i}	t
8	Board from shell #6	Some description for Board #{i}	t
9	Board from shell #7	Some description for Board #{i}	t
10	Board from shell #8	Some description for Board #{i}	t
11	Board from shell #9	Some description for Board #{i}	t
13	Board from shell #11	Some description for Board #{i}1v	t
14	Board from shell #12	Some description for Board #{i}	t
15	Board from shell #13	Some description for Board #{i}	t
16	Board from shell #14	Some description for Board #{i}	t
17	Board from shell #15	Some description for Board #{i}	t
18	Board from shell #16	Some description for Board #{i}	t
19	Board from shell #17	Some description for Board #{i}	t
20	Board from shell #18	Some description for Board #	t
40	Board from shell #19	Some description	t
41	Board from shell #20	Some description	t
42	Board from shell #21	Some description	t
43	Board from shell #22	Some description	t
44	Board from shell #23	Some description	t
45	Board from shell #24	Some description	t
46	Board from shell #25	Some description	t
47	Board from shell #26	Some description	t
48	Board from shell #27	Some description	t
49	Board from shell #28	Some description	t
50	Board from shell #29	Some description	t
51	Board from shell #30	Some description	t
52	Board from shell #31	Some description	t
53	Board from shell #32	Some description	t
54	Board from shell #33	Some description	t
55	Board from shell #34	Some description	t
56	Board from shell #35	Some description	t
57	Board from shell #36	Some description	t
58	Board from shell #37	Some description	t
60	rtrtrtrtr	rt	t
61	123	123	t
62	dd	dd	t
63	3333333333333	3	t
\.


--
-- Data for Name: boards_historicalboard; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.boards_historicalboard (id, name, description, history_id, history_date, history_change_reason, history_type, history_user_id, is_active) FROM stdin;
\.


--
-- Data for Name: boards_photo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.boards_photo (id, title, uploaded_at, file, topic_id) FROM stdin;
1	person-icon1.png	2021-12-29 15:27:50.262+01	photos/person-icon1.png	109
2	person-icon.png	2021-12-29 15:27:50.265+01	photos/person-icon.png	109
3	person-icon1.png	2022-01-04 13:18:12.296+01	photos/person-icon1_3CBLRp3.png	110
4	person-icon.png	2022-01-04 13:18:12.308+01	photos/person-icon_gFFv90u.png	110
5	me.png	2022-01-04 13:18:12.317+01	photos/me.png	110
6	How-To-Determine-Link.gif	2022-01-04 13:18:12.323+01	photos/How-To-Determine-Link.gif	110
7	background.jpg	2022-01-04 13:18:12.329+01	photos/background.jpg	110
8	person-icon1.png	2022-01-04 13:18:49.022+01	photos/person-icon1_IbsKK0y.png	110
9	person-icon.png	2022-01-04 13:18:49.03+01	photos/person-icon_TMv2qo9.png	110
10	me.png	2022-01-04 13:18:49.037+01	photos/me_N743Adb.png	110
11	How-To-Determine-Link.gif	2022-01-04 13:18:49.046+01	photos/How-To-Determine-Link_vG7iGs7.gif	110
12	background.jpg	2022-01-04 13:18:49.054+01	photos/background_t67Efts.jpg	110
13	me.png	2022-01-04 13:20:29.556+01	photos/me_eHHNXjB.png	111
14	How-To-Determine-Link.gif	2022-01-04 13:20:29.565+01	photos/How-To-Determine-Link_rHKKlX6.gif	111
15	background.jpg	2022-01-04 13:20:29.573+01	photos/background_L78Pvb1.jpg	111
16	stepik-certificate.pdf	2022-01-04 13:23:14.246+01	photos/stepik-certificate_5Jcxsb1.pdf	112
17	How-To-Determine-Link.gif	2022-01-04 13:23:14.259+01	photos/How-To-Determine-Link_FCBtKbU.gif	112
18	stepik-certificate.pdf	2022-01-04 14:11:39.485+01	photos/stepik-certificate_OHS8UVf.pdf	113
19	How-To-Determine-Link.gif	2022-01-04 14:11:39.509+01	photos/How-To-Determine-Link_w3QbfMi.gif	113
20	background.jpg	2022-01-04 14:11:39.521+01	photos/background_7cLCSix.jpg	113
21	How-To-Determine-Link.gif	2022-01-04 17:22:25.708+01	photos/How-To-Determine-Link_cDyHjeC.gif	118
22	stepik-certificate.pdf	2022-01-04 21:42:52.805+01	photos/stepik-certificate_OEt6OCG.pdf	119
23	Yoshida_Hiroshi_artwork_Japanese_painting_mountains_Grand_Canyon-16165.jpg	2022-01-04 22:05:05.421+01	photos/Yoshida_Hiroshi_artwork_Japanese_painting_mountains_Grand_Canyon-16165.jpg	97
24	unnamed.jpg	2022-01-04 22:05:05.431+01	photos/unnamed.jpg	97
25	shar_setka_relef_136928_1280x720.jpg	2022-01-04 22:05:05.438+01	photos/shar_setka_relef_136928_1280x720.jpg	97
26	NeonShot_01-1 (copy).png	2022-01-04 22:05:05.448+01	photos/NeonShot_01-1_copy.png	97
27	NeonShot_01-1.png	2022-01-04 22:05:05.488+01	photos/NeonShot_01-1.png	97
28	kraska_holst_relef_136796_3840x2160.jpg	2022-01-04 22:05:05.523+01	photos/kraska_holst_relef_136796_3840x2160.jpg	97
29	Eugene_VON_GUΓö£├½Rard_-_View_of_the_Gippsland_Alps,_from_Bushy_Park_on_the_River_Avon_-_Google_Art_Project.jpg	2022-01-04 22:05:05.57+01	photos/Eugene_VON_GUΓö£├½Rard_-_View_of_the_Gippsland_Alps_from_Bushy_Park_on_the_River_Avon_kv9K7CU.jpg	97
30	eh_lighthouse_hill_1927_lac_216x300mm.jpg	2022-01-04 22:05:05.601+01	photos/eh_lighthouse_hill_1927_lac_216x300mm.jpg	97
31	egs-talesoftheneonsea-palmpioneer-g1c-00-1920x1080-b5dc9021e8d6 (copy).jpg	2022-01-04 22:05:05.64+01	photos/egs-talesoftheneonsea-palmpioneer-g1c-00-1920x1080-b5dc9021e8d6_copy.jpg	97
32	egs-talesoftheneonsea-palmpioneer-g1c-00-1920x1080-b5dc9021e8d6.jpg	2022-01-04 22:05:05.667+01	photos/egs-talesoftheneonsea-palmpioneer-g1c-00-1920x1080-b5dc9021e8d6.jpg	97
33	city_travel_vegas_usa_tourism_colors_skyline_architecture-833185.jpg	2022-01-04 22:05:05.714+01	photos/city_travel_vegas_usa_tourism_colors_skyline_architecture-833185.jpg	97
34	artwork_digital_night_neon_Retrowave_cyberpunk_car_stores-1903795.jpg	2022-01-04 22:05:05.748+01	photos/artwork_digital_night_neon_Retrowave_cyberpunk_car_stores-1903795.jpg	97
35	artwork_digital_art_Futurism_car_neon-1980461.jpg	2022-01-04 22:05:05.783+01	photos/artwork_digital_art_Futurism_car_neon-1980461.jpg	97
36	artwork_digital_art_cyber_city-1991681.jpg	2022-01-04 22:05:05.802+01	photos/artwork_digital_art_cyber_city-1991681.jpg	97
37	artwork_city_building_street_Nike_signboard_night_stores-1922791.jpg	2022-01-04 22:05:05.824+01	photos/artwork_city_building_street_Nike_signboard_night_stores-1922791.jpg	97
38	3871x2879_px_abstract_Texture-782891.jpg	2022-01-04 22:05:05.842+01	photos/3871x2879_px_abstract_Texture-782891.jpg	97
39	3440x1440_px_Classic_Art_Dresden_ultrawide-1224577.jpg	2022-01-04 22:05:05.862+01	photos/3440x1440_px_Classic_Art_Dresden_ultrawide-1224577.jpg	97
40	1920x1200_px_Asia_Asian_building_city_Hong_Kong_night_sky-988329.jpg	2022-01-04 22:05:05.876+01	photos/1920x1200_px_Asia_Asian_building_city_Hong_Kong_night_sky-988329.jpg	97
41	5f7f9370df5133.31977834.jpg	2022-01-04 22:05:05.891+01	photos/5f7f9370df5133.31977834.jpg	97
42	0ce1798a291d43ebadfb4bc4a35fbddc.jpg	2022-01-04 22:05:05.899+01	photos/0ce1798a291d43ebadfb4bc4a35fbddc.jpg	97
43	Yoshida_Hiroshi_artwork_Japanese_painting_mountains_Grand_Canyon-16165.jpg	2022-01-04 22:24:28.822+01	photos/Yoshida_Hiroshi_artwork_Japanese_painting_mountains_Grand_Canyon-16165_T5IWziT.jpg	130
44	unnamed.jpg	2022-01-04 22:24:28.833+01	photos/unnamed_DB8eNPh.jpg	130
45	shar_setka_relef_136928_1280x720.jpg	2022-01-04 22:24:28.842+01	photos/shar_setka_relef_136928_1280x720_YYxSVat.jpg	130
46	NeonShot_01-1 (copy).png	2022-01-04 22:24:28.851+01	photos/NeonShot_01-1_copy_bZHALAO.png	130
47	NeonShot_01-1.png	2022-01-04 22:24:28.86+01	photos/NeonShot_01-1_4lKKfFc.png	130
48	kraska_holst_relef_136796_3840x2160.jpg	2022-01-04 22:24:28.869+01	photos/kraska_holst_relef_136796_3840x2160_suLXI2p.jpg	130
49	Eugene_VON_GUΓö£├½Rard_-_View_of_the_Gippsland_Alps,_from_Bushy_Park_on_the_River_Avon_-_Google_Art_Project.jpg	2022-01-04 22:24:28.878+01	photos/Eugene_VON_GUΓö£├½Rard_-_View_of_the_Gippsland_Alps_from_Bushy_Park_on_the_River_Avon_E1PnZdf.jpg	130
50	eh_lighthouse_hill_1927_lac_216x300mm.jpg	2022-01-04 22:24:28.887+01	photos/eh_lighthouse_hill_1927_lac_216x300mm_dOSyVtd.jpg	130
51	egs-talesoftheneonsea-palmpioneer-g1c-00-1920x1080-b5dc9021e8d6 (copy).jpg	2022-01-04 22:24:28.896+01	photos/egs-talesoftheneonsea-palmpioneer-g1c-00-1920x1080-b5dc9021e8d6_copy_3Kl9Vgd.jpg	130
52	egs-talesoftheneonsea-palmpioneer-g1c-00-1920x1080-b5dc9021e8d6.jpg	2022-01-04 22:24:28.905+01	photos/egs-talesoftheneonsea-palmpioneer-g1c-00-1920x1080-b5dc9021e8d6_5NkbrOF.jpg	130
53	city_travel_vegas_usa_tourism_colors_skyline_architecture-833185.jpg	2022-01-04 22:24:28.914+01	photos/city_travel_vegas_usa_tourism_colors_skyline_architecture-833185_G9bMT4c.jpg	130
54	artwork_digital_night_neon_Retrowave_cyberpunk_car_stores-1903795.jpg	2022-01-04 22:24:28.923+01	photos/artwork_digital_night_neon_Retrowave_cyberpunk_car_stores-1903795_f3585Hf.jpg	130
55	artwork_digital_art_Futurism_car_neon-1980461.jpg	2022-01-04 22:24:28.932+01	photos/artwork_digital_art_Futurism_car_neon-1980461_GtOUTo7.jpg	130
56	artwork_digital_art_cyber_city-1991681.jpg	2022-01-04 22:24:28.941+01	photos/artwork_digital_art_cyber_city-1991681_2SrNR01.jpg	130
57	artwork_city_building_street_Nike_signboard_night_stores-1922791.jpg	2022-01-04 22:24:28.95+01	photos/artwork_city_building_street_Nike_signboard_night_stores-1922791_DvFKGz0.jpg	130
58	3871x2879_px_abstract_Texture-782891.jpg	2022-01-04 22:24:28.959+01	photos/3871x2879_px_abstract_Texture-782891_pXHRZOg.jpg	130
59	3440x1440_px_Classic_Art_Dresden_ultrawide-1224577.jpg	2022-01-04 22:24:28.968+01	photos/3440x1440_px_Classic_Art_Dresden_ultrawide-1224577_I3AcNuq.jpg	130
60	1920x1200_px_Asia_Asian_building_city_Hong_Kong_night_sky-988329.jpg	2022-01-04 22:24:28.976+01	photos/1920x1200_px_Asia_Asian_building_city_Hong_Kong_night_sky-988329_GQwOvpt.jpg	130
61	5f7f9370df5133.31977834.jpg	2022-01-04 22:24:28.985+01	photos/5f7f9370df5133.31977834_RPU60aW.jpg	130
62	0ce1798a291d43ebadfb4bc4a35fbddc.jpg	2022-01-04 22:24:28.994+01	photos/0ce1798a291d43ebadfb4bc4a35fbddc_CPpo07f.jpg	130
63	Yoshida_Hiroshi_artwork_Japanese_painting_mountains_Grand_Canyon-16165.jpg	2022-01-04 22:24:51.257+01	photos/Yoshida_Hiroshi_artwork_Japanese_painting_mountains_Grand_Canyon-16165_mhS2srB.jpg	131
64	unnamed.jpg	2022-01-04 22:24:51.267+01	photos/unnamed_fpe9WQv.jpg	131
65	shar_setka_relef_136928_1280x720.jpg	2022-01-04 22:24:51.277+01	photos/shar_setka_relef_136928_1280x720_8cK1E44.jpg	131
66	NeonShot_01-1 (copy).png	2022-01-04 22:24:51.287+01	photos/NeonShot_01-1_copy_hQJHR2Q.png	131
67	NeonShot_01-1.png	2022-01-04 22:24:51.298+01	photos/NeonShot_01-1_I8bTDky.png	131
68	kraska_holst_relef_136796_3840x2160.jpg	2022-01-04 22:24:51.307+01	photos/kraska_holst_relef_136796_3840x2160_CEHQmsN.jpg	131
69	Eugene_VON_GUΓö£├½Rard_-_View_of_the_Gippsland_Alps,_from_Bushy_Park_on_the_River_Avon_-_Google_Art_Project.jpg	2022-01-04 22:24:51.316+01	photos/Eugene_VON_GUΓö£├½Rard_-_View_of_the_Gippsland_Alps_from_Bushy_Park_on_the_River_Avon_SvPXRA6.jpg	131
70	eh_lighthouse_hill_1927_lac_216x300mm.jpg	2022-01-04 22:24:51.325+01	photos/eh_lighthouse_hill_1927_lac_216x300mm_0WFgdEf.jpg	131
71	egs-talesoftheneonsea-palmpioneer-g1c-00-1920x1080-b5dc9021e8d6 (copy).jpg	2022-01-04 22:24:51.334+01	photos/egs-talesoftheneonsea-palmpioneer-g1c-00-1920x1080-b5dc9021e8d6_copy_RYmA9u8.jpg	131
72	egs-talesoftheneonsea-palmpioneer-g1c-00-1920x1080-b5dc9021e8d6.jpg	2022-01-04 22:24:51.343+01	photos/egs-talesoftheneonsea-palmpioneer-g1c-00-1920x1080-b5dc9021e8d6_Nv2hHqW.jpg	131
73	city_travel_vegas_usa_tourism_colors_skyline_architecture-833185.jpg	2022-01-04 22:24:51.392+01	photos/city_travel_vegas_usa_tourism_colors_skyline_architecture-833185_ZXZJrxV.jpg	131
74	artwork_digital_night_neon_Retrowave_cyberpunk_car_stores-1903795.jpg	2022-01-04 22:24:51.403+01	photos/artwork_digital_night_neon_Retrowave_cyberpunk_car_stores-1903795_0yJzO0v.jpg	131
75	artwork_digital_art_Futurism_car_neon-1980461.jpg	2022-01-04 22:24:51.413+01	photos/artwork_digital_art_Futurism_car_neon-1980461_1FcUuJ3.jpg	131
76	artwork_digital_art_cyber_city-1991681.jpg	2022-01-04 22:24:51.423+01	photos/artwork_digital_art_cyber_city-1991681_GLTIv7z.jpg	131
77	Eugene_VON_GUΓö£├½Rard_-_View_of_the_Gippsland_Alps,_from_Bushy_Park_on_the_River_Avon_-_Google_Art_Project.jpg	2022-01-04 22:25:22.09+01	photos/Eugene_VON_GUΓö£├½Rard_-_View_of_the_Gippsland_Alps_from_Bushy_Park_on_the_River_Avon_22KovNl.jpg	132
78	egs-talesoftheneonsea-palmpioneer-g1c-00-1920x1080-b5dc9021e8d6 (copy).jpg	2022-01-04 22:25:22.1+01	photos/egs-talesoftheneonsea-palmpioneer-g1c-00-1920x1080-b5dc9021e8d6_copy_BWoNQt9.jpg	132
79	city_travel_vegas_usa_tourism_colors_skyline_architecture-833185.jpg	2022-01-04 22:25:22.11+01	photos/city_travel_vegas_usa_tourism_colors_skyline_architecture-833185_Dl2tzws.jpg	132
80	artwork_digital_night_neon_Retrowave_cyberpunk_car_stores-1903795.jpg	2022-01-04 22:25:22.122+01	photos/artwork_digital_night_neon_Retrowave_cyberpunk_car_stores-1903795_Lk1okP9.jpg	132
81	artwork_digital_art_Futurism_car_neon-1980461.jpg	2022-01-04 22:25:22.132+01	photos/artwork_digital_art_Futurism_car_neon-1980461_wJgL1KZ.jpg	132
82	artwork_city_building_street_Nike_signboard_night_stores-1922791.jpg	2022-01-04 22:25:22.143+01	photos/artwork_city_building_street_Nike_signboard_night_stores-1922791_tW7C8Mn.jpg	132
83	3871x2879_px_abstract_Texture-782891.jpg	2022-01-04 22:25:22.153+01	photos/3871x2879_px_abstract_Texture-782891_tch4sno.jpg	132
84	3440x1440_px_Classic_Art_Dresden_ultrawide-1224577.jpg	2022-01-04 22:25:22.164+01	photos/3440x1440_px_Classic_Art_Dresden_ultrawide-1224577_5vqcwkj.jpg	132
85	1920x1200_px_Asia_Asian_building_city_Hong_Kong_night_sky-988329.jpg	2022-01-04 22:25:22.174+01	photos/1920x1200_px_Asia_Asian_building_city_Hong_Kong_night_sky-988329_jOa8nDA.jpg	132
96	1920x1080_px_abstract_Paint_Splatter-776403.jpg	2022-01-04 22:58:50.59+01	photos/1920x1080_px_abstract_Paint_Splatter-776403.jpg	134
97	2000x1442_px_abstract_artwork_geometry_Oil_Painting_painting_Still_life_Surreal-1480977.jpg	2022-01-04 22:58:50.608+01	photos/2000x1442_px_abstract_artwork_geometry_Oil_Painting_painting_Still_life_Surreal-1480977.jpg	134
98	2014_NYR_02822_0076_000(frederick_judd_waugh_freshening_breeze051212).jpg	2022-01-04 22:58:50.63+01	photos/2014_NYR_02822_0076_000frederick_judd_waugh_freshening_breeze051212.jpg	134
99	2560x1600_px_artwork_Hokusai_Japan_sea_The_Great_Wave_Off_Kanagawa_Traditional_Artwork_Wood_block-1394035.jpg	2022-01-04 22:58:50.643+01	photos/2560x1600_px_artwork_Hokusai_Japan_sea_The_Great_Wave_Off_Kanagawa_Traditional_Ar_yTg42Nq.jpg	134
100	4881abcb58c85efee43283f3437d031a.jpg	2022-01-04 22:58:50.65+01	photos/4881abcb58c85efee43283f3437d031a.jpg	134
101	digital_art_artwork_animals_panthers_red_pink_stairs_simple_background-1956183.jpg	2022-01-04 22:58:50.657+01	photos/digital_art_artwork_animals_panthers_red_pink_stairs_simple_background-1956183.jpg	134
102	egs-talesoftheneonsea-palmpioneer-g1c-00-1920x1080-b5dc9021e8d6.jpg	2022-01-04 22:58:50.663+01	photos/egs-talesoftheneonsea-palmpioneer-g1c-00-1920x1080-b5dc9021e8d6_akjVi3R.jpg	134
103	eh_lighthouse_hill_1927_lac_216x300mm.jpg	2022-01-04 22:58:50.669+01	photos/eh_lighthouse_hill_1927_lac_216x300mm_cJmjtrv.jpg	134
104	Eugene_von_Guerard_-_Bush_fire_between_Mount_Elephant_and_Timboon,_1857.jpg	2022-01-04 22:58:50.676+01	photos/Eugene_von_Guerard_-_Bush_fire_between_Mount_Elephant_and_Timboon_1857.jpg	134
105	kraska_piatna_akril_120559_3840x2160.jpg	2022-01-04 22:58:50.681+01	photos/kraska_piatna_akril_120559_3840x2160.jpg	134
106	LoFi_cafe_Asian_digital_art_artwork_digital_coffee-1973715.jpg	2022-01-04 22:58:50.687+01	photos/LoFi_cafe_Asian_digital_art_artwork_digital_coffee-1973715.jpg	134
107	Madame_Gautreau_Drinking_a_Toast.jpg	2022-01-04 22:58:50.691+01	photos/Madame_Gautreau_Drinking_a_Toast.jpg	134
108	NeonShot_01-1.png	2022-01-04 22:58:50.696+01	photos/NeonShot_01-1_SMlqJps.png	134
109	nochnoj_gorod_vyveski_neon_139551_1280x720.jpg	2022-01-04 22:58:50.701+01	photos/nochnoj_gorod_vyveski_neon_139551_1280x720.jpg	134
110	vinsent_van_gog_valuny_i_dub_pejzazh_kholst_maslo_117753_3840x2160.jpg	2022-01-04 22:58:50.706+01	photos/vinsent_van_gog_valuny_i_dub_pejzazh_kholst_maslo_117753_3840x2160.jpg	134
111	waugh-cls-1.jpg	2022-01-04 22:58:50.711+01	photos/waugh-cls-1.jpg	134
112	Yoshida_Hiroshi_artwork_Japanese_painting_mountains_clouds-16156.jpg	2022-01-04 22:58:50.716+01	photos/Yoshida_Hiroshi_artwork_Japanese_painting_mountains_clouds-16156.jpg	134
113	Yoshida_Hiroshi_artwork_Japanese_painting_mountains_Grand_Canyon-16165.jpg	2022-01-04 22:58:50.721+01	photos/Yoshida_Hiroshi_artwork_Japanese_painting_mountains_Grand_Canyon-16165_u8UBMg4.jpg	134
114	Yoshida_Hiroshi_artwork_Japanese_painting_mountains_water-16159.jpg	2022-01-04 22:58:50.727+01	photos/Yoshida_Hiroshi_artwork_Japanese_painting_mountains_water-16159.jpg	134
115	Yoshida_Hiroshi_artwork_Japanese_painting_mountains_water_boat-16171.jpg	2022-01-04 22:58:50.732+01	photos/Yoshida_Hiroshi_artwork_Japanese_painting_mountains_water_boat-16171.jpg	134
\.


--
-- Data for Name: boards_post; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.boards_post (id, message, created_at, updated_at, created_by_id, topic_id, updated_by_id) FROM stdin;
\.


--
-- Data for Name: boards_topic; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.boards_topic (id, subject, last_updated, views, board_id, starter_id) FROM stdin;
11	Subject for Board from shell #1	2021-12-25 15:42:28.838+01	0	3	3
12	Subject for Board from shell #1	2021-12-25 15:42:29.079+01	0	3	4
13	Subject for Board from shell #1	2021-12-25 15:42:29.319+01	1	3	5
14	Subject for Board from shell #1	2021-12-27 08:11:58.329+01	3	3	6
15	Subject for Board from shell #2	2021-12-25 15:42:29.756+01	0	4	3
16	Subject for Board from shell #2	2021-12-25 15:42:29.985+01	1	4	4
17	Subject for Board from shell #2	2021-12-25 15:42:30.215+01	0	4	5
18	Subject for Board from shell #2	2021-12-25 15:42:30.455+01	1	4	6
19	Subject for Board from shell #3	2021-12-25 15:42:30.674+01	0	5	3
20	Subject for Board from shell #3	2021-12-25 15:42:30.903+01	0	5	4
21	Subject for Board from shell #3	2021-12-25 15:42:31.118+01	0	5	5
22	Subject for Board from shell #3	2021-12-25 15:42:31.332+01	0	5	6
23	Subject for Board from shell #4	2021-12-25 15:42:31.486+01	0	6	3
24	Subject for Board from shell #4	2021-12-25 15:42:31.651+01	0	6	4
25	Subject for Board from shell #4	2021-12-25 15:42:31.817+01	0	6	5
26	Subject for Board from shell #4	2021-12-25 15:42:31.971+01	0	6	6
27	Subject for Board from shell #5	2021-12-25 15:42:32.174+01	0	7	3
28	Subject for Board from shell #5	2021-12-25 15:42:32.34+01	0	7	4
29	Subject for Board from shell #5	2021-12-25 15:42:32.505+01	0	7	5
30	Subject for Board from shell #5	2021-12-25 15:42:32.784+01	0	7	6
31	Subject for Board from shell #6	2021-12-25 15:42:32.938+01	0	8	3
32	Subject for Board from shell #6	2021-12-25 15:42:33.103+01	0	8	4
33	Subject for Board from shell #6	2021-12-25 15:42:33.268+01	0	8	5
34	Subject for Board from shell #6	2021-12-25 15:42:33.433+01	0	8	6
35	Subject for Board from shell #7	2021-12-25 15:42:33.599+01	0	9	3
36	Subject for Board from shell #7	2021-12-25 15:42:33.764+01	0	9	4
37	Subject for Board from shell #7	2021-12-25 15:42:33.963+01	0	9	5
38	Subject for Board from shell #7	2021-12-25 15:42:34.127+01	0	9	6
39	Subject for Board from shell #8	2021-12-25 15:42:34.281+01	0	10	3
40	Subject for Board from shell #8	2021-12-25 15:42:34.446+01	0	10	4
41	Subject for Board from shell #8	2021-12-25 15:42:34.611+01	0	10	5
42	Subject for Board from shell #8	2021-12-25 15:42:34.765+01	0	10	6
43	Subject for Board from shell #9	2021-12-25 15:42:34.93+01	0	11	3
44	Subject for Board from shell #9	2021-12-25 15:42:35.095+01	0	11	4
45	Subject for Board from shell #9	2021-12-25 15:42:35.249+01	0	11	5
46	Subject for Board from shell #9	2021-12-25 15:42:35.415+01	0	11	6
51	Subject for Board from shell #11	2021-12-25 15:42:36.229+01	0	13	3
52	Subject for Board from shell #11	2021-12-25 15:42:36.47+01	0	13	4
53	Subject for Board from shell #11	2021-12-25 15:42:36.699+01	1	13	5
54	Subject for Board from shell #11	2021-12-25 15:42:37.029+01	0	13	6
55	Subject for Board from shell #12	2021-12-25 15:42:37.303+01	0	14	3
56	Subject for Board from shell #12	2021-12-25 15:42:37.588+01	0	14	4
57	Subject for Board from shell #12	2021-12-25 15:42:37.851+01	0	14	5
58	Subject for Board from shell #12	2021-12-25 15:42:38.113+01	0	14	6
59	Subject for Board from shell #13	2021-12-25 15:42:38.377+01	0	15	3
60	Subject for Board from shell #13	2021-12-25 15:42:38.586+01	0	15	4
61	Subject for Board from shell #13	2021-12-25 15:42:38.875+01	0	15	5
62	Subject for Board from shell #13	2021-12-25 15:42:39.085+01	0	15	6
63	Subject for Board from shell #14	2021-12-25 15:42:39.295+01	1	16	3
64	Subject for Board from shell #14	2021-12-25 15:42:39.504+01	0	16	4
65	Subject for Board from shell #14	2021-12-25 15:42:39.703+01	0	16	5
66	Subject for Board from shell #14	2021-12-25 15:55:07.108+01	1	16	6
67	Subject for Board from shell #15	2021-12-25 15:42:40.122+01	0	17	3
68	Subject for Board from shell #15	2021-12-25 15:42:40.496+01	0	17	4
69	Subject for Board from shell #15	2021-12-25 15:42:40.87+01	0	17	5
70	Subject for Board from shell #15	2021-12-25 15:42:41.155+01	0	17	6
71	Subject for Board from shell #16	2021-12-25 15:42:41.418+01	0	18	3
72	Subject for Board from shell #16	2021-12-25 15:42:41.692+01	0	18	4
73	Subject for Board from shell #16	2021-12-25 15:42:41.955+01	0	18	5
74	Subject for Board from shell #16	2021-12-25 15:42:42.229+01	0	18	6
75	Subject for Board from shell #17	2021-12-25 15:42:42.514+01	0	19	3
76	Subject for Board from shell #17	2021-12-25 15:42:42.776+01	0	19	4
77	Subject for Board from shell #17	2021-12-25 15:42:43.061+01	0	19	5
78	Subject for Board from shell #17	2021-12-25 15:42:43.347+01	0	19	6
79	Subject for Board from shell #18	2021-12-25 15:42:43.632+01	0	20	3
80	Subject for Board from shell #18	2021-12-25 15:42:43.894+01	0	20	4
81	Subject for Board from shell #18	2021-12-25 15:42:44.367+01	0	20	5
82	Subject for Board from shell #18	2021-12-25 15:42:44.69+01	0	20	6
87	Test topic	2021-12-28 15:52:00.231+01	1	3	1
88	Test	2021-12-28 15:52:52.207+01	1	3	1
89	Topic 3	2021-12-28 15:54:12.722+01	1	3	1
90	test	2021-12-28 15:54:29.083+01	1	3	1
91	new test	2021-12-28 15:56:34.81+01	1	3	1
92	c	2021-12-28 15:58:01.3+01	1	3	1
93	11	2021-12-28 16:59:58.545+01	2	3	5
94	New Topic	2021-12-28 17:43:53.259+01	0	3	1
95	New Topic	2021-12-28 17:44:41.767+01	0	3	1
96	New Topic	2021-12-28 17:44:56.113+01	1	3	1
97	image	2021-12-28 17:45:29.243+01	2	3	1
98	s	2021-12-28 18:08:06.222+01	0	3	1
99	s	2021-12-28 18:08:37.434+01	0	3	1
100	s	2021-12-28 18:09:31.713+01	0	3	1
101	s	2021-12-28 18:10:10.563+01	1	3	1
102	x	2021-12-28 18:21:18.834+01	1	3	1
103	x	2021-12-28 18:35:38.327+01	0	3	1
104	x	2021-12-28 18:35:56.765+01	0	3	1
105	x	2021-12-28 18:36:13.919+01	0	3	1
106	x	2021-12-28 18:36:16.735+01	0	3	1
107	x	2021-12-28 18:37:52.371+01	1	3	1
108	x	2021-12-28 18:38:05.997+01	2	3	1
109	Photo	2022-01-04 12:04:10.643+01	2	3	5
110	SSSS	2022-01-04 13:18:12.229+01	1	3	29
111	rfrfr	2022-01-04 13:20:29.424+01	0	3	29
112	tttttt	2022-01-04 14:11:01.546+01	3	3	29
113	ggfngf	2022-01-04 14:11:39.415+01	2	3	31
114	123	2022-01-04 15:46:00.725+01	1	3	14
115	xcd	2022-01-04 15:56:30.133+01	0	3	32
116	sasasa	2022-01-04 15:58:34.823+01	0	3	32
117	qwq	2022-01-04 16:01:40.983+01	1	3	32
118	xcx	2022-01-04 17:22:25.668+01	0	3	32
119	qw	2022-01-04 21:42:52.454+01	1	3	32
120	Some topic #1	2022-01-04 22:23:22.545+01	0	3	6
121	Some topic #2	2022-01-04 22:23:22.913+01	0	3	6
122	Some topic #3	2022-01-04 22:23:23.089+01	0	3	6
123	Some topic #4	2022-01-04 22:23:23.266+01	0	3	6
124	Some topic #5	2022-01-04 22:23:23.443+01	0	3	6
125	Some topic #6	2022-01-04 22:23:23.618+01	1	3	6
126	Some topic #7	2022-01-04 22:23:23.795+01	0	3	6
127	Some topic #8	2022-01-04 22:23:23.971+01	1	3	6
128	Some topic #9	2022-01-04 22:23:24.208+01	0	3	6
129	Some topic #10	2022-01-04 22:23:24.5+01	1	3	6
130	Some topic #11	2022-01-04 22:24:28.755+01	1	3	32
131	Some topic #12	2022-01-04 22:24:51.233+01	2	3	32
132	Some topic #13	2022-01-04 22:25:22.068+01	2	3	32
134	Some topic #14	2022-01-04 22:58:50.558+01	4	3	14
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_celery_results_chordcounter; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_celery_results_chordcounter (id, group_id, sub_tasks, count) FROM stdin;
\.


--
-- Data for Name: django_celery_results_groupresult; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_celery_results_groupresult (id, group_id, date_created, date_done, content_type, content_encoding, result) FROM stdin;
\.


--
-- Data for Name: django_celery_results_taskresult; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_celery_results_taskresult (id, task_id, status, content_type, content_encoding, result, date_done, traceback, meta, task_args, task_kwargs, task_name, worker, date_created) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	django_celery_results	taskresult
7	django_celery_results	chordcounter
8	django_celery_results	groupresult
9	sites	site
10	account	emailaddress
11	account	emailconfirmation
12	socialaccount	socialaccount
13	socialaccount	socialapp
14	socialaccount	socialtoken
15	flatpages	flatpage
16	accounts	user
17	accounts	category
18	accounts	interests
19	accounts	reader
20	accounts	blogger
21	boards	board
22	boards	topic
23	boards	post
24	boards	historicalboard
25	boards	photo
\.


--
-- Data for Name: django_flatpage; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_flatpage (id, url, title, content, enable_comments, template_name, registration_required) FROM stdin;
\.


--
-- Data for Name: django_flatpage_sites; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_flatpage_sites (id, flatpage_id, site_id) FROM stdin;
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2022-09-26 22:21:38.93407+02
2	contenttypes	0002_remove_content_type_name	2022-09-26 22:21:38.954066+02
3	auth	0001_initial	2022-09-26 22:21:39.38693+02
4	auth	0002_alter_permission_name_max_length	2022-09-26 22:21:39.394935+02
5	auth	0003_alter_user_email_max_length	2022-09-26 22:21:39.404301+02
6	auth	0004_alter_user_username_opts	2022-09-26 22:21:39.414314+02
7	auth	0005_alter_user_last_login_null	2022-09-26 22:21:39.425315+02
8	auth	0006_require_contenttypes_0002	2022-09-26 22:21:39.429313+02
9	auth	0007_alter_validators_add_error_messages	2022-09-26 22:21:39.440317+02
10	auth	0008_alter_user_username_max_length	2022-09-26 22:21:39.454313+02
11	auth	0009_alter_user_last_name_max_length	2022-09-26 22:21:39.465315+02
12	auth	0010_alter_group_name_max_length	2022-09-26 22:21:39.480316+02
13	auth	0011_update_proxy_permissions	2022-09-26 22:21:39.492317+02
14	auth	0012_alter_user_first_name_max_length	2022-09-26 22:21:39.502314+02
15	accounts	0001_initial	2022-09-26 22:21:39.682314+02
16	account	0001_initial	2022-09-26 22:21:39.751313+02
17	account	0002_email_max_length	2022-09-26 22:21:39.768314+02
18	accounts	0002_avatar	2022-09-26 22:21:39.779312+02
19	accounts	0003_delete_avatar_blogger_avatar_reader_avatar	2022-09-26 22:21:39.814314+02
20	accounts	0004_remove_blogger_avatar_remove_reader_avatar_and_more	2022-09-26 22:21:39.861313+02
21	accounts	0005_rename_avatar_user_file	2022-09-26 22:21:39.879313+02
22	accounts	0006_auto_20220104_1350	2022-09-26 22:21:39.936314+02
23	admin	0001_initial	2022-09-26 22:21:39.986315+02
24	admin	0002_logentry_remove_auto_add	2022-09-26 22:21:40.010315+02
25	admin	0003_logentry_add_action_flag_choices	2022-09-26 22:21:40.039314+02
26	boards	0001_initial	2022-09-26 22:21:40.173288+02
27	boards	0002_alter_post_topic_alter_topic_board	2022-09-26 22:21:40.254136+02
28	boards	0003_historicalboard	2022-09-26 22:21:40.323135+02
29	boards	0004_post_image	2022-09-26 22:21:40.358135+02
30	boards	0005_alter_post_image	2022-09-26 22:21:40.389775+02
31	boards	0006_remove_post_image_topic_image	2022-09-26 22:21:40.445772+02
32	boards	0007_remove_topic_image	2022-09-26 22:21:40.473776+02
33	boards	0008_file	2022-09-26 22:21:40.486777+02
34	boards	0009_topic_file	2022-09-26 22:21:40.524777+02
35	boards	0010_remove_topic_file_alter_file_file	2022-09-26 22:21:40.628772+02
36	boards	0011_photo_delete_file	2022-09-26 22:21:40.676774+02
37	boards	0012_remove_photo_photo_remove_photo_topic_photo_file_and_more	2022-09-26 22:21:40.728773+02
38	boards	0013_photo_topic	2022-09-26 22:21:40.768775+02
39	boards	0014_board_is_active_historicalboard_is_active	2022-09-26 22:21:40.815775+02
40	boards	0015_alter_photo_file	2022-09-26 22:21:40.832776+02
41	django_celery_results	0001_initial	2022-09-26 22:21:40.862775+02
42	django_celery_results	0002_add_task_name_args_kwargs	2022-09-26 22:21:40.879775+02
43	django_celery_results	0003_auto_20181106_1101	2022-09-26 22:21:40.888775+02
44	django_celery_results	0004_auto_20190516_0412	2022-09-26 22:21:40.948775+02
45	django_celery_results	0005_taskresult_worker	2022-09-26 22:21:40.963774+02
46	django_celery_results	0006_taskresult_date_created	2022-09-26 22:21:41.077773+02
47	django_celery_results	0007_remove_taskresult_hidden	2022-09-26 22:21:41.082775+02
48	django_celery_results	0008_chordcounter	2022-09-26 22:21:41.105836+02
49	django_celery_results	0009_groupresult	2022-09-26 22:21:41.236035+02
50	django_celery_results	0010_remove_duplicate_indices	2022-09-26 22:21:41.251036+02
51	sites	0001_initial	2022-09-26 22:21:41.261037+02
52	flatpages	0001_initial	2022-09-26 22:21:41.311045+02
53	sessions	0001_initial	2022-09-26 22:21:41.335045+02
54	sites	0002_alter_domain_unique	2022-09-26 22:21:41.351053+02
55	socialaccount	0001_initial	2022-09-26 22:21:41.564142+02
56	socialaccount	0002_token_max_lengths	2022-09-26 22:21:41.620659+02
57	socialaccount	0003_extra_data_default_dict	2022-09-26 22:21:41.651659+02
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_site (id, domain, name) FROM stdin;
1	example.com	example.com
\.


--
-- Data for Name: socialaccount_socialaccount; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.socialaccount_socialaccount (id, provider, uid, last_login, date_joined, extra_data, user_id) FROM stdin;
\.


--
-- Data for Name: socialaccount_socialapp; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.socialaccount_socialapp (id, provider, name, client_id, secret, key) FROM stdin;
\.


--
-- Data for Name: socialaccount_socialapp_sites; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.socialaccount_socialapp_sites (id, socialapp_id, site_id) FROM stdin;
\.


--
-- Data for Name: socialaccount_socialtoken; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.socialaccount_socialtoken (id, token, token_secret, expires_at, account_id, app_id) FROM stdin;
\.


--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.account_emailaddress_id_seq', 1, false);


--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.account_emailconfirmation_id_seq', 1, false);


--
-- Name: accounts_blogger_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.accounts_blogger_category_id_seq', 119, true);


--
-- Name: accounts_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.accounts_category_id_seq', 7, true);


--
-- Name: accounts_interests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.accounts_interests_id_seq', 4, true);


--
-- Name: accounts_reader_interests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.accounts_reader_interests_id_seq', 133, true);


--
-- Name: accounts_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.accounts_user_groups_id_seq', 1, false);


--
-- Name: accounts_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.accounts_user_id_seq', 32, true);


--
-- Name: accounts_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.accounts_user_user_permissions_id_seq', 1, false);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 100, true);


--
-- Name: boards_board_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.boards_board_id_seq', 63, true);


--
-- Name: boards_historicalboard_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.boards_historicalboard_history_id_seq', 1, false);


--
-- Name: boards_photo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.boards_photo_id_seq', 115, true);


--
-- Name: boards_post_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.boards_post_id_seq', 1, false);


--
-- Name: boards_topic_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.boards_topic_id_seq', 134, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_celery_results_chordcounter_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_celery_results_chordcounter_id_seq', 1, false);


--
-- Name: django_celery_results_groupresult_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_celery_results_groupresult_id_seq', 1, false);


--
-- Name: django_celery_results_taskresult_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_celery_results_taskresult_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 25, true);


--
-- Name: django_flatpage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_flatpage_id_seq', 1, false);


--
-- Name: django_flatpage_sites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_flatpage_sites_id_seq', 18, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 57, true);


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_site_id_seq', 1, true);


--
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.socialaccount_socialaccount_id_seq', 1, false);


--
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.socialaccount_socialapp_id_seq', 1, false);


--
-- Name: socialaccount_socialapp_sites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.socialaccount_socialapp_sites_id_seq', 45, true);


--
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.socialaccount_socialtoken_id_seq', 1, false);


--
-- Name: account_emailaddress account_emailaddress_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_email_key UNIQUE (email);


--
-- Name: account_emailaddress account_emailaddress_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_pkey PRIMARY KEY (id);


--
-- Name: account_emailconfirmation account_emailconfirmation_key_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_key_key UNIQUE (key);


--
-- Name: account_emailconfirmation account_emailconfirmation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_pkey PRIMARY KEY (id);


--
-- Name: accounts_blogger_category accounts_blogger_category_blogger_id_category_id_38de577a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_blogger_category
    ADD CONSTRAINT accounts_blogger_category_blogger_id_category_id_38de577a_uniq UNIQUE (blogger_id, category_id);


--
-- Name: accounts_blogger_category accounts_blogger_category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_blogger_category
    ADD CONSTRAINT accounts_blogger_category_pkey PRIMARY KEY (id);


--
-- Name: accounts_blogger accounts_blogger_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_blogger
    ADD CONSTRAINT accounts_blogger_pkey PRIMARY KEY (user_id);


--
-- Name: accounts_category accounts_category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_category
    ADD CONSTRAINT accounts_category_pkey PRIMARY KEY (id);


--
-- Name: accounts_interests accounts_interests_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_interests
    ADD CONSTRAINT accounts_interests_pkey PRIMARY KEY (id);


--
-- Name: accounts_reader_interests accounts_reader_interests_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_reader_interests
    ADD CONSTRAINT accounts_reader_interests_pkey PRIMARY KEY (id);


--
-- Name: accounts_reader_interests accounts_reader_interests_reader_id_interests_id_dddb6f87_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_reader_interests
    ADD CONSTRAINT accounts_reader_interests_reader_id_interests_id_dddb6f87_uniq UNIQUE (reader_id, interests_id);


--
-- Name: accounts_reader accounts_reader_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_reader
    ADD CONSTRAINT accounts_reader_pkey PRIMARY KEY (user_id);


--
-- Name: accounts_user_groups accounts_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_user_groups
    ADD CONSTRAINT accounts_user_groups_pkey PRIMARY KEY (id);


--
-- Name: accounts_user_groups accounts_user_groups_user_id_group_id_59c0b32f_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_user_groups
    ADD CONSTRAINT accounts_user_groups_user_id_group_id_59c0b32f_uniq UNIQUE (user_id, group_id);


--
-- Name: accounts_user accounts_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_user
    ADD CONSTRAINT accounts_user_pkey PRIMARY KEY (id);


--
-- Name: accounts_user_user_permissions accounts_user_user_permi_user_id_permission_id_2ab516c2_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_user_user_permissions
    ADD CONSTRAINT accounts_user_user_permi_user_id_permission_id_2ab516c2_uniq UNIQUE (user_id, permission_id);


--
-- Name: accounts_user_user_permissions accounts_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_user_user_permissions
    ADD CONSTRAINT accounts_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: accounts_user accounts_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_user
    ADD CONSTRAINT accounts_user_username_key UNIQUE (username);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: boards_board boards_board_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.boards_board
    ADD CONSTRAINT boards_board_name_key UNIQUE (name);


--
-- Name: boards_board boards_board_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.boards_board
    ADD CONSTRAINT boards_board_pkey PRIMARY KEY (id);


--
-- Name: boards_historicalboard boards_historicalboard_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.boards_historicalboard
    ADD CONSTRAINT boards_historicalboard_pkey PRIMARY KEY (history_id);


--
-- Name: boards_photo boards_photo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.boards_photo
    ADD CONSTRAINT boards_photo_pkey PRIMARY KEY (id);


--
-- Name: boards_post boards_post_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.boards_post
    ADD CONSTRAINT boards_post_pkey PRIMARY KEY (id);


--
-- Name: boards_topic boards_topic_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.boards_topic
    ADD CONSTRAINT boards_topic_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_celery_results_chordcounter django_celery_results_chordcounter_group_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_celery_results_chordcounter
    ADD CONSTRAINT django_celery_results_chordcounter_group_id_key UNIQUE (group_id);


--
-- Name: django_celery_results_chordcounter django_celery_results_chordcounter_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_celery_results_chordcounter
    ADD CONSTRAINT django_celery_results_chordcounter_pkey PRIMARY KEY (id);


--
-- Name: django_celery_results_groupresult django_celery_results_groupresult_group_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_celery_results_groupresult
    ADD CONSTRAINT django_celery_results_groupresult_group_id_key UNIQUE (group_id);


--
-- Name: django_celery_results_groupresult django_celery_results_groupresult_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_celery_results_groupresult
    ADD CONSTRAINT django_celery_results_groupresult_pkey PRIMARY KEY (id);


--
-- Name: django_celery_results_taskresult django_celery_results_taskresult_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_celery_results_taskresult
    ADD CONSTRAINT django_celery_results_taskresult_pkey PRIMARY KEY (id);


--
-- Name: django_celery_results_taskresult django_celery_results_taskresult_task_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_celery_results_taskresult
    ADD CONSTRAINT django_celery_results_taskresult_task_id_key UNIQUE (task_id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_flatpage django_flatpage_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_flatpage
    ADD CONSTRAINT django_flatpage_pkey PRIMARY KEY (id);


--
-- Name: django_flatpage_sites django_flatpage_sites_flatpage_id_site_id_0d29d9d1_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_flatpage_sites
    ADD CONSTRAINT django_flatpage_sites_flatpage_id_site_id_0d29d9d1_uniq UNIQUE (flatpage_id, site_id);


--
-- Name: django_flatpage_sites django_flatpage_sites_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_flatpage_sites
    ADD CONSTRAINT django_flatpage_sites_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site django_site_domain_a2e37b91_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_domain_a2e37b91_uniq UNIQUE (domain);


--
-- Name: django_site django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialaccount socialaccount_socialaccount_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialaccount socialaccount_socialaccount_provider_uid_fc810c6e_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_provider_uid_fc810c6e_uniq UNIQUE (provider, uid);


--
-- Name: socialaccount_socialapp_sites socialaccount_socialapp__socialapp_id_site_id_71a9a768_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_socialapp__socialapp_id_site_id_71a9a768_uniq UNIQUE (socialapp_id, site_id);


--
-- Name: socialaccount_socialapp socialaccount_socialapp_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialapp
    ADD CONSTRAINT socialaccount_socialapp_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialapp_sites socialaccount_socialapp_sites_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_socialapp_sites_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialtoken socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq UNIQUE (app_id, account_id);


--
-- Name: socialaccount_socialtoken socialaccount_socialtoken_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_socialtoken_pkey PRIMARY KEY (id);


--
-- Name: account_emailaddress_email_03be32b2_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX account_emailaddress_email_03be32b2_like ON public.account_emailaddress USING btree (email varchar_pattern_ops);


--
-- Name: account_emailaddress_user_id_2c513194; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX account_emailaddress_user_id_2c513194 ON public.account_emailaddress USING btree (user_id);


--
-- Name: account_emailconfirmation_email_address_id_5b7f8c58; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX account_emailconfirmation_email_address_id_5b7f8c58 ON public.account_emailconfirmation USING btree (email_address_id);


--
-- Name: account_emailconfirmation_key_f43612bd_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX account_emailconfirmation_key_f43612bd_like ON public.account_emailconfirmation USING btree (key varchar_pattern_ops);


--
-- Name: accounts_blogger_category_blogger_id_7637df0a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_blogger_category_blogger_id_7637df0a ON public.accounts_blogger_category USING btree (blogger_id);


--
-- Name: accounts_blogger_category_category_id_df3c343d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_blogger_category_category_id_df3c343d ON public.accounts_blogger_category USING btree (category_id);


--
-- Name: accounts_reader_interests_interests_id_8a985a25; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_reader_interests_interests_id_8a985a25 ON public.accounts_reader_interests USING btree (interests_id);


--
-- Name: accounts_reader_interests_reader_id_0e39f826; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_reader_interests_reader_id_0e39f826 ON public.accounts_reader_interests USING btree (reader_id);


--
-- Name: accounts_user_groups_group_id_bd11a704; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_user_groups_group_id_bd11a704 ON public.accounts_user_groups USING btree (group_id);


--
-- Name: accounts_user_groups_user_id_52b62117; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_user_groups_user_id_52b62117 ON public.accounts_user_groups USING btree (user_id);


--
-- Name: accounts_user_user_permissions_permission_id_113bb443; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_user_user_permissions_permission_id_113bb443 ON public.accounts_user_user_permissions USING btree (permission_id);


--
-- Name: accounts_user_user_permissions_user_id_e4f0a161; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_user_user_permissions_user_id_e4f0a161 ON public.accounts_user_user_permissions USING btree (user_id);


--
-- Name: accounts_user_username_6088629e_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_user_username_6088629e_like ON public.accounts_user USING btree (username varchar_pattern_ops);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: boards_board_name_08f3d006_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX boards_board_name_08f3d006_like ON public.boards_board USING btree (name varchar_pattern_ops);


--
-- Name: boards_historicalboard_history_user_id_bfd78690; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX boards_historicalboard_history_user_id_bfd78690 ON public.boards_historicalboard USING btree (history_user_id);


--
-- Name: boards_historicalboard_id_c9b0ac6d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX boards_historicalboard_id_c9b0ac6d ON public.boards_historicalboard USING btree (id);


--
-- Name: boards_historicalboard_name_38239de3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX boards_historicalboard_name_38239de3 ON public.boards_historicalboard USING btree (name);


--
-- Name: boards_historicalboard_name_38239de3_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX boards_historicalboard_name_38239de3_like ON public.boards_historicalboard USING btree (name varchar_pattern_ops);


--
-- Name: boards_photo_topic_id_bfe7859f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX boards_photo_topic_id_bfe7859f ON public.boards_photo USING btree (topic_id);


--
-- Name: boards_post_created_by_id_0b841038; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX boards_post_created_by_id_0b841038 ON public.boards_post USING btree (created_by_id);


--
-- Name: boards_post_topic_id_f477c024; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX boards_post_topic_id_f477c024 ON public.boards_post USING btree (topic_id);


--
-- Name: boards_post_updated_by_id_76d3c48f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX boards_post_updated_by_id_76d3c48f ON public.boards_post USING btree (updated_by_id);


--
-- Name: boards_topic_board_id_4462fe82; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX boards_topic_board_id_4462fe82 ON public.boards_topic USING btree (board_id);


--
-- Name: boards_topic_starter_id_60e98681; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX boards_topic_starter_id_60e98681 ON public.boards_topic USING btree (starter_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_cele_date_cr_bd6c1d_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_cele_date_cr_bd6c1d_idx ON public.django_celery_results_groupresult USING btree (date_created);


--
-- Name: django_cele_date_cr_f04a50_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_cele_date_cr_f04a50_idx ON public.django_celery_results_taskresult USING btree (date_created);


--
-- Name: django_cele_date_do_caae0e_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_cele_date_do_caae0e_idx ON public.django_celery_results_groupresult USING btree (date_done);


--
-- Name: django_cele_date_do_f59aad_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_cele_date_do_f59aad_idx ON public.django_celery_results_taskresult USING btree (date_done);


--
-- Name: django_cele_status_9b6201_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_cele_status_9b6201_idx ON public.django_celery_results_taskresult USING btree (status);


--
-- Name: django_cele_task_na_08aec9_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_cele_task_na_08aec9_idx ON public.django_celery_results_taskresult USING btree (task_name);


--
-- Name: django_cele_worker_d54dd8_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_cele_worker_d54dd8_idx ON public.django_celery_results_taskresult USING btree (worker);


--
-- Name: django_celery_results_chordcounter_group_id_1f70858c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_celery_results_chordcounter_group_id_1f70858c_like ON public.django_celery_results_chordcounter USING btree (group_id varchar_pattern_ops);


--
-- Name: django_celery_results_groupresult_group_id_a085f1a9_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_celery_results_groupresult_group_id_a085f1a9_like ON public.django_celery_results_groupresult USING btree (group_id varchar_pattern_ops);


--
-- Name: django_celery_results_taskresult_task_id_de0d95bf_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_celery_results_taskresult_task_id_de0d95bf_like ON public.django_celery_results_taskresult USING btree (task_id varchar_pattern_ops);


--
-- Name: django_flatpage_sites_flatpage_id_078bbc8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_flatpage_sites_flatpage_id_078bbc8b ON public.django_flatpage_sites USING btree (flatpage_id);


--
-- Name: django_flatpage_sites_site_id_bfd8ea84; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_flatpage_sites_site_id_bfd8ea84 ON public.django_flatpage_sites USING btree (site_id);


--
-- Name: django_flatpage_url_41612362; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_flatpage_url_41612362 ON public.django_flatpage USING btree (url);


--
-- Name: django_flatpage_url_41612362_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_flatpage_url_41612362_like ON public.django_flatpage USING btree (url varchar_pattern_ops);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: django_site_domain_a2e37b91_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_site_domain_a2e37b91_like ON public.django_site USING btree (domain varchar_pattern_ops);


--
-- Name: socialaccount_socialaccount_user_id_8146e70c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX socialaccount_socialaccount_user_id_8146e70c ON public.socialaccount_socialaccount USING btree (user_id);


--
-- Name: socialaccount_socialapp_sites_site_id_2579dee5; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX socialaccount_socialapp_sites_site_id_2579dee5 ON public.socialaccount_socialapp_sites USING btree (site_id);


--
-- Name: socialaccount_socialapp_sites_socialapp_id_97fb6e7d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX socialaccount_socialapp_sites_socialapp_id_97fb6e7d ON public.socialaccount_socialapp_sites USING btree (socialapp_id);


--
-- Name: socialaccount_socialtoken_account_id_951f210e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX socialaccount_socialtoken_account_id_951f210e ON public.socialaccount_socialtoken USING btree (account_id);


--
-- Name: socialaccount_socialtoken_app_id_636a42d7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX socialaccount_socialtoken_app_id_636a42d7 ON public.socialaccount_socialtoken USING btree (app_id);


--
-- Name: account_emailaddress account_emailaddress_user_id_2c513194_fk_accounts_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_user_id_2c513194_fk_accounts_user_id FOREIGN KEY (user_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_emailconfirmation account_emailconfirm_email_address_id_5b7f8c58_fk_account_e; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirm_email_address_id_5b7f8c58_fk_account_e FOREIGN KEY (email_address_id) REFERENCES public.account_emailaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_blogger_category accounts_blogger_cat_blogger_id_7637df0a_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_blogger_category
    ADD CONSTRAINT accounts_blogger_cat_blogger_id_7637df0a_fk_accounts_ FOREIGN KEY (blogger_id) REFERENCES public.accounts_blogger(user_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_blogger_category accounts_blogger_cat_category_id_df3c343d_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_blogger_category
    ADD CONSTRAINT accounts_blogger_cat_category_id_df3c343d_fk_accounts_ FOREIGN KEY (category_id) REFERENCES public.accounts_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_blogger accounts_blogger_user_id_c4e11121_fk_accounts_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_blogger
    ADD CONSTRAINT accounts_blogger_user_id_c4e11121_fk_accounts_user_id FOREIGN KEY (user_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_reader_interests accounts_reader_inte_interests_id_8a985a25_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_reader_interests
    ADD CONSTRAINT accounts_reader_inte_interests_id_8a985a25_fk_accounts_ FOREIGN KEY (interests_id) REFERENCES public.accounts_interests(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_reader_interests accounts_reader_inte_reader_id_0e39f826_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_reader_interests
    ADD CONSTRAINT accounts_reader_inte_reader_id_0e39f826_fk_accounts_ FOREIGN KEY (reader_id) REFERENCES public.accounts_reader(user_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_reader accounts_reader_user_id_63d5c6ed_fk_accounts_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_reader
    ADD CONSTRAINT accounts_reader_user_id_63d5c6ed_fk_accounts_user_id FOREIGN KEY (user_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_user_groups accounts_user_groups_group_id_bd11a704_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_user_groups
    ADD CONSTRAINT accounts_user_groups_group_id_bd11a704_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_user_groups accounts_user_groups_user_id_52b62117_fk_accounts_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_user_groups
    ADD CONSTRAINT accounts_user_groups_user_id_52b62117_fk_accounts_user_id FOREIGN KEY (user_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_user_user_permissions accounts_user_user_p_permission_id_113bb443_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_user_user_permissions
    ADD CONSTRAINT accounts_user_user_p_permission_id_113bb443_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_user_user_permissions accounts_user_user_p_user_id_e4f0a161_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_user_user_permissions
    ADD CONSTRAINT accounts_user_user_p_user_id_e4f0a161_fk_accounts_ FOREIGN KEY (user_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: boards_historicalboard boards_historicalboa_history_user_id_bfd78690_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.boards_historicalboard
    ADD CONSTRAINT boards_historicalboa_history_user_id_bfd78690_fk_accounts_ FOREIGN KEY (history_user_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: boards_photo boards_photo_topic_id_bfe7859f_fk_boards_topic_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.boards_photo
    ADD CONSTRAINT boards_photo_topic_id_bfe7859f_fk_boards_topic_id FOREIGN KEY (topic_id) REFERENCES public.boards_topic(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: boards_post boards_post_created_by_id_0b841038_fk_accounts_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.boards_post
    ADD CONSTRAINT boards_post_created_by_id_0b841038_fk_accounts_user_id FOREIGN KEY (created_by_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: boards_post boards_post_topic_id_f477c024_fk_boards_topic_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.boards_post
    ADD CONSTRAINT boards_post_topic_id_f477c024_fk_boards_topic_id FOREIGN KEY (topic_id) REFERENCES public.boards_topic(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: boards_post boards_post_updated_by_id_76d3c48f_fk_accounts_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.boards_post
    ADD CONSTRAINT boards_post_updated_by_id_76d3c48f_fk_accounts_user_id FOREIGN KEY (updated_by_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: boards_topic boards_topic_board_id_4462fe82_fk_boards_board_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.boards_topic
    ADD CONSTRAINT boards_topic_board_id_4462fe82_fk_boards_board_id FOREIGN KEY (board_id) REFERENCES public.boards_board(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: boards_topic boards_topic_starter_id_60e98681_fk_accounts_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.boards_topic
    ADD CONSTRAINT boards_topic_starter_id_60e98681_fk_accounts_user_id FOREIGN KEY (starter_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_accounts_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_accounts_user_id FOREIGN KEY (user_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_flatpage_sites django_flatpage_site_flatpage_id_078bbc8b_fk_django_fl; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_flatpage_sites
    ADD CONSTRAINT django_flatpage_site_flatpage_id_078bbc8b_fk_django_fl FOREIGN KEY (flatpage_id) REFERENCES public.django_flatpage(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_flatpage_sites django_flatpage_sites_site_id_bfd8ea84_fk_django_site_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_flatpage_sites
    ADD CONSTRAINT django_flatpage_sites_site_id_bfd8ea84_fk_django_site_id FOREIGN KEY (site_id) REFERENCES public.django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialtoken socialaccount_social_account_id_951f210e_fk_socialacc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_social_account_id_951f210e_fk_socialacc FOREIGN KEY (account_id) REFERENCES public.socialaccount_socialaccount(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialtoken socialaccount_social_app_id_636a42d7_fk_socialacc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_social_app_id_636a42d7_fk_socialacc FOREIGN KEY (app_id) REFERENCES public.socialaccount_socialapp(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialapp_sites socialaccount_social_site_id_2579dee5_fk_django_si; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_social_site_id_2579dee5_fk_django_si FOREIGN KEY (site_id) REFERENCES public.django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialapp_sites socialaccount_social_socialapp_id_97fb6e7d_fk_socialacc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_social_socialapp_id_97fb6e7d_fk_socialacc FOREIGN KEY (socialapp_id) REFERENCES public.socialaccount_socialapp(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialaccount socialaccount_social_user_id_8146e70c_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_social_user_id_8146e70c_fk_accounts_ FOREIGN KEY (user_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

