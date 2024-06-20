; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30548 () Bool)

(assert start!30548)

(declare-fun res!130268 () Bool)

(declare-fun e!105081 () Bool)

(assert (=> start!30548 (=> (not res!130268) (not e!105081))))

(declare-fun from!240 () (_ BitVec 32))

(declare-fun to!236 () (_ BitVec 32))

(declare-datatypes ((array!7105 0))(
  ( (array!7106 (arr!4021 (Array (_ BitVec 32) (_ BitVec 8))) (size!3192 (_ BitVec 32))) )
))
(declare-fun arr!153 () array!7105)

(assert (=> start!30548 (= res!130268 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3192 arr!153))))))

(assert (=> start!30548 e!105081))

(assert (=> start!30548 true))

(declare-fun array_inv!2981 (array!7105) Bool)

(assert (=> start!30548 (array_inv!2981 arr!153)))

(declare-datatypes ((BitStream!5642 0))(
  ( (BitStream!5643 (buf!3695 array!7105) (currentByte!6762 (_ BitVec 32)) (currentBit!6757 (_ BitVec 32))) )
))
(declare-fun bs!65 () BitStream!5642)

(declare-fun e!105082 () Bool)

(declare-fun inv!12 (BitStream!5642) Bool)

(assert (=> start!30548 (and (inv!12 bs!65) e!105082)))

(declare-fun b!155789 () Bool)

(declare-fun res!130267 () Bool)

(assert (=> b!155789 (=> (not res!130267) (not e!105081))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!155789 (= res!130267 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3192 (buf!3695 bs!65))) ((_ sign_extend 32) (currentByte!6762 bs!65)) ((_ sign_extend 32) (currentBit!6757 bs!65)) (bvsub to!236 from!240)))))

(declare-fun b!155790 () Bool)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!155790 (= e!105081 (not (validate_offset_byte!0 ((_ sign_extend 32) (size!3192 (buf!3695 bs!65))) ((_ sign_extend 32) (currentByte!6762 bs!65)) ((_ sign_extend 32) (currentBit!6757 bs!65)))))))

(declare-fun lt!242445 () BitStream!5642)

(declare-fun withMovedByteIndex!0 (BitStream!5642 (_ BitVec 32)) BitStream!5642)

(assert (=> b!155790 (= lt!242445 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))))

(declare-datatypes ((tuple2!13802 0))(
  ( (tuple2!13803 (_1!7324 BitStream!5642) (_2!7324 array!7105)) )
))
(declare-fun lt!242446 () tuple2!13802)

(declare-fun readByteArrayLoopPure!0 (BitStream!5642 array!7105 (_ BitVec 32) (_ BitVec 32)) tuple2!13802)

(assert (=> b!155790 (= lt!242446 (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236))))

(declare-fun b!155791 () Bool)

(assert (=> b!155791 (= e!105082 (array_inv!2981 (buf!3695 bs!65)))))

(assert (= (and start!30548 res!130268) b!155789))

(assert (= (and b!155789 res!130267) b!155790))

(assert (= start!30548 b!155791))

(declare-fun m!242053 () Bool)

(assert (=> start!30548 m!242053))

(declare-fun m!242055 () Bool)

(assert (=> start!30548 m!242055))

(declare-fun m!242057 () Bool)

(assert (=> b!155789 m!242057))

(declare-fun m!242059 () Bool)

(assert (=> b!155790 m!242059))

(declare-fun m!242061 () Bool)

(assert (=> b!155790 m!242061))

(declare-fun m!242063 () Bool)

(assert (=> b!155790 m!242063))

(declare-fun m!242065 () Bool)

(assert (=> b!155791 m!242065))

(push 1)

(assert (not b!155789))

(assert (not start!30548))

(assert (not b!155790))

