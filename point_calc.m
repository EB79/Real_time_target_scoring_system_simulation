function point_number = point_calc(hit_point_radius ,circles_radius)

if gt(hit_point_radius, circles_radius(1))
    point_number = 0;
    
elseif le(hit_point_radius, circles_radius(1)) & gt(hit_point_radius, circles_radius(2))
    point_number = 10;
    
    
elseif le(hit_point_radius, circles_radius(2)) & gt(hit_point_radius, circles_radius(3))
    point_number = 20;
    
    
elseif le(hit_point_radius, circles_radius(3)) & gt(hit_point_radius, circles_radius(4))
    point_number = 30;
    
    
elseif le(hit_point_radius, circles_radius(4)) & gt(hit_point_radius, circles_radius(5))
    point_number = 40;
  
    
elseif le(hit_point_radius, circles_radius(5)) & gt(hit_point_radius, circles_radius(6))
    point_number = 50;

    
elseif le(hit_point_radius, circles_radius(6)) & gt(hit_point_radius, circles_radius(7))
    point_number = 60;

    
elseif le(hit_point_radius, circles_radius(7)) & gt(hit_point_radius, circles_radius(8))
    point_number = 70;

    
elseif le(hit_point_radius, circles_radius(8)) & gt(hit_point_radius, circles_radius(9))
    point_number = 80;

    
elseif le(hit_point_radius, circles_radius(9)) & gt(hit_point_radius, circles_radius(10))
    point_number = 90;

    
elseif le(hit_point_radius, circles_radius(10)) & gt(hit_point_radius, circles_radius(11))
    point_number = 100;

    
elseif le(hit_point_radius, circles_radius(11))
    point_number = 200;
    
else
    point_number = 0;
    
end
end