using System.Threading;

namespace threads
{
    public abstract class TaskThread
    {
        protected Locker Locker { get; set; }
        protected Logger Logger { get; set; }
        public TaskThread[] NextTasks { get; set; }

        public TaskThread(Locker locker, Logger logger)
        {
            this.Locker = locker;
            this.Logger = logger;
            
            
        }

        /*
         * Main thread method
         */
        public void Run()
        {
            lock (Locker)
            {
                Locker.Counter++;
            }

            DoTask();

            lock (Locker)
            {
                Locker.Counter--;

                if (Locker.Counter == 0 && NextTasks != null)
                {
                    foreach (TaskThread task in NextTasks)
                    {
                        Thread t = new Thread(task.Run);
                        t.Start();
                    }
                }
            }
        }

        protected abstract void DoTask();
    }
}