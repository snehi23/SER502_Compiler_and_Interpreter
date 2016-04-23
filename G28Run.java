import java.io.*;

import static java.lang.System.*;

import java.util.*;



public class G28Run {
	public static char[] temp = new char[400];
	public static int tokenlength = 1;
	public static String code = "";
	public static String[] alltokens;
	public static String[] alloperations;
	public static String[] allvalues;
	public static Deque<Double> valuereturnfromfunction = new ArrayDeque<Double>();
	public static Deque<String> currentfunction = new ArrayDeque<String>();
	public static HashMap<String, Double> functionreturn= new HashMap<String,Double>();
	public static HashMap<String, Double> hashmapglobalvalues = new HashMap<String, Double>();
	public static HashMap<String, Boolean> booleanhashmapglobalvalues = new HashMap<String, Boolean>();
	public static HashMap<String, Stack<Integer>> stackhashmapglobalvalues = new HashMap<String, Stack<Integer>>();
	public static HashMap<String, Deque<Integer>> functions= new HashMap<String,Deque<Integer>>();
	public static Deque<Integer> functionstack = new ArrayDeque<Integer>();

	
	public static void main(String[] args) throws IOException {
	
		int n = 0 ;
		int m = 0;
		
	try{
		FileInputStream bytecode = new FileInputStream(args[0]);
		int r = bytecode.read();
		char c = (char)r;
		temp[0]= c;
		
	
		while(((r = bytecode.read()) != -1))
			{			
			c = (char)r;
			temp[tokenlength]= c;
			tokenlength += 1;
			}
		
		code = String.valueOf(temp);
		code = code.substring(0,tokenlength-1);
		alltokens = code.split("\\s+");
		alloperations = new String[tokenlength];
		allvalues  = new String[tokenlength];
		
		
			while(!alltokens[n].equals("end"))

			{ 
				if ((alltokens[n].equals("eql")) ||(alltokens[n].equals("les")) ||(alltokens[n].equals("rtn")) ||(alltokens[n].equals("cal")) ||(alltokens[n].equals("eof")) ||(alltokens[n].equals("fun")) ||(alltokens[n].equals("add")) ||(alltokens[n].equals("add")) ||(alltokens[n].equals("sub")) ||(alltokens[n].equals("pro")) ||(alltokens[n].equals("div")) ||(alltokens[n].equals("sto")) || (alltokens[n].equals("lod"))|| (alltokens[n].equals("fjp")) || (alltokens[n].equals("tjp"))|| (alltokens[n].equals("prt"))|| (alltokens[n].equals("grt"))|| (alltokens[n].equals("rdv"))||(alltokens[n].equals("stack"))||(alltokens[n].equals("push"))||(alltokens[n].equals("pop"))||(alltokens[n].equals("peek"))||(alltokens[n].equals("not")))
				{alloperations[m]= alltokens[n];
				m += 1;}
				else {allvalues[m-1]= alltokens[n];

				      //j += 1;
				}
								
				n += 1;
			}
			
			alloperations[m]=alltokens[n];
			alloperations = Arrays.copyOf(alloperations,m+1);
			allvalues = Arrays.copyOf(allvalues,m+1);
	}catch (IOException e){
		out.println("ERROR1");
	}
		
		function(0,m+1);
		
	}
	
