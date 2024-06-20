; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64552 () Bool)

(assert start!64552)

(declare-fun b!289583 () Bool)

(declare-fun res!239261 () Bool)

(declare-fun e!206041 () Bool)

(assert (=> b!289583 (=> (not res!239261) (not e!206041))))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!289583 (= res!239261 (bvslt from!505 to!474))))

(declare-datatypes ((array!17141 0))(
  ( (array!17142 (arr!8416 (Array (_ BitVec 32) (_ BitVec 8))) (size!7414 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12838 0))(
  ( (BitStream!12839 (buf!7480 array!17141) (currentByte!13887 (_ BitVec 32)) (currentBit!13882 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!20069 0))(
  ( (Unit!20070) )
))
(declare-datatypes ((tuple3!1572 0))(
  ( (tuple3!1573 (_1!12551 Unit!20069) (_2!12551 BitStream!12838) (_3!1200 array!17141)) )
))
(declare-fun lt!419979 () tuple3!1572)

(declare-fun thiss!1728 () BitStream!12838)

(declare-fun b!289584 () Bool)

(declare-fun e!206043 () Bool)

(declare-fun arr!273 () array!17141)

(assert (=> b!289584 (= e!206043 (and (= (buf!7480 thiss!1728) (buf!7480 (_2!12551 lt!419979))) (= (size!7414 arr!273) (size!7414 (_3!1200 lt!419979)))))))

(declare-fun res!239259 () Bool)

(assert (=> start!64552 (=> (not res!239259) (not e!206041))))

(declare-fun nBits!523 () (_ BitVec 64))

(assert (=> start!64552 (= res!239259 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7414 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!64552 e!206041))

(declare-fun e!206039 () Bool)

(declare-fun inv!12 (BitStream!12838) Bool)

(assert (=> start!64552 (and (inv!12 thiss!1728) e!206039)))

(assert (=> start!64552 true))

(declare-fun array_inv!7026 (array!17141) Bool)

(assert (=> start!64552 (array_inv!7026 arr!273)))

(declare-fun b!289585 () Bool)

(declare-fun res!239258 () Bool)

(assert (=> b!289585 (=> (not res!239258) (not e!206041))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!289585 (= res!239258 (validate_offset_bits!1 ((_ sign_extend 32) (size!7414 (buf!7480 thiss!1728))) ((_ sign_extend 32) (currentByte!13887 thiss!1728)) ((_ sign_extend 32) (currentBit!13882 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!289586 () Bool)

(assert (=> b!289586 (= e!206041 (not true))))

(assert (=> b!289586 e!206043))

(declare-fun res!239260 () Bool)

(assert (=> b!289586 (=> (not res!239260) (not e!206043))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!289586 (= res!239260 (= (bvsub (bvadd (bitIndex!0 (size!7414 (buf!7480 thiss!1728)) (currentByte!13887 thiss!1728) (currentBit!13882 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7414 (buf!7480 (_2!12551 lt!419979))) (currentByte!13887 (_2!12551 lt!419979)) (currentBit!13882 (_2!12551 lt!419979)))))))

(declare-fun lt!419975 () (_ BitVec 32))

(declare-fun lt!419978 () (_ BitVec 32))

(declare-datatypes ((tuple2!22702 0))(
  ( (tuple2!22703 (_1!12552 Bool) (_2!12552 BitStream!12838)) )
))
(declare-fun lt!419976 () tuple2!22702)

(declare-fun readBitsLoop!0 (BitStream!12838 (_ BitVec 64) array!17141 (_ BitVec 64) (_ BitVec 64)) tuple3!1572)

(assert (=> b!289586 (= lt!419979 (readBitsLoop!0 (_2!12552 lt!419976) nBits!523 (array!17142 (store (arr!8416 arr!273) lt!419978 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8416 arr!273) lt!419978)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!419975)))) ((_ sign_extend 24) (ite (_1!12552 lt!419976) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!419975) #b00000000))))) (size!7414 arr!273)) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> b!289586 (validate_offset_bits!1 ((_ sign_extend 32) (size!7414 (buf!7480 (_2!12552 lt!419976)))) ((_ sign_extend 32) (currentByte!13887 (_2!12552 lt!419976))) ((_ sign_extend 32) (currentBit!13882 (_2!12552 lt!419976))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!419977 () Unit!20069)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!12838 BitStream!12838 (_ BitVec 64) (_ BitVec 64)) Unit!20069)

(assert (=> b!289586 (= lt!419977 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12552 lt!419976) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!289586 (= lt!419975 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!289586 (= lt!419978 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!12838) tuple2!22702)

(assert (=> b!289586 (= lt!419976 (readBit!0 thiss!1728))))

(declare-fun b!289587 () Bool)

(assert (=> b!289587 (= e!206039 (array_inv!7026 (buf!7480 thiss!1728)))))

(assert (= (and start!64552 res!239259) b!289585))

(assert (= (and b!289585 res!239258) b!289583))

(assert (= (and b!289583 res!239261) b!289586))

(assert (= (and b!289586 res!239260) b!289584))

(assert (= start!64552 b!289587))

(declare-fun m!422653 () Bool)

(assert (=> start!64552 m!422653))

(declare-fun m!422655 () Bool)

(assert (=> start!64552 m!422655))

(declare-fun m!422657 () Bool)

(assert (=> b!289585 m!422657))

(declare-fun m!422659 () Bool)

(assert (=> b!289586 m!422659))

(declare-fun m!422661 () Bool)

(assert (=> b!289586 m!422661))

(declare-fun m!422663 () Bool)

(assert (=> b!289586 m!422663))

(declare-fun m!422665 () Bool)

(assert (=> b!289586 m!422665))

(declare-fun m!422667 () Bool)

(assert (=> b!289586 m!422667))

(declare-fun m!422669 () Bool)

(assert (=> b!289586 m!422669))

(declare-fun m!422671 () Bool)

(assert (=> b!289586 m!422671))

(declare-fun m!422673 () Bool)

(assert (=> b!289586 m!422673))

(declare-fun m!422675 () Bool)

(assert (=> b!289586 m!422675))

(declare-fun m!422677 () Bool)

(assert (=> b!289587 m!422677))

(push 1)

(assert (not b!289586))

(assert (not start!64552))

(assert (not b!289585))

(assert (not b!289587))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

