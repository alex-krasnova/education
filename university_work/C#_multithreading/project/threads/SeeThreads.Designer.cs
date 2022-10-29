namespace threads
{
    partial class SeeThreads
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
            this.components = new System.ComponentModel.Container();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.PaintBox = new System.Windows.Forms.Button();
            this.MakeBox = new System.Windows.Forms.Button();
            this.ClearBox = new System.Windows.Forms.Button();
            this.timerGraph = new System.Windows.Forms.Timer(this.components);
            this.label5 = new System.Windows.Forms.Label();
            this.label6 = new System.Windows.Forms.Label();
            this.RunGraph = new System.Windows.Forms.Button();
            this.label7 = new System.Windows.Forms.Label();
            this.label8 = new System.Windows.Forms.Label();
            this.label9 = new System.Windows.Forms.Label();
            this.label10 = new System.Windows.Forms.Label();
            this.label11 = new System.Windows.Forms.Label();
            this.waitB = new System.Windows.Forms.TextBox();
            this.waitC = new System.Windows.Forms.TextBox();
            this.waitD = new System.Windows.Forms.TextBox();
            this.waitE = new System.Windows.Forms.TextBox();
            this.waitF = new System.Windows.Forms.TextBox();
            this.waitG = new System.Windows.Forms.TextBox();
            this.waitH = new System.Windows.Forms.TextBox();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.label1.ForeColor = System.Drawing.Color.Red;
            this.label1.Location = new System.Drawing.Point(766, 125);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(59, 13);
            this.label1.TabIndex = 0;
            this.label1.Text = "Thread А";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.label2.ForeColor = System.Drawing.Color.Orange;
            this.label2.Location = new System.Drawing.Point(705, 210);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(59, 13);
            this.label2.TabIndex = 1;
            this.label2.Text = "Thread В";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.label3.ForeColor = System.Drawing.Color.Green;
            this.label3.Location = new System.Drawing.Point(826, 210);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(60, 13);
            this.label3.TabIndex = 2;
            this.label3.Text = "Thread D";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.label4.ForeColor = System.Drawing.Color.Aquamarine;
            this.label4.Location = new System.Drawing.Point(707, 308);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(59, 13);
            this.label4.TabIndex = 3;
            this.label4.Text = "Thread E";
            // 
            // PaintBox
            // 
            this.PaintBox.Location = new System.Drawing.Point(333, 12);
            this.PaintBox.Name = "PaintBox";
            this.PaintBox.Size = new System.Drawing.Size(187, 23);
            this.PaintBox.TabIndex = 11;
            this.PaintBox.Text = "Colorize with threads";
            this.PaintBox.UseVisualStyleBackColor = true;
            this.PaintBox.Click += new System.EventHandler(this.PaintBox_Click);
            // 
            // MakeBox
            // 
            this.MakeBox.Location = new System.Drawing.Point(22, 12);
            this.MakeBox.Name = "MakeBox";
            this.MakeBox.Size = new System.Drawing.Size(187, 23);
            this.MakeBox.TabIndex = 12;
            this.MakeBox.Text = "Draw square";
            this.MakeBox.UseVisualStyleBackColor = true;
            this.MakeBox.Click += new System.EventHandler(this.MakeBox_Click);
            // 
            // ClearBox
            // 
            this.ClearBox.Location = new System.Drawing.Point(333, 42);
            this.ClearBox.Name = "ClearBox";
            this.ClearBox.Size = new System.Drawing.Size(187, 23);
            this.ClearBox.TabIndex = 13;
            this.ClearBox.Text = "Clear square";
            this.ClearBox.UseVisualStyleBackColor = true;
            this.ClearBox.Click += new System.EventHandler(this.ClearBox_Click);
            // 
            // timerGraph
            // 
            this.timerGraph.Interval = 10000;
            this.timerGraph.Tick += new System.EventHandler(this.timerGraph_Tick);
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(215, 47);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(22, 13);
            this.label5.TabIndex = 14;
            this.label5.Text = "     ";
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(526, 17);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(22, 13);
            this.label6.TabIndex = 15;
            this.label6.Text = "     ";
            // 
            // RunGraph
            // 
            this.RunGraph.Location = new System.Drawing.Point(22, 42);
            this.RunGraph.Name = "RunGraph";
            this.RunGraph.Size = new System.Drawing.Size(187, 23);
            this.RunGraph.TabIndex = 16;
            this.RunGraph.Text = "Run threads with graph";
            this.RunGraph.UseVisualStyleBackColor = true;
            this.RunGraph.Click += new System.EventHandler(this.RunGraph_Click);
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.label7.ForeColor = System.Drawing.Color.Yellow;
            this.label7.Location = new System.Drawing.Point(766, 210);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(59, 13);
            this.label7.TabIndex = 17;
            this.label7.Text = "Thread С";
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.label8.ForeColor = System.Drawing.Color.Violet;
            this.label8.Location = new System.Drawing.Point(741, 409);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(60, 13);
            this.label8.TabIndex = 18;
            this.label8.Text = "Thread H";
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.label9.ForeColor = System.Drawing.Color.Blue;
            this.label9.Location = new System.Drawing.Point(679, 409);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(60, 13);
            this.label9.TabIndex = 19;
            this.label9.Text = "Thread G";
            // 
            // label10
            // 
            this.label10.AutoSize = true;
            this.label10.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.label10.ForeColor = System.Drawing.Color.DarkCyan;
            this.label10.Location = new System.Drawing.Point(828, 308);
            this.label10.Name = "label10";
            this.label10.Size = new System.Drawing.Size(58, 13);
            this.label10.TabIndex = 20;
            this.label10.Text = "Thread F";
            // 
            // label11
            // 
            this.label11.AutoSize = true;
            this.label11.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.label11.ForeColor = System.Drawing.Color.Purple;
            this.label11.Location = new System.Drawing.Point(768, 501);
            this.label11.Name = "label11";
            this.label11.Size = new System.Drawing.Size(59, 13);
            this.label11.TabIndex = 21;
            this.label11.Text = "Thread K";
            // 
            // waitB
            // 
            this.waitB.Location = new System.Drawing.Point(706, 226);
            this.waitB.Name = "waitB";
            this.waitB.Size = new System.Drawing.Size(52, 20);
            this.waitB.TabIndex = 23;
            this.waitB.Text = "1";
            // 
            // waitC
            // 
            this.waitC.Location = new System.Drawing.Point(769, 226);
            this.waitC.Name = "waitC";
            this.waitC.Size = new System.Drawing.Size(52, 20);
            this.waitC.TabIndex = 24;
            this.waitC.Text = "1";
            // 
            // waitD
            // 
            this.waitD.Location = new System.Drawing.Point(831, 226);
            this.waitD.Name = "waitD";
            this.waitD.Size = new System.Drawing.Size(52, 20);
            this.waitD.TabIndex = 25;
            this.waitD.Text = "1";
            // 
            // waitE
            // 
            this.waitE.Location = new System.Drawing.Point(706, 324);
            this.waitE.Name = "waitE";
            this.waitE.Size = new System.Drawing.Size(52, 20);
            this.waitE.TabIndex = 26;
            this.waitE.Text = "1";
            // 
            // waitF
            // 
            this.waitF.Location = new System.Drawing.Point(831, 324);
            this.waitF.Name = "waitF";
            this.waitF.Size = new System.Drawing.Size(52, 20);
            this.waitF.TabIndex = 27;
            this.waitF.Text = "1";
            // 
            // waitG
            // 
            this.waitG.Location = new System.Drawing.Point(682, 425);
            this.waitG.Name = "waitG";
            this.waitG.Size = new System.Drawing.Size(52, 20);
            this.waitG.TabIndex = 28;
            this.waitG.Text = "1";
            // 
            // waitH
            // 
            this.waitH.Location = new System.Drawing.Point(745, 425);
            this.waitH.Name = "waitH";
            this.waitH.Size = new System.Drawing.Size(52, 20);
            this.waitH.TabIndex = 29;
            this.waitH.Text = "1";
            // 
            // SeeThreads
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1036, 625);
            this.Controls.Add(this.waitH);
            this.Controls.Add(this.waitG);
            this.Controls.Add(this.waitF);
            this.Controls.Add(this.waitE);
            this.Controls.Add(this.waitD);
            this.Controls.Add(this.waitC);
            this.Controls.Add(this.waitB);
            this.Controls.Add(this.label11);
            this.Controls.Add(this.label10);
            this.Controls.Add(this.label9);
            this.Controls.Add(this.label8);
            this.Controls.Add(this.label7);
            this.Controls.Add(this.RunGraph);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.ClearBox);
            this.Controls.Add(this.MakeBox);
            this.Controls.Add(this.PaintBox);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Name = "SeeThreads";
            this.Text = "Visualization of the work of threads";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Button PaintBox;
        private System.Windows.Forms.Button MakeBox;
        private System.Windows.Forms.Button ClearBox;
        private System.Windows.Forms.Timer timerGraph;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Button RunGraph;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.Label label9;
        private System.Windows.Forms.Label label10;
        private System.Windows.Forms.Label label11;
        private System.Windows.Forms.TextBox waitB;
        private System.Windows.Forms.TextBox waitC;
        private System.Windows.Forms.TextBox waitD;
        private System.Windows.Forms.TextBox waitE;
        private System.Windows.Forms.TextBox waitF;
        private System.Windows.Forms.TextBox waitG;
        private System.Windows.Forms.TextBox waitH;
    }
}

