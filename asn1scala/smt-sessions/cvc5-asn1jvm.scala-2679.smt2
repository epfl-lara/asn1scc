; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65620 () Bool)

(assert start!65620)

(declare-fun b!294179 () Bool)

(declare-fun res!242918 () Bool)

(declare-fun e!210199 () Bool)

(assert (=> b!294179 (=> (not res!242918) (not e!210199))))

(declare-datatypes ((array!17603 0))(
  ( (array!17604 (arr!8662 (Array (_ BitVec 32) (_ BitVec 8))) (size!7627 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13258 0))(
  ( (BitStream!13259 (buf!7690 array!17603) (currentByte!14181 (_ BitVec 32)) (currentBit!14176 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13258)

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!294179 (= res!242918 (validate_offset_bits!1 ((_ sign_extend 32) (size!7627 (buf!7690 thiss!1728))) ((_ sign_extend 32) (currentByte!14181 thiss!1728)) ((_ sign_extend 32) (currentBit!14176 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!294180 () Bool)

(assert (=> b!294180 (= e!210199 (not (bvsle from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505))))))

(declare-fun arr!273 () array!17603)

(declare-fun lt!427197 () array!17603)

(declare-fun arrayBitRangesEq!0 (array!17603 array!17603 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!294180 (arrayBitRangesEq!0 arr!273 lt!427197 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-datatypes ((tuple2!23128 0))(
  ( (tuple2!23129 (_1!12884 Bool) (_2!12884 BitStream!13258)) )
))
(declare-fun lt!427202 () tuple2!23128)

(declare-datatypes ((Unit!20479 0))(
  ( (Unit!20480) )
))
(declare-fun lt!427199 () Unit!20479)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17603 (_ BitVec 64) Bool) Unit!20479)

(assert (=> b!294180 (= lt!427199 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12884 lt!427202)))))

(declare-fun e!210198 () Bool)

(assert (=> b!294180 e!210198))

(declare-fun res!242919 () Bool)

(assert (=> b!294180 (=> (not res!242919) (not e!210198))))

(declare-datatypes ((tuple3!1770 0))(
  ( (tuple3!1771 (_1!12885 Unit!20479) (_2!12885 BitStream!13258) (_3!1320 array!17603)) )
))
(declare-fun lt!427203 () tuple3!1770)

(declare-fun to!474 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!294180 (= res!242919 (= (bvsub (bvadd (bitIndex!0 (size!7627 (buf!7690 thiss!1728)) (currentByte!14181 thiss!1728) (currentBit!14176 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7627 (buf!7690 (_2!12885 lt!427203))) (currentByte!14181 (_2!12885 lt!427203)) (currentBit!14176 (_2!12885 lt!427203)))))))

(declare-fun readBitsLoop!0 (BitStream!13258 (_ BitVec 64) array!17603 (_ BitVec 64) (_ BitVec 64)) tuple3!1770)

(assert (=> b!294180 (= lt!427203 (readBitsLoop!0 (_2!12884 lt!427202) nBits!523 lt!427197 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> b!294180 (validate_offset_bits!1 ((_ sign_extend 32) (size!7627 (buf!7690 (_2!12884 lt!427202)))) ((_ sign_extend 32) (currentByte!14181 (_2!12884 lt!427202))) ((_ sign_extend 32) (currentBit!14176 (_2!12884 lt!427202))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!427200 () Unit!20479)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!13258 BitStream!13258 (_ BitVec 64) (_ BitVec 64)) Unit!20479)

(assert (=> b!294180 (= lt!427200 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12884 lt!427202) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!427198 () (_ BitVec 32))

(declare-fun lt!427201 () (_ BitVec 32))

(assert (=> b!294180 (= lt!427197 (array!17604 (store (arr!8662 arr!273) lt!427198 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8662 arr!273) lt!427198)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!427201)))) ((_ sign_extend 24) (ite (_1!12884 lt!427202) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!427201) #b00000000))))) (size!7627 arr!273)))))

(assert (=> b!294180 (= lt!427201 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!294180 (= lt!427198 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!13258) tuple2!23128)

(assert (=> b!294180 (= lt!427202 (readBit!0 thiss!1728))))

(declare-fun res!242920 () Bool)

(assert (=> start!65620 (=> (not res!242920) (not e!210199))))

(assert (=> start!65620 (= res!242920 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7627 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65620 e!210199))

(declare-fun e!210201 () Bool)

(declare-fun inv!12 (BitStream!13258) Bool)

(assert (=> start!65620 (and (inv!12 thiss!1728) e!210201)))

(assert (=> start!65620 true))

(declare-fun array_inv!7239 (array!17603) Bool)

(assert (=> start!65620 (array_inv!7239 arr!273)))

(declare-fun b!294181 () Bool)

(assert (=> b!294181 (= e!210201 (array_inv!7239 (buf!7690 thiss!1728)))))

(declare-fun b!294182 () Bool)

(assert (=> b!294182 (= e!210198 (and (= (buf!7690 thiss!1728) (buf!7690 (_2!12885 lt!427203))) (= (size!7627 arr!273) (size!7627 (_3!1320 lt!427203)))))))

(declare-fun b!294183 () Bool)

(declare-fun res!242921 () Bool)

(assert (=> b!294183 (=> (not res!242921) (not e!210199))))

(assert (=> b!294183 (= res!242921 (bvslt from!505 to!474))))

(assert (= (and start!65620 res!242920) b!294179))

(assert (= (and b!294179 res!242918) b!294183))

(assert (= (and b!294183 res!242921) b!294180))

(assert (= (and b!294180 res!242919) b!294182))

(assert (= start!65620 b!294181))

(declare-fun m!430255 () Bool)

(assert (=> b!294179 m!430255))

(declare-fun m!430257 () Bool)

(assert (=> b!294180 m!430257))

(declare-fun m!430259 () Bool)

(assert (=> b!294180 m!430259))

(declare-fun m!430261 () Bool)

(assert (=> b!294180 m!430261))

(declare-fun m!430263 () Bool)

(assert (=> b!294180 m!430263))

(declare-fun m!430265 () Bool)

(assert (=> b!294180 m!430265))

(declare-fun m!430267 () Bool)

(assert (=> b!294180 m!430267))

(declare-fun m!430269 () Bool)

(assert (=> b!294180 m!430269))

(declare-fun m!430271 () Bool)

(assert (=> b!294180 m!430271))

(declare-fun m!430273 () Bool)

(assert (=> b!294180 m!430273))

(declare-fun m!430275 () Bool)

(assert (=> b!294180 m!430275))

(declare-fun m!430277 () Bool)

(assert (=> b!294180 m!430277))

(declare-fun m!430279 () Bool)

(assert (=> start!65620 m!430279))

(declare-fun m!430281 () Bool)

(assert (=> start!65620 m!430281))

(declare-fun m!430283 () Bool)

(assert (=> b!294181 m!430283))

(push 1)

(assert (not b!294179))

(assert (not start!65620))

(assert (not b!294180))

(assert (not b!294181))

(check-sat)

(pop 1)

(push 1)

(check-sat)

