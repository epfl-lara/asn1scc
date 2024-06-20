; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27790 () Bool)

(assert start!27790)

(declare-fun b!143206 () Bool)

(declare-fun e!95388 () Bool)

(declare-datatypes ((array!6547 0))(
  ( (array!6548 (arr!3686 (Array (_ BitVec 32) (_ BitVec 8))) (size!2963 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5184 0))(
  ( (BitStream!5185 (buf!3392 array!6547) (currentByte!6276 (_ BitVec 32)) (currentBit!6271 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5184)

(declare-fun array_inv!2752 (array!6547) Bool)

(assert (=> b!143206 (= e!95388 (array_inv!2752 (buf!3392 thiss!1634)))))

(declare-fun b!143207 () Bool)

(declare-fun res!119589 () Bool)

(declare-fun e!95389 () Bool)

(assert (=> b!143207 (=> (not res!119589) (not e!95389))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!143207 (= res!119589 (invariant!0 (currentBit!6271 thiss!1634) (currentByte!6276 thiss!1634) (size!2963 (buf!3392 thiss!1634))))))

(declare-fun res!119585 () Bool)

(assert (=> start!27790 (=> (not res!119585) (not e!95389))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun arr!237 () array!6547)

(declare-fun from!447 () (_ BitVec 32))

(assert (=> start!27790 (= res!119585 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2963 arr!237))))))

(assert (=> start!27790 e!95389))

(assert (=> start!27790 true))

(assert (=> start!27790 (array_inv!2752 arr!237)))

(declare-fun inv!12 (BitStream!5184) Bool)

(assert (=> start!27790 (and (inv!12 thiss!1634) e!95388)))

(declare-fun b!143208 () Bool)

(declare-fun e!95390 () Bool)

(declare-datatypes ((tuple2!12736 0))(
  ( (tuple2!12737 (_1!6709 BitStream!5184) (_2!6709 (_ BitVec 8))) )
))
(declare-fun lt!222059 () tuple2!12736)

(declare-fun lt!222056 () tuple2!12736)

(assert (=> b!143208 (= e!95390 (= (_2!6709 lt!222059) (_2!6709 lt!222056)))))

(declare-fun b!143209 () Bool)

(declare-fun res!119582 () Bool)

(assert (=> b!143209 (=> (not res!119582) (not e!95389))))

(assert (=> b!143209 (= res!119582 (bvslt from!447 to!404))))

(declare-fun b!143210 () Bool)

(declare-fun e!95391 () Bool)

(declare-fun e!95385 () Bool)

(assert (=> b!143210 (= e!95391 (not e!95385))))

(declare-fun res!119591 () Bool)

(assert (=> b!143210 (=> res!119591 e!95385)))

(declare-datatypes ((tuple2!12738 0))(
  ( (tuple2!12739 (_1!6710 BitStream!5184) (_2!6710 array!6547)) )
))
(declare-fun lt!222054 () tuple2!12738)

(declare-datatypes ((tuple2!12740 0))(
  ( (tuple2!12741 (_1!6711 BitStream!5184) (_2!6711 BitStream!5184)) )
))
(declare-fun lt!222063 () tuple2!12740)

(assert (=> b!143210 (= res!119591 (or (not (= (size!2963 (_2!6710 lt!222054)) (size!2963 arr!237))) (not (= (_1!6710 lt!222054) (_2!6711 lt!222063)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!5184 array!6547 (_ BitVec 32) (_ BitVec 32)) tuple2!12738)

(assert (=> b!143210 (= lt!222054 (readByteArrayLoopPure!0 (_1!6711 lt!222063) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-datatypes ((Unit!8926 0))(
  ( (Unit!8927) )
))
(declare-datatypes ((tuple2!12742 0))(
  ( (tuple2!12743 (_1!6712 Unit!8926) (_2!6712 BitStream!5184)) )
))
(declare-fun lt!222064 () tuple2!12742)

(declare-fun lt!222049 () tuple2!12742)

(declare-fun lt!222051 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!143210 (validate_offset_bits!1 ((_ sign_extend 32) (size!2963 (buf!3392 (_2!6712 lt!222064)))) ((_ sign_extend 32) (currentByte!6276 (_2!6712 lt!222049))) ((_ sign_extend 32) (currentBit!6271 (_2!6712 lt!222049))) lt!222051)))

(declare-fun lt!222062 () Unit!8926)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5184 array!6547 (_ BitVec 64)) Unit!8926)

(assert (=> b!143210 (= lt!222062 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6712 lt!222049) (buf!3392 (_2!6712 lt!222064)) lt!222051))))

(declare-fun reader!0 (BitStream!5184 BitStream!5184) tuple2!12740)

(assert (=> b!143210 (= lt!222063 (reader!0 (_2!6712 lt!222049) (_2!6712 lt!222064)))))

(declare-fun b!143211 () Bool)

(declare-fun res!119592 () Bool)

(assert (=> b!143211 (=> (not res!119592) (not e!95389))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!143211 (= res!119592 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2963 (buf!3392 thiss!1634))) ((_ sign_extend 32) (currentByte!6276 thiss!1634)) ((_ sign_extend 32) (currentBit!6271 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!143212 () Bool)

(declare-fun arrayRangesEq!279 (array!6547 array!6547 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!143212 (= e!95385 (not (arrayRangesEq!279 arr!237 (_2!6710 lt!222054) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!143213 () Bool)

(declare-fun e!95387 () Bool)

(assert (=> b!143213 (= e!95387 (invariant!0 (currentBit!6271 thiss!1634) (currentByte!6276 thiss!1634) (size!2963 (buf!3392 (_2!6712 lt!222049)))))))

(declare-fun b!143214 () Bool)

(declare-fun res!119588 () Bool)

(declare-fun e!95384 () Bool)

(assert (=> b!143214 (=> (not res!119588) (not e!95384))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!143214 (= res!119588 (= (bitIndex!0 (size!2963 (buf!3392 (_2!6712 lt!222049))) (currentByte!6276 (_2!6712 lt!222049)) (currentBit!6271 (_2!6712 lt!222049))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2963 (buf!3392 thiss!1634)) (currentByte!6276 thiss!1634) (currentBit!6271 thiss!1634)))))))

(declare-fun b!143215 () Bool)

(declare-fun lt!222055 () tuple2!12740)

(declare-fun lt!222052 () tuple2!12736)

(assert (=> b!143215 (= e!95384 (and (= (_2!6709 lt!222052) (select (arr!3686 arr!237) from!447)) (= (_1!6709 lt!222052) (_2!6711 lt!222055))))))

(declare-fun readBytePure!0 (BitStream!5184) tuple2!12736)

(assert (=> b!143215 (= lt!222052 (readBytePure!0 (_1!6711 lt!222055)))))

(assert (=> b!143215 (= lt!222055 (reader!0 thiss!1634 (_2!6712 lt!222049)))))

(declare-fun b!143216 () Bool)

(declare-fun res!119587 () Bool)

(assert (=> b!143216 (=> (not res!119587) (not e!95391))))

(declare-fun isPrefixOf!0 (BitStream!5184 BitStream!5184) Bool)

(assert (=> b!143216 (= res!119587 (isPrefixOf!0 (_2!6712 lt!222049) (_2!6712 lt!222064)))))

(declare-fun b!143217 () Bool)

(declare-fun res!119586 () Bool)

(assert (=> b!143217 (=> (not res!119586) (not e!95384))))

(assert (=> b!143217 (= res!119586 (isPrefixOf!0 thiss!1634 (_2!6712 lt!222049)))))

(declare-fun b!143218 () Bool)

(assert (=> b!143218 (= e!95389 (not (= (size!2963 (buf!3392 thiss!1634)) (size!2963 (buf!3392 (_2!6712 lt!222064))))))))

(declare-fun lt!222060 () tuple2!12740)

(assert (=> b!143218 (= (_2!6709 (readBytePure!0 (_1!6711 lt!222060))) (select (arr!3686 arr!237) from!447))))

(declare-fun lt!222053 () tuple2!12740)

(assert (=> b!143218 (= lt!222053 (reader!0 (_2!6712 lt!222049) (_2!6712 lt!222064)))))

(assert (=> b!143218 (= lt!222060 (reader!0 thiss!1634 (_2!6712 lt!222064)))))

(assert (=> b!143218 e!95390))

(declare-fun res!119593 () Bool)

(assert (=> b!143218 (=> (not res!119593) (not e!95390))))

(assert (=> b!143218 (= res!119593 (= (bitIndex!0 (size!2963 (buf!3392 (_1!6709 lt!222059))) (currentByte!6276 (_1!6709 lt!222059)) (currentBit!6271 (_1!6709 lt!222059))) (bitIndex!0 (size!2963 (buf!3392 (_1!6709 lt!222056))) (currentByte!6276 (_1!6709 lt!222056)) (currentBit!6271 (_1!6709 lt!222056)))))))

(declare-fun lt!222057 () Unit!8926)

(declare-fun lt!222061 () BitStream!5184)

(declare-fun readBytePrefixLemma!0 (BitStream!5184 BitStream!5184) Unit!8926)

(assert (=> b!143218 (= lt!222057 (readBytePrefixLemma!0 lt!222061 (_2!6712 lt!222064)))))

(assert (=> b!143218 (= lt!222056 (readBytePure!0 (BitStream!5185 (buf!3392 (_2!6712 lt!222064)) (currentByte!6276 thiss!1634) (currentBit!6271 thiss!1634))))))

(assert (=> b!143218 (= lt!222059 (readBytePure!0 lt!222061))))

(assert (=> b!143218 (= lt!222061 (BitStream!5185 (buf!3392 (_2!6712 lt!222049)) (currentByte!6276 thiss!1634) (currentBit!6271 thiss!1634)))))

(assert (=> b!143218 e!95387))

(declare-fun res!119594 () Bool)

(assert (=> b!143218 (=> (not res!119594) (not e!95387))))

(assert (=> b!143218 (= res!119594 (isPrefixOf!0 thiss!1634 (_2!6712 lt!222064)))))

(declare-fun lt!222058 () Unit!8926)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!5184 BitStream!5184 BitStream!5184) Unit!8926)

(assert (=> b!143218 (= lt!222058 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6712 lt!222049) (_2!6712 lt!222064)))))

(declare-fun e!95386 () Bool)

(assert (=> b!143218 e!95386))

(declare-fun res!119584 () Bool)

(assert (=> b!143218 (=> (not res!119584) (not e!95386))))

(assert (=> b!143218 (= res!119584 (= (size!2963 (buf!3392 (_2!6712 lt!222049))) (size!2963 (buf!3392 (_2!6712 lt!222064)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!5184 array!6547 (_ BitVec 32) (_ BitVec 32)) tuple2!12742)

(assert (=> b!143218 (= lt!222064 (appendByteArrayLoop!0 (_2!6712 lt!222049) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!143218 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2963 (buf!3392 (_2!6712 lt!222049)))) ((_ sign_extend 32) (currentByte!6276 (_2!6712 lt!222049))) ((_ sign_extend 32) (currentBit!6271 (_2!6712 lt!222049))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!222050 () Unit!8926)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5184 BitStream!5184 (_ BitVec 64) (_ BitVec 32)) Unit!8926)

(assert (=> b!143218 (= lt!222050 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6712 lt!222049) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!143218 e!95384))

(declare-fun res!119583 () Bool)

(assert (=> b!143218 (=> (not res!119583) (not e!95384))))

(assert (=> b!143218 (= res!119583 (= (size!2963 (buf!3392 thiss!1634)) (size!2963 (buf!3392 (_2!6712 lt!222049)))))))

(declare-fun appendByte!0 (BitStream!5184 (_ BitVec 8)) tuple2!12742)

(assert (=> b!143218 (= lt!222049 (appendByte!0 thiss!1634 (select (arr!3686 arr!237) from!447)))))

(declare-fun b!143219 () Bool)

(assert (=> b!143219 (= e!95386 e!95391)))

(declare-fun res!119590 () Bool)

(assert (=> b!143219 (=> (not res!119590) (not e!95391))))

(assert (=> b!143219 (= res!119590 (= (bitIndex!0 (size!2963 (buf!3392 (_2!6712 lt!222064))) (currentByte!6276 (_2!6712 lt!222064)) (currentBit!6271 (_2!6712 lt!222064))) (bvadd (bitIndex!0 (size!2963 (buf!3392 (_2!6712 lt!222049))) (currentByte!6276 (_2!6712 lt!222049)) (currentBit!6271 (_2!6712 lt!222049))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!222051))))))

(assert (=> b!143219 (= lt!222051 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (= (and start!27790 res!119585) b!143211))

(assert (= (and b!143211 res!119592) b!143209))

(assert (= (and b!143209 res!119582) b!143207))

(assert (= (and b!143207 res!119589) b!143218))

(assert (= (and b!143218 res!119583) b!143214))

(assert (= (and b!143214 res!119588) b!143217))

(assert (= (and b!143217 res!119586) b!143215))

(assert (= (and b!143218 res!119584) b!143219))

(assert (= (and b!143219 res!119590) b!143216))

(assert (= (and b!143216 res!119587) b!143210))

(assert (= (and b!143210 (not res!119591)) b!143212))

(assert (= (and b!143218 res!119594) b!143213))

(assert (= (and b!143218 res!119593) b!143208))

(assert (= start!27790 b!143206))

(declare-fun m!219869 () Bool)

(assert (=> b!143214 m!219869))

(declare-fun m!219871 () Bool)

(assert (=> b!143214 m!219871))

(declare-fun m!219873 () Bool)

(assert (=> b!143207 m!219873))

(declare-fun m!219875 () Bool)

(assert (=> b!143217 m!219875))

(declare-fun m!219877 () Bool)

(assert (=> b!143216 m!219877))

(declare-fun m!219879 () Bool)

(assert (=> b!143219 m!219879))

(assert (=> b!143219 m!219869))

(declare-fun m!219881 () Bool)

(assert (=> start!27790 m!219881))

(declare-fun m!219883 () Bool)

(assert (=> start!27790 m!219883))

(declare-fun m!219885 () Bool)

(assert (=> b!143210 m!219885))

(declare-fun m!219887 () Bool)

(assert (=> b!143210 m!219887))

(declare-fun m!219889 () Bool)

(assert (=> b!143210 m!219889))

(declare-fun m!219891 () Bool)

(assert (=> b!143210 m!219891))

(declare-fun m!219893 () Bool)

(assert (=> b!143213 m!219893))

(declare-fun m!219895 () Bool)

(assert (=> b!143215 m!219895))

(declare-fun m!219897 () Bool)

(assert (=> b!143215 m!219897))

(declare-fun m!219899 () Bool)

(assert (=> b!143215 m!219899))

(declare-fun m!219901 () Bool)

(assert (=> b!143206 m!219901))

(declare-fun m!219903 () Bool)

(assert (=> b!143212 m!219903))

(declare-fun m!219905 () Bool)

(assert (=> b!143218 m!219905))

(declare-fun m!219907 () Bool)

(assert (=> b!143218 m!219907))

(declare-fun m!219909 () Bool)

(assert (=> b!143218 m!219909))

(declare-fun m!219911 () Bool)

(assert (=> b!143218 m!219911))

(declare-fun m!219913 () Bool)

(assert (=> b!143218 m!219913))

(declare-fun m!219915 () Bool)

(assert (=> b!143218 m!219915))

(assert (=> b!143218 m!219891))

(assert (=> b!143218 m!219895))

(declare-fun m!219917 () Bool)

(assert (=> b!143218 m!219917))

(assert (=> b!143218 m!219895))

(declare-fun m!219919 () Bool)

(assert (=> b!143218 m!219919))

(declare-fun m!219921 () Bool)

(assert (=> b!143218 m!219921))

(declare-fun m!219923 () Bool)

(assert (=> b!143218 m!219923))

(declare-fun m!219925 () Bool)

(assert (=> b!143218 m!219925))

(declare-fun m!219927 () Bool)

(assert (=> b!143218 m!219927))

(declare-fun m!219929 () Bool)

(assert (=> b!143218 m!219929))

(declare-fun m!219931 () Bool)

(assert (=> b!143211 m!219931))

(check-sat (not b!143206) (not b!143211) (not b!143214) (not b!143213) (not b!143216) (not b!143217) (not b!143212) (not b!143210) (not start!27790) (not b!143215) (not b!143219) (not b!143207) (not b!143218))
