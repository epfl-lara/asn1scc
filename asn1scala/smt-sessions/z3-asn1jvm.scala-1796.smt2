; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48890 () Bool)

(assert start!48890)

(declare-fun b!231353 () Bool)

(declare-fun res!193797 () Bool)

(declare-fun e!159085 () Bool)

(assert (=> b!231353 (=> (not res!193797) (not e!159085))))

(declare-fun bytes!19 () (_ BitVec 32))

(declare-datatypes ((array!11859 0))(
  ( (array!11860 (arr!6182 (Array (_ BitVec 32) (_ BitVec 8))) (size!5195 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9486 0))(
  ( (BitStream!9487 (buf!5736 array!11859) (currentByte!10743 (_ BitVec 32)) (currentBit!10738 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9486)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!231353 (= res!193797 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5195 (buf!5736 b1!101))) ((_ sign_extend 32) (currentByte!10743 b1!101)) ((_ sign_extend 32) (currentBit!10738 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!231354 () Bool)

(declare-fun res!193794 () Bool)

(assert (=> b!231354 (=> (not res!193794) (not e!159085))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun lt!368651 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!231354 (= res!193794 (= lt!368651 (bvadd (bitIndex!0 (size!5195 (buf!5736 b1!101)) (currentByte!10743 b1!101) (currentBit!10738 b1!101)) bits!86)))))

(declare-fun lt!368650 () (_ BitVec 64))

(declare-fun lt!368652 () (_ BitVec 64))

(declare-fun b!231356 () Bool)

(assert (=> b!231356 (= e!159085 (and (= lt!368650 (bvand ((_ sign_extend 32) (currentBit!10738 b1!101)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!368650 (bvand (bvadd lt!368652 ((_ sign_extend 32) (currentBit!10738 b1!101))) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!231356 (= lt!368650 (bvand lt!368652 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!231356 (= lt!368652 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10743 b1!101))))))

(declare-fun b!231357 () Bool)

(declare-fun res!193795 () Bool)

(assert (=> b!231357 (=> (not res!193795) (not e!159085))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!231357 (= res!193795 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5195 (buf!5736 b1!101))) ((_ sign_extend 32) (currentByte!10743 b1!101)) ((_ sign_extend 32) (currentBit!10738 b1!101)) bytes!19))))

(declare-fun b!231358 () Bool)

(declare-fun e!159087 () Bool)

(assert (=> b!231358 (= e!159087 e!159085)))

(declare-fun res!193793 () Bool)

(assert (=> b!231358 (=> (not res!193793) (not e!159085))))

(assert (=> b!231358 (= res!193793 (and (bvsle bits!86 lt!368651) (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19)))))

(declare-fun b2!99 () BitStream!9486)

(assert (=> b!231358 (= lt!368651 (bitIndex!0 (size!5195 (buf!5736 b2!99)) (currentByte!10743 b2!99) (currentBit!10738 b2!99)))))

(declare-fun b!231359 () Bool)

(declare-fun e!159086 () Bool)

(declare-fun array_inv!4936 (array!11859) Bool)

(assert (=> b!231359 (= e!159086 (array_inv!4936 (buf!5736 b1!101)))))

(declare-fun b!231355 () Bool)

(declare-fun e!159084 () Bool)

(assert (=> b!231355 (= e!159084 (array_inv!4936 (buf!5736 b2!99)))))

(declare-fun res!193796 () Bool)

(assert (=> start!48890 (=> (not res!193796) (not e!159087))))

(assert (=> start!48890 (= res!193796 (and (= (size!5195 (buf!5736 b1!101)) (size!5195 (buf!5736 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48890 e!159087))

(declare-fun inv!12 (BitStream!9486) Bool)

(assert (=> start!48890 (and (inv!12 b1!101) e!159086)))

(assert (=> start!48890 (and (inv!12 b2!99) e!159084)))

(assert (=> start!48890 true))

(assert (= (and start!48890 res!193796) b!231358))

(assert (= (and b!231358 res!193793) b!231357))

(assert (= (and b!231357 res!193795) b!231354))

(assert (= (and b!231354 res!193794) b!231353))

(assert (= (and b!231353 res!193797) b!231356))

(assert (= start!48890 b!231359))

(assert (= start!48890 b!231355))

(declare-fun m!354495 () Bool)

(assert (=> b!231353 m!354495))

(declare-fun m!354497 () Bool)

(assert (=> b!231357 m!354497))

(declare-fun m!354499 () Bool)

(assert (=> b!231355 m!354499))

(declare-fun m!354501 () Bool)

(assert (=> start!48890 m!354501))

(declare-fun m!354503 () Bool)

(assert (=> start!48890 m!354503))

(declare-fun m!354505 () Bool)

(assert (=> b!231359 m!354505))

(declare-fun m!354507 () Bool)

(assert (=> b!231354 m!354507))

(declare-fun m!354509 () Bool)

(assert (=> b!231358 m!354509))

(check-sat (not b!231359) (not b!231355) (not b!231353) (not b!231358) (not b!231354) (not b!231357) (not start!48890))
(check-sat)
