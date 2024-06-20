; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48876 () Bool)

(assert start!48876)

(declare-fun b!231206 () Bool)

(declare-fun e!158961 () Bool)

(declare-fun e!158963 () Bool)

(assert (=> b!231206 (= e!158961 e!158963)))

(declare-fun res!193692 () Bool)

(assert (=> b!231206 (=> (not res!193692) (not e!158963))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun lt!368619 () (_ BitVec 64))

(declare-fun bytes!19 () (_ BitVec 32))

(assert (=> b!231206 (= res!193692 (and (bvsle bits!86 lt!368619) (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19)))))

(declare-datatypes ((array!11845 0))(
  ( (array!11846 (arr!6175 (Array (_ BitVec 32) (_ BitVec 8))) (size!5188 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9472 0))(
  ( (BitStream!9473 (buf!5729 array!11845) (currentByte!10736 (_ BitVec 32)) (currentBit!10731 (_ BitVec 32))) )
))
(declare-fun b2!99 () BitStream!9472)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!231206 (= lt!368619 (bitIndex!0 (size!5188 (buf!5729 b2!99)) (currentByte!10736 b2!99) (currentBit!10731 b2!99)))))

(declare-fun b!231207 () Bool)

(declare-fun res!193691 () Bool)

(assert (=> b!231207 (=> (not res!193691) (not e!158963))))

(declare-fun b1!101 () BitStream!9472)

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!231207 (= res!193691 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5188 (buf!5729 b1!101))) ((_ sign_extend 32) (currentByte!10736 b1!101)) ((_ sign_extend 32) (currentBit!10731 b1!101)) bytes!19))))

(declare-fun b!231208 () Bool)

(declare-fun res!193688 () Bool)

(assert (=> b!231208 (=> (not res!193688) (not e!158963))))

(assert (=> b!231208 (= res!193688 (= lt!368619 (bvadd (bitIndex!0 (size!5188 (buf!5729 b1!101)) (currentByte!10736 b1!101) (currentBit!10731 b1!101)) bits!86)))))

(declare-fun b!231209 () Bool)

(declare-fun e!158960 () Bool)

(declare-fun array_inv!4929 (array!11845) Bool)

(assert (=> b!231209 (= e!158960 (array_inv!4929 (buf!5729 b2!99)))))

(declare-fun b!231210 () Bool)

(declare-fun e!158958 () Bool)

(assert (=> b!231210 (= e!158958 (array_inv!4929 (buf!5729 b1!101)))))

(declare-fun res!193690 () Bool)

(assert (=> start!48876 (=> (not res!193690) (not e!158961))))

(assert (=> start!48876 (= res!193690 (and (= (size!5188 (buf!5729 b1!101)) (size!5188 (buf!5729 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48876 e!158961))

(declare-fun inv!12 (BitStream!9472) Bool)

(assert (=> start!48876 (and (inv!12 b1!101) e!158958)))

(assert (=> start!48876 (and (inv!12 b2!99) e!158960)))

(assert (=> start!48876 true))

(declare-fun b!231211 () Bool)

(assert (=> b!231211 (= e!158963 (and (not (= ((_ sign_extend 32) (size!5188 (buf!5729 b1!101))) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5188 (buf!5729 b1!101)))) ((_ sign_extend 32) (size!5188 (buf!5729 b1!101))))))))))

(declare-fun b!231212 () Bool)

(declare-fun res!193689 () Bool)

(assert (=> b!231212 (=> (not res!193689) (not e!158963))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!231212 (= res!193689 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5188 (buf!5729 b1!101))) ((_ sign_extend 32) (currentByte!10736 b1!101)) ((_ sign_extend 32) (currentBit!10731 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (= (and start!48876 res!193690) b!231206))

(assert (= (and b!231206 res!193692) b!231207))

(assert (= (and b!231207 res!193691) b!231208))

(assert (= (and b!231208 res!193688) b!231212))

(assert (= (and b!231212 res!193689) b!231211))

(assert (= start!48876 b!231210))

(assert (= start!48876 b!231209))

(declare-fun m!354383 () Bool)

(assert (=> b!231206 m!354383))

(declare-fun m!354385 () Bool)

(assert (=> b!231208 m!354385))

(declare-fun m!354387 () Bool)

(assert (=> b!231210 m!354387))

(declare-fun m!354389 () Bool)

(assert (=> b!231209 m!354389))

(declare-fun m!354391 () Bool)

(assert (=> b!231212 m!354391))

(declare-fun m!354393 () Bool)

(assert (=> start!48876 m!354393))

(declare-fun m!354395 () Bool)

(assert (=> start!48876 m!354395))

(declare-fun m!354397 () Bool)

(assert (=> b!231207 m!354397))

(push 1)

(assert (not b!231212))

(assert (not b!231206))

(assert (not b!231209))

(assert (not b!231210))

(assert (not b!231207))

(assert (not start!48876))

(assert (not b!231208))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

