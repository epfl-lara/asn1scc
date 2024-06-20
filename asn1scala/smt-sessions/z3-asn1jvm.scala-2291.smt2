; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58046 () Bool)

(assert start!58046)

(declare-fun b!266588 () Bool)

(declare-fun e!186539 () Bool)

(declare-fun e!186533 () Bool)

(assert (=> b!266588 (= e!186539 e!186533)))

(declare-fun res!222653 () Bool)

(assert (=> b!266588 (=> res!222653 e!186533)))

(declare-fun e!186534 () Bool)

(assert (=> b!266588 (= res!222653 e!186534)))

(declare-fun res!222652 () Bool)

(assert (=> b!266588 (=> (not res!222652) (not e!186534))))

(declare-datatypes ((array!14860 0))(
  ( (array!14861 (arr!7466 (Array (_ BitVec 32) (_ BitVec 8))) (size!6479 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11772 0))(
  ( (BitStream!11773 (buf!6947 array!14860) (currentByte!12841 (_ BitVec 32)) (currentBit!12836 (_ BitVec 32))) )
))
(declare-fun w1!584 () BitStream!11772)

(assert (=> b!266588 (= res!222652 (not (= (size!6479 (buf!6947 w1!584)) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!18935 0))(
  ( (Unit!18936) )
))
(declare-fun lt!407294 () Unit!18935)

(declare-fun e!186531 () Unit!18935)

(assert (=> b!266588 (= lt!407294 e!186531)))

(declare-fun c!12276 () Bool)

(assert (=> b!266588 (= c!12276 (not (= (size!6479 (buf!6947 w1!584)) #b00000000000000000000000000000000)))))

(declare-fun b!266589 () Bool)

(assert (=> b!266589 (= e!186533 true)))

(declare-fun lt!407292 () BitStream!11772)

(declare-fun w2!580 () BitStream!11772)

(declare-fun isPrefixOf!0 (BitStream!11772 BitStream!11772) Bool)

(assert (=> b!266589 (isPrefixOf!0 lt!407292 w2!580)))

(declare-fun lt!407287 () Unit!18935)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!11772 BitStream!11772 BitStream!11772) Unit!18935)

(assert (=> b!266589 (= lt!407287 (lemmaIsPrefixTransitive!0 lt!407292 w1!584 w2!580))))

(declare-fun b!266590 () Bool)

(declare-fun e!186535 () Bool)

(declare-fun array_inv!6203 (array!14860) Bool)

(assert (=> b!266590 (= e!186535 (array_inv!6203 (buf!6947 w2!580)))))

(declare-fun b!266591 () Bool)

(declare-fun e!186536 () Bool)

(declare-fun arrayBitRangesEq!0 (array!14860 array!14860 (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!266591 (= e!186536 (not (arrayBitRangesEq!0 (buf!6947 w1!584) (buf!6947 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6479 (buf!6947 w1!584)) (currentByte!12841 w1!584) (currentBit!12836 w1!584)))))))

(declare-fun b!266592 () Bool)

(declare-fun lt!407291 () Unit!18935)

(assert (=> b!266592 (= e!186531 lt!407291)))

(declare-fun lt!407290 () (_ BitVec 64))

(assert (=> b!266592 (= lt!407290 (bitIndex!0 (size!6479 (buf!6947 w1!584)) (currentByte!12841 w1!584) (currentBit!12836 w1!584)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!14860 array!14860 (_ BitVec 64) (_ BitVec 64)) Unit!18935)

(assert (=> b!266592 (= lt!407291 (arrayBitRangesEqSymmetric!0 (buf!6947 w1!584) (buf!6947 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 lt!407290))))

(assert (=> b!266592 (arrayBitRangesEq!0 (buf!6947 w2!580) (buf!6947 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 lt!407290)))

(declare-fun b!266593 () Bool)

(declare-fun Unit!18937 () Unit!18935)

(assert (=> b!266593 (= e!186531 Unit!18937)))

(declare-fun b!266594 () Bool)

(declare-fun e!186538 () Bool)

(assert (=> b!266594 (= e!186538 (not e!186539))))

(declare-fun res!222650 () Bool)

(assert (=> b!266594 (=> res!222650 e!186539)))

(assert (=> b!266594 (= res!222650 e!186536)))

(declare-fun res!222651 () Bool)

(assert (=> b!266594 (=> (not res!222651) (not e!186536))))

(assert (=> b!266594 (= res!222651 (not (= (size!6479 (buf!6947 w1!584)) #b00000000000000000000000000000000)))))

(assert (=> b!266594 (isPrefixOf!0 w2!580 w2!580)))

(declare-fun lt!407288 () Unit!18935)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!11772) Unit!18935)

(assert (=> b!266594 (= lt!407288 (lemmaIsPrefixRefl!0 w2!580))))

(assert (=> b!266594 (isPrefixOf!0 lt!407292 lt!407292)))

(declare-fun lt!407289 () Unit!18935)

(assert (=> b!266594 (= lt!407289 (lemmaIsPrefixRefl!0 lt!407292))))

(assert (=> b!266594 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!407293 () Unit!18935)

(assert (=> b!266594 (= lt!407293 (lemmaIsPrefixRefl!0 w1!584))))

(assert (=> b!266594 (= lt!407292 (BitStream!11773 (buf!6947 w2!580) (currentByte!12841 w1!584) (currentBit!12836 w1!584)))))

(declare-fun res!222654 () Bool)

(assert (=> start!58046 (=> (not res!222654) (not e!186538))))

(assert (=> start!58046 (= res!222654 (isPrefixOf!0 w1!584 w2!580))))

(assert (=> start!58046 e!186538))

(declare-fun e!186532 () Bool)

(declare-fun inv!12 (BitStream!11772) Bool)

(assert (=> start!58046 (and (inv!12 w1!584) e!186532)))

(assert (=> start!58046 (and (inv!12 w2!580) e!186535)))

(declare-fun b!266595 () Bool)

(declare-fun res!222655 () Bool)

(assert (=> b!266595 (=> res!222655 e!186533)))

(assert (=> b!266595 (= res!222655 (not (isPrefixOf!0 lt!407292 w1!584)))))

(declare-fun b!266596 () Bool)

(assert (=> b!266596 (= e!186534 (not (arrayBitRangesEq!0 (buf!6947 w2!580) (buf!6947 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6479 (buf!6947 w1!584)) (currentByte!12841 w1!584) (currentBit!12836 w1!584)))))))

(declare-fun b!266597 () Bool)

(assert (=> b!266597 (= e!186532 (array_inv!6203 (buf!6947 w1!584)))))

(assert (= (and start!58046 res!222654) b!266594))

(assert (= (and b!266594 res!222651) b!266591))

(assert (= (and b!266594 (not res!222650)) b!266588))

(assert (= (and b!266588 c!12276) b!266592))

(assert (= (and b!266588 (not c!12276)) b!266593))

(assert (= (and b!266588 res!222652) b!266596))

(assert (= (and b!266588 (not res!222653)) b!266595))

(assert (= (and b!266595 (not res!222655)) b!266589))

(assert (= start!58046 b!266597))

(assert (= start!58046 b!266590))

(declare-fun m!397435 () Bool)

(assert (=> b!266591 m!397435))

(assert (=> b!266591 m!397435))

(declare-fun m!397437 () Bool)

(assert (=> b!266591 m!397437))

(assert (=> b!266592 m!397435))

(declare-fun m!397439 () Bool)

(assert (=> b!266592 m!397439))

(declare-fun m!397441 () Bool)

(assert (=> b!266592 m!397441))

(declare-fun m!397443 () Bool)

(assert (=> b!266589 m!397443))

(declare-fun m!397445 () Bool)

(assert (=> b!266589 m!397445))

(declare-fun m!397447 () Bool)

(assert (=> b!266597 m!397447))

(declare-fun m!397449 () Bool)

(assert (=> b!266594 m!397449))

(declare-fun m!397451 () Bool)

(assert (=> b!266594 m!397451))

(declare-fun m!397453 () Bool)

(assert (=> b!266594 m!397453))

(declare-fun m!397455 () Bool)

(assert (=> b!266594 m!397455))

(declare-fun m!397457 () Bool)

(assert (=> b!266594 m!397457))

(declare-fun m!397459 () Bool)

(assert (=> b!266594 m!397459))

(assert (=> b!266596 m!397435))

(assert (=> b!266596 m!397435))

(declare-fun m!397461 () Bool)

(assert (=> b!266596 m!397461))

(declare-fun m!397463 () Bool)

(assert (=> start!58046 m!397463))

(declare-fun m!397465 () Bool)

(assert (=> start!58046 m!397465))

(declare-fun m!397467 () Bool)

(assert (=> start!58046 m!397467))

(declare-fun m!397469 () Bool)

(assert (=> b!266590 m!397469))

(declare-fun m!397471 () Bool)

(assert (=> b!266595 m!397471))

(check-sat (not start!58046) (not b!266592) (not b!266595) (not b!266594) (not b!266596) (not b!266589) (not b!266590) (not b!266591) (not b!266597))
(check-sat)
