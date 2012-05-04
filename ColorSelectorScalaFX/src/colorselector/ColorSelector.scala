package colorselector

import scala.collection.Seq
import colorselector.insets
import javafx.beans.property.SimpleDoubleProperty
import javafx.event.EventHandler
import javafx.geometry.HPos
import javafx.geometry.Pos
import javafx.scene.input.MouseEvent
import javafx.scene.layout.Priority
import javafx.scene.text.TextAlignment
import scalafx.Includes.jfxBooleanProperty2sfx
import scalafx.application.JFXApp
import scalafx.beans.property.BooleanProperty.sfxBooleanProperty2jfx
import scalafx.beans.property.DoubleProperty.sfxDoubleProperty2jfx
import scalafx.beans.property.ObjectProperty.sfxObjectProperty2jfx
import scalafx.beans.property.ObjectProperty
import scalafx.beans.property.DoubleProperty
import scalafx.collections.ObservableBuffer.Add
import scalafx.collections.ObservableBuffer.Change
import scalafx.collections.ObservableBuffer.Remove
import scalafx.collections.ObservableBuffer.canBuildFrom
import scalafx.collections.ObservableBuffer.observableBuffer2ObservableList
import scalafx.collections.ObservableBuffer
import scalafx.scene.control.CheckBox.sfxCheckBox2jfx
import scalafx.scene.control.Control.sfxControl2jfx
import scalafx.scene.control.TextField.sfxTextField2jfx
import scalafx.scene.control.CheckBox
import scalafx.scene.control.Label
import scalafx.scene.control.TextField
import scalafx.scene.effect.Reflection
import scalafx.scene.layout.AnchorPane
import scalafx.scene.layout.ColumnConstraints
import scalafx.scene.layout.GridPane
import scalafx.scene.layout.RowConstraints
import scalafx.scene.paint.Paint.sfxPaint2jfx
import scalafx.scene.paint.Color
import scalafx.scene.paint.Paint
import scalafx.scene.shape.Rectangle
import scalafx.scene.Scene
import scalafx.stage.Stage
import scalafx.scene.control.ComboBox

object ColorSelector extends JFXApp {

  lazy val allControls = List(controlRed, controlGreen, controlBlue, controlAlpha)

  val currentColor = new ObjectProperty[Paint](Color.WHITE, "Color")

  val synchronizedValue = new DoubleProperty(new SimpleDoubleProperty)

  val synchronizedControls = new ObservableBuffer[SliderControl]
  synchronizedControls.onChange((buffer, changes) => syncronizeValues(buffer, changes))

  def controlSelected(control: SliderControl) {
    if (control.selectedControl.get) {
      synchronizedControls.add(control)
    } else {
      synchronizedControls.remove(control)
    }
  }

  private def changeColor {
    val newAlphaValue = if (controlAlpha.disabled.get()) 1.0 else (controlAlpha.value.toDouble / colorselector.Max)

    this.currentColor.set(Color.rgb(controlRed.value.toInt, controlGreen.value.toInt, controlBlue.value.toInt, newAlphaValue))
  }

  private def syncronizeValues(buffer: ObservableBuffer[SliderControl], changes: Seq[Change]) {
    changes(0) match {
      case Add(pos, added) => {
        val media = buffer.map(_.value.get).sum / buffer.size
        added.last.asInstanceOf[SliderControl].value <==> synchronizedValue
        buffer.foreach(_.value = media)
      }
      case Remove(pos, removed) => {
        removed.last.asInstanceOf[SliderControl].value unbind synchronizedValue
      }
    }
  }

  private def randomizeColors {
    if (synchronizedControls.size > 0) {
      this.synchronizedValue.set(math.random * colorselector.Max)
    }
    if (synchronizedControls.size < 4) {
      this.allControls
        .filterNot(_.selectedControl.get)
        .filterNot(_.disabled.get)
        .foreach(_.value.set(math.random * colorselector.Max))
    }
  }

  val rectangle = new Rectangle {
    effect = new Reflection {
      fraction = 0.43
    }
    height = 216.0
    onMouseClicked = new EventHandler[MouseEvent] {
      def handle(event: MouseEvent) {
        if (event.getClickCount == 2) {
          randomizeColors
        }
      }
    }
    width = 599.0
  }
  currentColor.onChange(rectangle.fill = currentColor.get())

  val rectangleAnchor = new AnchorPane {
    content = List(rectangle)
  }
  AnchorPane.setAnchors(rectangle, 0, 0, 0, 0)

