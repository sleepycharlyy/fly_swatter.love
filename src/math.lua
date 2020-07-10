-- (returns integer) distance between two points
function get_distance(x1, y1, x2, y2)
    return math.sqrt((y2 - y1)^2 + (x2 - x1)^2);
end

-- (returns boolean) checks wether two boxes collide
function check_collision(x1, y1, w1, h1, x2, y2, w2, h2)
    return x1 < x2+w2 and
           x2 < x1+w1 and
           y1 < y2+h2 and
           y2 < y1+h1;
end