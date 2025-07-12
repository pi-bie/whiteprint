@road-width-big-z12: 1.6;
@road-width-big-z14: 3.2;
@road-width-big-z15: 4.9;
@road-width-big-z16: 7.4;
@road-width-big-z17: 10;

@road-width-small-z14: 2;
@road-width-small-z15: 3.5;
@road-width-small-z16: 6;
@road-width-small-z17: 9;

@road-width-minor-z15: 2;
@road-width-minor-z16: 4;
@road-width-minor-z17: 6;

#roads,#bridges {
  ::casing {
    [zoom>=12] { [feature='highway_motorway'],[feature='highway_motorway_link'],
    [feature='highway_trunk'],[feature='highway_trunk_link'],
    [feature='highway_primary'],[feature='highway_primary_link'],
    [feature='highway_secondary'],[feature='highway_secondary_link'] {
        line-width: @road-width-big-z12 + 2*@road-line-width;
        [zoom=14] { line-width: @road-width-big-z14 + 2*@road-line-width; }
        [zoom=15] { line-width: @road-width-big-z15 + 2*@road-line-width; }
        [zoom=16] { line-width: @road-width-big-z16 + 2*@road-line-width; }
        [zoom>=17] { line-width: @road-width-big-z17 + 2*@road-line-width; }
        line-color: black;
        [bridge!='yes'][tunnel!='yes'][tunnel!='building_passage'] {
          line-color: black;
          line-join: round;
          line-cap: round;
        }
        [tunnel='yes'],[tunnel='building_passage'] {
          line-dasharray: 4, 8;
        }
      }
    }
    [zoom>=14] { [feature='highway_tertiary'],[feature='highway_tertiary_link'],
    [feature='highway_residential'],[feature='highway_minor'],
    [feature='highway_unclassified'],[feature='highway_road'],
    [feature='highway_living_street'],[feature='highway_construction'] {
        line-width: @road-width-small-z14 + 2*@road-line-width;
        [zoom=15] { line-width: @road-width-small-z15 + 2*@road-line-width; }
        [zoom=16] { line-width: @road-width-small-z16 + 2*@road-line-width; }
        [zoom>=17] { line-width: @road-width-small-z17 + 2*@road-line-width; }
        line-color: black;
        line-join: round;
        line-cap: square;
        [bridge='yes'] {
          line-cap: butt; 
        }
        [tunnel='yes'],[tunnel='building_passage'] {
          line-dasharray: 4, 8;
          line-join: bevel;
          line-cap: butt;
        }
      }
    }
    [zoom>=15] { [feature='highway_service'],[feature='highway_byway'] {
        line-width: @road-width-minor-z15 + 2*@road-line-width;
        [zoom=16] { line-width: @road-width-minor-z16 + 2*@road-line-width; }
        [zoom>=17] { line-width: @road-width-minor-z17 + 2*@road-line-width; }
        line-color: black;
        line-join: round;
        line-cap: square;
      }
    }
    [zoom>=14] { [feature='highway_track'],[feature='highway_unsurfaced'],
        [feature='highway_bridleway'],[feature='highway_cycleway'],
        [feature='highway_path'],[feature='highway_footway'],
        [feature='highway_steps'],[feature='highway_pedestrian'] {
        [bridge!='yes'] {
          casing/line-width: @road-width-minor-z16;
          casing/line-opacity: 0.6;
          casing/line-color: white;
          casing/line-cap: butt;
          [zoom>=16] { casing/line-width: @road-width-big-z16; }
          [zoom>=18] {
            casing/line-width: @road-width-big-z17;
            casing/line-opacity: 0.8;
          }
        }
      }
    }
  }
}

#bridges {
  ::casing {
    [zoom>=14] { [feature='highway_path'],[feature='highway_footway'],
        [feature='highway_steps'],[feature='highway_pedestrian'] {
        line-color: black;
        line-width: @road-width-big-z14;
        line-cap: butt;
        [zoom>=17] { line-width: @road-width-small-z16; }
        innerbridge/line-color: white;
        innerbridge/line-width: @road-width-big-z14 - 3*@road-line-width;
        innerbridge/line-cap: butt;
        [zoom>=17] { innerbridge/line-width: @road-width-small-z16 - 3*@road-line-width; }
      }
    }
    [zoom>=14] { [feature='highway_track'],[feature='highway_unsurfaced'],
        [feature='highway_bridleway'],[feature='highway_cycleway'] {
        line-color: black;
        line-width: @road-width-big-z15;
        line-cap: butt;
        innerbridge/line-color: white;
        innerbridge/line-width: @road-width-big-z15 - 3*@road-line-width;
        innerbridge/line-cap: butt;
        [zoom>=17] {
          line-width: @road-width-big-z17;
          innerbridge/line-width: @road-width-big-z17 - 3*@road-line-width;
        }
      }
    }
  }
}

