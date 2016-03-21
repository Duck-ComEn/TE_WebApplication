import java.io.File;
import java.io.FileWriter;
import java.util.Vector;

public class FLB_88F2 {
		private static Vector tcasysoutputresult=null;
		private static Object sysoutput0=null;
		public FLB_88F2 (double DELTA_SER_OD_ZONE,double DELTA_SER_SRST,double FIN_WORST_SER,double FUN_OW ) {
boolean pf_flag1 = false ;
boolean pf_flag2 = false ;

if ( (DELTA_SER_OD_ZONE > 0.45 && DELTA_SER_SRST > 0.00)  || (DELTA_SER_OD_ZONE <= 0.45 && DELTA_SER_SRST > 0.30 )) {

pf_flag1 = true;

}

if (( FUN_OW > -31.0  && FIN_WORST_SER > -5.0)  || (FUN_OW > -26.0 && FIN_WORST_SER > -5.50) ) {

pf_flag2 = true;

}


if(pf_flag1 == true && pf_flag2 == true){ 

sysoutput0 = "Fail!!!!";

}else{

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
						new FLB_88F2(Double.parseDouble(args[2]),Double.parseDouble(args[3]),Double.parseDouble(args[4]),Double.parseDouble(args[5]));
						Vector v=FLB_88F2.getTCASysOutputResult();
						f0.write("FLB_88F2/@"+hddsn+"/&");
						for(int i=0;i<v.size();i++){
								f0.write(v.get(i).toString()+"/,");
						}
						f0.write(";\n");
				}catch(Exception e){
						f0.write("FLB_88F2/@"+hddsn+"/&Error-"+e.getLocalizedMessage());
						f0.write(";\n");
				}
				f0.flush();
				f0.close();
		}catch(Exception e){
		}
	}
}