	@SuppressWarnings("null")
	public static void function(int a, int b){
		
				Deque<Double> stack = new ArrayDeque<Double>();
				Deque<Boolean> booleanstack = new ArrayDeque<Boolean>();
				Deque<Stack<Integer>> superstack = new ArrayDeque<Stack<Integer>>();
				
		
				HashMap<String, Double> hashmapvalues = new HashMap<String, Double>();
				HashMap<String, Boolean> booleanhashmapvalues = new HashMap<String, Boolean>();
				HashMap<String, Stack<Integer>>  stackhashmapvalues = new HashMap<String, Stack<Integer>>();
		
			
				String[] operations = Arrays.copyOfRange(alloperations,a,b );
				String[] values = Arrays.copyOfRange(allvalues,a,b );
				
				//out.println(Arrays.toString(operations));
				//out.println(Arrays.toString(values));
				
				for ( int i=0; i<b-a;i++){
					//out.print(i);out.println(operations[i]);
					if (operations[i].equals("rdv"))
					
					{   Scanner sc = new Scanner(System.in);
						out.println("Enter Value");
						double input = sc.nextDouble();
						
						stack.push(input);}
					
					if ((operations[i].equals("sto")&&((stack.isEmpty()==false)||(booleanstack.isEmpty()==false))))
					
					{   
						//out.println("Store Value "+stack.peek()+" to variable "+values[i]);
						if((currentfunction.isEmpty())&&(stack.peek()!=null)){
							hashmapglobalvalues.put(values[i], stack.pop());
						}else if ((currentfunction.isEmpty())&&(booleanstack.peek()!=null)){
							booleanhashmapglobalvalues.put(values[i], booleanstack.pop());
						}else if ((!currentfunction.isEmpty())&&(booleanstack.peek()!=null)){
							booleanhashmapvalues.put(values[i], booleanstack.pop());
						}else if(hashmapglobalvalues.get(values[i])!=null){
							hashmapglobalvalues.put(values[i],stack.pop());
						}
						else{
							hashmapvalues.put(values[i],stack.pop());
						}
					}
						
					if (operations[i].equals("stack")){
						if(currentfunction.isEmpty()){
							stackhashmapglobalvalues.put(values[i], new Stack<Integer>());
						}
						else{
							stackhashmapvalues.put(values[i],new Stack<Integer>());
						}
					}
					
					if(operations[i].equals("push")){
						if((currentfunction.isEmpty())&&(stack.peek()!=null)){
							Stack<Integer> st = stackhashmapglobalvalues.get(values[i]);
							st.push(stack.pop().intValue());
							stackhashmapglobalvalues.put(values[i], st);
						}
						else{
							Stack<Integer> st = stackhashmapvalues.get(values[i]);
							st.push(stack.pop().intValue());
							stackhashmapvalues.put(values[i],st);
						}
						
					}
					
					if(operations[i].equals("pop")){
						if(currentfunction.isEmpty()){
							Stack<Integer> st = stackhashmapglobalvalues.get(values[i]);
							int value = st.pop();
							stack.push((double) value);
						}
						else{
							Stack<Integer> st = stackhashmapvalues.get(values[i]);
							int value = st.pop();
							stack.push((double) value);
						}
						
					}
					
					if(operations[i].equals("peek")){
						if(currentfunction.isEmpty()){
							Stack<Integer> st = stackhashmapglobalvalues.get(values[i]);
							int value = st.peek();
							stack.push((double) value);
						}
						else{
							Stack<Integer> st = stackhashmapvalues.get(values[i]);
							int value = st.peek();
							stack.push((double) value);
						}
						
					}
					
					if (operations[i].equals("lod"))
						
					{   
						boolean doubleornot = true;
						try{ Double.parseDouble(values[i]); }
						catch(NumberFormatException e) {
							doubleornot = false;
						}
						
						if(doubleornot==false){
							//out.println("Lode Variable "+values[i]+" from hashmap to stack");
							if(hashmapglobalvalues.get(values[i])!=null){
								stack.push(hashmapglobalvalues.get(values[i]));
							}else if(hashmapvalues.get(values[i])!=null){
								stack.push(hashmapvalues.get(values[i]));
							}
//							else if(hashmapglobalvalues.get(values[i])!=null){
//								stack.push(hashmapglobalvalues.get(values[i]));
							else if (functions.get(values[i])!=null){
								int temporary = functions.get(values[i]).peek();
								functionstack.push(functions.get(values[i]).pop());
								functionstack.push(functions.get(values[i]).peek());
								functions.get(values[i]).push(temporary);
							}else if (booleanhashmapvalues.get(values[i])!=null){
								booleanstack.push(booleanhashmapvalues.get(values[i]));
							}else if (values[i].equals("true")){
								booleanstack.push(true);
							}else if (values[i].equals("false")){
								booleanstack.push(false);
							}else if ((booleanhashmapglobalvalues.get(values[i])!=null)){
								booleanstack.push(booleanhashmapglobalvalues.get(values[i]));
							} else if(stackhashmapglobalvalues.get(values[i])!=null){
								superstack.push(stackhashmapglobalvalues.get(values[i]));	
							}else if(stackhashmapvalues.get(values[i])!=null){
								superstack.push(stackhashmapvalues.get(values[i]));
							}
							else{
								out.println("Error on load!");
							}
						}
						
						if(doubleornot==true){
							//out.println("Lode Value "+values[i] +" to stack");
							stack.push(Double.parseDouble(values[i]));
						}
											
					}
					
		
					
					if ((operations[i].equals("fun"))&&(stack.isEmpty()==true)){
						int first = i;
						while(!operations[++i].equals("eof"));
						Deque<Integer> startandend = new ArrayDeque<Integer>();
						startandend.push(i);
						startandend.push(first+1);
						functions.put(values[first],startandend);
					}
					
					if ((operations[i].equals("rtn"))&&(stack.isEmpty()==true)){
						boolean doubleornot = true;
						try{ Double.parseDouble(values[i]); }
						catch(NumberFormatException e) {
							doubleornot = false;
						}
						
						if(doubleornot==false){
							//out.println("Lode Variable "+values[i]+" from hashmap to stack");
							if(hashmapvalues.get(values[i])!=null){
								functionreturn.put(currentfunction.peek(), hashmapvalues.get(values[i]));
							}
						}
						
						if(doubleornot==true){
							functionreturn.put(currentfunction.peek(), Double.parseDouble(values[i]));
						}
					}
					
					if ((operations[i].equals("cal"))&&(values[i]==null)){
						int right=functionstack.pop();
						int left=functionstack.pop();
						if (left<right-1){
							currentfunction.push(allvalues[left-1]);
							function(left,right);
							currentfunction.pop();}
						if (functionreturn.get(values[i-1])!=null){
							valuereturnfromfunction.push(functionreturn.get(values[i-1]));
						}
					}
					
					if ((operations[i].equals("add"))&&(stack.isEmpty()==false)){
						double right=stack.pop();
						double left=stack.pop();
						stack.push(left+right);
					}
					
					if ((operations[i].equals("sub"))&&(stack.isEmpty()==false)){
						double right=stack.pop();
						double left=stack.pop();
						stack.push(left-right);
						//out.println("the subtraction of "+left+" - "+right+" is "+stack.peek());
					}
					
					if ((operations[i].equals("pro"))&&(stack.isEmpty()==false)){
						double right=stack.pop();
						double left=stack.pop();
						stack.push(left*right);
					}
					
					if ((operations[i].equals("div"))&&(stack.isEmpty()==false)){
						double right=stack.pop();
						double left=stack.pop();
						stack.push(left/right);
					}
					
					if ((operations[i].equals("grt"))&&(stack.isEmpty()==false)){
						double right=stack.pop();
						double left=stack.pop();
						if (left>right){
							stack.push(1.0);
							//out.println("grt");
						}else{
							stack.push(0.0);
							//out.println("not grt");
						}
					}
					
					if ((operations[i].equals("les"))&&(stack.isEmpty()==false)){
						double right=stack.pop();
						double left=stack.pop();
						if (left<right){
							stack.push(1.0);
							//out.println("grt");
						}else{
							stack.push(0.0);
							//out.println("not grt");
						}
					}
					if ((operations[i].equals("eql"))&&(stack.isEmpty()==false)){
						double right=stack.pop();
						double left=stack.pop();
						if (left==right){
							stack.push(1.0);
							//out.println("grt");
						}else{
							stack.push(0.0);
							//out.println("not grt");
						}
					}
					if ((operations[i].equals("eql"))&&(booleanstack.isEmpty()==false)){
						Boolean right = booleanstack.pop();
						Boolean left  = booleanstack.pop();
						if (left==right){
							stack.push(1.0);
							//out.println("grt");
						}else{
							stack.push(0.0);
							//out.println("not grt");
						}
					}
<<<<<<< Updated upstream

					if ((operations[i].equals("and"))&&(booleanstack.isEmpty()==false)){
						Boolean right = booleanstack.pop();
						Boolean left  = booleanstack.pop();
						if (left && right){
							booleanstack.push(true);
						}else{
							booleanstack.push(false);
						}
					}

					if ((operations[i].equals("or"))&&(booleanstack.isEmpty()==false)){
						Boolean right = booleanstack.pop();
						Boolean left  = booleanstack.pop();
						if (left || right){
							booleanstack.push(true);
						}else{
							booleanstack.push(false);
						}
					}

					if ((operations[i].equals("not"))&&(booleanstack.isEmpty()==false)){
						Boolean value = booleanstack.pop();
						booleanhashmapglobalvalues.put(values[i-1], !value);
						if (!value){
							booleanstack.push(true);
						}else{
							booleanstack.push(false);
						}
					}

=======
>>>>>>> Stashed changes
					if ((operations[i].equals("fjp"))&&(stack.isEmpty()==false)){
						if((stack.peek()==0.0)&&(currentfunction.isEmpty())){
							i = Integer.parseInt(values[i])-1;
							//out.println("false and jump to line "+i);
							stack.pop();
						}else if((stack.peek()==0.0)&&(!currentfunction.isEmpty())){
							i = Integer.parseInt(values[i])-a;
							stack.pop();
							if(i>b-a-1){
								i=b-a-1;
							}
						}else{
							stack.pop();
						}
					}
					if ((operations[i].equals("tjp"))&&(stack.isEmpty()==false)){
						if(stack.peek()==1.0){
							i = Integer.parseInt(values[i])-1;
							//out.println("true and jump to line "+i);
							stack.pop();
						}
					}
					if (operations[i].equals("prt")){
						//out.println("Print Value "+ stack.peek()+ " from stack");
						if(stack.isEmpty()==false){
							out.println(stack.pop());
						}else if(booleanstack.isEmpty()==false){
							out.println(booleanstack.pop());}
						else if(superstack.isEmpty()==false){
							out.println(superstack.pop().toString());}
					}
				}	
			
		
	}
	

}