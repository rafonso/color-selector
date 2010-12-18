/*
 * SliderControl.fx
 *
 * Created on 11/12/2010, 20:48:52
 */
package colorselector;

import javafx.geometry.Insets;
import javafx.scene.Node;
import javafx.scene.input.KeyCode;

/**
 * @author rafael
 */
public class SliderControl {

    def insets = Insets { left: 5.0, top: 0.0, right: 5.0, bottom: 0.0 };

    /**
     * Título do componente.
     */
    public var title: String = "";

    /**
     * Valor do componente
     */
    public var value: Number = 0 on replace {
                onChange();
            };

    /**
     * Se o componente está selecionado ou não.
     */
    public var selected: Boolean = false;

    /**
     * Se o componente está desabilitado ou não.
     */
    public var disable: Boolean = false;

    public var onChange: function(): Void = function() {
            }

    /**
     * Valor máximo do componente.
     */
    public def MAX: Number = 255;

    /**
     * Valor mínimo do componente.
     */
    public def MIN: Number = 0;

    def extendedStep = 25; //(MAX - MIN) / 10;
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:main
    def __layoutInfo_chbSelectes: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        hfill: false
        vpos: javafx.geometry.VPos.TOP
        margin: getMarginDefault()
    }
    public-read def chbSelectes: javafx.scene.control.CheckBox = javafx.scene.control.CheckBox {
        layoutInfo: __layoutInfo_chbSelectes
        onMouseWheelMoved: handleMouseWheelMoved
        text: ""
        selected: bind selected with inverse
    }
    
    def __layoutInfo_lblTitle: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        vpos: javafx.geometry.VPos.TOP
        margin: getMarginDefault()
    }
    public-read def lblTitle: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutInfo: __layoutInfo_lblTitle
        onMouseWheelMoved: handleMouseWheelMoved
        text: bind title with inverse
    }
    
    def __layoutInfo_sldValue: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: sldValueWidth ()
        hfill: true
        vpos: javafx.geometry.VPos.TOP
        hgrow: javafx.scene.layout.Priority.ALWAYS
        hshrink: javafx.scene.layout.Priority.ALWAYS
        margin: getMarginDefault()
    }
    public-read def sldValue: javafx.scene.control.Slider = javafx.scene.control.Slider {
        layoutInfo: __layoutInfo_sldValue
        onKeyPressed: sldValueOnKeyPressed
        onMousePressed: null
        onMouseWheelMoved: handleMouseWheelMoved
        min: sldValueMin ()
        max: sldValueMax ()
        value: bind value with inverse
        clickToPosition: false
        majorTickUnit: 50.0
        minorTickCount: 5
        showTickLabels: true
        showTickMarks: true
        snapToTicks: true
        labelFormatter: sldValueLabelFormatter
    }
    
    def __layoutInfo_lblValue: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        vpos: javafx.geometry.VPos.TOP
        margin: getMarginDefault()
    }
    public-read def lblValue: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutInfo: __layoutInfo_lblValue
        onMouseWheelMoved: handleMouseWheelMoved
        text: bind "{%03.0f sldValue.value}"
    }
    
    def __layoutInfo_hrbSliderControl: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 468.0
        height: 60.0
        hfill: true
        vfill: false
        hgrow: javafx.scene.layout.Priority.ALWAYS
        hshrink: javafx.scene.layout.Priority.ALWAYS
    }
    public-read def hrbSliderControl: javafx.scene.layout.HBox = javafx.scene.layout.HBox {
        disable: bind disable with inverse
        layoutInfo: __layoutInfo_hrbSliderControl
        onMousePressed: null
        onMouseWheelMoved: handleMouseWheelMoved
        content: [ chbSelectes, lblTitle, sldValue, lblValue, ]
        spacing: 6.0
        vpos: javafx.geometry.VPos.BASELINE
    }
    
    public-read def currentState: org.netbeans.javafx.design.DesignState = org.netbeans.javafx.design.DesignState {
    }
    
    public function getDesignRootNodes (): javafx.scene.Node[] {
        [ hrbSliderControl, ]
    }
    // </editor-fold>//GEN-END:main

    function changeValue(increment: Integer, delta: Number): Void {
        var newValue = increment * delta + this.value;
        if(newValue < MIN) {
            newValue = MIN;
        } else if(newValue > MAX) {
            newValue = MAX;
        }

        this.value = newValue;
    }

    function sldValueOnKeyPressed (event: javafx.scene.input.KeyEvent): Void {
        if(((event.code == KeyCode.VK_LEFT) or (event.code == KeyCode.VK_RIGHT)) and event.controlDown) {
            def increment = if(event.code == KeyCode.VK_RIGHT) then 1 else -1;
            this.changeValue(increment, extendedStep);
        } else if((event.code == KeyCode.VK_UP) or (event.code == KeyCode.VK_PAGE_UP)) {
            var step = if(event.controlDown) then extendedStep else 1;
            this.changeValue(1, step);
        } else if((event.code == KeyCode.VK_DOWN) or (event.code == KeyCode.VK_PAGE_DOWN)) {
            var step = if(event.controlDown) then extendedStep else 1;
            this.changeValue(-1, step);
        }
    }

    function handleMouseWheelMoved(event: javafx.scene.input.MouseEvent): Void {
        def increment = if(event.wheelRotation > 0) then -1 else 1;
        def delta = if(event.controlDown or event.secondaryButtonDown) then extendedStep else 1;
        this.changeValue(increment, delta);
    }

    function sldValueMax (): Number {
        MAX
    }

    function sldValueMin (): Number {
        MIN
    }

    function sldValueWidth (): Number {
        0.0
    }

    function getMarginDefault (): javafx.geometry.Insets {
        insets
    }

    function sldValueLabelFormatter(value: Number): String {
        "{%3.0f value}"
    }

    public def node: Node = this.hrbSliderControl;
}

function run (): Void {
    var design = SliderControl {};

    javafx.stage.Stage {
        title: "SliderControl"
        scene: javafx.scene.Scene {
            content: design.getDesignRootNodes ()
        }
    }
}
