#ifndef _xcpldapp_xpin_h_
#define _xcpldapp_xpin_h_

typedef enum{
	tPassive, //Constans
	tInput,   //Far side driven
	tOutput,  //We are the driver
	tInOut,	  //modul port in and out capable
	tDynamic, //Direction can be change on-the-fly (output enabled)
	tTri,	 //Tristate capable, low driven, high pull res.
	tReg,
	tWire
} WireType;

class Bus;

class Wire {
	public:
	Wire();
	Wire(const String& s, WireType wt=tWire);
    String& operator<<(String& s){s<<name; return s;}
	String VerilogType();
	String VerilogID();
	virtual String VerilogDecl();
	void Memberof(Bus* b, int n, WireType wt);
	void SetValue(int v){iVal=v;}
	virtual String GetValue();

	protected:
	String name;
	Bus* bus;
	int index;
	WireType wtype;
	int iVal;
};

class Bus :public Wire {
	public:
	Bus(const String& s, WireType wt=tWire):Wire(s,wt){}
	void SetCount(int n);
	void SetBusSize(String s){bussize=s;}
	Wire& operator[](int index);
	String VerilogDecl();
	String VerilogBusSize();
	String GetValue();
	protected:
	Array<Wire> m;
	String bussize;
};

class XPin {
	public:
	XPin();
	String VerilogInstance();
	String VerilogInstName()const;

	XPin& setI(Wire& w){wI=&w; return *this;}
	XPin& setO(Wire& w){wO=&w; return *this;}
	XPin& setOE(Wire& w){wOE=&w; return *this;}
	XPin& setIO(Wire& w){wIO=&w; return *this;}
	String VerilogDefParam(const String& var, const String& value);
	
	int instNr;
	
	Wire* wOE;
	Wire* wI;
	Wire* wO;
	Wire* wIO;

	String sOE;
	String sI;
	String sO;
	String sPad;
	String sLocation;
};

#endif
