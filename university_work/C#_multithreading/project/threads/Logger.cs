using System;
using System.IO;
using System.Text;

namespace threads
{
    public class Logger
    {
        private object fileLock { get; set; }
        private string logFileName { get; set; }

        //Constructor
        public Logger(string logFileName)
        {
            this.logFileName = logFileName;

            this.fileLock = new object();
        }

        //File write method
        public void LogMessage(string message)
        {
            lock (fileLock)
            {
                // create full filename
                string s = string.Empty;

                // set the full path - the logs will be added next to the *.exe file
                try
                {
                    s = AppDomain.CurrentDomain.BaseDirectory + logFileName + ".log";
                }
                catch (Exception ex)
                {
                    // if an error occurred in block try, then the path for folding the logs is taken from the directory from the environment
                    s = logFileName + ".log";
                }

                StreamWriter fs;

                // check for file existence
                if (!File.Exists(s))
                    File.Create(s);

                // open
                fs = new StreamWriter(s, true);
                
                // write
                if (fs != null)
                {
                    // write data to the file
                    fs.WriteLine(DateTime.Now.ToString() + "  " + message + "\n");
                    // close
                    fs.Close();
                }
            }
        }
    }
}
