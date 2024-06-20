; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58498 () Bool)

(assert start!58498)

(declare-fun b!268560 () Bool)

(declare-fun e!188549 () Bool)

(declare-fun e!188552 () Bool)

(assert (=> b!268560 (= e!188549 (not e!188552))))

(declare-fun res!223976 () Bool)

(assert (=> b!268560 (=> res!223976 e!188552)))

(declare-datatypes ((array!14973 0))(
  ( (array!14974 (arr!7515 (Array (_ BitVec 32) (_ BitVec 8))) (size!6528 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11870 0))(
  ( (BitStream!11871 (buf!6996 array!14973) (currentByte!12920 (_ BitVec 32)) (currentBit!12915 (_ BitVec 32))) )
))
(declare-fun w1!591 () BitStream!11870)

(declare-fun w2!587 () BitStream!11870)

(assert (=> b!268560 (= res!223976 (or (bvsge (currentByte!12920 w1!591) (size!6528 (buf!6996 w1!591))) (bvsge (currentByte!12920 w1!591) (currentByte!12920 w2!587))))))

(declare-fun w3!25 () BitStream!11870)

(declare-fun arrayRangesEq!1063 (array!14973 array!14973 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!268560 (arrayRangesEq!1063 (buf!6996 w1!591) (buf!6996 w3!25) #b00000000000000000000000000000000 (currentByte!12920 w1!591))))

(declare-datatypes ((Unit!19035 0))(
  ( (Unit!19036) )
))
(declare-fun lt!408560 () Unit!19035)

(declare-fun arrayRangesEqTransitive!338 (array!14973 array!14973 array!14973 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19035)

(assert (=> b!268560 (= lt!408560 (arrayRangesEqTransitive!338 (buf!6996 w1!591) (buf!6996 w2!587) (buf!6996 w3!25) #b00000000000000000000000000000000 (currentByte!12920 w1!591) (currentByte!12920 w2!587)))))

(declare-fun b!268561 () Bool)

(declare-fun e!188548 () Bool)

(declare-fun array_inv!6252 (array!14973) Bool)

(assert (=> b!268561 (= e!188548 (array_inv!6252 (buf!6996 w3!25)))))

(declare-fun b!268562 () Bool)

(declare-fun e!188547 () Bool)

(assert (=> b!268562 (= e!188547 (array_inv!6252 (buf!6996 w2!587)))))

(declare-fun b!268563 () Bool)

(declare-fun e!188551 () Bool)

(assert (=> b!268563 (= e!188551 (array_inv!6252 (buf!6996 w1!591)))))

(declare-fun res!223978 () Bool)

(assert (=> start!58498 (=> (not res!223978) (not e!188549))))

(declare-fun isPrefixOf!0 (BitStream!11870 BitStream!11870) Bool)

(assert (=> start!58498 (= res!223978 (isPrefixOf!0 w1!591 w2!587))))

(assert (=> start!58498 e!188549))

(declare-fun inv!12 (BitStream!11870) Bool)

(assert (=> start!58498 (and (inv!12 w1!591) e!188551)))

(assert (=> start!58498 (and (inv!12 w2!587) e!188547)))

(assert (=> start!58498 (and (inv!12 w3!25) e!188548)))

(declare-fun b!268564 () Bool)

(assert (=> b!268564 (= e!188552 (= ((_ sign_extend 24) (select (arr!7515 (buf!6996 w2!587)) (currentByte!12920 w1!591))) ((_ sign_extend 24) (select (arr!7515 (buf!6996 w3!25)) (currentByte!12920 w1!591)))))))

(assert (=> b!268564 (= (select (arr!7515 (buf!6996 w2!587)) (currentByte!12920 w1!591)) (select (arr!7515 (buf!6996 w3!25)) (currentByte!12920 w1!591)))))

(declare-fun lt!408559 () Unit!19035)

(declare-fun arrayRangesEqImpliesEq!153 (array!14973 array!14973 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19035)

(assert (=> b!268564 (= lt!408559 (arrayRangesEqImpliesEq!153 (buf!6996 w2!587) (buf!6996 w3!25) #b00000000000000000000000000000000 (currentByte!12920 w1!591) (currentByte!12920 w2!587)))))

(declare-fun b!268565 () Bool)

(declare-fun res!223977 () Bool)

(assert (=> b!268565 (=> (not res!223977) (not e!188549))))

(assert (=> b!268565 (= res!223977 (isPrefixOf!0 w2!587 w3!25))))

(assert (= (and start!58498 res!223978) b!268565))

(assert (= (and b!268565 res!223977) b!268560))

(assert (= (and b!268560 (not res!223976)) b!268564))

(assert (= start!58498 b!268563))

(assert (= start!58498 b!268562))

(assert (= start!58498 b!268561))

(declare-fun m!400041 () Bool)

(assert (=> b!268562 m!400041))

(declare-fun m!400043 () Bool)

(assert (=> b!268564 m!400043))

(declare-fun m!400045 () Bool)

(assert (=> b!268564 m!400045))

(declare-fun m!400047 () Bool)

(assert (=> b!268564 m!400047))

(declare-fun m!400049 () Bool)

(assert (=> b!268565 m!400049))

(declare-fun m!400051 () Bool)

(assert (=> b!268561 m!400051))

(declare-fun m!400053 () Bool)

(assert (=> b!268563 m!400053))

(declare-fun m!400055 () Bool)

(assert (=> start!58498 m!400055))

(declare-fun m!400057 () Bool)

(assert (=> start!58498 m!400057))

(declare-fun m!400059 () Bool)

(assert (=> start!58498 m!400059))

(declare-fun m!400061 () Bool)

(assert (=> start!58498 m!400061))

(declare-fun m!400063 () Bool)

(assert (=> b!268560 m!400063))

(declare-fun m!400065 () Bool)

(assert (=> b!268560 m!400065))

(push 1)

(assert (not b!268564))

(assert (not b!268560))

(assert (not b!268561))

(assert (not b!268565))

(assert (not b!268562))

(assert (not start!58498))

(assert (not b!268563))

(check-sat)

(pop 1)

(push 1)

(check-sat)

