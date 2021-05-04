function[] = Density() %McCaylee Dempcy and Bhavana Sunil's final project

global gui %call a global function so we can use it in the callback functions

gui.fig = figure('numbertitle', 'off', 'name', 'Density Calculations'); %makes an actual gui with our title

gui.volumeText = uicontrol('style','text','position',[20 350 100 20],'string','Input Volume:','horizontalalignment','left'); %text box to tell user to input the volume
gui.volumeEdit = uicontrol('style','edit','position',[20 335 100 20]); %creates the actual box to input the volume 
gui.volumeMeasurement = uicontrol('style','popupmenu','string',{'L';'mL';'m^3';'ft^3'},'position',[20 305 100 20],'horizontalalignment','left','callback',{@choice}); %choose either L or m^3 units
gui.volumeUnits = 'L'; %set a default

gui.volumeText = uicontrol('style','text','position',[20 200 100 20],'string','Input Mass:','horizontalalignment','left'); %text box to tell user to input the mass
gui.massEdit = uicontrol('style','edit','position',[20 185 100 20]); %created the actual box to input the mass
gui.massMeasurement = uicontrol('style','popupmenu','string',{'kg';'g';'mg';'lb'},'position',[20 160 100 20],'horizontalalignment','left','callback',{@choice}); %choose either L or m^3 units
gui.massUnits = 'kg'; %set a default

gui.solve = uicontrol('style','pushbutton','position',[20 100 100 20],'string','Solve','horizontalalignment','left','callback',{@solve}); %solve button at the bottom
      
end

function [] = choice(~,~) %callback function for whether the user chooses Liters or m^3

global gui
    
str = get(gui.volumeMeasurement,'string'); %gets the string and value
val = get(gui.volumeMeasurement,'value');

    switch str{val} %gives us the option to choose volume measurement, and whichever we choose will be assigned to 'V'
        case 'L'
            V = 'L';
        case 'm^3'
            V = 'm^3';
        case 'mL'
            V = 'mL';
        case 'ft^3'
            V = 'ft^3';
    end
gui.volumeUnits = V; %we assign V to a global function so we can use it in the other callback

str = get(gui.massMeasurement,'string'); %gets the string and value
val = get(gui.massMeasurement,'value');

    switch str{val} %gives us the option to choose mass measurement, and whichever we choose will be assigned to 'M'
        case 'kg'
            M = 'kg';
        case 'g'
            M = 'g';
        case 'mg'
            M = 'mg';        
        case 'lb'
            M = 'lb';
    end 
gui.massUnits = M; %we assign M to a global function so we can use it in the other callback

end
        
function [] = solve(~,~) %callback function to actually do the math and solve for the density
global gui   
    
    volume = str2num(gui.volumeEdit.String); %convert the volume input from a string to a number
    mass = str2num(gui.massEdit.String); %convert the mass input from a string to a number

    Density = (mass / volume); %assigning Density to the math needed to solve for it
    Density = num2str(Density); %converts it to a string so we can display it in the msgbox
    Density = [Density,' ',gui.massUnits,'/',gui.volumeUnits]; %give Density a new definition so we can display it with the units
    msgbox(Density,'Density'); %message box that displays the calculated density with chosen units from earlier callback
    
end 
