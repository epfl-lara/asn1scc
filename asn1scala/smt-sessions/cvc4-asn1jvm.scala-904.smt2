; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25502 () Bool)

(assert start!25502)

(declare-fun b!129237 () Bool)

(declare-fun res!107007 () Bool)

(declare-fun e!85669 () Bool)

(assert (=> b!129237 (=> (not res!107007) (not e!85669))))

(declare-datatypes ((array!5987 0))(
  ( (array!5988 (arr!3326 (Array (_ BitVec 32) (_ BitVec 8))) (size!2709 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4682 0))(
  ( (BitStream!4683 (buf!3067 array!5987) (currentByte!5828 (_ BitVec 32)) (currentBit!5823 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!4682)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!129237 (= res!107007 (invariant!0 (currentBit!5823 thiss!1634) (currentByte!5828 thiss!1634) (size!2709 (buf!3067 thiss!1634))))))

(declare-fun arr!237 () array!5987)

(declare-fun e!85667 () Bool)

(declare-datatypes ((tuple2!11030 0))(
  ( (tuple2!11031 (_1!5812 BitStream!4682) (_2!5812 BitStream!4682)) )
))
(declare-fun lt!199897 () tuple2!11030)

(declare-fun from!447 () (_ BitVec 32))

(declare-datatypes ((tuple2!11032 0))(
  ( (tuple2!11033 (_1!5813 BitStream!4682) (_2!5813 (_ BitVec 8))) )
))
(declare-fun lt!199895 () tuple2!11032)

(declare-fun b!129238 () Bool)

(assert (=> b!129238 (= e!85667 (and (= (_2!5813 lt!199895) (select (arr!3326 arr!237) from!447)) (= (_1!5813 lt!199895) (_2!5812 lt!199897))))))

(declare-fun readBytePure!0 (BitStream!4682) tuple2!11032)

(assert (=> b!129238 (= lt!199895 (readBytePure!0 (_1!5812 lt!199897)))))

(declare-datatypes ((Unit!8023 0))(
  ( (Unit!8024) )
))
(declare-datatypes ((tuple2!11034 0))(
  ( (tuple2!11035 (_1!5814 Unit!8023) (_2!5814 BitStream!4682)) )
))
(declare-fun lt!199892 () tuple2!11034)

(declare-fun reader!0 (BitStream!4682 BitStream!4682) tuple2!11030)

(assert (=> b!129238 (= lt!199897 (reader!0 thiss!1634 (_2!5814 lt!199892)))))

(declare-fun b!129239 () Bool)

(declare-fun res!107012 () Bool)

(assert (=> b!129239 (=> (not res!107012) (not e!85669))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!129239 (= res!107012 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2709 (buf!3067 thiss!1634))) ((_ sign_extend 32) (currentByte!5828 thiss!1634)) ((_ sign_extend 32) (currentBit!5823 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun res!107013 () Bool)

(assert (=> start!25502 (=> (not res!107013) (not e!85669))))

(assert (=> start!25502 (= res!107013 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2709 arr!237))))))

(assert (=> start!25502 e!85669))

(assert (=> start!25502 true))

(declare-fun array_inv!2498 (array!5987) Bool)

(assert (=> start!25502 (array_inv!2498 arr!237)))

(declare-fun e!85663 () Bool)

(declare-fun inv!12 (BitStream!4682) Bool)

(assert (=> start!25502 (and (inv!12 thiss!1634) e!85663)))

(declare-fun b!129240 () Bool)

(declare-fun res!107016 () Bool)

(assert (=> b!129240 (=> (not res!107016) (not e!85669))))

(assert (=> b!129240 (= res!107016 (bvslt from!447 to!404))))

(declare-fun b!129241 () Bool)

(declare-fun e!85664 () Bool)

(declare-fun e!85666 () Bool)

(assert (=> b!129241 (= e!85664 e!85666)))

(declare-fun res!107015 () Bool)

(assert (=> b!129241 (=> (not res!107015) (not e!85666))))

(declare-fun lt!199893 () tuple2!11034)

(declare-fun lt!199888 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!129241 (= res!107015 (= (bitIndex!0 (size!2709 (buf!3067 (_2!5814 lt!199893))) (currentByte!5828 (_2!5814 lt!199893)) (currentBit!5823 (_2!5814 lt!199893))) (bvadd (bitIndex!0 (size!2709 (buf!3067 (_2!5814 lt!199892))) (currentByte!5828 (_2!5814 lt!199892)) (currentBit!5823 (_2!5814 lt!199892))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!199888))))))

(assert (=> b!129241 (= lt!199888 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!129242 () Bool)

(declare-fun res!107011 () Bool)

(assert (=> b!129242 (=> (not res!107011) (not e!85667))))

(declare-fun isPrefixOf!0 (BitStream!4682 BitStream!4682) Bool)

(assert (=> b!129242 (= res!107011 (isPrefixOf!0 thiss!1634 (_2!5814 lt!199892)))))

(declare-fun b!129243 () Bool)

(declare-fun e!85670 () Bool)

(assert (=> b!129243 (= e!85666 (not e!85670))))

(declare-fun res!107014 () Bool)

(assert (=> b!129243 (=> res!107014 e!85670)))

(declare-fun lt!199891 () tuple2!11030)

(declare-datatypes ((tuple2!11036 0))(
  ( (tuple2!11037 (_1!5815 BitStream!4682) (_2!5815 array!5987)) )
))
(declare-fun lt!199896 () tuple2!11036)

(assert (=> b!129243 (= res!107014 (or (not (= (size!2709 (_2!5815 lt!199896)) (size!2709 arr!237))) (not (= (_1!5815 lt!199896) (_2!5812 lt!199891)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!4682 array!5987 (_ BitVec 32) (_ BitVec 32)) tuple2!11036)

(assert (=> b!129243 (= lt!199896 (readByteArrayLoopPure!0 (_1!5812 lt!199891) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!129243 (validate_offset_bits!1 ((_ sign_extend 32) (size!2709 (buf!3067 (_2!5814 lt!199893)))) ((_ sign_extend 32) (currentByte!5828 (_2!5814 lt!199892))) ((_ sign_extend 32) (currentBit!5823 (_2!5814 lt!199892))) lt!199888)))

(declare-fun lt!199898 () Unit!8023)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4682 array!5987 (_ BitVec 64)) Unit!8023)

(assert (=> b!129243 (= lt!199898 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5814 lt!199892) (buf!3067 (_2!5814 lt!199893)) lt!199888))))

(assert (=> b!129243 (= lt!199891 (reader!0 (_2!5814 lt!199892) (_2!5814 lt!199893)))))

(declare-fun b!129244 () Bool)

(assert (=> b!129244 (= e!85669 (not true))))

(declare-fun lt!199890 () Bool)

(assert (=> b!129244 (= lt!199890 (isPrefixOf!0 (_2!5814 lt!199892) (_2!5814 lt!199893)))))

(declare-fun lt!199894 () Bool)

(assert (=> b!129244 (= lt!199894 (isPrefixOf!0 thiss!1634 (_2!5814 lt!199892)))))

(assert (=> b!129244 e!85664))

(declare-fun res!107010 () Bool)

(assert (=> b!129244 (=> (not res!107010) (not e!85664))))

(assert (=> b!129244 (= res!107010 (= (size!2709 (buf!3067 (_2!5814 lt!199892))) (size!2709 (buf!3067 (_2!5814 lt!199893)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4682 array!5987 (_ BitVec 32) (_ BitVec 32)) tuple2!11034)

(assert (=> b!129244 (= lt!199893 (appendByteArrayLoop!0 (_2!5814 lt!199892) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!129244 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2709 (buf!3067 (_2!5814 lt!199892)))) ((_ sign_extend 32) (currentByte!5828 (_2!5814 lt!199892))) ((_ sign_extend 32) (currentBit!5823 (_2!5814 lt!199892))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!199889 () Unit!8023)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4682 BitStream!4682 (_ BitVec 64) (_ BitVec 32)) Unit!8023)

(assert (=> b!129244 (= lt!199889 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!5814 lt!199892) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!129244 e!85667))

(declare-fun res!107008 () Bool)

(assert (=> b!129244 (=> (not res!107008) (not e!85667))))

(assert (=> b!129244 (= res!107008 (= (size!2709 (buf!3067 thiss!1634)) (size!2709 (buf!3067 (_2!5814 lt!199892)))))))

(declare-fun appendByte!0 (BitStream!4682 (_ BitVec 8)) tuple2!11034)

(assert (=> b!129244 (= lt!199892 (appendByte!0 thiss!1634 (select (arr!3326 arr!237) from!447)))))

(declare-fun b!129245 () Bool)

(declare-fun res!107009 () Bool)

(assert (=> b!129245 (=> (not res!107009) (not e!85667))))

(assert (=> b!129245 (= res!107009 (= (bitIndex!0 (size!2709 (buf!3067 (_2!5814 lt!199892))) (currentByte!5828 (_2!5814 lt!199892)) (currentBit!5823 (_2!5814 lt!199892))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2709 (buf!3067 thiss!1634)) (currentByte!5828 thiss!1634) (currentBit!5823 thiss!1634)))))))

(declare-fun b!129246 () Bool)

(declare-fun res!107017 () Bool)

(assert (=> b!129246 (=> (not res!107017) (not e!85666))))

(assert (=> b!129246 (= res!107017 (isPrefixOf!0 (_2!5814 lt!199892) (_2!5814 lt!199893)))))

(declare-fun b!129247 () Bool)

(assert (=> b!129247 (= e!85663 (array_inv!2498 (buf!3067 thiss!1634)))))

(declare-fun b!129248 () Bool)

(declare-fun arrayRangesEq!112 (array!5987 array!5987 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!129248 (= e!85670 (not (arrayRangesEq!112 arr!237 (_2!5815 lt!199896) #b00000000000000000000000000000000 to!404)))))

(assert (= (and start!25502 res!107013) b!129239))

(assert (= (and b!129239 res!107012) b!129240))

(assert (= (and b!129240 res!107016) b!129237))

(assert (= (and b!129237 res!107007) b!129244))

(assert (= (and b!129244 res!107008) b!129245))

(assert (= (and b!129245 res!107009) b!129242))

(assert (= (and b!129242 res!107011) b!129238))

(assert (= (and b!129244 res!107010) b!129241))

(assert (= (and b!129241 res!107015) b!129246))

(assert (= (and b!129246 res!107017) b!129243))

(assert (= (and b!129243 (not res!107014)) b!129248))

(assert (= start!25502 b!129247))

(declare-fun m!195041 () Bool)

(assert (=> b!129242 m!195041))

(declare-fun m!195043 () Bool)

(assert (=> b!129248 m!195043))

(declare-fun m!195045 () Bool)

(assert (=> b!129246 m!195045))

(declare-fun m!195047 () Bool)

(assert (=> b!129244 m!195047))

(assert (=> b!129244 m!195041))

(assert (=> b!129244 m!195045))

(declare-fun m!195049 () Bool)

(assert (=> b!129244 m!195049))

(declare-fun m!195051 () Bool)

(assert (=> b!129244 m!195051))

(declare-fun m!195053 () Bool)

(assert (=> b!129244 m!195053))

(declare-fun m!195055 () Bool)

(assert (=> b!129244 m!195055))

(assert (=> b!129244 m!195053))

(declare-fun m!195057 () Bool)

(assert (=> b!129237 m!195057))

(declare-fun m!195059 () Bool)

(assert (=> start!25502 m!195059))

(declare-fun m!195061 () Bool)

(assert (=> start!25502 m!195061))

(declare-fun m!195063 () Bool)

(assert (=> b!129245 m!195063))

(declare-fun m!195065 () Bool)

(assert (=> b!129245 m!195065))

(assert (=> b!129238 m!195053))

(declare-fun m!195067 () Bool)

(assert (=> b!129238 m!195067))

(declare-fun m!195069 () Bool)

(assert (=> b!129238 m!195069))

(declare-fun m!195071 () Bool)

(assert (=> b!129239 m!195071))

(declare-fun m!195073 () Bool)

(assert (=> b!129243 m!195073))

(declare-fun m!195075 () Bool)

(assert (=> b!129243 m!195075))

(declare-fun m!195077 () Bool)

(assert (=> b!129243 m!195077))

(declare-fun m!195079 () Bool)

(assert (=> b!129243 m!195079))

(declare-fun m!195081 () Bool)

(assert (=> b!129241 m!195081))

(assert (=> b!129241 m!195063))

(declare-fun m!195083 () Bool)

(assert (=> b!129247 m!195083))

(push 1)

