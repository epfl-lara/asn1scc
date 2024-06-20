; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31600 () Bool)

(assert start!31600)

(declare-fun b!158117 () Bool)

(declare-fun e!107353 () Bool)

(declare-fun from!240 () (_ BitVec 32))

(assert (=> b!158117 (= e!107353 (not (or (not (= (bvand from!240 #b10000000000000000000000000000000) #b00000000000000000000000000000000)) (= (bvand from!240 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!240) #b10000000000000000000000000000000)))))))

(declare-datatypes ((array!7342 0))(
  ( (array!7343 (arr!4230 (Array (_ BitVec 32) (_ BitVec 8))) (size!3321 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5834 0))(
  ( (BitStream!5835 (buf!3791 array!7342) (currentByte!6970 (_ BitVec 32)) (currentBit!6965 (_ BitVec 32))) )
))
(declare-fun lt!249239 () BitStream!5834)

(declare-fun to!236 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!158117 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3321 (buf!3791 lt!249239))) ((_ sign_extend 32) (currentByte!6970 lt!249239)) ((_ sign_extend 32) (currentBit!6965 lt!249239)) (bvsub (bvsub to!236 from!240) #b00000000000000000000000000000001))))

(declare-fun bs!65 () BitStream!5834)

(declare-datatypes ((Unit!10560 0))(
  ( (Unit!10561) )
))
(declare-fun lt!249238 () Unit!10560)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5834 BitStream!5834 (_ BitVec 64) (_ BitVec 32)) Unit!10560)

(assert (=> b!158117 (= lt!249238 (validateOffsetBytesFromBitIndexLemma!0 bs!65 lt!249239 #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!236 from!240)))))

(declare-datatypes ((tuple2!14392 0))(
  ( (tuple2!14393 (_1!7658 BitStream!5834) (_2!7658 (_ BitVec 8))) )
))
(declare-fun lt!249240 () tuple2!14392)

(declare-fun readBytePure!0 (BitStream!5834) tuple2!14392)

(assert (=> b!158117 (= lt!249240 (readBytePure!0 lt!249239))))

(declare-fun b!158116 () Bool)

(declare-fun e!107351 () Bool)

(assert (=> b!158116 (= e!107351 e!107353)))

(declare-fun res!132094 () Bool)

(assert (=> b!158116 (=> (not res!132094) (not e!107353))))

(assert (=> b!158116 (= res!132094 (not (= from!240 (bvsub to!236 #b00000000000000000000000000000001))))))

(declare-datatypes ((tuple2!14394 0))(
  ( (tuple2!14395 (_1!7659 BitStream!5834) (_2!7659 array!7342)) )
))
(declare-fun lt!249237 () tuple2!14394)

(declare-fun arr!153 () array!7342)

(declare-fun readByteArrayLoopPure!0 (BitStream!5834 array!7342 (_ BitVec 32) (_ BitVec 32)) tuple2!14394)

(assert (=> b!158116 (= lt!249237 (readByteArrayLoopPure!0 lt!249239 (array!7343 (store (arr!4230 arr!153) from!240 (_2!7658 (readBytePure!0 bs!65))) (size!3321 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(declare-fun withMovedByteIndex!0 (BitStream!5834 (_ BitVec 32)) BitStream!5834)

(assert (=> b!158116 (= lt!249239 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))))

(declare-fun lt!249236 () tuple2!14394)

(assert (=> b!158116 (= lt!249236 (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236))))

(declare-fun res!132095 () Bool)

(assert (=> start!31600 (=> (not res!132095) (not e!107351))))

(assert (=> start!31600 (= res!132095 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3321 arr!153))))))

(assert (=> start!31600 e!107351))

(assert (=> start!31600 true))

(declare-fun array_inv!3080 (array!7342) Bool)

(assert (=> start!31600 (array_inv!3080 arr!153)))

(declare-fun e!107354 () Bool)

(declare-fun inv!12 (BitStream!5834) Bool)

(assert (=> start!31600 (and (inv!12 bs!65) e!107354)))

(declare-fun b!158115 () Bool)

(declare-fun res!132093 () Bool)

(assert (=> b!158115 (=> (not res!132093) (not e!107351))))

(assert (=> b!158115 (= res!132093 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3321 (buf!3791 bs!65))) ((_ sign_extend 32) (currentByte!6970 bs!65)) ((_ sign_extend 32) (currentBit!6965 bs!65)) (bvsub to!236 from!240)))))

(declare-fun b!158118 () Bool)

(assert (=> b!158118 (= e!107354 (array_inv!3080 (buf!3791 bs!65)))))

(assert (= (and start!31600 res!132095) b!158115))

(assert (= (and b!158115 res!132093) b!158116))

(assert (= (and b!158116 res!132094) b!158117))

(assert (= start!31600 b!158118))

(declare-fun m!247915 () Bool)

(assert (=> b!158118 m!247915))

(declare-fun m!247917 () Bool)

(assert (=> b!158115 m!247917))

(declare-fun m!247919 () Bool)

(assert (=> start!31600 m!247919))

(declare-fun m!247921 () Bool)

(assert (=> start!31600 m!247921))

(declare-fun m!247923 () Bool)

(assert (=> b!158117 m!247923))

(declare-fun m!247925 () Bool)

(assert (=> b!158117 m!247925))

(declare-fun m!247927 () Bool)

(assert (=> b!158117 m!247927))

(declare-fun m!247929 () Bool)

(assert (=> b!158116 m!247929))

(declare-fun m!247931 () Bool)

(assert (=> b!158116 m!247931))

(declare-fun m!247933 () Bool)

(assert (=> b!158116 m!247933))

(declare-fun m!247935 () Bool)

(assert (=> b!158116 m!247935))

(declare-fun m!247937 () Bool)

(assert (=> b!158116 m!247937))

(push 1)

(assert (not b!158117))

(assert (not b!158118))

(assert (not start!31600))

(assert (not b!158115))

(assert (not b!158116))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

