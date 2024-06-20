; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65738 () Bool)

(assert start!65738)

(declare-fun b!294897 () Bool)

(declare-fun e!210857 () Bool)

(declare-fun from!505 () (_ BitVec 64))

(declare-datatypes ((array!17670 0))(
  ( (array!17671 (arr!8697 (Array (_ BitVec 32) (_ BitVec 8))) (size!7659 (_ BitVec 32))) )
))
(declare-fun arr!273 () array!17670)

(assert (=> b!294897 (= e!210857 (not (or (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (bvsgt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7659 arr!273)))) (bvslt from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))))

(declare-datatypes ((BitStream!13322 0))(
  ( (BitStream!13323 (buf!7722 array!17670) (currentByte!14219 (_ BitVec 32)) (currentBit!14214 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!20555 0))(
  ( (Unit!20556) )
))
(declare-datatypes ((tuple3!1834 0))(
  ( (tuple3!1835 (_1!12957 Unit!20555) (_2!12957 BitStream!13322) (_3!1355 array!17670)) )
))
(declare-fun lt!428471 () tuple3!1834)

(declare-fun arrayBitRangesEq!0 (array!17670 array!17670 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!294897 (arrayBitRangesEq!0 arr!273 (_3!1355 lt!428471) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!428474 () array!17670)

(declare-fun lt!428478 () Unit!20555)

(declare-fun arrayBitRangesEqTransitive!0 (array!17670 array!17670 array!17670 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20555)

(assert (=> b!294897 (= lt!428478 (arrayBitRangesEqTransitive!0 arr!273 lt!428474 (_3!1355 lt!428471) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!294897 (arrayBitRangesEq!0 arr!273 lt!428474 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!428475 () Unit!20555)

(declare-datatypes ((tuple2!23204 0))(
  ( (tuple2!23205 (_1!12958 Bool) (_2!12958 BitStream!13322)) )
))
(declare-fun lt!428472 () tuple2!23204)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17670 (_ BitVec 64) Bool) Unit!20555)

(assert (=> b!294897 (= lt!428475 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12958 lt!428472)))))

(declare-fun e!210854 () Bool)

(assert (=> b!294897 e!210854))

(declare-fun res!243494 () Bool)

(assert (=> b!294897 (=> (not res!243494) (not e!210854))))

(declare-fun thiss!1728 () BitStream!13322)

(declare-fun to!474 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!294897 (= res!243494 (= (bvsub (bvadd (bitIndex!0 (size!7659 (buf!7722 thiss!1728)) (currentByte!14219 thiss!1728) (currentBit!14214 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7659 (buf!7722 (_2!12957 lt!428471))) (currentByte!14219 (_2!12957 lt!428471)) (currentBit!14214 (_2!12957 lt!428471)))))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun readBitsLoop!0 (BitStream!13322 (_ BitVec 64) array!17670 (_ BitVec 64) (_ BitVec 64)) tuple3!1834)

(assert (=> b!294897 (= lt!428471 (readBitsLoop!0 (_2!12958 lt!428472) nBits!523 lt!428474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!294897 (validate_offset_bits!1 ((_ sign_extend 32) (size!7659 (buf!7722 (_2!12958 lt!428472)))) ((_ sign_extend 32) (currentByte!14219 (_2!12958 lt!428472))) ((_ sign_extend 32) (currentBit!14214 (_2!12958 lt!428472))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!428473 () Unit!20555)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!13322 BitStream!13322 (_ BitVec 64) (_ BitVec 64)) Unit!20555)

(assert (=> b!294897 (= lt!428473 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12958 lt!428472) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!428477 () (_ BitVec 32))

(declare-fun lt!428476 () (_ BitVec 32))

(assert (=> b!294897 (= lt!428474 (array!17671 (store (arr!8697 arr!273) lt!428477 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8697 arr!273) lt!428477)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!428476)))) ((_ sign_extend 24) (ite (_1!12958 lt!428472) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!428476) #b00000000))))) (size!7659 arr!273)))))

(assert (=> b!294897 (= lt!428476 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!294897 (= lt!428477 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!13322) tuple2!23204)

(assert (=> b!294897 (= lt!428472 (readBit!0 thiss!1728))))

(declare-fun b!294898 () Bool)

(declare-fun e!210856 () Bool)

(declare-fun array_inv!7271 (array!17670) Bool)

(assert (=> b!294898 (= e!210856 (array_inv!7271 (buf!7722 thiss!1728)))))

(declare-fun b!294899 () Bool)

(declare-fun res!243495 () Bool)

(assert (=> b!294899 (=> (not res!243495) (not e!210857))))

(assert (=> b!294899 (= res!243495 (bvslt from!505 to!474))))

(declare-fun b!294900 () Bool)

(declare-fun res!243497 () Bool)

(assert (=> b!294900 (=> (not res!243497) (not e!210857))))

(assert (=> b!294900 (= res!243497 (validate_offset_bits!1 ((_ sign_extend 32) (size!7659 (buf!7722 thiss!1728))) ((_ sign_extend 32) (currentByte!14219 thiss!1728)) ((_ sign_extend 32) (currentBit!14214 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!294896 () Bool)

(assert (=> b!294896 (= e!210854 (and (= (buf!7722 thiss!1728) (buf!7722 (_2!12957 lt!428471))) (= (size!7659 arr!273) (size!7659 (_3!1355 lt!428471)))))))

(declare-fun res!243496 () Bool)

(assert (=> start!65738 (=> (not res!243496) (not e!210857))))

(assert (=> start!65738 (= res!243496 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7659 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65738 e!210857))

(declare-fun inv!12 (BitStream!13322) Bool)

(assert (=> start!65738 (and (inv!12 thiss!1728) e!210856)))

(assert (=> start!65738 true))

(assert (=> start!65738 (array_inv!7271 arr!273)))

(assert (= (and start!65738 res!243496) b!294900))

(assert (= (and b!294900 res!243497) b!294899))

(assert (= (and b!294899 res!243495) b!294897))

(assert (= (and b!294897 res!243494) b!294896))

(assert (= start!65738 b!294898))

(declare-fun m!431655 () Bool)

(assert (=> b!294897 m!431655))

(declare-fun m!431657 () Bool)

(assert (=> b!294897 m!431657))

(declare-fun m!431659 () Bool)

(assert (=> b!294897 m!431659))

(declare-fun m!431661 () Bool)

(assert (=> b!294897 m!431661))

(declare-fun m!431663 () Bool)

(assert (=> b!294897 m!431663))

(declare-fun m!431665 () Bool)

(assert (=> b!294897 m!431665))

(declare-fun m!431667 () Bool)

(assert (=> b!294897 m!431667))

(declare-fun m!431669 () Bool)

(assert (=> b!294897 m!431669))

(declare-fun m!431671 () Bool)

(assert (=> b!294897 m!431671))

(declare-fun m!431673 () Bool)

(assert (=> b!294897 m!431673))

(declare-fun m!431675 () Bool)

(assert (=> b!294897 m!431675))

(declare-fun m!431677 () Bool)

(assert (=> b!294897 m!431677))

(declare-fun m!431679 () Bool)

(assert (=> b!294897 m!431679))

(declare-fun m!431681 () Bool)

(assert (=> b!294898 m!431681))

(declare-fun m!431683 () Bool)

(assert (=> b!294900 m!431683))

(declare-fun m!431685 () Bool)

(assert (=> start!65738 m!431685))

(declare-fun m!431687 () Bool)

(assert (=> start!65738 m!431687))

(push 1)

(assert (not b!294900))

(assert (not b!294898))

(assert (not start!65738))

(assert (not b!294897))

(check-sat)

(pop 1)

(push 1)

(check-sat)

