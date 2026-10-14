-- ======================
-- ART MUSEUM COLLECTION MANAGEMENT SYSTEM: SQL SCRIPT
-- ======================

-- 1. GALLERIES
CREATE TABLE galleries (
    gallery_id     NUMBER PRIMARY KEY,
    gallery_name   VARCHAR2(100) NOT NULL,
    location       VARCHAR2(100),
    gallery_type   VARCHAR2(50),
    registered_on  DATE
);

-- 2. ARTWORKS
CREATE TABLE artworks (
    artwork_id     NUMBER PRIMARY KEY,
    title          VARCHAR2(100) NOT NULL,
    artist         VARCHAR2(100),
    creation_date  DATE,
    art_type       VARCHAR2(50),
    status         VARCHAR2(30)
);

-- 3. ARTWORK_LOCATIONS
CREATE TABLE artwork_locations (
    placement_id   NUMBER PRIMARY KEY,
    artwork_id     NUMBER NOT NULL,
    gallery_id     NUMBER NOT NULL,
    placed_on      DATE,
    CONSTRAINT fk_artwork
        FOREIGN KEY (artwork_id) REFERENCES artworks(artwork_id),
    CONSTRAINT fk_gallery
        FOREIGN KEY (gallery_id) REFERENCES galleries(gallery_id)
);

-- 4. ARTWORK_TRANSFERS
CREATE TABLE artwork_transfers (
    transfer_id      NUMBER PRIMARY KEY,
    artwork_id_1     NUMBER NOT NULL,
    artwork_id_2     NUMBER NOT NULL,
    transfer_type    VARCHAR2(40),
    transfer_date    DATE,
    CONSTRAINT fk_artwork1
        FOREIGN KEY (artwork_id_1) REFERENCES artworks(artwork_id),
    CONSTRAINT fk_artwork2
        FOREIGN KEY (artwork_id_2) REFERENCES artworks(artwork_id)
);

-- 5. CONDITION_REPORTS
CREATE TABLE condition_reports (
    report_id      NUMBER PRIMARY KEY,
    artwork_id     NUMBER NOT NULL,
    report_type    VARCHAR2(40),
    report_value   VARCHAR2(100),
    report_time    TIMESTAMP,
    CONSTRAINT fk_report_artwork
        FOREIGN KEY (artwork_id) REFERENCES artworks(artwork_id)
);

-- 6. MAINTENANCE_REPORTS
CREATE TABLE maintenance_reports (
    maintenance_id   NUMBER PRIMARY KEY,
    report_id        NUMBER NOT NULL,
    curator_id       NUMBER NOT NULL,
    note             VARCHAR2(250),
    note_time        TIMESTAMP,
    CONSTRAINT fk_maint_report
        FOREIGN KEY (report_id) REFERENCES condition_reports(report_id),
    CONSTRAINT fk_maint_curator
        FOREIGN KEY (curator_id) REFERENCES curators(curator_id)
);

-- 7. CURATORS
CREATE TABLE curators (
    curator_id     NUMBER PRIMARY KEY,
    curator_name   VARCHAR2(60) NOT NULL,
    shift          VARCHAR2(10)
);

-- ======================
-- SAMPLE DATA INSERTS
-- ======================

-- GALLERIES
INSERT INTO galleries VALUES (80001, 'Main Hall',         'First Floor',    'Exhibit Hall',    TO_DATE('2018-05-12', 'YYYY-MM-DD'));
INSERT INTO galleries VALUES (80002, 'Renaissance Room',  'Second Floor',   'Gallery',         TO_DATE('2019-03-22', 'YYYY-MM-DD'));
INSERT INTO galleries VALUES (80003, 'Modern Annex',      'West Wing',      'Special Exhibit', TO_DATE('2020-09-01', 'YYYY-MM-DD'));
INSERT INTO galleries VALUES (80004, 'Vault B',           'Lower Level',    'Storage',         TO_DATE('2017-12-08', 'YYYY-MM-DD'));
INSERT INTO galleries VALUES (80005, 'Sculpture Court',   'Main Entrance',  'Exhibit Hall',    TO_DATE('2021-11-20', 'YYYY-MM-DD'));
INSERT INTO galleries VALUES (80006, 'East Archive',      'East Wing',      'Archive',         NULL);
INSERT INTO galleries VALUES (80007, 'North Archive',     'North Wing',     'Archive',         NULL);
INSERT INTO galleries VALUES (80008, 'Special Rotunda',   'Third Floor',    'Rotunda',         TO_DATE('2022-04-18', 'YYYY-MM-DD'));
INSERT INTO galleries VALUES (80009, 'Outdoor Patio',     'Gardens',        'Outdoor',         TO_DATE('2020-07-11', 'YYYY-MM-DD'));
INSERT INTO galleries VALUES (80010, 'Print Study Room',  'Second Floor',   'Study Room',      TO_DATE('2021-10-02', 'YYYY-MM-DD'));

