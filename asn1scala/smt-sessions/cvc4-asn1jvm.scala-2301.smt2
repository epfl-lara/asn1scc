; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58270 () Bool)

(assert start!58270)

(declare-fun b!267706 () Bool)

(declare-fun e!187716 () Bool)

(declare-datatypes ((array!14928 0))(
  ( (array!14929 (arr!7497 (Array (_ BitVec 32) (_ BitVec 8))) (size!6510 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11834 0))(
  ( (BitStream!11835 (buf!6978 array!14928) (currentByte!12884 (_ BitVec 32)) (currentBit!12879 (_ BitVec 32))) )
))
(declare-fun w3!25 () BitStream!11834)

(declare-fun array_inv!6234 (array!14928) Bool)

(assert (=> b!267706 (= e!187716 (array_inv!6234 (buf!6978 w3!25)))))

(declare-fun b!267707 () Bool)

(declare-fun e!187714 () Bool)

(assert (=> b!267707 (= e!187714 (not true))))

(declare-fun w1!591 () BitStream!11834)

(declare-fun arrayRangesEq!1045 (array!14928 array!14928 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!267707 (arrayRangesEq!1045 (buf!6978 w1!591) (buf!6978 w3!25) #b00000000000000000000000000000000 (currentByte!12884 w1!591))))

(declare-datatypes ((Unit!18993 0))(
  ( (Unit!18994) )
))
(declare-fun lt!408047 () Unit!18993)

(declare-fun w2!587 () BitStream!11834)

(declare-fun arrayRangesEqTransitive!320 (array!14928 array!14928 array!14928 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18993)

(assert (=> b!267707 (= lt!408047 (arrayRangesEqTransitive!320 (buf!6978 w1!591) (buf!6978 w2!587) (buf!6978 w3!25) #b00000000000000000000000000000000 (currentByte!12884 w1!591) (currentByte!12884 w2!587)))))

(declare-fun b!267708 () Bool)

(declare-fun e!187712 () Bool)

(assert (=> b!267708 (= e!187712 (array_inv!6234 (buf!6978 w1!591)))))

(declare-fun res!223375 () Bool)

(assert (=> start!58270 (=> (not res!223375) (not e!187714))))

(declare-fun isPrefixOf!0 (BitStream!11834 BitStream!11834) Bool)

(assert (=> start!58270 (= res!223375 (isPrefixOf!0 w1!591 w2!587))))

(assert (=> start!58270 e!187714))

(declare-fun inv!12 (BitStream!11834) Bool)

(assert (=> start!58270 (and (inv!12 w1!591) e!187712)))

(declare-fun e!187710 () Bool)

(assert (=> start!58270 (and (inv!12 w2!587) e!187710)))

(assert (=> start!58270 (and (inv!12 w3!25) e!187716)))

(declare-fun b!267709 () Bool)

(assert (=> b!267709 (= e!187710 (array_inv!6234 (buf!6978 w2!587)))))

(declare-fun b!267710 () Bool)

(declare-fun res!223374 () Bool)

(assert (=> b!267710 (=> (not res!223374) (not e!187714))))

(assert (=> b!267710 (= res!223374 (isPrefixOf!0 w2!587 w3!25))))

(assert (= (and start!58270 res!223375) b!267710))

(assert (= (and b!267710 res!223374) b!267707))

(assert (= start!58270 b!267708))

(assert (= start!58270 b!267709))

(assert (= start!58270 b!267706))

(declare-fun m!398985 () Bool)

(assert (=> b!267708 m!398985))

(declare-fun m!398987 () Bool)

(assert (=> b!267709 m!398987))

(declare-fun m!398989 () Bool)

(assert (=> b!267710 m!398989))

(declare-fun m!398991 () Bool)

(assert (=> b!267706 m!398991))

(declare-fun m!398993 () Bool)

(assert (=> start!58270 m!398993))

(declare-fun m!398995 () Bool)

(assert (=> start!58270 m!398995))

(declare-fun m!398997 () Bool)

(assert (=> start!58270 m!398997))

(declare-fun m!398999 () Bool)

(assert (=> start!58270 m!398999))

(declare-fun m!399001 () Bool)

(assert (=> b!267707 m!399001))

(declare-fun m!399003 () Bool)

(assert (=> b!267707 m!399003))

(push 1)

(assert (not start!58270))

(assert (not b!267709))

(assert (not b!267707))

(assert (not b!267706))

(assert (not b!267710))

(assert (not b!267708))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

