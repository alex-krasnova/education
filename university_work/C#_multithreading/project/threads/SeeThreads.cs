using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Threading;

namespace threads
{
    public partial class SeeThreads : Form
    {
        public SeeThreads()
        {
            InitializeComponent();
            WaitB = Convert.ToInt16(this.waitB.Text);
            WaitC = Convert.ToInt16(this.waitC.Text);
            WaitD = Convert.ToInt16(this.waitD.Text);
            WaitE = Convert.ToInt16(this.waitE.Text);
            WaitF = Convert.ToInt16(this.waitF.Text);
            WaitG = Convert.ToInt16(this.waitG.Text);
            WaitH = Convert.ToInt16(this.waitH.Text);
        }

        #region Thread classes

        private class ThreadA : TaskThread
        {
            public ThreadA(Locker locker, Logger logger)
                : base(locker, logger)
            {
                
            }

            protected override void DoTask()
            {
                this.Logger.LogMessage("\n");
                this.Logger.LogMessage("\n------------------------------------------------------");
                this.Logger.LogMessage("Running a chain of threads\n");

                for (int i = start; i < 500; i++)
                {
                    start = i;
                    arr[i] = System.Drawing.Color.Red;
                    this.Logger.LogMessage("Thread A is writing to a cell " + i.ToString());
                }
            }
        }

        private class ThreadB : TaskThread
        {
            public ThreadB(Locker locker, Logger logger)
                : base(locker, logger)
            {
            }

            protected override void DoTask()
            {
                for (int i = start + 1; i < 1000; i++)
                {
                    //Artificial slowdown of the thread
                    for (int j = 1; j <= 1000000 * WaitB; j++)
                    {
                        stop = j;
                    }
                    start = i;
                    arr[i] = System.Drawing.Color.Orange;
                    this.Logger.LogMessage("Thread B is writing to a cell " + i.ToString());
                }
            }
        }

        private class ThreadC : TaskThread
        {
            public ThreadC(Locker locker, Logger logger)
                : base(locker, logger)
            {
            }

            protected override void DoTask()
            {
                for (int i = start + 1; i < 1000; i++)
                {
                    //Artificial slowdown of the thread
                    for (int j = 1; j <= 1000000 * WaitC; j++)
                    {
                        stop = j;
                    }
                    start = i;
                    arr[i] = System.Drawing.Color.Yellow;
                    this.Logger.LogMessage("Thread C is writing to a cell " + i.ToString());
                }
            }
        }

        private class ThreadD : TaskThread
        {
            public ThreadD(Locker locker, Logger logger)
                : base(locker, logger)
            {
            }

            protected override void DoTask()
            {
                for (int i = start + 1; i < 1000; i++)
                {
                    //Artificial slowdown of the thread
                    for (int j = 1; j <= 1000000 * WaitD; j++)
                    {
                        stop = j;
                    }
                    start = i;
                    arr[i] = System.Drawing.Color.Green;
                    this.Logger.LogMessage("Thread D is writing to a cell " + i.ToString());
                }
            }
        }

        private class ThreadE : TaskThread
        {
            public ThreadE(Locker locker, Logger logger)
                : base(locker, logger)
            {
            }

            protected override void DoTask()
            {
                for (int i = start + 1; i < 1500; i++)
                {
                    //Artificial slowdown of the thread
                    for (int j = 1; j <= 1000000 * WaitE; j++)
                    {
                        stop = j;
                    }
                    start = i;
                    arr[i] = System.Drawing.Color.Aquamarine;
                    this.Logger.LogMessage("Thread E is writing to a cell " + i.ToString());
                }
            }
        }

        private class ThreadF : TaskThread
        {
            public ThreadF(Locker locker, Logger logger)
                : base(locker, logger)
            {
            }

            protected override void DoTask()
            {
                int upper = 2000;
                if (Fcount == 0)
                {
                    upper = 1500;
                    Fcount = 1;
                }
                else
                    upper = 2000;

                for (int i = start + 1; i < upper; i++)
                {
                    //Artificial slowdown of the thread
                    for (int j = 1; j <= 1000000 * WaitF; j++)
                    {
                        stop = j;
                    }
                    start = i;
                    arr[i] = System.Drawing.Color.DarkCyan;
                    this.Logger.LogMessage("Thread F is writing to a cell " + i.ToString());
                }
            }
        }

        private class ThreadG : TaskThread
        {
            public ThreadG(Locker locker, Logger logger)
                : base(locker, logger)
            {
            }

            protected override void DoTask()
            {
                for (int i = start + 1; i < 2000; i++)
                {
                    //Artificial slowdown of the thread
                    for (int j = 1; j <= 1000000 * WaitG; j++)
                    {
                        stop = j;
                    }
                    start = i;
                    arr[i] = System.Drawing.Color.Blue;
                    this.Logger.LogMessage("Thread G is writing to a cell " + i.ToString());
                }
            }
        }

        private class ThreadH : TaskThread
        {
            public ThreadH(Locker locker, Logger logger)
                : base(locker, logger)
            {
            }

