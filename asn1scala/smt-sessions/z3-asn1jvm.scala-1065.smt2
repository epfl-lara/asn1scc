; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30546 () Bool)

(assert start!30546)

(declare-fun res!130261 () Bool)

(declare-fun e!105068 () Bool)

(assert (=> start!30546 (=> (not res!130261) (not e!105068))))

(declare-fun from!240 () (_ BitVec 32))

(declare-fun to!236 () (_ BitVec 32))

(declare-datatypes ((array!7103 0))(
  ( (array!7104 (arr!4020 (Array (_ BitVec 32) (_ BitVec 8))) (size!3191 (_ BitVec 32))) )
))
(declare-fun arr!153 () array!7103)

(assert (=> start!30546 (= res!130261 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3191 arr!153))))))

(assert (=> start!30546 e!105068))

(assert (=> start!30546 true))

(declare-fun array_inv!2980 (array!7103) Bool)

(assert (=> start!30546 (array_inv!2980 arr!153)))

(declare-datatypes ((BitStream!5640 0))(
  ( (BitStream!5641 (buf!3694 array!7103) (currentByte!6761 (_ BitVec 32)) (currentBit!6756 (_ BitVec 32))) )
))
(declare-fun bs!65 () BitStream!5640)

(declare-fun e!105071 () Bool)

(declare-fun inv!12 (BitStream!5640) Bool)

(assert (=> start!30546 (and (inv!12 bs!65) e!105071)))

(declare-fun b!155780 () Bool)

(declare-fun res!130262 () Bool)

(assert (=> b!155780 (=> (not res!130262) (not e!105068))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!155780 (= res!130262 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3191 (buf!3694 bs!65))) ((_ sign_extend 32) (currentByte!6761 bs!65)) ((_ sign_extend 32) (currentBit!6756 bs!65)) (bvsub to!236 from!240)))))

(declare-fun b!155781 () Bool)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!155781 (= e!105068 (not (validate_offset_byte!0 ((_ sign_extend 32) (size!3191 (buf!3694 bs!65))) ((_ sign_extend 32) (currentByte!6761 bs!65)) ((_ sign_extend 32) (currentBit!6756 bs!65)))))))

(declare-fun lt!242440 () BitStream!5640)

(declare-fun withMovedByteIndex!0 (BitStream!5640 (_ BitVec 32)) BitStream!5640)

(assert (=> b!155781 (= lt!242440 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))))

(declare-datatypes ((tuple2!13800 0))(
  ( (tuple2!13801 (_1!7323 BitStream!5640) (_2!7323 array!7103)) )
))
(declare-fun lt!242439 () tuple2!13800)

(declare-fun readByteArrayLoopPure!0 (BitStream!5640 array!7103 (_ BitVec 32) (_ BitVec 32)) tuple2!13800)

(assert (=> b!155781 (= lt!242439 (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236))))

(declare-fun b!155782 () Bool)

(assert (=> b!155782 (= e!105071 (array_inv!2980 (buf!3694 bs!65)))))

(assert (= (and start!30546 res!130261) b!155780))

(assert (= (and b!155780 res!130262) b!155781))

(assert (= start!30546 b!155782))

(declare-fun m!242039 () Bool)

(assert (=> start!30546 m!242039))

(declare-fun m!242041 () Bool)

(assert (=> start!30546 m!242041))

(declare-fun m!242043 () Bool)

(assert (=> b!155780 m!242043))

(declare-fun m!242045 () Bool)

(assert (=> b!155781 m!242045))

(declare-fun m!242047 () Bool)

(assert (=> b!155781 m!242047))

(declare-fun m!242049 () Bool)

(assert (=> b!155781 m!242049))

(declare-fun m!242051 () Bool)

(assert (=> b!155782 m!242051))

(check-sat (not b!155780) (not b!155781) (not start!30546) (not b!155782))
(check-sat)
(get-model)

