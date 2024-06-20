; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5634 () Bool)

(assert start!5634)

(declare-fun res!19716 () Bool)

(declare-fun e!15489 () Bool)

(assert (=> start!5634 (=> (not res!19716) (not e!15489))))

(declare-datatypes ((array!1557 0))(
  ( (array!1558 (arr!1120 (Array (_ BitVec 32) (_ BitVec 8))) (size!664 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!1557)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!5634 (= res!19716 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!664 srcBuffer!2))))))))

(assert (=> start!5634 e!15489))

(assert (=> start!5634 true))

(declare-fun array_inv!633 (array!1557) Bool)

(assert (=> start!5634 (array_inv!633 srcBuffer!2)))

(declare-datatypes ((BitStream!1160 0))(
  ( (BitStream!1161 (buf!985 array!1557) (currentByte!2298 (_ BitVec 32)) (currentBit!2293 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1160)

(declare-fun e!15492 () Bool)

(declare-fun inv!12 (BitStream!1160) Bool)

(assert (=> start!5634 (and (inv!12 thiss!1379) e!15492)))

(declare-fun b!22953 () Bool)

(declare-fun e!15493 () Bool)

(assert (=> b!22953 (= e!15489 (not e!15493))))

(declare-fun res!19719 () Bool)

(assert (=> b!22953 (=> res!19719 e!15493)))

(assert (=> b!22953 (= res!19719 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!1160 BitStream!1160) Bool)

(assert (=> b!22953 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!1971 0))(
  ( (Unit!1972) )
))
(declare-fun lt!33623 () Unit!1971)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1160) Unit!1971)

(assert (=> b!22953 (= lt!33623 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!33626 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!22953 (= lt!33626 (bitIndex!0 (size!664 (buf!985 thiss!1379)) (currentByte!2298 thiss!1379) (currentBit!2293 thiss!1379)))))

(declare-fun b!22954 () Bool)

(declare-fun e!15487 () Bool)

(declare-fun e!15488 () Bool)

(assert (=> b!22954 (= e!15487 e!15488)))

(declare-fun res!19713 () Bool)

(assert (=> b!22954 (=> res!19713 e!15488)))

(declare-fun lt!33621 () (_ BitVec 64))

(assert (=> b!22954 (= res!19713 (not (= lt!33621 (bvsub (bvadd lt!33626 to!314) i!635))))))

(declare-datatypes ((tuple2!2638 0))(
  ( (tuple2!2639 (_1!1406 Unit!1971) (_2!1406 BitStream!1160)) )
))
(declare-fun lt!33624 () tuple2!2638)

(assert (=> b!22954 (= lt!33621 (bitIndex!0 (size!664 (buf!985 (_2!1406 lt!33624))) (currentByte!2298 (_2!1406 lt!33624)) (currentBit!2293 (_2!1406 lt!33624))))))

(declare-fun b!22955 () Bool)

(declare-fun e!15484 () Bool)

(assert (=> b!22955 (= e!15493 e!15484)))

(declare-fun res!19711 () Bool)

(assert (=> b!22955 (=> res!19711 e!15484)))

(declare-fun lt!33625 () tuple2!2638)

(assert (=> b!22955 (= res!19711 (not (isPrefixOf!0 thiss!1379 (_2!1406 lt!33625))))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!22955 (validate_offset_bits!1 ((_ sign_extend 32) (size!664 (buf!985 (_2!1406 lt!33625)))) ((_ sign_extend 32) (currentByte!2298 (_2!1406 lt!33625))) ((_ sign_extend 32) (currentBit!2293 (_2!1406 lt!33625))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!33628 () Unit!1971)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1160 BitStream!1160 (_ BitVec 64) (_ BitVec 64)) Unit!1971)

(assert (=> b!22955 (= lt!33628 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1406 lt!33625) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1160 (_ BitVec 8) (_ BitVec 32)) tuple2!2638)

(assert (=> b!22955 (= lt!33625 (appendBitFromByte!0 thiss!1379 (select (arr!1120 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-datatypes ((tuple2!2640 0))(
  ( (tuple2!2641 (_1!1407 BitStream!1160) (_2!1407 BitStream!1160)) )
))
(declare-fun lt!33627 () tuple2!2640)

(declare-fun b!22956 () Bool)

(declare-fun e!15490 () Bool)

(declare-datatypes ((List!281 0))(
  ( (Nil!278) (Cons!277 (h!396 Bool) (t!1031 List!281)) )
))
(declare-fun head!118 (List!281) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1160 array!1557 (_ BitVec 64) (_ BitVec 64)) List!281)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1160 BitStream!1160 (_ BitVec 64)) List!281)

(assert (=> b!22956 (= e!15490 (= (head!118 (byteArrayBitContentToList!0 (_2!1406 lt!33625) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!118 (bitStreamReadBitsIntoList!0 (_2!1406 lt!33625) (_1!1407 lt!33627) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!22957 () Bool)

(declare-fun res!19712 () Bool)

(assert (=> b!22957 (=> (not res!19712) (not e!15489))))

(assert (=> b!22957 (= res!19712 (validate_offset_bits!1 ((_ sign_extend 32) (size!664 (buf!985 thiss!1379))) ((_ sign_extend 32) (currentByte!2298 thiss!1379)) ((_ sign_extend 32) (currentBit!2293 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!22958 () Bool)

(declare-fun e!15485 () Bool)

(assert (=> b!22958 (= e!15485 (= lt!33621 (bvsub (bvsub (bvadd (bitIndex!0 (size!664 (buf!985 (_2!1406 lt!33625))) (currentByte!2298 (_2!1406 lt!33625)) (currentBit!2293 (_2!1406 lt!33625))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!22959 () Bool)

(declare-fun res!19717 () Bool)

(assert (=> b!22959 (=> res!19717 e!15488)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!22959 (= res!19717 (not (invariant!0 (currentBit!2293 (_2!1406 lt!33624)) (currentByte!2298 (_2!1406 lt!33624)) (size!664 (buf!985 (_2!1406 lt!33624))))))))

(declare-fun b!22960 () Bool)

(declare-fun res!19714 () Bool)

(assert (=> b!22960 (=> res!19714 e!15488)))

(assert (=> b!22960 (= res!19714 (not (= (size!664 (buf!985 thiss!1379)) (size!664 (buf!985 (_2!1406 lt!33624))))))))

(declare-fun b!22961 () Bool)

(assert (=> b!22961 (= e!15488 true)))

(assert (=> b!22961 e!15485))

(declare-fun res!19718 () Bool)

(assert (=> b!22961 (=> (not res!19718) (not e!15485))))

(assert (=> b!22961 (= res!19718 (= (size!664 (buf!985 (_2!1406 lt!33624))) (size!664 (buf!985 thiss!1379))))))

(declare-fun b!22962 () Bool)

(assert (=> b!22962 (= e!15484 e!15487)))

(declare-fun res!19715 () Bool)

(assert (=> b!22962 (=> res!19715 e!15487)))

(assert (=> b!22962 (= res!19715 (not (isPrefixOf!0 (_2!1406 lt!33625) (_2!1406 lt!33624))))))

(assert (=> b!22962 (isPrefixOf!0 thiss!1379 (_2!1406 lt!33624))))

(declare-fun lt!33622 () Unit!1971)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1160 BitStream!1160 BitStream!1160) Unit!1971)

(assert (=> b!22962 (= lt!33622 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1406 lt!33625) (_2!1406 lt!33624)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1160 array!1557 (_ BitVec 64) (_ BitVec 64)) tuple2!2638)

(assert (=> b!22962 (= lt!33624 (appendBitsMSBFirstLoop!0 (_2!1406 lt!33625) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!22962 e!15490))

(declare-fun res!19710 () Bool)

(assert (=> b!22962 (=> (not res!19710) (not e!15490))))

(assert (=> b!22962 (= res!19710 (validate_offset_bits!1 ((_ sign_extend 32) (size!664 (buf!985 (_2!1406 lt!33625)))) ((_ sign_extend 32) (currentByte!2298 thiss!1379)) ((_ sign_extend 32) (currentBit!2293 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!33620 () Unit!1971)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1160 array!1557 (_ BitVec 64)) Unit!1971)

(assert (=> b!22962 (= lt!33620 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!985 (_2!1406 lt!33625)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!1160 BitStream!1160) tuple2!2640)

(assert (=> b!22962 (= lt!33627 (reader!0 thiss!1379 (_2!1406 lt!33625)))))

(declare-fun b!22963 () Bool)

(assert (=> b!22963 (= e!15492 (array_inv!633 (buf!985 thiss!1379)))))

(assert (= (and start!5634 res!19716) b!22957))

(assert (= (and b!22957 res!19712) b!22953))

(assert (= (and b!22953 (not res!19719)) b!22955))

(assert (= (and b!22955 (not res!19711)) b!22962))

(assert (= (and b!22962 res!19710) b!22956))

(assert (= (and b!22962 (not res!19715)) b!22954))

(assert (= (and b!22954 (not res!19713)) b!22959))

(assert (= (and b!22959 (not res!19717)) b!22960))

(assert (= (and b!22960 (not res!19714)) b!22961))

(assert (= (and b!22961 res!19718) b!22958))

(assert (= start!5634 b!22963))

(declare-fun m!32261 () Bool)

(assert (=> b!22963 m!32261))

(declare-fun m!32263 () Bool)

(assert (=> b!22957 m!32263))

(declare-fun m!32265 () Bool)

(assert (=> b!22956 m!32265))

(assert (=> b!22956 m!32265))

(declare-fun m!32267 () Bool)

(assert (=> b!22956 m!32267))

(declare-fun m!32269 () Bool)

(assert (=> b!22956 m!32269))

(assert (=> b!22956 m!32269))

(declare-fun m!32271 () Bool)

(assert (=> b!22956 m!32271))

(declare-fun m!32273 () Bool)

(assert (=> b!22953 m!32273))

(declare-fun m!32275 () Bool)

(assert (=> b!22953 m!32275))

(declare-fun m!32277 () Bool)

(assert (=> b!22953 m!32277))

(declare-fun m!32279 () Bool)

(assert (=> start!5634 m!32279))

(declare-fun m!32281 () Bool)

(assert (=> start!5634 m!32281))

(declare-fun m!32283 () Bool)

(assert (=> b!22958 m!32283))

(declare-fun m!32285 () Bool)

(assert (=> b!22955 m!32285))

(declare-fun m!32287 () Bool)

(assert (=> b!22955 m!32287))

(assert (=> b!22955 m!32287))

(declare-fun m!32289 () Bool)

(assert (=> b!22955 m!32289))

(declare-fun m!32291 () Bool)

(assert (=> b!22955 m!32291))

(declare-fun m!32293 () Bool)

(assert (=> b!22955 m!32293))

(declare-fun m!32295 () Bool)

(assert (=> b!22954 m!32295))

(declare-fun m!32297 () Bool)

(assert (=> b!22959 m!32297))

(declare-fun m!32299 () Bool)

(assert (=> b!22962 m!32299))

(declare-fun m!32301 () Bool)

(assert (=> b!22962 m!32301))

(declare-fun m!32303 () Bool)

(assert (=> b!22962 m!32303))

(declare-fun m!32305 () Bool)

(assert (=> b!22962 m!32305))

(declare-fun m!32307 () Bool)

(assert (=> b!22962 m!32307))

(declare-fun m!32309 () Bool)

(assert (=> b!22962 m!32309))

(declare-fun m!32311 () Bool)

(assert (=> b!22962 m!32311))

(push 1)

(assert (not b!22958))

(assert (not start!5634))

(assert (not b!22953))

(assert (not b!22959))

(assert (not b!22956))

(assert (not b!22955))

(assert (not b!22954))

(assert (not b!22962))

(assert (not b!22957))

(assert (not b!22963))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

