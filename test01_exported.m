classdef test01_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure         matlab.ui.Figure
        ADDButton        matlab.ui.control.Button
        SUBButton        matlab.ui.control.Button
        MULButton        matlab.ui.control.Button
        RESULTLabel      matlab.ui.control.Label
        Field3           matlab.ui.control.NumericEditField
        Slider           matlab.ui.control.Slider
        Slider2          matlab.ui.control.Slider
        Gauge_2          matlab.ui.control.SemicircularGauge
        Gauge            matlab.ui.control.SemicircularGauge
        EditField4       matlab.ui.control.NumericEditField
        DIVButton        matlab.ui.control.Button
        AVGButton        matlab.ui.control.Button
        PERButton        matlab.ui.control.Button
        EditField5       matlab.ui.control.NumericEditField
        CALCULATORLabel  matlab.ui.control.Label
    end

    
    methods (Access = private)
        
        function results = add(app)
            a = app.Slider.Value ;
            b = app.Slider2.Value;
            c = a+b;
            app.Field3.Value = c;
        end
        
        function results = sub(app)
            a = app.Slider.Value ;
            b = app.Slider2.Value;
            c = a-b;
             app.Field3.Value = c;
        end
        
        function results = mul(app)
           a = app.Slider.Value ;
           b = app.Slider2.Value;
            c = a*b;
             app.Field3.Value = c;
        end
        
        function results = div(app)
            a = app.Slider.Value ;
           b = app.Slider2.Value;
            c = a/b;
             app.Field3.Value = c;
        end
        
        function results = avg(app)
            a = app.Slider.Value ;
           b = app.Slider2.Value;
            c = 0.5*a*b;
             app.Field3.Value = c;
        end
        
        function results = per(app)
            a = app.Slider.Value ;
           b = app.Slider2.Value;
            c = (a/b)*100;
             app.Field3.Value = c;
        end
    end
    

    % Callbacks that handle component events
    methods (Access = private)

        % Button pushed function: ADDButton
        function ADDButtonPushed(app, event)
            add(app);
        end

        % Button pushed function: SUBButton
        function SUBButtonPushed(app, event)
            sub(app);
        end

        % Button pushed function: MULButton
        function MULButtonPushed(app, event)
            mul(app);
        end

        % Value changed function: Slider
        function SliderValueChanged(app, event)
            value = app.Slider.Value;
            app.Gauge.Value = value;
            app.EditField4.Value = value; 
        end

        % Value changed function: Slider2
        function Slider2ValueChanged(app, event)
            value1 = app.Slider2.Value;
            app.Gauge_2.Value = value1;
            app.EditField5.Value = value1; 
        end

        % Button pushed function: DIVButton
        function DIVButtonPushed(app, event)
            div(app);
        end

        % Button pushed function: AVGButton
        function AVGButtonPushed(app, event)
            avg(app);
        end

        % Button pushed function: PERButton
        function PERButtonPushed(app, event)
            per(app);
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [100 100 640 480];
            app.UIFigure.Name = 'UI Figure';

            % Create ADDButton
            app.ADDButton = uibutton(app.UIFigure, 'push');
            app.ADDButton.ButtonPushedFcn = createCallbackFcn(app, @ADDButtonPushed, true);
            app.ADDButton.Position = [139 94 100 22];
            app.ADDButton.Text = 'ADD';

            % Create SUBButton
            app.SUBButton = uibutton(app.UIFigure, 'push');
            app.SUBButton.ButtonPushedFcn = createCallbackFcn(app, @SUBButtonPushed, true);
            app.SUBButton.Position = [139 57 100 22];
            app.SUBButton.Text = 'SUB';

            % Create MULButton
            app.MULButton = uibutton(app.UIFigure, 'push');
            app.MULButton.ButtonPushedFcn = createCallbackFcn(app, @MULButtonPushed, true);
            app.MULButton.Position = [262 94 100 22];
            app.MULButton.Text = 'MUL';

            % Create RESULTLabel
            app.RESULTLabel = uilabel(app.UIFigure);
            app.RESULTLabel.FontName = 'Century Gothic';
            app.RESULTLabel.FontSize = 18;
            app.RESULTLabel.FontWeight = 'bold';
            app.RESULTLabel.Position = [98 330 62 24];
            app.RESULTLabel.Text = 'RESULT';

            % Create Field3
            app.Field3 = uieditfield(app.UIFigure, 'numeric');
            app.Field3.Position = [170 327 333 32];

            % Create Gauge
            app.Gauge = uigauge(app.UIFigure, 'semicircular');
            app.Gauge.Position = [159 234 120 65];

            % Create Gauge_2
            app.Gauge_2 = uigauge(app.UIFigure, 'semicircular');
            app.Gauge_2.Position = [368 233 120 65];

            % Create Slider
            app.Slider = uislider(app.UIFigure);
            app.Slider.ValueChangedFcn = createCallbackFcn(app, @SliderValueChanged, true);
            app.Slider.Position = [144 217 150 3];

            % Create Slider2
            app.Slider2 = uislider(app.UIFigure);
            app.Slider2.ValueChangedFcn = createCallbackFcn(app, @Slider2ValueChanged, true);
            app.Slider2.Position = [353 216 150 3];

            % Create EditField4
            app.EditField4 = uieditfield(app.UIFigure, 'numeric');
            app.EditField4.Position = [190 150 57 22];

            % Create EditField5
            app.EditField5 = uieditfield(app.UIFigure, 'numeric');
            app.EditField5.Position = [402 150 57 22];

            % Create DIVButton
            app.DIVButton = uibutton(app.UIFigure, 'push');
            app.DIVButton.ButtonPushedFcn = createCallbackFcn(app, @DIVButtonPushed, true);
            app.DIVButton.Position = [262 57 100 22];
            app.DIVButton.Text = 'DIV';

            % Create AVGButton
            app.AVGButton = uibutton(app.UIFigure, 'push');
            app.AVGButton.ButtonPushedFcn = createCallbackFcn(app, @AVGButtonPushed, true);
            app.AVGButton.Position = [399 94 100 22];
            app.AVGButton.Text = 'AVG';

            % Create PERButton
            app.PERButton = uibutton(app.UIFigure, 'push');
            app.PERButton.ButtonPushedFcn = createCallbackFcn(app, @PERButtonPushed, true);
            app.PERButton.Position = [399 57 100 22];
            app.PERButton.Text = 'PER';

            % Create CALCULATORLabel
            app.CALCULATORLabel = uilabel(app.UIFigure);
            app.CALCULATORLabel.FontName = 'Baskerville Old Face';
            app.CALCULATORLabel.FontSize = 40;
            app.CALCULATORLabel.FontWeight = 'bold';
            app.CALCULATORLabel.Position = [176 396 290 50];
            app.CALCULATORLabel.Text = 'CALCULATOR';

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = test01_exported

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