; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58260 () Bool)

(assert start!58260)

(declare-fun b!267631 () Bool)

(declare-fun e!187607 () Bool)

(declare-datatypes ((array!14918 0))(
  ( (array!14919 (arr!7492 (Array (_ BitVec 32) (_ BitVec 8))) (size!6505 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11824 0))(
  ( (BitStream!11825 (buf!6973 array!14918) (currentByte!12879 (_ BitVec 32)) (currentBit!12874 (_ BitVec 32))) )
))
(declare-fun w2!587 () BitStream!11824)

(declare-fun array_inv!6229 (array!14918) Bool)

(assert (=> b!267631 (= e!187607 (array_inv!6229 (buf!6973 w2!587)))))

(declare-fun b!267633 () Bool)

(declare-fun e!187611 () Bool)

(declare-fun w3!25 () BitStream!11824)

(assert (=> b!267633 (= e!187611 (array_inv!6229 (buf!6973 w3!25)))))

(declare-fun b!267634 () Bool)

(declare-fun res!223344 () Bool)

(declare-fun e!187605 () Bool)

(assert (=> b!267634 (=> (not res!223344) (not e!187605))))

(declare-fun isPrefixOf!0 (BitStream!11824 BitStream!11824) Bool)

(assert (=> b!267634 (= res!223344 (isPrefixOf!0 w2!587 w3!25))))

(declare-fun b!267635 () Bool)

(assert (=> b!267635 (= e!187605 (not true))))

(declare-fun w1!591 () BitStream!11824)

(declare-fun arrayRangesEq!1040 (array!14918 array!14918 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!267635 (arrayRangesEq!1040 (buf!6973 w1!591) (buf!6973 w3!25) #b00000000000000000000000000000000 (currentByte!12879 w1!591))))

(declare-datatypes ((Unit!18983 0))(
  ( (Unit!18984) )
))
(declare-fun lt!408032 () Unit!18983)

(declare-fun arrayRangesEqTransitive!315 (array!14918 array!14918 array!14918 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18983)

(assert (=> b!267635 (= lt!408032 (arrayRangesEqTransitive!315 (buf!6973 w1!591) (buf!6973 w2!587) (buf!6973 w3!25) #b00000000000000000000000000000000 (currentByte!12879 w1!591) (currentByte!12879 w2!587)))))

(declare-fun b!267632 () Bool)

(declare-fun e!187608 () Bool)

(assert (=> b!267632 (= e!187608 (array_inv!6229 (buf!6973 w1!591)))))

(declare-fun res!223345 () Bool)

(assert (=> start!58260 (=> (not res!223345) (not e!187605))))

(assert (=> start!58260 (= res!223345 (isPrefixOf!0 w1!591 w2!587))))

(assert (=> start!58260 e!187605))

(declare-fun inv!12 (BitStream!11824) Bool)

(assert (=> start!58260 (and (inv!12 w1!591) e!187608)))

(assert (=> start!58260 (and (inv!12 w2!587) e!187607)))

(assert (=> start!58260 (and (inv!12 w3!25) e!187611)))

(assert (= (and start!58260 res!223345) b!267634))

(assert (= (and b!267634 res!223344) b!267635))

(assert (= start!58260 b!267632))

(assert (= start!58260 b!267631))

(assert (= start!58260 b!267633))

(declare-fun m!398885 () Bool)

(assert (=> b!267631 m!398885))

(declare-fun m!398887 () Bool)

(assert (=> b!267635 m!398887))

(declare-fun m!398889 () Bool)

(assert (=> b!267635 m!398889))

(declare-fun m!398891 () Bool)

(assert (=> b!267632 m!398891))

(declare-fun m!398893 () Bool)

(assert (=> b!267633 m!398893))

(declare-fun m!398895 () Bool)

(assert (=> b!267634 m!398895))

(declare-fun m!398897 () Bool)

(assert (=> start!58260 m!398897))

(declare-fun m!398899 () Bool)

(assert (=> start!58260 m!398899))

(declare-fun m!398901 () Bool)

(assert (=> start!58260 m!398901))

(declare-fun m!398903 () Bool)

(assert (=> start!58260 m!398903))

(push 1)

(assert (not b!267633))

(assert (not start!58260))

(assert (not b!267634))

(assert (not b!267635))

(assert (not b!267632))

(assert (not b!267631))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

