; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48996 () Bool)

(assert start!48996)

(declare-fun b!232430 () Bool)

(declare-fun e!160006 () Bool)

(declare-datatypes ((array!11965 0))(
  ( (array!11966 (arr!6235 (Array (_ BitVec 32) (_ BitVec 8))) (size!5248 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9592 0))(
  ( (BitStream!9593 (buf!5789 array!11965) (currentByte!10796 (_ BitVec 32)) (currentBit!10791 (_ BitVec 32))) )
))
(declare-fun b2!99 () BitStream!9592)

(declare-fun array_inv!4989 (array!11965) Bool)

(assert (=> b!232430 (= e!160006 (array_inv!4989 (buf!5789 b2!99)))))

(declare-fun b!232431 () Bool)

(declare-fun e!160004 () Bool)

(declare-fun b1!101 () BitStream!9592)

(assert (=> b!232431 (= e!160004 (array_inv!4989 (buf!5789 b1!101)))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun lt!368936 () (_ BitVec 64))

(declare-fun e!160002 () Bool)

(declare-fun b!232432 () Bool)

(declare-fun lt!368937 () (_ BitVec 64))

(declare-fun bytes!19 () (_ BitVec 32))

(assert (=> b!232432 (= e!160002 (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5248 (buf!5789 b1!101)))) lt!368937) #b0000000000000000000000000000000000000000000000000000000000001000)) (let ((bdg!14365 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10796 b2!99))))) (let ((bdg!14366 (bvadd bdg!14365 ((_ sign_extend 32) (currentBit!10791 b2!99))))) (and (= lt!368936 bdg!14366) (= (bvsub lt!368936 bits!86) lt!368937) (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5248 (buf!5789 b2!99)))) (bvsub bdg!14366 bits!86)) #b0000000000000000000000000000000000000000000000000000000000001000)) (let ((bdg!14367 (bvand bdg!14365 #b1000000000000000000000000000000000000000000000000000000000000000))) (and (= bdg!14367 (bvand ((_ sign_extend 32) (currentBit!10791 b2!99)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= bdg!14367 (bvand bdg!14366 #b1000000000000000000000000000000000000000000000000000000000000000))))))))))))

(assert (=> b!232432 (= lt!368937 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10796 b1!101))) ((_ sign_extend 32) (currentBit!10791 b1!101))))))

(declare-fun b!232433 () Bool)

(declare-fun res!194552 () Bool)

(assert (=> b!232433 (=> (not res!194552) (not e!160002))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!232433 (= res!194552 (= lt!368936 (bvadd (bitIndex!0 (size!5248 (buf!5789 b1!101)) (currentByte!10796 b1!101) (currentBit!10791 b1!101)) bits!86)))))

(declare-fun b!232434 () Bool)

(declare-fun res!194554 () Bool)

(assert (=> b!232434 (=> (not res!194554) (not e!160002))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!232434 (= res!194554 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5248 (buf!5789 b1!101))) ((_ sign_extend 32) (currentByte!10796 b1!101)) ((_ sign_extend 32) (currentBit!10791 b1!101)) bytes!19))))

(declare-fun b!232435 () Bool)

(declare-fun res!194555 () Bool)

(assert (=> b!232435 (=> (not res!194555) (not e!160002))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!232435 (= res!194555 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5248 (buf!5789 b1!101))) ((_ sign_extend 32) (currentByte!10796 b1!101)) ((_ sign_extend 32) (currentBit!10791 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!232436 () Bool)

(declare-fun e!160007 () Bool)

(assert (=> b!232436 (= e!160007 e!160002)))

(declare-fun res!194556 () Bool)

(assert (=> b!232436 (=> (not res!194556) (not e!160002))))

(assert (=> b!232436 (= res!194556 (and (bvsle bits!86 lt!368936) (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19)))))

(assert (=> b!232436 (= lt!368936 (bitIndex!0 (size!5248 (buf!5789 b2!99)) (currentByte!10796 b2!99) (currentBit!10791 b2!99)))))

(declare-fun res!194553 () Bool)

(assert (=> start!48996 (=> (not res!194553) (not e!160007))))

(assert (=> start!48996 (= res!194553 (and (= (size!5248 (buf!5789 b1!101)) (size!5248 (buf!5789 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48996 e!160007))

(declare-fun inv!12 (BitStream!9592) Bool)

(assert (=> start!48996 (and (inv!12 b1!101) e!160004)))

(assert (=> start!48996 (and (inv!12 b2!99) e!160006)))

(assert (=> start!48996 true))

(assert (= (and start!48996 res!194553) b!232436))

(assert (= (and b!232436 res!194556) b!232434))

(assert (= (and b!232434 res!194554) b!232433))

(assert (= (and b!232433 res!194552) b!232435))

(assert (= (and b!232435 res!194555) b!232432))

(assert (= start!48996 b!232431))

(assert (= start!48996 b!232430))

(declare-fun m!355319 () Bool)

(assert (=> b!232435 m!355319))

(declare-fun m!355321 () Bool)

(assert (=> start!48996 m!355321))

(declare-fun m!355323 () Bool)

(assert (=> start!48996 m!355323))

(declare-fun m!355325 () Bool)

(assert (=> b!232433 m!355325))

(declare-fun m!355327 () Bool)

(assert (=> b!232436 m!355327))

(declare-fun m!355329 () Bool)

(assert (=> b!232431 m!355329))

(declare-fun m!355331 () Bool)

(assert (=> b!232434 m!355331))

(declare-fun m!355333 () Bool)

(assert (=> b!232430 m!355333))

(push 1)

(assert (not b!232433))

(assert (not b!232436))

(assert (not b!232435))

(assert (not start!48996))

(assert (not b!232434))

(assert (not b!232431))

(assert (not b!232430))

(check-sat)

(pop 1)

(push 1)

(check-sat)

