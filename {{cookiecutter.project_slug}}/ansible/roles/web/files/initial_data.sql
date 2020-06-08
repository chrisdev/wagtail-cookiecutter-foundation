--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.18
-- Dumped by pg_dump version 10.13

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
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: account_emailaddress; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.account_emailaddress (
    id integer NOT NULL,
    email character varying(254) NOT NULL,
    verified boolean NOT NULL,
    "primary" boolean NOT NULL,
    user_id integer NOT NULL
);


--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.account_emailaddress_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.account_emailaddress_id_seq OWNED BY public.account_emailaddress.id;


--
-- Name: account_emailconfirmation; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.account_emailconfirmation (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    sent timestamp with time zone,
    key character varying(64) NOT NULL,
    email_address_id integer NOT NULL
);


--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.account_emailconfirmation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.account_emailconfirmation_id_seq OWNED BY public.account_emailconfirmation.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: blog_blogindexpage; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.blog_blogindexpage (
    page_ptr_id integer NOT NULL,
    intro text NOT NULL,
    feed_image_id integer
);


--
-- Name: blog_blogindexpagerelatedlink; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.blog_blogindexpagerelatedlink (
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

CREATE SEQUENCE public.blog_blogindexpagerelatedlink_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: blog_blogindexpagerelatedlink_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.blog_blogindexpagerelatedlink_id_seq OWNED BY public.blog_blogindexpagerelatedlink.id;


--
-- Name: blog_blogpage; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.blog_blogpage (
    page_ptr_id integer NOT NULL,
    intro text NOT NULL,
    body text NOT NULL,
    date date NOT NULL,
    feed_image_id integer
);


--
-- Name: blog_blogpagecarouselitem; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.blog_blogpagecarouselitem (
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

CREATE SEQUENCE public.blog_blogpagecarouselitem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: blog_blogpagecarouselitem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.blog_blogpagecarouselitem_id_seq OWNED BY public.blog_blogpagecarouselitem.id;


--
-- Name: blog_blogpagerelatedlink; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.blog_blogpagerelatedlink (
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

CREATE SEQUENCE public.blog_blogpagerelatedlink_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: blog_blogpagerelatedlink_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.blog_blogpagerelatedlink_id_seq OWNED BY public.blog_blogpagerelatedlink.id;


--
-- Name: blog_blogpagetag; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.blog_blogpagetag (
    id integer NOT NULL,
    content_object_id integer NOT NULL,
    tag_id integer NOT NULL
);


--
-- Name: blog_blogpagetag_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.blog_blogpagetag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: blog_blogpagetag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.blog_blogpagetag_id_seq OWNED BY public.blog_blogpagetag.id;


--
-- Name: contact_contactformfield; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.contact_contactformfield (
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

CREATE SEQUENCE public.contact_contactformfield_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: contact_contactformfield_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.contact_contactformfield_id_seq OWNED BY public.contact_contactformfield.id;


--
-- Name: contact_contactpage; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.contact_contactpage (
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

CREATE TABLE public.contact_formfield (
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

CREATE SEQUENCE public.contact_formfield_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: contact_formfield_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.contact_formfield_id_seq OWNED BY public.contact_formfield.id;


--
-- Name: contact_formpage; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.contact_formpage (
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

CREATE TABLE public.django_admin_log (
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

CREATE SEQUENCE public.django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


--
-- Name: django_site; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.django_site_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.django_site_id_seq OWNED BY public.django_site.id;


--
-- Name: documents_gallery_documentsindexpage; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.documents_gallery_documentsindexpage (
    page_ptr_id integer NOT NULL,
    intro text NOT NULL,
    feed_image_id integer
);


--
-- Name: documents_gallery_documentspage; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.documents_gallery_documentspage (
    page_ptr_id integer NOT NULL,
    feed_image_id integer
);


--
-- Name: documents_gallery_documentspagetag; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.documents_gallery_documentspagetag (
    id integer NOT NULL,
    content_object_id integer NOT NULL,
    tag_id integer NOT NULL
);


--
-- Name: documents_gallery_documentspagetag_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.documents_gallery_documentspagetag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: documents_gallery_documentspagetag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.documents_gallery_documentspagetag_id_seq OWNED BY public.documents_gallery_documentspagetag.id;


--
-- Name: events_eventindexpage; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.events_eventindexpage (
    page_ptr_id integer NOT NULL,
    intro text NOT NULL,
    feed_image_id integer
);


--
-- Name: events_eventindexpagerelatedlink; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.events_eventindexpagerelatedlink (
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

CREATE SEQUENCE public.events_eventindexpagerelatedlink_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: events_eventindexpagerelatedlink_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.events_eventindexpagerelatedlink_id_seq OWNED BY public.events_eventindexpagerelatedlink.id;


--
-- Name: events_eventpage; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.events_eventpage (
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

CREATE TABLE public.events_eventpagecarouselitem (
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

CREATE SEQUENCE public.events_eventpagecarouselitem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: events_eventpagecarouselitem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.events_eventpagecarouselitem_id_seq OWNED BY public.events_eventpagecarouselitem.id;


--
-- Name: events_eventpagerelatedlink; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.events_eventpagerelatedlink (
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

CREATE SEQUENCE public.events_eventpagerelatedlink_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: events_eventpagerelatedlink_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.events_eventpagerelatedlink_id_seq OWNED BY public.events_eventpagerelatedlink.id;


--
-- Name: events_eventpagespeaker; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.events_eventpagespeaker (
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

CREATE SEQUENCE public.events_eventpagespeaker_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: events_eventpagespeaker_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.events_eventpagespeaker_id_seq OWNED BY public.events_eventpagespeaker.id;


--
-- Name: events_eventpagetag; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.events_eventpagetag (
    id integer NOT NULL,
    content_object_id integer NOT NULL,
    tag_id integer NOT NULL
);


--
-- Name: events_eventpagetag_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.events_eventpagetag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: events_eventpagetag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.events_eventpagetag_id_seq OWNED BY public.events_eventpagetag.id;


--
-- Name: gallery_galleryindex; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.gallery_galleryindex (
    page_ptr_id integer NOT NULL,
    intro text NOT NULL,
    images_per_page integer NOT NULL,
    order_images_by integer NOT NULL,
    collection_id integer,
    feed_image_id integer
);


--
-- Name: gallery_photogalleryindexpage; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.gallery_photogalleryindexpage (
    page_ptr_id integer NOT NULL,
    intro text NOT NULL,
    feed_image_id integer
);


--
-- Name: joyous_calendarpage; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.joyous_calendarpage (
    page_ptr_id integer NOT NULL,
    intro text NOT NULL,
    default_view character varying(15) NOT NULL,
    view_choices character varying(255) NOT NULL
);


--
-- Name: joyous_cancellationpage; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.joyous_cancellationpage (
    page_ptr_id integer NOT NULL,
    except_date date NOT NULL,
    cancellation_title character varying(255) NOT NULL,
    cancellation_details text NOT NULL,
    overrides_id integer
);


--
-- Name: joyous_eventcategory; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.joyous_eventcategory (
    id integer NOT NULL,
    code character varying(4) NOT NULL,
    name character varying(80) NOT NULL
);


--
-- Name: joyous_eventcategory_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.joyous_eventcategory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: joyous_eventcategory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.joyous_eventcategory_id_seq OWNED BY public.joyous_eventcategory.id;


--
-- Name: joyous_extrainfopage; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.joyous_extrainfopage (
    page_ptr_id integer NOT NULL,
    except_date date NOT NULL,
    extra_information text NOT NULL,
    overrides_id integer,
    extra_title character varying(255) NOT NULL
);


--
-- Name: joyous_grouppage; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.joyous_grouppage (
    page_ptr_id integer NOT NULL,
    content text NOT NULL
);


--
-- Name: joyous_multidayeventpage; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.joyous_multidayeventpage (
    page_ptr_id integer NOT NULL,
    time_from time without time zone,
    time_to time without time zone,
    location character varying(255) NOT NULL,
    details text NOT NULL,
    website character varying(200) NOT NULL,
    date_from date NOT NULL,
    date_to date NOT NULL,
    category_id integer,
    group_page_id integer,
    image_id integer,
    tz character varying(63) NOT NULL,
    uid character varying(255) NOT NULL
);


--
-- Name: joyous_postponementpage; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.joyous_postponementpage (
    cancellationpage_ptr_id integer NOT NULL,
    time_from time without time zone,
    time_to time without time zone,
    location character varying(255) NOT NULL,
    details text NOT NULL,
    website character varying(200) NOT NULL,
    postponement_title character varying(255) NOT NULL,
    date date NOT NULL,
    category_id integer,
    image_id integer,
    num_days integer NOT NULL
);


--
-- Name: joyous_recurringeventpage; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.joyous_recurringeventpage (
    page_ptr_id integer NOT NULL,
    time_from time without time zone,
    time_to time without time zone,
    location character varying(255) NOT NULL,
    details text NOT NULL,
    website character varying(200) NOT NULL,
    repeat character varying(255) NOT NULL,
    category_id integer,
    group_page_id integer,
    image_id integer,
    tz character varying(63) NOT NULL,
    uid character varying(255) NOT NULL,
    num_days integer NOT NULL
);


--
-- Name: joyous_simpleeventpage; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.joyous_simpleeventpage (
    page_ptr_id integer NOT NULL,
    time_from time without time zone,
    time_to time without time zone,
    location character varying(255) NOT NULL,
    details text NOT NULL,
    website character varying(200) NOT NULL,
    date date NOT NULL,
    category_id integer,
    group_page_id integer,
    image_id integer,
    tz character varying(63) NOT NULL,
    uid character varying(255) NOT NULL
);


--
-- Name: pages_advert; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pages_advert (
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

CREATE SEQUENCE public.pages_advert_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pages_advert_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.pages_advert_id_seq OWNED BY public.pages_advert.id;


--
-- Name: pages_contentblock; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pages_contentblock (
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

CREATE SEQUENCE public.pages_contentblock_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pages_contentblock_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.pages_contentblock_id_seq OWNED BY public.pages_contentblock.id;


--
-- Name: pages_faqspage; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pages_faqspage (
    page_ptr_id integer NOT NULL,
    body text NOT NULL
);


--
-- Name: pages_homepage; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pages_homepage (
    page_ptr_id integer NOT NULL,
    title_text text,
    body text,
    feed_image_id integer
);


--
-- Name: pages_homepagecarouselitem; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pages_homepagecarouselitem (
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

CREATE SEQUENCE public.pages_homepagecarouselitem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pages_homepagecarouselitem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.pages_homepagecarouselitem_id_seq OWNED BY public.pages_homepagecarouselitem.id;


--
-- Name: pages_homepagecontentitem; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pages_homepagecontentitem (
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

CREATE SEQUENCE public.pages_homepagecontentitem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pages_homepagecontentitem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.pages_homepagecontentitem_id_seq OWNED BY public.pages_homepagecontentitem.id;


--
-- Name: pages_homepagerelatedlink; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pages_homepagerelatedlink (
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

CREATE SEQUENCE public.pages_homepagerelatedlink_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pages_homepagerelatedlink_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.pages_homepagerelatedlink_id_seq OWNED BY public.pages_homepagerelatedlink.id;


--
-- Name: pages_sitebranding; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pages_sitebranding (
    id integer NOT NULL,
    site_name character varying(250),
    logo_id integer,
    site_id integer NOT NULL
);


--
-- Name: pages_sitebranding_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.pages_sitebranding_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pages_sitebranding_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.pages_sitebranding_id_seq OWNED BY public.pages_sitebranding.id;


--
-- Name: pages_socialmediasettings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pages_socialmediasettings (
    id integer NOT NULL,
    facebook character varying(200),
    instagram character varying(255),
    youtube character varying(200),
    linkedin character varying(255),
    github character varying(255),
    facebook_appid character varying(255),
    site_id integer NOT NULL,
    twitter character varying(255)
);


--
-- Name: pages_socialmediasettings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.pages_socialmediasettings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pages_socialmediasettings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.pages_socialmediasettings_id_seq OWNED BY public.pages_socialmediasettings.id;


--
-- Name: pages_standardindexpage; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pages_standardindexpage (
    page_ptr_id integer NOT NULL,
    subtitle character varying(255) NOT NULL,
    intro text NOT NULL,
    feed_image_id integer,
    template_string character varying(255) NOT NULL
);


--
-- Name: pages_standardindexpagerelatedlink; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pages_standardindexpagerelatedlink (
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

CREATE SEQUENCE public.pages_standardindexpagerelatedlink_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pages_standardindexpagerelatedlink_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.pages_standardindexpagerelatedlink_id_seq OWNED BY public.pages_standardindexpagerelatedlink.id;


--
-- Name: pages_standardpage; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pages_standardpage (
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

CREATE TABLE public.pages_standardpagecarouselitem (
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

CREATE SEQUENCE public.pages_standardpagecarouselitem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pages_standardpagecarouselitem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.pages_standardpagecarouselitem_id_seq OWNED BY public.pages_standardpagecarouselitem.id;


--
-- Name: pages_standardpagerelatedlink; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pages_standardpagerelatedlink (
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

CREATE SEQUENCE public.pages_standardpagerelatedlink_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pages_standardpagerelatedlink_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.pages_standardpagerelatedlink_id_seq OWNED BY public.pages_standardpagerelatedlink.id;


--
-- Name: pages_testimonial; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pages_testimonial (
    id integer NOT NULL,
    link_external character varying(200) NOT NULL,
    name character varying(150) NOT NULL,
    text text NOT NULL,
    link_document_id integer,
    link_page_id integer,
    page_id integer,
    photo_id integer
);


--
-- Name: pages_testimonial_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.pages_testimonial_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pages_testimonial_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.pages_testimonial_id_seq OWNED BY public.pages_testimonial.id;


--
-- Name: pages_testimonialpage; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pages_testimonialpage (
    page_ptr_id integer NOT NULL,
    intro text NOT NULL,
    feed_image_id integer
);


--
-- Name: pages_videogallerypage; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pages_videogallerypage (
    page_ptr_id integer NOT NULL,
    intro text NOT NULL,
    feed_image_id integer
);


--
-- Name: pages_videogallerypagecarouselitem; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pages_videogallerypagecarouselitem (
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

CREATE SEQUENCE public.pages_videopagecarouselitem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pages_videopagecarouselitem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.pages_videopagecarouselitem_id_seq OWNED BY public.pages_videogallerypagecarouselitem.id;


--
-- Name: people_personindexpage; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.people_personindexpage (
    page_ptr_id integer NOT NULL,
    subtitle character varying(255) NOT NULL,
    intro text NOT NULL,
    feed_image_id integer
);


--
-- Name: people_personindexpagerelatedlink; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.people_personindexpagerelatedlink (
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

CREATE SEQUENCE public.people_personindexpagerelatedlink_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: people_personindexpagerelatedlink_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.people_personindexpagerelatedlink_id_seq OWNED BY public.people_personindexpagerelatedlink.id;


--
-- Name: people_personpage; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.people_personpage (
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

CREATE TABLE public.people_personpagerelatedlink (
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

CREATE SEQUENCE public.people_personpagerelatedlink_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: people_personpagerelatedlink_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.people_personpagerelatedlink_id_seq OWNED BY public.people_personpagerelatedlink.id;


--
-- Name: people_personpagetag; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.people_personpagetag (
    id integer NOT NULL,
    content_object_id integer NOT NULL,
    tag_id integer NOT NULL
);


--
-- Name: people_personpagetag_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.people_personpagetag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: people_personpagetag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.people_personpagetag_id_seq OWNED BY public.people_personpagetag.id;


--
-- Name: people_personrole; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.people_personrole (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


--
-- Name: people_personrole_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.people_personrole_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: people_personrole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.people_personrole_id_seq OWNED BY public.people_personrole.id;


--
-- Name: postgres_search_indexentry; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.postgres_search_indexentry (
    id integer NOT NULL,
    object_id text NOT NULL,
    body tsvector NOT NULL,
    content_type_id integer NOT NULL,
    autocomplete tsvector NOT NULL
);


--
-- Name: postgres_search_indexentry_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.postgres_search_indexentry_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: postgres_search_indexentry_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.postgres_search_indexentry_id_seq OWNED BY public.postgres_search_indexentry.id;


--
-- Name: products_productindexpage; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products_productindexpage (
    page_ptr_id integer NOT NULL,
    subtitle character varying(255) NOT NULL,
    intro text NOT NULL,
    feed_image_id integer
);


--
-- Name: products_productindexpagerelatedlink; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products_productindexpagerelatedlink (
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

CREATE SEQUENCE public.products_productindexpagerelatedlink_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: products_productindexpagerelatedlink_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.products_productindexpagerelatedlink_id_seq OWNED BY public.products_productindexpagerelatedlink.id;


--
-- Name: products_productpage; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products_productpage (
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

CREATE TABLE public.products_productpagerelatedlink (
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

CREATE SEQUENCE public.products_productpagerelatedlink_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: products_productpagerelatedlink_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.products_productpagerelatedlink_id_seq OWNED BY public.products_productpagerelatedlink.id;


--
-- Name: products_productpagetag; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products_productpagetag (
    id integer NOT NULL,
    content_object_id integer NOT NULL,
    tag_id integer NOT NULL
);


--
-- Name: products_productpagetag_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.products_productpagetag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: products_productpagetag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.products_productpagetag_id_seq OWNED BY public.products_productpagetag.id;


--
-- Name: socialaccount_socialaccount; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.socialaccount_socialaccount (
    id integer NOT NULL,
    provider character varying(30) NOT NULL,
    uid character varying(191) NOT NULL,
    last_login timestamp with time zone NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    extra_data text NOT NULL,
    user_id integer NOT NULL
);


--
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.socialaccount_socialaccount_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.socialaccount_socialaccount_id_seq OWNED BY public.socialaccount_socialaccount.id;


--
-- Name: socialaccount_socialapp; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.socialaccount_socialapp (
    id integer NOT NULL,
    provider character varying(30) NOT NULL,
    name character varying(40) NOT NULL,
    client_id character varying(191) NOT NULL,
    secret character varying(191) NOT NULL,
    key character varying(191) NOT NULL
);


--
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.socialaccount_socialapp_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.socialaccount_socialapp_id_seq OWNED BY public.socialaccount_socialapp.id;


--
-- Name: socialaccount_socialapp_sites; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.socialaccount_socialapp_sites (
    id integer NOT NULL,
    socialapp_id integer NOT NULL,
    site_id integer NOT NULL
);


--
-- Name: socialaccount_socialapp_sites_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.socialaccount_socialapp_sites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: socialaccount_socialapp_sites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.socialaccount_socialapp_sites_id_seq OWNED BY public.socialaccount_socialapp_sites.id;


--
-- Name: socialaccount_socialtoken; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.socialaccount_socialtoken (
    id integer NOT NULL,
    token text NOT NULL,
    token_secret text NOT NULL,
    expires_at timestamp with time zone,
    account_id integer NOT NULL,
    app_id integer NOT NULL
);


--
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.socialaccount_socialtoken_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.socialaccount_socialtoken_id_seq OWNED BY public.socialaccount_socialtoken.id;


--
-- Name: taggit_tag; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.taggit_tag (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL
);


--
-- Name: taggit_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.taggit_tag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: taggit_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.taggit_tag_id_seq OWNED BY public.taggit_tag.id;


--
-- Name: taggit_taggeditem; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.taggit_taggeditem (
    id integer NOT NULL,
    object_id integer NOT NULL,
    content_type_id integer NOT NULL,
    tag_id integer NOT NULL
);


--
-- Name: taggit_taggeditem_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.taggit_taggeditem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: taggit_taggeditem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.taggit_taggeditem_id_seq OWNED BY public.taggit_taggeditem.id;


--
-- Name: users_user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    name character varying(255) NOT NULL,
    address character varying(255) NOT NULL,
    city character varying(255) NOT NULL,
    state character varying(255) NOT NULL,
    country_of_residence character varying(2) NOT NULL,
    country_of_nationality character varying(2) NOT NULL,
    job character varying(255) NOT NULL,
    organisation character varying(255) NOT NULL,
    tos boolean NOT NULL
);


--
-- Name: users_user_groups; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


--
-- Name: users_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_user_groups_id_seq OWNED BY public.users_user_groups.id;


--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users_user.id;


--
-- Name: users_user_user_permissions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


--
-- Name: users_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_user_user_permissions_id_seq OWNED BY public.users_user_user_permissions.id;


--
-- Name: wagtail_feeds_rssfeedssettings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.wagtail_feeds_rssfeedssettings (
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
    feed_image_in_content boolean NOT NULL,
    feed_item_date_field character varying(255) NOT NULL,
    is_feed_item_date_field_datetime boolean NOT NULL
);


--
-- Name: wagtail_feeds_rssfeedssettings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.wagtail_feeds_rssfeedssettings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wagtail_feeds_rssfeedssettings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.wagtail_feeds_rssfeedssettings_id_seq OWNED BY public.wagtail_feeds_rssfeedssettings.id;


--
-- Name: wagtailcore_collection; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.wagtailcore_collection (
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

CREATE SEQUENCE public.wagtailcore_collection_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wagtailcore_collection_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.wagtailcore_collection_id_seq OWNED BY public.wagtailcore_collection.id;


--
-- Name: wagtailcore_collectionviewrestriction; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.wagtailcore_collectionviewrestriction (
    id integer NOT NULL,
    restriction_type character varying(20) NOT NULL,
    password character varying(255) NOT NULL,
    collection_id integer NOT NULL
);


--
-- Name: wagtailcore_collectionviewrestriction_groups; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.wagtailcore_collectionviewrestriction_groups (
    id integer NOT NULL,
    collectionviewrestriction_id integer NOT NULL,
    group_id integer NOT NULL
);


--
-- Name: wagtailcore_collectionviewrestriction_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.wagtailcore_collectionviewrestriction_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wagtailcore_collectionviewrestriction_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.wagtailcore_collectionviewrestriction_groups_id_seq OWNED BY public.wagtailcore_collectionviewrestriction_groups.id;


--
-- Name: wagtailcore_collectionviewrestriction_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.wagtailcore_collectionviewrestriction_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wagtailcore_collectionviewrestriction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.wagtailcore_collectionviewrestriction_id_seq OWNED BY public.wagtailcore_collectionviewrestriction.id;


--
-- Name: wagtailcore_groupcollectionpermission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.wagtailcore_groupcollectionpermission (
    id integer NOT NULL,
    collection_id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


--
-- Name: wagtailcore_groupcollectionpermission_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.wagtailcore_groupcollectionpermission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wagtailcore_groupcollectionpermission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.wagtailcore_groupcollectionpermission_id_seq OWNED BY public.wagtailcore_groupcollectionpermission.id;


--
-- Name: wagtailcore_grouppagepermission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.wagtailcore_grouppagepermission (
    id integer NOT NULL,
    permission_type character varying(20) NOT NULL,
    group_id integer NOT NULL,
    page_id integer NOT NULL
);


--
-- Name: wagtailcore_grouppagepermission_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.wagtailcore_grouppagepermission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wagtailcore_grouppagepermission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.wagtailcore_grouppagepermission_id_seq OWNED BY public.wagtailcore_grouppagepermission.id;


--
-- Name: wagtailcore_page; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.wagtailcore_page (
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
    locked_at timestamp with time zone,
    locked_by_id integer,
    CONSTRAINT wagtailcore_page_depth_check CHECK ((depth >= 0)),
    CONSTRAINT wagtailcore_page_numchild_check CHECK ((numchild >= 0))
);


--
-- Name: wagtailcore_page_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.wagtailcore_page_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wagtailcore_page_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.wagtailcore_page_id_seq OWNED BY public.wagtailcore_page.id;


--
-- Name: wagtailcore_pagerevision; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.wagtailcore_pagerevision (
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

CREATE SEQUENCE public.wagtailcore_pagerevision_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wagtailcore_pagerevision_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.wagtailcore_pagerevision_id_seq OWNED BY public.wagtailcore_pagerevision.id;


--
-- Name: wagtailcore_pageviewrestriction; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.wagtailcore_pageviewrestriction (
    id integer NOT NULL,
    password character varying(255) NOT NULL,
    page_id integer NOT NULL,
    restriction_type character varying(20) NOT NULL
);


--
-- Name: wagtailcore_pageviewrestriction_groups; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.wagtailcore_pageviewrestriction_groups (
    id integer NOT NULL,
    pageviewrestriction_id integer NOT NULL,
    group_id integer NOT NULL
);


--
-- Name: wagtailcore_pageviewrestriction_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.wagtailcore_pageviewrestriction_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wagtailcore_pageviewrestriction_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.wagtailcore_pageviewrestriction_groups_id_seq OWNED BY public.wagtailcore_pageviewrestriction_groups.id;


--
-- Name: wagtailcore_pageviewrestriction_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.wagtailcore_pageviewrestriction_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wagtailcore_pageviewrestriction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.wagtailcore_pageviewrestriction_id_seq OWNED BY public.wagtailcore_pageviewrestriction.id;


--
-- Name: wagtailcore_site; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.wagtailcore_site (
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

CREATE SEQUENCE public.wagtailcore_site_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wagtailcore_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.wagtailcore_site_id_seq OWNED BY public.wagtailcore_site.id;


--
-- Name: wagtaildocs_document; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.wagtaildocs_document (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    file character varying(100) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    uploaded_by_user_id integer,
    collection_id integer NOT NULL,
    file_size integer,
    file_hash character varying(40) NOT NULL,
    CONSTRAINT wagtaildocs_document_file_size_check CHECK ((file_size >= 0))
);


--
-- Name: wagtaildocs_document_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.wagtaildocs_document_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wagtaildocs_document_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.wagtaildocs_document_id_seq OWNED BY public.wagtaildocs_document.id;


--
-- Name: wagtailembeds_embed; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.wagtailembeds_embed (
    id integer NOT NULL,
    url character varying(200) NOT NULL,
    max_width smallint,
    type character varying(10) NOT NULL,
    html text NOT NULL,
    title text NOT NULL,
    author_name text NOT NULL,
    provider_name text NOT NULL,
    thumbnail_url character varying(255),
    width integer,
    height integer,
    last_updated timestamp with time zone NOT NULL
);


--
-- Name: wagtailembeds_embed_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.wagtailembeds_embed_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wagtailembeds_embed_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.wagtailembeds_embed_id_seq OWNED BY public.wagtailembeds_embed.id;


--
-- Name: wagtailforms_formsubmission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.wagtailforms_formsubmission (
    id integer NOT NULL,
    form_data text NOT NULL,
    submit_time timestamp with time zone NOT NULL,
    page_id integer NOT NULL
);


--
-- Name: wagtailforms_formsubmission_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.wagtailforms_formsubmission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wagtailforms_formsubmission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.wagtailforms_formsubmission_id_seq OWNED BY public.wagtailforms_formsubmission.id;


--
-- Name: wagtailimages_image; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.wagtailimages_image (
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
    file_hash character varying(40) NOT NULL,
    CONSTRAINT wagtailimages_image_file_size_check CHECK ((file_size >= 0)),
    CONSTRAINT wagtailimages_image_focal_point_height_check CHECK ((focal_point_height >= 0)),
    CONSTRAINT wagtailimages_image_focal_point_width_check CHECK ((focal_point_width >= 0)),
    CONSTRAINT wagtailimages_image_focal_point_x_check CHECK ((focal_point_x >= 0)),
    CONSTRAINT wagtailimages_image_focal_point_y_check CHECK ((focal_point_y >= 0))
);


--
-- Name: wagtailimages_image_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.wagtailimages_image_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wagtailimages_image_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.wagtailimages_image_id_seq OWNED BY public.wagtailimages_image.id;


--
-- Name: wagtailimages_rendition; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.wagtailimages_rendition (
    id integer NOT NULL,
    file character varying(100) NOT NULL,
    width integer NOT NULL,
    height integer NOT NULL,
    focal_point_key character varying(16) NOT NULL,
    filter_spec character varying(255) NOT NULL,
    image_id integer NOT NULL
);


--
-- Name: wagtailimages_rendition_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.wagtailimages_rendition_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wagtailimages_rendition_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.wagtailimages_rendition_id_seq OWNED BY public.wagtailimages_rendition.id;


--
-- Name: wagtailimages_uploadedimage; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.wagtailimages_uploadedimage (
    id integer NOT NULL,
    file character varying(200) NOT NULL,
    uploaded_by_user_id integer
);


--
-- Name: wagtailimages_uploadedimage_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.wagtailimages_uploadedimage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wagtailimages_uploadedimage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.wagtailimages_uploadedimage_id_seq OWNED BY public.wagtailimages_uploadedimage.id;


--
-- Name: wagtailredirects_redirect; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.wagtailredirects_redirect (
    id integer NOT NULL,
    old_path character varying(255) NOT NULL,
    is_permanent boolean NOT NULL,
    redirect_link character varying(255) NOT NULL,
    redirect_page_id integer,
    site_id integer
);


--
-- Name: wagtailredirects_redirect_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.wagtailredirects_redirect_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wagtailredirects_redirect_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.wagtailredirects_redirect_id_seq OWNED BY public.wagtailredirects_redirect.id;


--
-- Name: wagtailsearchpromotions_searchpromotion; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.wagtailsearchpromotions_searchpromotion (
    id integer NOT NULL,
    sort_order integer,
    description text NOT NULL,
    page_id integer NOT NULL,
    query_id integer NOT NULL
);


--
-- Name: wagtailsearch_editorspick_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.wagtailsearch_editorspick_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wagtailsearch_editorspick_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.wagtailsearch_editorspick_id_seq OWNED BY public.wagtailsearchpromotions_searchpromotion.id;


--
-- Name: wagtailsearch_query; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.wagtailsearch_query (
    id integer NOT NULL,
    query_string character varying(255) NOT NULL
);


--
-- Name: wagtailsearch_query_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.wagtailsearch_query_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wagtailsearch_query_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.wagtailsearch_query_id_seq OWNED BY public.wagtailsearch_query.id;


--
-- Name: wagtailsearch_querydailyhits; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.wagtailsearch_querydailyhits (
    id integer NOT NULL,
    date date NOT NULL,
    hits integer NOT NULL,
    query_id integer NOT NULL
);


--
-- Name: wagtailsearch_querydailyhits_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.wagtailsearch_querydailyhits_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wagtailsearch_querydailyhits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.wagtailsearch_querydailyhits_id_seq OWNED BY public.wagtailsearch_querydailyhits.id;


--
-- Name: wagtailusers_userprofile; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.wagtailusers_userprofile (
    id integer NOT NULL,
    submitted_notifications boolean NOT NULL,
    approved_notifications boolean NOT NULL,
    rejected_notifications boolean NOT NULL,
    user_id integer NOT NULL,
    preferred_language character varying(10) NOT NULL,
    current_time_zone character varying(40) NOT NULL,
    avatar character varying(100) NOT NULL
);


--
-- Name: wagtailusers_userprofile_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.wagtailusers_userprofile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wagtailusers_userprofile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.wagtailusers_userprofile_id_seq OWNED BY public.wagtailusers_userprofile.id;


--
-- Name: account_emailaddress id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.account_emailaddress ALTER COLUMN id SET DEFAULT nextval('public.account_emailaddress_id_seq'::regclass);


--
-- Name: account_emailconfirmation id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.account_emailconfirmation ALTER COLUMN id SET DEFAULT nextval('public.account_emailconfirmation_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: blog_blogindexpagerelatedlink id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.blog_blogindexpagerelatedlink ALTER COLUMN id SET DEFAULT nextval('public.blog_blogindexpagerelatedlink_id_seq'::regclass);


--
-- Name: blog_blogpagecarouselitem id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.blog_blogpagecarouselitem ALTER COLUMN id SET DEFAULT nextval('public.blog_blogpagecarouselitem_id_seq'::regclass);


--
-- Name: blog_blogpagerelatedlink id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.blog_blogpagerelatedlink ALTER COLUMN id SET DEFAULT nextval('public.blog_blogpagerelatedlink_id_seq'::regclass);


--
-- Name: blog_blogpagetag id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.blog_blogpagetag ALTER COLUMN id SET DEFAULT nextval('public.blog_blogpagetag_id_seq'::regclass);


--
-- Name: contact_contactformfield id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contact_contactformfield ALTER COLUMN id SET DEFAULT nextval('public.contact_contactformfield_id_seq'::regclass);


--
-- Name: contact_formfield id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contact_formfield ALTER COLUMN id SET DEFAULT nextval('public.contact_formfield_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: django_site id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_site ALTER COLUMN id SET DEFAULT nextval('public.django_site_id_seq'::regclass);


--
-- Name: documents_gallery_documentspagetag id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.documents_gallery_documentspagetag ALTER COLUMN id SET DEFAULT nextval('public.documents_gallery_documentspagetag_id_seq'::regclass);


--
-- Name: events_eventindexpagerelatedlink id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.events_eventindexpagerelatedlink ALTER COLUMN id SET DEFAULT nextval('public.events_eventindexpagerelatedlink_id_seq'::regclass);


--
-- Name: events_eventpagecarouselitem id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.events_eventpagecarouselitem ALTER COLUMN id SET DEFAULT nextval('public.events_eventpagecarouselitem_id_seq'::regclass);


--
-- Name: events_eventpagerelatedlink id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.events_eventpagerelatedlink ALTER COLUMN id SET DEFAULT nextval('public.events_eventpagerelatedlink_id_seq'::regclass);


--
-- Name: events_eventpagespeaker id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.events_eventpagespeaker ALTER COLUMN id SET DEFAULT nextval('public.events_eventpagespeaker_id_seq'::regclass);


--
-- Name: events_eventpagetag id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.events_eventpagetag ALTER COLUMN id SET DEFAULT nextval('public.events_eventpagetag_id_seq'::regclass);


--
-- Name: joyous_eventcategory id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.joyous_eventcategory ALTER COLUMN id SET DEFAULT nextval('public.joyous_eventcategory_id_seq'::regclass);


--
-- Name: pages_advert id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_advert ALTER COLUMN id SET DEFAULT nextval('public.pages_advert_id_seq'::regclass);


--
-- Name: pages_contentblock id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_contentblock ALTER COLUMN id SET DEFAULT nextval('public.pages_contentblock_id_seq'::regclass);


--
-- Name: pages_homepagecarouselitem id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_homepagecarouselitem ALTER COLUMN id SET DEFAULT nextval('public.pages_homepagecarouselitem_id_seq'::regclass);


--
-- Name: pages_homepagecontentitem id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_homepagecontentitem ALTER COLUMN id SET DEFAULT nextval('public.pages_homepagecontentitem_id_seq'::regclass);


--
-- Name: pages_homepagerelatedlink id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_homepagerelatedlink ALTER COLUMN id SET DEFAULT nextval('public.pages_homepagerelatedlink_id_seq'::regclass);


--
-- Name: pages_sitebranding id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_sitebranding ALTER COLUMN id SET DEFAULT nextval('public.pages_sitebranding_id_seq'::regclass);


--
-- Name: pages_socialmediasettings id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_socialmediasettings ALTER COLUMN id SET DEFAULT nextval('public.pages_socialmediasettings_id_seq'::regclass);


--
-- Name: pages_standardindexpagerelatedlink id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_standardindexpagerelatedlink ALTER COLUMN id SET DEFAULT nextval('public.pages_standardindexpagerelatedlink_id_seq'::regclass);


--
-- Name: pages_standardpagecarouselitem id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_standardpagecarouselitem ALTER COLUMN id SET DEFAULT nextval('public.pages_standardpagecarouselitem_id_seq'::regclass);


--
-- Name: pages_standardpagerelatedlink id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_standardpagerelatedlink ALTER COLUMN id SET DEFAULT nextval('public.pages_standardpagerelatedlink_id_seq'::regclass);


--
-- Name: pages_testimonial id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_testimonial ALTER COLUMN id SET DEFAULT nextval('public.pages_testimonial_id_seq'::regclass);


--
-- Name: pages_videogallerypagecarouselitem id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_videogallerypagecarouselitem ALTER COLUMN id SET DEFAULT nextval('public.pages_videopagecarouselitem_id_seq'::regclass);


--
-- Name: people_personindexpagerelatedlink id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.people_personindexpagerelatedlink ALTER COLUMN id SET DEFAULT nextval('public.people_personindexpagerelatedlink_id_seq'::regclass);


--
-- Name: people_personpagerelatedlink id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.people_personpagerelatedlink ALTER COLUMN id SET DEFAULT nextval('public.people_personpagerelatedlink_id_seq'::regclass);


--
-- Name: people_personpagetag id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.people_personpagetag ALTER COLUMN id SET DEFAULT nextval('public.people_personpagetag_id_seq'::regclass);


--
-- Name: people_personrole id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.people_personrole ALTER COLUMN id SET DEFAULT nextval('public.people_personrole_id_seq'::regclass);


--
-- Name: postgres_search_indexentry id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.postgres_search_indexentry ALTER COLUMN id SET DEFAULT nextval('public.postgres_search_indexentry_id_seq'::regclass);


--
-- Name: products_productindexpagerelatedlink id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_productindexpagerelatedlink ALTER COLUMN id SET DEFAULT nextval('public.products_productindexpagerelatedlink_id_seq'::regclass);


--
-- Name: products_productpagerelatedlink id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_productpagerelatedlink ALTER COLUMN id SET DEFAULT nextval('public.products_productpagerelatedlink_id_seq'::regclass);


--
-- Name: products_productpagetag id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_productpagetag ALTER COLUMN id SET DEFAULT nextval('public.products_productpagetag_id_seq'::regclass);


--
-- Name: socialaccount_socialaccount id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.socialaccount_socialaccount ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialaccount_id_seq'::regclass);


--
-- Name: socialaccount_socialapp id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.socialaccount_socialapp ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialapp_id_seq'::regclass);


--
-- Name: socialaccount_socialapp_sites id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialapp_sites_id_seq'::regclass);


--
-- Name: socialaccount_socialtoken id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.socialaccount_socialtoken ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialtoken_id_seq'::regclass);


--
-- Name: taggit_tag id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.taggit_tag ALTER COLUMN id SET DEFAULT nextval('public.taggit_tag_id_seq'::regclass);


--
-- Name: taggit_taggeditem id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.taggit_taggeditem ALTER COLUMN id SET DEFAULT nextval('public.taggit_taggeditem_id_seq'::regclass);


--
-- Name: users_user id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users_user ALTER COLUMN id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Name: users_user_groups id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users_user_groups ALTER COLUMN id SET DEFAULT nextval('public.users_user_groups_id_seq'::regclass);


--
-- Name: users_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.users_user_user_permissions_id_seq'::regclass);


--
-- Name: wagtail_feeds_rssfeedssettings id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wagtail_feeds_rssfeedssettings ALTER COLUMN id SET DEFAULT nextval('public.wagtail_feeds_rssfeedssettings_id_seq'::regclass);


--
-- Name: wagtailcore_collection id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wagtailcore_collection ALTER COLUMN id SET DEFAULT nextval('public.wagtailcore_collection_id_seq'::regclass);


--
-- Name: wagtailcore_collectionviewrestriction id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wagtailcore_collectionviewrestriction ALTER COLUMN id SET DEFAULT nextval('public.wagtailcore_collectionviewrestriction_id_seq'::regclass);


--
-- Name: wagtailcore_collectionviewrestriction_groups id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wagtailcore_collectionviewrestriction_groups ALTER COLUMN id SET DEFAULT nextval('public.wagtailcore_collectionviewrestriction_groups_id_seq'::regclass);


--
-- Name: wagtailcore_groupcollectionpermission id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wagtailcore_groupcollectionpermission ALTER COLUMN id SET DEFAULT nextval('public.wagtailcore_groupcollectionpermission_id_seq'::regclass);


--
-- Name: wagtailcore_grouppagepermission id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wagtailcore_grouppagepermission ALTER COLUMN id SET DEFAULT nextval('public.wagtailcore_grouppagepermission_id_seq'::regclass);


--
-- Name: wagtailcore_page id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wagtailcore_page ALTER COLUMN id SET DEFAULT nextval('public.wagtailcore_page_id_seq'::regclass);


--
-- Name: wagtailcore_pagerevision id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wagtailcore_pagerevision ALTER COLUMN id SET DEFAULT nextval('public.wagtailcore_pagerevision_id_seq'::regclass);


--
-- Name: wagtailcore_pageviewrestriction id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wagtailcore_pageviewrestriction ALTER COLUMN id SET DEFAULT nextval('public.wagtailcore_pageviewrestriction_id_seq'::regclass);


--
-- Name: wagtailcore_pageviewrestriction_groups id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wagtailcore_pageviewrestriction_groups ALTER COLUMN id SET DEFAULT nextval('public.wagtailcore_pageviewrestriction_groups_id_seq'::regclass);


--
-- Name: wagtailcore_site id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wagtailcore_site ALTER COLUMN id SET DEFAULT nextval('public.wagtailcore_site_id_seq'::regclass);


--
-- Name: wagtaildocs_document id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wagtaildocs_document ALTER COLUMN id SET DEFAULT nextval('public.wagtaildocs_document_id_seq'::regclass);


--
-- Name: wagtailembeds_embed id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wagtailembeds_embed ALTER COLUMN id SET DEFAULT nextval('public.wagtailembeds_embed_id_seq'::regclass);


--
-- Name: wagtailforms_formsubmission id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wagtailforms_formsubmission ALTER COLUMN id SET DEFAULT nextval('public.wagtailforms_formsubmission_id_seq'::regclass);


--
-- Name: wagtailimages_image id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wagtailimages_image ALTER COLUMN id SET DEFAULT nextval('public.wagtailimages_image_id_seq'::regclass);


--
-- Name: wagtailimages_rendition id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wagtailimages_rendition ALTER COLUMN id SET DEFAULT nextval('public.wagtailimages_rendition_id_seq'::regclass);


--
-- Name: wagtailimages_uploadedimage id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wagtailimages_uploadedimage ALTER COLUMN id SET DEFAULT nextval('public.wagtailimages_uploadedimage_id_seq'::regclass);


--
-- Name: wagtailredirects_redirect id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wagtailredirects_redirect ALTER COLUMN id SET DEFAULT nextval('public.wagtailredirects_redirect_id_seq'::regclass);


--
-- Name: wagtailsearch_query id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wagtailsearch_query ALTER COLUMN id SET DEFAULT nextval('public.wagtailsearch_query_id_seq'::regclass);


--
-- Name: wagtailsearch_querydailyhits id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wagtailsearch_querydailyhits ALTER COLUMN id SET DEFAULT nextval('public.wagtailsearch_querydailyhits_id_seq'::regclass);


--
-- Name: wagtailsearchpromotions_searchpromotion id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wagtailsearchpromotions_searchpromotion ALTER COLUMN id SET DEFAULT nextval('public.wagtailsearch_editorspick_id_seq'::regclass);


--
-- Name: wagtailusers_userprofile id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wagtailusers_userprofile ALTER COLUMN id SET DEFAULT nextval('public.wagtailusers_userprofile_id_seq'::regclass);


--
-- Data for Name: account_emailaddress; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.account_emailaddress (id, email, verified, "primary", user_id) FROM stdin;
1	cclarke@chrisdev.com	t	t	2
3	lendl.smith@gmail.com	t	t	1
\.


--
-- Data for Name: account_emailconfirmation; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.account_emailconfirmation (id, created, sent, key, email_address_id) FROM stdin;
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.auth_group (id, name) FROM stdin;
1	Moderators
2	Editors
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
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

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
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
11	Can view log entry	6	view_logentry
12	Can add permission	7	add_permission
13	Can change permission	7	change_permission
14	Can delete permission	7	delete_permission
15	Can view permission	7	view_permission
16	Can add group	8	add_group
17	Can change group	8	change_group
18	Can delete group	8	delete_group
19	Can view group	8	view_group
20	Can add content type	9	add_contenttype
21	Can change content type	9	change_contenttype
22	Can delete content type	9	delete_contenttype
23	Can view content type	9	view_contenttype
24	Can add session	10	add_session
25	Can change session	10	change_session
26	Can delete session	10	delete_session
27	Can view session	10	view_session
28	Can add site	11	add_site
29	Can change site	11	change_site
30	Can delete site	11	delete_site
31	Can view site	11	view_site
32	Can add email address	12	add_emailaddress
33	Can change email address	12	change_emailaddress
34	Can delete email address	12	delete_emailaddress
35	Can view email address	12	view_emailaddress
36	Can add email confirmation	13	add_emailconfirmation
37	Can change email confirmation	13	change_emailconfirmation
38	Can delete email confirmation	13	delete_emailconfirmation
39	Can view email confirmation	13	view_emailconfirmation
40	Can add social account	14	add_socialaccount
41	Can change social account	14	change_socialaccount
42	Can delete social account	14	delete_socialaccount
43	Can view social account	14	view_socialaccount
44	Can add social application	15	add_socialapp
45	Can change social application	15	change_socialapp
46	Can delete social application	15	delete_socialapp
47	Can view social application	15	view_socialapp
48	Can add social application token	16	add_socialtoken
49	Can change social application token	16	change_socialtoken
50	Can delete social application token	16	delete_socialtoken
51	Can view social application token	16	view_socialtoken
52	Can add Tag	17	add_tag
53	Can change Tag	17	change_tag
54	Can delete Tag	17	delete_tag
55	Can view Tag	17	view_tag
56	Can add Tagged Item	18	add_taggeditem
57	Can change Tagged Item	18	change_taggeditem
58	Can delete Tagged Item	18	delete_taggeditem
59	Can view Tagged Item	18	view_taggeditem
60	Can add RSS feed setting	19	add_rssfeedssettings
61	Can change RSS feed setting	19	change_rssfeedssettings
62	Can delete RSS feed setting	19	delete_rssfeedssettings
63	Can view RSS feed setting	19	view_rssfeedssettings
64	Can add event index page	20	add_eventindexpage
65	Can change event index page	20	change_eventindexpage
66	Can delete event index page	20	delete_eventindexpage
67	Can view event index page	20	view_eventindexpage
68	Can add event index page related link	21	add_eventindexpagerelatedlink
69	Can change event index page related link	21	change_eventindexpagerelatedlink
70	Can delete event index page related link	21	delete_eventindexpagerelatedlink
71	Can view event index page related link	21	view_eventindexpagerelatedlink
72	Can add event page	22	add_eventpage
73	Can change event page	22	change_eventpage
74	Can delete event page	22	delete_eventpage
75	Can view event page	22	view_eventpage
76	Can add event page carousel item	23	add_eventpagecarouselitem
77	Can change event page carousel item	23	change_eventpagecarouselitem
78	Can delete event page carousel item	23	delete_eventpagecarouselitem
79	Can view event page carousel item	23	view_eventpagecarouselitem
80	Can add event page related link	24	add_eventpagerelatedlink
81	Can change event page related link	24	change_eventpagerelatedlink
82	Can delete event page related link	24	delete_eventpagerelatedlink
83	Can view event page related link	24	view_eventpagerelatedlink
84	Can add event page speaker	25	add_eventpagespeaker
85	Can change event page speaker	25	change_eventpagespeaker
86	Can delete event page speaker	25	delete_eventpagespeaker
87	Can view event page speaker	25	view_eventpagespeaker
88	Can add event page tag	26	add_eventpagetag
89	Can change event page tag	26	change_eventpagetag
90	Can delete event page tag	26	delete_eventpagetag
91	Can view event page tag	26	view_eventpagetag
92	Can add content block	27	add_contentblock
93	Can change content block	27	change_contentblock
94	Can delete content block	27	delete_contentblock
95	Can view content block	27	view_contentblock
96	Can add faqs page	28	add_faqspage
97	Can change faqs page	28	change_faqspage
98	Can delete faqs page	28	delete_faqspage
99	Can view faqs page	28	view_faqspage
100	Can add Homepage	4	add_homepage
101	Can change Homepage	4	change_homepage
102	Can delete Homepage	4	delete_homepage
103	Can view Homepage	4	view_homepage
104	Can add home page carousel item	29	add_homepagecarouselitem
105	Can change home page carousel item	29	change_homepagecarouselitem
106	Can delete home page carousel item	29	delete_homepagecarouselitem
107	Can view home page carousel item	29	view_homepagecarouselitem
108	Can add home page content item	30	add_homepagecontentitem
109	Can change home page content item	30	change_homepagecontentitem
110	Can delete home page content item	30	delete_homepagecontentitem
111	Can view home page content item	30	view_homepagecontentitem
112	Can add home page related link	31	add_homepagerelatedlink
113	Can change home page related link	31	change_homepagerelatedlink
114	Can delete home page related link	31	delete_homepagerelatedlink
115	Can view home page related link	31	view_homepagerelatedlink
116	Can add standard index page	32	add_standardindexpage
117	Can change standard index page	32	change_standardindexpage
118	Can delete standard index page	32	delete_standardindexpage
119	Can view standard index page	32	view_standardindexpage
120	Can add standard index page related link	33	add_standardindexpagerelatedlink
121	Can change standard index page related link	33	change_standardindexpagerelatedlink
122	Can delete standard index page related link	33	delete_standardindexpagerelatedlink
123	Can view standard index page related link	33	view_standardindexpagerelatedlink
124	Can add standard page	34	add_standardpage
125	Can change standard page	34	change_standardpage
126	Can delete standard page	34	delete_standardpage
127	Can view standard page	34	view_standardpage
128	Can add standard page carousel item	35	add_standardpagecarouselitem
129	Can change standard page carousel item	35	change_standardpagecarouselitem
130	Can delete standard page carousel item	35	delete_standardpagecarouselitem
131	Can view standard page carousel item	35	view_standardpagecarouselitem
132	Can add standard page related link	36	add_standardpagerelatedlink
133	Can change standard page related link	36	change_standardpagerelatedlink
134	Can delete standard page related link	36	delete_standardpagerelatedlink
135	Can view standard page related link	36	view_standardpagerelatedlink
136	Can add testimonial	37	add_testimonial
137	Can change testimonial	37	change_testimonial
138	Can delete testimonial	37	delete_testimonial
139	Can view testimonial	37	view_testimonial
140	Can add advert	38	add_advert
141	Can change advert	38	change_advert
142	Can delete advert	38	delete_advert
143	Can view advert	38	view_advert
144	Can add social media settings	39	add_socialmediasettings
145	Can change social media settings	39	change_socialmediasettings
146	Can delete social media settings	39	delete_socialmediasettings
147	Can view social media settings	39	view_socialmediasettings
148	Can add video gallery page	40	add_videogallerypage
149	Can change video gallery page	40	change_videogallerypage
150	Can delete video gallery page	40	delete_videogallerypage
151	Can view video gallery page	40	view_videogallerypage
152	Can add video gallery page carousel item	41	add_videogallerypagecarouselitem
153	Can change video gallery page carousel item	41	change_videogallerypagecarouselitem
154	Can delete video gallery page carousel item	41	delete_videogallerypagecarouselitem
155	Can view video gallery page carousel item	41	view_videogallerypagecarouselitem
156	Can add site branding	42	add_sitebranding
157	Can change site branding	42	change_sitebranding
158	Can delete site branding	42	delete_sitebranding
159	Can view site branding	42	view_sitebranding
160	Can add testimonial page	43	add_testimonialpage
161	Can change testimonial page	43	change_testimonialpage
162	Can delete testimonial page	43	delete_testimonialpage
163	Can view testimonial page	43	view_testimonialpage
164	Can add user	44	add_user
165	Can change user	44	change_user
166	Can delete user	44	delete_user
167	Can view user	44	view_user
168	Can add search promotion	45	add_searchpromotion
169	Can change search promotion	45	change_searchpromotion
170	Can delete search promotion	45	delete_searchpromotion
171	Can view search promotion	45	view_searchpromotion
172	Can add index entry	46	add_indexentry
173	Can change index entry	46	change_indexentry
174	Can delete index entry	46	delete_indexentry
175	Can view index entry	46	view_indexentry
176	Can add form submission	47	add_formsubmission
177	Can change form submission	47	change_formsubmission
178	Can delete form submission	47	delete_formsubmission
179	Can view form submission	47	view_formsubmission
180	Can add redirect	48	add_redirect
181	Can change redirect	48	change_redirect
182	Can delete redirect	48	delete_redirect
183	Can view redirect	48	view_redirect
184	Can add embed	49	add_embed
185	Can change embed	49	change_embed
186	Can delete embed	49	delete_embed
187	Can view embed	49	view_embed
188	Can add user profile	50	add_userprofile
189	Can change user profile	50	change_userprofile
190	Can delete user profile	50	delete_userprofile
191	Can view user profile	50	view_userprofile
192	Can view document	3	view_document
193	Can view image	2	view_image
194	Can add rendition	51	add_rendition
195	Can change rendition	51	change_rendition
196	Can delete rendition	51	delete_rendition
197	Can view rendition	51	view_rendition
198	Can add query	52	add_query
199	Can change query	52	change_query
200	Can delete query	52	delete_query
201	Can view query	52	view_query
202	Can add Query Daily Hits	53	add_querydailyhits
203	Can change Query Daily Hits	53	change_querydailyhits
204	Can delete Query Daily Hits	53	delete_querydailyhits
205	Can view Query Daily Hits	53	view_querydailyhits
206	Can add page	1	add_page
207	Can change page	1	change_page
208	Can delete page	1	delete_page
209	Can view page	1	view_page
210	Can add group page permission	54	add_grouppagepermission
211	Can change group page permission	54	change_grouppagepermission
212	Can delete group page permission	54	delete_grouppagepermission
213	Can view group page permission	54	view_grouppagepermission
214	Can add page revision	55	add_pagerevision
215	Can change page revision	55	change_pagerevision
216	Can delete page revision	55	delete_pagerevision
217	Can view page revision	55	view_pagerevision
218	Can add page view restriction	56	add_pageviewrestriction
219	Can change page view restriction	56	change_pageviewrestriction
220	Can delete page view restriction	56	delete_pageviewrestriction
221	Can view page view restriction	56	view_pageviewrestriction
222	Can add site	57	add_site
223	Can change site	57	change_site
224	Can delete site	57	delete_site
225	Can view site	57	view_site
226	Can add collection	58	add_collection
227	Can change collection	58	change_collection
228	Can delete collection	58	delete_collection
229	Can view collection	58	view_collection
230	Can add group collection permission	59	add_groupcollectionpermission
231	Can change group collection permission	59	change_groupcollectionpermission
232	Can delete group collection permission	59	delete_groupcollectionpermission
233	Can view group collection permission	59	view_groupcollectionpermission
234	Can add collection view restriction	60	add_collectionviewrestriction
235	Can change collection view restriction	60	change_collectionviewrestriction
236	Can delete collection view restriction	60	delete_collectionviewrestriction
237	Can view collection view restriction	60	view_collectionviewrestriction
238	Can add blog index page	61	add_blogindexpage
239	Can change blog index page	61	change_blogindexpage
240	Can delete blog index page	61	delete_blogindexpage
241	Can view blog index page	61	view_blogindexpage
242	Can add blog index page related link	62	add_blogindexpagerelatedlink
243	Can change blog index page related link	62	change_blogindexpagerelatedlink
244	Can delete blog index page related link	62	delete_blogindexpagerelatedlink
245	Can view blog index page related link	62	view_blogindexpagerelatedlink
246	Can add blog page	63	add_blogpage
247	Can change blog page	63	change_blogpage
248	Can delete blog page	63	delete_blogpage
249	Can view blog page	63	view_blogpage
250	Can add blog page carousel item	64	add_blogpagecarouselitem
251	Can change blog page carousel item	64	change_blogpagecarouselitem
252	Can delete blog page carousel item	64	delete_blogpagecarouselitem
253	Can view blog page carousel item	64	view_blogpagecarouselitem
254	Can add blog page related link	65	add_blogpagerelatedlink
255	Can change blog page related link	65	change_blogpagerelatedlink
256	Can delete blog page related link	65	delete_blogpagerelatedlink
257	Can view blog page related link	65	view_blogpagerelatedlink
258	Can add blog page tag	66	add_blogpagetag
259	Can change blog page tag	66	change_blogpagetag
260	Can delete blog page tag	66	delete_blogpagetag
261	Can view blog page tag	66	view_blogpagetag
262	Can add contact form field	67	add_contactformfield
263	Can change contact form field	67	change_contactformfield
264	Can delete contact form field	67	delete_contactformfield
265	Can view contact form field	67	view_contactformfield
266	Can add contact page	68	add_contactpage
267	Can change contact page	68	change_contactpage
268	Can delete contact page	68	delete_contactpage
269	Can view contact page	68	view_contactpage
270	Can add form field	69	add_formfield
271	Can change form field	69	change_formfield
272	Can delete form field	69	delete_formfield
273	Can view form field	69	view_formfield
274	Can add form page	70	add_formpage
275	Can change form page	70	change_formpage
276	Can delete form page	70	delete_formpage
277	Can view form page	70	view_formpage
278	Can add Documents Index Page	71	add_documentsindexpage
279	Can change Documents Index Page	71	change_documentsindexpage
280	Can delete Documents Index Page	71	delete_documentsindexpage
281	Can view Documents Index Page	71	view_documentsindexpage
282	Can add Documents Page	72	add_documentspage
283	Can change Documents Page	72	change_documentspage
284	Can delete Documents Page	72	delete_documentspage
285	Can view Documents Page	72	view_documentspage
286	Can add documents page tag	73	add_documentspagetag
287	Can change documents page tag	73	change_documentspagetag
288	Can delete documents page tag	73	delete_documentspagetag
289	Can view documents page tag	73	view_documentspagetag
290	Can add Photo Gallery	74	add_galleryindex
291	Can change Photo Gallery	74	change_galleryindex
292	Can delete Photo Gallery	74	delete_galleryindex
293	Can view Photo Gallery	74	view_galleryindex
294	Can add Photo Gallery Index	75	add_photogalleryindexpage
295	Can change Photo Gallery Index	75	change_photogalleryindexpage
296	Can delete Photo Gallery Index	75	delete_photogalleryindexpage
297	Can view Photo Gallery Index	75	view_photogalleryindexpage
298	Can add person index page	76	add_personindexpage
299	Can change person index page	76	change_personindexpage
300	Can delete person index page	76	delete_personindexpage
301	Can view person index page	76	view_personindexpage
302	Can add person index page related link	77	add_personindexpagerelatedlink
303	Can change person index page related link	77	change_personindexpagerelatedlink
304	Can delete person index page related link	77	delete_personindexpagerelatedlink
305	Can view person index page related link	77	view_personindexpagerelatedlink
306	Can add person page	78	add_personpage
307	Can change person page	78	change_personpage
308	Can delete person page	78	delete_personpage
309	Can view person page	78	view_personpage
310	Can add person page related link	79	add_personpagerelatedlink
311	Can change person page related link	79	change_personpagerelatedlink
312	Can delete person page related link	79	delete_personpagerelatedlink
313	Can view person page related link	79	view_personpagerelatedlink
314	Can add person page tag	80	add_personpagetag
315	Can change person page tag	80	change_personpagetag
316	Can delete person page tag	80	delete_personpagetag
317	Can view person page tag	80	view_personpagetag
318	Can add person role	81	add_personrole
319	Can change person role	81	change_personrole
320	Can delete person role	81	delete_personrole
321	Can view person role	81	view_personrole
322	Can add product index page	82	add_productindexpage
323	Can change product index page	82	change_productindexpage
324	Can delete product index page	82	delete_productindexpage
325	Can view product index page	82	view_productindexpage
326	Can add product index page related link	83	add_productindexpagerelatedlink
327	Can change product index page related link	83	change_productindexpagerelatedlink
328	Can delete product index page related link	83	delete_productindexpagerelatedlink
329	Can view product index page related link	83	view_productindexpagerelatedlink
330	Can add product page	84	add_productpage
331	Can change product page	84	change_productpage
332	Can delete product page	84	delete_productpage
333	Can view product page	84	view_productpage
334	Can add product page related link	85	add_productpagerelatedlink
335	Can change product page related link	85	change_productpagerelatedlink
336	Can delete product page related link	85	delete_productpagerelatedlink
337	Can view product page related link	85	view_productpagerelatedlink
338	Can add product page tag	86	add_productpagetag
339	Can change product page tag	86	change_productpagetag
340	Can delete product page tag	86	delete_productpagetag
341	Can view product page tag	86	view_productpagetag
342	Can add calendar page	87	add_calendarpage
343	Can change calendar page	87	change_calendarpage
344	Can delete calendar page	87	delete_calendarpage
345	Can view calendar page	87	view_calendarpage
346	Can add cancellation	88	add_cancellationpage
347	Can change cancellation	88	change_cancellationpage
348	Can delete cancellation	88	delete_cancellationpage
349	Can view cancellation	88	view_cancellationpage
350	Can add event category	89	add_eventcategory
351	Can change event category	89	change_eventcategory
352	Can delete event category	89	delete_eventcategory
353	Can view event category	89	view_eventcategory
354	Can add extra event information	90	add_extrainfopage
355	Can change extra event information	90	change_extrainfopage
356	Can delete extra event information	90	delete_extrainfopage
357	Can view extra event information	90	view_extrainfopage
358	Can add group page	91	add_grouppage
359	Can change group page	91	change_grouppage
360	Can delete group page	91	delete_grouppage
361	Can view group page	91	view_grouppage
362	Can add multiday event page	92	add_multidayeventpage
363	Can change multiday event page	92	change_multidayeventpage
364	Can delete multiday event page	92	delete_multidayeventpage
365	Can view multiday event page	92	view_multidayeventpage
366	Can add recurring event page	93	add_recurringeventpage
367	Can change recurring event page	93	change_recurringeventpage
368	Can delete recurring event page	93	delete_recurringeventpage
369	Can view recurring event page	93	view_recurringeventpage
370	Can add event page	94	add_simpleeventpage
371	Can change event page	94	change_simpleeventpage
372	Can delete event page	94	delete_simpleeventpage
373	Can view event page	94	view_simpleeventpage
374	Can add postponement	95	add_postponementpage
375	Can change postponement	95	change_postponementpage
376	Can delete postponement	95	delete_postponementpage
377	Can view postponement	95	view_postponementpage
378	Can add general calendar page	96	add_generalcalendarpage
379	Can change general calendar page	96	change_generalcalendarpage
380	Can delete general calendar page	96	delete_generalcalendarpage
381	Can view general calendar page	96	view_generalcalendarpage
382	Can add specific calendar page	97	add_specificcalendarpage
383	Can change specific calendar page	97	change_specificcalendarpage
384	Can delete specific calendar page	97	delete_specificcalendarpage
385	Can view specific calendar page	97	view_specificcalendarpage
386	Can add postponement	98	add_reschedulemultidayeventpage
387	Can change postponement	98	change_reschedulemultidayeventpage
388	Can delete postponement	98	delete_reschedulemultidayeventpage
389	Can view postponement	98	view_reschedulemultidayeventpage
390	Can add multiday recurring event page	99	add_multidayrecurringeventpage
391	Can change multiday recurring event page	99	change_multidayrecurringeventpage
392	Can delete multiday recurring event page	99	delete_multidayrecurringeventpage
393	Can view multiday recurring event page	99	view_multidayrecurringeventpage
394	Can add uploaded image	100	add_uploadedimage
395	Can change uploaded image	100	change_uploadedimage
396	Can delete uploaded image	100	delete_uploadedimage
397	Can view uploaded image	100	view_uploadedimage
\.


--
-- Data for Name: blog_blogindexpage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.blog_blogindexpage (page_ptr_id, intro, feed_image_id) FROM stdin;
16		\N
\.


--
-- Data for Name: blog_blogindexpagerelatedlink; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.blog_blogindexpagerelatedlink (id, sort_order, link_external, title, link_document_id, link_page_id, page_id) FROM stdin;
\.


--
-- Data for Name: blog_blogpage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.blog_blogpage (page_ptr_id, intro, body, date, feed_image_id) FROM stdin;
18	<p></p><p>Lorem ipsum dolor sit amet, \nconsectetur adipiscing elit. Praesent lobortis orci ex, a interdum justo\n dapibus eu. Vestibulum sit amet risus et dolor tempor faucibus non ac \nenim. Sed et sapien gravida, sollicitudin enim at, facilisis sapien. \nNunc eget nibh ac libero tempus placerat. Duis quis turpis libero. Donec\n vel tincidunt arcu. Nulla congue at risus eget egestas.</p>	[{"type": "paragraph", "value": "<p></p><p>Lorem ipsum dolor sit amet, \\nconsectetur adipiscing elit. Praesent lobortis orci ex, a interdum justo\\n dapibus eu. Vestibulum sit amet risus et dolor tempor faucibus non ac \\nenim. Sed et sapien gravida, sollicitudin enim at, facilisis sapien. \\nNunc eget nibh ac libero tempus placerat. Duis quis turpis libero. Donec\\n vel tincidunt arcu. Nulla congue at risus eget egestas.</p>", "id": "68c44c93-1225-4fe0-b4dc-1a25cf8e41ff"}, {"type": "paragraph", "value": "<p>Ut eget sapien ut diam feugiat fringilla. Curabitur malesuada mauris \\nfelis, id blandit odio consequat vitae. Ut hendrerit hendrerit ante et \\nfermentum. Mauris aliquam varius lorem, sed feugiat justo iaculis eget. \\nEtiam ornare non neque at ultrices. Phasellus quam elit, lobortis ac \\nimperdiet vitae, scelerisque convallis felis. Fusce a vehicula orci, et \\nsemper nibh. Aenean id lacus eget odio dignissim venenatis. Cras \\nsagittis lectus diam, ut pulvinar neque venenatis in.</p>", "id": "5f1ff927-c1d7-43df-b714-048e3faa4354"}, {"type": "image", "value": 8, "id": "1b960d50-3fdc-44ec-864d-23a0998ac5c0"}, {"type": "paragraph", "value": "<p>Praesent a massa id est egestas volutpat sed vitae dolor. Class aptent \\ntaciti sociosqu ad litora torquent per conubia nostra, per inceptos \\nhimenaeos. Duis sed dolor metus. Interdum et malesuada fames ac ante \\nipsum primis in faucibus. Nunc porttitor lacus eget bibendum commodo. \\nDonec faucibus ipsum sit amet sem interdum, et sagittis tortor ornare. \\nQuisque tristique neque gravida nisi sodales mattis. Morbi malesuada \\nante nisi, vel venenatis lacus ultricies eu. Pellentesque id risus sit \\namet enim lobortis luctus. Nullam dolor purus, efficitur in massa ac, \\npellentesque pulvinar dui.</p>", "id": "416d47f8-c062-4a44-8d08-ed816bf0c7a7"}]	2019-06-14	8
17	<p></p><p>Lorem ipsum dolor sit amet, \nconsectetur adipiscing elit. Praesent lobortis orci ex, a interdum justo\n dapibus eu. Vestibulum sit amet risus et dolor tempor faucibus non ac \nenim. Sed et sapien gravida, sollicitudin enim at, facilisis sapien. \nNunc eget nibh ac libero tempus placerat. Duis quis turpis libero. Donec\n vel tincidunt arcu. Nulla congue at risus eget egestas.</p>	[{"type": "paragraph", "value": "<p></p><p>Lorem ipsum dolor sit amet, \\nconsectetur adipiscing elit. Praesent lobortis orci ex, a interdum justo\\n dapibus eu. Vestibulum sit amet risus et dolor tempor faucibus non ac \\nenim. Sed et sapien gravida, sollicitudin enim at, facilisis sapien. \\nNunc eget nibh ac libero tempus placerat. Duis quis turpis libero. Donec\\n vel tincidunt arcu. Nulla congue at risus eget egestas.</p>", "id": "68c44c93-1225-4fe0-b4dc-1a25cf8e41ff"}, {"type": "paragraph", "value": "<p>Ut eget sapien ut diam feugiat fringilla. Curabitur malesuada mauris \\nfelis, id blandit odio consequat vitae. Ut hendrerit hendrerit ante et \\nfermentum. Mauris aliquam varius lorem, sed feugiat justo iaculis eget. \\nEtiam ornare non neque at ultrices. Phasellus quam elit, lobortis ac \\nimperdiet vitae, scelerisque convallis felis. Fusce a vehicula orci, et \\nsemper nibh. Aenean id lacus eget odio dignissim venenatis. Cras \\nsagittis lectus diam, ut pulvinar neque venenatis in.</p>", "id": "5f1ff927-c1d7-43df-b714-048e3faa4354"}, {"type": "image", "value": 12, "id": "1b960d50-3fdc-44ec-864d-23a0998ac5c0"}, {"type": "paragraph", "value": "<p>Praesent a massa id est egestas volutpat sed vitae dolor. Class aptent \\ntaciti sociosqu ad litora torquent per conubia nostra, per inceptos \\nhimenaeos. Duis sed dolor metus. Interdum et malesuada fames ac ante \\nipsum primis in faucibus. Nunc porttitor lacus eget bibendum commodo. \\nDonec faucibus ipsum sit amet sem interdum, et sagittis tortor ornare. \\nQuisque tristique neque gravida nisi sodales mattis. Morbi malesuada \\nante nisi, vel venenatis lacus ultricies eu. Pellentesque id risus sit \\namet enim lobortis luctus. Nullam dolor purus, efficitur in massa ac, \\npellentesque pulvinar dui.</p>", "id": "416d47f8-c062-4a44-8d08-ed816bf0c7a7"}]	2019-06-14	12
19	<p></p><p>Lorem ipsum dolor sit amet, \nconsectetur adipiscing elit. Praesent lobortis orci ex, a interdum justo\n dapibus eu. Vestibulum sit amet risus et dolor tempor faucibus non ac \nenim. Sed et sapien gravida, sollicitudin enim at, facilisis sapien. \nNunc eget nibh ac libero tempus placerat. Duis quis turpis libero. Donec\n vel tincidunt arcu. Nulla congue at risus eget egestas.</p>	[{"type": "paragraph", "value": "<p></p><p>Lorem ipsum dolor sit amet, \\nconsectetur adipiscing elit. Praesent lobortis orci ex, a interdum justo\\n dapibus eu. Vestibulum sit amet risus et dolor tempor faucibus non ac \\nenim. Sed et sapien gravida, sollicitudin enim at, facilisis sapien. \\nNunc eget nibh ac libero tempus placerat. Duis quis turpis libero. Donec\\n vel tincidunt arcu. Nulla congue at risus eget egestas.</p>", "id": "68c44c93-1225-4fe0-b4dc-1a25cf8e41ff"}, {"type": "paragraph", "value": "<p>Ut eget sapien ut diam feugiat fringilla. Curabitur malesuada mauris \\nfelis, id blandit odio consequat vitae. Ut hendrerit hendrerit ante et \\nfermentum. Mauris aliquam varius lorem, sed feugiat justo iaculis eget. \\nEtiam ornare non neque at ultrices. Phasellus quam elit, lobortis ac \\nimperdiet vitae, scelerisque convallis felis. Fusce a vehicula orci, et \\nsemper nibh. Aenean id lacus eget odio dignissim venenatis. Cras \\nsagittis lectus diam, ut pulvinar neque venenatis in.</p>", "id": "5f1ff927-c1d7-43df-b714-048e3faa4354"}, {"type": "image", "value": 5, "id": "1b960d50-3fdc-44ec-864d-23a0998ac5c0"}, {"type": "paragraph", "value": "<p>Praesent a massa id est egestas volutpat sed vitae dolor. Class aptent \\ntaciti sociosqu ad litora torquent per conubia nostra, per inceptos \\nhimenaeos. Duis sed dolor metus. Interdum et malesuada fames ac ante \\nipsum primis in faucibus. Nunc porttitor lacus eget bibendum commodo. \\nDonec faucibus ipsum sit amet sem interdum, et sagittis tortor ornare. \\nQuisque tristique neque gravida nisi sodales mattis. Morbi malesuada \\nante nisi, vel venenatis lacus ultricies eu. Pellentesque id risus sit \\namet enim lobortis luctus. Nullam dolor purus, efficitur in massa ac, \\npellentesque pulvinar dui.</p>", "id": "416d47f8-c062-4a44-8d08-ed816bf0c7a7"}]	2019-06-14	5
\.


--
-- Data for Name: blog_blogpagecarouselitem; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.blog_blogpagecarouselitem (id, sort_order, link_external, embed_url, caption, image_id, link_document_id, link_page_id, page_id) FROM stdin;
\.


--
-- Data for Name: blog_blogpagerelatedlink; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.blog_blogpagerelatedlink (id, sort_order, link_external, title, link_document_id, link_page_id, page_id) FROM stdin;
\.


--
-- Data for Name: blog_blogpagetag; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.blog_blogpagetag (id, content_object_id, tag_id) FROM stdin;
5	18	1
6	18	2
7	17	1
8	17	2
11	19	1
12	19	2
\.


--
-- Data for Name: contact_contactformfield; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.contact_contactformfield (id, sort_order, label, field_type, required, choices, default_value, help_text, page_id) FROM stdin;
1	0	Name	singleline	t				27
2	1	Email	singleline	t				27
3	2	Subject	singleline	t				27
4	3	Message	multiline	t				27
\.


--
-- Data for Name: contact_contactpage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.contact_contactpage (page_ptr_id, to_address, from_address, subject, name_organization, telephone, email, address_1, address_2, city, country, post_code, intro, thank_you_text, telephone_2, email_2, feed_image_id) FROM stdin;
27	cclarke@chrisdev.com	support@chrisdev.com	Website Contact Form	ChrisDev	+1 868-773-4644	cclarke@chrisdev.com	A3 St Benedicts Gardens		Tunapuna	Trinidad			<p>Thanks for reaching out<br/></p>			\N
\.


--
-- Data for Name: contact_formfield; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.contact_formfield (id, sort_order, label, field_type, required, choices, default_value, help_text, page_id) FROM stdin;
\.


--
-- Data for Name: contact_formpage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.contact_formpage (page_ptr_id, to_address, from_address, subject, intro, thank_you_text, feed_image_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	wagtailcore	page
2	wagtailimages	image
3	wagtaildocs	document
4	pages	homepage
5	wagtailadmin	admin
6	admin	logentry
7	auth	permission
8	auth	group
9	contenttypes	contenttype
10	sessions	session
11	sites	site
12	account	emailaddress
13	account	emailconfirmation
14	socialaccount	socialaccount
15	socialaccount	socialapp
16	socialaccount	socialtoken
17	taggit	tag
18	taggit	taggeditem
19	wagtail_feeds	rssfeedssettings
20	events	eventindexpage
21	events	eventindexpagerelatedlink
22	events	eventpage
23	events	eventpagecarouselitem
24	events	eventpagerelatedlink
25	events	eventpagespeaker
26	events	eventpagetag
27	pages	contentblock
28	pages	faqspage
29	pages	homepagecarouselitem
30	pages	homepagecontentitem
31	pages	homepagerelatedlink
32	pages	standardindexpage
33	pages	standardindexpagerelatedlink
34	pages	standardpage
35	pages	standardpagecarouselitem
36	pages	standardpagerelatedlink
37	pages	testimonial
38	pages	advert
39	pages	socialmediasettings
40	pages	videogallerypage
41	pages	videogallerypagecarouselitem
42	pages	sitebranding
43	pages	testimonialpage
44	users	user
45	wagtailsearchpromotions	searchpromotion
46	postgres_search	indexentry
47	wagtailforms	formsubmission
48	wagtailredirects	redirect
49	wagtailembeds	embed
50	wagtailusers	userprofile
51	wagtailimages	rendition
52	wagtailsearch	query
53	wagtailsearch	querydailyhits
54	wagtailcore	grouppagepermission
55	wagtailcore	pagerevision
56	wagtailcore	pageviewrestriction
57	wagtailcore	site
58	wagtailcore	collection
59	wagtailcore	groupcollectionpermission
60	wagtailcore	collectionviewrestriction
61	blog	blogindexpage
62	blog	blogindexpagerelatedlink
63	blog	blogpage
64	blog	blogpagecarouselitem
65	blog	blogpagerelatedlink
66	blog	blogpagetag
67	contact	contactformfield
68	contact	contactpage
69	contact	formfield
70	contact	formpage
71	documents_gallery	documentsindexpage
72	documents_gallery	documentspage
73	documents_gallery	documentspagetag
74	gallery	galleryindex
75	gallery	photogalleryindexpage
76	people	personindexpage
77	people	personindexpagerelatedlink
78	people	personpage
79	people	personpagerelatedlink
80	people	personpagetag
81	people	personrole
82	products	productindexpage
83	products	productindexpagerelatedlink
84	products	productpage
85	products	productpagerelatedlink
86	products	productpagetag
87	joyous	calendarpage
88	joyous	cancellationpage
89	joyous	eventcategory
90	joyous	extrainfopage
91	joyous	grouppage
92	joyous	multidayeventpage
93	joyous	recurringeventpage
94	joyous	simpleeventpage
95	joyous	postponementpage
96	joyous	generalcalendarpage
97	joyous	specificcalendarpage
98	joyous	reschedulemultidayeventpage
99	joyous	multidayrecurringeventpage
100	wagtailimages	uploadedimage
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2019-06-14 11:01:35.921144-04
2	contenttypes	0002_remove_content_type_name	2019-06-14 11:01:35.941975-04
3	auth	0001_initial	2019-06-14 11:01:36.036188-04
4	auth	0002_alter_permission_name_max_length	2019-06-14 11:01:36.056951-04
5	auth	0003_alter_user_email_max_length	2019-06-14 11:01:36.078901-04
6	auth	0004_alter_user_username_opts	2019-06-14 11:01:36.097628-04
7	auth	0005_alter_user_last_login_null	2019-06-14 11:01:36.111915-04
8	auth	0006_require_contenttypes_0002	2019-06-14 11:01:36.11534-04
9	auth	0007_alter_validators_add_error_messages	2019-06-14 11:01:36.135688-04
10	auth	0008_alter_user_username_max_length	2019-06-14 11:01:36.151702-04
11	auth	0009_alter_user_last_name_max_length	2019-06-14 11:01:36.169977-04
12	users	0001_initial	2019-06-14 11:01:36.281518-04
13	account	0001_initial	2019-06-14 11:01:36.398537-04
14	account	0002_email_max_length	2019-06-14 11:01:36.435813-04
15	admin	0001_initial	2019-06-14 11:01:36.500148-04
16	admin	0002_logentry_remove_auto_add	2019-06-14 11:01:36.538774-04
17	admin	0003_logentry_add_action_flag_choices	2019-06-14 11:01:36.574128-04
18	wagtailcore	0001_initial	2019-06-14 11:01:37.148801-04
19	wagtailcore	0002_initial_data	2019-06-14 11:01:37.15346-04
20	wagtailcore	0003_add_uniqueness_constraint_on_group_page_permission	2019-06-14 11:01:37.158394-04
21	wagtailcore	0004_page_locked	2019-06-14 11:01:37.163339-04
22	wagtailcore	0005_add_page_lock_permission_to_moderators	2019-06-14 11:01:37.167575-04
23	wagtailcore	0006_add_lock_page_permission	2019-06-14 11:01:37.172151-04
24	wagtailcore	0007_page_latest_revision_created_at	2019-06-14 11:01:37.176561-04
25	wagtailcore	0008_populate_latest_revision_created_at	2019-06-14 11:01:37.18118-04
26	wagtailcore	0009_remove_auto_now_add_from_pagerevision_created_at	2019-06-14 11:01:37.185959-04
27	wagtailcore	0010_change_page_owner_to_null_on_delete	2019-06-14 11:01:37.190766-04
28	wagtailcore	0011_page_first_published_at	2019-06-14 11:01:37.195501-04
29	wagtailcore	0012_extend_page_slug_field	2019-06-14 11:01:37.199852-04
30	wagtailcore	0013_update_golive_expire_help_text	2019-06-14 11:01:37.20435-04
31	wagtailcore	0014_add_verbose_name	2019-06-14 11:01:37.208856-04
32	wagtailcore	0015_add_more_verbose_names	2019-06-14 11:01:37.213216-04
33	wagtailcore	0016_change_page_url_path_to_text_field	2019-06-14 11:01:37.217328-04
34	wagtailcore	0017_change_edit_page_permission_description	2019-06-14 11:01:37.263815-04
35	wagtailcore	0018_pagerevision_submitted_for_moderation_index	2019-06-14 11:01:37.310056-04
36	wagtailcore	0019_verbose_names_cleanup	2019-06-14 11:01:37.469911-04
37	wagtailcore	0020_add_index_on_page_first_published_at	2019-06-14 11:01:37.595671-04
38	wagtailcore	0021_capitalizeverbose	2019-06-14 11:01:38.605006-04
39	wagtailcore	0022_add_site_name	2019-06-14 11:01:38.638373-04
40	wagtailcore	0023_alter_page_revision_on_delete_behaviour	2019-06-14 11:01:38.703558-04
41	wagtailcore	0024_collection	2019-06-14 11:01:38.735099-04
42	wagtailcore	0025_collection_initial_data	2019-06-14 11:01:38.783041-04
43	wagtailcore	0026_group_collection_permission	2019-06-14 11:01:38.876322-04
44	taggit	0001_initial	2019-06-14 11:01:38.969755-04
45	wagtailimages	0001_initial	2019-06-14 11:01:39.300285-04
46	wagtailimages	0002_initial_data	2019-06-14 11:01:39.304997-04
47	wagtailimages	0003_fix_focal_point_fields	2019-06-14 11:01:39.309812-04
48	wagtailimages	0004_make_focal_point_key_not_nullable	2019-06-14 11:01:39.314116-04
49	wagtailimages	0005_make_filter_spec_unique	2019-06-14 11:01:39.318397-04
50	wagtailimages	0006_add_verbose_names	2019-06-14 11:01:39.322278-04
51	wagtailimages	0007_image_file_size	2019-06-14 11:01:39.325359-04
52	wagtailimages	0008_image_created_at_index	2019-06-14 11:01:39.328779-04
53	wagtailimages	0009_capitalizeverbose	2019-06-14 11:01:39.332098-04
54	wagtailimages	0010_change_on_delete_behaviour	2019-06-14 11:01:39.335445-04
55	wagtailimages	0011_image_collection	2019-06-14 11:01:39.338829-04
56	wagtailimages	0012_copy_image_permissions_to_collections	2019-06-14 11:01:39.341896-04
57	wagtailimages	0013_make_rendition_upload_callable	2019-06-14 11:01:39.345156-04
58	wagtailimages	0014_add_filter_spec_field	2019-06-14 11:01:39.348206-04
59	wagtailimages	0015_fill_filter_spec_field	2019-06-14 11:01:39.351179-04
60	wagtailimages	0016_deprecate_rendition_filter_relation	2019-06-14 11:01:39.354566-04
61	wagtailimages	0017_reduce_focal_point_key_max_length	2019-06-14 11:01:39.357897-04
62	wagtailimages	0018_remove_rendition_filter	2019-06-14 11:01:39.360957-04
63	wagtailimages	0019_delete_filter	2019-06-14 11:01:39.364209-04
64	wagtailimages	0020_add-verbose-name	2019-06-14 11:01:39.367476-04
65	wagtailimages	0021_image_file_hash	2019-06-14 11:01:39.370773-04
66	taggit	0002_auto_20150616_2121	2019-06-14 11:01:39.392727-04
67	wagtaildocs	0001_initial	2019-06-14 11:01:39.458179-04
68	wagtaildocs	0002_initial_data	2019-06-14 11:01:39.566879-04
69	wagtaildocs	0003_add_verbose_names	2019-06-14 11:01:39.827732-04
70	events	0001_initial	2019-06-14 11:01:40.380488-04
71	events	0002_auto_20151014_1415	2019-06-14 11:01:40.52474-04
72	events	0003_auto_20151021_1630	2019-06-14 11:01:41.043462-04
73	events	0004_auto_20160720_0725	2019-06-14 11:01:41.183039-04
74	events	0005_eventindexpage_feed_image	2019-06-14 11:01:41.261066-04
75	events	0006_auto_20180607_1804	2019-06-14 11:01:41.405887-04
76	wagtailcore	0027_fix_collection_path_collation	2019-06-14 11:01:41.490629-04
77	wagtailcore	0024_alter_page_content_type_on_delete_behaviour	2019-06-14 11:01:41.578102-04
78	wagtailcore	0028_merge	2019-06-14 11:01:41.582312-04
79	wagtailcore	0029_unicode_slugfield_dj19	2019-06-14 11:01:41.753083-04
80	wagtailcore	0030_index_on_pagerevision_created_at	2019-06-14 11:01:41.812961-04
81	wagtailcore	0031_add_page_view_restriction_types	2019-06-14 11:01:42.026734-04
82	wagtailcore	0032_add_bulk_delete_page_permission	2019-06-14 11:01:42.105479-04
83	wagtailcore	0033_remove_golive_expiry_help_text	2019-06-14 11:01:42.207289-04
84	wagtailcore	0034_page_live_revision	2019-06-14 11:01:42.291223-04
85	wagtailcore	0035_page_last_published_at	2019-06-14 11:01:42.359354-04
86	wagtailcore	0036_populate_page_last_published_at	2019-06-14 11:01:42.441132-04
87	wagtailcore	0037_set_page_owner_editable	2019-06-14 11:01:42.547568-04
88	wagtailcore	0038_make_first_published_at_editable	2019-06-14 11:01:42.617619-04
89	wagtailcore	0039_collectionviewrestriction	2019-06-14 11:01:42.82309-04
90	wagtailcore	0040_page_draft_title	2019-06-14 11:01:42.993638-04
91	wagtailsearch	0001_initial	2019-06-14 11:01:43.240267-04
92	wagtailsearch	0002_add_verbose_names	2019-06-14 11:01:43.441075-04
93	wagtailsearch	0003_remove_editors_pick	2019-06-14 11:01:43.521964-04
94	wagtailsearchpromotions	0001_initial	2019-06-14 11:01:43.94889-04
95	wagtailsearchpromotions	0002_capitalizeverbose	2019-06-14 11:01:44.126903-04
96	wagtailredirects	0001_initial	2019-06-14 11:01:44.22519-04
97	wagtailredirects	0002_add_verbose_names	2019-06-14 11:01:44.373525-04
98	wagtailredirects	0003_make_site_field_editable	2019-06-14 11:01:44.469421-04
99	wagtailredirects	0004_set_unique_on_path_and_site	2019-06-14 11:01:44.602551-04
100	wagtailredirects	0005_capitalizeverbose	2019-06-14 11:01:44.95255-04
101	wagtailforms	0001_initial	2019-06-14 11:01:45.049357-04
102	wagtailforms	0002_add_verbose_names	2019-06-14 11:01:45.154904-04
103	wagtailforms	0003_capitalizeverbose	2019-06-14 11:01:45.260217-04
104	wagtaildocs	0004_capitalizeverbose	2019-06-14 11:01:45.77554-04
105	wagtaildocs	0005_document_collection	2019-06-14 11:01:45.879103-04
106	wagtaildocs	0006_copy_document_permissions_to_collections	2019-06-14 11:01:45.998203-04
107	wagtaildocs	0005_alter_uploaded_by_user_on_delete_action	2019-06-14 11:01:46.08865-04
108	wagtaildocs	0007_merge	2019-06-14 11:01:46.092774-04
109	pages	0001_initial	2019-06-14 11:01:48.454419-04
110	pages	0002_create_homepage	2019-06-14 11:01:48.838806-04
111	pages	0003_advert	2019-06-14 11:01:49.010119-04
112	pages	0004_auto_20151007_1926	2019-06-14 11:01:49.131457-04
113	pages	0005_auto_20151021_1630	2019-06-14 11:01:50.669994-04
114	pages	0006_standardpage_template_string	2019-06-14 11:01:50.800894-04
115	pages	0007_socialmediasettings	2019-06-14 11:01:50.953814-04
116	pages	0008_auto_20161220_0821	2019-06-14 11:01:50.982614-04
117	pages	0009_auto_20161220_0853	2019-06-14 11:01:51.015472-04
118	pages	0008_auto_20161220_1345	2019-06-14 11:01:51.40008-04
119	pages	0010_merge_20161220_1442	2019-06-14 11:01:51.4091-04
120	pages	0011_auto_20170105_1742	2019-06-14 11:01:51.559811-04
121	pages	0012_auto_20170606_1319	2019-06-14 11:01:51.652071-04
122	pages	0013_videopage_videopagecarouselitem	2019-06-14 11:01:51.929759-04
123	pages	0014_auto_20170817_1705	2019-06-14 11:01:52.789307-04
124	pages	0015_advert_button_text	2019-06-14 11:01:52.890885-04
125	pages	0016_sitebranding	2019-06-14 11:01:53.017625-04
126	pages	0017_standardindexpage_template_string	2019-06-14 11:01:53.131197-04
127	pages	0018_auto_20171102_1809	2019-06-14 11:01:53.358062-04
128	pages	0019_auto_20171102_1856	2019-06-14 11:01:53.451514-04
129	pages	0020_auto_20180501_1341	2019-06-14 11:01:53.938043-04
130	pages	0021_auto_20180607_1434	2019-06-14 11:01:54.028343-04
131	pages	0022_auto_20180607_1804	2019-06-14 11:01:54.753515-04
132	pages	0023_auto_20180619_1705	2019-06-14 11:01:54.797507-04
133	postgres_search	0001_initial	2019-06-14 11:01:54.954226-04
134	postgres_search	0002_add_autocomplete	2019-06-14 11:01:55.137826-04
135	sessions	0001_initial	2019-06-14 11:01:55.164924-04
136	sites	0001_initial	2019-06-14 11:01:55.192611-04
137	sites	0002_alter_domain_unique	2019-06-14 11:01:55.218876-04
138	socialaccount	0001_initial	2019-06-14 11:01:55.782343-04
139	socialaccount	0002_token_max_lengths	2019-06-14 11:01:55.883175-04
140	socialaccount	0003_extra_data_default_dict	2019-06-14 11:01:55.91989-04
141	wagtail_feeds	0001_initial	2019-06-14 11:01:56.108206-04
142	wagtail_feeds	0002_rssfeedssettings_feed_image_in_content	2019-06-14 11:01:56.188444-04
143	wagtail_feeds	0003_auto_20180130_0818	2019-06-14 11:01:56.424083-04
144	wagtail_feeds	0004_auto_20180130_0948	2019-06-14 11:01:56.654908-04
145	wagtail_feeds	0005_auto_20180130_1152	2019-06-14 11:01:56.679782-04
146	wagtail_feeds	0006_auto_20180216_0933	2019-06-14 11:01:56.826018-04
147	wagtail_feeds	0007_auto_20180216_1005	2019-06-14 11:01:56.868778-04
148	wagtailadmin	0001_create_admin_access_permissions	2019-06-14 11:01:57.028873-04
149	wagtailcore	0041_group_collection_permissions_verbose_name_plural	2019-06-14 11:01:57.075361-04
150	wagtaildocs	0008_document_file_size	2019-06-14 11:01:57.128716-04
151	wagtaildocs	0009_document_verbose_name_plural	2019-06-14 11:01:57.17822-04
152	wagtaildocs	0010_document_file_hash	2019-06-14 11:01:57.237662-04
153	wagtailembeds	0001_initial	2019-06-14 11:01:57.284231-04
154	wagtailembeds	0002_add_verbose_names	2019-06-14 11:01:57.305042-04
155	wagtailembeds	0003_capitalizeverbose	2019-06-14 11:01:57.325168-04
156	wagtailembeds	0004_embed_verbose_name_plural	2019-06-14 11:01:57.346266-04
157	wagtailredirects	0006_redirect_increase_max_length	2019-06-14 11:01:57.400695-04
158	wagtailsearch	0004_querydailyhits_verbose_name_plural	2019-06-14 11:01:57.425255-04
159	wagtailusers	0001_initial	2019-06-14 11:01:57.50976-04
160	wagtailusers	0002_add_verbose_name_on_userprofile	2019-06-14 11:01:57.769053-04
161	wagtailusers	0003_add_verbose_names	2019-06-14 11:01:57.812182-04
162	wagtailusers	0004_capitalizeverbose	2019-06-14 11:01:57.980904-04
163	wagtailusers	0005_make_related_name_wagtail_specific	2019-06-14 11:01:58.076801-04
164	wagtailusers	0006_userprofile_prefered_language	2019-06-14 11:01:58.139505-04
165	wagtailusers	0007_userprofile_current_time_zone	2019-06-14 11:01:58.199041-04
166	wagtailusers	0008_userprofile_avatar	2019-06-14 11:01:58.262785-04
167	wagtailusers	0009_userprofile_verbose_name_plural	2019-06-14 11:01:58.315377-04
168	wagtailimages	0001_squashed_0021	2019-06-14 11:01:58.324133-04
169	wagtailcore	0001_squashed_0016_change_page_url_path_to_text_field	2019-06-14 11:01:58.329686-04
170	blog	0001_initial	2019-06-14 15:22:21.104517-04
171	blog	0002_auto_20151021_1630	2019-06-14 15:22:21.500712-04
172	blog	0003_auto_20160920_1219	2019-06-14 15:22:21.579917-04
173	blog	0004_auto_20161220_1345	2019-06-14 15:22:21.646485-04
174	blog	0005_auto_20170529_1723	2019-06-14 15:22:21.727097-04
175	blog	0006_auto_20170605_1414	2019-06-14 15:22:21.93003-04
176	blog	0007_blogindexpage_feed_image	2019-06-14 15:22:22.036656-04
177	blog	0008_auto_20180501_1341	2019-06-14 15:22:22.101968-04
178	blog	0009_auto_20180607_1434	2019-06-14 15:22:22.180444-04
179	blog	0010_auto_20180607_1804	2019-06-14 15:22:22.452046-04
180	contact	0001_initial	2019-06-14 15:22:22.934812-04
181	contact	0002_auto_20151229_1657	2019-06-14 15:22:23.758939-04
182	contact	0003_auto_20160816_0552	2019-06-14 15:22:24.039639-04
183	contact	0004_contactpage_telephone_2	2019-06-14 15:22:24.122601-04
184	contact	0005_contactpage_email_2	2019-06-14 15:22:24.194173-04
185	contact	0006_auto_20170907_1451	2019-06-14 15:22:24.311329-04
186	contact	0007_contactpage_feed_image	2019-06-14 15:22:24.440358-04
187	contact	0008_formpage_feed_image	2019-06-14 15:22:24.58387-04
188	contact	0009_auto_20180501_1341	2019-06-14 15:22:24.845962-04
189	contact	0010_auto_20180607_1804	2019-06-14 15:22:25.107592-04
190	documents_gallery	0001_initial	2019-06-14 15:22:25.589833-04
191	documents_gallery	0002_auto_20180607_1804	2019-06-14 15:22:26.048112-04
192	gallery	0001_initial	2019-06-14 15:22:26.182992-04
193	gallery	0002_auto_20181122_1651	2019-06-14 15:22:26.432669-04
194	people	0001_initial	2019-06-14 15:22:27.936782-04
195	people	0002_auto_20151021_1630	2019-06-14 15:22:28.379723-04
196	people	0003_personpage_telephone_2	2019-06-14 15:22:28.552865-04
197	people	0004_personpage_email_2	2019-06-14 15:22:28.732478-04
198	people	0005_personindexpage_feed_image	2019-06-14 15:22:28.987216-04
199	people	0006_auto_20180607_1804	2019-06-14 15:22:29.408282-04
200	products	0001_initial	2019-06-14 15:22:30.743808-04
201	products	0002_auto_20151021_1630	2019-06-14 15:22:31.218942-04
202	products	0003_auto_20160721_2007	2019-06-14 15:22:31.446301-04
203	products	0004_auto_20160722_1140	2019-06-14 15:22:31.811215-04
204	products	0005_auto_20160722_1148	2019-06-14 15:22:32.023963-04
205	products	0006_auto_20161220_1353	2019-06-14 15:22:32.170413-04
206	products	0007_productindexpage_feed_image	2019-06-14 15:22:32.297001-04
207	products	0008_auto_20180607_1804	2019-06-14 15:22:32.683834-04
208	wagtailembeds	0005_specify_thumbnail_url_max_length	2019-06-15 10:28:16.740922-04
209	auth	0010_alter_group_name_max_length	2019-06-16 09:02:04.668488-04
210	auth	0011_update_proxy_permissions	2019-06-16 09:02:04.894813-04
211	joyous	0001_initial	2019-06-17 11:06:16.070477-04
212	joyous	0002_auto_20180228_1449	2019-06-17 11:06:17.35379-04
213	joyous	0003_extrainfopage_extra_title	2019-06-17 11:06:17.799362-04
214	joyous	0004_auto_20180425_2355	2019-06-17 11:06:19.063161-04
215	joyous	0005_auto_20180522_1158	2019-06-17 11:06:31.457002-04
216	joyous	0006_generalcalendarpage_specificcalendarpage	2019-06-17 11:06:31.697352-04
217	joyous	0007_add_uid	2019-06-17 11:06:36.74327-04
218	joyous	0008_populate_uid	2019-06-17 11:06:40.892236-04
219	joyous	0009_alter_uid_notnull	2019-06-17 11:06:43.874019-04
220	joyous	0010_auto_20180920_1210	2019-06-17 11:06:46.476742-04
221	joyous	0011_auto_20180921_0700	2019-06-17 11:06:47.380477-04
222	joyous	0012_auto_20181231_1827	2019-06-17 11:06:49.327784-04
223	joyous	0013_auto_20190221_1152	2019-06-17 11:07:23.552449-04
224	joyous	0014_auto_20190328_0652	2019-06-17 11:07:25.981277-04
225	joyous	0015_auto_20190409_0645	2019-06-17 11:07:27.431655-04
226	users	0002_auto_20190718_1416	2019-07-29 16:08:26.095271-04
227	taggit	0003_taggeditem_add_unique_index	2020-06-08 10:00:19.179468-04
228	wagtailcore	0042_index_on_pagerevision_approved_go_live_at	2020-06-08 10:00:19.291856-04
229	wagtailcore	0043_lock_fields	2020-06-08 10:00:19.639856-04
230	wagtailcore	0044_add_unlock_grouppagepermission	2020-06-08 10:00:19.988095-04
231	wagtailcore	0045_assign_unlock_grouppagepermission	2020-06-08 10:00:20.380754-04
232	wagtailforms	0004_add_verbose_name_plural	2020-06-08 10:00:20.562208-04
233	wagtailimages	0022_uploadedimage	2020-06-08 10:00:20.72458-04
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
nc4uejin9fc642db438s68u25qvcj3jh	OWRiNzhjYjZiMGU5MzAxOTFiNzAyNjI4ZWI4ZDRjN2M1YTdlOTZkYjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxYWZiMzQzZDZiYmI1MmU4MTAwMjBlMTNlYjc0OGEwMWY3MzA3NzJjIiwiX3Nlc3Npb25fZXhwaXJ5IjowfQ==	2019-06-28 14:00:34.242739-04
efrnd5ubzblt3bgyydi39anync23nt5p	OWRiNzhjYjZiMGU5MzAxOTFiNzAyNjI4ZWI4ZDRjN2M1YTdlOTZkYjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxYWZiMzQzZDZiYmI1MmU4MTAwMjBlMTNlYjc0OGEwMWY3MzA3NzJjIiwiX3Nlc3Npb25fZXhwaXJ5IjowfQ==	2019-06-28 15:24:10.449329-04
78wuhcdywmc469mu5znrxrfjz087lt4v	OWRiNzhjYjZiMGU5MzAxOTFiNzAyNjI4ZWI4ZDRjN2M1YTdlOTZkYjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxYWZiMzQzZDZiYmI1MmU4MTAwMjBlMTNlYjc0OGEwMWY3MzA3NzJjIiwiX3Nlc3Npb25fZXhwaXJ5IjowfQ==	2019-06-29 10:15:58.262388-04
lmy3y317fnxh2napvjaebxs4ajr3sxps	NzBmNWE4ZjY5ZjA1MjIwYWEyZjNkZjM3ZjcxYmI2ZjQ3YTMyMDc5NDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1M2VlNzJjYjU3MTM3NzNjZmY4MmI2MWJkY2Y1NTkwZDEyMDFmMjVmIn0=	2019-07-01 11:18:03.435799-04
quuva7y3n66mgbgk8g3xfe9oxkphdyas	NzBmNWE4ZjY5ZjA1MjIwYWEyZjNkZjM3ZjcxYmI2ZjQ3YTMyMDc5NDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1M2VlNzJjYjU3MTM3NzNjZmY4MmI2MWJkY2Y1NTkwZDEyMDFmMjVmIn0=	2019-07-01 13:08:20.794646-04
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.django_site (id, domain, name) FROM stdin;
1	example.com	example.com
3	localhost.com	localhost.com
\.


--
-- Data for Name: documents_gallery_documentsindexpage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.documents_gallery_documentsindexpage (page_ptr_id, intro, feed_image_id) FROM stdin;
25		\N
\.


--
-- Data for Name: documents_gallery_documentspage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.documents_gallery_documentspage (page_ptr_id, feed_image_id) FROM stdin;
26	\N
\.


--
-- Data for Name: documents_gallery_documentspagetag; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.documents_gallery_documentspagetag (id, content_object_id, tag_id) FROM stdin;
1	26	3
\.


--
-- Data for Name: events_eventindexpage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.events_eventindexpage (page_ptr_id, intro, feed_image_id) FROM stdin;
\.


--
-- Data for Name: events_eventindexpagerelatedlink; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.events_eventindexpagerelatedlink (id, sort_order, link_external, title, link_document_id, link_page_id, page_id) FROM stdin;
\.


--
-- Data for Name: events_eventpage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.events_eventpage (page_ptr_id, date_from, date_to, time_from, time_to, audience, location, body, cost, signup_link, feed_image_id) FROM stdin;
\.


--
-- Data for Name: events_eventpagecarouselitem; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.events_eventpagecarouselitem (id, sort_order, link_external, embed_url, caption, image_id, link_document_id, link_page_id, page_id) FROM stdin;
\.


--
-- Data for Name: events_eventpagerelatedlink; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.events_eventpagerelatedlink (id, sort_order, link_external, title, link_document_id, link_page_id, page_id) FROM stdin;
\.


--
-- Data for Name: events_eventpagespeaker; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.events_eventpagespeaker (id, sort_order, link_external, full_name, image_id, link_document_id, link_page_id, page_id) FROM stdin;
\.


--
-- Data for Name: events_eventpagetag; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.events_eventpagetag (id, content_object_id, tag_id) FROM stdin;
\.


--
-- Data for Name: gallery_galleryindex; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.gallery_galleryindex (page_ptr_id, intro, images_per_page, order_images_by, collection_id, feed_image_id) FROM stdin;
21		20	1	2	12
22		20	1	2	10
23		20	1	2	8
24		20	1	2	5
\.


--
-- Data for Name: gallery_photogalleryindexpage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.gallery_photogalleryindexpage (page_ptr_id, intro, feed_image_id) FROM stdin;
20		\N
\.


--
-- Data for Name: joyous_calendarpage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.joyous_calendarpage (page_ptr_id, intro, default_view, view_choices) FROM stdin;
28		M	L,W,M
\.


--
-- Data for Name: joyous_cancellationpage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.joyous_cancellationpage (page_ptr_id, except_date, cancellation_title, cancellation_details, overrides_id) FROM stdin;
\.


--
-- Data for Name: joyous_eventcategory; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.joyous_eventcategory (id, code, name) FROM stdin;
\.


--
-- Data for Name: joyous_extrainfopage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.joyous_extrainfopage (page_ptr_id, except_date, extra_information, overrides_id, extra_title) FROM stdin;
\.


--
-- Data for Name: joyous_grouppage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.joyous_grouppage (page_ptr_id, content) FROM stdin;
\.


--
-- Data for Name: joyous_multidayeventpage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.joyous_multidayeventpage (page_ptr_id, time_from, time_to, location, details, website, date_from, date_to, category_id, group_page_id, image_id, tz, uid) FROM stdin;
\.


--
-- Data for Name: joyous_postponementpage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.joyous_postponementpage (cancellationpage_ptr_id, time_from, time_to, location, details, website, postponement_title, date, category_id, image_id, num_days) FROM stdin;
\.


--
-- Data for Name: joyous_recurringeventpage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.joyous_recurringeventpage (page_ptr_id, time_from, time_to, location, details, website, repeat, category_id, group_page_id, image_id, tz, uid, num_days) FROM stdin;
\.


--
-- Data for Name: joyous_simpleeventpage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.joyous_simpleeventpage (page_ptr_id, time_from, time_to, location, details, website, date, category_id, group_page_id, image_id, tz, uid) FROM stdin;
29	09:00:00	\N	ChrisDev	<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque \nvitae volutpat enim. Integer vitae tristique lacus. Mauris euismod \nligula lorem, a malesuada ex consequat nec. Donec in posuere tellus, non\n rutrum lacus. Integer volutpat lacus tortor, a ullamcorper velit \npretium vel. Proin erat quam, molestie quis viverra consequat, \nsollicitudin vel enim.</p>	https://chrisdev.com/	2019-06-29	\N	\N	12	UTC	3f56be10-6d0c-44ba-ab9b-cdf64054a19a
30	09:00:00	\N	ChrisDev	<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque \nvitae volutpat enim. Integer vitae tristique lacus. Mauris euismod \nligula lorem, a malesuada ex consequat nec. Donec in posuere tellus, non\n rutrum lacus. Integer volutpat lacus tortor, a ullamcorper velit \npretium vel. Proin erat quam, molestie quis viverra consequat, \nsollicitudin vel enim.</p>	https://chrisdev.com/	2019-08-30	\N	\N	5	UTC	3f56be10-6d0c-44ba-ab9b-cdf64054a19a
\.


--
-- Data for Name: pages_advert; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.pages_advert (id, link_external, title, text, image_id, link_document_id, link_page_id, page_id, button_text) FROM stdin;
\.


--
-- Data for Name: pages_contentblock; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.pages_contentblock (id, link_external, title, body, summary, slug, link_document_id, link_page_id, page_id) FROM stdin;
\.


--
-- Data for Name: pages_faqspage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.pages_faqspage (page_ptr_id, body) FROM stdin;
\.


--
-- Data for Name: pages_homepage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.pages_homepage (page_ptr_id, title_text, body, feed_image_id) FROM stdin;
3	<h3>Welcome to Wagtail Cookiecutter Foundation</h3>	<p>A cookiecutter template for Wagtail CMS featuring Zurb Foundation front-end framework.</p>	\N
\.


--
-- Data for Name: pages_homepagecarouselitem; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.pages_homepagecarouselitem (id, sort_order, link_external, embed_url, caption, image_id, link_document_id, link_page_id, page_id) FROM stdin;
\.


--
-- Data for Name: pages_homepagecontentitem; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.pages_homepagecontentitem (id, sort_order, link_external, title, content, summary, slug, image_id, link_document_id, link_page_id, page_id) FROM stdin;
1	0	https://foundation.zurb.com/	Foundation 6	<p>The most advanced responsive front-end framework in the world.</p>	<p><br/></p>	foundation	14	\N	\N	3
2	1		Wagtail	<p>Wagtail is an open source CMS written in Python and built on the Django framework.</p>	<p><br/></p>	wagtail	13	\N	\N	3
3	2	https://sass-lang.com/	SASS	<p>The most mature, stable, and powerful professional grade CSS extension language in the world.</p>	<p><br/></p>	sass	11	\N	\N	3
4	3	https://foundation.zurb.com/building-blocks/	Foundation Building Blocks	<p>A Library of Foundation UI Components. These \nHTML, CSS and JS snippets can be plugged into any Foundation project to \nbuild faster.</p>		foundation-building-blocks	2	\N	\N	3
5	4	https://www.ansible.com/	Ansible	<p>The simplest way to automate website Provisioning and Deployment</p>		ansible	1	\N	\N	3
6	5	https://www.postgresql.org/	PostgreSQL	<p></p><p>A powerful, open source \nobject-relational database system that has earned it a strong reputation\n for reliability, feature robustness, and performance.</p><p></p>		postgresql	9	\N	\N	3
7	6	https://www.linode.com/	Linode	<p>Instantly deploy and get High performance SSD Linux servers for all of your infrastructure needs.</p>		linode	6	\N	\N	3
\.


--
-- Data for Name: pages_homepagerelatedlink; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.pages_homepagerelatedlink (id, sort_order, link_external, title, link_document_id, link_page_id, page_id) FROM stdin;
\.


--
-- Data for Name: pages_sitebranding; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.pages_sitebranding (id, site_name, logo_id, site_id) FROM stdin;
1	ChrisDev Wagtail	3	2
\.


--
-- Data for Name: pages_socialmediasettings; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.pages_socialmediasettings (id, facebook, instagram, youtube, linkedin, github, facebook_appid, site_id, twitter) FROM stdin;
1	https://www.facebook.com/bot.chrisdev?fref=ts	\N	\N	\N	https://github.com/chrisdev	\N	2	https://twitter.com/realchrisdev
\.


--
-- Data for Name: pages_standardindexpage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.pages_standardindexpage (page_ptr_id, subtitle, intro, feed_image_id, template_string) FROM stdin;
4		<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam et \nmauris eu nibh elementum blandit varius sit amet enim. Quisque massa \nleo, ornare in mattis vitae, vehicula vestibulum diam. Phasellus id leo \nplacerat, vehicula diam nec, interdum mi. Nunc lacinia massa tristique \nnunc accumsan, eu dapibus odio feugiat. Donec varius quam dictum \nplacerat porttitor. Vivamus fermentum cursus nibh in facilisis. Aenean \nin justo auctor, faucibus risus eu, semper nisl. Ut nec suscipit nibh. \nDonec feugiat eget dui in rhoncus. Curabitur imperdiet tortor ut quam \ntempus sagittis. Morbi lectus magna, viverra ut turpis a, dapibus \nsollicitudin diam. Morbi vel urna suscipit, sodales ante id, luctus \nvelit.</p>	\N	pages/standard_index_page.html
\.


--
-- Data for Name: pages_standardindexpagerelatedlink; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.pages_standardindexpagerelatedlink (id, sort_order, link_external, title, link_document_id, link_page_id, page_id) FROM stdin;
\.


--
-- Data for Name: pages_standardpage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.pages_standardpage (page_ptr_id, subtitle, intro, body, feed_image_id, template_string) FROM stdin;
5			[{"type": "paragraph", "value": "<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam et \\nmauris eu nibh elementum blandit varius sit amet enim. Quisque massa \\nleo, ornare in mattis vitae, vehicula vestibulum diam. Phasellus id leo \\nplacerat, vehicula diam nec, interdum mi. Nunc lacinia massa tristique \\nnunc accumsan, eu dapibus odio feugiat. Donec varius quam dictum \\nplacerat porttitor. Vivamus fermentum cursus nibh in facilisis. Aenean \\nin justo auctor, faucibus risus eu, semper nisl. Ut nec suscipit nibh. \\nDonec feugiat eget dui in rhoncus. Curabitur imperdiet tortor ut quam \\ntempus sagittis. Morbi lectus magna, viverra ut turpis a, dapibus \\nsollicitudin diam. Morbi vel urna suscipit, sodales ante id, luctus \\nvelit.</p>", "id": "65155708-260d-4dd5-9219-77e7a61786f2"}, {"type": "image", "value": 12, "id": "77af103d-805d-4d09-90a6-afcb3d72c234"}, {"type": "paragraph", "value": "<p>Fusce et diam quis ipsum pulvinar euismod sit amet ac libero. Proin \\nmauris ligula, egestas at tempus non, tempor et dolor. Proin porttitor, \\nnibh quis consequat posuere, dolor eros eleifend nisi, ac semper ex \\nnulla sit amet urna. Ut venenatis eros nec gravida molestie. Integer \\nhendrerit mollis odio vitae porttitor. Sed ut elementum magna. Morbi \\nlaoreet odio lorem, eu fringilla nulla venenatis id. Duis nisl erat, \\naliquet in tortor eget, ullamcorper varius quam. Sed venenatis posuere \\nipsum, ut maximus ligula tristique fermentum. Ut eget porttitor quam. In\\n varius diam quis viverra porttutor.</p>", "id": "fcd72929-e61a-4983-8b8a-5d664ce2ae4b"}]	\N	pages/standard_page_full.html
6			[{"type": "paragraph", "value": "<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam et \\nmauris eu nibh elementum blandit varius sit amet enim. Quisque massa \\nleo, ornare in mattis vitae, vehicula vestibulum diam. Phasellus id leo \\nplacerat, vehicula diam nec, interdum mi. Nunc lacinia massa tristique \\nnunc accumsan, eu dapibus odio feugiat. Donec varius quam dictum \\nplacerat porttitor. Vivamus fermentum cursus nibh in facilisis. Aenean \\nin justo auctor, faucibus risus eu, semper nisl. Ut nec suscipit nibh. \\nDonec feugiat eget dui in rhoncus. Curabitur imperdiet tortor ut quam \\ntempus sagittis. Morbi lectus magna, viverra ut turpis a, dapibus \\nsollicitudin diam. Morbi vel urna suscipit, sodales ante id, luctus \\nvelit.</p>", "id": "1684d7df-cdbf-4c00-9f70-d109bff6357a"}, {"type": "image", "value": 5, "id": "72a8d14f-8750-4e1b-93ca-5f832d353aa4"}, {"type": "paragraph", "value": "<p>Fusce et diam quis ipsum pulvinar euismod sit amet ac libero. Proin \\nmauris ligula, egestas at tempus non, tempor et dolor. Proin porttitor, \\nnibh quis consequat posuere, dolor eros eleifend nisi, ac semper ex \\nnulla sit amet urna. Ut venenatis eros nec gravida molestie. Integer \\nhendrerit mollis odio vitae porttitor. Sed ut elementum magna. Morbi \\nlaoreet odio lorem, eu fringilla nulla venenatis id. Duis nisl erat, \\naliquet in tortor eget, ullamcorper varius quam. Sed venenatis posuere \\nipsum, ut maximus ligula tristique fermentum. Ut eget porttitor quam. In\\n varius diam quis viverra porttutor.</p>", "id": "1f2b4b3e-8a11-4b94-bd57-67961ba65993"}]	\N	pages/standard_page.html
\.


--
-- Data for Name: pages_standardpagecarouselitem; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.pages_standardpagecarouselitem (id, sort_order, link_external, embed_url, caption, image_id, link_document_id, link_page_id, page_id) FROM stdin;
\.


--
-- Data for Name: pages_standardpagerelatedlink; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.pages_standardpagerelatedlink (id, sort_order, link_external, title, link_document_id, link_page_id, page_id) FROM stdin;
\.


--
-- Data for Name: pages_testimonial; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.pages_testimonial (id, link_external, name, text, link_document_id, link_page_id, page_id, photo_id) FROM stdin;
\.


--
-- Data for Name: pages_testimonialpage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.pages_testimonialpage (page_ptr_id, intro, feed_image_id) FROM stdin;
\.


--
-- Data for Name: pages_videogallerypage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.pages_videogallerypage (page_ptr_id, intro, feed_image_id) FROM stdin;
\.


--
-- Data for Name: pages_videogallerypagecarouselitem; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.pages_videogallerypagecarouselitem (id, sort_order, link_external, embed_url, caption, image_id, link_document_id, link_page_id, page_id) FROM stdin;
\.


--
-- Data for Name: people_personindexpage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.people_personindexpage (page_ptr_id, subtitle, intro, feed_image_id) FROM stdin;
7		<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam et \nmauris eu nibh elementum blandit varius sit amet enim. Quisque massa \nleo, ornare in mattis vitae, vehicula vestibulum diam. Phasellus id leo \nplacerat, vehicula diam nec, interdum mi. Nunc lacinia massa tristique \nnunc accumsan, eu dapibus odio feugiat. Donec varius quam dictum \nplacerat porttitor.</p>	\N
\.


--
-- Data for Name: people_personindexpagerelatedlink; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.people_personindexpagerelatedlink (id, sort_order, link_external, title, link_document_id, link_page_id, page_id) FROM stdin;
\.


--
-- Data for Name: people_personpage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.people_personpage (page_ptr_id, name_organization, telephone, email, address_1, address_2, city, country, post_code, intro, biography, feed_image_id, image_id, role_id, telephone_2, email_2) FROM stdin;
8										<p>\n  \t\t<p><p>Lorem ipsum dolor sit amet, consectetur \nadipiscing elit. Aliquam et mauris eu nibh elementum blandit varius sit \namet enim. Quisque massa leo, ornare in mattis vitae, vehicula \nvestibulum diam. Phasellus id leo placerat, vehicula diam nec, interdum \nmi. Nunc lacinia massa tristique nunc accumsan, eu dapibus odio feugiat.\n Donec varius quam dictum placerat porttitor. Vivamus fermentum cursus \nnibh in facilisis. Aenean in justo auctor, faucibus risus eu, semper \nnisl. Ut nec suscipit nibh. Donec feugiat eget dui in rhoncus. Curabitur\n imperdiet tortor ut quam tempus sagittis. Morbi lectus magna, viverra \nut turpis a, dapibus sollicitudin diam. Morbi vel urna suscipit, sodales\n ante id, luctus velit.</p><p>Fusce et diam quis ipsum pulvinar euismod \nsit amet ac libero. Proin mauris ligula, egestas at tempus non, tempor \net dolor. Proin porttitor, nibh quis consequat posuere, dolor eros \neleifend nisi, ac semper ex nulla sit amet urna. Ut venenatis eros nec \ngravida molestie. Integer hendrerit mollis odio vitae porttitor. Sed ut \nelementum magna. Morbi laoreet odio lorem, eu fringilla nulla venenatis \nid. Duis nisl erat, aliquet in tortor eget, ullamcorper varius quam. Sed\n venenatis posuere ipsum, ut maximus ligula tristique fermentum. Ut eget\n porttitor quam. In varius diam quis viverra porttutor.</p></p>\n\t</p>	\N	7	\N		
9										<p>\n  \t\t<p><p>Lorem ipsum dolor sit amet, consectetur \nadipiscing elit. Aliquam et mauris eu nibh elementum blandit varius sit \namet enim. Quisque massa leo, ornare in mattis vitae, vehicula \nvestibulum diam. Phasellus id leo placerat, vehicula diam nec, interdum \nmi. Nunc lacinia massa tristique nunc accumsan, eu dapibus odio feugiat.\n Donec varius quam dictum placerat porttitor. Vivamus fermentum cursus \nnibh in facilisis. Aenean in justo auctor, faucibus risus eu, semper \nnisl. Ut nec suscipit nibh. Donec feugiat eget dui in rhoncus. Curabitur\n imperdiet tortor ut quam tempus sagittis. Morbi lectus magna, viverra \nut turpis a, dapibus sollicitudin diam. Morbi vel urna suscipit, sodales\n ante id, luctus velit.</p><p>Fusce et diam quis ipsum pulvinar euismod \nsit amet ac libero. Proin mauris ligula, egestas at tempus non, tempor \net dolor. Proin porttitor, nibh quis consequat posuere, dolor eros \neleifend nisi, ac semper ex nulla sit amet urna. Ut venenatis eros nec \ngravida molestie. Integer hendrerit mollis odio vitae porttitor. Sed ut \nelementum magna. Morbi laoreet odio lorem, eu fringilla nulla venenatis \nid. Duis nisl erat, aliquet in tortor eget, ullamcorper varius quam. Sed\n venenatis posuere ipsum, ut maximus ligula tristique fermentum. Ut eget\n porttitor quam. In varius diam quis viverra porttutor.</p></p>\n\t</p>	\N	7	\N		
10										<p>\n  \t\t<p><p>Lorem ipsum dolor sit amet, consectetur \nadipiscing elit. Aliquam et mauris eu nibh elementum blandit varius sit \namet enim. Quisque massa leo, ornare in mattis vitae, vehicula \nvestibulum diam. Phasellus id leo placerat, vehicula diam nec, interdum \nmi. Nunc lacinia massa tristique nunc accumsan, eu dapibus odio feugiat.\n Donec varius quam dictum placerat porttitor. Vivamus fermentum cursus \nnibh in facilisis. Aenean in justo auctor, faucibus risus eu, semper \nnisl. Ut nec suscipit nibh. Donec feugiat eget dui in rhoncus. Curabitur\n imperdiet tortor ut quam tempus sagittis. Morbi lectus magna, viverra \nut turpis a, dapibus sollicitudin diam. Morbi vel urna suscipit, sodales\n ante id, luctus velit.</p><p>Fusce et diam quis ipsum pulvinar euismod \nsit amet ac libero. Proin mauris ligula, egestas at tempus non, tempor \net dolor. Proin porttitor, nibh quis consequat posuere, dolor eros \neleifend nisi, ac semper ex nulla sit amet urna. Ut venenatis eros nec \ngravida molestie. Integer hendrerit mollis odio vitae porttitor. Sed ut \nelementum magna. Morbi laoreet odio lorem, eu fringilla nulla venenatis \nid. Duis nisl erat, aliquet in tortor eget, ullamcorper varius quam. Sed\n venenatis posuere ipsum, ut maximus ligula tristique fermentum. Ut eget\n porttitor quam. In varius diam quis viverra porttutor.</p></p>\n\t</p>	\N	7	\N		
11										<p>\n  \t\t<p><p>Lorem ipsum dolor sit amet, consectetur \nadipiscing elit. Aliquam et mauris eu nibh elementum blandit varius sit \namet enim. Quisque massa leo, ornare in mattis vitae, vehicula \nvestibulum diam. Phasellus id leo placerat, vehicula diam nec, interdum \nmi. Nunc lacinia massa tristique nunc accumsan, eu dapibus odio feugiat.\n Donec varius quam dictum placerat porttitor. Vivamus fermentum cursus \nnibh in facilisis. Aenean in justo auctor, faucibus risus eu, semper \nnisl. Ut nec suscipit nibh. Donec feugiat eget dui in rhoncus. Curabitur\n imperdiet tortor ut quam tempus sagittis. Morbi lectus magna, viverra \nut turpis a, dapibus sollicitudin diam. Morbi vel urna suscipit, sodales\n ante id, luctus velit.</p><p>Fusce et diam quis ipsum pulvinar euismod \nsit amet ac libero. Proin mauris ligula, egestas at tempus non, tempor \net dolor. Proin porttitor, nibh quis consequat posuere, dolor eros \neleifend nisi, ac semper ex nulla sit amet urna. Ut venenatis eros nec \ngravida molestie. Integer hendrerit mollis odio vitae porttitor. Sed ut \nelementum magna. Morbi laoreet odio lorem, eu fringilla nulla venenatis \nid. Duis nisl erat, aliquet in tortor eget, ullamcorper varius quam. Sed\n venenatis posuere ipsum, ut maximus ligula tristique fermentum. Ut eget\n porttitor quam. In varius diam quis viverra porttutor.</p></p>\n\t</p>	\N	7	\N		
\.


--
-- Data for Name: people_personpagerelatedlink; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.people_personpagerelatedlink (id, sort_order, link_external, title, link_document_id, link_page_id, page_id) FROM stdin;
\.


--
-- Data for Name: people_personpagetag; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.people_personpagetag (id, content_object_id, tag_id) FROM stdin;
\.


--
-- Data for Name: people_personrole; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.people_personrole (id, name) FROM stdin;
\.


--
-- Data for Name: postgres_search_indexentry; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.postgres_search_indexentry (id, object_id, body, content_type_id, autocomplete) FROM stdin;
23	4		32	'index':2B 'standard':1B
26	5	'ac':115,137 'accumsan':44 'adipisc':7 'aenean':61 'aliquam':9 'aliquet':172 'amet':5,18,114,142 'ant':102 'auctor':64 'blandit':15 'consectetur':6 'consequat':131 'curabitur':80 'cursus':57 'dapibus':46,94 'diam':29,35,96,108,194 'dictum':52 'dolor':3,126,133 'donec':49,74 'dui':77,169 'egesta':120 'eget':76,175,189 'eleifend':135 'elementum':14,158 'elit':8 'enim':19 'erat':171 'ero':134,146 'et':10,107,125 'eu':12,45,67,164 'euismod':112 'ex':139 'facilisi':60 'faucibus':65 'fermentum':56,187 'feugiat':48,75 'fringilla':165 'fusc':106 'gravida':148 'hendrerit':151 'id':31,103,168 'imperdiet':81 'integ':150 'interdum':37 'ipsum':2,110,182 'justo':63 'lacinia':40 'laoreet':161 'lectus':88 'leo':22,32 'libero':116 'ligula':119,185 'lorem':1,163 'luctus':104 'magna':89,159 'massa':21,41 'matti':25 'mauri':11,118 'maximus':184 'mi':38 'molesti':149 'molli':152 'morbi':87,97,160 'nec':36,71,147 'nibh':13,58,73,129 'nisi':136 'nisl':69,170 'non':123 'nulla':140,166 'nunc':39,43 'odio':47,153,162 'ornar':23 'phasellus':30 'placerat':33,53 'porttitor':54,128,155,190 'porttutor':197 'posuer':132,181 'proin':117,127 'pulvinar':111 'quam':51,84,178,191 'qui':109,130,195 'quisqu':20 'rhoncus':79 'risus':66 'sagitti':86 'sed':156,179 'semper':68,138 'sit':4,17,113,141 'sodal':101 'sollicitudin':95 'suscipit':72,100 'tempor':124 'tempus':85,122 'tortor':82,174 'tristiqu':42,186 'turpi':92 'ullamcorp':176 'urna':99,143 'ut':70,83,91,144,157,183,188 'varius':16,50,177,193 'vehicula':27,34 'vel':98 'velit':105 'venenati':145,167,180 'vestibulum':28 'vita':26,154 'vivamus':55 'viverra':90,196	34	'page':2B 'sidebar':4B 'standard':1B 'w/o':3B
32	7		76	'index':2B 'person':1B
35	8		78	'1':3B 'page':2B 'person':1B
38	9		78	'2':3B 'page':2B 'person':1B
41	10		78	'3':3B 'page':2B 'person':1B
44	11		78	'4':3B 'page':2B 'person':1B
3	1		2	'ansible.png':1A
4	2		2	'bulding-blocks.png':1A
5	3		2	'chrisdevf_favicon.png':1A
6	4		2	'digital_ocean.png':1A
7	5		2	'foundation.jpg':1A
8	6		2	'linode.png':1A
9	7		2	'placeholder_person.png':1A
10	8		2	'postgresql.jpg':1A
11	9		2	'postgresql.png':1A
12	10		2	'sass.jpg':1A
13	11		2	'sass.png':1A
14	12		2	'wagtail.jpg':1A
15	13		2	'wagtail.png':1A
16	14		2	'yeti.png':1A
63	16		61	'blog':1B 'index':2B
125	27		68	'contact':1B 'us':2B
119	25		71	'document':1B 'galleri':2B
122	26		72	'document':2B 'sampl':1B
89	20		75	'galleri':2B 'photo':1B
92	21		74	'1':2B 'galleri':1B
95	22		74	'2':2B 'galleri':1B
100	23		74	'3':2B 'galleri':1B
105	24		74	'4':2B 'galleri':1B
110	1		3	'doc':2A 'document.doc':1A
111	2		3	'doc':2A 'example.docx':1A
112	3		3	'doc':2A 'sample.pdf':1A
66	17	'ac':27,41,100,160,213 'ad':143 'adipisc':7 'aenean':113 'aliquam':82 'amet':5,20,176,203 'ant':78,161,192 'aptent':140 'arcu':52 'bibendum':170 'blandit':71 'class':139 'commodo':171 'congu':54 'consectetur':6 'consequat':73 'conubia':147 'conval':104 'cras':120 'curabitur':66 'dapibus':16 'diam':63,123 'dignissim':118 'dolor':3,23,138,154,208 'donec':49,172 'dui':45,152,216 'efficitur':210 'egesta':58,134 'eget':39,57,60,89,116,169 'elit':8,98 'enim':28,34,204 'est':133 'et':22,30,79,110,157,179 'etiam':90 'eu':17,198 'ex':12 'facilisi':36 'fame':159 'faucibus':25,165,173 'feli':69,105 'fermentum':80 'feugiat':64,86 'fringilla':65 'fusc':106 'gravida':32,186 'hendrerit':76,77 'himenaeo':151 'iaculi':88 'id':70,114,132,200 'imperdiet':101 'incepto':150 'interdum':14,156,178 'ipsum':2,162,174 'justo':15,87 'lacus':115,168,196 'lectus':122 'libero':42,48 'litora':144 'loborti':10,99,205 'lorem':1,84 'luctus':206 'malesuada':67,158,191 'massa':131,212 'matti':189 'mauri':68,81 'metus':155 'morbi':190 'nequ':93,126,185 'nibh':40,112 'nisi':187,193 'non':26,92 'nostra':148 'nulla':53 'nullam':207 'nunc':38,166 'odio':72,117 'orci':11,109 'ornar':91,182 'pellentesqu':199,214 'per':146,149 'phasellus':96 'placerat':44 'porttitor':167 'praesent':9,129 'primi':163 'pulvinar':125,215 'purus':209 'quam':97 'qui':46 'quisqu':183 'risus':21,56,201 'sagitti':121,180 'sapien':31,37,61 'scelerisqu':103 'sed':29,85,136,153 'sem':177 'semper':111 'sit':4,19,175,202 'sociosqu':142 'sodal':188 'sollicitudin':33 'taciti':141 'tempor':24 'tempus':43 'tincidunt':51 'torquent':145 'tortor':181 'tristiqu':184 'turpi':47 'ultric':95 'ultrici':197 'ut':59,62,75,124 'varius':83 'vehicula':108 'vel':50,194 'venenati':119,127,195 'vestibulum':18 'vita':74,102,137 'volutpat':135	63	'1':3B 'blog':1B 'page':2B
1	3		4	'homepag':1B
69	18	'ac':27,41,100,160,213 'ad':143 'adipisc':7 'aenean':113 'aliquam':82 'amet':5,20,176,203 'ant':78,161,192 'aptent':140 'arcu':52 'bibendum':170 'blandit':71 'class':139 'commodo':171 'congu':54 'consectetur':6 'consequat':73 'conubia':147 'conval':104 'cras':120 'curabitur':66 'dapibus':16 'diam':63,123 'dignissim':118 'dolor':3,23,138,154,208 'donec':49,172 'dui':45,152,216 'efficitur':210 'egesta':58,134 'eget':39,57,60,89,116,169 'elit':8,98 'enim':28,34,204 'est':133 'et':22,30,79,110,157,179 'etiam':90 'eu':17,198 'ex':12 'facilisi':36 'fame':159 'faucibus':25,165,173 'feli':69,105 'fermentum':80 'feugiat':64,86 'fringilla':65 'fusc':106 'gravida':32,186 'hendrerit':76,77 'himenaeo':151 'iaculi':88 'id':70,114,132,200 'imperdiet':101 'incepto':150 'interdum':14,156,178 'ipsum':2,162,174 'justo':15,87 'lacus':115,168,196 'lectus':122 'libero':42,48 'litora':144 'loborti':10,99,205 'lorem':1,84 'luctus':206 'malesuada':67,158,191 'massa':131,212 'matti':189 'mauri':68,81 'metus':155 'morbi':190 'nequ':93,126,185 'nibh':40,112 'nisi':187,193 'non':26,92 'nostra':148 'nulla':53 'nullam':207 'nunc':38,166 'odio':72,117 'orci':11,109 'ornar':91,182 'pellentesqu':199,214 'per':146,149 'phasellus':96 'placerat':44 'porttitor':167 'praesent':9,129 'primi':163 'pulvinar':125,215 'purus':209 'quam':97 'qui':46 'quisqu':183 'risus':21,56,201 'sagitti':121,180 'sapien':31,37,61 'scelerisqu':103 'sed':29,85,136,153 'sem':177 'semper':111 'sit':4,19,175,202 'sociosqu':142 'sodal':188 'sollicitudin':33 'taciti':141 'tempor':24 'tempus':43 'tincidunt':51 'torquent':145 'tortor':181 'tristiqu':184 'turpi':47 'ultric':95 'ultrici':197 'ut':59,62,75,124 'varius':83 'vehicula':108 'vel':50,194 'venenati':119,127,195 'vestibulum':18 'vita':74,102,137 'volutpat':135	63	'2':3B 'blog':1B 'page':2B
76	19	'ac':27,41,100,160,213 'ad':143 'adipisc':7 'aenean':113 'aliquam':82 'amet':5,20,176,203 'ant':78,161,192 'aptent':140 'arcu':52 'bibendum':170 'blandit':71 'class':139 'commodo':171 'congu':54 'consectetur':6 'consequat':73 'conubia':147 'conval':104 'cras':120 'curabitur':66 'dapibus':16 'diam':63,123 'dignissim':118 'dolor':3,23,138,154,208 'donec':49,172 'dui':45,152,216 'efficitur':210 'egesta':58,134 'eget':39,57,60,89,116,169 'elit':8,98 'enim':28,34,204 'est':133 'et':22,30,79,110,157,179 'etiam':90 'eu':17,198 'ex':12 'facilisi':36 'fame':159 'faucibus':25,165,173 'feli':69,105 'fermentum':80 'feugiat':64,86 'fringilla':65 'fusc':106 'gravida':32,186 'hendrerit':76,77 'himenaeo':151 'iaculi':88 'id':70,114,132,200 'imperdiet':101 'incepto':150 'interdum':14,156,178 'ipsum':2,162,174 'justo':15,87 'lacus':115,168,196 'lectus':122 'libero':42,48 'litora':144 'loborti':10,99,205 'lorem':1,84 'luctus':206 'malesuada':67,158,191 'massa':131,212 'matti':189 'mauri':68,81 'metus':155 'morbi':190 'nequ':93,126,185 'nibh':40,112 'nisi':187,193 'non':26,92 'nostra':148 'nulla':53 'nullam':207 'nunc':38,166 'odio':72,117 'orci':11,109 'ornar':91,182 'pellentesqu':199,214 'per':146,149 'phasellus':96 'placerat':44 'porttitor':167 'praesent':9,129 'primi':163 'pulvinar':125,215 'purus':209 'quam':97 'qui':46 'quisqu':183 'risus':21,56,201 'sagitti':121,180 'sapien':31,37,61 'scelerisqu':103 'sed':29,85,136,153 'sem':177 'semper':111 'sit':4,19,175,202 'sociosqu':142 'sodal':188 'sollicitudin':33 'taciti':141 'tempor':24 'tempus':43 'tincidunt':51 'torquent':145 'tortor':181 'tristiqu':184 'turpi':47 'ultric':95 'ultrici':197 'ut':59,62,75,124 'varius':83 'vehicula':108 'vel':50,194 'venenati':119,127,195 'vestibulum':18 'vita':74,102,137 'volutpat':135	63	'3':3B 'blog':1B 'page':2B
29	6	'ac':115,137 'accumsan':44 'adipisc':7 'aenean':61 'aliquam':9 'aliquet':172 'amet':5,18,114,142 'ant':102 'auctor':64 'blandit':15 'consectetur':6 'consequat':131 'curabitur':80 'cursus':57 'dapibus':46,94 'diam':29,35,96,108,194 'dictum':52 'dolor':3,126,133 'donec':49,74 'dui':77,169 'egesta':120 'eget':76,175,189 'eleifend':135 'elementum':14,158 'elit':8 'enim':19 'erat':171 'ero':134,146 'et':10,107,125 'eu':12,45,67,164 'euismod':112 'ex':139 'facilisi':60 'faucibus':65 'fermentum':56,187 'feugiat':48,75 'fringilla':165 'fusc':106 'gravida':148 'hendrerit':151 'id':31,103,168 'imperdiet':81 'integ':150 'interdum':37 'ipsum':2,110,182 'justo':63 'lacinia':40 'laoreet':161 'lectus':88 'leo':22,32 'libero':116 'ligula':119,185 'lorem':1,163 'luctus':104 'magna':89,159 'massa':21,41 'matti':25 'mauri':11,118 'maximus':184 'mi':38 'molesti':149 'molli':152 'morbi':87,97,160 'nec':36,71,147 'nibh':13,58,73,129 'nisi':136 'nisl':69,170 'non':123 'nulla':140,166 'nunc':39,43 'odio':47,153,162 'ornar':23 'phasellus':30 'placerat':33,53 'porttitor':54,128,155,190 'porttutor':197 'posuer':132,181 'proin':117,127 'pulvinar':111 'quam':51,84,178,191 'qui':109,130,195 'quisqu':20 'rhoncus':79 'risus':66 'sagitti':86 'sed':156,179 'semper':68,138 'sit':4,17,113,141 'sodal':101 'sollicitudin':95 'suscipit':72,100 'tempor':124 'tempus':85,122 'tortor':82,174 'tristiqu':42,186 'turpi':92 'ullamcorp':176 'urna':99,143 'ut':70,83,91,144,157,183,188 'varius':16,50,177,193 'vehicula':27,34 'vel':98 'velit':105 'venenati':145,167,180 'vestibulum':28 'vita':26,154 'vivamus':55 'viverra':90,196	34	'page':2B 'standard':1B
172	1		1	'root':1B
174	28		87	'calendar':1B
178	29	'adipisc':8 'amet':6 'chrisdev':1 'consectetur':7 'consequat':25,49 'dolor':4 'donec':27 'elit':9 'enim':13,52 'erat':44 'euismod':19 'ex':24 'integ':14,34 'ipsum':3 'lacus':17,33,36 'ligula':20 'lorem':2,21 'malesuada':23 'mauri':18 'molesti':46 'nec':26 'non':31 'pellentesqu':10 'posuer':29 'pretium':41 'proin':43 'quam':45 'qui':47 'rutrum':32 'sit':5 'sollicitudin':50 'tellus':30 'tortor':37 'tristiqu':16 'ullamcorp':39 'vel':42,51 'velit':40 'vita':11,15 'viverra':48 'volutpat':12,35	94	'1':2B 'event':1B
185	30	'adipisc':8 'amet':6 'chrisdev':1 'consectetur':7 'consequat':25,49 'dolor':4 'donec':27 'elit':9 'enim':13,52 'erat':44 'euismod':19 'ex':24 'integ':14,34 'ipsum':3 'lacus':17,33,36 'ligula':20 'lorem':2,21 'malesuada':23 'mauri':18 'molesti':46 'nec':26 'non':31 'pellentesqu':10 'posuer':29 'pretium':41 'proin':43 'quam':45 'qui':47 'rutrum':32 'sit':5 'sollicitudin':50 'tellus':30 'tortor':37 'tristiqu':16 'ullamcorp':39 'vel':42,51 'velit':40 'vita':11,15 'viverra':48 'volutpat':12,35	94	'2':2B 'event':1B
\.


--
-- Data for Name: products_productindexpage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.products_productindexpage (page_ptr_id, subtitle, intro, feed_image_id) FROM stdin;
\.


--
-- Data for Name: products_productindexpagerelatedlink; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.products_productindexpagerelatedlink (id, sort_order, link_external, title, link_document_id, link_page_id, page_id) FROM stdin;
\.


--
-- Data for Name: products_productpage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.products_productpage (page_ptr_id, price, description, feed_image_id, image_id, intro, link_demo) FROM stdin;
\.


--
-- Data for Name: products_productpagerelatedlink; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.products_productpagerelatedlink (id, sort_order, link_external, title, link_document_id, link_page_id, page_id) FROM stdin;
\.


--
-- Data for Name: products_productpagetag; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.products_productpagetag (id, content_object_id, tag_id) FROM stdin;
\.


--
-- Data for Name: socialaccount_socialaccount; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.socialaccount_socialaccount (id, provider, uid, last_login, date_joined, extra_data, user_id) FROM stdin;
\.


--
-- Data for Name: socialaccount_socialapp; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.socialaccount_socialapp (id, provider, name, client_id, secret, key) FROM stdin;
\.


--
-- Data for Name: socialaccount_socialapp_sites; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.socialaccount_socialapp_sites (id, socialapp_id, site_id) FROM stdin;
\.


--
-- Data for Name: socialaccount_socialtoken; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.socialaccount_socialtoken (id, token, token_secret, expires_at, account_id, app_id) FROM stdin;
\.


--
-- Data for Name: taggit_tag; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.taggit_tag (id, name, slug) FROM stdin;
1	article	article
2	blog	blog
3	docs	docs
\.


--
-- Data for Name: taggit_taggeditem; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.taggit_taggeditem (id, object_id, content_type_id, tag_id) FROM stdin;
1	1	3	3
2	2	3	3
3	3	3	3
\.


--
-- Data for Name: users_user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.users_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined, name, address, city, state, country_of_residence, country_of_nationality, job, organisation, tos) FROM stdin;
2	pbkdf2_sha256$120000$eI7ZxMYHPEta$pC9LVzvOUaSSUhGht5MTX3/aeNh35T+auNFppYfgUio=	\N	f	cclarke			cclarke@chrisdev.com	f	t	2019-06-14 11:07:05.778726-04					TT	TT			t
1	pbkdf2_sha256$150000$RNEjbWQhtHSq$dPS14A7lL8Tw6cxCQhgqM0vwwrWfvYSuZAzLdRRkgwY=	2019-06-17 13:08:20.746166-04	t	admin	Lendl	Smith	lendl.smith@gmail.com	t	t	2019-06-14 11:02:31.218591-04					TT	TT			t
\.


--
-- Data for Name: users_user_groups; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.users_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: users_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.users_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: wagtail_feeds_rssfeedssettings; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.wagtail_feeds_rssfeedssettings (id, feed_app_label, feed_model_name, feed_title, feed_link, feed_description, feed_author_email, feed_author_link, feed_item_description_field, feed_item_content_field, site_id, feed_image_in_content, feed_item_date_field, is_feed_item_date_field_datetime) FROM stdin;
1	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	t		f
\.


--
-- Data for Name: wagtailcore_collection; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.wagtailcore_collection (id, path, depth, numchild, name) FROM stdin;
2	00010001	2	0	Gallery
1	0001	1	1	Root
\.


--
-- Data for Name: wagtailcore_collectionviewrestriction; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.wagtailcore_collectionviewrestriction (id, restriction_type, password, collection_id) FROM stdin;
\.


--
-- Data for Name: wagtailcore_collectionviewrestriction_groups; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.wagtailcore_collectionviewrestriction_groups (id, collectionviewrestriction_id, group_id) FROM stdin;
\.


--
-- Data for Name: wagtailcore_groupcollectionpermission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.wagtailcore_groupcollectionpermission (id, collection_id, group_id, permission_id) FROM stdin;
1	1	1	1
2	1	2	1
3	1	1	2
4	1	2	2
5	1	1	4
6	1	2	4
7	1	1	5
8	1	2	5
\.


--
-- Data for Name: wagtailcore_grouppagepermission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.wagtailcore_grouppagepermission (id, permission_type, group_id, page_id) FROM stdin;
1	add	1	1
2	edit	1	1
3	publish	1	1
4	add	2	1
5	edit	2	1
6	lock	1	1
7	unlock	1	1
\.


--
-- Data for Name: wagtailcore_page; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.wagtailcore_page (id, path, depth, numchild, title, slug, live, has_unpublished_changes, url_path, seo_title, show_in_menus, search_description, go_live_at, expire_at, expired, content_type_id, owner_id, locked, latest_revision_created_at, first_published_at, live_revision_id, last_published_at, draft_title, locked_at, locked_by_id) FROM stdin;
1	0001	1	1	Root	root	t	f	/		f		\N	\N	f	1	\N	f	\N	\N	\N	\N	Root	\N	\N
5	0001000100010001	4	0	Standard Page w/o Sidebar	standard-page-wo-sidebar	t	f	/home/standard-index/standard-page-wo-sidebar/		t		\N	\N	f	34	1	f	2019-06-14 15:37:20.036076-04	2019-06-14 15:37:20.534408-04	6	2019-06-14 15:37:20.534408-04	Standard Page w/o Sidebar	\N	\N
6	0001000100010002	4	0	Standard Page	standard-page	t	f	/home/standard-index/standard-page/		t		\N	\N	f	34	1	f	2019-06-14 15:38:18.85825-04	2019-06-14 15:38:19.137801-04	7	2019-06-14 15:38:19.137801-04	Standard Page	\N	\N
8	0001000100020001	4	0	Person Page 1	person-page-1	t	f	/home/person-index/person-page-1/		f		\N	\N	f	78	1	f	2019-06-14 15:39:53.919791-04	2019-06-14 15:39:54.276647-04	9	2019-06-14 15:39:54.276647-04	Person Page 1	\N	\N
9	0001000100020002	4	0	Person Page 2	person-page-2	t	f	/home/person-index/person-page-2/		f		\N	\N	f	78	1	f	2019-06-14 15:40:08.950077-04	2019-06-14 15:40:08.950077-04	11	2019-06-14 15:40:08.950077-04	Person Page 2	\N	\N
10	0001000100020003	4	0	Person Page 3	person-page-3	t	f	/home/person-index/person-page-3/		f		\N	\N	f	78	1	f	2019-06-14 15:40:22.068617-04	2019-06-14 15:40:22.068617-04	13	2019-06-14 15:40:22.068617-04	Person Page 3	\N	\N
7	000100010002	3	4	Person Index	person-index	t	f	/home/person-index/		t		\N	\N	f	76	1	f	2019-06-14 15:39:23.78899-04	2019-06-14 15:39:24.358993-04	8	2019-06-14 15:39:24.358993-04	Person Index	\N	\N
11	0001000100020004	4	0	Person Page 4	person-page-4	t	f	/home/person-index/person-page-4/		f		\N	\N	f	78	1	f	2019-06-14 15:40:41.298604-04	2019-06-14 15:40:41.298604-04	15	2019-06-14 15:40:41.298604-04	Person Page 4	\N	\N
4	000100010001	3	2	Standard Index	standard-index	t	f	/home/standard-index/		t		\N	\N	f	32	1	f	2019-06-14 15:58:42.206048-04	2019-06-14 15:36:19.792176-04	52	2019-06-14 15:58:42.41514-04	Standard Index	\N	\N
18	0001000100050002	4	0	Blog Page 2	blog-page-2	t	f	/home/blog-index/blog-page-2/		t		\N	\N	f	63	1	f	2019-06-14 15:48:00.255415-04	2019-06-14 15:47:14.624055-04	30	2019-06-14 15:48:00.528744-04	Blog Page 2	\N	\N
3	00010001	2	7	Homepage	home	t	f	/home/		f		\N	\N	f	4	\N	f	2019-06-14 15:35:33.799951-04	2019-06-14 11:05:51.293545-04	4	2019-06-14 15:35:35.04048-04	Homepage	\N	\N
17	0001000100050001	4	0	Blog Page 1	blog-page-1	t	f	/home/blog-index/blog-page-1/		t		\N	\N	f	63	1	f	2019-06-14 15:48:27.193927-04	2019-06-14 15:47:02.49669-04	31	2019-06-14 15:48:27.620541-04	Blog Page 1	\N	\N
27	000100010008	3	0	Contact Us	contact-us	t	f	/home/contact-us/		f		\N	\N	f	68	1	f	2019-06-14 15:58:05.505996-04	2019-06-14 15:58:05.941292-04	51	2019-06-14 15:58:05.941292-04	Contact Us	\N	\N
25	000100010007	3	1	Documents Gallery	documents-gallery	t	f	/home/documents-gallery/		t		\N	\N	f	71	1	f	2019-06-14 15:54:06.60246-04	2019-06-14 15:54:07.054704-04	49	2019-06-14 15:54:07.054704-04	Documents Gallery	\N	\N
26	0001000100070001	4	0	Sample Documents	sample-documents	t	f	/home/documents-gallery/sample-documents/		f		\N	\N	f	72	1	f	2019-06-14 15:54:39.054947-04	2019-06-14 15:54:39.438012-04	50	2019-06-14 15:54:39.438012-04	Sample Documents	\N	\N
22	0001000100060002	4	0	Gallery 2	gallery-2	t	f	/home/photo-gallery/gallery-2/		f		\N	\N	f	74	1	f	2019-06-14 15:51:46.496343-04	2019-06-14 15:51:29.693357-04	40	2019-06-14 15:51:46.759257-04	Gallery 2	\N	\N
23	0001000100060003	4	0	Gallery 3	gallery-3	t	f	/home/photo-gallery/gallery-3/		f		\N	\N	f	74	1	f	2019-06-14 15:52:15.105215-04	2019-06-14 15:51:57.430389-04	43	2019-06-14 15:52:15.362927-04	Gallery 3	\N	\N
21	0001000100060001	4	0	Gallery 1	gallery-1	t	f	/home/photo-gallery/gallery-1/		f		\N	\N	f	74	1	f	2019-06-14 15:51:18.993173-04	2019-06-14 15:51:19.21253-04	37	2019-06-14 15:51:19.21253-04	Gallery 1	\N	\N
20	000100010006	3	4	Photo Gallery	photo-gallery	t	f	/home/photo-gallery/		t		\N	\N	f	75	1	f	2019-06-14 15:50:47.794336-04	2019-06-14 15:50:47.979554-04	36	2019-06-14 15:50:47.979554-04	Photo Gallery	\N	\N
24	0001000100060004	4	0	Gallery 4	gallery-4	t	f	/home/photo-gallery/gallery-4/		f		\N	\N	f	74	1	f	2019-06-14 15:52:49.01129-04	2019-06-14 15:52:28.376159-04	48	2019-06-14 15:52:49.456708-04	Gallery 4	\N	\N
16	000100010005	3	3	Blog Index	blog-index	t	f	/home/blog-index/		t		\N	\N	f	61	1	f	2019-06-14 15:45:09.09709-04	2019-06-14 15:45:09.376355-04	26	2019-06-14 15:45:09.376355-04	Blog Index	\N	\N
19	0001000100050003	4	0	Blog Page 3	blog-page-3	t	f	/home/blog-index/blog-page-3/		t		\N	\N	f	63	1	f	2019-06-14 15:49:05.1093-04	2019-06-14 15:48:39.004445-04	35	2019-06-14 15:49:05.41499-04	Blog Page 3	\N	\N
29	0001000100040001	4	0	Event 1	event-1	t	f	/home/calendar/event-1/		f		\N	\N	f	94	1	f	2019-06-17 13:10:51.173843-04	2019-06-17 11:32:12.687681-04	56	2019-06-17 13:10:53.444724-04	Event 1	\N	\N
28	000100010004	3	2	Calendar	calendar	t	f	/home/calendar/		t		\N	\N	f	87	1	f	2019-06-17 11:23:22.820909-04	2019-06-17 11:23:23.39821-04	53	2019-06-17 11:23:23.39821-04	Calendar	\N	\N
30	0001000100040002	4	0	Event 2	event-2	t	f	/home/calendar/event-2/		f		\N	\N	f	94	1	f	2019-06-17 13:12:06.62998-04	2019-06-17 13:11:24.470969-04	61	2019-06-17 13:12:09.15968-04	Event 2	\N	\N
\.


--
-- Data for Name: wagtailcore_pagerevision; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.wagtailcore_pagerevision (id, submitted_for_moderation, created_at, content_json, approved_go_live_at, page_id, user_id) FROM stdin;
1	f	2019-06-14 11:05:50.451907-04	{"pk": 3, "path": "00010001", "depth": 2, "numchild": 0, "title": "Homepage", "draft_title": "Homepage", "slug": "home", "content_type": 4, "live": true, "has_unpublished_changes": false, "url_path": "/home/", "owner": null, "seo_title": "", "show_in_menus": false, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": null, "last_published_at": null, "latest_revision_created_at": null, "live_revision": null, "title_text": "<h2>Testing Homepage<br/></h2>", "body": "<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vitae \\ntortor id libero ullamcorper bibendum. Quisque pulvinar augue id ex \\ndapibus, quis pulvinar justo facilisis. Morbi luctus mi quis finibus \\nmaximus. Donec vel mollis eros, dapibus fermentum erat. Integer \\nvenenatis venenatis est, non tincidunt augue congue ut. Proin nibh \\ndolor, tristique et tortor at, vestibulum iaculis diam. Cras sapien \\nodio, imperdiet eu leo dapibus, dignissim consectetur est. Cras in \\nblandit dui, nec laoreet odio. Nullam dapibus consectetur eleifend. \\nPellentesque et arcu malesuada, gravida turpis quis, pulvinar libero. \\nQuisque dictum erat mi, sit amet consectetur diam porta id. Aliquam \\ngravida sem id enim porttitor tempor.\\n</p>", "feed_image": null, "content_items": [], "carousel_items": [], "related_links": []}	\N	3	1
2	f	2019-06-14 15:32:04.088314-04	{"pk": 3, "path": "00010001", "depth": 2, "numchild": 0, "title": "Homepage", "draft_title": "Homepage", "slug": "home", "content_type": 4, "live": true, "has_unpublished_changes": false, "url_path": "/home/", "owner": null, "seo_title": "", "show_in_menus": false, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": "2019-06-14T15:05:51.293Z", "last_published_at": "2019-06-14T15:05:51.293Z", "latest_revision_created_at": "2019-06-14T15:05:50.451Z", "live_revision": 1, "title_text": "<h3>Welcome to Wagtail Cookiecutter Foundation</h3>", "body": "<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vitae \\ntortor id libero ullamcorper bibendum. Quisque pulvinar augue id ex \\ndapibus, quis pulvinar justo facilisis. Morbi luctus mi quis finibus \\nmaximus. Donec vel mollis eros, dapibus fermentum erat. Integer \\nvenenatis venenatis est, non tincidunt augue congue ut. Proin nibh \\ndolor, tristique et tortor at, vestibulum iaculis diam. Cras sapien \\nodio, imperdiet eu leo dapibus, dignissim consectetur est. Cras in \\nblandit dui, nec laoreet odio. Nullam dapibus consectetur eleifend. \\nPellentesque et arcu malesuada, gravida turpis quis, pulvinar libero. \\nQuisque dictum erat mi, sit amet consectetur diam porta id. Aliquam \\ngravida sem id enim porttitor tempor.\\n</p>", "feed_image": null, "content_items": [{"pk": null, "sort_order": 0, "link_external": "https://foundation.zurb.com/", "link_page": null, "link_document": null, "page": 3, "image": 14, "title": "Foundation 6", "content": "<p>The most advanced responsive front-end framework in the world.</p>", "summary": "<p><br/></p>", "slug": "foundation"}, {"pk": null, "sort_order": 1, "link_external": "", "link_page": null, "link_document": null, "page": 3, "image": 13, "title": "Wagtail", "content": "<p>Wagtail is an open source CMS written in Python and built on the Django framework.</p>", "summary": "<p><br/></p>", "slug": "wagtail"}, {"pk": null, "sort_order": 2, "link_external": "https://sass-lang.com/", "link_page": null, "link_document": null, "page": 3, "image": 11, "title": "SASS", "content": "<p>The most mature, stable, and powerful professional grade CSS extension language in the world.</p>", "summary": "<p><br/></p>", "slug": "sass"}, {"pk": null, "sort_order": 3, "link_external": "https://foundation.zurb.com/building-blocks/", "link_page": null, "link_document": null, "page": 3, "image": 2, "title": "Foundation Building Blocks", "content": "", "summary": "<p><p>A Library of Foundation UI Components. These \\nHTML, CSS and JS snippets can be plugged into any Foundation project to \\nbuild faster.</p></p>", "slug": "foundation-building-blocks"}, {"pk": null, "sort_order": 4, "link_external": "https://www.ansible.com/", "link_page": null, "link_document": null, "page": 3, "image": 1, "title": "Ansible", "content": "<p>The simplest way to automate website Provisioning and Deployment</p>", "summary": "", "slug": "ansible"}, {"pk": null, "sort_order": 5, "link_external": "https://www.postgresql.org/", "link_page": null, "link_document": null, "page": 3, "image": 9, "title": "PostgreSQL", "content": "<p><p>A powerful, open source \\nobject-relational database system that has earned it a strong reputation\\n for reliability, feature robustness, and performance.</p></p>", "summary": "", "slug": "postgresql"}, {"pk": null, "sort_order": 6, "link_external": "https://www.linode.com/", "link_page": null, "link_document": null, "page": 3, "image": 6, "title": "Linode", "content": "<p>Instantly deploy and get High performance SSD Linux servers for all of your infrastructure needs.</p>", "summary": "", "slug": "linode"}], "carousel_items": [], "related_links": []}	\N	3	1
3	f	2019-06-14 15:32:24.716651-04	{"pk": 3, "path": "00010001", "depth": 2, "numchild": 0, "title": "Homepage", "draft_title": "Homepage", "slug": "home", "content_type": 4, "live": true, "has_unpublished_changes": false, "url_path": "/home/", "owner": null, "seo_title": "", "show_in_menus": false, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": "2019-06-14T15:05:51.293Z", "last_published_at": "2019-06-14T19:32:04.698Z", "latest_revision_created_at": "2019-06-14T19:32:04.088Z", "live_revision": 2, "title_text": "<h3>Welcome to Wagtail Cookiecutter Foundation</h3>", "body": "<p>A cookiecutter template for Wagtail CMS featuring Zurb Foundation front-end framework.</p>", "feed_image": null, "content_items": [{"pk": 1, "sort_order": 0, "link_external": "https://foundation.zurb.com/", "link_page": null, "link_document": null, "page": 3, "image": 14, "title": "Foundation 6", "content": "<p>The most advanced responsive front-end framework in the world.</p>", "summary": "<p><br/></p>", "slug": "foundation"}, {"pk": 2, "sort_order": 1, "link_external": "", "link_page": null, "link_document": null, "page": 3, "image": 13, "title": "Wagtail", "content": "<p>Wagtail is an open source CMS written in Python and built on the Django framework.</p>", "summary": "<p><br/></p>", "slug": "wagtail"}, {"pk": 3, "sort_order": 2, "link_external": "https://sass-lang.com/", "link_page": null, "link_document": null, "page": 3, "image": 11, "title": "SASS", "content": "<p>The most mature, stable, and powerful professional grade CSS extension language in the world.</p>", "summary": "<p><br/></p>", "slug": "sass"}, {"pk": 4, "sort_order": 3, "link_external": "https://foundation.zurb.com/building-blocks/", "link_page": null, "link_document": null, "page": 3, "image": 2, "title": "Foundation Building Blocks", "content": "", "summary": "<p></p><p>A Library of Foundation UI Components. These \\nHTML, CSS and JS snippets can be plugged into any Foundation project to \\nbuild faster.</p><p></p>", "slug": "foundation-building-blocks"}, {"pk": 5, "sort_order": 4, "link_external": "https://www.ansible.com/", "link_page": null, "link_document": null, "page": 3, "image": 1, "title": "Ansible", "content": "<p>The simplest way to automate website Provisioning and Deployment</p>", "summary": "", "slug": "ansible"}, {"pk": 6, "sort_order": 5, "link_external": "https://www.postgresql.org/", "link_page": null, "link_document": null, "page": 3, "image": 9, "title": "PostgreSQL", "content": "<p></p><p>A powerful, open source \\nobject-relational database system that has earned it a strong reputation\\n for reliability, feature robustness, and performance.</p><p></p>", "summary": "", "slug": "postgresql"}, {"pk": 7, "sort_order": 6, "link_external": "https://www.linode.com/", "link_page": null, "link_document": null, "page": 3, "image": 6, "title": "Linode", "content": "<p>Instantly deploy and get High performance SSD Linux servers for all of your infrastructure needs.</p>", "summary": "", "slug": "linode"}], "carousel_items": [], "related_links": []}	\N	3	1
4	f	2019-06-14 15:35:33.799951-04	{"pk": 3, "path": "00010001", "depth": 2, "numchild": 0, "title": "Homepage", "draft_title": "Homepage", "slug": "home", "content_type": 4, "live": true, "has_unpublished_changes": false, "url_path": "/home/", "owner": null, "seo_title": "", "show_in_menus": false, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": "2019-06-14T15:05:51.293Z", "last_published_at": "2019-06-14T19:32:25.143Z", "latest_revision_created_at": "2019-06-14T19:32:24.716Z", "live_revision": 3, "title_text": "<h3>Welcome to Wagtail Cookiecutter Foundation</h3>", "body": "<p>A cookiecutter template for Wagtail CMS featuring Zurb Foundation front-end framework.</p>", "feed_image": null, "content_items": [{"pk": 1, "sort_order": 0, "link_external": "https://foundation.zurb.com/", "link_page": null, "link_document": null, "page": 3, "image": 14, "title": "Foundation 6", "content": "<p>The most advanced responsive front-end framework in the world.</p>", "summary": "<p><br/></p>", "slug": "foundation"}, {"pk": 2, "sort_order": 1, "link_external": "", "link_page": null, "link_document": null, "page": 3, "image": 13, "title": "Wagtail", "content": "<p>Wagtail is an open source CMS written in Python and built on the Django framework.</p>", "summary": "<p><br/></p>", "slug": "wagtail"}, {"pk": 3, "sort_order": 2, "link_external": "https://sass-lang.com/", "link_page": null, "link_document": null, "page": 3, "image": 11, "title": "SASS", "content": "<p>The most mature, stable, and powerful professional grade CSS extension language in the world.</p>", "summary": "<p><br/></p>", "slug": "sass"}, {"pk": 4, "sort_order": 3, "link_external": "https://foundation.zurb.com/building-blocks/", "link_page": null, "link_document": null, "page": 3, "image": 2, "title": "Foundation Building Blocks", "content": "<p>A Library of Foundation UI Components. These \\nHTML, CSS and JS snippets can be plugged into any Foundation project to \\nbuild faster.</p>", "summary": "", "slug": "foundation-building-blocks"}, {"pk": 5, "sort_order": 4, "link_external": "https://www.ansible.com/", "link_page": null, "link_document": null, "page": 3, "image": 1, "title": "Ansible", "content": "<p>The simplest way to automate website Provisioning and Deployment</p>", "summary": "", "slug": "ansible"}, {"pk": 6, "sort_order": 5, "link_external": "https://www.postgresql.org/", "link_page": null, "link_document": null, "page": 3, "image": 9, "title": "PostgreSQL", "content": "<p></p><p>A powerful, open source \\nobject-relational database system that has earned it a strong reputation\\n for reliability, feature robustness, and performance.</p><p></p>", "summary": "", "slug": "postgresql"}, {"pk": 7, "sort_order": 6, "link_external": "https://www.linode.com/", "link_page": null, "link_document": null, "page": 3, "image": 6, "title": "Linode", "content": "<p>Instantly deploy and get High performance SSD Linux servers for all of your infrastructure needs.</p>", "summary": "", "slug": "linode"}], "carousel_items": [], "related_links": []}	\N	3	1
10	f	2019-06-14 15:39:53.919791-04	{"pk": 9, "path": "0001000100020001", "depth": 4, "numchild": 0, "title": "Person Page 1", "draft_title": "Person Page 1", "slug": "person-page-1", "content_type": 78, "live": true, "has_unpublished_changes": false, "url_path": "/home/person-index/person-page-1/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": null, "last_published_at": null, "latest_revision_created_at": null, "live_revision": null, "name_organization": "", "telephone": "", "telephone_2": "", "email": "", "email_2": "", "address_1": "", "address_2": "", "city": "", "country": "", "post_code": "", "role": null, "intro": "", "biography": "<p>\\n  \\t\\t<p><p>Lorem ipsum dolor sit amet, consectetur \\nadipiscing elit. Aliquam et mauris eu nibh elementum blandit varius sit \\namet enim. Quisque massa leo, ornare in mattis vitae, vehicula \\nvestibulum diam. Phasellus id leo placerat, vehicula diam nec, interdum \\nmi. Nunc lacinia massa tristique nunc accumsan, eu dapibus odio feugiat.\\n Donec varius quam dictum placerat porttitor. Vivamus fermentum cursus \\nnibh in facilisis. Aenean in justo auctor, faucibus risus eu, semper \\nnisl. Ut nec suscipit nibh. Donec feugiat eget dui in rhoncus. Curabitur\\n imperdiet tortor ut quam tempus sagittis. Morbi lectus magna, viverra \\nut turpis a, dapibus sollicitudin diam. Morbi vel urna suscipit, sodales\\n ante id, luctus velit.</p><p>Fusce et diam quis ipsum pulvinar euismod \\nsit amet ac libero. Proin mauris ligula, egestas at tempus non, tempor \\net dolor. Proin porttitor, nibh quis consequat posuere, dolor eros \\neleifend nisi, ac semper ex nulla sit amet urna. Ut venenatis eros nec \\ngravida molestie. Integer hendrerit mollis odio vitae porttitor. Sed ut \\nelementum magna. Morbi laoreet odio lorem, eu fringilla nulla venenatis \\nid. Duis nisl erat, aliquet in tortor eget, ullamcorper varius quam. Sed\\n venenatis posuere ipsum, ut maximus ligula tristique fermentum. Ut eget\\n porttitor quam. In varius diam quis viverra porttutor.</p></p>\\n\\t</p>", "image": 7, "feed_image": null, "related_links": [], "tagged_items": []}	\N	9	1
9	f	2019-06-14 15:39:53.919791-04	{"pk": 8, "path": "0001000100020001", "depth": 4, "numchild": 0, "title": "Person Page 1", "draft_title": "Person Page 1", "slug": "person-page-1", "content_type": 78, "live": true, "has_unpublished_changes": false, "url_path": "/home/person-index/person-page-1/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": null, "last_published_at": null, "latest_revision_created_at": null, "live_revision": null, "name_organization": "", "telephone": "", "telephone_2": "", "email": "", "email_2": "", "address_1": "", "address_2": "", "city": "", "country": "", "post_code": "", "role": null, "intro": "", "biography": "<p>\\n  \\t\\t<p><p>Lorem ipsum dolor sit amet, consectetur \\nadipiscing elit. Aliquam et mauris eu nibh elementum blandit varius sit \\namet enim. Quisque massa leo, ornare in mattis vitae, vehicula \\nvestibulum diam. Phasellus id leo placerat, vehicula diam nec, interdum \\nmi. Nunc lacinia massa tristique nunc accumsan, eu dapibus odio feugiat.\\n Donec varius quam dictum placerat porttitor. Vivamus fermentum cursus \\nnibh in facilisis. Aenean in justo auctor, faucibus risus eu, semper \\nnisl. Ut nec suscipit nibh. Donec feugiat eget dui in rhoncus. Curabitur\\n imperdiet tortor ut quam tempus sagittis. Morbi lectus magna, viverra \\nut turpis a, dapibus sollicitudin diam. Morbi vel urna suscipit, sodales\\n ante id, luctus velit.</p><p>Fusce et diam quis ipsum pulvinar euismod \\nsit amet ac libero. Proin mauris ligula, egestas at tempus non, tempor \\net dolor. Proin porttitor, nibh quis consequat posuere, dolor eros \\neleifend nisi, ac semper ex nulla sit amet urna. Ut venenatis eros nec \\ngravida molestie. Integer hendrerit mollis odio vitae porttitor. Sed ut \\nelementum magna. Morbi laoreet odio lorem, eu fringilla nulla venenatis \\nid. Duis nisl erat, aliquet in tortor eget, ullamcorper varius quam. Sed\\n venenatis posuere ipsum, ut maximus ligula tristique fermentum. Ut eget\\n porttitor quam. In varius diam quis viverra porttutor.</p></p>\\n\\t</p>", "image": 7, "feed_image": null, "related_links": [], "tagged_items": []}	\N	8	1
11	f	2019-06-14 15:40:08.950077-04	{"pk": 9, "path": "0001000100020002", "depth": 4, "numchild": 0, "title": "Person Page 2", "draft_title": "Person Page 1", "slug": "person-page-2", "content_type": 78, "live": true, "has_unpublished_changes": false, "url_path": "/home/person-index/person-page-2/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": "2019-06-14T19:39:54.276Z", "last_published_at": "2019-06-14T19:39:54.276Z", "latest_revision_created_at": "2019-06-14T19:39:53.919Z", "live_revision": 9, "name_organization": "", "telephone": "", "telephone_2": "", "email": "", "email_2": "", "address_1": "", "address_2": "", "city": "", "country": "", "post_code": "", "role": null, "intro": "", "biography": "<p>\\n  \\t\\t<p><p>Lorem ipsum dolor sit amet, consectetur \\nadipiscing elit. Aliquam et mauris eu nibh elementum blandit varius sit \\namet enim. Quisque massa leo, ornare in mattis vitae, vehicula \\nvestibulum diam. Phasellus id leo placerat, vehicula diam nec, interdum \\nmi. Nunc lacinia massa tristique nunc accumsan, eu dapibus odio feugiat.\\n Donec varius quam dictum placerat porttitor. Vivamus fermentum cursus \\nnibh in facilisis. Aenean in justo auctor, faucibus risus eu, semper \\nnisl. Ut nec suscipit nibh. Donec feugiat eget dui in rhoncus. Curabitur\\n imperdiet tortor ut quam tempus sagittis. Morbi lectus magna, viverra \\nut turpis a, dapibus sollicitudin diam. Morbi vel urna suscipit, sodales\\n ante id, luctus velit.</p><p>Fusce et diam quis ipsum pulvinar euismod \\nsit amet ac libero. Proin mauris ligula, egestas at tempus non, tempor \\net dolor. Proin porttitor, nibh quis consequat posuere, dolor eros \\neleifend nisi, ac semper ex nulla sit amet urna. Ut venenatis eros nec \\ngravida molestie. Integer hendrerit mollis odio vitae porttitor. Sed ut \\nelementum magna. Morbi laoreet odio lorem, eu fringilla nulla venenatis \\nid. Duis nisl erat, aliquet in tortor eget, ullamcorper varius quam. Sed\\n venenatis posuere ipsum, ut maximus ligula tristique fermentum. Ut eget\\n porttitor quam. In varius diam quis viverra porttutor.</p></p>\\n\\t</p>", "image": 7, "feed_image": null, "related_links": [], "tagged_items": []}	\N	9	1
6	f	2019-06-14 15:37:20.036076-04	{"pk": 5, "path": "0001000100010001", "depth": 4, "numchild": 0, "title": "Standard Page w/o Sidebar", "draft_title": "Standard Page w/o Sidebar", "slug": "standard-page-wo-sidebar", "content_type": 34, "live": true, "has_unpublished_changes": false, "url_path": "/home/standard-index/standard-page-wo-sidebar/", "owner": 1, "seo_title": "", "show_in_menus": true, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": null, "last_published_at": null, "latest_revision_created_at": null, "live_revision": null, "subtitle": "", "intro": "", "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam et \\\\nmauris eu nibh elementum blandit varius sit amet enim. Quisque massa \\\\nleo, ornare in mattis vitae, vehicula vestibulum diam. Phasellus id leo \\\\nplacerat, vehicula diam nec, interdum mi. Nunc lacinia massa tristique \\\\nnunc accumsan, eu dapibus odio feugiat. Donec varius quam dictum \\\\nplacerat porttitor. Vivamus fermentum cursus nibh in facilisis. Aenean \\\\nin justo auctor, faucibus risus eu, semper nisl. Ut nec suscipit nibh. \\\\nDonec feugiat eget dui in rhoncus. Curabitur imperdiet tortor ut quam \\\\ntempus sagittis. Morbi lectus magna, viverra ut turpis a, dapibus \\\\nsollicitudin diam. Morbi vel urna suscipit, sodales ante id, luctus \\\\nvelit.</p>\\", \\"id\\": \\"65155708-260d-4dd5-9219-77e7a61786f2\\"}, {\\"type\\": \\"image\\", \\"value\\": 12, \\"id\\": \\"77af103d-805d-4d09-90a6-afcb3d72c234\\"}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>Fusce et diam quis ipsum pulvinar euismod sit amet ac libero. Proin \\\\nmauris ligula, egestas at tempus non, tempor et dolor. Proin porttitor, \\\\nnibh quis consequat posuere, dolor eros eleifend nisi, ac semper ex \\\\nnulla sit amet urna. Ut venenatis eros nec gravida molestie. Integer \\\\nhendrerit mollis odio vitae porttitor. Sed ut elementum magna. Morbi \\\\nlaoreet odio lorem, eu fringilla nulla venenatis id. Duis nisl erat, \\\\naliquet in tortor eget, ullamcorper varius quam. Sed venenatis posuere \\\\nipsum, ut maximus ligula tristique fermentum. Ut eget porttitor quam. In\\\\n varius diam quis viverra porttutor.</p>\\", \\"id\\": \\"fcd72929-e61a-4983-8b8a-5d664ce2ae4b\\"}]", "template_string": "pages/standard_page_full.html", "feed_image": null, "carousel_items": [], "related_links": []}	\N	5	1
7	f	2019-06-14 15:38:18.85825-04	{"pk": 6, "path": "0001000100010002", "depth": 4, "numchild": 0, "title": "Standard Page", "draft_title": "Standard Page", "slug": "standard-page", "content_type": 34, "live": true, "has_unpublished_changes": false, "url_path": "/home/standard-index/standard-page/", "owner": 1, "seo_title": "", "show_in_menus": true, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": null, "last_published_at": null, "latest_revision_created_at": null, "live_revision": null, "subtitle": "", "intro": "", "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam et \\\\nmauris eu nibh elementum blandit varius sit amet enim. Quisque massa \\\\nleo, ornare in mattis vitae, vehicula vestibulum diam. Phasellus id leo \\\\nplacerat, vehicula diam nec, interdum mi. Nunc lacinia massa tristique \\\\nnunc accumsan, eu dapibus odio feugiat. Donec varius quam dictum \\\\nplacerat porttitor. Vivamus fermentum cursus nibh in facilisis. Aenean \\\\nin justo auctor, faucibus risus eu, semper nisl. Ut nec suscipit nibh. \\\\nDonec feugiat eget dui in rhoncus. Curabitur imperdiet tortor ut quam \\\\ntempus sagittis. Morbi lectus magna, viverra ut turpis a, dapibus \\\\nsollicitudin diam. Morbi vel urna suscipit, sodales ante id, luctus \\\\nvelit.</p>\\", \\"id\\": \\"1684d7df-cdbf-4c00-9f70-d109bff6357a\\"}, {\\"type\\": \\"image\\", \\"value\\": 5, \\"id\\": \\"72a8d14f-8750-4e1b-93ca-5f832d353aa4\\"}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>Fusce et diam quis ipsum pulvinar euismod sit amet ac libero. Proin \\\\nmauris ligula, egestas at tempus non, tempor et dolor. Proin porttitor, \\\\nnibh quis consequat posuere, dolor eros eleifend nisi, ac semper ex \\\\nnulla sit amet urna. Ut venenatis eros nec gravida molestie. Integer \\\\nhendrerit mollis odio vitae porttitor. Sed ut elementum magna. Morbi \\\\nlaoreet odio lorem, eu fringilla nulla venenatis id. Duis nisl erat, \\\\naliquet in tortor eget, ullamcorper varius quam. Sed venenatis posuere \\\\nipsum, ut maximus ligula tristique fermentum. Ut eget porttitor quam. In\\\\n varius diam quis viverra porttutor.</p>\\", \\"id\\": \\"1f2b4b3e-8a11-4b94-bd57-67961ba65993\\"}]", "template_string": "pages/standard_page.html", "feed_image": null, "carousel_items": [], "related_links": []}	\N	6	1
8	f	2019-06-14 15:39:23.78899-04	{"pk": 7, "path": "000100010002", "depth": 3, "numchild": 0, "title": "Person Index", "draft_title": "Person Index", "slug": "person-index", "content_type": 76, "live": true, "has_unpublished_changes": false, "url_path": "/home/person-index/", "owner": 1, "seo_title": "", "show_in_menus": true, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": null, "last_published_at": null, "latest_revision_created_at": null, "live_revision": null, "subtitle": "", "intro": "<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam et \\nmauris eu nibh elementum blandit varius sit amet enim. Quisque massa \\nleo, ornare in mattis vitae, vehicula vestibulum diam. Phasellus id leo \\nplacerat, vehicula diam nec, interdum mi. Nunc lacinia massa tristique \\nnunc accumsan, eu dapibus odio feugiat. Donec varius quam dictum \\nplacerat porttitor.</p>", "feed_image": null, "related_links": []}	\N	7	1
26	f	2019-06-14 15:45:09.09709-04	{"pk": 16, "path": "000100010004", "depth": 3, "numchild": 0, "title": "Blog Index", "draft_title": "Blog Index", "slug": "blog-index", "content_type": 61, "live": true, "has_unpublished_changes": false, "url_path": "/home/blog-index/", "owner": 1, "seo_title": "", "show_in_menus": true, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": null, "last_published_at": null, "latest_revision_created_at": null, "live_revision": null, "intro": "", "feed_image": null, "related_links": []}	\N	16	1
43	f	2019-06-14 15:52:15.105215-04	{"pk": 23, "path": "0001000100050003", "depth": 4, "numchild": 0, "title": "Gallery 3", "draft_title": "Gallery 3", "slug": "gallery-3", "content_type": 74, "live": true, "has_unpublished_changes": false, "url_path": "/home/photo-gallery/gallery-3/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": "2019-06-14T19:51:57.430Z", "last_published_at": "2019-06-14T19:51:57.430Z", "latest_revision_created_at": "2019-06-14T19:51:57.430Z", "live_revision": 42, "intro": "", "collection": 2, "images_per_page": 20, "order_images_by": 1, "feed_image": 8}	\N	23	1
12	f	2019-06-14 15:39:53.919791-04	{"pk": 10, "path": "0001000100020001", "depth": 4, "numchild": 0, "title": "Person Page 1", "draft_title": "Person Page 1", "slug": "person-page-1", "content_type": 78, "live": true, "has_unpublished_changes": false, "url_path": "/home/person-index/person-page-1/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": null, "last_published_at": null, "latest_revision_created_at": null, "live_revision": null, "name_organization": "", "telephone": "", "telephone_2": "", "email": "", "email_2": "", "address_1": "", "address_2": "", "city": "", "country": "", "post_code": "", "role": null, "intro": "", "biography": "<p>\\n  \\t\\t<p><p>Lorem ipsum dolor sit amet, consectetur \\nadipiscing elit. Aliquam et mauris eu nibh elementum blandit varius sit \\namet enim. Quisque massa leo, ornare in mattis vitae, vehicula \\nvestibulum diam. Phasellus id leo placerat, vehicula diam nec, interdum \\nmi. Nunc lacinia massa tristique nunc accumsan, eu dapibus odio feugiat.\\n Donec varius quam dictum placerat porttitor. Vivamus fermentum cursus \\nnibh in facilisis. Aenean in justo auctor, faucibus risus eu, semper \\nnisl. Ut nec suscipit nibh. Donec feugiat eget dui in rhoncus. Curabitur\\n imperdiet tortor ut quam tempus sagittis. Morbi lectus magna, viverra \\nut turpis a, dapibus sollicitudin diam. Morbi vel urna suscipit, sodales\\n ante id, luctus velit.</p><p>Fusce et diam quis ipsum pulvinar euismod \\nsit amet ac libero. Proin mauris ligula, egestas at tempus non, tempor \\net dolor. Proin porttitor, nibh quis consequat posuere, dolor eros \\neleifend nisi, ac semper ex nulla sit amet urna. Ut venenatis eros nec \\ngravida molestie. Integer hendrerit mollis odio vitae porttitor. Sed ut \\nelementum magna. Morbi laoreet odio lorem, eu fringilla nulla venenatis \\nid. Duis nisl erat, aliquet in tortor eget, ullamcorper varius quam. Sed\\n venenatis posuere ipsum, ut maximus ligula tristique fermentum. Ut eget\\n porttitor quam. In varius diam quis viverra porttutor.</p></p>\\n\\t</p>", "image": 7, "feed_image": null, "related_links": [], "tagged_items": []}	\N	10	1
13	f	2019-06-14 15:40:22.068617-04	{"pk": 10, "path": "0001000100020003", "depth": 4, "numchild": 0, "title": "Person Page 3", "draft_title": "Person Page 1", "slug": "person-page-3", "content_type": 78, "live": true, "has_unpublished_changes": false, "url_path": "/home/person-index/person-page-3/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": "2019-06-14T19:39:54.276Z", "last_published_at": "2019-06-14T19:39:54.276Z", "latest_revision_created_at": "2019-06-14T19:39:53.919Z", "live_revision": 9, "name_organization": "", "telephone": "", "telephone_2": "", "email": "", "email_2": "", "address_1": "", "address_2": "", "city": "", "country": "", "post_code": "", "role": null, "intro": "", "biography": "<p>\\n  \\t\\t<p><p>Lorem ipsum dolor sit amet, consectetur \\nadipiscing elit. Aliquam et mauris eu nibh elementum blandit varius sit \\namet enim. Quisque massa leo, ornare in mattis vitae, vehicula \\nvestibulum diam. Phasellus id leo placerat, vehicula diam nec, interdum \\nmi. Nunc lacinia massa tristique nunc accumsan, eu dapibus odio feugiat.\\n Donec varius quam dictum placerat porttitor. Vivamus fermentum cursus \\nnibh in facilisis. Aenean in justo auctor, faucibus risus eu, semper \\nnisl. Ut nec suscipit nibh. Donec feugiat eget dui in rhoncus. Curabitur\\n imperdiet tortor ut quam tempus sagittis. Morbi lectus magna, viverra \\nut turpis a, dapibus sollicitudin diam. Morbi vel urna suscipit, sodales\\n ante id, luctus velit.</p><p>Fusce et diam quis ipsum pulvinar euismod \\nsit amet ac libero. Proin mauris ligula, egestas at tempus non, tempor \\net dolor. Proin porttitor, nibh quis consequat posuere, dolor eros \\neleifend nisi, ac semper ex nulla sit amet urna. Ut venenatis eros nec \\ngravida molestie. Integer hendrerit mollis odio vitae porttitor. Sed ut \\nelementum magna. Morbi laoreet odio lorem, eu fringilla nulla venenatis \\nid. Duis nisl erat, aliquet in tortor eget, ullamcorper varius quam. Sed\\n venenatis posuere ipsum, ut maximus ligula tristique fermentum. Ut eget\\n porttitor quam. In varius diam quis viverra porttutor.</p></p>\\n\\t</p>", "image": 7, "feed_image": null, "related_links": [], "tagged_items": []}	\N	10	1
14	f	2019-06-14 15:39:53.919791-04	{"pk": 11, "path": "0001000100020001", "depth": 4, "numchild": 0, "title": "Person Page 1", "draft_title": "Person Page 1", "slug": "person-page-1", "content_type": 78, "live": true, "has_unpublished_changes": false, "url_path": "/home/person-index/person-page-1/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": null, "last_published_at": null, "latest_revision_created_at": null, "live_revision": null, "name_organization": "", "telephone": "", "telephone_2": "", "email": "", "email_2": "", "address_1": "", "address_2": "", "city": "", "country": "", "post_code": "", "role": null, "intro": "", "biography": "<p>\\n  \\t\\t<p><p>Lorem ipsum dolor sit amet, consectetur \\nadipiscing elit. Aliquam et mauris eu nibh elementum blandit varius sit \\namet enim. Quisque massa leo, ornare in mattis vitae, vehicula \\nvestibulum diam. Phasellus id leo placerat, vehicula diam nec, interdum \\nmi. Nunc lacinia massa tristique nunc accumsan, eu dapibus odio feugiat.\\n Donec varius quam dictum placerat porttitor. Vivamus fermentum cursus \\nnibh in facilisis. Aenean in justo auctor, faucibus risus eu, semper \\nnisl. Ut nec suscipit nibh. Donec feugiat eget dui in rhoncus. Curabitur\\n imperdiet tortor ut quam tempus sagittis. Morbi lectus magna, viverra \\nut turpis a, dapibus sollicitudin diam. Morbi vel urna suscipit, sodales\\n ante id, luctus velit.</p><p>Fusce et diam quis ipsum pulvinar euismod \\nsit amet ac libero. Proin mauris ligula, egestas at tempus non, tempor \\net dolor. Proin porttitor, nibh quis consequat posuere, dolor eros \\neleifend nisi, ac semper ex nulla sit amet urna. Ut venenatis eros nec \\ngravida molestie. Integer hendrerit mollis odio vitae porttitor. Sed ut \\nelementum magna. Morbi laoreet odio lorem, eu fringilla nulla venenatis \\nid. Duis nisl erat, aliquet in tortor eget, ullamcorper varius quam. Sed\\n venenatis posuere ipsum, ut maximus ligula tristique fermentum. Ut eget\\n porttitor quam. In varius diam quis viverra porttutor.</p></p>\\n\\t</p>", "image": 7, "feed_image": null, "related_links": [], "tagged_items": []}	\N	11	1
15	f	2019-06-14 15:40:41.298604-04	{"pk": 11, "path": "0001000100020004", "depth": 4, "numchild": 0, "title": "Person Page 4", "draft_title": "Person Page 1", "slug": "person-page-4", "content_type": 78, "live": true, "has_unpublished_changes": false, "url_path": "/home/person-index/person-page-4/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": "2019-06-14T19:39:54.276Z", "last_published_at": "2019-06-14T19:39:54.276Z", "latest_revision_created_at": "2019-06-14T19:39:53.919Z", "live_revision": 9, "name_organization": "", "telephone": "", "telephone_2": "", "email": "", "email_2": "", "address_1": "", "address_2": "", "city": "", "country": "", "post_code": "", "role": null, "intro": "", "biography": "<p>\\n  \\t\\t<p><p>Lorem ipsum dolor sit amet, consectetur \\nadipiscing elit. Aliquam et mauris eu nibh elementum blandit varius sit \\namet enim. Quisque massa leo, ornare in mattis vitae, vehicula \\nvestibulum diam. Phasellus id leo placerat, vehicula diam nec, interdum \\nmi. Nunc lacinia massa tristique nunc accumsan, eu dapibus odio feugiat.\\n Donec varius quam dictum placerat porttitor. Vivamus fermentum cursus \\nnibh in facilisis. Aenean in justo auctor, faucibus risus eu, semper \\nnisl. Ut nec suscipit nibh. Donec feugiat eget dui in rhoncus. Curabitur\\n imperdiet tortor ut quam tempus sagittis. Morbi lectus magna, viverra \\nut turpis a, dapibus sollicitudin diam. Morbi vel urna suscipit, sodales\\n ante id, luctus velit.</p><p>Fusce et diam quis ipsum pulvinar euismod \\nsit amet ac libero. Proin mauris ligula, egestas at tempus non, tempor \\net dolor. Proin porttitor, nibh quis consequat posuere, dolor eros \\neleifend nisi, ac semper ex nulla sit amet urna. Ut venenatis eros nec \\ngravida molestie. Integer hendrerit mollis odio vitae porttitor. Sed ut \\nelementum magna. Morbi laoreet odio lorem, eu fringilla nulla venenatis \\nid. Duis nisl erat, aliquet in tortor eget, ullamcorper varius quam. Sed\\n venenatis posuere ipsum, ut maximus ligula tristique fermentum. Ut eget\\n porttitor quam. In varius diam quis viverra porttutor.</p></p>\\n\\t</p>", "image": 7, "feed_image": null, "related_links": [], "tagged_items": []}	\N	11	1
38	f	2019-06-14 15:51:18.993173-04	{"pk": 22, "path": "0001000100050001", "depth": 4, "numchild": 0, "title": "Gallery 1", "draft_title": "Gallery 1", "slug": "gallery-1", "content_type": 74, "live": true, "has_unpublished_changes": false, "url_path": "/home/photo-gallery/gallery-1/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": null, "last_published_at": null, "latest_revision_created_at": null, "live_revision": null, "intro": "", "collection": 2, "images_per_page": 20, "order_images_by": 1, "feed_image": 12}	\N	22	1
29	f	2019-06-14 15:47:14.624055-04	{"pk": 18, "path": "0001000100040002", "depth": 4, "numchild": 0, "title": "Blog Page 2", "draft_title": "Blog Page 1", "slug": "blog-page-2", "content_type": 63, "live": true, "has_unpublished_changes": false, "url_path": "/home/blog-index/blog-page-2/", "owner": 1, "seo_title": "", "show_in_menus": true, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": "2019-06-14T19:47:02.496Z", "last_published_at": "2019-06-14T19:47:02.496Z", "latest_revision_created_at": "2019-06-14T19:47:02.196Z", "live_revision": 27, "intro": "<p><p>Lorem ipsum dolor sit amet, \\nconsectetur adipiscing elit. Praesent lobortis orci ex, a interdum justo\\n dapibus eu. Vestibulum sit amet risus et dolor tempor faucibus non ac \\nenim. Sed et sapien gravida, sollicitudin enim at, facilisis sapien. \\nNunc eget nibh ac libero tempus placerat. Duis quis turpis libero. Donec\\n vel tincidunt arcu. Nulla congue at risus eget egestas.</p><p>Ut eget \\nsapien ut diam feugiat fringilla. Curabitur malesuada mauris felis, id \\nblandit odio consequat vitae. Ut hendrerit hendrerit ante et fermentum. \\nMauris aliquam varius lorem, sed feugiat justo iaculis eget. Etiam \\nornare non neque at ultrices. Phasellus quam elit, lobortis ac imperdiet\\n vitae, scelerisque convallis felis. Fusce a vehicula orci, et semper \\nnibh. Aenean id lacus eget odio dignissim venenatis. Cras sagittis \\nlectus diam, ut pulvinar neque venenatis in.</p></p>\\n          \\t\\tLorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent \\nlobortis orci ex, a interdum justo dapibus eu. Vestibulum sit amet risus\\n et dolor tempor faucibus non ac enim. Sed et sapien gravida, \\nsollicitudin enim at, facilisis sapien. Nunc eget nibh ac libero tempus \\nplacerat. Duis quis turpis libero. Donec vel tincidunt arcu. Nulla \\ncongue at risus eget egestas.", "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p><p>Lorem ipsum dolor sit amet, \\\\nconsectetur adipiscing elit. Praesent lobortis orci ex, a interdum justo\\\\n dapibus eu. Vestibulum sit amet risus et dolor tempor faucibus non ac \\\\nenim. Sed et sapien gravida, sollicitudin enim at, facilisis sapien. \\\\nNunc eget nibh ac libero tempus placerat. Duis quis turpis libero. Donec\\\\n vel tincidunt arcu. Nulla congue at risus eget egestas.</p><p>Ut eget \\\\nsapien ut diam feugiat fringilla. Curabitur malesuada mauris felis, id \\\\nblandit odio consequat vitae. Ut hendrerit hendrerit ante et fermentum. \\\\nMauris aliquam varius lorem, sed feugiat justo iaculis eget. Etiam \\\\nornare non neque at ultrices. Phasellus quam elit, lobortis ac imperdiet\\\\n vitae, scelerisque convallis felis. Fusce a vehicula orci, et semper \\\\nnibh. Aenean id lacus eget odio dignissim venenatis. Cras sagittis \\\\nlectus diam, ut pulvinar neque venenatis in.</p></p>\\\\n          \\\\t\\\\t\\\\n              \\\\t\\\\t<p><p>Lorem ipsum dolor sit amet, \\\\nconsectetur adipiscing elit. Praesent lobortis orci ex, a interdum justo\\\\n dapibus eu. Vestibulum sit amet risus et dolor tempor faucibus non ac \\\\nenim. Sed et sapien gravida, sollicitudin enim at, facilisis sapien. \\\\nNunc eget nibh ac libero tempus placerat. Duis quis turpis libero. Donec\\\\n vel tincidunt arcu. Nulla congue at risus eget egestas.</p><p>Ut eget \\\\nsapien ut diam feugiat fringilla. Curabitur malesuada mauris felis, id \\\\nblandit odio consequat vitae. Ut hendrerit hendrerit ante et fermentum. \\\\nMauris aliquam varius lorem, sed feugiat justo iaculis eget. Etiam \\\\nornare non neque at ultrices. Phasellus quam elit, lobortis ac imperdiet\\\\n vitae, scelerisque convallis felis. Fusce a vehicula orci, et semper \\\\nnibh. Aenean id lacus eget odio dignissim venenatis. Cras sagittis \\\\nlectus diam, ut pulvinar neque venenatis in.</p></p>\\\\n          \\\\t\\\\t\\\\n              \\\\t\\\\t<p><p>Lorem ipsum dolor sit amet, \\\\nconsectetur adipiscing elit. Praesent lobortis orci ex, a interdum justo\\\\n dapibus eu. Vestibulum sit amet risus et dolor tempor faucibus non ac \\\\nenim. Sed et sapien gravida, sollicitudin enim at, facilisis sapien. \\\\nNunc eget nibh ac libero tempus placerat. Duis quis turpis libero. Donec\\\\n vel tincidunt arcu. Nulla congue at risus eget egestas.</p><p>Ut eget \\\\nsapien ut diam feugiat fringilla. Curabitur malesuada mauris felis, id \\\\nblandit odio consequat vitae. Ut hendrerit hendrerit ante et fermentum. \\\\nMauris aliquam varius lorem, sed feugiat justo iaculis eget. Etiam \\\\nornare non neque at ultrices. Phasellus quam elit, lobortis ac imperdiet\\\\n vitae, scelerisque convallis felis. Fusce a vehicula orci, et semper \\\\nnibh. Aenean id lacus eget odio dignissim venenatis. Cras sagittis \\\\nlectus diam, ut pulvinar neque venenatis in.</p></p>\\\\n          \\\\t\\\\t\\\\n              \\\\t\\\\t<p><p>Lorem ipsum dolor sit amet, \\\\nconsectetur adipiscing elit. Praesent lobortis orci ex, a interdum justo\\\\n dapibus eu. Vestibulum sit amet risus et dolor tempor faucibus non ac \\\\nenim. Sed et sapien gravida, sollicitudin enim at, facilisis sapien. \\\\nNunc eget nibh ac libero tempus placerat. Duis quis turpis libero. Donec\\\\n vel tincidunt arcu. Nulla congue at risus eget egestas.</p><p>Ut eget \\\\nsapien ut diam feugiat fringilla. Curabitur malesuada mauris felis, id \\\\nblandit odio consequat vitae. Ut hendrerit hendrerit ante et fermentum. \\\\nMauris aliquam varius lorem, sed feugiat justo iaculis eget. Etiam \\\\nornare non neque at ultrices. Phasellus quam elit, lobortis ac imperdiet\\\\n vitae, scelerisque convallis felis. Fusce a vehicula orci, et semper \\\\nnibh. Aenean id lacus eget odio dignissim venenatis. Cras sagittis \\\\nlectus diam, ut pulvinar neque venenatis in.</p></p>\\\\n          \\\\t\\\\tLorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent \\\\nlobortis orci ex, a interdum justo dapibus eu. Vestibulum sit amet risus\\\\n et dolor tempor faucibus non ac enim. Sed et sapien gravida, \\\\nsollicitudin enim at, facilisis sapien. Nunc eget nibh ac libero tempus \\\\nplacerat. Duis quis turpis libero. Donec vel tincidunt arcu. Nulla \\\\ncongue at risus eget egestas.\\", \\"id\\": \\"68c44c93-1225-4fe0-b4dc-1a25cf8e41ff\\"}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>Ut eget sapien ut diam feugiat fringilla. Curabitur malesuada mauris \\\\nfelis, id blandit odio consequat vitae. Ut hendrerit hendrerit ante et \\\\nfermentum. Mauris aliquam varius lorem, sed feugiat justo iaculis eget. \\\\nEtiam ornare non neque at ultrices. Phasellus quam elit, lobortis ac \\\\nimperdiet vitae, scelerisque convallis felis. Fusce a vehicula orci, et \\\\nsemper nibh. Aenean id lacus eget odio dignissim venenatis. Cras \\\\nsagittis lectus diam, ut pulvinar neque venenatis in.</p>\\", \\"id\\": \\"5f1ff927-c1d7-43df-b714-048e3faa4354\\"}, {\\"type\\": \\"image\\", \\"value\\": 12, \\"id\\": \\"1b960d50-3fdc-44ec-864d-23a0998ac5c0\\"}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>Praesent a massa id est egestas volutpat sed vitae dolor. Class aptent \\\\ntaciti sociosqu ad litora torquent per conubia nostra, per inceptos \\\\nhimenaeos. Duis sed dolor metus. Interdum et malesuada fames ac ante \\\\nipsum primis in faucibus. Nunc porttitor lacus eget bibendum commodo. \\\\nDonec faucibus ipsum sit amet sem interdum, et sagittis tortor ornare. \\\\nQuisque tristique neque gravida nisi sodales mattis. Morbi malesuada \\\\nante nisi, vel venenatis lacus ultricies eu. Pellentesque id risus sit \\\\namet enim lobortis luctus. Nullam dolor purus, efficitur in massa ac, \\\\npellentesque pulvinar dui.</p>\\", \\"id\\": \\"416d47f8-c062-4a44-8d08-ed816bf0c7a7\\"}]", "date": "2019-06-14", "feed_image": 12, "carousel_items": [], "related_links": [], "tagged_items": [{"pk": 3, "tag": 1, "content_object": 18}, {"pk": 4, "tag": 2, "content_object": 18}]}	\N	18	1
28	f	2019-06-14 15:47:02.196136-04	{"pk": 18, "path": "0001000100040001", "depth": 4, "numchild": 0, "title": "Blog Page 1", "draft_title": "Blog Page 1", "slug": "blog-page-1", "content_type": 63, "live": true, "has_unpublished_changes": false, "url_path": "/home/blog-index/blog-page-1/", "owner": 1, "seo_title": "", "show_in_menus": true, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": null, "last_published_at": null, "latest_revision_created_at": null, "live_revision": null, "intro": "<p><p>Lorem ipsum dolor sit amet, \\nconsectetur adipiscing elit. Praesent lobortis orci ex, a interdum justo\\n dapibus eu. Vestibulum sit amet risus et dolor tempor faucibus non ac \\nenim. Sed et sapien gravida, sollicitudin enim at, facilisis sapien. \\nNunc eget nibh ac libero tempus placerat. Duis quis turpis libero. Donec\\n vel tincidunt arcu. Nulla congue at risus eget egestas.</p><p>Ut eget \\nsapien ut diam feugiat fringilla. Curabitur malesuada mauris felis, id \\nblandit odio consequat vitae. Ut hendrerit hendrerit ante et fermentum. \\nMauris aliquam varius lorem, sed feugiat justo iaculis eget. Etiam \\nornare non neque at ultrices. Phasellus quam elit, lobortis ac imperdiet\\n vitae, scelerisque convallis felis. Fusce a vehicula orci, et semper \\nnibh. Aenean id lacus eget odio dignissim venenatis. Cras sagittis \\nlectus diam, ut pulvinar neque venenatis in.</p></p>\\n          \\t\\tLorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent \\nlobortis orci ex, a interdum justo dapibus eu. Vestibulum sit amet risus\\n et dolor tempor faucibus non ac enim. Sed et sapien gravida, \\nsollicitudin enim at, facilisis sapien. Nunc eget nibh ac libero tempus \\nplacerat. Duis quis turpis libero. Donec vel tincidunt arcu. Nulla \\ncongue at risus eget egestas.", "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p><p>Lorem ipsum dolor sit amet, \\\\nconsectetur adipiscing elit. Praesent lobortis orci ex, a interdum justo\\\\n dapibus eu. Vestibulum sit amet risus et dolor tempor faucibus non ac \\\\nenim. Sed et sapien gravida, sollicitudin enim at, facilisis sapien. \\\\nNunc eget nibh ac libero tempus placerat. Duis quis turpis libero. Donec\\\\n vel tincidunt arcu. Nulla congue at risus eget egestas.</p><p>Ut eget \\\\nsapien ut diam feugiat fringilla. Curabitur malesuada mauris felis, id \\\\nblandit odio consequat vitae. Ut hendrerit hendrerit ante et fermentum. \\\\nMauris aliquam varius lorem, sed feugiat justo iaculis eget. Etiam \\\\nornare non neque at ultrices. Phasellus quam elit, lobortis ac imperdiet\\\\n vitae, scelerisque convallis felis. Fusce a vehicula orci, et semper \\\\nnibh. Aenean id lacus eget odio dignissim venenatis. Cras sagittis \\\\nlectus diam, ut pulvinar neque venenatis in.</p></p>\\\\n          \\\\t\\\\t\\\\n              \\\\t\\\\t<p><p>Lorem ipsum dolor sit amet, \\\\nconsectetur adipiscing elit. Praesent lobortis orci ex, a interdum justo\\\\n dapibus eu. Vestibulum sit amet risus et dolor tempor faucibus non ac \\\\nenim. Sed et sapien gravida, sollicitudin enim at, facilisis sapien. \\\\nNunc eget nibh ac libero tempus placerat. Duis quis turpis libero. Donec\\\\n vel tincidunt arcu. Nulla congue at risus eget egestas.</p><p>Ut eget \\\\nsapien ut diam feugiat fringilla. Curabitur malesuada mauris felis, id \\\\nblandit odio consequat vitae. Ut hendrerit hendrerit ante et fermentum. \\\\nMauris aliquam varius lorem, sed feugiat justo iaculis eget. Etiam \\\\nornare non neque at ultrices. Phasellus quam elit, lobortis ac imperdiet\\\\n vitae, scelerisque convallis felis. Fusce a vehicula orci, et semper \\\\nnibh. Aenean id lacus eget odio dignissim venenatis. Cras sagittis \\\\nlectus diam, ut pulvinar neque venenatis in.</p></p>\\\\n          \\\\t\\\\t\\\\n              \\\\t\\\\t<p><p>Lorem ipsum dolor sit amet, \\\\nconsectetur adipiscing elit. Praesent lobortis orci ex, a interdum justo\\\\n dapibus eu. Vestibulum sit amet risus et dolor tempor faucibus non ac \\\\nenim. Sed et sapien gravida, sollicitudin enim at, facilisis sapien. \\\\nNunc eget nibh ac libero tempus placerat. Duis quis turpis libero. Donec\\\\n vel tincidunt arcu. Nulla congue at risus eget egestas.</p><p>Ut eget \\\\nsapien ut diam feugiat fringilla. Curabitur malesuada mauris felis, id \\\\nblandit odio consequat vitae. Ut hendrerit hendrerit ante et fermentum. \\\\nMauris aliquam varius lorem, sed feugiat justo iaculis eget. Etiam \\\\nornare non neque at ultrices. Phasellus quam elit, lobortis ac imperdiet\\\\n vitae, scelerisque convallis felis. Fusce a vehicula orci, et semper \\\\nnibh. Aenean id lacus eget odio dignissim venenatis. Cras sagittis \\\\nlectus diam, ut pulvinar neque venenatis in.</p></p>\\\\n          \\\\t\\\\t\\\\n              \\\\t\\\\t<p><p>Lorem ipsum dolor sit amet, \\\\nconsectetur adipiscing elit. Praesent lobortis orci ex, a interdum justo\\\\n dapibus eu. Vestibulum sit amet risus et dolor tempor faucibus non ac \\\\nenim. Sed et sapien gravida, sollicitudin enim at, facilisis sapien. \\\\nNunc eget nibh ac libero tempus placerat. Duis quis turpis libero. Donec\\\\n vel tincidunt arcu. Nulla congue at risus eget egestas.</p><p>Ut eget \\\\nsapien ut diam feugiat fringilla. Curabitur malesuada mauris felis, id \\\\nblandit odio consequat vitae. Ut hendrerit hendrerit ante et fermentum. \\\\nMauris aliquam varius lorem, sed feugiat justo iaculis eget. Etiam \\\\nornare non neque at ultrices. Phasellus quam elit, lobortis ac imperdiet\\\\n vitae, scelerisque convallis felis. Fusce a vehicula orci, et semper \\\\nnibh. Aenean id lacus eget odio dignissim venenatis. Cras sagittis \\\\nlectus diam, ut pulvinar neque venenatis in.</p></p>\\\\n          \\\\t\\\\tLorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent \\\\nlobortis orci ex, a interdum justo dapibus eu. Vestibulum sit amet risus\\\\n et dolor tempor faucibus non ac enim. Sed et sapien gravida, \\\\nsollicitudin enim at, facilisis sapien. Nunc eget nibh ac libero tempus \\\\nplacerat. Duis quis turpis libero. Donec vel tincidunt arcu. Nulla \\\\ncongue at risus eget egestas.\\", \\"id\\": \\"68c44c93-1225-4fe0-b4dc-1a25cf8e41ff\\"}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>Ut eget sapien ut diam feugiat fringilla. Curabitur malesuada mauris \\\\nfelis, id blandit odio consequat vitae. Ut hendrerit hendrerit ante et \\\\nfermentum. Mauris aliquam varius lorem, sed feugiat justo iaculis eget. \\\\nEtiam ornare non neque at ultrices. Phasellus quam elit, lobortis ac \\\\nimperdiet vitae, scelerisque convallis felis. Fusce a vehicula orci, et \\\\nsemper nibh. Aenean id lacus eget odio dignissim venenatis. Cras \\\\nsagittis lectus diam, ut pulvinar neque venenatis in.</p>\\", \\"id\\": \\"5f1ff927-c1d7-43df-b714-048e3faa4354\\"}, {\\"type\\": \\"image\\", \\"value\\": 12, \\"id\\": \\"1b960d50-3fdc-44ec-864d-23a0998ac5c0\\"}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>Praesent a massa id est egestas volutpat sed vitae dolor. Class aptent \\\\ntaciti sociosqu ad litora torquent per conubia nostra, per inceptos \\\\nhimenaeos. Duis sed dolor metus. Interdum et malesuada fames ac ante \\\\nipsum primis in faucibus. Nunc porttitor lacus eget bibendum commodo. \\\\nDonec faucibus ipsum sit amet sem interdum, et sagittis tortor ornare. \\\\nQuisque tristique neque gravida nisi sodales mattis. Morbi malesuada \\\\nante nisi, vel venenatis lacus ultricies eu. Pellentesque id risus sit \\\\namet enim lobortis luctus. Nullam dolor purus, efficitur in massa ac, \\\\npellentesque pulvinar dui.</p>\\", \\"id\\": \\"416d47f8-c062-4a44-8d08-ed816bf0c7a7\\"}]", "date": "2019-06-14", "feed_image": 12, "carousel_items": [], "related_links": [], "tagged_items": [{"pk": 3, "tag": 1, "content_object": 18}, {"pk": 4, "tag": 2, "content_object": 18}]}	\N	18	1
27	f	2019-06-14 15:47:02.196136-04	{"pk": 17, "path": "0001000100040001", "depth": 4, "numchild": 0, "title": "Blog Page 1", "draft_title": "Blog Page 1", "slug": "blog-page-1", "content_type": 63, "live": true, "has_unpublished_changes": false, "url_path": "/home/blog-index/blog-page-1/", "owner": 1, "seo_title": "", "show_in_menus": true, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": null, "last_published_at": null, "latest_revision_created_at": null, "live_revision": null, "intro": "<p><p>Lorem ipsum dolor sit amet, \\nconsectetur adipiscing elit. Praesent lobortis orci ex, a interdum justo\\n dapibus eu. Vestibulum sit amet risus et dolor tempor faucibus non ac \\nenim. Sed et sapien gravida, sollicitudin enim at, facilisis sapien. \\nNunc eget nibh ac libero tempus placerat. Duis quis turpis libero. Donec\\n vel tincidunt arcu. Nulla congue at risus eget egestas.</p><p>Ut eget \\nsapien ut diam feugiat fringilla. Curabitur malesuada mauris felis, id \\nblandit odio consequat vitae. Ut hendrerit hendrerit ante et fermentum. \\nMauris aliquam varius lorem, sed feugiat justo iaculis eget. Etiam \\nornare non neque at ultrices. Phasellus quam elit, lobortis ac imperdiet\\n vitae, scelerisque convallis felis. Fusce a vehicula orci, et semper \\nnibh. Aenean id lacus eget odio dignissim venenatis. Cras sagittis \\nlectus diam, ut pulvinar neque venenatis in.</p></p>\\n          \\t\\tLorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent \\nlobortis orci ex, a interdum justo dapibus eu. Vestibulum sit amet risus\\n et dolor tempor faucibus non ac enim. Sed et sapien gravida, \\nsollicitudin enim at, facilisis sapien. Nunc eget nibh ac libero tempus \\nplacerat. Duis quis turpis libero. Donec vel tincidunt arcu. Nulla \\ncongue at risus eget egestas.", "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p><p>Lorem ipsum dolor sit amet, \\\\nconsectetur adipiscing elit. Praesent lobortis orci ex, a interdum justo\\\\n dapibus eu. Vestibulum sit amet risus et dolor tempor faucibus non ac \\\\nenim. Sed et sapien gravida, sollicitudin enim at, facilisis sapien. \\\\nNunc eget nibh ac libero tempus placerat. Duis quis turpis libero. Donec\\\\n vel tincidunt arcu. Nulla congue at risus eget egestas.</p><p>Ut eget \\\\nsapien ut diam feugiat fringilla. Curabitur malesuada mauris felis, id \\\\nblandit odio consequat vitae. Ut hendrerit hendrerit ante et fermentum. \\\\nMauris aliquam varius lorem, sed feugiat justo iaculis eget. Etiam \\\\nornare non neque at ultrices. Phasellus quam elit, lobortis ac imperdiet\\\\n vitae, scelerisque convallis felis. Fusce a vehicula orci, et semper \\\\nnibh. Aenean id lacus eget odio dignissim venenatis. Cras sagittis \\\\nlectus diam, ut pulvinar neque venenatis in.</p></p>\\\\n          \\\\t\\\\t\\\\n              \\\\t\\\\t<p><p>Lorem ipsum dolor sit amet, \\\\nconsectetur adipiscing elit. Praesent lobortis orci ex, a interdum justo\\\\n dapibus eu. Vestibulum sit amet risus et dolor tempor faucibus non ac \\\\nenim. Sed et sapien gravida, sollicitudin enim at, facilisis sapien. \\\\nNunc eget nibh ac libero tempus placerat. Duis quis turpis libero. Donec\\\\n vel tincidunt arcu. Nulla congue at risus eget egestas.</p><p>Ut eget \\\\nsapien ut diam feugiat fringilla. Curabitur malesuada mauris felis, id \\\\nblandit odio consequat vitae. Ut hendrerit hendrerit ante et fermentum. \\\\nMauris aliquam varius lorem, sed feugiat justo iaculis eget. Etiam \\\\nornare non neque at ultrices. Phasellus quam elit, lobortis ac imperdiet\\\\n vitae, scelerisque convallis felis. Fusce a vehicula orci, et semper \\\\nnibh. Aenean id lacus eget odio dignissim venenatis. Cras sagittis \\\\nlectus diam, ut pulvinar neque venenatis in.</p></p>\\\\n          \\\\t\\\\t\\\\n              \\\\t\\\\t<p><p>Lorem ipsum dolor sit amet, \\\\nconsectetur adipiscing elit. Praesent lobortis orci ex, a interdum justo\\\\n dapibus eu. Vestibulum sit amet risus et dolor tempor faucibus non ac \\\\nenim. Sed et sapien gravida, sollicitudin enim at, facilisis sapien. \\\\nNunc eget nibh ac libero tempus placerat. Duis quis turpis libero. Donec\\\\n vel tincidunt arcu. Nulla congue at risus eget egestas.</p><p>Ut eget \\\\nsapien ut diam feugiat fringilla. Curabitur malesuada mauris felis, id \\\\nblandit odio consequat vitae. Ut hendrerit hendrerit ante et fermentum. \\\\nMauris aliquam varius lorem, sed feugiat justo iaculis eget. Etiam \\\\nornare non neque at ultrices. Phasellus quam elit, lobortis ac imperdiet\\\\n vitae, scelerisque convallis felis. Fusce a vehicula orci, et semper \\\\nnibh. Aenean id lacus eget odio dignissim venenatis. Cras sagittis \\\\nlectus diam, ut pulvinar neque venenatis in.</p></p>\\\\n          \\\\t\\\\t\\\\n              \\\\t\\\\t<p><p>Lorem ipsum dolor sit amet, \\\\nconsectetur adipiscing elit. Praesent lobortis orci ex, a interdum justo\\\\n dapibus eu. Vestibulum sit amet risus et dolor tempor faucibus non ac \\\\nenim. Sed et sapien gravida, sollicitudin enim at, facilisis sapien. \\\\nNunc eget nibh ac libero tempus placerat. Duis quis turpis libero. Donec\\\\n vel tincidunt arcu. Nulla congue at risus eget egestas.</p><p>Ut eget \\\\nsapien ut diam feugiat fringilla. Curabitur malesuada mauris felis, id \\\\nblandit odio consequat vitae. Ut hendrerit hendrerit ante et fermentum. \\\\nMauris aliquam varius lorem, sed feugiat justo iaculis eget. Etiam \\\\nornare non neque at ultrices. Phasellus quam elit, lobortis ac imperdiet\\\\n vitae, scelerisque convallis felis. Fusce a vehicula orci, et semper \\\\nnibh. Aenean id lacus eget odio dignissim venenatis. Cras sagittis \\\\nlectus diam, ut pulvinar neque venenatis in.</p></p>\\\\n          \\\\t\\\\tLorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent \\\\nlobortis orci ex, a interdum justo dapibus eu. Vestibulum sit amet risus\\\\n et dolor tempor faucibus non ac enim. Sed et sapien gravida, \\\\nsollicitudin enim at, facilisis sapien. Nunc eget nibh ac libero tempus \\\\nplacerat. Duis quis turpis libero. Donec vel tincidunt arcu. Nulla \\\\ncongue at risus eget egestas.\\", \\"id\\": \\"68c44c93-1225-4fe0-b4dc-1a25cf8e41ff\\"}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>Ut eget sapien ut diam feugiat fringilla. Curabitur malesuada mauris \\\\nfelis, id blandit odio consequat vitae. Ut hendrerit hendrerit ante et \\\\nfermentum. Mauris aliquam varius lorem, sed feugiat justo iaculis eget. \\\\nEtiam ornare non neque at ultrices. Phasellus quam elit, lobortis ac \\\\nimperdiet vitae, scelerisque convallis felis. Fusce a vehicula orci, et \\\\nsemper nibh. Aenean id lacus eget odio dignissim venenatis. Cras \\\\nsagittis lectus diam, ut pulvinar neque venenatis in.</p>\\", \\"id\\": \\"5f1ff927-c1d7-43df-b714-048e3faa4354\\"}, {\\"type\\": \\"image\\", \\"value\\": 12, \\"id\\": \\"1b960d50-3fdc-44ec-864d-23a0998ac5c0\\"}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>Praesent a massa id est egestas volutpat sed vitae dolor. Class aptent \\\\ntaciti sociosqu ad litora torquent per conubia nostra, per inceptos \\\\nhimenaeos. Duis sed dolor metus. Interdum et malesuada fames ac ante \\\\nipsum primis in faucibus. Nunc porttitor lacus eget bibendum commodo. \\\\nDonec faucibus ipsum sit amet sem interdum, et sagittis tortor ornare. \\\\nQuisque tristique neque gravida nisi sodales mattis. Morbi malesuada \\\\nante nisi, vel venenatis lacus ultricies eu. Pellentesque id risus sit \\\\namet enim lobortis luctus. Nullam dolor purus, efficitur in massa ac, \\\\npellentesque pulvinar dui.</p>\\", \\"id\\": \\"416d47f8-c062-4a44-8d08-ed816bf0c7a7\\"}]", "date": "2019-06-14", "feed_image": 12, "carousel_items": [], "related_links": [], "tagged_items": [{"pk": 1, "tag": 1, "content_object": 17}, {"pk": 2, "tag": 2, "content_object": 17}]}	\N	17	1
37	f	2019-06-14 15:51:18.993173-04	{"pk": 21, "path": "0001000100050001", "depth": 4, "numchild": 0, "title": "Gallery 1", "draft_title": "Gallery 1", "slug": "gallery-1", "content_type": 74, "live": true, "has_unpublished_changes": false, "url_path": "/home/photo-gallery/gallery-1/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": null, "last_published_at": null, "latest_revision_created_at": null, "live_revision": null, "intro": "", "collection": 2, "images_per_page": 20, "order_images_by": 1, "feed_image": 12}	\N	21	1
30	f	2019-06-14 15:48:00.255415-04	{"pk": 18, "path": "0001000100040002", "depth": 4, "numchild": 0, "title": "Blog Page 2", "draft_title": "Blog Page 2", "slug": "blog-page-2", "content_type": 63, "live": true, "has_unpublished_changes": false, "url_path": "/home/blog-index/blog-page-2/", "owner": 1, "seo_title": "", "show_in_menus": true, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": "2019-06-14T19:47:14.624Z", "last_published_at": "2019-06-14T19:47:14.624Z", "latest_revision_created_at": "2019-06-14T19:47:14.624Z", "live_revision": 29, "intro": "<p></p><p>Lorem ipsum dolor sit amet, \\nconsectetur adipiscing elit. Praesent lobortis orci ex, a interdum justo\\n dapibus eu. Vestibulum sit amet risus et dolor tempor faucibus non ac \\nenim. Sed et sapien gravida, sollicitudin enim at, facilisis sapien. \\nNunc eget nibh ac libero tempus placerat. Duis quis turpis libero. Donec\\n vel tincidunt arcu. Nulla congue at risus eget egestas.</p>", "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p></p><p>Lorem ipsum dolor sit amet, \\\\nconsectetur adipiscing elit. Praesent lobortis orci ex, a interdum justo\\\\n dapibus eu. Vestibulum sit amet risus et dolor tempor faucibus non ac \\\\nenim. Sed et sapien gravida, sollicitudin enim at, facilisis sapien. \\\\nNunc eget nibh ac libero tempus placerat. Duis quis turpis libero. Donec\\\\n vel tincidunt arcu. Nulla congue at risus eget egestas.</p>\\", \\"id\\": \\"68c44c93-1225-4fe0-b4dc-1a25cf8e41ff\\"}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>Ut eget sapien ut diam feugiat fringilla. Curabitur malesuada mauris \\\\nfelis, id blandit odio consequat vitae. Ut hendrerit hendrerit ante et \\\\nfermentum. Mauris aliquam varius lorem, sed feugiat justo iaculis eget. \\\\nEtiam ornare non neque at ultrices. Phasellus quam elit, lobortis ac \\\\nimperdiet vitae, scelerisque convallis felis. Fusce a vehicula orci, et \\\\nsemper nibh. Aenean id lacus eget odio dignissim venenatis. Cras \\\\nsagittis lectus diam, ut pulvinar neque venenatis in.</p>\\", \\"id\\": \\"5f1ff927-c1d7-43df-b714-048e3faa4354\\"}, {\\"type\\": \\"image\\", \\"value\\": 8, \\"id\\": \\"1b960d50-3fdc-44ec-864d-23a0998ac5c0\\"}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>Praesent a massa id est egestas volutpat sed vitae dolor. Class aptent \\\\ntaciti sociosqu ad litora torquent per conubia nostra, per inceptos \\\\nhimenaeos. Duis sed dolor metus. Interdum et malesuada fames ac ante \\\\nipsum primis in faucibus. Nunc porttitor lacus eget bibendum commodo. \\\\nDonec faucibus ipsum sit amet sem interdum, et sagittis tortor ornare. \\\\nQuisque tristique neque gravida nisi sodales mattis. Morbi malesuada \\\\nante nisi, vel venenatis lacus ultricies eu. Pellentesque id risus sit \\\\namet enim lobortis luctus. Nullam dolor purus, efficitur in massa ac, \\\\npellentesque pulvinar dui.</p>\\", \\"id\\": \\"416d47f8-c062-4a44-8d08-ed816bf0c7a7\\"}]", "date": "2019-06-14", "feed_image": 8, "carousel_items": [], "related_links": [], "tagged_items": [{"pk": null, "tag": 1, "content_object": 18}, {"pk": null, "tag": 2, "content_object": 18}]}	\N	18	1
31	f	2019-06-14 15:48:27.193927-04	{"pk": 17, "path": "0001000100040001", "depth": 4, "numchild": 0, "title": "Blog Page 1", "draft_title": "Blog Page 1", "slug": "blog-page-1", "content_type": 63, "live": true, "has_unpublished_changes": false, "url_path": "/home/blog-index/blog-page-1/", "owner": 1, "seo_title": "", "show_in_menus": true, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": "2019-06-14T19:47:02.496Z", "last_published_at": "2019-06-14T19:47:02.496Z", "latest_revision_created_at": "2019-06-14T19:47:02.196Z", "live_revision": 27, "intro": "<p></p><p>Lorem ipsum dolor sit amet, \\nconsectetur adipiscing elit. Praesent lobortis orci ex, a interdum justo\\n dapibus eu. Vestibulum sit amet risus et dolor tempor faucibus non ac \\nenim. Sed et sapien gravida, sollicitudin enim at, facilisis sapien. \\nNunc eget nibh ac libero tempus placerat. Duis quis turpis libero. Donec\\n vel tincidunt arcu. Nulla congue at risus eget egestas.</p>", "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p></p><p>Lorem ipsum dolor sit amet, \\\\nconsectetur adipiscing elit. Praesent lobortis orci ex, a interdum justo\\\\n dapibus eu. Vestibulum sit amet risus et dolor tempor faucibus non ac \\\\nenim. Sed et sapien gravida, sollicitudin enim at, facilisis sapien. \\\\nNunc eget nibh ac libero tempus placerat. Duis quis turpis libero. Donec\\\\n vel tincidunt arcu. Nulla congue at risus eget egestas.</p>\\", \\"id\\": \\"68c44c93-1225-4fe0-b4dc-1a25cf8e41ff\\"}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>Ut eget sapien ut diam feugiat fringilla. Curabitur malesuada mauris \\\\nfelis, id blandit odio consequat vitae. Ut hendrerit hendrerit ante et \\\\nfermentum. Mauris aliquam varius lorem, sed feugiat justo iaculis eget. \\\\nEtiam ornare non neque at ultrices. Phasellus quam elit, lobortis ac \\\\nimperdiet vitae, scelerisque convallis felis. Fusce a vehicula orci, et \\\\nsemper nibh. Aenean id lacus eget odio dignissim venenatis. Cras \\\\nsagittis lectus diam, ut pulvinar neque venenatis in.</p>\\", \\"id\\": \\"5f1ff927-c1d7-43df-b714-048e3faa4354\\"}, {\\"type\\": \\"image\\", \\"value\\": 12, \\"id\\": \\"1b960d50-3fdc-44ec-864d-23a0998ac5c0\\"}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>Praesent a massa id est egestas volutpat sed vitae dolor. Class aptent \\\\ntaciti sociosqu ad litora torquent per conubia nostra, per inceptos \\\\nhimenaeos. Duis sed dolor metus. Interdum et malesuada fames ac ante \\\\nipsum primis in faucibus. Nunc porttitor lacus eget bibendum commodo. \\\\nDonec faucibus ipsum sit amet sem interdum, et sagittis tortor ornare. \\\\nQuisque tristique neque gravida nisi sodales mattis. Morbi malesuada \\\\nante nisi, vel venenatis lacus ultricies eu. Pellentesque id risus sit \\\\namet enim lobortis luctus. Nullam dolor purus, efficitur in massa ac, \\\\npellentesque pulvinar dui.</p>\\", \\"id\\": \\"416d47f8-c062-4a44-8d08-ed816bf0c7a7\\"}]", "date": "2019-06-14", "feed_image": 12, "carousel_items": [], "related_links": [], "tagged_items": [{"pk": null, "tag": 1, "content_object": 17}, {"pk": null, "tag": 2, "content_object": 17}]}	\N	17	1
33	f	2019-06-14 15:47:02.196136-04	{"pk": 19, "path": "0001000100040001", "depth": 4, "numchild": 0, "title": "Blog Page 1", "draft_title": "Blog Page 1", "slug": "blog-page-1", "content_type": 63, "live": true, "has_unpublished_changes": false, "url_path": "/home/blog-index/blog-page-1/", "owner": 1, "seo_title": "", "show_in_menus": true, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": null, "last_published_at": null, "latest_revision_created_at": null, "live_revision": null, "intro": "<p><p>Lorem ipsum dolor sit amet, \\nconsectetur adipiscing elit. Praesent lobortis orci ex, a interdum justo\\n dapibus eu. Vestibulum sit amet risus et dolor tempor faucibus non ac \\nenim. Sed et sapien gravida, sollicitudin enim at, facilisis sapien. \\nNunc eget nibh ac libero tempus placerat. Duis quis turpis libero. Donec\\n vel tincidunt arcu. Nulla congue at risus eget egestas.</p><p>Ut eget \\nsapien ut diam feugiat fringilla. Curabitur malesuada mauris felis, id \\nblandit odio consequat vitae. Ut hendrerit hendrerit ante et fermentum. \\nMauris aliquam varius lorem, sed feugiat justo iaculis eget. Etiam \\nornare non neque at ultrices. Phasellus quam elit, lobortis ac imperdiet\\n vitae, scelerisque convallis felis. Fusce a vehicula orci, et semper \\nnibh. Aenean id lacus eget odio dignissim venenatis. Cras sagittis \\nlectus diam, ut pulvinar neque venenatis in.</p></p>\\n          \\t\\tLorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent \\nlobortis orci ex, a interdum justo dapibus eu. Vestibulum sit amet risus\\n et dolor tempor faucibus non ac enim. Sed et sapien gravida, \\nsollicitudin enim at, facilisis sapien. Nunc eget nibh ac libero tempus \\nplacerat. Duis quis turpis libero. Donec vel tincidunt arcu. Nulla \\ncongue at risus eget egestas.", "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p><p>Lorem ipsum dolor sit amet, \\\\nconsectetur adipiscing elit. Praesent lobortis orci ex, a interdum justo\\\\n dapibus eu. Vestibulum sit amet risus et dolor tempor faucibus non ac \\\\nenim. Sed et sapien gravida, sollicitudin enim at, facilisis sapien. \\\\nNunc eget nibh ac libero tempus placerat. Duis quis turpis libero. Donec\\\\n vel tincidunt arcu. Nulla congue at risus eget egestas.</p><p>Ut eget \\\\nsapien ut diam feugiat fringilla. Curabitur malesuada mauris felis, id \\\\nblandit odio consequat vitae. Ut hendrerit hendrerit ante et fermentum. \\\\nMauris aliquam varius lorem, sed feugiat justo iaculis eget. Etiam \\\\nornare non neque at ultrices. Phasellus quam elit, lobortis ac imperdiet\\\\n vitae, scelerisque convallis felis. Fusce a vehicula orci, et semper \\\\nnibh. Aenean id lacus eget odio dignissim venenatis. Cras sagittis \\\\nlectus diam, ut pulvinar neque venenatis in.</p></p>\\\\n          \\\\t\\\\t\\\\n              \\\\t\\\\t<p><p>Lorem ipsum dolor sit amet, \\\\nconsectetur adipiscing elit. Praesent lobortis orci ex, a interdum justo\\\\n dapibus eu. Vestibulum sit amet risus et dolor tempor faucibus non ac \\\\nenim. Sed et sapien gravida, sollicitudin enim at, facilisis sapien. \\\\nNunc eget nibh ac libero tempus placerat. Duis quis turpis libero. Donec\\\\n vel tincidunt arcu. Nulla congue at risus eget egestas.</p><p>Ut eget \\\\nsapien ut diam feugiat fringilla. Curabitur malesuada mauris felis, id \\\\nblandit odio consequat vitae. Ut hendrerit hendrerit ante et fermentum. \\\\nMauris aliquam varius lorem, sed feugiat justo iaculis eget. Etiam \\\\nornare non neque at ultrices. Phasellus quam elit, lobortis ac imperdiet\\\\n vitae, scelerisque convallis felis. Fusce a vehicula orci, et semper \\\\nnibh. Aenean id lacus eget odio dignissim venenatis. Cras sagittis \\\\nlectus diam, ut pulvinar neque venenatis in.</p></p>\\\\n          \\\\t\\\\t\\\\n              \\\\t\\\\t<p><p>Lorem ipsum dolor sit amet, \\\\nconsectetur adipiscing elit. Praesent lobortis orci ex, a interdum justo\\\\n dapibus eu. Vestibulum sit amet risus et dolor tempor faucibus non ac \\\\nenim. Sed et sapien gravida, sollicitudin enim at, facilisis sapien. \\\\nNunc eget nibh ac libero tempus placerat. Duis quis turpis libero. Donec\\\\n vel tincidunt arcu. Nulla congue at risus eget egestas.</p><p>Ut eget \\\\nsapien ut diam feugiat fringilla. Curabitur malesuada mauris felis, id \\\\nblandit odio consequat vitae. Ut hendrerit hendrerit ante et fermentum. \\\\nMauris aliquam varius lorem, sed feugiat justo iaculis eget. Etiam \\\\nornare non neque at ultrices. Phasellus quam elit, lobortis ac imperdiet\\\\n vitae, scelerisque convallis felis. Fusce a vehicula orci, et semper \\\\nnibh. Aenean id lacus eget odio dignissim venenatis. Cras sagittis \\\\nlectus diam, ut pulvinar neque venenatis in.</p></p>\\\\n          \\\\t\\\\t\\\\n              \\\\t\\\\t<p><p>Lorem ipsum dolor sit amet, \\\\nconsectetur adipiscing elit. Praesent lobortis orci ex, a interdum justo\\\\n dapibus eu. Vestibulum sit amet risus et dolor tempor faucibus non ac \\\\nenim. Sed et sapien gravida, sollicitudin enim at, facilisis sapien. \\\\nNunc eget nibh ac libero tempus placerat. Duis quis turpis libero. Donec\\\\n vel tincidunt arcu. Nulla congue at risus eget egestas.</p><p>Ut eget \\\\nsapien ut diam feugiat fringilla. Curabitur malesuada mauris felis, id \\\\nblandit odio consequat vitae. Ut hendrerit hendrerit ante et fermentum. \\\\nMauris aliquam varius lorem, sed feugiat justo iaculis eget. Etiam \\\\nornare non neque at ultrices. Phasellus quam elit, lobortis ac imperdiet\\\\n vitae, scelerisque convallis felis. Fusce a vehicula orci, et semper \\\\nnibh. Aenean id lacus eget odio dignissim venenatis. Cras sagittis \\\\nlectus diam, ut pulvinar neque venenatis in.</p></p>\\\\n          \\\\t\\\\tLorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent \\\\nlobortis orci ex, a interdum justo dapibus eu. Vestibulum sit amet risus\\\\n et dolor tempor faucibus non ac enim. Sed et sapien gravida, \\\\nsollicitudin enim at, facilisis sapien. Nunc eget nibh ac libero tempus \\\\nplacerat. Duis quis turpis libero. Donec vel tincidunt arcu. Nulla \\\\ncongue at risus eget egestas.\\", \\"id\\": \\"68c44c93-1225-4fe0-b4dc-1a25cf8e41ff\\"}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>Ut eget sapien ut diam feugiat fringilla. Curabitur malesuada mauris \\\\nfelis, id blandit odio consequat vitae. Ut hendrerit hendrerit ante et \\\\nfermentum. Mauris aliquam varius lorem, sed feugiat justo iaculis eget. \\\\nEtiam ornare non neque at ultrices. Phasellus quam elit, lobortis ac \\\\nimperdiet vitae, scelerisque convallis felis. Fusce a vehicula orci, et \\\\nsemper nibh. Aenean id lacus eget odio dignissim venenatis. Cras \\\\nsagittis lectus diam, ut pulvinar neque venenatis in.</p>\\", \\"id\\": \\"5f1ff927-c1d7-43df-b714-048e3faa4354\\"}, {\\"type\\": \\"image\\", \\"value\\": 12, \\"id\\": \\"1b960d50-3fdc-44ec-864d-23a0998ac5c0\\"}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>Praesent a massa id est egestas volutpat sed vitae dolor. Class aptent \\\\ntaciti sociosqu ad litora torquent per conubia nostra, per inceptos \\\\nhimenaeos. Duis sed dolor metus. Interdum et malesuada fames ac ante \\\\nipsum primis in faucibus. Nunc porttitor lacus eget bibendum commodo. \\\\nDonec faucibus ipsum sit amet sem interdum, et sagittis tortor ornare. \\\\nQuisque tristique neque gravida nisi sodales mattis. Morbi malesuada \\\\nante nisi, vel venenatis lacus ultricies eu. Pellentesque id risus sit \\\\namet enim lobortis luctus. Nullam dolor purus, efficitur in massa ac, \\\\npellentesque pulvinar dui.</p>\\", \\"id\\": \\"416d47f8-c062-4a44-8d08-ed816bf0c7a7\\"}]", "date": "2019-06-14", "feed_image": 12, "carousel_items": [], "related_links": [], "tagged_items": [{"pk": null, "tag": 1, "content_object": 19}, {"pk": null, "tag": 2, "content_object": 19}]}	\N	19	1
32	f	2019-06-14 15:48:27.193927-04	{"pk": 19, "path": "0001000100040001", "depth": 4, "numchild": 0, "title": "Blog Page 1", "draft_title": "Blog Page 1", "slug": "blog-page-1", "content_type": 63, "live": true, "has_unpublished_changes": false, "url_path": "/home/blog-index/blog-page-1/", "owner": 1, "seo_title": "", "show_in_menus": true, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": "2019-06-14T19:47:02.496Z", "last_published_at": "2019-06-14T19:47:02.496Z", "latest_revision_created_at": "2019-06-14T19:47:02.196Z", "live_revision": 27, "intro": "<p></p><p>Lorem ipsum dolor sit amet, \\nconsectetur adipiscing elit. Praesent lobortis orci ex, a interdum justo\\n dapibus eu. Vestibulum sit amet risus et dolor tempor faucibus non ac \\nenim. Sed et sapien gravida, sollicitudin enim at, facilisis sapien. \\nNunc eget nibh ac libero tempus placerat. Duis quis turpis libero. Donec\\n vel tincidunt arcu. Nulla congue at risus eget egestas.</p>", "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p></p><p>Lorem ipsum dolor sit amet, \\\\nconsectetur adipiscing elit. Praesent lobortis orci ex, a interdum justo\\\\n dapibus eu. Vestibulum sit amet risus et dolor tempor faucibus non ac \\\\nenim. Sed et sapien gravida, sollicitudin enim at, facilisis sapien. \\\\nNunc eget nibh ac libero tempus placerat. Duis quis turpis libero. Donec\\\\n vel tincidunt arcu. Nulla congue at risus eget egestas.</p>\\", \\"id\\": \\"68c44c93-1225-4fe0-b4dc-1a25cf8e41ff\\"}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>Ut eget sapien ut diam feugiat fringilla. Curabitur malesuada mauris \\\\nfelis, id blandit odio consequat vitae. Ut hendrerit hendrerit ante et \\\\nfermentum. Mauris aliquam varius lorem, sed feugiat justo iaculis eget. \\\\nEtiam ornare non neque at ultrices. Phasellus quam elit, lobortis ac \\\\nimperdiet vitae, scelerisque convallis felis. Fusce a vehicula orci, et \\\\nsemper nibh. Aenean id lacus eget odio dignissim venenatis. Cras \\\\nsagittis lectus diam, ut pulvinar neque venenatis in.</p>\\", \\"id\\": \\"5f1ff927-c1d7-43df-b714-048e3faa4354\\"}, {\\"type\\": \\"image\\", \\"value\\": 12, \\"id\\": \\"1b960d50-3fdc-44ec-864d-23a0998ac5c0\\"}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>Praesent a massa id est egestas volutpat sed vitae dolor. Class aptent \\\\ntaciti sociosqu ad litora torquent per conubia nostra, per inceptos \\\\nhimenaeos. Duis sed dolor metus. Interdum et malesuada fames ac ante \\\\nipsum primis in faucibus. Nunc porttitor lacus eget bibendum commodo. \\\\nDonec faucibus ipsum sit amet sem interdum, et sagittis tortor ornare. \\\\nQuisque tristique neque gravida nisi sodales mattis. Morbi malesuada \\\\nante nisi, vel venenatis lacus ultricies eu. Pellentesque id risus sit \\\\namet enim lobortis luctus. Nullam dolor purus, efficitur in massa ac, \\\\npellentesque pulvinar dui.</p>\\", \\"id\\": \\"416d47f8-c062-4a44-8d08-ed816bf0c7a7\\"}]", "date": "2019-06-14", "feed_image": 12, "carousel_items": [], "related_links": [], "tagged_items": [{"pk": null, "tag": 1, "content_object": 19}, {"pk": null, "tag": 2, "content_object": 19}]}	\N	19	1
34	f	2019-06-14 15:48:39.004445-04	{"pk": 19, "path": "0001000100040003", "depth": 4, "numchild": 0, "title": "Blog Page 3", "draft_title": "Blog Page 1", "slug": "blog-page-3", "content_type": 63, "live": true, "has_unpublished_changes": false, "url_path": "/home/blog-index/blog-page-3/", "owner": 1, "seo_title": "", "show_in_menus": true, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": "2019-06-14T19:47:02.496Z", "last_published_at": "2019-06-14T19:48:27.620Z", "latest_revision_created_at": "2019-06-14T19:48:27.193Z", "live_revision": 31, "intro": "<p></p><p>Lorem ipsum dolor sit amet, \\nconsectetur adipiscing elit. Praesent lobortis orci ex, a interdum justo\\n dapibus eu. Vestibulum sit amet risus et dolor tempor faucibus non ac \\nenim. Sed et sapien gravida, sollicitudin enim at, facilisis sapien. \\nNunc eget nibh ac libero tempus placerat. Duis quis turpis libero. Donec\\n vel tincidunt arcu. Nulla congue at risus eget egestas.</p>", "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p></p><p>Lorem ipsum dolor sit amet, \\\\nconsectetur adipiscing elit. Praesent lobortis orci ex, a interdum justo\\\\n dapibus eu. Vestibulum sit amet risus et dolor tempor faucibus non ac \\\\nenim. Sed et sapien gravida, sollicitudin enim at, facilisis sapien. \\\\nNunc eget nibh ac libero tempus placerat. Duis quis turpis libero. Donec\\\\n vel tincidunt arcu. Nulla congue at risus eget egestas.</p>\\", \\"id\\": \\"68c44c93-1225-4fe0-b4dc-1a25cf8e41ff\\"}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>Ut eget sapien ut diam feugiat fringilla. Curabitur malesuada mauris \\\\nfelis, id blandit odio consequat vitae. Ut hendrerit hendrerit ante et \\\\nfermentum. Mauris aliquam varius lorem, sed feugiat justo iaculis eget. \\\\nEtiam ornare non neque at ultrices. Phasellus quam elit, lobortis ac \\\\nimperdiet vitae, scelerisque convallis felis. Fusce a vehicula orci, et \\\\nsemper nibh. Aenean id lacus eget odio dignissim venenatis. Cras \\\\nsagittis lectus diam, ut pulvinar neque venenatis in.</p>\\", \\"id\\": \\"5f1ff927-c1d7-43df-b714-048e3faa4354\\"}, {\\"type\\": \\"image\\", \\"value\\": 12, \\"id\\": \\"1b960d50-3fdc-44ec-864d-23a0998ac5c0\\"}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>Praesent a massa id est egestas volutpat sed vitae dolor. Class aptent \\\\ntaciti sociosqu ad litora torquent per conubia nostra, per inceptos \\\\nhimenaeos. Duis sed dolor metus. Interdum et malesuada fames ac ante \\\\nipsum primis in faucibus. Nunc porttitor lacus eget bibendum commodo. \\\\nDonec faucibus ipsum sit amet sem interdum, et sagittis tortor ornare. \\\\nQuisque tristique neque gravida nisi sodales mattis. Morbi malesuada \\\\nante nisi, vel venenatis lacus ultricies eu. Pellentesque id risus sit \\\\namet enim lobortis luctus. Nullam dolor purus, efficitur in massa ac, \\\\npellentesque pulvinar dui.</p>\\", \\"id\\": \\"416d47f8-c062-4a44-8d08-ed816bf0c7a7\\"}]", "date": "2019-06-14", "feed_image": 12, "carousel_items": [], "related_links": [], "tagged_items": [{"pk": 9, "tag": 1, "content_object": 19}, {"pk": 10, "tag": 2, "content_object": 19}]}	\N	19	1
35	f	2019-06-14 15:49:05.1093-04	{"pk": 19, "path": "0001000100040003", "depth": 4, "numchild": 0, "title": "Blog Page 3", "draft_title": "Blog Page 3", "slug": "blog-page-3", "content_type": 63, "live": true, "has_unpublished_changes": false, "url_path": "/home/blog-index/blog-page-3/", "owner": 1, "seo_title": "", "show_in_menus": true, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": "2019-06-14T19:48:39.004Z", "last_published_at": "2019-06-14T19:48:39.004Z", "latest_revision_created_at": "2019-06-14T19:48:39.004Z", "live_revision": 34, "intro": "<p></p><p>Lorem ipsum dolor sit amet, \\nconsectetur adipiscing elit. Praesent lobortis orci ex, a interdum justo\\n dapibus eu. Vestibulum sit amet risus et dolor tempor faucibus non ac \\nenim. Sed et sapien gravida, sollicitudin enim at, facilisis sapien. \\nNunc eget nibh ac libero tempus placerat. Duis quis turpis libero. Donec\\n vel tincidunt arcu. Nulla congue at risus eget egestas.</p>", "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p></p><p>Lorem ipsum dolor sit amet, \\\\nconsectetur adipiscing elit. Praesent lobortis orci ex, a interdum justo\\\\n dapibus eu. Vestibulum sit amet risus et dolor tempor faucibus non ac \\\\nenim. Sed et sapien gravida, sollicitudin enim at, facilisis sapien. \\\\nNunc eget nibh ac libero tempus placerat. Duis quis turpis libero. Donec\\\\n vel tincidunt arcu. Nulla congue at risus eget egestas.</p>\\", \\"id\\": \\"68c44c93-1225-4fe0-b4dc-1a25cf8e41ff\\"}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>Ut eget sapien ut diam feugiat fringilla. Curabitur malesuada mauris \\\\nfelis, id blandit odio consequat vitae. Ut hendrerit hendrerit ante et \\\\nfermentum. Mauris aliquam varius lorem, sed feugiat justo iaculis eget. \\\\nEtiam ornare non neque at ultrices. Phasellus quam elit, lobortis ac \\\\nimperdiet vitae, scelerisque convallis felis. Fusce a vehicula orci, et \\\\nsemper nibh. Aenean id lacus eget odio dignissim venenatis. Cras \\\\nsagittis lectus diam, ut pulvinar neque venenatis in.</p>\\", \\"id\\": \\"5f1ff927-c1d7-43df-b714-048e3faa4354\\"}, {\\"type\\": \\"image\\", \\"value\\": 5, \\"id\\": \\"1b960d50-3fdc-44ec-864d-23a0998ac5c0\\"}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>Praesent a massa id est egestas volutpat sed vitae dolor. Class aptent \\\\ntaciti sociosqu ad litora torquent per conubia nostra, per inceptos \\\\nhimenaeos. Duis sed dolor metus. Interdum et malesuada fames ac ante \\\\nipsum primis in faucibus. Nunc porttitor lacus eget bibendum commodo. \\\\nDonec faucibus ipsum sit amet sem interdum, et sagittis tortor ornare. \\\\nQuisque tristique neque gravida nisi sodales mattis. Morbi malesuada \\\\nante nisi, vel venenatis lacus ultricies eu. Pellentesque id risus sit \\\\namet enim lobortis luctus. Nullam dolor purus, efficitur in massa ac, \\\\npellentesque pulvinar dui.</p>\\", \\"id\\": \\"416d47f8-c062-4a44-8d08-ed816bf0c7a7\\"}]", "date": "2019-06-14", "feed_image": 5, "carousel_items": [], "related_links": [], "tagged_items": [{"pk": null, "tag": 1, "content_object": 19}, {"pk": null, "tag": 2, "content_object": 19}]}	\N	19	1
36	f	2019-06-14 15:50:47.794336-04	{"pk": 20, "path": "000100010005", "depth": 3, "numchild": 0, "title": "Photo Gallery", "draft_title": "Photo Gallery", "slug": "photo-gallery", "content_type": 75, "live": true, "has_unpublished_changes": false, "url_path": "/home/photo-gallery/", "owner": 1, "seo_title": "", "show_in_menus": true, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": null, "last_published_at": null, "latest_revision_created_at": null, "live_revision": null, "intro": "", "feed_image": null}	\N	20	1
39	f	2019-06-14 15:51:29.693357-04	{"pk": 22, "path": "0001000100050002", "depth": 4, "numchild": 0, "title": "Gallery 2", "draft_title": "Gallery 1", "slug": "gallery-2", "content_type": 74, "live": true, "has_unpublished_changes": false, "url_path": "/home/photo-gallery/gallery-2/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": "2019-06-14T19:51:19.212Z", "last_published_at": "2019-06-14T19:51:19.212Z", "latest_revision_created_at": "2019-06-14T19:51:18.993Z", "live_revision": 37, "intro": "", "collection": 2, "images_per_page": 20, "order_images_by": 1, "feed_image": 12}	\N	22	1
40	f	2019-06-14 15:51:46.496343-04	{"pk": 22, "path": "0001000100050002", "depth": 4, "numchild": 0, "title": "Gallery 2", "draft_title": "Gallery 2", "slug": "gallery-2", "content_type": 74, "live": true, "has_unpublished_changes": false, "url_path": "/home/photo-gallery/gallery-2/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": "2019-06-14T19:51:29.693Z", "last_published_at": "2019-06-14T19:51:29.693Z", "latest_revision_created_at": "2019-06-14T19:51:29.693Z", "live_revision": 39, "intro": "", "collection": 2, "images_per_page": 20, "order_images_by": 1, "feed_image": 10}	\N	22	1
42	f	2019-06-14 15:51:57.430389-04	{"pk": 23, "path": "0001000100050003", "depth": 4, "numchild": 0, "title": "Gallery 3", "draft_title": "Gallery 1", "slug": "gallery-3", "content_type": 74, "live": true, "has_unpublished_changes": false, "url_path": "/home/photo-gallery/gallery-3/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": "2019-06-14T19:51:19.212Z", "last_published_at": "2019-06-14T19:51:19.212Z", "latest_revision_created_at": "2019-06-14T19:51:18.993Z", "live_revision": 37, "intro": "", "collection": 2, "images_per_page": 20, "order_images_by": 1, "feed_image": 12}	\N	23	1
41	f	2019-06-14 15:51:18.993173-04	{"pk": 23, "path": "0001000100050001", "depth": 4, "numchild": 0, "title": "Gallery 1", "draft_title": "Gallery 1", "slug": "gallery-1", "content_type": 74, "live": true, "has_unpublished_changes": false, "url_path": "/home/photo-gallery/gallery-1/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": null, "last_published_at": null, "latest_revision_created_at": null, "live_revision": null, "intro": "", "collection": 2, "images_per_page": 20, "order_images_by": 1, "feed_image": 12}	\N	23	1
44	f	2019-06-14 15:52:15.105215-04	{"pk": 24, "path": "0001000100050003", "depth": 4, "numchild": 0, "title": "Gallery 3", "draft_title": "Gallery 3", "slug": "gallery-3", "content_type": 74, "live": true, "has_unpublished_changes": false, "url_path": "/home/photo-gallery/gallery-3/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": "2019-06-14T19:51:57.430Z", "last_published_at": "2019-06-14T19:51:57.430Z", "latest_revision_created_at": "2019-06-14T19:51:57.430Z", "live_revision": 42, "intro": "", "collection": 2, "images_per_page": 20, "order_images_by": 1, "feed_image": 8}	\N	24	1
45	f	2019-06-14 15:51:57.430389-04	{"pk": 24, "path": "0001000100050003", "depth": 4, "numchild": 0, "title": "Gallery 3", "draft_title": "Gallery 1", "slug": "gallery-3", "content_type": 74, "live": true, "has_unpublished_changes": false, "url_path": "/home/photo-gallery/gallery-3/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": "2019-06-14T19:51:19.212Z", "last_published_at": "2019-06-14T19:51:19.212Z", "latest_revision_created_at": "2019-06-14T19:51:18.993Z", "live_revision": 37, "intro": "", "collection": 2, "images_per_page": 20, "order_images_by": 1, "feed_image": 12}	\N	24	1
46	f	2019-06-14 15:51:18.993173-04	{"pk": 24, "path": "0001000100050001", "depth": 4, "numchild": 0, "title": "Gallery 1", "draft_title": "Gallery 1", "slug": "gallery-1", "content_type": 74, "live": true, "has_unpublished_changes": false, "url_path": "/home/photo-gallery/gallery-1/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": null, "last_published_at": null, "latest_revision_created_at": null, "live_revision": null, "intro": "", "collection": 2, "images_per_page": 20, "order_images_by": 1, "feed_image": 12}	\N	24	1
47	f	2019-06-14 15:52:28.376159-04	{"pk": 24, "path": "0001000100050004", "depth": 4, "numchild": 0, "title": "Gallery 4", "draft_title": "Gallery 3", "slug": "gallery-4", "content_type": 74, "live": true, "has_unpublished_changes": false, "url_path": "/home/photo-gallery/gallery-4/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": "2019-06-14T19:51:57.430Z", "last_published_at": "2019-06-14T19:52:15.362Z", "latest_revision_created_at": "2019-06-14T19:52:15.105Z", "live_revision": 43, "intro": "", "collection": 2, "images_per_page": 20, "order_images_by": 1, "feed_image": 8}	\N	24	1
48	f	2019-06-14 15:52:49.01129-04	{"pk": 24, "path": "0001000100050004", "depth": 4, "numchild": 0, "title": "Gallery 4", "draft_title": "Gallery 4", "slug": "gallery-4", "content_type": 74, "live": true, "has_unpublished_changes": false, "url_path": "/home/photo-gallery/gallery-4/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": "2019-06-14T19:52:28.376Z", "last_published_at": "2019-06-14T19:52:28.376Z", "latest_revision_created_at": "2019-06-14T19:52:28.376Z", "live_revision": 47, "intro": "", "collection": 2, "images_per_page": 20, "order_images_by": 1, "feed_image": 5}	\N	24	1
49	f	2019-06-14 15:54:06.60246-04	{"pk": 25, "path": "000100010006", "depth": 3, "numchild": 0, "title": "Documents Gallery", "draft_title": "Documents Gallery", "slug": "documents-gallery", "content_type": 71, "live": true, "has_unpublished_changes": false, "url_path": "/home/documents-gallery/", "owner": 1, "seo_title": "", "show_in_menus": true, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": null, "last_published_at": null, "latest_revision_created_at": null, "live_revision": null, "intro": "", "feed_image": null}	\N	25	1
52	f	2019-06-14 15:58:42.206048-04	{"pk": 4, "path": "000100010001", "depth": 3, "numchild": 2, "title": "Standard Index", "draft_title": "Standard Index", "slug": "standard-index", "content_type": 32, "live": true, "has_unpublished_changes": false, "url_path": "/home/standard-index/", "owner": 1, "seo_title": "", "show_in_menus": true, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": "2019-06-14T19:36:19.792Z", "last_published_at": "2019-06-14T19:36:19.792Z", "latest_revision_created_at": "2019-06-14T19:36:19.536Z", "live_revision": 5, "subtitle": "", "intro": "<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam et \\nmauris eu nibh elementum blandit varius sit amet enim. Quisque massa \\nleo, ornare in mattis vitae, vehicula vestibulum diam. Phasellus id leo \\nplacerat, vehicula diam nec, interdum mi. Nunc lacinia massa tristique \\nnunc accumsan, eu dapibus odio feugiat. Donec varius quam dictum \\nplacerat porttitor. Vivamus fermentum cursus nibh in facilisis. Aenean \\nin justo auctor, faucibus risus eu, semper nisl. Ut nec suscipit nibh. \\nDonec feugiat eget dui in rhoncus. Curabitur imperdiet tortor ut quam \\ntempus sagittis. Morbi lectus magna, viverra ut turpis a, dapibus \\nsollicitudin diam. Morbi vel urna suscipit, sodales ante id, luctus \\nvelit.</p>", "template_string": "pages/standard_index_page.html", "feed_image": null, "related_links": []}	\N	4	1
50	f	2019-06-14 15:54:39.054947-04	{"pk": 26, "path": "0001000100060001", "depth": 4, "numchild": 0, "title": "Sample Documents", "draft_title": "Sample Documents", "slug": "sample-documents", "content_type": 72, "live": true, "has_unpublished_changes": false, "url_path": "/home/documents-gallery/sample-documents/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": null, "last_published_at": null, "latest_revision_created_at": null, "live_revision": null, "feed_image": null, "tagged_items": [{"pk": 1, "tag": 3, "content_object": 26}]}	\N	26	1
51	f	2019-06-14 15:58:05.505996-04	{"pk": 27, "path": "000100010007", "depth": 3, "numchild": 0, "title": "Contact Us", "draft_title": "Contact Us", "slug": "contact-us", "content_type": 68, "live": true, "has_unpublished_changes": false, "url_path": "/home/contact-us/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": null, "last_published_at": null, "latest_revision_created_at": null, "live_revision": null, "name_organization": "ChrisDev", "telephone": "+1 868-773-4644", "telephone_2": "", "email": "cclarke@chrisdev.com", "email_2": "", "address_1": "A3 St Benedicts Gardens", "address_2": "", "city": "Tunapuna", "country": "Trinidad", "post_code": "", "to_address": "cclarke@chrisdev.com", "from_address": "support@chrisdev.com", "subject": "Website Contact Form", "intro": "", "thank_you_text": "<p>Thanks for reaching out<br/></p>", "feed_image": null, "form_fields": [{"pk": 1, "sort_order": 0, "label": "Name", "field_type": "singleline", "required": true, "choices": "", "default_value": "", "help_text": "", "page": 27}, {"pk": 2, "sort_order": 1, "label": "Email", "field_type": "singleline", "required": true, "choices": "", "default_value": "", "help_text": "", "page": 27}, {"pk": 3, "sort_order": 2, "label": "Subject", "field_type": "singleline", "required": true, "choices": "", "default_value": "", "help_text": "", "page": 27}, {"pk": 4, "sort_order": 3, "label": "Message", "field_type": "multiline", "required": true, "choices": "", "default_value": "", "help_text": "", "page": 27}]}	\N	27	1
5	f	2019-06-14 15:36:19.536258-04	{"pk": 4, "path": "000100010001", "depth": 3, "numchild": 0, "title": "Standard Index", "draft_title": "Standard Index", "slug": "standard-index", "content_type": 32, "live": true, "has_unpublished_changes": false, "url_path": "/home/standard-index/", "owner": 1, "seo_title": "", "show_in_menus": true, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": null, "last_published_at": null, "latest_revision_created_at": null, "live_revision": null, "subtitle": "", "intro": "<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam et \\nmauris eu nibh elementum blandit varius sit amet enim. Quisque massa \\nleo, ornare in mattis vitae, vehicula vestibulum diam. Phasellus id leo \\nplacerat, vehicula diam nec, interdum mi. Nunc lacinia massa tristique \\nnunc accumsan, eu dapibus odio feugiat. Donec varius quam dictum \\nplacerat porttitor. Vivamus fermentum cursus nibh in facilisis. Aenean \\nin justo auctor, faucibus risus eu, semper nisl. Ut nec suscipit nibh. \\nDonec feugiat eget dui in rhoncus. Curabitur imperdiet tortor ut quam \\ntempus sagittis. Morbi lectus magna, viverra ut turpis a, dapibus \\nsollicitudin diam. Morbi vel urna suscipit, sodales ante id, luctus \\nvelit.</p>", "template_string": "pages/standard_index_page.html", "feed_image": 12, "related_links": []}	\N	4	1
53	f	2019-06-17 11:23:22.820909-04	{"pk": 28, "path": "000100010008", "depth": 3, "numchild": 0, "title": "Calendar", "draft_title": "Calendar", "slug": "calendar", "content_type": 87, "live": true, "has_unpublished_changes": false, "url_path": "/home/calendar/", "owner": 1, "seo_title": "", "show_in_menus": true, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": null, "last_published_at": null, "latest_revision_created_at": null, "live_revision": null, "intro": "", "view_choices": "L,W,M", "default_view": "M"}	\N	28	1
55	f	2019-06-17 13:09:50.700466-04	{"pk": 29, "path": "0001000100040001", "depth": 4, "numchild": 0, "title": "Event 1", "draft_title": "Events 1", "slug": "event-1", "content_type": 94, "live": true, "has_unpublished_changes": false, "url_path": "/home/calendar/events-1/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": "2019-06-17T15:32:12.687Z", "last_published_at": "2019-06-17T15:32:12.687Z", "latest_revision_created_at": "2019-06-17T15:32:10.673Z", "live_revision": 54, "uid": "3f56be10-6d0c-44ba-ab9b-cdf64054a19a", "category": null, "image": 12, "time_from": "09:00:00", "time_to": null, "tz": "UTC", "group_page": null, "details": "", "location": "ChrisDev", "website": "", "date": "2019-06-29"}	\N	29	1
54	f	2019-06-17 11:32:10.673548-04	{"pk": 29, "path": "0001000100040001", "depth": 4, "numchild": 0, "title": "Events 1", "draft_title": "Events 1", "slug": "events-1", "content_type": 94, "live": true, "has_unpublished_changes": false, "url_path": "/home/calendar/events-1/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": null, "last_published_at": null, "latest_revision_created_at": null, "live_revision": null, "uid": "3f56be10-6d0c-44ba-ab9b-cdf64054a19a", "category": null, "image": 12, "time_from": "09:00:00", "time_to": null, "tz": "UTC", "group_page": null, "details": "", "location": "ChrisDev", "website": "", "date": "2019-06-29"}	\N	29	1
56	f	2019-06-17 13:10:51.173843-04	{"pk": 29, "path": "0001000100040001", "depth": 4, "numchild": 0, "title": "Event 1", "draft_title": "Event 1", "slug": "event-1", "content_type": 94, "live": true, "has_unpublished_changes": false, "url_path": "/home/calendar/event-1/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": "2019-06-17T15:32:12.687Z", "last_published_at": "2019-06-17T17:09:52.904Z", "latest_revision_created_at": "2019-06-17T17:09:50.700Z", "live_revision": 55, "uid": "3f56be10-6d0c-44ba-ab9b-cdf64054a19a", "category": null, "image": 12, "time_from": "09:00:00", "time_to": null, "tz": "UTC", "group_page": null, "details": "<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque \\nvitae volutpat enim. Integer vitae tristique lacus. Mauris euismod \\nligula lorem, a malesuada ex consequat nec. Donec in posuere tellus, non\\n rutrum lacus. Integer volutpat lacus tortor, a ullamcorper velit \\npretium vel. Proin erat quam, molestie quis viverra consequat, \\nsollicitudin vel enim.</p>", "location": "ChrisDev", "website": "https://chrisdev.com/", "date": "2019-06-29"}	\N	29	1
57	f	2019-06-17 13:09:50.700466-04	{"pk": 30, "path": "0001000100040001", "depth": 4, "numchild": 0, "title": "Event 1", "draft_title": "Events 1", "slug": "event-1", "content_type": 94, "live": true, "has_unpublished_changes": false, "url_path": "/home/calendar/events-1/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": "2019-06-17T15:32:12.687Z", "last_published_at": "2019-06-17T15:32:12.687Z", "latest_revision_created_at": "2019-06-17T15:32:10.673Z", "live_revision": 54, "uid": "3f56be10-6d0c-44ba-ab9b-cdf64054a19a", "category": null, "image": 12, "time_from": "09:00:00", "time_to": null, "tz": "UTC", "group_page": null, "details": "", "location": "ChrisDev", "website": "", "date": "2019-06-29"}	\N	30	1
58	f	2019-06-17 11:32:10.673548-04	{"pk": 30, "path": "0001000100040001", "depth": 4, "numchild": 0, "title": "Events 1", "draft_title": "Events 1", "slug": "events-1", "content_type": 94, "live": true, "has_unpublished_changes": false, "url_path": "/home/calendar/events-1/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": null, "last_published_at": null, "latest_revision_created_at": null, "live_revision": null, "uid": "3f56be10-6d0c-44ba-ab9b-cdf64054a19a", "category": null, "image": 12, "time_from": "09:00:00", "time_to": null, "tz": "UTC", "group_page": null, "details": "", "location": "ChrisDev", "website": "", "date": "2019-06-29"}	\N	30	1
59	f	2019-06-17 13:10:51.173843-04	{"pk": 30, "path": "0001000100040001", "depth": 4, "numchild": 0, "title": "Event 1", "draft_title": "Event 1", "slug": "event-1", "content_type": 94, "live": true, "has_unpublished_changes": false, "url_path": "/home/calendar/event-1/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": "2019-06-17T15:32:12.687Z", "last_published_at": "2019-06-17T17:09:52.904Z", "latest_revision_created_at": "2019-06-17T17:09:50.700Z", "live_revision": 55, "uid": "3f56be10-6d0c-44ba-ab9b-cdf64054a19a", "category": null, "image": 12, "time_from": "09:00:00", "time_to": null, "tz": "UTC", "group_page": null, "details": "<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque \\nvitae volutpat enim. Integer vitae tristique lacus. Mauris euismod \\nligula lorem, a malesuada ex consequat nec. Donec in posuere tellus, non\\n rutrum lacus. Integer volutpat lacus tortor, a ullamcorper velit \\npretium vel. Proin erat quam, molestie quis viverra consequat, \\nsollicitudin vel enim.</p>", "location": "ChrisDev", "website": "https://chrisdev.com/", "date": "2019-06-29"}	\N	30	1
60	f	2019-06-17 13:11:24.470969-04	{"pk": 30, "path": "0001000100040002", "depth": 4, "numchild": 0, "title": "Event 2", "draft_title": "Event 1", "slug": "event-2", "content_type": 94, "live": true, "has_unpublished_changes": false, "url_path": "/home/calendar/event-2/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": "2019-06-17T15:32:12.687Z", "last_published_at": "2019-06-17T17:10:53.444Z", "latest_revision_created_at": "2019-06-17T17:10:51.173Z", "live_revision": 56, "uid": "3f56be10-6d0c-44ba-ab9b-cdf64054a19a", "category": null, "image": 12, "time_from": "09:00:00", "time_to": null, "tz": "UTC", "group_page": null, "details": "<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque \\nvitae volutpat enim. Integer vitae tristique lacus. Mauris euismod \\nligula lorem, a malesuada ex consequat nec. Donec in posuere tellus, non\\n rutrum lacus. Integer volutpat lacus tortor, a ullamcorper velit \\npretium vel. Proin erat quam, molestie quis viverra consequat, \\nsollicitudin vel enim.</p>", "location": "ChrisDev", "website": "https://chrisdev.com/", "date": "2019-06-29"}	\N	30	1
61	f	2019-06-17 13:12:06.62998-04	{"pk": 30, "path": "0001000100040002", "depth": 4, "numchild": 0, "title": "Event 2", "draft_title": "Event 2", "slug": "event-2", "content_type": 94, "live": true, "has_unpublished_changes": false, "url_path": "/home/calendar/event-2/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": "2019-06-17T17:11:24.470Z", "last_published_at": "2019-06-17T17:11:24.470Z", "latest_revision_created_at": "2019-06-17T17:11:24.470Z", "live_revision": 60, "uid": "3f56be10-6d0c-44ba-ab9b-cdf64054a19a", "category": null, "image": 5, "time_from": "09:00:00", "time_to": null, "tz": "UTC", "group_page": null, "details": "<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque \\nvitae volutpat enim. Integer vitae tristique lacus. Mauris euismod \\nligula lorem, a malesuada ex consequat nec. Donec in posuere tellus, non\\n rutrum lacus. Integer volutpat lacus tortor, a ullamcorper velit \\npretium vel. Proin erat quam, molestie quis viverra consequat, \\nsollicitudin vel enim.</p>", "location": "ChrisDev", "website": "https://chrisdev.com/", "date": "2019-08-30"}	\N	30	1
\.


--
-- Data for Name: wagtailcore_pageviewrestriction; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.wagtailcore_pageviewrestriction (id, password, page_id, restriction_type) FROM stdin;
\.


--
-- Data for Name: wagtailcore_pageviewrestriction_groups; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.wagtailcore_pageviewrestriction_groups (id, pageviewrestriction_id, group_id) FROM stdin;
\.


--
-- Data for Name: wagtailcore_site; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.wagtailcore_site (id, hostname, port, is_default_site, root_page_id, site_name) FROM stdin;
2	localhost	80	t	3	\N
\.


--
-- Data for Name: wagtaildocs_document; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.wagtaildocs_document (id, title, file, created_at, uploaded_by_user_id, collection_id, file_size, file_hash) FROM stdin;
1	document.doc	documents/document.doc	2019-06-14 15:53:09.080197-04	1	1	17408	b31c1e43f5ab81c3a4da931d42c4bf6a04ba66e3
2	example.docx	documents/example.docx	2019-06-14 15:53:09.266253-04	1	1	5019	a260e7e17082db00ac4b0803e330c1b7bed58a22
3	sample.pdf	documents/sample.pdf	2019-06-14 15:53:09.481036-04	1	1	21653	730c657b5d70b2bf6ba9c8ac1cd8fa1497e9f3a6
\.


--
-- Data for Name: wagtailembeds_embed; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.wagtailembeds_embed (id, url, max_width, type, html, title, author_name, provider_name, thumbnail_url, width, height, last_updated) FROM stdin;
\.


--
-- Data for Name: wagtailforms_formsubmission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.wagtailforms_formsubmission (id, form_data, submit_time, page_id) FROM stdin;
\.


--
-- Data for Name: wagtailimages_image; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.wagtailimages_image (id, title, file, width, height, created_at, focal_point_x, focal_point_y, focal_point_width, focal_point_height, uploaded_by_user_id, file_size, collection_id, file_hash) FROM stdin;
1	ansible.png	original_images/ansible.png	512	512	2019-06-14 15:26:06.962329-04	\N	\N	\N	\N	1	43211	1	fdb2a5727ba217e18f28459c63b462b88769654a
2	bulding-blocks.png	original_images/bulding-blocks.png	500	500	2019-06-14 15:26:07.269578-04	\N	\N	\N	\N	1	99476	1	9fac0265b07e229b5c38c0a1bf12492f689f9648
3	chrisdevf_favicon.png	original_images/chrisdevf_favicon.png	500	500	2019-06-14 15:26:07.714593-04	\N	\N	\N	\N	1	4828	1	2f3a60de387c04b1dca172503b56d442aa9c9e61
4	digital_ocean.png	original_images/digital_ocean.png	512	512	2019-06-14 15:26:08.359961-04	\N	\N	\N	\N	1	58324	1	5b47b630fadb0d47632ca7be9a2f386817bc6eff
6	linode.png	original_images/linode.png	400	400	2019-06-14 15:26:09.005372-04	\N	\N	\N	\N	1	35245	1	b1db7d3a04d7daa4f657572655e2a59dd14018a9
7	placeholder_person.png	original_images/placeholder_person.png	600	568	2019-06-14 15:26:09.342883-04	\N	\N	\N	\N	1	10449	1	c94311d00cb95d341442ece461b91ce0957d0ac8
9	postgresql.png	original_images/postgresql.png	512	512	2019-06-14 15:26:10.016311-04	\N	\N	\N	\N	1	225303	1	ba0adf814d498d4e13ba300bd847543ffb4bf7c8
11	sass.png	original_images/sass.png	512	512	2019-06-14 15:26:10.542787-04	\N	\N	\N	\N	1	88756	1	40618c87f25e7a952d206644036eb89ff0e0cd89
13	wagtail.png	original_images/wagtail.png	512	512	2019-06-14 15:26:11.192611-04	\N	\N	\N	\N	1	28197	1	d270fb825c082d3db60cd64dc86532e97a2f817c
14	yeti.png	original_images/yeti.png	512	512	2019-06-14 15:26:11.491143-04	\N	\N	\N	\N	1	101373	1	163060b48aa8c511689e848f0bc0cff76fb46b3b
5	foundation.jpg	original_images/foundation.jpg	1300	500	2019-06-14 15:26:08.726286-04	\N	\N	\N	\N	1	131208	2	b2dcc425b1932c171d3611b973927aa6a4379c64
8	postgresql.jpg	original_images/postgresql.jpg	1300	500	2019-06-14 15:26:09.673878-04	\N	\N	\N	\N	1	117964	2	b0802a74daf625d13a7b4dc8984cc44d04d8fb00
10	sass.jpg	original_images/sass.jpg	1300	500	2019-06-14 15:26:10.249268-04	\N	\N	\N	\N	1	158244	2	b1cc7fbb885c3ae6079898d010b944f986dcc630
12	wagtail.jpg	original_images/wagtail.jpg	1300	500	2019-06-14 15:26:10.960597-04	\N	\N	\N	\N	1	60370	2	ed81f5a7c6337728c4203e9e84b0c8d2a4171e8a
\.


--
-- Data for Name: wagtailimages_rendition; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.wagtailimages_rendition (id, file, width, height, focal_point_key, filter_spec, image_id) FROM stdin;
1	images/yeti.max-165x165.png	165	165		max-165x165	14
2	images/wagtail.max-165x165.png	165	165		max-165x165	13
3	images/wagtail.max-165x165.jpg	165	63		max-165x165	12
4	images/sass.max-165x165.png	165	165		max-165x165	11
5	images/sass.max-165x165.jpg	165	63		max-165x165	10
6	images/postgresql.max-165x165.png	165	165		max-165x165	9
7	images/postgresql.max-165x165.jpg	165	63		max-165x165	8
8	images/placeholder_person.max-165x165.png	165	156		max-165x165	7
9	images/linode.max-165x165.png	165	165		max-165x165	6
10	images/foundation.max-165x165.jpg	165	63		max-165x165	5
11	images/digital_ocean.max-165x165.png	165	165		max-165x165	4
12	images/chrisdevf_favicon.max-165x165.png	165	165		max-165x165	3
13	images/bulding-blocks.max-165x165.png	165	165		max-165x165	2
14	images/ansible.max-165x165.png	165	165		max-165x165	1
15	images/chrisdevf_favicon.width-80.png	80	80		width-80	3
16	images/yeti.2e16d0ba.fill-350x350.png	350	350	2e16d0ba	fill-350x350	14
17	images/wagtail.2e16d0ba.fill-350x350.png	350	350	2e16d0ba	fill-350x350	13
18	images/sass.2e16d0ba.fill-350x350.png	350	350	2e16d0ba	fill-350x350	11
19	images/bulding-blocks.2e16d0ba.fill-350x350.png	350	350	2e16d0ba	fill-350x350	2
20	images/ansible.2e16d0ba.fill-350x350.png	350	350	2e16d0ba	fill-350x350	1
21	images/postgresql.2e16d0ba.fill-350x350.png	350	350	2e16d0ba	fill-350x350	9
22	images/linode.2e16d0ba.fill-350x350.png	350	350	2e16d0ba	fill-350x350	6
23	images/wagtail.original.jpg	1300	500		original	12
24	images/wagtail.max-800x600.jpg	800	307		max-800x600	12
25	images/sass.original.jpg	1300	500		original	10
26	images/sass.max-800x600.jpg	800	307		max-800x600	10
27	images/postgresql.original.jpg	1300	500		original	8
28	images/postgresql.max-800x600.jpg	800	307		max-800x600	8
29	images/foundation.original.jpg	1300	500		original	5
30	images/foundation.max-800x600.jpg	800	307		max-800x600	5
31	images/wagtail.width-1200.jpg	1200	461		width-1200	12
32	images/placeholder_person.2e16d0ba.fill-400x400.png	400	400	2e16d0ba	fill-400x400	7
33	images/placeholder_person.width-180.png	180	170		width-180	7
34	images/postgresql.2e16d0ba.fill-1200x600.jpg	1000	500	2e16d0ba	fill-1200x600	8
35	images/wagtail.2e16d0ba.fill-1200x600.jpg	1000	500	2e16d0ba	fill-1200x600	12
36	images/foundation.2e16d0ba.fill-1200x600.jpg	1000	500	2e16d0ba	fill-1200x600	5
37	images/postgresql.width-1200.jpg	1200	461		width-1200	8
38	images/postgresql.2e16d0ba.fill-1200x400.jpg	1200	400	2e16d0ba	fill-1200x400	8
39	images/wagtail.2e16d0ba.fill-1200x400.jpg	1200	400	2e16d0ba	fill-1200x400	12
40	images/foundation.width-1200.jpg	1200	461		width-1200	5
41	images/foundation.2e16d0ba.fill-1200x400.jpg	1200	400	2e16d0ba	fill-1200x400	5
42	images/foundation.2e16d0ba.fill-1200x700.jpg	858	500	2e16d0ba	fill-1200x700	5
43	images/postgresql.2e16d0ba.fill-1200x700.jpg	858	500	2e16d0ba	fill-1200x700	8
44	images/sass.2e16d0ba.fill-1200x700.jpg	858	500	2e16d0ba	fill-1200x700	10
45	images/wagtail.2e16d0ba.fill-1200x700.jpg	858	500	2e16d0ba	fill-1200x700	12
46	images/wagtail.2e16d0ba.fill-350x300.jpg	350	300	2e16d0ba	fill-350x300	12
47	images/sass.2e16d0ba.fill-350x300.jpg	350	300	2e16d0ba	fill-350x300	10
48	images/postgresql.2e16d0ba.fill-350x300.jpg	350	300	2e16d0ba	fill-350x300	8
49	images/foundation.2e16d0ba.fill-350x300.jpg	350	300	2e16d0ba	fill-350x300	5
50	images/yeti.original.png	512	512		original	14
51	images/yeti.max-800x600.png	512	512		max-800x600	14
52	images/wagtail.original.png	512	512		original	13
53	images/wagtail.max-800x600.png	512	512		max-800x600	13
54	images/sass.original.png	512	512		original	11
55	images/sass.max-800x600.png	512	512		max-800x600	11
56	images/placeholder_person.original.png	600	568		original	7
57	images/placeholder_person.max-800x600.png	600	568		max-800x600	7
58	images/linode.original.png	400	400		original	6
60	images/postgresql.original.png	512	512		original	9
61	images/chrisdevf_favicon.original.png	500	500		original	3
62	images/linode.max-800x600.png	400	400		max-800x600	6
63	images/bulding-blocks.original.png	500	500		original	2
64	images/chrisdevf_favicon.max-800x600.png	500	500		max-800x600	3
65	images/ansible.original.png	512	512		original	1
66	images/bulding-blocks.max-800x600.png	500	500		max-800x600	2
67	images/ansible.max-800x600.png	512	512		max-800x600	1
68	images/postgresql.max-800x600.png	512	512		max-800x600	9
69	images/digital_ocean.original_pjO15CT.png	512	512		original	4
70	images/digital_ocean.max-800x600.png	512	512		max-800x600	4
71	images/wagtail.width-350.jpg	350	134		width-350	12
72	images/wagtail.width-250.jpg	250	96		width-250	12
73	images/foundation.width-250.jpg	250	96		width-250	5
74	images/foundation.width-350.jpg	350	134		width-350	5
\.


--
-- Data for Name: wagtailimages_uploadedimage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.wagtailimages_uploadedimage (id, file, uploaded_by_user_id) FROM stdin;
\.


--
-- Data for Name: wagtailredirects_redirect; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.wagtailredirects_redirect (id, old_path, is_permanent, redirect_link, redirect_page_id, site_id) FROM stdin;
\.


--
-- Data for Name: wagtailsearch_query; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.wagtailsearch_query (id, query_string) FROM stdin;
\.


--
-- Data for Name: wagtailsearch_querydailyhits; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.wagtailsearch_querydailyhits (id, date, hits, query_id) FROM stdin;
\.


--
-- Data for Name: wagtailsearchpromotions_searchpromotion; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.wagtailsearchpromotions_searchpromotion (id, sort_order, description, page_id, query_id) FROM stdin;
\.


--
-- Data for Name: wagtailusers_userprofile; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.wagtailusers_userprofile (id, submitted_notifications, approved_notifications, rejected_notifications, user_id, preferred_language, current_time_zone, avatar) FROM stdin;
\.


--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.account_emailaddress_id_seq', 3, true);


--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.account_emailconfirmation_id_seq', 1, false);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 2, true);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 14, true);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 397, true);


--
-- Name: blog_blogindexpagerelatedlink_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.blog_blogindexpagerelatedlink_id_seq', 1, false);


--
-- Name: blog_blogpagecarouselitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.blog_blogpagecarouselitem_id_seq', 1, false);


--
-- Name: blog_blogpagerelatedlink_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.blog_blogpagerelatedlink_id_seq', 1, false);


--
-- Name: blog_blogpagetag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.blog_blogpagetag_id_seq', 12, true);


--
-- Name: contact_contactformfield_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.contact_contactformfield_id_seq', 4, true);


--
-- Name: contact_formfield_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.contact_formfield_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 100, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 233, true);


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.django_site_id_seq', 3, true);


--
-- Name: documents_gallery_documentspagetag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.documents_gallery_documentspagetag_id_seq', 1, true);


--
-- Name: events_eventindexpagerelatedlink_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.events_eventindexpagerelatedlink_id_seq', 1, false);


--
-- Name: events_eventpagecarouselitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.events_eventpagecarouselitem_id_seq', 1, false);


--
-- Name: events_eventpagerelatedlink_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.events_eventpagerelatedlink_id_seq', 1, false);


--
-- Name: events_eventpagespeaker_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.events_eventpagespeaker_id_seq', 1, false);


--
-- Name: events_eventpagetag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.events_eventpagetag_id_seq', 1, false);


--
-- Name: joyous_eventcategory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.joyous_eventcategory_id_seq', 1, false);


--
-- Name: pages_advert_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.pages_advert_id_seq', 1, false);


--
-- Name: pages_contentblock_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.pages_contentblock_id_seq', 1, false);


--
-- Name: pages_homepagecarouselitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.pages_homepagecarouselitem_id_seq', 1, false);


--
-- Name: pages_homepagecontentitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.pages_homepagecontentitem_id_seq', 7, true);


--
-- Name: pages_homepagerelatedlink_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.pages_homepagerelatedlink_id_seq', 1, false);


--
-- Name: pages_sitebranding_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.pages_sitebranding_id_seq', 1, true);


--
-- Name: pages_socialmediasettings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.pages_socialmediasettings_id_seq', 1, true);


--
-- Name: pages_standardindexpagerelatedlink_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.pages_standardindexpagerelatedlink_id_seq', 1, false);


--
-- Name: pages_standardpagecarouselitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.pages_standardpagecarouselitem_id_seq', 1, false);


--
-- Name: pages_standardpagerelatedlink_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.pages_standardpagerelatedlink_id_seq', 1, false);


--
-- Name: pages_testimonial_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.pages_testimonial_id_seq', 1, false);


--
-- Name: pages_videopagecarouselitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.pages_videopagecarouselitem_id_seq', 1, false);


--
-- Name: people_personindexpagerelatedlink_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.people_personindexpagerelatedlink_id_seq', 1, false);


--
-- Name: people_personpagerelatedlink_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.people_personpagerelatedlink_id_seq', 1, false);


--
-- Name: people_personpagetag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.people_personpagetag_id_seq', 1, false);


--
-- Name: people_personrole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.people_personrole_id_seq', 1, false);


--
-- Name: postgres_search_indexentry_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.postgres_search_indexentry_id_seq', 189, true);


--
-- Name: products_productindexpagerelatedlink_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.products_productindexpagerelatedlink_id_seq', 1, false);


--
-- Name: products_productpagerelatedlink_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.products_productpagerelatedlink_id_seq', 1, false);


--
-- Name: products_productpagetag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.products_productpagetag_id_seq', 1, false);


--
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.socialaccount_socialaccount_id_seq', 1, false);


--
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.socialaccount_socialapp_id_seq', 1, false);


--
-- Name: socialaccount_socialapp_sites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.socialaccount_socialapp_sites_id_seq', 1, false);


--
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.socialaccount_socialtoken_id_seq', 1, false);


--
-- Name: taggit_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.taggit_tag_id_seq', 3, true);


--
-- Name: taggit_taggeditem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.taggit_taggeditem_id_seq', 3, true);


--
-- Name: users_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_user_groups_id_seq', 1, false);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_user_id_seq', 3, true);


--
-- Name: users_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_user_user_permissions_id_seq', 1, false);


--
-- Name: wagtail_feeds_rssfeedssettings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.wagtail_feeds_rssfeedssettings_id_seq', 1, true);


--
-- Name: wagtailcore_collection_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.wagtailcore_collection_id_seq', 2, true);


--
-- Name: wagtailcore_collectionviewrestriction_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.wagtailcore_collectionviewrestriction_groups_id_seq', 1, false);


--
-- Name: wagtailcore_collectionviewrestriction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.wagtailcore_collectionviewrestriction_id_seq', 1, false);


--
-- Name: wagtailcore_groupcollectionpermission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.wagtailcore_groupcollectionpermission_id_seq', 8, true);


--
-- Name: wagtailcore_grouppagepermission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.wagtailcore_grouppagepermission_id_seq', 7, true);


--
-- Name: wagtailcore_page_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.wagtailcore_page_id_seq', 30, true);


--
-- Name: wagtailcore_pagerevision_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.wagtailcore_pagerevision_id_seq', 61, true);


--
-- Name: wagtailcore_pageviewrestriction_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.wagtailcore_pageviewrestriction_groups_id_seq', 1, false);


--
-- Name: wagtailcore_pageviewrestriction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.wagtailcore_pageviewrestriction_id_seq', 1, false);


--
-- Name: wagtailcore_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.wagtailcore_site_id_seq', 2, true);


--
-- Name: wagtaildocs_document_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.wagtaildocs_document_id_seq', 3, true);


--
-- Name: wagtailembeds_embed_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.wagtailembeds_embed_id_seq', 1, false);


--
-- Name: wagtailforms_formsubmission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.wagtailforms_formsubmission_id_seq', 1, false);


--
-- Name: wagtailimages_image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.wagtailimages_image_id_seq', 14, true);


--
-- Name: wagtailimages_rendition_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.wagtailimages_rendition_id_seq', 74, true);


--
-- Name: wagtailimages_uploadedimage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.wagtailimages_uploadedimage_id_seq', 1, false);


--
-- Name: wagtailredirects_redirect_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.wagtailredirects_redirect_id_seq', 1, false);


--
-- Name: wagtailsearch_editorspick_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.wagtailsearch_editorspick_id_seq', 1, false);


--
-- Name: wagtailsearch_query_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.wagtailsearch_query_id_seq', 1, false);


--
-- Name: wagtailsearch_querydailyhits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.wagtailsearch_querydailyhits_id_seq', 1, false);


--
-- Name: wagtailusers_userprofile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.wagtailusers_userprofile_id_seq', 1, false);


--
-- Name: account_emailaddress account_emailaddress_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_email_key UNIQUE (email);


--
-- Name: account_emailaddress account_emailaddress_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_pkey PRIMARY KEY (id);


--
-- Name: account_emailconfirmation account_emailconfirmation_key_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_key_key UNIQUE (key);


--
-- Name: account_emailconfirmation account_emailconfirmation_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: blog_blogindexpage blog_blogindexpage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.blog_blogindexpage
    ADD CONSTRAINT blog_blogindexpage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: blog_blogindexpagerelatedlink blog_blogindexpagerelatedlink_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.blog_blogindexpagerelatedlink
    ADD CONSTRAINT blog_blogindexpagerelatedlink_pkey PRIMARY KEY (id);


--
-- Name: blog_blogpage blog_blogpage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.blog_blogpage
    ADD CONSTRAINT blog_blogpage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: blog_blogpagecarouselitem blog_blogpagecarouselitem_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.blog_blogpagecarouselitem
    ADD CONSTRAINT blog_blogpagecarouselitem_pkey PRIMARY KEY (id);


--
-- Name: blog_blogpagerelatedlink blog_blogpagerelatedlink_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.blog_blogpagerelatedlink
    ADD CONSTRAINT blog_blogpagerelatedlink_pkey PRIMARY KEY (id);


--
-- Name: blog_blogpagetag blog_blogpagetag_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.blog_blogpagetag
    ADD CONSTRAINT blog_blogpagetag_pkey PRIMARY KEY (id);


--
-- Name: contact_contactformfield contact_contactformfield_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contact_contactformfield
    ADD CONSTRAINT contact_contactformfield_pkey PRIMARY KEY (id);


--
-- Name: contact_contactpage contact_contactpage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contact_contactpage
    ADD CONSTRAINT contact_contactpage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: contact_formfield contact_formfield_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contact_formfield
    ADD CONSTRAINT contact_formfield_pkey PRIMARY KEY (id);


--
-- Name: contact_formpage contact_formpage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contact_formpage
    ADD CONSTRAINT contact_formpage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site django_site_domain_a2e37b91_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_domain_a2e37b91_uniq UNIQUE (domain);


--
-- Name: django_site django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: documents_gallery_documentsindexpage documents_gallery_documentsindexpage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.documents_gallery_documentsindexpage
    ADD CONSTRAINT documents_gallery_documentsindexpage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: documents_gallery_documentspage documents_gallery_documentspage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.documents_gallery_documentspage
    ADD CONSTRAINT documents_gallery_documentspage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: documents_gallery_documentspagetag documents_gallery_documentspagetag_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.documents_gallery_documentspagetag
    ADD CONSTRAINT documents_gallery_documentspagetag_pkey PRIMARY KEY (id);


--
-- Name: events_eventindexpage events_eventindexpage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.events_eventindexpage
    ADD CONSTRAINT events_eventindexpage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: events_eventindexpagerelatedlink events_eventindexpagerelatedlink_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.events_eventindexpagerelatedlink
    ADD CONSTRAINT events_eventindexpagerelatedlink_pkey PRIMARY KEY (id);


--
-- Name: events_eventpage events_eventpage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.events_eventpage
    ADD CONSTRAINT events_eventpage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: events_eventpagecarouselitem events_eventpagecarouselitem_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.events_eventpagecarouselitem
    ADD CONSTRAINT events_eventpagecarouselitem_pkey PRIMARY KEY (id);


--
-- Name: events_eventpagerelatedlink events_eventpagerelatedlink_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.events_eventpagerelatedlink
    ADD CONSTRAINT events_eventpagerelatedlink_pkey PRIMARY KEY (id);


--
-- Name: events_eventpagespeaker events_eventpagespeaker_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.events_eventpagespeaker
    ADD CONSTRAINT events_eventpagespeaker_pkey PRIMARY KEY (id);


--
-- Name: events_eventpagetag events_eventpagetag_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.events_eventpagetag
    ADD CONSTRAINT events_eventpagetag_pkey PRIMARY KEY (id);


--
-- Name: gallery_galleryindex gallery_galleryindex_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.gallery_galleryindex
    ADD CONSTRAINT gallery_galleryindex_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: gallery_photogalleryindexpage gallery_photogalleryindexpage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.gallery_photogalleryindexpage
    ADD CONSTRAINT gallery_photogalleryindexpage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: joyous_calendarpage joyous_calendarpage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.joyous_calendarpage
    ADD CONSTRAINT joyous_calendarpage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: joyous_cancellationpage joyous_cancellationpage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.joyous_cancellationpage
    ADD CONSTRAINT joyous_cancellationpage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: joyous_eventcategory joyous_eventcategory_code_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.joyous_eventcategory
    ADD CONSTRAINT joyous_eventcategory_code_key UNIQUE (code);


--
-- Name: joyous_eventcategory joyous_eventcategory_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.joyous_eventcategory
    ADD CONSTRAINT joyous_eventcategory_pkey PRIMARY KEY (id);


--
-- Name: joyous_extrainfopage joyous_extrainfopage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.joyous_extrainfopage
    ADD CONSTRAINT joyous_extrainfopage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: joyous_grouppage joyous_grouppage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.joyous_grouppage
    ADD CONSTRAINT joyous_grouppage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: joyous_multidayeventpage joyous_multidayeventpage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.joyous_multidayeventpage
    ADD CONSTRAINT joyous_multidayeventpage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: joyous_postponementpage joyous_postponementpage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.joyous_postponementpage
    ADD CONSTRAINT joyous_postponementpage_pkey PRIMARY KEY (cancellationpage_ptr_id);


--
-- Name: joyous_recurringeventpage joyous_recurringeventpage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.joyous_recurringeventpage
    ADD CONSTRAINT joyous_recurringeventpage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: joyous_simpleeventpage joyous_simpleeventpage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.joyous_simpleeventpage
    ADD CONSTRAINT joyous_simpleeventpage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: pages_advert pages_advert_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_advert
    ADD CONSTRAINT pages_advert_pkey PRIMARY KEY (id);


--
-- Name: pages_contentblock pages_contentblock_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_contentblock
    ADD CONSTRAINT pages_contentblock_pkey PRIMARY KEY (id);


--
-- Name: pages_faqspage pages_faqspage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_faqspage
    ADD CONSTRAINT pages_faqspage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: pages_homepage pages_homepage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_homepage
    ADD CONSTRAINT pages_homepage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: pages_homepagecarouselitem pages_homepagecarouselitem_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_homepagecarouselitem
    ADD CONSTRAINT pages_homepagecarouselitem_pkey PRIMARY KEY (id);


--
-- Name: pages_homepagecontentitem pages_homepagecontentitem_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_homepagecontentitem
    ADD CONSTRAINT pages_homepagecontentitem_pkey PRIMARY KEY (id);


--
-- Name: pages_homepagerelatedlink pages_homepagerelatedlink_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_homepagerelatedlink
    ADD CONSTRAINT pages_homepagerelatedlink_pkey PRIMARY KEY (id);


--
-- Name: pages_sitebranding pages_sitebranding_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_sitebranding
    ADD CONSTRAINT pages_sitebranding_pkey PRIMARY KEY (id);


--
-- Name: pages_sitebranding pages_sitebranding_site_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_sitebranding
    ADD CONSTRAINT pages_sitebranding_site_id_key UNIQUE (site_id);


--
-- Name: pages_socialmediasettings pages_socialmediasettings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_socialmediasettings
    ADD CONSTRAINT pages_socialmediasettings_pkey PRIMARY KEY (id);


--
-- Name: pages_socialmediasettings pages_socialmediasettings_site_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_socialmediasettings
    ADD CONSTRAINT pages_socialmediasettings_site_id_key UNIQUE (site_id);


--
-- Name: pages_standardindexpage pages_standardindexpage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_standardindexpage
    ADD CONSTRAINT pages_standardindexpage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: pages_standardindexpagerelatedlink pages_standardindexpagerelatedlink_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_standardindexpagerelatedlink
    ADD CONSTRAINT pages_standardindexpagerelatedlink_pkey PRIMARY KEY (id);


--
-- Name: pages_standardpage pages_standardpage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_standardpage
    ADD CONSTRAINT pages_standardpage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: pages_standardpagecarouselitem pages_standardpagecarouselitem_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_standardpagecarouselitem
    ADD CONSTRAINT pages_standardpagecarouselitem_pkey PRIMARY KEY (id);


--
-- Name: pages_standardpagerelatedlink pages_standardpagerelatedlink_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_standardpagerelatedlink
    ADD CONSTRAINT pages_standardpagerelatedlink_pkey PRIMARY KEY (id);


--
-- Name: pages_testimonial pages_testimonial_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_testimonial
    ADD CONSTRAINT pages_testimonial_pkey PRIMARY KEY (id);


--
-- Name: pages_testimonialpage pages_testimonialpage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_testimonialpage
    ADD CONSTRAINT pages_testimonialpage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: pages_videogallerypage pages_videogallerypage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_videogallerypage
    ADD CONSTRAINT pages_videogallerypage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: pages_videogallerypagecarouselitem pages_videopagecarouselitem_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_videogallerypagecarouselitem
    ADD CONSTRAINT pages_videopagecarouselitem_pkey PRIMARY KEY (id);


--
-- Name: people_personindexpage people_personindexpage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.people_personindexpage
    ADD CONSTRAINT people_personindexpage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: people_personindexpagerelatedlink people_personindexpagerelatedlink_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.people_personindexpagerelatedlink
    ADD CONSTRAINT people_personindexpagerelatedlink_pkey PRIMARY KEY (id);


--
-- Name: people_personpage people_personpage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.people_personpage
    ADD CONSTRAINT people_personpage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: people_personpagerelatedlink people_personpagerelatedlink_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.people_personpagerelatedlink
    ADD CONSTRAINT people_personpagerelatedlink_pkey PRIMARY KEY (id);


--
-- Name: people_personpagetag people_personpagetag_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.people_personpagetag
    ADD CONSTRAINT people_personpagetag_pkey PRIMARY KEY (id);


--
-- Name: people_personrole people_personrole_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.people_personrole
    ADD CONSTRAINT people_personrole_pkey PRIMARY KEY (id);


--
-- Name: postgres_search_indexentry postgres_search_indexent_content_type_id_object_i_bae8f946_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.postgres_search_indexentry
    ADD CONSTRAINT postgres_search_indexent_content_type_id_object_i_bae8f946_uniq UNIQUE (content_type_id, object_id);


--
-- Name: postgres_search_indexentry postgres_search_indexentry_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.postgres_search_indexentry
    ADD CONSTRAINT postgres_search_indexentry_pkey PRIMARY KEY (id);


--
-- Name: products_productindexpage products_productindexpage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_productindexpage
    ADD CONSTRAINT products_productindexpage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: products_productindexpagerelatedlink products_productindexpagerelatedlink_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_productindexpagerelatedlink
    ADD CONSTRAINT products_productindexpagerelatedlink_pkey PRIMARY KEY (id);


--
-- Name: products_productpage products_productpage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_productpage
    ADD CONSTRAINT products_productpage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: products_productpagerelatedlink products_productpagerelatedlink_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_productpagerelatedlink
    ADD CONSTRAINT products_productpagerelatedlink_pkey PRIMARY KEY (id);


--
-- Name: products_productpagetag products_productpagetag_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_productpagetag
    ADD CONSTRAINT products_productpagetag_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialaccount socialaccount_socialaccount_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialaccount socialaccount_socialaccount_provider_uid_fc810c6e_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_provider_uid_fc810c6e_uniq UNIQUE (provider, uid);


--
-- Name: socialaccount_socialapp_sites socialaccount_socialapp__socialapp_id_site_id_71a9a768_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_socialapp__socialapp_id_site_id_71a9a768_uniq UNIQUE (socialapp_id, site_id);


--
-- Name: socialaccount_socialapp socialaccount_socialapp_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.socialaccount_socialapp
    ADD CONSTRAINT socialaccount_socialapp_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialapp_sites socialaccount_socialapp_sites_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_socialapp_sites_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialtoken socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq UNIQUE (app_id, account_id);


--
-- Name: socialaccount_socialtoken socialaccount_socialtoken_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_socialtoken_pkey PRIMARY KEY (id);


--
-- Name: taggit_tag taggit_tag_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.taggit_tag
    ADD CONSTRAINT taggit_tag_name_key UNIQUE (name);


--
-- Name: taggit_tag taggit_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.taggit_tag
    ADD CONSTRAINT taggit_tag_pkey PRIMARY KEY (id);


--
-- Name: taggit_tag taggit_tag_slug_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.taggit_tag
    ADD CONSTRAINT taggit_tag_slug_key UNIQUE (slug);


--
-- Name: taggit_taggeditem taggit_taggeditem_content_type_id_object_i_4bb97a8e_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.taggit_taggeditem
    ADD CONSTRAINT taggit_taggeditem_content_type_id_object_i_4bb97a8e_uniq UNIQUE (content_type_id, object_id, tag_id);


--
-- Name: taggit_taggeditem taggit_taggeditem_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.taggit_taggeditem
    ADD CONSTRAINT taggit_taggeditem_pkey PRIMARY KEY (id);


--
-- Name: users_user_groups users_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_pkey PRIMARY KEY (id);


--
-- Name: users_user_groups users_user_groups_user_id_group_id_b88eab82_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_user_id_group_id_b88eab82_uniq UNIQUE (user_id, group_id);


--
-- Name: users_user users_user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users_user
    ADD CONSTRAINT users_user_pkey PRIMARY KEY (id);


--
-- Name: users_user_user_permissions users_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: users_user_user_permissions users_user_user_permissions_user_id_permission_id_43338c45_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_permissions_user_id_permission_id_43338c45_uniq UNIQUE (user_id, permission_id);


--
-- Name: users_user users_user_username_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users_user
    ADD CONSTRAINT users_user_username_key UNIQUE (username);


--
-- Name: wagtail_feeds_rssfeedssettings wagtail_feeds_rssfeedssettings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wagtail_feeds_rssfeedssettings
    ADD CONSTRAINT wagtail_feeds_rssfeedssettings_pkey PRIMARY KEY (id);


--
-- Name: wagtail_feeds_rssfeedssettings wagtail_feeds_rssfeedssettings_site_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wagtail_feeds_rssfeedssettings
    ADD CONSTRAINT wagtail_feeds_rssfeedssettings_site_id_key UNIQUE (site_id);


--
-- Name: wagtailcore_collection wagtailcore_collection_path_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wagtailcore_collection
    ADD CONSTRAINT wagtailcore_collection_path_key UNIQUE (path);


--
-- Name: wagtailcore_collection wagtailcore_collection_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wagtailcore_collection
    ADD CONSTRAINT wagtailcore_collection_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_collectionviewrestriction_groups wagtailcore_collectionvi_collectionviewrestrictio_988995ae_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wagtailcore_collectionviewrestriction_groups
    ADD CONSTRAINT wagtailcore_collectionvi_collectionviewrestrictio_988995ae_uniq UNIQUE (collectionviewrestriction_id, group_id);


--
-- Name: wagtailcore_collectionviewrestriction_groups wagtailcore_collectionviewrestriction_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wagtailcore_collectionviewrestriction_groups
    ADD CONSTRAINT wagtailcore_collectionviewrestriction_groups_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_collectionviewrestriction wagtailcore_collectionviewrestriction_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wagtailcore_collectionviewrestriction
    ADD CONSTRAINT wagtailcore_collectionviewrestriction_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_groupcollectionpermission wagtailcore_groupcollect_group_id_collection_id_p_a21cefe9_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wagtailcore_groupcollectionpermission
    ADD CONSTRAINT wagtailcore_groupcollect_group_id_collection_id_p_a21cefe9_uniq UNIQUE (group_id, collection_id, permission_id);


--
-- Name: wagtailcore_groupcollectionpermission wagtailcore_groupcollectionpermission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wagtailcore_groupcollectionpermission
    ADD CONSTRAINT wagtailcore_groupcollectionpermission_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_grouppagepermission wagtailcore_grouppageper_group_id_page_id_permiss_0898bdf8_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wagtailcore_grouppagepermission
    ADD CONSTRAINT wagtailcore_grouppageper_group_id_page_id_permiss_0898bdf8_uniq UNIQUE (group_id, page_id, permission_type);


--
-- Name: wagtailcore_grouppagepermission wagtailcore_grouppagepermission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wagtailcore_grouppagepermission
    ADD CONSTRAINT wagtailcore_grouppagepermission_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_page wagtailcore_page_path_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wagtailcore_page
    ADD CONSTRAINT wagtailcore_page_path_key UNIQUE (path);


--
-- Name: wagtailcore_page wagtailcore_page_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wagtailcore_page
    ADD CONSTRAINT wagtailcore_page_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_pagerevision wagtailcore_pagerevision_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wagtailcore_pagerevision
    ADD CONSTRAINT wagtailcore_pagerevision_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_pageviewrestriction_groups wagtailcore_pageviewrest_pageviewrestriction_id_g_d23f80bb_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wagtailcore_pageviewrestriction_groups
    ADD CONSTRAINT wagtailcore_pageviewrest_pageviewrestriction_id_g_d23f80bb_uniq UNIQUE (pageviewrestriction_id, group_id);


--
-- Name: wagtailcore_pageviewrestriction_groups wagtailcore_pageviewrestriction_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wagtailcore_pageviewrestriction_groups
    ADD CONSTRAINT wagtailcore_pageviewrestriction_groups_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_pageviewrestriction wagtailcore_pageviewrestriction_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wagtailcore_pageviewrestriction
    ADD CONSTRAINT wagtailcore_pageviewrestriction_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_site wagtailcore_site_hostname_port_2c626d70_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wagtailcore_site
    ADD CONSTRAINT wagtailcore_site_hostname_port_2c626d70_uniq UNIQUE (hostname, port);


--
-- Name: wagtailcore_site wagtailcore_site_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wagtailcore_site
    ADD CONSTRAINT wagtailcore_site_pkey PRIMARY KEY (id);


--
-- Name: wagtaildocs_document wagtaildocs_document_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wagtaildocs_document
    ADD CONSTRAINT wagtaildocs_document_pkey PRIMARY KEY (id);


--
-- Name: wagtailembeds_embed wagtailembeds_embed_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wagtailembeds_embed
    ADD CONSTRAINT wagtailembeds_embed_pkey PRIMARY KEY (id);


--
-- Name: wagtailembeds_embed wagtailembeds_embed_url_max_width_8a2922d8_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wagtailembeds_embed
    ADD CONSTRAINT wagtailembeds_embed_url_max_width_8a2922d8_uniq UNIQUE (url, max_width);


--
-- Name: wagtailforms_formsubmission wagtailforms_formsubmission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wagtailforms_formsubmission
    ADD CONSTRAINT wagtailforms_formsubmission_pkey PRIMARY KEY (id);


--
-- Name: wagtailimages_image wagtailimages_image_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wagtailimages_image
    ADD CONSTRAINT wagtailimages_image_pkey PRIMARY KEY (id);


--
-- Name: wagtailimages_rendition wagtailimages_rendition_image_id_filter_spec_foc_323c8fe0_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wagtailimages_rendition
    ADD CONSTRAINT wagtailimages_rendition_image_id_filter_spec_foc_323c8fe0_uniq UNIQUE (image_id, filter_spec, focal_point_key);


--
-- Name: wagtailimages_rendition wagtailimages_rendition_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wagtailimages_rendition
    ADD CONSTRAINT wagtailimages_rendition_pkey PRIMARY KEY (id);


--
-- Name: wagtailimages_uploadedimage wagtailimages_uploadedimage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wagtailimages_uploadedimage
    ADD CONSTRAINT wagtailimages_uploadedimage_pkey PRIMARY KEY (id);


--
-- Name: wagtailredirects_redirect wagtailredirects_redirect_old_path_site_id_783622d7_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wagtailredirects_redirect
    ADD CONSTRAINT wagtailredirects_redirect_old_path_site_id_783622d7_uniq UNIQUE (old_path, site_id);


--
-- Name: wagtailredirects_redirect wagtailredirects_redirect_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wagtailredirects_redirect
    ADD CONSTRAINT wagtailredirects_redirect_pkey PRIMARY KEY (id);


--
-- Name: wagtailsearchpromotions_searchpromotion wagtailsearch_editorspick_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wagtailsearchpromotions_searchpromotion
    ADD CONSTRAINT wagtailsearch_editorspick_pkey PRIMARY KEY (id);


--
-- Name: wagtailsearch_query wagtailsearch_query_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wagtailsearch_query
    ADD CONSTRAINT wagtailsearch_query_pkey PRIMARY KEY (id);


--
-- Name: wagtailsearch_query wagtailsearch_query_query_string_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wagtailsearch_query
    ADD CONSTRAINT wagtailsearch_query_query_string_key UNIQUE (query_string);


--
-- Name: wagtailsearch_querydailyhits wagtailsearch_querydailyhits_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wagtailsearch_querydailyhits
    ADD CONSTRAINT wagtailsearch_querydailyhits_pkey PRIMARY KEY (id);


--
-- Name: wagtailsearch_querydailyhits wagtailsearch_querydailyhits_query_id_date_1dd232e6_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wagtailsearch_querydailyhits
    ADD CONSTRAINT wagtailsearch_querydailyhits_query_id_date_1dd232e6_uniq UNIQUE (query_id, date);


--
-- Name: wagtailusers_userprofile wagtailusers_userprofile_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wagtailusers_userprofile
    ADD CONSTRAINT wagtailusers_userprofile_pkey PRIMARY KEY (id);


--
-- Name: wagtailusers_userprofile wagtailusers_userprofile_user_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wagtailusers_userprofile
    ADD CONSTRAINT wagtailusers_userprofile_user_id_key UNIQUE (user_id);


--
-- Name: account_emailaddress_email_03be32b2_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX account_emailaddress_email_03be32b2_like ON public.account_emailaddress USING btree (email varchar_pattern_ops);


--
-- Name: account_emailaddress_user_id_2c513194; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX account_emailaddress_user_id_2c513194 ON public.account_emailaddress USING btree (user_id);


--
-- Name: account_emailconfirmation_email_address_id_5b7f8c58; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX account_emailconfirmation_email_address_id_5b7f8c58 ON public.account_emailconfirmation USING btree (email_address_id);


--
-- Name: account_emailconfirmation_key_f43612bd_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX account_emailconfirmation_key_f43612bd_like ON public.account_emailconfirmation USING btree (key varchar_pattern_ops);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: blog_blogindexpage_feed_image_id_5cb947e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX blog_blogindexpage_feed_image_id_5cb947e1 ON public.blog_blogindexpage USING btree (feed_image_id);


--
-- Name: blog_blogindexpagerelatedlink_link_document_id_84c85fbf; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX blog_blogindexpagerelatedlink_link_document_id_84c85fbf ON public.blog_blogindexpagerelatedlink USING btree (link_document_id);


--
-- Name: blog_blogindexpagerelatedlink_link_page_id_fdd456c7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX blog_blogindexpagerelatedlink_link_page_id_fdd456c7 ON public.blog_blogindexpagerelatedlink USING btree (link_page_id);


--
-- Name: blog_blogindexpagerelatedlink_page_id_905f99b7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX blog_blogindexpagerelatedlink_page_id_905f99b7 ON public.blog_blogindexpagerelatedlink USING btree (page_id);


--
-- Name: blog_blogpage_feed_image_id_5f46dd6e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX blog_blogpage_feed_image_id_5f46dd6e ON public.blog_blogpage USING btree (feed_image_id);


--
-- Name: blog_blogpagecarouselitem_image_id_d51a8744; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX blog_blogpagecarouselitem_image_id_d51a8744 ON public.blog_blogpagecarouselitem USING btree (image_id);


--
-- Name: blog_blogpagecarouselitem_link_document_id_944c5996; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX blog_blogpagecarouselitem_link_document_id_944c5996 ON public.blog_blogpagecarouselitem USING btree (link_document_id);


--
-- Name: blog_blogpagecarouselitem_link_page_id_86ebc051; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX blog_blogpagecarouselitem_link_page_id_86ebc051 ON public.blog_blogpagecarouselitem USING btree (link_page_id);


--
-- Name: blog_blogpagecarouselitem_page_id_41128629; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX blog_blogpagecarouselitem_page_id_41128629 ON public.blog_blogpagecarouselitem USING btree (page_id);


--
-- Name: blog_blogpagerelatedlink_link_document_id_358015f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX blog_blogpagerelatedlink_link_document_id_358015f9 ON public.blog_blogpagerelatedlink USING btree (link_document_id);


--
-- Name: blog_blogpagerelatedlink_link_page_id_1edfe541; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX blog_blogpagerelatedlink_link_page_id_1edfe541 ON public.blog_blogpagerelatedlink USING btree (link_page_id);


--
-- Name: blog_blogpagerelatedlink_page_id_31c20323; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX blog_blogpagerelatedlink_page_id_31c20323 ON public.blog_blogpagerelatedlink USING btree (page_id);


--
-- Name: blog_blogpagetag_content_object_id_0dc644d2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX blog_blogpagetag_content_object_id_0dc644d2 ON public.blog_blogpagetag USING btree (content_object_id);


--
-- Name: blog_blogpagetag_tag_id_81dc0e5f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX blog_blogpagetag_tag_id_81dc0e5f ON public.blog_blogpagetag USING btree (tag_id);


--
-- Name: contact_contactformfield_page_id_95a7af80; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX contact_contactformfield_page_id_95a7af80 ON public.contact_contactformfield USING btree (page_id);


--
-- Name: contact_contactpage_feed_image_id_1f79cfe3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX contact_contactpage_feed_image_id_1f79cfe3 ON public.contact_contactpage USING btree (feed_image_id);


--
-- Name: contact_formfield_page_id_3ee48e6d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX contact_formfield_page_id_3ee48e6d ON public.contact_formfield USING btree (page_id);


--
-- Name: contact_formpage_feed_image_id_0303d2c9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX contact_formpage_feed_image_id_0303d2c9 ON public.contact_formpage USING btree (feed_image_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: django_site_domain_a2e37b91_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_site_domain_a2e37b91_like ON public.django_site USING btree (domain varchar_pattern_ops);


--
-- Name: documents_gallery_documentsindexpage_feed_image_id_732ac53b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX documents_gallery_documentsindexpage_feed_image_id_732ac53b ON public.documents_gallery_documentsindexpage USING btree (feed_image_id);


--
-- Name: documents_gallery_documentspage_feed_image_id_72f32dc7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX documents_gallery_documentspage_feed_image_id_72f32dc7 ON public.documents_gallery_documentspage USING btree (feed_image_id);


--
-- Name: documents_gallery_documentspagetag_content_object_id_d50ea041; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX documents_gallery_documentspagetag_content_object_id_d50ea041 ON public.documents_gallery_documentspagetag USING btree (content_object_id);


--
-- Name: documents_gallery_documentspagetag_tag_id_50625f82; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX documents_gallery_documentspagetag_tag_id_50625f82 ON public.documents_gallery_documentspagetag USING btree (tag_id);


--
-- Name: events_eventindexpage_feed_image_id_d6958e2f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX events_eventindexpage_feed_image_id_d6958e2f ON public.events_eventindexpage USING btree (feed_image_id);


--
-- Name: events_eventindexpagerelatedlink_link_document_id_f50895d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX events_eventindexpagerelatedlink_link_document_id_f50895d4 ON public.events_eventindexpagerelatedlink USING btree (link_document_id);


--
-- Name: events_eventindexpagerelatedlink_link_page_id_4c88907b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX events_eventindexpagerelatedlink_link_page_id_4c88907b ON public.events_eventindexpagerelatedlink USING btree (link_page_id);


--
-- Name: events_eventindexpagerelatedlink_page_id_7ac7d364; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX events_eventindexpagerelatedlink_page_id_7ac7d364 ON public.events_eventindexpagerelatedlink USING btree (page_id);


--
-- Name: events_eventpage_feed_image_id_25a625d0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX events_eventpage_feed_image_id_25a625d0 ON public.events_eventpage USING btree (feed_image_id);


--
-- Name: events_eventpagecarouselitem_image_id_fb4b4dcd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX events_eventpagecarouselitem_image_id_fb4b4dcd ON public.events_eventpagecarouselitem USING btree (image_id);


--
-- Name: events_eventpagecarouselitem_link_document_id_85c089ab; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX events_eventpagecarouselitem_link_document_id_85c089ab ON public.events_eventpagecarouselitem USING btree (link_document_id);


--
-- Name: events_eventpagecarouselitem_link_page_id_388fd2d0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX events_eventpagecarouselitem_link_page_id_388fd2d0 ON public.events_eventpagecarouselitem USING btree (link_page_id);


--
-- Name: events_eventpagecarouselitem_page_id_eec52587; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX events_eventpagecarouselitem_page_id_eec52587 ON public.events_eventpagecarouselitem USING btree (page_id);


--
-- Name: events_eventpagerelatedlink_link_document_id_bc602f32; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX events_eventpagerelatedlink_link_document_id_bc602f32 ON public.events_eventpagerelatedlink USING btree (link_document_id);


--
-- Name: events_eventpagerelatedlink_link_page_id_378ea87f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX events_eventpagerelatedlink_link_page_id_378ea87f ON public.events_eventpagerelatedlink USING btree (link_page_id);


--
-- Name: events_eventpagerelatedlink_page_id_2da96f87; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX events_eventpagerelatedlink_page_id_2da96f87 ON public.events_eventpagerelatedlink USING btree (page_id);


--
-- Name: events_eventpagespeaker_image_id_f48678eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX events_eventpagespeaker_image_id_f48678eb ON public.events_eventpagespeaker USING btree (image_id);


--
-- Name: events_eventpagespeaker_link_document_id_0252ea0f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX events_eventpagespeaker_link_document_id_0252ea0f ON public.events_eventpagespeaker USING btree (link_document_id);


--
-- Name: events_eventpagespeaker_link_page_id_f4549a64; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX events_eventpagespeaker_link_page_id_f4549a64 ON public.events_eventpagespeaker USING btree (link_page_id);


--
-- Name: events_eventpagespeaker_page_id_10883f65; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX events_eventpagespeaker_page_id_10883f65 ON public.events_eventpagespeaker USING btree (page_id);


--
-- Name: events_eventpagetag_content_object_id_a9eee66f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX events_eventpagetag_content_object_id_a9eee66f ON public.events_eventpagetag USING btree (content_object_id);


--
-- Name: events_eventpagetag_tag_id_b811cfc5; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX events_eventpagetag_tag_id_b811cfc5 ON public.events_eventpagetag USING btree (tag_id);


--
-- Name: gallery_galleryindex_collection_id_f3527005; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX gallery_galleryindex_collection_id_f3527005 ON public.gallery_galleryindex USING btree (collection_id);


--
-- Name: gallery_galleryindex_feed_image_id_026d6012; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX gallery_galleryindex_feed_image_id_026d6012 ON public.gallery_galleryindex USING btree (feed_image_id);


--
-- Name: gallery_photogalleryindexpage_feed_image_id_a5e0841c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX gallery_photogalleryindexpage_feed_image_id_a5e0841c ON public.gallery_photogalleryindexpage USING btree (feed_image_id);


--
-- Name: joyous_cancellationpage_overrides_id_dd65c498; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX joyous_cancellationpage_overrides_id_dd65c498 ON public.joyous_cancellationpage USING btree (overrides_id);


--
-- Name: joyous_eventcategory_code_c956fd3a_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX joyous_eventcategory_code_c956fd3a_like ON public.joyous_eventcategory USING btree (code varchar_pattern_ops);


--
-- Name: joyous_extrainfopage_overrides_id_504a3667; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX joyous_extrainfopage_overrides_id_504a3667 ON public.joyous_extrainfopage USING btree (overrides_id);


--
-- Name: joyous_multidayeventpage_category_id_49c850c5; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX joyous_multidayeventpage_category_id_49c850c5 ON public.joyous_multidayeventpage USING btree (category_id);


--
-- Name: joyous_multidayeventpage_group_page_id_1c4ff29c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX joyous_multidayeventpage_group_page_id_1c4ff29c ON public.joyous_multidayeventpage USING btree (group_page_id);


--
-- Name: joyous_multidayeventpage_image_id_1ca84448; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX joyous_multidayeventpage_image_id_1ca84448 ON public.joyous_multidayeventpage USING btree (image_id);


--
-- Name: joyous_multidayeventpage_uid_991f7af6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX joyous_multidayeventpage_uid_991f7af6 ON public.joyous_multidayeventpage USING btree (uid);


--
-- Name: joyous_multidayeventpage_uid_991f7af6_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX joyous_multidayeventpage_uid_991f7af6_like ON public.joyous_multidayeventpage USING btree (uid varchar_pattern_ops);


--
-- Name: joyous_postponementpage_category_id_589f353c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX joyous_postponementpage_category_id_589f353c ON public.joyous_postponementpage USING btree (category_id);


--
-- Name: joyous_postponementpage_image_id_d5aa5059; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX joyous_postponementpage_image_id_d5aa5059 ON public.joyous_postponementpage USING btree (image_id);


--
-- Name: joyous_recurringeventpage_category_id_96630039; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX joyous_recurringeventpage_category_id_96630039 ON public.joyous_recurringeventpage USING btree (category_id);


--
-- Name: joyous_recurringeventpage_group_page_id_398b4ca4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX joyous_recurringeventpage_group_page_id_398b4ca4 ON public.joyous_recurringeventpage USING btree (group_page_id);


--
-- Name: joyous_recurringeventpage_image_id_92d01cbf; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX joyous_recurringeventpage_image_id_92d01cbf ON public.joyous_recurringeventpage USING btree (image_id);


--
-- Name: joyous_recurringeventpage_uid_45274760; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX joyous_recurringeventpage_uid_45274760 ON public.joyous_recurringeventpage USING btree (uid);


--
-- Name: joyous_recurringeventpage_uid_45274760_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX joyous_recurringeventpage_uid_45274760_like ON public.joyous_recurringeventpage USING btree (uid varchar_pattern_ops);


--
-- Name: joyous_simpleeventpage_category_id_7a376bea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX joyous_simpleeventpage_category_id_7a376bea ON public.joyous_simpleeventpage USING btree (category_id);


--
-- Name: joyous_simpleeventpage_group_page_id_10253052; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX joyous_simpleeventpage_group_page_id_10253052 ON public.joyous_simpleeventpage USING btree (group_page_id);


--
-- Name: joyous_simpleeventpage_image_id_5abc3f53; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX joyous_simpleeventpage_image_id_5abc3f53 ON public.joyous_simpleeventpage USING btree (image_id);


--
-- Name: joyous_simpleeventpage_uid_c7afa8a1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX joyous_simpleeventpage_uid_c7afa8a1 ON public.joyous_simpleeventpage USING btree (uid);


--
-- Name: joyous_simpleeventpage_uid_c7afa8a1_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX joyous_simpleeventpage_uid_c7afa8a1_like ON public.joyous_simpleeventpage USING btree (uid varchar_pattern_ops);


--
-- Name: pages_advert_image_id_c3df93a1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_advert_image_id_c3df93a1 ON public.pages_advert USING btree (image_id);


--
-- Name: pages_advert_link_document_id_d804b3dc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_advert_link_document_id_d804b3dc ON public.pages_advert USING btree (link_document_id);


--
-- Name: pages_advert_link_page_id_ae00fe23; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_advert_link_page_id_ae00fe23 ON public.pages_advert USING btree (link_page_id);


--
-- Name: pages_advert_page_id_21245cc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_advert_page_id_21245cc0 ON public.pages_advert USING btree (page_id);


--
-- Name: pages_contentblock_link_document_id_0b825445; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_contentblock_link_document_id_0b825445 ON public.pages_contentblock USING btree (link_document_id);


--
-- Name: pages_contentblock_link_page_id_84f7b516; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_contentblock_link_page_id_84f7b516 ON public.pages_contentblock USING btree (link_page_id);


--
-- Name: pages_contentblock_page_id_d29244b9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_contentblock_page_id_d29244b9 ON public.pages_contentblock USING btree (page_id);


--
-- Name: pages_contentblock_slug_946a161b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_contentblock_slug_946a161b ON public.pages_contentblock USING btree (slug);


--
-- Name: pages_contentblock_slug_946a161b_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_contentblock_slug_946a161b_like ON public.pages_contentblock USING btree (slug varchar_pattern_ops);


--
-- Name: pages_homepage_feed_image_id_4ebba3a8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_homepage_feed_image_id_4ebba3a8 ON public.pages_homepage USING btree (feed_image_id);


--
-- Name: pages_homepagecarouselitem_image_id_45b3424e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_homepagecarouselitem_image_id_45b3424e ON public.pages_homepagecarouselitem USING btree (image_id);


--
-- Name: pages_homepagecarouselitem_link_document_id_902c9e7d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_homepagecarouselitem_link_document_id_902c9e7d ON public.pages_homepagecarouselitem USING btree (link_document_id);


--
-- Name: pages_homepagecarouselitem_link_page_id_799b1594; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_homepagecarouselitem_link_page_id_799b1594 ON public.pages_homepagecarouselitem USING btree (link_page_id);


--
-- Name: pages_homepagecarouselitem_page_id_915b43c4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_homepagecarouselitem_page_id_915b43c4 ON public.pages_homepagecarouselitem USING btree (page_id);


--
-- Name: pages_homepagecontentitem_image_id_85ec39f6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_homepagecontentitem_image_id_85ec39f6 ON public.pages_homepagecontentitem USING btree (image_id);


--
-- Name: pages_homepagecontentitem_link_document_id_a2552580; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_homepagecontentitem_link_document_id_a2552580 ON public.pages_homepagecontentitem USING btree (link_document_id);


--
-- Name: pages_homepagecontentitem_link_page_id_9aa371ca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_homepagecontentitem_link_page_id_9aa371ca ON public.pages_homepagecontentitem USING btree (link_page_id);


--
-- Name: pages_homepagecontentitem_page_id_8b646417; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_homepagecontentitem_page_id_8b646417 ON public.pages_homepagecontentitem USING btree (page_id);


--
-- Name: pages_homepagecontentitem_slug_2f312148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_homepagecontentitem_slug_2f312148 ON public.pages_homepagecontentitem USING btree (slug);


--
-- Name: pages_homepagecontentitem_slug_2f312148_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_homepagecontentitem_slug_2f312148_like ON public.pages_homepagecontentitem USING btree (slug varchar_pattern_ops);


--
-- Name: pages_homepagerelatedlink_link_document_id_1364f817; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_homepagerelatedlink_link_document_id_1364f817 ON public.pages_homepagerelatedlink USING btree (link_document_id);


--
-- Name: pages_homepagerelatedlink_link_page_id_87ab8ff4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_homepagerelatedlink_link_page_id_87ab8ff4 ON public.pages_homepagerelatedlink USING btree (link_page_id);


--
-- Name: pages_homepagerelatedlink_page_id_b0a3517a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_homepagerelatedlink_page_id_b0a3517a ON public.pages_homepagerelatedlink USING btree (page_id);


--
-- Name: pages_sitebranding_logo_id_2841159b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_sitebranding_logo_id_2841159b ON public.pages_sitebranding USING btree (logo_id);


--
-- Name: pages_standardindexpage_feed_image_id_a65c3494; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_standardindexpage_feed_image_id_a65c3494 ON public.pages_standardindexpage USING btree (feed_image_id);


--
-- Name: pages_standardindexpagerelatedlink_link_document_id_ab0a20f8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_standardindexpagerelatedlink_link_document_id_ab0a20f8 ON public.pages_standardindexpagerelatedlink USING btree (link_document_id);


--
-- Name: pages_standardindexpagerelatedlink_link_page_id_8ad61c91; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_standardindexpagerelatedlink_link_page_id_8ad61c91 ON public.pages_standardindexpagerelatedlink USING btree (link_page_id);


--
-- Name: pages_standardindexpagerelatedlink_page_id_d0df6fde; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_standardindexpagerelatedlink_page_id_d0df6fde ON public.pages_standardindexpagerelatedlink USING btree (page_id);


--
-- Name: pages_standardpage_feed_image_id_41c2eccd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_standardpage_feed_image_id_41c2eccd ON public.pages_standardpage USING btree (feed_image_id);


--
-- Name: pages_standardpagecarouselitem_image_id_8d81528b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_standardpagecarouselitem_image_id_8d81528b ON public.pages_standardpagecarouselitem USING btree (image_id);


--
-- Name: pages_standardpagecarouselitem_link_document_id_1e821170; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_standardpagecarouselitem_link_document_id_1e821170 ON public.pages_standardpagecarouselitem USING btree (link_document_id);


--
-- Name: pages_standardpagecarouselitem_link_page_id_28e4472a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_standardpagecarouselitem_link_page_id_28e4472a ON public.pages_standardpagecarouselitem USING btree (link_page_id);


--
-- Name: pages_standardpagecarouselitem_page_id_ab87f566; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_standardpagecarouselitem_page_id_ab87f566 ON public.pages_standardpagecarouselitem USING btree (page_id);


--
-- Name: pages_standardpagerelatedlink_link_document_id_c02096ae; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_standardpagerelatedlink_link_document_id_c02096ae ON public.pages_standardpagerelatedlink USING btree (link_document_id);


--
-- Name: pages_standardpagerelatedlink_link_page_id_29341951; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_standardpagerelatedlink_link_page_id_29341951 ON public.pages_standardpagerelatedlink USING btree (link_page_id);


--
-- Name: pages_standardpagerelatedlink_page_id_1c982abb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_standardpagerelatedlink_page_id_1c982abb ON public.pages_standardpagerelatedlink USING btree (page_id);


--
-- Name: pages_testimonial_link_document_id_3c7b9377; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_testimonial_link_document_id_3c7b9377 ON public.pages_testimonial USING btree (link_document_id);


--
-- Name: pages_testimonial_link_page_id_70b58081; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_testimonial_link_page_id_70b58081 ON public.pages_testimonial USING btree (link_page_id);


--
-- Name: pages_testimonial_page_id_aedaf53f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_testimonial_page_id_aedaf53f ON public.pages_testimonial USING btree (page_id);


--
-- Name: pages_testimonial_photo_id_29360729; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_testimonial_photo_id_29360729 ON public.pages_testimonial USING btree (photo_id);


--
-- Name: pages_testimonialpage_feed_image_id_598eb509; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_testimonialpage_feed_image_id_598eb509 ON public.pages_testimonialpage USING btree (feed_image_id);


--
-- Name: pages_videogallerypage_feed_image_id_250d9360; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_videogallerypage_feed_image_id_250d9360 ON public.pages_videogallerypage USING btree (feed_image_id);


--
-- Name: pages_videopagecarouselitem_image_id_2817929a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_videopagecarouselitem_image_id_2817929a ON public.pages_videogallerypagecarouselitem USING btree (image_id);


--
-- Name: pages_videopagecarouselitem_link_document_id_b7d2ab0f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_videopagecarouselitem_link_document_id_b7d2ab0f ON public.pages_videogallerypagecarouselitem USING btree (link_document_id);


--
-- Name: pages_videopagecarouselitem_link_page_id_16ed2e64; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_videopagecarouselitem_link_page_id_16ed2e64 ON public.pages_videogallerypagecarouselitem USING btree (link_page_id);


--
-- Name: pages_videopagecarouselitem_page_id_762410b6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_videopagecarouselitem_page_id_762410b6 ON public.pages_videogallerypagecarouselitem USING btree (page_id);


--
-- Name: people_personindexpage_feed_image_id_ea7ff652; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX people_personindexpage_feed_image_id_ea7ff652 ON public.people_personindexpage USING btree (feed_image_id);


--
-- Name: people_personindexpagerelatedlink_link_document_id_6fb113f2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX people_personindexpagerelatedlink_link_document_id_6fb113f2 ON public.people_personindexpagerelatedlink USING btree (link_document_id);


--
-- Name: people_personindexpagerelatedlink_link_page_id_9a45cdb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX people_personindexpagerelatedlink_link_page_id_9a45cdb2 ON public.people_personindexpagerelatedlink USING btree (link_page_id);


--
-- Name: people_personindexpagerelatedlink_page_id_9074b56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX people_personindexpagerelatedlink_page_id_9074b56c ON public.people_personindexpagerelatedlink USING btree (page_id);


--
-- Name: people_personpage_feed_image_id_c8aaeda0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX people_personpage_feed_image_id_c8aaeda0 ON public.people_personpage USING btree (feed_image_id);


--
-- Name: people_personpage_image_id_f13def2e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX people_personpage_image_id_f13def2e ON public.people_personpage USING btree (image_id);


--
-- Name: people_personpage_role_id_534a1c51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX people_personpage_role_id_534a1c51 ON public.people_personpage USING btree (role_id);


--
-- Name: people_personpagerelatedlink_link_document_id_d330a140; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX people_personpagerelatedlink_link_document_id_d330a140 ON public.people_personpagerelatedlink USING btree (link_document_id);


--
-- Name: people_personpagerelatedlink_link_page_id_1f38718a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX people_personpagerelatedlink_link_page_id_1f38718a ON public.people_personpagerelatedlink USING btree (link_page_id);


--
-- Name: people_personpagerelatedlink_page_id_37654932; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX people_personpagerelatedlink_page_id_37654932 ON public.people_personpagerelatedlink USING btree (page_id);


--
-- Name: people_personpagetag_content_object_id_219202ed; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX people_personpagetag_content_object_id_219202ed ON public.people_personpagetag USING btree (content_object_id);


--
-- Name: people_personpagetag_tag_id_e0d52d9d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX people_personpagetag_tag_id_e0d52d9d ON public.people_personpagetag USING btree (tag_id);


--
-- Name: postgres_se_autocom_ee48c8_gin; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX postgres_se_autocom_ee48c8_gin ON public.postgres_search_indexentry USING gin (autocomplete);


--
-- Name: postgres_se_body_aaaa99_gin; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX postgres_se_body_aaaa99_gin ON public.postgres_search_indexentry USING gin (body);


--
-- Name: postgres_search_indexentry_content_type_id_d805086f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX postgres_search_indexentry_content_type_id_d805086f ON public.postgres_search_indexentry USING btree (content_type_id);


--
-- Name: products_productindexpage_feed_image_id_f1b46ba8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_productindexpage_feed_image_id_f1b46ba8 ON public.products_productindexpage USING btree (feed_image_id);


--
-- Name: products_productindexpagerelatedlink_link_document_id_7589e588; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_productindexpagerelatedlink_link_document_id_7589e588 ON public.products_productindexpagerelatedlink USING btree (link_document_id);


--
-- Name: products_productindexpagerelatedlink_link_page_id_cc9048a1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_productindexpagerelatedlink_link_page_id_cc9048a1 ON public.products_productindexpagerelatedlink USING btree (link_page_id);


--
-- Name: products_productindexpagerelatedlink_page_id_320a0204; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_productindexpagerelatedlink_page_id_320a0204 ON public.products_productindexpagerelatedlink USING btree (page_id);


--
-- Name: products_productpage_feed_image_id_fc5dc22b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_productpage_feed_image_id_fc5dc22b ON public.products_productpage USING btree (feed_image_id);


--
-- Name: products_productpage_image_id_b4d3829e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_productpage_image_id_b4d3829e ON public.products_productpage USING btree (image_id);


--
-- Name: products_productpagerelatedlink_link_document_id_d6cd7769; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_productpagerelatedlink_link_document_id_d6cd7769 ON public.products_productpagerelatedlink USING btree (link_document_id);


--
-- Name: products_productpagerelatedlink_link_page_id_39628d87; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_productpagerelatedlink_link_page_id_39628d87 ON public.products_productpagerelatedlink USING btree (link_page_id);


--
-- Name: products_productpagerelatedlink_page_id_855d9c33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_productpagerelatedlink_page_id_855d9c33 ON public.products_productpagerelatedlink USING btree (page_id);


--
-- Name: products_productpagetag_content_object_id_1985a884; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_productpagetag_content_object_id_1985a884 ON public.products_productpagetag USING btree (content_object_id);


--
-- Name: products_productpagetag_tag_id_f0c81f66; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_productpagetag_tag_id_f0c81f66 ON public.products_productpagetag USING btree (tag_id);


--
-- Name: socialaccount_socialaccount_user_id_8146e70c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX socialaccount_socialaccount_user_id_8146e70c ON public.socialaccount_socialaccount USING btree (user_id);


--
-- Name: socialaccount_socialapp_sites_site_id_2579dee5; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX socialaccount_socialapp_sites_site_id_2579dee5 ON public.socialaccount_socialapp_sites USING btree (site_id);


--
-- Name: socialaccount_socialapp_sites_socialapp_id_97fb6e7d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX socialaccount_socialapp_sites_socialapp_id_97fb6e7d ON public.socialaccount_socialapp_sites USING btree (socialapp_id);


--
-- Name: socialaccount_socialtoken_account_id_951f210e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX socialaccount_socialtoken_account_id_951f210e ON public.socialaccount_socialtoken USING btree (account_id);


--
-- Name: socialaccount_socialtoken_app_id_636a42d7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX socialaccount_socialtoken_app_id_636a42d7 ON public.socialaccount_socialtoken USING btree (app_id);


--
-- Name: taggit_tag_name_58eb2ed9_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX taggit_tag_name_58eb2ed9_like ON public.taggit_tag USING btree (name varchar_pattern_ops);


--
-- Name: taggit_tag_slug_6be58b2c_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX taggit_tag_slug_6be58b2c_like ON public.taggit_tag USING btree (slug varchar_pattern_ops);


--
-- Name: taggit_taggeditem_content_type_id_9957a03c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX taggit_taggeditem_content_type_id_9957a03c ON public.taggit_taggeditem USING btree (content_type_id);


--
-- Name: taggit_taggeditem_content_type_id_object_id_196cc965_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX taggit_taggeditem_content_type_id_object_id_196cc965_idx ON public.taggit_taggeditem USING btree (content_type_id, object_id);


--
-- Name: taggit_taggeditem_object_id_e2d7d1df; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX taggit_taggeditem_object_id_e2d7d1df ON public.taggit_taggeditem USING btree (object_id);


--
-- Name: taggit_taggeditem_tag_id_f4f5b767; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX taggit_taggeditem_tag_id_f4f5b767 ON public.taggit_taggeditem USING btree (tag_id);


--
-- Name: users_user_groups_group_id_9afc8d0e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX users_user_groups_group_id_9afc8d0e ON public.users_user_groups USING btree (group_id);


--
-- Name: users_user_groups_user_id_5f6f5a90; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX users_user_groups_user_id_5f6f5a90 ON public.users_user_groups USING btree (user_id);


--
-- Name: users_user_user_permissions_permission_id_0b93982e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX users_user_user_permissions_permission_id_0b93982e ON public.users_user_user_permissions USING btree (permission_id);


--
-- Name: users_user_user_permissions_user_id_20aca447; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX users_user_user_permissions_user_id_20aca447 ON public.users_user_user_permissions USING btree (user_id);


--
-- Name: users_user_username_06e46fe6_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX users_user_username_06e46fe6_like ON public.users_user USING btree (username varchar_pattern_ops);


--
-- Name: wagtailcore_collection_path_d848dc19_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailcore_collection_path_d848dc19_like ON public.wagtailcore_collection USING btree (path varchar_pattern_ops);


--
-- Name: wagtailcore_collectionview_collectionviewrestriction__47320efd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailcore_collectionview_collectionviewrestriction__47320efd ON public.wagtailcore_collectionviewrestriction_groups USING btree (collectionviewrestriction_id);


--
-- Name: wagtailcore_collectionviewrestriction_collection_id_761908ec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailcore_collectionviewrestriction_collection_id_761908ec ON public.wagtailcore_collectionviewrestriction USING btree (collection_id);


--
-- Name: wagtailcore_collectionviewrestriction_groups_group_id_1823f2a3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailcore_collectionviewrestriction_groups_group_id_1823f2a3 ON public.wagtailcore_collectionviewrestriction_groups USING btree (group_id);


--
-- Name: wagtailcore_groupcollectionpermission_collection_id_5423575a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailcore_groupcollectionpermission_collection_id_5423575a ON public.wagtailcore_groupcollectionpermission USING btree (collection_id);


--
-- Name: wagtailcore_groupcollectionpermission_group_id_05d61460; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailcore_groupcollectionpermission_group_id_05d61460 ON public.wagtailcore_groupcollectionpermission USING btree (group_id);


--
-- Name: wagtailcore_groupcollectionpermission_permission_id_1b626275; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailcore_groupcollectionpermission_permission_id_1b626275 ON public.wagtailcore_groupcollectionpermission USING btree (permission_id);


--
-- Name: wagtailcore_grouppagepermission_group_id_fc07e671; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailcore_grouppagepermission_group_id_fc07e671 ON public.wagtailcore_grouppagepermission USING btree (group_id);


--
-- Name: wagtailcore_grouppagepermission_page_id_710b114a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailcore_grouppagepermission_page_id_710b114a ON public.wagtailcore_grouppagepermission USING btree (page_id);


--
-- Name: wagtailcore_page_content_type_id_c28424df; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailcore_page_content_type_id_c28424df ON public.wagtailcore_page USING btree (content_type_id);


--
-- Name: wagtailcore_page_first_published_at_2b5dd637; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailcore_page_first_published_at_2b5dd637 ON public.wagtailcore_page USING btree (first_published_at);


--
-- Name: wagtailcore_page_live_revision_id_930bd822; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailcore_page_live_revision_id_930bd822 ON public.wagtailcore_page USING btree (live_revision_id);


--
-- Name: wagtailcore_page_locked_by_id_bcb86245; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailcore_page_locked_by_id_bcb86245 ON public.wagtailcore_page USING btree (locked_by_id);


--
-- Name: wagtailcore_page_owner_id_fbf7c332; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailcore_page_owner_id_fbf7c332 ON public.wagtailcore_page USING btree (owner_id);


--
-- Name: wagtailcore_page_path_98eba2c8_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailcore_page_path_98eba2c8_like ON public.wagtailcore_page USING btree (path varchar_pattern_ops);


--
-- Name: wagtailcore_page_slug_e7c11b8f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailcore_page_slug_e7c11b8f ON public.wagtailcore_page USING btree (slug);


--
-- Name: wagtailcore_page_slug_e7c11b8f_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailcore_page_slug_e7c11b8f_like ON public.wagtailcore_page USING btree (slug varchar_pattern_ops);


--
-- Name: wagtailcore_pagerevision_approved_go_live_at_e56afc67; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailcore_pagerevision_approved_go_live_at_e56afc67 ON public.wagtailcore_pagerevision USING btree (approved_go_live_at);


--
-- Name: wagtailcore_pagerevision_created_at_66954e3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailcore_pagerevision_created_at_66954e3b ON public.wagtailcore_pagerevision USING btree (created_at);


--
-- Name: wagtailcore_pagerevision_page_id_d421cc1d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailcore_pagerevision_page_id_d421cc1d ON public.wagtailcore_pagerevision USING btree (page_id);


--
-- Name: wagtailcore_pagerevision_submitted_for_moderation_c682e44c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailcore_pagerevision_submitted_for_moderation_c682e44c ON public.wagtailcore_pagerevision USING btree (submitted_for_moderation);


--
-- Name: wagtailcore_pagerevision_user_id_2409d2f4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailcore_pagerevision_user_id_2409d2f4 ON public.wagtailcore_pagerevision USING btree (user_id);


--
-- Name: wagtailcore_pageviewrestri_pageviewrestriction_id_f147a99a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailcore_pageviewrestri_pageviewrestriction_id_f147a99a ON public.wagtailcore_pageviewrestriction_groups USING btree (pageviewrestriction_id);


--
-- Name: wagtailcore_pageviewrestriction_groups_group_id_6460f223; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailcore_pageviewrestriction_groups_group_id_6460f223 ON public.wagtailcore_pageviewrestriction_groups USING btree (group_id);


--
-- Name: wagtailcore_pageviewrestriction_page_id_15a8bea6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailcore_pageviewrestriction_page_id_15a8bea6 ON public.wagtailcore_pageviewrestriction USING btree (page_id);


--
-- Name: wagtailcore_site_hostname_96b20b46; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailcore_site_hostname_96b20b46 ON public.wagtailcore_site USING btree (hostname);


--
-- Name: wagtailcore_site_hostname_96b20b46_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailcore_site_hostname_96b20b46_like ON public.wagtailcore_site USING btree (hostname varchar_pattern_ops);


--
-- Name: wagtailcore_site_root_page_id_e02fb95c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailcore_site_root_page_id_e02fb95c ON public.wagtailcore_site USING btree (root_page_id);


--
-- Name: wagtaildocs_document_collection_id_23881625; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtaildocs_document_collection_id_23881625 ON public.wagtaildocs_document USING btree (collection_id);


--
-- Name: wagtaildocs_document_uploaded_by_user_id_17258b41; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtaildocs_document_uploaded_by_user_id_17258b41 ON public.wagtaildocs_document USING btree (uploaded_by_user_id);


--
-- Name: wagtailforms_formsubmission_page_id_e48e93e7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailforms_formsubmission_page_id_e48e93e7 ON public.wagtailforms_formsubmission USING btree (page_id);


--
-- Name: wagtailimages_image_collection_id_c2f8af7e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailimages_image_collection_id_c2f8af7e ON public.wagtailimages_image USING btree (collection_id);


--
-- Name: wagtailimages_image_created_at_86fa6cd4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailimages_image_created_at_86fa6cd4 ON public.wagtailimages_image USING btree (created_at);


--
-- Name: wagtailimages_image_uploaded_by_user_id_5d73dc75; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailimages_image_uploaded_by_user_id_5d73dc75 ON public.wagtailimages_image USING btree (uploaded_by_user_id);


--
-- Name: wagtailimages_rendition_filter_spec_1cba3201; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailimages_rendition_filter_spec_1cba3201 ON public.wagtailimages_rendition USING btree (filter_spec);


--
-- Name: wagtailimages_rendition_filter_spec_1cba3201_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailimages_rendition_filter_spec_1cba3201_like ON public.wagtailimages_rendition USING btree (filter_spec varchar_pattern_ops);


--
-- Name: wagtailimages_rendition_image_id_3e1fd774; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailimages_rendition_image_id_3e1fd774 ON public.wagtailimages_rendition USING btree (image_id);


--
-- Name: wagtailimages_uploadedimage_uploaded_by_user_id_85921689; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailimages_uploadedimage_uploaded_by_user_id_85921689 ON public.wagtailimages_uploadedimage USING btree (uploaded_by_user_id);


--
-- Name: wagtailredirects_redirect_old_path_bb35247b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailredirects_redirect_old_path_bb35247b ON public.wagtailredirects_redirect USING btree (old_path);


--
-- Name: wagtailredirects_redirect_old_path_bb35247b_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailredirects_redirect_old_path_bb35247b_like ON public.wagtailredirects_redirect USING btree (old_path varchar_pattern_ops);


--
-- Name: wagtailredirects_redirect_redirect_page_id_b5728a8f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailredirects_redirect_redirect_page_id_b5728a8f ON public.wagtailredirects_redirect USING btree (redirect_page_id);


--
-- Name: wagtailredirects_redirect_site_id_780a0e1e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailredirects_redirect_site_id_780a0e1e ON public.wagtailredirects_redirect USING btree (site_id);


--
-- Name: wagtailsearch_editorspick_page_id_28cbc274; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailsearch_editorspick_page_id_28cbc274 ON public.wagtailsearchpromotions_searchpromotion USING btree (page_id);


--
-- Name: wagtailsearch_editorspick_query_id_c6eee4a0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailsearch_editorspick_query_id_c6eee4a0 ON public.wagtailsearchpromotions_searchpromotion USING btree (query_id);


--
-- Name: wagtailsearch_query_query_string_e785ea07_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailsearch_query_query_string_e785ea07_like ON public.wagtailsearch_query USING btree (query_string varchar_pattern_ops);


--
-- Name: wagtailsearch_querydailyhits_query_id_2185994b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wagtailsearch_querydailyhits_query_id_2185994b ON public.wagtailsearch_querydailyhits USING btree (query_id);


--
-- Name: account_emailaddress account_emailaddress_user_id_2c513194_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_user_id_2c513194_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_emailconfirmation account_emailconfirm_email_address_id_5b7f8c58_fk_account_e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirm_email_address_id_5b7f8c58_fk_account_e FOREIGN KEY (email_address_id) REFERENCES public.account_emailaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_blogindexpage blog_blogindexpage_feed_image_id_5cb947e1_fk_wagtailim; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.blog_blogindexpage
    ADD CONSTRAINT blog_blogindexpage_feed_image_id_5cb947e1_fk_wagtailim FOREIGN KEY (feed_image_id) REFERENCES public.wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_blogindexpage blog_blogindexpage_page_ptr_id_d87c3ac2_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.blog_blogindexpage
    ADD CONSTRAINT blog_blogindexpage_page_ptr_id_d87c3ac2_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_blogindexpagerelatedlink blog_blogindexpagere_link_document_id_84c85fbf_fk_wagtaildo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.blog_blogindexpagerelatedlink
    ADD CONSTRAINT blog_blogindexpagere_link_document_id_84c85fbf_fk_wagtaildo FOREIGN KEY (link_document_id) REFERENCES public.wagtaildocs_document(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_blogindexpagerelatedlink blog_blogindexpagere_link_page_id_fdd456c7_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.blog_blogindexpagerelatedlink
    ADD CONSTRAINT blog_blogindexpagere_link_page_id_fdd456c7_fk_wagtailco FOREIGN KEY (link_page_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_blogindexpagerelatedlink blog_blogindexpagere_page_id_905f99b7_fk_blog_blog; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.blog_blogindexpagerelatedlink
    ADD CONSTRAINT blog_blogindexpagere_page_id_905f99b7_fk_blog_blog FOREIGN KEY (page_id) REFERENCES public.blog_blogindexpage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_blogpage blog_blogpage_feed_image_id_5f46dd6e_fk_wagtailimages_image_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.blog_blogpage
    ADD CONSTRAINT blog_blogpage_feed_image_id_5f46dd6e_fk_wagtailimages_image_id FOREIGN KEY (feed_image_id) REFERENCES public.wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_blogpage blog_blogpage_page_ptr_id_1d78e2b7_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.blog_blogpage
    ADD CONSTRAINT blog_blogpage_page_ptr_id_1d78e2b7_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_blogpagecarouselitem blog_blogpagecarouse_image_id_d51a8744_fk_wagtailim; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.blog_blogpagecarouselitem
    ADD CONSTRAINT blog_blogpagecarouse_image_id_d51a8744_fk_wagtailim FOREIGN KEY (image_id) REFERENCES public.wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_blogpagecarouselitem blog_blogpagecarouse_link_document_id_944c5996_fk_wagtaildo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.blog_blogpagecarouselitem
    ADD CONSTRAINT blog_blogpagecarouse_link_document_id_944c5996_fk_wagtaildo FOREIGN KEY (link_document_id) REFERENCES public.wagtaildocs_document(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_blogpagecarouselitem blog_blogpagecarouse_link_page_id_86ebc051_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.blog_blogpagecarouselitem
    ADD CONSTRAINT blog_blogpagecarouse_link_page_id_86ebc051_fk_wagtailco FOREIGN KEY (link_page_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_blogpagecarouselitem blog_blogpagecarouse_page_id_41128629_fk_blog_blog; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.blog_blogpagecarouselitem
    ADD CONSTRAINT blog_blogpagecarouse_page_id_41128629_fk_blog_blog FOREIGN KEY (page_id) REFERENCES public.blog_blogpage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_blogpagerelatedlink blog_blogpagerelated_link_document_id_358015f9_fk_wagtaildo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.blog_blogpagerelatedlink
    ADD CONSTRAINT blog_blogpagerelated_link_document_id_358015f9_fk_wagtaildo FOREIGN KEY (link_document_id) REFERENCES public.wagtaildocs_document(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_blogpagerelatedlink blog_blogpagerelated_link_page_id_1edfe541_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.blog_blogpagerelatedlink
    ADD CONSTRAINT blog_blogpagerelated_link_page_id_1edfe541_fk_wagtailco FOREIGN KEY (link_page_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_blogpagerelatedlink blog_blogpagerelated_page_id_31c20323_fk_blog_blog; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.blog_blogpagerelatedlink
    ADD CONSTRAINT blog_blogpagerelated_page_id_31c20323_fk_blog_blog FOREIGN KEY (page_id) REFERENCES public.blog_blogpage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_blogpagetag blog_blogpagetag_content_object_id_0dc644d2_fk_blog_blog; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.blog_blogpagetag
    ADD CONSTRAINT blog_blogpagetag_content_object_id_0dc644d2_fk_blog_blog FOREIGN KEY (content_object_id) REFERENCES public.blog_blogpage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_blogpagetag blog_blogpagetag_tag_id_81dc0e5f_fk_taggit_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.blog_blogpagetag
    ADD CONSTRAINT blog_blogpagetag_tag_id_81dc0e5f_fk_taggit_tag_id FOREIGN KEY (tag_id) REFERENCES public.taggit_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: contact_contactformfield contact_contactformf_page_id_95a7af80_fk_contact_c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contact_contactformfield
    ADD CONSTRAINT contact_contactformf_page_id_95a7af80_fk_contact_c FOREIGN KEY (page_id) REFERENCES public.contact_contactpage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: contact_contactpage contact_contactpage_feed_image_id_1f79cfe3_fk_wagtailim; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contact_contactpage
    ADD CONSTRAINT contact_contactpage_feed_image_id_1f79cfe3_fk_wagtailim FOREIGN KEY (feed_image_id) REFERENCES public.wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: contact_contactpage contact_contactpage_page_ptr_id_143c93c1_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contact_contactpage
    ADD CONSTRAINT contact_contactpage_page_ptr_id_143c93c1_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: contact_formfield contact_formfield_page_id_3ee48e6d_fk_contact_f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contact_formfield
    ADD CONSTRAINT contact_formfield_page_id_3ee48e6d_fk_contact_f FOREIGN KEY (page_id) REFERENCES public.contact_formpage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: contact_formpage contact_formpage_feed_image_id_0303d2c9_fk_wagtailim; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contact_formpage
    ADD CONSTRAINT contact_formpage_feed_image_id_0303d2c9_fk_wagtailim FOREIGN KEY (feed_image_id) REFERENCES public.wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: contact_formpage contact_formpage_page_ptr_id_93c16e67_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contact_formpage
    ADD CONSTRAINT contact_formpage_page_ptr_id_93c16e67_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: documents_gallery_documentspagetag documents_gallery_do_content_object_id_d50ea041_fk_documents; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.documents_gallery_documentspagetag
    ADD CONSTRAINT documents_gallery_do_content_object_id_d50ea041_fk_documents FOREIGN KEY (content_object_id) REFERENCES public.documents_gallery_documentspage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: documents_gallery_documentspage documents_gallery_do_feed_image_id_72f32dc7_fk_wagtailim; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.documents_gallery_documentspage
    ADD CONSTRAINT documents_gallery_do_feed_image_id_72f32dc7_fk_wagtailim FOREIGN KEY (feed_image_id) REFERENCES public.wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: documents_gallery_documentsindexpage documents_gallery_do_feed_image_id_732ac53b_fk_wagtailim; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.documents_gallery_documentsindexpage
    ADD CONSTRAINT documents_gallery_do_feed_image_id_732ac53b_fk_wagtailim FOREIGN KEY (feed_image_id) REFERENCES public.wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: documents_gallery_documentspage documents_gallery_do_page_ptr_id_ef81894a_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.documents_gallery_documentspage
    ADD CONSTRAINT documents_gallery_do_page_ptr_id_ef81894a_fk_wagtailco FOREIGN KEY (page_ptr_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: documents_gallery_documentsindexpage documents_gallery_do_page_ptr_id_f7fa951f_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.documents_gallery_documentsindexpage
    ADD CONSTRAINT documents_gallery_do_page_ptr_id_f7fa951f_fk_wagtailco FOREIGN KEY (page_ptr_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: documents_gallery_documentspagetag documents_gallery_do_tag_id_50625f82_fk_taggit_ta; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.documents_gallery_documentspagetag
    ADD CONSTRAINT documents_gallery_do_tag_id_50625f82_fk_taggit_ta FOREIGN KEY (tag_id) REFERENCES public.taggit_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: events_eventindexpage events_eventindexpag_feed_image_id_d6958e2f_fk_wagtailim; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.events_eventindexpage
    ADD CONSTRAINT events_eventindexpag_feed_image_id_d6958e2f_fk_wagtailim FOREIGN KEY (feed_image_id) REFERENCES public.wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: events_eventindexpagerelatedlink events_eventindexpag_link_document_id_f50895d4_fk_wagtaildo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.events_eventindexpagerelatedlink
    ADD CONSTRAINT events_eventindexpag_link_document_id_f50895d4_fk_wagtaildo FOREIGN KEY (link_document_id) REFERENCES public.wagtaildocs_document(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: events_eventindexpagerelatedlink events_eventindexpag_link_page_id_4c88907b_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.events_eventindexpagerelatedlink
    ADD CONSTRAINT events_eventindexpag_link_page_id_4c88907b_fk_wagtailco FOREIGN KEY (link_page_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: events_eventindexpagerelatedlink events_eventindexpag_page_id_7ac7d364_fk_events_ev; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.events_eventindexpagerelatedlink
    ADD CONSTRAINT events_eventindexpag_page_id_7ac7d364_fk_events_ev FOREIGN KEY (page_id) REFERENCES public.events_eventindexpage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: events_eventindexpage events_eventindexpag_page_ptr_id_d4ed8796_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.events_eventindexpage
    ADD CONSTRAINT events_eventindexpag_page_ptr_id_d4ed8796_fk_wagtailco FOREIGN KEY (page_ptr_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: events_eventpage events_eventpage_feed_image_id_25a625d0_fk_wagtailim; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.events_eventpage
    ADD CONSTRAINT events_eventpage_feed_image_id_25a625d0_fk_wagtailim FOREIGN KEY (feed_image_id) REFERENCES public.wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: events_eventpage events_eventpage_page_ptr_id_c6701067_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.events_eventpage
    ADD CONSTRAINT events_eventpage_page_ptr_id_c6701067_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: events_eventpagecarouselitem events_eventpagecaro_image_id_fb4b4dcd_fk_wagtailim; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.events_eventpagecarouselitem
    ADD CONSTRAINT events_eventpagecaro_image_id_fb4b4dcd_fk_wagtailim FOREIGN KEY (image_id) REFERENCES public.wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: events_eventpagecarouselitem events_eventpagecaro_link_document_id_85c089ab_fk_wagtaildo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.events_eventpagecarouselitem
    ADD CONSTRAINT events_eventpagecaro_link_document_id_85c089ab_fk_wagtaildo FOREIGN KEY (link_document_id) REFERENCES public.wagtaildocs_document(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: events_eventpagecarouselitem events_eventpagecaro_link_page_id_388fd2d0_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.events_eventpagecarouselitem
    ADD CONSTRAINT events_eventpagecaro_link_page_id_388fd2d0_fk_wagtailco FOREIGN KEY (link_page_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: events_eventpagecarouselitem events_eventpagecaro_page_id_eec52587_fk_events_ev; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.events_eventpagecarouselitem
    ADD CONSTRAINT events_eventpagecaro_page_id_eec52587_fk_events_ev FOREIGN KEY (page_id) REFERENCES public.events_eventpage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: events_eventpagerelatedlink events_eventpagerela_link_document_id_bc602f32_fk_wagtaildo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.events_eventpagerelatedlink
    ADD CONSTRAINT events_eventpagerela_link_document_id_bc602f32_fk_wagtaildo FOREIGN KEY (link_document_id) REFERENCES public.wagtaildocs_document(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: events_eventpagerelatedlink events_eventpagerela_link_page_id_378ea87f_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.events_eventpagerelatedlink
    ADD CONSTRAINT events_eventpagerela_link_page_id_378ea87f_fk_wagtailco FOREIGN KEY (link_page_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: events_eventpagerelatedlink events_eventpagerela_page_id_2da96f87_fk_events_ev; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.events_eventpagerelatedlink
    ADD CONSTRAINT events_eventpagerela_page_id_2da96f87_fk_events_ev FOREIGN KEY (page_id) REFERENCES public.events_eventpage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: events_eventpagespeaker events_eventpagespea_image_id_f48678eb_fk_wagtailim; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.events_eventpagespeaker
    ADD CONSTRAINT events_eventpagespea_image_id_f48678eb_fk_wagtailim FOREIGN KEY (image_id) REFERENCES public.wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: events_eventpagespeaker events_eventpagespea_link_document_id_0252ea0f_fk_wagtaildo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.events_eventpagespeaker
    ADD CONSTRAINT events_eventpagespea_link_document_id_0252ea0f_fk_wagtaildo FOREIGN KEY (link_document_id) REFERENCES public.wagtaildocs_document(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: events_eventpagespeaker events_eventpagespea_link_page_id_f4549a64_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.events_eventpagespeaker
    ADD CONSTRAINT events_eventpagespea_link_page_id_f4549a64_fk_wagtailco FOREIGN KEY (link_page_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: events_eventpagespeaker events_eventpagespea_page_id_10883f65_fk_events_ev; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.events_eventpagespeaker
    ADD CONSTRAINT events_eventpagespea_page_id_10883f65_fk_events_ev FOREIGN KEY (page_id) REFERENCES public.events_eventpage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: events_eventpagetag events_eventpagetag_content_object_id_a9eee66f_fk_events_ev; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.events_eventpagetag
    ADD CONSTRAINT events_eventpagetag_content_object_id_a9eee66f_fk_events_ev FOREIGN KEY (content_object_id) REFERENCES public.events_eventpage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: events_eventpagetag events_eventpagetag_tag_id_b811cfc5_fk_taggit_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.events_eventpagetag
    ADD CONSTRAINT events_eventpagetag_tag_id_b811cfc5_fk_taggit_tag_id FOREIGN KEY (tag_id) REFERENCES public.taggit_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: gallery_galleryindex gallery_galleryindex_collection_id_f3527005_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.gallery_galleryindex
    ADD CONSTRAINT gallery_galleryindex_collection_id_f3527005_fk_wagtailco FOREIGN KEY (collection_id) REFERENCES public.wagtailcore_collection(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: gallery_galleryindex gallery_galleryindex_feed_image_id_026d6012_fk_wagtailim; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.gallery_galleryindex
    ADD CONSTRAINT gallery_galleryindex_feed_image_id_026d6012_fk_wagtailim FOREIGN KEY (feed_image_id) REFERENCES public.wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: gallery_galleryindex gallery_galleryindex_page_ptr_id_10f1b9bb_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.gallery_galleryindex
    ADD CONSTRAINT gallery_galleryindex_page_ptr_id_10f1b9bb_fk_wagtailco FOREIGN KEY (page_ptr_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: gallery_photogalleryindexpage gallery_photogallery_feed_image_id_a5e0841c_fk_wagtailim; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.gallery_photogalleryindexpage
    ADD CONSTRAINT gallery_photogallery_feed_image_id_a5e0841c_fk_wagtailim FOREIGN KEY (feed_image_id) REFERENCES public.wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: gallery_photogalleryindexpage gallery_photogallery_page_ptr_id_2e10e2e7_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.gallery_photogalleryindexpage
    ADD CONSTRAINT gallery_photogallery_page_ptr_id_2e10e2e7_fk_wagtailco FOREIGN KEY (page_ptr_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: joyous_calendarpage joyous_calendarpage_page_ptr_id_80e75669_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.joyous_calendarpage
    ADD CONSTRAINT joyous_calendarpage_page_ptr_id_80e75669_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: joyous_cancellationpage joyous_cancellationp_overrides_id_dd65c498_fk_joyous_re; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.joyous_cancellationpage
    ADD CONSTRAINT joyous_cancellationp_overrides_id_dd65c498_fk_joyous_re FOREIGN KEY (overrides_id) REFERENCES public.joyous_recurringeventpage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: joyous_cancellationpage joyous_cancellationp_page_ptr_id_7170b246_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.joyous_cancellationpage
    ADD CONSTRAINT joyous_cancellationp_page_ptr_id_7170b246_fk_wagtailco FOREIGN KEY (page_ptr_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: joyous_extrainfopage joyous_extrainfopage_overrides_id_504a3667_fk_joyous_re; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.joyous_extrainfopage
    ADD CONSTRAINT joyous_extrainfopage_overrides_id_504a3667_fk_joyous_re FOREIGN KEY (overrides_id) REFERENCES public.joyous_recurringeventpage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: joyous_extrainfopage joyous_extrainfopage_page_ptr_id_027068bf_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.joyous_extrainfopage
    ADD CONSTRAINT joyous_extrainfopage_page_ptr_id_027068bf_fk_wagtailco FOREIGN KEY (page_ptr_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: joyous_grouppage joyous_grouppage_page_ptr_id_eacc8735_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.joyous_grouppage
    ADD CONSTRAINT joyous_grouppage_page_ptr_id_eacc8735_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: joyous_multidayeventpage joyous_multidayevent_category_id_49c850c5_fk_joyous_ev; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.joyous_multidayeventpage
    ADD CONSTRAINT joyous_multidayevent_category_id_49c850c5_fk_joyous_ev FOREIGN KEY (category_id) REFERENCES public.joyous_eventcategory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: joyous_multidayeventpage joyous_multidayevent_group_page_id_1c4ff29c_fk_joyous_gr; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.joyous_multidayeventpage
    ADD CONSTRAINT joyous_multidayevent_group_page_id_1c4ff29c_fk_joyous_gr FOREIGN KEY (group_page_id) REFERENCES public.joyous_grouppage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: joyous_multidayeventpage joyous_multidayevent_image_id_1ca84448_fk_wagtailim; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.joyous_multidayeventpage
    ADD CONSTRAINT joyous_multidayevent_image_id_1ca84448_fk_wagtailim FOREIGN KEY (image_id) REFERENCES public.wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: joyous_multidayeventpage joyous_multidayevent_page_ptr_id_38cda9dd_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.joyous_multidayeventpage
    ADD CONSTRAINT joyous_multidayevent_page_ptr_id_38cda9dd_fk_wagtailco FOREIGN KEY (page_ptr_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: joyous_postponementpage joyous_postponementp_cancellationpage_ptr_59e8079c_fk_joyous_ca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.joyous_postponementpage
    ADD CONSTRAINT joyous_postponementp_cancellationpage_ptr_59e8079c_fk_joyous_ca FOREIGN KEY (cancellationpage_ptr_id) REFERENCES public.joyous_cancellationpage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: joyous_postponementpage joyous_postponementp_category_id_589f353c_fk_joyous_ev; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.joyous_postponementpage
    ADD CONSTRAINT joyous_postponementp_category_id_589f353c_fk_joyous_ev FOREIGN KEY (category_id) REFERENCES public.joyous_eventcategory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: joyous_postponementpage joyous_postponementp_image_id_d5aa5059_fk_wagtailim; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.joyous_postponementpage
    ADD CONSTRAINT joyous_postponementp_image_id_d5aa5059_fk_wagtailim FOREIGN KEY (image_id) REFERENCES public.wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: joyous_recurringeventpage joyous_recurringeven_category_id_96630039_fk_joyous_ev; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.joyous_recurringeventpage
    ADD CONSTRAINT joyous_recurringeven_category_id_96630039_fk_joyous_ev FOREIGN KEY (category_id) REFERENCES public.joyous_eventcategory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: joyous_recurringeventpage joyous_recurringeven_group_page_id_398b4ca4_fk_joyous_gr; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.joyous_recurringeventpage
    ADD CONSTRAINT joyous_recurringeven_group_page_id_398b4ca4_fk_joyous_gr FOREIGN KEY (group_page_id) REFERENCES public.joyous_grouppage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: joyous_recurringeventpage joyous_recurringeven_image_id_92d01cbf_fk_wagtailim; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.joyous_recurringeventpage
    ADD CONSTRAINT joyous_recurringeven_image_id_92d01cbf_fk_wagtailim FOREIGN KEY (image_id) REFERENCES public.wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: joyous_recurringeventpage joyous_recurringeven_page_ptr_id_fc885e93_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.joyous_recurringeventpage
    ADD CONSTRAINT joyous_recurringeven_page_ptr_id_fc885e93_fk_wagtailco FOREIGN KEY (page_ptr_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: joyous_simpleeventpage joyous_simpleeventpa_category_id_7a376bea_fk_joyous_ev; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.joyous_simpleeventpage
    ADD CONSTRAINT joyous_simpleeventpa_category_id_7a376bea_fk_joyous_ev FOREIGN KEY (category_id) REFERENCES public.joyous_eventcategory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: joyous_simpleeventpage joyous_simpleeventpa_group_page_id_10253052_fk_joyous_gr; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.joyous_simpleeventpage
    ADD CONSTRAINT joyous_simpleeventpa_group_page_id_10253052_fk_joyous_gr FOREIGN KEY (group_page_id) REFERENCES public.joyous_grouppage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: joyous_simpleeventpage joyous_simpleeventpa_image_id_5abc3f53_fk_wagtailim; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.joyous_simpleeventpage
    ADD CONSTRAINT joyous_simpleeventpa_image_id_5abc3f53_fk_wagtailim FOREIGN KEY (image_id) REFERENCES public.wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: joyous_simpleeventpage joyous_simpleeventpa_page_ptr_id_69eba7d0_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.joyous_simpleeventpage
    ADD CONSTRAINT joyous_simpleeventpa_page_ptr_id_69eba7d0_fk_wagtailco FOREIGN KEY (page_ptr_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pages_advert pages_advert_image_id_c3df93a1_fk_wagtailimages_image_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_advert
    ADD CONSTRAINT pages_advert_image_id_c3df93a1_fk_wagtailimages_image_id FOREIGN KEY (image_id) REFERENCES public.wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pages_advert pages_advert_link_document_id_d804b3dc_fk_wagtaildo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_advert
    ADD CONSTRAINT pages_advert_link_document_id_d804b3dc_fk_wagtaildo FOREIGN KEY (link_document_id) REFERENCES public.wagtaildocs_document(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pages_advert pages_advert_link_page_id_ae00fe23_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_advert
    ADD CONSTRAINT pages_advert_link_page_id_ae00fe23_fk_wagtailcore_page_id FOREIGN KEY (link_page_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pages_advert pages_advert_page_id_21245cc0_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_advert
    ADD CONSTRAINT pages_advert_page_id_21245cc0_fk_wagtailcore_page_id FOREIGN KEY (page_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pages_contentblock pages_contentblock_link_document_id_0b825445_fk_wagtaildo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_contentblock
    ADD CONSTRAINT pages_contentblock_link_document_id_0b825445_fk_wagtaildo FOREIGN KEY (link_document_id) REFERENCES public.wagtaildocs_document(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pages_contentblock pages_contentblock_link_page_id_84f7b516_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_contentblock
    ADD CONSTRAINT pages_contentblock_link_page_id_84f7b516_fk_wagtailcore_page_id FOREIGN KEY (link_page_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pages_contentblock pages_contentblock_page_id_d29244b9_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_contentblock
    ADD CONSTRAINT pages_contentblock_page_id_d29244b9_fk_wagtailcore_page_id FOREIGN KEY (page_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pages_faqspage pages_faqspage_page_ptr_id_15a8d513_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_faqspage
    ADD CONSTRAINT pages_faqspage_page_ptr_id_15a8d513_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pages_homepage pages_homepage_feed_image_id_4ebba3a8_fk_wagtailimages_image_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_homepage
    ADD CONSTRAINT pages_homepage_feed_image_id_4ebba3a8_fk_wagtailimages_image_id FOREIGN KEY (feed_image_id) REFERENCES public.wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pages_homepage pages_homepage_page_ptr_id_5b805d74_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_homepage
    ADD CONSTRAINT pages_homepage_page_ptr_id_5b805d74_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pages_homepagecarouselitem pages_homepagecarous_image_id_45b3424e_fk_wagtailim; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_homepagecarouselitem
    ADD CONSTRAINT pages_homepagecarous_image_id_45b3424e_fk_wagtailim FOREIGN KEY (image_id) REFERENCES public.wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pages_homepagecarouselitem pages_homepagecarous_link_document_id_902c9e7d_fk_wagtaildo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_homepagecarouselitem
    ADD CONSTRAINT pages_homepagecarous_link_document_id_902c9e7d_fk_wagtaildo FOREIGN KEY (link_document_id) REFERENCES public.wagtaildocs_document(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pages_homepagecarouselitem pages_homepagecarous_link_page_id_799b1594_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_homepagecarouselitem
    ADD CONSTRAINT pages_homepagecarous_link_page_id_799b1594_fk_wagtailco FOREIGN KEY (link_page_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pages_homepagecarouselitem pages_homepagecarous_page_id_915b43c4_fk_pages_hom; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_homepagecarouselitem
    ADD CONSTRAINT pages_homepagecarous_page_id_915b43c4_fk_pages_hom FOREIGN KEY (page_id) REFERENCES public.pages_homepage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pages_homepagecontentitem pages_homepageconten_image_id_85ec39f6_fk_wagtailim; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_homepagecontentitem
    ADD CONSTRAINT pages_homepageconten_image_id_85ec39f6_fk_wagtailim FOREIGN KEY (image_id) REFERENCES public.wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pages_homepagecontentitem pages_homepageconten_link_document_id_a2552580_fk_wagtaildo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_homepagecontentitem
    ADD CONSTRAINT pages_homepageconten_link_document_id_a2552580_fk_wagtaildo FOREIGN KEY (link_document_id) REFERENCES public.wagtaildocs_document(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pages_homepagecontentitem pages_homepageconten_link_page_id_9aa371ca_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_homepagecontentitem
    ADD CONSTRAINT pages_homepageconten_link_page_id_9aa371ca_fk_wagtailco FOREIGN KEY (link_page_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pages_homepagecontentitem pages_homepageconten_page_id_8b646417_fk_pages_hom; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_homepagecontentitem
    ADD CONSTRAINT pages_homepageconten_page_id_8b646417_fk_pages_hom FOREIGN KEY (page_id) REFERENCES public.pages_homepage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pages_homepagerelatedlink pages_homepagerelate_link_document_id_1364f817_fk_wagtaildo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_homepagerelatedlink
    ADD CONSTRAINT pages_homepagerelate_link_document_id_1364f817_fk_wagtaildo FOREIGN KEY (link_document_id) REFERENCES public.wagtaildocs_document(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pages_homepagerelatedlink pages_homepagerelate_link_page_id_87ab8ff4_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_homepagerelatedlink
    ADD CONSTRAINT pages_homepagerelate_link_page_id_87ab8ff4_fk_wagtailco FOREIGN KEY (link_page_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pages_homepagerelatedlink pages_homepagerelate_page_id_b0a3517a_fk_pages_hom; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_homepagerelatedlink
    ADD CONSTRAINT pages_homepagerelate_page_id_b0a3517a_fk_pages_hom FOREIGN KEY (page_id) REFERENCES public.pages_homepage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pages_sitebranding pages_sitebranding_logo_id_2841159b_fk_wagtailimages_image_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_sitebranding
    ADD CONSTRAINT pages_sitebranding_logo_id_2841159b_fk_wagtailimages_image_id FOREIGN KEY (logo_id) REFERENCES public.wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pages_sitebranding pages_sitebranding_site_id_04cc1128_fk_wagtailcore_site_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_sitebranding
    ADD CONSTRAINT pages_sitebranding_site_id_04cc1128_fk_wagtailcore_site_id FOREIGN KEY (site_id) REFERENCES public.wagtailcore_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pages_socialmediasettings pages_socialmediaset_site_id_48a3ffb9_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_socialmediasettings
    ADD CONSTRAINT pages_socialmediaset_site_id_48a3ffb9_fk_wagtailco FOREIGN KEY (site_id) REFERENCES public.wagtailcore_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pages_standardindexpage pages_standardindexp_feed_image_id_a65c3494_fk_wagtailim; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_standardindexpage
    ADD CONSTRAINT pages_standardindexp_feed_image_id_a65c3494_fk_wagtailim FOREIGN KEY (feed_image_id) REFERENCES public.wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pages_standardindexpagerelatedlink pages_standardindexp_link_document_id_ab0a20f8_fk_wagtaildo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_standardindexpagerelatedlink
    ADD CONSTRAINT pages_standardindexp_link_document_id_ab0a20f8_fk_wagtaildo FOREIGN KEY (link_document_id) REFERENCES public.wagtaildocs_document(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pages_standardindexpagerelatedlink pages_standardindexp_link_page_id_8ad61c91_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_standardindexpagerelatedlink
    ADD CONSTRAINT pages_standardindexp_link_page_id_8ad61c91_fk_wagtailco FOREIGN KEY (link_page_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pages_standardindexpagerelatedlink pages_standardindexp_page_id_d0df6fde_fk_pages_sta; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_standardindexpagerelatedlink
    ADD CONSTRAINT pages_standardindexp_page_id_d0df6fde_fk_pages_sta FOREIGN KEY (page_id) REFERENCES public.pages_standardindexpage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pages_standardindexpage pages_standardindexp_page_ptr_id_70a0d3dc_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_standardindexpage
    ADD CONSTRAINT pages_standardindexp_page_ptr_id_70a0d3dc_fk_wagtailco FOREIGN KEY (page_ptr_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pages_standardpage pages_standardpage_feed_image_id_41c2eccd_fk_wagtailim; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_standardpage
    ADD CONSTRAINT pages_standardpage_feed_image_id_41c2eccd_fk_wagtailim FOREIGN KEY (feed_image_id) REFERENCES public.wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pages_standardpage pages_standardpage_page_ptr_id_8d8149d9_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_standardpage
    ADD CONSTRAINT pages_standardpage_page_ptr_id_8d8149d9_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pages_standardpagecarouselitem pages_standardpageca_image_id_8d81528b_fk_wagtailim; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_standardpagecarouselitem
    ADD CONSTRAINT pages_standardpageca_image_id_8d81528b_fk_wagtailim FOREIGN KEY (image_id) REFERENCES public.wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pages_standardpagecarouselitem pages_standardpageca_link_document_id_1e821170_fk_wagtaildo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_standardpagecarouselitem
    ADD CONSTRAINT pages_standardpageca_link_document_id_1e821170_fk_wagtaildo FOREIGN KEY (link_document_id) REFERENCES public.wagtaildocs_document(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pages_standardpagecarouselitem pages_standardpageca_link_page_id_28e4472a_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_standardpagecarouselitem
    ADD CONSTRAINT pages_standardpageca_link_page_id_28e4472a_fk_wagtailco FOREIGN KEY (link_page_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pages_standardpagecarouselitem pages_standardpageca_page_id_ab87f566_fk_pages_sta; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_standardpagecarouselitem
    ADD CONSTRAINT pages_standardpageca_page_id_ab87f566_fk_pages_sta FOREIGN KEY (page_id) REFERENCES public.pages_standardpage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pages_standardpagerelatedlink pages_standardpagere_link_document_id_c02096ae_fk_wagtaildo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_standardpagerelatedlink
    ADD CONSTRAINT pages_standardpagere_link_document_id_c02096ae_fk_wagtaildo FOREIGN KEY (link_document_id) REFERENCES public.wagtaildocs_document(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pages_standardpagerelatedlink pages_standardpagere_link_page_id_29341951_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_standardpagerelatedlink
    ADD CONSTRAINT pages_standardpagere_link_page_id_29341951_fk_wagtailco FOREIGN KEY (link_page_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pages_standardpagerelatedlink pages_standardpagere_page_id_1c982abb_fk_pages_sta; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_standardpagerelatedlink
    ADD CONSTRAINT pages_standardpagere_page_id_1c982abb_fk_pages_sta FOREIGN KEY (page_id) REFERENCES public.pages_standardpage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pages_testimonial pages_testimonial_link_document_id_3c7b9377_fk_wagtaildo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_testimonial
    ADD CONSTRAINT pages_testimonial_link_document_id_3c7b9377_fk_wagtaildo FOREIGN KEY (link_document_id) REFERENCES public.wagtaildocs_document(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pages_testimonial pages_testimonial_link_page_id_70b58081_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_testimonial
    ADD CONSTRAINT pages_testimonial_link_page_id_70b58081_fk_wagtailcore_page_id FOREIGN KEY (link_page_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pages_testimonial pages_testimonial_page_id_aedaf53f_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_testimonial
    ADD CONSTRAINT pages_testimonial_page_id_aedaf53f_fk_wagtailcore_page_id FOREIGN KEY (page_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pages_testimonial pages_testimonial_photo_id_29360729_fk_wagtailimages_image_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_testimonial
    ADD CONSTRAINT pages_testimonial_photo_id_29360729_fk_wagtailimages_image_id FOREIGN KEY (photo_id) REFERENCES public.wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pages_testimonialpage pages_testimonialpag_feed_image_id_598eb509_fk_wagtailim; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_testimonialpage
    ADD CONSTRAINT pages_testimonialpag_feed_image_id_598eb509_fk_wagtailim FOREIGN KEY (feed_image_id) REFERENCES public.wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pages_testimonialpage pages_testimonialpag_page_ptr_id_2ec75089_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_testimonialpage
    ADD CONSTRAINT pages_testimonialpag_page_ptr_id_2ec75089_fk_wagtailco FOREIGN KEY (page_ptr_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pages_videogallerypage pages_videogallerypa_feed_image_id_250d9360_fk_wagtailim; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_videogallerypage
    ADD CONSTRAINT pages_videogallerypa_feed_image_id_250d9360_fk_wagtailim FOREIGN KEY (feed_image_id) REFERENCES public.wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pages_videogallerypagecarouselitem pages_videogallerypa_link_document_id_a39081fb_fk_wagtaildo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_videogallerypagecarouselitem
    ADD CONSTRAINT pages_videogallerypa_link_document_id_a39081fb_fk_wagtaildo FOREIGN KEY (link_document_id) REFERENCES public.wagtaildocs_document(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pages_videogallerypagecarouselitem pages_videogallerypa_link_page_id_1fd5a4bb_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_videogallerypagecarouselitem
    ADD CONSTRAINT pages_videogallerypa_link_page_id_1fd5a4bb_fk_wagtailco FOREIGN KEY (link_page_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pages_videogallerypage pages_videogallerypa_page_ptr_id_e99012e4_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_videogallerypage
    ADD CONSTRAINT pages_videogallerypa_page_ptr_id_e99012e4_fk_wagtailco FOREIGN KEY (page_ptr_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pages_videogallerypagecarouselitem pages_videopagecarou_image_id_2817929a_fk_wagtailim; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_videogallerypagecarouselitem
    ADD CONSTRAINT pages_videopagecarou_image_id_2817929a_fk_wagtailim FOREIGN KEY (image_id) REFERENCES public.wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: people_personindexpage people_personindexpa_feed_image_id_ea7ff652_fk_wagtailim; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.people_personindexpage
    ADD CONSTRAINT people_personindexpa_feed_image_id_ea7ff652_fk_wagtailim FOREIGN KEY (feed_image_id) REFERENCES public.wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: people_personindexpagerelatedlink people_personindexpa_link_document_id_6fb113f2_fk_wagtaildo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.people_personindexpagerelatedlink
    ADD CONSTRAINT people_personindexpa_link_document_id_6fb113f2_fk_wagtaildo FOREIGN KEY (link_document_id) REFERENCES public.wagtaildocs_document(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: people_personindexpagerelatedlink people_personindexpa_link_page_id_9a45cdb2_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.people_personindexpagerelatedlink
    ADD CONSTRAINT people_personindexpa_link_page_id_9a45cdb2_fk_wagtailco FOREIGN KEY (link_page_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: people_personindexpagerelatedlink people_personindexpa_page_id_9074b56c_fk_people_pe; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.people_personindexpagerelatedlink
    ADD CONSTRAINT people_personindexpa_page_id_9074b56c_fk_people_pe FOREIGN KEY (page_id) REFERENCES public.people_personindexpage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: people_personindexpage people_personindexpa_page_ptr_id_2aafa812_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.people_personindexpage
    ADD CONSTRAINT people_personindexpa_page_ptr_id_2aafa812_fk_wagtailco FOREIGN KEY (page_ptr_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: people_personpage people_personpage_feed_image_id_c8aaeda0_fk_wagtailim; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.people_personpage
    ADD CONSTRAINT people_personpage_feed_image_id_c8aaeda0_fk_wagtailim FOREIGN KEY (feed_image_id) REFERENCES public.wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: people_personpage people_personpage_image_id_f13def2e_fk_wagtailimages_image_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.people_personpage
    ADD CONSTRAINT people_personpage_image_id_f13def2e_fk_wagtailimages_image_id FOREIGN KEY (image_id) REFERENCES public.wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: people_personpage people_personpage_page_ptr_id_0f038b98_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.people_personpage
    ADD CONSTRAINT people_personpage_page_ptr_id_0f038b98_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: people_personpage people_personpage_role_id_534a1c51_fk_people_personrole_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.people_personpage
    ADD CONSTRAINT people_personpage_role_id_534a1c51_fk_people_personrole_id FOREIGN KEY (role_id) REFERENCES public.people_personrole(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: people_personpagerelatedlink people_personpagerel_link_document_id_d330a140_fk_wagtaildo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.people_personpagerelatedlink
    ADD CONSTRAINT people_personpagerel_link_document_id_d330a140_fk_wagtaildo FOREIGN KEY (link_document_id) REFERENCES public.wagtaildocs_document(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: people_personpagerelatedlink people_personpagerel_link_page_id_1f38718a_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.people_personpagerelatedlink
    ADD CONSTRAINT people_personpagerel_link_page_id_1f38718a_fk_wagtailco FOREIGN KEY (link_page_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: people_personpagerelatedlink people_personpagerel_page_id_37654932_fk_people_pe; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.people_personpagerelatedlink
    ADD CONSTRAINT people_personpagerel_page_id_37654932_fk_people_pe FOREIGN KEY (page_id) REFERENCES public.people_personpage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: people_personpagetag people_personpagetag_content_object_id_219202ed_fk_people_pe; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.people_personpagetag
    ADD CONSTRAINT people_personpagetag_content_object_id_219202ed_fk_people_pe FOREIGN KEY (content_object_id) REFERENCES public.people_personpage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: people_personpagetag people_personpagetag_tag_id_e0d52d9d_fk_taggit_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.people_personpagetag
    ADD CONSTRAINT people_personpagetag_tag_id_e0d52d9d_fk_taggit_tag_id FOREIGN KEY (tag_id) REFERENCES public.taggit_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: postgres_search_indexentry postgres_search_inde_content_type_id_d805086f_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.postgres_search_indexentry
    ADD CONSTRAINT postgres_search_inde_content_type_id_d805086f_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_productindexpage products_productinde_feed_image_id_f1b46ba8_fk_wagtailim; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_productindexpage
    ADD CONSTRAINT products_productinde_feed_image_id_f1b46ba8_fk_wagtailim FOREIGN KEY (feed_image_id) REFERENCES public.wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_productindexpagerelatedlink products_productinde_link_document_id_7589e588_fk_wagtaildo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_productindexpagerelatedlink
    ADD CONSTRAINT products_productinde_link_document_id_7589e588_fk_wagtaildo FOREIGN KEY (link_document_id) REFERENCES public.wagtaildocs_document(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_productindexpagerelatedlink products_productinde_link_page_id_cc9048a1_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_productindexpagerelatedlink
    ADD CONSTRAINT products_productinde_link_page_id_cc9048a1_fk_wagtailco FOREIGN KEY (link_page_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_productindexpagerelatedlink products_productinde_page_id_320a0204_fk_products_; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_productindexpagerelatedlink
    ADD CONSTRAINT products_productinde_page_id_320a0204_fk_products_ FOREIGN KEY (page_id) REFERENCES public.products_productindexpage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_productindexpage products_productinde_page_ptr_id_896e5596_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_productindexpage
    ADD CONSTRAINT products_productinde_page_ptr_id_896e5596_fk_wagtailco FOREIGN KEY (page_ptr_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_productpagetag products_productpage_content_object_id_1985a884_fk_products_; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_productpagetag
    ADD CONSTRAINT products_productpage_content_object_id_1985a884_fk_products_ FOREIGN KEY (content_object_id) REFERENCES public.products_productpage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_productpage products_productpage_feed_image_id_fc5dc22b_fk_wagtailim; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_productpage
    ADD CONSTRAINT products_productpage_feed_image_id_fc5dc22b_fk_wagtailim FOREIGN KEY (feed_image_id) REFERENCES public.wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_productpage products_productpage_image_id_b4d3829e_fk_wagtailim; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_productpage
    ADD CONSTRAINT products_productpage_image_id_b4d3829e_fk_wagtailim FOREIGN KEY (image_id) REFERENCES public.wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_productpagerelatedlink products_productpage_link_document_id_d6cd7769_fk_wagtaildo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_productpagerelatedlink
    ADD CONSTRAINT products_productpage_link_document_id_d6cd7769_fk_wagtaildo FOREIGN KEY (link_document_id) REFERENCES public.wagtaildocs_document(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_productpagerelatedlink products_productpage_link_page_id_39628d87_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_productpagerelatedlink
    ADD CONSTRAINT products_productpage_link_page_id_39628d87_fk_wagtailco FOREIGN KEY (link_page_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_productpagerelatedlink products_productpage_page_id_855d9c33_fk_products_; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_productpagerelatedlink
    ADD CONSTRAINT products_productpage_page_id_855d9c33_fk_products_ FOREIGN KEY (page_id) REFERENCES public.products_productpage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_productpage products_productpage_page_ptr_id_d4d9ff65_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_productpage
    ADD CONSTRAINT products_productpage_page_ptr_id_d4d9ff65_fk_wagtailco FOREIGN KEY (page_ptr_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_productpagetag products_productpagetag_tag_id_f0c81f66_fk_taggit_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_productpagetag
    ADD CONSTRAINT products_productpagetag_tag_id_f0c81f66_fk_taggit_tag_id FOREIGN KEY (tag_id) REFERENCES public.taggit_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialtoken socialaccount_social_account_id_951f210e_fk_socialacc; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_social_account_id_951f210e_fk_socialacc FOREIGN KEY (account_id) REFERENCES public.socialaccount_socialaccount(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialtoken socialaccount_social_app_id_636a42d7_fk_socialacc; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_social_app_id_636a42d7_fk_socialacc FOREIGN KEY (app_id) REFERENCES public.socialaccount_socialapp(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialapp_sites socialaccount_social_site_id_2579dee5_fk_django_si; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_social_site_id_2579dee5_fk_django_si FOREIGN KEY (site_id) REFERENCES public.django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialapp_sites socialaccount_social_socialapp_id_97fb6e7d_fk_socialacc; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_social_socialapp_id_97fb6e7d_fk_socialacc FOREIGN KEY (socialapp_id) REFERENCES public.socialaccount_socialapp(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialaccount socialaccount_socialaccount_user_id_8146e70c_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_user_id_8146e70c_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: taggit_taggeditem taggit_taggeditem_content_type_id_9957a03c_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.taggit_taggeditem
    ADD CONSTRAINT taggit_taggeditem_content_type_id_9957a03c_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: taggit_taggeditem taggit_taggeditem_tag_id_f4f5b767_fk_taggit_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.taggit_taggeditem
    ADD CONSTRAINT taggit_taggeditem_tag_id_f4f5b767_fk_taggit_tag_id FOREIGN KEY (tag_id) REFERENCES public.taggit_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_groups users_user_groups_group_id_9afc8d0e_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_group_id_9afc8d0e_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_groups users_user_groups_user_id_5f6f5a90_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_user_id_5f6f5a90_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_user_permissions users_user_user_perm_permission_id_0b93982e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_perm_permission_id_0b93982e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_user_permissions users_user_user_permissions_user_id_20aca447_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_permissions_user_id_20aca447_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtail_feeds_rssfeedssettings wagtail_feeds_rssfee_site_id_86fa0b0d_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wagtail_feeds_rssfeedssettings
    ADD CONSTRAINT wagtail_feeds_rssfee_site_id_86fa0b0d_fk_wagtailco FOREIGN KEY (site_id) REFERENCES public.wagtailcore_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_collectionviewrestriction wagtailcore_collecti_collection_id_761908ec_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wagtailcore_collectionviewrestriction
    ADD CONSTRAINT wagtailcore_collecti_collection_id_761908ec_fk_wagtailco FOREIGN KEY (collection_id) REFERENCES public.wagtailcore_collection(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_collectionviewrestriction_groups wagtailcore_collecti_collectionviewrestri_47320efd_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wagtailcore_collectionviewrestriction_groups
    ADD CONSTRAINT wagtailcore_collecti_collectionviewrestri_47320efd_fk_wagtailco FOREIGN KEY (collectionviewrestriction_id) REFERENCES public.wagtailcore_collectionviewrestriction(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_collectionviewrestriction_groups wagtailcore_collecti_group_id_1823f2a3_fk_auth_grou; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wagtailcore_collectionviewrestriction_groups
    ADD CONSTRAINT wagtailcore_collecti_group_id_1823f2a3_fk_auth_grou FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_groupcollectionpermission wagtailcore_groupcol_collection_id_5423575a_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wagtailcore_groupcollectionpermission
    ADD CONSTRAINT wagtailcore_groupcol_collection_id_5423575a_fk_wagtailco FOREIGN KEY (collection_id) REFERENCES public.wagtailcore_collection(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_groupcollectionpermission wagtailcore_groupcol_group_id_05d61460_fk_auth_grou; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wagtailcore_groupcollectionpermission
    ADD CONSTRAINT wagtailcore_groupcol_group_id_05d61460_fk_auth_grou FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_groupcollectionpermission wagtailcore_groupcol_permission_id_1b626275_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wagtailcore_groupcollectionpermission
    ADD CONSTRAINT wagtailcore_groupcol_permission_id_1b626275_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_grouppagepermission wagtailcore_grouppag_group_id_fc07e671_fk_auth_grou; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wagtailcore_grouppagepermission
    ADD CONSTRAINT wagtailcore_grouppag_group_id_fc07e671_fk_auth_grou FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_grouppagepermission wagtailcore_grouppag_page_id_710b114a_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wagtailcore_grouppagepermission
    ADD CONSTRAINT wagtailcore_grouppag_page_id_710b114a_fk_wagtailco FOREIGN KEY (page_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_page wagtailcore_page_content_type_id_c28424df_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wagtailcore_page
    ADD CONSTRAINT wagtailcore_page_content_type_id_c28424df_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_page wagtailcore_page_live_revision_id_930bd822_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wagtailcore_page
    ADD CONSTRAINT wagtailcore_page_live_revision_id_930bd822_fk_wagtailco FOREIGN KEY (live_revision_id) REFERENCES public.wagtailcore_pagerevision(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_page wagtailcore_page_locked_by_id_bcb86245_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wagtailcore_page
    ADD CONSTRAINT wagtailcore_page_locked_by_id_bcb86245_fk_users_user_id FOREIGN KEY (locked_by_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_page wagtailcore_page_owner_id_fbf7c332_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wagtailcore_page
    ADD CONSTRAINT wagtailcore_page_owner_id_fbf7c332_fk_users_user_id FOREIGN KEY (owner_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_pagerevision wagtailcore_pagerevi_page_id_d421cc1d_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wagtailcore_pagerevision
    ADD CONSTRAINT wagtailcore_pagerevi_page_id_d421cc1d_fk_wagtailco FOREIGN KEY (page_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_pagerevision wagtailcore_pagerevision_user_id_2409d2f4_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wagtailcore_pagerevision
    ADD CONSTRAINT wagtailcore_pagerevision_user_id_2409d2f4_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_pageviewrestriction_groups wagtailcore_pageview_group_id_6460f223_fk_auth_grou; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wagtailcore_pageviewrestriction_groups
    ADD CONSTRAINT wagtailcore_pageview_group_id_6460f223_fk_auth_grou FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_pageviewrestriction wagtailcore_pageview_page_id_15a8bea6_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wagtailcore_pageviewrestriction
    ADD CONSTRAINT wagtailcore_pageview_page_id_15a8bea6_fk_wagtailco FOREIGN KEY (page_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_pageviewrestriction_groups wagtailcore_pageview_pageviewrestriction__f147a99a_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wagtailcore_pageviewrestriction_groups
    ADD CONSTRAINT wagtailcore_pageview_pageviewrestriction__f147a99a_fk_wagtailco FOREIGN KEY (pageviewrestriction_id) REFERENCES public.wagtailcore_pageviewrestriction(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_site wagtailcore_site_root_page_id_e02fb95c_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wagtailcore_site
    ADD CONSTRAINT wagtailcore_site_root_page_id_e02fb95c_fk_wagtailcore_page_id FOREIGN KEY (root_page_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtaildocs_document wagtaildocs_document_collection_id_23881625_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wagtaildocs_document
    ADD CONSTRAINT wagtaildocs_document_collection_id_23881625_fk_wagtailco FOREIGN KEY (collection_id) REFERENCES public.wagtailcore_collection(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtaildocs_document wagtaildocs_document_uploaded_by_user_id_17258b41_fk_users_use; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wagtaildocs_document
    ADD CONSTRAINT wagtaildocs_document_uploaded_by_user_id_17258b41_fk_users_use FOREIGN KEY (uploaded_by_user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailforms_formsubmission wagtailforms_formsub_page_id_e48e93e7_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wagtailforms_formsubmission
    ADD CONSTRAINT wagtailforms_formsub_page_id_e48e93e7_fk_wagtailco FOREIGN KEY (page_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailimages_image wagtailimages_image_collection_id_c2f8af7e_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wagtailimages_image
    ADD CONSTRAINT wagtailimages_image_collection_id_c2f8af7e_fk_wagtailco FOREIGN KEY (collection_id) REFERENCES public.wagtailcore_collection(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailimages_image wagtailimages_image_uploaded_by_user_id_5d73dc75_fk_users_use; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wagtailimages_image
    ADD CONSTRAINT wagtailimages_image_uploaded_by_user_id_5d73dc75_fk_users_use FOREIGN KEY (uploaded_by_user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailimages_rendition wagtailimages_rendit_image_id_3e1fd774_fk_wagtailim; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wagtailimages_rendition
    ADD CONSTRAINT wagtailimages_rendit_image_id_3e1fd774_fk_wagtailim FOREIGN KEY (image_id) REFERENCES public.wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailimages_uploadedimage wagtailimages_upload_uploaded_by_user_id_85921689_fk_users_use; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wagtailimages_uploadedimage
    ADD CONSTRAINT wagtailimages_upload_uploaded_by_user_id_85921689_fk_users_use FOREIGN KEY (uploaded_by_user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailredirects_redirect wagtailredirects_red_redirect_page_id_b5728a8f_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wagtailredirects_redirect
    ADD CONSTRAINT wagtailredirects_red_redirect_page_id_b5728a8f_fk_wagtailco FOREIGN KEY (redirect_page_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailredirects_redirect wagtailredirects_red_site_id_780a0e1e_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wagtailredirects_redirect
    ADD CONSTRAINT wagtailredirects_red_site_id_780a0e1e_fk_wagtailco FOREIGN KEY (site_id) REFERENCES public.wagtailcore_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailsearchpromotions_searchpromotion wagtailsearch_editor_query_id_c6eee4a0_fk_wagtailse; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wagtailsearchpromotions_searchpromotion
    ADD CONSTRAINT wagtailsearch_editor_query_id_c6eee4a0_fk_wagtailse FOREIGN KEY (query_id) REFERENCES public.wagtailsearch_query(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailsearch_querydailyhits wagtailsearch_queryd_query_id_2185994b_fk_wagtailse; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wagtailsearch_querydailyhits
    ADD CONSTRAINT wagtailsearch_queryd_query_id_2185994b_fk_wagtailse FOREIGN KEY (query_id) REFERENCES public.wagtailsearch_query(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailsearchpromotions_searchpromotion wagtailsearchpromoti_page_id_71920f17_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wagtailsearchpromotions_searchpromotion
    ADD CONSTRAINT wagtailsearchpromoti_page_id_71920f17_fk_wagtailco FOREIGN KEY (page_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailusers_userprofile wagtailusers_userprofile_user_id_59c92331_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wagtailusers_userprofile
    ADD CONSTRAINT wagtailusers_userprofile_user_id_59c92331_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

