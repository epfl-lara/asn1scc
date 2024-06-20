; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48618 () Bool)

(assert start!48618)

(declare-fun b!230376 () Bool)

(declare-fun e!158221 () Bool)

(declare-datatypes ((array!11743 0))(
  ( (array!11744 (arr!6135 (Array (_ BitVec 32) (_ BitVec 8))) (size!5148 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9392 0))(
  ( (BitStream!9393 (buf!5689 array!11743) (currentByte!10651 (_ BitVec 32)) (currentBit!10646 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9392)

(declare-fun array_inv!4889 (array!11743) Bool)

(assert (=> b!230376 (= e!158221 (array_inv!4889 (buf!5689 b1!101)))))

(declare-fun b!230377 () Bool)

(declare-fun res!193099 () Bool)

(declare-fun e!158225 () Bool)

(assert (=> b!230377 (=> (not res!193099) (not e!158225))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun lt!367986 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!230377 (= res!193099 (= lt!367986 (bvadd (bitIndex!0 (size!5148 (buf!5689 b1!101)) (currentByte!10651 b1!101) (currentBit!10646 b1!101)) bits!86)))))

(declare-fun b!230378 () Bool)

(declare-fun e!158223 () Bool)

(declare-fun b2!99 () BitStream!9392)

(assert (=> b!230378 (= e!158223 (array_inv!4889 (buf!5689 b2!99)))))

(declare-fun res!193101 () Bool)

(declare-fun e!158220 () Bool)

(assert (=> start!48618 (=> (not res!193101) (not e!158220))))

(declare-fun bytes!19 () (_ BitVec 32))

(assert (=> start!48618 (= res!193101 (and (= (size!5148 (buf!5689 b1!101)) (size!5148 (buf!5689 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48618 e!158220))

(declare-fun inv!12 (BitStream!9392) Bool)

(assert (=> start!48618 (and (inv!12 b1!101) e!158221)))

(assert (=> start!48618 (and (inv!12 b2!99) e!158223)))

(assert (=> start!48618 true))

(declare-fun b!230379 () Bool)

(assert (=> b!230379 (= e!158220 e!158225)))

(declare-fun res!193098 () Bool)

(assert (=> b!230379 (=> (not res!193098) (not e!158225))))

(assert (=> b!230379 (= res!193098 (and (bvsle bits!86 lt!367986) (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19)))))

(assert (=> b!230379 (= lt!367986 (bitIndex!0 (size!5148 (buf!5689 b2!99)) (currentByte!10651 b2!99) (currentBit!10646 b2!99)))))

(declare-fun b!230380 () Bool)

(declare-fun res!193100 () Bool)

(assert (=> b!230380 (=> (not res!193100) (not e!158225))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!230380 (= res!193100 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5148 (buf!5689 b1!101))) ((_ sign_extend 32) (currentByte!10651 b1!101)) ((_ sign_extend 32) (currentBit!10646 b1!101)) bytes!19))))

(declare-fun b!230381 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!230381 (= e!158225 (bvsgt ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5148 (buf!5689 b1!101))) ((_ sign_extend 32) (currentByte!10651 b1!101)) ((_ sign_extend 32) (currentBit!10646 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (= (and start!48618 res!193101) b!230379))

(assert (= (and b!230379 res!193098) b!230380))

(assert (= (and b!230380 res!193100) b!230377))

(assert (= (and b!230377 res!193099) b!230381))

(assert (= start!48618 b!230376))

(assert (= start!48618 b!230378))

(declare-fun m!353715 () Bool)

(assert (=> b!230380 m!353715))

(declare-fun m!353717 () Bool)

(assert (=> b!230381 m!353717))

(declare-fun m!353719 () Bool)

(assert (=> b!230376 m!353719))

(declare-fun m!353721 () Bool)

(assert (=> b!230379 m!353721))

(declare-fun m!353723 () Bool)

(assert (=> start!48618 m!353723))

(declare-fun m!353725 () Bool)

(assert (=> start!48618 m!353725))

(declare-fun m!353727 () Bool)

(assert (=> b!230377 m!353727))

(declare-fun m!353729 () Bool)

(assert (=> b!230378 m!353729))

(push 1)

(assert (not start!48618))

(assert (not b!230380))

(assert (not b!230376))

(assert (not b!230381))

(assert (not b!230378))

(assert (not b!230377))

(assert (not b!230379))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

