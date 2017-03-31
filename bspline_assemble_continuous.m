function [B_spline] = bspline_assemble_continuous(X)

B_spline = zeros(size(X));

id_X_0 = find(X > 1 & X <= 2);
id_X_1 = find(X > 0 & X <= 1);
id_X_2 = find(X > -1 & X <= 0);
id_X_3 = find(X > -2 & X <= -1);

[B_part_0] = bspline_assemble(X(id_X_0) - 1,0);
[B_part_1] = bspline_assemble(X(id_X_1) - 0,1);
[B_part_2] = bspline_assemble(X(id_X_2) + 1,2);
[B_part_3] = bspline_assemble(X(id_X_3) + 2,3);

B_spline(id_X_0) = B_part_0;
B_spline(id_X_1) = B_part_1;
B_spline(id_X_2) = B_part_2;
B_spline(id_X_3) = B_part_3;
