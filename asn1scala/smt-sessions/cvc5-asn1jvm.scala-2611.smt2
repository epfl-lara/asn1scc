; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64582 () Bool)

(assert start!64582)

(declare-datatypes ((array!17171 0))(
  ( (array!17172 (arr!8431 (Array (_ BitVec 32) (_ BitVec 8))) (size!7429 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12868 0))(
  ( (BitStream!12869 (buf!7495 array!17171) (currentByte!13902 (_ BitVec 32)) (currentBit!13897 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!20099 0))(
  ( (Unit!20100) )
))
(declare-datatypes ((tuple3!1602 0))(
  ( (tuple3!1603 (_1!12581 Unit!20099) (_2!12581 BitStream!12868) (_3!1215 array!17171)) )
))
(declare-fun lt!420279 () tuple3!1602)

(declare-fun e!206264 () Bool)

(declare-fun arr!273 () array!17171)

(declare-fun b!289808 () Bool)

(declare-fun thiss!1728 () BitStream!12868)

(assert (=> b!289808 (= e!206264 (and (= (buf!7495 thiss!1728) (buf!7495 (_2!12581 lt!420279))) (= (size!7429 arr!273) (size!7429 (_3!1215 lt!420279)))))))

(declare-fun res!239439 () Bool)

(declare-fun e!206266 () Bool)

(assert (=> start!64582 (=> (not res!239439) (not e!206266))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(assert (=> start!64582 (= res!239439 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7429 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!64582 e!206266))

(declare-fun e!206265 () Bool)

(declare-fun inv!12 (BitStream!12868) Bool)

(assert (=> start!64582 (and (inv!12 thiss!1728) e!206265)))

(assert (=> start!64582 true))

(declare-fun array_inv!7041 (array!17171) Bool)

(assert (=> start!64582 (array_inv!7041 arr!273)))

(declare-fun b!289809 () Bool)

(declare-fun res!239440 () Bool)

(assert (=> b!289809 (=> (not res!239440) (not e!206266))))

(assert (=> b!289809 (= res!239440 (bvslt from!505 to!474))))

(declare-fun b!289810 () Bool)

(declare-fun res!239441 () Bool)

(assert (=> b!289810 (=> (not res!239441) (not e!206266))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!289810 (= res!239441 (validate_offset_bits!1 ((_ sign_extend 32) (size!7429 (buf!7495 thiss!1728))) ((_ sign_extend 32) (currentByte!13902 thiss!1728)) ((_ sign_extend 32) (currentBit!13897 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!289811 () Bool)

(assert (=> b!289811 (= e!206266 (not true))))

(declare-fun lt!420281 () array!17171)

(declare-fun arrayBitRangesEq!0 (array!17171 array!17171 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!289811 (arrayBitRangesEq!0 arr!273 lt!420281 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!420282 () Unit!20099)

(declare-datatypes ((tuple2!22732 0))(
  ( (tuple2!22733 (_1!12582 Bool) (_2!12582 BitStream!12868)) )
))
(declare-fun lt!420276 () tuple2!22732)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17171 (_ BitVec 64) Bool) Unit!20099)

(assert (=> b!289811 (= lt!420282 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12582 lt!420276)))))

(assert (=> b!289811 e!206264))

(declare-fun res!239438 () Bool)

(assert (=> b!289811 (=> (not res!239438) (not e!206264))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!289811 (= res!239438 (= (bvsub (bvadd (bitIndex!0 (size!7429 (buf!7495 thiss!1728)) (currentByte!13902 thiss!1728) (currentBit!13897 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7429 (buf!7495 (_2!12581 lt!420279))) (currentByte!13902 (_2!12581 lt!420279)) (currentBit!13897 (_2!12581 lt!420279)))))))

(declare-fun readBitsLoop!0 (BitStream!12868 (_ BitVec 64) array!17171 (_ BitVec 64) (_ BitVec 64)) tuple3!1602)

(assert (=> b!289811 (= lt!420279 (readBitsLoop!0 (_2!12582 lt!420276) nBits!523 lt!420281 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> b!289811 (validate_offset_bits!1 ((_ sign_extend 32) (size!7429 (buf!7495 (_2!12582 lt!420276)))) ((_ sign_extend 32) (currentByte!13902 (_2!12582 lt!420276))) ((_ sign_extend 32) (currentBit!13897 (_2!12582 lt!420276))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!420277 () Unit!20099)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!12868 BitStream!12868 (_ BitVec 64) (_ BitVec 64)) Unit!20099)

(assert (=> b!289811 (= lt!420277 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12582 lt!420276) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!420278 () (_ BitVec 32))

(declare-fun lt!420280 () (_ BitVec 32))

(assert (=> b!289811 (= lt!420281 (array!17172 (store (arr!8431 arr!273) lt!420278 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8431 arr!273) lt!420278)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!420280)))) ((_ sign_extend 24) (ite (_1!12582 lt!420276) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!420280) #b00000000))))) (size!7429 arr!273)))))

(assert (=> b!289811 (= lt!420280 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!289811 (= lt!420278 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!12868) tuple2!22732)

(assert (=> b!289811 (= lt!420276 (readBit!0 thiss!1728))))

(declare-fun b!289812 () Bool)

(assert (=> b!289812 (= e!206265 (array_inv!7041 (buf!7495 thiss!1728)))))

(assert (= (and start!64582 res!239439) b!289810))

(assert (= (and b!289810 res!239441) b!289809))

(assert (= (and b!289809 res!239440) b!289811))

(assert (= (and b!289811 res!239438) b!289808))

(assert (= start!64582 b!289812))

(declare-fun m!423091 () Bool)

(assert (=> start!64582 m!423091))

(declare-fun m!423093 () Bool)

(assert (=> start!64582 m!423093))

(declare-fun m!423095 () Bool)

(assert (=> b!289810 m!423095))

(declare-fun m!423097 () Bool)

(assert (=> b!289811 m!423097))

(declare-fun m!423099 () Bool)

(assert (=> b!289811 m!423099))

(declare-fun m!423101 () Bool)

(assert (=> b!289811 m!423101))

(declare-fun m!423103 () Bool)

(assert (=> b!289811 m!423103))

(declare-fun m!423105 () Bool)

(assert (=> b!289811 m!423105))

(declare-fun m!423107 () Bool)

(assert (=> b!289811 m!423107))

(declare-fun m!423109 () Bool)

(assert (=> b!289811 m!423109))

(declare-fun m!423111 () Bool)

(assert (=> b!289811 m!423111))

(declare-fun m!423113 () Bool)

(assert (=> b!289811 m!423113))

(declare-fun m!423115 () Bool)

(assert (=> b!289811 m!423115))

(declare-fun m!423117 () Bool)

(assert (=> b!289811 m!423117))

(declare-fun m!423119 () Bool)

(assert (=> b!289812 m!423119))

(push 1)

(assert (not start!64582))

(assert (not b!289812))

(assert (not b!289811))

(assert (not b!289810))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

