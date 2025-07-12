@residential: #b3b3b3;
@commercial: #e6e6e6;
@public: #808080;
@water: white; //@CornflowerBlue;
@water-contour: dimgray; //@CornflowerBlue; // dimgray;
@farmland: white; //@Wheat;
@forest: white; //@ForestGreen;
@meadow: white; //@PaleGreen;
@quarry: white; //silver; 
@sand: white; //@Tan;
@hedge: #B7B7B7;

@Tan: #D2B48C;
@CornflowerBlue: #6495ED;
@Linen: #FAF0E6;
@Wheat: #F5DEB3;
@ForestGreen: #228B22;
@PaleGreen: #98FB98;
@SkyBlue: #87CEEB;

@serif-font: 'Liberation Serif Regular';
@serif-regular: 'FreeSerif Regular';
@serif-italic: 'FreeSerif Italic';
@sans-book: 'DejaVu Sans Book';
@sans-condensed: 'DejaVu Sans Condensed';

@barrier-line-width: 0.5;
@casing-line-width: 0.3;
@road-line-width: 0.3;
@building-line-width: 0.4;
@landuse-line-width: 0.1;

@marker-tall-height: 24;
@marker-tall-height-z20: 30;
@marker-low-height: 10;
@marker-low-height-z20: 12.5;
@marker-board-height: 16;
@marker-board-height-z20: 20;
@marker-tree-height: 12;
@marker-tree-height-z18: 24;


Map {
  background-color: #b8dee6;
  background-color: white;
}

#countries {
  ::outline {
    line-color: #85c5d3;
    line-width: 2;
    line-join: round;
  }
  polygon-fill: white;
}

#islands[zoom>=12] {
  line-color: black;
  line-width: 0.3;
  line-join: round;
  line-cap: round;
  polygon-gamma: 0.6;
  polygon-fill: white;
}

// buildings  
  
#buildings[zoom>=15]::contour {
  polygon-fill: white;
  polygon-gamma: 0.6;
  [usetype='residential'] {polygon-fill: @residential; }
  [usetype='commercial'] {polygon-fill: @commercial; }
  [usetype='public'] { polygon-fill: @public; }
  line-color: black;
  line-width: @building-line-width;
  line-join: round;
  line-cap: round;
  [zoom>=17] {
    text-name: [addr:housenumber];
    text-face-name: @serif-regular;
    text-placement: interior;
    [zoom<18] {text-size: 7; }
    [usetype='public'] { text-fill: white; }
  }
}
  
// barriers like hedges, cliffs and tree_rows

#polygon_barriers, #line_barriers {
  [zoom>=14] {
    [zoom>=17][feature='weir'] {
      line-color: black;
      line-width: 1.5;
      ::dashes {
        line-color: black;
        line-width: 2.1;
        line-offset: 1.5;
        line-dasharray: 1.5, 3;
      }
    }
    [feature='fence'], [feature='wall'] {
      line-color: black;
      line-width: 0.3;
      [zoom>=18] { line-width: 0.42; }
      [feature='wall'] {
        line-width: 0.4;
        [zoom>=18] { line-width: 0.56; }
      }
      line-cap: square;
      [feature='wall']::both {
        line-color: black;
        line-width: 2;
        line-cap: butt;
        line-dasharray: 0.8, 10;
        [zoom>=18] {
          line-width: 2.8;
          line-dasharray: 1.12, 20; 
        }
      }
      [feature='fence']::left {
        line-color: black;
        line-width: 0.6;
        line-offset: 0.3;
        line-dasharray: 0.6, 12;
        [zoom>=18] {
          line-width: 0.84;
          line-offset: 0.42;
          line-dasharray: 0.84, 20; 
        }
      }
      [feature='fence']::right {
        line-color: black;
        line-width: 0.6;
        line-offset: -0.3;
        line-dasharray: 0.6, 12;
        line-dash-offset: 6.3;
        [zoom>=17] {
          line-width: 0.84;
          line-offset: -0.42;
          line-dasharray: 0.84, 20;
          line-dash-offset: 10.42;
        }
      }
    }
  }
}

