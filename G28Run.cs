using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace G28Run
{
    class Program
    {
        #region Declarations
        public static List<char> temp = new List<char>();
        public static int tokenLength = 1;
        public static string code = string.Empty;
        public static string[] allTokens;
        public static string[] allOperations;
        public static string[] allValues;
        public static Stack<int> valueReturnFromFunction = new Stack<int>();
        public static Stack<string> currentFunction = new Stack<string>();
        public static Dictionary<string, int> functionReturn = new Dictionary<string, int>();
        public static Dictionary<string, int> intHashMapGlobalValues = new Dictionary<string, int>();
        public static Dictionary<string, bool> booleanHashmapGlobalValues = new Dictionary<string, bool>();
        public static Dictionary<string, Stack<int>> stackHashmapGlobalValues = new Dictionary<string, Stack<int>>();
        public static Dictionary<string, Stack<int>> functions = new Dictionary<string, Stack<int>>();
        public static Stack<int> functionStack = new Stack<int>();
        public static List<string> OpCodes = new List<string>();

        #endregion

        static void Main(string[] args)
        {
            
            if(string.IsNullOrEmpty(args[0]))
            {
                Console.WriteLine("Please input file name");
                return;
            }
            
            string fileName = args[0];
            string line = string.Empty;
            StringBuilder code = new StringBuilder();

            try
            {
                using (StreamReader file = new StreamReader(fileName))
                {
                    while((line = file.ReadLine()) != null)
                    {
                        code.Append(line + " ");
                    }
                }
                // allTokens = code.ToString().Split(' ').ToList();
                allTokens = Regex.Split(code.ToString(),@"\s+");
                allOperations = new string[allTokens.Length];
                allValues = new string[allTokens.Length];

                InitializeOpcodes();

                SeparateOperationsAndTokens();

                RunTime(0, allValues.Length);

                Console.ReadLine();
            }
            catch(Exception ex)
            {
                Console.WriteLine("Error found " + ex.Message);
            }
        }

        public static void RunTime(int start, int end)
        {
            // Declarations
            Stack<int> intstack = new Stack<int>();
            Stack<bool> boolStack = new Stack<bool>();
            Stack<Stack<int>> superStack = new Stack<Stack<int>>();

            Dictionary<string, int> intHashMap = new Dictionary<string, int>();
            Dictionary<string, bool> boolHashMap = new Dictionary<string, bool>();
            Dictionary<string, Stack<int>> stackHashMap = new Dictionary<string, Stack<int>>();

            string opCode, operand;
            string[] operations = new string[(end - start)];
            string[] values = new string[(end - start)];

            Array.Copy(allOperations, start, operations, 0, (end - start));
            Array.Copy(allValues, start, values, 0, (end - start));

            for(int i = 0; i < end - start; i++)
            {
                opCode = operations[i];
                operand = values[i];

                if (opCode.Equals("fth"))
                {
                    Console.WriteLine("Enter the value: ");
                    int input = Int32.Parse(Console.ReadLine());
                    intstack.Push(input);
                }

                if(opCode.Equals("put") && ((intstack.Count > 0) || (boolStack.Count > 0)))
                {
                    if(currentFunction.Count == 0 && intstack.Count > 0)
                    {
                        intHashMapGlobalValues[operand] = intstack.Pop();
                    }
                    else if(currentFunction.Count == 0 && boolStack.Count > 0)
                    {
                        booleanHashmapGlobalValues[operand] = boolStack.Pop();
                    }
                    else if(currentFunction.Count > 0 && boolStack.Count > 0)
                    {
                        booleanHashmapGlobalValues[operand] = boolStack.Pop();
                    }
                    else if(intHashMapGlobalValues.ContainsKey(operand))
                    {
                        intHashMapGlobalValues[operand] = intstack.Pop();
                    }
                    else
                    {
                        intHashMap[operand] = intstack.Pop();
                    }
                }

                if(opCode.Equals("stk"))
                {
                    if(currentFunction.Count == 0)
                    {
                        stackHashmapGlobalValues[operand] = new Stack<int>();
                    }
                    else
                    {
                        stackHashMap[operand] = new Stack<int>();
                    }
                }

                if(opCode.Equals("psh"))
                {
                    if(currentFunction.Count == 0 && intstack.Count > 0)
                    {
                        Stack<int> st = stackHashmapGlobalValues[operand];
                        st.Push(intstack.Pop());
                        stackHashmapGlobalValues[operand] = st;
                    }
                    else
                    {
                        Stack<int> st = stackHashMap[operand];
                        st.Push(intstack.Pop());
                        stackHashMap[operand] = st;
                    }
                }

                if(opCode.Equals("pop"))
                {
                    if (currentFunction.Count == 0)
                    {
                        Stack<int> st = stackHashmapGlobalValues[operand];
                        intstack.Push(st.Pop());
                    }
                    else
                    {
                        Stack<int> st = stackHashMap[operand];
                        intstack.Push(st.Pop());
                    }
                }


                if (opCode.Equals("pek"))
                {
                    if (currentFunction.Count == 0)
                    {
                        Stack<int> st = stackHashmapGlobalValues[operand];
                        intstack.Push(st.Peek());
                    }
                    else
                    {
                        Stack<int> st = stackHashMap[operand];
                        intstack.Push(st.Peek());
                    }
                }

                if (opCode.Equals("get"))
                {
                    bool isInteger = CheckIsInteger(operand);
                    if(!isInteger)
                    {
                        if(intHashMapGlobalValues.ContainsKey(operand))
                        {
                            intstack.Push(intHashMapGlobalValues[operand]);
                        }
                        else if(intHashMap.ContainsKey(operand))
                        {
                            intstack.Push(intHashMap[operand]);
                        }
                        else if(functions.ContainsKey(operand))
                        {
                            int temp = functions[operand].Peek();
                            functionStack.Push(functions[operand].Pop());
                            functionStack.Push(functions[operand].Peek());
                            functions[operand].Push(temp);
                        }
                        else if(boolHashMap.ContainsKey(operand))
                        {
                            boolStack.Push(boolHashMap[operand]);
                        }
                        else if(operand.Equals("true"))
                        {
                            boolStack.Push(true);
                        }
                        else if(operand.Equals("false"))
                        {
                            boolStack.Push(false);
                        }
                        else if(booleanHashmapGlobalValues.ContainsKey(operand))
                        {
                            boolStack.Push(booleanHashmapGlobalValues[operand]);
                        }
                        else if(stackHashmapGlobalValues.ContainsKey(operand))
                        {
                            superStack.Push(stackHashmapGlobalValues[operand]);
                        }
                        else if(stackHashMap.ContainsKey(operand))
                        {
                            superStack.Push(stackHashMap[operand]);
                        }
                        else
                        {
                            Console.WriteLine("Error on load");
                        }
                    }
                    else
                    {
                        intstack.Push(Int32.Parse(operand));
                    }
                }

                if(opCode.Equals("fun") && intstack.Count == 0)
                {
                    int temp = i;
                    while(!operations[++i].Equals("fnd"))
                    {
                       ;
                    }
                    Stack<int> startAndEnd = new Stack<int>();
                    startAndEnd.Push(i);
                    startAndEnd.Push(temp + 1);
                    functions.Add(operand, startAndEnd);
                }

                if(opCode.Equals("jbk") && intstack.Count == 0)
                {
                    bool isInteger = CheckIsInteger(operand);
                    if(!isInteger)
                    {
                        if(intHashMap.ContainsKey(operand))
                        {
                            functionReturn.Add(currentFunction.Peek(), intHashMap[operand]);
                        }
                    }
                    else
                    {
                        functionReturn.Add(currentFunction.Peek(), Int32.Parse(operand));
                    }
                }

                if(opCode.Equals("run") && (operand == null || operand == string.Empty))
                {
                    int right = functionStack.Pop();
                    int left = functionStack.Pop();
                    if(left < right)
                    {
                        currentFunction.Push(allValues[left-1]);
                        RunTime(left, right);
                        currentFunction.Pop();
                    }
                    if(functionReturn.ContainsKey(values[i - 1]))
                    {
                        valueReturnFromFunction.Push(functionReturn[values[i - 1]]);
                    }
                }


                if((intstack.Count > 0) && (opCode.Equals("add") || opCode.Equals("sub") || opCode.Equals("mul") || opCode.Equals("div") ||
                    opCode.Equals("grt") || opCode.Equals("lst") || opCode.Equals("asn")))
                {
                    int right = intstack.Pop();
                    int left = intstack.Pop();

                    switch(opCode)
                    {
                        case "add": intstack.Push(left + right); break;
                        case "sub": intstack.Push(left - right); break;
                        case "mul": intstack.Push(left * right); break;
                        case "div": intstack.Push(left / right); break;
                        case "grt":
                                    if(left > right)
                                    {
                                        intstack.Push(1);
                                    }
                                    else
                                    {
                                        intstack.Push(0);
                                    }
                                    break;
                        case "lst":
                                    if (left < right)
                                    {
                                        intstack.Push(1);
                                    }
                                    else
                                    {
                                        intstack.Push(0);
                                    }
                                    break;

                        case "asn":
                                    if (left == right)
                                    {
                                        intstack.Push(1);
                                    }
                                    else
                                    {
                                        intstack.Push(0);
                                    }
                                    break;
                    }
                }

                if ((boolStack.Count > 0) && (opCode.Equals("asn") || opCode.Equals("and") || opCode.Equals("or")))
                {
                    bool right = boolStack.Pop();
                    bool left = boolStack.Pop();

                    switch (opCode)
                    {
                        case "asn":
                            if (left == right)
                            {
                                boolStack.Push(true);
                            }
                            else
                            {
                                boolStack.Push(false);
                            }
                            break;

                        case "and":
                            if (left && right)
                            {
                                boolStack.Push(true);
                            }
                            else
                            {
                                boolStack.Push(false);
                            }
                            break;
                        case "or":
                            if (left || right)
                            {
                                boolStack.Push(true);
                            }
                            else
                            {
                                boolStack.Push(false);
                            }
                            break;
                    }
                }

                if(boolStack.Count > 0 && opCode.Equals("not"))
                {
                    bool value = boolStack.Pop();
                    if (!value)
                    {
                        boolStack.Push(true);
                    }
                    else
                    {
                        boolStack.Push(false);
                    }
                    break;
                }

                if(opCode.Equals("bne") && intstack.Count > 0)
                {
                    if(intstack.Peek() == 0)
                    {
                        if (currentFunction.Count == 0)
                        {
                            i = Int32.Parse(values[i]) - 1;
                            intstack.Pop();
                        }
                        else
                        {
                            i = Int32.Parse(values[i]) - start;
                            intstack.Pop();
                            if(i > end - start - 1)
                            {
                                i = end - start - 1;
                            }
                        }
                    }
                    else
                    {
                        intstack.Pop();
                    }
                }

                if (opCode.Equals("beq") && intstack.Count > 0)
                {
                    if (intstack.Peek() == 1)
                    {
                        i = Int32.Parse(values[i]) - 1;
                        intstack.Pop();
                    }
                }
                
                if(opCode.Equals("dsp"))
                {
                    if(intstack.Count > 0)
                    {
                        Console.WriteLine(intstack.Pop());
                    }
                    else if(boolStack.Count > 0)
                    {
                        Console.WriteLine(boolStack.Pop());
                    }
                    else if(superStack.Count > 0)
                    {
                        Console.WriteLine(superStack.Pop().ToString());
                    }
                }

            }
        }

        public static bool CheckIsInteger(string operand)
        {
            bool isInteger = true;
            try
            {
                Int32.Parse(operand);
            }
            catch (Exception ex)
            {
                isInteger = false;
            }
            return isInteger;
        }

        public static void SeparateOperationsAndTokens()
        {
            int m = 0;
            foreach(string s in allTokens)
            {
                if(!s.Equals("end"))
                {
                    if (OpCodes.Contains(s))
                    {
                        allOperations[m++] = s; 
                    }
                    else
                    {
                        allValues[m-1] = s; 
                    }
                }
            }
            allOperations[m] = allTokens.Last();
            Array.Resize(ref allOperations, m+1);
            Array.Resize(ref allValues, m+1);

        }

        public static void InitializeOpcodes()
        {
            string[] list = new string[] { "asn", "lst", "jbk", "run", "fnd", "fun", "add", "sub", "mul", "div", "put", "get",
            "bne", "beq", "dsp", "grt", "fth", "and", "or", "not","psh", "pop", "pek", "stk"};
            foreach(string s in list)
            {
                OpCodes.Add(s);
            }
        }
    }
}
