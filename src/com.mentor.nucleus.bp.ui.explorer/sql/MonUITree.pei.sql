--======================================================================
--
-- File:      $RCSfile$
-- Version:   $Revision$
-- Modified:  $Date$
--
-- (c) Copyright 2006-2013 Mentor Graphics Corp. All rights reserved.
--
--======================================================================
-- Licensed under the Apache License, Version 2.0 (the "License"); you may not
-- use this file except in compliance with the License.  You may obtain a copy
-- of the License at
--
--      http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
-- WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.   See the
-- License for the specific language governing permissions and limitations under
-- the License.
--======================================================================
-- Note that the order of the TNS nodes here defines the order in which
-- the nodes appear in the tree.
--
INSERT INTO T_TNS VALUES (5,  'class_obj.gif',         'CSME_CIE',   '', 'Label', '', 'MonitorClasses', false);
INSERT INTO T_TNS VALUES (6,  'state_obj.gif',         'SM_STATE','', 'Name', '', 'MonitorClassState', false);
INSERT INTO T_TNS VALUES (7,  'field_default_obj.gif', 'I_INS',   '', 'Label', '', 'MonitorInstances', false);
INSERT INTO T_TNS VALUES (8,  'Attribute.gif',         'I_AVL',   '', 'Label', '', 'MonitorValues', false);
INSERT INTO T_TNS VALUES (9,  'event.gif',             'I_EVI',   '', 'Label', '', 'MonitorPendingEvents', false);
INSERT INTO T_TNS VALUES (10, 'state_obj.gif',         'SM_STATE','', 'Name', '', 'MonitorStates', false);
INSERT INTO T_TNS VALUES (11, 'Attribute.gif',         'RV_RVL',  '', 'Label', '', 'MonitorRuntimeValues', false);

