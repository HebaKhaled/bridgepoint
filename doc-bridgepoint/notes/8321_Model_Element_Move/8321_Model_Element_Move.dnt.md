---

This work is licensed under the Creative Commons CC0 License

---

# Model Element Move
### xtUML Project Design Note

1. Abstract   
-----------   
This note describes the approach we shall take to implement the Model Element 
Move functionality in BridgePoint.  

2. Document References     
----------------------   
<a id="2.1"></a>2.1 [BridgePoint DEI #8321](https://support.onefact.net/issues/8321) 
This is a link to this issue in the issue tracking system.  

<a id="2.2"></a>2.2 [Analysis of Model Element Move #8031](https://support.onefact.net/issues/8031) 
The [analysis produced by this work allowed]
(../8031_Analyze_Model_Element_Move/8031_Analyze_Model_Element_Move.ant.md) was used 
during the SOW creation to help define the requirements for this project.  

<a id="2.3"></a>2.3 [Statement of Work](https://docs.google.com/document/d/1_T4H7StO-VM8zfIFjr-V7VwUQMXML1c7nFJJofU0vGs/edit)  
This is a link to this issue's Statement of Work document.  

<a id="2.4"></a>2.4 [Inconsistent proxy paths](https://support.onefact.net/issues/8454)  
Proxy paths are not written consistently.  

<a id="2.5"></a>2.5 [MC-Java Implementation Document](https://github.com/xtuml/bridgepoint/blob/master/src/MC-Java/README.TXT)  
This document describes the MC-Java implementation.  

<a id="2.6"></a>2.6 [Remove dead code associated with proxies](https://support.onefact.net/issues/8455)  
  
<a id="2.7"></a>2.7 Documentation associated with the introduction of proxies in BridgePoint  
Proxies were introduced into BridgePoint when multi-file persistence (PLCM) was introduced. The following 
engineering documents describe this:  

<a id="2.7.1"></a>2.7.1 [PLCM Technical Note](i845.tnt)  
This note captures the initial brain-storming done regarding the PLCM project.  

<a id="2.7.2"></a>2.7.2 [PLCM Final Analysis Note](i845-PLCM_1_0.ant)  
This is the final PLCM analysis note. The PLCM project was long-lived, and there was an initial analysis note but this one was created at the time the project was split into smaller deliverables.  

<a id="2.7.3"></a>2.7.3 [PLCM Design Note for milestone 2](i845-2.dnt)  
This note captures the design note of PLCM as related to proxies.  


3. Background   
-------------     

See the background in [the analysis note](../8031_Analyze_Model_Element_Move/8031_Analyze_Model_Element_Move.ant.md).

4. Requirements   
---------------   
The requirements are defined in this issue's [Statement of Work](#2.3). For convenience, 
the requirements defined in the SOW are being carried forward here. This design 
shall create some additional requirements based on the selected implementation. 
These additional requirements shall be placed after the last requirement copied  
from the SOW.  

4.1 Selected model elements are moved in a single operation that can be undone with 
a single undo operation.  

4.2 Within the limitations of the Eclipse Team interface, move operations are 
performed in a way that maximizes the probability of the underlying 
configuration-management system detecting that a move operation (as opposed 
to a sequence of delete and create operations) occurred.  

4.3 Model element move shall be supported for the following model-element move 
(see Limitations [[2.3]](#2.3)):  
4.3.1 Data type definition  
4.3.2 Component definition  
4.3.3 Interface definition  
4.3.4 Class definition  
4.3.5 Component reference  
4.3.6 Imported class  
4.3.7 Package (when a package contains supported model elements)  

4.4 Whenever visibility permits, the connection between a moved model element 
and other model elements shall be maintained.  

For example, a data type can be moved without affecting the attributes and 
parameters typed by it so long as the data type remains visible to those 
elements typed by it.  

4.5 The model-element move capability is enabled only when all model 
elements within the current selection are supported model element types for 
the move capability.  

4.5.1 The option to move shall be present but disabled when a selection is 
not a valid move selection.  

5. Analysis   
-----------   
See the [Analysis Note](../8031_Analyze_Model_Element_Move/8031_Analyze_Model_Element_Move.ant.md). Here we will add some addtional proxy analysis. We do this because it is observed that there are mulitple ways to perform the implemenataion for this task, and we want to assure we look at overall product roadmap as we perform this task to leverage the work to move us toward longer term product goals that may be related. Specfically, it is desirable to remove proxies.

5.1 Proxy analysis with an eye to proxy removal  
Section 1 of the [PLCM design note for proxies](i845-2.dnt) describes the proxy implementation. The reader should review it before proceeding.  

The BridgePoint NonRootModelElement.java class contains an opertion, boolean isProxy(), used to determine 
if an in-memory instance is a proxy or not. To determine if the element is a proxy, it looks at the string attribute
NonRootModelElement.java::m_contentPath and if that attribute is not null then the element IS a proxy.

5.1.1 As described in the [PLCM design note for proxies](i845-2.dnt), proxies are implemented with the followed generated operations:  
*  createProxy(..[all parameters].., String filePath)  
Returns an instance.  
*  resolveInstance(..[all parameters]..)   
Searches, by UUID for a matching instance and returns the instance if found. If not found, creates a new instance.  
* convertToProxy()  
Convert a real instance to a proxy.
* convertToRealInstance(..[all parameters]..)  
Convert a proxy to a real instance.  

5.1.2 Things proxies are currently used for
* lazy loading

5.1.3 Removal of proxies  
5.1.3.1 Remove generated code used to persist proxies  
* remove convertToProxy()
* Stop generarting the operations that write proxies
** io.core/arc/export_functions.inc
** io.mdl/arc/gen_stream_export_.arc

5.1.3.2 Load the whole model at startup
```
// nrme is the NonRootModelElement associated with the SystemModel_c instance
PersistableModelComponent pmc = nrme.getPersistableComponent();
			pmc.loadComponentAndChildren(new NullProgressMonitor());
```  
5.1.3.3 Remove generation of convertFromProxy() and delayed problem marker code  
```java
    public void convertFromProxy() {
        if (isProxy()) {
            m_contentPath = null;
            UmlProblem.proxyResolved(this);
        }
    }
```  
5.1.3.4 Remove generation of convertToRealInstance()  

6. Design   
----------------   
6.1 Enhance the current infrastructure to not change element IDs during move.  

6.1.2 The copy/paste infrastructure shall be used for it's ability to perform 
selection and target validation. 

6.1.3 Avoid using the current infrastructure's use of the clipboard if possible.  

6.1.4 While doing this work, consider modifying the current cut/paste operation 
to no longer change IDs during paste.   

6.2 Modify all resolution operations to first search by ID  instead of name  

6.3 Introduce a new CME named Move...  

6.3.1 Introduce the Move... CME in Model Explorer  

6.3.2 Introduce the Move... CME in the canvas  

6.3.3 Assure the Move... CME is only enabled when there is a valid selection  

6.3.4 The BridgePoint Move... CME shall be similar to the 
Java > Refactor >Move... wizard, but where the Java Move CME contains a project 
tree to select the destination, the BridgePoint > Move... dialog shall contain 
a Model explorer tree.  

6.3.5 The BridgePoint Move... shall be implemented as a wizard.  

6.3.5 Move... Wizard Page 1  

6.3.5.1 Select Destination  

6.3.5.1.1 This item shall contain a Model Explorer tree and the user shall be 
allowed to select a single location  

6.3.5.1.2 Only valid destinations shall be enabled, invalid destinations shall 
be disabled  

6.3.6 Move... Wizard Page 2  

6.3.6.1 Referring Model Elements affected by the move operation  

6.3.6.2 A tree view showing the Model Elements that will be affected by the 
move with a description of how they will be affected  

6.3.6.3 An option to save this list shall be presented  

6.3.6.4 An option to print this list shall be presented  

6.4 The user may cancel the Move... at any time before selecting Finish, and 
no action shall be taken.  

6.5 Only when and if the user selects the Move... wizard's Finish button shall 
the atomic move take place.  

7. Design Comments   
------------------   
7.1 Remove dead code associated with proxies  
During proxy analysis it was observed that opertation in the coloring file 
bp.core/color/ooaofooa_package_spec.clr that were used in the past to 
specify proxy class containment are no longer used. This was found while 
looking at a reference to how proxies were initially  
[i845 Technical note section 2.1.1 ](i845.tnt) in combination with a review
of the [MC-Java Implementation Document](https://github.com/xtuml/bridgepoint/blob/master/src/MC-Java/README.TXT). 
An issue was raised to remove this dead code []() and the task was performed.
7.1.1 Remove the following opertions from bp.core/color/ooaofooa_package_spec.clr
* markComponentsAndContainments
* markComponentRoot
* markContainmentAssociation
7.1.2 Remove places where markComponentsAndContainments() was called. 






7. Acceptance Test   
------------------  
 
7.1 Test to assure that the move operation is atomic  

7.2 Test to assure that the move operation maximizes the probability of the  
underlying configuration-management system detecting that the move within  
the limitations of the eclipse team interface.  

7.3 Test element move for each supported model element as specified in section 4.3. 

7.4 Test to assure that when visibility permits, the connection between a moved model element 
and other model elements shall be maintained.  

7.4.1 Test to assure that when visibility does not permit the connection between 
model elements to be maintained proper defaults are used.

7.5 Test to assure the model-element move capability is only enabled for 
valid model element selections and is present but disabled otherwise.


End
---