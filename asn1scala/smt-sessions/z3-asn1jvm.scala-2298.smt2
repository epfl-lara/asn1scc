; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58250 () Bool)

(assert start!58250)

(declare-fun b!267560 () Bool)

(declare-fun e!187505 () Bool)

(assert (=> b!267560 (= e!187505 false)))

(declare-fun lt!408017 () Bool)

(declare-datatypes ((array!14908 0))(
  ( (array!14909 (arr!7487 (Array (_ BitVec 32) (_ BitVec 8))) (size!6500 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11814 0))(
  ( (BitStream!11815 (buf!6968 array!14908) (currentByte!12874 (_ BitVec 32)) (currentBit!12869 (_ BitVec 32))) )
))
(declare-fun w2!587 () BitStream!11814)

(declare-fun w3!25 () BitStream!11814)

(declare-fun isPrefixOf!0 (BitStream!11814 BitStream!11814) Bool)

(assert (=> b!267560 (= lt!408017 (isPrefixOf!0 w2!587 w3!25))))

(declare-fun b!267561 () Bool)

(declare-fun e!187501 () Bool)

(declare-fun w1!591 () BitStream!11814)

(declare-fun array_inv!6224 (array!14908) Bool)

(assert (=> b!267561 (= e!187501 (array_inv!6224 (buf!6968 w1!591)))))

(declare-fun res!223318 () Bool)

(assert (=> start!58250 (=> (not res!223318) (not e!187505))))

(assert (=> start!58250 (= res!223318 (isPrefixOf!0 w1!591 w2!587))))

(assert (=> start!58250 e!187505))

(declare-fun inv!12 (BitStream!11814) Bool)

(assert (=> start!58250 (and (inv!12 w1!591) e!187501)))

(declare-fun e!187503 () Bool)

(assert (=> start!58250 (and (inv!12 w2!587) e!187503)))

(declare-fun e!187506 () Bool)

(assert (=> start!58250 (and (inv!12 w3!25) e!187506)))

(declare-fun b!267562 () Bool)

(assert (=> b!267562 (= e!187503 (array_inv!6224 (buf!6968 w2!587)))))

(declare-fun b!267563 () Bool)

(assert (=> b!267563 (= e!187506 (array_inv!6224 (buf!6968 w3!25)))))

(assert (= (and start!58250 res!223318) b!267560))

(assert (= start!58250 b!267561))

(assert (= start!58250 b!267562))

(assert (= start!58250 b!267563))

(declare-fun m!398793 () Bool)

(assert (=> b!267561 m!398793))

(declare-fun m!398795 () Bool)

(assert (=> b!267562 m!398795))

(declare-fun m!398797 () Bool)

(assert (=> b!267563 m!398797))

(declare-fun m!398799 () Bool)

(assert (=> b!267560 m!398799))

(declare-fun m!398801 () Bool)

(assert (=> start!58250 m!398801))

(declare-fun m!398803 () Bool)

(assert (=> start!58250 m!398803))

(declare-fun m!398805 () Bool)

(assert (=> start!58250 m!398805))

(declare-fun m!398807 () Bool)

(assert (=> start!58250 m!398807))

(check-sat (not b!267562) (not b!267561) (not b!267563) (not start!58250) (not b!267560))