#line_barriers {
  [zoom>=14] { 
    [feature='hedge'] {
      line-color: black;
      line-width: 0.5;
      line-dasharray: 4,2;
      [zoom>=20] { line-pattern-file: url("symbols/busch-line2.png"); }
    }
    [feature='tree_row'] {
      line-color: black;
      line-width: 2;
      line-dasharray: 2,10;
      [zoom>=19] {
        line-dasharray: 2,20;
        line-pattern-file: url("symbols/laub-line.png");
        [zoom=19] { line-pattern-transform: scale(0.5); }
      }
      [zoom>=20][leaves='needleleaved'] { line-pattern-file: url("symbols/nadel-line.png");}
    }
  }  
}

#polygon_barriers {
  [zoom>=14] { [feature='hedge'] {
      line-color: @hedge;
      line-width: @barrier-line-width;
      polygon-fill: white;
      [zoom>=20] { polygon-pattern-file: url("symbols/busch2.png"); }
    }
  }
}

// water bodies

#water_areas[zoom>=12][natural!='land'] { [natural='lake'],
    [natural='water'],[natural='pond'],[waterway='dock'],
    [landuse='reservoir'],[landuse='water'],[landuse='basin'],
    [waterway='mill_pond'],[waterway='riverbank'],[waterway='river'] {
    polygon-fill: @water;
    polygon-gamma: 0.6;
    polygon-pattern-file: url("patterns/gewaesser2.png");
    polygon-pattern-alignment: global;
    [zoom<17] { polygon-pattern-transform: scale(0.5); }
    casing/line-width: @building-line-width;
    casing/line-color: @water-contour;
    casing/line-join: round;
    casing/line-cap: round;
  }
}

#water_lines[zoom>=12][tunnel!='yes'] {
  casing/line-width: 2.0;
  casing/line-color: @water-contour;
  casing/line-join: round;
  casing/line-cap: butt;
  line-width: 1.3;
  line-color: @water;
  line-join: round;
  line-cap: round;
  [zoom>=18] {
    casing/line-width: 4.0;
    line-width: 3.3;
  }
}

#fords[zoom>=17] {
  [feature='ford'],[feature='stepping_stones'] {
    marker-width: 16;
    marker-file: url('symbols/furt.svg');
    marker-allow-overlap: true;
    marker-ignore-placement: true;
    text-name: "'Ft.'";
    text-dy: -2;
    text-face-name: @serif-regular;
    text-size: 12;
    [zoom>=20] { text-size: 14; }
  }
  [feature='weir'] {
    marker-width: 20;
    [zoom<=17] { marker-width: 10; }
    marker-file: url('symbols/wehr.svg');
    marker-allow-overlap: true;
    marker-ignore-placement: true;
  }
}

// landuse and leisure

