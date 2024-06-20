; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64616 () Bool)

(assert start!64616)

(declare-fun e!206520 () Bool)

(declare-datatypes ((array!17205 0))(
  ( (array!17206 (arr!8448 (Array (_ BitVec 32) (_ BitVec 8))) (size!7446 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12902 0))(
  ( (BitStream!12903 (buf!7512 array!17205) (currentByte!13919 (_ BitVec 32)) (currentBit!13914 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!12902)

(declare-datatypes ((Unit!20133 0))(
  ( (Unit!20134) )
))
(declare-datatypes ((tuple3!1636 0))(
  ( (tuple3!1637 (_1!12615 Unit!20133) (_2!12615 BitStream!12902) (_3!1232 array!17205)) )
))
(declare-fun lt!420682 () tuple3!1636)

(declare-fun b!290063 () Bool)

(declare-fun arr!273 () array!17205)

(assert (=> b!290063 (= e!206520 (and (= (buf!7512 thiss!1728) (buf!7512 (_2!12615 lt!420682))) (= (size!7446 arr!273) (size!7446 (_3!1232 lt!420682)))))))

(declare-fun res!239643 () Bool)

(declare-fun e!206519 () Bool)

(assert (=> start!64616 (=> (not res!239643) (not e!206519))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(assert (=> start!64616 (= res!239643 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7446 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!64616 e!206519))

(declare-fun e!206522 () Bool)

(declare-fun inv!12 (BitStream!12902) Bool)

(assert (=> start!64616 (and (inv!12 thiss!1728) e!206522)))

(assert (=> start!64616 true))

(declare-fun array_inv!7058 (array!17205) Bool)

(assert (=> start!64616 (array_inv!7058 arr!273)))

(declare-fun b!290064 () Bool)

(assert (=> b!290064 (= e!206522 (array_inv!7058 (buf!7512 thiss!1728)))))

(declare-fun b!290065 () Bool)

(declare-fun res!239642 () Bool)

(assert (=> b!290065 (=> (not res!239642) (not e!206519))))

(assert (=> b!290065 (= res!239642 (bvslt from!505 to!474))))

(declare-fun b!290066 () Bool)

(declare-fun res!239644 () Bool)

(assert (=> b!290066 (=> (not res!239644) (not e!206519))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!290066 (= res!239644 (validate_offset_bits!1 ((_ sign_extend 32) (size!7446 (buf!7512 thiss!1728))) ((_ sign_extend 32) (currentByte!13919 thiss!1728)) ((_ sign_extend 32) (currentBit!13914 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!290067 () Bool)

(assert (=> b!290067 (= e!206519 (not true))))

(declare-fun arrayBitRangesEq!0 (array!17205 array!17205 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!290067 (arrayBitRangesEq!0 arr!273 (_3!1232 lt!420682) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!420680 () Unit!20133)

(declare-fun lt!420678 () array!17205)

(declare-fun arrayBitRangesEqTransitive!0 (array!17205 array!17205 array!17205 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20133)

(assert (=> b!290067 (= lt!420680 (arrayBitRangesEqTransitive!0 arr!273 lt!420678 (_3!1232 lt!420682) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!290067 (arrayBitRangesEq!0 arr!273 lt!420678 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!420679 () Unit!20133)

(declare-datatypes ((tuple2!22766 0))(
  ( (tuple2!22767 (_1!12616 Bool) (_2!12616 BitStream!12902)) )
))
(declare-fun lt!420684 () tuple2!22766)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17205 (_ BitVec 64) Bool) Unit!20133)

(assert (=> b!290067 (= lt!420679 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12616 lt!420684)))))

(assert (=> b!290067 e!206520))

(declare-fun res!239645 () Bool)

(assert (=> b!290067 (=> (not res!239645) (not e!206520))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!290067 (= res!239645 (= (bvsub (bvadd (bitIndex!0 (size!7446 (buf!7512 thiss!1728)) (currentByte!13919 thiss!1728) (currentBit!13914 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7446 (buf!7512 (_2!12615 lt!420682))) (currentByte!13919 (_2!12615 lt!420682)) (currentBit!13914 (_2!12615 lt!420682)))))))

(declare-fun readBitsLoop!0 (BitStream!12902 (_ BitVec 64) array!17205 (_ BitVec 64) (_ BitVec 64)) tuple3!1636)

(assert (=> b!290067 (= lt!420682 (readBitsLoop!0 (_2!12616 lt!420684) nBits!523 lt!420678 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> b!290067 (validate_offset_bits!1 ((_ sign_extend 32) (size!7446 (buf!7512 (_2!12616 lt!420684)))) ((_ sign_extend 32) (currentByte!13919 (_2!12616 lt!420684))) ((_ sign_extend 32) (currentBit!13914 (_2!12616 lt!420684))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!420681 () Unit!20133)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!12902 BitStream!12902 (_ BitVec 64) (_ BitVec 64)) Unit!20133)

(assert (=> b!290067 (= lt!420681 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12616 lt!420684) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!420677 () (_ BitVec 32))

(declare-fun lt!420683 () (_ BitVec 32))

(assert (=> b!290067 (= lt!420678 (array!17206 (store (arr!8448 arr!273) lt!420683 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8448 arr!273) lt!420683)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!420677)))) ((_ sign_extend 24) (ite (_1!12616 lt!420684) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!420677) #b00000000))))) (size!7446 arr!273)))))

(assert (=> b!290067 (= lt!420677 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!290067 (= lt!420683 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!12902) tuple2!22766)

(assert (=> b!290067 (= lt!420684 (readBit!0 thiss!1728))))

(assert (= (and start!64616 res!239643) b!290066))

(assert (= (and b!290066 res!239644) b!290065))

(assert (= (and b!290065 res!239642) b!290067))

(assert (= (and b!290067 res!239645) b!290063))

(assert (= start!64616 b!290064))

(declare-fun m!423657 () Bool)

(assert (=> start!64616 m!423657))

(declare-fun m!423659 () Bool)

(assert (=> start!64616 m!423659))

(declare-fun m!423661 () Bool)

(assert (=> b!290064 m!423661))

(declare-fun m!423663 () Bool)

(assert (=> b!290066 m!423663))

(declare-fun m!423665 () Bool)

(assert (=> b!290067 m!423665))

(declare-fun m!423667 () Bool)

(assert (=> b!290067 m!423667))

(declare-fun m!423669 () Bool)

(assert (=> b!290067 m!423669))

(declare-fun m!423671 () Bool)

(assert (=> b!290067 m!423671))

(declare-fun m!423673 () Bool)

(assert (=> b!290067 m!423673))

(declare-fun m!423675 () Bool)

(assert (=> b!290067 m!423675))

(declare-fun m!423677 () Bool)

(assert (=> b!290067 m!423677))

(declare-fun m!423679 () Bool)

(assert (=> b!290067 m!423679))

(declare-fun m!423681 () Bool)

(assert (=> b!290067 m!423681))

(declare-fun m!423683 () Bool)

(assert (=> b!290067 m!423683))

(declare-fun m!423685 () Bool)

(assert (=> b!290067 m!423685))

(declare-fun m!423687 () Bool)

(assert (=> b!290067 m!423687))

(declare-fun m!423689 () Bool)

(assert (=> b!290067 m!423689))

(push 1)

(assert (not b!290066))

(assert (not start!64616))

(assert (not b!290067))

(assert (not b!290064))

(check-sat)

