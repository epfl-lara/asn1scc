; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58276 () Bool)

(assert start!58276)

(declare-fun b!267751 () Bool)

(declare-fun res!223392 () Bool)

(declare-fun e!187774 () Bool)

(assert (=> b!267751 (=> (not res!223392) (not e!187774))))

(declare-datatypes ((array!14934 0))(
  ( (array!14935 (arr!7500 (Array (_ BitVec 32) (_ BitVec 8))) (size!6513 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11840 0))(
  ( (BitStream!11841 (buf!6981 array!14934) (currentByte!12887 (_ BitVec 32)) (currentBit!12882 (_ BitVec 32))) )
))
(declare-fun w2!587 () BitStream!11840)

(declare-fun w3!25 () BitStream!11840)

(declare-fun isPrefixOf!0 (BitStream!11840 BitStream!11840) Bool)

(assert (=> b!267751 (= res!223392 (isPrefixOf!0 w2!587 w3!25))))

(declare-fun b!267752 () Bool)

(assert (=> b!267752 (= e!187774 (not true))))

(declare-fun w1!591 () BitStream!11840)

(declare-fun arrayRangesEq!1048 (array!14934 array!14934 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!267752 (arrayRangesEq!1048 (buf!6981 w1!591) (buf!6981 w3!25) #b00000000000000000000000000000000 (currentByte!12887 w1!591))))

(declare-datatypes ((Unit!18999 0))(
  ( (Unit!19000) )
))
(declare-fun lt!408056 () Unit!18999)

(declare-fun arrayRangesEqTransitive!323 (array!14934 array!14934 array!14934 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18999)

(assert (=> b!267752 (= lt!408056 (arrayRangesEqTransitive!323 (buf!6981 w1!591) (buf!6981 w2!587) (buf!6981 w3!25) #b00000000000000000000000000000000 (currentByte!12887 w1!591) (currentByte!12887 w2!587)))))

(declare-fun b!267753 () Bool)

(declare-fun e!187773 () Bool)

(declare-fun array_inv!6237 (array!14934) Bool)

(assert (=> b!267753 (= e!187773 (array_inv!6237 (buf!6981 w3!25)))))

(declare-fun res!223393 () Bool)

(assert (=> start!58276 (=> (not res!223393) (not e!187774))))

(assert (=> start!58276 (= res!223393 (isPrefixOf!0 w1!591 w2!587))))

(assert (=> start!58276 e!187774))

(declare-fun e!187779 () Bool)

(declare-fun inv!12 (BitStream!11840) Bool)

(assert (=> start!58276 (and (inv!12 w1!591) e!187779)))

(declare-fun e!187777 () Bool)

(assert (=> start!58276 (and (inv!12 w2!587) e!187777)))

(assert (=> start!58276 (and (inv!12 w3!25) e!187773)))

(declare-fun b!267754 () Bool)

(assert (=> b!267754 (= e!187779 (array_inv!6237 (buf!6981 w1!591)))))

(declare-fun b!267755 () Bool)

(assert (=> b!267755 (= e!187777 (array_inv!6237 (buf!6981 w2!587)))))

(assert (= (and start!58276 res!223393) b!267751))

(assert (= (and b!267751 res!223392) b!267752))

(assert (= start!58276 b!267754))

(assert (= start!58276 b!267755))

(assert (= start!58276 b!267753))

(declare-fun m!399045 () Bool)

(assert (=> b!267751 m!399045))

(declare-fun m!399047 () Bool)

(assert (=> b!267752 m!399047))

(declare-fun m!399049 () Bool)

(assert (=> b!267752 m!399049))

(declare-fun m!399051 () Bool)

(assert (=> b!267755 m!399051))

(declare-fun m!399053 () Bool)

(assert (=> b!267753 m!399053))

(declare-fun m!399055 () Bool)

(assert (=> start!58276 m!399055))

(declare-fun m!399057 () Bool)

(assert (=> start!58276 m!399057))

(declare-fun m!399059 () Bool)

(assert (=> start!58276 m!399059))

(declare-fun m!399061 () Bool)

(assert (=> start!58276 m!399061))

(declare-fun m!399063 () Bool)

(assert (=> b!267754 m!399063))

(push 1)

(assert (not start!58276))

(assert (not b!267754))

(assert (not b!267753))

(assert (not b!267752))

(assert (not b!267755))

(assert (not b!267751))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

