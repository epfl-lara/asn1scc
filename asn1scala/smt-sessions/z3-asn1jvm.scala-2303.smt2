; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58280 () Bool)

(assert start!58280)

(declare-fun b!267781 () Bool)

(declare-fun e!187819 () Bool)

(declare-datatypes ((array!14938 0))(
  ( (array!14939 (arr!7502 (Array (_ BitVec 32) (_ BitVec 8))) (size!6515 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11844 0))(
  ( (BitStream!11845 (buf!6983 array!14938) (currentByte!12889 (_ BitVec 32)) (currentBit!12884 (_ BitVec 32))) )
))
(declare-fun w1!591 () BitStream!11844)

(declare-fun array_inv!6239 (array!14938) Bool)

(assert (=> b!267781 (= e!187819 (array_inv!6239 (buf!6983 w1!591)))))

(declare-fun b!267782 () Bool)

(declare-fun res!223405 () Bool)

(declare-fun e!187818 () Bool)

(assert (=> b!267782 (=> (not res!223405) (not e!187818))))

(declare-fun w2!587 () BitStream!11844)

(declare-fun w3!25 () BitStream!11844)

(declare-fun isPrefixOf!0 (BitStream!11844 BitStream!11844) Bool)

(assert (=> b!267782 (= res!223405 (isPrefixOf!0 w2!587 w3!25))))

(declare-fun b!267783 () Bool)

(declare-fun e!187816 () Bool)

(assert (=> b!267783 (= e!187816 (array_inv!6239 (buf!6983 w2!587)))))

(declare-fun b!267784 () Bool)

(declare-fun e!187817 () Bool)

(assert (=> b!267784 (= e!187817 (array_inv!6239 (buf!6983 w3!25)))))

(declare-fun res!223404 () Bool)

(assert (=> start!58280 (=> (not res!223404) (not e!187818))))

(assert (=> start!58280 (= res!223404 (isPrefixOf!0 w1!591 w2!587))))

(assert (=> start!58280 e!187818))

(declare-fun inv!12 (BitStream!11844) Bool)

(assert (=> start!58280 (and (inv!12 w1!591) e!187819)))

(assert (=> start!58280 (and (inv!12 w2!587) e!187816)))

(assert (=> start!58280 (and (inv!12 w3!25) e!187817)))

(declare-fun b!267785 () Bool)

(assert (=> b!267785 (= e!187818 (not true))))

(declare-fun arrayRangesEq!1050 (array!14938 array!14938 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!267785 (arrayRangesEq!1050 (buf!6983 w1!591) (buf!6983 w3!25) #b00000000000000000000000000000000 (currentByte!12889 w1!591))))

(declare-datatypes ((Unit!19003 0))(
  ( (Unit!19004) )
))
(declare-fun lt!408062 () Unit!19003)

(declare-fun arrayRangesEqTransitive!325 (array!14938 array!14938 array!14938 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19003)

(assert (=> b!267785 (= lt!408062 (arrayRangesEqTransitive!325 (buf!6983 w1!591) (buf!6983 w2!587) (buf!6983 w3!25) #b00000000000000000000000000000000 (currentByte!12889 w1!591) (currentByte!12889 w2!587)))))

(assert (= (and start!58280 res!223404) b!267782))

(assert (= (and b!267782 res!223405) b!267785))

(assert (= start!58280 b!267781))

(assert (= start!58280 b!267783))

(assert (= start!58280 b!267784))

(declare-fun m!399085 () Bool)

(assert (=> b!267783 m!399085))

(declare-fun m!399087 () Bool)

(assert (=> start!58280 m!399087))

(declare-fun m!399089 () Bool)

(assert (=> start!58280 m!399089))

(declare-fun m!399091 () Bool)

(assert (=> start!58280 m!399091))

(declare-fun m!399093 () Bool)

(assert (=> start!58280 m!399093))

(declare-fun m!399095 () Bool)

(assert (=> b!267781 m!399095))

(declare-fun m!399097 () Bool)

(assert (=> b!267785 m!399097))

(declare-fun m!399099 () Bool)

(assert (=> b!267785 m!399099))

(declare-fun m!399101 () Bool)

(assert (=> b!267782 m!399101))

(declare-fun m!399103 () Bool)

(assert (=> b!267784 m!399103))

(check-sat (not b!267784) (not b!267785) (not b!267782) (not start!58280) (not b!267783) (not b!267781))
