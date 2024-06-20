; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58246 () Bool)

(assert start!58246)

(declare-fun b!267539 () Bool)

(declare-fun e!187461 () Bool)

(declare-datatypes ((array!14904 0))(
  ( (array!14905 (arr!7485 (Array (_ BitVec 32) (_ BitVec 8))) (size!6498 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11810 0))(
  ( (BitStream!11811 (buf!6966 array!14904) (currentByte!12872 (_ BitVec 32)) (currentBit!12867 (_ BitVec 32))) )
))
(declare-fun w3!25 () BitStream!11810)

(declare-fun array_inv!6222 (array!14904) Bool)

(assert (=> b!267539 (= e!187461 (array_inv!6222 (buf!6966 w3!25)))))

(declare-fun res!223312 () Bool)

(declare-fun e!187463 () Bool)

(assert (=> start!58246 (=> (not res!223312) (not e!187463))))

(declare-fun w1!591 () BitStream!11810)

(declare-fun w2!587 () BitStream!11810)

(declare-fun isPrefixOf!0 (BitStream!11810 BitStream!11810) Bool)

(assert (=> start!58246 (= res!223312 (isPrefixOf!0 w1!591 w2!587))))

(assert (=> start!58246 e!187463))

(declare-fun e!187462 () Bool)

(declare-fun inv!12 (BitStream!11810) Bool)

(assert (=> start!58246 (and (inv!12 w1!591) e!187462)))

(declare-fun e!187460 () Bool)

(assert (=> start!58246 (and (inv!12 w2!587) e!187460)))

(assert (=> start!58246 (and (inv!12 w3!25) e!187461)))

(declare-fun b!267536 () Bool)

(assert (=> b!267536 (= e!187463 false)))

(declare-fun lt!408011 () Bool)

(assert (=> b!267536 (= lt!408011 (isPrefixOf!0 w2!587 w3!25))))

(declare-fun b!267537 () Bool)

(assert (=> b!267537 (= e!187462 (array_inv!6222 (buf!6966 w1!591)))))

(declare-fun b!267538 () Bool)

(assert (=> b!267538 (= e!187460 (array_inv!6222 (buf!6966 w2!587)))))

(assert (= (and start!58246 res!223312) b!267536))

(assert (= start!58246 b!267537))

(assert (= start!58246 b!267538))

(assert (= start!58246 b!267539))

(declare-fun m!398761 () Bool)

(assert (=> b!267537 m!398761))

(declare-fun m!398763 () Bool)

(assert (=> b!267536 m!398763))

(declare-fun m!398765 () Bool)

(assert (=> b!267539 m!398765))

(declare-fun m!398767 () Bool)

(assert (=> b!267538 m!398767))

(declare-fun m!398769 () Bool)

(assert (=> start!58246 m!398769))

(declare-fun m!398771 () Bool)

(assert (=> start!58246 m!398771))

(declare-fun m!398773 () Bool)

(assert (=> start!58246 m!398773))

(declare-fun m!398775 () Bool)

(assert (=> start!58246 m!398775))

(push 1)

(assert (not b!267538))

(assert (not b!267539))

(assert (not start!58246))

(assert (not b!267537))

(assert (not b!267536))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

