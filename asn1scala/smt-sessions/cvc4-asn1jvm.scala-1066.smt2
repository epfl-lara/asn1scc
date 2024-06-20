; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30590 () Bool)

(assert start!30590)

(declare-fun res!130286 () Bool)

(declare-fun e!105116 () Bool)

(assert (=> start!30590 (=> (not res!130286) (not e!105116))))

(declare-fun from!240 () (_ BitVec 32))

(declare-fun to!236 () (_ BitVec 32))

(declare-datatypes ((array!7114 0))(
  ( (array!7115 (arr!4027 (Array (_ BitVec 32) (_ BitVec 8))) (size!3195 (_ BitVec 32))) )
))
(declare-fun arr!153 () array!7114)

(assert (=> start!30590 (= res!130286 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3195 arr!153))))))

(assert (=> start!30590 e!105116))

(assert (=> start!30590 true))

(declare-fun array_inv!2984 (array!7114) Bool)

(assert (=> start!30590 (array_inv!2984 arr!153)))

(declare-datatypes ((BitStream!5648 0))(
  ( (BitStream!5649 (buf!3698 array!7114) (currentByte!6771 (_ BitVec 32)) (currentBit!6766 (_ BitVec 32))) )
))
(declare-fun bs!65 () BitStream!5648)

(declare-fun e!105117 () Bool)

(declare-fun inv!12 (BitStream!5648) Bool)

(assert (=> start!30590 (and (inv!12 bs!65) e!105117)))

(declare-fun b!155816 () Bool)

(declare-fun res!130285 () Bool)

(assert (=> b!155816 (=> (not res!130285) (not e!105116))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!155816 (= res!130285 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3195 (buf!3698 bs!65))) ((_ sign_extend 32) (currentByte!6771 bs!65)) ((_ sign_extend 32) (currentBit!6766 bs!65)) (bvsub to!236 from!240)))))

(declare-fun b!155817 () Bool)

(assert (=> b!155817 (= e!105116 (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240)))))

(declare-datatypes ((tuple2!13818 0))(
  ( (tuple2!13819 (_1!7335 BitStream!5648) (_2!7335 (_ BitVec 8))) )
))
(declare-fun lt!242482 () tuple2!13818)

(declare-fun readBytePure!0 (BitStream!5648) tuple2!13818)

(assert (=> b!155817 (= lt!242482 (readBytePure!0 bs!65))))

(declare-fun lt!242481 () BitStream!5648)

(declare-fun withMovedByteIndex!0 (BitStream!5648 (_ BitVec 32)) BitStream!5648)

(assert (=> b!155817 (= lt!242481 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))))

(declare-datatypes ((tuple2!13820 0))(
  ( (tuple2!13821 (_1!7336 BitStream!5648) (_2!7336 array!7114)) )
))
(declare-fun lt!242480 () tuple2!13820)

(declare-fun readByteArrayLoopPure!0 (BitStream!5648 array!7114 (_ BitVec 32) (_ BitVec 32)) tuple2!13820)

(assert (=> b!155817 (= lt!242480 (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236))))

(declare-fun b!155818 () Bool)

(assert (=> b!155818 (= e!105117 (array_inv!2984 (buf!3698 bs!65)))))

(assert (= (and start!30590 res!130286) b!155816))

(assert (= (and b!155816 res!130285) b!155817))

(assert (= start!30590 b!155818))

(declare-fun m!242119 () Bool)

(assert (=> start!30590 m!242119))

(declare-fun m!242121 () Bool)

(assert (=> start!30590 m!242121))

(declare-fun m!242123 () Bool)

(assert (=> b!155816 m!242123))

(declare-fun m!242125 () Bool)

(assert (=> b!155817 m!242125))

(declare-fun m!242127 () Bool)

(assert (=> b!155817 m!242127))

(declare-fun m!242129 () Bool)

(assert (=> b!155817 m!242129))

(declare-fun m!242131 () Bool)

(assert (=> b!155818 m!242131))

(push 1)

(assert (not b!155818))

(assert (not b!155817))

(assert (not b!155816))

(assert (not start!30590))

(check-sat)

(pop 1)

(push 1)

(check-sat)

