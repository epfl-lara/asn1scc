; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48610 () Bool)

(assert start!48610)

(declare-fun b!230304 () Bool)

(declare-fun e!158155 () Bool)

(assert (=> b!230304 (= e!158155 false)))

(declare-fun lt!367974 () (_ BitVec 64))

(declare-datatypes ((array!11735 0))(
  ( (array!11736 (arr!6131 (Array (_ BitVec 32) (_ BitVec 8))) (size!5144 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9384 0))(
  ( (BitStream!9385 (buf!5685 array!11735) (currentByte!10647 (_ BitVec 32)) (currentBit!10642 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9384)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!230304 (= lt!367974 (bitIndex!0 (size!5144 (buf!5685 b1!101)) (currentByte!10647 b1!101) (currentBit!10642 b1!101)))))

(declare-fun b!230305 () Bool)

(declare-fun e!158153 () Bool)

(declare-fun array_inv!4885 (array!11735) Bool)

(assert (=> b!230305 (= e!158153 (array_inv!4885 (buf!5685 b1!101)))))

(declare-fun b!230306 () Bool)

(declare-fun e!158152 () Bool)

(declare-fun b2!99 () BitStream!9384)

(assert (=> b!230306 (= e!158152 (array_inv!4885 (buf!5685 b2!99)))))

(declare-fun b!230307 () Bool)

(declare-fun res!193051 () Bool)

(assert (=> b!230307 (=> (not res!193051) (not e!158155))))

(declare-fun bits!86 () (_ BitVec 64))

(assert (=> b!230307 (= res!193051 (bvsle bits!86 (bitIndex!0 (size!5144 (buf!5685 b2!99)) (currentByte!10647 b2!99) (currentBit!10642 b2!99))))))

(declare-fun res!193053 () Bool)

(assert (=> start!48610 (=> (not res!193053) (not e!158155))))

(declare-fun bytes!19 () (_ BitVec 32))

(assert (=> start!48610 (= res!193053 (and (= (size!5144 (buf!5685 b1!101)) (size!5144 (buf!5685 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48610 e!158155))

(declare-fun inv!12 (BitStream!9384) Bool)

(assert (=> start!48610 (and (inv!12 b1!101) e!158153)))

(assert (=> start!48610 (and (inv!12 b2!99) e!158152)))

(assert (=> start!48610 true))

(declare-fun b!230308 () Bool)

(declare-fun res!193050 () Bool)

(assert (=> b!230308 (=> (not res!193050) (not e!158155))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!230308 (= res!193050 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5144 (buf!5685 b1!101))) ((_ sign_extend 32) (currentByte!10647 b1!101)) ((_ sign_extend 32) (currentBit!10642 b1!101)) bytes!19))))

(declare-fun b!230309 () Bool)

(declare-fun res!193052 () Bool)

(assert (=> b!230309 (=> (not res!193052) (not e!158155))))

(assert (=> b!230309 (= res!193052 (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19))))

(assert (= (and start!48610 res!193053) b!230307))

(assert (= (and b!230307 res!193051) b!230309))

(assert (= (and b!230309 res!193052) b!230308))

(assert (= (and b!230308 res!193050) b!230304))

(assert (= start!48610 b!230305))

(assert (= start!48610 b!230306))

(declare-fun m!353655 () Bool)

(assert (=> b!230304 m!353655))

(declare-fun m!353657 () Bool)

(assert (=> b!230306 m!353657))

(declare-fun m!353659 () Bool)

(assert (=> b!230305 m!353659))

(declare-fun m!353661 () Bool)

(assert (=> b!230307 m!353661))

(declare-fun m!353663 () Bool)

(assert (=> b!230308 m!353663))

(declare-fun m!353665 () Bool)

(assert (=> start!48610 m!353665))

(declare-fun m!353667 () Bool)

(assert (=> start!48610 m!353667))

(check-sat (not b!230305) (not b!230307) (not b!230306) (not b!230308) (not start!48610) (not b!230304))
