using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.IO;

using Cef.MyRecorder.Pipe.ComHelper;

namespace SeeShell_SubmitCsv_Example
{
    public partial class frmMain : Form
    {
        #region Fields

        /// <summary>
        /// Helper class for instancing/communicating with SeeShell Browser
        /// </summary>
        private RecorderComHelper _recorder;

        #endregion

        public frmMain()
        {
            InitializeComponent();
        }

        private void _btnBrowseCsv_Click(object sender, EventArgs e)
        {
            // Browse for csv file
            var dlg = new OpenFileDialog
            {
                Filter = "Csv Files|*.csv"
            };

            if (dlg.ShowDialog() != DialogResult.OK) return;

            _txtCsvFile.Text = dlg.FileName;
        }

        private void _btnExecute_Click(object sender, EventArgs e)
        {
            // Checkl if file exists.
            string file = _txtCsvFile.Text;
            if (string.IsNullOrEmpty(file) || !File.Exists(file))
            {
                MessageBox.Show("Please add existing csv file to continue.");
                return;
            }

            // Do we need new instance or connect to existent one?
            var newInstance = _chkNewInstance.Checked;

            // Run it on seperate thread so we do not block the UI thread waiting for SeeShell Browser to execute.
            Task.Run(() =>
            {
                try
                {
                    EnableControls(false);
                    // Create instance of the helper class
                    _recorder = new RecorderComHelper();

                    // Open it.
                    var result = _recorder.open(newInstance);
                    // Check th result.
                    if (result < 0)
                    {
                        AddLog(string.Format("Error: Failed to open SeeShell player. Error code: {0}", result));
                        return;
                    }

                    // Real all lines from csv file
                    var lines = File.ReadAllLines(file);

                    // Send line by line to SeeShell
                    foreach (var ln in lines)
                    {
                        // Read FirstName, LastName and Email
                        var vars = ln.Split(',');
                        if (vars.Length < 3)
                        {
                            AddLog(string.Format("Error: line \"{0}\" is not properly formatted.", ln));
                            continue;
                        }

                        AddLog(string.Format("Processing: First: {0}, Last: {1}, Email: {2}", vars[0], vars[1], vars[2]));

                        // Set the script variables.
                        _recorder.setVariable("first", vars[0]);
                        _recorder.setVariable("last", vars[1]);
                        _recorder.setVariable("email", vars[2]);

                        // Play Demo-Variables project
                        result = _recorder.play("Demo-Variables");

                        // Check for the result
                        if (result < 0)
                        {
                            AddLog(string.Format("Error playing. Error code: {0}", result));
                        }
                    }

                    AddLog("Done playing script.");
                }
                catch (Exception ex)
                {
                    MessageBox.Show(string.Format("Unexpected error. Details: {0}", ex.Message));
                }
                finally
                {
                    if (_recorder != null)
                    {
                        _recorder.close();
                    }
                    _recorder = null;

                    EnableControls(true);
                }
            });
        }
        /// <summary>
        /// Add log lines to rich text box.
        /// </summary>
        /// <param name="msg"></param>
        private void AddLog(string msg)
        {
            if (InvokeRequired)
            {
                // Cannot call forms control (_rtInfo) from a thread that wasn't created on.
                // So invoke this to the UI thread.
                BeginInvoke(new Action<string>(AddLog), msg);
            }
            else
            {
                _rtInfo.AppendText(string.Format(">> {0}\n", msg));
            }
        }
        /// <summary>
        /// Enable disable controls.
        /// </summary>
        /// <param name="enable"></param>
        private void EnableControls(bool enable)
        {
            if(InvokeRequired)
            {
                BeginInvoke(new Action<bool>(EnableControls), enable);
            }
            else
            {
                _btnExecute.Enabled = enable;
                _btnBrowseCsv.Enabled = enable;
                _chkNewInstance.Enabled = enable;
                _txtCsvFile.Enabled = enable;
            }
        }
    }
}
