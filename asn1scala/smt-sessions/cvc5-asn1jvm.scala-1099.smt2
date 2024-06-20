; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31602 () Bool)

(assert start!31602)

(declare-fun b!158128 () Bool)

(declare-fun e!107370 () Bool)

(declare-fun e!107367 () Bool)

(assert (=> b!158128 (= e!107370 e!107367)))

(declare-fun res!132104 () Bool)

(assert (=> b!158128 (=> (not res!132104) (not e!107367))))

(declare-fun from!240 () (_ BitVec 32))

(declare-fun to!236 () (_ BitVec 32))

(assert (=> b!158128 (= res!132104 (not (= from!240 (bvsub to!236 #b00000000000000000000000000000001))))))

(declare-datatypes ((array!7344 0))(
  ( (array!7345 (arr!4231 (Array (_ BitVec 32) (_ BitVec 8))) (size!3322 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5836 0))(
  ( (BitStream!5837 (buf!3792 array!7344) (currentByte!6971 (_ BitVec 32)) (currentBit!6966 (_ BitVec 32))) )
))
(declare-fun bs!65 () BitStream!5836)

(declare-datatypes ((tuple2!14396 0))(
  ( (tuple2!14397 (_1!7660 BitStream!5836) (_2!7660 array!7344)) )
))
(declare-fun lt!249255 () tuple2!14396)

(declare-fun lt!249251 () BitStream!5836)

(declare-fun arr!153 () array!7344)

(declare-fun readByteArrayLoopPure!0 (BitStream!5836 array!7344 (_ BitVec 32) (_ BitVec 32)) tuple2!14396)

(declare-datatypes ((tuple2!14398 0))(
  ( (tuple2!14399 (_1!7661 BitStream!5836) (_2!7661 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!5836) tuple2!14398)

(assert (=> b!158128 (= lt!249255 (readByteArrayLoopPure!0 lt!249251 (array!7345 (store (arr!4231 arr!153) from!240 (_2!7661 (readBytePure!0 bs!65))) (size!3322 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(declare-fun withMovedByteIndex!0 (BitStream!5836 (_ BitVec 32)) BitStream!5836)

(assert (=> b!158128 (= lt!249251 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))))

(declare-fun lt!249254 () tuple2!14396)

(assert (=> b!158128 (= lt!249254 (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236))))

(declare-fun b!158129 () Bool)

(assert (=> b!158129 (= e!107367 (not (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240)) (bvslt (bvadd #b00000000000000000000000000000001 from!240) to!236))))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!158129 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3322 (buf!3792 lt!249251))) ((_ sign_extend 32) (currentByte!6971 lt!249251)) ((_ sign_extend 32) (currentBit!6966 lt!249251)) (bvsub (bvsub to!236 from!240) #b00000000000000000000000000000001))))

(declare-datatypes ((Unit!10562 0))(
  ( (Unit!10563) )
))
(declare-fun lt!249252 () Unit!10562)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5836 BitStream!5836 (_ BitVec 64) (_ BitVec 32)) Unit!10562)

(assert (=> b!158129 (= lt!249252 (validateOffsetBytesFromBitIndexLemma!0 bs!65 lt!249251 #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!236 from!240)))))

(declare-fun lt!249253 () tuple2!14398)

(assert (=> b!158129 (= lt!249253 (readBytePure!0 lt!249251))))

(declare-fun res!132102 () Bool)

(assert (=> start!31602 (=> (not res!132102) (not e!107370))))

(assert (=> start!31602 (= res!132102 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3322 arr!153))))))

(assert (=> start!31602 e!107370))

(assert (=> start!31602 true))

(declare-fun array_inv!3081 (array!7344) Bool)

(assert (=> start!31602 (array_inv!3081 arr!153)))

(declare-fun e!107368 () Bool)

(declare-fun inv!12 (BitStream!5836) Bool)

(assert (=> start!31602 (and (inv!12 bs!65) e!107368)))

(declare-fun b!158127 () Bool)

(declare-fun res!132103 () Bool)

(assert (=> b!158127 (=> (not res!132103) (not e!107370))))

(assert (=> b!158127 (= res!132103 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3322 (buf!3792 bs!65))) ((_ sign_extend 32) (currentByte!6971 bs!65)) ((_ sign_extend 32) (currentBit!6966 bs!65)) (bvsub to!236 from!240)))))

(declare-fun b!158130 () Bool)

(assert (=> b!158130 (= e!107368 (array_inv!3081 (buf!3792 bs!65)))))

(assert (= (and start!31602 res!132102) b!158127))

(assert (= (and b!158127 res!132103) b!158128))

(assert (= (and b!158128 res!132104) b!158129))

(assert (= start!31602 b!158130))

(declare-fun m!247939 () Bool)

(assert (=> b!158129 m!247939))

(declare-fun m!247941 () Bool)

(assert (=> b!158129 m!247941))

(declare-fun m!247943 () Bool)

(assert (=> b!158129 m!247943))

(declare-fun m!247945 () Bool)

(assert (=> start!31602 m!247945))

(declare-fun m!247947 () Bool)

(assert (=> start!31602 m!247947))

(declare-fun m!247949 () Bool)

(assert (=> b!158127 m!247949))

(declare-fun m!247951 () Bool)

(assert (=> b!158130 m!247951))

(declare-fun m!247953 () Bool)

(assert (=> b!158128 m!247953))

(declare-fun m!247955 () Bool)

(assert (=> b!158128 m!247955))

(declare-fun m!247957 () Bool)

(assert (=> b!158128 m!247957))

(declare-fun m!247959 () Bool)

(assert (=> b!158128 m!247959))

(declare-fun m!247961 () Bool)

(assert (=> b!158128 m!247961))

(push 1)

(assert (not b!158127))

(assert (not b!158129))

(assert (not start!31602))

(assert (not b!158130))

(assert (not b!158128))

(check-sat)

(pop 1)

(push 1)

(check-sat)

