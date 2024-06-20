; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48540 () Bool)

(assert start!48540)

(declare-fun b!229885 () Bool)

(declare-fun e!157824 () Bool)

(assert (=> b!229885 (= e!157824 false)))

(declare-fun lt!367707 () (_ BitVec 64))

(declare-datatypes ((array!11707 0))(
  ( (array!11708 (arr!6119 (Array (_ BitVec 32) (_ BitVec 8))) (size!5132 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9360 0))(
  ( (BitStream!9361 (buf!5673 array!11707) (currentByte!10620 (_ BitVec 32)) (currentBit!10615 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9360)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!229885 (= lt!367707 (bitIndex!0 (size!5132 (buf!5673 b1!101)) (currentByte!10620 b1!101) (currentBit!10615 b1!101)))))

(declare-fun res!192706 () Bool)

(assert (=> start!48540 (=> (not res!192706) (not e!157824))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun b2!99 () BitStream!9360)

(assert (=> start!48540 (= res!192706 (and (= (size!5132 (buf!5673 b1!101)) (size!5132 (buf!5673 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48540 e!157824))

(declare-fun e!157825 () Bool)

(declare-fun inv!12 (BitStream!9360) Bool)

(assert (=> start!48540 (and (inv!12 b1!101) e!157825)))

(declare-fun e!157822 () Bool)

(assert (=> start!48540 (and (inv!12 b2!99) e!157822)))

(assert (=> start!48540 true))

(declare-fun b!229886 () Bool)

(declare-fun res!192703 () Bool)

(assert (=> b!229886 (=> (not res!192703) (not e!157824))))

(assert (=> b!229886 (= res!192703 (bvsle bits!86 (bitIndex!0 (size!5132 (buf!5673 b2!99)) (currentByte!10620 b2!99) (currentBit!10615 b2!99))))))

(declare-fun b!229887 () Bool)

(declare-fun res!192705 () Bool)

(assert (=> b!229887 (=> (not res!192705) (not e!157824))))

(assert (=> b!229887 (= res!192705 (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19))))

(declare-fun b!229888 () Bool)

(declare-fun array_inv!4873 (array!11707) Bool)

(assert (=> b!229888 (= e!157825 (array_inv!4873 (buf!5673 b1!101)))))

(declare-fun b!229889 () Bool)

(assert (=> b!229889 (= e!157822 (array_inv!4873 (buf!5673 b2!99)))))

(declare-fun b!229890 () Bool)

(declare-fun res!192704 () Bool)

(assert (=> b!229890 (=> (not res!192704) (not e!157824))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!229890 (= res!192704 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5132 (buf!5673 b1!101))) ((_ sign_extend 32) (currentByte!10620 b1!101)) ((_ sign_extend 32) (currentBit!10615 b1!101)) bytes!19))))

(assert (= (and start!48540 res!192706) b!229886))

(assert (= (and b!229886 res!192703) b!229887))

(assert (= (and b!229887 res!192705) b!229890))

(assert (= (and b!229890 res!192704) b!229885))

(assert (= start!48540 b!229888))

(assert (= start!48540 b!229889))

(declare-fun m!353421 () Bool)

(assert (=> b!229890 m!353421))

(declare-fun m!353423 () Bool)

(assert (=> b!229889 m!353423))

(declare-fun m!353425 () Bool)

(assert (=> b!229886 m!353425))

(declare-fun m!353427 () Bool)

(assert (=> b!229885 m!353427))

(declare-fun m!353429 () Bool)

(assert (=> start!48540 m!353429))

(declare-fun m!353431 () Bool)

(assert (=> start!48540 m!353431))

(declare-fun m!353433 () Bool)

(assert (=> b!229888 m!353433))

(check-sat (not b!229886) (not b!229889) (not b!229885) (not b!229888) (not b!229890) (not start!48540))
