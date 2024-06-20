; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29620 () Bool)

(assert start!29620)

(declare-fun b!152706 () Bool)

(declare-fun e!102200 () Bool)

(assert (=> b!152706 (= e!102200 false)))

(declare-fun lt!239194 () (_ BitVec 64))

(declare-datatypes ((array!6839 0))(
  ( (array!6840 (arr!3911 (Array (_ BitVec 32) (_ BitVec 8))) (size!3088 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5434 0))(
  ( (BitStream!5435 (buf!3591 array!6839) (currentByte!6562 (_ BitVec 32)) (currentBit!6557 (_ BitVec 32))) )
))
(declare-fun bs2!18 () BitStream!5434)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!152706 (= lt!239194 (bitIndex!0 (size!3088 (buf!3591 bs2!18)) (currentByte!6562 bs2!18) (currentBit!6557 bs2!18)))))

(declare-fun res!127988 () Bool)

(assert (=> start!29620 (=> (not res!127988) (not e!102200))))

(declare-fun bs1!10 () BitStream!5434)

(assert (=> start!29620 (= res!127988 (= (size!3088 (buf!3591 bs1!10)) (size!3088 (buf!3591 bs2!18))))))

(assert (=> start!29620 e!102200))

(declare-fun e!102199 () Bool)

(declare-fun inv!12 (BitStream!5434) Bool)

(assert (=> start!29620 (and (inv!12 bs1!10) e!102199)))

(declare-fun e!102198 () Bool)

(assert (=> start!29620 (and (inv!12 bs2!18) e!102198)))

(declare-fun b!152707 () Bool)

(declare-fun array_inv!2877 (array!6839) Bool)

(assert (=> b!152707 (= e!102199 (array_inv!2877 (buf!3591 bs1!10)))))

(declare-fun b!152708 () Bool)

(assert (=> b!152708 (= e!102198 (array_inv!2877 (buf!3591 bs2!18)))))

(declare-fun b!152705 () Bool)

(declare-fun res!127989 () Bool)

(assert (=> b!152705 (=> (not res!127989) (not e!102200))))

(assert (=> b!152705 (= res!127989 (bvsle (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3088 (buf!3591 bs1!10)) (currentByte!6562 bs1!10) (currentBit!6557 bs1!10))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3088 (buf!3591 bs1!10))))))))

(assert (= (and start!29620 res!127988) b!152705))

(assert (= (and b!152705 res!127989) b!152706))

(assert (= start!29620 b!152707))

(assert (= start!29620 b!152708))

(declare-fun m!238549 () Bool)

(assert (=> b!152708 m!238549))

(declare-fun m!238551 () Bool)

(assert (=> b!152706 m!238551))

(declare-fun m!238553 () Bool)

(assert (=> start!29620 m!238553))

(declare-fun m!238555 () Bool)

(assert (=> start!29620 m!238555))

(declare-fun m!238557 () Bool)

(assert (=> b!152705 m!238557))

(declare-fun m!238559 () Bool)

(assert (=> b!152707 m!238559))

(push 1)

(assert (not b!152706))

(assert (not b!152708))

(assert (not b!152705))

(assert (not b!152707))

(assert (not start!29620))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

