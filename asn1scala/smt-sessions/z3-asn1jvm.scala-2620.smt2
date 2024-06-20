; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64638 () Bool)

(assert start!64638)

(declare-fun b!290229 () Bool)

(declare-fun res!239776 () Bool)

(declare-fun e!206685 () Bool)

(assert (=> b!290229 (=> (not res!239776) (not e!206685))))

(declare-datatypes ((array!17227 0))(
  ( (array!17228 (arr!8459 (Array (_ BitVec 32) (_ BitVec 8))) (size!7457 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12924 0))(
  ( (BitStream!12925 (buf!7523 array!17227) (currentByte!13930 (_ BitVec 32)) (currentBit!13925 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!12924)

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!290229 (= res!239776 (validate_offset_bits!1 ((_ sign_extend 32) (size!7457 (buf!7523 thiss!1728))) ((_ sign_extend 32) (currentByte!13930 thiss!1728)) ((_ sign_extend 32) (currentBit!13925 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-datatypes ((Unit!20155 0))(
  ( (Unit!20156) )
))
(declare-datatypes ((tuple3!1658 0))(
  ( (tuple3!1659 (_1!12637 Unit!20155) (_2!12637 BitStream!12924) (_3!1243 array!17227)) )
))
(declare-fun lt!420961 () tuple3!1658)

(declare-fun b!290230 () Bool)

(declare-fun e!206688 () Bool)

(declare-fun arr!273 () array!17227)

(assert (=> b!290230 (= e!206688 (and (= (buf!7523 thiss!1728) (buf!7523 (_2!12637 lt!420961))) (= (size!7457 arr!273) (size!7457 (_3!1243 lt!420961)))))))

(declare-fun b!290231 () Bool)

(declare-fun res!239775 () Bool)

(assert (=> b!290231 (=> (not res!239775) (not e!206685))))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!290231 (= res!239775 (bvslt from!505 to!474))))

(declare-fun b!290232 () Bool)

(assert (=> b!290232 (= e!206685 (not (bvsle from!505 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7457 arr!273))))))))

(declare-fun lt!420962 () array!17227)

(declare-fun bitAt!0 (array!17227 (_ BitVec 64)) Bool)

(assert (=> b!290232 (= (bitAt!0 lt!420962 from!505) (bitAt!0 (_3!1243 lt!420961) from!505))))

(declare-fun lt!420958 () Unit!20155)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!17227 array!17227 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20155)

(assert (=> b!290232 (= lt!420958 (arrayBitRangesEqImpliesEq!0 lt!420962 (_3!1243 lt!420961) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun arrayBitRangesEq!0 (array!17227 array!17227 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!290232 (arrayBitRangesEq!0 arr!273 (_3!1243 lt!420961) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!420959 () Unit!20155)

(declare-fun arrayBitRangesEqTransitive!0 (array!17227 array!17227 array!17227 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20155)

(assert (=> b!290232 (= lt!420959 (arrayBitRangesEqTransitive!0 arr!273 lt!420962 (_3!1243 lt!420961) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!290232 (arrayBitRangesEq!0 arr!273 lt!420962 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-datatypes ((tuple2!22788 0))(
  ( (tuple2!22789 (_1!12638 Bool) (_2!12638 BitStream!12924)) )
))
(declare-fun lt!420963 () tuple2!22788)

(declare-fun lt!420957 () Unit!20155)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17227 (_ BitVec 64) Bool) Unit!20155)

(assert (=> b!290232 (= lt!420957 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12638 lt!420963)))))

(assert (=> b!290232 e!206688))

(declare-fun res!239777 () Bool)

(assert (=> b!290232 (=> (not res!239777) (not e!206688))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!290232 (= res!239777 (= (bvsub (bvadd (bitIndex!0 (size!7457 (buf!7523 thiss!1728)) (currentByte!13930 thiss!1728) (currentBit!13925 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7457 (buf!7523 (_2!12637 lt!420961))) (currentByte!13930 (_2!12637 lt!420961)) (currentBit!13925 (_2!12637 lt!420961)))))))

(declare-fun readBitsLoop!0 (BitStream!12924 (_ BitVec 64) array!17227 (_ BitVec 64) (_ BitVec 64)) tuple3!1658)

(assert (=> b!290232 (= lt!420961 (readBitsLoop!0 (_2!12638 lt!420963) nBits!523 lt!420962 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> b!290232 (validate_offset_bits!1 ((_ sign_extend 32) (size!7457 (buf!7523 (_2!12638 lt!420963)))) ((_ sign_extend 32) (currentByte!13930 (_2!12638 lt!420963))) ((_ sign_extend 32) (currentBit!13925 (_2!12638 lt!420963))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!420960 () Unit!20155)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!12924 BitStream!12924 (_ BitVec 64) (_ BitVec 64)) Unit!20155)

(assert (=> b!290232 (= lt!420960 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12638 lt!420963) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!420956 () (_ BitVec 32))

(declare-fun lt!420955 () (_ BitVec 32))

(assert (=> b!290232 (= lt!420962 (array!17228 (store (arr!8459 arr!273) lt!420956 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8459 arr!273) lt!420956)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!420955)))) ((_ sign_extend 24) (ite (_1!12638 lt!420963) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!420955) #b00000000))))) (size!7457 arr!273)))))

(assert (=> b!290232 (= lt!420955 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!290232 (= lt!420956 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!12924) tuple2!22788)

(assert (=> b!290232 (= lt!420963 (readBit!0 thiss!1728))))

(declare-fun b!290228 () Bool)

(declare-fun e!206687 () Bool)

(declare-fun array_inv!7069 (array!17227) Bool)

(assert (=> b!290228 (= e!206687 (array_inv!7069 (buf!7523 thiss!1728)))))

(declare-fun res!239774 () Bool)

(assert (=> start!64638 (=> (not res!239774) (not e!206685))))

(assert (=> start!64638 (= res!239774 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7457 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!64638 e!206685))

(declare-fun inv!12 (BitStream!12924) Bool)

(assert (=> start!64638 (and (inv!12 thiss!1728) e!206687)))

(assert (=> start!64638 true))

(assert (=> start!64638 (array_inv!7069 arr!273)))

(assert (= (and start!64638 res!239774) b!290229))

(assert (= (and b!290229 res!239776) b!290231))

(assert (= (and b!290231 res!239775) b!290232))

(assert (= (and b!290232 res!239777) b!290230))

(assert (= start!64638 b!290228))

(declare-fun m!424055 () Bool)

(assert (=> b!290229 m!424055))

(declare-fun m!424057 () Bool)

(assert (=> b!290232 m!424057))

(declare-fun m!424059 () Bool)

(assert (=> b!290232 m!424059))

(declare-fun m!424061 () Bool)

(assert (=> b!290232 m!424061))

(declare-fun m!424063 () Bool)

(assert (=> b!290232 m!424063))

(declare-fun m!424065 () Bool)

(assert (=> b!290232 m!424065))

(declare-fun m!424067 () Bool)

(assert (=> b!290232 m!424067))

(declare-fun m!424069 () Bool)

(assert (=> b!290232 m!424069))

(declare-fun m!424071 () Bool)

(assert (=> b!290232 m!424071))

(declare-fun m!424073 () Bool)

(assert (=> b!290232 m!424073))

(declare-fun m!424075 () Bool)

(assert (=> b!290232 m!424075))

(declare-fun m!424077 () Bool)

(assert (=> b!290232 m!424077))

(declare-fun m!424079 () Bool)

(assert (=> b!290232 m!424079))

(declare-fun m!424081 () Bool)

(assert (=> b!290232 m!424081))

(declare-fun m!424083 () Bool)

(assert (=> b!290232 m!424083))

(declare-fun m!424085 () Bool)

(assert (=> b!290232 m!424085))

(declare-fun m!424087 () Bool)

(assert (=> b!290232 m!424087))

(declare-fun m!424089 () Bool)

(assert (=> b!290228 m!424089))

(declare-fun m!424091 () Bool)

(assert (=> start!64638 m!424091))

(declare-fun m!424093 () Bool)

(assert (=> start!64638 m!424093))

(check-sat (not start!64638) (not b!290232) (not b!290228) (not b!290229))
(check-sat)
