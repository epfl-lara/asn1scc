; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65714 () Bool)

(assert start!65714)

(declare-fun b!294716 () Bool)

(declare-fun e!210675 () Bool)

(declare-datatypes ((array!17646 0))(
  ( (array!17647 (arr!8685 (Array (_ BitVec 32) (_ BitVec 8))) (size!7647 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13298 0))(
  ( (BitStream!13299 (buf!7710 array!17646) (currentByte!14207 (_ BitVec 32)) (currentBit!14202 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13298)

(declare-fun array_inv!7259 (array!17646) Bool)

(assert (=> b!294716 (= e!210675 (array_inv!7259 (buf!7710 thiss!1728)))))

(declare-fun e!210677 () Bool)

(declare-datatypes ((Unit!20531 0))(
  ( (Unit!20532) )
))
(declare-datatypes ((tuple3!1810 0))(
  ( (tuple3!1811 (_1!12933 Unit!20531) (_2!12933 BitStream!13298) (_3!1343 array!17646)) )
))
(declare-fun lt!428185 () tuple3!1810)

(declare-fun arr!273 () array!17646)

(declare-fun b!294717 () Bool)

(assert (=> b!294717 (= e!210677 (and (= (buf!7710 thiss!1728) (buf!7710 (_2!12933 lt!428185))) (= (size!7647 arr!273) (size!7647 (_3!1343 lt!428185)))))))

(declare-fun res!243352 () Bool)

(declare-fun e!210676 () Bool)

(assert (=> start!65714 (=> (not res!243352) (not e!210676))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(assert (=> start!65714 (= res!243352 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7647 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65714 e!210676))

(declare-fun inv!12 (BitStream!13298) Bool)

(assert (=> start!65714 (and (inv!12 thiss!1728) e!210675)))

(assert (=> start!65714 true))

(assert (=> start!65714 (array_inv!7259 arr!273)))

(declare-fun b!294718 () Bool)

(declare-fun res!243351 () Bool)

(assert (=> b!294718 (=> (not res!243351) (not e!210676))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!294718 (= res!243351 (validate_offset_bits!1 ((_ sign_extend 32) (size!7647 (buf!7710 thiss!1728))) ((_ sign_extend 32) (currentByte!14207 thiss!1728)) ((_ sign_extend 32) (currentBit!14202 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!294719 () Bool)

(assert (=> b!294719 (= e!210676 (not (or (not (= (bvand from!505 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (bvand from!505 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun arrayBitRangesEq!0 (array!17646 array!17646 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!294719 (arrayBitRangesEq!0 arr!273 (_3!1343 lt!428185) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!428189 () array!17646)

(declare-fun lt!428186 () Unit!20531)

(declare-fun arrayBitRangesEqTransitive!0 (array!17646 array!17646 array!17646 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20531)

(assert (=> b!294719 (= lt!428186 (arrayBitRangesEqTransitive!0 arr!273 lt!428189 (_3!1343 lt!428185) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!294719 (arrayBitRangesEq!0 arr!273 lt!428189 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!428184 () Unit!20531)

(declare-datatypes ((tuple2!23180 0))(
  ( (tuple2!23181 (_1!12934 Bool) (_2!12934 BitStream!13298)) )
))
(declare-fun lt!428190 () tuple2!23180)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17646 (_ BitVec 64) Bool) Unit!20531)

(assert (=> b!294719 (= lt!428184 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12934 lt!428190)))))

(assert (=> b!294719 e!210677))

(declare-fun res!243353 () Bool)

(assert (=> b!294719 (=> (not res!243353) (not e!210677))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!294719 (= res!243353 (= (bvsub (bvadd (bitIndex!0 (size!7647 (buf!7710 thiss!1728)) (currentByte!14207 thiss!1728) (currentBit!14202 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7647 (buf!7710 (_2!12933 lt!428185))) (currentByte!14207 (_2!12933 lt!428185)) (currentBit!14202 (_2!12933 lt!428185)))))))

(declare-fun readBitsLoop!0 (BitStream!13298 (_ BitVec 64) array!17646 (_ BitVec 64) (_ BitVec 64)) tuple3!1810)

(assert (=> b!294719 (= lt!428185 (readBitsLoop!0 (_2!12934 lt!428190) nBits!523 lt!428189 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> b!294719 (validate_offset_bits!1 ((_ sign_extend 32) (size!7647 (buf!7710 (_2!12934 lt!428190)))) ((_ sign_extend 32) (currentByte!14207 (_2!12934 lt!428190))) ((_ sign_extend 32) (currentBit!14202 (_2!12934 lt!428190))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!428188 () Unit!20531)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!13298 BitStream!13298 (_ BitVec 64) (_ BitVec 64)) Unit!20531)

(assert (=> b!294719 (= lt!428188 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12934 lt!428190) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!428187 () (_ BitVec 32))

(declare-fun lt!428183 () (_ BitVec 32))

(assert (=> b!294719 (= lt!428189 (array!17647 (store (arr!8685 arr!273) lt!428183 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8685 arr!273) lt!428183)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!428187)))) ((_ sign_extend 24) (ite (_1!12934 lt!428190) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!428187) #b00000000))))) (size!7647 arr!273)))))

(assert (=> b!294719 (= lt!428187 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!294719 (= lt!428183 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!13298) tuple2!23180)

(assert (=> b!294719 (= lt!428190 (readBit!0 thiss!1728))))

(declare-fun b!294720 () Bool)

(declare-fun res!243350 () Bool)

(assert (=> b!294720 (=> (not res!243350) (not e!210676))))

(assert (=> b!294720 (= res!243350 (bvslt from!505 to!474))))

(assert (= (and start!65714 res!243352) b!294718))

(assert (= (and b!294718 res!243351) b!294720))

(assert (= (and b!294720 res!243350) b!294719))

(assert (= (and b!294719 res!243353) b!294717))

(assert (= start!65714 b!294716))

(declare-fun m!431247 () Bool)

(assert (=> b!294716 m!431247))

(declare-fun m!431249 () Bool)

(assert (=> start!65714 m!431249))

(declare-fun m!431251 () Bool)

(assert (=> start!65714 m!431251))

(declare-fun m!431253 () Bool)

(assert (=> b!294718 m!431253))

(declare-fun m!431255 () Bool)

(assert (=> b!294719 m!431255))

(declare-fun m!431257 () Bool)

(assert (=> b!294719 m!431257))

(declare-fun m!431259 () Bool)

(assert (=> b!294719 m!431259))

(declare-fun m!431261 () Bool)

(assert (=> b!294719 m!431261))

(declare-fun m!431263 () Bool)

(assert (=> b!294719 m!431263))

(declare-fun m!431265 () Bool)

(assert (=> b!294719 m!431265))

(declare-fun m!431267 () Bool)

(assert (=> b!294719 m!431267))

(declare-fun m!431269 () Bool)

(assert (=> b!294719 m!431269))

(declare-fun m!431271 () Bool)

(assert (=> b!294719 m!431271))

(declare-fun m!431273 () Bool)

(assert (=> b!294719 m!431273))

(declare-fun m!431275 () Bool)

(assert (=> b!294719 m!431275))

(declare-fun m!431277 () Bool)

(assert (=> b!294719 m!431277))

(declare-fun m!431279 () Bool)

(assert (=> b!294719 m!431279))

(push 1)

(assert (not b!294718))

(assert (not start!65714))

(assert (not b!294719))

(assert (not b!294716))

(check-sat)

(pop 1)

(push 1)

(check-sat)

