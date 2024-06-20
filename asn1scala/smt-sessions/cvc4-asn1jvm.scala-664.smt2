; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18670 () Bool)

(assert start!18670)

(declare-fun b!92737 () Bool)

(declare-fun e!60933 () Bool)

(declare-datatypes ((array!4342 0))(
  ( (array!4343 (arr!2588 (Array (_ BitVec 32) (_ BitVec 8))) (size!1965 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3464 0))(
  ( (BitStream!3465 (buf!2341 array!4342) (currentByte!4666 (_ BitVec 32)) (currentBit!4661 (_ BitVec 32))) )
))
(declare-fun bitStream1!8 () BitStream!3464)

(declare-fun array_inv!1797 (array!4342) Bool)

(assert (=> b!92737 (= e!60933 (array_inv!1797 (buf!2341 bitStream1!8)))))

(declare-fun b!92738 () Bool)

(declare-fun res!76548 () Bool)

(declare-fun e!60936 () Bool)

(assert (=> b!92738 (=> (not res!76548) (not e!60936))))

(declare-fun bitStream2!8 () BitStream!3464)

(declare-fun isPrefixOf!0 (BitStream!3464 BitStream!3464) Bool)

(assert (=> b!92738 (= res!76548 (isPrefixOf!0 bitStream1!8 bitStream2!8))))

(declare-fun b!92739 () Bool)

(declare-fun res!76549 () Bool)

(assert (=> b!92739 (=> (not res!76549) (not e!60936))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!92739 (= res!76549 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!1965 (buf!2341 bitStream1!8)) (currentByte!4666 bitStream1!8) (currentBit!4661 bitStream1!8))) (bitIndex!0 (size!1965 (buf!2341 bitStream2!8)) (currentByte!4666 bitStream2!8) (currentBit!4661 bitStream2!8))))))

(declare-fun b!92740 () Bool)

(declare-fun res!76551 () Bool)

(assert (=> b!92740 (=> (not res!76551) (not e!60936))))

(declare-fun base!8 () BitStream!3464)

(declare-fun nBits!484 () (_ BitVec 64))

(assert (=> b!92740 (= res!76551 (bvslt (bitIndex!0 (size!1965 (buf!2341 base!8)) (currentByte!4666 base!8) (currentBit!4661 base!8)) (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!484)))))

(declare-fun b!92741 () Bool)

(declare-fun res!76552 () Bool)

(assert (=> b!92741 (=> (not res!76552) (not e!60936))))

(assert (=> b!92741 (= res!76552 (isPrefixOf!0 bitStream1!8 base!8))))

(declare-fun b!92743 () Bool)

(declare-fun e!60935 () Bool)

(assert (=> b!92743 (= e!60935 (array_inv!1797 (buf!2341 base!8)))))

(declare-fun b!92744 () Bool)

(declare-fun res!76546 () Bool)

(assert (=> b!92744 (=> (not res!76546) (not e!60936))))

(assert (=> b!92744 (= res!76546 (and (= (buf!2341 bitStream1!8) (buf!2341 bitStream2!8)) (= (buf!2341 bitStream1!8) (buf!2341 base!8))))))

(declare-fun res!76545 () Bool)

(assert (=> start!18670 (=> (not res!76545) (not e!60936))))

(assert (=> start!18670 (= res!76545 (bvsgt nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!18670 e!60936))

(assert (=> start!18670 true))

(declare-fun inv!12 (BitStream!3464) Bool)

(assert (=> start!18670 (and (inv!12 bitStream1!8) e!60933)))

(declare-fun e!60937 () Bool)

(assert (=> start!18670 (and (inv!12 bitStream2!8) e!60937)))

(assert (=> start!18670 (and (inv!12 base!8) e!60935)))

(declare-fun b!92742 () Bool)

(declare-fun res!76553 () Bool)

(assert (=> b!92742 (=> (not res!76553) (not e!60936))))

(assert (=> b!92742 (= res!76553 (isPrefixOf!0 bitStream2!8 base!8))))

(declare-fun b!92745 () Bool)

(assert (=> b!92745 (= e!60936 (or (bvsgt ((_ sign_extend 32) (size!1965 (buf!2341 bitStream2!8))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!4666 bitStream2!8)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!4661 bitStream2!8)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(declare-fun b!92746 () Bool)

(assert (=> b!92746 (= e!60937 (array_inv!1797 (buf!2341 bitStream2!8)))))

(declare-fun b!92747 () Bool)

(declare-fun res!76550 () Bool)

(assert (=> b!92747 (=> (not res!76550) (not e!60936))))

(declare-datatypes ((List!838 0))(
  ( (Nil!835) (Cons!834 (h!953 Bool) (t!1588 List!838)) )
))
(declare-fun listBits!13 () List!838)

(declare-fun length!429 (List!838) Int)

(assert (=> b!92747 (= res!76550 (> (length!429 listBits!13) 0))))

(declare-fun b!92748 () Bool)

(declare-fun res!76547 () Bool)

(assert (=> b!92748 (=> (not res!76547) (not e!60936))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!92748 (= res!76547 (validate_offset_bits!1 ((_ sign_extend 32) (size!1965 (buf!2341 bitStream1!8))) ((_ sign_extend 32) (currentByte!4666 bitStream1!8)) ((_ sign_extend 32) (currentBit!4661 bitStream1!8)) nBits!484))))

(assert (= (and start!18670 res!76545) b!92747))

(assert (= (and b!92747 res!76550) b!92741))

(assert (= (and b!92741 res!76552) b!92742))

(assert (= (and b!92742 res!76553) b!92738))

(assert (= (and b!92738 res!76548) b!92744))

(assert (= (and b!92744 res!76546) b!92740))

(assert (= (and b!92740 res!76551) b!92739))

(assert (= (and b!92739 res!76549) b!92748))

(assert (= (and b!92748 res!76547) b!92745))

(assert (= start!18670 b!92737))

(assert (= start!18670 b!92746))

(assert (= start!18670 b!92743))

(declare-fun m!136645 () Bool)

(assert (=> b!92741 m!136645))

(declare-fun m!136647 () Bool)

(assert (=> b!92748 m!136647))

(declare-fun m!136649 () Bool)

(assert (=> start!18670 m!136649))

(declare-fun m!136651 () Bool)

(assert (=> start!18670 m!136651))

(declare-fun m!136653 () Bool)

(assert (=> start!18670 m!136653))

(declare-fun m!136655 () Bool)

(assert (=> b!92737 m!136655))

(declare-fun m!136657 () Bool)

(assert (=> b!92742 m!136657))

(declare-fun m!136659 () Bool)

(assert (=> b!92746 m!136659))

(declare-fun m!136661 () Bool)

(assert (=> b!92738 m!136661))

(declare-fun m!136663 () Bool)

(assert (=> b!92740 m!136663))

(declare-fun m!136665 () Bool)

(assert (=> b!92747 m!136665))

(declare-fun m!136667 () Bool)

(assert (=> b!92739 m!136667))

(declare-fun m!136669 () Bool)

(assert (=> b!92739 m!136669))

(declare-fun m!136671 () Bool)

(assert (=> b!92743 m!136671))

(push 1)

(assert (not b!92737))

(assert (not b!92739))

(assert (not b!92742))

(assert (not b!92747))

(assert (not b!92740))

(assert (not start!18670))

(assert (not b!92738))

(assert (not b!92743))

(assert (not b!92746))

(assert (not b!92741))

(assert (not b!92748))

(check-sat)

(pop 1)

(push 1)

(check-sat)

