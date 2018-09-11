using System;
using System.Windows.Forms;

namespace SeeShellDemo.ComForm
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

    private string myScript;

        private void button1_Click(object sender, EventArgs e)
        {
            int i;
            
            myScript = textBox1.Text;

            // Instanciate SeeShell COM object
            var myType = Type.GetTypeFromProgID("SeeShell.Browser");
           // var myType = Type.GetTypeFromProgID("SeeShell"); //SeeShell Desktop Automation

            dynamic mySeeShell = Activator.CreateInstance(myType);

            textBoxLog.Text = "Starting SeeShell Browser\r\n";

            //open the SeeShell Browser. With mySeeShell.open(FALSE) you can connect to an already open instance
            i = mySeeShell.open(true);
            if (i < 0) textBoxLog.Text += "SeeShell Open Error: " + i.ToString() + " Text: " + mySeeShell.getLastError() + "\r\n";

            mySeeShell.echo("Hello from the C# app: "+myScript);

            textBoxLog.Text += "Start Script\r\n"; 

            //Now we run the macro 
            i = mySeeShell.play(myScript);

            if (i < 0)
            {
                textBoxLog.Text += "Script Replay Error: " + i.ToString() + " Text: " + mySeeShell.getLastError() + "\r\n";
            }
            else
            {
                textBoxLog.Text += "Script completed - OK\r\n";
            }

            mySeeShell.echo("Done");

            textBoxLog.Text += "Closing SeeShell Browser...\r\n";
            mySeeShell.close();
        }


    }
}
