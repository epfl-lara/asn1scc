; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58240 () Bool)

(assert start!58240)

(declare-fun b!267500 () Bool)

(declare-fun e!187397 () Bool)

(assert (=> b!267500 (= e!187397 false)))

(declare-fun lt!408002 () Bool)

(declare-datatypes ((array!14898 0))(
  ( (array!14899 (arr!7482 (Array (_ BitVec 32) (_ BitVec 8))) (size!6495 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11804 0))(
  ( (BitStream!11805 (buf!6963 array!14898) (currentByte!12869 (_ BitVec 32)) (currentBit!12864 (_ BitVec 32))) )
))
(declare-fun w2!587 () BitStream!11804)

(declare-fun w3!25 () BitStream!11804)

(declare-fun isPrefixOf!0 (BitStream!11804 BitStream!11804) Bool)

(assert (=> b!267500 (= lt!408002 (isPrefixOf!0 w2!587 w3!25))))

(declare-fun res!223303 () Bool)

(assert (=> start!58240 (=> (not res!223303) (not e!187397))))

(declare-fun w1!591 () BitStream!11804)

(assert (=> start!58240 (= res!223303 (isPrefixOf!0 w1!591 w2!587))))

(assert (=> start!58240 e!187397))

(declare-fun e!187398 () Bool)

(declare-fun inv!12 (BitStream!11804) Bool)

(assert (=> start!58240 (and (inv!12 w1!591) e!187398)))

(declare-fun e!187401 () Bool)

(assert (=> start!58240 (and (inv!12 w2!587) e!187401)))

(declare-fun e!187400 () Bool)

(assert (=> start!58240 (and (inv!12 w3!25) e!187400)))

(declare-fun b!267502 () Bool)

(declare-fun array_inv!6219 (array!14898) Bool)

(assert (=> b!267502 (= e!187401 (array_inv!6219 (buf!6963 w2!587)))))

(declare-fun b!267503 () Bool)

(assert (=> b!267503 (= e!187400 (array_inv!6219 (buf!6963 w3!25)))))

(declare-fun b!267501 () Bool)

(assert (=> b!267501 (= e!187398 (array_inv!6219 (buf!6963 w1!591)))))

(assert (= (and start!58240 res!223303) b!267500))

(assert (= start!58240 b!267501))

(assert (= start!58240 b!267502))

(assert (= start!58240 b!267503))

(declare-fun m!398713 () Bool)

(assert (=> b!267501 m!398713))

(declare-fun m!398715 () Bool)

(assert (=> start!58240 m!398715))

(declare-fun m!398717 () Bool)

(assert (=> start!58240 m!398717))

(declare-fun m!398719 () Bool)

(assert (=> start!58240 m!398719))

(declare-fun m!398721 () Bool)

(assert (=> start!58240 m!398721))

(declare-fun m!398723 () Bool)

(assert (=> b!267502 m!398723))

(declare-fun m!398725 () Bool)

(assert (=> b!267503 m!398725))

(declare-fun m!398727 () Bool)

(assert (=> b!267500 m!398727))

(push 1)

(assert (not b!267500))

(assert (not b!267503))

(assert (not start!58240))

(assert (not b!267501))

(assert (not b!267502))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

