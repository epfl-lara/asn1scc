; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!11876 () Bool)

(assert start!11876)

(declare-fun b!60000 () Bool)

(declare-fun res!49987 () Bool)

(declare-fun e!39995 () Bool)

(assert (=> b!60000 (=> res!49987 e!39995)))

(declare-datatypes ((array!2733 0))(
  ( (array!2734 (arr!1806 (Array (_ BitVec 32) (_ BitVec 8))) (size!1242 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2172 0))(
  ( (BitStream!2173 (buf!1623 array!2733) (currentByte!3241 (_ BitVec 32)) (currentBit!3236 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!4107 0))(
  ( (Unit!4108) )
))
(declare-datatypes ((tuple2!5466 0))(
  ( (tuple2!5467 (_1!2844 Unit!4107) (_2!2844 BitStream!2172)) )
))
(declare-fun lt!93832 () tuple2!5466)

(declare-fun lt!93823 () tuple2!5466)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!60000 (= res!49987 (not (invariant!0 (currentBit!3236 (_2!2844 lt!93832)) (currentByte!3241 (_2!2844 lt!93832)) (size!1242 (buf!1623 (_2!2844 lt!93823))))))))

(declare-fun b!60001 () Bool)

(declare-fun e!39988 () Bool)

(declare-fun e!39986 () Bool)

(assert (=> b!60001 (= e!39988 e!39986)))

(declare-fun res!49996 () Bool)

(assert (=> b!60001 (=> res!49996 e!39986)))

(declare-fun lt!93837 () (_ BitVec 64))

(declare-fun lt!93827 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!60001 (= res!49996 (not (= lt!93837 (bvsub (bvadd lt!93827 to!314) i!635))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!60001 (= lt!93837 (bitIndex!0 (size!1242 (buf!1623 (_2!2844 lt!93823))) (currentByte!3241 (_2!2844 lt!93823)) (currentBit!3236 (_2!2844 lt!93823))))))

(declare-fun b!60002 () Bool)

(assert (=> b!60002 (= e!39986 e!39995)))

(declare-fun res!49991 () Bool)

(assert (=> b!60002 (=> res!49991 e!39995)))

(assert (=> b!60002 (= res!49991 (not (= (size!1242 (buf!1623 (_2!2844 lt!93832))) (size!1242 (buf!1623 (_2!2844 lt!93823))))))))

(declare-fun e!39989 () Bool)

(assert (=> b!60002 e!39989))

(declare-fun res!49998 () Bool)

(assert (=> b!60002 (=> (not res!49998) (not e!39989))))

(declare-fun thiss!1379 () BitStream!2172)

(assert (=> b!60002 (= res!49998 (= (size!1242 (buf!1623 (_2!2844 lt!93823))) (size!1242 (buf!1623 thiss!1379))))))

(declare-fun b!60003 () Bool)

(assert (=> b!60003 (= e!39989 (= lt!93837 (bvsub (bvsub (bvadd (bitIndex!0 (size!1242 (buf!1623 (_2!2844 lt!93832))) (currentByte!3241 (_2!2844 lt!93832)) (currentBit!3236 (_2!2844 lt!93832))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!60004 () Bool)

(declare-fun e!39990 () Bool)

(assert (=> b!60004 (= e!39990 e!39988)))

(declare-fun res!49997 () Bool)

(assert (=> b!60004 (=> res!49997 e!39988)))

(declare-fun isPrefixOf!0 (BitStream!2172 BitStream!2172) Bool)

(assert (=> b!60004 (= res!49997 (not (isPrefixOf!0 (_2!2844 lt!93832) (_2!2844 lt!93823))))))

(assert (=> b!60004 (isPrefixOf!0 thiss!1379 (_2!2844 lt!93823))))

(declare-fun lt!93824 () Unit!4107)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2172 BitStream!2172 BitStream!2172) Unit!4107)

(assert (=> b!60004 (= lt!93824 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2844 lt!93832) (_2!2844 lt!93823)))))

(declare-fun srcBuffer!2 () array!2733)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2172 array!2733 (_ BitVec 64) (_ BitVec 64)) tuple2!5466)

(assert (=> b!60004 (= lt!93823 (appendBitsMSBFirstLoop!0 (_2!2844 lt!93832) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!39985 () Bool)

(assert (=> b!60004 e!39985))

(declare-fun res!49986 () Bool)

(assert (=> b!60004 (=> (not res!49986) (not e!39985))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!60004 (= res!49986 (validate_offset_bits!1 ((_ sign_extend 32) (size!1242 (buf!1623 (_2!2844 lt!93832)))) ((_ sign_extend 32) (currentByte!3241 thiss!1379)) ((_ sign_extend 32) (currentBit!3236 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!93838 () Unit!4107)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2172 array!2733 (_ BitVec 64)) Unit!4107)

(assert (=> b!60004 (= lt!93838 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1623 (_2!2844 lt!93832)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!5468 0))(
  ( (tuple2!5469 (_1!2845 BitStream!2172) (_2!2845 BitStream!2172)) )
))
(declare-fun lt!93828 () tuple2!5468)

(declare-fun reader!0 (BitStream!2172 BitStream!2172) tuple2!5468)

(assert (=> b!60004 (= lt!93828 (reader!0 thiss!1379 (_2!2844 lt!93832)))))

(declare-fun res!49989 () Bool)

(declare-fun e!39991 () Bool)

(assert (=> start!11876 (=> (not res!49989) (not e!39991))))

(assert (=> start!11876 (= res!49989 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1242 srcBuffer!2))))))))

(assert (=> start!11876 e!39991))

(assert (=> start!11876 true))

(declare-fun array_inv!1145 (array!2733) Bool)

(assert (=> start!11876 (array_inv!1145 srcBuffer!2)))

(declare-fun e!39993 () Bool)

(declare-fun inv!12 (BitStream!2172) Bool)

(assert (=> start!11876 (and (inv!12 thiss!1379) e!39993)))

(declare-fun b!60005 () Bool)

(declare-fun e!39992 () Bool)

(assert (=> b!60005 (= e!39991 (not e!39992))))

(declare-fun res!49993 () Bool)

(assert (=> b!60005 (=> res!49993 e!39992)))

(assert (=> b!60005 (= res!49993 (bvsge i!635 to!314))))

(assert (=> b!60005 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!93830 () Unit!4107)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2172) Unit!4107)

(assert (=> b!60005 (= lt!93830 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!60005 (= lt!93827 (bitIndex!0 (size!1242 (buf!1623 thiss!1379)) (currentByte!3241 thiss!1379) (currentBit!3236 thiss!1379)))))

(declare-fun b!60006 () Bool)

(declare-fun res!49990 () Bool)

(assert (=> b!60006 (=> res!49990 e!39986)))

(assert (=> b!60006 (= res!49990 (not (= (size!1242 (buf!1623 thiss!1379)) (size!1242 (buf!1623 (_2!2844 lt!93823))))))))

(declare-fun b!60007 () Bool)

(assert (=> b!60007 (= e!39992 e!39990)))

(declare-fun res!49988 () Bool)

(assert (=> b!60007 (=> res!49988 e!39990)))

(assert (=> b!60007 (= res!49988 (not (isPrefixOf!0 thiss!1379 (_2!2844 lt!93832))))))

(declare-fun lt!93836 () (_ BitVec 64))

(assert (=> b!60007 (validate_offset_bits!1 ((_ sign_extend 32) (size!1242 (buf!1623 (_2!2844 lt!93832)))) ((_ sign_extend 32) (currentByte!3241 (_2!2844 lt!93832))) ((_ sign_extend 32) (currentBit!3236 (_2!2844 lt!93832))) lt!93836)))

(assert (=> b!60007 (= lt!93836 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!93835 () Unit!4107)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2172 BitStream!2172 (_ BitVec 64) (_ BitVec 64)) Unit!4107)

(assert (=> b!60007 (= lt!93835 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2844 lt!93832) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2172 (_ BitVec 8) (_ BitVec 32)) tuple2!5466)

(assert (=> b!60007 (= lt!93832 (appendBitFromByte!0 thiss!1379 (select (arr!1806 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!60008 () Bool)

(declare-fun res!49994 () Bool)

(assert (=> b!60008 (=> res!49994 e!39986)))

(assert (=> b!60008 (= res!49994 (not (invariant!0 (currentBit!3236 (_2!2844 lt!93823)) (currentByte!3241 (_2!2844 lt!93823)) (size!1242 (buf!1623 (_2!2844 lt!93823))))))))

(declare-fun b!60009 () Bool)

(declare-fun lt!93833 () (_ BitVec 64))

(assert (=> b!60009 (= e!39995 (or (= lt!93833 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!93833 (bvand lt!93836 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!60009 (= lt!93833 (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!93831 () tuple2!5468)

(declare-datatypes ((List!661 0))(
  ( (Nil!658) (Cons!657 (h!776 Bool) (t!1411 List!661)) )
))
(declare-fun lt!93829 () List!661)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2172 BitStream!2172 (_ BitVec 64)) List!661)

(assert (=> b!60009 (= lt!93829 (bitStreamReadBitsIntoList!0 (_2!2844 lt!93823) (_1!2845 lt!93831) (bvsub to!314 i!635)))))

(assert (=> b!60009 (validate_offset_bits!1 ((_ sign_extend 32) (size!1242 (buf!1623 (_2!2844 lt!93823)))) ((_ sign_extend 32) (currentByte!3241 (_2!2844 lt!93832))) ((_ sign_extend 32) (currentBit!3236 (_2!2844 lt!93832))) lt!93836)))

(declare-fun lt!93834 () Unit!4107)

(assert (=> b!60009 (= lt!93834 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2844 lt!93832) (buf!1623 (_2!2844 lt!93823)) lt!93836))))

(declare-fun lt!93825 () tuple2!5468)

(assert (=> b!60009 (= lt!93825 (reader!0 (_2!2844 lt!93832) (_2!2844 lt!93823)))))

(assert (=> b!60009 (validate_offset_bits!1 ((_ sign_extend 32) (size!1242 (buf!1623 (_2!2844 lt!93823)))) ((_ sign_extend 32) (currentByte!3241 thiss!1379)) ((_ sign_extend 32) (currentBit!3236 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!93826 () Unit!4107)

(assert (=> b!60009 (= lt!93826 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1623 (_2!2844 lt!93823)) (bvsub to!314 i!635)))))

(assert (=> b!60009 (= lt!93831 (reader!0 thiss!1379 (_2!2844 lt!93823)))))

(declare-fun b!60010 () Bool)

(declare-fun head!480 (List!661) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2172 array!2733 (_ BitVec 64) (_ BitVec 64)) List!661)

(assert (=> b!60010 (= e!39985 (= (head!480 (byteArrayBitContentToList!0 (_2!2844 lt!93832) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!480 (bitStreamReadBitsIntoList!0 (_2!2844 lt!93832) (_1!2845 lt!93828) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!60011 () Bool)

(declare-fun res!49995 () Bool)

(assert (=> b!60011 (=> (not res!49995) (not e!39991))))

(assert (=> b!60011 (= res!49995 (validate_offset_bits!1 ((_ sign_extend 32) (size!1242 (buf!1623 thiss!1379))) ((_ sign_extend 32) (currentByte!3241 thiss!1379)) ((_ sign_extend 32) (currentBit!3236 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!60012 () Bool)

(declare-fun res!49992 () Bool)

(assert (=> b!60012 (=> res!49992 e!39995)))

(assert (=> b!60012 (= res!49992 (not (invariant!0 (currentBit!3236 (_2!2844 lt!93832)) (currentByte!3241 (_2!2844 lt!93832)) (size!1242 (buf!1623 (_2!2844 lt!93832))))))))

(declare-fun b!60013 () Bool)

(assert (=> b!60013 (= e!39993 (array_inv!1145 (buf!1623 thiss!1379)))))

(assert (= (and start!11876 res!49989) b!60011))

(assert (= (and b!60011 res!49995) b!60005))

(assert (= (and b!60005 (not res!49993)) b!60007))

(assert (= (and b!60007 (not res!49988)) b!60004))

(assert (= (and b!60004 res!49986) b!60010))

(assert (= (and b!60004 (not res!49997)) b!60001))

(assert (= (and b!60001 (not res!49996)) b!60008))

(assert (= (and b!60008 (not res!49994)) b!60006))

(assert (= (and b!60006 (not res!49990)) b!60002))

(assert (= (and b!60002 res!49998) b!60003))

(assert (= (and b!60002 (not res!49991)) b!60012))

(assert (= (and b!60012 (not res!49992)) b!60000))

(assert (= (and b!60000 (not res!49987)) b!60009))

(assert (= start!11876 b!60013))

(declare-fun m!94517 () Bool)

(assert (=> b!60005 m!94517))

(declare-fun m!94519 () Bool)

(assert (=> b!60005 m!94519))

(declare-fun m!94521 () Bool)

(assert (=> b!60005 m!94521))

(declare-fun m!94523 () Bool)

(assert (=> b!60012 m!94523))

(declare-fun m!94525 () Bool)

(assert (=> b!60008 m!94525))

(declare-fun m!94527 () Bool)

(assert (=> b!60009 m!94527))

(declare-fun m!94529 () Bool)

(assert (=> b!60009 m!94529))

(declare-fun m!94531 () Bool)

(assert (=> b!60009 m!94531))

(declare-fun m!94533 () Bool)

(assert (=> b!60009 m!94533))

(declare-fun m!94535 () Bool)

(assert (=> b!60009 m!94535))

(declare-fun m!94537 () Bool)

(assert (=> b!60009 m!94537))

(declare-fun m!94539 () Bool)

(assert (=> b!60009 m!94539))

(declare-fun m!94541 () Bool)

(assert (=> b!60007 m!94541))

(declare-fun m!94543 () Bool)

(assert (=> b!60007 m!94543))

(declare-fun m!94545 () Bool)

(assert (=> b!60007 m!94545))

(assert (=> b!60007 m!94541))

(declare-fun m!94547 () Bool)

(assert (=> b!60007 m!94547))

(declare-fun m!94549 () Bool)

(assert (=> b!60007 m!94549))

(declare-fun m!94551 () Bool)

(assert (=> b!60000 m!94551))

(declare-fun m!94553 () Bool)

(assert (=> b!60001 m!94553))

(declare-fun m!94555 () Bool)

(assert (=> b!60011 m!94555))

(declare-fun m!94557 () Bool)

(assert (=> b!60003 m!94557))

(declare-fun m!94559 () Bool)

(assert (=> b!60004 m!94559))

(declare-fun m!94561 () Bool)

(assert (=> b!60004 m!94561))

(declare-fun m!94563 () Bool)

(assert (=> b!60004 m!94563))

(declare-fun m!94565 () Bool)

(assert (=> b!60004 m!94565))

(declare-fun m!94567 () Bool)

(assert (=> b!60004 m!94567))

(declare-fun m!94569 () Bool)

(assert (=> b!60004 m!94569))

(declare-fun m!94571 () Bool)

(assert (=> b!60004 m!94571))

(declare-fun m!94573 () Bool)

(assert (=> b!60010 m!94573))

(assert (=> b!60010 m!94573))

(declare-fun m!94575 () Bool)

(assert (=> b!60010 m!94575))

(declare-fun m!94577 () Bool)

(assert (=> b!60010 m!94577))

(assert (=> b!60010 m!94577))

(declare-fun m!94579 () Bool)

(assert (=> b!60010 m!94579))

(declare-fun m!94581 () Bool)

(assert (=> b!60013 m!94581))

(declare-fun m!94583 () Bool)

(assert (=> start!11876 m!94583))

(declare-fun m!94585 () Bool)

(assert (=> start!11876 m!94585))

(check-sat (not b!60012) (not b!60011) (not b!60007) (not b!60001) (not b!60010) (not b!60013) (not b!60008) (not b!60005) (not b!60009) (not b!60004) (not start!11876) (not b!60003) (not b!60000))
(check-sat)
