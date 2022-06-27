#pragma once

#include <Windows.h>

class CLock
{
public:
	typedef CRITICAL_SECTION OSLockType;

	CLock() {
		::InitializeCriticalSectionAndSpinCount(&os_lock_, 2000);
	}
	~CLock() {
		::DeleteCriticalSection(&os_lock_);
	}

	bool Try() {
		if (::TryEnterCriticalSection(&os_lock_))
		{
			return true;
		}
		return false;
	}

	void Lock() {
		::EnterCriticalSection(&os_lock_);
	}

	void Unlock() {

		::LeaveCriticalSection(&os_lock_);
	}

private:
	OSLockType os_lock_;
};

class CAutoLock
{
public:
	CAutoLock(CLock * lock)
	{
		lock_ = lock;
		lock_->Lock();
	}

	~CAutoLock()
	{
		if (lock_)
			lock_->Unlock();
	}

private:
	CLock *lock_;
};