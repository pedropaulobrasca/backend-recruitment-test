--
-- PostgreSQL database dump
--

-- Dumped from database version 17.2 (Debian 17.2-1.pgdg120+1)
-- Dumped by pg_dump version 17.2 (Debian 17.2-1.pgdg120+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: enterprises; Type: TABLE DATA; Schema: public; Owner: db_user
--

COPY public.enterprises (id, name, commercial_name, cnpj, description, inserted_at, updated_at) FROM stdin;
b2391f9e-518c-4e84-8ad2-9008d8351304	Lorem Ipsum	Lorem Ipsum	86178538000025	Lorem Ipsum	2025-01-21 00:40:05	2025-01-21 00:40:05
cfaadc4b-ba76-4bac-ac97-3918a41aa45f	Mauris Quisque	Mauris Quisque	85369718000192	Amet lobortis et vitae.	2025-01-22 13:59:30	2025-01-22 13:59:30
ed4503b4-3f52-4ee8-b504-fe59a3378391	Nunc Et	Nunc Et	11223344000155	Vestibulum magna orci.	2025-01-22 13:59:30	2025-01-22 13:59:30
e35897d7-916c-4d17-bbfa-f7c4bc13c340	Cursus Nullam	Cursus Nullam	76543211000177	Porttitor in feugiat pharetra.	2025-01-22 13:59:30	2025-01-22 13:59:30
11afa871-ef7b-4899-b924-fea4f71f0d2c	Cras Pellentesque	Cras Pellentesque	31246687000199	Sed ut turpis orci.	2025-01-22 13:59:30	2025-01-22 13:59:30
0bb20e47-a136-4ce0-9b8b-598ce6c17ec7	Sed Non	Sed Non	12938476000103	Aliquam auctor fringilla.	2025-01-22 13:59:30	2025-01-22 13:59:30
d611270b-5b3a-4d58-9573-66df1f99901d	Fusce Ligula	Fusce Ligula	98347210000185	Etiam interdum scelerisque.	2025-01-22 13:59:30	2025-01-22 13:59:30
d506fb9a-4efd-4a64-b4d6-5b6ea7534f96	Sit Amet	Sit Amet	45320987000164	Suspendisse neque a nulla.	2025-01-22 13:59:30	2025-01-22 13:59:30
8cc83a58-9e6a-4964-b2b0-f4ce282a59e0	Vitae Tempus	Vitae Tempus	57849125000123	Integer sodales tincidunt.	2025-01-22 13:59:30	2025-01-22 13:59:30
640c7b68-ad0f-4de3-a818-26ccc38054ec	Integer Massa	Integer Massa	65723844000165	Sed pretium molestie dui.	2025-01-22 13:59:30	2025-01-22 13:59:30
b6f437ec-7057-4deb-9ff6-17e07d423d3b	Nullam Aenean	Nullam Aenean	10987654000176	Ut porttitor erat sit.	2025-01-22 13:59:30	2025-01-22 13:59:30
da41b1f5-7740-47b1-8cb3-7d9e4a3b6a67	Vulputate Ullamcorper	Vulputate Ullamcorper	21436587000134	Fusce gravida eu lorem.	2025-01-22 13:59:30	2025-01-22 13:59:30
af489372-7e89-4dd9-8b90-7a9fa276822e	Phasellus Arcu	Phasellus Arcu	45678129000119	Etiam malesuada dui.	2025-01-22 13:59:30	2025-01-22 13:59:30
0c5bc82c-f5a0-434c-911a-9285a5c16f65	Quisque Fringilla	Quisque Fringilla	67483954000156	Amet varius vestibulum.	2025-01-22 13:59:30	2025-01-22 13:59:30
c80fc7ad-a059-48d4-ab2e-83f106bc4e07	Morbi Tristique	Morbi Tristique	39857321000170	Cursus vulputate sit amet.	2025-01-22 13:59:30	2025-01-22 13:59:30
ca8b0f5d-30ce-4d2f-9004-96868583c830	Etiam Efficitur	Etiam Efficitur	82465031000132	Proin bibendum lorem.	2025-01-22 13:59:30	2025-01-22 13:59:30
e10e11d7-cf5f-47a7-9cb5-1413bbd5ef9b	Mauris Non	Mauris Non	96723850000129	In euismod pharetra.	2025-01-22 13:59:30	2025-01-22 13:59:30
4f97f994-3bab-46d5-9aa6-35e0447fb04c	Amet Consectetur	Amet Consectetur	56389267000149	Integer accumsan augue.	2025-01-22 13:59:30	2025-01-22 13:59:30
fd0f6ac8-8628-4bdc-9c43-c563087f9f4d	Duis Augue	Duis Augue	10987634000188	Fusce suscipit orci.	2025-01-22 13:59:30	2025-01-22 13:59:30
6b01c60c-7cbc-4b48-9619-f74033bb1a22	Volutpat Consectetur	Volutpat Consectetur	42385691000153	Aenean commodo orci sit.	2025-01-22 13:59:30	2025-01-22 13:59:30
13964a9d-6a61-4ac1-ad84-673cf7d6d454	Leo Dolor	Leo Dolor	73246789000181	Phasellus ac justo nec.	2025-01-22 13:59:30	2025-01-22 13:59:30
fc6b7b9a-b81c-42e8-9deb-79b8c178c81d	Nulla Vestibulum	Nulla Vestibulum	98347215000167	Quisque lacinia malesuada.	2025-01-22 13:59:30	2025-01-22 13:59:30
66275584-b390-4e89-a273-ae73c76b8eef	Lobortis Nunc	Lobortis Nunc	64930587000154	Phasellus suscipit nec purus.	2025-01-22 13:59:30	2025-01-22 13:59:30
9312aa6c-7f54-48f6-b6b7-ed3612140aa8	Porttitor Aenean	Porttitor Aenean	28465090000160	Vestibulum laoreet urna.	2025-01-22 13:59:30	2025-01-22 13:59:30
edea17df-ca3e-4788-8b1a-8d7ef80a549e	Vivamus Lacinia	Vivamus Lacinia	52483967000114	Sed id nisl dapibus.	2025-01-22 13:59:30	2025-01-22 13:59:30
83123d99-da1b-407b-adee-38eb8e6190df	Vitae Consequat	Vitae Consequat	23567841000190	Mauris condimentum purus.	2025-01-22 13:59:30	2025-01-22 13:59:30
bb9139e3-453a-492e-8c64-f55fd5cba38e	Curabitur Feugiat	Curabitur Feugiat	48175269000125	Etiam tincidunt scelerisque.	2025-01-22 13:59:30	2025-01-22 13:59:30
fe88e89f-c92e-4bc2-aaa7-0e7c1e9d554c	Nunc Tempor	Nunc Tempor	15329541000198	Vivamus non turpis a orci.	2025-01-22 13:59:30	2025-01-22 13:59:30
50d6aaff-f1c8-4f02-bcab-06bc2ea48de3	Pellentesque Vulputate	Pellentesque Vulputate	98347365000172	Nunc facilisis libero.	2025-01-22 13:59:30	2025-01-22 13:59:30
959f8221-d66c-45d8-99e4-b40f88a6bbb2	Inceptos Vivamus	Inceptos Vivamus	74983496000103	Integer luctus ullamcorper.	2025-01-22 13:59:30	2025-01-22 13:59:30
2b8a821f-7564-4e4c-8d52-ef30611b5f35	Integer Proin	Integer Proin	95837462000167	Donec varius dolor.	2025-01-22 13:59:30	2025-01-22 13:59:30
2690a2fa-54bb-425e-987c-0c1a2358b81f	Orci Mollis	Orci Mollis	76283497000157	Aenean imperdiet bibendum.	2025-01-22 13:59:30	2025-01-22 13:59:30
11739152-4294-452a-80b6-43607e9cce28	Duis Mattis	Duis Mattis	15863729000181	Aliquam erat volutpat.	2025-01-22 13:59:30	2025-01-22 13:59:30
2afdb24b-2859-4394-917b-1dba309385eb	Praesent Nunc	Praesent Nunc	78372642000134	Etiam feugiat tristique.	2025-01-22 13:59:30	2025-01-22 13:59:30
fb959e34-28dc-4e8e-852c-d7a97c0cbfbb	Tincidunt Ligula	Tincidunt Ligula	65729854000176	Maecenas posuere tempor.	2025-01-22 13:59:30	2025-01-22 13:59:30
28cb4dc4-31d5-468d-9d6b-594d0c10e471	Vestibulum Turpis	Vestibulum Turpis	10987643000155	Lorem ipsum dolor sit.	2025-01-22 13:59:30	2025-01-22 13:59:30
e7df0280-bc05-4a37-98f4-ace2ef143854	Mauris Aliquam	Mauris Aliquam	64758321000187	Fusce tincidunt viverra.	2025-01-22 13:59:30	2025-01-22 13:59:30
ab9fb9f7-77ef-4d41-9ae0-bc01c746b787	Fusce Aliquam	Fusce Aliquam	35647829000143	Pellentesque sodales purus.	2025-01-22 13:59:30	2025-01-22 13:59:30
2f1ce691-7cf9-4828-aff3-3cadda100d31	Fusce Interdum	Fusce Interdum	93487561000160	Vivamus in dolor at.	2025-01-22 13:59:30	2025-01-22 13:59:30
28fad8e2-6a4e-4b88-802a-e5e424671a12	Curabitur Pellentesque	Curabitur Pellentesque	72360915000185	Sed euismod lectus vel.	2025-01-22 13:59:30	2025-01-22 13:59:30
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: db_user
--

COPY public.schema_migrations (version, inserted_at) FROM stdin;
20250120170405	2025-01-20 17:19:31
\.


--
-- PostgreSQL database dump complete
--

