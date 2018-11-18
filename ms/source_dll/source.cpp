#include "../stub_dll/stub.h"

#define EXPORT_OBJECT extern "C" __declspec(dllexport)

EXPORT_OBJECT void *value = NULL;

class Temporary {
private:
	void *t;
public:
	Temporary(void *val) {
		t = val;
	}
	~Temporary() {
		*((ULONG *)t) = 0;
	}
	void *get() {
		*((ULONG *)t) = *((ULONG *)t) + 1;
		return t;
	}
};

EXPORT_OBJECT int Hello(void *lpParam) {
  Temporary t(value);
  lpParam = t.get();
  NTSTATUS status = MessageBoxThread(lpParam);
  status += 2;
  return status;
}

EXPORT_OBJECT bool DllMain(int hModule, unsigned int ul_reason_for_call, void *lpReserved) {
  switch (ul_reason_for_call) {
    case 0:
      break;
    case 1:
    case 2:
    case 3:
      break;
  }
  return TRUE;
}
