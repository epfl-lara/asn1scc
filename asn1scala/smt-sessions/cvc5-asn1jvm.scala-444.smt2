; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!11856 () Bool)

(assert start!11856)

(declare-fun b!59580 () Bool)

(declare-fun e!39665 () Bool)

(declare-fun e!39655 () Bool)

(assert (=> b!59580 (= e!39665 e!39655)))

(declare-fun res!49605 () Bool)

(assert (=> b!59580 (=> res!49605 e!39655)))

(declare-datatypes ((array!2713 0))(
  ( (array!2714 (arr!1796 (Array (_ BitVec 32) (_ BitVec 8))) (size!1232 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2152 0))(
  ( (BitStream!2153 (buf!1613 array!2713) (currentByte!3231 (_ BitVec 32)) (currentBit!3226 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!4087 0))(
  ( (Unit!4088) )
))
(declare-datatypes ((tuple2!5426 0))(
  ( (tuple2!5427 (_1!2824 Unit!4087) (_2!2824 BitStream!2152)) )
))
(declare-fun lt!93385 () tuple2!5426)

(declare-fun lt!93387 () tuple2!5426)

(declare-fun isPrefixOf!0 (BitStream!2152 BitStream!2152) Bool)

(assert (=> b!59580 (= res!49605 (not (isPrefixOf!0 (_2!2824 lt!93385) (_2!2824 lt!93387))))))

(declare-fun thiss!1379 () BitStream!2152)

(assert (=> b!59580 (isPrefixOf!0 thiss!1379 (_2!2824 lt!93387))))

(declare-fun lt!93383 () Unit!4087)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2152 BitStream!2152 BitStream!2152) Unit!4087)

(assert (=> b!59580 (= lt!93383 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2824 lt!93385) (_2!2824 lt!93387)))))

(declare-fun srcBuffer!2 () array!2713)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2152 array!2713 (_ BitVec 64) (_ BitVec 64)) tuple2!5426)

(assert (=> b!59580 (= lt!93387 (appendBitsMSBFirstLoop!0 (_2!2824 lt!93385) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!39656 () Bool)

(assert (=> b!59580 e!39656))

(declare-fun res!49596 () Bool)

(assert (=> b!59580 (=> (not res!49596) (not e!39656))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!59580 (= res!49596 (validate_offset_bits!1 ((_ sign_extend 32) (size!1232 (buf!1613 (_2!2824 lt!93385)))) ((_ sign_extend 32) (currentByte!3231 thiss!1379)) ((_ sign_extend 32) (currentBit!3226 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!93381 () Unit!4087)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2152 array!2713 (_ BitVec 64)) Unit!4087)

(assert (=> b!59580 (= lt!93381 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1613 (_2!2824 lt!93385)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!5428 0))(
  ( (tuple2!5429 (_1!2825 BitStream!2152) (_2!2825 BitStream!2152)) )
))
(declare-fun lt!93390 () tuple2!5428)

(declare-fun reader!0 (BitStream!2152 BitStream!2152) tuple2!5428)

(assert (=> b!59580 (= lt!93390 (reader!0 thiss!1379 (_2!2824 lt!93385)))))

(declare-fun res!49600 () Bool)

(declare-fun e!39663 () Bool)

(assert (=> start!11856 (=> (not res!49600) (not e!39663))))

(assert (=> start!11856 (= res!49600 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1232 srcBuffer!2))))))))

(assert (=> start!11856 e!39663))

(assert (=> start!11856 true))

(declare-fun array_inv!1135 (array!2713) Bool)

(assert (=> start!11856 (array_inv!1135 srcBuffer!2)))

(declare-fun e!39660 () Bool)

(declare-fun inv!12 (BitStream!2152) Bool)

(assert (=> start!11856 (and (inv!12 thiss!1379) e!39660)))

(declare-fun b!59581 () Bool)

(declare-fun e!39658 () Bool)

(assert (=> b!59581 (= e!39663 (not e!39658))))

(declare-fun res!49607 () Bool)

(assert (=> b!59581 (=> res!49607 e!39658)))

(assert (=> b!59581 (= res!49607 (bvsge i!635 to!314))))

(assert (=> b!59581 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!93388 () Unit!4087)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2152) Unit!4087)