#roads,#bridges {
  ::fill {
    [zoom>=12] { [feature='highway_motorway'],[feature='highway_motorway_link'],
      [feature='highway_trunk'],[feature='highway_trunk_link'],
      [feature='highway_primary'],[feature='highway_primary_link'],
      [feature='highway_secondary'],[feature='highway_secondary_link'] {
        line-width: @road-width-big-z12;
        [zoom=14] { line-width: @road-width-big-z14; }
        [zoom=15] { line-width: @road-width-big-z15; }
        [zoom=16] { line-width: @road-width-big-z16; }
        [zoom>=17] { line-width: @road-width-big-z17; }
        line-color: white;
        [bridge='yes'] {
          line-width: @road-width-big-z12 - 3*@road-line-width;
          [zoom=14] { line-width: @road-width-big-z14 - 3*@road-line-width; }
          [zoom=15] { line-width: @road-width-big-z15 - 3*@road-line-width; }
          [zoom=16] { line-width: @road-width-big-z16 - 3*@road-line-width; }
          [zoom>=17] { line-width: @road-width-big-z17 - 3*@road-line-width; }
        }
        line-join: round;
        line-cap: round;
        [tunnel='yes'],[tunnel='building_passage'] {
          line-dasharray: 4, 8;
          line-join: bevel;
        }
      }
    }
    [zoom=13] { [feature='highway_tertiary'],[feature='highway_tertiary_link'],
      [feature='highway_residential'],[feature='highway_minor'],
      [feature='highway_unclassified'],[feature='highway_road'],
      [feature='highway_living_street'],[feature='highway_construction'] {
        line-width: @road-line-width;
        line-color: black;
      }
    }
    [zoom>=14] { [feature='highway_tertiary'],[feature='highway_tertiary_link'],
      [feature='highway_residential'],[feature='highway_minor'],
      [feature='highway_unclassified'],[feature='highway_road'],
      [feature='highway_living_street'],[feature='highway_construction'] {
        line-width: @road-width-small-z14;
        [zoom=15] { line-width: @road-width-small-z15; }
        [zoom=16] { line-width: @road-width-small-z16; }
        [zoom>=17] { line-width: @road-width-small-z17; }
        line-color: white;
        [bridge='yes'] {
          line-width: @road-width-small-z14 - 3*@road-line-width;
          [zoom=15] { line-width: @road-width-small-z15 - 3*@road-line-width; }
          [zoom=16] { line-width: @road-width-small-z16 - 3*@road-line-width; }
          [zoom>=17] { line-width: @road-width-small-z17 - 3*@road-line-width; }
        }
        line-join: round;
        line-cap: square;
        [tunnel='yes'],[tunnel='building_passage'] {
          line-dasharray: 4, 8;
          line-join: bevel;
        }
      }
    }
    [zoom=14] { [feature='highway_service'],[feature='highway_byway'] {
        line-width: @road-line-width;
        line-color: black;
      }
    }
    [zoom>=15] { [feature='highway_service'],[feature='highway_byway'] {
        line-width: @road-width-minor-z15;
        [zoom=16] { line-width: @road-width-minor-z16; }
        [zoom>=17] { line-width: @road-width-minor-z17; }
        line-color: white;
        line-join: round;
        line-cap: square;
      }
    }
    [zoom>=14] { [feature='highway_track'],[feature='highway_unsurfaced'],
        [feature='highway_bridleway'],[feature='highway_cycleway'] {
        line-color: black;
        line-width: @road-line-width;
        //line-join: round; 
        line-cap: butt;
        line-dasharray: 7, 2;
        [tunnel='yes'] { line-dasharray: 7, 7; }
      }
    }
    [zoom>=14] { [feature='highway_path'],[feature='highway_footway'],
        [feature='highway_steps'],[feature='highway_pedestrian'] {
        line-color: black;
        line-width: @road-line-width;
        //line-join: round; 
        line-cap: butt;
        line-dasharray: 3, 2;
        [tunnel='yes'] { line-dasharray: 3, 5; }
      }
    }
  }
}

