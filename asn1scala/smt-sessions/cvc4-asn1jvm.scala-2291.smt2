; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58048 () Bool)

(assert start!58048)

(declare-fun res!222673 () Bool)

(declare-fun e!186562 () Bool)

(assert (=> start!58048 (=> (not res!222673) (not e!186562))))

(declare-datatypes ((array!14862 0))(
  ( (array!14863 (arr!7467 (Array (_ BitVec 32) (_ BitVec 8))) (size!6480 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11774 0))(
  ( (BitStream!11775 (buf!6948 array!14862) (currentByte!12842 (_ BitVec 32)) (currentBit!12837 (_ BitVec 32))) )
))
(declare-fun w1!584 () BitStream!11774)

(declare-fun w2!580 () BitStream!11774)

(declare-fun isPrefixOf!0 (BitStream!11774 BitStream!11774) Bool)

(assert (=> start!58048 (= res!222673 (isPrefixOf!0 w1!584 w2!580))))

(assert (=> start!58048 e!186562))

(declare-fun e!186563 () Bool)

(declare-fun inv!12 (BitStream!11774) Bool)

(assert (=> start!58048 (and (inv!12 w1!584) e!186563)))

(declare-fun e!186568 () Bool)

(assert (=> start!58048 (and (inv!12 w2!580) e!186568)))

(declare-fun b!266618 () Bool)

(declare-datatypes ((Unit!18938 0))(
  ( (Unit!18939) )
))
(declare-fun e!186569 () Unit!18938)

(declare-fun Unit!18940 () Unit!18938)

(assert (=> b!266618 (= e!186569 Unit!18940)))

(declare-fun b!266619 () Bool)

(declare-fun lt!407316 () Unit!18938)

(assert (=> b!266619 (= e!186569 lt!407316)))

(declare-fun lt!407315 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!266619 (= lt!407315 (bitIndex!0 (size!6480 (buf!6948 w1!584)) (currentByte!12842 w1!584) (currentBit!12837 w1!584)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!14862 array!14862 (_ BitVec 64) (_ BitVec 64)) Unit!18938)

(assert (=> b!266619 (= lt!407316 (arrayBitRangesEqSymmetric!0 (buf!6948 w1!584) (buf!6948 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 lt!407315))))

(declare-fun arrayBitRangesEq!0 (array!14862 array!14862 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!266619 (arrayBitRangesEq!0 (buf!6948 w2!580) (buf!6948 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 lt!407315)))

(declare-fun b!266620 () Bool)

(declare-fun e!186567 () Bool)

(assert (=> b!266620 (= e!186562 (not e!186567))))

(declare-fun res!222669 () Bool)

(assert (=> b!266620 (=> res!222669 e!186567)))

(declare-fun e!186570 () Bool)

(assert (=> b!266620 (= res!222669 e!186570)))

(declare-fun res!222670 () Bool)

(assert (=> b!266620 (=> (not res!222670) (not e!186570))))

(assert (=> b!266620 (= res!222670 (not (= (size!6480 (buf!6948 w1!584)) #b00000000000000000000000000000000)))))

(assert (=> b!266620 (isPrefixOf!0 w2!580 w2!580)))

(declare-fun lt!407317 () Unit!18938)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!11774) Unit!18938)

(assert (=> b!266620 (= lt!407317 (lemmaIsPrefixRefl!0 w2!580))))

(declare-fun lt!407311 () BitStream!11774)

(assert (=> b!266620 (isPrefixOf!0 lt!407311 lt!407311)))

(declare-fun lt!407314 () Unit!18938)

(assert (=> b!266620 (= lt!407314 (lemmaIsPrefixRefl!0 lt!407311))))

(assert (=> b!266620 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!407312 () Unit!18938)

(assert (=> b!266620 (= lt!407312 (lemmaIsPrefixRefl!0 w1!584))))

(assert (=> b!266620 (= lt!407311 (BitStream!11775 (buf!6948 w2!580) (currentByte!12842 w1!584) (currentBit!12837 w1!584)))))

(declare-fun b!266621 () Bool)

(assert (=> b!266621 (= e!186570 (not (arrayBitRangesEq!0 (buf!6948 w1!584) (buf!6948 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6480 (buf!6948 w1!584)) (currentByte!12842 w1!584) (currentBit!12837 w1!584)))))))

(declare-fun b!266622 () Bool)

(declare-fun array_inv!6204 (array!14862) Bool)

(assert (=> b!266622 (= e!186568 (array_inv!6204 (buf!6948 w2!580)))))

(declare-fun b!266623 () Bool)

(declare-fun e!186565 () Bool)

(assert (=> b!266623 (= e!186565 true)))

(assert (=> b!266623 (isPrefixOf!0 lt!407311 w2!580)))

(declare-fun lt!407313 () Unit!18938)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!11774 BitStream!11774 BitStream!11774) Unit!18938)

(assert (=> b!266623 (= lt!407313 (lemmaIsPrefixTransitive!0 lt!407311 w1!584 w2!580))))

(declare-fun b!266624 () Bool)

(declare-fun e!186566 () Bool)

(assert (=> b!266624 (= e!186566 (not (arrayBitRangesEq!0 (buf!6948 w2!580) (buf!6948 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6480 (buf!6948 w1!584)) (currentByte!12842 w1!584) (currentBit!12837 w1!584)))))))

(declare-fun b!266625 () Bool)

(assert (=> b!266625 (= e!186567 e!186565)))

(declare-fun res!222671 () Bool)

(assert (=> b!266625 (=> res!222671 e!186565)))

(assert (=> b!266625 (= res!222671 e!186566)))

(declare-fun res!222668 () Bool)

(assert (=> b!266625 (=> (not res!222668) (not e!186566))))

(assert (=> b!266625 (= res!222668 (not (= (size!6480 (buf!6948 w1!584)) #b00000000000000000000000000000000)))))

(declare-fun lt!407318 () Unit!18938)

(assert (=> b!266625 (= lt!407318 e!186569)))

(declare-fun c!12279 () Bool)

(assert (=> b!266625 (= c!12279 (not (= (size!6480 (buf!6948 w1!584)) #b00000000000000000000000000000000)))))

(declare-fun b!266626 () Bool)

(declare-fun res!222672 () Bool)

(assert (=> b!266626 (=> res!222672 e!186565)))

(assert (=> b!266626 (= res!222672 (not (isPrefixOf!0 lt!407311 w1!584)))))

(declare-fun b!266627 () Bool)

(assert (=> b!266627 (= e!186563 (array_inv!6204 (buf!6948 w1!584)))))

(assert (= (and start!58048 res!222673) b!266620))

(assert (= (and b!266620 res!222670) b!266621))

(assert (= (and b!266620 (not res!222669)) b!266625))

(assert (= (and b!266625 c!12279) b!266619))

(assert (= (and b!266625 (not c!12279)) b!266618))

(assert (= (and b!266625 res!222668) b!266624))

(assert (= (and b!266625 (not res!222671)) b!266626))

(assert (= (and b!266626 (not res!222672)) b!266623))

(assert (= start!58048 b!266627))

(assert (= start!58048 b!266622))

(declare-fun m!397473 () Bool)

(assert (=> b!266623 m!397473))

(declare-fun m!397475 () Bool)

(assert (=> b!266623 m!397475))

(declare-fun m!397477 () Bool)

(assert (=> b!266622 m!397477))

(declare-fun m!397479 () Bool)

(assert (=> b!266627 m!397479))

(declare-fun m!397481 () Bool)

(assert (=> b!266620 m!397481))

(declare-fun m!397483 () Bool)

(assert (=> b!266620 m!397483))

(declare-fun m!397485 () Bool)

(assert (=> b!266620 m!397485))

(declare-fun m!397487 () Bool)

(assert (=> b!266620 m!397487))

(declare-fun m!397489 () Bool)

(assert (=> b!266620 m!397489))

(declare-fun m!397491 () Bool)

(assert (=> b!266620 m!397491))

(declare-fun m!397493 () Bool)

(assert (=> b!266619 m!397493))

(declare-fun m!397495 () Bool)

(assert (=> b!266619 m!397495))

(declare-fun m!397497 () Bool)

(assert (=> b!266619 m!397497))

(assert (=> b!266621 m!397493))

(assert (=> b!266621 m!397493))

(declare-fun m!397499 () Bool)

(assert (=> b!266621 m!397499))

(assert (=> b!266624 m!397493))

(assert (=> b!266624 m!397493))

(declare-fun m!397501 () Bool)

(assert (=> b!266624 m!397501))

(declare-fun m!397503 () Bool)

(assert (=> start!58048 m!397503))

(declare-fun m!397505 () Bool)

(assert (=> start!58048 m!397505))

(declare-fun m!397507 () Bool)

(assert (=> start!58048 m!397507))

(declare-fun m!397509 () Bool)

(assert (=> b!266626 m!397509))

(push 1)

