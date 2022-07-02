#pragma once

//Thread Support in inline class
#define THREAD_FUNC_SUPPORT(ClassName) \
HANDLE m_hThread;\
typedef union CProcType \
{ \
	DWORD(WINAPI * ThreadProc)(void *);\
	DWORD(WINAPI ClassName::* procesThread)();\
}CProcType;\
\
typedef DWORD(WINAPI ClassName::* procesThread)();\
\
void StartThread(procesThread func)\
{\
	CProcType Proc;\
	Proc.procesThread = func;\
	DWORD dwThreadID;\
	m_hThread = CreateThread(NULL, 0, Proc.ThreadProc, this, NULL, &dwThreadID);\
}
