import java.io.File;
import java.io.FileWriter;
import java.util.Vector;

public class FLB_8090 {
		private static Vector tcasysoutputresult=null;
		private static Object sysoutput0=null;
		public FLB_8090 (double DELTA ) {
if (  DELTA > 12.0 ) {sysoutput0 = "Fail";}else{sysoutput0 = "Pass";}

		this.addresult();
		}
		private static void addresult(){
		tcasysoutputresult=new Vector();
		tcasysoutputresult.add("0/:"+sysoutput0);
		}
		public static Vector getTCASysOutputResult() {
				return tcasysoutputresult;
		}
		public static void main(String[] args) {
				try{
						String exppath=args[0];
						String hddsn=args[1];
						File file = new File(exppath);
						FileWriter f0 = new FileWriter(file, true);
						try{
						new FLB_8090(Double.parseDouble(args[2]));
						Vector v=FLB_8090.getTCASysOutputResult();
						f0.write("FLB_8090/@"+hddsn+"/&");
						for(int i=0;i<v.size();i++){
								f0.write(v.get(i).toString()+"/,");
						}
						f0.write(";\n");
				}catch(Exception e){
						f0.write("FLB_8090/@"+hddsn+"/&Error-"+e.getLocalizedMessage());
						f0.write(";\n");
				}
				f0.flush();
				f0.close();
		}catch(Exception e){
		}
	}
}
