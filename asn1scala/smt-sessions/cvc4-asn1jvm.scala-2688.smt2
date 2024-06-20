; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65732 () Bool)

(assert start!65732)

(declare-fun b!294851 () Bool)

(declare-fun res!243460 () Bool)

(declare-fun e!210813 () Bool)

(assert (=> b!294851 (=> (not res!243460) (not e!210813))))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!294851 (= res!243460 (bvslt from!505 to!474))))

(declare-fun b!294852 () Bool)

(declare-fun res!243458 () Bool)

(assert (=> b!294852 (=> (not res!243458) (not e!210813))))

(declare-datatypes ((array!17664 0))(
  ( (array!17665 (arr!8694 (Array (_ BitVec 32) (_ BitVec 8))) (size!7656 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13316 0))(
  ( (BitStream!13317 (buf!7719 array!17664) (currentByte!14216 (_ BitVec 32)) (currentBit!14211 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13316)

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!294852 (= res!243458 (validate_offset_bits!1 ((_ sign_extend 32) (size!7656 (buf!7719 thiss!1728))) ((_ sign_extend 32) (currentByte!14216 thiss!1728)) ((_ sign_extend 32) (currentBit!14211 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun res!243461 () Bool)

(assert (=> start!65732 (=> (not res!243461) (not e!210813))))

(declare-fun arr!273 () array!17664)

(assert (=> start!65732 (= res!243461 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7656 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65732 e!210813))

(declare-fun e!210812 () Bool)

(declare-fun inv!12 (BitStream!13316) Bool)

(assert (=> start!65732 (and (inv!12 thiss!1728) e!210812)))

(assert (=> start!65732 true))

(declare-fun array_inv!7268 (array!17664) Bool)

(assert (=> start!65732 (array_inv!7268 arr!273)))

(declare-fun b!294853 () Bool)

(assert (=> b!294853 (= e!210812 (array_inv!7268 (buf!7719 thiss!1728)))))

(declare-fun e!210809 () Bool)

(declare-fun b!294854 () Bool)

(declare-datatypes ((Unit!20549 0))(
  ( (Unit!20550) )
))
(declare-datatypes ((tuple3!1828 0))(
  ( (tuple3!1829 (_1!12951 Unit!20549) (_2!12951 BitStream!13316) (_3!1352 array!17664)) )
))
(declare-fun lt!428403 () tuple3!1828)

(assert (=> b!294854 (= e!210809 (and (= (buf!7719 thiss!1728) (buf!7719 (_2!12951 lt!428403))) (= (size!7656 arr!273) (size!7656 (_3!1352 lt!428403)))))))

(declare-fun b!294855 () Bool)

(assert (=> b!294855 (= e!210813 (not (or (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (bvsle (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7656 arr!273)))))))))

(declare-fun arrayBitRangesEq!0 (array!17664 array!17664 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!294855 (arrayBitRangesEq!0 arr!273 (_3!1352 lt!428403) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!428400 () Unit!20549)

(declare-fun lt!428402 () array!17664)

(declare-fun arrayBitRangesEqTransitive!0 (array!17664 array!17664 array!17664 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20549)

(assert (=> b!294855 (= lt!428400 (arrayBitRangesEqTransitive!0 arr!273 lt!428402 (_3!1352 lt!428403) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!294855 (arrayBitRangesEq!0 arr!273 lt!428402 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-datatypes ((tuple2!23198 0))(
  ( (tuple2!23199 (_1!12952 Bool) (_2!12952 BitStream!13316)) )
))
(declare-fun lt!428404 () tuple2!23198)

(declare-fun lt!428405 () Unit!20549)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17664 (_ BitVec 64) Bool) Unit!20549)

(assert (=> b!294855 (= lt!428405 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12952 lt!428404)))))

(assert (=> b!294855 e!210809))

(declare-fun res!243459 () Bool)

(assert (=> b!294855 (=> (not res!243459) (not e!210809))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!294855 (= res!243459 (= (bvsub (bvadd (bitIndex!0 (size!7656 (buf!7719 thiss!1728)) (currentByte!14216 thiss!1728) (currentBit!14211 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7656 (buf!7719 (_2!12951 lt!428403))) (currentByte!14216 (_2!12951 lt!428403)) (currentBit!14211 (_2!12951 lt!428403)))))))

(declare-fun readBitsLoop!0 (BitStream!13316 (_ BitVec 64) array!17664 (_ BitVec 64) (_ BitVec 64)) tuple3!1828)

(assert (=> b!294855 (= lt!428403 (readBitsLoop!0 (_2!12952 lt!428404) nBits!523 lt!428402 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> b!294855 (validate_offset_bits!1 ((_ sign_extend 32) (size!7656 (buf!7719 (_2!12952 lt!428404)))) ((_ sign_extend 32) (currentByte!14216 (_2!12952 lt!428404))) ((_ sign_extend 32) (currentBit!14211 (_2!12952 lt!428404))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!428399 () Unit!20549)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!13316 BitStream!13316 (_ BitVec 64) (_ BitVec 64)) Unit!20549)

(assert (=> b!294855 (= lt!428399 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12952 lt!428404) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!428401 () (_ BitVec 32))

(declare-fun lt!428406 () (_ BitVec 32))

(assert (=> b!294855 (= lt!428402 (array!17665 (store (arr!8694 arr!273) lt!428401 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8694 arr!273) lt!428401)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!428406)))) ((_ sign_extend 24) (ite (_1!12952 lt!428404) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!428406) #b00000000))))) (size!7656 arr!273)))))

(assert (=> b!294855 (= lt!428406 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!294855 (= lt!428401 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!13316) tuple2!23198)

(assert (=> b!294855 (= lt!428404 (readBit!0 thiss!1728))))

(assert (= (and start!65732 res!243461) b!294852))

(assert (= (and b!294852 res!243458) b!294851))

(assert (= (and b!294851 res!243460) b!294855))

(assert (= (and b!294855 res!243459) b!294854))

(assert (= start!65732 b!294853))

(declare-fun m!431553 () Bool)

(assert (=> b!294852 m!431553))

(declare-fun m!431555 () Bool)

(assert (=> start!65732 m!431555))

(declare-fun m!431557 () Bool)

(assert (=> start!65732 m!431557))

(declare-fun m!431559 () Bool)

(assert (=> b!294853 m!431559))

(declare-fun m!431561 () Bool)

(assert (=> b!294855 m!431561))

(declare-fun m!431563 () Bool)

(assert (=> b!294855 m!431563))

(declare-fun m!431565 () Bool)

(assert (=> b!294855 m!431565))

(declare-fun m!431567 () Bool)

(assert (=> b!294855 m!431567))

(declare-fun m!431569 () Bool)

(assert (=> b!294855 m!431569))

(declare-fun m!431571 () Bool)

(assert (=> b!294855 m!431571))

(declare-fun m!431573 () Bool)

(assert (=> b!294855 m!431573))

(declare-fun m!431575 () Bool)

(assert (=> b!294855 m!431575))

(declare-fun m!431577 () Bool)

(assert (=> b!294855 m!431577))

(declare-fun m!431579 () Bool)

(assert (=> b!294855 m!431579))

(declare-fun m!431581 () Bool)

(assert (=> b!294855 m!431581))

(declare-fun m!431583 () Bool)

(assert (=> b!294855 m!431583))

(declare-fun m!431585 () Bool)

(assert (=> b!294855 m!431585))

(push 1)

(assert (not b!294855))

(assert (not b!294853))

(assert (not start!65732))

(assert (not b!294852))

(check-sat)

(pop 1)

(push 1)

(check-sat)