#roads[tunnel!='yes'][zoom>=16] { [sidewalk='right'],[sidewalk='both'],[sidewalk='left']
   {
    //line-color: black;
    //line-join: round; 
    //line-cap: round;
    [sidewalk='right'],[sidewalk='both'] {
      //right/line-color: red;
      right/line-width: @road-line-width;
      right/line-dasharray: 4,2;
      right/line-offset: 5;
      [zoom>=17] { right/line-offset: 7.5; }
      //[zoom>=19] { right/line-dasharray: 4,2; right/line-offset: 7.5; }
    }
    [sidewalk='left'],[sidewalk='both'] {
      //left/line-color: red;
      left/line-width: @road-line-width;
      left/line-dasharray: 4,2;
      left/line-offset: -5;
      [zoom>=17] { left/line-offset: -7.5; }
      //[zoom>=19] { left/line-dasharray: 4,2; left/line-offset: -7.5; }
    }
   }
}

#roads[tunnel!='yes'] {
  [feature='railway_rail'] {
    [zoom>=12] {
      casing/line-color: black;    
      casing/line-join: round;
      white/line-color: white;    
      white/line-join: round;
      black/line-color: black;    
      black/line-join: round;
      casing/line-width: 1.1;
      white/line-width: 0.8;
      black/line-width: 0.8;
      black/line-dasharray: 4,4;
    }
    [zoom=14] {
      casing/line-width: 1.9;
      white/line-width: 1.6;
      black/line-width: 1.6;
      black/line-dasharray: 8,8;
    }
    [zoom=15] {
      casing/line-width: 2.75;
      white/line-width: 2.45;
      black/line-width: 2.45;
      black/line-dasharray: 12.25,12.25;
    }
    [zoom>=16] {
      casing/line-width: 4;
      white/line-width: 3.7;
      black/line-width: 3.7;
      black/line-dasharray: 18.5,18.5;
    }
    [zoom>=18] {
      casing/line-width: 5.3;
      white/line-width: 5;
      black/line-width: 5;
      black/line-dasharray: 25,25;
    }
    [bridge='yes'] {
      [zoom>=16] { casing/line-width: 4 + 2; }
      [zoom>=18] { casing/line-width: 5.3 + 2; }
    }
    [service!=''] {
      [zoom>=12] { black/line-dasharray: 0.15, 4; }
      [zoom=14] { black/line-dasharray: 0.3, 8; }
      [zoom=15] { black/line-dasharray: 0.45, 12.25; }
      [zoom>=16] { black/line-dasharray: 0.7, 18.5; }
      [zoom>=18] { black/line-dasharray: 0.9375, 25; }
    }
  }
  [feature='railway_subway'] {
    [zoom>=13] {
      line-color: black;
      line-join: round;
      line-width: 0.25;
      dashes/line-color: black;
      dashes/line-join: round;
      dashes/line-width: 1.25;
      dashes/line-dasharray: 0.4,4;
    }
     [zoom=14] {
      line-width: 0.5;
      dashes/line-width: 2.1;
      dashes/line-dasharray: 0.8,8;
    }
     [zoom=15] {
      line-width: 0.875;
      dashes/line-width: 3.675;
      dashes/line-dasharray: 1.4,14;
    }
    [zoom>=16] {
      line-width: 1.5;
      dashes/line-width: 6.3;
      dashes/line-dasharray: 2.4,24;
    }
    [zoom>=18] {
      line-width: 2.25;
      dashes/line-width: 9.45;
      dashes/line-dasharray: 3.6,36;
    }
    [service!=''] {
      line-color: dimgray;
      dashes/line-color: dimgray;
    }
  }
  [feature='railway_narrow_gauge'],[feature='railway_funicular'] {
    [zoom>=12] {
      casing/line-color: black;    
      casing/line-join: round;
      white/line-color: white;    
      white/line-join: round;
      black/line-color: black;    
      black/line-join: round;
      casing/line-width: 0.6;
      white/line-width: 0.4;
      black/line-width: 0.4;
      black/line-dasharray: 2.5, 2.5;
    }
    [zoom>=14] {
      casing/line-width: 1.0;
      white/line-width: 0.8;
      black/line-width: 0.8;
      black/line-dasharray: 5, 5;
    }
    [zoom=15] {
      casing/line-width: 1.425;
      white/line-width: 1.225;
      black/line-width: 1.225;
      black/line-dasharray: 6.125, 6.125;
    }
    [zoom>=16] {
      casing/line-width: 2.05;
      white/line-width: 1.85;
      black/line-width: 1.85;
      black/line-dasharray: 9.25, 9.25;
    }
    [zoom>=18] {
      casing/line-width: 2.7;
      white/line-width: 2.5;
      black/line-width: 2.5;
      black/line-dasharray: 12.5,12.5;
    }
    [service!=''] {
      [zoom>=12] { black/line-dasharray: 0.1, 2.5; }
      [zoom=14] { black/line-dasharray: 0.2, 5; }
      [zoom=15] { black/line-dasharray: 0.3, 6.125; }
      [zoom>=16] { black/line-dasharray: 0.45, 9.25; }
      [zoom>=18] { black/line-dasharray: 0.625, 12.5; }
    }
  }
  [feature='railway_tram'],[feature='railway_light_rail'], {
    [zoom>=13] {
      line-color: black;
      line-join: round;
      line-width: 0.25;
      dashes/line-color: black;
      dashes/line-join: round;
      dashes/line-width: 0.4;
      dashes/line-offset: 0.25;
      dashes/line-dasharray: 0.4,4;
    }
     [zoom=14] {
      line-width: 0.5;
      dashes/line-width: 0.8;
      dashes/line-offset: 0.5;
      dashes/line-dasharray: 0.8,8;
    }
     [zoom=15] {
      line-width: 0.875;
      dashes/line-width: 1.4;
      dashes/line-offset: 0.875;
      dashes/line-dasharray: 1.4,14;
    }
    [zoom>=16] {
      line-width: 1.5;
      dashes/line-width: 2.4;
      dashes/line-offset: 1.5;
      dashes/line-dasharray: 2.4,24;
    }
    [zoom>=18] {
      line-width: 2.25;
      dashes/line-width: 3.6;
      dashes/line-offset: 2.25;
      dashes/line-dasharray: 3.6,36;
    }
    [service!=''] {
      line-color: dimgray;
      dashes/line-color: dimgray;
    }
  }
}

