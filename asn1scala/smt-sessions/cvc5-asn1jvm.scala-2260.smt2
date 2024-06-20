; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57210 () Bool)

(assert start!57210)

(declare-fun res!219610 () Bool)

(declare-fun e!182681 () Bool)

(assert (=> start!57210 (=> (not res!219610) (not e!182681))))

(declare-datatypes ((array!14621 0))(
  ( (array!14622 (arr!7372 (Array (_ BitVec 32) (_ BitVec 8))) (size!6385 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11584 0))(
  ( (BitStream!11585 (buf!6853 array!14621) (currentByte!12687 (_ BitVec 32)) (currentBit!12682 (_ BitVec 32))) )
))
(declare-fun w!15 () BitStream!11584)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> start!57210 (= res!219610 (invariant!0 (currentBit!12682 w!15) (currentByte!12687 w!15) (size!6385 (buf!6853 w!15))))))

(assert (=> start!57210 e!182681))

(declare-fun e!182680 () Bool)

(declare-fun inv!12 (BitStream!11584) Bool)

(assert (=> start!57210 (and (inv!12 w!15) e!182680)))

(assert (=> start!57210 true))

(declare-fun b!262425 () Bool)

(declare-fun res!219609 () Bool)

(assert (=> b!262425 (=> (not res!219609) (not e!182681))))

(declare-fun newCurrentBytes!15 () (_ BitVec 32))

(declare-fun newCurrentBit!15 () (_ BitVec 32))

(assert (=> b!262425 (= res!219609 (invariant!0 newCurrentBit!15 newCurrentBytes!15 (size!6385 (buf!6853 w!15))))))

(declare-fun b!262426 () Bool)

(assert (=> b!262426 (= e!182681 (not (inv!12 (BitStream!11585 (buf!6853 w!15) newCurrentBytes!15 newCurrentBit!15))))))

(declare-fun b!262427 () Bool)

(declare-fun array_inv!6109 (array!14621) Bool)

(assert (=> b!262427 (= e!182680 (array_inv!6109 (buf!6853 w!15)))))

(assert (= (and start!57210 res!219610) b!262425))

(assert (= (and b!262425 res!219609) b!262426))

(assert (= start!57210 b!262427))

(declare-fun m!392465 () Bool)

(assert (=> start!57210 m!392465))

(declare-fun m!392467 () Bool)

(assert (=> start!57210 m!392467))

(declare-fun m!392469 () Bool)

(assert (=> b!262425 m!392469))

(declare-fun m!392471 () Bool)

(assert (=> b!262426 m!392471))

(declare-fun m!392473 () Bool)

(assert (=> b!262427 m!392473))

(push 1)

(assert (not b!262427))

(assert (not b!262426))

(assert (not b!262425))

(assert (not start!57210))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!88452 () Bool)

(assert (=> d!88452 (= (array_inv!6109 (buf!6853 w!15)) (bvsge (size!6385 (buf!6853 w!15)) #b00000000000000000000000000000000))))

(assert (=> b!262427 d!88452))

(declare-fun d!88454 () Bool)

(assert (=> d!88454 (= (inv!12 (BitStream!11585 (buf!6853 w!15) newCurrentBytes!15 newCurrentBit!15)) (invariant!0 (currentBit!12682 (BitStream!11585 (buf!6853 w!15) newCurrentBytes!15 newCurrentBit!15)) (currentByte!12687 (BitStream!11585 (buf!6853 w!15) newCurrentBytes!15 newCurrentBit!15)) (size!6385 (buf!6853 (BitStream!11585 (buf!6853 w!15) newCurrentBytes!15 newCurrentBit!15)))))))

(declare-fun bs!22430 () Bool)

(assert (= bs!22430 d!88454))

(declare-fun m!392497 () Bool)

(assert (=> bs!22430 m!392497))

(assert (=> b!262426 d!88454))

(declare-fun d!88462 () Bool)

(assert (=> d!88462 (= (invariant!0 newCurrentBit!15 newCurrentBytes!15 (size!6385 (buf!6853 w!15))) (and (bvsge newCurrentBit!15 #b00000000000000000000000000000000) (bvslt newCurrentBit!15 #b00000000000000000000000000001000) (bvsge newCurrentBytes!15 #b00000000000000000000000000000000) (or (bvslt newCurrentBytes!15 (size!6385 (buf!6853 w!15))) (and (= newCurrentBit!15 #b00000000000000000000000000000000) (= newCurrentBytes!15 (size!6385 (buf!6853 w!15)))))))))

(assert (=> b!262425 d!88462))

(declare-fun d!88474 () Bool)

