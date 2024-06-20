; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58256 () Bool)

(assert start!58256)

(declare-fun b!267601 () Bool)

(declare-fun e!187569 () Bool)

(declare-datatypes ((array!14914 0))(
  ( (array!14915 (arr!7490 (Array (_ BitVec 32) (_ BitVec 8))) (size!6503 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11820 0))(
  ( (BitStream!11821 (buf!6971 array!14914) (currentByte!12877 (_ BitVec 32)) (currentBit!12872 (_ BitVec 32))) )
))
(declare-fun w2!587 () BitStream!11820)

(declare-fun array_inv!6227 (array!14914) Bool)

(assert (=> b!267601 (= e!187569 (array_inv!6227 (buf!6971 w2!587)))))

(declare-fun b!267602 () Bool)

(declare-fun e!187564 () Bool)

(assert (=> b!267602 (= e!187564 (not true))))

(declare-fun w1!591 () BitStream!11820)

(declare-fun w3!25 () BitStream!11820)

(declare-fun arrayRangesEq!1038 (array!14914 array!14914 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!267602 (arrayRangesEq!1038 (buf!6971 w1!591) (buf!6971 w3!25) #b00000000000000000000000000000000 (currentByte!12877 w1!591))))

(declare-datatypes ((Unit!18979 0))(
  ( (Unit!18980) )
))
(declare-fun lt!408026 () Unit!18979)

(declare-fun arrayRangesEqTransitive!313 (array!14914 array!14914 array!14914 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18979)

(assert (=> b!267602 (= lt!408026 (arrayRangesEqTransitive!313 (buf!6971 w1!591) (buf!6971 w2!587) (buf!6971 w3!25) #b00000000000000000000000000000000 (currentByte!12877 w1!591) (currentByte!12877 w2!587)))))

(declare-fun b!267603 () Bool)

(declare-fun e!187563 () Bool)

(assert (=> b!267603 (= e!187563 (array_inv!6227 (buf!6971 w3!25)))))

(declare-fun b!267604 () Bool)

(declare-fun res!223333 () Bool)

(assert (=> b!267604 (=> (not res!223333) (not e!187564))))

(declare-fun isPrefixOf!0 (BitStream!11820 BitStream!11820) Bool)

(assert (=> b!267604 (= res!223333 (isPrefixOf!0 w2!587 w3!25))))

(declare-fun res!223332 () Bool)

(assert (=> start!58256 (=> (not res!223332) (not e!187564))))

(assert (=> start!58256 (= res!223332 (isPrefixOf!0 w1!591 w2!587))))

(assert (=> start!58256 e!187564))

(declare-fun e!187565 () Bool)

(declare-fun inv!12 (BitStream!11820) Bool)

(assert (=> start!58256 (and (inv!12 w1!591) e!187565)))

(assert (=> start!58256 (and (inv!12 w2!587) e!187569)))

(assert (=> start!58256 (and (inv!12 w3!25) e!187563)))

(declare-fun b!267605 () Bool)

(assert (=> b!267605 (= e!187565 (array_inv!6227 (buf!6971 w1!591)))))

(assert (= (and start!58256 res!223332) b!267604))

(assert (= (and b!267604 res!223333) b!267602))

(assert (= start!58256 b!267605))

(assert (= start!58256 b!267601))

(assert (= start!58256 b!267603))

(declare-fun m!398845 () Bool)

(assert (=> b!267601 m!398845))

(declare-fun m!398847 () Bool)

(assert (=> start!58256 m!398847))

(declare-fun m!398849 () Bool)

(assert (=> start!58256 m!398849))

(declare-fun m!398851 () Bool)

(assert (=> start!58256 m!398851))

(declare-fun m!398853 () Bool)

(assert (=> start!58256 m!398853))

(declare-fun m!398855 () Bool)

(assert (=> b!267605 m!398855))

(declare-fun m!398857 () Bool)

(assert (=> b!267604 m!398857))

(declare-fun m!398859 () Bool)

(assert (=> b!267603 m!398859))

(declare-fun m!398861 () Bool)

(assert (=> b!267602 m!398861))

(declare-fun m!398863 () Bool)

(assert (=> b!267602 m!398863))

(check-sat (not b!267601) (not b!267605) (not b!267602) (not start!58256) (not b!267604) (not b!267603))
