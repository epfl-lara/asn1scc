; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30544 () Bool)

(assert start!30544)

(declare-fun res!130255 () Bool)

(declare-fun e!105058 () Bool)

(assert (=> start!30544 (=> (not res!130255) (not e!105058))))

(declare-fun from!240 () (_ BitVec 32))

(declare-fun to!236 () (_ BitVec 32))

(declare-datatypes ((array!7101 0))(
  ( (array!7102 (arr!4019 (Array (_ BitVec 32) (_ BitVec 8))) (size!3190 (_ BitVec 32))) )
))
(declare-fun arr!153 () array!7101)

(assert (=> start!30544 (= res!130255 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3190 arr!153))))))

(assert (=> start!30544 e!105058))

(assert (=> start!30544 true))

(declare-fun array_inv!2979 (array!7101) Bool)

(assert (=> start!30544 (array_inv!2979 arr!153)))

(declare-datatypes ((BitStream!5638 0))(
  ( (BitStream!5639 (buf!3693 array!7101) (currentByte!6760 (_ BitVec 32)) (currentBit!6755 (_ BitVec 32))) )
))
(declare-fun bs!65 () BitStream!5638)

(declare-fun e!105057 () Bool)

(declare-fun inv!12 (BitStream!5638) Bool)

(assert (=> start!30544 (and (inv!12 bs!65) e!105057)))

(declare-fun b!155771 () Bool)

(declare-fun res!130256 () Bool)

(assert (=> b!155771 (=> (not res!130256) (not e!105058))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!155771 (= res!130256 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3190 (buf!3693 bs!65))) ((_ sign_extend 32) (currentByte!6760 bs!65)) ((_ sign_extend 32) (currentBit!6755 bs!65)) (bvsub to!236 from!240)))))

(declare-fun b!155772 () Bool)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!155772 (= e!105058 (not (validate_offset_byte!0 ((_ sign_extend 32) (size!3190 (buf!3693 bs!65))) ((_ sign_extend 32) (currentByte!6760 bs!65)) ((_ sign_extend 32) (currentBit!6755 bs!65)))))))

(declare-fun lt!242434 () BitStream!5638)

(declare-fun withMovedByteIndex!0 (BitStream!5638 (_ BitVec 32)) BitStream!5638)

(assert (=> b!155772 (= lt!242434 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))))

(declare-datatypes ((tuple2!13798 0))(
  ( (tuple2!13799 (_1!7322 BitStream!5638) (_2!7322 array!7101)) )
))
(declare-fun lt!242433 () tuple2!13798)

(declare-fun readByteArrayLoopPure!0 (BitStream!5638 array!7101 (_ BitVec 32) (_ BitVec 32)) tuple2!13798)

(assert (=> b!155772 (= lt!242433 (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236))))

(declare-fun b!155773 () Bool)

(assert (=> b!155773 (= e!105057 (array_inv!2979 (buf!3693 bs!65)))))

(assert (= (and start!30544 res!130255) b!155771))

(assert (= (and b!155771 res!130256) b!155772))

(assert (= start!30544 b!155773))

(declare-fun m!242025 () Bool)

(assert (=> start!30544 m!242025))

(declare-fun m!242027 () Bool)

(assert (=> start!30544 m!242027))

(declare-fun m!242029 () Bool)

(assert (=> b!155771 m!242029))

(declare-fun m!242031 () Bool)

(assert (=> b!155772 m!242031))

(declare-fun m!242033 () Bool)

(assert (=> b!155772 m!242033))

(declare-fun m!242035 () Bool)

(assert (=> b!155772 m!242035))

(declare-fun m!242037 () Bool)

(assert (=> b!155773 m!242037))

(push 1)

(assert (not b!155771))

(assert (not start!30544))

(assert (not b!155772))

