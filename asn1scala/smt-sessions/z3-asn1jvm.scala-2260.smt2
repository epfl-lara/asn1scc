; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57212 () Bool)

(assert start!57212)

(declare-fun res!219616 () Bool)

(declare-fun e!182690 () Bool)

(assert (=> start!57212 (=> (not res!219616) (not e!182690))))

(declare-datatypes ((array!14623 0))(
  ( (array!14624 (arr!7373 (Array (_ BitVec 32) (_ BitVec 8))) (size!6386 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11586 0))(
  ( (BitStream!11587 (buf!6854 array!14623) (currentByte!12688 (_ BitVec 32)) (currentBit!12683 (_ BitVec 32))) )
))
(declare-fun w!15 () BitStream!11586)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> start!57212 (= res!219616 (invariant!0 (currentBit!12683 w!15) (currentByte!12688 w!15) (size!6386 (buf!6854 w!15))))))

(assert (=> start!57212 e!182690))

(declare-fun e!182691 () Bool)

(declare-fun inv!12 (BitStream!11586) Bool)

(assert (=> start!57212 (and (inv!12 w!15) e!182691)))

(assert (=> start!57212 true))

(declare-fun b!262434 () Bool)

(declare-fun res!219615 () Bool)

(assert (=> b!262434 (=> (not res!219615) (not e!182690))))

(declare-fun newCurrentBytes!15 () (_ BitVec 32))

(declare-fun newCurrentBit!15 () (_ BitVec 32))

(assert (=> b!262434 (= res!219615 (invariant!0 newCurrentBit!15 newCurrentBytes!15 (size!6386 (buf!6854 w!15))))))

(declare-fun b!262435 () Bool)

(assert (=> b!262435 (= e!182690 (not (inv!12 (BitStream!11587 (buf!6854 w!15) newCurrentBytes!15 newCurrentBit!15))))))

(declare-fun b!262436 () Bool)

(declare-fun array_inv!6110 (array!14623) Bool)

(assert (=> b!262436 (= e!182691 (array_inv!6110 (buf!6854 w!15)))))

(assert (= (and start!57212 res!219616) b!262434))

(assert (= (and b!262434 res!219615) b!262435))

(assert (= start!57212 b!262436))

(declare-fun m!392475 () Bool)

(assert (=> start!57212 m!392475))

(declare-fun m!392477 () Bool)

(assert (=> start!57212 m!392477))

(declare-fun m!392479 () Bool)

(assert (=> b!262434 m!392479))

(declare-fun m!392481 () Bool)

(assert (=> b!262435 m!392481))

(declare-fun m!392483 () Bool)

(assert (=> b!262436 m!392483))

(check-sat (not start!57212) (not b!262436) (not b!262435) (not b!262434))
(check-sat)
(get-model)

(declare-fun d!88450 () Bool)

(assert (=> d!88450 (= (invariant!0 (currentBit!12683 w!15) (currentByte!12688 w!15) (size!6386 (buf!6854 w!15))) (and (bvsge (currentBit!12683 w!15) #b00000000000000000000000000000000) (bvslt (currentBit!12683 w!15) #b00000000000000000000000000001000) (bvsge (currentByte!12688 w!15) #b00000000000000000000000000000000) (or (bvslt (currentByte!12688 w!15) (size!6386 (buf!6854 w!15))) (and (= (currentBit!12683 w!15) #b00000000000000000000000000000000) (= (currentByte!12688 w!15) (size!6386 (buf!6854 w!15)))))))))

(assert (=> start!57212 d!88450))

(declare-fun d!88458 () Bool)

(assert (=> d!88458 (= (inv!12 w!15) (invariant!0 (currentBit!12683 w!15) (currentByte!12688 w!15) (size!6386 (buf!6854 w!15))))))

(declare-fun bs!22429 () Bool)

(assert (= bs!22429 d!88458))

(assert (=> bs!22429 m!392475))

(assert (=> start!57212 d!88458))

(declare-fun d!88460 () Bool)

(assert (=> d!88460 (= (array_inv!6110 (buf!6854 w!15)) (bvsge (size!6386 (buf!6854 w!15)) #b00000000000000000000000000000000))))

(assert (=> b!262436 d!88460))

(declare-fun d!88464 () Bool)

(assert (=> d!88464 (= (inv!12 (BitStream!11587 (buf!6854 w!15) newCurrentBytes!15 newCurrentBit!15)) (invariant!0 (currentBit!12683 (BitStream!11587 (buf!6854 w!15) newCurrentBytes!15 newCurrentBit!15)) (currentByte!12688 (BitStream!11587 (buf!6854 w!15) newCurrentBytes!15 newCurrentBit!15)) (size!6386 (buf!6854 (BitStream!11587 (buf!6854 w!15) newCurrentBytes!15 newCurrentBit!15)))))))

(declare-fun bs!22431 () Bool)

(assert (= bs!22431 d!88464))

(declare-fun m!392499 () Bool)

(assert (=> bs!22431 m!392499))

(assert (=> b!262435 d!88464))

(declare-fun d!88466 () Bool)

(assert (=> d!88466 (= (invariant!0 newCurrentBit!15 newCurrentBytes!15 (size!6386 (buf!6854 w!15))) (and (bvsge newCurrentBit!15 #b00000000000000000000000000000000) (bvslt newCurrentBit!15 #b00000000000000000000000000001000) (bvsge newCurrentBytes!15 #b00000000000000000000000000000000) (or (bvslt newCurrentBytes!15 (size!6386 (buf!6854 w!15))) (and (= newCurrentBit!15 #b00000000000000000000000000000000) (= newCurrentBytes!15 (size!6386 (buf!6854 w!15)))))))))

(assert (=> b!262434 d!88466))

(check-sat (not d!88458) (not d!88464))
(check-sat)
