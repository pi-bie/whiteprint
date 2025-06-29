-- These are additional indexes for rendering performance with a DB prepared for openstreetmap-carto otherwise

CREATE INDEX planet_osm_polygon_worship_place
  ON planet_osm_polygon USING GIST (way)
  WHERE building IN ('cathedral','church','chapel','mosque','synagogue','temple')
  AND amenity = 'place_of_worship';
  
CREATE INDEX planet_osm_point_waymarks
  ON planet_osm_point USING GIST (way)
  WHERE tourism = 'information' 
  OR historic in ('boundary_stone','monument','memorial','milestone')
  OR man_made in ('watermill','windmill')
  OR "natural"='tree' AND tags->'denotation' IN ('landmark','natural_monument');
