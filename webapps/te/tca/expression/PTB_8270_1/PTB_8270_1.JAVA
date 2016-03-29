import java.io.File;
import java.io.FileWriter;
import java.util.Vector;

public class PTB_8270_1 {
		private static Vector tcasysoutputresult=null;
		private static Object sysoutput0=null;
		public PTB_8270_1 (double ALTIMAXSUBMIN,double I_DEF1OW_O ) {
if (  ALTIMAXSUBMIN>=400 && I_DEF1OW_O>=-31.000 ) {

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
						new PTB_8270_1(Double.parseDouble(args[2]),Double.parseDouble(args[3]));
						Vector v=PTB_8270_1.getTCASysOutputResult();
						f0.write("PTB_8270_1/@"+hddsn+"/&");
						for(int i=0;i<v.size();i++){
								f0.write(v.get(i).toString()+"/,");
						}
						f0.write(";\n");
				}catch(Exception e){
						f0.write("PTB_8270_1/@"+hddsn+"/&Error-"+e.getLocalizedMessage());
						f0.write(";\n");
				}
				f0.flush();
				f0.close();
		}catch(Exception e){
		}
	}
}
