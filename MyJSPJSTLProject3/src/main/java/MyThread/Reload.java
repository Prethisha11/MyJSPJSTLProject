package MyThread;

import mydata.GetData;

public class Reload implements Runnable  {
	
	GetData d;
	public Reload(GetData d)
	{
		this.d=d;
	}
	
	public void run()
	{
		synchronized(d)
		{
			d.returnResultSet();
		}
	}
	
	
}