.landcover { [zoom>=12] {
  #landuse[zoom>=12] {
    polygon-fill: white;
    polygon-comp-op: darken; 
  }
  [feature='quarry'] {
    polygon-fill: @quarry;
    polygon-gamma: 0.6;
    line-width: @landuse-line-width;
    polygon-pattern-file: url('patterns/quarry.svg');
    polygon-pattern-alignment: global;
  }
  [feature='cemetery'],[feature='grave_yard'] {
      polygon-fill: @forest;
      polygon-gamma: 0.6;
      polygon-pattern-file: url('patterns/friedhof_c.png');
      polygon-pattern-alignment: global;
      [zoom<16] { polygon-pattern-transform: scale(0.701); }
      line-width: @landuse-line-width;
  }
  [feature='wood'],[feature='forest'] {
    polygon-fill: @forest;
    polygon-gamma: 0.6;
    polygon-pattern-file: url('patterns/leaftype_mixed.png');
    [leaves='broadleaved'] { polygon-pattern-file: url('patterns/leaftype_broadleaved.svg'); }
    [leaves='needleleaved'] { polygon-pattern-file: url('patterns/leaftype_needleleaved.svg'); }
    polygon-pattern-alignment: global;
    [zoom<17] { polygon-pattern-transform: scale(0.5); }
    line-width: @landuse-line-width;
  }
  [feature='scrub'] {
    polygon-fill: @meadow;
    polygon-gamma: 0.6;
    polygon-pattern-file: url('patterns/buschland.png');
    polygon-pattern-alignment: global;
    [zoom<17] { polygon-pattern-transform: scale(0.5); }
    line-width: @landuse-line-width;
    }
  [feature='grass'],[feature='grassland'],[feature='meadow'],
    [feature='park'],[feature='meadow'],
    [feature='recreation_ground'],[feature='village_green'],
    [feature='green'] { 
    polygon-fill: @meadow;
    polygon-gamma: 0.6;
    [zoom >=14] {
      polygon-pattern-file: url('patterns/grasland.png');
      polygon-pattern-alignment: global;
      [zoom<17] { polygon-pattern-transform: scale(0.5); }
    }
    line-width: @landuse-line-width;
    //[feature='park'] { polygon-pattern-opacity: 0.8; }
  }
  [feature='animal_keeping'] {
    polygon-fill: @farmland;
    polygon-gamma: 0.6;
    line-width: @landuse-line-width;
  }
  [feature='farmyard'] {
      polygon-fill: white;
      polygon-gamma: 0.6;
      polygon-comp-op: src-over;
      line-width: @landuse-line-width;
  }
  [feature='field'],[feature='crop'],[feature='farmland'] {
    polygon-fill: @farmland;
    polygon-gamma: 0.6;
    [zoom >= 14] {
      polygon-pattern-file: url('patterns/ackerland.png');
      polygon-pattern-alignment: local;
      [zoom<17] { polygon-pattern-transform: scale(0.5); }
    }
    line-width: @landuse-line-width;
  }
  [feature='allotments'] {
    polygon-fill: @farmland;
    polygon-gamma: 0.6;
    polygon-pattern-file: url('patterns/gartenland.png');
    polygon-pattern-alignment: local;
    [zoom<17] { polygon-pattern-transform: scale(0.5); }
    line-width: @landuse-line-width;
  }
  [feature='heath'] {
    polygon-fill: @meadow;
    polygon-gamma: 0.6;
    line-width: @landuse-line-width;
    polygon-pattern-file: url('patterns/heideland.png');
    polygon-pattern-alignment: global;
    [zoom<17] { polygon-pattern-transform: scale(0.5); }
  }
  [feature='meadow_orchard'] {
    polygon-fill: @farmland;
    polygon-gamma: 0.6;
    line-width: @landuse-line-width;
    polygon-pattern-file: url('patterns/streuobstwiese2.png');
    polygon-pattern-alignment: global;
    [zoom<17] { polygon-pattern-transform: scale(0.5); }
  }
  [feature='orchard'] {
    polygon-fill: @farmland;
    polygon-gamma: 0.6;
    line-width: @landuse-line-width;
    polygon-pattern-file: url('patterns/obstplantage.png');
    polygon-pattern-alignment: global;
    [zoom<17] { polygon-pattern-transform: scale(0.5); }
  }
  [feature='vineyard'] {
    polygon-fill: @farmland;
    polygon-gamma: 0.6;
    polygon-opacity: 1;
    polygon-comp-op: dst-over;
    line-width: @landuse-line-width;
    polygon-pattern-file: url('patterns/weinbau.png');
    polygon-pattern-alignment: global;
  }
  [feature='flowerbed'],[feature='garden'] {
    line-width: @landuse-line-width;
    polygon-fill: @meadow;
    polygon-gamma: 0.6;
    polygon-pattern-file: url('patterns/zierflaeche_b.png');
    polygon-pattern-alignment: global;
    [zoom<17] { polygon-pattern-transform: scale(0.5); }
  }
  [feature='mud'],[feature='beach'],[feature='sand'] {
    line-width: @landuse-line-width;
    polygon-fill: @sand;
    polygon-gamma: 0.6;
    polygon-pattern-file: url('patterns/sandboden_neu.png');
    polygon-pattern-alignment: global;
    polygon-pattern-opacity: 1;
    [zoom<17] { polygon-pattern-transform: scale(0.5); }
  }
  //polygon-gamma: 0.6;
  //#landuse { polygon-opacity: 0.6; }
} }

