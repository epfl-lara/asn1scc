; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54080 () Bool)

(assert start!54080)

(declare-fun b!251956 () Bool)

(declare-fun res!211056 () Bool)

(declare-fun e!174586 () Bool)

(assert (=> b!251956 (=> (not res!211056) (not e!174586))))

(declare-fun from!289 () (_ BitVec 64))

(declare-datatypes ((array!13704 0))(
  ( (array!13705 (arr!6998 (Array (_ BitVec 32) (_ BitVec 8))) (size!6011 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10944 0))(
  ( (BitStream!10945 (buf!6513 array!13704) (currentByte!11968 (_ BitVec 32)) (currentBit!11963 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10944)

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!251956 (= res!211056 (validate_offset_bits!1 ((_ sign_extend 32) (size!6011 (buf!6513 thiss!1005))) ((_ sign_extend 32) (currentByte!11968 thiss!1005)) ((_ sign_extend 32) (currentBit!11963 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!251957 () Bool)

(declare-fun e!174585 () Bool)

(declare-fun e!174581 () Bool)

(assert (=> b!251957 (= e!174585 e!174581)))

(declare-fun res!211044 () Bool)

(assert (=> b!251957 (=> (not res!211044) (not e!174581))))

(declare-datatypes ((Unit!18170 0))(
  ( (Unit!18171) )
))
(declare-datatypes ((tuple2!21636 0))(
  ( (tuple2!21637 (_1!11746 Unit!18170) (_2!11746 BitStream!10944)) )
))
(declare-fun lt!391415 () tuple2!21636)

(declare-fun lt!391418 () tuple2!21636)

(declare-fun lt!391420 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!251957 (= res!211044 (= (bitIndex!0 (size!6011 (buf!6513 (_2!11746 lt!391415))) (currentByte!11968 (_2!11746 lt!391415)) (currentBit!11963 (_2!11746 lt!391415))) (bvadd (bitIndex!0 (size!6011 (buf!6513 (_2!11746 lt!391418))) (currentByte!11968 (_2!11746 lt!391418)) (currentBit!11963 (_2!11746 lt!391418))) lt!391420)))))

(assert (=> b!251957 (= lt!391420 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!251958 () Bool)

(declare-fun res!211049 () Bool)

(declare-fun e!174583 () Bool)

(assert (=> b!251958 (=> (not res!211049) (not e!174583))))

(declare-fun isPrefixOf!0 (BitStream!10944 BitStream!10944) Bool)

(assert (=> b!251958 (= res!211049 (isPrefixOf!0 thiss!1005 (_2!11746 lt!391418)))))

(declare-fun b!251959 () Bool)

(declare-fun e!174587 () Bool)

(declare-fun array_inv!5752 (array!13704) Bool)

(assert (=> b!251959 (= e!174587 (array_inv!5752 (buf!6513 thiss!1005)))))

(declare-fun b!251960 () Bool)

(assert (=> b!251960 (= e!174586 (not (or (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!289 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!297 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((tuple2!21638 0))(
  ( (tuple2!21639 (_1!11747 BitStream!10944) (_2!11747 Bool)) )
))
(declare-fun lt!391422 () tuple2!21638)

(declare-datatypes ((tuple2!21640 0))(
  ( (tuple2!21641 (_1!11748 BitStream!10944) (_2!11748 BitStream!10944)) )
))
(declare-fun lt!391414 () tuple2!21640)

(declare-fun bit!26 () Bool)

(declare-fun checkBitsLoopPure!0 (BitStream!10944 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21638)

(assert (=> b!251960 (= lt!391422 (checkBitsLoopPure!0 (_1!11748 lt!391414) nBits!297 bit!26 from!289))))

(assert (=> b!251960 (validate_offset_bits!1 ((_ sign_extend 32) (size!6011 (buf!6513 (_2!11746 lt!391415)))) ((_ sign_extend 32) (currentByte!11968 thiss!1005)) ((_ sign_extend 32) (currentBit!11963 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!391407 () Unit!18170)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10944 array!13704 (_ BitVec 64)) Unit!18170)

(assert (=> b!251960 (= lt!391407 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6513 (_2!11746 lt!391415)) (bvsub nBits!297 from!289)))))

(declare-fun readBitPure!0 (BitStream!10944) tuple2!21638)

(assert (=> b!251960 (= (_2!11747 (readBitPure!0 (_1!11748 lt!391414))) bit!26)))

(declare-fun lt!391412 () tuple2!21640)

(declare-fun reader!0 (BitStream!10944 BitStream!10944) tuple2!21640)

(assert (=> b!251960 (= lt!391412 (reader!0 (_2!11746 lt!391418) (_2!11746 lt!391415)))))

(assert (=> b!251960 (= lt!391414 (reader!0 thiss!1005 (_2!11746 lt!391415)))))

(declare-fun e!174584 () Bool)

(assert (=> b!251960 e!174584))

(declare-fun res!211050 () Bool)

(assert (=> b!251960 (=> (not res!211050) (not e!174584))))

(declare-fun lt!391416 () tuple2!21638)

(declare-fun lt!391419 () tuple2!21638)

(assert (=> b!251960 (= res!211050 (= (bitIndex!0 (size!6011 (buf!6513 (_1!11747 lt!391416))) (currentByte!11968 (_1!11747 lt!391416)) (currentBit!11963 (_1!11747 lt!391416))) (bitIndex!0 (size!6011 (buf!6513 (_1!11747 lt!391419))) (currentByte!11968 (_1!11747 lt!391419)) (currentBit!11963 (_1!11747 lt!391419)))))))

(declare-fun lt!391410 () Unit!18170)

(declare-fun lt!391411 () BitStream!10944)

(declare-fun readBitPrefixLemma!0 (BitStream!10944 BitStream!10944) Unit!18170)

(assert (=> b!251960 (= lt!391410 (readBitPrefixLemma!0 lt!391411 (_2!11746 lt!391415)))))

(assert (=> b!251960 (= lt!391419 (readBitPure!0 (BitStream!10945 (buf!6513 (_2!11746 lt!391415)) (currentByte!11968 thiss!1005) (currentBit!11963 thiss!1005))))))

(assert (=> b!251960 (= lt!391416 (readBitPure!0 lt!391411))))

(assert (=> b!251960 (= lt!391411 (BitStream!10945 (buf!6513 (_2!11746 lt!391418)) (currentByte!11968 thiss!1005) (currentBit!11963 thiss!1005)))))

(declare-fun e!174582 () Bool)

(assert (=> b!251960 e!174582))

(declare-fun res!211047 () Bool)

(assert (=> b!251960 (=> (not res!211047) (not e!174582))))

(assert (=> b!251960 (= res!211047 (isPrefixOf!0 thiss!1005 (_2!11746 lt!391415)))))

(declare-fun lt!391405 () Unit!18170)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10944 BitStream!10944 BitStream!10944) Unit!18170)

(assert (=> b!251960 (= lt!391405 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11746 lt!391418) (_2!11746 lt!391415)))))

(assert (=> b!251960 e!174585))

(declare-fun res!211052 () Bool)

(assert (=> b!251960 (=> (not res!211052) (not e!174585))))

(assert (=> b!251960 (= res!211052 (= (size!6011 (buf!6513 (_2!11746 lt!391418))) (size!6011 (buf!6513 (_2!11746 lt!391415)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10944 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21636)

(assert (=> b!251960 (= lt!391415 (appendNBitsLoop!0 (_2!11746 lt!391418) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!251960 (validate_offset_bits!1 ((_ sign_extend 32) (size!6011 (buf!6513 (_2!11746 lt!391418)))) ((_ sign_extend 32) (currentByte!11968 (_2!11746 lt!391418))) ((_ sign_extend 32) (currentBit!11963 (_2!11746 lt!391418))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!391413 () Unit!18170)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10944 BitStream!10944 (_ BitVec 64) (_ BitVec 64)) Unit!18170)

(assert (=> b!251960 (= lt!391413 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11746 lt!391418) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun e!174588 () Bool)

(assert (=> b!251960 e!174588))

(declare-fun res!211048 () Bool)

(assert (=> b!251960 (=> (not res!211048) (not e!174588))))

(assert (=> b!251960 (= res!211048 (= (size!6011 (buf!6513 thiss!1005)) (size!6011 (buf!6513 (_2!11746 lt!391418)))))))

(declare-fun appendBit!0 (BitStream!10944 Bool) tuple2!21636)

(assert (=> b!251960 (= lt!391418 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!251961 () Bool)

(declare-fun e!174590 () Bool)

(assert (=> b!251961 (= e!174583 e!174590)))

(declare-fun res!211045 () Bool)

(assert (=> b!251961 (=> (not res!211045) (not e!174590))))

(declare-fun lt!391408 () tuple2!21638)

(assert (=> b!251961 (= res!211045 (and (= (_2!11747 lt!391408) bit!26) (= (_1!11747 lt!391408) (_2!11746 lt!391418))))))

(declare-fun readerFrom!0 (BitStream!10944 (_ BitVec 32) (_ BitVec 32)) BitStream!10944)

(assert (=> b!251961 (= lt!391408 (readBitPure!0 (readerFrom!0 (_2!11746 lt!391418) (currentBit!11963 thiss!1005) (currentByte!11968 thiss!1005))))))

(declare-fun b!251962 () Bool)

(assert (=> b!251962 (= e!174584 (= (_2!11747 lt!391416) (_2!11747 lt!391419)))))

(declare-fun b!251963 () Bool)

(declare-fun lt!391417 () (_ BitVec 64))

(assert (=> b!251963 (= e!174590 (= (bitIndex!0 (size!6011 (buf!6513 (_1!11747 lt!391408))) (currentByte!11968 (_1!11747 lt!391408)) (currentBit!11963 (_1!11747 lt!391408))) lt!391417))))

(declare-fun b!251964 () Bool)

(declare-fun res!211051 () Bool)

(assert (=> b!251964 (=> (not res!211051) (not e!174586))))

(assert (=> b!251964 (= res!211051 (bvslt from!289 nBits!297))))

(declare-fun b!251965 () Bool)

(declare-fun res!211055 () Bool)

(assert (=> b!251965 (=> (not res!211055) (not e!174582))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!251965 (= res!211055 (invariant!0 (currentBit!11963 thiss!1005) (currentByte!11968 thiss!1005) (size!6011 (buf!6513 (_2!11746 lt!391418)))))))

(declare-fun res!211054 () Bool)

(assert (=> start!54080 (=> (not res!211054) (not e!174586))))

(assert (=> start!54080 (= res!211054 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!54080 e!174586))

(assert (=> start!54080 true))

(declare-fun inv!12 (BitStream!10944) Bool)

(assert (=> start!54080 (and (inv!12 thiss!1005) e!174587)))

(declare-fun b!251966 () Bool)

(assert (=> b!251966 (= e!174588 e!174583)))

(declare-fun res!211053 () Bool)

(assert (=> b!251966 (=> (not res!211053) (not e!174583))))

(declare-fun lt!391404 () (_ BitVec 64))

(assert (=> b!251966 (= res!211053 (= lt!391417 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!391404)))))

(assert (=> b!251966 (= lt!391417 (bitIndex!0 (size!6011 (buf!6513 (_2!11746 lt!391418))) (currentByte!11968 (_2!11746 lt!391418)) (currentBit!11963 (_2!11746 lt!391418))))))

(assert (=> b!251966 (= lt!391404 (bitIndex!0 (size!6011 (buf!6513 thiss!1005)) (currentByte!11968 thiss!1005) (currentBit!11963 thiss!1005)))))

(declare-fun b!251967 () Bool)

(declare-fun res!211046 () Bool)

(assert (=> b!251967 (=> (not res!211046) (not e!174581))))

(assert (=> b!251967 (= res!211046 (isPrefixOf!0 (_2!11746 lt!391418) (_2!11746 lt!391415)))))

(declare-fun b!251968 () Bool)

(assert (=> b!251968 (= e!174582 (invariant!0 (currentBit!11963 thiss!1005) (currentByte!11968 thiss!1005) (size!6011 (buf!6513 (_2!11746 lt!391415)))))))

(declare-fun b!251969 () Bool)

(declare-fun lt!391421 () tuple2!21638)

(declare-fun lt!391409 () tuple2!21640)

(assert (=> b!251969 (= e!174581 (not (or (not (_2!11747 lt!391421)) (not (= (_1!11747 lt!391421) (_2!11748 lt!391409))))))))

(assert (=> b!251969 (= lt!391421 (checkBitsLoopPure!0 (_1!11748 lt!391409) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!251969 (validate_offset_bits!1 ((_ sign_extend 32) (size!6011 (buf!6513 (_2!11746 lt!391415)))) ((_ sign_extend 32) (currentByte!11968 (_2!11746 lt!391418))) ((_ sign_extend 32) (currentBit!11963 (_2!11746 lt!391418))) lt!391420)))

(declare-fun lt!391406 () Unit!18170)

(assert (=> b!251969 (= lt!391406 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11746 lt!391418) (buf!6513 (_2!11746 lt!391415)) lt!391420))))

(assert (=> b!251969 (= lt!391409 (reader!0 (_2!11746 lt!391418) (_2!11746 lt!391415)))))

(assert (= (and start!54080 res!211054) b!251956))

(assert (= (and b!251956 res!211056) b!251964))

(assert (= (and b!251964 res!211051) b!251960))

(assert (= (and b!251960 res!211048) b!251966))

(assert (= (and b!251966 res!211053) b!251958))

(assert (= (and b!251958 res!211049) b!251961))

(assert (= (and b!251961 res!211045) b!251963))

(assert (= (and b!251960 res!211052) b!251957))

(assert (= (and b!251957 res!211044) b!251967))

(assert (= (and b!251967 res!211046) b!251969))

(assert (= (and b!251960 res!211047) b!251965))

(assert (= (and b!251965 res!211055) b!251968))

(assert (= (and b!251960 res!211050) b!251962))

(assert (= start!54080 b!251959))

(declare-fun m!379053 () Bool)

(assert (=> b!251968 m!379053))

(declare-fun m!379055 () Bool)

(assert (=> b!251963 m!379055))

(declare-fun m!379057 () Bool)

(assert (=> b!251959 m!379057))

(declare-fun m!379059 () Bool)

(assert (=> b!251958 m!379059))

(declare-fun m!379061 () Bool)

(assert (=> b!251957 m!379061))

(declare-fun m!379063 () Bool)

(assert (=> b!251957 m!379063))

(declare-fun m!379065 () Bool)

(assert (=> b!251969 m!379065))

(declare-fun m!379067 () Bool)

(assert (=> b!251969 m!379067))

(declare-fun m!379069 () Bool)

(assert (=> b!251969 m!379069))

(declare-fun m!379071 () Bool)

(assert (=> b!251969 m!379071))

(declare-fun m!379073 () Bool)

(assert (=> b!251956 m!379073))

(declare-fun m!379075 () Bool)

(assert (=> b!251960 m!379075))

(declare-fun m!379077 () Bool)

(assert (=> b!251960 m!379077))

(declare-fun m!379079 () Bool)

(assert (=> b!251960 m!379079))

(declare-fun m!379081 () Bool)

(assert (=> b!251960 m!379081))

(declare-fun m!379083 () Bool)

(assert (=> b!251960 m!379083))

(declare-fun m!379085 () Bool)

(assert (=> b!251960 m!379085))

(declare-fun m!379087 () Bool)

(assert (=> b!251960 m!379087))

(declare-fun m!379089 () Bool)

(assert (=> b!251960 m!379089))

(declare-fun m!379091 () Bool)

(assert (=> b!251960 m!379091))

(declare-fun m!379093 () Bool)

(assert (=> b!251960 m!379093))

(declare-fun m!379095 () Bool)

(assert (=> b!251960 m!379095))

(declare-fun m!379097 () Bool)

(assert (=> b!251960 m!379097))

(declare-fun m!379099 () Bool)

(assert (=> b!251960 m!379099))

(assert (=> b!251960 m!379071))

(declare-fun m!379101 () Bool)

(assert (=> b!251960 m!379101))

(declare-fun m!379103 () Bool)

(assert (=> b!251960 m!379103))

(declare-fun m!379105 () Bool)

(assert (=> b!251960 m!379105))

(declare-fun m!379107 () Bool)

(assert (=> b!251961 m!379107))

(assert (=> b!251961 m!379107))

(declare-fun m!379109 () Bool)

(assert (=> b!251961 m!379109))

(assert (=> b!251966 m!379063))

(declare-fun m!379111 () Bool)

(assert (=> b!251966 m!379111))

(declare-fun m!379113 () Bool)

(assert (=> start!54080 m!379113))

(declare-fun m!379115 () Bool)

(assert (=> b!251965 m!379115))

(declare-fun m!379117 () Bool)

(assert (=> b!251967 m!379117))

(check-sat (not b!251956) (not b!251957) (not b!251963) (not b!251960) (not b!251966) (not b!251965) (not b!251969) (not start!54080) (not b!251961) (not b!251958) (not b!251959) (not b!251967) (not b!251968))
