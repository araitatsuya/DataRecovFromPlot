function [PlotData] = plot2data(im_file_name,x_tick_label, y_tick_label, num_data_points)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Input
%       im_file_name: Image File Name (char)
%       x_tick_label: X Tick Label (vector)
%       y_tick_label: Y Tick Label (vector)
%       num_data_points: # of data points you want to recover
%
%
%   e.g. 
%       [PlotData] = plot2data('AG_Fig4_7.PNG',[0 10 20 30 40], [0 10 20 30 40 50 60], 1)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
close all
IM = imread(im_file_name);
imagesc(IM); axis equal; 

x_x_tick_label = zeros(1, length(x_tick_label));
y_x_tick_label = zeros(1, length(x_tick_label));
for i1 = 1:length(x_tick_label);
    [x_x_tick_label(i1),y_x_tick_label(i1)] = ginput(1);
end

x_y_tick_label = zeros(1, length(y_tick_label));
y_y_tick_label = zeros(1, length(y_tick_label));
for i1 = 1:length(y_tick_label);
    [x_y_tick_label(i1),y_y_tick_label(i1)] = ginput(1);
end

p_x = polyfit(x_x_tick_label,x_tick_label,1);
p_y = polyfit(y_y_tick_label,y_tick_label,1);

x_data = zeros(1, num_data_points);
y_data = zeros(1, num_data_points);
for i1 = 1:num_data_points;
    [x_data_temp,y_data_temp] = ginput(1);
    x_data(i1) = p_x(1).* x_data_temp + p_x(2);
    y_data(i1) = p_y(1).* y_data_temp + p_y(2);
end

PlotData.x = x_data;
PlotData.y = y_data;
