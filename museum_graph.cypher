// Art Museum collection as a Neo4j property graph.
// Builds 36 nodes and 45 relationships. Run against an empty database.
// Source: 7BDIN006W Big Data Theory & Practice, Part B (individual), University of Westminster, 2026.

// 1.1 CREATE GALLERY NODES
CREATE (g80001:Gallery {gallery_id:80001, gallery_name:'Main Hall',        location:'First Floor',   gallery_type:'Exhibit Hall',    registered_on:date('2018-05-12')})
CREATE (g80002:Gallery {gallery_id:80002, gallery_name:'Renaissance Room', location:'Second Floor',  gallery_type:'Gallery',         registered_on:date('2019-03-22')})
CREATE (g80003:Gallery {gallery_id:80003, gallery_name:'Modern Annex',     location:'West Wing',     gallery_type:'Special Exhibit', registered_on:date('2020-09-01')})
CREATE (g80004:Gallery {gallery_id:80004, gallery_name:'Vault B',          location:'Lower Level',   gallery_type:'Storage',         registered_on:date('2017-12-08')})
CREATE (g80005:Gallery {gallery_id:80005, gallery_name:'Sculpture Court',  location:'Main Entrance', gallery_type:'Exhibit Hall',    registered_on:date('2021-11-20')})
CREATE (g80006:Gallery {gallery_id:80006, gallery_name:'East Archive',     location:'East Wing',     gallery_type:'Archive'})
CREATE (g80007:Gallery {gallery_id:80007, gallery_name:'North Archive',    location:'North Wing',    gallery_type:'Archive'})
CREATE (g80008:Gallery {gallery_id:80008, gallery_name:'Special Rotunda',  location:'Third Floor',   gallery_type:'Rotunda',         registered_on:date('2022-04-18')})
CREATE (g80009:Gallery {gallery_id:80009, gallery_name:'Outdoor Patio',    location:'Gardens',       gallery_type:'Outdoor',         registered_on:date('2020-07-11')})
CREATE (g80010:Gallery {gallery_id:80010, gallery_name:'Print Study Room', location:'Second Floor',  gallery_type:'Study Room',      registered_on:date('2021-10-02')});

// 1.2 CREATE ARTWORK NODES
CREATE (a20001:Artwork {artwork_id:20001, title:'Blue Landscape',     artist:'A. Turner',       creation_date:date('1851-06-10'), art_type:'Painting',     status:'On Display'})
CREATE (a20002:Artwork {artwork_id:20002, title:'Stone Madonna',      artist:'Unknown',         creation_date:date('1498-01-01'), art_type:'Sculpture',    status:'On Display'})
CREATE (a20003:Artwork {artwork_id:20003, title:'Red Squares',        artist:'M. Malevich',     creation_date:date('1915-09-12'), art_type:'Painting',     status:'On Loan'})
CREATE (a20004:Artwork {artwork_id:20004, title:'Summer by the Lake', artist:'J. Constable',    creation_date:date('1823-07-08'), art_type:'Painting',     status:'On Display'})
CREATE (a20005:Artwork {artwork_id:20005, title:'Bronze Dancer',      artist:'E. Degas',        creation_date:date('1880-03-01'), art_type:'Sculpture',    status:'In Storage'})
CREATE (a20006:Artwork {artwork_id:20006, title:'Crystal Vase',       artist:'Lalique',         creation_date:date('1933-04-18'), art_type:'Glassware',    status:'On Display'})
CREATE (a20007:Artwork {artwork_id:20007, title:'Pop Neon',           artist:'R. Lichtenstein', creation_date:date('1966-11-23'), art_type:'Mixed Media',  status:'On Display'})
CREATE (a20008:Artwork {artwork_id:20008, title:'Untitled (2021)',    artist:'S. Adesina',      creation_date:date('2021-10-20'), art_type:'Installation', status:'On Display'});

