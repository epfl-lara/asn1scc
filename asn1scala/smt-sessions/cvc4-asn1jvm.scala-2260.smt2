; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57214 () Bool)

(assert start!57214)

(declare-fun res!219622 () Bool)

(declare-fun e!182699 () Bool)

(assert (=> start!57214 (=> (not res!219622) (not e!182699))))

(declare-datatypes ((array!14625 0))(
  ( (array!14626 (arr!7374 (Array (_ BitVec 32) (_ BitVec 8))) (size!6387 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11588 0))(
  ( (BitStream!11589 (buf!6855 array!14625) (currentByte!12689 (_ BitVec 32)) (currentBit!12684 (_ BitVec 32))) )
))
(declare-fun w!15 () BitStream!11588)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> start!57214 (= res!219622 (invariant!0 (currentBit!12684 w!15) (currentByte!12689 w!15) (size!6387 (buf!6855 w!15))))))

(assert (=> start!57214 e!182699))

(declare-fun e!182698 () Bool)

(declare-fun inv!12 (BitStream!11588) Bool)

(assert (=> start!57214 (and (inv!12 w!15) e!182698)))

(assert (=> start!57214 true))

(declare-fun b!262443 () Bool)

(declare-fun res!219621 () Bool)

(assert (=> b!262443 (=> (not res!219621) (not e!182699))))

(declare-fun newCurrentBytes!15 () (_ BitVec 32))

(declare-fun newCurrentBit!15 () (_ BitVec 32))

(assert (=> b!262443 (= res!219621 (invariant!0 newCurrentBit!15 newCurrentBytes!15 (size!6387 (buf!6855 w!15))))))

(declare-fun b!262444 () Bool)

(assert (=> b!262444 (= e!182699 (not (inv!12 (BitStream!11589 (buf!6855 w!15) newCurrentBytes!15 newCurrentBit!15))))))

(declare-fun b!262445 () Bool)

(declare-fun array_inv!6111 (array!14625) Bool)

(assert (=> b!262445 (= e!182698 (array_inv!6111 (buf!6855 w!15)))))

(assert (= (and start!57214 res!219622) b!262443))

(assert (= (and b!262443 res!219621) b!262444))

(assert (= start!57214 b!262445))

(declare-fun m!392485 () Bool)

(assert (=> start!57214 m!392485))

(declare-fun m!392487 () Bool)

(assert (=> start!57214 m!392487))

(declare-fun m!392489 () Bool)

(assert (=> b!262443 m!392489))

(declare-fun m!392491 () Bool)

(assert (=> b!262444 m!392491))

(declare-fun m!392493 () Bool)

(assert (=> b!262445 m!392493))

(push 1)

(assert (not b!262444))

(assert (not b!262443))

(assert (not start!57214))

(assert (not b!262445))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!88448 () Bool)

(assert (=> d!88448 (= (inv!12 (BitStream!11589 (buf!6855 w!15) newCurrentBytes!15 newCurrentBit!15)) (invariant!0 (currentBit!12684 (BitStream!11589 (buf!6855 w!15) newCurrentBytes!15 newCurrentBit!15)) (currentByte!12689 (BitStream!11589 (buf!6855 w!15) newCurrentBytes!15 newCurrentBit!15)) (size!6387 (buf!6855 (BitStream!11589 (buf!6855 w!15) newCurrentBytes!15 newCurrentBit!15)))))))

(declare-fun bs!22428 () Bool)

(assert (= bs!22428 d!88448))

(declare-fun m!392495 () Bool)

(assert (=> bs!22428 m!392495))

(assert (=> b!262444 d!88448))

(declare-fun d!88456 () Bool)

(assert (=> d!88456 (= (invariant!0 newCurrentBit!15 newCurrentBytes!15 (size!6387 (buf!6855 w!15))) (and (bvsge newCurrentBit!15 #b00000000000000000000000000000000) (bvslt newCurrentBit!15 #b00000000000000000000000000001000) (bvsge newCurrentBytes!15 #b00000000000000000000000000000000) (or (bvslt newCurrentBytes!15 (size!6387 (buf!6855 w!15))) (and (= newCurrentBit!15 #b00000000000000000000000000000000) (= newCurrentBytes!15 (size!6387 (buf!6855 w!15)))))))))

(assert (=> b!262443 d!88456))

(declare-fun d!88468 () Bool)

