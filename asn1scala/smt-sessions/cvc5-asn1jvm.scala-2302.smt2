; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58272 () Bool)

(assert start!58272)

(declare-fun b!267721 () Bool)

(declare-fun e!187733 () Bool)

(declare-datatypes ((array!14930 0))(
  ( (array!14931 (arr!7498 (Array (_ BitVec 32) (_ BitVec 8))) (size!6511 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11836 0))(
  ( (BitStream!11837 (buf!6979 array!14930) (currentByte!12885 (_ BitVec 32)) (currentBit!12880 (_ BitVec 32))) )
))
(declare-fun w3!25 () BitStream!11836)

(declare-fun array_inv!6235 (array!14930) Bool)

(assert (=> b!267721 (= e!187733 (array_inv!6235 (buf!6979 w3!25)))))

(declare-fun b!267722 () Bool)

(declare-fun e!187734 () Bool)

(declare-fun w1!591 () BitStream!11836)

(assert (=> b!267722 (= e!187734 (array_inv!6235 (buf!6979 w1!591)))))

(declare-fun res!223381 () Bool)

(declare-fun e!187736 () Bool)

(assert (=> start!58272 (=> (not res!223381) (not e!187736))))

(declare-fun w2!587 () BitStream!11836)

(declare-fun isPrefixOf!0 (BitStream!11836 BitStream!11836) Bool)

(assert (=> start!58272 (= res!223381 (isPrefixOf!0 w1!591 w2!587))))

(assert (=> start!58272 e!187736))

(declare-fun inv!12 (BitStream!11836) Bool)

(assert (=> start!58272 (and (inv!12 w1!591) e!187734)))

(declare-fun e!187731 () Bool)

(assert (=> start!58272 (and (inv!12 w2!587) e!187731)))

(assert (=> start!58272 (and (inv!12 w3!25) e!187733)))

(declare-fun b!267723 () Bool)

(declare-fun res!223380 () Bool)

(assert (=> b!267723 (=> (not res!223380) (not e!187736))))

(assert (=> b!267723 (= res!223380 (isPrefixOf!0 w2!587 w3!25))))

(declare-fun b!267724 () Bool)

(assert (=> b!267724 (= e!187731 (array_inv!6235 (buf!6979 w2!587)))))

(declare-fun b!267725 () Bool)

(assert (=> b!267725 (= e!187736 (not true))))

(declare-fun arrayRangesEq!1046 (array!14930 array!14930 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!267725 (arrayRangesEq!1046 (buf!6979 w1!591) (buf!6979 w3!25) #b00000000000000000000000000000000 (currentByte!12885 w1!591))))

(declare-datatypes ((Unit!18995 0))(
  ( (Unit!18996) )
))
(declare-fun lt!408050 () Unit!18995)

(declare-fun arrayRangesEqTransitive!321 (array!14930 array!14930 array!14930 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18995)

(assert (=> b!267725 (= lt!408050 (arrayRangesEqTransitive!321 (buf!6979 w1!591) (buf!6979 w2!587) (buf!6979 w3!25) #b00000000000000000000000000000000 (currentByte!12885 w1!591) (currentByte!12885 w2!587)))))

(assert (= (and start!58272 res!223381) b!267723))

(assert (= (and b!267723 res!223380) b!267725))

(assert (= start!58272 b!267722))

(assert (= start!58272 b!267724))

(assert (= start!58272 b!267721))

(declare-fun m!399005 () Bool)

(assert (=> b!267722 m!399005))

(declare-fun m!399007 () Bool)

(assert (=> start!58272 m!399007))

(declare-fun m!399009 () Bool)

(assert (=> start!58272 m!399009))

(declare-fun m!399011 () Bool)

(assert (=> start!58272 m!399011))

(declare-fun m!399013 () Bool)

(assert (=> start!58272 m!399013))

(declare-fun m!399015 () Bool)

(assert (=> b!267721 m!399015))

(declare-fun m!399017 () Bool)

(assert (=> b!267724 m!399017))

(declare-fun m!399019 () Bool)

(assert (=> b!267725 m!399019))

(declare-fun m!399021 () Bool)

(assert (=> b!267725 m!399021))

(declare-fun m!399023 () Bool)

(assert (=> b!267723 m!399023))

(push 1)

(assert (not b!267722))

(assert (not b!267721))

(assert (not b!267725))

(assert (not start!58272))

(assert (not b!267723))

(assert (not b!267724))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