  val controlRed = new SliderControl("R") {
    value = 255
  }
  controlRed.value.onChange(changeColor)
  controlRed.selectedControl.onChange(controlSelected(controlRed))

  val controlGreen = new SliderControl("G") {
    value = 255
  }
  controlGreen.value.onChange(changeColor)
  controlGreen.selectedControl.onChange(controlSelected(controlGreen))

  val controlBlue = new SliderControl("B") {
    value = 255
  }
  controlBlue.value.onChange(changeColor)
  controlBlue.selectedControl.onChange(controlSelected(controlBlue))

  val controlAlpha = new SliderControl("A") {
    value = 255
  }
  controlAlpha.value.onChange(changeColor)
  controlAlpha.selectedControl.onChange(controlSelected(controlAlpha))
  controlAlpha.disable.onChange({
    if (controlAlpha.selectedControl.get) {
      if (controlAlpha.disable.get) synchronizedControls.remove(controlAlpha)
      else synchronizedControls.add(controlAlpha)
    }
    changeColor
  })

  val cmbWebColor = new ComboBox {
    promptText = "Web Color"
  }

  val txfColorValue = new TextField {
    promptText = "Color Value"
    editable = false
    alignment = Pos.CENTER_LEFT
  }

  val cmbColorFormat = new ComboBox {
    promptText = "Color Format"
  }

  val chbEnableAlpha = new CheckBox {
    selected <==> controlAlpha.disable
  }

  val rectangleRowsConstraint = new RowConstraints {
    vgrow = Priority.ALWAYS
  }
  val otherRowsConstraint = new RowConstraints {
    vgrow = Priority.NEVER
  }
  val column0Constraint = new ColumnConstraints {
    fillWidth = true
    halignment = HPos.CENTER
    hgrow = Priority.ALWAYS
    minWidth = 300
  }
  val column1Constraint = new ColumnConstraints {
    halignment = HPos.RIGHT
    hgrow = Priority.NEVER
    minWidth = 80
    maxWidth = 100
  }
  val column2Constraint = new ColumnConstraints {
    halignment = HPos.LEFT
    hgrow = Priority.SOMETIMES
    minWidth = 200
  }
  val pnlMain = new GridPane {
    hgap = 5.0
    vgap = 5.0
    gridLinesVisible = true
    rowConstraints = List(rectangleRowsConstraint, otherRowsConstraint, otherRowsConstraint,
      otherRowsConstraint, otherRowsConstraint)
    columnConstraints = List(column0Constraint, column1Constraint)
    padding = insets

    add(rectangleAnchor, 0, 0, 3, 1)

    add(controlRed, 0, 1)
    add(new Label {
      alignment = Pos.TOP_RIGHT
      labelFor = cmbWebColor
      text = "Web Color"
      textAlignment = TextAlignment.RIGHT
      wrapText = true
    }, 1, 1)
    add(cmbWebColor, 2, 1)

    add(controlBlue, 0, 2)
    add(new Label {
      alignment = Pos.TOP_RIGHT
      labelFor = txfColorValue
      text = "Color Value"
      textAlignment = TextAlignment.RIGHT
      wrapText = true
    }, 1, 2)
    add(txfColorValue, 2, 2)

    add(controlGreen, 0, 3)
    add(new Label {
      alignment = Pos.TOP_RIGHT
      labelFor = cmbColorFormat
      text = "Color Format"
      textAlignment = TextAlignment.RIGHT
      wrapText = true
    }, 1, 3)
    add(cmbColorFormat, 2, 3)

    add(controlAlpha, 0, 4)
    add(new Label {
      alignment = Pos.TOP_RIGHT
      labelFor = chbEnableAlpha
      text = "Enable Alpha"
      textAlignment = TextAlignment.RIGHT
      wrapText = true
    }, 1, 4)
    add(chbEnableAlpha, 2, 4)
  }

  val pnlMain0 = new AnchorPane {
    content = List(pnlMain)
    prefHeight = 500
    prefWidth = 800
  }
  AnchorPane.setAnchors(pnlMain, 0, 0, 0, 0)

  val mainScene = new Scene {
    content = List(pnlMain0)
  }
  pnlMain0.prefWidth <== mainScene.width
  pnlMain0.prefHeight <== mainScene.height

  stage = new Stage {
    title = "Color Selector"
    width = 600
    height = 400
    scene = mainScene
  }

  changeColor

}