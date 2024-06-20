; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57580 () Bool)

(assert start!57580)

(declare-fun b!264084 () Bool)

(declare-fun e!184258 () Bool)

(declare-datatypes ((array!14733 0))(
  ( (array!14734 (arr!7416 (Array (_ BitVec 32) (_ BitVec 8))) (size!6429 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11672 0))(
  ( (BitStream!11673 (buf!6897 array!14733) (currentByte!12761 (_ BitVec 32)) (currentBit!12756 (_ BitVec 32))) )
))
(declare-fun w1!584 () BitStream!11672)

(declare-fun w2!580 () BitStream!11672)

(declare-fun arrayBitRangesEq!0 (array!14733 array!14733 (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!264084 (= e!184258 (not (arrayBitRangesEq!0 (buf!6897 w1!584) (buf!6897 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6429 (buf!6897 w1!584)) (currentByte!12761 w1!584) (currentBit!12756 w1!584)))))))

(declare-fun b!264085 () Bool)

(declare-fun e!184260 () Bool)

(declare-fun e!184257 () Bool)

(assert (=> b!264085 (= e!184260 (not e!184257))))

(declare-fun res!220817 () Bool)

(assert (=> b!264085 (=> res!220817 e!184257)))

(assert (=> b!264085 (= res!220817 e!184258)))

(declare-fun res!220815 () Bool)

(assert (=> b!264085 (=> (not res!220815) (not e!184258))))

(assert (=> b!264085 (= res!220815 (not (= (size!6429 (buf!6897 w1!584)) #b00000000000000000000000000000000)))))

(declare-fun isPrefixOf!0 (BitStream!11672 BitStream!11672) Bool)

(assert (=> b!264085 (isPrefixOf!0 w2!580 w2!580)))

(declare-datatypes ((Unit!18818 0))(
  ( (Unit!18819) )
))
(declare-fun lt!405441 () Unit!18818)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!11672) Unit!18818)

(assert (=> b!264085 (= lt!405441 (lemmaIsPrefixRefl!0 w2!580))))

(declare-fun lt!405443 () BitStream!11672)

(assert (=> b!264085 (isPrefixOf!0 lt!405443 lt!405443)))

(declare-fun lt!405442 () Unit!18818)

(assert (=> b!264085 (= lt!405442 (lemmaIsPrefixRefl!0 lt!405443))))

(assert (=> b!264085 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!405439 () Unit!18818)

(assert (=> b!264085 (= lt!405439 (lemmaIsPrefixRefl!0 w1!584))))

(assert (=> b!264085 (= lt!405443 (BitStream!11673 (buf!6897 w2!580) (currentByte!12761 w1!584) (currentBit!12756 w1!584)))))

(declare-fun b!264086 () Bool)

(declare-fun e!184266 () Bool)

(declare-fun array_inv!6153 (array!14733) Bool)

(assert (=> b!264086 (= e!184266 (array_inv!6153 (buf!6897 w2!580)))))

(declare-fun b!264087 () Bool)

(declare-fun res!220814 () Bool)

(declare-fun e!184265 () Bool)

(assert (=> b!264087 (=> res!220814 e!184265)))

(assert (=> b!264087 (= res!220814 (not (isPrefixOf!0 lt!405443 w1!584)))))

(declare-fun b!264088 () Bool)

(declare-fun e!184262 () Bool)

(assert (=> b!264088 (= e!184262 (array_inv!6153 (buf!6897 w1!584)))))

(declare-fun b!264089 () Bool)

(declare-fun e!184263 () Bool)

(assert (=> b!264089 (= e!184263 (not (arrayBitRangesEq!0 (buf!6897 w2!580) (buf!6897 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6429 (buf!6897 w1!584)) (currentByte!12761 w1!584) (currentBit!12756 w1!584)))))))

(declare-fun b!264090 () Bool)

(declare-fun e!184261 () Unit!18818)

(declare-fun lt!405437 () Unit!18818)

(assert (=> b!264090 (= e!184261 lt!405437)))

(declare-fun lt!405438 () (_ BitVec 64))

(assert (=> b!264090 (= lt!405438 (bitIndex!0 (size!6429 (buf!6897 w1!584)) (currentByte!12761 w1!584) (currentBit!12756 w1!584)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!14733 array!14733 (_ BitVec 64) (_ BitVec 64)) Unit!18818)

(assert (=> b!264090 (= lt!405437 (arrayBitRangesEqSymmetric!0 (buf!6897 w1!584) (buf!6897 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 lt!405438))))

(assert (=> b!264090 (arrayBitRangesEq!0 (buf!6897 w2!580) (buf!6897 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 lt!405438)))

(declare-fun b!264083 () Bool)

(assert (=> b!264083 (= e!184265 true)))

(assert (=> b!264083 (isPrefixOf!0 lt!405443 w2!580)))

(declare-fun lt!405440 () Unit!18818)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!11672 BitStream!11672 BitStream!11672) Unit!18818)

(assert (=> b!264083 (= lt!405440 (lemmaIsPrefixTransitive!0 lt!405443 w1!584 w2!580))))

(declare-fun res!220819 () Bool)

(assert (=> start!57580 (=> (not res!220819) (not e!184260))))

(assert (=> start!57580 (= res!220819 (isPrefixOf!0 w1!584 w2!580))))

(assert (=> start!57580 e!184260))

(declare-fun inv!12 (BitStream!11672) Bool)

(assert (=> start!57580 (and (inv!12 w1!584) e!184262)))

(assert (=> start!57580 (and (inv!12 w2!580) e!184266)))

(declare-fun b!264091 () Bool)

(declare-fun Unit!18820 () Unit!18818)

(assert (=> b!264091 (= e!184261 Unit!18820)))

(declare-fun b!264092 () Bool)

(assert (=> b!264092 (= e!184257 e!184265)))

(declare-fun res!220816 () Bool)

(assert (=> b!264092 (=> res!220816 e!184265)))

(assert (=> b!264092 (= res!220816 e!184263)))

(declare-fun res!220818 () Bool)

(assert (=> b!264092 (=> (not res!220818) (not e!184263))))

(assert (=> b!264092 (= res!220818 (not (= (size!6429 (buf!6897 w1!584)) #b00000000000000000000000000000000)))))

(declare-fun lt!405436 () Unit!18818)

(assert (=> b!264092 (= lt!405436 e!184261)))

(declare-fun c!12093 () Bool)

(assert (=> b!264092 (= c!12093 (not (= (size!6429 (buf!6897 w1!584)) #b00000000000000000000000000000000)))))

(assert (= (and start!57580 res!220819) b!264085))

(assert (= (and b!264085 res!220815) b!264084))

(assert (= (and b!264085 (not res!220817)) b!264092))

(assert (= (and b!264092 c!12093) b!264090))

(assert (= (and b!264092 (not c!12093)) b!264091))

(assert (= (and b!264092 res!220818) b!264089))

(assert (= (and b!264092 (not res!220816)) b!264087))

(assert (= (and b!264087 (not res!220814)) b!264083))

(assert (= start!57580 b!264088))

(assert (= start!57580 b!264086))

(declare-fun m!394485 () Bool)

(assert (=> b!264085 m!394485))

(declare-fun m!394487 () Bool)

(assert (=> b!264085 m!394487))

(declare-fun m!394489 () Bool)

(assert (=> b!264085 m!394489))

(declare-fun m!394491 () Bool)

(assert (=> b!264085 m!394491))

(declare-fun m!394493 () Bool)

(assert (=> b!264085 m!394493))

(declare-fun m!394495 () Bool)

(assert (=> b!264085 m!394495))

(declare-fun m!394497 () Bool)

(assert (=> b!264089 m!394497))

(assert (=> b!264089 m!394497))

(declare-fun m!394499 () Bool)

(assert (=> b!264089 m!394499))

(declare-fun m!394501 () Bool)

(assert (=> start!57580 m!394501))

(declare-fun m!394503 () Bool)

(assert (=> start!57580 m!394503))

(declare-fun m!394505 () Bool)

(assert (=> start!57580 m!394505))

(declare-fun m!394507 () Bool)

(assert (=> b!264087 m!394507))

(declare-fun m!394509 () Bool)

(assert (=> b!264088 m!394509))

(assert (=> b!264084 m!394497))

(assert (=> b!264084 m!394497))

(declare-fun m!394511 () Bool)

(assert (=> b!264084 m!394511))

(declare-fun m!394513 () Bool)

(assert (=> b!264086 m!394513))

(assert (=> b!264090 m!394497))

(declare-fun m!394515 () Bool)

(assert (=> b!264090 m!394515))

(declare-fun m!394517 () Bool)

(assert (=> b!264090 m!394517))

(declare-fun m!394519 () Bool)

(assert (=> b!264083 m!394519))

(declare-fun m!394521 () Bool)

(assert (=> b!264083 m!394521))

(push 1)

