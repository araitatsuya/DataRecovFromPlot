function [B_part] = bspline_assemble(T,section)

        T3 = T.^3;
        T2 = T.^2; 
        T1 = T; 
        T0 = ones(size(T));

if section == 0
    B_part = (-1) .* T3 + (3) .* T2 + (-3) .* T1 + (1).* T0;
else if section == 1
        B_part = (3) .* T3 + (-6) .* T2 + (0) .* T1 + (4).* T0;
    else if section == 2
            B_part = (-3) .* T3 + (3) .* T2 + (3) .* T1 + (1).* T0;
        else 
            B_part = (1) .* T3 + (0) .* T2 + (0) .* T1 + (0).* T0;
        end
    end
end

B_part = B_part ./ 6;