; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65706 () Bool)

(assert start!65706)

(declare-fun b!294656 () Bool)

(declare-fun res!243303 () Bool)

(declare-fun e!210617 () Bool)

(assert (=> b!294656 (=> (not res!243303) (not e!210617))))

(declare-datatypes ((array!17638 0))(
  ( (array!17639 (arr!8681 (Array (_ BitVec 32) (_ BitVec 8))) (size!7643 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13290 0))(
  ( (BitStream!13291 (buf!7706 array!17638) (currentByte!14203 (_ BitVec 32)) (currentBit!14198 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13290)

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!294656 (= res!243303 (validate_offset_bits!1 ((_ sign_extend 32) (size!7643 (buf!7706 thiss!1728))) ((_ sign_extend 32) (currentByte!14203 thiss!1728)) ((_ sign_extend 32) (currentBit!14198 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!294657 () Bool)

(assert (=> b!294657 (= e!210617 (not true))))

(declare-fun arr!273 () array!17638)

(declare-datatypes ((Unit!20523 0))(
  ( (Unit!20524) )
))
(declare-datatypes ((tuple3!1802 0))(
  ( (tuple3!1803 (_1!12925 Unit!20523) (_2!12925 BitStream!13290) (_3!1339 array!17638)) )
))
(declare-fun lt!428094 () tuple3!1802)

(declare-fun arrayBitRangesEq!0 (array!17638 array!17638 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!294657 (arrayBitRangesEq!0 arr!273 (_3!1339 lt!428094) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!428093 () Unit!20523)

(declare-fun lt!428092 () array!17638)

(declare-fun arrayBitRangesEqTransitive!0 (array!17638 array!17638 array!17638 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20523)

(assert (=> b!294657 (= lt!428093 (arrayBitRangesEqTransitive!0 arr!273 lt!428092 (_3!1339 lt!428094) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!294657 (arrayBitRangesEq!0 arr!273 lt!428092 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-datatypes ((tuple2!23172 0))(
  ( (tuple2!23173 (_1!12926 Bool) (_2!12926 BitStream!13290)) )
))
(declare-fun lt!428087 () tuple2!23172)

(declare-fun lt!428089 () Unit!20523)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17638 (_ BitVec 64) Bool) Unit!20523)

(assert (=> b!294657 (= lt!428089 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12926 lt!428087)))))

(declare-fun e!210618 () Bool)

(assert (=> b!294657 e!210618))

(declare-fun res!243304 () Bool)

(assert (=> b!294657 (=> (not res!243304) (not e!210618))))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!294657 (= res!243304 (= (bvsub (bvadd (bitIndex!0 (size!7643 (buf!7706 thiss!1728)) (currentByte!14203 thiss!1728) (currentBit!14198 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7643 (buf!7706 (_2!12925 lt!428094))) (currentByte!14203 (_2!12925 lt!428094)) (currentBit!14198 (_2!12925 lt!428094)))))))

(declare-fun readBitsLoop!0 (BitStream!13290 (_ BitVec 64) array!17638 (_ BitVec 64) (_ BitVec 64)) tuple3!1802)

(assert (=> b!294657 (= lt!428094 (readBitsLoop!0 (_2!12926 lt!428087) nBits!523 lt!428092 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> b!294657 (validate_offset_bits!1 ((_ sign_extend 32) (size!7643 (buf!7706 (_2!12926 lt!428087)))) ((_ sign_extend 32) (currentByte!14203 (_2!12926 lt!428087))) ((_ sign_extend 32) (currentBit!14198 (_2!12926 lt!428087))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!428090 () Unit!20523)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!13290 BitStream!13290 (_ BitVec 64) (_ BitVec 64)) Unit!20523)

(assert (=> b!294657 (= lt!428090 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12926 lt!428087) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!428088 () (_ BitVec 32))

(declare-fun lt!428091 () (_ BitVec 32))

(assert (=> b!294657 (= lt!428092 (array!17639 (store (arr!8681 arr!273) lt!428091 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8681 arr!273) lt!428091)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!428088)))) ((_ sign_extend 24) (ite (_1!12926 lt!428087) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!428088) #b00000000))))) (size!7643 arr!273)))))

(assert (=> b!294657 (= lt!428088 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!294657 (= lt!428091 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!13290) tuple2!23172)

(assert (=> b!294657 (= lt!428087 (readBit!0 thiss!1728))))

(declare-fun b!294658 () Bool)

(declare-fun res!243305 () Bool)

(assert (=> b!294658 (=> (not res!243305) (not e!210617))))

(assert (=> b!294658 (= res!243305 (bvslt from!505 to!474))))

(declare-fun b!294660 () Bool)

(declare-fun e!210614 () Bool)

(declare-fun array_inv!7255 (array!17638) Bool)

(assert (=> b!294660 (= e!210614 (array_inv!7255 (buf!7706 thiss!1728)))))

(declare-fun res!243302 () Bool)

(assert (=> start!65706 (=> (not res!243302) (not e!210617))))

(assert (=> start!65706 (= res!243302 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7643 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65706 e!210617))

(declare-fun inv!12 (BitStream!13290) Bool)

(assert (=> start!65706 (and (inv!12 thiss!1728) e!210614)))

(assert (=> start!65706 true))

(assert (=> start!65706 (array_inv!7255 arr!273)))

(declare-fun b!294659 () Bool)

(assert (=> b!294659 (= e!210618 (and (= (buf!7706 thiss!1728) (buf!7706 (_2!12925 lt!428094))) (= (size!7643 arr!273) (size!7643 (_3!1339 lt!428094)))))))

(assert (= (and start!65706 res!243302) b!294656))

(assert (= (and b!294656 res!243303) b!294658))

(assert (= (and b!294658 res!243305) b!294657))

(assert (= (and b!294657 res!243304) b!294659))

(assert (= start!65706 b!294660))

(declare-fun m!431111 () Bool)

(assert (=> b!294656 m!431111))

(declare-fun m!431113 () Bool)

(assert (=> b!294657 m!431113))

(declare-fun m!431115 () Bool)

(assert (=> b!294657 m!431115))

(declare-fun m!431117 () Bool)

(assert (=> b!294657 m!431117))

(declare-fun m!431119 () Bool)

(assert (=> b!294657 m!431119))

(declare-fun m!431121 () Bool)

(assert (=> b!294657 m!431121))

(declare-fun m!431123 () Bool)

(assert (=> b!294657 m!431123))

(declare-fun m!431125 () Bool)

(assert (=> b!294657 m!431125))

(declare-fun m!431127 () Bool)

(assert (=> b!294657 m!431127))

(declare-fun m!431129 () Bool)

(assert (=> b!294657 m!431129))

(declare-fun m!431131 () Bool)

(assert (=> b!294657 m!431131))

(declare-fun m!431133 () Bool)

(assert (=> b!294657 m!431133))

(declare-fun m!431135 () Bool)

(assert (=> b!294657 m!431135))

(declare-fun m!431137 () Bool)

(assert (=> b!294657 m!431137))

(declare-fun m!431139 () Bool)

(assert (=> b!294660 m!431139))

(declare-fun m!431141 () Bool)

(assert (=> start!65706 m!431141))

(declare-fun m!431143 () Bool)

(assert (=> start!65706 m!431143))

(check-sat (not b!294660) (not b!294656) (not b!294657) (not start!65706))
