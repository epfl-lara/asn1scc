; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64558 () Bool)

(assert start!64558)

(declare-datatypes ((array!17147 0))(
  ( (array!17148 (arr!8419 (Array (_ BitVec 32) (_ BitVec 8))) (size!7417 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12844 0))(
  ( (BitStream!12845 (buf!7483 array!17147) (currentByte!13890 (_ BitVec 32)) (currentBit!13885 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!12844)

(declare-fun e!206086 () Bool)

(declare-fun b!289628 () Bool)

(declare-datatypes ((Unit!20075 0))(
  ( (Unit!20076) )
))
(declare-datatypes ((tuple3!1578 0))(
  ( (tuple3!1579 (_1!12557 Unit!20075) (_2!12557 BitStream!12844) (_3!1203 array!17147)) )
))
(declare-fun lt!420027 () tuple3!1578)

(declare-fun arr!273 () array!17147)

(assert (=> b!289628 (= e!206086 (and (= (buf!7483 thiss!1728) (buf!7483 (_2!12557 lt!420027))) (= (size!7417 arr!273) (size!7417 (_3!1203 lt!420027)))))))

(declare-fun res!239295 () Bool)

(declare-fun e!206088 () Bool)

(assert (=> start!64558 (=> (not res!239295) (not e!206088))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(assert (=> start!64558 (= res!239295 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7417 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!64558 e!206088))

(declare-fun e!206085 () Bool)

(declare-fun inv!12 (BitStream!12844) Bool)

(assert (=> start!64558 (and (inv!12 thiss!1728) e!206085)))

(assert (=> start!64558 true))

(declare-fun array_inv!7029 (array!17147) Bool)

(assert (=> start!64558 (array_inv!7029 arr!273)))

(declare-fun b!289629 () Bool)

(declare-fun res!239297 () Bool)

(assert (=> b!289629 (=> (not res!239297) (not e!206088))))

(assert (=> b!289629 (= res!239297 (bvslt from!505 to!474))))

(declare-fun b!289630 () Bool)

(assert (=> b!289630 (= e!206088 (not true))))

(declare-fun lt!420028 () array!17147)

(declare-fun arrayBitRangesEq!0 (array!17147 array!17147 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!289630 (arrayBitRangesEq!0 arr!273 lt!420028 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-datatypes ((tuple2!22708 0))(
  ( (tuple2!22709 (_1!12558 Bool) (_2!12558 BitStream!12844)) )
))
(declare-fun lt!420025 () tuple2!22708)

(declare-fun lt!420030 () Unit!20075)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17147 (_ BitVec 64) Bool) Unit!20075)

(assert (=> b!289630 (= lt!420030 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12558 lt!420025)))))

(assert (=> b!289630 e!206086))

(declare-fun res!239294 () Bool)

(assert (=> b!289630 (=> (not res!239294) (not e!206086))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!289630 (= res!239294 (= (bvsub (bvadd (bitIndex!0 (size!7417 (buf!7483 thiss!1728)) (currentByte!13890 thiss!1728) (currentBit!13885 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7417 (buf!7483 (_2!12557 lt!420027))) (currentByte!13890 (_2!12557 lt!420027)) (currentBit!13885 (_2!12557 lt!420027)))))))

(declare-fun readBitsLoop!0 (BitStream!12844 (_ BitVec 64) array!17147 (_ BitVec 64) (_ BitVec 64)) tuple3!1578)

(assert (=> b!289630 (= lt!420027 (readBitsLoop!0 (_2!12558 lt!420025) nBits!523 lt!420028 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!289630 (validate_offset_bits!1 ((_ sign_extend 32) (size!7417 (buf!7483 (_2!12558 lt!420025)))) ((_ sign_extend 32) (currentByte!13890 (_2!12558 lt!420025))) ((_ sign_extend 32) (currentBit!13885 (_2!12558 lt!420025))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!420029 () Unit!20075)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!12844 BitStream!12844 (_ BitVec 64) (_ BitVec 64)) Unit!20075)

(assert (=> b!289630 (= lt!420029 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12558 lt!420025) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!420026 () (_ BitVec 32))

(declare-fun lt!420024 () (_ BitVec 32))

(assert (=> b!289630 (= lt!420028 (array!17148 (store (arr!8419 arr!273) lt!420024 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8419 arr!273) lt!420024)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!420026)))) ((_ sign_extend 24) (ite (_1!12558 lt!420025) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!420026) #b00000000))))) (size!7417 arr!273)))))

(assert (=> b!289630 (= lt!420026 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!289630 (= lt!420024 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!12844) tuple2!22708)

(assert (=> b!289630 (= lt!420025 (readBit!0 thiss!1728))))

(declare-fun b!289631 () Bool)

(assert (=> b!289631 (= e!206085 (array_inv!7029 (buf!7483 thiss!1728)))))

(declare-fun b!289632 () Bool)

(declare-fun res!239296 () Bool)

(assert (=> b!289632 (=> (not res!239296) (not e!206088))))

(assert (=> b!289632 (= res!239296 (validate_offset_bits!1 ((_ sign_extend 32) (size!7417 (buf!7483 thiss!1728))) ((_ sign_extend 32) (currentByte!13890 thiss!1728)) ((_ sign_extend 32) (currentBit!13885 thiss!1728)) (bvsub nBits!523 from!505)))))

(assert (= (and start!64558 res!239295) b!289632))

(assert (= (and b!289632 res!239296) b!289629))

(assert (= (and b!289629 res!239297) b!289630))

(assert (= (and b!289630 res!239294) b!289628))

(assert (= start!64558 b!289631))

(declare-fun m!422731 () Bool)

(assert (=> start!64558 m!422731))

(declare-fun m!422733 () Bool)

(assert (=> start!64558 m!422733))

(declare-fun m!422735 () Bool)

(assert (=> b!289630 m!422735))

(declare-fun m!422737 () Bool)

(assert (=> b!289630 m!422737))

(declare-fun m!422739 () Bool)

(assert (=> b!289630 m!422739))

(declare-fun m!422741 () Bool)

(assert (=> b!289630 m!422741))

(declare-fun m!422743 () Bool)

(assert (=> b!289630 m!422743))

(declare-fun m!422745 () Bool)

(assert (=> b!289630 m!422745))

(declare-fun m!422747 () Bool)

(assert (=> b!289630 m!422747))

(declare-fun m!422749 () Bool)

(assert (=> b!289630 m!422749))

(declare-fun m!422751 () Bool)

(assert (=> b!289630 m!422751))

(declare-fun m!422753 () Bool)

(assert (=> b!289630 m!422753))

(declare-fun m!422755 () Bool)

(assert (=> b!289630 m!422755))

(declare-fun m!422757 () Bool)

(assert (=> b!289631 m!422757))

(declare-fun m!422759 () Bool)

(assert (=> b!289632 m!422759))

(push 1)

(assert (not b!289630))

(assert (not start!64558))

(assert (not b!289632))

(assert (not b!289631))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

