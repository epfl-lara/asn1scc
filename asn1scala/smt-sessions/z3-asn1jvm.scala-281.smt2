; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5668 () Bool)

(assert start!5668)

(declare-fun res!20377 () Bool)

(declare-fun e!16049 () Bool)

(assert (=> start!5668 (=> (not res!20377) (not e!16049))))

(declare-datatypes ((array!1591 0))(
  ( (array!1592 (arr!1137 (Array (_ BitVec 32) (_ BitVec 8))) (size!681 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!1591)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!5668 (= res!20377 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!681 srcBuffer!2))))))))

(assert (=> start!5668 e!16049))

(assert (=> start!5668 true))

(declare-fun array_inv!650 (array!1591) Bool)

(assert (=> start!5668 (array_inv!650 srcBuffer!2)))

(declare-datatypes ((BitStream!1194 0))(
  ( (BitStream!1195 (buf!1002 array!1591) (currentByte!2315 (_ BitVec 32)) (currentBit!2310 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1194)

(declare-fun e!16052 () Bool)

(declare-fun inv!12 (BitStream!1194) Bool)

(assert (=> start!5668 (and (inv!12 thiss!1379) e!16052)))

(declare-fun b!23664 () Bool)

(declare-fun e!16053 () Bool)

(assert (=> b!23664 (= e!16053 true)))

(declare-datatypes ((tuple2!2706 0))(
  ( (tuple2!2707 (_1!1440 BitStream!1194) (_2!1440 BitStream!1194)) )
))
(declare-fun lt!34168 () tuple2!2706)

(declare-datatypes ((Unit!2005 0))(
  ( (Unit!2006) )
))
(declare-datatypes ((tuple2!2708 0))(
  ( (tuple2!2709 (_1!1441 Unit!2005) (_2!1441 BitStream!1194)) )
))
(declare-fun lt!34171 () tuple2!2708)

(declare-fun lt!34176 () tuple2!2708)

(declare-fun reader!0 (BitStream!1194 BitStream!1194) tuple2!2706)

(assert (=> b!23664 (= lt!34168 (reader!0 (_2!1441 lt!34171) (_2!1441 lt!34176)))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!23664 (validate_offset_bits!1 ((_ sign_extend 32) (size!681 (buf!1002 (_2!1441 lt!34176)))) ((_ sign_extend 32) (currentByte!2315 thiss!1379)) ((_ sign_extend 32) (currentBit!2310 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!34173 () Unit!2005)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1194 array!1591 (_ BitVec 64)) Unit!2005)

(assert (=> b!23664 (= lt!34173 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1002 (_2!1441 lt!34176)) (bvsub to!314 i!635)))))

(declare-fun lt!34175 () tuple2!2706)

(assert (=> b!23664 (= lt!34175 (reader!0 thiss!1379 (_2!1441 lt!34176)))))

(declare-fun b!23665 () Bool)

(declare-fun e!16054 () Bool)

(declare-fun e!16051 () Bool)

(assert (=> b!23665 (= e!16054 e!16051)))

(declare-fun res!20375 () Bool)

(assert (=> b!23665 (=> res!20375 e!16051)))

(declare-fun isPrefixOf!0 (BitStream!1194 BitStream!1194) Bool)

(assert (=> b!23665 (= res!20375 (not (isPrefixOf!0 thiss!1379 (_2!1441 lt!34171))))))

(assert (=> b!23665 (validate_offset_bits!1 ((_ sign_extend 32) (size!681 (buf!1002 (_2!1441 lt!34171)))) ((_ sign_extend 32) (currentByte!2315 (_2!1441 lt!34171))) ((_ sign_extend 32) (currentBit!2310 (_2!1441 lt!34171))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!34174 () Unit!2005)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1194 BitStream!1194 (_ BitVec 64) (_ BitVec 64)) Unit!2005)

(assert (=> b!23665 (= lt!34174 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1441 lt!34171) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1194 (_ BitVec 8) (_ BitVec 32)) tuple2!2708)

(assert (=> b!23665 (= lt!34171 (appendBitFromByte!0 thiss!1379 (select (arr!1137 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!23666 () Bool)

(declare-fun res!20379 () Bool)

(declare-fun e!16050 () Bool)

(assert (=> b!23666 (=> res!20379 e!16050)))

(assert (=> b!23666 (= res!20379 (not (= (size!681 (buf!1002 thiss!1379)) (size!681 (buf!1002 (_2!1441 lt!34176))))))))

(declare-fun b!23667 () Bool)

(assert (=> b!23667 (= e!16049 (not e!16054))))

(declare-fun res!20370 () Bool)

(assert (=> b!23667 (=> res!20370 e!16054)))

(assert (=> b!23667 (= res!20370 (bvsge i!635 to!314))))

(assert (=> b!23667 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!34170 () Unit!2005)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1194) Unit!2005)

(assert (=> b!23667 (= lt!34170 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!34172 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!23667 (= lt!34172 (bitIndex!0 (size!681 (buf!1002 thiss!1379)) (currentByte!2315 thiss!1379) (currentBit!2310 thiss!1379)))))

(declare-fun b!23668 () Bool)

(assert (=> b!23668 (= e!16052 (array_inv!650 (buf!1002 thiss!1379)))))

(declare-fun b!23669 () Bool)

(declare-fun e!16044 () Bool)

(assert (=> b!23669 (= e!16044 e!16050)))

(declare-fun res!20376 () Bool)

(assert (=> b!23669 (=> res!20376 e!16050)))

(declare-fun lt!34167 () (_ BitVec 64))

(assert (=> b!23669 (= res!20376 (not (= lt!34167 (bvsub (bvadd lt!34172 to!314) i!635))))))

(assert (=> b!23669 (= lt!34167 (bitIndex!0 (size!681 (buf!1002 (_2!1441 lt!34176))) (currentByte!2315 (_2!1441 lt!34176)) (currentBit!2310 (_2!1441 lt!34176))))))

(declare-fun b!23670 () Bool)

(declare-fun res!20371 () Bool)

(assert (=> b!23670 (=> res!20371 e!16050)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!23670 (= res!20371 (not (invariant!0 (currentBit!2310 (_2!1441 lt!34176)) (currentByte!2315 (_2!1441 lt!34176)) (size!681 (buf!1002 (_2!1441 lt!34176))))))))

(declare-fun b!23671 () Bool)

(assert (=> b!23671 (= e!16051 e!16044)))

(declare-fun res!20381 () Bool)

(assert (=> b!23671 (=> res!20381 e!16044)))

(assert (=> b!23671 (= res!20381 (not (isPrefixOf!0 (_2!1441 lt!34171) (_2!1441 lt!34176))))))

(assert (=> b!23671 (isPrefixOf!0 thiss!1379 (_2!1441 lt!34176))))

(declare-fun lt!34166 () Unit!2005)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1194 BitStream!1194 BitStream!1194) Unit!2005)

(assert (=> b!23671 (= lt!34166 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1441 lt!34171) (_2!1441 lt!34176)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1194 array!1591 (_ BitVec 64) (_ BitVec 64)) tuple2!2708)

(assert (=> b!23671 (= lt!34176 (appendBitsMSBFirstLoop!0 (_2!1441 lt!34171) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!16046 () Bool)

(assert (=> b!23671 e!16046))

(declare-fun res!20378 () Bool)

(assert (=> b!23671 (=> (not res!20378) (not e!16046))))

(assert (=> b!23671 (= res!20378 (validate_offset_bits!1 ((_ sign_extend 32) (size!681 (buf!1002 (_2!1441 lt!34171)))) ((_ sign_extend 32) (currentByte!2315 thiss!1379)) ((_ sign_extend 32) (currentBit!2310 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!34169 () Unit!2005)

(assert (=> b!23671 (= lt!34169 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1002 (_2!1441 lt!34171)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!34177 () tuple2!2706)

(assert (=> b!23671 (= lt!34177 (reader!0 thiss!1379 (_2!1441 lt!34171)))))

(declare-fun b!23672 () Bool)

(declare-datatypes ((List!298 0))(
  ( (Nil!295) (Cons!294 (h!413 Bool) (t!1048 List!298)) )
))
(declare-fun head!135 (List!298) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1194 array!1591 (_ BitVec 64) (_ BitVec 64)) List!298)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1194 BitStream!1194 (_ BitVec 64)) List!298)

(assert (=> b!23672 (= e!16046 (= (head!135 (byteArrayBitContentToList!0 (_2!1441 lt!34171) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!135 (bitStreamReadBitsIntoList!0 (_2!1441 lt!34171) (_1!1440 lt!34177) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!23673 () Bool)

(declare-fun res!20382 () Bool)

(assert (=> b!23673 (=> res!20382 e!16053)))

(assert (=> b!23673 (= res!20382 (not (invariant!0 (currentBit!2310 (_2!1441 lt!34171)) (currentByte!2315 (_2!1441 lt!34171)) (size!681 (buf!1002 (_2!1441 lt!34176))))))))

(declare-fun b!23674 () Bool)

(declare-fun res!20372 () Bool)

(assert (=> b!23674 (=> (not res!20372) (not e!16049))))

(assert (=> b!23674 (= res!20372 (validate_offset_bits!1 ((_ sign_extend 32) (size!681 (buf!1002 thiss!1379))) ((_ sign_extend 32) (currentByte!2315 thiss!1379)) ((_ sign_extend 32) (currentBit!2310 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!23675 () Bool)

(assert (=> b!23675 (= e!16050 e!16053)))

(declare-fun res!20373 () Bool)

(assert (=> b!23675 (=> res!20373 e!16053)))

(assert (=> b!23675 (= res!20373 (not (= (size!681 (buf!1002 (_2!1441 lt!34171))) (size!681 (buf!1002 (_2!1441 lt!34176))))))))

(declare-fun e!16048 () Bool)

(assert (=> b!23675 e!16048))

(declare-fun res!20374 () Bool)

(assert (=> b!23675 (=> (not res!20374) (not e!16048))))

(assert (=> b!23675 (= res!20374 (= (size!681 (buf!1002 (_2!1441 lt!34176))) (size!681 (buf!1002 thiss!1379))))))

(declare-fun b!23676 () Bool)

(assert (=> b!23676 (= e!16048 (= lt!34167 (bvsub (bvsub (bvadd (bitIndex!0 (size!681 (buf!1002 (_2!1441 lt!34171))) (currentByte!2315 (_2!1441 lt!34171)) (currentBit!2310 (_2!1441 lt!34171))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!23677 () Bool)

(declare-fun res!20380 () Bool)

(assert (=> b!23677 (=> res!20380 e!16053)))

(assert (=> b!23677 (= res!20380 (not (invariant!0 (currentBit!2310 (_2!1441 lt!34171)) (currentByte!2315 (_2!1441 lt!34171)) (size!681 (buf!1002 (_2!1441 lt!34171))))))))

(assert (= (and start!5668 res!20377) b!23674))

(assert (= (and b!23674 res!20372) b!23667))

(assert (= (and b!23667 (not res!20370)) b!23665))

(assert (= (and b!23665 (not res!20375)) b!23671))

(assert (= (and b!23671 res!20378) b!23672))

(assert (= (and b!23671 (not res!20381)) b!23669))

(assert (= (and b!23669 (not res!20376)) b!23670))

(assert (= (and b!23670 (not res!20371)) b!23666))

(assert (= (and b!23666 (not res!20379)) b!23675))

(assert (= (and b!23675 res!20374) b!23676))

(assert (= (and b!23675 (not res!20373)) b!23677))

(assert (= (and b!23677 (not res!20380)) b!23673))

(assert (= (and b!23673 (not res!20382)) b!23664))

(assert (= start!5668 b!23668))

(declare-fun m!33277 () Bool)

(assert (=> b!23674 m!33277))

(declare-fun m!33279 () Bool)

(assert (=> b!23669 m!33279))

(declare-fun m!33281 () Bool)

(assert (=> b!23677 m!33281))

(declare-fun m!33283 () Bool)

(assert (=> b!23664 m!33283))

(declare-fun m!33285 () Bool)

(assert (=> b!23664 m!33285))

(declare-fun m!33287 () Bool)

(assert (=> b!23664 m!33287))

(declare-fun m!33289 () Bool)

(assert (=> b!23664 m!33289))

(declare-fun m!33291 () Bool)

(assert (=> b!23673 m!33291))

(declare-fun m!33293 () Bool)

(assert (=> b!23670 m!33293))

(declare-fun m!33295 () Bool)

(assert (=> b!23667 m!33295))

(declare-fun m!33297 () Bool)

(assert (=> b!23667 m!33297))

(declare-fun m!33299 () Bool)

(assert (=> b!23667 m!33299))

(declare-fun m!33301 () Bool)

(assert (=> b!23676 m!33301))

(declare-fun m!33303 () Bool)

(assert (=> b!23672 m!33303))

(assert (=> b!23672 m!33303))

(declare-fun m!33305 () Bool)

(assert (=> b!23672 m!33305))

(declare-fun m!33307 () Bool)

(assert (=> b!23672 m!33307))

(assert (=> b!23672 m!33307))

(declare-fun m!33309 () Bool)

(assert (=> b!23672 m!33309))

(declare-fun m!33311 () Bool)

(assert (=> start!5668 m!33311))

(declare-fun m!33313 () Bool)

(assert (=> start!5668 m!33313))

(declare-fun m!33315 () Bool)

(assert (=> b!23671 m!33315))

(declare-fun m!33317 () Bool)

(assert (=> b!23671 m!33317))

(declare-fun m!33319 () Bool)

(assert (=> b!23671 m!33319))

(declare-fun m!33321 () Bool)

(assert (=> b!23671 m!33321))

(declare-fun m!33323 () Bool)

(assert (=> b!23671 m!33323))

(declare-fun m!33325 () Bool)

(assert (=> b!23671 m!33325))

(declare-fun m!33327 () Bool)

(assert (=> b!23671 m!33327))

(declare-fun m!33329 () Bool)

(assert (=> b!23665 m!33329))

(declare-fun m!33331 () Bool)

(assert (=> b!23665 m!33331))

(declare-fun m!33333 () Bool)

(assert (=> b!23665 m!33333))

(assert (=> b!23665 m!33329))

(declare-fun m!33335 () Bool)

(assert (=> b!23665 m!33335))

(declare-fun m!33337 () Bool)

(assert (=> b!23665 m!33337))

(declare-fun m!33339 () Bool)

(assert (=> b!23668 m!33339))

(check-sat (not b!23665) (not b!23672) (not b!23668) (not b!23673) (not b!23667) (not b!23670) (not b!23674) (not b!23671) (not b!23664) (not b!23669) (not b!23676) (not b!23677) (not start!5668))
