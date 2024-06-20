; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57810 () Bool)

(assert start!57810)

(declare-fun b!265243 () Bool)

(declare-datatypes ((Unit!18863 0))(
  ( (Unit!18864) )
))
(declare-fun e!185258 () Unit!18863)

(declare-fun lt!406352 () Unit!18863)

(assert (=> b!265243 (= e!185258 lt!406352)))

(declare-fun lt!406346 () (_ BitVec 64))

(declare-datatypes ((array!14777 0))(
  ( (array!14778 (arr!7432 (Array (_ BitVec 32) (_ BitVec 8))) (size!6445 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11704 0))(
  ( (BitStream!11705 (buf!6913 array!14777) (currentByte!12795 (_ BitVec 32)) (currentBit!12790 (_ BitVec 32))) )
))
(declare-fun w1!584 () BitStream!11704)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!265243 (= lt!406346 (bitIndex!0 (size!6445 (buf!6913 w1!584)) (currentByte!12795 w1!584) (currentBit!12790 w1!584)))))

(declare-fun w2!580 () BitStream!11704)

(declare-fun arrayBitRangesEqSymmetric!0 (array!14777 array!14777 (_ BitVec 64) (_ BitVec 64)) Unit!18863)

(assert (=> b!265243 (= lt!406352 (arrayBitRangesEqSymmetric!0 (buf!6913 w1!584) (buf!6913 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 lt!406346))))

(declare-fun arrayBitRangesEq!0 (array!14777 array!14777 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!265243 (arrayBitRangesEq!0 (buf!6913 w2!580) (buf!6913 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 lt!406346)))

(declare-fun b!265244 () Bool)

(declare-fun e!185254 () Bool)

(declare-fun array_inv!6169 (array!14777) Bool)

(assert (=> b!265244 (= e!185254 (array_inv!6169 (buf!6913 w1!584)))))

(declare-fun b!265245 () Bool)

(declare-fun e!185252 () Bool)

(assert (=> b!265245 (= e!185252 (array_inv!6169 (buf!6913 w2!580)))))

(declare-fun b!265246 () Bool)

(declare-fun e!185256 () Bool)

(declare-fun e!185257 () Bool)

(assert (=> b!265246 (= e!185256 (not e!185257))))

(declare-fun res!221689 () Bool)

(assert (=> b!265246 (=> res!221689 e!185257)))

(declare-fun e!185251 () Bool)

(assert (=> b!265246 (= res!221689 e!185251)))

(declare-fun res!221690 () Bool)

(assert (=> b!265246 (=> (not res!221690) (not e!185251))))

(assert (=> b!265246 (= res!221690 (not (= (size!6445 (buf!6913 w1!584)) #b00000000000000000000000000000000)))))

(declare-fun isPrefixOf!0 (BitStream!11704 BitStream!11704) Bool)

(assert (=> b!265246 (isPrefixOf!0 w2!580 w2!580)))

(declare-fun lt!406348 () Unit!18863)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!11704) Unit!18863)

(assert (=> b!265246 (= lt!406348 (lemmaIsPrefixRefl!0 w2!580))))

(declare-fun lt!406351 () BitStream!11704)

(assert (=> b!265246 (isPrefixOf!0 lt!406351 lt!406351)))

(declare-fun lt!406347 () Unit!18863)

(assert (=> b!265246 (= lt!406347 (lemmaIsPrefixRefl!0 lt!406351))))

(assert (=> b!265246 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!406349 () Unit!18863)

(assert (=> b!265246 (= lt!406349 (lemmaIsPrefixRefl!0 w1!584))))

(assert (=> b!265246 (= lt!406351 (BitStream!11705 (buf!6913 w2!580) (currentByte!12795 w1!584) (currentBit!12790 w1!584)))))

(declare-fun res!221691 () Bool)

(assert (=> start!57810 (=> (not res!221691) (not e!185256))))

(assert (=> start!57810 (= res!221691 (isPrefixOf!0 w1!584 w2!580))))

(assert (=> start!57810 e!185256))

(declare-fun inv!12 (BitStream!11704) Bool)

(assert (=> start!57810 (and (inv!12 w1!584) e!185254)))

(assert (=> start!57810 (and (inv!12 w2!580) e!185252)))

(declare-fun b!265247 () Bool)

(declare-fun Unit!18865 () Unit!18863)

(assert (=> b!265247 (= e!185258 Unit!18865)))

(declare-fun b!265248 () Bool)

(assert (=> b!265248 (= e!185251 (not (arrayBitRangesEq!0 (buf!6913 w1!584) (buf!6913 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6445 (buf!6913 w1!584)) (currentByte!12795 w1!584) (currentBit!12790 w1!584)))))))

(declare-fun b!265249 () Bool)

(declare-fun e!185259 () Bool)

(assert (=> b!265249 (= e!185257 e!185259)))

(declare-fun res!221692 () Bool)

(assert (=> b!265249 (=> res!221692 e!185259)))

(assert (=> b!265249 (= res!221692 (= (size!6445 (buf!6913 w1!584)) #b00000000000000000000000000000000))))

(declare-fun lt!406350 () Unit!18863)

(assert (=> b!265249 (= lt!406350 e!185258)))

(declare-fun c!12186 () Bool)

(assert (=> b!265249 (= c!12186 (not (= (size!6445 (buf!6913 w1!584)) #b00000000000000000000000000000000)))))

(declare-fun b!265250 () Bool)

(assert (=> b!265250 (= e!185259 (arrayBitRangesEq!0 (buf!6913 w2!580) (buf!6913 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6445 (buf!6913 w1!584)) (currentByte!12795 w1!584) (currentBit!12790 w1!584))))))

(assert (= (and start!57810 res!221691) b!265246))

(assert (= (and b!265246 res!221690) b!265248))

(assert (= (and b!265246 (not res!221689)) b!265249))

(assert (= (and b!265249 c!12186) b!265243))

(assert (= (and b!265249 (not c!12186)) b!265247))

(assert (= (and b!265249 (not res!221692)) b!265250))

(assert (= start!57810 b!265244))

(assert (= start!57810 b!265245))

(declare-fun m!395903 () Bool)

(assert (=> b!265245 m!395903))

(declare-fun m!395905 () Bool)

(assert (=> b!265248 m!395905))

(assert (=> b!265248 m!395905))

(declare-fun m!395907 () Bool)

(assert (=> b!265248 m!395907))

(assert (=> b!265250 m!395905))

(assert (=> b!265250 m!395905))

(declare-fun m!395909 () Bool)

(assert (=> b!265250 m!395909))

(declare-fun m!395911 () Bool)

(assert (=> start!57810 m!395911))

(declare-fun m!395913 () Bool)

(assert (=> start!57810 m!395913))

(declare-fun m!395915 () Bool)

(assert (=> start!57810 m!395915))

(declare-fun m!395917 () Bool)

(assert (=> b!265244 m!395917))

(assert (=> b!265243 m!395905))

(declare-fun m!395919 () Bool)

(assert (=> b!265243 m!395919))

(declare-fun m!395921 () Bool)

(assert (=> b!265243 m!395921))

(declare-fun m!395923 () Bool)

(assert (=> b!265246 m!395923))

(declare-fun m!395925 () Bool)

(assert (=> b!265246 m!395925))

(declare-fun m!395927 () Bool)

(assert (=> b!265246 m!395927))

(declare-fun m!395929 () Bool)

(assert (=> b!265246 m!395929))

(declare-fun m!395931 () Bool)

(assert (=> b!265246 m!395931))

(declare-fun m!395933 () Bool)

(assert (=> b!265246 m!395933))

(push 1)

(assert (not b!265245))

(assert (not b!265250))

(assert (not b!265243))

(assert (not b!265248))

(assert (not b!265244))

(assert (not b!265246))

(assert (not start!57810))

(check-sat)

(pop 1)

