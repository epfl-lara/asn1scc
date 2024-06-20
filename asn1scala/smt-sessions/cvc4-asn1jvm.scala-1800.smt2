; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48916 () Bool)

(assert start!48916)

(declare-fun e!159301 () Bool)

(declare-datatypes ((array!11885 0))(
  ( (array!11886 (arr!6195 (Array (_ BitVec 32) (_ BitVec 8))) (size!5208 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9512 0))(
  ( (BitStream!9513 (buf!5749 array!11885) (currentByte!10756 (_ BitVec 32)) (currentBit!10751 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9512)

(declare-fun b!231608 () Bool)

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun b2!99 () BitStream!9512)

(assert (=> b!231608 (= e!159301 (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5208 (buf!5749 b1!101)))) (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10756 b1!101))) ((_ sign_extend 32) (currentBit!10751 b1!101)))) #b0000000000000000000000000000000000000000000000000000000000001000)) (not (= ((_ sign_extend 32) (currentByte!10756 b2!99)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10756 b2!99))) ((_ sign_extend 32) (currentByte!10756 b2!99)))))))))

(declare-fun b!231609 () Bool)

(declare-fun e!159305 () Bool)

(declare-fun array_inv!4949 (array!11885) Bool)

(assert (=> b!231609 (= e!159305 (array_inv!4949 (buf!5749 b1!101)))))

(declare-fun b!231610 () Bool)

(declare-fun e!159304 () Bool)

(assert (=> b!231610 (= e!159304 e!159301)))

(declare-fun res!193974 () Bool)

(assert (=> b!231610 (=> (not res!193974) (not e!159301))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun lt!368724 () (_ BitVec 64))

(assert (=> b!231610 (= res!193974 (and (bvsle bits!86 lt!368724) (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!231610 (= lt!368724 (bitIndex!0 (size!5208 (buf!5749 b2!99)) (currentByte!10756 b2!99) (currentBit!10751 b2!99)))))

(declare-fun b!231611 () Bool)

(declare-fun res!193972 () Bool)

(assert (=> b!231611 (=> (not res!193972) (not e!159301))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!231611 (= res!193972 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5208 (buf!5749 b1!101))) ((_ sign_extend 32) (currentByte!10756 b1!101)) ((_ sign_extend 32) (currentBit!10751 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun res!193971 () Bool)

(assert (=> start!48916 (=> (not res!193971) (not e!159304))))

(assert (=> start!48916 (= res!193971 (and (= (size!5208 (buf!5749 b1!101)) (size!5208 (buf!5749 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48916 e!159304))

(declare-fun inv!12 (BitStream!9512) Bool)

(assert (=> start!48916 (and (inv!12 b1!101) e!159305)))

(declare-fun e!159303 () Bool)

(assert (=> start!48916 (and (inv!12 b2!99) e!159303)))

(assert (=> start!48916 true))

(declare-fun b!231612 () Bool)

(assert (=> b!231612 (= e!159303 (array_inv!4949 (buf!5749 b2!99)))))

(declare-fun b!231613 () Bool)

(declare-fun res!193973 () Bool)

(assert (=> b!231613 (=> (not res!193973) (not e!159301))))

(assert (=> b!231613 (= res!193973 (= lt!368724 (bvadd (bitIndex!0 (size!5208 (buf!5749 b1!101)) (currentByte!10756 b1!101) (currentBit!10751 b1!101)) bits!86)))))

(declare-fun b!231614 () Bool)

(declare-fun res!193970 () Bool)

(assert (=> b!231614 (=> (not res!193970) (not e!159301))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!231614 (= res!193970 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5208 (buf!5749 b1!101))) ((_ sign_extend 32) (currentByte!10756 b1!101)) ((_ sign_extend 32) (currentBit!10751 b1!101)) bytes!19))))

(assert (= (and start!48916 res!193971) b!231610))

(assert (= (and b!231610 res!193974) b!231614))

(assert (= (and b!231614 res!193970) b!231613))

(assert (= (and b!231613 res!193973) b!231611))

(assert (= (and b!231611 res!193972) b!231608))

(assert (= start!48916 b!231609))

(assert (= start!48916 b!231612))

(declare-fun m!354691 () Bool)

(assert (=> b!231609 m!354691))

(declare-fun m!354693 () Bool)

(assert (=> b!231614 m!354693))

(declare-fun m!354695 () Bool)

(assert (=> b!231613 m!354695))

(declare-fun m!354697 () Bool)

(assert (=> b!231610 m!354697))

(declare-fun m!354699 () Bool)

(assert (=> start!48916 m!354699))

(declare-fun m!354701 () Bool)

(assert (=> start!48916 m!354701))

(declare-fun m!354703 () Bool)

(assert (=> b!231611 m!354703))

(declare-fun m!354705 () Bool)

(assert (=> b!231612 m!354705))

(push 1)

(assert (not b!231611))

(assert (not b!231614))

(assert (not b!231609))

(assert (not start!48916))

(assert (not b!231612))

(assert (not b!231613))

(assert (not b!231610))

(check-sat)

(pop 1)

(push 1)

(check-sat)

