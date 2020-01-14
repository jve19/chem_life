resetForm <- function(session) {
  updateTextInput(session, "text_demo", value = "")
  updateSelectInput(session, "select_demo", selected=character(0))
  updateRadioButtons(session, "radio_demo", selected = "yes")
  updateCheckboxInput(session, "checkbox_demo", value = FALSE)
  updateCheckboxGroupInput(session, "cbgroup_demo", selected=character(0))
  updateTextAreaInput(session, "textarea_demo", value = "")
  updateTextInput(session, "password_demo", value = "")
  updateSliderInput(session, "slider_demo", value = 50)
  updateDateInput(session, "date_demo", value = NA)
  updateDateRangeInput(session, "daterange_demo", start = NA, end = NA)
  updateNumericInput(session, "number_demo", value = 0)
}