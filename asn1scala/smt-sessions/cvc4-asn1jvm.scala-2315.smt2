; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58804 () Bool)

(assert start!58804)

(declare-fun b!269908 () Bool)

(declare-fun res!224971 () Bool)

(declare-fun e!189799 () Bool)

(assert (=> b!269908 (=> (not res!224971) (not e!189799))))

(declare-datatypes ((array!15039 0))(
  ( (array!15040 (arr!7539 (Array (_ BitVec 32) (_ BitVec 8))) (size!6552 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11918 0))(
  ( (BitStream!11919 (buf!7020 array!15039) (currentByte!12979 (_ BitVec 32)) (currentBit!12974 (_ BitVec 32))) )
))
(declare-fun w2!587 () BitStream!11918)

(declare-fun w3!25 () BitStream!11918)

(declare-fun isPrefixOf!0 (BitStream!11918 BitStream!11918) Bool)

(assert (=> b!269908 (= res!224971 (isPrefixOf!0 w2!587 w3!25))))

(declare-fun b!269909 () Bool)

(declare-fun e!189800 () Bool)

(declare-fun array_inv!6276 (array!15039) Bool)

(assert (=> b!269909 (= e!189800 (array_inv!6276 (buf!7020 w2!587)))))

(declare-fun b!269910 () Bool)

(declare-fun e!189798 () Bool)

(assert (=> b!269910 (= e!189798 (array_inv!6276 (buf!7020 w3!25)))))

(declare-fun b!269911 () Bool)

(declare-fun e!189796 () Bool)

(declare-fun w1!591 () BitStream!11918)

(assert (=> b!269911 (= e!189796 (array_inv!6276 (buf!7020 w1!591)))))

(declare-fun b!269912 () Bool)

(assert (=> b!269912 (= e!189799 (not (or (bvsge (currentByte!12979 w1!591) (size!6552 (buf!7020 w1!591))) (bvsge (currentByte!12979 w1!591) (currentByte!12979 w2!587)) (bvsle #b00000000000000000000000000000000 (currentByte!12979 w2!587)))))))

(declare-fun arrayRangesEq!1084 (array!15039 array!15039 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!269912 (arrayRangesEq!1084 (buf!7020 w1!591) (buf!7020 w3!25) #b00000000000000000000000000000000 (currentByte!12979 w1!591))))

(declare-datatypes ((Unit!19059 0))(
  ( (Unit!19060) )
))
(declare-fun lt!409244 () Unit!19059)

(declare-fun arrayRangesEqTransitive!347 (array!15039 array!15039 array!15039 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19059)

(assert (=> b!269912 (= lt!409244 (arrayRangesEqTransitive!347 (buf!7020 w1!591) (buf!7020 w2!587) (buf!7020 w3!25) #b00000000000000000000000000000000 (currentByte!12979 w1!591) (currentByte!12979 w2!587)))))

(declare-fun res!224970 () Bool)

(assert (=> start!58804 (=> (not res!224970) (not e!189799))))

(assert (=> start!58804 (= res!224970 (isPrefixOf!0 w1!591 w2!587))))

(assert (=> start!58804 e!189799))

(declare-fun inv!12 (BitStream!11918) Bool)

(assert (=> start!58804 (and (inv!12 w1!591) e!189796)))

(assert (=> start!58804 (and (inv!12 w2!587) e!189800)))

(assert (=> start!58804 (and (inv!12 w3!25) e!189798)))

(assert (= (and start!58804 res!224970) b!269908))

(assert (= (and b!269908 res!224971) b!269912))

(assert (= start!58804 b!269911))

(assert (= start!58804 b!269909))

(assert (= start!58804 b!269910))

(declare-fun m!401683 () Bool)

(assert (=> start!58804 m!401683))

(declare-fun m!401685 () Bool)

(assert (=> start!58804 m!401685))

(declare-fun m!401687 () Bool)

(assert (=> start!58804 m!401687))

(declare-fun m!401689 () Bool)

(assert (=> start!58804 m!401689))

(declare-fun m!401691 () Bool)

(assert (=> b!269912 m!401691))

(declare-fun m!401693 () Bool)

(assert (=> b!269912 m!401693))

(declare-fun m!401695 () Bool)

(assert (=> b!269911 m!401695))

(declare-fun m!401697 () Bool)

(assert (=> b!269909 m!401697))

(declare-fun m!401699 () Bool)

(assert (=> b!269910 m!401699))

(declare-fun m!401701 () Bool)

(assert (=> b!269908 m!401701))

(push 1)

(assert (not b!269910))

(assert (not start!58804))

(assert (not b!269909))

(assert (not b!269912))

(assert (not b!269911))

(assert (not b!269908))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

