; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!11878 () Bool)

(assert start!11878)

(declare-fun b!60042 () Bool)

(declare-fun e!40021 () Bool)

(declare-fun e!40028 () Bool)

(assert (=> b!60042 (= e!40021 e!40028)))

(declare-fun res!50025 () Bool)

(assert (=> b!60042 (=> res!50025 e!40028)))

(declare-datatypes ((array!2735 0))(
  ( (array!2736 (arr!1807 (Array (_ BitVec 32) (_ BitVec 8))) (size!1243 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2174 0))(
  ( (BitStream!2175 (buf!1624 array!2735) (currentByte!3242 (_ BitVec 32)) (currentBit!3237 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2174)

(declare-datatypes ((Unit!4109 0))(
  ( (Unit!4110) )
))
(declare-datatypes ((tuple2!5470 0))(
  ( (tuple2!5471 (_1!2846 Unit!4109) (_2!2846 BitStream!2174)) )
))
(declare-fun lt!93876 () tuple2!5470)

(declare-fun isPrefixOf!0 (BitStream!2174 BitStream!2174) Bool)

(assert (=> b!60042 (= res!50025 (not (isPrefixOf!0 thiss!1379 (_2!2846 lt!93876))))))

(declare-fun lt!93874 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!60042 (validate_offset_bits!1 ((_ sign_extend 32) (size!1243 (buf!1624 (_2!2846 lt!93876)))) ((_ sign_extend 32) (currentByte!3242 (_2!2846 lt!93876))) ((_ sign_extend 32) (currentBit!3237 (_2!2846 lt!93876))) lt!93874)))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(assert (=> b!60042 (= lt!93874 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!93873 () Unit!4109)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2174 BitStream!2174 (_ BitVec 64) (_ BitVec 64)) Unit!4109)

(assert (=> b!60042 (= lt!93873 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2846 lt!93876) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!2735)

(declare-fun appendBitFromByte!0 (BitStream!2174 (_ BitVec 8) (_ BitVec 32)) tuple2!5470)

(assert (=> b!60042 (= lt!93876 (appendBitFromByte!0 thiss!1379 (select (arr!1807 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!60043 () Bool)

(declare-fun e!40019 () Bool)

(assert (=> b!60043 (= e!40028 e!40019)))

(declare-fun res!50032 () Bool)

(assert (=> b!60043 (=> res!50032 e!40019)))

(declare-fun lt!93877 () tuple2!5470)

(assert (=> b!60043 (= res!50032 (not (isPrefixOf!0 (_2!2846 lt!93876) (_2!2846 lt!93877))))))

(assert (=> b!60043 (isPrefixOf!0 thiss!1379 (_2!2846 lt!93877))))

(declare-fun lt!93879 () Unit!4109)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2174 BitStream!2174 BitStream!2174) Unit!4109)

(assert (=> b!60043 (= lt!93879 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2846 lt!93876) (_2!2846 lt!93877)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2174 array!2735 (_ BitVec 64) (_ BitVec 64)) tuple2!5470)

(assert (=> b!60043 (= lt!93877 (appendBitsMSBFirstLoop!0 (_2!2846 lt!93876) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!40024 () Bool)

(assert (=> b!60043 e!40024))

(declare-fun res!50036 () Bool)

(assert (=> b!60043 (=> (not res!50036) (not e!40024))))

(assert (=> b!60043 (= res!50036 (validate_offset_bits!1 ((_ sign_extend 32) (size!1243 (buf!1624 (_2!2846 lt!93876)))) ((_ sign_extend 32) (currentByte!3242 thiss!1379)) ((_ sign_extend 32) (currentBit!3237 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!93881 () Unit!4109)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2174 array!2735 (_ BitVec 64)) Unit!4109)

(assert (=> b!60043 (= lt!93881 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1624 (_2!2846 lt!93876)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!5472 0))(
  ( (tuple2!5473 (_1!2847 BitStream!2174) (_2!2847 BitStream!2174)) )
))
(declare-fun lt!93872 () tuple2!5472)

(declare-fun reader!0 (BitStream!2174 BitStream!2174) tuple2!5472)

(assert (=> b!60043 (= lt!93872 (reader!0 thiss!1379 (_2!2846 lt!93876)))))

(declare-fun b!60044 () Bool)

(declare-fun res!50028 () Bool)

(declare-fun e!40026 () Bool)

(assert (=> b!60044 (=> (not res!50028) (not e!40026))))

(assert (=> b!60044 (= res!50028 (validate_offset_bits!1 ((_ sign_extend 32) (size!1243 (buf!1624 thiss!1379))) ((_ sign_extend 32) (currentByte!3242 thiss!1379)) ((_ sign_extend 32) (currentBit!3237 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!60046 () Bool)

(declare-fun res!50026 () Bool)

(declare-fun e!40025 () Bool)

(assert (=> b!60046 (=> res!50026 e!40025)))

(assert (=> b!60046 (= res!50026 (not (= (size!1243 (buf!1624 thiss!1379)) (size!1243 (buf!1624 (_2!2846 lt!93877))))))))

(declare-fun lt!93875 () (_ BitVec 64))

(declare-fun b!60047 () Bool)

(declare-fun e!40018 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!60047 (= e!40018 (= lt!93875 (bvsub (bvsub (bvadd (bitIndex!0 (size!1243 (buf!1624 (_2!2846 lt!93876))) (currentByte!3242 (_2!2846 lt!93876)) (currentBit!3237 (_2!2846 lt!93876))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!60048 () Bool)

(declare-fun e!40027 () Bool)

(declare-fun array_inv!1146 (array!2735) Bool)

(assert (=> b!60048 (= e!40027 (array_inv!1146 (buf!1624 thiss!1379)))))

(declare-fun b!60049 () Bool)

(assert (=> b!60049 (= e!40026 (not e!40021))))

(declare-fun res!50035 () Bool)

(assert (=> b!60049 (=> res!50035 e!40021)))

(assert (=> b!60049 (= res!50035 (bvsge i!635 to!314))))

(assert (=> b!60049 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!93884 () Unit!4109)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2174) Unit!4109)

(assert (=> b!60049 (= lt!93884 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!93882 () (_ BitVec 64))

(assert (=> b!60049 (= lt!93882 (bitIndex!0 (size!1243 (buf!1624 thiss!1379)) (currentByte!3242 thiss!1379) (currentBit!3237 thiss!1379)))))

(declare-fun b!60050 () Bool)

(declare-fun res!50030 () Bool)

(declare-fun e!40022 () Bool)

(assert (=> b!60050 (=> res!50030 e!40022)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!60050 (= res!50030 (not (invariant!0 (currentBit!3237 (_2!2846 lt!93876)) (currentByte!3242 (_2!2846 lt!93876)) (size!1243 (buf!1624 (_2!2846 lt!93876))))))))

(declare-fun b!60051 () Bool)

(declare-fun res!50034 () Bool)

(assert (=> b!60051 (=> res!50034 e!40025)))

(assert (=> b!60051 (= res!50034 (not (invariant!0 (currentBit!3237 (_2!2846 lt!93877)) (currentByte!3242 (_2!2846 lt!93877)) (size!1243 (buf!1624 (_2!2846 lt!93877))))))))

(declare-fun res!50037 () Bool)

(assert (=> start!11878 (=> (not res!50037) (not e!40026))))

(assert (=> start!11878 (= res!50037 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1243 srcBuffer!2))))))))

(assert (=> start!11878 e!40026))

(assert (=> start!11878 true))

(assert (=> start!11878 (array_inv!1146 srcBuffer!2)))

(declare-fun inv!12 (BitStream!2174) Bool)

(assert (=> start!11878 (and (inv!12 thiss!1379) e!40027)))

(declare-fun b!60045 () Bool)

(declare-fun lt!93880 () (_ BitVec 64))

(assert (=> b!60045 (= e!40022 (or (= lt!93880 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!93880 (bvand lt!93874 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!60045 (= lt!93880 (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((List!662 0))(
  ( (Nil!659) (Cons!658 (h!777 Bool) (t!1412 List!662)) )
))
(declare-fun lt!93885 () List!662)

(declare-fun lt!93886 () tuple2!5472)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2174 BitStream!2174 (_ BitVec 64)) List!662)

(assert (=> b!60045 (= lt!93885 (bitStreamReadBitsIntoList!0 (_2!2846 lt!93877) (_1!2847 lt!93886) (bvsub to!314 i!635)))))

(assert (=> b!60045 (validate_offset_bits!1 ((_ sign_extend 32) (size!1243 (buf!1624 (_2!2846 lt!93877)))) ((_ sign_extend 32) (currentByte!3242 (_2!2846 lt!93876))) ((_ sign_extend 32) (currentBit!3237 (_2!2846 lt!93876))) lt!93874)))

(declare-fun lt!93871 () Unit!4109)

(assert (=> b!60045 (= lt!93871 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2846 lt!93876) (buf!1624 (_2!2846 lt!93877)) lt!93874))))

(declare-fun lt!93883 () tuple2!5472)

(assert (=> b!60045 (= lt!93883 (reader!0 (_2!2846 lt!93876) (_2!2846 lt!93877)))))

(assert (=> b!60045 (validate_offset_bits!1 ((_ sign_extend 32) (size!1243 (buf!1624 (_2!2846 lt!93877)))) ((_ sign_extend 32) (currentByte!3242 thiss!1379)) ((_ sign_extend 32) (currentBit!3237 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!93878 () Unit!4109)

(assert (=> b!60045 (= lt!93878 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1624 (_2!2846 lt!93877)) (bvsub to!314 i!635)))))

(assert (=> b!60045 (= lt!93886 (reader!0 thiss!1379 (_2!2846 lt!93877)))))

(declare-fun b!60052 () Bool)

(assert (=> b!60052 (= e!40019 e!40025)))

(declare-fun res!50027 () Bool)

(assert (=> b!60052 (=> res!50027 e!40025)))

(assert (=> b!60052 (= res!50027 (not (= lt!93875 (bvsub (bvadd lt!93882 to!314) i!635))))))

(assert (=> b!60052 (= lt!93875 (bitIndex!0 (size!1243 (buf!1624 (_2!2846 lt!93877))) (currentByte!3242 (_2!2846 lt!93877)) (currentBit!3237 (_2!2846 lt!93877))))))

(declare-fun b!60053 () Bool)

(declare-fun head!481 (List!662) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2174 array!2735 (_ BitVec 64) (_ BitVec 64)) List!662)

(assert (=> b!60053 (= e!40024 (= (head!481 (byteArrayBitContentToList!0 (_2!2846 lt!93876) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!481 (bitStreamReadBitsIntoList!0 (_2!2846 lt!93876) (_1!2847 lt!93872) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!60054 () Bool)

(assert (=> b!60054 (= e!40025 e!40022)))

(declare-fun res!50031 () Bool)

(assert (=> b!60054 (=> res!50031 e!40022)))

(assert (=> b!60054 (= res!50031 (not (= (size!1243 (buf!1624 (_2!2846 lt!93876))) (size!1243 (buf!1624 (_2!2846 lt!93877))))))))

(assert (=> b!60054 e!40018))

(declare-fun res!50029 () Bool)

(assert (=> b!60054 (=> (not res!50029) (not e!40018))))

(assert (=> b!60054 (= res!50029 (= (size!1243 (buf!1624 (_2!2846 lt!93877))) (size!1243 (buf!1624 thiss!1379))))))

(declare-fun b!60055 () Bool)

(declare-fun res!50033 () Bool)

(assert (=> b!60055 (=> res!50033 e!40022)))

(assert (=> b!60055 (= res!50033 (not (invariant!0 (currentBit!3237 (_2!2846 lt!93876)) (currentByte!3242 (_2!2846 lt!93876)) (size!1243 (buf!1624 (_2!2846 lt!93877))))))))

(assert (= (and start!11878 res!50037) b!60044))

(assert (= (and b!60044 res!50028) b!60049))

(assert (= (and b!60049 (not res!50035)) b!60042))

(assert (= (and b!60042 (not res!50025)) b!60043))

(assert (= (and b!60043 res!50036) b!60053))

(assert (= (and b!60043 (not res!50032)) b!60052))

(assert (= (and b!60052 (not res!50027)) b!60051))

(assert (= (and b!60051 (not res!50034)) b!60046))

(assert (= (and b!60046 (not res!50026)) b!60054))

(assert (= (and b!60054 res!50029) b!60047))

(assert (= (and b!60054 (not res!50031)) b!60050))

(assert (= (and b!60050 (not res!50030)) b!60055))

(assert (= (and b!60055 (not res!50033)) b!60045))

(assert (= start!11878 b!60048))

(declare-fun m!94587 () Bool)

(assert (=> b!60048 m!94587))

(declare-fun m!94589 () Bool)

(assert (=> b!60051 m!94589))

(declare-fun m!94591 () Bool)

(assert (=> b!60045 m!94591))

(declare-fun m!94593 () Bool)

(assert (=> b!60045 m!94593))

(declare-fun m!94595 () Bool)

(assert (=> b!60045 m!94595))

(declare-fun m!94597 () Bool)

(assert (=> b!60045 m!94597))

(declare-fun m!94599 () Bool)

(assert (=> b!60045 m!94599))

(declare-fun m!94601 () Bool)

(assert (=> b!60045 m!94601))

(declare-fun m!94603 () Bool)

(assert (=> b!60045 m!94603))

(declare-fun m!94605 () Bool)

(assert (=> b!60044 m!94605))

(declare-fun m!94607 () Bool)

(assert (=> b!60049 m!94607))

(declare-fun m!94609 () Bool)

(assert (=> b!60049 m!94609))

(declare-fun m!94611 () Bool)

(assert (=> b!60049 m!94611))

(declare-fun m!94613 () Bool)

(assert (=> b!60055 m!94613))

(declare-fun m!94615 () Bool)

(assert (=> b!60050 m!94615))

(declare-fun m!94617 () Bool)

(assert (=> b!60053 m!94617))

(assert (=> b!60053 m!94617))

(declare-fun m!94619 () Bool)

(assert (=> b!60053 m!94619))

(declare-fun m!94621 () Bool)

(assert (=> b!60053 m!94621))

(assert (=> b!60053 m!94621))

(declare-fun m!94623 () Bool)

(assert (=> b!60053 m!94623))

(declare-fun m!94625 () Bool)

(assert (=> b!60043 m!94625))

(declare-fun m!94627 () Bool)

(assert (=> b!60043 m!94627))

(declare-fun m!94629 () Bool)

(assert (=> b!60043 m!94629))

(declare-fun m!94631 () Bool)

(assert (=> b!60043 m!94631))

(declare-fun m!94633 () Bool)

(assert (=> b!60043 m!94633))

(declare-fun m!94635 () Bool)

(assert (=> b!60043 m!94635))

(declare-fun m!94637 () Bool)

(assert (=> b!60043 m!94637))

(declare-fun m!94639 () Bool)

(assert (=> b!60052 m!94639))

(declare-fun m!94641 () Bool)

(assert (=> b!60042 m!94641))

(declare-fun m!94643 () Bool)

(assert (=> b!60042 m!94643))

(assert (=> b!60042 m!94641))

(declare-fun m!94645 () Bool)

(assert (=> b!60042 m!94645))

(declare-fun m!94647 () Bool)

(assert (=> b!60042 m!94647))

(declare-fun m!94649 () Bool)

(assert (=> b!60042 m!94649))

(declare-fun m!94651 () Bool)

(assert (=> b!60047 m!94651))

(declare-fun m!94653 () Bool)

(assert (=> start!11878 m!94653))

(declare-fun m!94655 () Bool)

(assert (=> start!11878 m!94655))

(push 1)

(assert (not b!60049))

(assert (not b!60045))

(assert (not b!60048))

(assert (not b!60055))

(assert (not b!60050))

(assert (not start!11878))

(assert (not b!60047))

(assert (not b!60044))

(assert (not b!60051))

(assert (not b!60042))

(assert (not b!60053))

(assert (not b!60052))

(assert (not b!60043))

(check-sat)

(pop 1)

(push 1)

(check-sat)

