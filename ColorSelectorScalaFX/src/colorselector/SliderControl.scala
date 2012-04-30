/**
 *
 */
package colorselector

import javafx.beans.property.SimpleBooleanProperty
import javafx.beans.property.SimpleDoubleProperty
import javafx.beans.property.SimpleDoubleProperty
import javafx.event.EventHandler
import javafx.scene.layout.Priority
import scalafx.Includes._
import scalafx.beans.property.BooleanProperty
import scalafx.beans.property.DoubleProperty
import scalafx.geometry.Insets
import scalafx.scene.control._
import javafx.scene.input.ScrollEvent
import scalafx.scene.layout.HBox

/**
 * @author Rafael
 *
 */
class SliderControl(title: String) extends HBox {

  import colorselector._

  val realValue = new DoubleProperty(new SimpleDoubleProperty)

  val selectedControl = new BooleanProperty(new SimpleBooleanProperty)
  
  val chbSelected = new CheckBox {
    id = "chbSelected"
    selected <==> selectedControl
  }

  val lblTitle = new Label {
    id = "lblTitle"
    text = title
  }

  val sldValue = new Slider {
    id = "sldValue"
    blockIncrement = 5.0
    majorTickUnit = 50.0
    max = Max
    min = Min
    minorTickCount = 4
    showTickLabels = true
    showTickMarks = true
    hgrow = Priority.ALWAYS
    value <==> realValue
  }

  val lblValue = new Label {
    id = "lblValue"
    text <== realValue.asString("%03.0f")
    hgrow = Priority.NEVER
  }

  def value = this.realValue
  def value_=(d: Double) {
    if (d < Min) {
      value() = Min
    } else if (d > Max) {
      value() = Max
    } else {
      value() = d
    }
  }

  content = List(chbSelected, lblTitle, sldValue, lblValue)

  padding = insets

  onScroll = new EventHandler[ScrollEvent] {
    def handle(event: ScrollEvent) {

      if (event.getEventType == ScrollEvent.SCROLL) {
        val multiplier = if (event.isControlDown()) 10 else 1
        val delta = -(event.getDeltaY.toInt / 10)

        value = (value.get + multiplier * delta)
      }
    }
  }
}