//Beschriftung und Beschilderung von Straßen und Fußwegen

#roads-ref::shield[zoom>=12] { [highway='motorway'], [highway='trunk'] {
  shield-file: url("symbols/shieldx[height].svg");
  shield-name: [refs];
  shield-wrap-character: ";";
  shield-fill: black;
  shield-face-name: @sans-condensed;
  shield-size: 10;
  shield-placement: line;
  shield-spacing: 760;
  shield-repeat-distance: 400;
  shield-clip: false;
  shield-placement-type: simple;
} }

#roads::text[zoom>=14] { [feature='highway_primary'], [feature='highway_secondary'], [feature='highway_tertiary'] {
  text-name: [ref];
  text-face-name: @sans-book;
  text-placement: line;
  text-repeat-distance: 300;
  text-spacing: 570;
  text-upright: right-only;
  [zoom<=16] { text-size: 6; }
} }

#roads::signs[zoom>=20][feature='highway_footway'] {
/*      ::casing {
      marker-height: 25;
      marker-width: 25;
      marker-line-color: white;
      marker-fill: blue; 
      marker-placement: line;
      marker-spacing: 570; }*/
  marker-file: url("symbols/gehweg.svg");
  [bicycle=1] { marker-file: url("symbols/radgehweg.svg"); }
  marker-placement: line;
  marker-direction: up;
  marker-height: 25;
  marker-spacing: 570;
}

#roads::signs[zoom>=20][feature='highway_cycleway'] {
/*      ::casing {
      marker-height: 25;
      marker-width: 25;
      marker-line-color: white;
      marker-placement: line;
      marker-fill: blue; 
      marker-spacing: 570; }*/
  marker-file: url("symbols/radweg.svg");
  [foot=1] { marker-file: url("symbols/radgehweg.svg"); }
  marker-placement: line;
  marker-direction: up;
  marker-height: 25;
  marker-spacing: 570;
}

#roads::signs[zoom>=20][feature='highway_path'] { [foot=1],[bicycle=1] {
/*        ::casing {
      marker-height: 25;
      marker-width: 25;
      marker-line-color: white;
      marker-placement: line;  
      marker-fill: blue; }*/
  [foot=1] { marker-file: url("symbols/gehweg.svg");}
  [bicycle=1] { marker-file: url("symbols/radweg.svg");}
  [foot=1][bicycle=1] { marker-file: url("symbols/radgehweg.svg"); }
  marker-placement: line;
  marker-direction: up;
  marker-height: 25;
  marker-spacing: 570;
} }
