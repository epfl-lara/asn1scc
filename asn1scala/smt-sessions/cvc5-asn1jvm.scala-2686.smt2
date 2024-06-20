; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65716 () Bool)

(assert start!65716)

(declare-fun b!294731 () Bool)

(declare-fun res!243363 () Bool)

(declare-fun e!210689 () Bool)

(assert (=> b!294731 (=> (not res!243363) (not e!210689))))

(declare-datatypes ((array!17648 0))(
  ( (array!17649 (arr!8686 (Array (_ BitVec 32) (_ BitVec 8))) (size!7648 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13300 0))(
  ( (BitStream!13301 (buf!7711 array!17648) (currentByte!14208 (_ BitVec 32)) (currentBit!14203 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13300)

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!294731 (= res!243363 (validate_offset_bits!1 ((_ sign_extend 32) (size!7648 (buf!7711 thiss!1728))) ((_ sign_extend 32) (currentByte!14208 thiss!1728)) ((_ sign_extend 32) (currentBit!14203 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!294732 () Bool)

(declare-fun res!243364 () Bool)

(assert (=> b!294732 (=> (not res!243364) (not e!210689))))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!294732 (= res!243364 (bvslt from!505 to!474))))

(declare-fun b!294733 () Bool)

(declare-fun e!210692 () Bool)

(declare-fun array_inv!7260 (array!17648) Bool)

(assert (=> b!294733 (= e!210692 (array_inv!7260 (buf!7711 thiss!1728)))))

(declare-fun b!294735 () Bool)

(assert (=> b!294735 (= e!210689 (not (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505))))))

(declare-fun arr!273 () array!17648)

(declare-datatypes ((Unit!20533 0))(
  ( (Unit!20534) )
))
(declare-datatypes ((tuple3!1812 0))(
  ( (tuple3!1813 (_1!12935 Unit!20533) (_2!12935 BitStream!13300) (_3!1344 array!17648)) )
))
(declare-fun lt!428209 () tuple3!1812)

(declare-fun arrayBitRangesEq!0 (array!17648 array!17648 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!294735 (arrayBitRangesEq!0 arr!273 (_3!1344 lt!428209) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!428213 () array!17648)

(declare-fun lt!428212 () Unit!20533)

(declare-fun arrayBitRangesEqTransitive!0 (array!17648 array!17648 array!17648 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20533)

(assert (=> b!294735 (= lt!428212 (arrayBitRangesEqTransitive!0 arr!273 lt!428213 (_3!1344 lt!428209) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!294735 (arrayBitRangesEq!0 arr!273 lt!428213 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!428214 () Unit!20533)

(declare-datatypes ((tuple2!23182 0))(
  ( (tuple2!23183 (_1!12936 Bool) (_2!12936 BitStream!13300)) )
))
(declare-fun lt!428210 () tuple2!23182)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17648 (_ BitVec 64) Bool) Unit!20533)

(assert (=> b!294735 (= lt!428214 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12936 lt!428210)))))

(declare-fun e!210691 () Bool)

(assert (=> b!294735 e!210691))

(declare-fun res!243362 () Bool)

(assert (=> b!294735 (=> (not res!243362) (not e!210691))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!294735 (= res!243362 (= (bvsub (bvadd (bitIndex!0 (size!7648 (buf!7711 thiss!1728)) (currentByte!14208 thiss!1728) (currentBit!14203 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7648 (buf!7711 (_2!12935 lt!428209))) (currentByte!14208 (_2!12935 lt!428209)) (currentBit!14203 (_2!12935 lt!428209)))))))

(declare-fun readBitsLoop!0 (BitStream!13300 (_ BitVec 64) array!17648 (_ BitVec 64) (_ BitVec 64)) tuple3!1812)

(assert (=> b!294735 (= lt!428209 (readBitsLoop!0 (_2!12936 lt!428210) nBits!523 lt!428213 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> b!294735 (validate_offset_bits!1 ((_ sign_extend 32) (size!7648 (buf!7711 (_2!12936 lt!428210)))) ((_ sign_extend 32) (currentByte!14208 (_2!12936 lt!428210))) ((_ sign_extend 32) (currentBit!14203 (_2!12936 lt!428210))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!428207 () Unit!20533)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!13300 BitStream!13300 (_ BitVec 64) (_ BitVec 64)) Unit!20533)

(assert (=> b!294735 (= lt!428207 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12936 lt!428210) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!428211 () (_ BitVec 32))

(declare-fun lt!428208 () (_ BitVec 32))

(assert (=> b!294735 (= lt!428213 (array!17649 (store (arr!8686 arr!273) lt!428208 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8686 arr!273) lt!428208)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!428211)))) ((_ sign_extend 24) (ite (_1!12936 lt!428210) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!428211) #b00000000))))) (size!7648 arr!273)))))

(assert (=> b!294735 (= lt!428211 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!294735 (= lt!428208 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!13300) tuple2!23182)

(assert (=> b!294735 (= lt!428210 (readBit!0 thiss!1728))))

(declare-fun b!294734 () Bool)

(assert (=> b!294734 (= e!210691 (and (= (buf!7711 thiss!1728) (buf!7711 (_2!12935 lt!428209))) (= (size!7648 arr!273) (size!7648 (_3!1344 lt!428209)))))))

(declare-fun res!243365 () Bool)

(assert (=> start!65716 (=> (not res!243365) (not e!210689))))

(assert (=> start!65716 (= res!243365 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7648 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65716 e!210689))

(declare-fun inv!12 (BitStream!13300) Bool)

(assert (=> start!65716 (and (inv!12 thiss!1728) e!210692)))

(assert (=> start!65716 true))

(assert (=> start!65716 (array_inv!7260 arr!273)))

(assert (= (and start!65716 res!243365) b!294731))

(assert (= (and b!294731 res!243363) b!294732))

(assert (= (and b!294732 res!243364) b!294735))

(assert (= (and b!294735 res!243362) b!294734))

(assert (= start!65716 b!294733))

(declare-fun m!431281 () Bool)

(assert (=> b!294731 m!431281))

(declare-fun m!431283 () Bool)

(assert (=> b!294733 m!431283))

(declare-fun m!431285 () Bool)

(assert (=> b!294735 m!431285))

(declare-fun m!431287 () Bool)

(assert (=> b!294735 m!431287))

(declare-fun m!431289 () Bool)

(assert (=> b!294735 m!431289))

(declare-fun m!431291 () Bool)

(assert (=> b!294735 m!431291))

(declare-fun m!431293 () Bool)

(assert (=> b!294735 m!431293))

(declare-fun m!431295 () Bool)

(assert (=> b!294735 m!431295))

(declare-fun m!431297 () Bool)

(assert (=> b!294735 m!431297))

(declare-fun m!431299 () Bool)

(assert (=> b!294735 m!431299))

(declare-fun m!431301 () Bool)

(assert (=> b!294735 m!431301))

(declare-fun m!431303 () Bool)

(assert (=> b!294735 m!431303))

(declare-fun m!431305 () Bool)

(assert (=> b!294735 m!431305))

(declare-fun m!431307 () Bool)

(assert (=> b!294735 m!431307))

(declare-fun m!431309 () Bool)

(assert (=> b!294735 m!431309))

(declare-fun m!431311 () Bool)

(assert (=> start!65716 m!431311))

(declare-fun m!431313 () Bool)

(assert (=> start!65716 m!431313))

(push 1)

(assert (not b!294731))

(assert (not b!294733))

(assert (not start!65716))

(assert (not b!294735))

(check-sat)

(pop 1)

(push 1)

(check-sat)

