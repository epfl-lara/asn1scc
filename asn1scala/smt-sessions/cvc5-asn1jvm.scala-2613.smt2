; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64594 () Bool)

(assert start!64594)

(declare-fun res!239513 () Bool)

(declare-fun e!206358 () Bool)

(assert (=> start!64594 (=> (not res!239513) (not e!206358))))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-datatypes ((array!17183 0))(
  ( (array!17184 (arr!8437 (Array (_ BitVec 32) (_ BitVec 8))) (size!7435 (_ BitVec 32))) )
))
(declare-fun arr!273 () array!17183)

(declare-fun nBits!523 () (_ BitVec 64))

(assert (=> start!64594 (= res!239513 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7435 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!64594 e!206358))

(declare-datatypes ((BitStream!12880 0))(
  ( (BitStream!12881 (buf!7501 array!17183) (currentByte!13908 (_ BitVec 32)) (currentBit!13903 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!12880)

(declare-fun e!206356 () Bool)

(declare-fun inv!12 (BitStream!12880) Bool)

(assert (=> start!64594 (and (inv!12 thiss!1728) e!206356)))

(assert (=> start!64594 true))

(declare-fun array_inv!7047 (array!17183) Bool)

(assert (=> start!64594 (array_inv!7047 arr!273)))

(declare-fun b!289898 () Bool)

(assert (=> b!289898 (= e!206356 (array_inv!7047 (buf!7501 thiss!1728)))))

(declare-datatypes ((Unit!20111 0))(
  ( (Unit!20112) )
))
(declare-datatypes ((tuple3!1614 0))(
  ( (tuple3!1615 (_1!12593 Unit!20111) (_2!12593 BitStream!12880) (_3!1221 array!17183)) )
))
(declare-fun lt!420413 () tuple3!1614)

(declare-fun b!289899 () Bool)

(declare-fun e!206355 () Bool)

(assert (=> b!289899 (= e!206355 (and (= (buf!7501 thiss!1728) (buf!7501 (_2!12593 lt!420413))) (= (size!7435 arr!273) (size!7435 (_3!1221 lt!420413)))))))

(declare-fun b!289900 () Bool)

(assert (=> b!289900 (= e!206358 (not (bvsle from!505 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7435 arr!273))))))))

(declare-fun arrayBitRangesEq!0 (array!17183 array!17183 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!289900 (arrayBitRangesEq!0 arr!273 (_3!1221 lt!420413) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!420414 () array!17183)

(declare-fun lt!420420 () Unit!20111)

(declare-fun arrayBitRangesEqTransitive!0 (array!17183 array!17183 array!17183 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20111)

(assert (=> b!289900 (= lt!420420 (arrayBitRangesEqTransitive!0 arr!273 lt!420414 (_3!1221 lt!420413) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!289900 (arrayBitRangesEq!0 arr!273 lt!420414 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!420419 () Unit!20111)

(declare-datatypes ((tuple2!22744 0))(
  ( (tuple2!22745 (_1!12594 Bool) (_2!12594 BitStream!12880)) )
))
(declare-fun lt!420416 () tuple2!22744)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17183 (_ BitVec 64) Bool) Unit!20111)

(assert (=> b!289900 (= lt!420419 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12594 lt!420416)))))

(assert (=> b!289900 e!206355))

(declare-fun res!239510 () Bool)

(assert (=> b!289900 (=> (not res!239510) (not e!206355))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!289900 (= res!239510 (= (bvsub (bvadd (bitIndex!0 (size!7435 (buf!7501 thiss!1728)) (currentByte!13908 thiss!1728) (currentBit!13903 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7435 (buf!7501 (_2!12593 lt!420413))) (currentByte!13908 (_2!12593 lt!420413)) (currentBit!13903 (_2!12593 lt!420413)))))))

(declare-fun readBitsLoop!0 (BitStream!12880 (_ BitVec 64) array!17183 (_ BitVec 64) (_ BitVec 64)) tuple3!1614)

(assert (=> b!289900 (= lt!420413 (readBitsLoop!0 (_2!12594 lt!420416) nBits!523 lt!420414 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!289900 (validate_offset_bits!1 ((_ sign_extend 32) (size!7435 (buf!7501 (_2!12594 lt!420416)))) ((_ sign_extend 32) (currentByte!13908 (_2!12594 lt!420416))) ((_ sign_extend 32) (currentBit!13903 (_2!12594 lt!420416))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!420418 () Unit!20111)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!12880 BitStream!12880 (_ BitVec 64) (_ BitVec 64)) Unit!20111)

(assert (=> b!289900 (= lt!420418 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12594 lt!420416) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!420417 () (_ BitVec 32))

(declare-fun lt!420415 () (_ BitVec 32))

(assert (=> b!289900 (= lt!420414 (array!17184 (store (arr!8437 arr!273) lt!420415 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8437 arr!273) lt!420415)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!420417)))) ((_ sign_extend 24) (ite (_1!12594 lt!420416) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!420417) #b00000000))))) (size!7435 arr!273)))))

(assert (=> b!289900 (= lt!420417 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!289900 (= lt!420415 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!12880) tuple2!22744)

(assert (=> b!289900 (= lt!420416 (readBit!0 thiss!1728))))

(declare-fun b!289901 () Bool)

(declare-fun res!239511 () Bool)

(assert (=> b!289901 (=> (not res!239511) (not e!206358))))

(assert (=> b!289901 (= res!239511 (validate_offset_bits!1 ((_ sign_extend 32) (size!7435 (buf!7501 thiss!1728))) ((_ sign_extend 32) (currentByte!13908 thiss!1728)) ((_ sign_extend 32) (currentBit!13903 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!289902 () Bool)

(declare-fun res!239512 () Bool)

(assert (=> b!289902 (=> (not res!239512) (not e!206358))))

(assert (=> b!289902 (= res!239512 (bvslt from!505 to!474))))

(assert (= (and start!64594 res!239513) b!289901))

(assert (= (and b!289901 res!239511) b!289902))

(assert (= (and b!289902 res!239512) b!289900))

(assert (= (and b!289900 res!239510) b!289899))

(assert (= start!64594 b!289898))

(declare-fun m!423283 () Bool)

(assert (=> start!64594 m!423283))

(declare-fun m!423285 () Bool)

(assert (=> start!64594 m!423285))

(declare-fun m!423287 () Bool)

(assert (=> b!289898 m!423287))

(declare-fun m!423289 () Bool)

(assert (=> b!289900 m!423289))

(declare-fun m!423291 () Bool)

(assert (=> b!289900 m!423291))

(declare-fun m!423293 () Bool)

(assert (=> b!289900 m!423293))

(declare-fun m!423295 () Bool)

(assert (=> b!289900 m!423295))

(declare-fun m!423297 () Bool)

(assert (=> b!289900 m!423297))

(declare-fun m!423299 () Bool)

(assert (=> b!289900 m!423299))

(declare-fun m!423301 () Bool)

(assert (=> b!289900 m!423301))

(declare-fun m!423303 () Bool)

(assert (=> b!289900 m!423303))

(declare-fun m!423305 () Bool)

(assert (=> b!289900 m!423305))

(declare-fun m!423307 () Bool)

(assert (=> b!289900 m!423307))

(declare-fun m!423309 () Bool)

(assert (=> b!289900 m!423309))

(declare-fun m!423311 () Bool)

(assert (=> b!289900 m!423311))

(declare-fun m!423313 () Bool)

(assert (=> b!289900 m!423313))

(declare-fun m!423315 () Bool)

(assert (=> b!289901 m!423315))

(push 1)

(assert (not b!289901))

(assert (not b!289900))

(assert (not start!64594))

(assert (not b!289898))

(check-sat)

(pop 1)

(push 1)

(check-sat)

