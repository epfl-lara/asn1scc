; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48612 () Bool)

(assert start!48612)

(declare-fun b!230322 () Bool)

(declare-fun res!193062 () Bool)

(declare-fun e!158171 () Bool)

(assert (=> b!230322 (=> (not res!193062) (not e!158171))))

(declare-datatypes ((array!11737 0))(
  ( (array!11738 (arr!6132 (Array (_ BitVec 32) (_ BitVec 8))) (size!5145 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9386 0))(
  ( (BitStream!9387 (buf!5686 array!11737) (currentByte!10648 (_ BitVec 32)) (currentBit!10643 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9386)

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!230322 (= res!193062 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5145 (buf!5686 b1!101))) ((_ sign_extend 32) (currentByte!10648 b1!101)) ((_ sign_extend 32) (currentBit!10643 b1!101)) bytes!19))))

(declare-fun b!230323 () Bool)

(declare-fun e!158169 () Bool)

(declare-fun array_inv!4886 (array!11737) Bool)

(assert (=> b!230323 (= e!158169 (array_inv!4886 (buf!5686 b1!101)))))

(declare-fun b!230324 () Bool)

(declare-fun res!193063 () Bool)

(assert (=> b!230324 (=> (not res!193063) (not e!158171))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun b2!99 () BitStream!9386)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!230324 (= res!193063 (bvsle bits!86 (bitIndex!0 (size!5145 (buf!5686 b2!99)) (currentByte!10648 b2!99) (currentBit!10643 b2!99))))))

(declare-fun b!230325 () Bool)

(declare-fun res!193065 () Bool)

(assert (=> b!230325 (=> (not res!193065) (not e!158171))))

(assert (=> b!230325 (= res!193065 (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19))))

(declare-fun res!193064 () Bool)

(assert (=> start!48612 (=> (not res!193064) (not e!158171))))

(assert (=> start!48612 (= res!193064 (and (= (size!5145 (buf!5686 b1!101)) (size!5145 (buf!5686 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48612 e!158171))

(declare-fun inv!12 (BitStream!9386) Bool)

(assert (=> start!48612 (and (inv!12 b1!101) e!158169)))

(declare-fun e!158168 () Bool)

(assert (=> start!48612 (and (inv!12 b2!99) e!158168)))

(assert (=> start!48612 true))

(declare-fun b!230326 () Bool)

(assert (=> b!230326 (= e!158171 false)))

(declare-fun lt!367977 () (_ BitVec 64))

(assert (=> b!230326 (= lt!367977 (bitIndex!0 (size!5145 (buf!5686 b1!101)) (currentByte!10648 b1!101) (currentBit!10643 b1!101)))))

(declare-fun b!230327 () Bool)

(assert (=> b!230327 (= e!158168 (array_inv!4886 (buf!5686 b2!99)))))

(assert (= (and start!48612 res!193064) b!230324))

(assert (= (and b!230324 res!193063) b!230325))

(assert (= (and b!230325 res!193065) b!230322))

(assert (= (and b!230322 res!193062) b!230326))

(assert (= start!48612 b!230323))

(assert (= start!48612 b!230327))

(declare-fun m!353669 () Bool)

(assert (=> b!230323 m!353669))

(declare-fun m!353671 () Bool)

(assert (=> b!230327 m!353671))

(declare-fun m!353673 () Bool)

(assert (=> start!48612 m!353673))

(declare-fun m!353675 () Bool)

(assert (=> start!48612 m!353675))

(declare-fun m!353677 () Bool)

(assert (=> b!230322 m!353677))

(declare-fun m!353679 () Bool)

(assert (=> b!230324 m!353679))

(declare-fun m!353681 () Bool)

(assert (=> b!230326 m!353681))

(push 1)

(assert (not start!48612))

(assert (not b!230323))

