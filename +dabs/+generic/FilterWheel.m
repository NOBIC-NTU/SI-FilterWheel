classdef FilterWheel % < dabs.resources.Device
    methods (Static)
        function Go1 % argument-free alias for a function with one, because "UserButtons" didnt support it.
            dabs.generic.FilterWheel.Go(1);
        end
        function Go2 % argument-free alias for a function with one, because "UserButtons" didnt support it.
            dabs.generic.FilterWheel.Go(2);
        end
        function Go3 % argument-free alias for a function with one, because "UserButtons" didnt support it.
            dabs.generic.FilterWheel.Go(3);
        end
        function Go4 % argument-free alias for a function with one, because "UserButtons" didnt support it.
            dabs.generic.FilterWheel.Go(4);
        end
        function Go5 % argument-free alias for a function with one, because "UserButtons" didnt support it.
            dabs.generic.FilterWheel.Go(5);
        end
        function Go6 % argument-free alias for a function with one, because "UserButtons" didnt support it.
            dabs.generic.FilterWheel.Go(6);
        end
    end
    methods (Static)
        function Go(pos)
            %FILTERWHEELGO Set to position pos (1-6)

            objarr = instrfind('Name','Serial-COM7');  % TODO: smarter COM detection
            if ~isempty(objarr)
               fclose(objarr);
               delete(objarr);
               return;
            end

            s = serial('COM7');  % TODO: smarter COM detection
            fopen(s);
            for i=1:6
                try
                    fwrite(s,num2str(pos),'char');
                    A=fread(s,1,'char');
                    if A == pos
                        break;
                    else
                        pause(.5);
                    end
                catch % ERR
                    %disp(ERR);
                    disp('Glitched in FilterWheel: Probably caused by  hammering.');
                    break;
                end
            end
            fclose(s);
            delete(s);
            fprintf('FilterWheel: %d\n',A); % lists the old status
        end
    end
end