(declare-fun d!51592 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!51592 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3191 (buf!3694 bs!65))) ((_ sign_extend 32) (currentByte!6761 bs!65)) ((_ sign_extend 32) (currentBit!6756 bs!65)) (bvsub to!236 from!240)) (bvsle ((_ sign_extend 32) (bvsub to!236 from!240)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3191 (buf!3694 bs!65))) ((_ sign_extend 32) (currentByte!6761 bs!65)) ((_ sign_extend 32) (currentBit!6756 bs!65))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!12618 () Bool)

(assert (= bs!12618 d!51592))

(declare-fun m!242081 () Bool)

(assert (=> bs!12618 m!242081))

(assert (=> b!155780 d!51592))

(declare-fun d!51598 () Bool)

(assert (=> d!51598 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3191 (buf!3694 bs!65))) ((_ sign_extend 32) (currentByte!6761 bs!65)) ((_ sign_extend 32) (currentBit!6756 bs!65))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3191 (buf!3694 bs!65))) ((_ sign_extend 32) (currentByte!6761 bs!65)) ((_ sign_extend 32) (currentBit!6756 bs!65))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!12619 () Bool)

(assert (= bs!12619 d!51598))

(assert (=> bs!12619 m!242081))

(assert (=> b!155781 d!51598))

(declare-fun d!51600 () Bool)

(declare-datatypes ((Unit!9842 0))(
  ( (Unit!9843) )
))
(declare-datatypes ((tuple2!13808 0))(
  ( (tuple2!13809 (_1!7329 Unit!9842) (_2!7329 BitStream!5640)) )
))
(declare-fun moveByteIndex!0 (BitStream!5640 (_ BitVec 32)) tuple2!13808)

(assert (=> d!51600 (= (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (_2!7329 (moveByteIndex!0 bs!65 #b00000000000000000000000000000001)))))

(declare-fun bs!12620 () Bool)

(assert (= bs!12620 d!51600))

(declare-fun m!242083 () Bool)

(assert (=> bs!12620 m!242083))

(assert (=> b!155781 d!51600))

(declare-fun d!51602 () Bool)

(declare-datatypes ((tuple3!616 0))(
  ( (tuple3!617 (_1!7330 Unit!9842) (_2!7330 BitStream!5640) (_3!425 array!7103)) )
))
(declare-fun lt!242455 () tuple3!616)

(declare-fun readByteArrayLoop!0 (BitStream!5640 array!7103 (_ BitVec 32) (_ BitVec 32)) tuple3!616)

(assert (=> d!51602 (= lt!242455 (readByteArrayLoop!0 bs!65 arr!153 from!240 to!236))))

(assert (=> d!51602 (= (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236) (tuple2!13801 (_2!7330 lt!242455) (_3!425 lt!242455)))))

(declare-fun bs!12622 () Bool)

(assert (= bs!12622 d!51602))

(declare-fun m!242087 () Bool)

(assert (=> bs!12622 m!242087))

(assert (=> b!155781 d!51602))

(declare-fun d!51606 () Bool)

(assert (=> d!51606 (= (array_inv!2980 arr!153) (bvsge (size!3191 arr!153) #b00000000000000000000000000000000))))

(assert (=> start!30546 d!51606))

(declare-fun d!51608 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!51608 (= (inv!12 bs!65) (invariant!0 (currentBit!6756 bs!65) (currentByte!6761 bs!65) (size!3191 (buf!3694 bs!65))))))

(declare-fun bs!12623 () Bool)

(assert (= bs!12623 d!51608))

(declare-fun m!242089 () Bool)

(assert (=> bs!12623 m!242089))

(assert (=> start!30546 d!51608))

(declare-fun d!51610 () Bool)

(assert (=> d!51610 (= (array_inv!2980 (buf!3694 bs!65)) (bvsge (size!3191 (buf!3694 bs!65)) #b00000000000000000000000000000000))))

(assert (=> b!155782 d!51610))

(check-sat (not d!51608) (not d!51602) (not d!51592) (not d!51598) (not d!51600))
(check-sat)
