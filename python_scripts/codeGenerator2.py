#	BY Clement BEGNAUD - 07/25/2016
#
#	Builds the C# code to make a method which builds an array

def main ():
	#fileName = "cockpit_Init.txt"
	#arrayName = "array"
	#type = "string"
	fileName = input("Name of the file to read : ")
	arrayName = input("Name of the array you want to build : ")
	type = input("Name of the type of the array : ")

	gen (fileName, arrayName, type)
	print("\nDone")
	input("Press ENTER to close")

def gen (fileName, arrayName, type):
	arrayName_U0 = arrayName[0].upper() + arrayName[1:]
	index = 0

	dest = open(fileName + " - code generated.txt", 'w')
	f = open(fileName,'r')
	dest.write("/// <summary>\n/// Builds the array \"" + arrayName + "\"\n/// </summary>\n")
	dest.write("private void Build" + arrayName_U0 + "Array () {\n")
	dest.write("\t" + arrayName + " = new " + type + "["+ str(countNbElements(fileName)) + "];\n")
	for line in f:
		dest.write("\t" + arrayName + "["+ str(index) + "] = \"" + line[:-1] + "\";\n")
		index+=1
	dest.write("}")
	f.close()
	dest.close

def countNbElements(fileName):
	nElements = 0
	f = open(fileName,'r')
	for line in f:
		nElements+=1
	f.close()
	return nElements

main()
