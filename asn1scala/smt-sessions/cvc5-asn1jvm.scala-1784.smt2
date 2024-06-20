; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48738 () Bool)

(assert start!48738)

(declare-fun b!230669 () Bool)

(declare-fun e!158445 () Bool)

(declare-datatypes ((array!11773 0))(
  ( (array!11774 (arr!6145 (Array (_ BitVec 32) (_ BitVec 8))) (size!5158 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9412 0))(
  ( (BitStream!9413 (buf!5699 array!11773) (currentByte!10691 (_ BitVec 32)) (currentBit!10686 (_ BitVec 32))) )
))
(declare-fun b2!99 () BitStream!9412)

(declare-fun array_inv!4899 (array!11773) Bool)

(assert (=> b!230669 (= e!158445 (array_inv!4899 (buf!5699 b2!99)))))

(declare-fun b!230670 () Bool)

(declare-fun e!158447 () Bool)

(declare-fun e!158442 () Bool)

(assert (=> b!230670 (= e!158447 e!158442)))

(declare-fun res!193335 () Bool)

(assert (=> b!230670 (=> (not res!193335) (not e!158442))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun lt!368280 () (_ BitVec 64))

(declare-fun bytes!19 () (_ BitVec 32))

(assert (=> b!230670 (= res!193335 (and (bvsle bits!86 lt!368280) (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!230670 (= lt!368280 (bitIndex!0 (size!5158 (buf!5699 b2!99)) (currentByte!10691 b2!99) (currentBit!10686 b2!99)))))

(declare-fun b!230671 () Bool)

(declare-fun e!158444 () Bool)

(declare-fun b1!101 () BitStream!9412)

(assert (=> b!230671 (= e!158444 (array_inv!4899 (buf!5699 b1!101)))))

(declare-fun b!230672 () Bool)

(declare-fun res!193334 () Bool)

(assert (=> b!230672 (=> (not res!193334) (not e!158442))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!230672 (= res!193334 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5158 (buf!5699 b1!101))) ((_ sign_extend 32) (currentByte!10691 b1!101)) ((_ sign_extend 32) (currentBit!10686 b1!101)) bytes!19))))

(declare-fun b!230673 () Bool)

(declare-fun res!193331 () Bool)

(assert (=> b!230673 (=> (not res!193331) (not e!158442))))

(assert (=> b!230673 (= res!193331 (= lt!368280 (bvadd (bitIndex!0 (size!5158 (buf!5699 b1!101)) (currentByte!10691 b1!101) (currentBit!10686 b1!101)) bits!86)))))

(declare-fun res!193333 () Bool)

(assert (=> start!48738 (=> (not res!193333) (not e!158447))))

(assert (=> start!48738 (= res!193333 (and (= (size!5158 (buf!5699 b1!101)) (size!5158 (buf!5699 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48738 e!158447))

(declare-fun inv!12 (BitStream!9412) Bool)

(assert (=> start!48738 (and (inv!12 b1!101) e!158444)))

(assert (=> start!48738 (and (inv!12 b2!99) e!158445)))

(assert (=> start!48738 true))

(declare-fun lt!368279 () (_ BitVec 64))

(declare-fun b!230674 () Bool)

(assert (=> b!230674 (= e!158442 (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5158 (buf!5699 b1!101)))) lt!368279) #b0000000000000000000000000000000000000000000000000000000000001000)) (let ((bdg!14297 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10691 b2!99))) ((_ sign_extend 32) (currentBit!10686 b2!99))))) (and (= lt!368280 bdg!14297) (= (bvsub lt!368280 bits!86) lt!368279) (bvsgt ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5158 (buf!5699 b2!99)))) (bvsub bdg!14297 bits!86)) #b0000000000000000000000000000000000000000000000000000000000001000))))))))

(assert (=> b!230674 (= lt!368279 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10691 b1!101))) ((_ sign_extend 32) (currentBit!10686 b1!101))))))

(declare-fun b!230675 () Bool)

(declare-fun res!193332 () Bool)

(assert (=> b!230675 (=> (not res!193332) (not e!158442))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!230675 (= res!193332 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5158 (buf!5699 b1!101))) ((_ sign_extend 32) (currentByte!10691 b1!101)) ((_ sign_extend 32) (currentBit!10686 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (= (and start!48738 res!193333) b!230670))

(assert (= (and b!230670 res!193335) b!230672))

(assert (= (and b!230672 res!193334) b!230673))

(assert (= (and b!230673 res!193331) b!230675))

(assert (= (and b!230675 res!193332) b!230674))

(assert (= start!48738 b!230671))

(assert (= start!48738 b!230669))

(declare-fun m!353933 () Bool)

(assert (=> b!230675 m!353933))

(declare-fun m!353935 () Bool)

(assert (=> start!48738 m!353935))

(declare-fun m!353937 () Bool)

(assert (=> start!48738 m!353937))

(declare-fun m!353939 () Bool)

(assert (=> b!230669 m!353939))

(declare-fun m!353941 () Bool)

(assert (=> b!230671 m!353941))

(declare-fun m!353943 () Bool)

(assert (=> b!230670 m!353943))

(declare-fun m!353945 () Bool)

(assert (=> b!230672 m!353945))

(declare-fun m!353947 () Bool)

(assert (=> b!230673 m!353947))

(push 1)

(assert (not b!230673))

(assert (not b!230675))

(assert (not b!230670))

(assert (not b!230671))

(assert (not start!48738))

(assert (not b!230669))

(assert (not b!230672))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

