public with sharing class SetAssignment {
	
	private List<Set<Integer>> lstSet;
	public Set<Integer> intersection = new Set<Integer>();
    public Set<Integer> difference = new Set<Integer>();
    
  public setAssignment(){
    Set<Integer>set1 = new Set<Integer>();
    set1.add(9);
    set1.add(1);
    set1.add(4);
    set1.add(5);
    
    Set<Integer>set2 = new Set<Integer>();
    set2.add(5);
    set2.add(6);
    set2.add(4);
    set2.add(7);
        
        Set<Integer>set3 = new Set<Integer>();
        set3.add(3);
        set3.add(8);
        set3.add(1);
        set3.add(4);
    
    lstSet = new List<Set<Integer>>();
    lstSet.add(set1);
    lstSet.add(set2);
        lstSet.add(set3);
  }
  
  public void getIntersection(){    
    
        
        for(Integer iter:lstSet.get(0)){
          if(lstSet.get(1).contains(iter))
            intersection.add(iter);
    }
        
        for(Integer count=2;count<lstSet.size();count++){
            intersection.retainAll(lstSet.get(count));
        }
        
        for(Integer count=0;count<lstSet.size();count++){
            for(Integer iter:lstSet.get(count)){
                if(!(intersection.contains(iter))){
                    difference.add(iter);
                }
            }
        }
        
        for(Integer count=1;count<lstSet.size();count++){
            difference.removeAll(lstSet.get(count));
        }
        
        system.debug('Intersection:' + intersection);
        system.debug('Difference:' + difference);
  }

}