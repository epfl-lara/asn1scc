; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!11874 () Bool)

(assert start!11874)

(declare-fun b!59958 () Bool)

(declare-fun res!49954 () Bool)

(declare-fun e!39953 () Bool)

(assert (=> b!59958 (=> (not res!49954) (not e!39953))))

(declare-datatypes ((array!2731 0))(
  ( (array!2732 (arr!1805 (Array (_ BitVec 32) (_ BitVec 8))) (size!1241 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2170 0))(
  ( (BitStream!2171 (buf!1622 array!2731) (currentByte!3240 (_ BitVec 32)) (currentBit!3235 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2170)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!59958 (= res!49954 (validate_offset_bits!1 ((_ sign_extend 32) (size!1241 (buf!1622 thiss!1379))) ((_ sign_extend 32) (currentByte!3240 thiss!1379)) ((_ sign_extend 32) (currentBit!3235 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun srcBuffer!2 () array!2731)

(declare-datatypes ((tuple2!5462 0))(
  ( (tuple2!5463 (_1!2842 BitStream!2170) (_2!2842 BitStream!2170)) )
))
(declare-fun lt!93787 () tuple2!5462)

(declare-datatypes ((Unit!4105 0))(
  ( (Unit!4106) )
))
(declare-datatypes ((tuple2!5464 0))(
  ( (tuple2!5465 (_1!2843 Unit!4105) (_2!2843 BitStream!2170)) )
))
(declare-fun lt!93779 () tuple2!5464)

(declare-fun e!39952 () Bool)

(declare-fun b!59959 () Bool)

(declare-datatypes ((List!660 0))(
  ( (Nil!657) (Cons!656 (h!775 Bool) (t!1410 List!660)) )
))
(declare-fun head!479 (List!660) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2170 array!2731 (_ BitVec 64) (_ BitVec 64)) List!660)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2170 BitStream!2170 (_ BitVec 64)) List!660)

(assert (=> b!59959 (= e!39952 (= (head!479 (byteArrayBitContentToList!0 (_2!2843 lt!93779) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!479 (bitStreamReadBitsIntoList!0 (_2!2843 lt!93779) (_1!2842 lt!93787) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!59960 () Bool)

(declare-fun res!49955 () Bool)

(declare-fun e!39959 () Bool)

(assert (=> b!59960 (=> res!49955 e!39959)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!59960 (= res!49955 (not (invariant!0 (currentBit!3235 (_2!2843 lt!93779)) (currentByte!3240 (_2!2843 lt!93779)) (size!1241 (buf!1622 (_2!2843 lt!93779))))))))

(declare-fun b!59961 () Bool)

(declare-fun res!49952 () Bool)

(declare-fun e!39955 () Bool)

(assert (=> b!59961 (=> res!49952 e!39955)))

(declare-fun lt!93784 () tuple2!5464)

(assert (=> b!59961 (= res!49952 (not (invariant!0 (currentBit!3235 (_2!2843 lt!93784)) (currentByte!3240 (_2!2843 lt!93784)) (size!1241 (buf!1622 (_2!2843 lt!93784))))))))

(declare-fun res!49957 () Bool)

(assert (=> start!11874 (=> (not res!49957) (not e!39953))))

(assert (=> start!11874 (= res!49957 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1241 srcBuffer!2))))))))

(assert (=> start!11874 e!39953))

(assert (=> start!11874 true))

(declare-fun array_inv!1144 (array!2731) Bool)

(assert (=> start!11874 (array_inv!1144 srcBuffer!2)))

(declare-fun e!39957 () Bool)

(declare-fun inv!12 (BitStream!2170) Bool)

(assert (=> start!11874 (and (inv!12 thiss!1379) e!39957)))

(declare-fun b!59962 () Bool)

(declare-fun e!39961 () Bool)

(declare-fun e!39954 () Bool)

(assert (=> b!59962 (= e!39961 e!39954)))

(declare-fun res!49956 () Bool)

(assert (=> b!59962 (=> res!49956 e!39954)))

(declare-fun isPrefixOf!0 (BitStream!2170 BitStream!2170) Bool)

(assert (=> b!59962 (= res!49956 (not (isPrefixOf!0 (_2!2843 lt!93779) (_2!2843 lt!93784))))))

(assert (=> b!59962 (isPrefixOf!0 thiss!1379 (_2!2843 lt!93784))))

(declare-fun lt!93782 () Unit!4105)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2170 BitStream!2170 BitStream!2170) Unit!4105)

(assert (=> b!59962 (= lt!93782 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2843 lt!93779) (_2!2843 lt!93784)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2170 array!2731 (_ BitVec 64) (_ BitVec 64)) tuple2!5464)

(assert (=> b!59962 (= lt!93784 (appendBitsMSBFirstLoop!0 (_2!2843 lt!93779) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!59962 e!39952))

(declare-fun res!49951 () Bool)

(assert (=> b!59962 (=> (not res!49951) (not e!39952))))

(assert (=> b!59962 (= res!49951 (validate_offset_bits!1 ((_ sign_extend 32) (size!1241 (buf!1622 (_2!2843 lt!93779)))) ((_ sign_extend 32) (currentByte!3240 thiss!1379)) ((_ sign_extend 32) (currentBit!3235 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!93780 () Unit!4105)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2170 array!2731 (_ BitVec 64)) Unit!4105)

(assert (=> b!59962 (= lt!93780 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1622 (_2!2843 lt!93779)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!2170 BitStream!2170) tuple2!5462)

(assert (=> b!59962 (= lt!93787 (reader!0 thiss!1379 (_2!2843 lt!93779)))))

(declare-fun b!59963 () Bool)

(assert (=> b!59963 (= e!39955 e!39959)))

(declare-fun res!49948 () Bool)

(assert (=> b!59963 (=> res!49948 e!39959)))

(assert (=> b!59963 (= res!49948 (not (= (size!1241 (buf!1622 (_2!2843 lt!93779))) (size!1241 (buf!1622 (_2!2843 lt!93784))))))))

(declare-fun e!39960 () Bool)

(assert (=> b!59963 e!39960))

(declare-fun res!49958 () Bool)

(assert (=> b!59963 (=> (not res!49958) (not e!39960))))

(assert (=> b!59963 (= res!49958 (= (size!1241 (buf!1622 (_2!2843 lt!93784))) (size!1241 (buf!1622 thiss!1379))))))

(declare-fun b!59964 () Bool)

(declare-fun res!49950 () Bool)

(assert (=> b!59964 (=> res!49950 e!39955)))

(assert (=> b!59964 (= res!49950 (not (= (size!1241 (buf!1622 thiss!1379)) (size!1241 (buf!1622 (_2!2843 lt!93784))))))))

(declare-fun b!59965 () Bool)

(declare-fun lt!93777 () (_ BitVec 64))

(declare-fun lt!93789 () (_ BitVec 64))

(assert (=> b!59965 (= e!39959 (or (= lt!93777 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!93777 (bvand lt!93789 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!59965 (= lt!93777 (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!93785 () List!660)

(declare-fun lt!93783 () tuple2!5462)

(assert (=> b!59965 (= lt!93785 (bitStreamReadBitsIntoList!0 (_2!2843 lt!93784) (_1!2842 lt!93783) (bvsub to!314 i!635)))))

(assert (=> b!59965 (validate_offset_bits!1 ((_ sign_extend 32) (size!1241 (buf!1622 (_2!2843 lt!93784)))) ((_ sign_extend 32) (currentByte!3240 (_2!2843 lt!93779))) ((_ sign_extend 32) (currentBit!3235 (_2!2843 lt!93779))) lt!93789)))

(declare-fun lt!93776 () Unit!4105)

(assert (=> b!59965 (= lt!93776 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2843 lt!93779) (buf!1622 (_2!2843 lt!93784)) lt!93789))))

(declare-fun lt!93778 () tuple2!5462)

(assert (=> b!59965 (= lt!93778 (reader!0 (_2!2843 lt!93779) (_2!2843 lt!93784)))))

(assert (=> b!59965 (validate_offset_bits!1 ((_ sign_extend 32) (size!1241 (buf!1622 (_2!2843 lt!93784)))) ((_ sign_extend 32) (currentByte!3240 thiss!1379)) ((_ sign_extend 32) (currentBit!3235 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!93781 () Unit!4105)

(assert (=> b!59965 (= lt!93781 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1622 (_2!2843 lt!93784)) (bvsub to!314 i!635)))))

(assert (=> b!59965 (= lt!93783 (reader!0 thiss!1379 (_2!2843 lt!93784)))))

(declare-fun b!59966 () Bool)

(declare-fun e!39962 () Bool)

(assert (=> b!59966 (= e!39953 (not e!39962))))

(declare-fun res!49959 () Bool)

(assert (=> b!59966 (=> res!49959 e!39962)))

(assert (=> b!59966 (= res!49959 (bvsge i!635 to!314))))

(assert (=> b!59966 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!93786 () Unit!4105)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2170) Unit!4105)

(assert (=> b!59966 (= lt!93786 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!93790 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!59966 (= lt!93790 (bitIndex!0 (size!1241 (buf!1622 thiss!1379)) (currentByte!3240 thiss!1379) (currentBit!3235 thiss!1379)))))

(declare-fun b!59967 () Bool)

(assert (=> b!59967 (= e!39962 e!39961)))

(declare-fun res!49953 () Bool)

(assert (=> b!59967 (=> res!49953 e!39961)))

(assert (=> b!59967 (= res!49953 (not (isPrefixOf!0 thiss!1379 (_2!2843 lt!93779))))))

(assert (=> b!59967 (validate_offset_bits!1 ((_ sign_extend 32) (size!1241 (buf!1622 (_2!2843 lt!93779)))) ((_ sign_extend 32) (currentByte!3240 (_2!2843 lt!93779))) ((_ sign_extend 32) (currentBit!3235 (_2!2843 lt!93779))) lt!93789)))

(assert (=> b!59967 (= lt!93789 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!93788 () Unit!4105)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2170 BitStream!2170 (_ BitVec 64) (_ BitVec 64)) Unit!4105)

(assert (=> b!59967 (= lt!93788 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2843 lt!93779) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2170 (_ BitVec 8) (_ BitVec 32)) tuple2!5464)

(assert (=> b!59967 (= lt!93779 (appendBitFromByte!0 thiss!1379 (select (arr!1805 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!59968 () Bool)

(declare-fun lt!93775 () (_ BitVec 64))

(assert (=> b!59968 (= e!39960 (= lt!93775 (bvsub (bvsub (bvadd (bitIndex!0 (size!1241 (buf!1622 (_2!2843 lt!93779))) (currentByte!3240 (_2!2843 lt!93779)) (currentBit!3235 (_2!2843 lt!93779))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!59969 () Bool)

(declare-fun res!49949 () Bool)

(assert (=> b!59969 (=> res!49949 e!39959)))

(assert (=> b!59969 (= res!49949 (not (invariant!0 (currentBit!3235 (_2!2843 lt!93779)) (currentByte!3240 (_2!2843 lt!93779)) (size!1241 (buf!1622 (_2!2843 lt!93784))))))))

(declare-fun b!59970 () Bool)

(assert (=> b!59970 (= e!39954 e!39955)))

(declare-fun res!49947 () Bool)

(assert (=> b!59970 (=> res!49947 e!39955)))

(assert (=> b!59970 (= res!49947 (not (= lt!93775 (bvsub (bvadd lt!93790 to!314) i!635))))))

(assert (=> b!59970 (= lt!93775 (bitIndex!0 (size!1241 (buf!1622 (_2!2843 lt!93784))) (currentByte!3240 (_2!2843 lt!93784)) (currentBit!3235 (_2!2843 lt!93784))))))

(declare-fun b!59971 () Bool)

(assert (=> b!59971 (= e!39957 (array_inv!1144 (buf!1622 thiss!1379)))))

(assert (= (and start!11874 res!49957) b!59958))

(assert (= (and b!59958 res!49954) b!59966))

(assert (= (and b!59966 (not res!49959)) b!59967))

(assert (= (and b!59967 (not res!49953)) b!59962))

(assert (= (and b!59962 res!49951) b!59959))

(assert (= (and b!59962 (not res!49956)) b!59970))

(assert (= (and b!59970 (not res!49947)) b!59961))

(assert (= (and b!59961 (not res!49952)) b!59964))

(assert (= (and b!59964 (not res!49950)) b!59963))

(assert (= (and b!59963 res!49958) b!59968))

(assert (= (and b!59963 (not res!49948)) b!59960))

(assert (= (and b!59960 (not res!49955)) b!59969))

(assert (= (and b!59969 (not res!49949)) b!59965))

(assert (= start!11874 b!59971))

(declare-fun m!94447 () Bool)

(assert (=> start!11874 m!94447))

(declare-fun m!94449 () Bool)

(assert (=> start!11874 m!94449))

(declare-fun m!94451 () Bool)

(assert (=> b!59967 m!94451))

(declare-fun m!94453 () Bool)

(assert (=> b!59967 m!94453))

(declare-fun m!94455 () Bool)

(assert (=> b!59967 m!94455))

(assert (=> b!59967 m!94453))

(declare-fun m!94457 () Bool)

(assert (=> b!59967 m!94457))

(declare-fun m!94459 () Bool)

(assert (=> b!59967 m!94459))

(declare-fun m!94461 () Bool)

(assert (=> b!59970 m!94461))

(declare-fun m!94463 () Bool)

(assert (=> b!59965 m!94463))

(declare-fun m!94465 () Bool)

(assert (=> b!59965 m!94465))

(declare-fun m!94467 () Bool)

(assert (=> b!59965 m!94467))

(declare-fun m!94469 () Bool)

(assert (=> b!59965 m!94469))

(declare-fun m!94471 () Bool)

(assert (=> b!59965 m!94471))

(declare-fun m!94473 () Bool)

(assert (=> b!59965 m!94473))

(declare-fun m!94475 () Bool)

(assert (=> b!59965 m!94475))

(declare-fun m!94477 () Bool)

(assert (=> b!59968 m!94477))

(declare-fun m!94479 () Bool)

(assert (=> b!59966 m!94479))

(declare-fun m!94481 () Bool)

(assert (=> b!59966 m!94481))

(declare-fun m!94483 () Bool)

(assert (=> b!59966 m!94483))

(declare-fun m!94485 () Bool)

(assert (=> b!59959 m!94485))

(assert (=> b!59959 m!94485))

(declare-fun m!94487 () Bool)

(assert (=> b!59959 m!94487))

(declare-fun m!94489 () Bool)

(assert (=> b!59959 m!94489))

(assert (=> b!59959 m!94489))

(declare-fun m!94491 () Bool)

(assert (=> b!59959 m!94491))

(declare-fun m!94493 () Bool)

(assert (=> b!59960 m!94493))

(declare-fun m!94495 () Bool)

(assert (=> b!59971 m!94495))

(declare-fun m!94497 () Bool)

(assert (=> b!59962 m!94497))

(declare-fun m!94499 () Bool)

(assert (=> b!59962 m!94499))

(declare-fun m!94501 () Bool)

(assert (=> b!59962 m!94501))

(declare-fun m!94503 () Bool)

(assert (=> b!59962 m!94503))

(declare-fun m!94505 () Bool)

(assert (=> b!59962 m!94505))

(declare-fun m!94507 () Bool)

(assert (=> b!59962 m!94507))

(declare-fun m!94509 () Bool)

(assert (=> b!59962 m!94509))

(declare-fun m!94511 () Bool)

(assert (=> b!59961 m!94511))

(declare-fun m!94513 () Bool)

(assert (=> b!59969 m!94513))

(declare-fun m!94515 () Bool)

(assert (=> b!59958 m!94515))

(push 1)

(assert (not b!59959))

(assert (not b!59965))

(assert (not start!11874))

(assert (not b!59966))

(assert (not b!59971))

(assert (not b!59967))

(assert (not b!59958))

(assert (not b!59962))

(assert (not b!59961))

(assert (not b!59968))

(assert (not b!59969))

(assert (not b!59960))

(assert (not b!59970))

(check-sat)

(pop 1)

(push 1)

(check-sat)

