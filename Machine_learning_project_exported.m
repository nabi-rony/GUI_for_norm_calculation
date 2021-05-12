classdef Machine_learning_project_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                   matlab.ui.Figure
        SelectNormTypebelowButton  matlab.ui.control.Button
        NormOutputEditField        matlab.ui.control.EditField
        NormOutputLabel            matlab.ui.control.Label
        Input2EditField            matlab.ui.control.EditField
        Input2EditFieldLabel       matlab.ui.control.Label
        ClicktoEnterDataButton_2   matlab.ui.control.Button
        Input1EditField            matlab.ui.control.EditField
        Input1EditFieldLabel       matlab.ui.control.Label
        ClicktoEnterDataButton     matlab.ui.control.Button
        DevelopedByMMNABIECEMississippiStateUniversityButton  matlab.ui.control.Button
        LInfNormButton             matlab.ui.control.Button
        L2NormButton               matlab.ui.control.Button
        L1NormButton               matlab.ui.control.Button
        UIAxes                     matlab.ui.control.UIAxes
    end

    % Callbacks that handle component events
    methods (Access = private)

        % Callback function
        function UserDataTextAreaValueChanged(app, event)
            value1 = app.UserDataTextArea.Value;
        end


        % Callback function
        function TextAreaValueChanged(app, event)
            value2 = app.TextArea.Value;   
        end

        % Button pushed function: L1NormButton
        function L1NormButtonPushed(app, event)
            theta = linspace(0, 2*pi,97);
            P = [cos(theta); sin(theta)];
            np_1 = sum(abs(P));
            P1 = P;
            P1(1,:) = P1(1,:)./ np_1;
            P1(2,:) = P1(2,:)./ np_1;
            plot(app.UIAxes,P1(1,:),P1(2,:), 'g');
            A2 = app.Input1EditField.Value;
            B2 = app.Input2EditField.Value;
            C1 = norm(str2num(A2)-str2num(B2),1);
            app.NormOutputEditField.Value = num2str(C1);           
        end

        % Button pushed function: L2NormButton
        function L2NormButtonPushed(app, event)
            theta = linspace(0, 2*pi,97);
            plot(app.UIAxes,cos(theta),sin(theta));
            A2 = app.Input1EditField.Value;
            B2 = app.Input2EditField.Value;
            C2 = norm(str2num(A2)-str2num(B2));
            app.NormOutputEditField.Value = num2str(C2);
        end

        % Button pushed function: LInfNormButton
        function LInfNormButtonPushed(app, event)
            theta = linspace(0, 2*pi,97);
            P = [cos(theta); sin(theta)];
            np_inf = max(abs(P));
            pinf = P;
            pinf(1,:) = pinf(1,:)./ np_inf;
            pinf(2,:) = pinf(2,:)./ np_inf;
            plot(app.UIAxes,pinf(1,:),pinf(2,:), 'r');
            A2 = app.Input1EditField.Value;
            B2 = app.Input2EditField.Value;
            C3 = norm(str2num(A2)-str2num(B2),"inf");
            app.NormOutputEditField.Value = num2str(C3);
                        
        end

        % Button pushed function: ClicktoEnterDataButton
        function ClicktoEnterDataButtonPushed(app, event)
            value = app.Input1EditField.Value
        end

        % Button pushed function: ClicktoEnterDataButton_2
        function ClicktoEnterDataButton_2Pushed(app, event)
            value = app.Input2EditField.Value
                      
        end

    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [100 100 640 480];
            app.UIFigure.Name = 'MATLAB App';

            % Create UIAxes
            app.UIAxes = uiaxes(app.UIFigure);
            title(app.UIAxes, 'Unit Ball')
            xlabel(app.UIAxes, 'X')
            ylabel(app.UIAxes, 'Y')
            zlabel(app.UIAxes, 'Z')
            app.UIAxes.YColor = [0.2118 0.0196 0.0196];
            app.UIAxes.Position = [329 78 293 263];

            % Create L1NormButton
            app.L1NormButton = uibutton(app.UIFigure, 'push');
            app.L1NormButton.ButtonPushedFcn = createCallbackFcn(app, @L1NormButtonPushed, true);
            app.L1NormButton.Position = [42 264 100 22];
            app.L1NormButton.Text = 'L1 Norm';

            % Create L2NormButton
            app.L2NormButton = uibutton(app.UIFigure, 'push');
            app.L2NormButton.ButtonPushedFcn = createCallbackFcn(app, @L2NormButtonPushed, true);
            app.L2NormButton.Position = [42 223 100 22];
            app.L2NormButton.Text = 'L2 Norm';

            % Create LInfNormButton
            app.LInfNormButton = uibutton(app.UIFigure, 'push');
            app.LInfNormButton.ButtonPushedFcn = createCallbackFcn(app, @LInfNormButtonPushed, true);
            app.LInfNormButton.Position = [42 182 100 22];
            app.LInfNormButton.Text = 'L-Inf Norm';

            % Create DevelopedByMMNABIECEMississippiStateUniversityButton
            app.DevelopedByMMNABIECEMississippiStateUniversityButton = uibutton(app.UIFigure, 'push');
            app.DevelopedByMMNABIECEMississippiStateUniversityButton.BackgroundColor = [0.2 0 0.0353];
            app.DevelopedByMMNABIECEMississippiStateUniversityButton.FontColor = [1 1 1];
            app.DevelopedByMMNABIECEMississippiStateUniversityButton.Position = [143 17 390 36];
            app.DevelopedByMMNABIECEMississippiStateUniversityButton.Text = {'Developed By'; 'M M NABI, ECE, Mississippi State University'};

            % Create ClicktoEnterDataButton
            app.ClicktoEnterDataButton = uibutton(app.UIFigure, 'push');
            app.ClicktoEnterDataButton.ButtonPushedFcn = createCallbackFcn(app, @ClicktoEnterDataButtonPushed, true);
            app.ClicktoEnterDataButton.BackgroundColor = [0.2 0.0196 0.0196];
            app.ClicktoEnterDataButton.FontColor = [1 1 1];
            app.ClicktoEnterDataButton.Position = [204 414 116 22];
            app.ClicktoEnterDataButton.Text = 'Click to Enter Data';

            % Create Input1EditFieldLabel
            app.Input1EditFieldLabel = uilabel(app.UIFigure);
            app.Input1EditFieldLabel.HorizontalAlignment = 'right';
            app.Input1EditFieldLabel.Position = [38 414 42 22];
            app.Input1EditFieldLabel.Text = 'Input 1';

            % Create Input1EditField
            app.Input1EditField = uieditfield(app.UIFigure, 'text');
            app.Input1EditField.Position = [95 414 100 22];

            % Create ClicktoEnterDataButton_2
            app.ClicktoEnterDataButton_2 = uibutton(app.UIFigure, 'push');
            app.ClicktoEnterDataButton_2.ButtonPushedFcn = createCallbackFcn(app, @ClicktoEnterDataButton_2Pushed, true);
            app.ClicktoEnterDataButton_2.BackgroundColor = [0.2118 0.0196 0.0196];
            app.ClicktoEnterDataButton_2.FontColor = [1 1 1];
            app.ClicktoEnterDataButton_2.Position = [204 373 116 22];
            app.ClicktoEnterDataButton_2.Text = 'Click to Enter Data';

            % Create Input2EditFieldLabel
            app.Input2EditFieldLabel = uilabel(app.UIFigure);
            app.Input2EditFieldLabel.HorizontalAlignment = 'right';
            app.Input2EditFieldLabel.Position = [38 373 42 22];
            app.Input2EditFieldLabel.Text = 'Input 2';

            % Create Input2EditField
            app.Input2EditField = uieditfield(app.UIFigure, 'text');
            app.Input2EditField.Position = [95 373 100 22];

            % Create NormOutputLabel
            app.NormOutputLabel = uilabel(app.UIFigure);
            app.NormOutputLabel.BackgroundColor = [0.2118 0.0196 0.0196];
            app.NormOutputLabel.HorizontalAlignment = 'right';
            app.NormOutputLabel.FontColor = [1 1 1];
            app.NormOutputLabel.Position = [36 115 107 22];
            app.NormOutputLabel.Text = 'Norm Output    ';

            % Create NormOutputEditField
            app.NormOutputEditField = uieditfield(app.UIFigure, 'text');
            app.NormOutputEditField.ValueChangedFcn = createCallbackFcn(app, @NormOutputEditFieldValueChanged, true);
            app.NormOutputEditField.Position = [151 115 169 22];

            % Create SelectNormTypebelowButton
            app.SelectNormTypebelowButton = uibutton(app.UIFigure, 'push');
            app.SelectNormTypebelowButton.BackgroundColor = [0.2 0 0.0353];
            app.SelectNormTypebelowButton.FontColor = [1 1 1];
            app.SelectNormTypebelowButton.Position = [41 305 279 36];
            app.SelectNormTypebelowButton.Text = 'Select Norm Type below';

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = Machine_learning_project_exported

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end