            protected override void DoTask()
            {
                for (int i = start + 1; i < 2000; i++)
                {
                    //Artificial slowdown of the thread
                    for (int j = 1; j <= 1000000 * WaitH; j++)
                    {
                        stop = j;
                    }
                    start = i;
                    arr[i] = System.Drawing.Color.Violet;
                    this.Logger.LogMessage("Thread H is writing to a cell " + i.ToString());
                }
            }
        }

        private class ThreadK : TaskThread
        {
            public ThreadK(Locker locker, Logger logger)
                : base(locker, logger)
            {
            }

            protected override void DoTask()
            {
                for (int i = start + 1; i < 2500; i++)
                {
                    start = i;
                    arr[i] = System.Drawing.Color.Purple;
                    this.Logger.LogMessage("Thread K is writing to a cell " + i.ToString());
                }
                stop = -1;
            }
        }

        #endregion

        private Locker Locker { get; set; }
        private Logger Logger { get; set; }
        private static int start = 0;
        private static int stop = 0;
        private static int Fcount = 0;
        private static System.Drawing.Color[] arr = new System.Drawing.Color[2500]; //This array is accessed by threads
        private static PictureBox[] arrPB = new PictureBox[2500];
        private static int WaitB, WaitC, WaitD, WaitE, WaitF, WaitG, WaitH;


        #region Accessing a form element from another thread
        delegate void ControlColorDelegate(System.Drawing.Color color, Control control);
        
        private void ControlColor(System.Drawing.Color color, Control control)
        {
            if (InvokeRequired)
            {
                BeginInvoke(new ControlColorDelegate(ControlColor), new object[] {color, control});
                return;
            }
            else
            {
                control.BackColor = color;
            }
        }

        #endregion

        //Coloring
        private void PaintBox_Click(object sender, EventArgs e)
        {
            this.Cursor = Cursors.WaitCursor;      
            for (int i = 0; i < 2500; i++)
            {
                ((PictureBox)this.Controls.Find("pb"+i.ToString(), true)[0]).BackColor = arr[i];
                
            }
            this.Cursor = Cursors.Default;
        }

        //Creation of squares
        private void MakeBox_Click(object sender, EventArgs e)
        {
            try
            {
                this.Cursor = Cursors.WaitCursor;
                for (int i = 0; i < 2500; i++)
                {

                    PictureBox pb = new PictureBox();
                    pb.Size = new System.Drawing.Size(10, 10);
                    pb.Location = new Point(20 + (i % 50) * 10, 80 + (i / 50) * 10);
                    pb.Name = "pb" + i.ToString();
                    pb.BackColor = System.Drawing.Color.White;
                    this.Controls.Add(pb);
                    arr[i] = Color.White;

                }
                this.MakeBox.Enabled = false;
                this.Cursor = Cursors.Default;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        //Checking for process termination
        private void timerGraph_Tick(object sender, EventArgs e)
        {
            if (stop == -1)
            {
                timerGraph.Stop();
                label5.Text = "";
            }
            
                
        }

        //Starting processes
        private void RunGraph_Click(object sender, EventArgs e)
        {
            try
            {
                label5.Text = "Process started...";
                timerGraph.Start();
                Locker = new Locker();
                Logger = new Logger("ThreadLog");

                // thread initialization
                ThreadA threadA = new ThreadA(Locker, Logger);
                ThreadB threadB = new ThreadB(Locker, Logger);
                ThreadC threadC = new ThreadC(Locker, Logger);
                ThreadD threadD = new ThreadD(Locker, Logger);
                ThreadE threadE = new ThreadE(Locker, Logger);
                ThreadF threadF = new ThreadF(Locker, Logger);
                ThreadG threadG = new ThreadG(Locker, Logger);
                ThreadH threadH = new ThreadH(Locker, Logger);
                ThreadK threadK = new ThreadK(Locker, Logger);

                // connect them in a graph
                threadA.NextTasks = new TaskThread[] { threadB, threadC, threadD };
                threadB.NextTasks = new TaskThread[] { threadE, threadF };
                threadC.NextTasks = new TaskThread[] { threadE, threadF };
                threadD.NextTasks = new TaskThread[] { threadE, threadF };
                threadE.NextTasks = new TaskThread[] { threadG, threadH };
                threadF.NextTasks = new TaskThread[] { threadG, threadH, threadF };
                threadG.NextTasks = new TaskThread[] { threadK };
                threadH.NextTasks = new TaskThread[] { threadK };

                // starting threads
                new Thread(threadA.Run).Start();

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        //Clearing the square
        private void ClearBox_Click(object sender, EventArgs e)
        {
            this.Cursor = Cursors.WaitCursor;
            for (int i = 0; i < 2500; i++)
            {
                ((PictureBox)this.Controls.Find("pb" + i.ToString(), true)[0]).BackColor = Color.White;
                arr[i] = Color.White;
            }
            start = 0; stop = 0; Fcount = 0;
            this.Cursor = Cursors.Default;
        }

         

    }
}
