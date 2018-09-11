namespace SeeShell_SubmitCsv_Example
{
    partial class frmMain
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.label1 = new System.Windows.Forms.Label();
            this._txtCsvFile = new System.Windows.Forms.TextBox();
            this._btnBrowseCsv = new System.Windows.Forms.Button();
            this._chkNewInstance = new System.Windows.Forms.CheckBox();
            this._btnExecute = new System.Windows.Forms.Button();
            this._rtInfo = new System.Windows.Forms.RichTextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(12, 9);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(129, 13);
            this.label1.TabIndex = 0;
            this.label1.Text = "Names and emails csv file";
            // 
            // _txtCsvFile
            // 
            this._txtCsvFile.Location = new System.Drawing.Point(15, 25);
            this._txtCsvFile.Name = "_txtCsvFile";
            this._txtCsvFile.Size = new System.Drawing.Size(499, 20);
            this._txtCsvFile.TabIndex = 1;
            this._txtCsvFile.Text = "namesandemail.csv";
            // 
            // _btnBrowseCsv
            // 
            this._btnBrowseCsv.Location = new System.Drawing.Point(520, 23);
            this._btnBrowseCsv.Name = "_btnBrowseCsv";
            this._btnBrowseCsv.Size = new System.Drawing.Size(32, 23);
            this._btnBrowseCsv.TabIndex = 2;
            this._btnBrowseCsv.Text = "...";
            this._btnBrowseCsv.UseVisualStyleBackColor = true;
            this._btnBrowseCsv.Click += new System.EventHandler(this._btnBrowseCsv_Click);
            // 
            // _chkNewInstance
            // 
            this._chkNewInstance.AutoSize = true;
            this._chkNewInstance.Checked = true;
            this._chkNewInstance.CheckState = System.Windows.Forms.CheckState.Checked;
            this._chkNewInstance.Location = new System.Drawing.Point(96, 55);
            this._chkNewInstance.Name = "_chkNewInstance";
            this._chkNewInstance.Size = new System.Drawing.Size(136, 17);
            this._chkNewInstance.TabIndex = 3;
            this._chkNewInstance.Text = "New SeeShell instance";
            this._chkNewInstance.UseVisualStyleBackColor = true;
            // 
            // _btnExecute
            // 
            this._btnExecute.Location = new System.Drawing.Point(15, 51);
            this._btnExecute.Name = "_btnExecute";
            this._btnExecute.Size = new System.Drawing.Size(75, 23);
            this._btnExecute.TabIndex = 4;
            this._btnExecute.Text = "Execute";
            this._btnExecute.UseVisualStyleBackColor = true;
            this._btnExecute.Click += new System.EventHandler(this._btnExecute_Click);
            // 
            // _rtInfo
            // 
            this._rtInfo.Location = new System.Drawing.Point(12, 102);
            this._rtInfo.Name = "_rtInfo";
            this._rtInfo.Size = new System.Drawing.Size(540, 159);
            this._rtInfo.TabIndex = 5;
            this._rtInfo.Text = "";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(12, 86);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(129, 13);
            this.label2.TabIndex = 6;
            this.label2.Text = "Names and emails csv file";
            // 
            // frmMain
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(564, 273);
            this.Controls.Add(this.label2);
            this.Controls.Add(this._rtInfo);
            this.Controls.Add(this._btnExecute);
            this.Controls.Add(this._chkNewInstance);
            this.Controls.Add(this._btnBrowseCsv);
            this.Controls.Add(this._txtCsvFile);
            this.Controls.Add(this.label1);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.Fixed3D;
            this.MaximizeBox = false;
            this.Name = "frmMain";
            this.Text = "SeeShell-SubmitCsv-Example";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox _txtCsvFile;
        private System.Windows.Forms.Button _btnBrowseCsv;
        private System.Windows.Forms.CheckBox _chkNewInstance;
        private System.Windows.Forms.Button _btnExecute;
        private System.Windows.Forms.RichTextBox _rtInfo;
        private System.Windows.Forms.Label label2;
    }
}

