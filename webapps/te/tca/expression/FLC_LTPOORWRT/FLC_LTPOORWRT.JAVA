import java.io.File;
import java.io.FileWriter;
import java.util.Vector;

public class FLC_LTPOORWRT {
		private static Vector tcasysoutputresult=null;
		private static Object sysoutput0=null;
		public FLC_LTPOORWRT (double DELTAGMR3,double ERPD_AVE,double ERPD_STDEV,double KG_DELTA,double MCW,double OW_FUN,double SERBPIM4 ) {
if (  (SERBPIM4 < 4.3 && OW_FUN > -26.0 && MCW < 0.103 && DELTAGMR3 > 5.0 && KG_DELTA > 1000) || (SERBPIM4 < 4.3 && OW_FUN > -26.0 && MCW < 0.103 && ERPD_AVE > 7.0 && ERPD_STDEV > 30.0 ) ) {

sysoutput0 = "Fail";
}

else {
sysoutput0 = "Pass";
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
						new FLC_LTPOORWRT(Double.parseDouble(args[2]),Double.parseDouble(args[3]),Double.parseDouble(args[4]),Double.parseDouble(args[5]),Double.parseDouble(args[6]),Double.parseDouble(args[7]),Double.parseDouble(args[8]));
						Vector v=FLC_LTPOORWRT.getTCASysOutputResult();
						f0.write("FLC_LTPOORWRT/@"+hddsn+"/&");
						for(int i=0;i<v.size();i++){
								f0.write(v.get(i).toString()+"/,");
						}
						f0.write(";\n");
				}catch(Exception e){
						f0.write("FLC_LTPOORWRT/@"+hddsn+"/&Error-"+e.getLocalizedMessage());
						f0.write(";\n");
				}
				f0.flush();
				f0.close();
		}catch(Exception e){
		}
	}
}
