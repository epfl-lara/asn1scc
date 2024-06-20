; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64636 () Bool)

(assert start!64636)

(declare-fun b!290213 () Bool)

(declare-datatypes ((array!17225 0))(
  ( (array!17226 (arr!8458 (Array (_ BitVec 32) (_ BitVec 8))) (size!7456 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12922 0))(
  ( (BitStream!12923 (buf!7522 array!17225) (currentByte!13929 (_ BitVec 32)) (currentBit!13924 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!12922)

(declare-datatypes ((Unit!20153 0))(
  ( (Unit!20154) )
))
(declare-datatypes ((tuple3!1656 0))(
  ( (tuple3!1657 (_1!12635 Unit!20153) (_2!12635 BitStream!12922) (_3!1242 array!17225)) )
))
(declare-fun lt!420931 () tuple3!1656)

(declare-fun e!206673 () Bool)

(declare-fun arr!273 () array!17225)

(assert (=> b!290213 (= e!206673 (and (= (buf!7522 thiss!1728) (buf!7522 (_2!12635 lt!420931))) (= (size!7456 arr!273) (size!7456 (_3!1242 lt!420931)))))))

(declare-fun b!290214 () Bool)

(declare-fun res!239763 () Bool)

(declare-fun e!206669 () Bool)

(assert (=> b!290214 (=> (not res!239763) (not e!206669))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!290214 (= res!239763 (validate_offset_bits!1 ((_ sign_extend 32) (size!7456 (buf!7522 thiss!1728))) ((_ sign_extend 32) (currentByte!13929 thiss!1728)) ((_ sign_extend 32) (currentBit!13924 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun res!239764 () Bool)

(assert (=> start!64636 (=> (not res!239764) (not e!206669))))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> start!64636 (= res!239764 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7456 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!64636 e!206669))

(declare-fun e!206671 () Bool)

(declare-fun inv!12 (BitStream!12922) Bool)

(assert (=> start!64636 (and (inv!12 thiss!1728) e!206671)))

(assert (=> start!64636 true))

(declare-fun array_inv!7068 (array!17225) Bool)

(assert (=> start!64636 (array_inv!7068 arr!273)))

(declare-fun b!290215 () Bool)

(assert (=> b!290215 (= e!206671 (array_inv!7068 (buf!7522 thiss!1728)))))

(declare-fun b!290216 () Bool)

(assert (=> b!290216 (= e!206669 (not (bvsle from!505 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7456 arr!273))))))))

(declare-fun lt!420932 () array!17225)

(declare-fun bitAt!0 (array!17225 (_ BitVec 64)) Bool)

(assert (=> b!290216 (= (bitAt!0 lt!420932 from!505) (bitAt!0 (_3!1242 lt!420931) from!505))))

(declare-fun lt!420935 () Unit!20153)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!17225 array!17225 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20153)

(assert (=> b!290216 (= lt!420935 (arrayBitRangesEqImpliesEq!0 lt!420932 (_3!1242 lt!420931) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun arrayBitRangesEq!0 (array!17225 array!17225 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!290216 (arrayBitRangesEq!0 arr!273 (_3!1242 lt!420931) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!420930 () Unit!20153)

(declare-fun arrayBitRangesEqTransitive!0 (array!17225 array!17225 array!17225 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20153)

(assert (=> b!290216 (= lt!420930 (arrayBitRangesEqTransitive!0 arr!273 lt!420932 (_3!1242 lt!420931) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!290216 (arrayBitRangesEq!0 arr!273 lt!420932 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!420933 () Unit!20153)

(declare-datatypes ((tuple2!22786 0))(
  ( (tuple2!22787 (_1!12636 Bool) (_2!12636 BitStream!12922)) )
))
(declare-fun lt!420934 () tuple2!22786)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17225 (_ BitVec 64) Bool) Unit!20153)

(assert (=> b!290216 (= lt!420933 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12636 lt!420934)))))

(assert (=> b!290216 e!206673))

(declare-fun res!239765 () Bool)

(assert (=> b!290216 (=> (not res!239765) (not e!206673))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!290216 (= res!239765 (= (bvsub (bvadd (bitIndex!0 (size!7456 (buf!7522 thiss!1728)) (currentByte!13929 thiss!1728) (currentBit!13924 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7456 (buf!7522 (_2!12635 lt!420931))) (currentByte!13929 (_2!12635 lt!420931)) (currentBit!13924 (_2!12635 lt!420931)))))))

(declare-fun readBitsLoop!0 (BitStream!12922 (_ BitVec 64) array!17225 (_ BitVec 64) (_ BitVec 64)) tuple3!1656)

(assert (=> b!290216 (= lt!420931 (readBitsLoop!0 (_2!12636 lt!420934) nBits!523 lt!420932 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> b!290216 (validate_offset_bits!1 ((_ sign_extend 32) (size!7456 (buf!7522 (_2!12636 lt!420934)))) ((_ sign_extend 32) (currentByte!13929 (_2!12636 lt!420934))) ((_ sign_extend 32) (currentBit!13924 (_2!12636 lt!420934))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!420929 () Unit!20153)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!12922 BitStream!12922 (_ BitVec 64) (_ BitVec 64)) Unit!20153)

(assert (=> b!290216 (= lt!420929 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12636 lt!420934) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!420928 () (_ BitVec 32))

(declare-fun lt!420936 () (_ BitVec 32))

(assert (=> b!290216 (= lt!420932 (array!17226 (store (arr!8458 arr!273) lt!420936 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8458 arr!273) lt!420936)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!420928)))) ((_ sign_extend 24) (ite (_1!12636 lt!420934) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!420928) #b00000000))))) (size!7456 arr!273)))))

(assert (=> b!290216 (= lt!420928 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!290216 (= lt!420936 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!12922) tuple2!22786)

(assert (=> b!290216 (= lt!420934 (readBit!0 thiss!1728))))

(declare-fun b!290217 () Bool)

(declare-fun res!239762 () Bool)

(assert (=> b!290217 (=> (not res!239762) (not e!206669))))

(assert (=> b!290217 (= res!239762 (bvslt from!505 to!474))))

(assert (= (and start!64636 res!239764) b!290214))

(assert (= (and b!290214 res!239763) b!290217))

(assert (= (and b!290217 res!239762) b!290216))

(assert (= (and b!290216 res!239765) b!290213))

(assert (= start!64636 b!290215))

(declare-fun m!424015 () Bool)

(assert (=> b!290214 m!424015))

(declare-fun m!424017 () Bool)

(assert (=> start!64636 m!424017))

(declare-fun m!424019 () Bool)

(assert (=> start!64636 m!424019))

(declare-fun m!424021 () Bool)

(assert (=> b!290215 m!424021))

(declare-fun m!424023 () Bool)

(assert (=> b!290216 m!424023))

(declare-fun m!424025 () Bool)

(assert (=> b!290216 m!424025))

(declare-fun m!424027 () Bool)

(assert (=> b!290216 m!424027))

(declare-fun m!424029 () Bool)

(assert (=> b!290216 m!424029))

(declare-fun m!424031 () Bool)

(assert (=> b!290216 m!424031))

(declare-fun m!424033 () Bool)

(assert (=> b!290216 m!424033))

(declare-fun m!424035 () Bool)

(assert (=> b!290216 m!424035))

(declare-fun m!424037 () Bool)

(assert (=> b!290216 m!424037))

(declare-fun m!424039 () Bool)

(assert (=> b!290216 m!424039))

(declare-fun m!424041 () Bool)

(assert (=> b!290216 m!424041))

(declare-fun m!424043 () Bool)

(assert (=> b!290216 m!424043))

(declare-fun m!424045 () Bool)

(assert (=> b!290216 m!424045))

(declare-fun m!424047 () Bool)

(assert (=> b!290216 m!424047))

(declare-fun m!424049 () Bool)

(assert (=> b!290216 m!424049))

(declare-fun m!424051 () Bool)

(assert (=> b!290216 m!424051))

(declare-fun m!424053 () Bool)

(assert (=> b!290216 m!424053))

(push 1)

(assert (not b!290215))

(assert (not b!290216))

(assert (not start!64636))

(assert (not b!290214))

(check-sat)

(pop 1)

(push 1)

(check-sat)

