#include <stdio.h>

#include <windows.h>

int main()
{
	HANDLE hProcess;
	HANDLE hThread;
	STARTUPINFO si;
	PROCESS_INFORMATION pi;
	DWORD dwProcessId = 0;
	DWORD dwThreadId = 0;
	ZeroMemory(&si, sizeof(si));
	ZeroMemory(&pi, sizeof(pi));
	BOOL bCreateProcess = NULL;
	int i;
	for (i = 0; i < 30000; i++)
	{
		bCreateProcess = CreateProcess(
			"C:\\Users\\Piotr\\Documents\\visual studio 2015\\Projects\\PR_lab5\\Debug\\PR_lab3.exe",
			NULL,
			NULL,
			NULL,
			FALSE,
			0,
			NULL,
			NULL,
			&si,
			&pi);
		if (bCreateProcess == FALSE)
			break;
	}
	printf("Create Process Success %i\n ", i);

	WaitForSingleObject(pi.hProcess, INFINITE);
	CloseHandle(pi.hThread);
	CloseHandle(pi.hProcess);

	return 0;
}


/*DWORD CALLBACK ThreadProc(void* p)

{

	Sleep(INFINITE);

	return 0;

}

int main()

{

	int i;

	for (i = 0; i < 2700; i++) {

		DWORD id;

		HANDLE h = CreateThread(NULL, 0, ThreadProc, NULL, 0, &id);
		//HANDLE h = CreateThread(NULL, 24576, ThreadProc, NULL, STACK_SIZE_PARAM_IS_A_RESERVATION, &id);
		if (!h) break;

		CloseHandle(h);

	}

	printf("Created %d threads\n", i);

	return 0;

}*/
