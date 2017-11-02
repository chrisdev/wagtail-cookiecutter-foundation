--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.5
-- Dumped by pg_dump version 10.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: blog_blogindexpage; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE blog_blogindexpage (
    page_ptr_id integer NOT NULL,
    intro text NOT NULL,
    feed_image_id integer
);


--
-- Name: blog_blogindexpagerelatedlink; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE blog_blogindexpagerelatedlink (
    id integer NOT NULL,
    sort_order integer,
    link_external character varying(200) NOT NULL,
    title character varying(255) NOT NULL,
    link_document_id integer,
    link_page_id integer,
    page_id integer NOT NULL
);


--
-- Name: blog_blogindexpagerelatedlink_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE blog_blogindexpagerelatedlink_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: blog_blogindexpagerelatedlink_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE blog_blogindexpagerelatedlink_id_seq OWNED BY blog_blogindexpagerelatedlink.id;


--
-- Name: blog_blogpage; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE blog_blogpage (
    page_ptr_id integer NOT NULL,
    intro text NOT NULL,
    body text NOT NULL,
    date date NOT NULL,
    feed_image_id integer
);


--
-- Name: blog_blogpagecarouselitem; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE blog_blogpagecarouselitem (
    id integer NOT NULL,
    sort_order integer,
    link_external character varying(200) NOT NULL,
    embed_url character varying(200) NOT NULL,
    caption text NOT NULL,
    image_id integer,
    link_document_id integer,
    link_page_id integer,
    page_id integer NOT NULL
);


--
-- Name: blog_blogpagecarouselitem_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE blog_blogpagecarouselitem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: blog_blogpagecarouselitem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE blog_blogpagecarouselitem_id_seq OWNED BY blog_blogpagecarouselitem.id;


--
-- Name: blog_blogpagerelatedlink; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE blog_blogpagerelatedlink (
    id integer NOT NULL,
    sort_order integer,
    link_external character varying(200) NOT NULL,
    title character varying(255) NOT NULL,
    link_document_id integer,
    link_page_id integer,
    page_id integer NOT NULL
);


--
-- Name: blog_blogpagerelatedlink_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE blog_blogpagerelatedlink_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: blog_blogpagerelatedlink_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE blog_blogpagerelatedlink_id_seq OWNED BY blog_blogpagerelatedlink.id;


--
-- Name: blog_blogpagetag; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE blog_blogpagetag (
    id integer NOT NULL,
    content_object_id integer NOT NULL,
    tag_id integer NOT NULL
);


--
-- Name: blog_blogpagetag_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE blog_blogpagetag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: blog_blogpagetag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE blog_blogpagetag_id_seq OWNED BY blog_blogpagetag.id;


--
-- Name: contact_contactformfield; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE contact_contactformfield (
    id integer NOT NULL,
    sort_order integer,
    label character varying(255) NOT NULL,
    field_type character varying(16) NOT NULL,
    required boolean NOT NULL,
    choices text NOT NULL,
    default_value character varying(255) NOT NULL,
    help_text character varying(255) NOT NULL,
    page_id integer NOT NULL
);


--
-- Name: contact_contactformfield_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE contact_contactformfield_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: contact_contactformfield_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE contact_contactformfield_id_seq OWNED BY contact_contactformfield.id;


--
-- Name: contact_contactpage; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE contact_contactpage (
    page_ptr_id integer NOT NULL,
    to_address character varying(255) NOT NULL,
    from_address character varying(255) NOT NULL,
    subject character varying(255) NOT NULL,
    name_organization character varying(255) NOT NULL,
    telephone character varying(20) NOT NULL,
    email character varying(254) NOT NULL,
    address_1 character varying(255) NOT NULL,
    address_2 character varying(255) NOT NULL,
    city character varying(255) NOT NULL,
    country character varying(255) NOT NULL,
    post_code character varying(10) NOT NULL,
    intro character varying(255) NOT NULL,
    thank_you_text text NOT NULL,
    telephone_2 character varying(20) NOT NULL,
    email_2 character varying(254) NOT NULL,
    feed_image_id integer
);


--
-- Name: contact_formfield; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE contact_formfield (
    id integer NOT NULL,
    sort_order integer,
    label character varying(255) NOT NULL,
    field_type character varying(16) NOT NULL,
    required boolean NOT NULL,
    choices text NOT NULL,
    default_value character varying(255) NOT NULL,
    help_text character varying(255) NOT NULL,
    page_id integer NOT NULL
);


--
-- Name: contact_formfield_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE contact_formfield_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: contact_formfield_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE contact_formfield_id_seq OWNED BY contact_formfield.id;


--
-- Name: contact_formpage; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE contact_formpage (
    page_ptr_id integer NOT NULL,
    to_address character varying(255) NOT NULL,
    from_address character varying(255) NOT NULL,
    subject character varying(255) NOT NULL,
    intro text NOT NULL,
    thank_you_text text NOT NULL,
    feed_image_id integer
);


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


--
-- Name: documents_gallery_documentsindexpage; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE documents_gallery_documentsindexpage (
    page_ptr_id integer NOT NULL,
    intro text NOT NULL,
    feed_image_id integer
);


--
-- Name: documents_gallery_documentspage; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE documents_gallery_documentspage (
    page_ptr_id integer NOT NULL,
    feed_image_id integer
);


--
-- Name: documents_gallery_documentspagetag; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE documents_gallery_documentspagetag (
    id integer NOT NULL,
    content_object_id integer NOT NULL,
    tag_id integer NOT NULL
);


--
-- Name: documents_gallery_documentspagetag_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE documents_gallery_documentspagetag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: documents_gallery_documentspagetag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE documents_gallery_documentspagetag_id_seq OWNED BY documents_gallery_documentspagetag.id;


--
-- Name: events_eventindexpage; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE events_eventindexpage (
    page_ptr_id integer NOT NULL,
    intro text NOT NULL,
    feed_image_id integer
);


--
-- Name: events_eventindexpagerelatedlink; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE events_eventindexpagerelatedlink (
    id integer NOT NULL,
    sort_order integer,
    link_external character varying(200) NOT NULL,
    title character varying(255) NOT NULL,
    link_document_id integer,
    link_page_id integer,
    page_id integer NOT NULL
);


--
-- Name: events_eventindexpagerelatedlink_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE events_eventindexpagerelatedlink_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: events_eventindexpagerelatedlink_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE events_eventindexpagerelatedlink_id_seq OWNED BY events_eventindexpagerelatedlink.id;


--
-- Name: events_eventpage; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE events_eventpage (
    page_ptr_id integer NOT NULL,
    date_from date NOT NULL,
    date_to date,
    time_from time without time zone,
    time_to time without time zone,
    audience character varying(255),
    location character varying(255),
    body text NOT NULL,
    cost character varying(255),
    signup_link character varying(200) NOT NULL,
    feed_image_id integer
);


--
-- Name: events_eventpagecarouselitem; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE events_eventpagecarouselitem (
    id integer NOT NULL,
    sort_order integer,
    link_external character varying(200) NOT NULL,
    embed_url character varying(200) NOT NULL,
    caption text NOT NULL,
    image_id integer,
    link_document_id integer,
    link_page_id integer,
    page_id integer NOT NULL
);


--
-- Name: events_eventpagecarouselitem_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE events_eventpagecarouselitem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: events_eventpagecarouselitem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE events_eventpagecarouselitem_id_seq OWNED BY events_eventpagecarouselitem.id;


--
-- Name: events_eventpagerelatedlink; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE events_eventpagerelatedlink (
    id integer NOT NULL,
    sort_order integer,
    link_external character varying(200) NOT NULL,
    title character varying(255) NOT NULL,
    link_document_id integer,
    link_page_id integer,
    page_id integer NOT NULL
);


--
-- Name: events_eventpagerelatedlink_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE events_eventpagerelatedlink_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: events_eventpagerelatedlink_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE events_eventpagerelatedlink_id_seq OWNED BY events_eventpagerelatedlink.id;


--
-- Name: events_eventpagespeaker; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE events_eventpagespeaker (
    id integer NOT NULL,
    sort_order integer,
    link_external character varying(200) NOT NULL,
    full_name character varying(255) NOT NULL,
    image_id integer,
    link_document_id integer,
    link_page_id integer,
    page_id integer NOT NULL
);


--
-- Name: events_eventpagespeaker_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE events_eventpagespeaker_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: events_eventpagespeaker_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE events_eventpagespeaker_id_seq OWNED BY events_eventpagespeaker.id;


--
-- Name: events_eventpagetag; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE events_eventpagetag (
    id integer NOT NULL,
    content_object_id integer NOT NULL,
    tag_id integer NOT NULL
);


--
-- Name: events_eventpagetag_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE events_eventpagetag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: events_eventpagetag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE events_eventpagetag_id_seq OWNED BY events_eventpagetag.id;


--
-- Name: pages_advert; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE pages_advert (
    id integer NOT NULL,
    link_external character varying(200) NOT NULL,
    title character varying(150),
    text text NOT NULL,
    image_id integer,
    link_document_id integer,
    link_page_id integer,
    page_id integer,
    button_text character varying(150)
);


--
-- Name: pages_advert_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE pages_advert_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pages_advert_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE pages_advert_id_seq OWNED BY pages_advert.id;


--
-- Name: pages_contentblock; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE pages_contentblock (
    id integer NOT NULL,
    link_external character varying(200) NOT NULL,
    title character varying(255) NOT NULL,
    body text NOT NULL,
    summary text NOT NULL,
    slug character varying(50) NOT NULL,
    link_document_id integer,
    link_page_id integer,
    page_id integer
);


--
-- Name: pages_contentblock_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE pages_contentblock_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pages_contentblock_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE pages_contentblock_id_seq OWNED BY pages_contentblock.id;


--
-- Name: pages_faqspage; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE pages_faqspage (
    page_ptr_id integer NOT NULL,
    body text NOT NULL
);


--
-- Name: pages_homepage; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE pages_homepage (
    page_ptr_id integer NOT NULL,
    title_text text,
    body text,
    feed_image_id integer
);


--
-- Name: pages_homepagecarouselitem; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE pages_homepagecarouselitem (
    id integer NOT NULL,
    sort_order integer,
    link_external character varying(200) NOT NULL,
    embed_url character varying(200) NOT NULL,
    caption text NOT NULL,
    image_id integer,
    link_document_id integer,
    link_page_id integer,
    page_id integer NOT NULL
);


--
-- Name: pages_homepagecarouselitem_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE pages_homepagecarouselitem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pages_homepagecarouselitem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE pages_homepagecarouselitem_id_seq OWNED BY pages_homepagecarouselitem.id;


--
-- Name: pages_homepagecontentitem; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE pages_homepagecontentitem (
    id integer NOT NULL,
    sort_order integer,
    link_external character varying(200) NOT NULL,
    title character varying(100) NOT NULL,
    content text,
    summary text NOT NULL,
    slug character varying(50) NOT NULL,
    image_id integer,
    link_document_id integer,
    link_page_id integer,
    page_id integer NOT NULL
);


--
-- Name: pages_homepagecontentitem_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE pages_homepagecontentitem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pages_homepagecontentitem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE pages_homepagecontentitem_id_seq OWNED BY pages_homepagecontentitem.id;


--
-- Name: pages_homepagerelatedlink; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE pages_homepagerelatedlink (
    id integer NOT NULL,
    sort_order integer,
    link_external character varying(200) NOT NULL,
    title character varying(255) NOT NULL,
    link_document_id integer,
    link_page_id integer,
    page_id integer NOT NULL
);


--
-- Name: pages_homepagerelatedlink_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE pages_homepagerelatedlink_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pages_homepagerelatedlink_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE pages_homepagerelatedlink_id_seq OWNED BY pages_homepagerelatedlink.id;


--
-- Name: pages_sitebranding; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE pages_sitebranding (
    id integer NOT NULL,
    site_name character varying(250),
    logo_id integer,
    site_id integer NOT NULL
);


--
-- Name: pages_sitebranding_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE pages_sitebranding_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pages_sitebranding_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE pages_sitebranding_id_seq OWNED BY pages_sitebranding.id;


--
-- Name: pages_socialmediasettings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE pages_socialmediasettings (
    id integer NOT NULL,
    facebook character varying(200),
    instagram character varying(255),
    twitter_name character varying(255),
    youtube character varying(200),
    linkedin character varying(255),
    github character varying(255),
    facebook_appid character varying(255),
    site_id integer NOT NULL
);


--
-- Name: pages_socialmediasettings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE pages_socialmediasettings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pages_socialmediasettings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE pages_socialmediasettings_id_seq OWNED BY pages_socialmediasettings.id;


--
-- Name: pages_standardindexpage; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE pages_standardindexpage (
    page_ptr_id integer NOT NULL,
    subtitle character varying(255) NOT NULL,
    intro text NOT NULL,
    feed_image_id integer,
    template_string character varying(255) NOT NULL
);


--
-- Name: pages_standardindexpagerelatedlink; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE pages_standardindexpagerelatedlink (
    id integer NOT NULL,
    sort_order integer,
    link_external character varying(200) NOT NULL,
    title character varying(255) NOT NULL,
    link_document_id integer,
    link_page_id integer,
    page_id integer NOT NULL
);


--
-- Name: pages_standardindexpagerelatedlink_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE pages_standardindexpagerelatedlink_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pages_standardindexpagerelatedlink_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE pages_standardindexpagerelatedlink_id_seq OWNED BY pages_standardindexpagerelatedlink.id;


--
-- Name: pages_standardpage; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE pages_standardpage (
    page_ptr_id integer NOT NULL,
    subtitle character varying(255) NOT NULL,
    intro text NOT NULL,
    body text NOT NULL,
    feed_image_id integer,
    template_string character varying(255) NOT NULL
);


--
-- Name: pages_standardpagecarouselitem; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE pages_standardpagecarouselitem (
    id integer NOT NULL,
    sort_order integer,
    link_external character varying(200) NOT NULL,
    embed_url character varying(200) NOT NULL,
    caption text NOT NULL,
    image_id integer,
    link_document_id integer,
    link_page_id integer,
    page_id integer NOT NULL
);


--
-- Name: pages_standardpagecarouselitem_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE pages_standardpagecarouselitem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pages_standardpagecarouselitem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE pages_standardpagecarouselitem_id_seq OWNED BY pages_standardpagecarouselitem.id;


--
-- Name: pages_standardpagerelatedlink; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE pages_standardpagerelatedlink (
    id integer NOT NULL,
    sort_order integer,
    link_external character varying(200) NOT NULL,
    title character varying(255) NOT NULL,
    link_document_id integer,
    link_page_id integer,
    page_id integer NOT NULL
);


--
-- Name: pages_standardpagerelatedlink_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE pages_standardpagerelatedlink_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pages_standardpagerelatedlink_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE pages_standardpagerelatedlink_id_seq OWNED BY pages_standardpagerelatedlink.id;


--
-- Name: pages_testimonial; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE pages_testimonial (
    id integer NOT NULL,
    link_external character varying(200) NOT NULL,
    name character varying(150) NOT NULL,
    text character varying(255) NOT NULL,
    link_document_id integer,
    link_page_id integer,
    page_id integer,
    photo_id integer
);


--
-- Name: pages_testimonial_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE pages_testimonial_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pages_testimonial_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE pages_testimonial_id_seq OWNED BY pages_testimonial.id;


--
-- Name: pages_videogallerypage; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE pages_videogallerypage (
    page_ptr_id integer NOT NULL,
    intro text NOT NULL,
    feed_image_id integer
);


--
-- Name: pages_videogallerypagecarouselitem; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE pages_videogallerypagecarouselitem (
    id integer NOT NULL,
    sort_order integer,
    link_external character varying(200) NOT NULL,
    embed_url character varying(200) NOT NULL,
    caption text NOT NULL,
    image_id integer,
    link_document_id integer,
    link_page_id integer,
    page_id integer NOT NULL
);


--
-- Name: pages_videopagecarouselitem_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE pages_videopagecarouselitem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pages_videopagecarouselitem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE pages_videopagecarouselitem_id_seq OWNED BY pages_videogallerypagecarouselitem.id;


--
-- Name: people_personindexpage; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE people_personindexpage (
    page_ptr_id integer NOT NULL,
    subtitle character varying(255) NOT NULL,
    intro text NOT NULL,
    feed_image_id integer
);


--
-- Name: people_personindexpagerelatedlink; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE people_personindexpagerelatedlink (
    id integer NOT NULL,
    sort_order integer,
    link_external character varying(200) NOT NULL,
    title character varying(255) NOT NULL,
    link_document_id integer,
    link_page_id integer,
    page_id integer NOT NULL
);


--
-- Name: people_personindexpagerelatedlink_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE people_personindexpagerelatedlink_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: people_personindexpagerelatedlink_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE people_personindexpagerelatedlink_id_seq OWNED BY people_personindexpagerelatedlink.id;


--
-- Name: people_personpage; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE people_personpage (
    page_ptr_id integer NOT NULL,
    name_organization character varying(255) NOT NULL,
    telephone character varying(20) NOT NULL,
    email character varying(254) NOT NULL,
    address_1 character varying(255) NOT NULL,
    address_2 character varying(255) NOT NULL,
    city character varying(255) NOT NULL,
    country character varying(255) NOT NULL,
    post_code character varying(10) NOT NULL,
    intro text NOT NULL,
    biography text NOT NULL,
    feed_image_id integer,
    image_id integer,
    role_id integer,
    telephone_2 character varying(20) NOT NULL,
    email_2 character varying(254) NOT NULL
);


--
-- Name: people_personpagerelatedlink; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE people_personpagerelatedlink (
    id integer NOT NULL,
    sort_order integer,
    link_external character varying(200) NOT NULL,
    title character varying(255) NOT NULL,
    link_document_id integer,
    link_page_id integer,
    page_id integer NOT NULL
);


--
-- Name: people_personpagerelatedlink_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE people_personpagerelatedlink_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: people_personpagerelatedlink_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE people_personpagerelatedlink_id_seq OWNED BY people_personpagerelatedlink.id;


--
-- Name: people_personpagetag; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE people_personpagetag (
    id integer NOT NULL,
    content_object_id integer NOT NULL,
    tag_id integer NOT NULL
);


--
-- Name: people_personpagetag_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE people_personpagetag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: people_personpagetag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE people_personpagetag_id_seq OWNED BY people_personpagetag.id;


--
-- Name: people_personrole; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE people_personrole (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


--
-- Name: people_personrole_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE people_personrole_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: people_personrole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE people_personrole_id_seq OWNED BY people_personrole.id;


--
-- Name: photo_gallery_galleryindexpage; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE photo_gallery_galleryindexpage (
    page_ptr_id integer NOT NULL,
    intro text NOT NULL,
    feed_image_id integer
);


--
-- Name: photo_gallery_gallerypage; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE photo_gallery_gallerypage (
    page_ptr_id integer NOT NULL,
    feed_image_id integer
);


--
-- Name: photo_gallery_gallerypagetag; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE photo_gallery_gallerypagetag (
    id integer NOT NULL,
    content_object_id integer NOT NULL,
    tag_id integer NOT NULL
);


--
-- Name: photo_gallery_gallerypagetag_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE photo_gallery_gallerypagetag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: photo_gallery_gallerypagetag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE photo_gallery_gallerypagetag_id_seq OWNED BY photo_gallery_gallerypagetag.id;


--
-- Name: postgres_search_indexentry; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postgres_search_indexentry (
    id integer NOT NULL,
    object_id text NOT NULL,
    body_search tsvector NOT NULL,
    content_type_id integer NOT NULL
);


--
-- Name: postgres_search_indexentry_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE postgres_search_indexentry_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: postgres_search_indexentry_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE postgres_search_indexentry_id_seq OWNED BY postgres_search_indexentry.id;


--
-- Name: products_productindexpage; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE products_productindexpage (
    page_ptr_id integer NOT NULL,
    subtitle character varying(255) NOT NULL,
    intro text NOT NULL,
    feed_image_id integer
);


--
-- Name: products_productindexpagerelatedlink; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE products_productindexpagerelatedlink (
    id integer NOT NULL,
    sort_order integer,
    link_external character varying(200) NOT NULL,
    title character varying(255) NOT NULL,
    link_document_id integer,
    link_page_id integer,
    page_id integer NOT NULL
);


--
-- Name: products_productindexpagerelatedlink_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE products_productindexpagerelatedlink_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: products_productindexpagerelatedlink_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE products_productindexpagerelatedlink_id_seq OWNED BY products_productindexpagerelatedlink.id;


--
-- Name: products_productpage; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE products_productpage (
    page_ptr_id integer NOT NULL,
    price character varying(255) NOT NULL,
    description text NOT NULL,
    feed_image_id integer,
    image_id integer,
    intro character varying(255) NOT NULL,
    link_demo character varying(200) NOT NULL
);


--
-- Name: products_productpagerelatedlink; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE products_productpagerelatedlink (
    id integer NOT NULL,
    sort_order integer,
    link_external character varying(200) NOT NULL,
    title character varying(255) NOT NULL,
    link_document_id integer,
    link_page_id integer,
    page_id integer NOT NULL
);


--
-- Name: products_productpagerelatedlink_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE products_productpagerelatedlink_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: products_productpagerelatedlink_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE products_productpagerelatedlink_id_seq OWNED BY products_productpagerelatedlink.id;


--
-- Name: products_productpagetag; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE products_productpagetag (
    id integer NOT NULL,
    content_object_id integer NOT NULL,
    tag_id integer NOT NULL
);


--
-- Name: products_productpagetag_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE products_productpagetag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: products_productpagetag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE products_productpagetag_id_seq OWNED BY products_productpagetag.id;


--
-- Name: taggit_tag; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE taggit_tag (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL
);


--
-- Name: taggit_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE taggit_tag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: taggit_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE taggit_tag_id_seq OWNED BY taggit_tag.id;


--
-- Name: taggit_taggeditem; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE taggit_taggeditem (
    id integer NOT NULL,
    object_id integer NOT NULL,
    content_type_id integer NOT NULL,
    tag_id integer NOT NULL
);


--
-- Name: taggit_taggeditem_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE taggit_taggeditem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: taggit_taggeditem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE taggit_taggeditem_id_seq OWNED BY taggit_taggeditem.id;


--
-- Name: wagtail_feeds_rssfeedssettings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE wagtail_feeds_rssfeedssettings (
    id integer NOT NULL,
    feed_app_label character varying(255),
    feed_model_name character varying(255),
    feed_title character varying(255),
    feed_link character varying(255),
    feed_description character varying(255),
    feed_author_email character varying(255),
    feed_author_link character varying(255),
    feed_item_description_field character varying(255),
    feed_item_content_field character varying(255),
    site_id integer NOT NULL,
    feed_image_in_content boolean NOT NULL
);


--
-- Name: wagtail_feeds_rssfeedssettings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE wagtail_feeds_rssfeedssettings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wagtail_feeds_rssfeedssettings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE wagtail_feeds_rssfeedssettings_id_seq OWNED BY wagtail_feeds_rssfeedssettings.id;


--
-- Name: wagtailcore_collection; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE wagtailcore_collection (
    id integer NOT NULL,
    path character varying(255) COLLATE pg_catalog."C" NOT NULL,
    depth integer NOT NULL,
    numchild integer NOT NULL,
    name character varying(255) NOT NULL,
    CONSTRAINT wagtailcore_collection_depth_check CHECK ((depth >= 0)),
    CONSTRAINT wagtailcore_collection_numchild_check CHECK ((numchild >= 0))
);


--
-- Name: wagtailcore_collection_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE wagtailcore_collection_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wagtailcore_collection_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE wagtailcore_collection_id_seq OWNED BY wagtailcore_collection.id;


--
-- Name: wagtailcore_collectionviewrestriction; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE wagtailcore_collectionviewrestriction (
    id integer NOT NULL,
    restriction_type character varying(20) NOT NULL,
    password character varying(255) NOT NULL,
    collection_id integer NOT NULL
);


--
-- Name: wagtailcore_collectionviewrestriction_groups; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE wagtailcore_collectionviewrestriction_groups (
    id integer NOT NULL,
    collectionviewrestriction_id integer NOT NULL,
    group_id integer NOT NULL
);


--
-- Name: wagtailcore_collectionviewrestriction_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE wagtailcore_collectionviewrestriction_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wagtailcore_collectionviewrestriction_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE wagtailcore_collectionviewrestriction_groups_id_seq OWNED BY wagtailcore_collectionviewrestriction_groups.id;


--
-- Name: wagtailcore_collectionviewrestriction_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE wagtailcore_collectionviewrestriction_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wagtailcore_collectionviewrestriction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE wagtailcore_collectionviewrestriction_id_seq OWNED BY wagtailcore_collectionviewrestriction.id;


--
-- Name: wagtailcore_groupcollectionpermission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE wagtailcore_groupcollectionpermission (
    id integer NOT NULL,
    collection_id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


--
-- Name: wagtailcore_groupcollectionpermission_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE wagtailcore_groupcollectionpermission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wagtailcore_groupcollectionpermission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE wagtailcore_groupcollectionpermission_id_seq OWNED BY wagtailcore_groupcollectionpermission.id;


--
-- Name: wagtailcore_grouppagepermission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE wagtailcore_grouppagepermission (
    id integer NOT NULL,
    permission_type character varying(20) NOT NULL,
    group_id integer NOT NULL,
    page_id integer NOT NULL
);


--
-- Name: wagtailcore_grouppagepermission_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE wagtailcore_grouppagepermission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wagtailcore_grouppagepermission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE wagtailcore_grouppagepermission_id_seq OWNED BY wagtailcore_grouppagepermission.id;


--
-- Name: wagtailcore_page; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE wagtailcore_page (
    id integer NOT NULL,
    path character varying(255) COLLATE pg_catalog."C" NOT NULL,
    depth integer NOT NULL,
    numchild integer NOT NULL,
    title character varying(255) NOT NULL,
    slug character varying(255) NOT NULL,
    live boolean NOT NULL,
    has_unpublished_changes boolean NOT NULL,
    url_path text NOT NULL,
    seo_title character varying(255) NOT NULL,
    show_in_menus boolean NOT NULL,
    search_description text NOT NULL,
    go_live_at timestamp with time zone,
    expire_at timestamp with time zone,
    expired boolean NOT NULL,
    content_type_id integer NOT NULL,
    owner_id integer,
    locked boolean NOT NULL,
    latest_revision_created_at timestamp with time zone,
    first_published_at timestamp with time zone,
    live_revision_id integer,
    last_published_at timestamp with time zone,
    draft_title character varying(255) NOT NULL,
    CONSTRAINT wagtailcore_page_depth_check CHECK ((depth >= 0)),
    CONSTRAINT wagtailcore_page_numchild_check CHECK ((numchild >= 0))
);


--
-- Name: wagtailcore_page_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE wagtailcore_page_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wagtailcore_page_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE wagtailcore_page_id_seq OWNED BY wagtailcore_page.id;


--
-- Name: wagtailcore_pagerevision; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE wagtailcore_pagerevision (
    id integer NOT NULL,
    submitted_for_moderation boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    content_json text NOT NULL,
    approved_go_live_at timestamp with time zone,
    page_id integer NOT NULL,
    user_id integer
);


--
-- Name: wagtailcore_pagerevision_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE wagtailcore_pagerevision_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wagtailcore_pagerevision_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE wagtailcore_pagerevision_id_seq OWNED BY wagtailcore_pagerevision.id;


--
-- Name: wagtailcore_pageviewrestriction; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE wagtailcore_pageviewrestriction (
    id integer NOT NULL,
    password character varying(255) NOT NULL,
    page_id integer NOT NULL,
    restriction_type character varying(20) NOT NULL
);


--
-- Name: wagtailcore_pageviewrestriction_groups; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE wagtailcore_pageviewrestriction_groups (
    id integer NOT NULL,
    pageviewrestriction_id integer NOT NULL,
    group_id integer NOT NULL
);


--
-- Name: wagtailcore_pageviewrestriction_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE wagtailcore_pageviewrestriction_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wagtailcore_pageviewrestriction_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE wagtailcore_pageviewrestriction_groups_id_seq OWNED BY wagtailcore_pageviewrestriction_groups.id;


--
-- Name: wagtailcore_pageviewrestriction_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE wagtailcore_pageviewrestriction_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wagtailcore_pageviewrestriction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE wagtailcore_pageviewrestriction_id_seq OWNED BY wagtailcore_pageviewrestriction.id;


--
-- Name: wagtailcore_site; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE wagtailcore_site (
    id integer NOT NULL,
    hostname character varying(255) NOT NULL,
    port integer NOT NULL,
    is_default_site boolean NOT NULL,
    root_page_id integer NOT NULL,
    site_name character varying(255)
);


--
-- Name: wagtailcore_site_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE wagtailcore_site_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wagtailcore_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE wagtailcore_site_id_seq OWNED BY wagtailcore_site.id;


--
-- Name: wagtaildocs_document; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE wagtaildocs_document (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    file character varying(100) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    uploaded_by_user_id integer,
    collection_id integer NOT NULL
);


--
-- Name: wagtaildocs_document_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE wagtaildocs_document_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wagtaildocs_document_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE wagtaildocs_document_id_seq OWNED BY wagtaildocs_document.id;


--
-- Name: wagtailembeds_embed; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE wagtailembeds_embed (
    id integer NOT NULL,
    url character varying(200) NOT NULL,
    max_width smallint,
    type character varying(10) NOT NULL,
    html text NOT NULL,
    title text NOT NULL,
    author_name text NOT NULL,
    provider_name text NOT NULL,
    thumbnail_url character varying(200),
    width integer,
    height integer,
    last_updated timestamp with time zone NOT NULL
);


--
-- Name: wagtailembeds_embed_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE wagtailembeds_embed_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wagtailembeds_embed_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE wagtailembeds_embed_id_seq OWNED BY wagtailembeds_embed.id;


--
-- Name: wagtailforms_formsubmission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE wagtailforms_formsubmission (
    id integer NOT NULL,
    form_data text NOT NULL,
    submit_time timestamp with time zone NOT NULL,
    page_id integer NOT NULL
);


--
-- Name: wagtailforms_formsubmission_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE wagtailforms_formsubmission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wagtailforms_formsubmission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE wagtailforms_formsubmission_id_seq OWNED BY wagtailforms_formsubmission.id;


--
-- Name: wagtailimages_image; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE wagtailimages_image (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    file character varying(100) NOT NULL,
    width integer NOT NULL,
    height integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    focal_point_x integer,
    focal_point_y integer,
    focal_point_width integer,
    focal_point_height integer,
    uploaded_by_user_id integer,
    file_size integer,
    collection_id integer NOT NULL,
    CONSTRAINT wagtailimages_image_file_size_check CHECK ((file_size >= 0)),
    CONSTRAINT wagtailimages_image_focal_point_height_check CHECK ((focal_point_height >= 0)),
    CONSTRAINT wagtailimages_image_focal_point_width_check CHECK ((focal_point_width >= 0)),
    CONSTRAINT wagtailimages_image_focal_point_x_check CHECK ((focal_point_x >= 0)),
    CONSTRAINT wagtailimages_image_focal_point_y_check CHECK ((focal_point_y >= 0))
);


--
-- Name: wagtailimages_image_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE wagtailimages_image_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wagtailimages_image_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE wagtailimages_image_id_seq OWNED BY wagtailimages_image.id;


--
-- Name: wagtailimages_rendition; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE wagtailimages_rendition (
    id integer NOT NULL,
    file character varying(100) NOT NULL,
    width integer NOT NULL,
    height integer NOT NULL,
    focal_point_key character varying(16) NOT NULL,
    image_id integer NOT NULL,
    filter_spec character varying(255) NOT NULL
);


--
-- Name: wagtailimages_rendition_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE wagtailimages_rendition_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wagtailimages_rendition_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE wagtailimages_rendition_id_seq OWNED BY wagtailimages_rendition.id;


--
-- Name: wagtailredirects_redirect; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE wagtailredirects_redirect (
    id integer NOT NULL,
    old_path character varying(255) NOT NULL,
    is_permanent boolean NOT NULL,
    redirect_link character varying(200) NOT NULL,
    redirect_page_id integer,
    site_id integer
);


--
-- Name: wagtailredirects_redirect_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE wagtailredirects_redirect_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wagtailredirects_redirect_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE wagtailredirects_redirect_id_seq OWNED BY wagtailredirects_redirect.id;


--
-- Name: wagtailsearchpromotions_searchpromotion; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE wagtailsearchpromotions_searchpromotion (
    id integer NOT NULL,
    sort_order integer,
    description text NOT NULL,
    page_id integer NOT NULL,
    query_id integer NOT NULL
);


--
-- Name: wagtailsearch_editorspick_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE wagtailsearch_editorspick_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wagtailsearch_editorspick_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE wagtailsearch_editorspick_id_seq OWNED BY wagtailsearchpromotions_searchpromotion.id;


--
-- Name: wagtailsearch_query; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE wagtailsearch_query (
    id integer NOT NULL,
    query_string character varying(255) NOT NULL
);


--
-- Name: wagtailsearch_query_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE wagtailsearch_query_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wagtailsearch_query_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE wagtailsearch_query_id_seq OWNED BY wagtailsearch_query.id;


--
-- Name: wagtailsearch_querydailyhits; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE wagtailsearch_querydailyhits (
    id integer NOT NULL,
    date date NOT NULL,
    hits integer NOT NULL,
    query_id integer NOT NULL
);


--
-- Name: wagtailsearch_querydailyhits_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE wagtailsearch_querydailyhits_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wagtailsearch_querydailyhits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE wagtailsearch_querydailyhits_id_seq OWNED BY wagtailsearch_querydailyhits.id;


--
-- Name: wagtailusers_userprofile; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE wagtailusers_userprofile (
    id integer NOT NULL,
    submitted_notifications boolean NOT NULL,
    approved_notifications boolean NOT NULL,
    rejected_notifications boolean NOT NULL,
    user_id integer NOT NULL,
    preferred_language character varying(10) NOT NULL
);


--
-- Name: wagtailusers_userprofile_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE wagtailusers_userprofile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wagtailusers_userprofile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE wagtailusers_userprofile_id_seq OWNED BY wagtailusers_userprofile.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: blog_blogindexpagerelatedlink id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY blog_blogindexpagerelatedlink ALTER COLUMN id SET DEFAULT nextval('blog_blogindexpagerelatedlink_id_seq'::regclass);


--
-- Name: blog_blogpagecarouselitem id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY blog_blogpagecarouselitem ALTER COLUMN id SET DEFAULT nextval('blog_blogpagecarouselitem_id_seq'::regclass);


--
-- Name: blog_blogpagerelatedlink id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY blog_blogpagerelatedlink ALTER COLUMN id SET DEFAULT nextval('blog_blogpagerelatedlink_id_seq'::regclass);


--
-- Name: blog_blogpagetag id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY blog_blogpagetag ALTER COLUMN id SET DEFAULT nextval('blog_blogpagetag_id_seq'::regclass);


--
-- Name: contact_contactformfield id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY contact_contactformfield ALTER COLUMN id SET DEFAULT nextval('contact_contactformfield_id_seq'::regclass);


--
-- Name: contact_formfield id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY contact_formfield ALTER COLUMN id SET DEFAULT nextval('contact_formfield_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Name: documents_gallery_documentspagetag id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY documents_gallery_documentspagetag ALTER COLUMN id SET DEFAULT nextval('documents_gallery_documentspagetag_id_seq'::regclass);


--
-- Name: events_eventindexpagerelatedlink id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY events_eventindexpagerelatedlink ALTER COLUMN id SET DEFAULT nextval('events_eventindexpagerelatedlink_id_seq'::regclass);


--
-- Name: events_eventpagecarouselitem id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY events_eventpagecarouselitem ALTER COLUMN id SET DEFAULT nextval('events_eventpagecarouselitem_id_seq'::regclass);


--
-- Name: events_eventpagerelatedlink id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY events_eventpagerelatedlink ALTER COLUMN id SET DEFAULT nextval('events_eventpagerelatedlink_id_seq'::regclass);


--
-- Name: events_eventpagespeaker id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY events_eventpagespeaker ALTER COLUMN id SET DEFAULT nextval('events_eventpagespeaker_id_seq'::regclass);


--
-- Name: events_eventpagetag id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY events_eventpagetag ALTER COLUMN id SET DEFAULT nextval('events_eventpagetag_id_seq'::regclass);


--
-- Name: pages_advert id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY pages_advert ALTER COLUMN id SET DEFAULT nextval('pages_advert_id_seq'::regclass);


--
-- Name: pages_contentblock id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY pages_contentblock ALTER COLUMN id SET DEFAULT nextval('pages_contentblock_id_seq'::regclass);


--
-- Name: pages_homepagecarouselitem id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY pages_homepagecarouselitem ALTER COLUMN id SET DEFAULT nextval('pages_homepagecarouselitem_id_seq'::regclass);


--
-- Name: pages_homepagecontentitem id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY pages_homepagecontentitem ALTER COLUMN id SET DEFAULT nextval('pages_homepagecontentitem_id_seq'::regclass);


--
-- Name: pages_homepagerelatedlink id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY pages_homepagerelatedlink ALTER COLUMN id SET DEFAULT nextval('pages_homepagerelatedlink_id_seq'::regclass);


--
-- Name: pages_sitebranding id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY pages_sitebranding ALTER COLUMN id SET DEFAULT nextval('pages_sitebranding_id_seq'::regclass);


--
-- Name: pages_socialmediasettings id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY pages_socialmediasettings ALTER COLUMN id SET DEFAULT nextval('pages_socialmediasettings_id_seq'::regclass);


--
-- Name: pages_standardindexpagerelatedlink id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY pages_standardindexpagerelatedlink ALTER COLUMN id SET DEFAULT nextval('pages_standardindexpagerelatedlink_id_seq'::regclass);


--
-- Name: pages_standardpagecarouselitem id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY pages_standardpagecarouselitem ALTER COLUMN id SET DEFAULT nextval('pages_standardpagecarouselitem_id_seq'::regclass);


--
-- Name: pages_standardpagerelatedlink id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY pages_standardpagerelatedlink ALTER COLUMN id SET DEFAULT nextval('pages_standardpagerelatedlink_id_seq'::regclass);


--
-- Name: pages_testimonial id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY pages_testimonial ALTER COLUMN id SET DEFAULT nextval('pages_testimonial_id_seq'::regclass);


--
-- Name: pages_videogallerypagecarouselitem id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY pages_videogallerypagecarouselitem ALTER COLUMN id SET DEFAULT nextval('pages_videopagecarouselitem_id_seq'::regclass);


--
-- Name: people_personindexpagerelatedlink id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY people_personindexpagerelatedlink ALTER COLUMN id SET DEFAULT nextval('people_personindexpagerelatedlink_id_seq'::regclass);


--
-- Name: people_personpagerelatedlink id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY people_personpagerelatedlink ALTER COLUMN id SET DEFAULT nextval('people_personpagerelatedlink_id_seq'::regclass);


--
-- Name: people_personpagetag id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY people_personpagetag ALTER COLUMN id SET DEFAULT nextval('people_personpagetag_id_seq'::regclass);


--
-- Name: people_personrole id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY people_personrole ALTER COLUMN id SET DEFAULT nextval('people_personrole_id_seq'::regclass);


--
-- Name: photo_gallery_gallerypagetag id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY photo_gallery_gallerypagetag ALTER COLUMN id SET DEFAULT nextval('photo_gallery_gallerypagetag_id_seq'::regclass);


--
-- Name: postgres_search_indexentry id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY postgres_search_indexentry ALTER COLUMN id SET DEFAULT nextval('postgres_search_indexentry_id_seq'::regclass);


--
-- Name: products_productindexpagerelatedlink id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY products_productindexpagerelatedlink ALTER COLUMN id SET DEFAULT nextval('products_productindexpagerelatedlink_id_seq'::regclass);


--
-- Name: products_productpagerelatedlink id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY products_productpagerelatedlink ALTER COLUMN id SET DEFAULT nextval('products_productpagerelatedlink_id_seq'::regclass);


--
-- Name: products_productpagetag id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY products_productpagetag ALTER COLUMN id SET DEFAULT nextval('products_productpagetag_id_seq'::regclass);


--
-- Name: taggit_tag id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY taggit_tag ALTER COLUMN id SET DEFAULT nextval('taggit_tag_id_seq'::regclass);


--
-- Name: taggit_taggeditem id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY taggit_taggeditem ALTER COLUMN id SET DEFAULT nextval('taggit_taggeditem_id_seq'::regclass);


--
-- Name: wagtail_feeds_rssfeedssettings id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtail_feeds_rssfeedssettings ALTER COLUMN id SET DEFAULT nextval('wagtail_feeds_rssfeedssettings_id_seq'::regclass);


--
-- Name: wagtailcore_collection id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailcore_collection ALTER COLUMN id SET DEFAULT nextval('wagtailcore_collection_id_seq'::regclass);


--
-- Name: wagtailcore_collectionviewrestriction id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailcore_collectionviewrestriction ALTER COLUMN id SET DEFAULT nextval('wagtailcore_collectionviewrestriction_id_seq'::regclass);


--
-- Name: wagtailcore_collectionviewrestriction_groups id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailcore_collectionviewrestriction_groups ALTER COLUMN id SET DEFAULT nextval('wagtailcore_collectionviewrestriction_groups_id_seq'::regclass);


--
-- Name: wagtailcore_groupcollectionpermission id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailcore_groupcollectionpermission ALTER COLUMN id SET DEFAULT nextval('wagtailcore_groupcollectionpermission_id_seq'::regclass);


--
-- Name: wagtailcore_grouppagepermission id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailcore_grouppagepermission ALTER COLUMN id SET DEFAULT nextval('wagtailcore_grouppagepermission_id_seq'::regclass);


--
-- Name: wagtailcore_page id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailcore_page ALTER COLUMN id SET DEFAULT nextval('wagtailcore_page_id_seq'::regclass);


--
-- Name: wagtailcore_pagerevision id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailcore_pagerevision ALTER COLUMN id SET DEFAULT nextval('wagtailcore_pagerevision_id_seq'::regclass);


--
-- Name: wagtailcore_pageviewrestriction id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailcore_pageviewrestriction ALTER COLUMN id SET DEFAULT nextval('wagtailcore_pageviewrestriction_id_seq'::regclass);


--
-- Name: wagtailcore_pageviewrestriction_groups id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailcore_pageviewrestriction_groups ALTER COLUMN id SET DEFAULT nextval('wagtailcore_pageviewrestriction_groups_id_seq'::regclass);


--
-- Name: wagtailcore_site id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailcore_site ALTER COLUMN id SET DEFAULT nextval('wagtailcore_site_id_seq'::regclass);


--
-- Name: wagtaildocs_document id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtaildocs_document ALTER COLUMN id SET DEFAULT nextval('wagtaildocs_document_id_seq'::regclass);


--
-- Name: wagtailembeds_embed id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailembeds_embed ALTER COLUMN id SET DEFAULT nextval('wagtailembeds_embed_id_seq'::regclass);


--
-- Name: wagtailforms_formsubmission id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailforms_formsubmission ALTER COLUMN id SET DEFAULT nextval('wagtailforms_formsubmission_id_seq'::regclass);


--
-- Name: wagtailimages_image id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailimages_image ALTER COLUMN id SET DEFAULT nextval('wagtailimages_image_id_seq'::regclass);


--
-- Name: wagtailimages_rendition id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailimages_rendition ALTER COLUMN id SET DEFAULT nextval('wagtailimages_rendition_id_seq'::regclass);


--
-- Name: wagtailredirects_redirect id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailredirects_redirect ALTER COLUMN id SET DEFAULT nextval('wagtailredirects_redirect_id_seq'::regclass);


--
-- Name: wagtailsearch_query id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailsearch_query ALTER COLUMN id SET DEFAULT nextval('wagtailsearch_query_id_seq'::regclass);


--
-- Name: wagtailsearch_querydailyhits id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailsearch_querydailyhits ALTER COLUMN id SET DEFAULT nextval('wagtailsearch_querydailyhits_id_seq'::regclass);


--
-- Name: wagtailsearchpromotions_searchpromotion id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailsearchpromotions_searchpromotion ALTER COLUMN id SET DEFAULT nextval('wagtailsearch_editorspick_id_seq'::regclass);


--
-- Name: wagtailusers_userprofile id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailusers_userprofile ALTER COLUMN id SET DEFAULT nextval('wagtailusers_userprofile_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: -
--

COPY auth_group (id, name) FROM stdin;
1	Moderators
2	Editors
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
1	1	1
2	1	2
3	1	3
4	2	1
5	2	2
6	2	3
7	1	4
8	1	5
9	1	6
10	2	4
11	2	5
12	2	6
13	1	7
14	2	7
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add image	2	add_image
2	Can change image	2	change_image
3	Can delete image	2	delete_image
4	Can add document	3	add_document
5	Can change document	3	change_document
6	Can delete document	3	delete_document
7	Can access Wagtail admin	5	access_admin
8	Can add log entry	6	add_logentry
9	Can change log entry	6	change_logentry
10	Can delete log entry	6	delete_logentry
11	Can add permission	7	add_permission
12	Can change permission	7	change_permission
13	Can delete permission	7	delete_permission
14	Can add group	8	add_group
15	Can change group	8	change_group
16	Can delete group	8	delete_group
17	Can add user	9	add_user
18	Can change user	9	change_user
19	Can delete user	9	delete_user
20	Can add content type	10	add_contenttype
21	Can change content type	10	change_contenttype
22	Can delete content type	10	delete_contenttype
23	Can add session	11	add_session
24	Can change session	11	change_session
25	Can delete session	11	delete_session
26	Can add Tag	12	add_tag
27	Can change Tag	12	change_tag
28	Can delete Tag	12	delete_tag
29	Can add Tagged Item	13	add_taggeditem
30	Can change Tagged Item	13	change_taggeditem
31	Can delete Tagged Item	13	delete_taggeditem
32	Can add search promotion	14	add_searchpromotion
33	Can change search promotion	14	change_searchpromotion
34	Can delete search promotion	14	delete_searchpromotion
35	Can add form submission	15	add_formsubmission
36	Can change form submission	15	change_formsubmission
37	Can delete form submission	15	delete_formsubmission
38	Can add redirect	16	add_redirect
39	Can change redirect	16	change_redirect
40	Can delete redirect	16	delete_redirect
41	Can add embed	17	add_embed
42	Can change embed	17	change_embed
43	Can delete embed	17	delete_embed
44	Can add user profile	18	add_userprofile
45	Can change user profile	18	change_userprofile
46	Can delete user profile	18	delete_userprofile
47	Can add filter	19	add_filter
48	Can change filter	19	change_filter
49	Can delete filter	19	delete_filter
50	Can add rendition	20	add_rendition
51	Can change rendition	20	change_rendition
52	Can delete rendition	20	delete_rendition
53	Can add query	21	add_query
54	Can change query	21	change_query
55	Can delete query	21	delete_query
56	Can add Query Daily Hits	22	add_querydailyhits
57	Can change Query Daily Hits	22	change_querydailyhits
58	Can delete Query Daily Hits	22	delete_querydailyhits
59	Can add site	23	add_site
60	Can change site	23	change_site
61	Can delete site	23	delete_site
62	Can add page	1	add_page
63	Can change page	1	change_page
64	Can delete page	1	delete_page
65	Can add page revision	24	add_pagerevision
66	Can change page revision	24	change_pagerevision
67	Can delete page revision	24	delete_pagerevision
68	Can add group page permission	25	add_grouppagepermission
69	Can change group page permission	25	change_grouppagepermission
70	Can delete group page permission	25	delete_grouppagepermission
71	Can add page view restriction	26	add_pageviewrestriction
72	Can change page view restriction	26	change_pageviewrestriction
73	Can delete page view restriction	26	delete_pageviewrestriction
74	Can add collection	27	add_collection
75	Can change collection	27	change_collection
76	Can delete collection	27	delete_collection
77	Can add group collection permission	28	add_groupcollectionpermission
78	Can change group collection permission	28	change_groupcollectionpermission
79	Can delete group collection permission	28	delete_groupcollectionpermission
80	Can add social media settings	29	add_socialmediasettings
81	Can change social media settings	29	change_socialmediasettings
82	Can delete social media settings	29	delete_socialmediasettings
83	Can add home page content item	30	add_homepagecontentitem
84	Can change home page content item	30	change_homepagecontentitem
85	Can delete home page content item	30	delete_homepagecontentitem
86	Can add home page carousel item	31	add_homepagecarouselitem
87	Can change home page carousel item	31	change_homepagecarouselitem
88	Can delete home page carousel item	31	delete_homepagecarouselitem
89	Can add home page related link	32	add_homepagerelatedlink
90	Can change home page related link	32	change_homepagerelatedlink
91	Can delete home page related link	32	delete_homepagerelatedlink
92	Can add Homepage	4	add_homepage
93	Can change Homepage	4	change_homepage
94	Can delete Homepage	4	delete_homepage
95	Can add standard index page related link	33	add_standardindexpagerelatedlink
96	Can change standard index page related link	33	change_standardindexpagerelatedlink
97	Can delete standard index page related link	33	delete_standardindexpagerelatedlink
98	Can add standard index page	34	add_standardindexpage
99	Can change standard index page	34	change_standardindexpage
100	Can delete standard index page	34	delete_standardindexpage
101	Can add standard page carousel item	35	add_standardpagecarouselitem
102	Can change standard page carousel item	35	change_standardpagecarouselitem
103	Can delete standard page carousel item	35	delete_standardpagecarouselitem
104	Can add standard page related link	36	add_standardpagerelatedlink
105	Can change standard page related link	36	change_standardpagerelatedlink
106	Can delete standard page related link	36	delete_standardpagerelatedlink
107	Can add standard page	37	add_standardpage
108	Can change standard page	37	change_standardpage
109	Can delete standard page	37	delete_standardpage
110	Can add content block	38	add_contentblock
111	Can change content block	38	change_contentblock
112	Can delete content block	38	delete_contentblock
113	Can add testimonial	39	add_testimonial
114	Can change testimonial	39	change_testimonial
115	Can delete testimonial	39	delete_testimonial
116	Can add advert	40	add_advert
117	Can change advert	40	change_advert
118	Can delete advert	40	delete_advert
119	Can add faqs page	41	add_faqspage
120	Can change faqs page	41	change_faqspage
121	Can delete faqs page	41	delete_faqspage
122	Can add blog index page related link	42	add_blogindexpagerelatedlink
123	Can change blog index page related link	42	change_blogindexpagerelatedlink
124	Can delete blog index page related link	42	delete_blogindexpagerelatedlink
125	Can add blog index page	43	add_blogindexpage
126	Can change blog index page	43	change_blogindexpage
127	Can delete blog index page	43	delete_blogindexpage
128	Can add blog page carousel item	44	add_blogpagecarouselitem
129	Can change blog page carousel item	44	change_blogpagecarouselitem
130	Can delete blog page carousel item	44	delete_blogpagecarouselitem
131	Can add blog page related link	45	add_blogpagerelatedlink
132	Can change blog page related link	45	change_blogpagerelatedlink
133	Can delete blog page related link	45	delete_blogpagerelatedlink
134	Can add blog page tag	46	add_blogpagetag
135	Can change blog page tag	46	change_blogpagetag
136	Can delete blog page tag	46	delete_blogpagetag
137	Can add blog page	47	add_blogpage
138	Can change blog page	47	change_blogpage
139	Can delete blog page	47	delete_blogpage
140	Can add event index page related link	48	add_eventindexpagerelatedlink
141	Can change event index page related link	48	change_eventindexpagerelatedlink
142	Can delete event index page related link	48	delete_eventindexpagerelatedlink
143	Can add event index page	49	add_eventindexpage
144	Can change event index page	49	change_eventindexpage
145	Can delete event index page	49	delete_eventindexpage
146	Can add event page carousel item	50	add_eventpagecarouselitem
147	Can change event page carousel item	50	change_eventpagecarouselitem
148	Can delete event page carousel item	50	delete_eventpagecarouselitem
149	Can add event page related link	51	add_eventpagerelatedlink
150	Can change event page related link	51	change_eventpagerelatedlink
151	Can delete event page related link	51	delete_eventpagerelatedlink
152	Can add event page speaker	52	add_eventpagespeaker
153	Can change event page speaker	52	change_eventpagespeaker
154	Can delete event page speaker	52	delete_eventpagespeaker
155	Can add event page tag	53	add_eventpagetag
156	Can change event page tag	53	change_eventpagetag
157	Can delete event page tag	53	delete_eventpagetag
158	Can add event page	54	add_eventpage
159	Can change event page	54	change_eventpage
160	Can delete event page	54	delete_eventpage
161	Can add form field	55	add_formfield
162	Can change form field	55	change_formfield
163	Can delete form field	55	delete_formfield
164	Can add form page	56	add_formpage
165	Can change form page	56	change_formpage
166	Can delete form page	56	delete_formpage
167	Can add contact form field	57	add_contactformfield
168	Can change contact form field	57	change_contactformfield
169	Can delete contact form field	57	delete_contactformfield
170	Can add contact page	58	add_contactpage
171	Can change contact page	58	change_contactpage
172	Can delete contact page	58	delete_contactpage
173	Can add person index page related link	59	add_personindexpagerelatedlink
174	Can change person index page related link	59	change_personindexpagerelatedlink
175	Can delete person index page related link	59	delete_personindexpagerelatedlink
176	Can add person index page	60	add_personindexpage
177	Can change person index page	60	change_personindexpage
178	Can delete person index page	60	delete_personindexpage
179	Can add person page related link	61	add_personpagerelatedlink
180	Can change person page related link	61	change_personpagerelatedlink
181	Can delete person page related link	61	delete_personpagerelatedlink
182	Can add person page tag	62	add_personpagetag
183	Can change person page tag	62	change_personpagetag
184	Can delete person page tag	62	delete_personpagetag
185	Can add person role	63	add_personrole
186	Can change person role	63	change_personrole
187	Can delete person role	63	delete_personrole
188	Can add person page	64	add_personpage
189	Can change person page	64	change_personpage
190	Can delete person page	64	delete_personpage
191	Can add Gallery Index Page	65	add_galleryindexpage
192	Can change Gallery Index Page	65	change_galleryindexpage
193	Can delete Gallery Index Page	65	delete_galleryindexpage
194	Can add gallery page tag	66	add_gallerypagetag
195	Can change gallery page tag	66	change_gallerypagetag
196	Can delete gallery page tag	66	delete_gallerypagetag
197	Can add Gallery Page	67	add_gallerypage
198	Can change Gallery Page	67	change_gallerypage
199	Can delete Gallery Page	67	delete_gallerypage
200	Can add product index page related link	68	add_productindexpagerelatedlink
201	Can change product index page related link	68	change_productindexpagerelatedlink
202	Can delete product index page related link	68	delete_productindexpagerelatedlink
203	Can add product index page	69	add_productindexpage
204	Can change product index page	69	change_productindexpage
205	Can delete product index page	69	delete_productindexpage
206	Can add product page related link	70	add_productpagerelatedlink
207	Can change product page related link	70	change_productpagerelatedlink
208	Can delete product page related link	70	delete_productpagerelatedlink
209	Can add product page tag	71	add_productpagetag
210	Can change product page tag	71	change_productpagetag
211	Can delete product page tag	71	delete_productpagetag
212	Can add product page	72	add_productpage
213	Can change product page	72	change_productpage
214	Can delete product page	72	delete_productpage
215	Can add Documents Index Page	73	add_documentsindexpage
216	Can change Documents Index Page	73	change_documentsindexpage
217	Can delete Documents Index Page	73	delete_documentsindexpage
218	Can add documents page tag	74	add_documentspagetag
219	Can change documents page tag	74	change_documentspagetag
220	Can delete documents page tag	74	delete_documentspagetag
221	Can add Documents Page	75	add_documentspage
222	Can change Documents Page	75	change_documentspage
223	Can delete Documents Page	75	delete_documentspage
224	Can add rss feeds settings	76	add_rssfeedssettings
225	Can change rss feeds settings	76	change_rssfeedssettings
226	Can delete rss feeds settings	76	delete_rssfeedssettings
227	Can add index entry	77	add_indexentry
228	Can change index entry	77	change_indexentry
229	Can delete index entry	77	delete_indexentry
230	Can add collection view restriction	78	add_collectionviewrestriction
231	Can change collection view restriction	78	change_collectionviewrestriction
232	Can delete collection view restriction	78	delete_collectionviewrestriction
233	Can add video page	79	add_videopage
234	Can change video page	79	change_videopage
235	Can delete video page	79	delete_videopage
236	Can add video page carousel item	80	add_videopagecarouselitem
237	Can change video page carousel item	80	change_videopagecarouselitem
238	Can delete video page carousel item	80	delete_videopagecarouselitem
239	Can add video gallery page carousel item	80	add_videogallerypagecarouselitem
240	Can change video gallery page carousel item	80	change_videogallerypagecarouselitem
241	Can delete video gallery page carousel item	80	delete_videogallerypagecarouselitem
242	Can add video gallery page	81	add_videogallerypage
243	Can change video gallery page	81	change_videogallerypage
244	Can delete video gallery page	81	delete_videogallerypage
245	Can add site branding	82	add_sitebranding
246	Can change site branding	82	change_sitebranding
247	Can delete site branding	82	delete_sitebranding
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$36000$5HkCiQD2wOPy$quuP34M/87omK0yq4oSkulez1de4DadLKB28QDGhFz0=	2017-11-02 11:53:26.130545-04	t	admin	Christopher	Clarke	cclarke@chrisdev.com	t	t	2016-07-20 03:27:16.7876-04
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: -
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: blog_blogindexpage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY blog_blogindexpage (page_ptr_id, intro, feed_image_id) FROM stdin;
16		\N
\.


--
-- Data for Name: blog_blogindexpagerelatedlink; Type: TABLE DATA; Schema: public; Owner: -
--

COPY blog_blogindexpagerelatedlink (id, sort_order, link_external, title, link_document_id, link_page_id, page_id) FROM stdin;
\.


--
-- Data for Name: blog_blogpage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY blog_blogpage (page_ptr_id, intro, body, date, feed_image_id) FROM stdin;
19	<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam et mauris eu nibh elementum blandit varius sit amet enim. Quisque massa leo, ornare in mattis vitae, vehicula vestibulum diam. Phasellus id leo placerat, vehicula diam nec, interdum mi. Nunc lacinia massa tristique nunc accumsan, eu dapibus odio feugiat. Donec varius quam dictum placerat porttitor. Vivamus fermentum cursus nibh in facilisis. Aenean in justo auctor, faucibus risus eu, semper nisl. Ut nec suscipit nibh. Donec feugiat eget dui in rhoncus. Curabitur imperdiet tortor ut quam tempus sagittis. Morbi lectus magna, viverra ut turpis a, dapibus sollicitudin diam. Morbi vel urna suscipit, sodales ante id, luctus velit.</p>	[{"type": "image", "value": 9}, {"type": "paragraph", "value": "<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam et mauris eu nibh elementum blandit varius sit amet enim. Quisque massa leo, ornare in mattis vitae, vehicula vestibulum diam. Phasellus id leo placerat, vehicula diam nec, interdum mi. Nunc lacinia massa tristique nunc accumsan, eu dapibus odio feugiat. Donec varius quam dictum placerat porttitor. Vivamus fermentum cursus nibh in facilisis. Aenean in justo auctor, faucibus risus eu, semper nisl. Ut nec suscipit nibh. Donec feugiat eget dui in rhoncus. Curabitur imperdiet tortor ut quam tempus sagittis. Morbi lectus magna, viverra ut turpis a, dapibus sollicitudin diam. Morbi vel urna suscipit, sodales ante id, luctus velit.</p>"}, {"type": "heading", "value": "Test Heading 1"}, {"type": "heading", "value": "Test Heading 2"}]	2016-06-17	9
17	<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam et mauris eu nibh elementum blandit varius sit amet enim. Quisque massa leo, ornare in mattis vitae, vehicula vestibulum diam. Phasellus id leo placerat, vehicula diam nec, interdum mi. Nunc lacinia massa tristique nunc accumsan, eu dapibus odio feugiat. Donec varius quam dictum placerat porttitor. Vivamus fermentum cursus nibh in facilisis. Aenean in justo auctor, faucibus risus eu, semper nisl. Ut nec suscipit nibh. Donec feugiat eget dui in rhoncus. Curabitur imperdiet tortor ut quam tempus sagittis. Morbi lectus magna, viverra ut turpis a, dapibus sollicitudin diam. Morbi vel urna suscipit, sodales ante id, luctus velit.</p>	[{"type": "heading", "value": "Test Heading 1"}, {"type": "paragraph", "value": "<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent lobortis orci ex, a interdum justo dapibus eu. Vestibulum sit amet risus et dolor tempor faucibus non ac enim. Sed et sapien gravida, sollicitudin enim at, facilisis sapien. Nunc eget nibh ac libero tempus placerat. Duis quis turpis libero. Donec vel tincidunt arcu. Nulla congue at risus eget egestas.</p><p>Ut eget sapien ut diam feugiat fringilla. Curabitur malesuada mauris felis, id blandit odio consequat vitae. Ut hendrerit hendrerit ante et fermentum. Mauris aliquam varius lorem, sed feugiat justo iaculis eget. Etiam ornare non neque at ultrices. Phasellus quam elit, lobortis ac imperdiet vitae, scelerisque convallis felis. Fusce a vehicula orci, et semper nibh. Aenean id lacus eget odio dignissim venenatis. Cras sagittis lectus diam, ut pulvinar neque venenatis in.</p>"}, {"type": "image", "value": 9}, {"type": "heading", "value": "Test Heading 2"}, {"type": "image", "value": 3}, {"type": "paragraph", "value": "<p>Praesent a massa id est egestas volutpat sed vitae dolor. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Duis sed dolor metus. Interdum et malesuada fames ac ante ipsum primis in faucibus. Nunc porttitor lacus eget bibendum commodo. Donec faucibus ipsum sit amet sem interdum, et sagittis tortor ornare. Quisque tristique neque gravida nisi sodales mattis. Morbi malesuada ante nisi, vel venenatis lacus ultricies eu. Pellentesque id risus sit amet enim lobortis luctus. Nullam dolor purus, efficitur in massa ac, pellentesque pulvinar dui.</p>"}]	2016-06-17	9
18	<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam et mauris eu nibh elementum blandit varius sit amet enim. Quisque massa leo, ornare in mattis vitae, vehicula vestibulum diam. Phasellus id leo placerat, vehicula diam nec, interdum mi. Nunc lacinia massa tristique nunc accumsan, eu dapibus odio feugiat. Donec varius quam dictum placerat porttitor. Vivamus fermentum cursus nibh in facilisis. Aenean in justo auctor, faucibus risus eu, semper nisl. Ut nec suscipit nibh. Donec feugiat eget dui in rhoncus. Curabitur imperdiet tortor ut quam tempus sagittis. Morbi lectus magna, viverra ut turpis a, dapibus sollicitudin diam. Morbi vel urna suscipit, sodales ante id, luctus velit.</p>	[{"type": "paragraph", "value": "<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam et mauris eu nibh elementum blandit varius sit amet enim. Quisque massa leo, ornare in mattis vitae, vehicula vestibulum diam. Phasellus id leo placerat, vehicula diam nec, interdum mi. Nunc lacinia massa tristique nunc accumsan, eu dapibus odio feugiat. Donec varius quam dictum placerat porttitor. Vivamus fermentum cursus nibh in facilisis. Aenean in justo auctor, faucibus risus eu, semper nisl. Ut nec suscipit nibh. Donec feugiat eget dui in rhoncus. Curabitur imperdiet tortor ut quam tempus sagittis. Morbi lectus magna, viverra ut turpis a, dapibus sollicitudin diam. Morbi vel urna suscipit, sodales ante id, luctus velit.</p>"}, {"type": "heading", "value": "Test Heading"}, {"type": "image", "value": 9}, {"type": "image", "value": 7}]	2016-06-17	3
\.


--
-- Data for Name: blog_blogpagecarouselitem; Type: TABLE DATA; Schema: public; Owner: -
--

COPY blog_blogpagecarouselitem (id, sort_order, link_external, embed_url, caption, image_id, link_document_id, link_page_id, page_id) FROM stdin;
\.


--
-- Data for Name: blog_blogpagerelatedlink; Type: TABLE DATA; Schema: public; Owner: -
--

COPY blog_blogpagerelatedlink (id, sort_order, link_external, title, link_document_id, link_page_id, page_id) FROM stdin;
3	0		Blog Page 2	\N	18	17
4	1		Blog Page 3	\N	19	17
5	0		Blog Page 1	\N	17	18
6	1		Blog Page 3	\N	19	18
1	0		Blog Page 1	\N	17	19
2	1		Blog Page 2	\N	18	19
\.


--
-- Data for Name: blog_blogpagetag; Type: TABLE DATA; Schema: public; Owner: -
--

COPY blog_blogpagetag (id, content_object_id, tag_id) FROM stdin;
\.


--
-- Data for Name: contact_contactformfield; Type: TABLE DATA; Schema: public; Owner: -
--

COPY contact_contactformfield (id, sort_order, label, field_type, required, choices, default_value, help_text, page_id) FROM stdin;
1	0	Name	singleline	t				24
2	1	Email	email	t				24
3	2	Subject	singleline	t				24
4	3	Message	multiline	t				24
\.


--
-- Data for Name: contact_contactpage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY contact_contactpage (page_ptr_id, to_address, from_address, subject, name_organization, telephone, email, address_1, address_2, city, country, post_code, intro, thank_you_text, telephone_2, email_2, feed_image_id) FROM stdin;
24				ChrisDev	+1 868-773-4644		A3 St Benedicts Gardens,		Tunapuna,	Trinidad & Tobago	tunapuna	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam et mauris eu nibh elementum blandit varius sit amet enim. Quisque massa leo, ornare in mattis vitae, vehicula vestibulum diam. Phasellus id leo placerat, vehicula diam nec, interdum mi.	<p>Thank you for submitting.</p>			\N
\.


--
-- Data for Name: contact_formfield; Type: TABLE DATA; Schema: public; Owner: -
--

COPY contact_formfield (id, sort_order, label, field_type, required, choices, default_value, help_text, page_id) FROM stdin;
\.


--
-- Data for Name: contact_formpage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY contact_formpage (page_ptr_id, to_address, from_address, subject, intro, thank_you_text, feed_image_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: -
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: -
--

COPY django_content_type (id, app_label, model) FROM stdin;
1	wagtailcore	page
2	wagtailimages	image
3	wagtaildocs	document
4	pages	homepage
5	wagtailadmin	admin
6	admin	logentry
7	auth	permission
8	auth	group
9	auth	user
10	contenttypes	contenttype
11	sessions	session
12	taggit	tag
13	taggit	taggeditem
14	wagtailsearchpromotions	searchpromotion
15	wagtailforms	formsubmission
16	wagtailredirects	redirect
17	wagtailembeds	embed
18	wagtailusers	userprofile
19	wagtailimages	filter
20	wagtailimages	rendition
21	wagtailsearch	query
22	wagtailsearch	querydailyhits
23	wagtailcore	site
24	wagtailcore	pagerevision
25	wagtailcore	grouppagepermission
26	wagtailcore	pageviewrestriction
27	wagtailcore	collection
28	wagtailcore	groupcollectionpermission
29	pages	socialmediasettings
30	pages	homepagecontentitem
31	pages	homepagecarouselitem
32	pages	homepagerelatedlink
33	pages	standardindexpagerelatedlink
34	pages	standardindexpage
35	pages	standardpagecarouselitem
36	pages	standardpagerelatedlink
37	pages	standardpage
38	pages	contentblock
39	pages	testimonial
40	pages	advert
41	pages	faqspage
42	blog	blogindexpagerelatedlink
43	blog	blogindexpage
44	blog	blogpagecarouselitem
45	blog	blogpagerelatedlink
46	blog	blogpagetag
47	blog	blogpage
48	events	eventindexpagerelatedlink
49	events	eventindexpage
50	events	eventpagecarouselitem
51	events	eventpagerelatedlink
52	events	eventpagespeaker
53	events	eventpagetag
54	events	eventpage
55	contact	formfield
56	contact	formpage
57	contact	contactformfield
58	contact	contactpage
59	people	personindexpagerelatedlink
60	people	personindexpage
61	people	personpagerelatedlink
62	people	personpagetag
63	people	personrole
64	people	personpage
65	photo_gallery	galleryindexpage
66	photo_gallery	gallerypagetag
67	photo_gallery	gallerypage
68	products	productindexpagerelatedlink
69	products	productindexpage
70	products	productpagerelatedlink
71	products	productpagetag
72	products	productpage
73	documents_gallery	documentsindexpage
74	documents_gallery	documentspagetag
75	documents_gallery	documentspage
76	wagtail_feeds	rssfeedssettings
77	postgres_search	indexentry
78	wagtailcore	collectionviewrestriction
79	pages	videopage
80	pages	videogallerypagecarouselitem
81	pages	videogallerypage
82	pages	sitebranding
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2016-07-20 03:23:49.795951-04
2	auth	0001_initial	2016-07-20 03:23:50.664572-04
3	admin	0001_initial	2016-07-20 03:23:50.897853-04
4	admin	0002_logentry_remove_auto_add	2016-07-20 03:23:50.942383-04
5	contenttypes	0002_remove_content_type_name	2016-07-20 03:23:51.031131-04
6	auth	0002_alter_permission_name_max_length	2016-07-20 03:23:51.075797-04
7	auth	0003_alter_user_email_max_length	2016-07-20 03:23:51.119898-04
8	auth	0004_alter_user_username_opts	2016-07-20 03:23:51.155992-04
9	auth	0005_alter_user_last_login_null	2016-07-20 03:23:51.197724-04
10	auth	0006_require_contenttypes_0002	2016-07-20 03:23:51.209669-04
11	auth	0007_alter_validators_add_error_messages	2016-07-20 03:23:51.237908-04
12	taggit	0001_initial	2016-07-20 03:23:51.620343-04
13	taggit	0002_auto_20150616_2121	2016-07-20 03:23:51.765371-04
14	wagtailimages	0001_initial	2016-07-20 03:23:52.232357-04
15	wagtailcore	0001_initial	2016-07-20 03:23:53.779469-04
16	wagtailcore	0002_initial_data	2016-07-20 03:23:53.789901-04
17	wagtailcore	0003_add_uniqueness_constraint_on_group_page_permission	2016-07-20 03:23:53.800841-04
18	wagtailcore	0004_page_locked	2016-07-20 03:23:53.812718-04
19	wagtailcore	0005_add_page_lock_permission_to_moderators	2016-07-20 03:23:53.823009-04
20	wagtailcore	0006_add_lock_page_permission	2016-07-20 03:23:53.834197-04
21	wagtailcore	0007_page_latest_revision_created_at	2016-07-20 03:23:53.845287-04
22	wagtailcore	0008_populate_latest_revision_created_at	2016-07-20 03:23:53.857034-04
23	wagtailcore	0009_remove_auto_now_add_from_pagerevision_created_at	2016-07-20 03:23:53.867543-04
24	wagtailcore	0010_change_page_owner_to_null_on_delete	2016-07-20 03:23:53.878668-04
25	wagtailcore	0011_page_first_published_at	2016-07-20 03:23:53.889735-04
26	wagtailcore	0012_extend_page_slug_field	2016-07-20 03:23:53.900882-04
27	wagtailcore	0013_update_golive_expire_help_text	2016-07-20 03:23:53.911871-04
28	wagtailcore	0014_add_verbose_name	2016-07-20 03:23:53.923776-04
29	wagtailcore	0015_add_more_verbose_names	2016-07-20 03:23:53.934823-04
30	wagtailcore	0016_change_page_url_path_to_text_field	2016-07-20 03:23:53.945301-04
31	wagtailimages	0002_initial_data	2016-07-20 03:23:54.000976-04
32	wagtailimages	0003_fix_focal_point_fields	2016-07-20 03:23:54.156221-04
33	wagtailimages	0004_make_focal_point_key_not_nullable	2016-07-20 03:23:54.223274-04
34	wagtailimages	0005_make_filter_spec_unique	2016-07-20 03:23:54.357048-04
35	wagtailimages	0006_add_verbose_names	2016-07-20 03:23:54.534611-04
36	wagtaildocs	0001_initial	2016-07-20 03:23:54.679326-04
37	wagtaildocs	0002_initial_data	2016-07-20 03:23:54.723855-04
38	wagtaildocs	0003_add_verbose_names	2016-07-20 03:23:54.879395-04
39	blog	0001_initial	2016-07-20 03:23:56.192529-04
40	blog	0002_auto_20151021_1630	2016-07-20 03:23:56.649922-04
41	contact	0001_initial	2016-07-20 03:23:57.328834-04
42	contact	0002_auto_20151229_1657	2016-07-20 03:23:58.485538-04
43	wagtailimages	0007_image_file_size	2016-07-20 03:23:58.594993-04
44	wagtailimages	0008_image_created_at_index	2016-07-20 03:23:58.717432-04
45	wagtailcore	0017_change_edit_page_permission_description	2016-07-20 03:23:58.785754-04
46	wagtailcore	0018_pagerevision_submitted_for_moderation_index	2016-07-20 03:23:58.917292-04
47	wagtailcore	0019_verbose_names_cleanup	2016-07-20 03:23:59.233977-04
48	documents_gallery	0001_initial	2016-07-20 03:23:59.985089-04
49	events	0001_initial	2016-07-20 03:24:03.132393-04
50	events	0002_auto_20151014_1415	2016-07-20 03:24:03.398074-04
51	events	0003_auto_20151021_1630	2016-07-20 03:24:04.417499-04
52	wagtailcore	0020_add_index_on_page_first_published_at	2016-07-20 03:24:06.220905-04
53	wagtailcore	0021_capitalizeverbose	2016-07-20 03:24:09.010001-04
54	wagtailcore	0022_add_site_name	2016-07-20 03:24:11.611224-04
55	wagtailcore	0023_alter_page_revision_on_delete_behaviour	2016-07-20 03:24:11.776431-04
56	wagtailcore	0024_collection	2016-07-20 03:24:13.955204-04
57	wagtailcore	0025_collection_initial_data	2016-07-20 03:24:14.021854-04
58	wagtailcore	0026_group_collection_permission	2016-07-20 03:24:14.599707-04
59	wagtailcore	0027_fix_collection_path_collation	2016-07-20 03:24:14.778425-04
60	wagtailcore	0024_alter_page_content_type_on_delete_behaviour	2016-07-20 03:24:14.944142-04
61	wagtailcore	0028_merge	2016-07-20 03:24:14.989245-04
62	pages	0001_initial	2016-07-20 03:24:25.871752-04
63	pages	0002_create_homepage	2016-07-20 03:24:26.094867-04
64	pages	0003_advert	2016-07-20 03:24:26.483252-04
65	pages	0004_auto_20151007_1926	2016-07-20 03:24:26.614212-04
66	pages	0005_auto_20151021_1630	2016-07-20 03:24:28.316276-04
67	pages	0006_standardpage_template_string	2016-07-20 03:24:28.562268-04
68	pages	0007_socialmediasettings	2016-07-20 03:24:28.827991-04
69	people	0001_initial	2016-07-20 03:24:31.252893-04
70	people	0002_auto_20151021_1630	2016-07-20 03:24:31.810388-04
71	photo_gallery	0001_initial	2016-07-20 03:24:32.908755-04
72	products	0001_initial	2016-07-20 03:24:36.011961-04
73	products	0002_auto_20151021_1630	2016-07-20 03:24:36.509146-04
74	sessions	0001_initial	2016-07-20 03:24:36.799844-04
75	wagtail_feeds	0001_initial	2016-07-20 03:24:37.311935-04
76	wagtailadmin	0001_create_admin_access_permissions	2016-07-20 03:24:37.456995-04
77	wagtaildocs	0004_capitalizeverbose	2016-07-20 03:24:38.467421-04
78	wagtaildocs	0005_document_collection	2016-07-20 03:24:38.945895-04
79	wagtaildocs	0006_copy_document_permissions_to_collections	2016-07-20 03:24:39.090332-04
80	wagtaildocs	0005_alter_uploaded_by_user_on_delete_action	2016-07-20 03:24:39.425136-04
81	wagtaildocs	0007_merge	2016-07-20 03:24:39.445449-04
82	wagtailembeds	0001_initial	2016-07-20 03:24:39.701348-04
83	wagtailembeds	0002_add_verbose_names	2016-07-20 03:24:39.739251-04
84	wagtailembeds	0003_capitalizeverbose	2016-07-20 03:24:39.76464-04
85	wagtailforms	0001_initial	2016-07-20 03:24:40.112544-04
86	wagtailforms	0002_add_verbose_names	2016-07-20 03:24:40.476931-04
87	wagtailforms	0003_capitalizeverbose	2016-07-20 03:24:41.183877-04
88	wagtailimages	0009_capitalizeverbose	2016-07-20 03:24:42.502136-04
89	wagtailimages	0010_change_on_delete_behaviour	2016-07-20 03:24:42.691386-04
90	wagtailimages	0011_image_collection	2016-07-20 03:24:43.036271-04
91	wagtailimages	0012_copy_image_permissions_to_collections	2016-07-20 03:24:43.079883-04
92	wagtailimages	0013_make_rendition_upload_callable	2016-07-20 03:24:43.232798-04
93	wagtailredirects	0001_initial	2016-07-20 03:24:43.74739-04
94	wagtailredirects	0002_add_verbose_names	2016-07-20 03:24:44.19122-04
95	wagtailredirects	0003_make_site_field_editable	2016-07-20 03:24:44.380445-04
96	wagtailredirects	0004_set_unique_on_path_and_site	2016-07-20 03:24:45.014912-04
97	wagtailredirects	0005_capitalizeverbose	2016-07-20 03:24:46.248276-04
98	wagtailsearch	0001_initial	2016-07-20 03:24:47.192856-04
99	wagtailsearch	0002_add_verbose_names	2016-07-20 03:24:48.015332-04
100	wagtailsearch	0003_remove_editors_pick	2016-07-20 03:24:48.172825-04
101	wagtailsearchpromotions	0001_initial	2016-07-20 03:24:48.882012-04
102	wagtailsearchpromotions	0002_capitalizeverbose	2016-07-20 03:24:49.515025-04
103	wagtailusers	0001_initial	2016-07-20 03:24:49.803395-04
104	wagtailusers	0002_add_verbose_name_on_userprofile	2016-07-20 03:24:50.311326-04
105	wagtailusers	0003_add_verbose_names	2016-07-20 03:24:50.626611-04
106	wagtailusers	0004_capitalizeverbose	2016-07-20 03:24:51.321777-04
107	wagtailcore	0001_squashed_0016_change_page_url_path_to_text_field	2016-07-20 03:24:51.362389-04
108	events	0004_auto_20160720_0725	2016-07-20 03:25:16.963389-04
109	products	0003_auto_20160721_2007	2016-07-22 10:11:37.776263-04
110	products	0004_auto_20160722_1140	2016-07-22 10:11:38.161484-04
111	products	0005_auto_20160722_1148	2016-07-22 10:11:38.941252-04
112	auth	0008_alter_user_username_max_length	2016-08-23 11:23:10.700405-04
113	contact	0003_auto_20160816_0552	2016-08-23 11:23:23.852972-04
114	wagtailcore	0029_unicode_slugfield_dj19	2016-08-23 11:24:10.922543-04
115	blog	0003_auto_20160920_1219	2016-09-20 08:21:35.389048-04
116	wagtail_feeds	0002_rssfeedssettings_feed_image_in_content	2016-11-01 11:10:15.684681-04
117	wagtailcore	0030_index_on_pagerevision_created_at	2016-11-01 11:10:15.810807-04
118	wagtailimages	0014_add_filter_spec_field	2016-11-01 11:10:16.215124-04
119	wagtailimages	0015_fill_filter_spec_field	2016-11-01 11:10:16.245419-04
120	wagtailusers	0005_make_related_name_wagtail_specific	2016-11-01 11:10:16.389153-04
121	pages	0008_auto_20161220_0821	2016-12-20 04:21:26.716029-04
122	pages	0009_auto_20161220_0853	2016-12-20 04:54:35.521494-04
123	blog	0004_auto_20161220_1345	2016-12-20 10:43:09.543465-04
124	products	0006_auto_20161220_1353	2016-12-20 10:43:09.896545-04
125	wagtailcore	0031_add_page_view_restriction_types	2016-12-20 10:43:10.705128-04
126	wagtailcore	0032_add_bulk_delete_page_permission	2016-12-20 10:43:10.913312-04
127	wagtailimages	0016_deprecate_rendition_filter_relation	2016-12-20 10:43:11.450252-04
128	pages	0008_auto_20161220_1345	2016-12-20 10:47:33.789864-04
129	pages	0010_merge_20161220_1442	2016-12-20 10:47:33.806261-04
130	pages	0011_auto_20170105_1742	2017-01-05 14:06:39.171288-04
131	postgres_search	0001_initial	2017-05-29 02:46:18.027636-04
132	wagtailcore	0033_remove_golive_expiry_help_text	2017-05-29 02:46:18.165505-04
133	wagtailimages	0017_reduce_focal_point_key_max_length	2017-05-29 02:46:18.484361-04
134	wagtailimages	0018_remove_rendition_filter	2017-05-29 02:46:18.593504-04
135	wagtailimages	0019_delete_filter	2017-05-29 02:46:18.638049-04
136	wagtailusers	0006_userprofile_prefered_language	2017-05-29 02:46:18.838206-04
137	blog	0005_auto_20170529_1723	2017-06-06 09:18:19.644917-04
138	blog	0006_auto_20170605_1414	2017-06-06 09:18:20.133778-04
139	pages	0012_auto_20170606_1319	2017-06-06 09:19:37.540757-04
140	contact	0004_contactpage_telephone_2	2017-08-08 10:09:32.184948-04
141	contact	0005_contactpage_email_2	2017-08-08 10:09:32.43771-04
142	wagtailcore	0034_page_live_revision	2017-08-08 10:09:32.755519-04
143	wagtailcore	0035_page_last_published_at	2017-08-08 10:09:32.986839-04
144	wagtailcore	0036_populate_page_last_published_at	2017-08-08 10:09:33.313995-04
145	wagtailcore	0037_set_page_owner_editable	2017-08-08 10:09:33.819394-04
146	wagtailcore	0038_make_first_published_at_editable	2017-08-08 10:09:34.06626-04
147	wagtailcore	0039_collectionviewrestriction	2017-08-08 10:09:34.796912-04
148	pages	0013_videopage_videopagecarouselitem	2017-08-08 10:09:35.7815-04
149	people	0003_personpage_telephone_2	2017-08-08 10:09:36.253624-04
150	people	0004_personpage_email_2	2017-08-08 10:09:36.83787-04
151	pages	0014_auto_20170817_1705	2017-08-17 13:06:05.105908-04
152	wagtailcore	0040_page_draft_title	2017-09-07 10:14:59.367452-04
153	contact	0006_auto_20170907_1451	2017-09-07 11:16:04.271249-04
154	pages	0015_advert_button_text	2017-10-05 10:51:20.806368-04
155	blog	0007_blogindexpage_feed_image	2017-10-09 14:21:05.028094-04
156	contact	0007_contactpage_feed_image	2017-10-09 14:21:06.459621-04
157	events	0005_eventindexpage_feed_image	2017-10-09 14:21:07.336926-04
158	people	0005_personindexpage_feed_image	2017-10-09 14:21:08.248952-04
159	products	0007_productindexpage_feed_image	2017-10-09 14:21:09.411912-04
160	contact	0008_formpage_feed_image	2017-10-09 14:34:02.210929-04
161	pages	0016_sitebranding	2017-10-10 10:20:23.643092-04
162	pages	0017_standardindexpage_template_string	2017-11-02 11:50:45.755233-04
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: -
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
oyqo7t9nan14i7hf6vmcp1pa8ay3xjcg	NTRkOGQ5MzM4ZmNiNzc5ODhmNTY1ZGNlYWY2OTcwZjg2ZWU0NTRjODp7Il9hdXRoX3VzZXJfaGFzaCI6IjBjYjNmOTRmNjQxNmYyOGYwZDk2ZjIyMGRkMzgwNDNkZmQxZWRmOTQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-08-03 03:35:18.505671-04
4u3kgp7wto1smt5erv1vpp9xx1t51px9	NTRkOGQ5MzM4ZmNiNzc5ODhmNTY1ZGNlYWY2OTcwZjg2ZWU0NTRjODp7Il9hdXRoX3VzZXJfaGFzaCI6IjBjYjNmOTRmNjQxNmYyOGYwZDk2ZjIyMGRkMzgwNDNkZmQxZWRmOTQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-08-03 03:35:59.272477-04
936hrg921e5wm2143wg7z5oj9os9ckpd	NTRkOGQ5MzM4ZmNiNzc5ODhmNTY1ZGNlYWY2OTcwZjg2ZWU0NTRjODp7Il9hdXRoX3VzZXJfaGFzaCI6IjBjYjNmOTRmNjQxNmYyOGYwZDk2ZjIyMGRkMzgwNDNkZmQxZWRmOTQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-08-03 03:44:22.768627-04
zdmqgiqkw0xk3urdhc7fypiffm15sjm9	NTRkOGQ5MzM4ZmNiNzc5ODhmNTY1ZGNlYWY2OTcwZjg2ZWU0NTRjODp7Il9hdXRoX3VzZXJfaGFzaCI6IjBjYjNmOTRmNjQxNmYyOGYwZDk2ZjIyMGRkMzgwNDNkZmQxZWRmOTQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-08-03 03:45:01.992-04
mbusdj5atx6p9mgltlm1evv2es9g041n	NTRkOGQ5MzM4ZmNiNzc5ODhmNTY1ZGNlYWY2OTcwZjg2ZWU0NTRjODp7Il9hdXRoX3VzZXJfaGFzaCI6IjBjYjNmOTRmNjQxNmYyOGYwZDk2ZjIyMGRkMzgwNDNkZmQxZWRmOTQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-08-03 03:45:49.638206-04
d6zjx8wp753eveto3o7gx7bleq9d0u1p	NTRkOGQ5MzM4ZmNiNzc5ODhmNTY1ZGNlYWY2OTcwZjg2ZWU0NTRjODp7Il9hdXRoX3VzZXJfaGFzaCI6IjBjYjNmOTRmNjQxNmYyOGYwZDk2ZjIyMGRkMzgwNDNkZmQxZWRmOTQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-08-03 03:46:51.017832-04
r19m7lvr7azt31pmtdp3kos29hn8fc7q	NTRkOGQ5MzM4ZmNiNzc5ODhmNTY1ZGNlYWY2OTcwZjg2ZWU0NTRjODp7Il9hdXRoX3VzZXJfaGFzaCI6IjBjYjNmOTRmNjQxNmYyOGYwZDk2ZjIyMGRkMzgwNDNkZmQxZWRmOTQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-08-03 03:49:27.633999-04
s591fp7b5h8l2a04q96vba9qorxrfzfy	NTRkOGQ5MzM4ZmNiNzc5ODhmNTY1ZGNlYWY2OTcwZjg2ZWU0NTRjODp7Il9hdXRoX3VzZXJfaGFzaCI6IjBjYjNmOTRmNjQxNmYyOGYwZDk2ZjIyMGRkMzgwNDNkZmQxZWRmOTQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-08-03 03:51:29.749315-04
dth3o4qowrqakdbwyah8fzlezw6dmnww	NTRkOGQ5MzM4ZmNiNzc5ODhmNTY1ZGNlYWY2OTcwZjg2ZWU0NTRjODp7Il9hdXRoX3VzZXJfaGFzaCI6IjBjYjNmOTRmNjQxNmYyOGYwZDk2ZjIyMGRkMzgwNDNkZmQxZWRmOTQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-08-03 03:51:37.983028-04
982z7dyvr4t81szeh6fv2knziirl39xn	NTRkOGQ5MzM4ZmNiNzc5ODhmNTY1ZGNlYWY2OTcwZjg2ZWU0NTRjODp7Il9hdXRoX3VzZXJfaGFzaCI6IjBjYjNmOTRmNjQxNmYyOGYwZDk2ZjIyMGRkMzgwNDNkZmQxZWRmOTQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-08-03 03:52:31.929617-04
mwqp1sep3vof9f8ycyrtqsxj581rimel	NTRkOGQ5MzM4ZmNiNzc5ODhmNTY1ZGNlYWY2OTcwZjg2ZWU0NTRjODp7Il9hdXRoX3VzZXJfaGFzaCI6IjBjYjNmOTRmNjQxNmYyOGYwZDk2ZjIyMGRkMzgwNDNkZmQxZWRmOTQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-08-03 03:53:50.121411-04
qdo98cgiqx5m79ql2qdh18ot69afadny	NTRkOGQ5MzM4ZmNiNzc5ODhmNTY1ZGNlYWY2OTcwZjg2ZWU0NTRjODp7Il9hdXRoX3VzZXJfaGFzaCI6IjBjYjNmOTRmNjQxNmYyOGYwZDk2ZjIyMGRkMzgwNDNkZmQxZWRmOTQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-08-03 03:56:29.940169-04
ufa0ty80lxbi4ehh3iw6mk3q6fa0ohkm	NTRkOGQ5MzM4ZmNiNzc5ODhmNTY1ZGNlYWY2OTcwZjg2ZWU0NTRjODp7Il9hdXRoX3VzZXJfaGFzaCI6IjBjYjNmOTRmNjQxNmYyOGYwZDk2ZjIyMGRkMzgwNDNkZmQxZWRmOTQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-08-03 04:06:12.688806-04
pqlwd1yszkse1zt2rqp3kefrc6hskqoz	NTRkOGQ5MzM4ZmNiNzc5ODhmNTY1ZGNlYWY2OTcwZjg2ZWU0NTRjODp7Il9hdXRoX3VzZXJfaGFzaCI6IjBjYjNmOTRmNjQxNmYyOGYwZDk2ZjIyMGRkMzgwNDNkZmQxZWRmOTQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-08-03 04:06:51.070447-04
rn68d7jzs0k4ab0fdnbd7t16eqztoyre	NTRkOGQ5MzM4ZmNiNzc5ODhmNTY1ZGNlYWY2OTcwZjg2ZWU0NTRjODp7Il9hdXRoX3VzZXJfaGFzaCI6IjBjYjNmOTRmNjQxNmYyOGYwZDk2ZjIyMGRkMzgwNDNkZmQxZWRmOTQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-08-03 04:07:33.855239-04
4h6yezjas58eywy1kcr75kzc65crz0tf	NTRkOGQ5MzM4ZmNiNzc5ODhmNTY1ZGNlYWY2OTcwZjg2ZWU0NTRjODp7Il9hdXRoX3VzZXJfaGFzaCI6IjBjYjNmOTRmNjQxNmYyOGYwZDk2ZjIyMGRkMzgwNDNkZmQxZWRmOTQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-08-03 04:09:04.277708-04
fss6i75617h7tjb50dej1sss0x1swkne	NTRkOGQ5MzM4ZmNiNzc5ODhmNTY1ZGNlYWY2OTcwZjg2ZWU0NTRjODp7Il9hdXRoX3VzZXJfaGFzaCI6IjBjYjNmOTRmNjQxNmYyOGYwZDk2ZjIyMGRkMzgwNDNkZmQxZWRmOTQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-08-03 04:09:57.144627-04
a4dfjgt32z9gs51zep5mvdpairzcqf2n	NTRkOGQ5MzM4ZmNiNzc5ODhmNTY1ZGNlYWY2OTcwZjg2ZWU0NTRjODp7Il9hdXRoX3VzZXJfaGFzaCI6IjBjYjNmOTRmNjQxNmYyOGYwZDk2ZjIyMGRkMzgwNDNkZmQxZWRmOTQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-08-03 04:11:15.395809-04
cbvbg16nsy3ig5y6y07zm615kjm3eig7	NTRkOGQ5MzM4ZmNiNzc5ODhmNTY1ZGNlYWY2OTcwZjg2ZWU0NTRjODp7Il9hdXRoX3VzZXJfaGFzaCI6IjBjYjNmOTRmNjQxNmYyOGYwZDk2ZjIyMGRkMzgwNDNkZmQxZWRmOTQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-08-03 04:11:45.271202-04
w9teehmxlv7hkxcwl3bzzodhkzt92unm	NTRkOGQ5MzM4ZmNiNzc5ODhmNTY1ZGNlYWY2OTcwZjg2ZWU0NTRjODp7Il9hdXRoX3VzZXJfaGFzaCI6IjBjYjNmOTRmNjQxNmYyOGYwZDk2ZjIyMGRkMzgwNDNkZmQxZWRmOTQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-08-03 04:12:00.625837-04
29vved776ed9sh9yk8bnnb824wmkc18e	NTRkOGQ5MzM4ZmNiNzc5ODhmNTY1ZGNlYWY2OTcwZjg2ZWU0NTRjODp7Il9hdXRoX3VzZXJfaGFzaCI6IjBjYjNmOTRmNjQxNmYyOGYwZDk2ZjIyMGRkMzgwNDNkZmQxZWRmOTQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-08-03 04:14:00.891484-04
liuoqxcq0cepu154pdodghpg2ukbytq5	NTRkOGQ5MzM4ZmNiNzc5ODhmNTY1ZGNlYWY2OTcwZjg2ZWU0NTRjODp7Il9hdXRoX3VzZXJfaGFzaCI6IjBjYjNmOTRmNjQxNmYyOGYwZDk2ZjIyMGRkMzgwNDNkZmQxZWRmOTQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-08-03 04:15:31.888531-04
qc2828hehqmrqloue3jf181z7jybosgb	NTRkOGQ5MzM4ZmNiNzc5ODhmNTY1ZGNlYWY2OTcwZjg2ZWU0NTRjODp7Il9hdXRoX3VzZXJfaGFzaCI6IjBjYjNmOTRmNjQxNmYyOGYwZDk2ZjIyMGRkMzgwNDNkZmQxZWRmOTQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-08-03 04:19:25.12054-04
qnzkmdxmxfwo2mvlrrqm4ux428lijs6i	NTRkOGQ5MzM4ZmNiNzc5ODhmNTY1ZGNlYWY2OTcwZjg2ZWU0NTRjODp7Il9hdXRoX3VzZXJfaGFzaCI6IjBjYjNmOTRmNjQxNmYyOGYwZDk2ZjIyMGRkMzgwNDNkZmQxZWRmOTQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-08-03 04:20:58.147019-04
cgrym1ayorglh5ls6lwzbovvf9hqnfzz	NTRkOGQ5MzM4ZmNiNzc5ODhmNTY1ZGNlYWY2OTcwZjg2ZWU0NTRjODp7Il9hdXRoX3VzZXJfaGFzaCI6IjBjYjNmOTRmNjQxNmYyOGYwZDk2ZjIyMGRkMzgwNDNkZmQxZWRmOTQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-08-03 04:21:52.069327-04
04d5nnae5xwfyra6hpo1y9z8ah02kw2k	NTRkOGQ5MzM4ZmNiNzc5ODhmNTY1ZGNlYWY2OTcwZjg2ZWU0NTRjODp7Il9hdXRoX3VzZXJfaGFzaCI6IjBjYjNmOTRmNjQxNmYyOGYwZDk2ZjIyMGRkMzgwNDNkZmQxZWRmOTQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-08-03 04:25:13.790593-04
no77ce1uw6kj6s0cql1g1n4fwwdgudua	NTRkOGQ5MzM4ZmNiNzc5ODhmNTY1ZGNlYWY2OTcwZjg2ZWU0NTRjODp7Il9hdXRoX3VzZXJfaGFzaCI6IjBjYjNmOTRmNjQxNmYyOGYwZDk2ZjIyMGRkMzgwNDNkZmQxZWRmOTQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-08-03 04:25:58.171698-04
g8h8dew8znrtz745tobk2s8kgsauibqw	NTRkOGQ5MzM4ZmNiNzc5ODhmNTY1ZGNlYWY2OTcwZjg2ZWU0NTRjODp7Il9hdXRoX3VzZXJfaGFzaCI6IjBjYjNmOTRmNjQxNmYyOGYwZDk2ZjIyMGRkMzgwNDNkZmQxZWRmOTQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-08-03 04:27:03.305773-04
qibmhxgijkb66vb4yhidrhetfc3xv2po	NTRkOGQ5MzM4ZmNiNzc5ODhmNTY1ZGNlYWY2OTcwZjg2ZWU0NTRjODp7Il9hdXRoX3VzZXJfaGFzaCI6IjBjYjNmOTRmNjQxNmYyOGYwZDk2ZjIyMGRkMzgwNDNkZmQxZWRmOTQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-08-03 04:29:47.051498-04
9rcsuxft0b7jz6ojoum4ibimo1k4jcnt	NTRkOGQ5MzM4ZmNiNzc5ODhmNTY1ZGNlYWY2OTcwZjg2ZWU0NTRjODp7Il9hdXRoX3VzZXJfaGFzaCI6IjBjYjNmOTRmNjQxNmYyOGYwZDk2ZjIyMGRkMzgwNDNkZmQxZWRmOTQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-08-03 04:35:42.191954-04
rd1nljq4s7vukj05p3fak8fony58jhoq	NTRkOGQ5MzM4ZmNiNzc5ODhmNTY1ZGNlYWY2OTcwZjg2ZWU0NTRjODp7Il9hdXRoX3VzZXJfaGFzaCI6IjBjYjNmOTRmNjQxNmYyOGYwZDk2ZjIyMGRkMzgwNDNkZmQxZWRmOTQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-08-03 04:37:52.298986-04
yty6ww8edhg0uxt4o0vb0y76l01yr0aj	NTRkOGQ5MzM4ZmNiNzc5ODhmNTY1ZGNlYWY2OTcwZjg2ZWU0NTRjODp7Il9hdXRoX3VzZXJfaGFzaCI6IjBjYjNmOTRmNjQxNmYyOGYwZDk2ZjIyMGRkMzgwNDNkZmQxZWRmOTQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-08-03 04:38:32.360369-04
h9ls385qyqf1ccm6kfkmu29jn2sau18p	NTRkOGQ5MzM4ZmNiNzc5ODhmNTY1ZGNlYWY2OTcwZjg2ZWU0NTRjODp7Il9hdXRoX3VzZXJfaGFzaCI6IjBjYjNmOTRmNjQxNmYyOGYwZDk2ZjIyMGRkMzgwNDNkZmQxZWRmOTQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-08-03 04:39:48.290496-04
ihfb86gjvjphe9nlp2pj0s5mnd4yde1p	NTRkOGQ5MzM4ZmNiNzc5ODhmNTY1ZGNlYWY2OTcwZjg2ZWU0NTRjODp7Il9hdXRoX3VzZXJfaGFzaCI6IjBjYjNmOTRmNjQxNmYyOGYwZDk2ZjIyMGRkMzgwNDNkZmQxZWRmOTQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-08-05 10:12:31.50711-04
nw2z5kyd2i5o308w55wdxmv74nniuacz	ZGE0MjFjYzI3MWIyYzRkMWU0Y2E0MGMzNWNmMTU0Njg3OTFkNDJjNzp7Il9hdXRoX3VzZXJfaGFzaCI6ImZiMjZiOTA0ZTBjZDRjNzUxYTA2YmRlZmQ2Mzk5MGYwMWZlNTdjOTIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-09-06 11:25:47.16047-04
fhs7v7i4w6goldqc6yursm2xqhx7x7j4	ZGE0MjFjYzI3MWIyYzRkMWU0Y2E0MGMzNWNmMTU0Njg3OTFkNDJjNzp7Il9hdXRoX3VzZXJfaGFzaCI6ImZiMjZiOTA0ZTBjZDRjNzUxYTA2YmRlZmQ2Mzk5MGYwMWZlNTdjOTIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-10-04 08:23:01.92766-04
811jc8mh30ituzkzv66649gfb8big0av	ZGE0MjFjYzI3MWIyYzRkMWU0Y2E0MGMzNWNmMTU0Njg3OTFkNDJjNzp7Il9hdXRoX3VzZXJfaGFzaCI6ImZiMjZiOTA0ZTBjZDRjNzUxYTA2YmRlZmQ2Mzk5MGYwMWZlNTdjOTIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-11-15 11:21:36.221904-04
sk3q2jzh0mudb8zlgczrf9iq51vlwz9c	ZGE0MjFjYzI3MWIyYzRkMWU0Y2E0MGMzNWNmMTU0Njg3OTFkNDJjNzp7Il9hdXRoX3VzZXJfaGFzaCI6ImZiMjZiOTA0ZTBjZDRjNzUxYTA2YmRlZmQ2Mzk5MGYwMWZlNTdjOTIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-01-03 04:16:05.124968-04
f7mzlb668r0y8j3s8ifhx9y1lp5oa5n5	ZmExY2Y1ZGVlNDQ4MjgzMzBmYzBhYzkzZDNmYzY1OGVkYzJiMTlmMTp7Il9hdXRoX3VzZXJfaGFzaCI6ImM0NWIyMjc4MmRlM2JiYzU2NjFkZjNmM2Q2MzNiNDdkODhkMmVhN2MiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-06-12 02:47:56.456764-04
fe632xaodlns0yx8u27dzxgzfvz56zuy	ZmExY2Y1ZGVlNDQ4MjgzMzBmYzBhYzkzZDNmYzY1OGVkYzJiMTlmMTp7Il9hdXRoX3VzZXJfaGFzaCI6ImM0NWIyMjc4MmRlM2JiYzU2NjFkZjNmM2Q2MzNiNDdkODhkMmVhN2MiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-06-20 09:20:47.466637-04
3e8ibx9rj4x991ad7katd4ct9pkwtlgb	ZmExY2Y1ZGVlNDQ4MjgzMzBmYzBhYzkzZDNmYzY1OGVkYzJiMTlmMTp7Il9hdXRoX3VzZXJfaGFzaCI6ImM0NWIyMjc4MmRlM2JiYzU2NjFkZjNmM2Q2MzNiNDdkODhkMmVhN2MiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-09-21 10:17:16.955274-04
ufz0a91jvzhyo6qwu244wuh6m2m07u1w	ZmExY2Y1ZGVlNDQ4MjgzMzBmYzBhYzkzZDNmYzY1OGVkYzJiMTlmMTp7Il9hdXRoX3VzZXJfaGFzaCI6ImM0NWIyMjc4MmRlM2JiYzU2NjFkZjNmM2Q2MzNiNDdkODhkMmVhN2MiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-09-21 11:17:04.180546-04
uw6t4ywi903n5ydri8zemcx1e1861r3m	ZmExY2Y1ZGVlNDQ4MjgzMzBmYzBhYzkzZDNmYzY1OGVkYzJiMTlmMTp7Il9hdXRoX3VzZXJfaGFzaCI6ImM0NWIyMjc4MmRlM2JiYzU2NjFkZjNmM2Q2MzNiNDdkODhkMmVhN2MiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-10-19 10:52:02.176801-04
zbvjagpokjc7v8pqef73wp8lt9bxcm3f	ZmExY2Y1ZGVlNDQ4MjgzMzBmYzBhYzkzZDNmYzY1OGVkYzJiMTlmMTp7Il9hdXRoX3VzZXJfaGFzaCI6ImM0NWIyMjc4MmRlM2JiYzU2NjFkZjNmM2Q2MzNiNDdkODhkMmVhN2MiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-10-24 10:21:18.228257-04
7lv8o8s8srob6k2h5bfxwzvd83bryqb6	ZmExY2Y1ZGVlNDQ4MjgzMzBmYzBhYzkzZDNmYzY1OGVkYzJiMTlmMTp7Il9hdXRoX3VzZXJfaGFzaCI6ImM0NWIyMjc4MmRlM2JiYzU2NjFkZjNmM2Q2MzNiNDdkODhkMmVhN2MiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-11-16 11:53:26.37437-04
\.


--
-- Data for Name: documents_gallery_documentsindexpage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY documents_gallery_documentsindexpage (page_ptr_id, intro, feed_image_id) FROM stdin;
20		\N
\.


--
-- Data for Name: documents_gallery_documentspage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY documents_gallery_documentspage (page_ptr_id, feed_image_id) FROM stdin;
21	\N
\.


--
-- Data for Name: documents_gallery_documentspagetag; Type: TABLE DATA; Schema: public; Owner: -
--

COPY documents_gallery_documentspagetag (id, content_object_id, tag_id) FROM stdin;
2	21	5
\.


--
-- Data for Name: events_eventindexpage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY events_eventindexpage (page_ptr_id, intro, feed_image_id) FROM stdin;
12		\N
\.


--
-- Data for Name: events_eventindexpagerelatedlink; Type: TABLE DATA; Schema: public; Owner: -
--

COPY events_eventindexpagerelatedlink (id, sort_order, link_external, title, link_document_id, link_page_id, page_id) FROM stdin;
\.


--
-- Data for Name: events_eventpage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY events_eventpage (page_ptr_id, date_from, date_to, time_from, time_to, audience, location, body, cost, signup_link, feed_image_id) FROM stdin;
14	2020-06-17	\N	\N	\N	\N					3
15	2021-08-12	\N	\N	\N	\N					9
13	2019-06-01	2020-11-13	10:00:00	14:00:00	public	ChrisDev Headquaters	<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque \nporttitor ullamcorper ullamcorper. Vestibulum ante ipsum primis in \nfaucibus orci luctus et ultrices posuere cubilia Curae; Curabitur \nposuere imperdiet lacus ut faucibus. Donec aliquam nisi eu varius \nvestibulum.</p><p>Fusce porttitor facilisis sapien. Duis a gravida elit. Sed \nblandit mollis enim quis pharetra. Vivamus faucibus facilisis metus \nconvallis venenatis. Vestibulum sollicitudin ac turpis sit amet blandit.\n</p>	FREE	http://chrisdev.com	9
\.


--
-- Data for Name: events_eventpagecarouselitem; Type: TABLE DATA; Schema: public; Owner: -
--

COPY events_eventpagecarouselitem (id, sort_order, link_external, embed_url, caption, image_id, link_document_id, link_page_id, page_id) FROM stdin;
\.


--
-- Data for Name: events_eventpagerelatedlink; Type: TABLE DATA; Schema: public; Owner: -
--

COPY events_eventpagerelatedlink (id, sort_order, link_external, title, link_document_id, link_page_id, page_id) FROM stdin;
\.


--
-- Data for Name: events_eventpagespeaker; Type: TABLE DATA; Schema: public; Owner: -
--

COPY events_eventpagespeaker (id, sort_order, link_external, full_name, image_id, link_document_id, link_page_id, page_id) FROM stdin;
\.


--
-- Data for Name: events_eventpagetag; Type: TABLE DATA; Schema: public; Owner: -
--

COPY events_eventpagetag (id, content_object_id, tag_id) FROM stdin;
3	14	3
4	15	4
5	13	1
6	13	2
\.


--
-- Data for Name: pages_advert; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pages_advert (id, link_external, title, text, image_id, link_document_id, link_page_id, page_id, button_text) FROM stdin;
\.


--
-- Data for Name: pages_contentblock; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pages_contentblock (id, link_external, title, body, summary, slug, link_document_id, link_page_id, page_id) FROM stdin;
\.


--
-- Data for Name: pages_faqspage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pages_faqspage (page_ptr_id, body) FROM stdin;
\.


--
-- Data for Name: pages_homepage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pages_homepage (page_ptr_id, title_text, body, feed_image_id) FROM stdin;
3	<h3>Welcome to Wagtail Cookiecutter Foundation</h3>	<p>A cookiecutter template for Wagtail CMS featuring Zurb Foundation front-end framework.</p>	\N
\.


--
-- Data for Name: pages_homepagecarouselitem; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pages_homepagecarouselitem (id, sort_order, link_external, embed_url, caption, image_id, link_document_id, link_page_id, page_id) FROM stdin;
1	0				3	\N	\N	3
2	1				9	\N	\N	3
3	2				5	\N	\N	3
4	3				7	\N	\N	3
\.


--
-- Data for Name: pages_homepagecontentitem; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pages_homepagecontentitem (id, sort_order, link_external, title, content, summary, slug, image_id, link_document_id, link_page_id, page_id) FROM stdin;
1	0	http://foundation.zurb.com/	Foundation 6	<p>The most advanced responsive front-end framework in the world.</p>	<p><br/></p>	foundation	11	\N	\N	3
2	1	https://wagtail.io/	Wagtail	<p>Wagtail is an open source CMS written in Python and built on the Django framework.</p>		Wagtail	10	\N	\N	3
3	2	https://www.ansible.com/	Ansible	<p>Ansible for easy Provisioning and Deployment.</p>		ansible	1	\N	\N	3
4	3	http://sass-lang.com/	Sass	<p>Sass 100%</p>		sass	8	\N	\N	3
5	4	https://www.postgresql.org/	PostgreSQL	<p>PostgreSQL everywhere!</p>		postgresql	6	\N	\N	3
6	5	https://www.digitalocean.com/	Digital Ocean	<p>Spin up servers with the Digital Ocean API</p>		digital-ocean	2	\N	\N	3
\.


--
-- Data for Name: pages_homepagerelatedlink; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pages_homepagerelatedlink (id, sort_order, link_external, title, link_document_id, link_page_id, page_id) FROM stdin;
\.


--
-- Data for Name: pages_sitebranding; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pages_sitebranding (id, site_name, logo_id, site_id) FROM stdin;
1	ChrisDev Wagtail Project	12	2
\.


--
-- Data for Name: pages_socialmediasettings; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pages_socialmediasettings (id, facebook, instagram, twitter_name, youtube, linkedin, github, facebook_appid, site_id) FROM stdin;
1	https://www.facebook.com/bot.chrisdev?fref=ts		realchrisdev			https://www.github.com/chrisdev		2
\.


--
-- Data for Name: pages_standardindexpage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pages_standardindexpage (page_ptr_id, subtitle, intro, feed_image_id, template_string) FROM stdin;
4		<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam et mauris eu nibh elementum blandit varius sit amet enim. Quisque massa leo, ornare in mattis vitae, vehicula vestibulum diam. Phasellus id leo placerat, vehicula diam nec, interdum mi. Nunc lacinia massa tristique nunc accumsan, eu dapibus odio feugiat. Donec varius quam dictum placerat porttitor. Vivamus fermentum cursus nibh in facilisis. Aenean in justo auctor, faucibus risus eu, semper nisl. Ut nec suscipit nibh. Donec feugiat eget dui in rhoncus. Curabitur imperdiet tortor ut quam tempus sagittis. Morbi lectus magna, viverra ut turpis a, dapibus sollicitudin diam. Morbi vel urna suscipit, sodales ante id, luctus velit.</p>	\N	pages/standard_index_page.html
\.


--
-- Data for Name: pages_standardindexpagerelatedlink; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pages_standardindexpagerelatedlink (id, sort_order, link_external, title, link_document_id, link_page_id, page_id) FROM stdin;
\.


--
-- Data for Name: pages_standardpage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pages_standardpage (page_ptr_id, subtitle, intro, body, feed_image_id, template_string) FROM stdin;
5		<p><br/></p>	[{"type": "paragraph", "value": "<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam et \\nmauris eu nibh elementum blandit varius sit amet enim. Quisque massa \\nleo, ornare in mattis vitae, vehicula vestibulum diam. Phasellus id leo \\nplacerat, vehicula diam nec, interdum mi. Nunc lacinia massa tristique \\nnunc accumsan, eu dapibus odio feugiat. Donec varius quam dictum \\nplacerat porttitor. Vivamus fermentum cursus nibh in facilisis. Aenean \\nin justo auctor, faucibus risus eu, semper nisl. Ut nec suscipit nibh. \\nDonec feugiat eget dui in rhoncus. Curabitur imperdiet tortor ut quam \\ntempus sagittis. Morbi lectus magna, viverra ut turpis a, dapibus \\nsollicitudin diam. Morbi vel urna suscipit, sodales ante id, luctus \\nvelit.</p>"}, {"type": "image", "value": 9}, {"type": "paragraph", "value": "<p>Fusce et diam quis ipsum pulvinar euismod sit amet ac libero. Proin \\nmauris ligula, egestas at tempus non, tempor et dolor. Proin porttitor, \\nnibh quis consequat posuere, dolor eros eleifend nisi, ac semper ex \\nnulla sit amet urna. Ut venenatis eros nec gravida molestie. Integer \\nhendrerit mollis odio vitae porttitor. Sed ut elementum magna. Morbi \\nlaoreet odio lorem, eu fringilla nulla venenatis id. Duis nisl erat, \\naliquet in tortor eget, ullamcorper varius quam. Sed venenatis posuere \\nipsum, ut maximus ligula tristique fermentum. Ut eget porttitor quam. In\\n varius diam quis viverra porttutor.</p>"}]	\N	pages/standard_page_full.html
6			[{"type": "paragraph", "value": "<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam et \\nmauris eu nibh elementum blandit varius sit amet enim. Quisque massa \\nleo, ornare in mattis vitae, vehicula vestibulum diam. Phasellus id leo \\nplacerat, vehicula diam nec, interdum mi. Nunc lacinia massa tristique \\nnunc accumsan, eu dapibus odio feugiat. Donec varius quam dictum \\nplacerat porttitor. Vivamus fermentum cursus nibh in facilisis. Aenean \\nin justo auctor, faucibus risus eu, semper nisl. Ut nec suscipit nibh. \\nDonec feugiat eget dui in rhoncus. Curabitur imperdiet tortor ut quam \\ntempus sagittis. Morbi lectus magna, viverra ut turpis a, dapibus \\nsollicitudin diam. Morbi vel urna suscipit, sodales ante id, luctus \\nvelit.</p>"}, {"type": "image", "value": 3}, {"type": "paragraph", "value": "<p>Fusce et diam quis ipsum pulvinar euismod sit amet ac libero. Proin \\nmauris ligula, egestas at tempus non, tempor et dolor. Proin porttitor, \\nnibh quis consequat posuere, dolor eros eleifend nisi, ac semper ex \\nnulla sit amet urna. Ut venenatis eros nec gravida molestie. Integer \\nhendrerit mollis odio vitae porttitor. Sed ut elementum magna. Morbi \\nlaoreet odio lorem, eu fringilla nulla venenatis id. Duis nisl erat, \\naliquet in tortor eget, ullamcorper varius quam. Sed venenatis posuere \\nipsum, ut maximus ligula tristique fermentum. Ut eget porttitor quam. In\\n varius diam quis viverra porttutor.</p>"}]	\N	pages/standard_page.html
\.


--
-- Data for Name: pages_standardpagecarouselitem; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pages_standardpagecarouselitem (id, sort_order, link_external, embed_url, caption, image_id, link_document_id, link_page_id, page_id) FROM stdin;
\.


--
-- Data for Name: pages_standardpagerelatedlink; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pages_standardpagerelatedlink (id, sort_order, link_external, title, link_document_id, link_page_id, page_id) FROM stdin;
\.


--
-- Data for Name: pages_testimonial; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pages_testimonial (id, link_external, name, text, link_document_id, link_page_id, page_id, photo_id) FROM stdin;
\.


--
-- Data for Name: pages_videogallerypage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pages_videogallerypage (page_ptr_id, intro, feed_image_id) FROM stdin;
\.


--
-- Data for Name: pages_videogallerypagecarouselitem; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pages_videogallerypagecarouselitem (id, sort_order, link_external, embed_url, caption, image_id, link_document_id, link_page_id, page_id) FROM stdin;
\.


--
-- Data for Name: people_personindexpage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY people_personindexpage (page_ptr_id, subtitle, intro, feed_image_id) FROM stdin;
7		<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam et mauris eu nibh elementum blandit varius sit amet enim. Quisque massa leo, ornare in mattis vitae, vehicula vestibulum diam. Phasellus id leo placerat, vehicula diam nec, interdum mi. Nunc lacinia massa tristique nunc accumsan, eu dapibus odio feugiat. Donec varius quam dictum placerat porttitor. Vivamus fermentum cursus nibh in facilisis. Aenean in justo auctor, faucibus risus eu, semper nisl. Ut nec suscipit nibh. Donec feugiat eget dui in rhoncus. Curabitur imperdiet tortor ut quam tempus sagittis. Morbi lectus magna, viverra ut turpis a, dapibus sollicitudin diam. Morbi vel urna suscipit, sodales ante id, luctus velit.</p>	\N
\.


--
-- Data for Name: people_personindexpagerelatedlink; Type: TABLE DATA; Schema: public; Owner: -
--

COPY people_personindexpagerelatedlink (id, sort_order, link_external, title, link_document_id, link_page_id, page_id) FROM stdin;
\.


--
-- Data for Name: people_personpage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY people_personpage (page_ptr_id, name_organization, telephone, email, address_1, address_2, city, country, post_code, intro, biography, feed_image_id, image_id, role_id, telephone_2, email_2) FROM stdin;
8										<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam et mauris eu nibh elementum blandit varius sit amet enim. Quisque massa leo, ornare in mattis vitae, vehicula vestibulum diam. Phasellus id leo placerat, vehicula diam nec, interdum mi. Nunc lacinia massa tristique nunc accumsan, eu dapibus odio feugiat. Donec varius quam dictum placerat porttitor. Vivamus fermentum cursus nibh in facilisis. Aenean in justo auctor, faucibus risus eu, semper nisl. Ut nec suscipit nibh. Donec feugiat eget dui in rhoncus. Curabitur imperdiet tortor ut quam tempus sagittis. Morbi lectus magna, viverra ut turpis a, dapibus sollicitudin diam. Morbi vel urna suscipit, sodales ante id, luctus velit.</p><p>Fusce et diam quis ipsum pulvinar euismod sit amet ac libero. Proin mauris ligula, egestas at tempus non, tempor et dolor. Proin porttitor, nibh quis consequat posuere, dolor eros eleifend nisi, ac semper ex nulla sit amet urna. Ut venenatis eros nec gravida molestie. Integer hendrerit mollis odio vitae porttitor. Sed ut elementum magna. Morbi laoreet odio lorem, eu fringilla nulla venenatis id. Duis nisl erat, aliquet in tortor eget, ullamcorper varius quam. Sed venenatis posuere ipsum, ut maximus ligula tristique fermentum. Ut eget porttitor quam. In varius diam quis viverra porttutor.</p>	\N	4	\N		
9										<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam et mauris eu nibh elementum blandit varius sit amet enim. Quisque massa leo, ornare in mattis vitae, vehicula vestibulum diam. Phasellus id leo placerat, vehicula diam nec, interdum mi. Nunc lacinia massa tristique nunc accumsan, eu dapibus odio feugiat. Donec varius quam dictum placerat porttitor. Vivamus fermentum cursus nibh in facilisis. Aenean in justo auctor, faucibus risus eu, semper nisl. Ut nec suscipit nibh. Donec feugiat eget dui in rhoncus. Curabitur imperdiet tortor ut quam tempus sagittis. Morbi lectus magna, viverra ut turpis a, dapibus sollicitudin diam. Morbi vel urna suscipit, sodales ante id, luctus velit.</p><p>Fusce et diam quis ipsum pulvinar euismod sit amet ac libero. Proin mauris ligula, egestas at tempus non, tempor et dolor. Proin porttitor, nibh quis consequat posuere, dolor eros eleifend nisi, ac semper ex nulla sit amet urna. Ut venenatis eros nec gravida molestie. Integer hendrerit mollis odio vitae porttitor. Sed ut elementum magna. Morbi laoreet odio lorem, eu fringilla nulla venenatis id. Duis nisl erat, aliquet in tortor eget, ullamcorper varius quam. Sed venenatis posuere ipsum, ut maximus ligula tristique fermentum. Ut eget porttitor quam. In varius diam quis viverra porttutor.</p>	\N	4	\N		
10										<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam et mauris eu nibh elementum blandit varius sit amet enim. Quisque massa leo, ornare in mattis vitae, vehicula vestibulum diam. Phasellus id leo placerat, vehicula diam nec, interdum mi. Nunc lacinia massa tristique nunc accumsan, eu dapibus odio feugiat. Donec varius quam dictum placerat porttitor. Vivamus fermentum cursus nibh in facilisis. Aenean in justo auctor, faucibus risus eu, semper nisl. Ut nec suscipit nibh. Donec feugiat eget dui in rhoncus. Curabitur imperdiet tortor ut quam tempus sagittis. Morbi lectus magna, viverra ut turpis a, dapibus sollicitudin diam. Morbi vel urna suscipit, sodales ante id, luctus velit.</p><p>Fusce et diam quis ipsum pulvinar euismod sit amet ac libero. Proin mauris ligula, egestas at tempus non, tempor et dolor. Proin porttitor, nibh quis consequat posuere, dolor eros eleifend nisi, ac semper ex nulla sit amet urna. Ut venenatis eros nec gravida molestie. Integer hendrerit mollis odio vitae porttitor. Sed ut elementum magna. Morbi laoreet odio lorem, eu fringilla nulla venenatis id. Duis nisl erat, aliquet in tortor eget, ullamcorper varius quam. Sed venenatis posuere ipsum, ut maximus ligula tristique fermentum. Ut eget porttitor quam. In varius diam quis viverra porttutor.</p>	\N	4	\N		
11										<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam et mauris eu nibh elementum blandit varius sit amet enim. Quisque massa leo, ornare in mattis vitae, vehicula vestibulum diam. Phasellus id leo placerat, vehicula diam nec, interdum mi. Nunc lacinia massa tristique nunc accumsan, eu dapibus odio feugiat. Donec varius quam dictum placerat porttitor. Vivamus fermentum cursus nibh in facilisis. Aenean in justo auctor, faucibus risus eu, semper nisl. Ut nec suscipit nibh. Donec feugiat eget dui in rhoncus. Curabitur imperdiet tortor ut quam tempus sagittis. Morbi lectus magna, viverra ut turpis a, dapibus sollicitudin diam. Morbi vel urna suscipit, sodales ante id, luctus velit.</p><p>Fusce et diam quis ipsum pulvinar euismod sit amet ac libero. Proin mauris ligula, egestas at tempus non, tempor et dolor. Proin porttitor, nibh quis consequat posuere, dolor eros eleifend nisi, ac semper ex nulla sit amet urna. Ut venenatis eros nec gravida molestie. Integer hendrerit mollis odio vitae porttitor. Sed ut elementum magna. Morbi laoreet odio lorem, eu fringilla nulla venenatis id. Duis nisl erat, aliquet in tortor eget, ullamcorper varius quam. Sed venenatis posuere ipsum, ut maximus ligula tristique fermentum. Ut eget porttitor quam. In varius diam quis viverra porttutor.</p>	\N	4	\N		
\.


--
-- Data for Name: people_personpagerelatedlink; Type: TABLE DATA; Schema: public; Owner: -
--

COPY people_personpagerelatedlink (id, sort_order, link_external, title, link_document_id, link_page_id, page_id) FROM stdin;
\.


--
-- Data for Name: people_personpagetag; Type: TABLE DATA; Schema: public; Owner: -
--

COPY people_personpagetag (id, content_object_id, tag_id) FROM stdin;
\.


--
-- Data for Name: people_personrole; Type: TABLE DATA; Schema: public; Owner: -
--

COPY people_personrole (id, name) FROM stdin;
\.


--
-- Data for Name: photo_gallery_galleryindexpage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY photo_gallery_galleryindexpage (page_ptr_id, intro, feed_image_id) FROM stdin;
22		\N
\.


--
-- Data for Name: photo_gallery_gallerypage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY photo_gallery_gallerypage (page_ptr_id, feed_image_id) FROM stdin;
23	9
\.


--
-- Data for Name: photo_gallery_gallerypagetag; Type: TABLE DATA; Schema: public; Owner: -
--

COPY photo_gallery_gallerypagetag (id, content_object_id, tag_id) FROM stdin;
3	23	6
2	23	6
\.


--
-- Data for Name: postgres_search_indexentry; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postgres_search_indexentry (id, object_id, body_search, content_type_id) FROM stdin;
2	1	'document':1A 'document.doc':2A	3
3	2	'document':1A 'example.docx':2A	3
4	3	'document':1A 'sample.pdf':2A	3
5	1	'ansible.png':1A	2
6	2	'digital_ocean.png':1A	2
7	3	'foundation.jpg':2A 'photo':1A	2
8	4	'placeholder_person.png':1A	2
9	5	'photo':1A 'postgresql.jpg':2A	2
10	6	'postgresql.png':1A	2
11	7	'photo':1A 'sass.jpg':2A	2
12	8	'sass.png':1A	2
13	9	'photo':1A 'wagtail.jpg':2A	2
14	10	'wagtail.png':1A	2
15	11	'yeti.png':1A	2
16	1	'root':1B	1
17	3	'homepag':1B	4
1	16	'blog':1B 'index':2B	43
22	17	'1':3,225B '2':134 'ac':30,44,103,166,219 'ad':149 'adipisc':10 'aenean':116 'aliquam':85 'amet':8,23,182,209 'ant':81,167,198 'aptent':146 'arcu':55 'bibendum':176 'blandit':74 'blog':223B 'class':145 'commodo':177 'congu':57 'consectetur':9 'consequat':76 'conubia':153 'conval':107 'cras':123 'curabitur':69 'dapibus':19 'diam':66,126 'dignissim':121 'dolor':6,26,144,160,214 'donec':52,178 'dui':48,158,222 'efficitur':216 'egesta':61,140 'eget':42,60,63,92,119,175 'elit':11,101 'enim':31,37,210 'est':139 'et':25,33,82,113,163,185 'etiam':93 'eu':20,204 'ex':15 'facilisi':39 'fame':165 'faucibus':28,171,179 'feli':72,108 'fermentum':83 'feugiat':67,89 'fringilla':68 'fusc':109 'gravida':35,192 'head':2,133 'hendrerit':79,80 'himenaeo':157 'iaculi':91 'id':73,117,138,206 'imperdiet':104 'incepto':156 'interdum':17,162,184 'ipsum':5,168,180 'justo':18,90 'lacus':118,174,202 'lectus':125 'libero':45,51 'litora':150 'loborti':13,102,211 'lorem':4,87 'luctus':212 'malesuada':70,164,197 'massa':137,218 'matti':195 'mauri':71,84 'metus':161 'morbi':196 'nequ':96,129,191 'nibh':43,115 'nisi':193,199 'non':29,95 'nostra':154 'nulla':56 'nullam':213 'nunc':41,172 'odio':75,120 'orci':14,112 'ornar':94,188 'page':224B 'pellentesqu':205,220 'per':152,155 'phasellus':99 'placerat':47 'porttitor':173 'praesent':12,135 'primi':169 'pulvinar':128,221 'purus':215 'quam':100 'qui':49 'quisqu':189 'risus':24,59,207 'sagitti':124,186 'sapien':34,40,64 'scelerisqu':106 'sed':32,88,142,159 'sem':183 'semper':114 'sit':7,22,181,208 'sociosqu':148 'sodal':194 'sollicitudin':36 'taciti':147 'tempor':27 'tempus':46 'test':1,132 'tincidunt':54 'torquent':151 'tortor':187 'tristiqu':190 'turpi':50 'ultric':98 'ultrici':203 'ut':62,65,78,127 'varius':86 'vehicula':111 'vel':53,200 'venenati':122,130,201 'vestibulum':21 'vita':77,105,143 'volutpat':141	47
20	6	'ac':117,139 'accumsan':46 'adipisc':9 'aenean':63 'aliquam':11 'aliquet':174 'amet':7,20,116,144 'ant':104 'auctor':66 'blandit':17 'consectetur':8 'consequat':133 'curabitur':82 'cursus':59 'dapibus':48,96 'diam':31,37,98,110,196 'dictum':54 'dolor':5,128,135 'donec':51,76 'dui':79,171 'egesta':122 'eget':78,177,191 'eleifend':137 'elementum':16,160 'elit':10 'enim':21 'erat':173 'ero':136,148 'et':12,109,127 'eu':14,47,69,166 'euismod':114 'ex':141 'facilisi':62 'faucibus':67 'fermentum':58,189 'feugiat':50,77 'fringilla':167 'fusc':108 'gravida':150 'hendrerit':153 'id':33,105,170 'imperdiet':83 'integ':152 'interdum':39 'ipsum':4,112,184 'justo':65 'lacinia':42 'laoreet':163 'lectus':90 'leo':24,34 'libero':118 'ligula':121,187 'lorem':3,165 'luctus':106 'magna':91,161 'massa':23,43 'matti':27 'mauri':13,120 'maximus':186 'mi':40 'molesti':151 'molli':154 'morbi':89,99,162 'nec':38,73,149 'nibh':15,60,75,131 'nisi':138 'nisl':71,172 'non':125 'nulla':142,168 'nunc':41,45 'odio':49,155,164 'ornar':25 'page':2B 'phasellus':32 'placerat':35,55 'porttitor':56,130,157,192 'porttutor':199 'posuer':134,183 'proin':119,129 'pulvinar':113 'quam':53,86,180,193 'qui':111,132,197 'quisqu':22 'rhoncus':81 'risus':68 'sagitti':88 'sed':158,181 'semper':70,140 'sit':6,19,115,143 'sodal':103 'sollicitudin':97 'standard':1B 'suscipit':74,102 'tempor':126 'tempus':87,124 'tortor':84,176 'tristiqu':44,188 'turpi':94 'ullamcorp':178 'urna':101,145 'ut':72,85,93,146,159,185,190 'varius':18,52,179,195 'vehicula':29,36 'vel':100 'velit':107 'venenati':147,169,182 'vestibulum':30 'vita':28,156 'vivamus':57 'viverra':92,198	37
23	18	'2':110B 'accumsan':44 'adipisc':7 'aenean':61 'aliquam':9 'amet':5,18 'ant':102 'auctor':64 'blandit':15 'blog':108B 'consectetur':6 'curabitur':80 'cursus':57 'dapibus':46,94 'diam':29,35,96 'dictum':52 'dolor':3 'donec':49,74 'dui':77 'eget':76 'elementum':14 'elit':8 'enim':19 'et':10 'eu':12,45,67 'facilisi':60 'faucibus':65 'fermentum':56 'feugiat':48,75 'head':107 'id':31,103 'imperdiet':81 'interdum':37 'ipsum':2 'justo':63 'lacinia':40 'lectus':88 'leo':22,32 'lorem':1 'luctus':104 'magna':89 'massa':21,41 'matti':25 'mauri':11 'mi':38 'morbi':87,97 'nec':36,71 'nibh':13,58,73 'nisl':69 'nunc':39,43 'odio':47 'ornar':23 'page':109B 'phasellus':30 'placerat':33,53 'porttitor':54 'quam':51,84 'quisqu':20 'rhoncus':79 'risus':66 'sagitti':86 'semper':68 'sit':4,17 'sodal':101 'sollicitudin':95 'suscipit':72,100 'tempus':85 'test':106 'tortor':82 'tristiqu':42 'turpi':92 'urna':99 'ut':70,83,91 'varius':16,50 'vehicula':27,34 'vel':98 'velit':105 'vestibulum':28 'vita':26 'vivamus':55 'viverra':90	47
24	19	'1':108 '2':111 '3':114B 'accumsan':44 'adipisc':7 'aenean':61 'aliquam':9 'amet':5,18 'ant':102 'auctor':64 'blandit':15 'blog':112B 'consectetur':6 'curabitur':80 'cursus':57 'dapibus':46,94 'diam':29,35,96 'dictum':52 'dolor':3 'donec':49,74 'dui':77 'eget':76 'elementum':14 'elit':8 'enim':19 'et':10 'eu':12,45,67 'facilisi':60 'faucibus':65 'fermentum':56 'feugiat':48,75 'head':107,110 'id':31,103 'imperdiet':81 'interdum':37 'ipsum':2 'justo':63 'lacinia':40 'lectus':88 'leo':22,32 'lorem':1 'luctus':104 'magna':89 'massa':21,41 'matti':25 'mauri':11 'mi':38 'morbi':87,97 'nec':36,71 'nibh':13,58,73 'nisl':69 'nunc':39,43 'odio':47 'ornar':23 'page':113B 'phasellus':30 'placerat':33,53 'porttitor':54 'quam':51,84 'quisqu':20 'rhoncus':79 'risus':66 'sagitti':86 'semper':68 'sit':4,17 'sodal':101 'sollicitudin':95 'suscipit':72,100 'tempus':85 'test':106,109 'tortor':82 'tristiqu':42 'turpi':92 'urna':99 'ut':70,83,91 'varius':16,50 'vehicula':27,34 'vel':98 'velit':105 'vestibulum':28 'vita':26 'vivamus':55 'viverra':90	47
25	12	'event':1B 'index':2B	49
18	4	'index':2B 'standard':1B	34
26	13	'1':70B 'ac':62 'adipisc':9 'aliquam':35 'amet':7,65 'ant':16 'blandit':49,66 'chrisdev':1 'consectetur':8 'conval':58 'cubilia':26 'cura':27 'curabitur':28 'dolor':5 'donec':34 'dui':44 'elit':10,47 'enim':51 'et':23 'eu':37 'event':68B 'facilisi':42,56 'faucibus':20,33,55 'fusc':40 'gravida':46 'headquat':2 'imperdiet':30 'ipsum':4,17 'lacus':31 'lorem':3 'luctus':22 'metus':57 'molli':50 'nisi':36 'orci':21 'page':69B 'pellentesqu':11 'pharetra':53 'porttitor':12,41 'posuer':25,29 'primi':18 'public':67 'qui':52 'sapien':43 'sed':48 'sit':6,64 'sollicitudin':61 'turpi':63 'ullamcorp':13,14 'ultric':24 'ut':32 'varius':38 'venenati':59 'vestibulum':15,39,60 'vivamus':54	54
27	14	'2':4B 'event':2B 'none':1 'page':3B	54
28	15	'3':4B 'event':2B 'none':1 'page':3B	54
29	24	'contact':1B 'us':2B	58
30	7	'index':2B 'person':1B	60
31	8	'1':3B 'page':2B 'person':1B	64
32	9	'2':3B 'page':2B 'person':1B	64
33	10	'3':3B 'page':2B 'person':1B	64
34	11	'4':3B 'page':2B 'person':1B	64
35	22	'galleri':2B 'photo':1B	65
36	23	'galleri':2B 'sampl':1B	67
37	20	'document':1B 'galleri':2B	73
38	21	'document':2B 'sampl':1B	75
19	5	'ac':119,141 'accumsan':48 'adipisc':11 'aenean':65 'aliquam':13 'aliquet':176 'amet':9,22,118,146 'ant':106 'auctor':68 'blandit':19 'consectetur':10 'consequat':135 'curabitur':84 'cursus':61 'dapibus':50,98 'diam':33,39,100,112,198 'dictum':56 'dolor':7,130,137 'donec':53,78 'dui':81,173 'egesta':124 'eget':80,179,193 'eleifend':139 'elementum':18,162 'elit':12 'enim':23 'erat':175 'ero':138,150 'et':14,111,129 'eu':16,49,71,168 'euismod':116 'ex':143 'facilisi':64 'faucibus':69 'fermentum':60,191 'feugiat':52,79 'fringilla':169 'fusc':110 'gravida':152 'hendrerit':155 'id':35,107,172 'imperdiet':85 'integ':154 'interdum':41 'ipsum':6,114,186 'justo':67 'lacinia':44 'laoreet':165 'lectus':92 'leo':26,36 'libero':120 'ligula':123,189 'lorem':5,167 'luctus':108 'magna':93,163 'massa':25,45 'matti':29 'mauri':15,122 'maximus':188 'mi':42 'molesti':153 'molli':156 'morbi':91,101,164 'nec':40,75,151 'nibh':17,62,77,133 'nisi':140 'nisl':73,174 'non':127 'nulla':144,170 'nunc':43,47 'odio':51,157,166 'ornar':27 'page':2B 'phasellus':34 'placerat':37,57 'porttitor':58,132,159,194 'porttutor':201 'posuer':136,185 'proin':121,131 'pulvinar':115 'quam':55,88,182,195 'qui':113,134,199 'quisqu':24 'rhoncus':83 'risus':70 'sagitti':90 'sed':160,183 'semper':72,142 'sidebar':4B 'sit':8,21,117,145 'sodal':105 'sollicitudin':99 'standard':1B 'suscipit':76,104 'tempor':128 'tempus':89,126 'tortor':86,178 'tristiqu':46,190 'turpi':96 'ullamcorp':180 'urna':103,147 'ut':74,87,95,148,161,187,192 'varius':20,54,181,197 'vehicula':31,38 'vel':102 'velit':109 'venenati':149,171,184 'vestibulum':32 'vita':30,158 'vivamus':59 'viverra':94,200 'w/o':3B	37
43	12	'chrisdev':1A 'logo':2A	2
\.


--
-- Data for Name: products_productindexpage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY products_productindexpage (page_ptr_id, subtitle, intro, feed_image_id) FROM stdin;
\.


--
-- Data for Name: products_productindexpagerelatedlink; Type: TABLE DATA; Schema: public; Owner: -
--

COPY products_productindexpagerelatedlink (id, sort_order, link_external, title, link_document_id, link_page_id, page_id) FROM stdin;
\.


--
-- Data for Name: products_productpage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY products_productpage (page_ptr_id, price, description, feed_image_id, image_id, intro, link_demo) FROM stdin;
\.


--
-- Data for Name: products_productpagerelatedlink; Type: TABLE DATA; Schema: public; Owner: -
--

COPY products_productpagerelatedlink (id, sort_order, link_external, title, link_document_id, link_page_id, page_id) FROM stdin;
\.


--
-- Data for Name: products_productpagetag; Type: TABLE DATA; Schema: public; Owner: -
--

COPY products_productpagetag (id, content_object_id, tag_id) FROM stdin;
\.


--
-- Data for Name: taggit_tag; Type: TABLE DATA; Schema: public; Owner: -
--

COPY taggit_tag (id, name, slug) FROM stdin;
1	wagtail	wagtail
2	event1	event1
3	events2	events2
4	event3	event3
5	document	document
6	photos	photos
7	kjjjjjjjjjjjjjjjjjj	kjjjjjjjjjjjjjjjjjj
8	hgjjjjjjjbbbbbbbbbbbb	hgjjjjjjjbbbbbbbbbbbb
\.


--
-- Data for Name: taggit_taggeditem; Type: TABLE DATA; Schema: public; Owner: -
--

COPY taggit_taggeditem (id, object_id, content_type_id, tag_id) FROM stdin;
1	3	3	5
2	2	3	5
3	1	3	5
4	9	2	6
5	7	2	6
6	5	2	6
7	3	2	6
\.


--
-- Data for Name: wagtail_feeds_rssfeedssettings; Type: TABLE DATA; Schema: public; Owner: -
--

COPY wagtail_feeds_rssfeedssettings (id, feed_app_label, feed_model_name, feed_title, feed_link, feed_description, feed_author_email, feed_author_link, feed_item_description_field, feed_item_content_field, site_id, feed_image_in_content) FROM stdin;
1	blog	BlogPage	From the Desk of John Blog	http://www.example.com/news/	News and views from around the Web	john@johnblog.com	https://johnblog.com	intro	body	2	t
\.


--
-- Data for Name: wagtailcore_collection; Type: TABLE DATA; Schema: public; Owner: -
--

COPY wagtailcore_collection (id, path, depth, numchild, name) FROM stdin;
1	0001	1	0	Root
\.


--
-- Data for Name: wagtailcore_collectionviewrestriction; Type: TABLE DATA; Schema: public; Owner: -
--

COPY wagtailcore_collectionviewrestriction (id, restriction_type, password, collection_id) FROM stdin;
\.


--
-- Data for Name: wagtailcore_collectionviewrestriction_groups; Type: TABLE DATA; Schema: public; Owner: -
--

COPY wagtailcore_collectionviewrestriction_groups (id, collectionviewrestriction_id, group_id) FROM stdin;
\.


--
-- Data for Name: wagtailcore_groupcollectionpermission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY wagtailcore_groupcollectionpermission (id, collection_id, group_id, permission_id) FROM stdin;
1	1	1	4
2	1	2	4
3	1	1	5
4	1	2	5
5	1	1	1
6	1	2	1
7	1	1	2
8	1	2	2
\.


--
-- Data for Name: wagtailcore_grouppagepermission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY wagtailcore_grouppagepermission (id, permission_type, group_id, page_id) FROM stdin;
1	add	1	1
2	edit	1	1
3	publish	1	1
4	add	2	1
5	edit	2	1
6	lock	1	1
\.


--
-- Data for Name: wagtailcore_page; Type: TABLE DATA; Schema: public; Owner: -
--

COPY wagtailcore_page (id, path, depth, numchild, title, slug, live, has_unpublished_changes, url_path, seo_title, show_in_menus, search_description, go_live_at, expire_at, expired, content_type_id, owner_id, locked, latest_revision_created_at, first_published_at, live_revision_id, last_published_at, draft_title) FROM stdin;
16	000100010004	3	3	Blog Index	blog-index	t	t	/home/blog-index/		t		\N	\N	f	43	1	f	2017-05-29 02:48:04.286239-04	2016-07-20 04:11:32.157776-04	\N	\N	Blog Index
1	0001	1	1	Root	root	t	f	/		f		\N	\N	f	1	\N	f	\N	\N	\N	\N	Root
14	0001000100030002	4	0	Event Page 2	event-page-2	t	f	/home/event-index/event-page-2/		t		\N	\N	f	54	1	f	2016-07-20 04:09:41.447057-04	2016-07-20 04:09:41.570505-04	\N	2016-07-20 04:09:41.447057-04	Event Page 2
12	000100010003	3	3	Event Index	event-index	t	f	/home/event-index/		t		\N	\N	f	49	1	f	2016-07-20 04:06:58.286914-04	2016-07-20 04:06:58.53047-04	\N	2016-07-20 04:06:58.286914-04	Event Index
15	0001000100030003	4	0	Event Page 3	event-page-3	t	f	/home/event-index/event-page-3/		t		\N	\N	f	54	1	f	2016-07-20 04:10:44.402947-04	2016-07-20 04:10:44.51417-04	\N	2016-07-20 04:10:44.402947-04	Event Page 3
22	000100010006	3	1	Photo Gallery	photo-gallery	t	f	/home/photo-gallery/		t		\N	\N	f	65	1	f	2016-07-20 04:26:14.850905-04	2016-07-20 04:26:14.950408-04	\N	2016-07-20 04:26:14.850905-04	Photo Gallery
8	0001000100020001	4	0	Person Page 1	person-page-1	t	f	/home/person-index/person-page-1/		t		\N	\N	f	64	1	f	2016-07-20 03:53:19.593846-04	2016-07-20 03:53:19.687868-04	\N	2016-07-20 03:53:19.593846-04	Person Page 1
9	0001000100020002	4	0	Person Page 2	person-page-2	t	f	/home/person-index/person-page-2/		t		\N	\N	f	64	1	f	2016-07-20 03:54:19.879143-04	2016-07-20 03:54:19.97687-04	\N	2016-07-20 03:54:19.879143-04	Person Page 2
10	0001000100020003	4	0	Person Page 3	person-page-3	t	f	/home/person-index/person-page-3/		t		\N	\N	f	64	1	f	2016-07-20 03:54:52.366369-04	2016-07-20 03:54:52.464716-04	\N	2016-07-20 03:54:52.366369-04	Person Page 3
7	000100010002	3	4	Person Index	person-index	t	f	/home/person-index/		t		\N	\N	f	60	1	f	2016-07-20 03:52:02.385824-04	2016-07-20 03:52:02.470385-04	\N	2016-07-20 03:52:02.385824-04	Person Index
11	0001000100020004	4	0	Person Page 4	person-page-4	t	f	/home/person-index/person-page-4/		t		\N	\N	f	64	1	f	2016-07-20 03:55:24.424289-04	2016-07-20 03:55:24.520241-04	\N	2016-07-20 03:55:24.424289-04	Person Page 4
20	000100010005	3	1	Documents Gallery	documents-gallery	t	f	/home/documents-gallery/		t		\N	\N	f	73	1	f	2016-07-20 04:22:02.975756-04	2016-07-20 04:22:03.069215-04	\N	2016-07-20 04:22:02.975756-04	Documents Gallery
21	0001000100050001	4	0	Sample Documents	sample-documents	t	f	/home/documents-gallery/sample-documents/		t		\N	\N	f	75	1	f	2016-07-20 04:24:12.663501-04	2016-07-20 04:24:12.780898-04	\N	2016-07-20 04:24:12.663501-04	Sample Documents
24	000100010007	3	0	Contact Us	contact-us	t	f	/home/contact-us/		t		\N	\N	f	58	1	f	2016-07-20 04:33:22.946592-04	2016-07-20 04:32:19.773581-04	\N	2016-07-20 04:33:22.946592-04	Contact Us
3	00010001	2	7	Homepage	home	t	f	/home/		t		\N	\N	f	4	\N	f	2016-07-20 03:45:12.484088-04	2016-07-20 03:37:34.678451-04	\N	2016-07-20 03:45:12.484088-04	Homepage
17	0001000100040001	4	0	Blog Page 1	blog-page-1	t	f	/home/blog-index/blog-page-1/		t		\N	\N	f	47	1	f	2016-09-20 08:31:13.370445-04	2016-07-20 04:13:43.63026-04	\N	2016-09-20 08:31:13.370445-04	Blog Page 1
18	0001000100040002	4	0	Blog Page 2	blog-page-2	t	f	/home/blog-index/blog-page-2/		t		\N	\N	f	47	1	f	2016-09-20 08:38:28.178672-04	2016-07-20 04:15:09.479097-04	\N	2016-09-20 08:38:28.178672-04	Blog Page 2
19	0001000100040003	4	0	Blog Page 3	blog-page-3	t	f	/home/blog-index/blog-page-3/		t		\N	\N	f	47	1	f	2016-09-20 08:39:24.91435-04	2016-07-20 04:17:15.679154-04	\N	2016-09-20 08:39:24.91435-04	Blog Page 3
23	0001000100060001	4	0	Sample Gallery	sample-gallery	t	f	/home/photo-gallery/sample-gallery/		t		\N	\N	f	67	1	f	2016-11-01 11:21:54.076719-04	2016-07-20 04:27:21.803486-04	\N	2016-11-01 11:21:54.076719-04	Sample Gallery
13	0001000100030001	4	0	Event Page 1	event-page-1	t	f	/home/event-index/event-page-1/		t		\N	\N	f	54	1	f	2016-11-01 11:23:02.738075-04	2016-07-20 04:08:44.515126-04	\N	2016-11-01 11:23:02.738075-04	Event Page 1
5	0001000100010001	4	0	Standard Page w/o Sidebar	standard-page-wo-sidebar	t	f	/home/standard-index/standard-page-wo-sidebar/		t		\N	\N	f	37	1	f	2017-06-06 09:21:53.664968-04	2016-07-20 03:48:57.449331-04	\N	2017-06-06 09:21:53.664968-04	Standard Page w/o Sidebar
6	0001000100010002	4	0	Standard Page	standard-page	t	f	/home/standard-index/standard-page/		t		\N	\N	f	37	1	f	2017-06-06 09:22:33.296026-04	2016-07-20 03:50:19.479521-04	\N	2017-06-06 09:22:33.296026-04	Standard Page
4	000100010001	3	2	Standard Index	standard-index	t	f	/home/standard-index/		t		\N	\N	f	34	1	f	2017-11-02 12:04:54.025129-04	2016-07-20 03:46:10.958228-04	43	2017-11-02 12:04:54.895424-04	Standard Index
\.


--
-- Data for Name: wagtailcore_pagerevision; Type: TABLE DATA; Schema: public; Owner: -
--

COPY wagtailcore_pagerevision (id, submitted_for_moderation, created_at, content_json, approved_go_live_at, page_id, user_id) FROM stdin;
1	f	2016-07-20 03:37:34.562365-04	{"carousel_items": [{"link_page": null, "embed_url": "", "image": null, "link_external": "", "caption": "", "sort_order": 0, "link_document": null, "pk": null, "page": 3}], "search_description": "", "owner": null, "latest_revision_created_at": null, "go_live_at": null, "related_links": [], "title": "Homepage", "seo_title": "", "slug": "home", "live": true, "has_unpublished_changes": false, "body": "<p>A cookiecutter template for Wagtail CMS featuring Zurb Foundation front-end framework.</p>", "content_items": [], "numchild": 0, "title_text": "<h3>Welcome to Wagtail Cookiecutter Foundation</h3>", "content_type": 4, "show_in_menus": false, "path": "00010001", "url_path": "/home/", "expired": false, "pk": 3, "locked": false, "depth": 2, "first_published_at": null, "expire_at": null}	\N	3	1
3	f	2016-07-20 03:45:12.484088-04	{"carousel_items": [{"link_page": null, "embed_url": "", "image": 3, "link_external": "", "caption": "", "sort_order": 0, "link_document": null, "pk": 1, "page": 3}, {"link_page": null, "embed_url": "", "image": 9, "link_external": "", "caption": "", "sort_order": 1, "link_document": null, "pk": 2, "page": 3}, {"link_page": null, "embed_url": "", "image": 5, "link_external": "", "caption": "", "sort_order": 2, "link_document": null, "pk": 3, "page": 3}, {"link_page": null, "embed_url": "", "image": 7, "link_external": "", "caption": "", "sort_order": 3, "link_document": null, "pk": 4, "page": 3}], "search_description": "", "owner": null, "latest_revision_created_at": "2016-07-20T07:43:14.265Z", "go_live_at": null, "related_links": [], "title": "Homepage", "seo_title": "", "slug": "home", "live": true, "has_unpublished_changes": false, "body": "<p>A cookiecutter template for Wagtail CMS featuring Zurb Foundation front-end framework.</p>", "content_items": [{"slug": "foundation", "link_page": null, "title": "Foundation 6", "image": 11, "link_external": "http://foundation.zurb.com/", "summary": "<p><br/></p>", "content": "<p>The most advanced responsive front-end framework in the world.</p>", "sort_order": 0, "link_document": null, "pk": 1, "page": 3}, {"slug": "Wagtail", "link_page": null, "title": "Wagtail", "image": 10, "link_external": "https://wagtail.io/", "summary": "", "content": "<p>Wagtail is an open source CMS written in Python and built on the Django framework.</p>", "sort_order": 1, "link_document": null, "pk": 2, "page": 3}, {"slug": "ansible", "link_page": null, "title": "Ansible", "image": 1, "link_external": "https://www.ansible.com/", "summary": "", "content": "<p>Ansible for easy Provisioning and Deployment.</p>", "sort_order": 2, "link_document": null, "pk": 3, "page": 3}, {"slug": "sass", "link_page": null, "title": "Sass", "image": 8, "link_external": "http://sass-lang.com/", "summary": "", "content": "<p>Sass 100%</p>", "sort_order": 3, "link_document": null, "pk": 4, "page": 3}, {"slug": "postgresql", "link_page": null, "title": "PostgreSQL", "image": 6, "link_external": "https://www.postgresql.org/", "summary": "", "content": "<p>PostgreSQL everywhere!</p>", "sort_order": 4, "link_document": null, "pk": 5, "page": 3}, {"slug": "digital-ocean", "link_page": null, "title": "Digital Ocean", "image": 2, "link_external": "https://www.digitalocean.com/", "summary": "", "content": "<p>Spin up servers with the Digital Ocean API</p>", "sort_order": 5, "link_document": null, "pk": 6, "page": 3}], "numchild": 0, "title_text": "<h3>Welcome to Wagtail Cookiecutter Foundation</h3>", "content_type": 4, "show_in_menus": true, "path": "00010001", "url_path": "/home/", "expired": false, "pk": 3, "locked": false, "depth": 2, "first_published_at": "2016-07-20T07:37:34.678Z", "expire_at": null}	\N	3	1
2	f	2016-07-20 03:43:14.265204-04	{"carousel_items": [{"link_page": null, "embed_url": "", "image": 3, "link_external": "", "caption": "", "sort_order": 0, "link_document": null, "pk": 1, "page": 3}, {"link_page": null, "embed_url": "", "image": 9, "link_external": "", "caption": "", "sort_order": 1, "link_document": null, "pk": null, "page": 3}, {"link_page": null, "embed_url": "", "image": 5, "link_external": "", "caption": "", "sort_order": 2, "link_document": null, "pk": null, "page": 3}, {"link_page": null, "embed_url": "", "image": 7, "link_external": "", "caption": "", "sort_order": 3, "link_document": null, "pk": null, "page": 3}], "search_description": "", "owner": null, "latest_revision_created_at": "2016-07-20T07:37:34.562Z", "go_live_at": null, "related_links": [], "title": "Homepage", "seo_title": "", "slug": "home", "live": true, "has_unpublished_changes": false, "body": "<p>A cookiecutter template for Wagtail CMS featuring Zurb Foundation front-end framework.</p>", "content_items": [{"slug": "foundation", "link_page": null, "title": "Foundation 6", "image": 11, "link_external": "http://foundation.zurb.com/", "summary": "<p><br/></p>", "content": "<p>The most advanced responsive front-end framework in the world.</p>", "sort_order": 0, "link_document": null, "pk": null, "page": 3}, {"slug": "Wagtail", "link_page": null, "title": "Wagtail", "image": 10, "link_external": "https://wagtail.io/", "summary": "", "content": "<p>Wagtail is an open source CMS written in Python and built on the Django framework.</p>", "sort_order": 1, "link_document": null, "pk": null, "page": 3}, {"slug": "ansible", "link_page": null, "title": "Ansible", "image": 1, "link_external": "https://www.ansible.com/", "summary": "", "content": "<p>Ansible for easy Provisioning and Deployment.</p>", "sort_order": 2, "link_document": null, "pk": null, "page": 3}, {"slug": "sass", "link_page": null, "title": "Sass", "image": 8, "link_external": "http://sass-lang.com/", "summary": "", "content": "<p>Sass 100%</p>", "sort_order": 3, "link_document": null, "pk": null, "page": 3}, {"slug": "postgresql", "link_page": null, "title": "PostgreSQL", "image": 6, "link_external": "https://www.postgresql.org/", "summary": "", "content": "<p>PostgreSQL everywhere!</p>", "sort_order": 4, "link_document": null, "pk": null, "page": 3}, {"slug": "digital-ocean", "link_page": null, "title": "Digital Ocean", "image": 2, "link_external": "https://www.digitalocean.com/", "summary": "", "content": "<p>Spin up servers with the Digital Ocean API</p>", "sort_order": 5, "link_document": null, "pk": null, "page": 3}], "numchild": 0, "title_text": "<h3>Welcome to Wagtail Cookiecutter Foundation</h3>", "content_type": 4, "show_in_menus": false, "path": "00010001", "url_path": "/home/", "expired": false, "pk": 3, "locked": false, "depth": 2, "first_published_at": "2016-07-20T07:37:34.678Z", "expire_at": null}	\N	3	1
33	f	2016-09-20 08:26:15.509113-04	{"carousel_items": [], "search_description": "", "owner": 1, "intro": "<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam et mauris eu nibh elementum blandit varius sit amet enim. Quisque massa leo, ornare in mattis vitae, vehicula vestibulum diam. Phasellus id leo placerat, vehicula diam nec, interdum mi. Nunc lacinia massa tristique nunc accumsan, eu dapibus odio feugiat. Donec varius quam dictum placerat porttitor. Vivamus fermentum cursus nibh in facilisis. Aenean in justo auctor, faucibus risus eu, semper nisl. Ut nec suscipit nibh. Donec feugiat eget dui in rhoncus. Curabitur imperdiet tortor ut quam tempus sagittis. Morbi lectus magna, viverra ut turpis a, dapibus sollicitudin diam. Morbi vel urna suscipit, sodales ante id, luctus velit.</p>", "latest_revision_created_at": "2016-07-20T08:18:23.700Z", "go_live_at": null, "feed_image": 9, "related_links": [{"link_page": 18, "title": "Blog Page 2", "link_external": "", "sort_order": 0, "link_document": null, "pk": 3, "page": 17}, {"link_page": 19, "title": "Blog Page 3", "link_external": "", "sort_order": 1, "link_document": null, "pk": 4, "page": 17}], "title": "Blog Page 1", "seo_title": "", "slug": "blog-page-1", "live": true, "has_unpublished_changes": false, "tagged_items": [], "body": "[{\\"type\\": \\"heading\\", \\"value\\": \\"Test Heading 1\\"}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent lobortis orci ex, a interdum justo dapibus eu. Vestibulum sit amet risus et dolor tempor faucibus non ac enim. Sed et sapien gravida, sollicitudin enim at, facilisis sapien. Nunc eget nibh ac libero tempus placerat. Duis quis turpis libero. Donec vel tincidunt arcu. Nulla congue at risus eget egestas.</p><p>Ut eget sapien ut diam feugiat fringilla. Curabitur malesuada mauris felis, id blandit odio consequat vitae. Ut hendrerit hendrerit ante et fermentum. Mauris aliquam varius lorem, sed feugiat justo iaculis eget. Etiam ornare non neque at ultrices. Phasellus quam elit, lobortis ac imperdiet vitae, scelerisque convallis felis. Fusce a vehicula orci, et semper nibh. Aenean id lacus eget odio dignissim venenatis. Cras sagittis lectus diam, ut pulvinar neque venenatis in.</p>\\"}, {\\"type\\": \\"image\\", \\"value\\": 9}, {\\"type\\": \\"heading\\", \\"value\\": \\"Test Heading 2\\"}, {\\"type\\": \\"image\\", \\"value\\": 3}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>Praesent a massa id est egestas volutpat sed vitae dolor. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Duis sed dolor metus. Interdum et malesuada fames ac ante ipsum primis in faucibus. Nunc porttitor lacus eget bibendum commodo. Donec faucibus ipsum sit amet sem interdum, et sagittis tortor ornare. Quisque tristique neque gravida nisi sodales mattis. Morbi malesuada ante nisi, vel venenatis lacus ultricies eu. Pellentesque id risus sit amet enim lobortis luctus. Nullam dolor purus, efficitur in massa ac, pellentesque pulvinar dui.</p>\\"}]", "numchild": 0, "content_type": 47, "show_in_menus": true, "date": "2016-06-17", "path": "0001000100040001", "url_path": "/home/blog-index/blog-page-1/", "expired": false, "pk": 17, "locked": false, "depth": 4, "first_published_at": "2016-07-20T08:13:43.630Z", "expire_at": null}	\N	17	1
7	f	2016-07-20 03:52:02.385824-04	{"subtitle": "", "search_description": "", "owner": 1, "intro": "<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam et mauris eu nibh elementum blandit varius sit amet enim. Quisque massa leo, ornare in mattis vitae, vehicula vestibulum diam. Phasellus id leo placerat, vehicula diam nec, interdum mi. Nunc lacinia massa tristique nunc accumsan, eu dapibus odio feugiat. Donec varius quam dictum placerat porttitor. Vivamus fermentum cursus nibh in facilisis. Aenean in justo auctor, faucibus risus eu, semper nisl. Ut nec suscipit nibh. Donec feugiat eget dui in rhoncus. Curabitur imperdiet tortor ut quam tempus sagittis. Morbi lectus magna, viverra ut turpis a, dapibus sollicitudin diam. Morbi vel urna suscipit, sodales ante id, luctus velit.</p>", "latest_revision_created_at": null, "go_live_at": null, "related_links": [], "title": "Person Index", "seo_title": "", "slug": "person-index", "live": true, "has_unpublished_changes": false, "numchild": 0, "content_type": 60, "show_in_menus": true, "path": "000100010002", "url_path": "/home/person-index/", "expired": false, "pk": 7, "locked": false, "depth": 3, "first_published_at": null, "expire_at": null}	\N	7	1
9	f	2016-07-20 03:54:19.879143-04	{"image": 4, "telephone": "", "search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": null, "biography": "<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam et mauris eu nibh elementum blandit varius sit amet enim. Quisque massa leo, ornare in mattis vitae, vehicula vestibulum diam. Phasellus id leo placerat, vehicula diam nec, interdum mi. Nunc lacinia massa tristique nunc accumsan, eu dapibus odio feugiat. Donec varius quam dictum placerat porttitor. Vivamus fermentum cursus nibh in facilisis. Aenean in justo auctor, faucibus risus eu, semper nisl. Ut nec suscipit nibh. Donec feugiat eget dui in rhoncus. Curabitur imperdiet tortor ut quam tempus sagittis. Morbi lectus magna, viverra ut turpis a, dapibus sollicitudin diam. Morbi vel urna suscipit, sodales ante id, luctus velit.</p><p>Fusce et diam quis ipsum pulvinar euismod sit amet ac libero. Proin mauris ligula, egestas at tempus non, tempor et dolor. Proin porttitor, nibh quis consequat posuere, dolor eros eleifend nisi, ac semper ex nulla sit amet urna. Ut venenatis eros nec gravida molestie. Integer hendrerit mollis odio vitae porttitor. Sed ut elementum magna. Morbi laoreet odio lorem, eu fringilla nulla venenatis id. Duis nisl erat, aliquet in tortor eget, ullamcorper varius quam. Sed venenatis posuere ipsum, ut maximus ligula tristique fermentum. Ut eget porttitor quam. In varius diam quis viverra porttutor.</p>", "go_live_at": null, "name_organization": "", "city": "", "related_links": [], "title": "Person Page 2", "seo_title": "", "slug": "person-page-2", "live": true, "role": null, "has_unpublished_changes": false, "email": "", "feed_image": null, "post_code": "", "numchild": 0, "content_type": 64, "show_in_menus": true, "path": "0001000100020002", "url_path": "/home/person-index/person-page-2/", "expired": false, "pk": 9, "locked": false, "country": "", "tagged_items": [], "depth": 4, "address_1": "", "address_2": "", "first_published_at": null, "expire_at": null}	\N	9	1
24	f	2016-07-20 04:24:12.663501-04	{"search_description": "", "owner": 1, "latest_revision_created_at": "2016-07-20T08:22:25.875Z", "go_live_at": null, "feed_image": null, "title": "Sample Documents", "seo_title": "", "slug": "sample-documents", "live": false, "has_unpublished_changes": true, "tagged_items": [{"pk": null, "tag": 5, "content_object": 21}], "numchild": 0, "content_type": 75, "show_in_menus": true, "path": "0001000100050001", "url_path": "/home/documents-gallery/sample-documents/", "expired": false, "pk": 21, "locked": false, "depth": 4, "first_published_at": null, "expire_at": null}	\N	21	1
23	f	2016-07-20 04:22:25.875534-04	{"search_description": "", "owner": 1, "latest_revision_created_at": null, "go_live_at": null, "feed_image": null, "title": "Sample Documents", "seo_title": "", "slug": "sample-documents", "live": false, "has_unpublished_changes": false, "tagged_items": [{"pk": 1, "tag": 5, "content_object": 21}], "numchild": 0, "content_type": 75, "show_in_menus": true, "path": "0001000100050001", "url_path": "/home/documents-gallery/sample-documents/", "expired": false, "pk": 21, "locked": false, "depth": 4, "first_published_at": null, "expire_at": null}	\N	21	1
25	f	2016-07-20 04:26:14.850905-04	{"search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": null, "go_live_at": null, "feed_image": null, "title": "Photo Gallery", "seo_title": "", "slug": "photo-gallery", "live": true, "has_unpublished_changes": false, "numchild": 0, "content_type": 65, "show_in_menus": true, "path": "000100010006", "url_path": "/home/photo-gallery/", "expired": false, "pk": 22, "locked": false, "depth": 3, "first_published_at": null, "expire_at": null}	\N	22	1
8	f	2016-07-20 03:53:19.593846-04	{"image": 4, "telephone": "", "search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": null, "biography": "<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam et mauris eu nibh elementum blandit varius sit amet enim. Quisque massa leo, ornare in mattis vitae, vehicula vestibulum diam. Phasellus id leo placerat, vehicula diam nec, interdum mi. Nunc lacinia massa tristique nunc accumsan, eu dapibus odio feugiat. Donec varius quam dictum placerat porttitor. Vivamus fermentum cursus nibh in facilisis. Aenean in justo auctor, faucibus risus eu, semper nisl. Ut nec suscipit nibh. Donec feugiat eget dui in rhoncus. Curabitur imperdiet tortor ut quam tempus sagittis. Morbi lectus magna, viverra ut turpis a, dapibus sollicitudin diam. Morbi vel urna suscipit, sodales ante id, luctus velit.</p><p>Fusce et diam quis ipsum pulvinar euismod sit amet ac libero. Proin mauris ligula, egestas at tempus non, tempor et dolor. Proin porttitor, nibh quis consequat posuere, dolor eros eleifend nisi, ac semper ex nulla sit amet urna. Ut venenatis eros nec gravida molestie. Integer hendrerit mollis odio vitae porttitor. Sed ut elementum magna. Morbi laoreet odio lorem, eu fringilla nulla venenatis id. Duis nisl erat, aliquet in tortor eget, ullamcorper varius quam. Sed venenatis posuere ipsum, ut maximus ligula tristique fermentum. Ut eget porttitor quam. In varius diam quis viverra porttutor.</p>", "go_live_at": null, "name_organization": "", "city": "", "related_links": [], "title": "Person Page 1", "seo_title": "", "slug": "person-page-1", "live": true, "role": null, "has_unpublished_changes": false, "email": "", "feed_image": null, "post_code": "", "numchild": 0, "content_type": 64, "show_in_menus": true, "path": "0001000100020001", "url_path": "/home/person-index/person-page-1/", "expired": false, "pk": 8, "locked": false, "country": "", "tagged_items": [], "depth": 4, "address_1": "", "address_2": "", "first_published_at": null, "expire_at": null}	\N	8	1
10	f	2016-07-20 03:54:52.366369-04	{"image": 4, "telephone": "", "search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": null, "biography": "<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam et mauris eu nibh elementum blandit varius sit amet enim. Quisque massa leo, ornare in mattis vitae, vehicula vestibulum diam. Phasellus id leo placerat, vehicula diam nec, interdum mi. Nunc lacinia massa tristique nunc accumsan, eu dapibus odio feugiat. Donec varius quam dictum placerat porttitor. Vivamus fermentum cursus nibh in facilisis. Aenean in justo auctor, faucibus risus eu, semper nisl. Ut nec suscipit nibh. Donec feugiat eget dui in rhoncus. Curabitur imperdiet tortor ut quam tempus sagittis. Morbi lectus magna, viverra ut turpis a, dapibus sollicitudin diam. Morbi vel urna suscipit, sodales ante id, luctus velit.</p><p>Fusce et diam quis ipsum pulvinar euismod sit amet ac libero. Proin mauris ligula, egestas at tempus non, tempor et dolor. Proin porttitor, nibh quis consequat posuere, dolor eros eleifend nisi, ac semper ex nulla sit amet urna. Ut venenatis eros nec gravida molestie. Integer hendrerit mollis odio vitae porttitor. Sed ut elementum magna. Morbi laoreet odio lorem, eu fringilla nulla venenatis id. Duis nisl erat, aliquet in tortor eget, ullamcorper varius quam. Sed venenatis posuere ipsum, ut maximus ligula tristique fermentum. Ut eget porttitor quam. In varius diam quis viverra porttutor.</p>", "go_live_at": null, "name_organization": "", "city": "", "related_links": [], "title": "Person Page 3", "seo_title": "", "slug": "person-page-3", "live": true, "role": null, "has_unpublished_changes": false, "email": "", "feed_image": null, "post_code": "", "numchild": 0, "content_type": 64, "show_in_menus": true, "path": "0001000100020003", "url_path": "/home/person-index/person-page-3/", "expired": false, "pk": 10, "locked": false, "country": "", "tagged_items": [], "depth": 4, "address_1": "", "address_2": "", "first_published_at": null, "expire_at": null}	\N	10	1
11	f	2016-07-20 03:55:24.424289-04	{"image": 4, "telephone": "", "search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": null, "biography": "<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam et mauris eu nibh elementum blandit varius sit amet enim. Quisque massa leo, ornare in mattis vitae, vehicula vestibulum diam. Phasellus id leo placerat, vehicula diam nec, interdum mi. Nunc lacinia massa tristique nunc accumsan, eu dapibus odio feugiat. Donec varius quam dictum placerat porttitor. Vivamus fermentum cursus nibh in facilisis. Aenean in justo auctor, faucibus risus eu, semper nisl. Ut nec suscipit nibh. Donec feugiat eget dui in rhoncus. Curabitur imperdiet tortor ut quam tempus sagittis. Morbi lectus magna, viverra ut turpis a, dapibus sollicitudin diam. Morbi vel urna suscipit, sodales ante id, luctus velit.</p><p>Fusce et diam quis ipsum pulvinar euismod sit amet ac libero. Proin mauris ligula, egestas at tempus non, tempor et dolor. Proin porttitor, nibh quis consequat posuere, dolor eros eleifend nisi, ac semper ex nulla sit amet urna. Ut venenatis eros nec gravida molestie. Integer hendrerit mollis odio vitae porttitor. Sed ut elementum magna. Morbi laoreet odio lorem, eu fringilla nulla venenatis id. Duis nisl erat, aliquet in tortor eget, ullamcorper varius quam. Sed venenatis posuere ipsum, ut maximus ligula tristique fermentum. Ut eget porttitor quam. In varius diam quis viverra porttutor.</p>", "go_live_at": null, "name_organization": "", "city": "", "related_links": [], "title": "Person Page 4", "seo_title": "", "slug": "person-page-4", "live": true, "role": null, "has_unpublished_changes": false, "email": "", "feed_image": null, "post_code": "", "numchild": 0, "content_type": 64, "show_in_menus": true, "path": "0001000100020004", "url_path": "/home/person-index/person-page-4/", "expired": false, "pk": 11, "locked": false, "country": "", "tagged_items": [], "depth": 4, "address_1": "", "address_2": "", "first_published_at": null, "expire_at": null}	\N	11	1
12	f	2016-07-20 04:06:58.286914-04	{"search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": null, "go_live_at": null, "related_links": [], "title": "Event Index", "seo_title": "", "slug": "event-index", "live": true, "has_unpublished_changes": false, "numchild": 0, "content_type": 49, "show_in_menus": true, "path": "000100010003", "url_path": "/home/event-index/", "expired": false, "pk": 12, "locked": false, "depth": 3, "first_published_at": null, "expire_at": null}	\N	12	1
15	f	2016-07-20 04:10:44.402947-04	{"carousel_items": [], "show_in_menus": true, "search_description": "", "owner": 1, "cost": "", "latest_revision_created_at": null, "time_to": null, "go_live_at": null, "feed_image": 9, "related_links": [], "title": "Event Page 3", "signup_link": "", "date_from": "2021-08-12", "seo_title": "", "slug": "event-page-3", "live": true, "location": "", "has_unpublished_changes": false, "tagged_items": [{"pk": 4, "tag": 4, "content_object": 15}], "body": "", "numchild": 0, "time_from": null, "speakers": [], "audience": null, "content_type": 54, "date_to": null, "path": "0001000100030003", "url_path": "/home/event-index/event-page-3/", "expired": false, "pk": 15, "locked": false, "depth": 4, "first_published_at": null, "expire_at": null}	\N	15	1
14	f	2016-07-20 04:09:41.447057-04	{"carousel_items": [], "show_in_menus": true, "search_description": "", "owner": 1, "cost": "", "latest_revision_created_at": null, "time_to": null, "go_live_at": null, "feed_image": 3, "related_links": [], "title": "Event Page 2", "signup_link": "", "date_from": "2020-06-17", "seo_title": "", "slug": "event-page-2", "live": true, "location": "", "has_unpublished_changes": false, "tagged_items": [{"pk": 3, "tag": 3, "content_object": 14}], "body": "", "numchild": 0, "time_from": null, "speakers": [], "audience": null, "content_type": 54, "date_to": null, "path": "0001000100030002", "url_path": "/home/event-index/event-page-2/", "expired": false, "pk": 14, "locked": false, "depth": 4, "first_published_at": null, "expire_at": null}	\N	14	1
16	f	2016-07-20 04:11:32.075565-04	{"search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": null, "go_live_at": null, "related_links": [], "title": "Blog Index", "seo_title": "", "slug": "blog-index", "live": true, "has_unpublished_changes": false, "numchild": 0, "content_type": 43, "show_in_menus": true, "path": "000100010004", "url_path": "/home/blog-index/", "expired": false, "pk": 16, "locked": false, "depth": 3, "first_published_at": null, "expire_at": null}	\N	16	1
22	f	2016-07-20 04:22:02.975756-04	{"search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": null, "go_live_at": null, "feed_image": null, "title": "Documents Gallery", "seo_title": "", "slug": "documents-gallery", "live": true, "has_unpublished_changes": false, "numchild": 0, "content_type": 73, "show_in_menus": true, "path": "000100010005", "url_path": "/home/documents-gallery/", "expired": false, "pk": 20, "locked": false, "depth": 3, "first_published_at": null, "expire_at": null}	\N	20	1
21	f	2016-07-20 04:18:56.433825-04	{"carousel_items": [], "search_description": "", "owner": 1, "intro": "<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam et mauris eu nibh elementum blandit varius sit amet enim. Quisque massa leo, ornare in mattis vitae, vehicula vestibulum diam. Phasellus id leo placerat, vehicula diam nec, interdum mi. Nunc lacinia massa tristique nunc accumsan, eu dapibus odio feugiat. Donec varius quam dictum placerat porttitor. Vivamus fermentum cursus nibh in facilisis. Aenean in justo auctor, faucibus risus eu, semper nisl. Ut nec suscipit nibh. Donec feugiat eget dui in rhoncus. Curabitur imperdiet tortor ut quam tempus sagittis. Morbi lectus magna, viverra ut turpis a, dapibus sollicitudin diam. Morbi vel urna suscipit, sodales ante id, luctus velit.</p>", "latest_revision_created_at": "2016-07-20T08:15:09.348Z", "go_live_at": null, "feed_image": 3, "related_links": [{"link_page": 17, "title": "Blog Page 1", "link_external": "", "sort_order": 0, "link_document": null, "pk": null, "page": 18}, {"link_page": 19, "title": "Blog Page 3", "link_external": "", "sort_order": 1, "link_document": null, "pk": null, "page": 18}], "title": "Blog Page 2", "seo_title": "", "slug": "blog-page-2", "live": true, "has_unpublished_changes": false, "tagged_items": [], "body": "<embed alt=\\"foundation.jpg\\" embedtype=\\"image\\" format=\\"fullwidth\\" id=\\"3\\"/><p><br/></p><p></p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam et mauris eu nibh elementum blandit varius sit amet enim. Quisque massa leo, ornare in mattis vitae, vehicula vestibulum diam. Phasellus id leo placerat, vehicula diam nec, interdum mi. Nunc lacinia massa tristique nunc accumsan, eu dapibus odio feugiat. Donec varius quam dictum placerat porttitor. Vivamus fermentum cursus nibh in facilisis. Aenean in justo auctor, faucibus risus eu, semper nisl. Ut nec suscipit nibh. Donec feugiat eget dui in rhoncus. Curabitur imperdiet tortor ut quam tempus sagittis. Morbi lectus magna, viverra ut turpis a, dapibus sollicitudin diam. Morbi vel urna suscipit, sodales ante id, luctus velit.<br/></p><p>Fusce et diam quis ipsum pulvinar euismod sit amet ac libero. Proin mauris ligula, egestas at tempus non, tempor et dolor. Proin porttitor, nibh quis consequat posuere, dolor eros eleifend nisi, ac semper ex nulla sit amet urna. Ut venenatis eros nec gravida molestie. Integer hendrerit mollis odio vitae porttitor. Sed ut elementum magna. Morbi laoreet odio lorem, eu fringilla nulla venenatis id. Duis nisl erat, aliquet in tortor eget, ullamcorper varius quam. Sed venenatis posuere ipsum, ut maximus ligula tristique fermentum. Ut eget porttitor quam. In varius diam quis viverra porttitor.</p><p></p>", "numchild": 0, "content_type": 47, "show_in_menus": true, "date": "2016-06-17", "path": "0001000100040002", "url_path": "/home/blog-index/blog-page-2/", "expired": false, "pk": 18, "locked": false, "depth": 4, "first_published_at": "2016-07-20T08:15:09.479Z", "expire_at": null}	\N	18	1
29	f	2016-07-20 04:33:22.946592-04	{"to_address": "", "from_address": "", "telephone": "+1 868-773-4644", "search_description": "", "owner": 1, "intro": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam et mauris eu nibh elementum blandit varius sit amet enim. Quisque massa leo, ornare in mattis vitae, vehicula vestibulum diam. Phasellus id leo placerat, vehicula diam nec, interdum mi.", "latest_revision_created_at": "2016-07-20T08:32:19.643Z", "go_live_at": null, "name_organization": "ChrisDev", "city": "Tunapuna,", "title": "Contact Us", "seo_title": "", "slug": "contact-us", "live": true, "has_unpublished_changes": false, "subject": "", "email": "", "post_code": "tunapuna", "numchild": 0, "content_type": 58, "show_in_menus": true, "thank_you_text": "<p>Thank you for submitting.</p>", "path": "000100010007", "url_path": "/home/contact-us/", "expired": false, "pk": 24, "locked": false, "country": "Trinidad & Tobago", "form_fields": [{"default_value": "", "field_type": "singleline", "required": true, "choices": "", "sort_order": 0, "help_text": "", "pk": 1, "label": "Name", "page": 24}, {"default_value": "", "field_type": "email", "required": true, "choices": "", "sort_order": 1, "help_text": "", "pk": 2, "label": "Email", "page": 24}, {"default_value": "", "field_type": "singleline", "required": true, "choices": "", "sort_order": 2, "help_text": "", "pk": 3, "label": "Subject", "page": 24}, {"default_value": "", "field_type": "multiline", "required": true, "choices": "", "sort_order": 3, "help_text": "", "pk": 4, "label": "Message", "page": 24}], "depth": 3, "address_1": "A3 St Benedicts Gardens,", "address_2": "", "first_published_at": "2016-07-20T08:32:19.773Z", "expire_at": null}	\N	24	1
28	f	2016-07-20 04:32:19.643662-04	{"to_address": "", "from_address": "", "telephone": "+1 868-773-4644", "search_description": "", "owner": 1, "intro": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam et mauris eu nibh elementum blandit varius sit amet enim. Quisque massa leo, ornare in mattis vitae, vehicula vestibulum diam. Phasellus id leo placerat, vehicula diam nec, interdum mi.", "latest_revision_created_at": null, "go_live_at": null, "name_organization": "ChrisDev", "city": "Tunapuna,", "title": "Contact Us", "seo_title": "", "slug": "contact-us", "live": true, "has_unpublished_changes": false, "subject": "", "email": "", "post_code": "tunapuna", "numchild": 0, "content_type": 58, "show_in_menus": true, "thank_you_text": "<p>Thanks you for submitting.</p>", "path": "000100010007", "url_path": "/home/contact-us/", "expired": false, "pk": 24, "locked": false, "country": "Trinidad & Tobago", "form_fields": [{"default_value": "", "field_type": "singleline", "required": true, "choices": "", "sort_order": 0, "help_text": "", "pk": 1, "label": "Name", "page": 24}, {"default_value": "", "field_type": "email", "required": true, "choices": "", "sort_order": 1, "help_text": "", "pk": 2, "label": "Email", "page": 24}, {"default_value": "", "field_type": "singleline", "required": true, "choices": "", "sort_order": 2, "help_text": "", "pk": 3, "label": "Subject", "page": 24}, {"default_value": "", "field_type": "multiline", "required": true, "choices": "", "sort_order": 3, "help_text": "", "pk": 4, "label": "Message", "page": 24}], "depth": 3, "address_1": "A3 St Benedicts Gardens,", "address_2": "", "first_published_at": null, "expire_at": null}	\N	24	1
30	f	2016-07-20 04:36:18.443585-04	{"carousel_items": [], "search_description": "", "owner": 1, "intro": "<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam et mauris eu nibh elementum blandit varius sit amet enim. Quisque massa leo, ornare in mattis vitae, vehicula vestibulum diam. Phasellus id leo placerat, vehicula diam nec, interdum mi. Nunc lacinia massa tristique nunc accumsan, eu dapibus odio feugiat. Donec varius quam dictum placerat porttitor. Vivamus fermentum cursus nibh in facilisis. Aenean in justo auctor, faucibus risus eu, semper nisl. Ut nec suscipit nibh. Donec feugiat eget dui in rhoncus. Curabitur imperdiet tortor ut quam tempus sagittis. Morbi lectus magna, viverra ut turpis a, dapibus sollicitudin diam. Morbi vel urna suscipit, sodales ante id, luctus velit.</p>", "latest_revision_created_at": "2016-07-20T08:17:15.529Z", "go_live_at": null, "feed_image": 9, "related_links": [{"link_page": 17, "title": "Blog Page 1", "link_external": "", "sort_order": 0, "link_document": null, "pk": 1, "page": 19}, {"link_page": 18, "title": "Blog Page 2", "link_external": "", "sort_order": 1, "link_document": null, "pk": 2, "page": 19}], "title": "Blog Page 3", "seo_title": "", "slug": "blog-page-3", "live": true, "has_unpublished_changes": false, "tagged_items": [], "body": "<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam et mauris eu nibh elementum blandit varius sit amet enim. Quisque massa leo, ornare in mattis vitae, vehicula vestibulum diam. Phasellus id leo placerat, vehicula diam nec, interdum mi. Nunc lacinia massa tristique nunc accumsan, eu dapibus odio feugiat. Donec varius quam dictum placerat porttitor. Vivamus fermentum cursus nibh in facilisis. Aenean in justo auctor, faucibus risus eu, semper nisl. Ut nec suscipit nibh. Donec feugiat eget dui in rhoncus. Curabitur imperdiet tortor ut quam tempus sagittis. Morbi lectus magna, viverra ut turpis a, dapibus sollicitudin diam. Morbi vel urna suscipit, sodales ante id, luctus velit.</p><p><embed alt=\\"sass.jpg\\" embedtype=\\"image\\" format=\\"fullwidth\\" id=\\"7\\"/><br/></p><p><br/></p>", "numchild": 0, "content_type": 47, "show_in_menus": true, "date": "2016-06-17", "path": "0001000100040003", "url_path": "/home/blog-index/blog-page-3/", "expired": false, "pk": 19, "locked": false, "depth": 4, "first_published_at": "2016-07-20T08:17:15.679Z", "expire_at": null}	\N	19	1
19	f	2016-07-20 04:17:15.529073-04	{"carousel_items": [], "search_description": "", "owner": 1, "intro": "<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam et mauris eu nibh elementum blandit varius sit amet enim. Quisque massa leo, ornare in mattis vitae, vehicula vestibulum diam. Phasellus id leo placerat, vehicula diam nec, interdum mi. Nunc lacinia massa tristique nunc accumsan, eu dapibus odio feugiat. Donec varius quam dictum placerat porttitor. Vivamus fermentum cursus nibh in facilisis. Aenean in justo auctor, faucibus risus eu, semper nisl. Ut nec suscipit nibh. Donec feugiat eget dui in rhoncus. Curabitur imperdiet tortor ut quam tempus sagittis. Morbi lectus magna, viverra ut turpis a, dapibus sollicitudin diam. Morbi vel urna suscipit, sodales ante id, luctus velit.</p>", "latest_revision_created_at": null, "go_live_at": null, "feed_image": 7, "related_links": [{"link_page": 17, "title": "Blog Page 1", "link_external": "", "sort_order": 0, "link_document": null, "pk": 1, "page": 19}, {"link_page": 18, "title": "Blog Page 2", "link_external": "", "sort_order": 1, "link_document": null, "pk": 2, "page": 19}], "title": "Blog Page 3", "seo_title": "", "slug": "blog-page-3", "live": true, "has_unpublished_changes": false, "tagged_items": [], "body": "<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam et mauris eu nibh elementum blandit varius sit amet enim. Quisque massa leo, ornare in mattis vitae, vehicula vestibulum diam. Phasellus id leo placerat, vehicula diam nec, interdum mi. Nunc lacinia massa tristique nunc accumsan, eu dapibus odio feugiat. Donec varius quam dictum placerat porttitor. Vivamus fermentum cursus nibh in facilisis. Aenean in justo auctor, faucibus risus eu, semper nisl. Ut nec suscipit nibh. Donec feugiat eget dui in rhoncus. Curabitur imperdiet tortor ut quam tempus sagittis. Morbi lectus magna, viverra ut turpis a, dapibus sollicitudin diam. Morbi vel urna suscipit, sodales ante id, luctus velit.</p><p><embed alt=\\"sass.jpg\\" embedtype=\\"image\\" format=\\"fullwidth\\" id=\\"7\\"/><br/></p><p><br/></p>", "numchild": 0, "content_type": 47, "show_in_menus": true, "date": "2016-06-17", "path": "0001000100040003", "url_path": "/home/blog-index/blog-page-3/", "expired": false, "pk": 19, "locked": false, "depth": 4, "first_published_at": null, "expire_at": null}	\N	19	1
34	f	2016-09-20 08:31:13.370445-04	{"carousel_items": [], "search_description": "", "owner": 1, "intro": "<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam et mauris eu nibh elementum blandit varius sit amet enim. Quisque massa leo, ornare in mattis vitae, vehicula vestibulum diam. Phasellus id leo placerat, vehicula diam nec, interdum mi. Nunc lacinia massa tristique nunc accumsan, eu dapibus odio feugiat. Donec varius quam dictum placerat porttitor. Vivamus fermentum cursus nibh in facilisis. Aenean in justo auctor, faucibus risus eu, semper nisl. Ut nec suscipit nibh. Donec feugiat eget dui in rhoncus. Curabitur imperdiet tortor ut quam tempus sagittis. Morbi lectus magna, viverra ut turpis a, dapibus sollicitudin diam. Morbi vel urna suscipit, sodales ante id, luctus velit.</p>", "latest_revision_created_at": "2016-09-20T12:26:15.509Z", "go_live_at": null, "feed_image": 9, "related_links": [{"link_page": 18, "title": "Blog Page 2", "link_external": "", "sort_order": 0, "link_document": null, "pk": 3, "page": 17}, {"link_page": 19, "title": "Blog Page 3", "link_external": "", "sort_order": 1, "link_document": null, "pk": 4, "page": 17}], "title": "Blog Page 1", "seo_title": "", "slug": "blog-page-1", "live": true, "has_unpublished_changes": false, "tagged_items": [], "body": "[{\\"type\\": \\"heading\\", \\"value\\": \\"Test Heading 1\\"}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent lobortis orci ex, a interdum justo dapibus eu. Vestibulum sit amet risus et dolor tempor faucibus non ac enim. Sed et sapien gravida, sollicitudin enim at, facilisis sapien. Nunc eget nibh ac libero tempus placerat. Duis quis turpis libero. Donec vel tincidunt arcu. Nulla congue at risus eget egestas.</p><p>Ut eget sapien ut diam feugiat fringilla. Curabitur malesuada mauris felis, id blandit odio consequat vitae. Ut hendrerit hendrerit ante et fermentum. Mauris aliquam varius lorem, sed feugiat justo iaculis eget. Etiam ornare non neque at ultrices. Phasellus quam elit, lobortis ac imperdiet vitae, scelerisque convallis felis. Fusce a vehicula orci, et semper nibh. Aenean id lacus eget odio dignissim venenatis. Cras sagittis lectus diam, ut pulvinar neque venenatis in.</p>\\"}, {\\"type\\": \\"image\\", \\"value\\": 9}, {\\"type\\": \\"heading\\", \\"value\\": \\"Test Heading 2\\"}, {\\"type\\": \\"image\\", \\"value\\": 3}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>Praesent a massa id est egestas volutpat sed vitae dolor. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Duis sed dolor metus. Interdum et malesuada fames ac ante ipsum primis in faucibus. Nunc porttitor lacus eget bibendum commodo. Donec faucibus ipsum sit amet sem interdum, et sagittis tortor ornare. Quisque tristique neque gravida nisi sodales mattis. Morbi malesuada ante nisi, vel venenatis lacus ultricies eu. Pellentesque id risus sit amet enim lobortis luctus. Nullam dolor purus, efficitur in massa ac, pellentesque pulvinar dui.</p>\\"}]", "numchild": 0, "content_type": 47, "show_in_menus": true, "date": "2016-06-17", "path": "0001000100040001", "url_path": "/home/blog-index/blog-page-1/", "expired": false, "pk": 17, "locked": false, "depth": 4, "first_published_at": "2016-07-20T08:13:43.630Z", "expire_at": null}	\N	17	1
17	f	2016-07-20 04:13:43.42343-04	{"carousel_items": [], "search_description": "", "owner": 1, "intro": "<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam et mauris eu nibh elementum blandit varius sit amet enim. Quisque massa leo, ornare in mattis vitae, vehicula vestibulum diam. Phasellus id leo placerat, vehicula diam nec, interdum mi. Nunc lacinia massa tristique nunc accumsan, eu dapibus odio feugiat. Donec varius quam dictum placerat porttitor. Vivamus fermentum cursus nibh in facilisis. Aenean in justo auctor, faucibus risus eu, semper nisl. Ut nec suscipit nibh. Donec feugiat eget dui in rhoncus. Curabitur imperdiet tortor ut quam tempus sagittis. Morbi lectus magna, viverra ut turpis a, dapibus sollicitudin diam. Morbi vel urna suscipit, sodales ante id, luctus velit.</p>", "latest_revision_created_at": null, "go_live_at": null, "feed_image": 9, "related_links": [], "title": "Blog Page 1", "seo_title": "", "slug": "blog-page-1", "live": true, "has_unpublished_changes": false, "tagged_items": [], "body": "<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam et mauris eu nibh elementum blandit varius sit amet enim. Quisque massa leo, ornare in mattis vitae, vehicula vestibulum diam. Phasellus id leo placerat, vehicula diam nec, interdum mi. Nunc lacinia massa tristique nunc accumsan, eu dapibus odio feugiat. Donec varius quam dictum placerat porttitor. Vivamus fermentum cursus nibh in facilisis. Aenean in justo auctor, faucibus risus eu, semper nisl. Ut nec suscipit nibh. Donec feugiat eget dui in rhoncus. Curabitur imperdiet tortor ut quam tempus sagittis. Morbi lectus magna, viverra ut turpis a, dapibus sollicitudin diam. Morbi vel urna suscipit, sodales ante id, luctus velit.</p><p><embed alt=\\"wagtail.jpg\\" embedtype=\\"image\\" format=\\"fullwidth\\" id=\\"9\\"/><br/></p><p>Fusce et diam quis ipsum pulvinar euismod sit amet ac libero. Proin mauris ligula, egestas at tempus non, tempor et dolor. Proin porttitor, nibh quis consequat posuere, dolor eros eleifend nisi, ac semper ex nulla sit amet urna. Ut venenatis eros nec gravida molestie. Integer hendrerit mollis odio vitae porttitor. Sed ut elementum magna. Morbi laoreet odio lorem, eu fringilla nulla venenatis id. Duis nisl erat, aliquet in tortor eget, ullamcorper varius quam. Sed venenatis posuere ipsum, ut maximus ligula tristique fermentum. Ut eget porttitor quam. In varius diam quis viverra porttitor.<br/></p>", "numchild": 0, "content_type": 47, "show_in_menus": true, "date": "2016-06-17", "path": "0001000100040001", "url_path": "/home/blog-index/blog-page-1/", "expired": false, "pk": 17, "locked": false, "depth": 4, "first_published_at": null, "expire_at": null}	\N	17	1
20	f	2016-07-20 04:18:23.700253-04	{"carousel_items": [], "search_description": "", "owner": 1, "intro": "<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam et mauris eu nibh elementum blandit varius sit amet enim. Quisque massa leo, ornare in mattis vitae, vehicula vestibulum diam. Phasellus id leo placerat, vehicula diam nec, interdum mi. Nunc lacinia massa tristique nunc accumsan, eu dapibus odio feugiat. Donec varius quam dictum placerat porttitor. Vivamus fermentum cursus nibh in facilisis. Aenean in justo auctor, faucibus risus eu, semper nisl. Ut nec suscipit nibh. Donec feugiat eget dui in rhoncus. Curabitur imperdiet tortor ut quam tempus sagittis. Morbi lectus magna, viverra ut turpis a, dapibus sollicitudin diam. Morbi vel urna suscipit, sodales ante id, luctus velit.</p>", "latest_revision_created_at": "2016-07-20T08:13:43.423Z", "go_live_at": null, "feed_image": 9, "related_links": [{"link_page": 18, "title": "Blog Page 2", "link_external": "", "sort_order": 0, "link_document": null, "pk": null, "page": 17}, {"link_page": 19, "title": "Blog Page 3", "link_external": "", "sort_order": 1, "link_document": null, "pk": null, "page": 17}], "title": "Blog Page 1", "seo_title": "", "slug": "blog-page-1", "live": true, "has_unpublished_changes": false, "tagged_items": [], "body": "<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam et mauris eu nibh elementum blandit varius sit amet enim. Quisque massa leo, ornare in mattis vitae, vehicula vestibulum diam. Phasellus id leo placerat, vehicula diam nec, interdum mi. Nunc lacinia massa tristique nunc accumsan, eu dapibus odio feugiat. Donec varius quam dictum placerat porttitor. Vivamus fermentum cursus nibh in facilisis. Aenean in justo auctor, faucibus risus eu, semper nisl. Ut nec suscipit nibh. Donec feugiat eget dui in rhoncus. Curabitur imperdiet tortor ut quam tempus sagittis. Morbi lectus magna, viverra ut turpis a, dapibus sollicitudin diam. Morbi vel urna suscipit, sodales ante id, luctus velit.</p><p><embed alt=\\"wagtail.jpg\\" embedtype=\\"image\\" format=\\"fullwidth\\" id=\\"9\\"/><br/></p><p>Fusce et diam quis ipsum pulvinar euismod sit amet ac libero. Proin mauris ligula, egestas at tempus non, tempor et dolor. Proin porttitor, nibh quis consequat posuere, dolor eros eleifend nisi, ac semper ex nulla sit amet urna. Ut venenatis eros nec gravida molestie. Integer hendrerit mollis odio vitae porttitor. Sed ut elementum magna. Morbi laoreet odio lorem, eu fringilla nulla venenatis id. Duis nisl erat, aliquet in tortor eget, ullamcorper varius quam. Sed venenatis posuere ipsum, ut maximus ligula tristique fermentum. Ut eget porttitor quam. In varius diam quis viverra porttitor.<br/></p>", "numchild": 0, "content_type": 47, "show_in_menus": true, "date": "2016-06-17", "path": "0001000100040001", "url_path": "/home/blog-index/blog-page-1/", "expired": false, "pk": 17, "locked": false, "depth": 4, "first_published_at": "2016-07-20T08:13:43.630Z", "expire_at": null}	\N	17	1
18	f	2016-07-20 04:15:09.348683-04	{"carousel_items": [], "search_description": "", "owner": 1, "intro": "<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam et mauris eu nibh elementum blandit varius sit amet enim. Quisque massa leo, ornare in mattis vitae, vehicula vestibulum diam. Phasellus id leo placerat, vehicula diam nec, interdum mi. Nunc lacinia massa tristique nunc accumsan, eu dapibus odio feugiat. Donec varius quam dictum placerat porttitor. Vivamus fermentum cursus nibh in facilisis. Aenean in justo auctor, faucibus risus eu, semper nisl. Ut nec suscipit nibh. Donec feugiat eget dui in rhoncus. Curabitur imperdiet tortor ut quam tempus sagittis. Morbi lectus magna, viverra ut turpis a, dapibus sollicitudin diam. Morbi vel urna suscipit, sodales ante id, luctus velit.</p>", "latest_revision_created_at": null, "go_live_at": null, "feed_image": 3, "related_links": [], "title": "Blog Page 2", "seo_title": "", "slug": "blog-page-2", "live": true, "has_unpublished_changes": false, "tagged_items": [], "body": "<embed alt=\\"foundation.jpg\\" embedtype=\\"image\\" format=\\"fullwidth\\" id=\\"3\\"/><p><br/></p><p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam et mauris eu nibh elementum blandit varius sit amet enim. Quisque massa leo, ornare in mattis vitae, vehicula vestibulum diam. Phasellus id leo placerat, vehicula diam nec, interdum mi. Nunc lacinia massa tristique nunc accumsan, eu dapibus odio feugiat. Donec varius quam dictum placerat porttitor. Vivamus fermentum cursus nibh in facilisis. Aenean in justo auctor, faucibus risus eu, semper nisl. Ut nec suscipit nibh. Donec feugiat eget dui in rhoncus. Curabitur imperdiet tortor ut quam tempus sagittis. Morbi lectus magna, viverra ut turpis a, dapibus sollicitudin diam. Morbi vel urna suscipit, sodales ante id, luctus velit.<br/></p><p>Fusce et diam quis ipsum pulvinar euismod sit amet ac libero. Proin mauris ligula, egestas at tempus non, tempor et dolor. Proin porttitor, nibh quis consequat posuere, dolor eros eleifend nisi, ac semper ex nulla sit amet urna. Ut venenatis eros nec gravida molestie. Integer hendrerit mollis odio vitae porttitor. Sed ut elementum magna. Morbi laoreet odio lorem, eu fringilla nulla venenatis id. Duis nisl erat, aliquet in tortor eget, ullamcorper varius quam. Sed venenatis posuere ipsum, ut maximus ligula tristique fermentum. Ut eget porttitor quam. In varius diam quis viverra porttitor.</p></p>", "numchild": 0, "content_type": 47, "show_in_menus": true, "date": "2016-06-17", "path": "0001000100040002", "url_path": "/home/blog-index/blog-page-2/", "expired": false, "pk": 18, "locked": false, "depth": 4, "first_published_at": null, "expire_at": null}	\N	18	1
35	f	2016-09-20 08:38:28.178672-04	{"carousel_items": [], "search_description": "", "owner": 1, "intro": "<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam et mauris eu nibh elementum blandit varius sit amet enim. Quisque massa leo, ornare in mattis vitae, vehicula vestibulum diam. Phasellus id leo placerat, vehicula diam nec, interdum mi. Nunc lacinia massa tristique nunc accumsan, eu dapibus odio feugiat. Donec varius quam dictum placerat porttitor. Vivamus fermentum cursus nibh in facilisis. Aenean in justo auctor, faucibus risus eu, semper nisl. Ut nec suscipit nibh. Donec feugiat eget dui in rhoncus. Curabitur imperdiet tortor ut quam tempus sagittis. Morbi lectus magna, viverra ut turpis a, dapibus sollicitudin diam. Morbi vel urna suscipit, sodales ante id, luctus velit.</p>", "latest_revision_created_at": "2016-07-20T08:18:56.433Z", "go_live_at": null, "feed_image": 3, "related_links": [{"link_page": 17, "title": "Blog Page 1", "link_external": "", "sort_order": 0, "link_document": null, "pk": 5, "page": 18}, {"link_page": 19, "title": "Blog Page 3", "link_external": "", "sort_order": 1, "link_document": null, "pk": 6, "page": 18}], "title": "Blog Page 2", "seo_title": "", "slug": "blog-page-2", "live": true, "has_unpublished_changes": false, "tagged_items": [], "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam et mauris eu nibh elementum blandit varius sit amet enim. Quisque massa leo, ornare in mattis vitae, vehicula vestibulum diam. Phasellus id leo placerat, vehicula diam nec, interdum mi. Nunc lacinia massa tristique nunc accumsan, eu dapibus odio feugiat. Donec varius quam dictum placerat porttitor. Vivamus fermentum cursus nibh in facilisis. Aenean in justo auctor, faucibus risus eu, semper nisl. Ut nec suscipit nibh. Donec feugiat eget dui in rhoncus. Curabitur imperdiet tortor ut quam tempus sagittis. Morbi lectus magna, viverra ut turpis a, dapibus sollicitudin diam. Morbi vel urna suscipit, sodales ante id, luctus velit.</p>\\"}, {\\"type\\": \\"heading\\", \\"value\\": \\"Test Heading\\"}, {\\"type\\": \\"image\\", \\"value\\": 9}, {\\"type\\": \\"image\\", \\"value\\": 7}]", "numchild": 0, "content_type": 47, "show_in_menus": true, "date": "2016-06-17", "path": "0001000100040002", "url_path": "/home/blog-index/blog-page-2/", "expired": false, "pk": 18, "locked": false, "depth": 4, "first_published_at": "2016-07-20T08:15:09.479Z", "expire_at": null}	\N	18	1
36	f	2016-09-20 08:39:24.91435-04	{"carousel_items": [], "search_description": "", "owner": 1, "intro": "<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam et mauris eu nibh elementum blandit varius sit amet enim. Quisque massa leo, ornare in mattis vitae, vehicula vestibulum diam. Phasellus id leo placerat, vehicula diam nec, interdum mi. Nunc lacinia massa tristique nunc accumsan, eu dapibus odio feugiat. Donec varius quam dictum placerat porttitor. Vivamus fermentum cursus nibh in facilisis. Aenean in justo auctor, faucibus risus eu, semper nisl. Ut nec suscipit nibh. Donec feugiat eget dui in rhoncus. Curabitur imperdiet tortor ut quam tempus sagittis. Morbi lectus magna, viverra ut turpis a, dapibus sollicitudin diam. Morbi vel urna suscipit, sodales ante id, luctus velit.</p>", "latest_revision_created_at": "2016-07-20T08:36:18.443Z", "go_live_at": null, "feed_image": 9, "related_links": [{"link_page": 17, "title": "Blog Page 1", "link_external": "", "sort_order": 0, "link_document": null, "pk": 1, "page": 19}, {"link_page": 18, "title": "Blog Page 2", "link_external": "", "sort_order": 1, "link_document": null, "pk": 2, "page": 19}], "title": "Blog Page 3", "seo_title": "", "slug": "blog-page-3", "live": true, "has_unpublished_changes": false, "tagged_items": [], "body": "[{\\"type\\": \\"image\\", \\"value\\": 9}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam et mauris eu nibh elementum blandit varius sit amet enim. Quisque massa leo, ornare in mattis vitae, vehicula vestibulum diam. Phasellus id leo placerat, vehicula diam nec, interdum mi. Nunc lacinia massa tristique nunc accumsan, eu dapibus odio feugiat. Donec varius quam dictum placerat porttitor. Vivamus fermentum cursus nibh in facilisis. Aenean in justo auctor, faucibus risus eu, semper nisl. Ut nec suscipit nibh. Donec feugiat eget dui in rhoncus. Curabitur imperdiet tortor ut quam tempus sagittis. Morbi lectus magna, viverra ut turpis a, dapibus sollicitudin diam. Morbi vel urna suscipit, sodales ante id, luctus velit.</p>\\"}, {\\"type\\": \\"heading\\", \\"value\\": \\"Test Heading 1\\"}, {\\"type\\": \\"heading\\", \\"value\\": \\"Test Heading 2\\"}]", "numchild": 0, "content_type": 47, "show_in_menus": true, "date": "2016-06-17", "path": "0001000100040003", "url_path": "/home/blog-index/blog-page-3/", "expired": false, "pk": 19, "locked": false, "depth": 4, "first_published_at": "2016-07-20T08:17:15.679Z", "expire_at": null}	\N	19	1
26	f	2016-07-20 04:27:21.659085-04	{"search_description": "", "owner": 1, "latest_revision_created_at": null, "go_live_at": null, "feed_image": null, "title": "Sample Gallery", "seo_title": "", "slug": "sample-gallery", "live": true, "has_unpublished_changes": false, "tagged_items": [{"pk": 1, "tag": 6, "content_object": 23}], "numchild": 0, "content_type": 67, "show_in_menus": false, "path": "0001000100060001", "url_path": "/home/photo-gallery/sample-gallery/", "expired": false, "pk": 23, "locked": false, "depth": 4, "first_published_at": null, "expire_at": null}	\N	23	1
27	f	2016-07-20 04:27:46.60808-04	{"search_description": "", "owner": 1, "latest_revision_created_at": "2016-07-20T08:27:21.659Z", "go_live_at": null, "feed_image": null, "title": "Sample Gallery", "seo_title": "", "slug": "sample-gallery", "live": true, "has_unpublished_changes": false, "tagged_items": [{"pk": null, "tag": 6, "content_object": 23}], "numchild": 0, "content_type": 67, "show_in_menus": true, "path": "0001000100060001", "url_path": "/home/photo-gallery/sample-gallery/", "expired": false, "pk": 23, "locked": false, "depth": 4, "first_published_at": "2016-07-20T08:27:21.803Z", "expire_at": null}	\N	23	1
37	f	2016-11-01 11:21:54.076719-04	{"search_description": "", "owner": 1, "latest_revision_created_at": "2016-07-20T08:27:46.608Z", "go_live_at": null, "feed_image": 9, "title": "Sample Gallery", "seo_title": "", "slug": "sample-gallery", "live": true, "has_unpublished_changes": false, "tagged_items": [{"pk": null, "tag": 6, "content_object": 23}], "numchild": 0, "content_type": 67, "show_in_menus": true, "path": "0001000100060001", "url_path": "/home/photo-gallery/sample-gallery/", "expired": false, "pk": 23, "locked": false, "depth": 4, "first_published_at": "2016-07-20T08:27:21.803Z", "expire_at": null}	\N	23	1
13	f	2016-07-20 04:08:44.398391-04	{"carousel_items": [], "show_in_menus": true, "search_description": "", "owner": 1, "cost": "", "latest_revision_created_at": null, "time_to": null, "go_live_at": null, "feed_image": 9, "related_links": [], "title": "Event Page 1", "signup_link": "", "date_from": "2019-06-01", "seo_title": "", "slug": "event-page-1", "live": true, "location": "", "has_unpublished_changes": false, "tagged_items": [{"pk": 1, "tag": 1, "content_object": 13}, {"pk": 2, "tag": 2, "content_object": 13}], "body": "", "numchild": 0, "time_from": null, "speakers": [], "audience": null, "content_type": 54, "date_to": null, "path": "0001000100030001", "url_path": "/home/event-index/event-page-1/", "expired": false, "pk": 13, "locked": false, "depth": 4, "first_published_at": null, "expire_at": null}	\N	13	1
38	f	2016-11-01 11:23:02.738075-04	{"carousel_items": [], "show_in_menus": true, "search_description": "", "owner": 1, "cost": "FREE", "latest_revision_created_at": "2016-07-20T08:08:44.398Z", "time_to": "14:00:00", "go_live_at": null, "feed_image": 9, "related_links": [], "title": "Event Page 1", "signup_link": "http://chrisdev.com", "date_from": "2019-06-01", "seo_title": "", "slug": "event-page-1", "live": true, "location": "ChrisDev Headquaters", "has_unpublished_changes": false, "tagged_items": [{"pk": null, "tag": 1, "content_object": 13}, {"pk": null, "tag": 2, "content_object": 13}], "body": "<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque \\nporttitor ullamcorper ullamcorper. Vestibulum ante ipsum primis in \\nfaucibus orci luctus et ultrices posuere cubilia Curae; Curabitur \\nposuere imperdiet lacus ut faucibus. Donec aliquam nisi eu varius \\nvestibulum.</p><p>Fusce porttitor facilisis sapien. Duis a gravida elit. Sed \\nblandit mollis enim quis pharetra. Vivamus faucibus facilisis metus \\nconvallis venenatis. Vestibulum sollicitudin ac turpis sit amet blandit.\\n</p>", "numchild": 0, "time_from": "10:00:00", "speakers": [], "audience": "public", "content_type": 54, "date_to": "2020-11-13", "path": "0001000100030001", "url_path": "/home/event-index/event-page-1/", "expired": false, "pk": 13, "locked": false, "depth": 4, "first_published_at": "2016-07-20T08:08:44.515Z", "expire_at": null}	\N	13	1
39	f	2017-05-29 02:48:04.286239-04	{"search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": "2016-07-20T08:11:32.075Z", "go_live_at": null, "related_links": [], "title": "Blog Index", "seo_title": "", "slug": "blog-index", "live": true, "has_unpublished_changes": false, "numchild": 3, "content_type": 43, "show_in_menus": true, "path": "000100010004", "url_path": "/home/blog-index/", "expired": false, "pk": 16, "locked": false, "depth": 3, "first_published_at": "2016-07-20T08:11:32.157Z", "expire_at": null}	\N	16	1
5	f	2016-07-20 03:48:57.364463-04	{"subtitle": "", "carousel_items": [], "search_description": "", "owner": 1, "intro": "<p><br/></p>", "latest_revision_created_at": null, "go_live_at": null, "feed_image": null, "related_links": [], "title": "Standard Page w/o Sidebar", "seo_title": "", "slug": "standard-page-wo-sidebar", "template_string": "pages/standard_page_full.html", "live": true, "has_unpublished_changes": false, "body": "<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam et mauris eu nibh elementum blandit varius sit amet enim. Quisque massa leo, ornare in mattis vitae, vehicula vestibulum diam. Phasellus id leo placerat, vehicula diam nec, interdum mi. Nunc lacinia massa tristique nunc accumsan, eu dapibus odio feugiat. Donec varius quam dictum placerat porttitor. Vivamus fermentum cursus nibh in facilisis. Aenean in justo auctor, faucibus risus eu, semper nisl. Ut nec suscipit nibh. Donec feugiat eget dui in rhoncus. Curabitur imperdiet tortor ut quam tempus sagittis. Morbi lectus magna, viverra ut turpis a, dapibus sollicitudin diam. Morbi vel urna suscipit, sodales ante id, luctus velit.<br/></p><p><embed alt=\\"wagtail.jpg\\" embedtype=\\"image\\" format=\\"fullwidth\\" id=\\"9\\"/><br/></p><p>Fusce et diam quis ipsum pulvinar euismod sit amet ac libero. Proin mauris ligula, egestas at tempus non, tempor et dolor. Proin porttitor, nibh quis consequat posuere, dolor eros eleifend nisi, ac semper ex nulla sit amet urna. Ut venenatis eros nec gravida molestie. Integer hendrerit mollis odio vitae porttitor. Sed ut elementum magna. Morbi laoreet odio lorem, eu fringilla nulla venenatis id. Duis nisl erat, aliquet in tortor eget, ullamcorper varius quam. Sed venenatis posuere ipsum, ut maximus ligula tristique fermentum. Ut eget porttitor quam. In varius diam quis viverra porttutor.</p>", "numchild": 0, "content_type": 37, "show_in_menus": true, "path": "0001000100010001", "url_path": "/home/standard-index/standard-page-wo-sidebar/", "expired": false, "pk": 5, "locked": false, "depth": 4, "first_published_at": null, "expire_at": null}	\N	5	1
40	f	2017-06-06 09:21:53.664968-04	{"subtitle": "", "carousel_items": [], "search_description": "", "owner": 1, "intro": "<p><br/></p>", "latest_revision_created_at": "2016-07-20T07:48:57.364Z", "go_live_at": null, "feed_image": null, "related_links": [], "title": "Standard Page w/o Sidebar", "seo_title": "", "slug": "standard-page-wo-sidebar", "template_string": "pages/standard_page_full.html", "live": true, "has_unpublished_changes": false, "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam et \\\\nmauris eu nibh elementum blandit varius sit amet enim. Quisque massa \\\\nleo, ornare in mattis vitae, vehicula vestibulum diam. Phasellus id leo \\\\nplacerat, vehicula diam nec, interdum mi. Nunc lacinia massa tristique \\\\nnunc accumsan, eu dapibus odio feugiat. Donec varius quam dictum \\\\nplacerat porttitor. Vivamus fermentum cursus nibh in facilisis. Aenean \\\\nin justo auctor, faucibus risus eu, semper nisl. Ut nec suscipit nibh. \\\\nDonec feugiat eget dui in rhoncus. Curabitur imperdiet tortor ut quam \\\\ntempus sagittis. Morbi lectus magna, viverra ut turpis a, dapibus \\\\nsollicitudin diam. Morbi vel urna suscipit, sodales ante id, luctus \\\\nvelit.</p>\\"}, {\\"type\\": \\"image\\", \\"value\\": 9}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>Fusce et diam quis ipsum pulvinar euismod sit amet ac libero. Proin \\\\nmauris ligula, egestas at tempus non, tempor et dolor. Proin porttitor, \\\\nnibh quis consequat posuere, dolor eros eleifend nisi, ac semper ex \\\\nnulla sit amet urna. Ut venenatis eros nec gravida molestie. Integer \\\\nhendrerit mollis odio vitae porttitor. Sed ut elementum magna. Morbi \\\\nlaoreet odio lorem, eu fringilla nulla venenatis id. Duis nisl erat, \\\\naliquet in tortor eget, ullamcorper varius quam. Sed venenatis posuere \\\\nipsum, ut maximus ligula tristique fermentum. Ut eget porttitor quam. In\\\\n varius diam quis viverra porttutor.</p>\\"}]", "numchild": 0, "content_type": 37, "show_in_menus": true, "path": "0001000100010001", "url_path": "/home/standard-index/standard-page-wo-sidebar/", "expired": false, "pk": 5, "locked": false, "depth": 4, "first_published_at": "2016-07-20T07:48:57.449Z", "expire_at": null}	\N	5	1
6	f	2016-07-20 03:50:19.395088-04	{"subtitle": "", "carousel_items": [], "search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": null, "go_live_at": null, "feed_image": null, "related_links": [], "title": "Standard Page", "seo_title": "", "slug": "standard-page", "template_string": "pages/standard_page.html", "live": true, "has_unpublished_changes": false, "body": "<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam et mauris eu nibh elementum blandit varius sit amet enim. Quisque massa leo, ornare in mattis vitae, vehicula vestibulum diam. Phasellus id leo placerat, vehicula diam nec, interdum mi. Nunc lacinia massa tristique nunc accumsan, eu dapibus odio feugiat. Donec varius quam dictum placerat porttitor. Vivamus fermentum cursus nibh in facilisis. Aenean in justo auctor, faucibus risus eu, semper nisl. Ut nec suscipit nibh. Donec feugiat eget dui in rhoncus. Curabitur imperdiet tortor ut quam tempus sagittis. Morbi lectus magna, viverra ut turpis a, dapibus sollicitudin diam. Morbi vel urna suscipit, sodales ante id, luctus velit.</p><p><embed alt=\\"foundation.jpg\\" embedtype=\\"image\\" format=\\"fullwidth\\" id=\\"3\\"/><br/></p><p>Fusce et diam quis ipsum pulvinar euismod sit amet ac libero. Proin mauris ligula, egestas at tempus non, tempor et dolor. Proin porttitor, nibh quis consequat posuere, dolor eros eleifend nisi, ac semper ex nulla sit amet urna. Ut venenatis eros nec gravida molestie. Integer hendrerit mollis odio vitae porttitor. Sed ut elementum magna. Morbi laoreet odio lorem, eu fringilla nulla venenatis id. Duis nisl erat, aliquet in tortor eget, ullamcorper varius quam. Sed venenatis posuere ipsum, ut maximus ligula tristique fermentum. Ut eget porttitor quam. In varius diam quis viverra porttutor.<br/></p>", "numchild": 0, "content_type": 37, "show_in_menus": true, "path": "0001000100010002", "url_path": "/home/standard-index/standard-page/", "expired": false, "pk": 6, "locked": false, "depth": 4, "first_published_at": null, "expire_at": null}	\N	6	1
41	f	2017-06-06 09:22:33.296026-04	{"subtitle": "", "carousel_items": [], "search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": "2016-07-20T07:50:19.395Z", "go_live_at": null, "feed_image": null, "related_links": [], "title": "Standard Page", "seo_title": "", "slug": "standard-page", "template_string": "pages/standard_page.html", "live": true, "has_unpublished_changes": false, "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam et \\\\nmauris eu nibh elementum blandit varius sit amet enim. Quisque massa \\\\nleo, ornare in mattis vitae, vehicula vestibulum diam. Phasellus id leo \\\\nplacerat, vehicula diam nec, interdum mi. Nunc lacinia massa tristique \\\\nnunc accumsan, eu dapibus odio feugiat. Donec varius quam dictum \\\\nplacerat porttitor. Vivamus fermentum cursus nibh in facilisis. Aenean \\\\nin justo auctor, faucibus risus eu, semper nisl. Ut nec suscipit nibh. \\\\nDonec feugiat eget dui in rhoncus. Curabitur imperdiet tortor ut quam \\\\ntempus sagittis. Morbi lectus magna, viverra ut turpis a, dapibus \\\\nsollicitudin diam. Morbi vel urna suscipit, sodales ante id, luctus \\\\nvelit.</p>\\"}, {\\"type\\": \\"image\\", \\"value\\": 3}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>Fusce et diam quis ipsum pulvinar euismod sit amet ac libero. Proin \\\\nmauris ligula, egestas at tempus non, tempor et dolor. Proin porttitor, \\\\nnibh quis consequat posuere, dolor eros eleifend nisi, ac semper ex \\\\nnulla sit amet urna. Ut venenatis eros nec gravida molestie. Integer \\\\nhendrerit mollis odio vitae porttitor. Sed ut elementum magna. Morbi \\\\nlaoreet odio lorem, eu fringilla nulla venenatis id. Duis nisl erat, \\\\naliquet in tortor eget, ullamcorper varius quam. Sed venenatis posuere \\\\nipsum, ut maximus ligula tristique fermentum. Ut eget porttitor quam. In\\\\n varius diam quis viverra porttutor.</p>\\"}]", "numchild": 0, "content_type": 37, "show_in_menus": true, "path": "0001000100010002", "url_path": "/home/standard-index/standard-page/", "expired": false, "pk": 6, "locked": false, "depth": 4, "first_published_at": "2016-07-20T07:50:19.479Z", "expire_at": null}	\N	6	1
4	f	2016-07-20 03:46:10.872621-04	{"subtitle": "", "search_description": "", "owner": 1, "intro": "<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam et mauris eu nibh elementum blandit varius sit amet enim. Quisque massa leo, ornare in mattis vitae, vehicula vestibulum diam. Phasellus id leo placerat, vehicula diam nec, interdum mi. Nunc lacinia massa tristique nunc accumsan, eu dapibus odio feugiat. Donec varius quam dictum placerat porttitor. Vivamus fermentum cursus nibh in facilisis. Aenean in justo auctor, faucibus risus eu, semper nisl. Ut nec suscipit nibh. Donec feugiat eget dui in rhoncus. Curabitur imperdiet tortor ut quam tempus sagittis. Morbi lectus magna, viverra ut turpis a, dapibus sollicitudin diam. Morbi vel urna suscipit, sodales ante id, luctus velit.</p>", "latest_revision_created_at": null, "go_live_at": null, "feed_image": null, "related_links": [], "title": "Standard Index", "seo_title": "", "slug": "standard-index", "live": true, "has_unpublished_changes": false, "numchild": 0, "content_type": 34, "show_in_menus": true, "path": "000100010001", "url_path": "/home/standard-index/", "expired": false, "pk": 4, "locked": false, "depth": 3, "first_published_at": null, "expire_at": null}	\N	4	1
42	f	2017-11-02 11:54:05.836356-04	{"subtitle": "", "search_description": "", "owner": 1, "intro": "<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam et mauris eu nibh elementum blandit varius sit amet enim. Quisque massa leo, ornare in mattis vitae, vehicula vestibulum diam. Phasellus id leo placerat, vehicula diam nec, interdum mi. Nunc lacinia massa tristique nunc accumsan, eu dapibus odio feugiat. Donec varius quam dictum placerat porttitor. Vivamus fermentum cursus nibh in facilisis. Aenean in justo auctor, faucibus risus eu, semper nisl. Ut nec suscipit nibh. Donec feugiat eget dui in rhoncus. Curabitur imperdiet tortor ut quam tempus sagittis. Morbi lectus magna, viverra ut turpis a, dapibus sollicitudin diam. Morbi vel urna suscipit, sodales ante id, luctus velit.</p>", "latest_revision_created_at": "2016-07-20T07:46:10.872Z", "go_live_at": null, "feed_image": null, "related_links": [], "title": "Standard Index", "seo_title": "", "draft_title": "Standard Index", "template_string": "pages/standard_index_page_grid.html", "live": true, "last_published_at": "2016-07-20T07:46:10.872Z", "has_unpublished_changes": false, "numchild": 2, "content_type": 34, "show_in_menus": true, "path": "000100010001", "url_path": "/home/standard-index/", "expired": false, "slug": "standard-index", "locked": false, "pk": 4, "depth": 3, "first_published_at": "2016-07-20T07:46:10.958Z", "expire_at": null, "live_revision": null}	\N	4	1
43	f	2017-11-02 12:04:54.025129-04	{"subtitle": "", "search_description": "", "owner": 1, "intro": "<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam et mauris eu nibh elementum blandit varius sit amet enim. Quisque massa leo, ornare in mattis vitae, vehicula vestibulum diam. Phasellus id leo placerat, vehicula diam nec, interdum mi. Nunc lacinia massa tristique nunc accumsan, eu dapibus odio feugiat. Donec varius quam dictum placerat porttitor. Vivamus fermentum cursus nibh in facilisis. Aenean in justo auctor, faucibus risus eu, semper nisl. Ut nec suscipit nibh. Donec feugiat eget dui in rhoncus. Curabitur imperdiet tortor ut quam tempus sagittis. Morbi lectus magna, viverra ut turpis a, dapibus sollicitudin diam. Morbi vel urna suscipit, sodales ante id, luctus velit.</p>", "latest_revision_created_at": "2017-11-02T15:54:05.836Z", "go_live_at": null, "feed_image": null, "related_links": [], "title": "Standard Index", "seo_title": "", "draft_title": "Standard Index", "template_string": "pages/standard_index_page.html", "live": true, "last_published_at": "2017-11-02T15:54:06.830Z", "has_unpublished_changes": false, "numchild": 2, "content_type": 34, "show_in_menus": true, "path": "000100010001", "url_path": "/home/standard-index/", "expired": false, "slug": "standard-index", "locked": false, "pk": 4, "depth": 3, "first_published_at": "2016-07-20T07:46:10.958Z", "expire_at": null, "live_revision": 42}	\N	4	1
\.


--
-- Data for Name: wagtailcore_pageviewrestriction; Type: TABLE DATA; Schema: public; Owner: -
--

COPY wagtailcore_pageviewrestriction (id, password, page_id, restriction_type) FROM stdin;
\.


--
-- Data for Name: wagtailcore_pageviewrestriction_groups; Type: TABLE DATA; Schema: public; Owner: -
--

COPY wagtailcore_pageviewrestriction_groups (id, pageviewrestriction_id, group_id) FROM stdin;
\.


--
-- Data for Name: wagtailcore_site; Type: TABLE DATA; Schema: public; Owner: -
--

COPY wagtailcore_site (id, hostname, port, is_default_site, root_page_id, site_name) FROM stdin;
2	localhost	80	t	3	Chrisdev Wagtail
\.


--
-- Data for Name: wagtaildocs_document; Type: TABLE DATA; Schema: public; Owner: -
--

COPY wagtaildocs_document (id, title, file, created_at, uploaded_by_user_id, collection_id) FROM stdin;
3	sample.pdf	documents/sample.pdf	2016-07-20 04:20:05.885324-04	1	1
2	example.docx	documents/example.docx	2016-07-20 04:20:05.773672-04	1	1
1	document.doc	documents/document.doc	2016-07-20 04:20:05.540446-04	1	1
\.


--
-- Data for Name: wagtailembeds_embed; Type: TABLE DATA; Schema: public; Owner: -
--

COPY wagtailembeds_embed (id, url, max_width, type, html, title, author_name, provider_name, thumbnail_url, width, height, last_updated) FROM stdin;
\.


--
-- Data for Name: wagtailforms_formsubmission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY wagtailforms_formsubmission (id, form_data, submit_time, page_id) FROM stdin;
1	{"message": "Test Message", "subject": "Test Subject", "name": "Test", "email": "test@test.com"}	2016-07-20 04:32:59.957933-04	24
\.


--
-- Data for Name: wagtailimages_image; Type: TABLE DATA; Schema: public; Owner: -
--

COPY wagtailimages_image (id, title, file, width, height, created_at, focal_point_x, focal_point_y, focal_point_width, focal_point_height, uploaded_by_user_id, file_size, collection_id) FROM stdin;
1	ansible.png	original_images/ansible.png	512	512	2016-07-20 03:38:05.682273-04	\N	\N	\N	\N	1	43211	1
2	digital_ocean.png	original_images/digital_ocean.png	512	512	2016-07-20 03:38:05.875039-04	\N	\N	\N	\N	1	58324	1
4	placeholder_person.png	original_images/placeholder_person.png	600	568	2016-07-20 03:38:06.108297-04	\N	\N	\N	\N	1	10449	1
6	postgresql.png	original_images/postgresql.png	512	512	2016-07-20 03:38:06.311475-04	\N	\N	\N	\N	1	225303	1
8	sass.png	original_images/sass.png	512	512	2016-07-20 03:38:06.512278-04	\N	\N	\N	\N	1	88756	1
10	wagtail.png	original_images/wagtail.png	512	512	2016-07-20 03:38:06.707594-04	\N	\N	\N	\N	1	28197	1
11	yeti.png	original_images/yeti.png	512	512	2016-07-20 03:38:06.821022-04	\N	\N	\N	\N	1	101373	1
9	wagtail.jpg	original_images/wagtail.jpg	1300	500	2016-07-20 03:38:06.614054-04	\N	\N	\N	\N	1	60370	1
7	sass.jpg	original_images/sass.jpg	1300	500	2016-07-20 03:38:06.406475-04	\N	\N	\N	\N	1	158244	1
5	postgresql.jpg	original_images/postgresql.jpg	1300	500	2016-07-20 03:38:06.2173-04	\N	\N	\N	\N	1	117964	1
3	foundation.jpg	original_images/foundation.jpg	1300	500	2016-07-20 03:38:06.005665-04	\N	\N	\N	\N	1	131208	1
12	chrisdev logo	original_images/chrisdevf_favicon.png	500	500	2017-10-10 10:30:40.591611-04	\N	\N	\N	\N	1	\N	1
\.


--
-- Data for Name: wagtailimages_rendition; Type: TABLE DATA; Schema: public; Owner: -
--

COPY wagtailimages_rendition (id, file, width, height, focal_point_key, image_id, filter_spec) FROM stdin;
1	images/yeti.max-165x165.png	165	165		11	max-165x165
2	images/wagtail.max-165x165.png	165	165		10	max-165x165
3	images/wagtail.max-165x165.jpg	165	63		9	max-165x165
4	images/sass.max-165x165.png	165	165		8	max-165x165
5	images/sass.max-165x165.jpg	165	63		7	max-165x165
6	images/postgresql.max-165x165.png	165	165		6	max-165x165
7	images/postgresql.max-165x165.jpg	165	63		5	max-165x165
8	images/placeholder_person.max-165x165.png	165	156		4	max-165x165
9	images/foundation.max-165x165.jpg	165	63		3	max-165x165
10	images/digital_ocean.max-165x165.png	165	165		2	max-165x165
11	images/ansible.max-165x165.png	165	165		1	max-165x165
12	images/foundation.width-1400.jpg	1300	500		3	width-1400
13	images/wagtail.width-1400.jpg	1300	500		9	width-1400
14	images/postgresql.width-1400.jpg	1300	500		5	width-1400
15	images/sass.width-1400.jpg	1300	500		7	width-1400
16	images/yeti.2e16d0ba.fill-70x70.png	70	70	2e16d0ba	11	fill-70x70
17	images/wagtail.2e16d0ba.fill-70x70.png	70	70	2e16d0ba	10	fill-70x70
18	images/ansible.2e16d0ba.fill-70x70.png	70	70	2e16d0ba	1	fill-70x70
19	images/sass.2e16d0ba.fill-70x70.png	70	70	2e16d0ba	8	fill-70x70
20	images/postgresql.2e16d0ba.fill-70x70.png	70	70	2e16d0ba	6	fill-70x70
21	images/digital_ocean.2e16d0ba.fill-70x70.png	70	70	2e16d0ba	2	fill-70x70
22	images/wagtail.max-800x600.jpg	800	307		9	max-800x600
24	images/foundation.max-800x600.jpg	800	307		3	max-800x600
28	images/sass.max-800x600.jpg	800	307		7	max-800x600
32	images/sass.max-800x600.png	512	512		8	max-800x600
35	images/postgresql.max-800x600.jpg	800	307		5	max-800x600
23	images/wagtail.width-800.jpg	800	307		9	width-800
25	images/foundation.width-800.jpg	800	307		3	width-800
29	images/sass.width-800.jpg	800	307		7	width-800
26	images/placeholder_person.width-180.png	180	170		4	width-180
27	images/placeholder_person.2e16d0ba.fill-400x400.png	400	400	2e16d0ba	4	fill-400x400
30	images/wagtail.original.jpg	1300	500		9	original
31	images/sass.original.png	512	512		8	original
33	images/sass.original.jpg	1300	500		7	original
34	images/postgresql.original.jpg	1300	500		5	original
36	images/foundation.original.jpg	1300	500		3	original
37	images/wagtail.width-1200.jpg	1200	461		9	width-1200
38	images/sass.width-1200.jpg	1200	461		7	width-1200
39	images/postgresql.width-1200.jpg	1200	461		5	width-1200
40	images/foundation.width-1200.jpg	1200	461		3	width-1200
41	images/sass.2e16d0ba.fill-1200x400.jpg	1200	400	2e16d0ba	7	fill-1200x400
42	images/wagtail.2e16d0ba.fill-1200x400.jpg	1200	400	2e16d0ba	9	fill-1200x400
43	images/foundation.2e16d0ba.fill-1200x400.jpg	1200	400	2e16d0ba	3	fill-1200x400
44	images/wagtail.2e16d0ba.fill-600x250.png	512	214	2e16d0ba	10	fill-600x250
45	images/wagtail.2e16d0ba.fill-300x250.png	300	250	2e16d0ba	10	fill-300x250
46	images/wagtail.2e16d0ba.fill-1200x600.jpg	1000	500	2e16d0ba	9	fill-1200x600
47	images/foundation.2e16d0ba.fill-1200x600.jpg	1000	500	2e16d0ba	3	fill-1200x600
48	images/wagtail.2e16d0ba.fill-1200x880.jpg	682	500	2e16d0ba	9	fill-1200x880
49	images/wagtail.2e16d0ba.fill-500x350.jpg	500	350	2e16d0ba	9	fill-500x350
50	images/wagtail.2e16d0ba.fill-1200x440.jpg	1200	440	2e16d0ba	9	fill-1200x440
51	images/foundation.2e16d0ba.fill-1200x440.jpg	1200	440	2e16d0ba	3	fill-1200x440
52	images/wagtail.2e16d0ba.fill-100x100.jpg	100	100	2e16d0ba	9	fill-100x100
53	images/wagtail.width-90.png	90	90		10	width-90
54	images/wagtail.width-80.png	80	80		10	width-80
55	images/chrisdevf_favicon.max-165x165.png	165	165		12	max-165x165
56	images/chrisdevf_favicon.width-80.png	80	80		12	width-80
\.


--
-- Data for Name: wagtailredirects_redirect; Type: TABLE DATA; Schema: public; Owner: -
--

COPY wagtailredirects_redirect (id, old_path, is_permanent, redirect_link, redirect_page_id, site_id) FROM stdin;
\.


--
-- Data for Name: wagtailsearch_query; Type: TABLE DATA; Schema: public; Owner: -
--

COPY wagtailsearch_query (id, query_string) FROM stdin;
1	blog
2	photo
3	home
4	homepage
\.


--
-- Data for Name: wagtailsearch_querydailyhits; Type: TABLE DATA; Schema: public; Owner: -
--

COPY wagtailsearch_querydailyhits (id, date, hits, query_id) FROM stdin;
2	2017-05-29	1	2
3	2017-05-29	1	3
4	2017-05-29	1	4
1	2017-05-29	6	1
\.


--
-- Data for Name: wagtailsearchpromotions_searchpromotion; Type: TABLE DATA; Schema: public; Owner: -
--

COPY wagtailsearchpromotions_searchpromotion (id, sort_order, description, page_id, query_id) FROM stdin;
\.


--
-- Data for Name: wagtailusers_userprofile; Type: TABLE DATA; Schema: public; Owner: -
--

COPY wagtailusers_userprofile (id, submitted_notifications, approved_notifications, rejected_notifications, user_id, preferred_language) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('auth_group_id_seq', 2, true);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 14, true);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('auth_permission_id_seq', 247, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('auth_user_id_seq', 1, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Name: blog_blogindexpagerelatedlink_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('blog_blogindexpagerelatedlink_id_seq', 1, false);


--
-- Name: blog_blogpagecarouselitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('blog_blogpagecarouselitem_id_seq', 1, false);


--
-- Name: blog_blogpagerelatedlink_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('blog_blogpagerelatedlink_id_seq', 6, true);


--
-- Name: blog_blogpagetag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('blog_blogpagetag_id_seq', 1, false);


--
-- Name: contact_contactformfield_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('contact_contactformfield_id_seq', 4, true);


--
-- Name: contact_formfield_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('contact_formfield_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('django_content_type_id_seq', 82, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('django_migrations_id_seq', 162, true);


--
-- Name: documents_gallery_documentspagetag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('documents_gallery_documentspagetag_id_seq', 2, true);


--
-- Name: events_eventindexpagerelatedlink_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('events_eventindexpagerelatedlink_id_seq', 1, false);


--
-- Name: events_eventpagecarouselitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('events_eventpagecarouselitem_id_seq', 1, false);


--
-- Name: events_eventpagerelatedlink_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('events_eventpagerelatedlink_id_seq', 1, false);


--
-- Name: events_eventpagespeaker_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('events_eventpagespeaker_id_seq', 1, false);


--
-- Name: events_eventpagetag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('events_eventpagetag_id_seq', 6, true);


--
-- Name: pages_advert_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('pages_advert_id_seq', 1, true);


--
-- Name: pages_contentblock_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('pages_contentblock_id_seq', 1, false);


--
-- Name: pages_homepagecarouselitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('pages_homepagecarouselitem_id_seq', 4, true);


--
-- Name: pages_homepagecontentitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('pages_homepagecontentitem_id_seq', 6, true);


--
-- Name: pages_homepagerelatedlink_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('pages_homepagerelatedlink_id_seq', 1, false);


--
-- Name: pages_sitebranding_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('pages_sitebranding_id_seq', 1, true);


--
-- Name: pages_socialmediasettings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('pages_socialmediasettings_id_seq', 2, true);


--
-- Name: pages_standardindexpagerelatedlink_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('pages_standardindexpagerelatedlink_id_seq', 1, false);


--
-- Name: pages_standardpagecarouselitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('pages_standardpagecarouselitem_id_seq', 1, false);


--
-- Name: pages_standardpagerelatedlink_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('pages_standardpagerelatedlink_id_seq', 1, false);


--
-- Name: pages_testimonial_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('pages_testimonial_id_seq', 1, false);


--
-- Name: pages_videopagecarouselitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('pages_videopagecarouselitem_id_seq', 1, false);


--
-- Name: people_personindexpagerelatedlink_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('people_personindexpagerelatedlink_id_seq', 1, false);


--
-- Name: people_personpagerelatedlink_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('people_personpagerelatedlink_id_seq', 1, false);


--
-- Name: people_personpagetag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('people_personpagetag_id_seq', 1, false);


--
-- Name: people_personrole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('people_personrole_id_seq', 1, false);


--
-- Name: photo_gallery_gallerypagetag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('photo_gallery_gallerypagetag_id_seq', 3, true);


--
-- Name: postgres_search_indexentry_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('postgres_search_indexentry_id_seq', 48, true);


--
-- Name: products_productindexpagerelatedlink_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('products_productindexpagerelatedlink_id_seq', 1, false);


--
-- Name: products_productpagerelatedlink_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('products_productpagerelatedlink_id_seq', 1, false);


--
-- Name: products_productpagetag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('products_productpagetag_id_seq', 2, true);


--
-- Name: taggit_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('taggit_tag_id_seq', 8, true);


--
-- Name: taggit_taggeditem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('taggit_taggeditem_id_seq', 7, true);


--
-- Name: wagtail_feeds_rssfeedssettings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('wagtail_feeds_rssfeedssettings_id_seq', 1, true);


--
-- Name: wagtailcore_collection_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('wagtailcore_collection_id_seq', 1, true);


--
-- Name: wagtailcore_collectionviewrestriction_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('wagtailcore_collectionviewrestriction_groups_id_seq', 1, false);


--
-- Name: wagtailcore_collectionviewrestriction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('wagtailcore_collectionviewrestriction_id_seq', 1, false);


--
-- Name: wagtailcore_groupcollectionpermission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('wagtailcore_groupcollectionpermission_id_seq', 8, true);


--
-- Name: wagtailcore_grouppagepermission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('wagtailcore_grouppagepermission_id_seq', 6, true);


--
-- Name: wagtailcore_page_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('wagtailcore_page_id_seq', 26, true);


--
-- Name: wagtailcore_pagerevision_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('wagtailcore_pagerevision_id_seq', 43, true);


--
-- Name: wagtailcore_pageviewrestriction_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('wagtailcore_pageviewrestriction_groups_id_seq', 1, false);


--
-- Name: wagtailcore_pageviewrestriction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('wagtailcore_pageviewrestriction_id_seq', 1, false);


--
-- Name: wagtailcore_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('wagtailcore_site_id_seq', 2, true);


--
-- Name: wagtaildocs_document_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('wagtaildocs_document_id_seq', 3, true);


--
-- Name: wagtailembeds_embed_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('wagtailembeds_embed_id_seq', 1, false);


--
-- Name: wagtailforms_formsubmission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('wagtailforms_formsubmission_id_seq', 1, true);


--
-- Name: wagtailimages_image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('wagtailimages_image_id_seq', 12, true);


--
-- Name: wagtailimages_rendition_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('wagtailimages_rendition_id_seq', 56, true);


--
-- Name: wagtailredirects_redirect_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('wagtailredirects_redirect_id_seq', 1, false);


--
-- Name: wagtailsearch_editorspick_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('wagtailsearch_editorspick_id_seq', 1, false);


--
-- Name: wagtailsearch_query_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('wagtailsearch_query_id_seq', 4, true);


--
-- Name: wagtailsearch_querydailyhits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('wagtailsearch_querydailyhits_id_seq', 4, true);


--
-- Name: wagtailusers_userprofile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('wagtailusers_userprofile_id_seq', 1, false);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: blog_blogindexpage blog_blogindexpage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY blog_blogindexpage
    ADD CONSTRAINT blog_blogindexpage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: blog_blogindexpagerelatedlink blog_blogindexpagerelatedlink_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY blog_blogindexpagerelatedlink
    ADD CONSTRAINT blog_blogindexpagerelatedlink_pkey PRIMARY KEY (id);


--
-- Name: blog_blogpage blog_blogpage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY blog_blogpage
    ADD CONSTRAINT blog_blogpage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: blog_blogpagecarouselitem blog_blogpagecarouselitem_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY blog_blogpagecarouselitem
    ADD CONSTRAINT blog_blogpagecarouselitem_pkey PRIMARY KEY (id);


--
-- Name: blog_blogpagerelatedlink blog_blogpagerelatedlink_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY blog_blogpagerelatedlink
    ADD CONSTRAINT blog_blogpagerelatedlink_pkey PRIMARY KEY (id);


--
-- Name: blog_blogpagetag blog_blogpagetag_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY blog_blogpagetag
    ADD CONSTRAINT blog_blogpagetag_pkey PRIMARY KEY (id);


--
-- Name: contact_contactformfield contact_contactformfield_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contact_contactformfield
    ADD CONSTRAINT contact_contactformfield_pkey PRIMARY KEY (id);


--
-- Name: contact_contactpage contact_contactpage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contact_contactpage
    ADD CONSTRAINT contact_contactpage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: contact_formfield contact_formfield_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contact_formfield
    ADD CONSTRAINT contact_formfield_pkey PRIMARY KEY (id);


--
-- Name: contact_formpage contact_formpage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contact_formpage
    ADD CONSTRAINT contact_formpage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: documents_gallery_documentsindexpage documents_gallery_documentsindexpage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY documents_gallery_documentsindexpage
    ADD CONSTRAINT documents_gallery_documentsindexpage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: documents_gallery_documentspage documents_gallery_documentspage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY documents_gallery_documentspage
    ADD CONSTRAINT documents_gallery_documentspage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: documents_gallery_documentspagetag documents_gallery_documentspagetag_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY documents_gallery_documentspagetag
    ADD CONSTRAINT documents_gallery_documentspagetag_pkey PRIMARY KEY (id);


--
-- Name: events_eventindexpage events_eventindexpage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY events_eventindexpage
    ADD CONSTRAINT events_eventindexpage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: events_eventindexpagerelatedlink events_eventindexpagerelatedlink_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY events_eventindexpagerelatedlink
    ADD CONSTRAINT events_eventindexpagerelatedlink_pkey PRIMARY KEY (id);


--
-- Name: events_eventpage events_eventpage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY events_eventpage
    ADD CONSTRAINT events_eventpage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: events_eventpagecarouselitem events_eventpagecarouselitem_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY events_eventpagecarouselitem
    ADD CONSTRAINT events_eventpagecarouselitem_pkey PRIMARY KEY (id);


--
-- Name: events_eventpagerelatedlink events_eventpagerelatedlink_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY events_eventpagerelatedlink
    ADD CONSTRAINT events_eventpagerelatedlink_pkey PRIMARY KEY (id);


--
-- Name: events_eventpagespeaker events_eventpagespeaker_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY events_eventpagespeaker
    ADD CONSTRAINT events_eventpagespeaker_pkey PRIMARY KEY (id);


--
-- Name: events_eventpagetag events_eventpagetag_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY events_eventpagetag
    ADD CONSTRAINT events_eventpagetag_pkey PRIMARY KEY (id);


--
-- Name: pages_advert pages_advert_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pages_advert
    ADD CONSTRAINT pages_advert_pkey PRIMARY KEY (id);


--
-- Name: pages_contentblock pages_contentblock_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pages_contentblock
    ADD CONSTRAINT pages_contentblock_pkey PRIMARY KEY (id);


--
-- Name: pages_faqspage pages_faqspage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pages_faqspage
    ADD CONSTRAINT pages_faqspage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: pages_homepage pages_homepage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pages_homepage
    ADD CONSTRAINT pages_homepage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: pages_homepagecarouselitem pages_homepagecarouselitem_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pages_homepagecarouselitem
    ADD CONSTRAINT pages_homepagecarouselitem_pkey PRIMARY KEY (id);


--
-- Name: pages_homepagecontentitem pages_homepagecontentitem_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pages_homepagecontentitem
    ADD CONSTRAINT pages_homepagecontentitem_pkey PRIMARY KEY (id);


--
-- Name: pages_homepagerelatedlink pages_homepagerelatedlink_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pages_homepagerelatedlink
    ADD CONSTRAINT pages_homepagerelatedlink_pkey PRIMARY KEY (id);


--
-- Name: pages_sitebranding pages_sitebranding_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pages_sitebranding
    ADD CONSTRAINT pages_sitebranding_pkey PRIMARY KEY (id);


--
-- Name: pages_sitebranding pages_sitebranding_site_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pages_sitebranding
    ADD CONSTRAINT pages_sitebranding_site_id_key UNIQUE (site_id);


--
-- Name: pages_socialmediasettings pages_socialmediasettings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pages_socialmediasettings
    ADD CONSTRAINT pages_socialmediasettings_pkey PRIMARY KEY (id);


--
-- Name: pages_socialmediasettings pages_socialmediasettings_site_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pages_socialmediasettings
    ADD CONSTRAINT pages_socialmediasettings_site_id_key UNIQUE (site_id);


--
-- Name: pages_standardindexpage pages_standardindexpage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pages_standardindexpage
    ADD CONSTRAINT pages_standardindexpage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: pages_standardindexpagerelatedlink pages_standardindexpagerelatedlink_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pages_standardindexpagerelatedlink
    ADD CONSTRAINT pages_standardindexpagerelatedlink_pkey PRIMARY KEY (id);


--
-- Name: pages_standardpage pages_standardpage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pages_standardpage
    ADD CONSTRAINT pages_standardpage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: pages_standardpagecarouselitem pages_standardpagecarouselitem_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pages_standardpagecarouselitem
    ADD CONSTRAINT pages_standardpagecarouselitem_pkey PRIMARY KEY (id);


--
-- Name: pages_standardpagerelatedlink pages_standardpagerelatedlink_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pages_standardpagerelatedlink
    ADD CONSTRAINT pages_standardpagerelatedlink_pkey PRIMARY KEY (id);


--
-- Name: pages_testimonial pages_testimonial_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pages_testimonial
    ADD CONSTRAINT pages_testimonial_pkey PRIMARY KEY (id);


--
-- Name: pages_videogallerypage pages_videogallerypage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pages_videogallerypage
    ADD CONSTRAINT pages_videogallerypage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: pages_videogallerypagecarouselitem pages_videopagecarouselitem_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pages_videogallerypagecarouselitem
    ADD CONSTRAINT pages_videopagecarouselitem_pkey PRIMARY KEY (id);


--
-- Name: people_personindexpage people_personindexpage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY people_personindexpage
    ADD CONSTRAINT people_personindexpage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: people_personindexpagerelatedlink people_personindexpagerelatedlink_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY people_personindexpagerelatedlink
    ADD CONSTRAINT people_personindexpagerelatedlink_pkey PRIMARY KEY (id);


--
-- Name: people_personpage people_personpage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY people_personpage
    ADD CONSTRAINT people_personpage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: people_personpagerelatedlink people_personpagerelatedlink_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY people_personpagerelatedlink
    ADD CONSTRAINT people_personpagerelatedlink_pkey PRIMARY KEY (id);


--
-- Name: people_personpagetag people_personpagetag_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY people_personpagetag
    ADD CONSTRAINT people_personpagetag_pkey PRIMARY KEY (id);


--
-- Name: people_personrole people_personrole_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY people_personrole
    ADD CONSTRAINT people_personrole_pkey PRIMARY KEY (id);


--
-- Name: photo_gallery_galleryindexpage photo_gallery_galleryindexpage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY photo_gallery_galleryindexpage
    ADD CONSTRAINT photo_gallery_galleryindexpage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: photo_gallery_gallerypage photo_gallery_gallerypage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY photo_gallery_gallerypage
    ADD CONSTRAINT photo_gallery_gallerypage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: photo_gallery_gallerypagetag photo_gallery_gallerypagetag_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY photo_gallery_gallerypagetag
    ADD CONSTRAINT photo_gallery_gallerypagetag_pkey PRIMARY KEY (id);


--
-- Name: postgres_search_indexentry postgres_search_indexent_content_type_id_object_i_bae8f946_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postgres_search_indexentry
    ADD CONSTRAINT postgres_search_indexent_content_type_id_object_i_bae8f946_uniq UNIQUE (content_type_id, object_id);


--
-- Name: postgres_search_indexentry postgres_search_indexentry_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postgres_search_indexentry
    ADD CONSTRAINT postgres_search_indexentry_pkey PRIMARY KEY (id);


--
-- Name: products_productindexpage products_productindexpage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY products_productindexpage
    ADD CONSTRAINT products_productindexpage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: products_productindexpagerelatedlink products_productindexpagerelatedlink_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY products_productindexpagerelatedlink
    ADD CONSTRAINT products_productindexpagerelatedlink_pkey PRIMARY KEY (id);


--
-- Name: products_productpage products_productpage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY products_productpage
    ADD CONSTRAINT products_productpage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: products_productpagerelatedlink products_productpagerelatedlink_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY products_productpagerelatedlink
    ADD CONSTRAINT products_productpagerelatedlink_pkey PRIMARY KEY (id);


--
-- Name: products_productpagetag products_productpagetag_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY products_productpagetag
    ADD CONSTRAINT products_productpagetag_pkey PRIMARY KEY (id);


--
-- Name: taggit_tag taggit_tag_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY taggit_tag
    ADD CONSTRAINT taggit_tag_name_key UNIQUE (name);


--
-- Name: taggit_tag taggit_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY taggit_tag
    ADD CONSTRAINT taggit_tag_pkey PRIMARY KEY (id);


--
-- Name: taggit_tag taggit_tag_slug_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY taggit_tag
    ADD CONSTRAINT taggit_tag_slug_key UNIQUE (slug);


--
-- Name: taggit_taggeditem taggit_taggeditem_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY taggit_taggeditem
    ADD CONSTRAINT taggit_taggeditem_pkey PRIMARY KEY (id);


--
-- Name: wagtail_feeds_rssfeedssettings wagtail_feeds_rssfeedssettings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtail_feeds_rssfeedssettings
    ADD CONSTRAINT wagtail_feeds_rssfeedssettings_pkey PRIMARY KEY (id);


--
-- Name: wagtail_feeds_rssfeedssettings wagtail_feeds_rssfeedssettings_site_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtail_feeds_rssfeedssettings
    ADD CONSTRAINT wagtail_feeds_rssfeedssettings_site_id_key UNIQUE (site_id);


--
-- Name: wagtailcore_collection wagtailcore_collection_path_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailcore_collection
    ADD CONSTRAINT wagtailcore_collection_path_key UNIQUE (path);


--
-- Name: wagtailcore_collection wagtailcore_collection_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailcore_collection
    ADD CONSTRAINT wagtailcore_collection_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_collectionviewrestriction_groups wagtailcore_collectionvi_collectionviewrestrictio_988995ae_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailcore_collectionviewrestriction_groups
    ADD CONSTRAINT wagtailcore_collectionvi_collectionviewrestrictio_988995ae_uniq UNIQUE (collectionviewrestriction_id, group_id);


--
-- Name: wagtailcore_collectionviewrestriction_groups wagtailcore_collectionviewrestriction_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailcore_collectionviewrestriction_groups
    ADD CONSTRAINT wagtailcore_collectionviewrestriction_groups_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_collectionviewrestriction wagtailcore_collectionviewrestriction_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailcore_collectionviewrestriction
    ADD CONSTRAINT wagtailcore_collectionviewrestriction_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_groupcollectionpermission wagtailcore_groupcollectionpermission_group_id_a21cefe9_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailcore_groupcollectionpermission
    ADD CONSTRAINT wagtailcore_groupcollectionpermission_group_id_a21cefe9_uniq UNIQUE (group_id, collection_id, permission_id);


--
-- Name: wagtailcore_groupcollectionpermission wagtailcore_groupcollectionpermission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailcore_groupcollectionpermission
    ADD CONSTRAINT wagtailcore_groupcollectionpermission_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_grouppagepermission wagtailcore_grouppagepermission_group_id_0898bdf8_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailcore_grouppagepermission
    ADD CONSTRAINT wagtailcore_grouppagepermission_group_id_0898bdf8_uniq UNIQUE (group_id, page_id, permission_type);


--
-- Name: wagtailcore_grouppagepermission wagtailcore_grouppagepermission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailcore_grouppagepermission
    ADD CONSTRAINT wagtailcore_grouppagepermission_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_page wagtailcore_page_path_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailcore_page
    ADD CONSTRAINT wagtailcore_page_path_key UNIQUE (path);


--
-- Name: wagtailcore_page wagtailcore_page_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailcore_page
    ADD CONSTRAINT wagtailcore_page_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_pagerevision wagtailcore_pagerevision_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailcore_pagerevision
    ADD CONSTRAINT wagtailcore_pagerevision_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_pageviewrestriction_groups wagtailcore_pageviewrestri_pageviewrestriction_id_d23f80bb_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailcore_pageviewrestriction_groups
    ADD CONSTRAINT wagtailcore_pageviewrestri_pageviewrestriction_id_d23f80bb_uniq UNIQUE (pageviewrestriction_id, group_id);


--
-- Name: wagtailcore_pageviewrestriction_groups wagtailcore_pageviewrestriction_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailcore_pageviewrestriction_groups
    ADD CONSTRAINT wagtailcore_pageviewrestriction_groups_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_pageviewrestriction wagtailcore_pageviewrestriction_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailcore_pageviewrestriction
    ADD CONSTRAINT wagtailcore_pageviewrestriction_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_site wagtailcore_site_hostname_2c626d70_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailcore_site
    ADD CONSTRAINT wagtailcore_site_hostname_2c626d70_uniq UNIQUE (hostname, port);


--
-- Name: wagtailcore_site wagtailcore_site_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailcore_site
    ADD CONSTRAINT wagtailcore_site_pkey PRIMARY KEY (id);


--
-- Name: wagtaildocs_document wagtaildocs_document_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtaildocs_document
    ADD CONSTRAINT wagtaildocs_document_pkey PRIMARY KEY (id);


--
-- Name: wagtailembeds_embed wagtailembeds_embed_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailembeds_embed
    ADD CONSTRAINT wagtailembeds_embed_pkey PRIMARY KEY (id);


--
-- Name: wagtailembeds_embed wagtailembeds_embed_url_8a2922d8_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailembeds_embed
    ADD CONSTRAINT wagtailembeds_embed_url_8a2922d8_uniq UNIQUE (url, max_width);


--
-- Name: wagtailforms_formsubmission wagtailforms_formsubmission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailforms_formsubmission
    ADD CONSTRAINT wagtailforms_formsubmission_pkey PRIMARY KEY (id);


--
-- Name: wagtailimages_image wagtailimages_image_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailimages_image
    ADD CONSTRAINT wagtailimages_image_pkey PRIMARY KEY (id);


--
-- Name: wagtailimages_rendition wagtailimages_rendition_image_id_323c8fe0_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailimages_rendition
    ADD CONSTRAINT wagtailimages_rendition_image_id_323c8fe0_uniq UNIQUE (image_id, filter_spec, focal_point_key);


--
-- Name: wagtailimages_rendition wagtailimages_rendition_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailimages_rendition
    ADD CONSTRAINT wagtailimages_rendition_pkey PRIMARY KEY (id);


--
-- Name: wagtailredirects_redirect wagtailredirects_redirect_old_path_783622d7_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailredirects_redirect
    ADD CONSTRAINT wagtailredirects_redirect_old_path_783622d7_uniq UNIQUE (old_path, site_id);


--
-- Name: wagtailredirects_redirect wagtailredirects_redirect_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailredirects_redirect
    ADD CONSTRAINT wagtailredirects_redirect_pkey PRIMARY KEY (id);


--
-- Name: wagtailsearchpromotions_searchpromotion wagtailsearch_editorspick_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailsearchpromotions_searchpromotion
    ADD CONSTRAINT wagtailsearch_editorspick_pkey PRIMARY KEY (id);


--
-- Name: wagtailsearch_query wagtailsearch_query_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailsearch_query
    ADD CONSTRAINT wagtailsearch_query_pkey PRIMARY KEY (id);


--
-- Name: wagtailsearch_query wagtailsearch_query_query_string_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailsearch_query
    ADD CONSTRAINT wagtailsearch_query_query_string_key UNIQUE (query_string);


--
-- Name: wagtailsearch_querydailyhits wagtailsearch_querydailyhits_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailsearch_querydailyhits
    ADD CONSTRAINT wagtailsearch_querydailyhits_pkey PRIMARY KEY (id);


--
-- Name: wagtailsearch_querydailyhits wagtailsearch_querydailyhits_query_id_1dd232e6_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailsearch_querydailyhits
    ADD CONSTRAINT wagtailsearch_querydailyhits_query_id_1dd232e6_uniq UNIQUE (query_id, date);


--
-- Name: wagtailusers_userprofile wagtailusers_userprofile_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailusers_userprofile
    ADD CONSTRAINT wagtailusers_userprofile_pkey PRIMARY KEY (id);


--
-- Name: wagtailusers_userprofile wagtailusers_userprofile_user_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailusers_userprofile
    ADD CONSTRAINT wagtailusers_userprofile_user_id_key UNIQUE (user_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_group_name_a6ea08ec_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_0e939a4f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_group_permissions_0e939a4f ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_8373b171; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_group_permissions_8373b171 ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_417f1b1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_permission_417f1b1c ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_0e939a4f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_user_groups_0e939a4f ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_e8701ad4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_user_groups_e8701ad4 ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_8373b171; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_user_user_permissions_8373b171 ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_e8701ad4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_user_user_permissions_e8701ad4 ON auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_user_username_6821ab7c_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- Name: blog_blogindexpage_feed_image_id_5cb947e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX blog_blogindexpage_feed_image_id_5cb947e1 ON blog_blogindexpage USING btree (feed_image_id);


--
-- Name: blog_blogindexpagerelatedlink_121087a8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX blog_blogindexpagerelatedlink_121087a8 ON blog_blogindexpagerelatedlink USING btree (link_document_id);


--
-- Name: blog_blogindexpagerelatedlink_1a63c800; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX blog_blogindexpagerelatedlink_1a63c800 ON blog_blogindexpagerelatedlink USING btree (page_id);


--
-- Name: blog_blogindexpagerelatedlink_5b76e141; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX blog_blogindexpagerelatedlink_5b76e141 ON blog_blogindexpagerelatedlink USING btree (link_page_id);


--
-- Name: blog_blogpage_92482941; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX blog_blogpage_92482941 ON blog_blogpage USING btree (feed_image_id);


--
-- Name: blog_blogpagecarouselitem_121087a8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX blog_blogpagecarouselitem_121087a8 ON blog_blogpagecarouselitem USING btree (link_document_id);


--
-- Name: blog_blogpagecarouselitem_1a63c800; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX blog_blogpagecarouselitem_1a63c800 ON blog_blogpagecarouselitem USING btree (page_id);


--
-- Name: blog_blogpagecarouselitem_5b76e141; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX blog_blogpagecarouselitem_5b76e141 ON blog_blogpagecarouselitem USING btree (link_page_id);


--
-- Name: blog_blogpagecarouselitem_f33175e6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX blog_blogpagecarouselitem_f33175e6 ON blog_blogpagecarouselitem USING btree (image_id);


--
-- Name: blog_blogpagerelatedlink_121087a8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX blog_blogpagerelatedlink_121087a8 ON blog_blogpagerelatedlink USING btree (link_document_id);


--
-- Name: blog_blogpagerelatedlink_1a63c800; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX blog_blogpagerelatedlink_1a63c800 ON blog_blogpagerelatedlink USING btree (page_id);


--
-- Name: blog_blogpagerelatedlink_5b76e141; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX blog_blogpagerelatedlink_5b76e141 ON blog_blogpagerelatedlink USING btree (link_page_id);


--
-- Name: blog_blogpagetag_09a80f33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX blog_blogpagetag_09a80f33 ON blog_blogpagetag USING btree (content_object_id);


--
-- Name: blog_blogpagetag_76f094bc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX blog_blogpagetag_76f094bc ON blog_blogpagetag USING btree (tag_id);


--
-- Name: contact_contactformfield_1a63c800; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX contact_contactformfield_1a63c800 ON contact_contactformfield USING btree (page_id);


--
-- Name: contact_contactpage_feed_image_id_1f79cfe3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX contact_contactpage_feed_image_id_1f79cfe3 ON contact_contactpage USING btree (feed_image_id);


--
-- Name: contact_formfield_1a63c800; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX contact_formfield_1a63c800 ON contact_formfield USING btree (page_id);


--
-- Name: contact_formpage_feed_image_id_0303d2c9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX contact_formpage_feed_image_id_0303d2c9 ON contact_formpage USING btree (feed_image_id);


--
-- Name: django_admin_log_417f1b1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_admin_log_417f1b1c ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_e8701ad4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_admin_log_e8701ad4 ON django_admin_log USING btree (user_id);


--
-- Name: django_session_de54fa62; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_session_de54fa62 ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_session_session_key_c0390e0f_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: documents_gallery_documentsindexpage_92482941; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX documents_gallery_documentsindexpage_92482941 ON documents_gallery_documentsindexpage USING btree (feed_image_id);


--
-- Name: documents_gallery_documentspage_92482941; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX documents_gallery_documentspage_92482941 ON documents_gallery_documentspage USING btree (feed_image_id);


--
-- Name: documents_gallery_documentspagetag_09a80f33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX documents_gallery_documentspagetag_09a80f33 ON documents_gallery_documentspagetag USING btree (content_object_id);


--
-- Name: documents_gallery_documentspagetag_76f094bc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX documents_gallery_documentspagetag_76f094bc ON documents_gallery_documentspagetag USING btree (tag_id);


--
-- Name: events_eventindexpage_feed_image_id_d6958e2f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX events_eventindexpage_feed_image_id_d6958e2f ON events_eventindexpage USING btree (feed_image_id);


--
-- Name: events_eventindexpagerelatedlink_121087a8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX events_eventindexpagerelatedlink_121087a8 ON events_eventindexpagerelatedlink USING btree (link_document_id);


--
-- Name: events_eventindexpagerelatedlink_1a63c800; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX events_eventindexpagerelatedlink_1a63c800 ON events_eventindexpagerelatedlink USING btree (page_id);


--
-- Name: events_eventindexpagerelatedlink_5b76e141; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX events_eventindexpagerelatedlink_5b76e141 ON events_eventindexpagerelatedlink USING btree (link_page_id);


--
-- Name: events_eventpage_92482941; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX events_eventpage_92482941 ON events_eventpage USING btree (feed_image_id);


--
-- Name: events_eventpagecarouselitem_121087a8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX events_eventpagecarouselitem_121087a8 ON events_eventpagecarouselitem USING btree (link_document_id);


--
-- Name: events_eventpagecarouselitem_1a63c800; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX events_eventpagecarouselitem_1a63c800 ON events_eventpagecarouselitem USING btree (page_id);


--
-- Name: events_eventpagecarouselitem_5b76e141; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX events_eventpagecarouselitem_5b76e141 ON events_eventpagecarouselitem USING btree (link_page_id);


--
-- Name: events_eventpagecarouselitem_f33175e6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX events_eventpagecarouselitem_f33175e6 ON events_eventpagecarouselitem USING btree (image_id);


--
-- Name: events_eventpagerelatedlink_121087a8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX events_eventpagerelatedlink_121087a8 ON events_eventpagerelatedlink USING btree (link_document_id);


--
-- Name: events_eventpagerelatedlink_1a63c800; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX events_eventpagerelatedlink_1a63c800 ON events_eventpagerelatedlink USING btree (page_id);


--
-- Name: events_eventpagerelatedlink_5b76e141; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX events_eventpagerelatedlink_5b76e141 ON events_eventpagerelatedlink USING btree (link_page_id);


--
-- Name: events_eventpagespeaker_121087a8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX events_eventpagespeaker_121087a8 ON events_eventpagespeaker USING btree (link_document_id);


--
-- Name: events_eventpagespeaker_1a63c800; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX events_eventpagespeaker_1a63c800 ON events_eventpagespeaker USING btree (page_id);


--
-- Name: events_eventpagespeaker_5b76e141; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX events_eventpagespeaker_5b76e141 ON events_eventpagespeaker USING btree (link_page_id);


--
-- Name: events_eventpagespeaker_f33175e6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX events_eventpagespeaker_f33175e6 ON events_eventpagespeaker USING btree (image_id);


--
-- Name: events_eventpagetag_09a80f33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX events_eventpagetag_09a80f33 ON events_eventpagetag USING btree (content_object_id);


--
-- Name: events_eventpagetag_76f094bc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX events_eventpagetag_76f094bc ON events_eventpagetag USING btree (tag_id);


--
-- Name: pages_advert_121087a8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_advert_121087a8 ON pages_advert USING btree (link_document_id);


--
-- Name: pages_advert_1a63c800; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_advert_1a63c800 ON pages_advert USING btree (page_id);


--
-- Name: pages_advert_5b76e141; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_advert_5b76e141 ON pages_advert USING btree (link_page_id);


--
-- Name: pages_advert_f33175e6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_advert_f33175e6 ON pages_advert USING btree (image_id);


--
-- Name: pages_contentblock_121087a8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_contentblock_121087a8 ON pages_contentblock USING btree (link_document_id);


--
-- Name: pages_contentblock_1a63c800; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_contentblock_1a63c800 ON pages_contentblock USING btree (page_id);


--
-- Name: pages_contentblock_2dbcba41; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_contentblock_2dbcba41 ON pages_contentblock USING btree (slug);


--
-- Name: pages_contentblock_5b76e141; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_contentblock_5b76e141 ON pages_contentblock USING btree (link_page_id);


--
-- Name: pages_contentblock_slug_946a161b_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_contentblock_slug_946a161b_like ON pages_contentblock USING btree (slug varchar_pattern_ops);


--
-- Name: pages_homepage_92482941; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_homepage_92482941 ON pages_homepage USING btree (feed_image_id);


--
-- Name: pages_homepagecarouselitem_121087a8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_homepagecarouselitem_121087a8 ON pages_homepagecarouselitem USING btree (link_document_id);


--
-- Name: pages_homepagecarouselitem_1a63c800; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_homepagecarouselitem_1a63c800 ON pages_homepagecarouselitem USING btree (page_id);


--
-- Name: pages_homepagecarouselitem_5b76e141; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_homepagecarouselitem_5b76e141 ON pages_homepagecarouselitem USING btree (link_page_id);


--
-- Name: pages_homepagecarouselitem_f33175e6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_homepagecarouselitem_f33175e6 ON pages_homepagecarouselitem USING btree (image_id);


--
-- Name: pages_homepagecontentitem_121087a8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_homepagecontentitem_121087a8 ON pages_homepagecontentitem USING btree (link_document_id);


--
-- Name: pages_homepagecontentitem_1a63c800; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_homepagecontentitem_1a63c800 ON pages_homepagecontentitem USING btree (page_id);


--
-- Name: pages_homepagecontentitem_2dbcba41; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_homepagecontentitem_2dbcba41 ON pages_homepagecontentitem USING btree (slug);


--
-- Name: pages_homepagecontentitem_5b76e141; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_homepagecontentitem_5b76e141 ON pages_homepagecontentitem USING btree (link_page_id);


--
-- Name: pages_homepagecontentitem_f33175e6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_homepagecontentitem_f33175e6 ON pages_homepagecontentitem USING btree (image_id);


--
-- Name: pages_homepagecontentitem_slug_2f312148_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_homepagecontentitem_slug_2f312148_like ON pages_homepagecontentitem USING btree (slug varchar_pattern_ops);


--
-- Name: pages_homepagerelatedlink_121087a8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_homepagerelatedlink_121087a8 ON pages_homepagerelatedlink USING btree (link_document_id);


--
-- Name: pages_homepagerelatedlink_1a63c800; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_homepagerelatedlink_1a63c800 ON pages_homepagerelatedlink USING btree (page_id);


--
-- Name: pages_homepagerelatedlink_5b76e141; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_homepagerelatedlink_5b76e141 ON pages_homepagerelatedlink USING btree (link_page_id);


--
-- Name: pages_sitebranding_logo_id_2841159b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_sitebranding_logo_id_2841159b ON pages_sitebranding USING btree (logo_id);


--
-- Name: pages_standardindexpage_92482941; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_standardindexpage_92482941 ON pages_standardindexpage USING btree (feed_image_id);


--
-- Name: pages_standardindexpagerelatedlink_121087a8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_standardindexpagerelatedlink_121087a8 ON pages_standardindexpagerelatedlink USING btree (link_document_id);


--
-- Name: pages_standardindexpagerelatedlink_1a63c800; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_standardindexpagerelatedlink_1a63c800 ON pages_standardindexpagerelatedlink USING btree (page_id);


--
-- Name: pages_standardindexpagerelatedlink_5b76e141; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_standardindexpagerelatedlink_5b76e141 ON pages_standardindexpagerelatedlink USING btree (link_page_id);


--
-- Name: pages_standardpage_92482941; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_standardpage_92482941 ON pages_standardpage USING btree (feed_image_id);


--
-- Name: pages_standardpagecarouselitem_121087a8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_standardpagecarouselitem_121087a8 ON pages_standardpagecarouselitem USING btree (link_document_id);


--
-- Name: pages_standardpagecarouselitem_1a63c800; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_standardpagecarouselitem_1a63c800 ON pages_standardpagecarouselitem USING btree (page_id);


--
-- Name: pages_standardpagecarouselitem_5b76e141; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_standardpagecarouselitem_5b76e141 ON pages_standardpagecarouselitem USING btree (link_page_id);


--
-- Name: pages_standardpagecarouselitem_f33175e6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_standardpagecarouselitem_f33175e6 ON pages_standardpagecarouselitem USING btree (image_id);


--
-- Name: pages_standardpagerelatedlink_121087a8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_standardpagerelatedlink_121087a8 ON pages_standardpagerelatedlink USING btree (link_document_id);


--
-- Name: pages_standardpagerelatedlink_1a63c800; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_standardpagerelatedlink_1a63c800 ON pages_standardpagerelatedlink USING btree (page_id);


--
-- Name: pages_standardpagerelatedlink_5b76e141; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_standardpagerelatedlink_5b76e141 ON pages_standardpagerelatedlink USING btree (link_page_id);


--
-- Name: pages_testimonial_121087a8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_testimonial_121087a8 ON pages_testimonial USING btree (link_document_id);


--
-- Name: pages_testimonial_1a63c800; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_testimonial_1a63c800 ON pages_testimonial USING btree (page_id);


--
-- Name: pages_testimonial_5b76e141; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_testimonial_5b76e141 ON pages_testimonial USING btree (link_page_id);


--
-- Name: pages_testimonial_b4e75e23; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_testimonial_b4e75e23 ON pages_testimonial USING btree (photo_id);


--
-- Name: pages_videogallerypage_feed_image_id_250d9360; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_videogallerypage_feed_image_id_250d9360 ON pages_videogallerypage USING btree (feed_image_id);


--
-- Name: pages_videopagecarouselitem_image_id_2817929a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_videopagecarouselitem_image_id_2817929a ON pages_videogallerypagecarouselitem USING btree (image_id);


--
-- Name: pages_videopagecarouselitem_link_document_id_b7d2ab0f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_videopagecarouselitem_link_document_id_b7d2ab0f ON pages_videogallerypagecarouselitem USING btree (link_document_id);


--
-- Name: pages_videopagecarouselitem_link_page_id_16ed2e64; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_videopagecarouselitem_link_page_id_16ed2e64 ON pages_videogallerypagecarouselitem USING btree (link_page_id);


--
-- Name: pages_videopagecarouselitem_page_id_762410b6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_videopagecarouselitem_page_id_762410b6 ON pages_videogallerypagecarouselitem USING btree (page_id);


--
-- Name: people_personindexpage_feed_image_id_ea7ff652; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX people_personindexpage_feed_image_id_ea7ff652 ON people_personindexpage USING btree (feed_image_id);


--
-- Name: people_personindexpagerelatedlink_121087a8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX people_personindexpagerelatedlink_121087a8 ON people_personindexpagerelatedlink USING btree (link_document_id);


--
-- Name: people_personindexpagerelatedlink_1a63c800; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX people_personindexpagerelatedlink_1a63c800 ON people_personindexpagerelatedlink USING btree (page_id);


--
-- Name: people_personindexpagerelatedlink_5b76e141; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX people_personindexpagerelatedlink_5b76e141 ON people_personindexpagerelatedlink USING btree (link_page_id);


--
-- Name: people_personpage_84566833; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX people_personpage_84566833 ON people_personpage USING btree (role_id);


--
-- Name: people_personpage_92482941; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX people_personpage_92482941 ON people_personpage USING btree (feed_image_id);


--
-- Name: people_personpage_f33175e6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX people_personpage_f33175e6 ON people_personpage USING btree (image_id);


--
-- Name: people_personpagerelatedlink_121087a8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX people_personpagerelatedlink_121087a8 ON people_personpagerelatedlink USING btree (link_document_id);


--
-- Name: people_personpagerelatedlink_1a63c800; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX people_personpagerelatedlink_1a63c800 ON people_personpagerelatedlink USING btree (page_id);


--
-- Name: people_personpagerelatedlink_5b76e141; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX people_personpagerelatedlink_5b76e141 ON people_personpagerelatedlink USING btree (link_page_id);


--
-- Name: people_personpagetag_09a80f33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX people_personpagetag_09a80f33 ON people_personpagetag USING btree (content_object_id);


--
-- Name: people_personpagetag_76f094bc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX people_personpagetag_76f094bc ON people_personpagetag USING btree (tag_id);


--
-- Name: photo_gallery_galleryindexpage_92482941; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX photo_gallery_galleryindexpage_92482941 ON photo_gallery_galleryindexpage USING btree (feed_image_id);


--
-- Name: photo_gallery_gallerypage_92482941; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX photo_gallery_gallerypage_92482941 ON photo_gallery_gallerypage USING btree (feed_image_id);


--
-- Name: photo_gallery_gallerypagetag_09a80f33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX photo_gallery_gallerypagetag_09a80f33 ON photo_gallery_gallerypagetag USING btree (content_object_id);


--
-- Name: photo_gallery_gallerypagetag_76f094bc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX photo_gallery_gallerypagetag_76f094bc ON photo_gallery_gallerypagetag USING btree (tag_id);


--
-- Name: postgres_search_indexentry_body_search; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX postgres_search_indexentry_body_search ON postgres_search_indexentry USING gin (body_search);


--
-- Name: postgres_search_indexentry_content_type_id_d805086f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX postgres_search_indexentry_content_type_id_d805086f ON postgres_search_indexentry USING btree (content_type_id);


--
-- Name: products_productindexpage_feed_image_id_f1b46ba8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_productindexpage_feed_image_id_f1b46ba8 ON products_productindexpage USING btree (feed_image_id);


--
-- Name: products_productindexpagerelatedlink_121087a8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_productindexpagerelatedlink_121087a8 ON products_productindexpagerelatedlink USING btree (link_document_id);


--
-- Name: products_productindexpagerelatedlink_1a63c800; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_productindexpagerelatedlink_1a63c800 ON products_productindexpagerelatedlink USING btree (page_id);


--
-- Name: products_productindexpagerelatedlink_5b76e141; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_productindexpagerelatedlink_5b76e141 ON products_productindexpagerelatedlink USING btree (link_page_id);


--
-- Name: products_productpage_92482941; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_productpage_92482941 ON products_productpage USING btree (feed_image_id);


--
-- Name: products_productpage_f33175e6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_productpage_f33175e6 ON products_productpage USING btree (image_id);


--
-- Name: products_productpagerelatedlink_121087a8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_productpagerelatedlink_121087a8 ON products_productpagerelatedlink USING btree (link_document_id);


--
-- Name: products_productpagerelatedlink_1a63c800; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_productpagerelatedlink_1a63c800 ON products_productpagerelatedlink USING btree (page_id);


--
-- Name: products_productpagerelatedlink_5b76e141; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_productpagerelatedlink_5b76e141 ON products_productpagerelatedlink USING btree (link_page_id);


--
-- Name: products_productpagetag_09a80f33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_productpagetag_09a80f33 ON products_productpagetag USING btree (content_object_id);


--
-- Name: products_productpagetag_76f094bc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_productpagetag_76f094bc ON products_productpagetag USING btree (tag_id);


--
-- Name: taggit_tag_name_58eb2ed9_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX taggit_tag_name_58eb2ed9_like ON taggit_tag USING btree (name varchar_pattern_ops);


--
-- Name: taggit_tag_slug_6be58b2c_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX taggit_tag_slug_6be58b2c_like ON taggit_tag USING btree (slug varchar_pattern_ops);


--
-- Name: taggit_taggeditem_417f1b1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX taggit_taggeditem_417f1b1c ON taggit_taggeditem USING btree (content_type_id);


--
-- Name: taggit_taggeditem_76f094bc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX taggit_taggeditem_76f094bc ON taggit_taggeditem USING btree (tag_id);


--
-- Name: taggit_taggeditem_af31437c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX taggit_taggeditem_af31437c ON taggit_taggeditem USING btree (object_id);


--
-- Name: taggit_taggeditem_content_type_id_196cc965_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX taggit_taggeditem_content_type_id_196cc965_idx ON taggit_taggeditem USING btree (content_type_id, object_id);


--
-- Name: wagtailcore_collection_path_d848dc19_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailcore_collection_path_d848dc19_like ON wagtailcore_collection USING btree (path varchar_pattern_ops);


--
-- Name: wagtailcore_collectionview_collectionviewrestriction__47320efd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailcore_collectionview_collectionviewrestriction__47320efd ON wagtailcore_collectionviewrestriction_groups USING btree (collectionviewrestriction_id);


--
-- Name: wagtailcore_collectionviewrestriction_collection_id_761908ec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailcore_collectionviewrestriction_collection_id_761908ec ON wagtailcore_collectionviewrestriction USING btree (collection_id);


--
-- Name: wagtailcore_collectionviewrestriction_groups_group_id_1823f2a3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailcore_collectionviewrestriction_groups_group_id_1823f2a3 ON wagtailcore_collectionviewrestriction_groups USING btree (group_id);


--
-- Name: wagtailcore_groupcollectionpermission_0a1a4dd8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailcore_groupcollectionpermission_0a1a4dd8 ON wagtailcore_groupcollectionpermission USING btree (collection_id);


--
-- Name: wagtailcore_groupcollectionpermission_0e939a4f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailcore_groupcollectionpermission_0e939a4f ON wagtailcore_groupcollectionpermission USING btree (group_id);


--
-- Name: wagtailcore_groupcollectionpermission_8373b171; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailcore_groupcollectionpermission_8373b171 ON wagtailcore_groupcollectionpermission USING btree (permission_id);


--
-- Name: wagtailcore_grouppagepermission_0e939a4f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailcore_grouppagepermission_0e939a4f ON wagtailcore_grouppagepermission USING btree (group_id);


--
-- Name: wagtailcore_grouppagepermission_1a63c800; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailcore_grouppagepermission_1a63c800 ON wagtailcore_grouppagepermission USING btree (page_id);


--
-- Name: wagtailcore_page_2dbcba41; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailcore_page_2dbcba41 ON wagtailcore_page USING btree (slug);


--
-- Name: wagtailcore_page_417f1b1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailcore_page_417f1b1c ON wagtailcore_page USING btree (content_type_id);


--
-- Name: wagtailcore_page_5e7b1936; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailcore_page_5e7b1936 ON wagtailcore_page USING btree (owner_id);


--
-- Name: wagtailcore_page_first_published_at_2b5dd637_uniq; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailcore_page_first_published_at_2b5dd637_uniq ON wagtailcore_page USING btree (first_published_at);


--
-- Name: wagtailcore_page_live_revision_id_930bd822; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailcore_page_live_revision_id_930bd822 ON wagtailcore_page USING btree (live_revision_id);


--
-- Name: wagtailcore_page_path_98eba2c8_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailcore_page_path_98eba2c8_like ON wagtailcore_page USING btree (path varchar_pattern_ops);


--
-- Name: wagtailcore_page_slug_e7c11b8f_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailcore_page_slug_e7c11b8f_like ON wagtailcore_page USING btree (slug varchar_pattern_ops);


--
-- Name: wagtailcore_pagerevision_1a63c800; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailcore_pagerevision_1a63c800 ON wagtailcore_pagerevision USING btree (page_id);


--
-- Name: wagtailcore_pagerevision_created_at_66954e3b_uniq; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailcore_pagerevision_created_at_66954e3b_uniq ON wagtailcore_pagerevision USING btree (created_at);


--
-- Name: wagtailcore_pagerevision_e8701ad4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailcore_pagerevision_e8701ad4 ON wagtailcore_pagerevision USING btree (user_id);


--
-- Name: wagtailcore_pagerevision_submitted_for_moderation_c682e44c_uniq; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailcore_pagerevision_submitted_for_moderation_c682e44c_uniq ON wagtailcore_pagerevision USING btree (submitted_for_moderation);


--
-- Name: wagtailcore_pageviewrestriction_1a63c800; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailcore_pageviewrestriction_1a63c800 ON wagtailcore_pageviewrestriction USING btree (page_id);


--
-- Name: wagtailcore_pageviewrestriction_groups_0e939a4f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailcore_pageviewrestriction_groups_0e939a4f ON wagtailcore_pageviewrestriction_groups USING btree (group_id);


--
-- Name: wagtailcore_pageviewrestriction_groups_9bdbac54; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailcore_pageviewrestriction_groups_9bdbac54 ON wagtailcore_pageviewrestriction_groups USING btree (pageviewrestriction_id);


--
-- Name: wagtailcore_site_0897acf4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailcore_site_0897acf4 ON wagtailcore_site USING btree (hostname);


--
-- Name: wagtailcore_site_8372b497; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailcore_site_8372b497 ON wagtailcore_site USING btree (root_page_id);


--
-- Name: wagtailcore_site_hostname_96b20b46_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailcore_site_hostname_96b20b46_like ON wagtailcore_site USING btree (hostname varchar_pattern_ops);


--
-- Name: wagtaildocs_document_0a1a4dd8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtaildocs_document_0a1a4dd8 ON wagtaildocs_document USING btree (collection_id);


--
-- Name: wagtaildocs_document_ef01e2b6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtaildocs_document_ef01e2b6 ON wagtaildocs_document USING btree (uploaded_by_user_id);


--
-- Name: wagtailforms_formsubmission_1a63c800; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailforms_formsubmission_1a63c800 ON wagtailforms_formsubmission USING btree (page_id);


--
-- Name: wagtailimages_image_0a1a4dd8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailimages_image_0a1a4dd8 ON wagtailimages_image USING btree (collection_id);


--
-- Name: wagtailimages_image_created_at_86fa6cd4_uniq; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailimages_image_created_at_86fa6cd4_uniq ON wagtailimages_image USING btree (created_at);


--
-- Name: wagtailimages_image_ef01e2b6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailimages_image_ef01e2b6 ON wagtailimages_image USING btree (uploaded_by_user_id);


--
-- Name: wagtailimages_rendition_58c64917; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailimages_rendition_58c64917 ON wagtailimages_rendition USING btree (filter_spec);


--
-- Name: wagtailimages_rendition_f33175e6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailimages_rendition_f33175e6 ON wagtailimages_rendition USING btree (image_id);


--
-- Name: wagtailimages_rendition_filter_spec_1cba3201_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailimages_rendition_filter_spec_1cba3201_like ON wagtailimages_rendition USING btree (filter_spec varchar_pattern_ops);


--
-- Name: wagtailredirects_redirect_2fd79f37; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailredirects_redirect_2fd79f37 ON wagtailredirects_redirect USING btree (redirect_page_id);


--
-- Name: wagtailredirects_redirect_9365d6e7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailredirects_redirect_9365d6e7 ON wagtailredirects_redirect USING btree (site_id);


--
-- Name: wagtailredirects_redirect_old_path_bb35247b_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailredirects_redirect_old_path_bb35247b_like ON wagtailredirects_redirect USING btree (old_path varchar_pattern_ops);


--
-- Name: wagtailsearch_editorspick_0bbeda9c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailsearch_editorspick_0bbeda9c ON wagtailsearchpromotions_searchpromotion USING btree (query_id);


--
-- Name: wagtailsearch_editorspick_1a63c800; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailsearch_editorspick_1a63c800 ON wagtailsearchpromotions_searchpromotion USING btree (page_id);


--
-- Name: wagtailsearch_query_query_string_e785ea07_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailsearch_query_query_string_e785ea07_like ON wagtailsearch_query USING btree (query_string varchar_pattern_ops);


--
-- Name: wagtailsearch_querydailyhits_0bbeda9c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailsearch_querydailyhits_0bbeda9c ON wagtailsearch_querydailyhits USING btree (query_id);


--
-- Name: documents_gallery_documentspagetag D17c8edd4821aee444fb5a22b2e0a831; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY documents_gallery_documentspagetag
    ADD CONSTRAINT "D17c8edd4821aee444fb5a22b2e0a831" FOREIGN KEY (content_object_id) REFERENCES documents_gallery_documentspage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_per_permission_id_1fbb5f2c_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_per_permission_id_1fbb5f2c_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_blogpagetag blog_bl_content_object_id_0dc644d2_fk_blog_blogpage_page_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY blog_blogpagetag
    ADD CONSTRAINT blog_bl_content_object_id_0dc644d2_fk_blog_blogpage_page_ptr_id FOREIGN KEY (content_object_id) REFERENCES blog_blogpage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_blogindexpagerelatedlink blog_blogi_link_document_id_84c85fbf_fk_wagtaildocs_document_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY blog_blogindexpagerelatedlink
    ADD CONSTRAINT blog_blogi_link_document_id_84c85fbf_fk_wagtaildocs_document_id FOREIGN KEY (link_document_id) REFERENCES wagtaildocs_document(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_blogindexpagerelatedlink blog_blogind_page_id_905f99b7_fk_blog_blogindexpage_page_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY blog_blogindexpagerelatedlink
    ADD CONSTRAINT blog_blogind_page_id_905f99b7_fk_blog_blogindexpage_page_ptr_id FOREIGN KEY (page_id) REFERENCES blog_blogindexpage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_blogindexpage blog_blogindexpage_feed_image_id_5cb947e1_fk_wagtailim; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY blog_blogindexpage
    ADD CONSTRAINT blog_blogindexpage_feed_image_id_5cb947e1_fk_wagtailim FOREIGN KEY (feed_image_id) REFERENCES wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_blogindexpagerelatedlink blog_blogindexpage_link_page_id_fdd456c7_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY blog_blogindexpagerelatedlink
    ADD CONSTRAINT blog_blogindexpage_link_page_id_fdd456c7_fk_wagtailcore_page_id FOREIGN KEY (link_page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_blogindexpage blog_blogindexpage_page_ptr_id_d87c3ac2_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY blog_blogindexpage
    ADD CONSTRAINT blog_blogindexpage_page_ptr_id_d87c3ac2_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_blogpagerelatedlink blog_blogp_link_document_id_358015f9_fk_wagtaildocs_document_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY blog_blogpagerelatedlink
    ADD CONSTRAINT blog_blogp_link_document_id_358015f9_fk_wagtaildocs_document_id FOREIGN KEY (link_document_id) REFERENCES wagtaildocs_document(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_blogpagecarouselitem blog_blogp_link_document_id_944c5996_fk_wagtaildocs_document_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY blog_blogpagecarouselitem
    ADD CONSTRAINT blog_blogp_link_document_id_944c5996_fk_wagtaildocs_document_id FOREIGN KEY (link_document_id) REFERENCES wagtaildocs_document(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_blogpage blog_blogpage_feed_image_id_5f46dd6e_fk_wagtailimages_image_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY blog_blogpage
    ADD CONSTRAINT blog_blogpage_feed_image_id_5f46dd6e_fk_wagtailimages_image_id FOREIGN KEY (feed_image_id) REFERENCES wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_blogpage blog_blogpage_page_ptr_id_1d78e2b7_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY blog_blogpage
    ADD CONSTRAINT blog_blogpage_page_ptr_id_1d78e2b7_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_blogpagecarouselitem blog_blogpagecaro_page_id_41128629_fk_blog_blogpage_page_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY blog_blogpagecarouselitem
    ADD CONSTRAINT blog_blogpagecaro_page_id_41128629_fk_blog_blogpage_page_ptr_id FOREIGN KEY (page_id) REFERENCES blog_blogpage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_blogpagecarouselitem blog_blogpagecarou_link_page_id_86ebc051_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY blog_blogpagecarouselitem
    ADD CONSTRAINT blog_blogpagecarou_link_page_id_86ebc051_fk_wagtailcore_page_id FOREIGN KEY (link_page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_blogpagecarouselitem blog_blogpagecarous_image_id_d51a8744_fk_wagtailimages_image_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY blog_blogpagecarouselitem
    ADD CONSTRAINT blog_blogpagecarous_image_id_d51a8744_fk_wagtailimages_image_id FOREIGN KEY (image_id) REFERENCES wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_blogpagerelatedlink blog_blogpagerela_page_id_31c20323_fk_blog_blogpage_page_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY blog_blogpagerelatedlink
    ADD CONSTRAINT blog_blogpagerela_page_id_31c20323_fk_blog_blogpage_page_ptr_id FOREIGN KEY (page_id) REFERENCES blog_blogpage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_blogpagerelatedlink blog_blogpagerelat_link_page_id_1edfe541_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY blog_blogpagerelatedlink
    ADD CONSTRAINT blog_blogpagerelat_link_page_id_1edfe541_fk_wagtailcore_page_id FOREIGN KEY (link_page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_blogpagetag blog_blogpagetag_tag_id_81dc0e5f_fk_taggit_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY blog_blogpagetag
    ADD CONSTRAINT blog_blogpagetag_tag_id_81dc0e5f_fk_taggit_tag_id FOREIGN KEY (tag_id) REFERENCES taggit_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: contact_contactformfield contact_con_page_id_95a7af80_fk_contact_contactpage_page_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contact_contactformfield
    ADD CONSTRAINT contact_con_page_id_95a7af80_fk_contact_contactpage_page_ptr_id FOREIGN KEY (page_id) REFERENCES contact_contactpage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: contact_contactpage contact_contactpage_feed_image_id_1f79cfe3_fk_wagtailim; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contact_contactpage
    ADD CONSTRAINT contact_contactpage_feed_image_id_1f79cfe3_fk_wagtailim FOREIGN KEY (feed_image_id) REFERENCES wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: contact_contactpage contact_contactpage_page_ptr_id_143c93c1_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contact_contactpage
    ADD CONSTRAINT contact_contactpage_page_ptr_id_143c93c1_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: contact_formfield contact_formfi_page_id_3ee48e6d_fk_contact_formpage_page_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contact_formfield
    ADD CONSTRAINT contact_formfi_page_id_3ee48e6d_fk_contact_formpage_page_ptr_id FOREIGN KEY (page_id) REFERENCES contact_formpage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: contact_formpage contact_formpage_feed_image_id_0303d2c9_fk_wagtailim; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contact_formpage
    ADD CONSTRAINT contact_formpage_feed_image_id_0303d2c9_fk_wagtailim FOREIGN KEY (feed_image_id) REFERENCES wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: contact_formpage contact_formpage_page_ptr_id_93c16e67_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contact_formpage
    ADD CONSTRAINT contact_formpage_page_ptr_id_93c16e67_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_productpagetag content_object_id_1985a884_fk_products_productpage_page_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY products_productpagetag
    ADD CONSTRAINT content_object_id_1985a884_fk_products_productpage_page_ptr_id FOREIGN KEY (content_object_id) REFERENCES products_productpage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_content_type_id_c4bce8eb_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_content_type_id_c4bce8eb_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: documents_gallery_documentspage documents_gall_feed_image_id_72f32dc7_fk_wagtailimages_image_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY documents_gallery_documentspage
    ADD CONSTRAINT documents_gall_feed_image_id_72f32dc7_fk_wagtailimages_image_id FOREIGN KEY (feed_image_id) REFERENCES wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: documents_gallery_documentsindexpage documents_gall_feed_image_id_732ac53b_fk_wagtailimages_image_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY documents_gallery_documentsindexpage
    ADD CONSTRAINT documents_gall_feed_image_id_732ac53b_fk_wagtailimages_image_id FOREIGN KEY (feed_image_id) REFERENCES wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: documents_gallery_documentspage documents_gallery_d_page_ptr_id_ef81894a_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY documents_gallery_documentspage
    ADD CONSTRAINT documents_gallery_d_page_ptr_id_ef81894a_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: documents_gallery_documentsindexpage documents_gallery_d_page_ptr_id_f7fa951f_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY documents_gallery_documentsindexpage
    ADD CONSTRAINT documents_gallery_d_page_ptr_id_f7fa951f_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: documents_gallery_documentspagetag documents_gallery_documentspag_tag_id_50625f82_fk_taggit_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY documents_gallery_documentspagetag
    ADD CONSTRAINT documents_gallery_documentspag_tag_id_50625f82_fk_taggit_tag_id FOREIGN KEY (tag_id) REFERENCES taggit_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: events_eventpagetag even_content_object_id_a9eee66f_fk_events_eventpage_page_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY events_eventpagetag
    ADD CONSTRAINT even_content_object_id_a9eee66f_fk_events_eventpage_page_ptr_id FOREIGN KEY (content_object_id) REFERENCES events_eventpage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: events_eventindexpagerelatedlink events_ev_page_id_7ac7d364_fk_events_eventindexpage_page_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY events_eventindexpagerelatedlink
    ADD CONSTRAINT events_ev_page_id_7ac7d364_fk_events_eventindexpage_page_ptr_id FOREIGN KEY (page_id) REFERENCES events_eventindexpage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: events_eventpagespeaker events_eve_link_document_id_0252ea0f_fk_wagtaildocs_document_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY events_eventpagespeaker
    ADD CONSTRAINT events_eve_link_document_id_0252ea0f_fk_wagtaildocs_document_id FOREIGN KEY (link_document_id) REFERENCES wagtaildocs_document(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: events_eventpagecarouselitem events_eve_link_document_id_85c089ab_fk_wagtaildocs_document_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY events_eventpagecarouselitem
    ADD CONSTRAINT events_eve_link_document_id_85c089ab_fk_wagtaildocs_document_id FOREIGN KEY (link_document_id) REFERENCES wagtaildocs_document(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: events_eventpagerelatedlink events_eve_link_document_id_bc602f32_fk_wagtaildocs_document_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY events_eventpagerelatedlink
    ADD CONSTRAINT events_eve_link_document_id_bc602f32_fk_wagtaildocs_document_id FOREIGN KEY (link_document_id) REFERENCES wagtaildocs_document(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: events_eventindexpagerelatedlink events_eve_link_document_id_f50895d4_fk_wagtaildocs_document_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY events_eventindexpagerelatedlink
    ADD CONSTRAINT events_eve_link_document_id_f50895d4_fk_wagtaildocs_document_id FOREIGN KEY (link_document_id) REFERENCES wagtaildocs_document(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: events_eventindexpagerelatedlink events_eventindexp_link_page_id_4c88907b_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY events_eventindexpagerelatedlink
    ADD CONSTRAINT events_eventindexp_link_page_id_4c88907b_fk_wagtailcore_page_id FOREIGN KEY (link_page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: events_eventindexpage events_eventindexpa_page_ptr_id_d4ed8796_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY events_eventindexpage
    ADD CONSTRAINT events_eventindexpa_page_ptr_id_d4ed8796_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: events_eventindexpage events_eventindexpag_feed_image_id_d6958e2f_fk_wagtailim; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY events_eventindexpage
    ADD CONSTRAINT events_eventindexpag_feed_image_id_d6958e2f_fk_wagtailim FOREIGN KEY (feed_image_id) REFERENCES wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: events_eventpage events_eventpa_feed_image_id_25a625d0_fk_wagtailimages_image_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY events_eventpage
    ADD CONSTRAINT events_eventpa_feed_image_id_25a625d0_fk_wagtailimages_image_id FOREIGN KEY (feed_image_id) REFERENCES wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: events_eventpagespeaker events_eventpa_page_id_10883f65_fk_events_eventpage_page_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY events_eventpagespeaker
    ADD CONSTRAINT events_eventpa_page_id_10883f65_fk_events_eventpage_page_ptr_id FOREIGN KEY (page_id) REFERENCES events_eventpage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: events_eventpagerelatedlink events_eventpa_page_id_2da96f87_fk_events_eventpage_page_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY events_eventpagerelatedlink
    ADD CONSTRAINT events_eventpa_page_id_2da96f87_fk_events_eventpage_page_ptr_id FOREIGN KEY (page_id) REFERENCES events_eventpage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: events_eventpagecarouselitem events_eventpa_page_id_eec52587_fk_events_eventpage_page_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY events_eventpagecarouselitem
    ADD CONSTRAINT events_eventpa_page_id_eec52587_fk_events_eventpage_page_ptr_id FOREIGN KEY (page_id) REFERENCES events_eventpage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: events_eventpage events_eventpage_page_ptr_id_c6701067_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY events_eventpage
    ADD CONSTRAINT events_eventpage_page_ptr_id_c6701067_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: events_eventpagecarouselitem events_eventpageca_link_page_id_388fd2d0_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY events_eventpagecarouselitem
    ADD CONSTRAINT events_eventpageca_link_page_id_388fd2d0_fk_wagtailcore_page_id FOREIGN KEY (link_page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: events_eventpagecarouselitem events_eventpagecar_image_id_fb4b4dcd_fk_wagtailimages_image_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY events_eventpagecarouselitem
    ADD CONSTRAINT events_eventpagecar_image_id_fb4b4dcd_fk_wagtailimages_image_id FOREIGN KEY (image_id) REFERENCES wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: events_eventpagerelatedlink events_eventpagere_link_page_id_378ea87f_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY events_eventpagerelatedlink
    ADD CONSTRAINT events_eventpagere_link_page_id_378ea87f_fk_wagtailcore_page_id FOREIGN KEY (link_page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: events_eventpagespeaker events_eventpagesp_link_page_id_f4549a64_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY events_eventpagespeaker
    ADD CONSTRAINT events_eventpagesp_link_page_id_f4549a64_fk_wagtailcore_page_id FOREIGN KEY (link_page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: events_eventpagespeaker events_eventpagespe_image_id_f48678eb_fk_wagtailimages_image_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY events_eventpagespeaker
    ADD CONSTRAINT events_eventpagespe_image_id_f48678eb_fk_wagtailimages_image_id FOREIGN KEY (image_id) REFERENCES wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: events_eventpagetag events_eventpagetag_tag_id_b811cfc5_fk_taggit_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY events_eventpagetag
    ADD CONSTRAINT events_eventpagetag_tag_id_b811cfc5_fk_taggit_tag_id FOREIGN KEY (tag_id) REFERENCES taggit_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: photo_gallery_gallerypagetag f30176145dc37361fd7bcfd229367ca4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY photo_gallery_gallerypagetag
    ADD CONSTRAINT f30176145dc37361fd7bcfd229367ca4 FOREIGN KEY (content_object_id) REFERENCES photo_gallery_gallerypage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pages_advert pages_adve_link_document_id_d804b3dc_fk_wagtaildocs_document_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pages_advert
    ADD CONSTRAINT pages_adve_link_document_id_d804b3dc_fk_wagtaildocs_document_id FOREIGN KEY (link_document_id) REFERENCES wagtaildocs_document(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pages_advert pages_advert_image_id_c3df93a1_fk_wagtailimages_image_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pages_advert
    ADD CONSTRAINT pages_advert_image_id_c3df93a1_fk_wagtailimages_image_id FOREIGN KEY (image_id) REFERENCES wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pages_advert pages_advert_link_page_id_ae00fe23_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pages_advert
    ADD CONSTRAINT pages_advert_link_page_id_ae00fe23_fk_wagtailcore_page_id FOREIGN KEY (link_page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pages_advert pages_advert_page_id_21245cc0_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pages_advert
    ADD CONSTRAINT pages_advert_page_id_21245cc0_fk_wagtailcore_page_id FOREIGN KEY (page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pages_contentblock pages_cont_link_document_id_0b825445_fk_wagtaildocs_document_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pages_contentblock
    ADD CONSTRAINT pages_cont_link_document_id_0b825445_fk_wagtaildocs_document_id FOREIGN KEY (link_document_id) REFERENCES wagtaildocs_document(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pages_contentblock pages_contentblock_link_page_id_84f7b516_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pages_contentblock
    ADD CONSTRAINT pages_contentblock_link_page_id_84f7b516_fk_wagtailcore_page_id FOREIGN KEY (link_page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pages_contentblock pages_contentblock_page_id_d29244b9_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pages_contentblock
    ADD CONSTRAINT pages_contentblock_page_id_d29244b9_fk_wagtailcore_page_id FOREIGN KEY (page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pages_faqspage pages_faqspage_page_ptr_id_15a8d513_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pages_faqspage
    ADD CONSTRAINT pages_faqspage_page_ptr_id_15a8d513_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pages_homepagerelatedlink pages_home_link_document_id_1364f817_fk_wagtaildocs_document_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pages_homepagerelatedlink
    ADD CONSTRAINT pages_home_link_document_id_1364f817_fk_wagtaildocs_document_id FOREIGN KEY (link_document_id) REFERENCES wagtaildocs_document(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pages_homepagecarouselitem pages_home_link_document_id_902c9e7d_fk_wagtaildocs_document_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pages_homepagecarouselitem
    ADD CONSTRAINT pages_home_link_document_id_902c9e7d_fk_wagtaildocs_document_id FOREIGN KEY (link_document_id) REFERENCES wagtaildocs_document(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pages_homepagecontentitem pages_home_link_document_id_a2552580_fk_wagtaildocs_document_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pages_homepagecontentitem
    ADD CONSTRAINT pages_home_link_document_id_a2552580_fk_wagtaildocs_document_id FOREIGN KEY (link_document_id) REFERENCES wagtaildocs_document(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pages_homepage pages_homepage_feed_image_id_4ebba3a8_fk_wagtailimages_image_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pages_homepage
    ADD CONSTRAINT pages_homepage_feed_image_id_4ebba3a8_fk_wagtailimages_image_id FOREIGN KEY (feed_image_id) REFERENCES wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pages_homepage pages_homepage_page_ptr_id_5b805d74_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pages_homepage
    ADD CONSTRAINT pages_homepage_page_ptr_id_5b805d74_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pages_homepagecarouselitem pages_homepageca_page_id_915b43c4_fk_pages_homepage_page_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pages_homepagecarouselitem
    ADD CONSTRAINT pages_homepageca_page_id_915b43c4_fk_pages_homepage_page_ptr_id FOREIGN KEY (page_id) REFERENCES pages_homepage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pages_homepagecarouselitem pages_homepagecaro_link_page_id_799b1594_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pages_homepagecarouselitem
    ADD CONSTRAINT pages_homepagecaro_link_page_id_799b1594_fk_wagtailcore_page_id FOREIGN KEY (link_page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pages_homepagecarouselitem pages_homepagecarou_image_id_45b3424e_fk_wagtailimages_image_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pages_homepagecarouselitem
    ADD CONSTRAINT pages_homepagecarou_image_id_45b3424e_fk_wagtailimages_image_id FOREIGN KEY (image_id) REFERENCES wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pages_homepagecontentitem pages_homepageco_page_id_8b646417_fk_pages_homepage_page_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pages_homepagecontentitem
    ADD CONSTRAINT pages_homepageco_page_id_8b646417_fk_pages_homepage_page_ptr_id FOREIGN KEY (page_id) REFERENCES pages_homepage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pages_homepagecontentitem pages_homepagecont_link_page_id_9aa371ca_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pages_homepagecontentitem
    ADD CONSTRAINT pages_homepagecont_link_page_id_9aa371ca_fk_wagtailcore_page_id FOREIGN KEY (link_page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pages_homepagecontentitem pages_homepageconte_image_id_85ec39f6_fk_wagtailimages_image_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pages_homepagecontentitem
    ADD CONSTRAINT pages_homepageconte_image_id_85ec39f6_fk_wagtailimages_image_id FOREIGN KEY (image_id) REFERENCES wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pages_homepagerelatedlink pages_homepagere_page_id_b0a3517a_fk_pages_homepage_page_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pages_homepagerelatedlink
    ADD CONSTRAINT pages_homepagere_page_id_b0a3517a_fk_pages_homepage_page_ptr_id FOREIGN KEY (page_id) REFERENCES pages_homepage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pages_homepagerelatedlink pages_homepagerela_link_page_id_87ab8ff4_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pages_homepagerelatedlink
    ADD CONSTRAINT pages_homepagerela_link_page_id_87ab8ff4_fk_wagtailcore_page_id FOREIGN KEY (link_page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pages_standardindexpagerelatedlink pages_s_page_id_d0df6fde_fk_pages_standardindexpage_page_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pages_standardindexpagerelatedlink
    ADD CONSTRAINT pages_s_page_id_d0df6fde_fk_pages_standardindexpage_page_ptr_id FOREIGN KEY (page_id) REFERENCES pages_standardindexpage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pages_sitebranding pages_sitebranding_logo_id_2841159b_fk_wagtailimages_image_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pages_sitebranding
    ADD CONSTRAINT pages_sitebranding_logo_id_2841159b_fk_wagtailimages_image_id FOREIGN KEY (logo_id) REFERENCES wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pages_sitebranding pages_sitebranding_site_id_04cc1128_fk_wagtailcore_site_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pages_sitebranding
    ADD CONSTRAINT pages_sitebranding_site_id_04cc1128_fk_wagtailcore_site_id FOREIGN KEY (site_id) REFERENCES wagtailcore_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pages_socialmediasettings pages_socialmediasettin_site_id_48a3ffb9_fk_wagtailcore_site_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pages_socialmediasettings
    ADD CONSTRAINT pages_socialmediasettin_site_id_48a3ffb9_fk_wagtailcore_site_id FOREIGN KEY (site_id) REFERENCES wagtailcore_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pages_standardpagecarouselitem pages_stan_link_document_id_1e821170_fk_wagtaildocs_document_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pages_standardpagecarouselitem
    ADD CONSTRAINT pages_stan_link_document_id_1e821170_fk_wagtaildocs_document_id FOREIGN KEY (link_document_id) REFERENCES wagtaildocs_document(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pages_standardindexpagerelatedlink pages_stan_link_document_id_ab0a20f8_fk_wagtaildocs_document_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pages_standardindexpagerelatedlink
    ADD CONSTRAINT pages_stan_link_document_id_ab0a20f8_fk_wagtaildocs_document_id FOREIGN KEY (link_document_id) REFERENCES wagtaildocs_document(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pages_standardpagerelatedlink pages_stan_link_document_id_c02096ae_fk_wagtaildocs_document_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pages_standardpagerelatedlink
    ADD CONSTRAINT pages_stan_link_document_id_c02096ae_fk_wagtaildocs_document_id FOREIGN KEY (link_document_id) REFERENCES wagtaildocs_document(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pages_standardpagerelatedlink pages_standa_page_id_1c982abb_fk_pages_standardpage_page_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pages_standardpagerelatedlink
    ADD CONSTRAINT pages_standa_page_id_1c982abb_fk_pages_standardpage_page_ptr_id FOREIGN KEY (page_id) REFERENCES pages_standardpage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pages_standardpagecarouselitem pages_standa_page_id_ab87f566_fk_pages_standardpage_page_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pages_standardpagecarouselitem
    ADD CONSTRAINT pages_standa_page_id_ab87f566_fk_pages_standardpage_page_ptr_id FOREIGN KEY (page_id) REFERENCES pages_standardpage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pages_standardpage pages_standard_feed_image_id_41c2eccd_fk_wagtailimages_image_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pages_standardpage
    ADD CONSTRAINT pages_standard_feed_image_id_41c2eccd_fk_wagtailimages_image_id FOREIGN KEY (feed_image_id) REFERENCES wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pages_standardindexpage pages_standard_feed_image_id_a65c3494_fk_wagtailimages_image_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pages_standardindexpage
    ADD CONSTRAINT pages_standard_feed_image_id_a65c3494_fk_wagtailimages_image_id FOREIGN KEY (feed_image_id) REFERENCES wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pages_standardindexpagerelatedlink pages_standardinde_link_page_id_8ad61c91_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pages_standardindexpagerelatedlink
    ADD CONSTRAINT pages_standardinde_link_page_id_8ad61c91_fk_wagtailcore_page_id FOREIGN KEY (link_page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pages_standardindexpage pages_standardindex_page_ptr_id_70a0d3dc_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pages_standardindexpage
    ADD CONSTRAINT pages_standardindex_page_ptr_id_70a0d3dc_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pages_standardpagecarouselitem pages_standardpage_link_page_id_28e4472a_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pages_standardpagecarouselitem
    ADD CONSTRAINT pages_standardpage_link_page_id_28e4472a_fk_wagtailcore_page_id FOREIGN KEY (link_page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pages_standardpagerelatedlink pages_standardpage_link_page_id_29341951_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pages_standardpagerelatedlink
    ADD CONSTRAINT pages_standardpage_link_page_id_29341951_fk_wagtailcore_page_id FOREIGN KEY (link_page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pages_standardpage pages_standardpage_page_ptr_id_8d8149d9_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pages_standardpage
    ADD CONSTRAINT pages_standardpage_page_ptr_id_8d8149d9_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pages_standardpagecarouselitem pages_standardpagec_image_id_8d81528b_fk_wagtailimages_image_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pages_standardpagecarouselitem
    ADD CONSTRAINT pages_standardpagec_image_id_8d81528b_fk_wagtailimages_image_id FOREIGN KEY (image_id) REFERENCES wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pages_testimonial pages_test_link_document_id_3c7b9377_fk_wagtaildocs_document_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pages_testimonial
    ADD CONSTRAINT pages_test_link_document_id_3c7b9377_fk_wagtaildocs_document_id FOREIGN KEY (link_document_id) REFERENCES wagtaildocs_document(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pages_testimonial pages_testimonial_link_page_id_70b58081_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pages_testimonial
    ADD CONSTRAINT pages_testimonial_link_page_id_70b58081_fk_wagtailcore_page_id FOREIGN KEY (link_page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pages_testimonial pages_testimonial_page_id_aedaf53f_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pages_testimonial
    ADD CONSTRAINT pages_testimonial_page_id_aedaf53f_fk_wagtailcore_page_id FOREIGN KEY (page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pages_testimonial pages_testimonial_photo_id_29360729_fk_wagtailimages_image_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pages_testimonial
    ADD CONSTRAINT pages_testimonial_photo_id_29360729_fk_wagtailimages_image_id FOREIGN KEY (photo_id) REFERENCES wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pages_videogallerypage pages_videogallerypa_feed_image_id_250d9360_fk_wagtailim; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pages_videogallerypage
    ADD CONSTRAINT pages_videogallerypa_feed_image_id_250d9360_fk_wagtailim FOREIGN KEY (feed_image_id) REFERENCES wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pages_videogallerypage pages_videogallerypa_page_ptr_id_e99012e4_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pages_videogallerypage
    ADD CONSTRAINT pages_videogallerypa_page_ptr_id_e99012e4_fk_wagtailco FOREIGN KEY (page_ptr_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pages_videogallerypagecarouselitem pages_videopagecarou_image_id_2817929a_fk_wagtailim; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pages_videogallerypagecarouselitem
    ADD CONSTRAINT pages_videopagecarou_image_id_2817929a_fk_wagtailim FOREIGN KEY (image_id) REFERENCES wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pages_videogallerypagecarouselitem pages_videopagecarou_link_document_id_b7d2ab0f_fk_wagtaildo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pages_videogallerypagecarouselitem
    ADD CONSTRAINT pages_videopagecarou_link_document_id_b7d2ab0f_fk_wagtaildo FOREIGN KEY (link_document_id) REFERENCES wagtaildocs_document(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pages_videogallerypagecarouselitem pages_videopagecarou_link_page_id_16ed2e64_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pages_videogallerypagecarouselitem
    ADD CONSTRAINT pages_videopagecarou_link_page_id_16ed2e64_fk_wagtailco FOREIGN KEY (link_page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: people_personpagetag peo_content_object_id_219202ed_fk_people_personpage_page_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY people_personpagetag
    ADD CONSTRAINT peo_content_object_id_219202ed_fk_people_personpage_page_ptr_id FOREIGN KEY (content_object_id) REFERENCES people_personpage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: people_personindexpagerelatedlink people_p_page_id_9074b56c_fk_people_personindexpage_page_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY people_personindexpagerelatedlink
    ADD CONSTRAINT people_p_page_id_9074b56c_fk_people_personindexpage_page_ptr_id FOREIGN KEY (page_id) REFERENCES people_personindexpage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: people_personindexpagerelatedlink people_per_link_document_id_6fb113f2_fk_wagtaildocs_document_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY people_personindexpagerelatedlink
    ADD CONSTRAINT people_per_link_document_id_6fb113f2_fk_wagtaildocs_document_id FOREIGN KEY (link_document_id) REFERENCES wagtaildocs_document(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: people_personpagerelatedlink people_per_link_document_id_d330a140_fk_wagtaildocs_document_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY people_personpagerelatedlink
    ADD CONSTRAINT people_per_link_document_id_d330a140_fk_wagtaildocs_document_id FOREIGN KEY (link_document_id) REFERENCES wagtaildocs_document(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: people_personpagerelatedlink people_person_page_id_37654932_fk_people_personpage_page_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY people_personpagerelatedlink
    ADD CONSTRAINT people_person_page_id_37654932_fk_people_personpage_page_ptr_id FOREIGN KEY (page_id) REFERENCES people_personpage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: people_personindexpagerelatedlink people_personindex_link_page_id_9a45cdb2_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY people_personindexpagerelatedlink
    ADD CONSTRAINT people_personindex_link_page_id_9a45cdb2_fk_wagtailcore_page_id FOREIGN KEY (link_page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: people_personindexpage people_personindexp_page_ptr_id_2aafa812_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY people_personindexpage
    ADD CONSTRAINT people_personindexp_page_ptr_id_2aafa812_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: people_personindexpage people_personindexpa_feed_image_id_ea7ff652_fk_wagtailim; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY people_personindexpage
    ADD CONSTRAINT people_personindexpa_feed_image_id_ea7ff652_fk_wagtailim FOREIGN KEY (feed_image_id) REFERENCES wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: people_personpage people_personp_feed_image_id_c8aaeda0_fk_wagtailimages_image_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY people_personpage
    ADD CONSTRAINT people_personp_feed_image_id_c8aaeda0_fk_wagtailimages_image_id FOREIGN KEY (feed_image_id) REFERENCES wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: people_personpage people_personpage_image_id_f13def2e_fk_wagtailimages_image_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY people_personpage
    ADD CONSTRAINT people_personpage_image_id_f13def2e_fk_wagtailimages_image_id FOREIGN KEY (image_id) REFERENCES wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: people_personpage people_personpage_page_ptr_id_0f038b98_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY people_personpage
    ADD CONSTRAINT people_personpage_page_ptr_id_0f038b98_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: people_personpage people_personpage_role_id_534a1c51_fk_people_personrole_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY people_personpage
    ADD CONSTRAINT people_personpage_role_id_534a1c51_fk_people_personrole_id FOREIGN KEY (role_id) REFERENCES people_personrole(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: people_personpagerelatedlink people_personpager_link_page_id_1f38718a_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY people_personpagerelatedlink
    ADD CONSTRAINT people_personpager_link_page_id_1f38718a_fk_wagtailcore_page_id FOREIGN KEY (link_page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: people_personpagetag people_personpagetag_tag_id_e0d52d9d_fk_taggit_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY people_personpagetag
    ADD CONSTRAINT people_personpagetag_tag_id_e0d52d9d_fk_taggit_tag_id FOREIGN KEY (tag_id) REFERENCES taggit_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: photo_gallery_gallerypage photo_gallery__feed_image_id_2efaf002_fk_wagtailimages_image_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY photo_gallery_gallerypage
    ADD CONSTRAINT photo_gallery__feed_image_id_2efaf002_fk_wagtailimages_image_id FOREIGN KEY (feed_image_id) REFERENCES wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: photo_gallery_galleryindexpage photo_gallery__feed_image_id_8fa24cf4_fk_wagtailimages_image_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY photo_gallery_galleryindexpage
    ADD CONSTRAINT photo_gallery__feed_image_id_8fa24cf4_fk_wagtailimages_image_id FOREIGN KEY (feed_image_id) REFERENCES wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: photo_gallery_gallerypage photo_gallery_galle_page_ptr_id_11be90ff_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY photo_gallery_gallerypage
    ADD CONSTRAINT photo_gallery_galle_page_ptr_id_11be90ff_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: photo_gallery_galleryindexpage photo_gallery_galle_page_ptr_id_44a4f590_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY photo_gallery_galleryindexpage
    ADD CONSTRAINT photo_gallery_galle_page_ptr_id_44a4f590_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: photo_gallery_gallerypagetag photo_gallery_gallerypagetag_tag_id_61ab4280_fk_taggit_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY photo_gallery_gallerypagetag
    ADD CONSTRAINT photo_gallery_gallerypagetag_tag_id_61ab4280_fk_taggit_tag_id FOREIGN KEY (tag_id) REFERENCES taggit_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: postgres_search_indexentry postgres_search_inde_content_type_id_d805086f_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postgres_search_indexentry
    ADD CONSTRAINT postgres_search_inde_content_type_id_d805086f_fk_django_co FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_productindexpagerelatedlink produ_page_id_320a0204_fk_products_productindexpage_page_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY products_productindexpagerelatedlink
    ADD CONSTRAINT produ_page_id_320a0204_fk_products_productindexpage_page_ptr_id FOREIGN KEY (page_id) REFERENCES products_productindexpage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_productindexpagerelatedlink products_p_link_document_id_7589e588_fk_wagtaildocs_document_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY products_productindexpagerelatedlink
    ADD CONSTRAINT products_p_link_document_id_7589e588_fk_wagtaildocs_document_id FOREIGN KEY (link_document_id) REFERENCES wagtaildocs_document(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_productpagerelatedlink products_p_link_document_id_d6cd7769_fk_wagtaildocs_document_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY products_productpagerelatedlink
    ADD CONSTRAINT products_p_link_document_id_d6cd7769_fk_wagtaildocs_document_id FOREIGN KEY (link_document_id) REFERENCES wagtaildocs_document(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_productpagerelatedlink products_p_page_id_855d9c33_fk_products_productpage_page_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY products_productpagerelatedlink
    ADD CONSTRAINT products_p_page_id_855d9c33_fk_products_productpage_page_ptr_id FOREIGN KEY (page_id) REFERENCES products_productpage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_productpage products_produ_feed_image_id_fc5dc22b_fk_wagtailimages_image_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY products_productpage
    ADD CONSTRAINT products_produ_feed_image_id_fc5dc22b_fk_wagtailimages_image_id FOREIGN KEY (feed_image_id) REFERENCES wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_productindexpagerelatedlink products_productin_link_page_id_cc9048a1_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY products_productindexpagerelatedlink
    ADD CONSTRAINT products_productin_link_page_id_cc9048a1_fk_wagtailcore_page_id FOREIGN KEY (link_page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_productindexpage products_productind_page_ptr_id_896e5596_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY products_productindexpage
    ADD CONSTRAINT products_productind_page_ptr_id_896e5596_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_productindexpage products_productinde_feed_image_id_f1b46ba8_fk_wagtailim; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY products_productindexpage
    ADD CONSTRAINT products_productinde_feed_image_id_f1b46ba8_fk_wagtailim FOREIGN KEY (feed_image_id) REFERENCES wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_productpagerelatedlink products_productpa_link_page_id_39628d87_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY products_productpagerelatedlink
    ADD CONSTRAINT products_productpa_link_page_id_39628d87_fk_wagtailcore_page_id FOREIGN KEY (link_page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_productpage products_productpag_image_id_b4d3829e_fk_wagtailimages_image_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY products_productpage
    ADD CONSTRAINT products_productpag_image_id_b4d3829e_fk_wagtailimages_image_id FOREIGN KEY (image_id) REFERENCES wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_productpage products_productpag_page_ptr_id_d4d9ff65_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY products_productpage
    ADD CONSTRAINT products_productpag_page_ptr_id_d4d9ff65_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_productpagetag products_productpagetag_tag_id_f0c81f66_fk_taggit_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY products_productpagetag
    ADD CONSTRAINT products_productpagetag_tag_id_f0c81f66_fk_taggit_tag_id FOREIGN KEY (tag_id) REFERENCES taggit_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: taggit_taggeditem taggit_tagge_content_type_id_9957a03c_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY taggit_taggeditem
    ADD CONSTRAINT taggit_tagge_content_type_id_9957a03c_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: taggit_taggeditem taggit_taggeditem_tag_id_f4f5b767_fk_taggit_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY taggit_taggeditem
    ADD CONSTRAINT taggit_taggeditem_tag_id_f4f5b767_fk_taggit_tag_id FOREIGN KEY (tag_id) REFERENCES taggit_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtail_feeds_rssfeedssettings wagtail_feeds_rssfeedss_site_id_86fa0b0d_fk_wagtailcore_site_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtail_feeds_rssfeedssettings
    ADD CONSTRAINT wagtail_feeds_rssfeedss_site_id_86fa0b0d_fk_wagtailcore_site_id FOREIGN KEY (site_id) REFERENCES wagtailcore_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_page wagtailcore__content_type_id_c28424df_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailcore_page
    ADD CONSTRAINT wagtailcore__content_type_id_c28424df_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_collectionviewrestriction wagtailcore_collecti_collection_id_761908ec_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailcore_collectionviewrestriction
    ADD CONSTRAINT wagtailcore_collecti_collection_id_761908ec_fk_wagtailco FOREIGN KEY (collection_id) REFERENCES wagtailcore_collection(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_collectionviewrestriction_groups wagtailcore_collecti_collectionviewrestri_47320efd_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailcore_collectionviewrestriction_groups
    ADD CONSTRAINT wagtailcore_collecti_collectionviewrestri_47320efd_fk_wagtailco FOREIGN KEY (collectionviewrestriction_id) REFERENCES wagtailcore_collectionviewrestriction(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_collectionviewrestriction_groups wagtailcore_collecti_group_id_1823f2a3_fk_auth_grou; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailcore_collectionviewrestriction_groups
    ADD CONSTRAINT wagtailcore_collecti_group_id_1823f2a3_fk_auth_grou FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_groupcollectionpermission wagtailcore_collection_id_5423575a_fk_wagtailcore_collection_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailcore_groupcollectionpermission
    ADD CONSTRAINT wagtailcore_collection_id_5423575a_fk_wagtailcore_collection_id FOREIGN KEY (collection_id) REFERENCES wagtailcore_collection(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_groupcollectionpermission wagtailcore_groupc_permission_id_1b626275_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailcore_groupcollectionpermission
    ADD CONSTRAINT wagtailcore_groupc_permission_id_1b626275_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_groupcollectionpermission wagtailcore_groupcollectionp_group_id_05d61460_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailcore_groupcollectionpermission
    ADD CONSTRAINT wagtailcore_groupcollectionp_group_id_05d61460_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_grouppagepermission wagtailcore_grouppagepe_page_id_710b114a_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailcore_grouppagepermission
    ADD CONSTRAINT wagtailcore_grouppagepe_page_id_710b114a_fk_wagtailcore_page_id FOREIGN KEY (page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_grouppagepermission wagtailcore_grouppagepermiss_group_id_fc07e671_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailcore_grouppagepermission
    ADD CONSTRAINT wagtailcore_grouppagepermiss_group_id_fc07e671_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_page wagtailcore_page_live_revision_id_930bd822_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailcore_page
    ADD CONSTRAINT wagtailcore_page_live_revision_id_930bd822_fk_wagtailco FOREIGN KEY (live_revision_id) REFERENCES wagtailcore_pagerevision(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_page wagtailcore_page_owner_id_fbf7c332_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailcore_page
    ADD CONSTRAINT wagtailcore_page_owner_id_fbf7c332_fk_auth_user_id FOREIGN KEY (owner_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_pagerevision wagtailcore_pagerevisio_page_id_d421cc1d_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailcore_pagerevision
    ADD CONSTRAINT wagtailcore_pagerevisio_page_id_d421cc1d_fk_wagtailcore_page_id FOREIGN KEY (page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_pagerevision wagtailcore_pagerevision_user_id_2409d2f4_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailcore_pagerevision
    ADD CONSTRAINT wagtailcore_pagerevision_user_id_2409d2f4_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_pageviewrestriction_groups wagtailcore_pageview_group_id_6460f223_fk_auth_grou; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailcore_pageviewrestriction_groups
    ADD CONSTRAINT wagtailcore_pageview_group_id_6460f223_fk_auth_grou FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_pageviewrestriction_groups wagtailcore_pageview_pageviewrestriction__f147a99a_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailcore_pageviewrestriction_groups
    ADD CONSTRAINT wagtailcore_pageview_pageviewrestriction__f147a99a_fk_wagtailco FOREIGN KEY (pageviewrestriction_id) REFERENCES wagtailcore_pageviewrestriction(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_pageviewrestriction wagtailcore_pageviewres_page_id_15a8bea6_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailcore_pageviewrestriction
    ADD CONSTRAINT wagtailcore_pageviewres_page_id_15a8bea6_fk_wagtailcore_page_id FOREIGN KEY (page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_site wagtailcore_site_root_page_id_e02fb95c_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailcore_site
    ADD CONSTRAINT wagtailcore_site_root_page_id_e02fb95c_fk_wagtailcore_page_id FOREIGN KEY (root_page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtaildocs_document wagtaildocs_collection_id_23881625_fk_wagtailcore_collection_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtaildocs_document
    ADD CONSTRAINT wagtaildocs_collection_id_23881625_fk_wagtailcore_collection_id FOREIGN KEY (collection_id) REFERENCES wagtailcore_collection(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtaildocs_document wagtaildocs_docume_uploaded_by_user_id_17258b41_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtaildocs_document
    ADD CONSTRAINT wagtaildocs_docume_uploaded_by_user_id_17258b41_fk_auth_user_id FOREIGN KEY (uploaded_by_user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailforms_formsubmission wagtailforms_formsubmis_page_id_e48e93e7_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailforms_formsubmission
    ADD CONSTRAINT wagtailforms_formsubmis_page_id_e48e93e7_fk_wagtailcore_page_id FOREIGN KEY (page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailimages_image wagtailimag_collection_id_c2f8af7e_fk_wagtailcore_collection_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailimages_image
    ADD CONSTRAINT wagtailimag_collection_id_c2f8af7e_fk_wagtailcore_collection_id FOREIGN KEY (collection_id) REFERENCES wagtailcore_collection(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailimages_image wagtailimages_imag_uploaded_by_user_id_5d73dc75_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailimages_image
    ADD CONSTRAINT wagtailimages_imag_uploaded_by_user_id_5d73dc75_fk_auth_user_id FOREIGN KEY (uploaded_by_user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailimages_rendition wagtailimages_rendi_image_id_3e1fd774_fk_wagtailimages_image_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailimages_rendition
    ADD CONSTRAINT wagtailimages_rendi_image_id_3e1fd774_fk_wagtailimages_image_id FOREIGN KEY (image_id) REFERENCES wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailredirects_redirect wagtailredirec_redirect_page_id_b5728a8f_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailredirects_redirect
    ADD CONSTRAINT wagtailredirec_redirect_page_id_b5728a8f_fk_wagtailcore_page_id FOREIGN KEY (redirect_page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailredirects_redirect wagtailredirects_redire_site_id_780a0e1e_fk_wagtailcore_site_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailredirects_redirect
    ADD CONSTRAINT wagtailredirects_redire_site_id_780a0e1e_fk_wagtailcore_site_id FOREIGN KEY (site_id) REFERENCES wagtailcore_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailsearchpromotions_searchpromotion wagtailsearch_edito_query_id_c6eee4a0_fk_wagtailsearch_query_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailsearchpromotions_searchpromotion
    ADD CONSTRAINT wagtailsearch_edito_query_id_c6eee4a0_fk_wagtailsearch_query_id FOREIGN KEY (query_id) REFERENCES wagtailsearch_query(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailsearch_querydailyhits wagtailsearch_query_query_id_2185994b_fk_wagtailsearch_query_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailsearch_querydailyhits
    ADD CONSTRAINT wagtailsearch_query_query_id_2185994b_fk_wagtailsearch_query_id FOREIGN KEY (query_id) REFERENCES wagtailsearch_query(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailsearchpromotions_searchpromotion wagtailsearchpromotions_page_id_71920f17_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailsearchpromotions_searchpromotion
    ADD CONSTRAINT wagtailsearchpromotions_page_id_71920f17_fk_wagtailcore_page_id FOREIGN KEY (page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailusers_userprofile wagtailusers_userprofile_user_id_59c92331_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailusers_userprofile
    ADD CONSTRAINT wagtailusers_userprofile_user_id_59c92331_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