// 1.3 CREATE CURATOR NODES
CREATE (c5001:Curator {curator_id:5001, curator_name:'Lara Mason',    shift:'Day'})
CREATE (c5002:Curator {curator_id:5002, curator_name:'Tom Nguyen',    shift:'Night'})
CREATE (c5003:Curator {curator_id:5003, curator_name:'Emilie Caron',  shift:'Day'})
CREATE (c5004:Curator {curator_id:5004, curator_name:'Yusuf Patel',   shift:'Night'})
CREATE (c5005:Curator {curator_id:5005, curator_name:'Giulia Rossi',  shift:'Day'})
CREATE (c5006:Curator {curator_id:5006, curator_name:'Adam White',    shift:'Night'})
CREATE (c5007:Curator {curator_id:5007, curator_name:'Noor Al-Farsi', shift:'Day'});

// 1.4 CREATE CONDITION REPORT NODES
CREATE (r40001:ConditionReport {report_id:40001, report_type:'Surface Check', report_value:'Clean',          report_time:datetime('2023-03-01T10:00:00')})
CREATE (r40002:ConditionReport {report_id:40002, report_type:'Structure',     report_value:'Stable',         report_time:datetime('2023-03-01T11:00:00')})
CREATE (r40003:ConditionReport {report_id:40003, report_type:'Color',         report_value:'Faded',          report_time:datetime('2023-03-01T12:00:00')})
CREATE (r40004:ConditionReport {report_id:40004, report_type:'Surface Check', report_value:'Needs Cleaning', report_time:datetime('2023-03-01T13:00:00')})
CREATE (r40005:ConditionReport {report_id:40005, report_type:'Integrity',     report_value:'Stable',         report_time:datetime('2023-03-01T14:00:00')})
CREATE (r40006:ConditionReport {report_id:40006, report_type:'Glass',         report_value:'Intact',         report_time:datetime('2023-03-01T15:00:00')})
CREATE (r40007:ConditionReport {report_id:40007, report_type:'Frame',         report_value:'Repaired',       report_time:datetime('2023-03-01T16:00:00')})
CREATE (r40008:ConditionReport {report_id:40008, report_type:'Installation',  report_value:'Complete',       report_time:datetime('2023-03-01T17:00:00')})
CREATE (r40009:ConditionReport {report_id:40009, report_type:'Frame',         report_value:'Loose',          report_time:datetime('2023-03-02T10:00:00')})
CREATE (r40010:ConditionReport {report_id:40010, report_type:'Color',         report_value:'Good',           report_time:datetime('2023-03-02T11:00:00')})
CREATE (r40011:ConditionReport {report_id:40011, report_type:'Installation',  report_value:'Partial',        report_time:datetime('2023-03-02T12:00:00')});

// 1.5 CREATE :LOCATED_IN RELATIONSHIPS (Artwork -> Gallery)
MATCH (a:Artwork {artwork_id:20001}),(g:Gallery {gallery_id:80001}) CREATE (a)-[:LOCATED_IN {placement_id:90001, placed_on:date('2018-05-12')}]->(g);
MATCH (a:Artwork {artwork_id:20002}),(g:Gallery {gallery_id:80002}) CREATE (a)-[:LOCATED_IN {placement_id:90002, placed_on:date('2019-03-22')}]->(g);
MATCH (a:Artwork {artwork_id:20003}),(g:Gallery {gallery_id:80003}) CREATE (a)-[:LOCATED_IN {placement_id:90003, placed_on:date('2020-09-01')}]->(g);
MATCH (a:Artwork {artwork_id:20004}),(g:Gallery {gallery_id:80001}) CREATE (a)-[:LOCATED_IN {placement_id:90004, placed_on:date('2018-05-12')}]->(g);
MATCH (a:Artwork {artwork_id:20005}),(g:Gallery {gallery_id:80004}) CREATE (a)-[:LOCATED_IN {placement_id:90005, placed_on:date('2017-12-08')}]->(g);
MATCH (a:Artwork {artwork_id:20006}),(g:Gallery {gallery_id:80008}) CREATE (a)-[:LOCATED_IN {placement_id:90006, placed_on:date('2022-04-18')}]->(g);
MATCH (a:Artwork {artwork_id:20007}),(g:Gallery {gallery_id:80005}) CREATE (a)-[:LOCATED_IN {placement_id:90007, placed_on:date('2021-11-20')}]->(g);
MATCH (a:Artwork {artwork_id:20008}),(g:Gallery {gallery_id:80008}) CREATE (a)-[:LOCATED_IN {placement_id:90008, placed_on:date('2022-04-18')}]->(g);

