// The six analysis queries (plus a whole-graph view). Run after museum_graph.cypher.

// QUERY 1: MOST ACTIVELY MONITORED ARTWORKS
MATCH (a:Artwork)
OPTIONAL MATCH (a)-[:HAS_REPORT]->(r:ConditionReport)
WITH a, count(DISTINCT r) AS reportCount
OPTIONAL MATCH (a)-[t:TRANSFERRED_TO]-(:Artwork)
WITH a, reportCount, count(DISTINCT t) AS transferCount
RETURN a.title AS artwork,
       reportCount,
       transferCount,
       (reportCount + transferCount) AS totalActivity
ORDER BY totalActivity DESC, artwork
LIMIT 10;

// QUERY 2: TOP "INFLUENCER" ARTWORKS BY TRANSFER REACH
MATCH (a:Artwork)
OPTIONAL MATCH (a)-[:TRANSFERRED_TO*1..2]-(other:Artwork)
WHERE other <> a
WITH a, count(DISTINCT other) AS reachableArtworks
RETURN a.title AS artwork,
       a.art_type AS type,
       reachableArtworks
ORDER BY reachableArtworks DESC, artwork
LIMIT 5;

// QUERY 3: GALLERIES GENERATING THE MOST MONITORING ACTIVITY
MATCH (g:Gallery)<-[:LOCATED_IN]-(a:Artwork)-[:HAS_REPORT]->(r:ConditionReport)
RETURN g.gallery_name AS gallery,
       count(DISTINCT a) AS artworks,
       count(r) AS totalReports
ORDER BY totalReports DESC, gallery;

// QUERY 4: STRONGLY LINKED ARTWORK PAIRS
MATCH (a1:Artwork)-[:TRANSFERRED_TO]-(a2:Artwork)
WHERE a1.artwork_id < a2.artwork_id
MATCH (a1)-[:HAS_REPORT]->(:ConditionReport)-[:MAINTAINED_BY]->(c:Curator)<-[:MAINTAINED_BY]-(:ConditionReport)<-[:HAS_REPORT]-(a2)
WITH a1, a2, collect(DISTINCT c.curator_name) AS sharedCurators
RETURN a1.title AS artworkA,
       a2.title AS artworkB,
       sharedCurators,
       size(sharedCurators) AS strength
ORDER BY strength DESC, artworkA;

// QUERY 5: CONDITION ENGAGEMENT BY ART TYPE
MATCH (a:Artwork)-[:HAS_REPORT]->(r:ConditionReport)
OPTIONAL MATCH (r)-[:MAINTAINED_BY]->(c:Curator)
WITH a.art_type AS artType,
     count(DISTINCT r) AS reports,
     count(DISTINCT c) AS curatorsInvolved
RETURN artType,
       reports,
       curatorsInvolved
ORDER BY reports DESC, artType;

// QUERY 6 : TRANSFER CHAINS
MATCH path = (start:Artwork)-[:TRANSFERRED_TO*3..5]->(end:Artwork)
WHERE start <> end
WITH path,
     [n IN nodes(path) | n.title] AS chain,
     length(path) AS hops
RETURN chain, hops
ORDER BY hops DESC
LIMIT 10;

// VISUALISE THE WHOLE GRAPH
MATCH (n)-[r]->(m) RETURN n, r, m;
