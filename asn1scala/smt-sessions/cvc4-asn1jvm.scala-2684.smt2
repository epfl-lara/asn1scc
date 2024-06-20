; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65708 () Bool)

(assert start!65708)

(declare-fun b!294671 () Bool)

(declare-fun e!210630 () Bool)

(declare-datatypes ((array!17640 0))(
  ( (array!17641 (arr!8682 (Array (_ BitVec 32) (_ BitVec 8))) (size!7644 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13292 0))(
  ( (BitStream!13293 (buf!7707 array!17640) (currentByte!14204 (_ BitVec 32)) (currentBit!14199 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13292)

(declare-fun array_inv!7256 (array!17640) Bool)

(assert (=> b!294671 (= e!210630 (array_inv!7256 (buf!7707 thiss!1728)))))

(declare-fun b!294672 () Bool)

(declare-fun res!243314 () Bool)

(declare-fun e!210631 () Bool)

(assert (=> b!294672 (=> (not res!243314) (not e!210631))))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!294672 (= res!243314 (bvslt from!505 to!474))))

(declare-fun b!294673 () Bool)

(assert (=> b!294673 (= e!210631 (not true))))

(declare-fun arr!273 () array!17640)

(declare-datatypes ((Unit!20525 0))(
  ( (Unit!20526) )
))
(declare-datatypes ((tuple3!1804 0))(
  ( (tuple3!1805 (_1!12927 Unit!20525) (_2!12927 BitStream!13292) (_3!1340 array!17640)) )
))
(declare-fun lt!428117 () tuple3!1804)

(declare-fun arrayBitRangesEq!0 (array!17640 array!17640 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!294673 (arrayBitRangesEq!0 arr!273 (_3!1340 lt!428117) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!428118 () array!17640)

(declare-fun lt!428112 () Unit!20525)

(declare-fun arrayBitRangesEqTransitive!0 (array!17640 array!17640 array!17640 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20525)

(assert (=> b!294673 (= lt!428112 (arrayBitRangesEqTransitive!0 arr!273 lt!428118 (_3!1340 lt!428117) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!294673 (arrayBitRangesEq!0 arr!273 lt!428118 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!428114 () Unit!20525)

(declare-datatypes ((tuple2!23174 0))(
  ( (tuple2!23175 (_1!12928 Bool) (_2!12928 BitStream!13292)) )
))
(declare-fun lt!428116 () tuple2!23174)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17640 (_ BitVec 64) Bool) Unit!20525)

(assert (=> b!294673 (= lt!428114 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12928 lt!428116)))))

(declare-fun e!210632 () Bool)

(assert (=> b!294673 e!210632))

(declare-fun res!243316 () Bool)

(assert (=> b!294673 (=> (not res!243316) (not e!210632))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!294673 (= res!243316 (= (bvsub (bvadd (bitIndex!0 (size!7644 (buf!7707 thiss!1728)) (currentByte!14204 thiss!1728) (currentBit!14199 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7644 (buf!7707 (_2!12927 lt!428117))) (currentByte!14204 (_2!12927 lt!428117)) (currentBit!14199 (_2!12927 lt!428117)))))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun readBitsLoop!0 (BitStream!13292 (_ BitVec 64) array!17640 (_ BitVec 64) (_ BitVec 64)) tuple3!1804)

(assert (=> b!294673 (= lt!428117 (readBitsLoop!0 (_2!12928 lt!428116) nBits!523 lt!428118 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!294673 (validate_offset_bits!1 ((_ sign_extend 32) (size!7644 (buf!7707 (_2!12928 lt!428116)))) ((_ sign_extend 32) (currentByte!14204 (_2!12928 lt!428116))) ((_ sign_extend 32) (currentBit!14199 (_2!12928 lt!428116))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!428113 () Unit!20525)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!13292 BitStream!13292 (_ BitVec 64) (_ BitVec 64)) Unit!20525)

(assert (=> b!294673 (= lt!428113 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12928 lt!428116) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!428111 () (_ BitVec 32))

(declare-fun lt!428115 () (_ BitVec 32))

(assert (=> b!294673 (= lt!428118 (array!17641 (store (arr!8682 arr!273) lt!428115 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8682 arr!273) lt!428115)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!428111)))) ((_ sign_extend 24) (ite (_1!12928 lt!428116) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!428111) #b00000000))))) (size!7644 arr!273)))))

(assert (=> b!294673 (= lt!428111 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!294673 (= lt!428115 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!13292) tuple2!23174)

(assert (=> b!294673 (= lt!428116 (readBit!0 thiss!1728))))

(declare-fun res!243317 () Bool)

(assert (=> start!65708 (=> (not res!243317) (not e!210631))))

(assert (=> start!65708 (= res!243317 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7644 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65708 e!210631))

(declare-fun inv!12 (BitStream!13292) Bool)

(assert (=> start!65708 (and (inv!12 thiss!1728) e!210630)))

(assert (=> start!65708 true))

(assert (=> start!65708 (array_inv!7256 arr!273)))

(declare-fun b!294674 () Bool)

(assert (=> b!294674 (= e!210632 (and (= (buf!7707 thiss!1728) (buf!7707 (_2!12927 lt!428117))) (= (size!7644 arr!273) (size!7644 (_3!1340 lt!428117)))))))

(declare-fun b!294675 () Bool)

(declare-fun res!243315 () Bool)

(assert (=> b!294675 (=> (not res!243315) (not e!210631))))

(assert (=> b!294675 (= res!243315 (validate_offset_bits!1 ((_ sign_extend 32) (size!7644 (buf!7707 thiss!1728))) ((_ sign_extend 32) (currentByte!14204 thiss!1728)) ((_ sign_extend 32) (currentBit!14199 thiss!1728)) (bvsub nBits!523 from!505)))))

(assert (= (and start!65708 res!243317) b!294675))

(assert (= (and b!294675 res!243315) b!294672))

(assert (= (and b!294672 res!243314) b!294673))

(assert (= (and b!294673 res!243316) b!294674))

(assert (= start!65708 b!294671))

(declare-fun m!431145 () Bool)

(assert (=> b!294671 m!431145))

(declare-fun m!431147 () Bool)

(assert (=> b!294673 m!431147))

(declare-fun m!431149 () Bool)

(assert (=> b!294673 m!431149))

(declare-fun m!431151 () Bool)

(assert (=> b!294673 m!431151))

(declare-fun m!431153 () Bool)

(assert (=> b!294673 m!431153))

(declare-fun m!431155 () Bool)

(assert (=> b!294673 m!431155))

(declare-fun m!431157 () Bool)

(assert (=> b!294673 m!431157))

(declare-fun m!431159 () Bool)

(assert (=> b!294673 m!431159))

(declare-fun m!431161 () Bool)

(assert (=> b!294673 m!431161))

(declare-fun m!431163 () Bool)

(assert (=> b!294673 m!431163))

(declare-fun m!431165 () Bool)

(assert (=> b!294673 m!431165))

(declare-fun m!431167 () Bool)

(assert (=> b!294673 m!431167))

(declare-fun m!431169 () Bool)

(assert (=> b!294673 m!431169))

(declare-fun m!431171 () Bool)

(assert (=> b!294673 m!431171))

(declare-fun m!431173 () Bool)

(assert (=> start!65708 m!431173))

(declare-fun m!431175 () Bool)

(assert (=> start!65708 m!431175))

(declare-fun m!431177 () Bool)

(assert (=> b!294675 m!431177))

(push 1)

(assert (not b!294673))

(assert (not start!65708))

(assert (not b!294675))

(assert (not b!294671))

(check-sat)

(pop 1)

