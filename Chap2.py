
import survey
import thinkstats
import math
import first
import Pmf

def Pumpkin():
    mean, var =thinkstats.MeanVar([1,1,1,3,3,591])
    stdev=math.sqrt(var)
    
    return mean, var, stdev

    
def Gestation():
    table, firsts, others = first.MakeTables('')
    first.ProcessTables(firsts,others)
    
    #still working on it
    
    return stdev1, stdev2

def Mode(hist):
    mode = 0
    for val in sorted(hist.Values()):
        frequency = hist.Freq(val)
        if frequency > mode:
            mode = val
            
    return mode  

def PmfMean(pmf):
    mean= 0.0
    for i in pmf.Values():
        mean += i * pmf.Prob(i)
    
    return mean

def PmfVar(pmf):
    var =0.0
    mean=PmfMean(pmf)
    for i in pmf.Values():
        var += pmf.Prob(i) * (i-mean) **2
    
    return var


if __name__ == "__main__":
    print Pumpkin()
    #print Gestation()
    
    hist = Pmf.MakeHistFromList([1, 2, 2, 3, 3, 3, 5])
    print Mode(hist)
    
    pmf = Pmf.MakePmfFromList([1, 2, 2, 3, 3, 3, 5])
    print PmfMean(pmf), PmfVar(pmf)
    print pmf.Mean() == PmfMean(pmf) 
    print pmf.Var() == PmfVar(pmf)
    
    
    
    
    

        
    