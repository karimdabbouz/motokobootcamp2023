1. Who controls the ledger canister?
*The NNS.*

2. What is the subnet of the canister with the id: mwrha-maaaa-aaaab-qabqq-cai? How much nodes are running this subnet?
*The subnet ID is `pae4o-o6dxf-xki7q-ezclx-znyd6-fnk6w-vkv5z-5lfwh-xym2i-otrrw-fqe`. 16 nodes are assigned to this subnet.*

3. I have a neuron with 1O ICPs locked with a dissolve delay of 4 years - my neuron has been locked for 2 years. What is my expected voting power?
*16,65*


4. What is wrong with the following code?
*The function `convert_to_text()` does work as intended, but needs an import of the Nat module. I think we should make it a query function though, because there's nothing that needs to go through consensus (not working with canister state) and query functions are faster. The two immutable variables `n` and `t` are declared correctly, but not needed in this code snippet.*


5. What is wrong with the following code?
*We cannot return a mutable array in a shared function.*


6. What is wrong with the following code?
*We can deploy this code but we should use a Buffer to extend an array instead because this is more efficient.*
