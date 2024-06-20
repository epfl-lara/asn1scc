; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58266 () Bool)

(assert start!58266)

(declare-fun res!223362 () Bool)

(declare-fun e!187669 () Bool)

(assert (=> start!58266 (=> (not res!223362) (not e!187669))))

(declare-datatypes ((array!14924 0))(
  ( (array!14925 (arr!7495 (Array (_ BitVec 32) (_ BitVec 8))) (size!6508 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11830 0))(
  ( (BitStream!11831 (buf!6976 array!14924) (currentByte!12882 (_ BitVec 32)) (currentBit!12877 (_ BitVec 32))) )
))
(declare-fun w1!591 () BitStream!11830)

(declare-fun w2!587 () BitStream!11830)

(declare-fun isPrefixOf!0 (BitStream!11830 BitStream!11830) Bool)

(assert (=> start!58266 (= res!223362 (isPrefixOf!0 w1!591 w2!587))))

(assert (=> start!58266 e!187669))

(declare-fun e!187672 () Bool)

(declare-fun inv!12 (BitStream!11830) Bool)

(assert (=> start!58266 (and (inv!12 w1!591) e!187672)))

(declare-fun e!187670 () Bool)

(assert (=> start!58266 (and (inv!12 w2!587) e!187670)))

(declare-fun w3!25 () BitStream!11830)

(declare-fun e!187668 () Bool)

(assert (=> start!58266 (and (inv!12 w3!25) e!187668)))

(declare-fun b!267676 () Bool)

(declare-fun array_inv!6232 (array!14924) Bool)

(assert (=> b!267676 (= e!187668 (array_inv!6232 (buf!6976 w3!25)))))

(declare-fun b!267677 () Bool)

(assert (=> b!267677 (= e!187669 (not true))))

(declare-fun arrayRangesEq!1043 (array!14924 array!14924 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!267677 (arrayRangesEq!1043 (buf!6976 w1!591) (buf!6976 w3!25) #b00000000000000000000000000000000 (currentByte!12882 w1!591))))

(declare-datatypes ((Unit!18989 0))(
  ( (Unit!18990) )
))
(declare-fun lt!408041 () Unit!18989)

(declare-fun arrayRangesEqTransitive!318 (array!14924 array!14924 array!14924 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18989)

(assert (=> b!267677 (= lt!408041 (arrayRangesEqTransitive!318 (buf!6976 w1!591) (buf!6976 w2!587) (buf!6976 w3!25) #b00000000000000000000000000000000 (currentByte!12882 w1!591) (currentByte!12882 w2!587)))))

(declare-fun b!267678 () Bool)

(declare-fun res!223363 () Bool)

(assert (=> b!267678 (=> (not res!223363) (not e!187669))))

(assert (=> b!267678 (= res!223363 (isPrefixOf!0 w2!587 w3!25))))

(declare-fun b!267679 () Bool)

(assert (=> b!267679 (= e!187670 (array_inv!6232 (buf!6976 w2!587)))))

(declare-fun b!267680 () Bool)

(assert (=> b!267680 (= e!187672 (array_inv!6232 (buf!6976 w1!591)))))

(assert (= (and start!58266 res!223362) b!267678))

(assert (= (and b!267678 res!223363) b!267677))

(assert (= start!58266 b!267680))

(assert (= start!58266 b!267679))

(assert (= start!58266 b!267676))

(declare-fun m!398945 () Bool)

(assert (=> b!267678 m!398945))

(declare-fun m!398947 () Bool)

(assert (=> b!267680 m!398947))

(declare-fun m!398949 () Bool)

(assert (=> b!267677 m!398949))

(declare-fun m!398951 () Bool)

(assert (=> b!267677 m!398951))

(declare-fun m!398953 () Bool)

(assert (=> b!267679 m!398953))

(declare-fun m!398955 () Bool)

(assert (=> b!267676 m!398955))

(declare-fun m!398957 () Bool)

(assert (=> start!58266 m!398957))

(declare-fun m!398959 () Bool)

(assert (=> start!58266 m!398959))

(declare-fun m!398961 () Bool)

(assert (=> start!58266 m!398961))

(declare-fun m!398963 () Bool)

(assert (=> start!58266 m!398963))

(push 1)

(assert (not b!267676))

(assert (not b!267680))

(assert (not start!58266))

(assert (not b!267678))

(assert (not b!267679))

(assert (not b!267677))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

