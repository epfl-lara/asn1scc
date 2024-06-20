; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48952 () Bool)

(assert start!48952)

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun lt!368823 () (_ BitVec 64))

(declare-fun b!231986 () Bool)

(declare-datatypes ((array!11921 0))(
  ( (array!11922 (arr!6213 (Array (_ BitVec 32) (_ BitVec 8))) (size!5226 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9548 0))(
  ( (BitStream!9549 (buf!5767 array!11921) (currentByte!10774 (_ BitVec 32)) (currentBit!10769 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9548)

(declare-fun lt!368822 () (_ BitVec 64))

(declare-fun e!159627 () Bool)

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun b2!99 () BitStream!9548)

(assert (=> b!231986 (= e!159627 (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5226 (buf!5767 b1!101)))) lt!368823) #b0000000000000000000000000000000000000000000000000000000000001000)) (let ((bdg!14337 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10774 b2!99))))) (and (= lt!368822 (bvadd bdg!14337 ((_ sign_extend 32) (currentBit!10769 b2!99)))) (= (bvsub lt!368822 bits!86) lt!368823) (not (= ((_ sign_extend 32) (currentByte!10774 b2!99)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv bdg!14337 ((_ sign_extend 32) (currentByte!10774 b2!99)))))))))))

(assert (=> b!231986 (= lt!368823 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10774 b1!101))) ((_ sign_extend 32) (currentBit!10769 b1!101))))))

(declare-fun res!194244 () Bool)

(declare-fun e!159625 () Bool)

(assert (=> start!48952 (=> (not res!194244) (not e!159625))))

(assert (=> start!48952 (= res!194244 (and (= (size!5226 (buf!5767 b1!101)) (size!5226 (buf!5767 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48952 e!159625))

(declare-fun e!159626 () Bool)

(declare-fun inv!12 (BitStream!9548) Bool)

(assert (=> start!48952 (and (inv!12 b1!101) e!159626)))

(declare-fun e!159629 () Bool)

(assert (=> start!48952 (and (inv!12 b2!99) e!159629)))

(assert (=> start!48952 true))

(declare-fun b!231987 () Bool)

(declare-fun res!194243 () Bool)

(assert (=> b!231987 (=> (not res!194243) (not e!159627))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!231987 (= res!194243 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5226 (buf!5767 b1!101))) ((_ sign_extend 32) (currentByte!10774 b1!101)) ((_ sign_extend 32) (currentBit!10769 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!231988 () Bool)

(declare-fun array_inv!4967 (array!11921) Bool)

(assert (=> b!231988 (= e!159626 (array_inv!4967 (buf!5767 b1!101)))))

(declare-fun b!231989 () Bool)

(assert (=> b!231989 (= e!159629 (array_inv!4967 (buf!5767 b2!99)))))

(declare-fun b!231990 () Bool)

(assert (=> b!231990 (= e!159625 e!159627)))

(declare-fun res!194241 () Bool)

(assert (=> b!231990 (=> (not res!194241) (not e!159627))))

(assert (=> b!231990 (= res!194241 (and (bvsle bits!86 lt!368822) (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!231990 (= lt!368822 (bitIndex!0 (size!5226 (buf!5767 b2!99)) (currentByte!10774 b2!99) (currentBit!10769 b2!99)))))

(declare-fun b!231991 () Bool)

(declare-fun res!194240 () Bool)

(assert (=> b!231991 (=> (not res!194240) (not e!159627))))

(assert (=> b!231991 (= res!194240 (= lt!368822 (bvadd (bitIndex!0 (size!5226 (buf!5767 b1!101)) (currentByte!10774 b1!101) (currentBit!10769 b1!101)) bits!86)))))

(declare-fun b!231992 () Bool)

(declare-fun res!194242 () Bool)

(assert (=> b!231992 (=> (not res!194242) (not e!159627))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!231992 (= res!194242 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5226 (buf!5767 b1!101))) ((_ sign_extend 32) (currentByte!10774 b1!101)) ((_ sign_extend 32) (currentBit!10769 b1!101)) bytes!19))))

(assert (= (and start!48952 res!194244) b!231990))

(assert (= (and b!231990 res!194241) b!231992))

(assert (= (and b!231992 res!194242) b!231991))

(assert (= (and b!231991 res!194240) b!231987))

(assert (= (and b!231987 res!194243) b!231986))

(assert (= start!48952 b!231988))

(assert (= start!48952 b!231989))

(declare-fun m!354979 () Bool)

(assert (=> start!48952 m!354979))

(declare-fun m!354981 () Bool)

(assert (=> start!48952 m!354981))

(declare-fun m!354983 () Bool)

(assert (=> b!231987 m!354983))

(declare-fun m!354985 () Bool)

(assert (=> b!231990 m!354985))

(declare-fun m!354987 () Bool)

(assert (=> b!231992 m!354987))

(declare-fun m!354989 () Bool)

(assert (=> b!231991 m!354989))

(declare-fun m!354991 () Bool)

(assert (=> b!231989 m!354991))

(declare-fun m!354993 () Bool)

(assert (=> b!231988 m!354993))

(push 1)

(assert (not b!231990))

(assert (not b!231988))

(assert (not b!231991))

(assert (not b!231989))

(assert (not b!231992))

(assert (not start!48952))

(assert (not b!231987))

(check-sat)

(pop 1)

(push 1)

(check-sat)

