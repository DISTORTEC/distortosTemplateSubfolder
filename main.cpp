/**
 * \file
 * \brief Main code block.
 *
 * \author Copyright (C) 2016 Kamil Szczygiel http://www.distortec.com http://www.freddiechopin.info
 *
 * \par License
 * This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0. If a copy of the MPL was not
 * distributed with this file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */

#include "functionFromFolder.hpp"

#include "distortos/ThisThread.hpp"

/*---------------------------------------------------------------------------------------------------------------------+
| global functions
+---------------------------------------------------------------------------------------------------------------------*/

/**
 * \brief Main code block of template application
 *
 * Constantly calls functionFromFolder() and sleeps for one second.
 *
 * \return doesn't return
 */

int main()
{
	while (1)
	{
		functionFromFolder();
		distortos::ThisThread::sleepFor(std::chrono::seconds{1});
	}
}
