; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5722 () Bool)

(assert start!5722)

(declare-fun b!24798 () Bool)

(declare-fun res!21435 () Bool)

(declare-fun e!16938 () Bool)

(assert (=> b!24798 (=> res!21435 e!16938)))

(declare-datatypes ((array!1645 0))(
  ( (array!1646 (arr!1164 (Array (_ BitVec 32) (_ BitVec 8))) (size!708 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1248 0))(
  ( (BitStream!1249 (buf!1029 array!1645) (currentByte!2342 (_ BitVec 32)) (currentBit!2337 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!2059 0))(
  ( (Unit!2060) )
))
(declare-datatypes ((tuple2!2814 0))(
  ( (tuple2!2815 (_1!1494 Unit!2059) (_2!1494 BitStream!1248)) )
))
(declare-fun lt!35282 () tuple2!2814)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!24798 (= res!21435 (not (invariant!0 (currentBit!2337 (_2!1494 lt!35282)) (currentByte!2342 (_2!1494 lt!35282)) (size!708 (buf!1029 (_2!1494 lt!35282))))))))

(declare-fun b!24799 () Bool)

(assert (=> b!24799 (= e!16938 true)))

(declare-fun lt!35287 () tuple2!2814)

(declare-fun lt!35277 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!24799 (validate_offset_bits!1 ((_ sign_extend 32) (size!708 (buf!1029 (_2!1494 lt!35287)))) ((_ sign_extend 32) (currentByte!2342 (_2!1494 lt!35282))) ((_ sign_extend 32) (currentBit!2337 (_2!1494 lt!35282))) lt!35277)))

(declare-fun lt!35278 () Unit!2059)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1248 array!1645 (_ BitVec 64)) Unit!2059)

(assert (=> b!24799 (= lt!35278 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1494 lt!35282) (buf!1029 (_2!1494 lt!35287)) lt!35277))))

(declare-datatypes ((tuple2!2816 0))(
  ( (tuple2!2817 (_1!1495 BitStream!1248) (_2!1495 BitStream!1248)) )
))
(declare-fun lt!35286 () tuple2!2816)

(declare-fun reader!0 (BitStream!1248 BitStream!1248) tuple2!2816)

(assert (=> b!24799 (= lt!35286 (reader!0 (_2!1494 lt!35282) (_2!1494 lt!35287)))))

(declare-fun thiss!1379 () BitStream!1248)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!24799 (validate_offset_bits!1 ((_ sign_extend 32) (size!708 (buf!1029 (_2!1494 lt!35287)))) ((_ sign_extend 32) (currentByte!2342 thiss!1379)) ((_ sign_extend 32) (currentBit!2337 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!35280 () Unit!2059)

(assert (=> b!24799 (= lt!35280 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1029 (_2!1494 lt!35287)) (bvsub to!314 i!635)))))

(declare-fun lt!35279 () tuple2!2816)

(assert (=> b!24799 (= lt!35279 (reader!0 thiss!1379 (_2!1494 lt!35287)))))

(declare-fun b!24800 () Bool)

(declare-fun res!21432 () Bool)

(declare-fun e!16942 () Bool)

(assert (=> b!24800 (=> res!21432 e!16942)))

(assert (=> b!24800 (= res!21432 (not (= (size!708 (buf!1029 thiss!1379)) (size!708 (buf!1029 (_2!1494 lt!35287))))))))

(declare-fun b!24801 () Bool)

(declare-fun res!21429 () Bool)

(assert (=> b!24801 (=> res!21429 e!16942)))

(assert (=> b!24801 (= res!21429 (not (invariant!0 (currentBit!2337 (_2!1494 lt!35287)) (currentByte!2342 (_2!1494 lt!35287)) (size!708 (buf!1029 (_2!1494 lt!35287))))))))

(declare-fun b!24802 () Bool)

(declare-fun e!16941 () Bool)

(assert (=> b!24802 (= e!16941 e!16942)))

