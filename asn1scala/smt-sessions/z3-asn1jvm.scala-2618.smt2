; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64626 () Bool)

(assert start!64626)

(declare-fun b!290138 () Bool)

(declare-fun res!239702 () Bool)

(declare-fun e!206595 () Bool)

(assert (=> b!290138 (=> (not res!239702) (not e!206595))))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!290138 (= res!239702 (bvslt from!505 to!474))))

(declare-fun b!290139 () Bool)

(declare-fun e!206598 () Bool)

(declare-datatypes ((array!17215 0))(
  ( (array!17216 (arr!8453 (Array (_ BitVec 32) (_ BitVec 8))) (size!7451 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12912 0))(
  ( (BitStream!12913 (buf!7517 array!17215) (currentByte!13924 (_ BitVec 32)) (currentBit!13919 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!12912)

(declare-fun array_inv!7063 (array!17215) Bool)

(assert (=> b!290139 (= e!206598 (array_inv!7063 (buf!7517 thiss!1728)))))

(declare-fun b!290140 () Bool)

(declare-fun res!239704 () Bool)

(assert (=> b!290140 (=> (not res!239704) (not e!206595))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!290140 (= res!239704 (validate_offset_bits!1 ((_ sign_extend 32) (size!7451 (buf!7517 thiss!1728))) ((_ sign_extend 32) (currentByte!13924 thiss!1728)) ((_ sign_extend 32) (currentBit!13919 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun res!239705 () Bool)

(assert (=> start!64626 (=> (not res!239705) (not e!206595))))

(declare-fun arr!273 () array!17215)

(assert (=> start!64626 (= res!239705 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7451 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!64626 e!206595))

(declare-fun inv!12 (BitStream!12912) Bool)

(assert (=> start!64626 (and (inv!12 thiss!1728) e!206598)))

(assert (=> start!64626 true))

(assert (=> start!64626 (array_inv!7063 arr!273)))

(declare-fun b!290141 () Bool)

(assert (=> b!290141 (= e!206595 (not true))))

(declare-datatypes ((Unit!20143 0))(
  ( (Unit!20144) )
))
(declare-datatypes ((tuple3!1646 0))(
  ( (tuple3!1647 (_1!12625 Unit!20143) (_2!12625 BitStream!12912) (_3!1237 array!17215)) )
))
(declare-fun lt!420798 () tuple3!1646)

(declare-fun arrayBitRangesEq!0 (array!17215 array!17215 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!290141 (arrayBitRangesEq!0 arr!273 (_3!1237 lt!420798) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!420799 () Unit!20143)

(declare-fun lt!420803 () array!17215)

(declare-fun arrayBitRangesEqTransitive!0 (array!17215 array!17215 array!17215 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20143)

(assert (=> b!290141 (= lt!420799 (arrayBitRangesEqTransitive!0 arr!273 lt!420803 (_3!1237 lt!420798) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!290141 (arrayBitRangesEq!0 arr!273 lt!420803 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!420802 () Unit!20143)

(declare-datatypes ((tuple2!22776 0))(
  ( (tuple2!22777 (_1!12626 Bool) (_2!12626 BitStream!12912)) )
))
(declare-fun lt!420800 () tuple2!22776)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17215 (_ BitVec 64) Bool) Unit!20143)

(assert (=> b!290141 (= lt!420802 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12626 lt!420800)))))

(declare-fun e!206596 () Bool)

(assert (=> b!290141 e!206596))

(declare-fun res!239703 () Bool)

(assert (=> b!290141 (=> (not res!239703) (not e!206596))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!290141 (= res!239703 (= (bvsub (bvadd (bitIndex!0 (size!7451 (buf!7517 thiss!1728)) (currentByte!13924 thiss!1728) (currentBit!13919 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7451 (buf!7517 (_2!12625 lt!420798))) (currentByte!13924 (_2!12625 lt!420798)) (currentBit!13919 (_2!12625 lt!420798)))))))

(declare-fun readBitsLoop!0 (BitStream!12912 (_ BitVec 64) array!17215 (_ BitVec 64) (_ BitVec 64)) tuple3!1646)

(assert (=> b!290141 (= lt!420798 (readBitsLoop!0 (_2!12626 lt!420800) nBits!523 lt!420803 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> b!290141 (validate_offset_bits!1 ((_ sign_extend 32) (size!7451 (buf!7517 (_2!12626 lt!420800)))) ((_ sign_extend 32) (currentByte!13924 (_2!12626 lt!420800))) ((_ sign_extend 32) (currentBit!13919 (_2!12626 lt!420800))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!420797 () Unit!20143)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!12912 BitStream!12912 (_ BitVec 64) (_ BitVec 64)) Unit!20143)

(assert (=> b!290141 (= lt!420797 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12626 lt!420800) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!420801 () (_ BitVec 32))

(declare-fun lt!420804 () (_ BitVec 32))

(assert (=> b!290141 (= lt!420803 (array!17216 (store (arr!8453 arr!273) lt!420804 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8453 arr!273) lt!420804)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!420801)))) ((_ sign_extend 24) (ite (_1!12626 lt!420800) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!420801) #b00000000))))) (size!7451 arr!273)))))

(assert (=> b!290141 (= lt!420801 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!290141 (= lt!420804 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!12912) tuple2!22776)

(assert (=> b!290141 (= lt!420800 (readBit!0 thiss!1728))))

(declare-fun b!290142 () Bool)

(assert (=> b!290142 (= e!206596 (and (= (buf!7517 thiss!1728) (buf!7517 (_2!12625 lt!420798))) (= (size!7451 arr!273) (size!7451 (_3!1237 lt!420798)))))))

(assert (= (and start!64626 res!239705) b!290140))

(assert (= (and b!290140 res!239704) b!290138))

(assert (= (and b!290138 res!239702) b!290141))

(assert (= (and b!290141 res!239703) b!290142))

(assert (= start!64626 b!290139))

(declare-fun m!423827 () Bool)

(assert (=> b!290139 m!423827))

(declare-fun m!423829 () Bool)

(assert (=> b!290140 m!423829))

(declare-fun m!423831 () Bool)

(assert (=> start!64626 m!423831))

(declare-fun m!423833 () Bool)

(assert (=> start!64626 m!423833))

(declare-fun m!423835 () Bool)

(assert (=> b!290141 m!423835))

(declare-fun m!423837 () Bool)

(assert (=> b!290141 m!423837))

(declare-fun m!423839 () Bool)

(assert (=> b!290141 m!423839))

(declare-fun m!423841 () Bool)

(assert (=> b!290141 m!423841))

(declare-fun m!423843 () Bool)

(assert (=> b!290141 m!423843))

(declare-fun m!423845 () Bool)

(assert (=> b!290141 m!423845))

(declare-fun m!423847 () Bool)

(assert (=> b!290141 m!423847))

(declare-fun m!423849 () Bool)

(assert (=> b!290141 m!423849))

(declare-fun m!423851 () Bool)

(assert (=> b!290141 m!423851))

(declare-fun m!423853 () Bool)

(assert (=> b!290141 m!423853))

(declare-fun m!423855 () Bool)

(assert (=> b!290141 m!423855))

(declare-fun m!423857 () Bool)

(assert (=> b!290141 m!423857))

(declare-fun m!423859 () Bool)

(assert (=> b!290141 m!423859))

(check-sat (not b!290139) (not b!290140) (not start!64626) (not b!290141))