// 1.6 CREATE :TRANSFERRED_TO RELATIONSHIPS (Artwork -> Artwork)
MATCH (a:Artwork {artwork_id:20001}),(b:Artwork {artwork_id:20003}) CREATE (a)-[:TRANSFERRED_TO {transfer_id:30001, transfer_type:'Joint Loan',       transfer_date:date('2020-08-30')}]->(b);
MATCH (a:Artwork {artwork_id:20002}),(b:Artwork {artwork_id:20004}) CREATE (a)-[:TRANSFERRED_TO {transfer_id:30002, transfer_type:'Thematic Exhibit', transfer_date:date('2019-03-25')}]->(b);
MATCH (a:Artwork {artwork_id:20004}),(b:Artwork {artwork_id:20006}) CREATE (a)-[:TRANSFERRED_TO {transfer_id:30003, transfer_type:'Exhibit Swap',     transfer_date:date('2022-04-20')}]->(b);
MATCH (a:Artwork {artwork_id:20005}),(b:Artwork {artwork_id:20001}) CREATE (a)-[:TRANSFERRED_TO {transfer_id:30004, transfer_type:'Insurance Pair',   transfer_date:date('2018-01-05')}]->(b);
MATCH (a:Artwork {artwork_id:20007}),(b:Artwork {artwork_id:20006}) CREATE (a)-[:TRANSFERRED_TO {transfer_id:30005, transfer_type:'Transport Link',   transfer_date:date('2022-04-19')}]->(b);
MATCH (a:Artwork {artwork_id:20008}),(b:Artwork {artwork_id:20007}) CREATE (a)-[:TRANSFERRED_TO {transfer_id:30006, transfer_type:'Collaboration',    transfer_date:date('2022-04-25')}]->(b);
MATCH (a:Artwork {artwork_id:20003}),(b:Artwork {artwork_id:20007}) CREATE (a)-[:TRANSFERRED_TO {transfer_id:30007, transfer_type:'Modernism Show',   transfer_date:date('2020-09-10')}]->(b);
MATCH (a:Artwork {artwork_id:20006}),(b:Artwork {artwork_id:20001}) CREATE (a)-[:TRANSFERRED_TO {transfer_id:30008, transfer_type:'Fragile Group',    transfer_date:date('2022-05-10')}]->(b);

// 1.7 CREATE :HAS_REPORT RELATIONSHIPS (Artwork -> ConditionReport)
MATCH (a:Artwork {artwork_id:20001}),(r:ConditionReport {report_id:40001}) CREATE (a)-[:HAS_REPORT]->(r);
MATCH (a:Artwork {artwork_id:20002}),(r:ConditionReport {report_id:40002}) CREATE (a)-[:HAS_REPORT]->(r);
MATCH (a:Artwork {artwork_id:20003}),(r:ConditionReport {report_id:40003}) CREATE (a)-[:HAS_REPORT]->(r);
MATCH (a:Artwork {artwork_id:20004}),(r:ConditionReport {report_id:40004}) CREATE (a)-[:HAS_REPORT]->(r);
MATCH (a:Artwork {artwork_id:20005}),(r:ConditionReport {report_id:40005}) CREATE (a)-[:HAS_REPORT]->(r);
MATCH (a:Artwork {artwork_id:20006}),(r:ConditionReport {report_id:40006}) CREATE (a)-[:HAS_REPORT]->(r);
MATCH (a:Artwork {artwork_id:20007}),(r:ConditionReport {report_id:40007}) CREATE (a)-[:HAS_REPORT]->(r);
MATCH (a:Artwork {artwork_id:20008}),(r:ConditionReport {report_id:40008}) CREATE (a)-[:HAS_REPORT]->(r);
MATCH (a:Artwork {artwork_id:20007}),(r:ConditionReport {report_id:40009}) CREATE (a)-[:HAS_REPORT]->(r);
MATCH (a:Artwork {artwork_id:20003}),(r:ConditionReport {report_id:40010}) CREATE (a)-[:HAS_REPORT]->(r);
MATCH (a:Artwork {artwork_id:20008}),(r:ConditionReport {report_id:40011}) CREATE (a)-[:HAS_REPORT]->(r);