(declare-fun res!21434 () Bool)

(assert (=> b!24802 (=> res!21434 e!16942)))

(declare-fun lt!35281 () (_ BitVec 64))

(declare-fun lt!35285 () (_ BitVec 64))

(assert (=> b!24802 (= res!21434 (not (= lt!35281 (bvsub (bvadd lt!35285 to!314) i!635))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!24802 (= lt!35281 (bitIndex!0 (size!708 (buf!1029 (_2!1494 lt!35287))) (currentByte!2342 (_2!1494 lt!35287)) (currentBit!2337 (_2!1494 lt!35287))))))

(declare-fun b!24803 () Bool)

(declare-fun res!21433 () Bool)

(assert (=> b!24803 (=> res!21433 e!16938)))

(assert (=> b!24803 (= res!21433 (not (invariant!0 (currentBit!2337 (_2!1494 lt!35282)) (currentByte!2342 (_2!1494 lt!35282)) (size!708 (buf!1029 (_2!1494 lt!35287))))))))

(declare-fun b!24804 () Bool)

(declare-fun e!16936 () Bool)

(declare-fun e!16944 () Bool)

(assert (=> b!24804 (= e!16936 e!16944)))

(declare-fun res!21430 () Bool)

(assert (=> b!24804 (=> res!21430 e!16944)))

(declare-fun isPrefixOf!0 (BitStream!1248 BitStream!1248) Bool)

(assert (=> b!24804 (= res!21430 (not (isPrefixOf!0 thiss!1379 (_2!1494 lt!35282))))))

(assert (=> b!24804 (validate_offset_bits!1 ((_ sign_extend 32) (size!708 (buf!1029 (_2!1494 lt!35282)))) ((_ sign_extend 32) (currentByte!2342 (_2!1494 lt!35282))) ((_ sign_extend 32) (currentBit!2337 (_2!1494 lt!35282))) lt!35277)))

(assert (=> b!24804 (= lt!35277 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!35275 () Unit!2059)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1248 BitStream!1248 (_ BitVec 64) (_ BitVec 64)) Unit!2059)

(assert (=> b!24804 (= lt!35275 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1494 lt!35282) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!1645)

(declare-fun appendBitFromByte!0 (BitStream!1248 (_ BitVec 8) (_ BitVec 32)) tuple2!2814)

(assert (=> b!24804 (= lt!35282 (appendBitFromByte!0 thiss!1379 (select (arr!1164 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!24805 () Bool)

(declare-fun e!16943 () Bool)

(assert (=> b!24805 (= e!16943 (not e!16936))))

(declare-fun res!21426 () Bool)

(assert (=> b!24805 (=> res!21426 e!16936)))

(assert (=> b!24805 (= res!21426 (bvsge i!635 to!314))))

(assert (=> b!24805 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!35284 () Unit!2059)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1248) Unit!2059)

(assert (=> b!24805 (= lt!35284 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!24805 (= lt!35285 (bitIndex!0 (size!708 (buf!1029 thiss!1379)) (currentByte!2342 thiss!1379) (currentBit!2337 thiss!1379)))))

(declare-fun b!24806 () Bool)

(assert (=> b!24806 (= e!16942 e!16938)))

(declare-fun res!21427 () Bool)

(assert (=> b!24806 (=> res!21427 e!16938)))

(assert (=> b!24806 (= res!21427 (not (= (size!708 (buf!1029 (_2!1494 lt!35282))) (size!708 (buf!1029 (_2!1494 lt!35287))))))))

(declare-fun e!16945 () Bool)

(assert (=> b!24806 e!16945))

(declare-fun res!21423 () Bool)

(assert (=> b!24806 (=> (not res!21423) (not e!16945))))

(assert (=> b!24806 (= res!21423 (= (size!708 (buf!1029 (_2!1494 lt!35287))) (size!708 (buf!1029 thiss!1379))))))

(declare-fun b!24807 () Bool)

(assert (=> b!24807 (= e!16944 e!16941)))

(declare-fun res!21425 () Bool)

(assert (=> b!24807 (=> res!21425 e!16941)))

(assert (=> b!24807 (= res!21425 (not (isPrefixOf!0 (_2!1494 lt!35282) (_2!1494 lt!35287))))))

(assert (=> b!24807 (isPrefixOf!0 thiss!1379 (_2!1494 lt!35287))))

(declare-fun lt!35274 () Unit!2059)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1248 BitStream!1248 BitStream!1248) Unit!2059)

(assert (=> b!24807 (= lt!35274 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1494 lt!35282) (_2!1494 lt!35287)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1248 array!1645 (_ BitVec 64) (_ BitVec 64)) tuple2!2814)

(assert (=> b!24807 (= lt!35287 (appendBitsMSBFirstLoop!0 (_2!1494 lt!35282) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!16940 () Bool)

(assert (=> b!24807 e!16940))

(declare-fun res!21424 () Bool)

(assert (=> b!24807 (=> (not res!21424) (not e!16940))))

(assert (=> b!24807 (= res!21424 (validate_offset_bits!1 ((_ sign_extend 32) (size!708 (buf!1029 (_2!1494 lt!35282)))) ((_ sign_extend 32) (currentByte!2342 thiss!1379)) ((_ sign_extend 32) (currentBit!2337 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!35276 () Unit!2059)

(assert (=> b!24807 (= lt!35276 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1029 (_2!1494 lt!35282)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!35283 () tuple2!2816)

(assert (=> b!24807 (= lt!35283 (reader!0 thiss!1379 (_2!1494 lt!35282)))))

(declare-fun b!24808 () Bool)

(declare-datatypes ((List!325 0))(
  ( (Nil!322) (Cons!321 (h!440 Bool) (t!1075 List!325)) )
))
(declare-fun head!162 (List!325) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1248 array!1645 (_ BitVec 64) (_ BitVec 64)) List!325)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1248 BitStream!1248 (_ BitVec 64)) List!325)

(assert (=> b!24808 (= e!16940 (= (head!162 (byteArrayBitContentToList!0 (_2!1494 lt!35282) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!162 (bitStreamReadBitsIntoList!0 (_2!1494 lt!35282) (_1!1495 lt!35283) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!24809 () Bool)

(declare-fun res!21428 () Bool)

(assert (=> b!24809 (=> (not res!21428) (not e!16943))))

(assert (=> b!24809 (= res!21428 (validate_offset_bits!1 ((_ sign_extend 32) (size!708 (buf!1029 thiss!1379))) ((_ sign_extend 32) (currentByte!2342 thiss!1379)) ((_ sign_extend 32) (currentBit!2337 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!24810 () Bool)

(assert (=> b!24810 (= e!16945 (= lt!35281 (bvsub (bvsub (bvadd (bitIndex!0 (size!708 (buf!1029 (_2!1494 lt!35282))) (currentByte!2342 (_2!1494 lt!35282)) (currentBit!2337 (_2!1494 lt!35282))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!24811 () Bool)

(declare-fun e!16937 () Bool)

(declare-fun array_inv!677 (array!1645) Bool)

(assert (=> b!24811 (= e!16937 (array_inv!677 (buf!1029 thiss!1379)))))

(declare-fun res!21431 () Bool)

(assert (=> start!5722 (=> (not res!21431) (not e!16943))))

(assert (=> start!5722 (= res!21431 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!708 srcBuffer!2))))))))

(assert (=> start!5722 e!16943))

(assert (=> start!5722 true))

(assert (=> start!5722 (array_inv!677 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1248) Bool)

(assert (=> start!5722 (and (inv!12 thiss!1379) e!16937)))

(assert (= (and start!5722 res!21431) b!24809))

(assert (= (and b!24809 res!21428) b!24805))

(assert (= (and b!24805 (not res!21426)) b!24804))

(assert (= (and b!24804 (not res!21430)) b!24807))

(assert (= (and b!24807 res!21424) b!24808))

(assert (= (and b!24807 (not res!21425)) b!24802))

(assert (= (and b!24802 (not res!21434)) b!24801))

(assert (= (and b!24801 (not res!21429)) b!24800))

(assert (= (and b!24800 (not res!21432)) b!24806))

(assert (= (and b!24806 res!21423) b!24810))

(assert (= (and b!24806 (not res!21427)) b!24798))

(assert (= (and b!24798 (not res!21435)) b!24803))

(assert (= (and b!24803 (not res!21433)) b!24799))

(assert (= start!5722 b!24811))

(declare-fun m!35093 () Bool)

(assert (=> start!5722 m!35093))

(declare-fun m!35095 () Bool)

(assert (=> start!5722 m!35095))

(declare-fun m!35097 () Bool)

(assert (=> b!24810 m!35097))

(declare-fun m!35099 () Bool)

(assert (=> b!24811 m!35099))

(declare-fun m!35101 () Bool)

(assert (=> b!24798 m!35101))

(declare-fun m!35103 () Bool)

(assert (=> b!24805 m!35103))

(declare-fun m!35105 () Bool)

(assert (=> b!24805 m!35105))

(declare-fun m!35107 () Bool)

(assert (=> b!24805 m!35107))

(declare-fun m!35109 () Bool)

(assert (=> b!24809 m!35109))

(declare-fun m!35111 () Bool)

(assert (=> b!24803 m!35111))

(declare-fun m!35113 () Bool)

(assert (=> b!24804 m!35113))

(declare-fun m!35115 () Bool)

(assert (=> b!24804 m!35115))

(declare-fun m!35117 () Bool)

(assert (=> b!24804 m!35117))

(declare-fun m!35119 () Bool)

(assert (=> b!24804 m!35119))

(assert (=> b!24804 m!35117))

(declare-fun m!35121 () Bool)

(assert (=> b!24804 m!35121))

(declare-fun m!35123 () Bool)

(assert (=> b!24808 m!35123))

(assert (=> b!24808 m!35123))

(declare-fun m!35125 () Bool)

(assert (=> b!24808 m!35125))

(declare-fun m!35127 () Bool)

(assert (=> b!24808 m!35127))

(assert (=> b!24808 m!35127))

(declare-fun m!35129 () Bool)

(assert (=> b!24808 m!35129))

(declare-fun m!35131 () Bool)

(assert (=> b!24801 m!35131))

(declare-fun m!35133 () Bool)

(assert (=> b!24799 m!35133))

(declare-fun m!35135 () Bool)

(assert (=> b!24799 m!35135))

(declare-fun m!35137 () Bool)

(assert (=> b!24799 m!35137))

(declare-fun m!35139 () Bool)

(assert (=> b!24799 m!35139))

(declare-fun m!35141 () Bool)

(assert (=> b!24799 m!35141))

(declare-fun m!35143 () Bool)

(assert (=> b!24799 m!35143))

(declare-fun m!35145 () Bool)

(assert (=> b!24802 m!35145))

(declare-fun m!35147 () Bool)

(assert (=> b!24807 m!35147))

(declare-fun m!35149 () Bool)

(assert (=> b!24807 m!35149))

(declare-fun m!35151 () Bool)

(assert (=> b!24807 m!35151))

(declare-fun m!35153 () Bool)

(assert (=> b!24807 m!35153))

(declare-fun m!35155 () Bool)

(assert (=> b!24807 m!35155))

(declare-fun m!35157 () Bool)

(assert (=> b!24807 m!35157))

(declare-fun m!35159 () Bool)

(assert (=> b!24807 m!35159))

(check-sat (not start!5722) (not b!24802) (not b!24810) (not b!24804) (not b!24799) (not b!24811) (not b!24808) (not b!24803) (not b!24801) (not b!24809) (not b!24798) (not b!24807) (not b!24805))