(assert (not b!155791))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!51582 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!51582 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3192 (buf!3695 bs!65))) ((_ sign_extend 32) (currentByte!6762 bs!65)) ((_ sign_extend 32) (currentBit!6757 bs!65)) (bvsub to!236 from!240)) (bvsle ((_ sign_extend 32) (bvsub to!236 from!240)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3192 (buf!3695 bs!65))) ((_ sign_extend 32) (currentByte!6762 bs!65)) ((_ sign_extend 32) (currentBit!6757 bs!65))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!12613 () Bool)

(assert (= bs!12613 d!51582))

(declare-fun m!242073 () Bool)

(assert (=> bs!12613 m!242073))

(assert (=> b!155789 d!51582))

(declare-fun d!51584 () Bool)

(assert (=> d!51584 (= (array_inv!2981 arr!153) (bvsge (size!3192 arr!153) #b00000000000000000000000000000000))))

(assert (=> start!30548 d!51584))

(declare-fun d!51586 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!51586 (= (inv!12 bs!65) (invariant!0 (currentBit!6757 bs!65) (currentByte!6762 bs!65) (size!3192 (buf!3695 bs!65))))))

(declare-fun bs!12614 () Bool)

(assert (= bs!12614 d!51586))

(declare-fun m!242075 () Bool)

(assert (=> bs!12614 m!242075))

(assert (=> start!30548 d!51586))

(declare-fun d!51588 () Bool)

(assert (=> d!51588 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3192 (buf!3695 bs!65))) ((_ sign_extend 32) (currentByte!6762 bs!65)) ((_ sign_extend 32) (currentBit!6757 bs!65))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3192 (buf!3695 bs!65))) ((_ sign_extend 32) (currentByte!6762 bs!65)) ((_ sign_extend 32) (currentBit!6757 bs!65))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!12615 () Bool)

(assert (= bs!12615 d!51588))

(assert (=> bs!12615 m!242073))

(assert (=> b!155790 d!51588))

(declare-fun d!51590 () Bool)

(declare-datatypes ((Unit!9840 0))(
  ( (Unit!9841) )
))
(declare-datatypes ((tuple2!13806 0))(
  ( (tuple2!13807 (_1!7327 Unit!9840) (_2!7327 BitStream!5642)) )
))
(declare-fun moveByteIndex!0 (BitStream!5642 (_ BitVec 32)) tuple2!13806)

(assert (=> d!51590 (= (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (_2!7327 (moveByteIndex!0 bs!65 #b00000000000000000000000000000001)))))

(declare-fun bs!12616 () Bool)

(assert (= bs!12616 d!51590))

(declare-fun m!242077 () Bool)

(assert (=> bs!12616 m!242077))

(assert (=> b!155790 d!51590))

(declare-datatypes ((tuple3!614 0))(
  ( (tuple3!615 (_1!7328 Unit!9840) (_2!7328 BitStream!5642) (_3!424 array!7105)) )
))
(declare-fun lt!242452 () tuple3!614)

(declare-fun d!51594 () Bool)

(declare-fun readByteArrayLoop!0 (BitStream!5642 array!7105 (_ BitVec 32) (_ BitVec 32)) tuple3!614)

(assert (=> d!51594 (= lt!242452 (readByteArrayLoop!0 bs!65 arr!153 from!240 to!236))))

(assert (=> d!51594 (= (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236) (tuple2!13803 (_2!7328 lt!242452) (_3!424 lt!242452)))))

(declare-fun bs!12621 () Bool)

(assert (= bs!12621 d!51594))

(declare-fun m!242085 () Bool)

(assert (=> bs!12621 m!242085))

(assert (=> b!155790 d!51594))

(declare-fun d!51604 () Bool)

(assert (=> d!51604 (= (array_inv!2981 (buf!3695 bs!65)) (bvsge (size!3192 (buf!3695 bs!65)) #b00000000000000000000000000000000))))

(assert (=> b!155791 d!51604))

(push 1)

(assert (not d!51594))

(assert (not d!51586))

(assert (not d!51590))

(assert (not d!51588))

(assert (not d!51582))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