INSERT INTO T_TPS VALUES (5, 6, '->CSME_CIS[R2932]->SM_STATE[R2932]');
INSERT INTO T_TPS VALUES (7, 10, '->SM_STATE[R2915]');
INSERT INTO T_TPS VALUES (7, 8, '->I_AVL[R2909]');
INSERT INTO T_TPS VALUES (7, 9, '->I_EVI[R2935]');
INSERT INTO T_TPS VALUES (8, 11, '->RV_RVL[R3304]->RV_SVL[R3300]->RV_VIS[R3301]->RV_RVL[R3301]');
INSERT INTO T_TPS VALUES (11, 11, '->RV_SVL[R3300]->RV_VIS[R3301]->RV_RVL[R3301]');
INSERT INTO T_TPS VALUES (8, 11, '->RV_RVL[R3304]->RV_AVL[R3300]->RV_VIA[R3302]->RV_RVL[R3302]');
INSERT INTO T_TPS VALUES (11, 11, '->RV_AVL[R3300]->RV_VIA[R3302]->RV_RVL[R3302]');
--
-- $Log$
-- Revision 1.11  2013/01/10 23:15:49  rmulvey
-- job:dts0100939343
-- Updated the copyright to 2013
--
-- Revision 1.10  2012/01/23 21:26:10  kbrown
-- job:dts0100848212
-- Batch commit of copyright updated files.
--
-- Revision 1.9  2011/05/30 20:30:08  kbrown
-- job:dts0100742889
-- Updated copy right.
--
-- Revision 1.8  2010/01/05 03:42:34  kbrown
-- job:dts0100644853
-- Batch commit of copyright change from 2009 to 2010 for BP CVS projects.
--
-- Revision 1.7  2009/01/01 23:20:29  rmulvey
-- Job:4060
-- Batch promotion of copyright changes from Review-i4060 and Review-i4060-01.
--
-- Revision 1.6.4.1  2008/12/31 15:53:09  rmulvey
-- Job:4060
-- This is a batch commit of 2009 copyright changes to branch Review-i4060.  This includes the
-- report that outlines all changes made (before/after for each line changed).  This report is found here: <cvs>/Documentation/internal/test_results/R2_1_2/i4060/update-copyright-results.txt.
--
-- Revision 1.6  2008/10/24 05:52:18  kbrown
-- Job:3405 3898 3942 3961 3337 3915
-- Batch commit of Review-i3405-03 to HEAD.
--
-- Revision 1.5.40.2  2008/10/15 18:30:35  tlondon
-- Job: 3405
--
-- Show array values in spotlight view.
--
-- Revision 1.5.40.1  2008/09/30 05:13:56  rmulvey
-- Job:3405
-- Batch commit of the i3405 branch merged with the latest changes from head to create a new branch (Review-i3405-03).
--
-- Revision 1.5.38.1  2008/09/08 15:41:15  rmulvey
-- Job:3405
-- Created a new working branch based on head. The new branch is R2_1_0-RWM-i3405.
-- The old branch was R2_0_4-RWM-i3405-01.
--
-- Revision 1.5.32.1  2008/08/06 18:38:51  rmulvey
-- Job:3405
-- Created a new branch (R2_0_4-RWM-i3405-01) to incorporate the latest changes from head.
--
-- Revision 1.5.30.1  2008/07/14 20:46:13  rmulvey
-- Job:3405
-- This is a batch commit of changes into a new, clean, branch (R2_0_4-RWM-i3405).  This new  branch is based on the work in progress from branch Review-i3405-02 which was shelved several months ago.  The history for this is that initially this issue
-- was going to contain the work for BOTH intra-component verifier and inter-component verifier.   During implemenation the
-- intra-component verfiier portion of the issue was split out into a seperate issue, bug 3099, and completed for BP v2.0.0.
--
-- Revision 1.5.12.1  2008/03/24 17:52:56  tlondon
-- Job: 3405
--
-- Update to account for newly remodeled static class support in verifier.
--
-- Revision 1.5  2008/01/08 20:14:15  rmulvey
-- Job:3349
-- Promoted from Review-i3349.  The copyright has been updated to 2008 and the version has been bumped to 1.5.4.
--
-- Revision 1.4.14.1  2007/12/21 18:02:29  rmulvey
-- Job:3339
-- Checking-in the copyriight changes in branch Review-i3349.  A detailed list of these changes is found
-- in the report produced by the utility used to changesthese messages.  This report is here:
-- Documentation/internal/test_results/R1_5_4/i3349/update-copyright-results.txt
--
-- Revision 1.4  2007/09/05 02:17:24  kbrown
-- Job:2673
-- Promoting copyright changes for plugins:
-- mc.xmiexport
-- pkg
-- pkg-feature
-- test
-- ui.canvas
-- ui.canvas.test
-- ui.explorer
-- ui.explorer.test
-- ui.properties
-- ui.properties.test
-- ui.session
--
-- Revision 1.3.22.1  2007/09/01 01:36:42  rmulvey
-- Job:2673
-- Updated copyright messages and version numbers in Review-i2673-01.
--
-- Revision 1.3  2007/05/11 23:39:18  tlondon
-- Job: 2857
-- Add Runtime values into the display tree. Add SDTs.
--
-- Revision 1.2.36.1  2007/05/10 16:54:11  campbell
-- Job: 2857
-- Add Runtime values into the display tree.
--
-- Revision 1.2.30.1  2007/04/12 23:46:09  campbell
-- Job: 2857
-- Add SDT's to debug UI.
--
-- Revision 1.2  2006/12/12 21:48:43  tlondon
-- Job: 2286
--
-- Promotion.
--
-- This is a batch promotion check the resource history for more information.
-- Or see the design note and implementation note named after this issue number.
--
-- Revision 1.1.8.1  2006/12/11 19:03:26  tlondon
-- Job: 2286
--
-- Commit changes to branch to allow others to test against in parallel with promotion.
--
-- Revision 1.1.6.1  2006/10/21 12:38:51  campbell
-- Job:2286
-- Pre-existing instance populations to generate Spotlight View (needs cleaned up so that both ME and Spotlight use the tree generator project).
--
-- Revision 1.1.4.2  2006/08/30 19:00:49  campbell
-- Job:2286
-- Show current state with its own icon.
--
-- Revision 1.1.4.1  2006/08/10 20:59:35  campbell
-- Job: 2286
-- Introduced.
--
-- Revision 1.1.2.1  2006/07/24 19:25:26  campbell
-- Job: 2286
-- Introduced.
--
--