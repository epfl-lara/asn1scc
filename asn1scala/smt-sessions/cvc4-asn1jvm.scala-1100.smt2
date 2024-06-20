; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31612 () Bool)

(assert start!31612)

(declare-fun b!158195 () Bool)

(declare-fun e!107451 () Bool)

(declare-datatypes ((array!7354 0))(
  ( (array!7355 (arr!4236 (Array (_ BitVec 32) (_ BitVec 8))) (size!3327 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5846 0))(
  ( (BitStream!5847 (buf!3797 array!7354) (currentByte!6976 (_ BitVec 32)) (currentBit!6971 (_ BitVec 32))) )
))
(declare-fun bs!65 () BitStream!5846)

(declare-fun array_inv!3086 (array!7354) Bool)

(assert (=> b!158195 (= e!107451 (array_inv!3086 (buf!3797 bs!65)))))

(declare-fun b!158197 () Bool)

(declare-fun res!132158 () Bool)

(declare-fun e!107453 () Bool)

(assert (=> b!158197 (=> (not res!132158) (not e!107453))))

(declare-fun from!240 () (_ BitVec 32))

(declare-fun to!236 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!158197 (= res!132158 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3327 (buf!3797 bs!65))) ((_ sign_extend 32) (currentByte!6976 bs!65)) ((_ sign_extend 32) (currentBit!6971 bs!65)) (bvsub to!236 from!240)))))

(declare-fun lt!249338 () BitStream!5846)

(declare-fun b!158198 () Bool)

(declare-fun lt!249337 () (_ BitVec 64))

(declare-fun e!107452 () Bool)

(assert (=> b!158198 (= e!107452 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3327 (buf!3797 lt!249338))) lt!249337 ((_ sign_extend 32) (currentBit!6971 lt!249338)) (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240))))))

(declare-fun b!158199 () Bool)

(declare-fun e!107450 () Bool)

(assert (=> b!158199 (= e!107450 (not e!107452))))

(declare-fun res!132156 () Bool)

(assert (=> b!158199 (=> res!132156 e!107452)))

(assert (=> b!158199 (= res!132156 (or (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240)) (bvsge (bvadd #b00000000000000000000000000000001 from!240) to!236)))))

(assert (=> b!158199 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3327 (buf!3797 lt!249338))) lt!249337 ((_ sign_extend 32) (currentBit!6971 lt!249338)) (bvsub (bvsub to!236 from!240) #b00000000000000000000000000000001))))

(assert (=> b!158199 (= lt!249337 ((_ sign_extend 32) (currentByte!6976 lt!249338)))))

(declare-datatypes ((Unit!10572 0))(
  ( (Unit!10573) )
))
(declare-fun lt!249339 () Unit!10572)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5846 BitStream!5846 (_ BitVec 64) (_ BitVec 32)) Unit!10572)

(assert (=> b!158199 (= lt!249339 (validateOffsetBytesFromBitIndexLemma!0 bs!65 lt!249338 #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!236 from!240)))))

(declare-datatypes ((tuple2!14416 0))(
  ( (tuple2!14417 (_1!7670 BitStream!5846) (_2!7670 (_ BitVec 8))) )
))
(declare-fun lt!249336 () tuple2!14416)

(declare-fun readBytePure!0 (BitStream!5846) tuple2!14416)

(assert (=> b!158199 (= lt!249336 (readBytePure!0 lt!249338))))

(declare-fun b!158196 () Bool)

(assert (=> b!158196 (= e!107453 e!107450)))

(declare-fun res!132157 () Bool)

(assert (=> b!158196 (=> (not res!132157) (not e!107450))))

(assert (=> b!158196 (= res!132157 (not (= from!240 (bvsub to!236 #b00000000000000000000000000000001))))))

(declare-datatypes ((tuple2!14418 0))(
  ( (tuple2!14419 (_1!7671 BitStream!5846) (_2!7671 array!7354)) )
))
(declare-fun lt!249335 () tuple2!14418)

(declare-fun arr!153 () array!7354)

(declare-fun readByteArrayLoopPure!0 (BitStream!5846 array!7354 (_ BitVec 32) (_ BitVec 32)) tuple2!14418)

(assert (=> b!158196 (= lt!249335 (readByteArrayLoopPure!0 lt!249338 (array!7355 (store (arr!4236 arr!153) from!240 (_2!7670 (readBytePure!0 bs!65))) (size!3327 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(declare-fun withMovedByteIndex!0 (BitStream!5846 (_ BitVec 32)) BitStream!5846)

(assert (=> b!158196 (= lt!249338 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))))

(declare-fun lt!249334 () tuple2!14418)

(assert (=> b!158196 (= lt!249334 (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236))))

(declare-fun res!132155 () Bool)

(assert (=> start!31612 (=> (not res!132155) (not e!107453))))

(assert (=> start!31612 (= res!132155 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3327 arr!153))))))

(assert (=> start!31612 e!107453))

(assert (=> start!31612 true))

(assert (=> start!31612 (array_inv!3086 arr!153)))

(declare-fun inv!12 (BitStream!5846) Bool)

(assert (=> start!31612 (and (inv!12 bs!65) e!107451)))

(assert (= (and start!31612 res!132155) b!158197))

(assert (= (and b!158197 res!132158) b!158196))

(assert (= (and b!158196 res!132157) b!158199))

(assert (= (and b!158199 (not res!132156)) b!158198))

(assert (= start!31612 b!158195))

(declare-fun m!248063 () Bool)

(assert (=> b!158198 m!248063))

(declare-fun m!248065 () Bool)

(assert (=> b!158196 m!248065))

(declare-fun m!248067 () Bool)

(assert (=> b!158196 m!248067))

(declare-fun m!248069 () Bool)

(assert (=> b!158196 m!248069))

(declare-fun m!248071 () Bool)

(assert (=> b!158196 m!248071))

(declare-fun m!248073 () Bool)

(assert (=> b!158196 m!248073))

(declare-fun m!248075 () Bool)

(assert (=> b!158199 m!248075))

(declare-fun m!248077 () Bool)

(assert (=> b!158199 m!248077))

(declare-fun m!248079 () Bool)

(assert (=> b!158199 m!248079))

(declare-fun m!248081 () Bool)

(assert (=> start!31612 m!248081))

(declare-fun m!248083 () Bool)

(assert (=> start!31612 m!248083))

(declare-fun m!248085 () Bool)

(assert (=> b!158195 m!248085))

(declare-fun m!248087 () Bool)

(assert (=> b!158197 m!248087))

(push 1)

(assert (not b!158198))

(assert (not b!158195))

(assert (not start!31612))

(assert (not b!158199))

(assert (not b!158196))

(assert (not b!158197))

(check-sat)

(pop 1)

(push 1)

(check-sat)

