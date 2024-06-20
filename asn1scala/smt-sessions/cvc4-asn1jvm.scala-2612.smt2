; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64592 () Bool)

(assert start!64592)

(declare-fun b!289883 () Bool)

(declare-fun e!206339 () Bool)

(declare-datatypes ((array!17181 0))(
  ( (array!17182 (arr!8436 (Array (_ BitVec 32) (_ BitVec 8))) (size!7434 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12878 0))(
  ( (BitStream!12879 (buf!7500 array!17181) (currentByte!13907 (_ BitVec 32)) (currentBit!13902 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!12878)

(declare-fun array_inv!7046 (array!17181) Bool)

(assert (=> b!289883 (= e!206339 (array_inv!7046 (buf!7500 thiss!1728)))))

(declare-fun b!289884 () Bool)

(declare-fun res!239499 () Bool)

(declare-fun e!206343 () Bool)

(assert (=> b!289884 (=> (not res!239499) (not e!206343))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!289884 (= res!239499 (validate_offset_bits!1 ((_ sign_extend 32) (size!7434 (buf!7500 thiss!1728))) ((_ sign_extend 32) (currentByte!13907 thiss!1728)) ((_ sign_extend 32) (currentBit!13902 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun res!239501 () Bool)

(assert (=> start!64592 (=> (not res!239501) (not e!206343))))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun arr!273 () array!17181)

(assert (=> start!64592 (= res!239501 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7434 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!64592 e!206343))

(declare-fun inv!12 (BitStream!12878) Bool)

(assert (=> start!64592 (and (inv!12 thiss!1728) e!206339)))

(assert (=> start!64592 true))

(assert (=> start!64592 (array_inv!7046 arr!273)))

(declare-fun b!289885 () Bool)

(assert (=> b!289885 (= e!206343 (not true))))

(declare-datatypes ((Unit!20109 0))(
  ( (Unit!20110) )
))
(declare-datatypes ((tuple3!1612 0))(
  ( (tuple3!1613 (_1!12591 Unit!20109) (_2!12591 BitStream!12878) (_3!1220 array!17181)) )
))
(declare-fun lt!420390 () tuple3!1612)

(declare-fun arrayBitRangesEq!0 (array!17181 array!17181 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!289885 (arrayBitRangesEq!0 arr!273 (_3!1220 lt!420390) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!420395 () array!17181)

(declare-fun lt!420392 () Unit!20109)

(declare-fun arrayBitRangesEqTransitive!0 (array!17181 array!17181 array!17181 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20109)

(assert (=> b!289885 (= lt!420392 (arrayBitRangesEqTransitive!0 arr!273 lt!420395 (_3!1220 lt!420390) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!289885 (arrayBitRangesEq!0 arr!273 lt!420395 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!420394 () Unit!20109)

(declare-datatypes ((tuple2!22742 0))(
  ( (tuple2!22743 (_1!12592 Bool) (_2!12592 BitStream!12878)) )
))
(declare-fun lt!420389 () tuple2!22742)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17181 (_ BitVec 64) Bool) Unit!20109)

(assert (=> b!289885 (= lt!420394 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12592 lt!420389)))))

(declare-fun e!206342 () Bool)

(assert (=> b!289885 e!206342))

(declare-fun res!239500 () Bool)

(assert (=> b!289885 (=> (not res!239500) (not e!206342))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!289885 (= res!239500 (= (bvsub (bvadd (bitIndex!0 (size!7434 (buf!7500 thiss!1728)) (currentByte!13907 thiss!1728) (currentBit!13902 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7434 (buf!7500 (_2!12591 lt!420390))) (currentByte!13907 (_2!12591 lt!420390)) (currentBit!13902 (_2!12591 lt!420390)))))))

(declare-fun readBitsLoop!0 (BitStream!12878 (_ BitVec 64) array!17181 (_ BitVec 64) (_ BitVec 64)) tuple3!1612)

(assert (=> b!289885 (= lt!420390 (readBitsLoop!0 (_2!12592 lt!420389) nBits!523 lt!420395 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> b!289885 (validate_offset_bits!1 ((_ sign_extend 32) (size!7434 (buf!7500 (_2!12592 lt!420389)))) ((_ sign_extend 32) (currentByte!13907 (_2!12592 lt!420389))) ((_ sign_extend 32) (currentBit!13902 (_2!12592 lt!420389))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!420393 () Unit!20109)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!12878 BitStream!12878 (_ BitVec 64) (_ BitVec 64)) Unit!20109)

(assert (=> b!289885 (= lt!420393 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12592 lt!420389) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!420391 () (_ BitVec 32))

(declare-fun lt!420396 () (_ BitVec 32))

(assert (=> b!289885 (= lt!420395 (array!17182 (store (arr!8436 arr!273) lt!420396 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8436 arr!273) lt!420396)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!420391)))) ((_ sign_extend 24) (ite (_1!12592 lt!420389) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!420391) #b00000000))))) (size!7434 arr!273)))))

(assert (=> b!289885 (= lt!420391 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!289885 (= lt!420396 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!12878) tuple2!22742)

(assert (=> b!289885 (= lt!420389 (readBit!0 thiss!1728))))

(declare-fun b!289886 () Bool)

(declare-fun res!239498 () Bool)

(assert (=> b!289886 (=> (not res!239498) (not e!206343))))

(assert (=> b!289886 (= res!239498 (bvslt from!505 to!474))))

(declare-fun b!289887 () Bool)

(assert (=> b!289887 (= e!206342 (and (= (buf!7500 thiss!1728) (buf!7500 (_2!12591 lt!420390))) (= (size!7434 arr!273) (size!7434 (_3!1220 lt!420390)))))))

(assert (= (and start!64592 res!239501) b!289884))

(assert (= (and b!289884 res!239499) b!289886))

(assert (= (and b!289886 res!239498) b!289885))

(assert (= (and b!289885 res!239500) b!289887))

(assert (= start!64592 b!289883))

(declare-fun m!423249 () Bool)

(assert (=> b!289883 m!423249))

(declare-fun m!423251 () Bool)

(assert (=> b!289884 m!423251))

(declare-fun m!423253 () Bool)

(assert (=> start!64592 m!423253))

(declare-fun m!423255 () Bool)

(assert (=> start!64592 m!423255))

(declare-fun m!423257 () Bool)

(assert (=> b!289885 m!423257))

(declare-fun m!423259 () Bool)

(assert (=> b!289885 m!423259))

(declare-fun m!423261 () Bool)

(assert (=> b!289885 m!423261))

(declare-fun m!423263 () Bool)

(assert (=> b!289885 m!423263))

(declare-fun m!423265 () Bool)

(assert (=> b!289885 m!423265))

(declare-fun m!423267 () Bool)

(assert (=> b!289885 m!423267))

(declare-fun m!423269 () Bool)

(assert (=> b!289885 m!423269))

(declare-fun m!423271 () Bool)

(assert (=> b!289885 m!423271))

(declare-fun m!423273 () Bool)

(assert (=> b!289885 m!423273))

(declare-fun m!423275 () Bool)

(assert (=> b!289885 m!423275))

(declare-fun m!423277 () Bool)

(assert (=> b!289885 m!423277))

(declare-fun m!423279 () Bool)

(assert (=> b!289885 m!423279))

(declare-fun m!423281 () Bool)

(assert (=> b!289885 m!423281))

(push 1)

(assert (not b!289883))

(assert (not b!289885))

(assert (not start!64592))

(assert (not b!289884))

(check-sat)

(pop 1)

(push 1)

