; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58262 () Bool)

(assert start!58262)

(declare-fun res!223350 () Bool)

(declare-fun e!187630 () Bool)

(assert (=> start!58262 (=> (not res!223350) (not e!187630))))

(declare-datatypes ((array!14920 0))(
  ( (array!14921 (arr!7493 (Array (_ BitVec 32) (_ BitVec 8))) (size!6506 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11826 0))(
  ( (BitStream!11827 (buf!6974 array!14920) (currentByte!12880 (_ BitVec 32)) (currentBit!12875 (_ BitVec 32))) )
))
(declare-fun w1!591 () BitStream!11826)

(declare-fun w2!587 () BitStream!11826)

(declare-fun isPrefixOf!0 (BitStream!11826 BitStream!11826) Bool)

(assert (=> start!58262 (= res!223350 (isPrefixOf!0 w1!591 w2!587))))

(assert (=> start!58262 e!187630))

(declare-fun e!187627 () Bool)

(declare-fun inv!12 (BitStream!11826) Bool)

(assert (=> start!58262 (and (inv!12 w1!591) e!187627)))

(declare-fun e!187629 () Bool)

(assert (=> start!58262 (and (inv!12 w2!587) e!187629)))

(declare-fun w3!25 () BitStream!11826)

(declare-fun e!187628 () Bool)

(assert (=> start!58262 (and (inv!12 w3!25) e!187628)))

(declare-fun b!267646 () Bool)

(declare-fun res!223351 () Bool)

(assert (=> b!267646 (=> (not res!223351) (not e!187630))))

(assert (=> b!267646 (= res!223351 (isPrefixOf!0 w2!587 w3!25))))

(declare-fun b!267647 () Bool)

(declare-fun array_inv!6230 (array!14920) Bool)

(assert (=> b!267647 (= e!187629 (array_inv!6230 (buf!6974 w2!587)))))

(declare-fun b!267648 () Bool)

(assert (=> b!267648 (= e!187628 (array_inv!6230 (buf!6974 w3!25)))))

(declare-fun b!267649 () Bool)

(assert (=> b!267649 (= e!187627 (array_inv!6230 (buf!6974 w1!591)))))

(declare-fun b!267650 () Bool)

(assert (=> b!267650 (= e!187630 (not true))))

(declare-fun arrayRangesEq!1041 (array!14920 array!14920 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!267650 (arrayRangesEq!1041 (buf!6974 w1!591) (buf!6974 w3!25) #b00000000000000000000000000000000 (currentByte!12880 w1!591))))

(declare-datatypes ((Unit!18985 0))(
  ( (Unit!18986) )
))
(declare-fun lt!408035 () Unit!18985)

(declare-fun arrayRangesEqTransitive!316 (array!14920 array!14920 array!14920 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18985)

(assert (=> b!267650 (= lt!408035 (arrayRangesEqTransitive!316 (buf!6974 w1!591) (buf!6974 w2!587) (buf!6974 w3!25) #b00000000000000000000000000000000 (currentByte!12880 w1!591) (currentByte!12880 w2!587)))))

(assert (= (and start!58262 res!223350) b!267646))

(assert (= (and b!267646 res!223351) b!267650))

(assert (= start!58262 b!267649))

(assert (= start!58262 b!267647))

(assert (= start!58262 b!267648))

(declare-fun m!398905 () Bool)

(assert (=> b!267648 m!398905))

(declare-fun m!398907 () Bool)

(assert (=> b!267649 m!398907))

(declare-fun m!398909 () Bool)

(assert (=> b!267650 m!398909))

(declare-fun m!398911 () Bool)

(assert (=> b!267650 m!398911))

(declare-fun m!398913 () Bool)

(assert (=> start!58262 m!398913))

(declare-fun m!398915 () Bool)

(assert (=> start!58262 m!398915))

(declare-fun m!398917 () Bool)

(assert (=> start!58262 m!398917))

(declare-fun m!398919 () Bool)

(assert (=> start!58262 m!398919))

(declare-fun m!398921 () Bool)

(assert (=> b!267646 m!398921))

(declare-fun m!398923 () Bool)

(assert (=> b!267647 m!398923))

(check-sat (not b!267646) (not b!267648) (not b!267647) (not b!267650) (not b!267649) (not start!58262))
