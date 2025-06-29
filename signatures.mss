#worshipplaces[zoom<17] {
  [building='cathedral'] {
    marker-height: 0.5*@marker-tall-height;
    [zoom>=14] { marker-height: @marker-tall-height; }
    marker-file: url('symbols/kirche.svg');
    marker-ignore-placement: true;
    marker-allow-overlap: true;
  }
  [building='church'] {
    marker-height: 0.5*@marker-tall-height;
    [zoom>=14] { marker-height: @marker-tall-height; }
    marker-file: url('symbols/kapelle.svg');
    marker-ignore-placement: true;
    marker-allow-overlap: true;
  }
  [building='chapel'] {
    marker-height: 0.5*@marker-board-height;
    [zoom>=14] { marker-height: @marker-board-height; }
    marker-file: url('symbols/kapelle_klein.svg');
    marker-ignore-placement: true;
    marker-allow-overlap: true;
  }
  [building='mosque'] {
    marker-height: 0.5*@marker-tall-height;
    [zoom>=14] { marker-height: @marker-tall-height; }
    marker-file: url('symbols/moschee.svg');
    marker-ignore-placement: true;
    marker-allow-overlap: true;
  }
  [building='synagogue'] {
   marker-height: 0.5*@marker-tall-height;
    [zoom>=14] { marker-height: @marker-tall-height; }
    marker-file: url('symbols/synagoge.svg');
    marker-ignore-placement: true;
    marker-allow-overlap: true;
  }
  //marker-fill-opacity: 0;
}

#worshipplaces[zoom>=17] {
  marker-ignore-placement: true;
  marker-allow-overlap: true;
  marker-fill: white;
  marker-line-color: white;
  [building='chapel'], [building='church'], [building='cathedral'] {
    marker-file: url('symbols/cross.svg');
    //marker-transform: "scale([factor]*min([mheight]/400,[mwidth]/280)) rotate([mdir]+180)";
    marker-transform: "rotate([mdir])";
    marker-height: 0.8*[factor]*[mheight];
  }
  [building='synagogue'] {
    marker-file: url('symbols/star-of-david.svg');
    marker-transform: 'rotate([mdir])';
    marker-height: 0.67*[factor]*[mheight];
  }
  [building='mosque'] {
    marker-file: url('symbols/hilal.svg');
    //marker-transform: "rotate([mdir])";
    marker-height: 0.8*[factor]*[mheight];
  }
}

#gates[zoom>=17] {
  marker-width: 10;
  marker-file: url('symbols/gate.svg');
  marker-ignore-placement: true;
  marker-allow-overlap: true;
}

#caves[zoom>=14] {
  marker-height: 3;
  marker-line-color: black;
  marker-fill: black;
  marker-ignore-placement: true;
  marker-allow-overlap: true;
  [zoom>=17] {
    marker-height: @marker-board-height;
    [zoom>=20] { marker-height: @marker-board-height-z20; }
    [natural='cave_entrance'] {
      marker-file: url('symbols/hoehle.svg');
    }
    [man_made='adit'],[man_made='cellar_entrance'] {
      marker-file: url('symbols/stollen.svg');
    }
  }
}

/*
#tourism[zoom>=14] { [historic="monument"],
    [historic='memorial_statue'], [historic='memorial_war_memorial'] {
    marker-height: 3;
    marker-fill: white;
    marker-line-color: black;
    marker-ignore-placement: true;
    marker-allow-overlap: true;
    [zoom>=18] {
      marker-file: url('symbols/denkstein.svg');
      marker-height: @marker-low-height;
      [zoom>=20] { marker-height: @marker-low-height-z20; }
    }
    [zoom>=14][historic="monument"] {
      marker-file: url('symbols/denkmal.svg');
      marker-height: @marker-tall-height;
      [zoom>=20] { marker-height: @marker-tall-height-z20; }
    }
  }
}*/

