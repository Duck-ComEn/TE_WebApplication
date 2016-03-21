import java.io.File;
import java.io.FileWriter;
import java.util.Vector;

public class COMMON_4530 {
		private static Vector tcasysoutputresult=null;
		private static Object sysoutput0=null;
		public COMMON_4530 (double OW_ID,double OW_MCW,double OW_OD,double OW_SER ) {
if ( ( OW_ID >=-21.5   ||  OW_OD >=-21.5 )   &&  OW_SER>=-5.2  &&  OW_MCW <=0.1100 ) {

sysoutput0="FAIL";

}else{

sysoutput0="PASS";

}

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
						new COMMON_4530(Double.parseDouble(args[2]),Double.parseDouble(args[3]),Double.parseDouble(args[4]),Double.parseDouble(args[5]));
						Vector v=COMMON_4530.getTCASysOutputResult();
						f0.write("COMMON_4530/@"+hddsn+"/&");
						for(int i=0;i<v.size();i++){
								f0.write(v.get(i).toString()+"/,");
						}
						f0.write(";\n");
				}catch(Exception e){
						f0.write("COMMON_4530/@"+hddsn+"/&Error-"+e.getLocalizedMessage());
						f0.write(";\n");
				}
				f0.flush();
				f0.close();
		}catch(Exception e){
		}
	}
}
