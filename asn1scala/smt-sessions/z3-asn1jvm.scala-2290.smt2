; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58040 () Bool)

(assert start!58040)

(declare-fun b!266498 () Bool)

(declare-fun e!186448 () Bool)

(declare-datatypes ((array!14854 0))(
  ( (array!14855 (arr!7463 (Array (_ BitVec 32) (_ BitVec 8))) (size!6476 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11766 0))(
  ( (BitStream!11767 (buf!6944 array!14854) (currentByte!12838 (_ BitVec 32)) (currentBit!12833 (_ BitVec 32))) )
))
(declare-fun w2!580 () BitStream!11766)

(declare-fun w1!584 () BitStream!11766)

(declare-fun arrayBitRangesEq!0 (array!14854 array!14854 (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!266498 (= e!186448 (not (arrayBitRangesEq!0 (buf!6944 w2!580) (buf!6944 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6476 (buf!6944 w1!584)) (currentByte!12838 w1!584) (currentBit!12833 w1!584)))))))

(declare-fun b!266499 () Bool)

(declare-fun res!222600 () Bool)

(declare-fun e!186450 () Bool)

(assert (=> b!266499 (=> res!222600 e!186450)))

(declare-fun lt!407217 () BitStream!11766)

(declare-fun isPrefixOf!0 (BitStream!11766 BitStream!11766) Bool)

(assert (=> b!266499 (= res!222600 (not (isPrefixOf!0 lt!407217 w1!584)))))

(declare-fun b!266500 () Bool)

(declare-datatypes ((Unit!18926 0))(
  ( (Unit!18927) )
))
(declare-fun e!186447 () Unit!18926)

(declare-fun lt!407216 () Unit!18926)

(assert (=> b!266500 (= e!186447 lt!407216)))

(declare-fun lt!407221 () (_ BitVec 64))

(assert (=> b!266500 (= lt!407221 (bitIndex!0 (size!6476 (buf!6944 w1!584)) (currentByte!12838 w1!584) (currentBit!12833 w1!584)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!14854 array!14854 (_ BitVec 64) (_ BitVec 64)) Unit!18926)

(assert (=> b!266500 (= lt!407216 (arrayBitRangesEqSymmetric!0 (buf!6944 w1!584) (buf!6944 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 lt!407221))))

(assert (=> b!266500 (arrayBitRangesEq!0 (buf!6944 w2!580) (buf!6944 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 lt!407221)))

(declare-fun b!266501 () Bool)

(declare-fun e!186445 () Bool)

(declare-fun array_inv!6200 (array!14854) Bool)

(assert (=> b!266501 (= e!186445 (array_inv!6200 (buf!6944 w2!580)))))

(declare-fun res!222599 () Bool)

(declare-fun e!186449 () Bool)

(assert (=> start!58040 (=> (not res!222599) (not e!186449))))

(assert (=> start!58040 (= res!222599 (isPrefixOf!0 w1!584 w2!580))))

(assert (=> start!58040 e!186449))

(declare-fun e!186446 () Bool)

(declare-fun inv!12 (BitStream!11766) Bool)

(assert (=> start!58040 (and (inv!12 w1!584) e!186446)))

(assert (=> start!58040 (and (inv!12 w2!580) e!186445)))

(declare-fun b!266502 () Bool)

(declare-fun e!186443 () Bool)

(assert (=> b!266502 (= e!186443 e!186450)))

(declare-fun res!222598 () Bool)

(assert (=> b!266502 (=> res!222598 e!186450)))

(assert (=> b!266502 (= res!222598 e!186448)))

(declare-fun res!222601 () Bool)

(assert (=> b!266502 (=> (not res!222601) (not e!186448))))

(assert (=> b!266502 (= res!222601 (not (= (size!6476 (buf!6944 w1!584)) #b00000000000000000000000000000000)))))

(declare-fun lt!407222 () Unit!18926)

(assert (=> b!266502 (= lt!407222 e!186447)))

(declare-fun c!12267 () Bool)

(assert (=> b!266502 (= c!12267 (not (= (size!6476 (buf!6944 w1!584)) #b00000000000000000000000000000000)))))

(declare-fun b!266503 () Bool)

(assert (=> b!266503 (= e!186450 true)))

(assert (=> b!266503 (isPrefixOf!0 lt!407217 w2!580)))

(declare-fun lt!407220 () Unit!18926)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!11766 BitStream!11766 BitStream!11766) Unit!18926)

(assert (=> b!266503 (= lt!407220 (lemmaIsPrefixTransitive!0 lt!407217 w1!584 w2!580))))

(declare-fun b!266504 () Bool)

(declare-fun e!186442 () Bool)

(assert (=> b!266504 (= e!186442 (not (arrayBitRangesEq!0 (buf!6944 w1!584) (buf!6944 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6476 (buf!6944 w1!584)) (currentByte!12838 w1!584) (currentBit!12833 w1!584)))))))

(declare-fun b!266505 () Bool)

(declare-fun Unit!18928 () Unit!18926)

(assert (=> b!266505 (= e!186447 Unit!18928)))

(declare-fun b!266506 () Bool)

(assert (=> b!266506 (= e!186446 (array_inv!6200 (buf!6944 w1!584)))))

(declare-fun b!266507 () Bool)

(assert (=> b!266507 (= e!186449 (not e!186443))))

(declare-fun res!222596 () Bool)

(assert (=> b!266507 (=> res!222596 e!186443)))

(assert (=> b!266507 (= res!222596 e!186442)))

(declare-fun res!222597 () Bool)

(assert (=> b!266507 (=> (not res!222597) (not e!186442))))

(assert (=> b!266507 (= res!222597 (not (= (size!6476 (buf!6944 w1!584)) #b00000000000000000000000000000000)))))

(assert (=> b!266507 (isPrefixOf!0 w2!580 w2!580)))

(declare-fun lt!407218 () Unit!18926)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!11766) Unit!18926)

(assert (=> b!266507 (= lt!407218 (lemmaIsPrefixRefl!0 w2!580))))

(assert (=> b!266507 (isPrefixOf!0 lt!407217 lt!407217)))

(declare-fun lt!407215 () Unit!18926)

(assert (=> b!266507 (= lt!407215 (lemmaIsPrefixRefl!0 lt!407217))))

(assert (=> b!266507 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!407219 () Unit!18926)

(assert (=> b!266507 (= lt!407219 (lemmaIsPrefixRefl!0 w1!584))))

(assert (=> b!266507 (= lt!407217 (BitStream!11767 (buf!6944 w2!580) (currentByte!12838 w1!584) (currentBit!12833 w1!584)))))

(assert (= (and start!58040 res!222599) b!266507))

(assert (= (and b!266507 res!222597) b!266504))

(assert (= (and b!266507 (not res!222596)) b!266502))

(assert (= (and b!266502 c!12267) b!266500))

(assert (= (and b!266502 (not c!12267)) b!266505))

(assert (= (and b!266502 res!222601) b!266498))

(assert (= (and b!266502 (not res!222598)) b!266499))

(assert (= (and b!266499 (not res!222600)) b!266503))

(assert (= start!58040 b!266506))

(assert (= start!58040 b!266501))

(declare-fun m!397321 () Bool)

(assert (=> b!266498 m!397321))

(assert (=> b!266498 m!397321))

(declare-fun m!397323 () Bool)

(assert (=> b!266498 m!397323))

(declare-fun m!397325 () Bool)

(assert (=> b!266507 m!397325))

(declare-fun m!397327 () Bool)

(assert (=> b!266507 m!397327))

(declare-fun m!397329 () Bool)

(assert (=> b!266507 m!397329))

(declare-fun m!397331 () Bool)

(assert (=> b!266507 m!397331))

(declare-fun m!397333 () Bool)

(assert (=> b!266507 m!397333))

(declare-fun m!397335 () Bool)

(assert (=> b!266507 m!397335))

(declare-fun m!397337 () Bool)

(assert (=> start!58040 m!397337))

(declare-fun m!397339 () Bool)

(assert (=> start!58040 m!397339))

(declare-fun m!397341 () Bool)

(assert (=> start!58040 m!397341))

(assert (=> b!266500 m!397321))

(declare-fun m!397343 () Bool)

(assert (=> b!266500 m!397343))

(declare-fun m!397345 () Bool)

(assert (=> b!266500 m!397345))

(declare-fun m!397347 () Bool)

(assert (=> b!266503 m!397347))

(declare-fun m!397349 () Bool)

(assert (=> b!266503 m!397349))

(assert (=> b!266504 m!397321))

(assert (=> b!266504 m!397321))

(declare-fun m!397351 () Bool)

(assert (=> b!266504 m!397351))

(declare-fun m!397353 () Bool)

(assert (=> b!266506 m!397353))

(declare-fun m!397355 () Bool)

(assert (=> b!266499 m!397355))

(declare-fun m!397357 () Bool)

(assert (=> b!266501 m!397357))

(check-sat (not b!266500) (not b!266503) (not b!266499) (not b!266504) (not b!266501) (not b!266498) (not b!266507) (not start!58040) (not b!266506))
(check-sat)