#tourism[zoom>=14] { [feature='tree'],
    [historic='boundary_stone'],[historic='milestone'],[historic="monument"],
    [historic='memorial_statue'], [historic='memorial_war_memorial'],
    [feature='watermill'],[feature='former_watermill'],[feature='windmill'],
    [information='map'],[information='board'][boardtype!='notice'][boardtype!='welcome_sign'][boardtype!='public_transport'],
    [information='guidepost'] {
    marker-height: 3;
    marker-fill: gainsboro;
    marker-line-color: black;
    marker-allow-overlap: true;
    marker-ignore-placement: true;
    [feature='watermill'] {
      marker-file: url('symbols/wasserrad_klein.svg');
      marker-height: @marker-board-height;
      marker-fill: white;
    }
    [feature='former_watermill'] {
      marker-file: url('symbols/wasserrad_ehemalig.svg');
      marker-height: @marker-board-height;
    }
    [feature='windmill'] {
      marker-file: url('symbols/windmuehle_b.svg');
      marker-height: @marker-tall-height;
      [zoom>=20] { marker-height: @marker-tall-height-z20; }
    }
    [zoom>=14][historic="monument"] {
      marker-file: url('symbols/denkmal.svg');
      marker-fill-opacity: 0;
      marker-height: @marker-tall-height;
      [zoom>=20] { marker-height: @marker-tall-height-z20; }
    }
    [zoom>=16] {
      [feature='tree'] {
        marker-file: url('symbols/laubbaum.svg');  
        [leaves='needleleaved'] {marker-file: url('symbols/nadelbaum.svg'); }          
        marker-height: @marker-tree-height;
        [zoom>=18] {
          marker-height: @marker-tree-height-z18; 
          text-name: 'ND';
          text-size: 10;
          text-face-name: @serif-regular;
          text-dx: -@marker-tree-height-z18/2;
          text-dy: 6;
          text-halo-radius: 1; 
        }
      }
    }
    [zoom>=17] { 
      [information='map'] {
        marker-height: 0.5*@marker-board-height;
        marker-file: url('symbols/karte.svg');
        [zoom>=18] {
          marker-height: @marker-board-height;
          text-name: [label];
          text-wrap-width: 40;
          text-size: 10;
          text-face-name: @serif-regular;
          text-dy: @marker-board-height/2; 
          text-halo-radius: 2; 
          text-margin: 12; 
          [zoom>=20] {
            text-size: 15;
            marker-height: @marker-board-height-z20;
            text-dy: @marker-board-height-z20/2;
          }
        }
      }
      [information='board'][boardtype!='notice'][boardtype!='welcome_sign'][boardtype!='public_transport'] { 
        marker-height: 0.5*@marker-board-height;
        marker-file: url('symbols/informationstafel.svg');
        [zoom>=18] {
          marker-height: @marker-board-height;
          text-name: [label];
          text-wrap-width: 40;
          text-size: 8;
          text-face-name: @serif-regular;
          text-dy: @marker-board-height/2+3; 
          text-halo-radius: 2; 
          text-margin: 8; 
          text-allow-overlap: false;
          [zoom>=20] {
            text-size: 12;
            text-wrap-width: 80;
            marker-height: @marker-board-height-z20;
            text-dy: @marker-board-height-z20;
          }
        }
      }
    }
    [zoom>=18] {
      [information='guidepost'] {
        marker-height: @marker-tall-height;
        marker-file: url('symbols/wegweiser.svg');
        text-name: [label];
        //[ref!=''] {text-name: [ref]+"\n"+[name]+"\n"+[ele]; }
        text-wrap-width: 60;
        text-size: 8;
        text-face-name: @serif-italic;
        text-dy: @marker-tall-height/2+3;
        text-halo-radius: 2; 
        text-margin: 8;
        [zoom>=20] {
          text-size: 12;
          text-wrap-width: 90;
          marker-height: @marker-tall-height-z20;
          text-dy: @marker-tall-height-z20/2+3; }
      }
      [historic='memorial_statue'], [historic='memorial_war_memorial'] {
        marker-height: @marker-low-height;
        marker-file: url('symbols/denkstein.svg');
        marker-fill: none;
        [zoom>=20] { marker-height: @marker-low-height-z20; }
      }
      [historic='boundary_stone'] {
        marker-height: @marker-low-height;
        marker-file: url('symbols/grenzstein.svg');
        text-name: [ref];
        text-size: 8;
        text-face-name: @serif-italic;
        text-dy: 0.8*@marker-low-height;
        text-halo-radius: 1; 
        text-margin: 8; 
        [zoom>=20] {
          text-size: 12;
          marker-height: @marker-low-height-z20;
          text-dy: 0.8*@marker-low-height-z20;
        }
      }
      [historic='milestone'] {
        marker-height: @marker-low-height;
        marker-fill: white;
        marker-line-color: black;
        marker-file: url('symbols/meilenstein.svg');
      }
    }
  }
}

#amenities[zoom>=16] {
  [amenity='shelter'], [amenity='wilderness_hut'] {
    marker-height: @marker-board-height;
    [zoom=16] { marker-height: 0.5*@marker-board-height; }
    marker-file: url('symbols/schutzhuette.svg');
    [amenity='shelter'] { marker-file: url('symbols/schutzhuette_b.svg'); }
    marker-ignore-placement: true;
    marker-allow-overlap: true;
  }
  [zoom>=17][amenity='picnic_site'] {
    marker-height: @marker-tree-height;
    [zoom>=20] { marker-height: @marker-tree-height-z18; }
    marker-file: url('symbols/picnic.svg');
    marker-ignore-placement: true;
    marker-allow-overlap: true;
  }
  [zoom>=17][amenity='fountain'] {
    marker-height: @marker-tree-height;
    [zoom>=20] { marker-height: @marker-tree-height-z18; }
    marker-file: url('symbols/springbrunnen.svg');
    marker-ignore-placement: true;
    marker-allow-overlap: true;
  }
  [zoom>=17][amenity='drinking_water'] {
    marker-height: @marker-low-height;
    [zoom>=20] { marker-height: @marker-low-height-z20; }
    marker-file: url('symbols/trinkbrunnen.svg');
    marker-ignore-placement: true;
    marker-allow-overlap: true;
  }
}

#leisure-sports_signatures[zoom>=14][way_pixels>=2000]::icon { [feature='pitch'] {
      marker-file: url('symbols/pitch3.svg');
      marker-height: @marker-tree-height;
      [zoom>=18] {
        marker-height: 0.2*[length];
        //marker-height: 2*@marker-tree-height;
      }
      marker-placement: interior;
      marker-multi-policy: largest;
  }
}

#leisure-sports_signatures[zoom>=17][way_pixels>=500]::icon { [feature='playground'] {
      marker-file: url('symbols/spielplatz_b.svg');
      marker-width: 20;
      [zoom>=19] { marker-width: 40; }
      marker-placement: interior;
      marker-multi-policy: largest;
  }
}

#leisure-sports_signatures [feature='aerodrome'] {
  marker-file: url("symbols/flughafen.svg");
  marker-height: @marker-tall-height;
  [zoom>=17] { marker-height: 3*@marker-tall-height; }
  marker-placement: interior;
}