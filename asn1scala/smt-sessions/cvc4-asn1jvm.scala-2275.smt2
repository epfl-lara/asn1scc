; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57586 () Bool)

(assert start!57586)

(declare-fun b!264173 () Bool)

(declare-fun e!184355 () Bool)

(declare-datatypes ((array!14739 0))(
  ( (array!14740 (arr!7419 (Array (_ BitVec 32) (_ BitVec 8))) (size!6432 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11678 0))(
  ( (BitStream!11679 (buf!6900 array!14739) (currentByte!12764 (_ BitVec 32)) (currentBit!12759 (_ BitVec 32))) )
))
(declare-fun w1!584 () BitStream!11678)

(declare-fun w2!580 () BitStream!11678)

(declare-fun arrayBitRangesEq!0 (array!14739 array!14739 (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!264173 (= e!184355 (not (arrayBitRangesEq!0 (buf!6900 w1!584) (buf!6900 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6432 (buf!6900 w1!584)) (currentByte!12764 w1!584) (currentBit!12759 w1!584)))))))

(declare-fun b!264174 () Bool)

(declare-fun e!184354 () Bool)

(declare-fun e!184349 () Bool)

(assert (=> b!264174 (= e!184354 e!184349)))

(declare-fun res!220870 () Bool)

(assert (=> b!264174 (=> res!220870 e!184349)))

(declare-fun e!184347 () Bool)

(assert (=> b!264174 (= res!220870 e!184347)))

(declare-fun res!220873 () Bool)

(assert (=> b!264174 (=> (not res!220873) (not e!184347))))

(assert (=> b!264174 (= res!220873 (not (= (size!6432 (buf!6900 w1!584)) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!18827 0))(
  ( (Unit!18828) )
))
(declare-fun lt!405508 () Unit!18827)

(declare-fun e!184352 () Unit!18827)

(assert (=> b!264174 (= lt!405508 e!184352)))

(declare-fun c!12102 () Bool)

(assert (=> b!264174 (= c!12102 (not (= (size!6432 (buf!6900 w1!584)) #b00000000000000000000000000000000)))))

(declare-fun res!220868 () Bool)

(declare-fun e!184348 () Bool)

(assert (=> start!57586 (=> (not res!220868) (not e!184348))))

(declare-fun isPrefixOf!0 (BitStream!11678 BitStream!11678) Bool)

(assert (=> start!57586 (= res!220868 (isPrefixOf!0 w1!584 w2!580))))

(assert (=> start!57586 e!184348))

(declare-fun e!184353 () Bool)

(declare-fun inv!12 (BitStream!11678) Bool)

(assert (=> start!57586 (and (inv!12 w1!584) e!184353)))

(declare-fun e!184351 () Bool)

(assert (=> start!57586 (and (inv!12 w2!580) e!184351)))

(declare-fun b!264175 () Bool)

(declare-fun array_inv!6156 (array!14739) Bool)

(assert (=> b!264175 (= e!184353 (array_inv!6156 (buf!6900 w1!584)))))

(declare-fun b!264176 () Bool)

(declare-fun Unit!18829 () Unit!18827)

(assert (=> b!264176 (= e!184352 Unit!18829)))

(declare-fun b!264177 () Bool)

(assert (=> b!264177 (= e!184349 true)))

(declare-fun lt!405514 () BitStream!11678)

(assert (=> b!264177 (isPrefixOf!0 lt!405514 w2!580)))

(declare-fun lt!405512 () Unit!18827)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!11678 BitStream!11678 BitStream!11678) Unit!18827)

(assert (=> b!264177 (= lt!405512 (lemmaIsPrefixTransitive!0 lt!405514 w1!584 w2!580))))

(declare-fun b!264178 () Bool)

(assert (=> b!264178 (= e!184351 (array_inv!6156 (buf!6900 w2!580)))))

(declare-fun b!264179 () Bool)

(assert (=> b!264179 (= e!184348 (not e!184354))))

(declare-fun res!220871 () Bool)

(assert (=> b!264179 (=> res!220871 e!184354)))

(assert (=> b!264179 (= res!220871 e!184355)))

(declare-fun res!220869 () Bool)

(assert (=> b!264179 (=> (not res!220869) (not e!184355))))

(assert (=> b!264179 (= res!220869 (not (= (size!6432 (buf!6900 w1!584)) #b00000000000000000000000000000000)))))

(assert (=> b!264179 (isPrefixOf!0 w2!580 w2!580)))

(declare-fun lt!405509 () Unit!18827)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!11678) Unit!18827)

(assert (=> b!264179 (= lt!405509 (lemmaIsPrefixRefl!0 w2!580))))

(assert (=> b!264179 (isPrefixOf!0 lt!405514 lt!405514)))

(declare-fun lt!405515 () Unit!18827)

(assert (=> b!264179 (= lt!405515 (lemmaIsPrefixRefl!0 lt!405514))))

(assert (=> b!264179 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!405510 () Unit!18827)

(assert (=> b!264179 (= lt!405510 (lemmaIsPrefixRefl!0 w1!584))))

(assert (=> b!264179 (= lt!405514 (BitStream!11679 (buf!6900 w2!580) (currentByte!12764 w1!584) (currentBit!12759 w1!584)))))

(declare-fun b!264180 () Bool)

(declare-fun res!220872 () Bool)

(assert (=> b!264180 (=> res!220872 e!184349)))

(assert (=> b!264180 (= res!220872 (not (isPrefixOf!0 lt!405514 w1!584)))))

(declare-fun b!264181 () Bool)

(assert (=> b!264181 (= e!184347 (not (arrayBitRangesEq!0 (buf!6900 w2!580) (buf!6900 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6432 (buf!6900 w1!584)) (currentByte!12764 w1!584) (currentBit!12759 w1!584)))))))

(declare-fun b!264182 () Bool)

(declare-fun lt!405513 () Unit!18827)

(assert (=> b!264182 (= e!184352 lt!405513)))

(declare-fun lt!405511 () (_ BitVec 64))

(assert (=> b!264182 (= lt!405511 (bitIndex!0 (size!6432 (buf!6900 w1!584)) (currentByte!12764 w1!584) (currentBit!12759 w1!584)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!14739 array!14739 (_ BitVec 64) (_ BitVec 64)) Unit!18827)

(assert (=> b!264182 (= lt!405513 (arrayBitRangesEqSymmetric!0 (buf!6900 w1!584) (buf!6900 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 lt!405511))))

(assert (=> b!264182 (arrayBitRangesEq!0 (buf!6900 w2!580) (buf!6900 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 lt!405511)))

(assert (= (and start!57586 res!220868) b!264179))

(assert (= (and b!264179 res!220869) b!264173))

(assert (= (and b!264179 (not res!220871)) b!264174))

(assert (= (and b!264174 c!12102) b!264182))

(assert (= (and b!264174 (not c!12102)) b!264176))

(assert (= (and b!264174 res!220873) b!264181))

(assert (= (and b!264174 (not res!220870)) b!264180))

(assert (= (and b!264180 (not res!220872)) b!264177))

(assert (= start!57586 b!264175))

(assert (= start!57586 b!264178))

(declare-fun m!394599 () Bool)

(assert (=> b!264180 m!394599))

(declare-fun m!394601 () Bool)

(assert (=> b!264177 m!394601))

(declare-fun m!394603 () Bool)

(assert (=> b!264177 m!394603))

(declare-fun m!394605 () Bool)

(assert (=> b!264173 m!394605))

(assert (=> b!264173 m!394605))

(declare-fun m!394607 () Bool)

(assert (=> b!264173 m!394607))

(assert (=> b!264181 m!394605))

(assert (=> b!264181 m!394605))

(declare-fun m!394609 () Bool)

(assert (=> b!264181 m!394609))

(declare-fun m!394611 () Bool)

(assert (=> b!264178 m!394611))

(declare-fun m!394613 () Bool)

(assert (=> start!57586 m!394613))

(declare-fun m!394615 () Bool)

(assert (=> start!57586 m!394615))

(declare-fun m!394617 () Bool)

(assert (=> start!57586 m!394617))

(declare-fun m!394619 () Bool)

(assert (=> b!264175 m!394619))

(declare-fun m!394621 () Bool)

(assert (=> b!264179 m!394621))

(declare-fun m!394623 () Bool)

(assert (=> b!264179 m!394623))

(declare-fun m!394625 () Bool)

(assert (=> b!264179 m!394625))

(declare-fun m!394627 () Bool)

(assert (=> b!264179 m!394627))

(declare-fun m!394629 () Bool)

(assert (=> b!264179 m!394629))

(declare-fun m!394631 () Bool)

(assert (=> b!264179 m!394631))

(assert (=> b!264182 m!394605))

(declare-fun m!394633 () Bool)

(assert (=> b!264182 m!394633))

(declare-fun m!394635 () Bool)

(assert (=> b!264182 m!394635))

(push 1)

(assert (not start!57586))

(assert (not b!264179))

(assert (not b!264173))

(assert (not b!264181))

(assert (not b!264180))

(assert (not b!264175))

(assert (not b!264178))

(assert (not b!264182))

(assert (not b!264177))

