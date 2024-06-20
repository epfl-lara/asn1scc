; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57394 () Bool)

(assert start!57394)

(declare-fun res!220061 () Bool)

(declare-fun e!183209 () Bool)

(assert (=> start!57394 (=> (not res!220061) (not e!183209))))

(declare-datatypes ((array!14670 0))(
  ( (array!14671 (arr!7389 (Array (_ BitVec 32) (_ BitVec 8))) (size!6402 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11618 0))(
  ( (BitStream!11619 (buf!6870 array!14670) (currentByte!12722 (_ BitVec 32)) (currentBit!12717 (_ BitVec 32))) )
))
(declare-fun w1!584 () BitStream!11618)

(declare-fun w2!580 () BitStream!11618)

(declare-fun isPrefixOf!0 (BitStream!11618 BitStream!11618) Bool)

(assert (=> start!57394 (= res!220061 (isPrefixOf!0 w1!584 w2!580))))

(assert (=> start!57394 e!183209))

(declare-fun e!183207 () Bool)

(declare-fun inv!12 (BitStream!11618) Bool)

(assert (=> start!57394 (and (inv!12 w1!584) e!183207)))

(declare-fun e!183208 () Bool)

(assert (=> start!57394 (and (inv!12 w2!580) e!183208)))

(declare-fun b!262989 () Bool)

(declare-fun res!220060 () Bool)

(declare-fun e!183212 () Bool)

(assert (=> b!262989 (=> res!220060 e!183212)))

(assert (=> b!262989 (= res!220060 (= (size!6402 (buf!6870 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!262990 () Bool)

(declare-fun array_inv!6126 (array!14670) Bool)

(assert (=> b!262990 (= e!183207 (array_inv!6126 (buf!6870 w1!584)))))

(declare-fun b!262991 () Bool)

(assert (=> b!262991 (= e!183212 true)))

(declare-fun lt!404540 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!262991 (= lt!404540 (bitIndex!0 (size!6402 (buf!6870 w1!584)) (currentByte!12722 w1!584) (currentBit!12717 w1!584)))))

(declare-fun b!262992 () Bool)

(assert (=> b!262992 (= e!183209 (not e!183212))))

(declare-fun res!220062 () Bool)

(assert (=> b!262992 (=> res!220062 e!183212)))

(declare-fun e!183210 () Bool)

(assert (=> b!262992 (= res!220062 e!183210)))

(declare-fun res!220063 () Bool)

(assert (=> b!262992 (=> (not res!220063) (not e!183210))))

(assert (=> b!262992 (= res!220063 (not (= (size!6402 (buf!6870 w1!584)) #b00000000000000000000000000000000)))))

(assert (=> b!262992 (isPrefixOf!0 w2!580 w2!580)))

(declare-datatypes ((Unit!18747 0))(
  ( (Unit!18748) )
))
(declare-fun lt!404539 () Unit!18747)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!11618) Unit!18747)

(assert (=> b!262992 (= lt!404539 (lemmaIsPrefixRefl!0 w2!580))))

(declare-fun lt!404541 () BitStream!11618)

(assert (=> b!262992 (isPrefixOf!0 lt!404541 lt!404541)))

(declare-fun lt!404542 () Unit!18747)

(assert (=> b!262992 (= lt!404542 (lemmaIsPrefixRefl!0 lt!404541))))

(assert (=> b!262992 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!404543 () Unit!18747)

(assert (=> b!262992 (= lt!404543 (lemmaIsPrefixRefl!0 w1!584))))

(assert (=> b!262992 (= lt!404541 (BitStream!11619 (buf!6870 w2!580) (currentByte!12722 w1!584) (currentBit!12717 w1!584)))))

(declare-fun b!262993 () Bool)

(declare-fun arrayBitRangesEq!0 (array!14670 array!14670 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!262993 (= e!183210 (not (arrayBitRangesEq!0 (buf!6870 w1!584) (buf!6870 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6402 (buf!6870 w1!584)) (currentByte!12722 w1!584) (currentBit!12717 w1!584)))))))

(declare-fun b!262994 () Bool)

(assert (=> b!262994 (= e!183208 (array_inv!6126 (buf!6870 w2!580)))))

(assert (= (and start!57394 res!220061) b!262992))

(assert (= (and b!262992 res!220063) b!262993))

(assert (= (and b!262992 (not res!220062)) b!262989))

(assert (= (and b!262989 (not res!220060)) b!262991))

(assert (= start!57394 b!262990))

(assert (= start!57394 b!262994))

(declare-fun m!393171 () Bool)

(assert (=> b!262994 m!393171))

(declare-fun m!393173 () Bool)

(assert (=> b!262990 m!393173))

(declare-fun m!393175 () Bool)

(assert (=> start!57394 m!393175))

(declare-fun m!393177 () Bool)

(assert (=> start!57394 m!393177))

(declare-fun m!393179 () Bool)

(assert (=> start!57394 m!393179))

(declare-fun m!393181 () Bool)

(assert (=> b!262993 m!393181))

(assert (=> b!262993 m!393181))

(declare-fun m!393183 () Bool)

(assert (=> b!262993 m!393183))

(assert (=> b!262991 m!393181))

(declare-fun m!393185 () Bool)

(assert (=> b!262992 m!393185))

(declare-fun m!393187 () Bool)

(assert (=> b!262992 m!393187))

(declare-fun m!393189 () Bool)

(assert (=> b!262992 m!393189))

(declare-fun m!393191 () Bool)

(assert (=> b!262992 m!393191))

(declare-fun m!393193 () Bool)

(assert (=> b!262992 m!393193))

(declare-fun m!393195 () Bool)

(assert (=> b!262992 m!393195))

(push 1)

(assert (not b!262993))

(assert (not b!262991))

(assert (not b!262994))