.landcover[zoom>=12] {
  [feature='camp_site'],[feature='caravan_site'],[feature='picnic_site'] {
    polygon-fill: @meadow;
    polygon-gamma: 0.6;
    polygon-opacity: 0.9;
  }
  [feature='parking'],[feature='playground'],[feature='farmyard'],
    [feature='pedestrian'],[feature='footway'],
    [feature='services'],[feature='platform'] {
    polygon-fill: white;
    polygon-gamma: 0.6;
    polygon-opacity: 1;
    polygon-comp-op: dst-over;
    line-color: black;
    line-width: @casing-line-width;
  }
  [feature='track'] {
    polygon-fill: white;
    polygon-gamma: 0.6;
    line-width: @casing-line-width;
    line-join: round;
    line-cap: round;
    line-dasharray: 4, 2;
  }
}

#aeroways {
  [aeroway='runway'] {
    ::casing {
        line-width: 1.5*2.2;
        line-color: black;
        line-join: round;
        [zoom >= 13] { line-width: 2*2.2; }
        [zoom >= 14] { line-width: 2*3.8; }
        [zoom >= 15] { line-width: 2*5.5; }
        [zoom >= 16] { line-width: 24; }
    }
    line-color: white;
    line-width: 1.5*2.2 - 2*@casing-line-width;
    [zoom >= 14] { line-width: 2*2.2 - 2*@barrier-line-width; }
    [zoom >= 14] { line-width: 2*3.8 - 2*@barrier-line-width; }
    [zoom >= 15] { line-width: 2*5.5 - 2*@barrier-line-width; }
    [zoom >= 16] { line-width: 24 - 2*@barrier-line-width; }
  }
  [aeroway='taxiway'][zoom>=14] {
    ::casing {
        line-width: 1.5*2.6;
        line-color: black;
        line-join: round;
        [zoom >= 15] { line-width: 6; }
        [zoom >= 16] { line-width: 8; }
    }
    line-color: white;
    line-width: 1.5*2.6 - 2*@casing-line-width;
    [zoom >= 15] { line-width: 6 - 2*@casing-line-width; }
    [zoom >= 16] { line-width: 8 - 2*@casing-line-width; }
  }
}

#grounds[zoom>=12] {
  polygon-fill: white;
  polygon-gamma: 0.6;
  line-color: black;
  line-width: @casing-line-width;
  [feature='apron'],[feature='runway'],[feature='taxiway'] {
    line-width: @barrier-line-width;
  }
  line-join: round;
  line-cap: round;
}

#water_areas[zoom>=12][natural =~ "wetland.*"] {
  polygon-fill:@water;
  polygon-gamma: 0.6;
  polygon-opacity: 0.33;
  ::casing {
    line-color: black;
    line-width: @landuse-line-width;
    line-dasharray: 2, 2;
  }
  polygon-pattern-file: url("patterns/sumpfland.png");
  [natural='wetland_marsh'], [natural='wetland_saltmarsh'],
    [natural='wetland_bog'], [natural='wetland_fen'] {
    polygon-pattern-file: url("patterns/moorland.png");
  }
  [natural='wetland_reedbed'] {
    polygon-pattern-file: url("patterns/schilfland.png");
  }
  polygon-pattern-alignment: global;
}

#farms[landuse='farmyard'][zoom>=16] {
    text-name: [name];
    text-face-name: @serif-italic;
    text-placement: interior;
    text-halo-radius: 1;
    text-size: 12;
    [zoom<18] {text-size: 10; }
}
