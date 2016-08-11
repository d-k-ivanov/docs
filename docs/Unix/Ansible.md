### Create all host_vars from inventory
In this example we have 21 inventry recond in ansible inventory file. Something like this:
```
server1     ansible_host=1.1.1.1
server2     ansible_host=1.1.1.2  
server3     ansible_host=1.1.1.3
#server4    ansible_host=1.1.1.4
server5     ansible_host=1.1.1.5
server6     ansible_host=1.1.1.6
...
#server19   ansible_host=1.1.1.19
server20    ansible_host=1.1.1.20
server21    ansible_host=1.1.1.21
```
Some records comented, some not... And we need to create whole list of host envs for any active server:
```bash
cat inventory | head -21 | awk '{print $1}' | grep -v '#' | xargs -I '{}' touch host_vars/{}
```
