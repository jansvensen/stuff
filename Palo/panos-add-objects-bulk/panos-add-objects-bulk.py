import panos
from panos import firewall
from panos import objects

# Build out the configuration tree with a Firewall object at the root and an
# array of AddressObjects and AddressGroups as children of the Firewall
fw = firewall.Firewall('192.168.111.2', 'apiadmin', 'Banane2000!')

# Create 200 AddressGroups with 20 AddressObjects each
for i in range(0, 200):
    addr_objects = [objects.AddressObject('object{}'.format(i*20+j), '192.168.{0}.{1}'.format(i, j)) for j in range(0, 20)]
    fw.extend(addr_objects)
    grp = objects.AddressGroup('group{}'.format(i), addr_objects)
    fw.add(grp)

# Option 2: Push all the address objects at once, then all the address groups at once
#           (takes 2-3 seconds)
fw.find('object1').create_similar()
fw.find('group1').create_similar()