(assert (=> b!59581 (= lt!93388 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!93389 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!59581 (= lt!93389 (bitIndex!0 (size!1232 (buf!1613 thiss!1379)) (currentByte!3231 thiss!1379) (currentBit!3226 thiss!1379)))))

(declare-fun b!59582 () Bool)

(assert (=> b!59582 (= e!39660 (array_inv!1135 (buf!1613 thiss!1379)))))

(declare-fun b!59583 () Bool)

(declare-datatypes ((List!651 0))(
  ( (Nil!648) (Cons!647 (h!766 Bool) (t!1401 List!651)) )
))
(declare-fun head!470 (List!651) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2152 array!2713 (_ BitVec 64) (_ BitVec 64)) List!651)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2152 BitStream!2152 (_ BitVec 64)) List!651)

(assert (=> b!59583 (= e!39656 (= (head!470 (byteArrayBitContentToList!0 (_2!2824 lt!93385) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!470 (bitStreamReadBitsIntoList!0 (_2!2824 lt!93385) (_1!2825 lt!93390) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!59584 () Bool)

(declare-fun res!49604 () Bool)

(declare-fun e!39662 () Bool)

(assert (=> b!59584 (=> res!49604 e!39662)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!59584 (= res!49604 (not (invariant!0 (currentBit!3226 (_2!2824 lt!93385)) (currentByte!3231 (_2!2824 lt!93385)) (size!1232 (buf!1613 (_2!2824 lt!93385))))))))

(declare-fun b!59585 () Bool)

(declare-fun e!39664 () Bool)

(assert (=> b!59585 (= e!39664 e!39662)))

(declare-fun res!49601 () Bool)

(assert (=> b!59585 (=> res!49601 e!39662)))

(assert (=> b!59585 (= res!49601 (not (= (size!1232 (buf!1613 (_2!2824 lt!93385))) (size!1232 (buf!1613 (_2!2824 lt!93387))))))))

(declare-fun e!39659 () Bool)

(assert (=> b!59585 e!39659))

(declare-fun res!49599 () Bool)

(assert (=> b!59585 (=> (not res!49599) (not e!39659))))

(assert (=> b!59585 (= res!49599 (= (size!1232 (buf!1613 (_2!2824 lt!93387))) (size!1232 (buf!1613 thiss!1379))))))

(declare-fun b!59586 () Bool)

(declare-fun lt!93379 () (_ BitVec 64))

(declare-fun lt!93384 () (_ BitVec 64))

(assert (=> b!59586 (= e!39662 (or (= lt!93379 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!93379 (bvand lt!93384 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!59586 (= lt!93379 (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!59586 (validate_offset_bits!1 ((_ sign_extend 32) (size!1232 (buf!1613 (_2!2824 lt!93387)))) ((_ sign_extend 32) (currentByte!3231 (_2!2824 lt!93385))) ((_ sign_extend 32) (currentBit!3226 (_2!2824 lt!93385))) lt!93384)))

(declare-fun lt!93380 () Unit!4087)

(assert (=> b!59586 (= lt!93380 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2824 lt!93385) (buf!1613 (_2!2824 lt!93387)) lt!93384))))

(declare-fun lt!93377 () tuple2!5428)

(assert (=> b!59586 (= lt!93377 (reader!0 (_2!2824 lt!93385) (_2!2824 lt!93387)))))

(assert (=> b!59586 (validate_offset_bits!1 ((_ sign_extend 32) (size!1232 (buf!1613 (_2!2824 lt!93387)))) ((_ sign_extend 32) (currentByte!3231 thiss!1379)) ((_ sign_extend 32) (currentBit!3226 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!93378 () Unit!4087)

(assert (=> b!59586 (= lt!93378 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1613 (_2!2824 lt!93387)) (bvsub to!314 i!635)))))

(declare-fun lt!93391 () tuple2!5428)

(assert (=> b!59586 (= lt!93391 (reader!0 thiss!1379 (_2!2824 lt!93387)))))

(declare-fun b!59587 () Bool)

(declare-fun res!49606 () Bool)

(assert (=> b!59587 (=> res!49606 e!39664)))

(assert (=> b!59587 (= res!49606 (not (invariant!0 (currentBit!3226 (_2!2824 lt!93387)) (currentByte!3231 (_2!2824 lt!93387)) (size!1232 (buf!1613 (_2!2824 lt!93387))))))))

(declare-fun b!59588 () Bool)

(declare-fun res!49597 () Bool)

(assert (=> b!59588 (=> (not res!49597) (not e!39663))))

(assert (=> b!59588 (= res!49597 (validate_offset_bits!1 ((_ sign_extend 32) (size!1232 (buf!1613 thiss!1379))) ((_ sign_extend 32) (currentByte!3231 thiss!1379)) ((_ sign_extend 32) (currentBit!3226 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!59589 () Bool)

(assert (=> b!59589 (= e!39658 e!39665)))

(declare-fun res!49603 () Bool)

(assert (=> b!59589 (=> res!49603 e!39665)))

(assert (=> b!59589 (= res!49603 (not (isPrefixOf!0 thiss!1379 (_2!2824 lt!93385))))))

(assert (=> b!59589 (validate_offset_bits!1 ((_ sign_extend 32) (size!1232 (buf!1613 (_2!2824 lt!93385)))) ((_ sign_extend 32) (currentByte!3231 (_2!2824 lt!93385))) ((_ sign_extend 32) (currentBit!3226 (_2!2824 lt!93385))) lt!93384)))

(assert (=> b!59589 (= lt!93384 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!93386 () Unit!4087)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2152 BitStream!2152 (_ BitVec 64) (_ BitVec 64)) Unit!4087)

(assert (=> b!59589 (= lt!93386 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2824 lt!93385) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2152 (_ BitVec 8) (_ BitVec 32)) tuple2!5426)

(assert (=> b!59589 (= lt!93385 (appendBitFromByte!0 thiss!1379 (select (arr!1796 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!59590 () Bool)

(declare-fun res!49608 () Bool)

(assert (=> b!59590 (=> res!49608 e!39662)))

(assert (=> b!59590 (= res!49608 (not (invariant!0 (currentBit!3226 (_2!2824 lt!93385)) (currentByte!3231 (_2!2824 lt!93385)) (size!1232 (buf!1613 (_2!2824 lt!93387))))))))

(declare-fun b!59591 () Bool)

(assert (=> b!59591 (= e!39655 e!39664)))

(declare-fun res!49602 () Bool)

(assert (=> b!59591 (=> res!49602 e!39664)))

(declare-fun lt!93382 () (_ BitVec 64))

(assert (=> b!59591 (= res!49602 (not (= lt!93382 (bvsub (bvadd lt!93389 to!314) i!635))))))

(assert (=> b!59591 (= lt!93382 (bitIndex!0 (size!1232 (buf!1613 (_2!2824 lt!93387))) (currentByte!3231 (_2!2824 lt!93387)) (currentBit!3226 (_2!2824 lt!93387))))))

(declare-fun b!59592 () Bool)

(assert (=> b!59592 (= e!39659 (= lt!93382 (bvsub (bvsub (bvadd (bitIndex!0 (size!1232 (buf!1613 (_2!2824 lt!93385))) (currentByte!3231 (_2!2824 lt!93385)) (currentBit!3226 (_2!2824 lt!93385))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!59593 () Bool)

(declare-fun res!49598 () Bool)

(assert (=> b!59593 (=> res!49598 e!39664)))

(assert (=> b!59593 (= res!49598 (not (= (size!1232 (buf!1613 thiss!1379)) (size!1232 (buf!1613 (_2!2824 lt!93387))))))))

(assert (= (and start!11856 res!49600) b!59588))

(assert (= (and b!59588 res!49597) b!59581))

(assert (= (and b!59581 (not res!49607)) b!59589))

(assert (= (and b!59589 (not res!49603)) b!59580))

(assert (= (and b!59580 res!49596) b!59583))

(assert (= (and b!59580 (not res!49605)) b!59591))

(assert (= (and b!59591 (not res!49602)) b!59587))

(assert (= (and b!59587 (not res!49606)) b!59593))

(assert (= (and b!59593 (not res!49598)) b!59585))

(assert (= (and b!59585 res!49599) b!59592))

(assert (= (and b!59585 (not res!49601)) b!59584))

(assert (= (and b!59584 (not res!49604)) b!59590))

(assert (= (and b!59590 (not res!49608)) b!59586))

(assert (= start!11856 b!59582))

(declare-fun m!93829 () Bool)

(assert (=> b!59581 m!93829))

(declare-fun m!93831 () Bool)

(assert (=> b!59581 m!93831))

(declare-fun m!93833 () Bool)

(assert (=> b!59581 m!93833))

(declare-fun m!93835 () Bool)

(assert (=> b!59587 m!93835))

(declare-fun m!93837 () Bool)

(assert (=> b!59586 m!93837))

(declare-fun m!93839 () Bool)

(assert (=> b!59586 m!93839))

(declare-fun m!93841 () Bool)

(assert (=> b!59586 m!93841))

(declare-fun m!93843 () Bool)

(assert (=> b!59586 m!93843))

(declare-fun m!93845 () Bool)

(assert (=> b!59586 m!93845))

(declare-fun m!93847 () Bool)

(assert (=> b!59586 m!93847))

(declare-fun m!93849 () Bool)

(assert (=> b!59584 m!93849))

(declare-fun m!93851 () Bool)

(assert (=> b!59580 m!93851))

(declare-fun m!93853 () Bool)

(assert (=> b!59580 m!93853))

(declare-fun m!93855 () Bool)

(assert (=> b!59580 m!93855))

(declare-fun m!93857 () Bool)

(assert (=> b!59580 m!93857))

(declare-fun m!93859 () Bool)

(assert (=> b!59580 m!93859))

(declare-fun m!93861 () Bool)

(assert (=> b!59580 m!93861))

(declare-fun m!93863 () Bool)

(assert (=> b!59580 m!93863))

(declare-fun m!93865 () Bool)

(assert (=> b!59590 m!93865))

(declare-fun m!93867 () Bool)

(assert (=> b!59588 m!93867))

(declare-fun m!93869 () Bool)

(assert (=> b!59591 m!93869))

(declare-fun m!93871 () Bool)

(assert (=> b!59583 m!93871))

(assert (=> b!59583 m!93871))

(declare-fun m!93873 () Bool)

(assert (=> b!59583 m!93873))

(declare-fun m!93875 () Bool)

(assert (=> b!59583 m!93875))

(assert (=> b!59583 m!93875))

(declare-fun m!93877 () Bool)

(assert (=> b!59583 m!93877))

(declare-fun m!93879 () Bool)

(assert (=> b!59592 m!93879))

(declare-fun m!93881 () Bool)

(assert (=> b!59589 m!93881))

(declare-fun m!93883 () Bool)

(assert (=> b!59589 m!93883))

(declare-fun m!93885 () Bool)

(assert (=> b!59589 m!93885))

(declare-fun m!93887 () Bool)

(assert (=> b!59589 m!93887))

(assert (=> b!59589 m!93885))

(declare-fun m!93889 () Bool)

(assert (=> b!59589 m!93889))

(declare-fun m!93891 () Bool)

(assert (=> start!11856 m!93891))

(declare-fun m!93893 () Bool)

(assert (=> start!11856 m!93893))

(declare-fun m!93895 () Bool)

(assert (=> b!59582 m!93895))

(push 1)

(assert (not b!59580))

(assert (not b!59590))

(assert (not start!11856))

(assert (not b!59586))

(assert (not b!59582))

(assert (not b!59589))

(assert (not b!59584))

(assert (not b!59587))

(assert (not b!59581))

(assert (not b!59583))

(assert (not b!59588))

(assert (not b!59591))

(assert (not b!59592))

(check-sat)

(pop 1)

(push 1)

(check-sat)

