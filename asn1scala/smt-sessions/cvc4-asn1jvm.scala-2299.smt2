; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58258 () Bool)

(assert start!58258)

(declare-fun b!267616 () Bool)

(declare-fun e!187586 () Bool)

(declare-datatypes ((array!14916 0))(
  ( (array!14917 (arr!7491 (Array (_ BitVec 32) (_ BitVec 8))) (size!6504 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11822 0))(
  ( (BitStream!11823 (buf!6972 array!14916) (currentByte!12878 (_ BitVec 32)) (currentBit!12873 (_ BitVec 32))) )
))
(declare-fun w3!25 () BitStream!11822)

(declare-fun array_inv!6228 (array!14916) Bool)

(assert (=> b!267616 (= e!187586 (array_inv!6228 (buf!6972 w3!25)))))

(declare-fun b!267617 () Bool)

(declare-fun e!187587 () Bool)

(assert (=> b!267617 (= e!187587 (not true))))

(declare-fun w1!591 () BitStream!11822)

(declare-fun arrayRangesEq!1039 (array!14916 array!14916 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!267617 (arrayRangesEq!1039 (buf!6972 w1!591) (buf!6972 w3!25) #b00000000000000000000000000000000 (currentByte!12878 w1!591))))

(declare-fun w2!587 () BitStream!11822)

(declare-datatypes ((Unit!18981 0))(
  ( (Unit!18982) )
))
(declare-fun lt!408029 () Unit!18981)

(declare-fun arrayRangesEqTransitive!314 (array!14916 array!14916 array!14916 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18981)

(assert (=> b!267617 (= lt!408029 (arrayRangesEqTransitive!314 (buf!6972 w1!591) (buf!6972 w2!587) (buf!6972 w3!25) #b00000000000000000000000000000000 (currentByte!12878 w1!591) (currentByte!12878 w2!587)))))

(declare-fun res!223339 () Bool)

(assert (=> start!58258 (=> (not res!223339) (not e!187587))))

(declare-fun isPrefixOf!0 (BitStream!11822 BitStream!11822) Bool)

(assert (=> start!58258 (= res!223339 (isPrefixOf!0 w1!591 w2!587))))

(assert (=> start!58258 e!187587))

(declare-fun e!187589 () Bool)

(declare-fun inv!12 (BitStream!11822) Bool)

(assert (=> start!58258 (and (inv!12 w1!591) e!187589)))

(declare-fun e!187584 () Bool)

(assert (=> start!58258 (and (inv!12 w2!587) e!187584)))

(assert (=> start!58258 (and (inv!12 w3!25) e!187586)))

(declare-fun b!267618 () Bool)

(assert (=> b!267618 (= e!187589 (array_inv!6228 (buf!6972 w1!591)))))

(declare-fun b!267619 () Bool)

(assert (=> b!267619 (= e!187584 (array_inv!6228 (buf!6972 w2!587)))))

(declare-fun b!267620 () Bool)

(declare-fun res!223338 () Bool)

(assert (=> b!267620 (=> (not res!223338) (not e!187587))))

(assert (=> b!267620 (= res!223338 (isPrefixOf!0 w2!587 w3!25))))

(assert (= (and start!58258 res!223339) b!267620))

(assert (= (and b!267620 res!223338) b!267617))

(assert (= start!58258 b!267618))

(assert (= start!58258 b!267619))

(assert (= start!58258 b!267616))

(declare-fun m!398865 () Bool)

(assert (=> start!58258 m!398865))

(declare-fun m!398867 () Bool)

(assert (=> start!58258 m!398867))

(declare-fun m!398869 () Bool)

(assert (=> start!58258 m!398869))

(declare-fun m!398871 () Bool)

(assert (=> start!58258 m!398871))

(declare-fun m!398873 () Bool)

(assert (=> b!267620 m!398873))

(declare-fun m!398875 () Bool)

(assert (=> b!267616 m!398875))

(declare-fun m!398877 () Bool)

(assert (=> b!267619 m!398877))

(declare-fun m!398879 () Bool)

(assert (=> b!267617 m!398879))

(declare-fun m!398881 () Bool)

(assert (=> b!267617 m!398881))

(declare-fun m!398883 () Bool)

(assert (=> b!267618 m!398883))

(push 1)

(assert (not b!267618))

(assert (not start!58258))

(assert (not b!267617))

(assert (not b!267620))

(assert (not b!267616))

(assert (not b!267619))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

