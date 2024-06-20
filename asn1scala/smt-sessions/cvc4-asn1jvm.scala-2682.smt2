; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65642 () Bool)

(assert start!65642)

(declare-fun b!294344 () Bool)

(declare-datatypes ((array!17625 0))(
  ( (array!17626 (arr!8673 (Array (_ BitVec 32) (_ BitVec 8))) (size!7638 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13280 0))(
  ( (BitStream!13281 (buf!7701 array!17625) (currentByte!14192 (_ BitVec 32)) (currentBit!14187 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13280)

(declare-datatypes ((Unit!20501 0))(
  ( (Unit!20502) )
))
(declare-datatypes ((tuple3!1792 0))(
  ( (tuple3!1793 (_1!12906 Unit!20501) (_2!12906 BitStream!13280) (_3!1331 array!17625)) )
))
(declare-fun lt!427428 () tuple3!1792)

(declare-fun e!210364 () Bool)

(declare-fun arr!273 () array!17625)

(assert (=> b!294344 (= e!210364 (and (= (buf!7701 thiss!1728) (buf!7701 (_2!12906 lt!427428))) (= (size!7638 arr!273) (size!7638 (_3!1331 lt!427428)))))))

(declare-fun b!294345 () Bool)

(declare-fun e!210363 () Bool)

(assert (=> b!294345 (= e!210363 (not true))))

(declare-fun lt!427431 () array!17625)

(declare-fun from!505 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!17625 array!17625 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!294345 (arrayBitRangesEq!0 arr!273 lt!427431 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-datatypes ((tuple2!23150 0))(
  ( (tuple2!23151 (_1!12907 Bool) (_2!12907 BitStream!13280)) )
))
(declare-fun lt!427433 () tuple2!23150)

(declare-fun lt!427434 () Unit!20501)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17625 (_ BitVec 64) Bool) Unit!20501)

(assert (=> b!294345 (= lt!427434 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12907 lt!427433)))))

(assert (=> b!294345 e!210364))

(declare-fun res!243052 () Bool)

(assert (=> b!294345 (=> (not res!243052) (not e!210364))))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!294345 (= res!243052 (= (bvsub (bvadd (bitIndex!0 (size!7638 (buf!7701 thiss!1728)) (currentByte!14192 thiss!1728) (currentBit!14187 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7638 (buf!7701 (_2!12906 lt!427428))) (currentByte!14192 (_2!12906 lt!427428)) (currentBit!14187 (_2!12906 lt!427428)))))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun readBitsLoop!0 (BitStream!13280 (_ BitVec 64) array!17625 (_ BitVec 64) (_ BitVec 64)) tuple3!1792)

(assert (=> b!294345 (= lt!427428 (readBitsLoop!0 (_2!12907 lt!427433) nBits!523 lt!427431 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!294345 (validate_offset_bits!1 ((_ sign_extend 32) (size!7638 (buf!7701 (_2!12907 lt!427433)))) ((_ sign_extend 32) (currentByte!14192 (_2!12907 lt!427433))) ((_ sign_extend 32) (currentBit!14187 (_2!12907 lt!427433))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!427430 () Unit!20501)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!13280 BitStream!13280 (_ BitVec 64) (_ BitVec 64)) Unit!20501)

(assert (=> b!294345 (= lt!427430 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12907 lt!427433) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!427432 () (_ BitVec 32))

(declare-fun lt!427429 () (_ BitVec 32))

(assert (=> b!294345 (= lt!427431 (array!17626 (store (arr!8673 arr!273) lt!427432 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8673 arr!273) lt!427432)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!427429)))) ((_ sign_extend 24) (ite (_1!12907 lt!427433) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!427429) #b00000000))))) (size!7638 arr!273)))))

(assert (=> b!294345 (= lt!427429 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!294345 (= lt!427432 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!13280) tuple2!23150)

(assert (=> b!294345 (= lt!427433 (readBit!0 thiss!1728))))

(declare-fun b!294346 () Bool)

(declare-fun res!243053 () Bool)

(assert (=> b!294346 (=> (not res!243053) (not e!210363))))

(assert (=> b!294346 (= res!243053 (validate_offset_bits!1 ((_ sign_extend 32) (size!7638 (buf!7701 thiss!1728))) ((_ sign_extend 32) (currentByte!14192 thiss!1728)) ((_ sign_extend 32) (currentBit!14187 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!294347 () Bool)

(declare-fun res!243050 () Bool)

(assert (=> b!294347 (=> (not res!243050) (not e!210363))))

(assert (=> b!294347 (= res!243050 (bvslt from!505 to!474))))

(declare-fun res!243051 () Bool)

(assert (=> start!65642 (=> (not res!243051) (not e!210363))))

(assert (=> start!65642 (= res!243051 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7638 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65642 e!210363))

(declare-fun e!210365 () Bool)

(declare-fun inv!12 (BitStream!13280) Bool)

(assert (=> start!65642 (and (inv!12 thiss!1728) e!210365)))

(assert (=> start!65642 true))

(declare-fun array_inv!7250 (array!17625) Bool)

(assert (=> start!65642 (array_inv!7250 arr!273)))

(declare-fun b!294348 () Bool)

(assert (=> b!294348 (= e!210365 (array_inv!7250 (buf!7701 thiss!1728)))))

(assert (= (and start!65642 res!243051) b!294346))

(assert (= (and b!294346 res!243053) b!294347))

(assert (= (and b!294347 res!243050) b!294345))

(assert (= (and b!294345 res!243052) b!294344))

(assert (= start!65642 b!294348))

(declare-fun m!430585 () Bool)

(assert (=> b!294345 m!430585))

(declare-fun m!430587 () Bool)

(assert (=> b!294345 m!430587))

(declare-fun m!430589 () Bool)

(assert (=> b!294345 m!430589))

(declare-fun m!430591 () Bool)

(assert (=> b!294345 m!430591))

(declare-fun m!430593 () Bool)

(assert (=> b!294345 m!430593))

(declare-fun m!430595 () Bool)

(assert (=> b!294345 m!430595))

(declare-fun m!430597 () Bool)

(assert (=> b!294345 m!430597))

(declare-fun m!430599 () Bool)

(assert (=> b!294345 m!430599))

(declare-fun m!430601 () Bool)

(assert (=> b!294345 m!430601))

(declare-fun m!430603 () Bool)

(assert (=> b!294345 m!430603))

(declare-fun m!430605 () Bool)

(assert (=> b!294345 m!430605))

(declare-fun m!430607 () Bool)

(assert (=> b!294346 m!430607))

(declare-fun m!430609 () Bool)

(assert (=> start!65642 m!430609))

(declare-fun m!430611 () Bool)

(assert (=> start!65642 m!430611))

(declare-fun m!430613 () Bool)

(assert (=> b!294348 m!430613))

(push 1)

(assert (not b!294348))

(assert (not start!65642))

(assert (not b!294345))

(assert (not b!294346))

(check-sat)

(pop 1)