// 1.8 CREATE :MAINTAINED_BY RELATIONSHIPS (ConditionReport -> Curator)
MATCH (r:ConditionReport {report_id:40001}),(c:Curator {curator_id:5001}) CREATE (r)-[:MAINTAINED_BY {maintenance_id:60001, note:'Scheduled check',               note_time:datetime('2023-03-01T10:05:00')}]->(c);
MATCH (r:ConditionReport {report_id:40004}),(c:Curator {curator_id:5002}) CREATE (r)-[:MAINTAINED_BY {maintenance_id:60002, note:'Sent for cleaning',             note_time:datetime('2023-03-01T13:10:00')}]->(c);
MATCH (r:ConditionReport {report_id:40002}),(c:Curator {curator_id:5001}) CREATE (r)-[:MAINTAINED_BY {maintenance_id:60003, note:'No issues found',               note_time:datetime('2023-03-01T11:10:00')}]->(c);
MATCH (r:ConditionReport {report_id:40006}),(c:Curator {curator_id:5003}) CREATE (r)-[:MAINTAINED_BY {maintenance_id:60004, note:'Fragile label added',           note_time:datetime('2023-03-01T15:05:00')}]->(c);
MATCH (r:ConditionReport {report_id:40007}),(c:Curator {curator_id:5001}) CREATE (r)-[:MAINTAINED_BY {maintenance_id:60005, note:'Frame tightened, back on wall', note_time:datetime('2023-03-01T16:10:00')}]->(c);
MATCH (r:ConditionReport {report_id:40003}),(c:Curator {curator_id:5002}) CREATE (r)-[:MAINTAINED_BY {maintenance_id:60006, note:'Will monitor for fading',       note_time:datetime('2023-03-01T12:05:00')}]->(c);
MATCH (r:ConditionReport {report_id:40009}),(c:Curator {curator_id:5003}) CREATE (r)-[:MAINTAINED_BY {maintenance_id:60007, note:'Sent for re-framing',           note_time:datetime('2023-03-02T10:10:00')}]->(c);

// 1.9 CONNECTING DISCONNECTED NODES
MATCH (c:Curator {curator_id:5004}),(g:Gallery {gallery_id:80006}) CREATE (c)-[:OVERSEES]->(g);
MATCH (c:Curator {curator_id:5005}),(g:Gallery {gallery_id:80007}) CREATE (c)-[:OVERSEES]->(g);
MATCH (c:Curator {curator_id:5006}),(g:Gallery {gallery_id:80009}) CREATE (c)-[:OVERSEES]->(g);
MATCH (c:Curator {curator_id:5007}),(g:Gallery {gallery_id:80010}) CREATE (c)-[:OVERSEES]->(g);
MATCH (c:Curator {curator_id:5001}),(g:Gallery {gallery_id:80001}) CREATE (c)-[:OVERSEES]->(g);
MATCH (c:Curator {curator_id:5002}),(g:Gallery {gallery_id:80004}) CREATE (c)-[:OVERSEES]->(g);
MATCH (c:Curator {curator_id:5003}),(g:Gallery {gallery_id:80008}) CREATE (c)-[:OVERSEES]->(g);
MATCH (a:Gallery {gallery_id:80006}),(b:Gallery {gallery_id:80002}) CREATE (a)-[:BACKUP_STORAGE_FOR]->(b);
MATCH (a:Gallery {gallery_id:80007}),(b:Gallery {gallery_id:80003}) CREATE (a)-[:BACKUP_STORAGE_FOR]->(b);
MATCH (a:Gallery {gallery_id:80010}),(b:Gallery {gallery_id:80008}) CREATE (a)-[:BACKUP_STORAGE_FOR]->(b);
MATCH (a:Gallery {gallery_id:80009}),(b:Gallery {gallery_id:80005}) CREATE (a)-[:BACKUP_STORAGE_FOR]->(b);
