#tunnels[zoom>=12] { [highway='motorway'],[highway='motorway_link'],
    [highway='trunk'],[highway='trunk_link'],
    [highway='primary'],[highway='primary_link'],
    [highway='secondary'],[highway='secondary_link'] {
    casing/line-color: black;
    casing/line-width: 5.5;
    casing/line-dasharray: 6, 6;
    line-color: white;
    line-width: 4.9;
    line-dasharray: 6, 6;
    }
  }

#tunnels[zoom>=13] { [highway='tertiary'],[highway='tertiary_link'],
    [highway='residential'],[highway='minor'],[highway='unclassified'],
    [highway='road'],[highway='living_street'],[highway='construction'] {
    casing/line-color: black;
    casing/line-width: 4.1;
    casing/line-dasharray: 3, 3;
    line-color: white;
    line-width: 3.5;
    line-dasharray: 3, 3;
    }
    [highway='service'],[highway='byway'] {
    casing/line-color: black;
    casing/line-width: 2.6;
    casing/line-dasharray: 3, 3;
    line-color: white;
    line-width: 2;
    line-dasharray: 3, 3;
    }
  [highway='track'],[highway='unsurfaced'],[highway='bridleway'],
    [highway='cycleway'],[highway='path'],[highway='footway'],
    [highway='steps'],[highway='pedestrian'] {
    line-color: black;
    line-width: 0.3;
    line-dasharray: 3, 2;
    }
  }

#bridges[zoom>=13] {
  [highway='motorway'],[highway='motorway_link'],
    [highway='trunk'],[highway='trunk_link'],
    [highway='primary'],[highway='primary_link'],
    [highway='secondary'],[highway='secondary_link'] {
    casing/line-color: black;
    casing/line-width: 7.6;
    casing/line-cap: butt;
    line-color: white;
    line-width: 7;
    line-cap: butt;
  }
  [highway='tertiary'],[highway='tertiary_link'],
    [highway='residential'],[highway='minor'],
    [highway='unclassified'],[highway='road'],
    [highway='living_street'],[highway='construction'],
    [highway='service'],[highway='byway'],[highway='track'],
    [highway='unsurfaced'],[highway='bridleway'],[highway='cycleway'] {
	casing/line-color: black;
    casing/line-width: 5.8;
    casing/line-cap: butt;
    line-color: white;
    line-width: 5.2;
    line-cap: butt;
    }
  [highway='path'],[highway='footway'],[highway='steps'],
    [highway='pedestrian']{
	casing/line-color: black;
    casing/line-width: 3.35;
    casing/line-cap: butt;
    line-color: white;
    line-width: 2.75;
    line-cap: butt;
  }
  [railway='rail'],[railway='narrow_gauge'],[railway='light_rail'],
    [railway='subway'],[railway='funicular'],[railway='tram'] {
    casing/line-color: black;
    casing/line-width: 5.6;
    casing/line-cap: butt;
    line-color: white;
    line-width: 5;
    line-cap: butt;
  }
}
