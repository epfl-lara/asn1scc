; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65710 () Bool)

(assert start!65710)

(declare-fun b!294686 () Bool)

(declare-fun e!210647 () Bool)

(declare-fun from!505 () (_ BitVec 64))

(assert (=> b!294686 (= e!210647 (not (or (not (= (bvand from!505 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (bvand from!505 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((array!17642 0))(
  ( (array!17643 (arr!8683 (Array (_ BitVec 32) (_ BitVec 8))) (size!7645 (_ BitVec 32))) )
))
(declare-fun arr!273 () array!17642)

(declare-datatypes ((BitStream!13294 0))(
  ( (BitStream!13295 (buf!7708 array!17642) (currentByte!14205 (_ BitVec 32)) (currentBit!14200 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!20527 0))(
  ( (Unit!20528) )
))
(declare-datatypes ((tuple3!1806 0))(
  ( (tuple3!1807 (_1!12929 Unit!20527) (_2!12929 BitStream!13294) (_3!1341 array!17642)) )
))
(declare-fun lt!428138 () tuple3!1806)

(declare-fun arrayBitRangesEq!0 (array!17642 array!17642 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!294686 (arrayBitRangesEq!0 arr!273 (_3!1341 lt!428138) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!428137 () array!17642)

(declare-fun lt!428140 () Unit!20527)

(declare-fun arrayBitRangesEqTransitive!0 (array!17642 array!17642 array!17642 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20527)

(assert (=> b!294686 (= lt!428140 (arrayBitRangesEqTransitive!0 arr!273 lt!428137 (_3!1341 lt!428138) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!294686 (arrayBitRangesEq!0 arr!273 lt!428137 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!428139 () Unit!20527)

(declare-datatypes ((tuple2!23176 0))(
  ( (tuple2!23177 (_1!12930 Bool) (_2!12930 BitStream!13294)) )
))
(declare-fun lt!428136 () tuple2!23176)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17642 (_ BitVec 64) Bool) Unit!20527)

(assert (=> b!294686 (= lt!428139 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12930 lt!428136)))))

(declare-fun e!210648 () Bool)

(assert (=> b!294686 e!210648))

(declare-fun res!243329 () Bool)

(assert (=> b!294686 (=> (not res!243329) (not e!210648))))

(declare-fun thiss!1728 () BitStream!13294)

(declare-fun to!474 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!294686 (= res!243329 (= (bvsub (bvadd (bitIndex!0 (size!7645 (buf!7708 thiss!1728)) (currentByte!14205 thiss!1728) (currentBit!14200 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7645 (buf!7708 (_2!12929 lt!428138))) (currentByte!14205 (_2!12929 lt!428138)) (currentBit!14200 (_2!12929 lt!428138)))))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun readBitsLoop!0 (BitStream!13294 (_ BitVec 64) array!17642 (_ BitVec 64) (_ BitVec 64)) tuple3!1806)

(assert (=> b!294686 (= lt!428138 (readBitsLoop!0 (_2!12930 lt!428136) nBits!523 lt!428137 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!294686 (validate_offset_bits!1 ((_ sign_extend 32) (size!7645 (buf!7708 (_2!12930 lt!428136)))) ((_ sign_extend 32) (currentByte!14205 (_2!12930 lt!428136))) ((_ sign_extend 32) (currentBit!14200 (_2!12930 lt!428136))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!428141 () Unit!20527)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!13294 BitStream!13294 (_ BitVec 64) (_ BitVec 64)) Unit!20527)

(assert (=> b!294686 (= lt!428141 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12930 lt!428136) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!428142 () (_ BitVec 32))

(declare-fun lt!428135 () (_ BitVec 32))

(assert (=> b!294686 (= lt!428137 (array!17643 (store (arr!8683 arr!273) lt!428135 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8683 arr!273) lt!428135)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!428142)))) ((_ sign_extend 24) (ite (_1!12930 lt!428136) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!428142) #b00000000))))) (size!7645 arr!273)))))

(assert (=> b!294686 (= lt!428142 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!294686 (= lt!428135 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!13294) tuple2!23176)

(assert (=> b!294686 (= lt!428136 (readBit!0 thiss!1728))))

(declare-fun res!243326 () Bool)

(assert (=> start!65710 (=> (not res!243326) (not e!210647))))

(assert (=> start!65710 (= res!243326 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7645 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65710 e!210647))

(declare-fun e!210646 () Bool)

(declare-fun inv!12 (BitStream!13294) Bool)

(assert (=> start!65710 (and (inv!12 thiss!1728) e!210646)))

(assert (=> start!65710 true))

(declare-fun array_inv!7257 (array!17642) Bool)

(assert (=> start!65710 (array_inv!7257 arr!273)))

(declare-fun b!294687 () Bool)

(assert (=> b!294687 (= e!210646 (array_inv!7257 (buf!7708 thiss!1728)))))

(declare-fun b!294688 () Bool)

(declare-fun res!243327 () Bool)

(assert (=> b!294688 (=> (not res!243327) (not e!210647))))

(assert (=> b!294688 (= res!243327 (bvslt from!505 to!474))))

(declare-fun b!294689 () Bool)

(assert (=> b!294689 (= e!210648 (and (= (buf!7708 thiss!1728) (buf!7708 (_2!12929 lt!428138))) (= (size!7645 arr!273) (size!7645 (_3!1341 lt!428138)))))))

(declare-fun b!294690 () Bool)

(declare-fun res!243328 () Bool)

(assert (=> b!294690 (=> (not res!243328) (not e!210647))))

(assert (=> b!294690 (= res!243328 (validate_offset_bits!1 ((_ sign_extend 32) (size!7645 (buf!7708 thiss!1728))) ((_ sign_extend 32) (currentByte!14205 thiss!1728)) ((_ sign_extend 32) (currentBit!14200 thiss!1728)) (bvsub nBits!523 from!505)))))

(assert (= (and start!65710 res!243326) b!294690))

(assert (= (and b!294690 res!243328) b!294688))

(assert (= (and b!294688 res!243327) b!294686))

(assert (= (and b!294686 res!243329) b!294689))

(assert (= start!65710 b!294687))

(declare-fun m!431179 () Bool)

(assert (=> b!294686 m!431179))

(declare-fun m!431181 () Bool)

(assert (=> b!294686 m!431181))

(declare-fun m!431183 () Bool)

(assert (=> b!294686 m!431183))

(declare-fun m!431185 () Bool)

(assert (=> b!294686 m!431185))

(declare-fun m!431187 () Bool)

(assert (=> b!294686 m!431187))

(declare-fun m!431189 () Bool)

(assert (=> b!294686 m!431189))

(declare-fun m!431191 () Bool)

(assert (=> b!294686 m!431191))

(declare-fun m!431193 () Bool)

(assert (=> b!294686 m!431193))

(declare-fun m!431195 () Bool)

(assert (=> b!294686 m!431195))

(declare-fun m!431197 () Bool)

(assert (=> b!294686 m!431197))

(declare-fun m!431199 () Bool)

(assert (=> b!294686 m!431199))

(declare-fun m!431201 () Bool)

(assert (=> b!294686 m!431201))

(declare-fun m!431203 () Bool)

(assert (=> b!294686 m!431203))

(declare-fun m!431205 () Bool)

(assert (=> start!65710 m!431205))

(declare-fun m!431207 () Bool)

(assert (=> start!65710 m!431207))

(declare-fun m!431209 () Bool)

(assert (=> b!294687 m!431209))

(declare-fun m!431211 () Bool)

(assert (=> b!294690 m!431211))

(push 1)

(assert (not b!294687))

(assert (not start!65710))

(assert (not b!294690))

(assert (not b!294686))

(check-sat)

(pop 1)

(push 1)

(check-sat)

