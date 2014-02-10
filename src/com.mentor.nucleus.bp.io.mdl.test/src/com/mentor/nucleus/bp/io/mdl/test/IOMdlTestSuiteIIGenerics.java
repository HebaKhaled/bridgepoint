     package com.mentor.nucleus.bp.io.mdl.test;
//=====================================================================
//
//File:      $RCSfile: IOMdlTestSuiteIIGenerics.java,v $
//Version:   $Revision: 1.5 $
//Modified:  $Date: 2013/01/10 23:12:53 $
//
//(c) Copyright 2004-2013 by Mentor Graphics Corp. All rights reserved.
//
//=====================================================================
// Licensed under the Apache License, Version 2.0 (the "License"); you may not 
// use this file except in compliance with the License.  You may obtain a copy 
// of the License at
//
//       http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software 
// distributed under the License is distributed on an "AS IS" BASIS, WITHOUT 
// WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.   See the 
// License for the specific language governing permissions and limitations under
// the License.
//=====================================================================

import java.util.UUID;

import org.eclipse.jface.viewers.TreeViewer;
import org.eclipse.ui.IWorkbenchPage;
import org.eclipse.ui.PlatformUI;

import com.mentor.nucleus.bp.core.Ooaofooa;
import com.mentor.nucleus.bp.core.SystemModel_c;
import com.mentor.nucleus.bp.test.common.BaseTest;
import com.mentor.nucleus.bp.ui.explorer.ExplorerView;

public class IOMdlTestSuiteIIGenerics extends BaseTest {

    IWorkbenchPage m_wp = PlatformUI.getWorkbench().getActiveWorkbenchWindow().getActivePage();
    static ExplorerView m_bp_view = null;
    static TreeViewer m_bp_tree = null;
    static SystemModel_c m_sys = null;
    static String workspace_path = "";
    static SystemModel_c m_system = new SystemModel_c(Ooaofooa.getDefaultInstance(), new UUID(0,1), "", false);

	public IOMdlTestSuiteIIGenerics(String arg0) {
		super(null, arg0);
	}
	
	protected void setUp() throws Exception {
		super.setUp();
	}

	protected void tearDown() throws Exception {
		super.tearDown();
	}
	
	public void testIOMdlTestSuiteII() {
	    assert(true);
    }

}
