using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TemperatureConverter
{
    public partial class _default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void ButtonClear_Click(object sender, EventArgs e)
        {
            //Clear input and result textboxes and reset dropdown controls to default
            DropDownListFrom.SelectedIndex = 0;
            DropDownListTo.SelectedIndex = 1;
            TextBoxInput.Text = "";
            LabelResult.Text = "";
        }

        protected void ButtonConvert_Click(object sender, EventArgs e)
        {
            //Collect use input as integer
            int inputTemp = Convert.ToInt32(TextBoxInput.Text);
            double result=0;

            if (DropDownListFrom.SelectedValue == "C")
            {
                //From: Celsius
                switch (DropDownListTo.SelectedValue)
                {
                    //To: Celsius
                    case "C":
                        result = inputTemp;
                        break;
                    //To: Fahrenheit
                    case "F":
                        result = inputTemp * 9 / 5 + 32;
                        break;
                    //To: Kelvin
                    default:
                        result = inputTemp + 273.15;
                        break;
                }
            }
            //From: Fahrenheit
            else if (DropDownListFrom.SelectedValue == "F")
            {
                switch (DropDownListTo.SelectedValue)
                {
                    //To: Celsius
                    case "C":
                        result = (inputTemp - 32) * 5 / 9;
                        break;
                    //To: Fahrenheit
                    case "F":
                        result = inputTemp;
                        break;
                    //To: Kelvin
                    default:
                        result = (inputTemp + 459.67) * 5 / 9;
                        break;
                }
            }
            //From: Kelvin
            else
            {
                switch (DropDownListTo.SelectedValue)
                {
                    //To: Celsius
                    case "C":
                        result = inputTemp - 273.15;
                        break;
                    //To: Fahrenheit
                    case "F":
                        result = (inputTemp * 9 / 5) - 459.67;
                        break;
                    //To: Kelvin
                    default:
                        result = inputTemp;
                        break;
                }
            }
            //Display result
            displayValue(result);
        }

        /// <summary>
        /// Display provided result to LabelResult control
        /// </summary>
        /// <param name="result">double</param>
        private void displayValue(double result) {

            //Figure out the symbol to use
            string symbol;
            if (DropDownListTo.SelectedValue == "C") {
                symbol = "°C";
            } else if (DropDownListTo.SelectedValue == "F") {
                symbol = "°F";
            } else {
                symbol = "K";
            }
            //Display result to LabelResult
            LabelResult.Text = string.Format("{0:F2}{1}", result, symbol);
        }
    }
}