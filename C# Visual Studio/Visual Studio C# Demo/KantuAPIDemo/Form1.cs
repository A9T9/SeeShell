using System;
using System.Windows.Forms;

namespace KantuDemo.ComForm
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

            // Instanciate Kantu COM object
            var myType = Type.GetTypeFromProgID("Kantu"); 
            dynamic myKantu = Activator.CreateInstance(myType);

            textBoxLog.Text = "Starting Kantu Browser\r\n";

            //open the Kantu Browser. With myKantu.open(FALSE) you can connect to an already open instance
            i = myKantu.open(true);
            if (i < 0) textBoxLog.Text += "Kantu Open Error: " + i.ToString() + " Text: " + myKantu.getLastError() + "\r\n";

            myKantu.echo("Hello from the C# app: "+myScript);

            textBoxLog.Text += "Start Script\r\n"; 

            //Now we run the script - note that the .xkts extension is required
            i = myKantu.play(myScript);

            if (i < 0)
            {
                textBoxLog.Text += "Script Replay Error: " + i.ToString() + " Text: " + myKantu.getLastError() + "\r\n";
            }
            else
            {
                textBoxLog.Text += "Script completed - OK\r\n";
            }

            myKantu.echo("Done");

            textBoxLog.Text += "Closing Kantu Browser...\r\n";
            myKantu.close();
        }


    }
}
