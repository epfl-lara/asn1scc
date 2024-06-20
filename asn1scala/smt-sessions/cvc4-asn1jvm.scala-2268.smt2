; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57412 () Bool)

(assert start!57412)

(declare-fun b!263151 () Bool)

(declare-fun e!183402 () Bool)

(declare-datatypes ((array!14688 0))(
  ( (array!14689 (arr!7398 (Array (_ BitVec 32) (_ BitVec 8))) (size!6411 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11636 0))(
  ( (BitStream!11637 (buf!6879 array!14688) (currentByte!12731 (_ BitVec 32)) (currentBit!12726 (_ BitVec 32))) )
))
(declare-fun w1!584 () BitStream!11636)

(declare-fun w2!580 () BitStream!11636)

(declare-fun arrayBitRangesEq!0 (array!14688 array!14688 (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!263151 (= e!183402 (not (arrayBitRangesEq!0 (buf!6879 w1!584) (buf!6879 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6411 (buf!6879 w1!584)) (currentByte!12731 w1!584) (currentBit!12726 w1!584)))))))

(declare-fun b!263152 () Bool)

(declare-fun res!220171 () Bool)

(declare-fun e!183396 () Bool)

(assert (=> b!263152 (=> res!220171 e!183396)))

(assert (=> b!263152 (= res!220171 (= (size!6411 (buf!6879 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!263153 () Bool)

(declare-fun e!183398 () Bool)

(assert (=> b!263153 (= e!183398 (not e!183396))))

(declare-fun res!220170 () Bool)

(assert (=> b!263153 (=> res!220170 e!183396)))

(assert (=> b!263153 (= res!220170 e!183402)))

(declare-fun res!220168 () Bool)

(assert (=> b!263153 (=> (not res!220168) (not e!183402))))

(assert (=> b!263153 (= res!220168 (not (= (size!6411 (buf!6879 w1!584)) #b00000000000000000000000000000000)))))

(declare-fun isPrefixOf!0 (BitStream!11636 BitStream!11636) Bool)

(assert (=> b!263153 (isPrefixOf!0 w2!580 w2!580)))

(declare-datatypes ((Unit!18765 0))(
  ( (Unit!18766) )
))
(declare-fun lt!404675 () Unit!18765)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!11636) Unit!18765)

(assert (=> b!263153 (= lt!404675 (lemmaIsPrefixRefl!0 w2!580))))

(declare-fun lt!404677 () BitStream!11636)

(assert (=> b!263153 (isPrefixOf!0 lt!404677 lt!404677)))

(declare-fun lt!404678 () Unit!18765)

(assert (=> b!263153 (= lt!404678 (lemmaIsPrefixRefl!0 lt!404677))))

(assert (=> b!263153 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!404674 () Unit!18765)

(assert (=> b!263153 (= lt!404674 (lemmaIsPrefixRefl!0 w1!584))))

(assert (=> b!263153 (= lt!404677 (BitStream!11637 (buf!6879 w2!580) (currentByte!12731 w1!584) (currentBit!12726 w1!584)))))

(declare-fun b!263154 () Bool)

(declare-fun e!183399 () Bool)

(declare-fun array_inv!6135 (array!14688) Bool)

(assert (=> b!263154 (= e!183399 (array_inv!6135 (buf!6879 w1!584)))))

(declare-fun b!263155 () Bool)

(declare-fun e!183401 () Bool)

(assert (=> b!263155 (= e!183401 (array_inv!6135 (buf!6879 w2!580)))))

(declare-fun b!263156 () Bool)

(assert (=> b!263156 (= e!183396 true)))

(declare-fun lt!404676 () (_ BitVec 64))

(assert (=> b!263156 (= lt!404676 (bitIndex!0 (size!6411 (buf!6879 w1!584)) (currentByte!12731 w1!584) (currentBit!12726 w1!584)))))

(declare-fun res!220169 () Bool)

(assert (=> start!57412 (=> (not res!220169) (not e!183398))))

(assert (=> start!57412 (= res!220169 (isPrefixOf!0 w1!584 w2!580))))

(assert (=> start!57412 e!183398))

(declare-fun inv!12 (BitStream!11636) Bool)

(assert (=> start!57412 (and (inv!12 w1!584) e!183399)))

(assert (=> start!57412 (and (inv!12 w2!580) e!183401)))

(assert (= (and start!57412 res!220169) b!263153))

(assert (= (and b!263153 res!220168) b!263151))

(assert (= (and b!263153 (not res!220170)) b!263152))

(assert (= (and b!263152 (not res!220171)) b!263156))

(assert (= start!57412 b!263154))

(assert (= start!57412 b!263155))

(declare-fun m!393405 () Bool)

(assert (=> b!263153 m!393405))

(declare-fun m!393407 () Bool)

(assert (=> b!263153 m!393407))

(declare-fun m!393409 () Bool)

(assert (=> b!263153 m!393409))

(declare-fun m!393411 () Bool)

(assert (=> b!263153 m!393411))

(declare-fun m!393413 () Bool)

(assert (=> b!263153 m!393413))

(declare-fun m!393415 () Bool)

(assert (=> b!263153 m!393415))

(declare-fun m!393417 () Bool)

(assert (=> b!263151 m!393417))

(assert (=> b!263151 m!393417))

(declare-fun m!393419 () Bool)

(assert (=> b!263151 m!393419))

(declare-fun m!393421 () Bool)

(assert (=> start!57412 m!393421))

(declare-fun m!393423 () Bool)

(assert (=> start!57412 m!393423))

(declare-fun m!393425 () Bool)

(assert (=> start!57412 m!393425))

(declare-fun m!393427 () Bool)

(assert (=> b!263154 m!393427))

(declare-fun m!393429 () Bool)

(assert (=> b!263155 m!393429))

(assert (=> b!263156 m!393417))

(push 1)

(assert (not b!263153))

(assert (not b!263151))

