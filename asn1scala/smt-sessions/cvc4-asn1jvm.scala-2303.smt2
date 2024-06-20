; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58282 () Bool)

(assert start!58282)

(declare-fun b!267797 () Bool)

(declare-fun e!187837 () Bool)

(declare-datatypes ((array!14940 0))(
  ( (array!14941 (arr!7503 (Array (_ BitVec 32) (_ BitVec 8))) (size!6516 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11846 0))(
  ( (BitStream!11847 (buf!6984 array!14940) (currentByte!12890 (_ BitVec 32)) (currentBit!12885 (_ BitVec 32))) )
))
(declare-fun w3!25 () BitStream!11846)

(declare-fun array_inv!6240 (array!14940) Bool)

(assert (=> b!267797 (= e!187837 (array_inv!6240 (buf!6984 w3!25)))))

(declare-fun b!267798 () Bool)

(declare-fun e!187841 () Bool)

(declare-fun w2!587 () BitStream!11846)

(assert (=> b!267798 (= e!187841 (array_inv!6240 (buf!6984 w2!587)))))

(declare-fun b!267796 () Bool)

(declare-fun res!223411 () Bool)

(declare-fun e!187839 () Bool)

(assert (=> b!267796 (=> (not res!223411) (not e!187839))))

(declare-fun isPrefixOf!0 (BitStream!11846 BitStream!11846) Bool)

(assert (=> b!267796 (= res!223411 (isPrefixOf!0 w2!587 w3!25))))

(declare-fun res!223410 () Bool)

(assert (=> start!58282 (=> (not res!223410) (not e!187839))))

(declare-fun w1!591 () BitStream!11846)

(assert (=> start!58282 (= res!223410 (isPrefixOf!0 w1!591 w2!587))))

(assert (=> start!58282 e!187839))

(declare-fun e!187838 () Bool)

(declare-fun inv!12 (BitStream!11846) Bool)

(assert (=> start!58282 (and (inv!12 w1!591) e!187838)))

(assert (=> start!58282 (and (inv!12 w2!587) e!187841)))

(assert (=> start!58282 (and (inv!12 w3!25) e!187837)))

(declare-fun b!267799 () Bool)

(assert (=> b!267799 (= e!187839 (not true))))

(declare-fun arrayRangesEq!1051 (array!14940 array!14940 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!267799 (arrayRangesEq!1051 (buf!6984 w1!591) (buf!6984 w3!25) #b00000000000000000000000000000000 (currentByte!12890 w1!591))))

(declare-datatypes ((Unit!19005 0))(
  ( (Unit!19006) )
))
(declare-fun lt!408065 () Unit!19005)

(declare-fun arrayRangesEqTransitive!326 (array!14940 array!14940 array!14940 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19005)

(assert (=> b!267799 (= lt!408065 (arrayRangesEqTransitive!326 (buf!6984 w1!591) (buf!6984 w2!587) (buf!6984 w3!25) #b00000000000000000000000000000000 (currentByte!12890 w1!591) (currentByte!12890 w2!587)))))

(declare-fun b!267800 () Bool)

(assert (=> b!267800 (= e!187838 (array_inv!6240 (buf!6984 w1!591)))))

(assert (= (and start!58282 res!223410) b!267796))

(assert (= (and b!267796 res!223411) b!267799))

(assert (= start!58282 b!267800))

(assert (= start!58282 b!267798))

(assert (= start!58282 b!267797))

(declare-fun m!399105 () Bool)

(assert (=> b!267800 m!399105))

(declare-fun m!399107 () Bool)

(assert (=> b!267799 m!399107))

(declare-fun m!399109 () Bool)

(assert (=> b!267799 m!399109))

(declare-fun m!399111 () Bool)

(assert (=> b!267797 m!399111))

(declare-fun m!399113 () Bool)

(assert (=> b!267796 m!399113))

(declare-fun m!399115 () Bool)

(assert (=> start!58282 m!399115))

(declare-fun m!399117 () Bool)

(assert (=> start!58282 m!399117))

(declare-fun m!399119 () Bool)

(assert (=> start!58282 m!399119))

(declare-fun m!399121 () Bool)

(assert (=> start!58282 m!399121))

(declare-fun m!399123 () Bool)

(assert (=> b!267798 m!399123))

(push 1)

(assert (not b!267798))

(assert (not b!267796))

(assert (not start!58282))

(assert (not b!267800))

(assert (not b!267797))

(assert (not b!267799))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

