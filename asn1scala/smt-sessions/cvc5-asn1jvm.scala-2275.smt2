; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57582 () Bool)

(assert start!57582)

(declare-fun b!264113 () Bool)

(declare-fun res!220834 () Bool)

(declare-fun e!184292 () Bool)

(assert (=> b!264113 (=> res!220834 e!184292)))

(declare-datatypes ((array!14735 0))(
  ( (array!14736 (arr!7417 (Array (_ BitVec 32) (_ BitVec 8))) (size!6430 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11674 0))(
  ( (BitStream!11675 (buf!6898 array!14735) (currentByte!12762 (_ BitVec 32)) (currentBit!12757 (_ BitVec 32))) )
))
(declare-fun lt!405462 () BitStream!11674)

(declare-fun w1!584 () BitStream!11674)

(declare-fun isPrefixOf!0 (BitStream!11674 BitStream!11674) Bool)

(assert (=> b!264113 (= res!220834 (not (isPrefixOf!0 lt!405462 w1!584)))))

(declare-fun b!264114 () Bool)

(declare-datatypes ((Unit!18821 0))(
  ( (Unit!18822) )
))
(declare-fun e!184290 () Unit!18821)

(declare-fun lt!405466 () Unit!18821)

(assert (=> b!264114 (= e!184290 lt!405466)))

(declare-fun lt!405463 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!264114 (= lt!405463 (bitIndex!0 (size!6430 (buf!6898 w1!584)) (currentByte!12762 w1!584) (currentBit!12757 w1!584)))))

(declare-fun w2!580 () BitStream!11674)

(declare-fun arrayBitRangesEqSymmetric!0 (array!14735 array!14735 (_ BitVec 64) (_ BitVec 64)) Unit!18821)

(assert (=> b!264114 (= lt!405466 (arrayBitRangesEqSymmetric!0 (buf!6898 w1!584) (buf!6898 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 lt!405463))))

(declare-fun arrayBitRangesEq!0 (array!14735 array!14735 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!264114 (arrayBitRangesEq!0 (buf!6898 w2!580) (buf!6898 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 lt!405463)))

(declare-fun b!264115 () Bool)

(declare-fun e!184287 () Bool)

(declare-fun array_inv!6154 (array!14735) Bool)

(assert (=> b!264115 (= e!184287 (array_inv!6154 (buf!6898 w2!580)))))

(declare-fun b!264116 () Bool)

(declare-fun e!184291 () Bool)

(assert (=> b!264116 (= e!184291 e!184292)))

(declare-fun res!220833 () Bool)

(assert (=> b!264116 (=> res!220833 e!184292)))

(declare-fun e!184288 () Bool)

(assert (=> b!264116 (= res!220833 e!184288)))

(declare-fun res!220835 () Bool)

(assert (=> b!264116 (=> (not res!220835) (not e!184288))))

(assert (=> b!264116 (= res!220835 (not (= (size!6430 (buf!6898 w1!584)) #b00000000000000000000000000000000)))))

(declare-fun lt!405461 () Unit!18821)

(assert (=> b!264116 (= lt!405461 e!184290)))

(declare-fun c!12096 () Bool)

(assert (=> b!264116 (= c!12096 (not (= (size!6430 (buf!6898 w1!584)) #b00000000000000000000000000000000)))))

(declare-fun b!264117 () Bool)

(declare-fun Unit!18823 () Unit!18821)

(assert (=> b!264117 (= e!184290 Unit!18823)))

(declare-fun b!264118 () Bool)

(assert (=> b!264118 (= e!184292 true)))

(assert (=> b!264118 (isPrefixOf!0 lt!405462 w2!580)))

(declare-fun lt!405464 () Unit!18821)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!11674 BitStream!11674 BitStream!11674) Unit!18821)

(assert (=> b!264118 (= lt!405464 (lemmaIsPrefixTransitive!0 lt!405462 w1!584 w2!580))))

(declare-fun b!264119 () Bool)

(declare-fun e!184289 () Bool)

(assert (=> b!264119 (= e!184289 (array_inv!6154 (buf!6898 w1!584)))))

(declare-fun b!264120 () Bool)

(declare-fun e!184296 () Bool)

(assert (=> b!264120 (= e!184296 (not (arrayBitRangesEq!0 (buf!6898 w1!584) (buf!6898 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6430 (buf!6898 w1!584)) (currentByte!12762 w1!584) (currentBit!12757 w1!584)))))))

(declare-fun res!220832 () Bool)

(declare-fun e!184293 () Bool)

(assert (=> start!57582 (=> (not res!220832) (not e!184293))))

(assert (=> start!57582 (= res!220832 (isPrefixOf!0 w1!584 w2!580))))

(assert (=> start!57582 e!184293))

(declare-fun inv!12 (BitStream!11674) Bool)

(assert (=> start!57582 (and (inv!12 w1!584) e!184289)))

(assert (=> start!57582 (and (inv!12 w2!580) e!184287)))

(declare-fun b!264121 () Bool)

(assert (=> b!264121 (= e!184288 (not (arrayBitRangesEq!0 (buf!6898 w2!580) (buf!6898 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6430 (buf!6898 w1!584)) (currentByte!12762 w1!584) (currentBit!12757 w1!584)))))))

(declare-fun b!264122 () Bool)

(assert (=> b!264122 (= e!184293 (not e!184291))))

(declare-fun res!220837 () Bool)

(assert (=> b!264122 (=> res!220837 e!184291)))

(assert (=> b!264122 (= res!220837 e!184296)))

(declare-fun res!220836 () Bool)

(assert (=> b!264122 (=> (not res!220836) (not e!184296))))

(assert (=> b!264122 (= res!220836 (not (= (size!6430 (buf!6898 w1!584)) #b00000000000000000000000000000000)))))

(assert (=> b!264122 (isPrefixOf!0 w2!580 w2!580)))

(declare-fun lt!405460 () Unit!18821)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!11674) Unit!18821)

(assert (=> b!264122 (= lt!405460 (lemmaIsPrefixRefl!0 w2!580))))

(assert (=> b!264122 (isPrefixOf!0 lt!405462 lt!405462)))

(declare-fun lt!405467 () Unit!18821)

(assert (=> b!264122 (= lt!405467 (lemmaIsPrefixRefl!0 lt!405462))))

(assert (=> b!264122 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!405465 () Unit!18821)

(assert (=> b!264122 (= lt!405465 (lemmaIsPrefixRefl!0 w1!584))))

(assert (=> b!264122 (= lt!405462 (BitStream!11675 (buf!6898 w2!580) (currentByte!12762 w1!584) (currentBit!12757 w1!584)))))

(assert (= (and start!57582 res!220832) b!264122))

(assert (= (and b!264122 res!220836) b!264120))

(assert (= (and b!264122 (not res!220837)) b!264116))

(assert (= (and b!264116 c!12096) b!264114))

(assert (= (and b!264116 (not c!12096)) b!264117))

(assert (= (and b!264116 res!220835) b!264121))

(assert (= (and b!264116 (not res!220833)) b!264113))

(assert (= (and b!264113 (not res!220834)) b!264118))

(assert (= start!57582 b!264119))

(assert (= start!57582 b!264115))

(declare-fun m!394523 () Bool)

(assert (=> b!264114 m!394523))

(declare-fun m!394525 () Bool)

(assert (=> b!264114 m!394525))

(declare-fun m!394527 () Bool)

(assert (=> b!264114 m!394527))

(assert (=> b!264120 m!394523))

(assert (=> b!264120 m!394523))

(declare-fun m!394529 () Bool)

(assert (=> b!264120 m!394529))

(declare-fun m!394531 () Bool)

(assert (=> start!57582 m!394531))

(declare-fun m!394533 () Bool)

(assert (=> start!57582 m!394533))

(declare-fun m!394535 () Bool)

(assert (=> start!57582 m!394535))

(declare-fun m!394537 () Bool)

(assert (=> b!264122 m!394537))

(declare-fun m!394539 () Bool)

(assert (=> b!264122 m!394539))

(declare-fun m!394541 () Bool)

(assert (=> b!264122 m!394541))

(declare-fun m!394543 () Bool)

(assert (=> b!264122 m!394543))

(declare-fun m!394545 () Bool)

(assert (=> b!264122 m!394545))

(declare-fun m!394547 () Bool)

(assert (=> b!264122 m!394547))

(assert (=> b!264121 m!394523))

(assert (=> b!264121 m!394523))

(declare-fun m!394549 () Bool)

(assert (=> b!264121 m!394549))

(declare-fun m!394551 () Bool)

(assert (=> b!264118 m!394551))

(declare-fun m!394553 () Bool)

(assert (=> b!264118 m!394553))

(declare-fun m!394555 () Bool)

(assert (=> b!264119 m!394555))

(declare-fun m!394557 () Bool)

(assert (=> b!264113 m!394557))

(declare-fun m!394559 () Bool)

(assert (=> b!264115 m!394559))

(push 1)

(assert (not b!264120))

(assert (not start!57582))

(assert (not b!264114))

(assert (not b!264118))

(assert (not b!264119))

(assert (not b!264115))

(assert (not b!264121))

(assert (not b!264113))

(assert (not b!264122))

(check-sat)

