; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48948 () Bool)

(assert start!48948)

(declare-fun b!231944 () Bool)

(declare-fun e!159590 () Bool)

(declare-fun e!159593 () Bool)

(assert (=> b!231944 (= e!159590 e!159593)))

(declare-fun res!194212 () Bool)

(assert (=> b!231944 (=> (not res!194212) (not e!159593))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun lt!368810 () (_ BitVec 64))

(declare-fun bytes!19 () (_ BitVec 32))

(assert (=> b!231944 (= res!194212 (and (bvsle bits!86 lt!368810) (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19)))))

(declare-datatypes ((array!11917 0))(
  ( (array!11918 (arr!6211 (Array (_ BitVec 32) (_ BitVec 8))) (size!5224 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9544 0))(
  ( (BitStream!9545 (buf!5765 array!11917) (currentByte!10772 (_ BitVec 32)) (currentBit!10767 (_ BitVec 32))) )
))
(declare-fun b2!99 () BitStream!9544)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!231944 (= lt!368810 (bitIndex!0 (size!5224 (buf!5765 b2!99)) (currentByte!10772 b2!99) (currentBit!10767 b2!99)))))

(declare-fun b!231945 () Bool)

(declare-fun res!194211 () Bool)

(assert (=> b!231945 (=> (not res!194211) (not e!159593))))

(declare-fun b1!101 () BitStream!9544)

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!231945 (= res!194211 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5224 (buf!5765 b1!101))) ((_ sign_extend 32) (currentByte!10772 b1!101)) ((_ sign_extend 32) (currentBit!10767 b1!101)) bytes!19))))

(declare-fun b!231946 () Bool)

(declare-fun res!194214 () Bool)

(assert (=> b!231946 (=> (not res!194214) (not e!159593))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!231946 (= res!194214 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5224 (buf!5765 b1!101))) ((_ sign_extend 32) (currentByte!10772 b1!101)) ((_ sign_extend 32) (currentBit!10767 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!368811 () (_ BitVec 64))

(declare-fun b!231947 () Bool)

(assert (=> b!231947 (= e!159593 (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5224 (buf!5765 b1!101)))) lt!368811) #b0000000000000000000000000000000000000000000000000000000000001000)) (let ((bdg!14337 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10772 b2!99))))) (and (= lt!368810 (bvadd bdg!14337 ((_ sign_extend 32) (currentBit!10767 b2!99)))) (= (bvsub lt!368810 bits!86) lt!368811) (not (= ((_ sign_extend 32) (currentByte!10772 b2!99)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv bdg!14337 ((_ sign_extend 32) (currentByte!10772 b2!99)))))))))))

(assert (=> b!231947 (= lt!368811 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10772 b1!101))) ((_ sign_extend 32) (currentBit!10767 b1!101))))))

(declare-fun b!231948 () Bool)

(declare-fun e!159592 () Bool)

(declare-fun array_inv!4965 (array!11917) Bool)

(assert (=> b!231948 (= e!159592 (array_inv!4965 (buf!5765 b2!99)))))

(declare-fun b!231949 () Bool)

(declare-fun e!159588 () Bool)

(assert (=> b!231949 (= e!159588 (array_inv!4965 (buf!5765 b1!101)))))

(declare-fun res!194213 () Bool)

(assert (=> start!48948 (=> (not res!194213) (not e!159590))))

(assert (=> start!48948 (= res!194213 (and (= (size!5224 (buf!5765 b1!101)) (size!5224 (buf!5765 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48948 e!159590))

(declare-fun inv!12 (BitStream!9544) Bool)

(assert (=> start!48948 (and (inv!12 b1!101) e!159588)))

(assert (=> start!48948 (and (inv!12 b2!99) e!159592)))

(assert (=> start!48948 true))

(declare-fun b!231950 () Bool)

(declare-fun res!194210 () Bool)

(assert (=> b!231950 (=> (not res!194210) (not e!159593))))

(assert (=> b!231950 (= res!194210 (= lt!368810 (bvadd (bitIndex!0 (size!5224 (buf!5765 b1!101)) (currentByte!10772 b1!101) (currentBit!10767 b1!101)) bits!86)))))

(assert (= (and start!48948 res!194213) b!231944))

(assert (= (and b!231944 res!194212) b!231945))

(assert (= (and b!231945 res!194211) b!231950))

(assert (= (and b!231950 res!194210) b!231946))

(assert (= (and b!231946 res!194214) b!231947))

(assert (= start!48948 b!231949))

(assert (= start!48948 b!231948))

(declare-fun m!354947 () Bool)

(assert (=> b!231946 m!354947))

(declare-fun m!354949 () Bool)

(assert (=> start!48948 m!354949))

(declare-fun m!354951 () Bool)

(assert (=> start!48948 m!354951))

(declare-fun m!354953 () Bool)

(assert (=> b!231950 m!354953))

(declare-fun m!354955 () Bool)

(assert (=> b!231948 m!354955))

(declare-fun m!354957 () Bool)

(assert (=> b!231944 m!354957))

(declare-fun m!354959 () Bool)

(assert (=> b!231949 m!354959))

(declare-fun m!354961 () Bool)

(assert (=> b!231945 m!354961))

(push 1)

(assert (not b!231945))

(assert (not start!48948))

(assert (not b!231950))

(assert (not b!231946))

(assert (not b!231948))

(assert (not b!231944))

(assert (not b!231949))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

