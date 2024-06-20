; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58278 () Bool)

(assert start!58278)

(declare-fun b!267766 () Bool)

(declare-fun e!187795 () Bool)

(declare-datatypes ((array!14936 0))(
  ( (array!14937 (arr!7501 (Array (_ BitVec 32) (_ BitVec 8))) (size!6514 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11842 0))(
  ( (BitStream!11843 (buf!6982 array!14936) (currentByte!12888 (_ BitVec 32)) (currentBit!12883 (_ BitVec 32))) )
))
(declare-fun w1!591 () BitStream!11842)

(declare-fun array_inv!6238 (array!14936) Bool)

(assert (=> b!267766 (= e!187795 (array_inv!6238 (buf!6982 w1!591)))))

(declare-fun b!267767 () Bool)

(declare-fun e!187797 () Bool)

(declare-fun w3!25 () BitStream!11842)

(assert (=> b!267767 (= e!187797 (array_inv!6238 (buf!6982 w3!25)))))

(declare-fun b!267768 () Bool)

(declare-fun e!187799 () Bool)

(assert (=> b!267768 (= e!187799 (not true))))

(declare-fun arrayRangesEq!1049 (array!14936 array!14936 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!267768 (arrayRangesEq!1049 (buf!6982 w1!591) (buf!6982 w3!25) #b00000000000000000000000000000000 (currentByte!12888 w1!591))))

(declare-fun w2!587 () BitStream!11842)

(declare-datatypes ((Unit!19001 0))(
  ( (Unit!19002) )
))
(declare-fun lt!408059 () Unit!19001)

(declare-fun arrayRangesEqTransitive!324 (array!14936 array!14936 array!14936 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19001)

(assert (=> b!267768 (= lt!408059 (arrayRangesEqTransitive!324 (buf!6982 w1!591) (buf!6982 w2!587) (buf!6982 w3!25) #b00000000000000000000000000000000 (currentByte!12888 w1!591) (currentByte!12888 w2!587)))))

(declare-fun b!267770 () Bool)

(declare-fun e!187794 () Bool)

(assert (=> b!267770 (= e!187794 (array_inv!6238 (buf!6982 w2!587)))))

(declare-fun b!267769 () Bool)

(declare-fun res!223398 () Bool)

(assert (=> b!267769 (=> (not res!223398) (not e!187799))))

(declare-fun isPrefixOf!0 (BitStream!11842 BitStream!11842) Bool)

(assert (=> b!267769 (= res!223398 (isPrefixOf!0 w2!587 w3!25))))

(declare-fun res!223399 () Bool)

(assert (=> start!58278 (=> (not res!223399) (not e!187799))))

(assert (=> start!58278 (= res!223399 (isPrefixOf!0 w1!591 w2!587))))

(assert (=> start!58278 e!187799))

(declare-fun inv!12 (BitStream!11842) Bool)

(assert (=> start!58278 (and (inv!12 w1!591) e!187795)))

(assert (=> start!58278 (and (inv!12 w2!587) e!187794)))

(assert (=> start!58278 (and (inv!12 w3!25) e!187797)))

(assert (= (and start!58278 res!223399) b!267769))

(assert (= (and b!267769 res!223398) b!267768))

(assert (= start!58278 b!267766))

(assert (= start!58278 b!267770))

(assert (= start!58278 b!267767))

(declare-fun m!399065 () Bool)

(assert (=> b!267768 m!399065))

(declare-fun m!399067 () Bool)

(assert (=> b!267768 m!399067))

(declare-fun m!399069 () Bool)

(assert (=> b!267770 m!399069))

(declare-fun m!399071 () Bool)

(assert (=> b!267767 m!399071))

(declare-fun m!399073 () Bool)

(assert (=> b!267769 m!399073))

(declare-fun m!399075 () Bool)

(assert (=> b!267766 m!399075))

(declare-fun m!399077 () Bool)

(assert (=> start!58278 m!399077))

(declare-fun m!399079 () Bool)

(assert (=> start!58278 m!399079))

(declare-fun m!399081 () Bool)

(assert (=> start!58278 m!399081))

(declare-fun m!399083 () Bool)

(assert (=> start!58278 m!399083))

(push 1)

(assert (not b!267768))

(assert (not start!58278))

(assert (not b!267769))

(assert (not b!267770))

(assert (not b!267766))

(assert (not b!267767))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

