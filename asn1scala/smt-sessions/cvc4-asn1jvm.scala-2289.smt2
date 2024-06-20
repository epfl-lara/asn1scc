; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58036 () Bool)

(assert start!58036)

(declare-fun b!266439 () Bool)

(declare-fun e!186390 () Bool)

(declare-datatypes ((array!14850 0))(
  ( (array!14851 (arr!7461 (Array (_ BitVec 32) (_ BitVec 8))) (size!6474 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11762 0))(
  ( (BitStream!11763 (buf!6942 array!14850) (currentByte!12836 (_ BitVec 32)) (currentBit!12831 (_ BitVec 32))) )
))
(declare-fun w1!584 () BitStream!11762)

(declare-fun array_inv!6198 (array!14850) Bool)

(assert (=> b!266439 (= e!186390 (array_inv!6198 (buf!6942 w1!584)))))

(declare-fun b!266441 () Bool)

(declare-fun e!186382 () Bool)

(declare-fun e!186385 () Bool)

(assert (=> b!266441 (= e!186382 (not e!186385))))

(declare-fun res!222563 () Bool)

(assert (=> b!266441 (=> res!222563 e!186385)))

(declare-fun e!186381 () Bool)

(assert (=> b!266441 (= res!222563 e!186381)))

(declare-fun res!222564 () Bool)

(assert (=> b!266441 (=> (not res!222564) (not e!186381))))

(assert (=> b!266441 (= res!222564 (not (= (size!6474 (buf!6942 w1!584)) #b00000000000000000000000000000000)))))

(declare-fun w2!580 () BitStream!11762)

(declare-fun isPrefixOf!0 (BitStream!11762 BitStream!11762) Bool)

(assert (=> b!266441 (isPrefixOf!0 w2!580 w2!580)))

(declare-datatypes ((Unit!18920 0))(
  ( (Unit!18921) )
))
(declare-fun lt!407171 () Unit!18920)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!11762) Unit!18920)

(assert (=> b!266441 (= lt!407171 (lemmaIsPrefixRefl!0 w2!580))))

(declare-fun lt!407170 () BitStream!11762)

(assert (=> b!266441 (isPrefixOf!0 lt!407170 lt!407170)))

(declare-fun lt!407167 () Unit!18920)

(assert (=> b!266441 (= lt!407167 (lemmaIsPrefixRefl!0 lt!407170))))

(assert (=> b!266441 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!407169 () Unit!18920)

(assert (=> b!266441 (= lt!407169 (lemmaIsPrefixRefl!0 w1!584))))

(assert (=> b!266441 (= lt!407170 (BitStream!11763 (buf!6942 w2!580) (currentByte!12836 w1!584) (currentBit!12831 w1!584)))))

(declare-fun b!266442 () Bool)

(declare-fun arrayBitRangesEq!0 (array!14850 array!14850 (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!266442 (= e!186381 (not (arrayBitRangesEq!0 (buf!6942 w1!584) (buf!6942 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6474 (buf!6942 w1!584)) (currentByte!12836 w1!584) (currentBit!12831 w1!584)))))))

(declare-fun b!266443 () Bool)

(declare-fun e!186383 () Bool)

(assert (=> b!266443 (= e!186383 true)))

(declare-fun lt!407173 () Bool)

(assert (=> b!266443 (= lt!407173 (isPrefixOf!0 lt!407170 w1!584))))

(declare-fun b!266444 () Bool)

(declare-fun e!186388 () Unit!18920)

(declare-fun Unit!18922 () Unit!18920)

(assert (=> b!266444 (= e!186388 Unit!18922)))

(declare-fun b!266445 () Bool)

(declare-fun lt!407172 () Unit!18920)

(assert (=> b!266445 (= e!186388 lt!407172)))

(declare-fun lt!407168 () (_ BitVec 64))

(assert (=> b!266445 (= lt!407168 (bitIndex!0 (size!6474 (buf!6942 w1!584)) (currentByte!12836 w1!584) (currentBit!12831 w1!584)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!14850 array!14850 (_ BitVec 64) (_ BitVec 64)) Unit!18920)

(assert (=> b!266445 (= lt!407172 (arrayBitRangesEqSymmetric!0 (buf!6942 w1!584) (buf!6942 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 lt!407168))))

(assert (=> b!266445 (arrayBitRangesEq!0 (buf!6942 w2!580) (buf!6942 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 lt!407168)))

(declare-fun b!266446 () Bool)

(declare-fun e!186386 () Bool)

(assert (=> b!266446 (= e!186386 (not (arrayBitRangesEq!0 (buf!6942 w2!580) (buf!6942 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6474 (buf!6942 w1!584)) (currentByte!12836 w1!584) (currentBit!12831 w1!584)))))))

(declare-fun b!266447 () Bool)

(declare-fun e!186387 () Bool)

(assert (=> b!266447 (= e!186387 (array_inv!6198 (buf!6942 w2!580)))))

(declare-fun res!222565 () Bool)

(assert (=> start!58036 (=> (not res!222565) (not e!186382))))

(assert (=> start!58036 (= res!222565 (isPrefixOf!0 w1!584 w2!580))))

(assert (=> start!58036 e!186382))

(declare-fun inv!12 (BitStream!11762) Bool)

(assert (=> start!58036 (and (inv!12 w1!584) e!186390)))

(assert (=> start!58036 (and (inv!12 w2!580) e!186387)))

(declare-fun b!266440 () Bool)

(assert (=> b!266440 (= e!186385 e!186383)))

(declare-fun res!222561 () Bool)

(assert (=> b!266440 (=> res!222561 e!186383)))

(assert (=> b!266440 (= res!222561 e!186386)))

(declare-fun res!222562 () Bool)

(assert (=> b!266440 (=> (not res!222562) (not e!186386))))

(assert (=> b!266440 (= res!222562 (not (= (size!6474 (buf!6942 w1!584)) #b00000000000000000000000000000000)))))

(declare-fun lt!407174 () Unit!18920)

(assert (=> b!266440 (= lt!407174 e!186388)))

(declare-fun c!12261 () Bool)

(assert (=> b!266440 (= c!12261 (not (= (size!6474 (buf!6942 w1!584)) #b00000000000000000000000000000000)))))

(assert (= (and start!58036 res!222565) b!266441))

(assert (= (and b!266441 res!222564) b!266442))

(assert (= (and b!266441 (not res!222563)) b!266440))

(assert (= (and b!266440 c!12261) b!266445))

(assert (= (and b!266440 (not c!12261)) b!266444))

(assert (= (and b!266440 res!222562) b!266446))

(assert (= (and b!266440 (not res!222561)) b!266443))

(assert (= start!58036 b!266439))

(assert (= start!58036 b!266447))

(declare-fun m!397249 () Bool)

(assert (=> b!266442 m!397249))

(assert (=> b!266442 m!397249))

(declare-fun m!397251 () Bool)

(assert (=> b!266442 m!397251))

(assert (=> b!266446 m!397249))

(assert (=> b!266446 m!397249))

(declare-fun m!397253 () Bool)

(assert (=> b!266446 m!397253))

(declare-fun m!397255 () Bool)

(assert (=> b!266439 m!397255))

(declare-fun m!397257 () Bool)

(assert (=> start!58036 m!397257))

(declare-fun m!397259 () Bool)

(assert (=> start!58036 m!397259))

(declare-fun m!397261 () Bool)

(assert (=> start!58036 m!397261))

(assert (=> b!266445 m!397249))

(declare-fun m!397263 () Bool)

(assert (=> b!266445 m!397263))

(declare-fun m!397265 () Bool)

(assert (=> b!266445 m!397265))

(declare-fun m!397267 () Bool)

(assert (=> b!266441 m!397267))

(declare-fun m!397269 () Bool)

(assert (=> b!266441 m!397269))

(declare-fun m!397271 () Bool)

(assert (=> b!266441 m!397271))

(declare-fun m!397273 () Bool)

(assert (=> b!266441 m!397273))

(declare-fun m!397275 () Bool)

(assert (=> b!266441 m!397275))

(declare-fun m!397277 () Bool)

(assert (=> b!266441 m!397277))

(declare-fun m!397279 () Bool)

(assert (=> b!266447 m!397279))

(declare-fun m!397281 () Bool)

(assert (=> b!266443 m!397281))

(push 1)