-- ARTWORKS
INSERT INTO artworks VALUES (20001, 'Blue Landscape',     'A. Turner',        TO_DATE('1851-06-10', 'YYYY-MM-DD'), 'Painting',     'On Display');
INSERT INTO artworks VALUES (20002, 'Stone Madonna',      'Unknown',          TO_DATE('1498-01-01', 'YYYY-MM-DD'), 'Sculpture',    'On Display');
INSERT INTO artworks VALUES (20003, 'Red Squares',        'M. Malevich',      TO_DATE('1915-09-12', 'YYYY-MM-DD'), 'Painting',     'On Loan');
INSERT INTO artworks VALUES (20004, 'Summer by the Lake', 'J. Constable',     TO_DATE('1823-07-08', 'YYYY-MM-DD'), 'Painting',     'On Display');
INSERT INTO artworks VALUES (20005, 'Bronze Dancer',      'E. Degas',         TO_DATE('1880-03-01', 'YYYY-MM-DD'), 'Sculpture',    'In Storage');
INSERT INTO artworks VALUES (20006, 'Crystal Vase',       'Lalique',          TO_DATE('1933-04-18', 'YYYY-MM-DD'), 'Glassware',    'On Display');
INSERT INTO artworks VALUES (20007, 'Pop Neon',           'R. Lichtenstein',  TO_DATE('1966-11-23', 'YYYY-MM-DD'), 'Mixed Media',  'On Display');
INSERT INTO artworks VALUES (20008, 'Untitled (2021)',    'S. Adesina',       TO_DATE('2021-10-20', 'YYYY-MM-DD'), 'Installation', 'On Display');

-- ARTWORK_LOCATIONS
INSERT INTO artwork_locations VALUES (90001, 20001, 80001, TO_DATE('2018-05-12', 'YYYY-MM-DD'));
INSERT INTO artwork_locations VALUES (90002, 20002, 80002, TO_DATE('2019-03-22', 'YYYY-MM-DD'));
INSERT INTO artwork_locations VALUES (90003, 20003, 80003, TO_DATE('2020-09-01', 'YYYY-MM-DD'));
INSERT INTO artwork_locations VALUES (90004, 20004, 80001, TO_DATE('2018-05-12', 'YYYY-MM-DD'));
INSERT INTO artwork_locations VALUES (90005, 20005, 80004, TO_DATE('2017-12-08', 'YYYY-MM-DD'));
INSERT INTO artwork_locations VALUES (90006, 20006, 80008, TO_DATE('2022-04-18', 'YYYY-MM-DD'));
INSERT INTO artwork_locations VALUES (90007, 20007, 80005, TO_DATE('2021-11-20', 'YYYY-MM-DD'));
INSERT INTO artwork_locations VALUES (90008, 20008, 80008, TO_DATE('2022-04-18', 'YYYY-MM-DD'));

