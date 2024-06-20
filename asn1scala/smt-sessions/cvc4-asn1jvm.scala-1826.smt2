; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49102 () Bool)

(assert start!49102)

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun e!160685 () Bool)

(declare-fun lt!369219 () (_ BitVec 64))

(declare-fun lt!369217 () (_ BitVec 64))

(declare-datatypes ((array!12044 0))(
  ( (array!12045 (arr!6273 (Array (_ BitVec 32) (_ BitVec 8))) (size!5286 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9668 0))(
  ( (BitStream!9669 (buf!5827 array!12044) (currentByte!10843 (_ BitVec 32)) (currentBit!10838 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9668)

(declare-fun lt!369218 () (_ BitVec 64))

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun b!233233 () Bool)

(declare-fun b2!99 () BitStream!9668)

(assert (=> b!233233 (= e!160685 (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5286 (buf!5827 b1!101)))) lt!369219) #b0000000000000000000000000000000000000000000000000000000000001000)) (let ((bdg!14402 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10843 b2!99))) ((_ sign_extend 32) (currentBit!10838 b2!99))))) (and (= lt!369218 bdg!14402) (= (bvsub lt!369218 bits!86) lt!369219) (let ((bdg!14403 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5286 (buf!5827 b2!99)))))) (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub bdg!14403 (bvsub bdg!14402 bits!86)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle ((_ sign_extend 32) bytes!19) (bvadd (bvsdiv (bvsub bdg!14403 bdg!14402) #b0000000000000000000000000000000000000000000000000000000000001000) lt!369217)) (bvslt lt!369217 #b0000000000000000000000000000000010000000000000000000000000000000) (bvslt lt!369217 #b1111111111111111111111111111111110000000000000000000000000000000)))))))))

(assert (=> b!233233 (= lt!369219 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10843 b1!101))) ((_ sign_extend 32) (currentBit!10838 b1!101))))))

(declare-fun res!195128 () Bool)

(declare-fun e!160684 () Bool)

(assert (=> start!49102 (=> (not res!195128) (not e!160684))))

(assert (=> start!49102 (= res!195128 (and (= (size!5286 (buf!5827 b1!101)) (size!5286 (buf!5827 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!49102 e!160684))

(declare-fun e!160680 () Bool)

(declare-fun inv!12 (BitStream!9668) Bool)

(assert (=> start!49102 (and (inv!12 b1!101) e!160680)))

(declare-fun e!160679 () Bool)

(assert (=> start!49102 (and (inv!12 b2!99) e!160679)))

(assert (=> start!49102 true))

(declare-fun b!233234 () Bool)

(declare-fun e!160682 () Bool)

(assert (=> b!233234 (= e!160682 e!160685)))

(declare-fun res!195129 () Bool)

(assert (=> b!233234 (=> (not res!195129) (not e!160685))))

(assert (=> b!233234 (= res!195129 (bvsle ((_ extract 31 0) lt!369217) bytes!19))))

(assert (=> b!233234 (= lt!369217 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun b!233235 () Bool)

(declare-fun array_inv!5027 (array!12044) Bool)

(assert (=> b!233235 (= e!160680 (array_inv!5027 (buf!5827 b1!101)))))

(declare-fun b!233236 () Bool)

(assert (=> b!233236 (= e!160679 (array_inv!5027 (buf!5827 b2!99)))))

(declare-fun b!233237 () Bool)

(declare-fun res!195127 () Bool)

(assert (=> b!233237 (=> (not res!195127) (not e!160685))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!233237 (= res!195127 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5286 (buf!5827 b1!101))) ((_ sign_extend 32) (currentByte!10843 b1!101)) ((_ sign_extend 32) (currentBit!10838 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!233238 () Bool)

(declare-fun res!195131 () Bool)

(assert (=> b!233238 (=> (not res!195131) (not e!160685))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!233238 (= res!195131 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5286 (buf!5827 b1!101))) ((_ sign_extend 32) (currentByte!10843 b1!101)) ((_ sign_extend 32) (currentBit!10838 b1!101)) bytes!19))))

(declare-fun b!233239 () Bool)

(declare-fun res!195130 () Bool)

(assert (=> b!233239 (=> (not res!195130) (not e!160685))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!233239 (= res!195130 (= lt!369218 (bvadd (bitIndex!0 (size!5286 (buf!5827 b1!101)) (currentByte!10843 b1!101) (currentBit!10838 b1!101)) bits!86)))))

(declare-fun b!233240 () Bool)

(assert (=> b!233240 (= e!160684 e!160682)))

(declare-fun res!195132 () Bool)

(assert (=> b!233240 (=> (not res!195132) (not e!160682))))

(assert (=> b!233240 (= res!195132 (bvsle bits!86 lt!369218))))

(assert (=> b!233240 (= lt!369218 (bitIndex!0 (size!5286 (buf!5827 b2!99)) (currentByte!10843 b2!99) (currentBit!10838 b2!99)))))

(assert (= (and start!49102 res!195128) b!233240))

(assert (= (and b!233240 res!195132) b!233234))

(assert (= (and b!233234 res!195129) b!233238))

(assert (= (and b!233238 res!195131) b!233239))

(assert (= (and b!233239 res!195130) b!233237))

(assert (= (and b!233237 res!195127) b!233233))

(assert (= start!49102 b!233235))

(assert (= start!49102 b!233236))

(declare-fun m!355909 () Bool)

(assert (=> b!233236 m!355909))

(declare-fun m!355911 () Bool)

(assert (=> b!233235 m!355911))

(declare-fun m!355913 () Bool)

(assert (=> b!233237 m!355913))

(declare-fun m!355915 () Bool)

(assert (=> b!233240 m!355915))

(declare-fun m!355917 () Bool)

(assert (=> b!233239 m!355917))

(declare-fun m!355919 () Bool)

(assert (=> start!49102 m!355919))

(declare-fun m!355921 () Bool)

(assert (=> start!49102 m!355921))

(declare-fun m!355923 () Bool)

(assert (=> b!233238 m!355923))

(push 1)

(assert (not b!233238))

(assert (not b!233236))

(assert (not b!233235))

(assert (not b!233237))

(assert (not b!233240))

(assert (not start!49102))

(assert (not b!233239))

(check-sat)

(pop 1)

(push 1)

(check-sat)