(assert (not b!155773))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!51570 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!51570 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3190 (buf!3693 bs!65))) ((_ sign_extend 32) (currentByte!6760 bs!65)) ((_ sign_extend 32) (currentBit!6755 bs!65)) (bvsub to!236 from!240)) (bvsle ((_ sign_extend 32) (bvsub to!236 from!240)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3190 (buf!3693 bs!65))) ((_ sign_extend 32) (currentByte!6760 bs!65)) ((_ sign_extend 32) (currentBit!6755 bs!65))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!12609 () Bool)

(assert (= bs!12609 d!51570))

(declare-fun m!242067 () Bool)

(assert (=> bs!12609 m!242067))

(assert (=> b!155771 d!51570))

(declare-fun d!51572 () Bool)

(assert (=> d!51572 (= (array_inv!2979 arr!153) (bvsge (size!3190 arr!153) #b00000000000000000000000000000000))))

(assert (=> start!30544 d!51572))

(declare-fun d!51574 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!51574 (= (inv!12 bs!65) (invariant!0 (currentBit!6755 bs!65) (currentByte!6760 bs!65) (size!3190 (buf!3693 bs!65))))))

(declare-fun bs!12610 () Bool)

(assert (= bs!12610 d!51574))

(declare-fun m!242069 () Bool)

(assert (=> bs!12610 m!242069))

(assert (=> start!30544 d!51574))

(declare-fun d!51576 () Bool)

(assert (=> d!51576 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3190 (buf!3693 bs!65))) ((_ sign_extend 32) (currentByte!6760 bs!65)) ((_ sign_extend 32) (currentBit!6755 bs!65))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3190 (buf!3693 bs!65))) ((_ sign_extend 32) (currentByte!6760 bs!65)) ((_ sign_extend 32) (currentBit!6755 bs!65))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!12611 () Bool)

(assert (= bs!12611 d!51576))

(assert (=> bs!12611 m!242067))

(assert (=> b!155772 d!51576))

(declare-fun d!51578 () Bool)

(declare-datatypes ((Unit!9838 0))(
  ( (Unit!9839) )
))
(declare-datatypes ((tuple2!13804 0))(
  ( (tuple2!13805 (_1!7325 Unit!9838) (_2!7325 BitStream!5638)) )
))
(declare-fun moveByteIndex!0 (BitStream!5638 (_ BitVec 32)) tuple2!13804)

(assert (=> d!51578 (= (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (_2!7325 (moveByteIndex!0 bs!65 #b00000000000000000000000000000001)))))

(declare-fun bs!12612 () Bool)

(assert (= bs!12612 d!51578))

(declare-fun m!242071 () Bool)

(assert (=> bs!12612 m!242071))

(assert (=> b!155772 d!51578))

(declare-fun d!51580 () Bool)

(declare-datatypes ((tuple3!612 0))(
  ( (tuple3!613 (_1!7326 Unit!9838) (_2!7326 BitStream!5638) (_3!423 array!7101)) )
))
(declare-fun lt!242449 () tuple3!612)

(declare-fun readByteArrayLoop!0 (BitStream!5638 array!7101 (_ BitVec 32) (_ BitVec 32)) tuple3!612)

(assert (=> d!51580 (= lt!242449 (readByteArrayLoop!0 bs!65 arr!153 from!240 to!236))))

(assert (=> d!51580 (= (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236) (tuple2!13799 (_2!7326 lt!242449) (_3!423 lt!242449)))))

(declare-fun bs!12617 () Bool)

(assert (= bs!12617 d!51580))

(declare-fun m!242079 () Bool)

(assert (=> bs!12617 m!242079))

(assert (=> b!155772 d!51580))

(declare-fun d!51596 () Bool)

(assert (=> d!51596 (= (array_inv!2979 (buf!3693 bs!65)) (bvsge (size!3190 (buf!3693 bs!65)) #b00000000000000000000000000000000))))

(assert (=> b!155773 d!51596))

(push 1)

(assert (not d!51570))

(assert (not d!51576))

(assert (not d!51580))

(assert (not d!51578))

(assert (not d!51574))

(check-sat)

(pop 1)

(push 1)

(check-sat)

