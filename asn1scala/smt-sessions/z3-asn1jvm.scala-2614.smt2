; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64602 () Bool)

(assert start!64602)

(declare-fun b!289958 () Bool)

(declare-fun e!206418 () Bool)

(assert (=> b!289958 (= e!206418 (not true))))

(declare-datatypes ((array!17191 0))(
  ( (array!17192 (arr!8441 (Array (_ BitVec 32) (_ BitVec 8))) (size!7439 (_ BitVec 32))) )
))
(declare-fun arr!273 () array!17191)

(declare-datatypes ((BitStream!12888 0))(
  ( (BitStream!12889 (buf!7505 array!17191) (currentByte!13912 (_ BitVec 32)) (currentBit!13907 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!20119 0))(
  ( (Unit!20120) )
))
(declare-datatypes ((tuple3!1622 0))(
  ( (tuple3!1623 (_1!12601 Unit!20119) (_2!12601 BitStream!12888) (_3!1225 array!17191)) )
))
(declare-fun lt!420511 () tuple3!1622)

(declare-fun from!505 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!17191 array!17191 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!289958 (arrayBitRangesEq!0 arr!273 (_3!1225 lt!420511) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!420514 () Unit!20119)

(declare-fun lt!420513 () array!17191)

(declare-fun arrayBitRangesEqTransitive!0 (array!17191 array!17191 array!17191 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20119)

(assert (=> b!289958 (= lt!420514 (arrayBitRangesEqTransitive!0 arr!273 lt!420513 (_3!1225 lt!420511) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!289958 (arrayBitRangesEq!0 arr!273 lt!420513 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!420512 () Unit!20119)

(declare-datatypes ((tuple2!22752 0))(
  ( (tuple2!22753 (_1!12602 Bool) (_2!12602 BitStream!12888)) )
))
(declare-fun lt!420509 () tuple2!22752)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17191 (_ BitVec 64) Bool) Unit!20119)

(assert (=> b!289958 (= lt!420512 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12602 lt!420509)))))

(declare-fun e!206414 () Bool)

(assert (=> b!289958 e!206414))

(declare-fun res!239561 () Bool)

(assert (=> b!289958 (=> (not res!239561) (not e!206414))))

(declare-fun thiss!1728 () BitStream!12888)

(declare-fun to!474 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!289958 (= res!239561 (= (bvsub (bvadd (bitIndex!0 (size!7439 (buf!7505 thiss!1728)) (currentByte!13912 thiss!1728) (currentBit!13907 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7439 (buf!7505 (_2!12601 lt!420511))) (currentByte!13912 (_2!12601 lt!420511)) (currentBit!13907 (_2!12601 lt!420511)))))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun readBitsLoop!0 (BitStream!12888 (_ BitVec 64) array!17191 (_ BitVec 64) (_ BitVec 64)) tuple3!1622)

(assert (=> b!289958 (= lt!420511 (readBitsLoop!0 (_2!12602 lt!420509) nBits!523 lt!420513 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!289958 (validate_offset_bits!1 ((_ sign_extend 32) (size!7439 (buf!7505 (_2!12602 lt!420509)))) ((_ sign_extend 32) (currentByte!13912 (_2!12602 lt!420509))) ((_ sign_extend 32) (currentBit!13907 (_2!12602 lt!420509))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!420516 () Unit!20119)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!12888 BitStream!12888 (_ BitVec 64) (_ BitVec 64)) Unit!20119)

(assert (=> b!289958 (= lt!420516 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12602 lt!420509) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!420510 () (_ BitVec 32))

(declare-fun lt!420515 () (_ BitVec 32))

(assert (=> b!289958 (= lt!420513 (array!17192 (store (arr!8441 arr!273) lt!420510 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8441 arr!273) lt!420510)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!420515)))) ((_ sign_extend 24) (ite (_1!12602 lt!420509) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!420515) #b00000000))))) (size!7439 arr!273)))))

(assert (=> b!289958 (= lt!420515 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!289958 (= lt!420510 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!12888) tuple2!22752)

(assert (=> b!289958 (= lt!420509 (readBit!0 thiss!1728))))

(declare-fun b!289959 () Bool)

(declare-fun res!239559 () Bool)

(assert (=> b!289959 (=> (not res!239559) (not e!206418))))

(assert (=> b!289959 (= res!239559 (bvslt from!505 to!474))))

(declare-fun b!289960 () Bool)

(declare-fun res!239558 () Bool)

(assert (=> b!289960 (=> (not res!239558) (not e!206418))))

(assert (=> b!289960 (= res!239558 (validate_offset_bits!1 ((_ sign_extend 32) (size!7439 (buf!7505 thiss!1728))) ((_ sign_extend 32) (currentByte!13912 thiss!1728)) ((_ sign_extend 32) (currentBit!13907 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun res!239560 () Bool)

(assert (=> start!64602 (=> (not res!239560) (not e!206418))))

(assert (=> start!64602 (= res!239560 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7439 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!64602 e!206418))

(declare-fun e!206417 () Bool)

(declare-fun inv!12 (BitStream!12888) Bool)

(assert (=> start!64602 (and (inv!12 thiss!1728) e!206417)))

(assert (=> start!64602 true))

(declare-fun array_inv!7051 (array!17191) Bool)

(assert (=> start!64602 (array_inv!7051 arr!273)))

(declare-fun b!289961 () Bool)

(assert (=> b!289961 (= e!206417 (array_inv!7051 (buf!7505 thiss!1728)))))

(declare-fun b!289962 () Bool)

(assert (=> b!289962 (= e!206414 (and (= (buf!7505 thiss!1728) (buf!7505 (_2!12601 lt!420511))) (= (size!7439 arr!273) (size!7439 (_3!1225 lt!420511)))))))

(assert (= (and start!64602 res!239560) b!289960))

(assert (= (and b!289960 res!239558) b!289959))

(assert (= (and b!289959 res!239559) b!289958))

(assert (= (and b!289958 res!239561) b!289962))

(assert (= start!64602 b!289961))

(declare-fun m!423419 () Bool)

(assert (=> b!289958 m!423419))

(declare-fun m!423421 () Bool)

(assert (=> b!289958 m!423421))

(declare-fun m!423423 () Bool)

(assert (=> b!289958 m!423423))

(declare-fun m!423425 () Bool)

(assert (=> b!289958 m!423425))

(declare-fun m!423427 () Bool)

(assert (=> b!289958 m!423427))

(declare-fun m!423429 () Bool)

(assert (=> b!289958 m!423429))

(declare-fun m!423431 () Bool)

(assert (=> b!289958 m!423431))

(declare-fun m!423433 () Bool)

(assert (=> b!289958 m!423433))

(declare-fun m!423435 () Bool)

(assert (=> b!289958 m!423435))

(declare-fun m!423437 () Bool)

(assert (=> b!289958 m!423437))

(declare-fun m!423439 () Bool)

(assert (=> b!289958 m!423439))

(declare-fun m!423441 () Bool)

(assert (=> b!289958 m!423441))

(declare-fun m!423443 () Bool)

(assert (=> b!289958 m!423443))

(declare-fun m!423445 () Bool)

(assert (=> b!289960 m!423445))

(declare-fun m!423447 () Bool)

(assert (=> start!64602 m!423447))

(declare-fun m!423449 () Bool)

(assert (=> start!64602 m!423449))

(declare-fun m!423451 () Bool)

(assert (=> b!289961 m!423451))

(check-sat (not b!289960) (not start!64602) (not b!289958) (not b!289961))