-- ARTWORK_TRANSFERS
INSERT INTO artwork_transfers VALUES (30001, 20001, 20003, 'Joint Loan',        TO_DATE('2020-08-30', 'YYYY-MM-DD'));
INSERT INTO artwork_transfers VALUES (30002, 20002, 20004, 'Thematic Exhibit',  TO_DATE('2019-03-25', 'YYYY-MM-DD'));
INSERT INTO artwork_transfers VALUES (30003, 20004, 20006, 'Exhibit Swap',      TO_DATE('2022-04-20', 'YYYY-MM-DD'));
INSERT INTO artwork_transfers VALUES (30004, 20005, 20001, 'Insurance Pair',    TO_DATE('2018-01-05', 'YYYY-MM-DD'));
INSERT INTO artwork_transfers VALUES (30005, 20007, 20006, 'Transport Link',    TO_DATE('2022-04-19', 'YYYY-MM-DD'));
INSERT INTO artwork_transfers VALUES (30006, 20008, 20007, 'Collaboration',     TO_DATE('2022-04-25', 'YYYY-MM-DD'));
INSERT INTO artwork_transfers VALUES (30007, 20003, 20007, 'Modernism Show',    TO_DATE('2020-09-10', 'YYYY-MM-DD'));
INSERT INTO artwork_transfers VALUES (30008, 20006, 20001, 'Fragile Group',     TO_DATE('2022-05-10', 'YYYY-MM-DD'));

-- CONDITION_REPORTS
INSERT INTO condition_reports VALUES (40001, 20001, 'Surface Check', 'Clean',          TO_TIMESTAMP('2023-03-01 10:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO condition_reports VALUES (40002, 20002, 'Structure',     'Stable',         TO_TIMESTAMP('2023-03-01 11:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO condition_reports VALUES (40003, 20003, 'Color',         'Faded',          TO_TIMESTAMP('2023-03-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO condition_reports VALUES (40004, 20004, 'Surface Check', 'Needs Cleaning', TO_TIMESTAMP('2023-03-01 13:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO condition_reports VALUES (40005, 20005, 'Integrity',     'Stable',         TO_TIMESTAMP('2023-03-01 14:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO condition_reports VALUES (40006, 20006, 'Glass',         'Intact',         TO_TIMESTAMP('2023-03-01 15:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO condition_reports VALUES (40007, 20007, 'Frame',         'Repaired',       TO_TIMESTAMP('2023-03-01 16:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO condition_reports VALUES (40008, 20008, 'Installation',  'Complete',       TO_TIMESTAMP('2023-03-01 17:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO condition_reports VALUES (40009, 20007, 'Frame',         'Loose',          TO_TIMESTAMP('2023-03-02 10:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO condition_reports VALUES (40010, 20003, 'Color',         'Good',           TO_TIMESTAMP('2023-03-02 11:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO condition_reports VALUES (40011, 20008, 'Installation',  'Partial',        TO_TIMESTAMP('2023-03-02 12:00:00', 'YYYY-MM-DD HH24:MI:SS'));

-- CURATORS
INSERT INTO curators VALUES (5001, 'Lara Mason',    'Day');
INSERT INTO curators VALUES (5002, 'Tom Nguyen',    'Night');
INSERT INTO curators VALUES (5003, 'Emilie Caron',  'Day');
INSERT INTO curators VALUES (5004, 'Yusuf Patel',   'Night');
INSERT INTO curators VALUES (5005, 'Giulia Rossi',  'Day');
INSERT INTO curators VALUES (5006, 'Adam White',    'Night');
INSERT INTO curators VALUES (5007, 'Noor Al-Farsi', 'Day');

-- MAINTENANCE_REPORTS
INSERT INTO maintenance_reports VALUES (60001, 40001, 5001, 'Scheduled check',                TO_TIMESTAMP('2023-03-01 10:05:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO maintenance_reports VALUES (60002, 40004, 5002, 'Sent for cleaning',              TO_TIMESTAMP('2023-03-01 13:10:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO maintenance_reports VALUES (60003, 40002, 5001, 'No issues found',                TO_TIMESTAMP('2023-03-01 11:10:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO maintenance_reports VALUES (60004, 40006, 5003, 'Fragile label added',            TO_TIMESTAMP('2023-03-01 15:05:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO maintenance_reports VALUES (60005, 40007, 5001, 'Frame tightened, back on wall',  TO_TIMESTAMP('2023-03-01 16:10:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO maintenance_reports VALUES (60006, 40003, 5002, 'Will monitor for fading',        TO_TIMESTAMP('2023-03-01 12:05:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO maintenance_reports VALUES (60007, 40009, 5003, 'Sent for re-framing',            TO_TIMESTAMP('2023-03-02 10:10:00', 'YYYY-MM-DD HH24:MI:SS'));


