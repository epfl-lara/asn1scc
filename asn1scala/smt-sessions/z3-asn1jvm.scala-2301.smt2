; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58268 () Bool)

(assert start!58268)

(declare-fun res!223369 () Bool)

(declare-fun e!187689 () Bool)

(assert (=> start!58268 (=> (not res!223369) (not e!187689))))

(declare-datatypes ((array!14926 0))(
  ( (array!14927 (arr!7496 (Array (_ BitVec 32) (_ BitVec 8))) (size!6509 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11832 0))(
  ( (BitStream!11833 (buf!6977 array!14926) (currentByte!12883 (_ BitVec 32)) (currentBit!12878 (_ BitVec 32))) )
))
(declare-fun w1!591 () BitStream!11832)

(declare-fun w2!587 () BitStream!11832)

(declare-fun isPrefixOf!0 (BitStream!11832 BitStream!11832) Bool)

(assert (=> start!58268 (= res!223369 (isPrefixOf!0 w1!591 w2!587))))

(assert (=> start!58268 e!187689))

(declare-fun e!187694 () Bool)

(declare-fun inv!12 (BitStream!11832) Bool)

(assert (=> start!58268 (and (inv!12 w1!591) e!187694)))

(declare-fun e!187692 () Bool)

(assert (=> start!58268 (and (inv!12 w2!587) e!187692)))

(declare-fun w3!25 () BitStream!11832)

(declare-fun e!187695 () Bool)

(assert (=> start!58268 (and (inv!12 w3!25) e!187695)))

(declare-fun b!267691 () Bool)

(declare-fun array_inv!6233 (array!14926) Bool)

(assert (=> b!267691 (= e!187692 (array_inv!6233 (buf!6977 w2!587)))))

(declare-fun b!267692 () Bool)

(assert (=> b!267692 (= e!187695 (array_inv!6233 (buf!6977 w3!25)))))

(declare-fun b!267693 () Bool)

(declare-fun res!223368 () Bool)

(assert (=> b!267693 (=> (not res!223368) (not e!187689))))

(assert (=> b!267693 (= res!223368 (isPrefixOf!0 w2!587 w3!25))))

(declare-fun b!267694 () Bool)

(assert (=> b!267694 (= e!187694 (array_inv!6233 (buf!6977 w1!591)))))

(declare-fun b!267695 () Bool)

(assert (=> b!267695 (= e!187689 (not true))))

(declare-fun arrayRangesEq!1044 (array!14926 array!14926 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!267695 (arrayRangesEq!1044 (buf!6977 w1!591) (buf!6977 w3!25) #b00000000000000000000000000000000 (currentByte!12883 w1!591))))

(declare-datatypes ((Unit!18991 0))(
  ( (Unit!18992) )
))
(declare-fun lt!408044 () Unit!18991)

(declare-fun arrayRangesEqTransitive!319 (array!14926 array!14926 array!14926 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18991)

(assert (=> b!267695 (= lt!408044 (arrayRangesEqTransitive!319 (buf!6977 w1!591) (buf!6977 w2!587) (buf!6977 w3!25) #b00000000000000000000000000000000 (currentByte!12883 w1!591) (currentByte!12883 w2!587)))))

(assert (= (and start!58268 res!223369) b!267693))

(assert (= (and b!267693 res!223368) b!267695))

(assert (= start!58268 b!267694))

(assert (= start!58268 b!267691))

(assert (= start!58268 b!267692))

(declare-fun m!398965 () Bool)

(assert (=> b!267693 m!398965))

(declare-fun m!398967 () Bool)

(assert (=> b!267694 m!398967))

(declare-fun m!398969 () Bool)

(assert (=> start!58268 m!398969))

(declare-fun m!398971 () Bool)

(assert (=> start!58268 m!398971))

(declare-fun m!398973 () Bool)

(assert (=> start!58268 m!398973))

(declare-fun m!398975 () Bool)

(assert (=> start!58268 m!398975))

(declare-fun m!398977 () Bool)

(assert (=> b!267695 m!398977))

(declare-fun m!398979 () Bool)

(assert (=> b!267695 m!398979))

(declare-fun m!398981 () Bool)

(assert (=> b!267691 m!398981))

(declare-fun m!398983 () Bool)

(assert (=> b!267692 m!398983))

(check-sat (not start!58268) (not b!267693) (not b!267695) (not b!267694) (not b!267692) (not b!267691))
