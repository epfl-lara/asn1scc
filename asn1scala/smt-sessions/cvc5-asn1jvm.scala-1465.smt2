; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40202 () Bool)

(assert start!40202)

(declare-fun b!184047 () Bool)

(declare-fun res!153076 () Bool)

(declare-fun e!127532 () Bool)

(assert (=> b!184047 (=> res!153076 e!127532)))

(declare-datatypes ((array!9770 0))(
  ( (array!9771 (arr!5239 (Array (_ BitVec 32) (_ BitVec 8))) (size!4309 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7726 0))(
  ( (BitStream!7727 (buf!4764 array!9770) (currentByte!8998 (_ BitVec 32)) (currentBit!8993 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!15908 0))(
  ( (tuple2!15909 (_1!8599 BitStream!7726) (_2!8599 BitStream!7726)) )
))
(declare-fun lt!283089 () tuple2!15908)

(declare-fun lt!283087 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!184047 (= res!153076 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!4309 (buf!4764 (_1!8599 lt!283089)))) ((_ sign_extend 32) (currentByte!8998 (_1!8599 lt!283089))) ((_ sign_extend 32) (currentBit!8993 (_1!8599 lt!283089))) lt!283087)))))

(declare-fun b!184048 () Bool)

(declare-fun e!127530 () Bool)

(declare-datatypes ((tuple2!15910 0))(
  ( (tuple2!15911 (_1!8600 BitStream!7726) (_2!8600 Bool)) )
))
(declare-fun lt!283102 () tuple2!15910)

(declare-fun lt!283097 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!184048 (= e!127530 (= (bitIndex!0 (size!4309 (buf!4764 (_1!8600 lt!283102))) (currentByte!8998 (_1!8600 lt!283102)) (currentBit!8993 (_1!8600 lt!283102))) lt!283097))))

(declare-fun b!184049 () Bool)

(declare-fun e!127531 () Bool)

(assert (=> b!184049 (= e!127531 e!127530)))

(declare-fun res!153092 () Bool)

(assert (=> b!184049 (=> (not res!153092) (not e!127530))))

(declare-datatypes ((Unit!13193 0))(
  ( (Unit!13194) )
))
(declare-datatypes ((tuple2!15912 0))(
  ( (tuple2!15913 (_1!8601 Unit!13193) (_2!8601 BitStream!7726)) )
))
(declare-fun lt!283093 () tuple2!15912)

(declare-fun lt!283090 () Bool)

(assert (=> b!184049 (= res!153092 (and (= (_2!8600 lt!283102) lt!283090) (= (_1!8600 lt!283102) (_2!8601 lt!283093))))))

(declare-fun thiss!1204 () BitStream!7726)

(declare-fun readBitPure!0 (BitStream!7726) tuple2!15910)

(declare-fun readerFrom!0 (BitStream!7726 (_ BitVec 32) (_ BitVec 32)) BitStream!7726)

(assert (=> b!184049 (= lt!283102 (readBitPure!0 (readerFrom!0 (_2!8601 lt!283093) (currentBit!8993 thiss!1204) (currentByte!8998 thiss!1204))))))

(declare-fun b!184050 () Bool)

(declare-fun res!153096 () Bool)

(assert (=> b!184050 (=> res!153096 e!127532)))

(declare-fun lt!283105 () (_ BitVec 64))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!184050 (= res!153096 (not (= (bvand lt!283105 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!184051 () Bool)

(declare-fun e!127533 () Bool)

(declare-fun lt!283091 () tuple2!15912)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!184051 (= e!127533 (invariant!0 (currentBit!8993 thiss!1204) (currentByte!8998 thiss!1204) (size!4309 (buf!4764 (_2!8601 lt!283091)))))))

(declare-fun b!184052 () Bool)

(declare-fun e!127528 () Bool)

(assert (=> b!184052 (= e!127528 e!127531)))

(declare-fun res!153083 () Bool)

(assert (=> b!184052 (=> (not res!153083) (not e!127531))))

(declare-fun lt!283107 () (_ BitVec 64))

(assert (=> b!184052 (= res!153083 (= lt!283097 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!283107)))))

(assert (=> b!184052 (= lt!283097 (bitIndex!0 (size!4309 (buf!4764 (_2!8601 lt!283093))) (currentByte!8998 (_2!8601 lt!283093)) (currentBit!8993 (_2!8601 lt!283093))))))

(assert (=> b!184052 (= lt!283107 (bitIndex!0 (size!4309 (buf!4764 thiss!1204)) (currentByte!8998 thiss!1204) (currentBit!8993 thiss!1204)))))

(declare-fun b!184053 () Bool)

(declare-fun res!153085 () Bool)

(declare-fun e!127526 () Bool)

(assert (=> b!184053 (=> res!153085 e!127526)))

(declare-fun isPrefixOf!0 (BitStream!7726 BitStream!7726) Bool)

(assert (=> b!184053 (= res!153085 (not (isPrefixOf!0 (_2!8601 lt!283093) (_2!8601 lt!283091))))))

(declare-fun b!184054 () Bool)

(declare-fun res!153081 () Bool)

(assert (=> b!184054 (=> res!153081 e!127526)))

(assert (=> b!184054 (= res!153081 (not (invariant!0 (currentBit!8993 (_2!8601 lt!283091)) (currentByte!8998 (_2!8601 lt!283091)) (size!4309 (buf!4764 (_2!8601 lt!283091))))))))

(declare-fun b!184055 () Bool)

(declare-fun res!153088 () Bool)

(assert (=> b!184055 (=> res!153088 e!127532)))

(assert (=> b!184055 (= res!153088 (not (= (bvand lt!283105 #b1111111111111111111111111111111111111111111111111111111111111111) lt!283105)))))

(declare-fun b!184056 () Bool)

(declare-fun res!153086 () Bool)

(assert (=> b!184056 (=> res!153086 e!127532)))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!184056 (= res!153086 (bvsge i!590 nBits!348))))

(declare-fun res!153080 () Bool)

(declare-fun e!127524 () Bool)

(assert (=> start!40202 (=> (not res!153080) (not e!127524))))

(assert (=> start!40202 (= res!153080 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!40202 e!127524))

(assert (=> start!40202 true))

(declare-fun e!127529 () Bool)

(declare-fun inv!12 (BitStream!7726) Bool)

(assert (=> start!40202 (and (inv!12 thiss!1204) e!127529)))

(declare-fun b!184057 () Bool)

(declare-fun e!127523 () Bool)

(declare-fun lt!283110 () tuple2!15910)

(declare-fun lt!283098 () tuple2!15910)

(assert (=> b!184057 (= e!127523 (= (_2!8600 lt!283110) (_2!8600 lt!283098)))))

(declare-fun b!184058 () Bool)

(assert (=> b!184058 (= e!127532 true)))

(declare-fun lt!283088 () (_ BitVec 64))

(declare-datatypes ((tuple2!15914 0))(
  ( (tuple2!15915 (_1!8602 BitStream!7726) (_2!8602 (_ BitVec 64))) )
))
(declare-fun lt!283112 () tuple2!15914)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7726 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!15914)

(declare-fun withMovedBitIndex!0 (BitStream!7726 (_ BitVec 64)) BitStream!7726)

(assert (=> b!184058 (= lt!283112 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!8599 lt!283089) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!283088))))

(declare-fun b!184059 () Bool)

(declare-fun res!153093 () Bool)

(assert (=> b!184059 (=> (not res!153093) (not e!127531))))

(assert (=> b!184059 (= res!153093 (isPrefixOf!0 thiss!1204 (_2!8601 lt!283093)))))

(declare-fun b!184060 () Bool)

(declare-fun res!153087 () Bool)

(assert (=> b!184060 (=> res!153087 e!127526)))

(assert (=> b!184060 (= res!153087 (not (isPrefixOf!0 thiss!1204 (_2!8601 lt!283093))))))

(declare-fun b!184061 () Bool)

(declare-fun res!153082 () Bool)

(declare-fun e!127527 () Bool)

(assert (=> b!184061 (=> (not res!153082) (not e!127527))))

(assert (=> b!184061 (= res!153082 (not (= i!590 nBits!348)))))

(declare-fun b!184062 () Bool)

(declare-fun array_inv!4050 (array!9770) Bool)

(assert (=> b!184062 (= e!127529 (array_inv!4050 (buf!4764 thiss!1204)))))

(declare-fun b!184063 () Bool)

(assert (=> b!184063 (= e!127526 e!127532)))

(declare-fun res!153095 () Bool)

(assert (=> b!184063 (=> res!153095 e!127532)))

(declare-fun lt!283111 () tuple2!15908)

(assert (=> b!184063 (= res!153095 (not (= (_1!8602 (readNBitsLSBFirstsLoopPure!0 (_1!8599 lt!283111) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!283088)) (_2!8599 lt!283111))))))

(declare-fun lt!283103 () (_ BitVec 64))

(assert (=> b!184063 (validate_offset_bits!1 ((_ sign_extend 32) (size!4309 (buf!4764 (_2!8601 lt!283091)))) ((_ sign_extend 32) (currentByte!8998 (_2!8601 lt!283093))) ((_ sign_extend 32) (currentBit!8993 (_2!8601 lt!283093))) lt!283103)))

(declare-fun lt!283096 () Unit!13193)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7726 array!9770 (_ BitVec 64)) Unit!13193)

(assert (=> b!184063 (= lt!283096 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8601 lt!283093) (buf!4764 (_2!8601 lt!283091)) lt!283103))))

(assert (=> b!184063 (= lt!283103 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!283104 () tuple2!15910)

(declare-fun lt!283092 () (_ BitVec 64))

(assert (=> b!184063 (= lt!283088 (bvor lt!283105 (ite (_2!8600 lt!283104) lt!283092 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!283100 () tuple2!15914)

(assert (=> b!184063 (= lt!283100 (readNBitsLSBFirstsLoopPure!0 (_1!8599 lt!283089) nBits!348 i!590 lt!283105))))

(assert (=> b!184063 (validate_offset_bits!1 ((_ sign_extend 32) (size!4309 (buf!4764 (_2!8601 lt!283091)))) ((_ sign_extend 32) (currentByte!8998 thiss!1204)) ((_ sign_extend 32) (currentBit!8993 thiss!1204)) lt!283087)))

(declare-fun lt!283109 () Unit!13193)

(assert (=> b!184063 (= lt!283109 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4764 (_2!8601 lt!283091)) lt!283087))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!184063 (= lt!283105 (bvand v!189 (onesLSBLong!0 i!590)))))

(assert (=> b!184063 (= (_2!8600 lt!283104) lt!283090)))

(assert (=> b!184063 (= lt!283104 (readBitPure!0 (_1!8599 lt!283089)))))

(declare-fun reader!0 (BitStream!7726 BitStream!7726) tuple2!15908)

(assert (=> b!184063 (= lt!283111 (reader!0 (_2!8601 lt!283093) (_2!8601 lt!283091)))))

(assert (=> b!184063 (= lt!283089 (reader!0 thiss!1204 (_2!8601 lt!283091)))))

(assert (=> b!184063 e!127523))

(declare-fun res!153078 () Bool)

(assert (=> b!184063 (=> (not res!153078) (not e!127523))))

(assert (=> b!184063 (= res!153078 (= (bitIndex!0 (size!4309 (buf!4764 (_1!8600 lt!283110))) (currentByte!8998 (_1!8600 lt!283110)) (currentBit!8993 (_1!8600 lt!283110))) (bitIndex!0 (size!4309 (buf!4764 (_1!8600 lt!283098))) (currentByte!8998 (_1!8600 lt!283098)) (currentBit!8993 (_1!8600 lt!283098)))))))

(declare-fun lt!283095 () Unit!13193)

(declare-fun lt!283101 () BitStream!7726)

(declare-fun readBitPrefixLemma!0 (BitStream!7726 BitStream!7726) Unit!13193)

(assert (=> b!184063 (= lt!283095 (readBitPrefixLemma!0 lt!283101 (_2!8601 lt!283091)))))

(assert (=> b!184063 (= lt!283098 (readBitPure!0 (BitStream!7727 (buf!4764 (_2!8601 lt!283091)) (currentByte!8998 thiss!1204) (currentBit!8993 thiss!1204))))))

(assert (=> b!184063 (= lt!283110 (readBitPure!0 lt!283101))))

(assert (=> b!184063 e!127533))

(declare-fun res!153091 () Bool)

(assert (=> b!184063 (=> (not res!153091) (not e!127533))))

(assert (=> b!184063 (= res!153091 (invariant!0 (currentBit!8993 thiss!1204) (currentByte!8998 thiss!1204) (size!4309 (buf!4764 (_2!8601 lt!283093)))))))

(assert (=> b!184063 (= lt!283101 (BitStream!7727 (buf!4764 (_2!8601 lt!283093)) (currentByte!8998 thiss!1204) (currentBit!8993 thiss!1204)))))

(declare-fun b!184064 () Bool)

(declare-fun res!153079 () Bool)

(assert (=> b!184064 (=> (not res!153079) (not e!127527))))

(assert (=> b!184064 (= res!153079 (invariant!0 (currentBit!8993 thiss!1204) (currentByte!8998 thiss!1204) (size!4309 (buf!4764 thiss!1204))))))

(declare-fun b!184065 () Bool)

(declare-fun res!153077 () Bool)

(assert (=> b!184065 (=> res!153077 e!127526)))

(declare-fun lt!283108 () (_ BitVec 64))

(declare-fun lt!283106 () (_ BitVec 64))

(assert (=> b!184065 (= res!153077 (or (not (= (size!4309 (buf!4764 (_2!8601 lt!283091))) (size!4309 (buf!4764 thiss!1204)))) (not (= lt!283108 (bvsub (bvadd lt!283106 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!184066 () Bool)

(declare-fun e!127534 () Bool)

(assert (=> b!184066 (= e!127534 e!127526)))

(declare-fun res!153089 () Bool)

(assert (=> b!184066 (=> res!153089 e!127526)))

(declare-fun lt!283094 () (_ BitVec 64))

(assert (=> b!184066 (= res!153089 (not (= lt!283108 (bvsub (bvsub (bvadd lt!283094 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!184066 (= lt!283108 (bitIndex!0 (size!4309 (buf!4764 (_2!8601 lt!283091))) (currentByte!8998 (_2!8601 lt!283091)) (currentBit!8993 (_2!8601 lt!283091))))))

(assert (=> b!184066 (isPrefixOf!0 thiss!1204 (_2!8601 lt!283091))))

(declare-fun lt!283099 () Unit!13193)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7726 BitStream!7726 BitStream!7726) Unit!13193)

(assert (=> b!184066 (= lt!283099 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8601 lt!283093) (_2!8601 lt!283091)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7726 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!15912)

(assert (=> b!184066 (= lt!283091 (appendBitsLSBFirstLoopTR!0 (_2!8601 lt!283093) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!184067 () Bool)

(assert (=> b!184067 (= e!127527 (not e!127534))))

(declare-fun res!153090 () Bool)

(assert (=> b!184067 (=> res!153090 e!127534)))

(assert (=> b!184067 (= res!153090 (not (= lt!283094 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!283106))))))

(assert (=> b!184067 (= lt!283094 (bitIndex!0 (size!4309 (buf!4764 (_2!8601 lt!283093))) (currentByte!8998 (_2!8601 lt!283093)) (currentBit!8993 (_2!8601 lt!283093))))))

(assert (=> b!184067 (= lt!283106 (bitIndex!0 (size!4309 (buf!4764 thiss!1204)) (currentByte!8998 thiss!1204) (currentBit!8993 thiss!1204)))))

(assert (=> b!184067 e!127528))

(declare-fun res!153094 () Bool)

(assert (=> b!184067 (=> (not res!153094) (not e!127528))))

(assert (=> b!184067 (= res!153094 (= (size!4309 (buf!4764 thiss!1204)) (size!4309 (buf!4764 (_2!8601 lt!283093)))))))

(declare-fun appendBit!0 (BitStream!7726 Bool) tuple2!15912)

(assert (=> b!184067 (= lt!283093 (appendBit!0 thiss!1204 lt!283090))))

(assert (=> b!184067 (= lt!283090 (not (= (bvand v!189 lt!283092) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!184067 (= lt!283092 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!184068 () Bool)

(assert (=> b!184068 (= e!127524 e!127527)))

(declare-fun res!153084 () Bool)

(assert (=> b!184068 (=> (not res!153084) (not e!127527))))

(assert (=> b!184068 (= res!153084 (validate_offset_bits!1 ((_ sign_extend 32) (size!4309 (buf!4764 thiss!1204))) ((_ sign_extend 32) (currentByte!8998 thiss!1204)) ((_ sign_extend 32) (currentBit!8993 thiss!1204)) lt!283087))))

(assert (=> b!184068 (= lt!283087 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(assert (= (and start!40202 res!153080) b!184068))

(assert (= (and b!184068 res!153084) b!184064))

(assert (= (and b!184064 res!153079) b!184061))

(assert (= (and b!184061 res!153082) b!184067))

(assert (= (and b!184067 res!153094) b!184052))

(assert (= (and b!184052 res!153083) b!184059))

(assert (= (and b!184059 res!153093) b!184049))

(assert (= (and b!184049 res!153092) b!184048))

(assert (= (and b!184067 (not res!153090)) b!184066))

(assert (= (and b!184066 (not res!153089)) b!184054))

(assert (= (and b!184054 (not res!153081)) b!184065))

(assert (= (and b!184065 (not res!153077)) b!184053))

(assert (= (and b!184053 (not res!153085)) b!184060))

(assert (= (and b!184060 (not res!153087)) b!184063))

(assert (= (and b!184063 res!153091) b!184051))

(assert (= (and b!184063 res!153078) b!184057))

(assert (= (and b!184063 (not res!153095)) b!184056))

(assert (= (and b!184056 (not res!153086)) b!184047))

(assert (= (and b!184047 (not res!153076)) b!184050))

(assert (= (and b!184050 (not res!153096)) b!184055))

(assert (= (and b!184055 (not res!153088)) b!184058))

(assert (= start!40202 b!184062))

(declare-fun m!286057 () Bool)

(assert (=> b!184058 m!286057))

(assert (=> b!184058 m!286057))

(declare-fun m!286059 () Bool)

(assert (=> b!184058 m!286059))

(declare-fun m!286061 () Bool)

(assert (=> b!184053 m!286061))

(declare-fun m!286063 () Bool)

(assert (=> b!184050 m!286063))

(declare-fun m!286065 () Bool)

(assert (=> b!184066 m!286065))

(declare-fun m!286067 () Bool)

(assert (=> b!184066 m!286067))

(declare-fun m!286069 () Bool)

(assert (=> b!184066 m!286069))

(declare-fun m!286071 () Bool)

(assert (=> b!184066 m!286071))

(declare-fun m!286073 () Bool)

(assert (=> b!184068 m!286073))

(declare-fun m!286075 () Bool)

(assert (=> b!184060 m!286075))

(declare-fun m!286077 () Bool)

(assert (=> b!184067 m!286077))

(declare-fun m!286079 () Bool)

(assert (=> b!184067 m!286079))

(declare-fun m!286081 () Bool)

(assert (=> b!184067 m!286081))

(declare-fun m!286083 () Bool)

(assert (=> start!40202 m!286083))

(declare-fun m!286085 () Bool)

(assert (=> b!184048 m!286085))

(declare-fun m!286087 () Bool)

(assert (=> b!184054 m!286087))

(declare-fun m!286089 () Bool)

(assert (=> b!184064 m!286089))

(declare-fun m!286091 () Bool)

(assert (=> b!184051 m!286091))

(declare-fun m!286093 () Bool)

(assert (=> b!184063 m!286093))

(declare-fun m!286095 () Bool)

(assert (=> b!184063 m!286095))

(declare-fun m!286097 () Bool)

(assert (=> b!184063 m!286097))

(declare-fun m!286099 () Bool)

(assert (=> b!184063 m!286099))

(declare-fun m!286101 () Bool)

(assert (=> b!184063 m!286101))

(declare-fun m!286103 () Bool)

(assert (=> b!184063 m!286103))

(declare-fun m!286105 () Bool)

(assert (=> b!184063 m!286105))

(declare-fun m!286107 () Bool)

(assert (=> b!184063 m!286107))

(declare-fun m!286109 () Bool)

(assert (=> b!184063 m!286109))

(declare-fun m!286111 () Bool)

(assert (=> b!184063 m!286111))

(declare-fun m!286113 () Bool)

(assert (=> b!184063 m!286113))

(declare-fun m!286115 () Bool)

(assert (=> b!184063 m!286115))

(declare-fun m!286117 () Bool)

(assert (=> b!184063 m!286117))

(declare-fun m!286119 () Bool)

(assert (=> b!184063 m!286119))

(declare-fun m!286121 () Bool)

(assert (=> b!184063 m!286121))

(declare-fun m!286123 () Bool)

(assert (=> b!184063 m!286123))

(assert (=> b!184052 m!286077))

(assert (=> b!184052 m!286079))

(declare-fun m!286125 () Bool)

(assert (=> b!184062 m!286125))

(assert (=> b!184059 m!286075))

(declare-fun m!286127 () Bool)

(assert (=> b!184049 m!286127))

(assert (=> b!184049 m!286127))

(declare-fun m!286129 () Bool)

(assert (=> b!184049 m!286129))

(declare-fun m!286131 () Bool)

(assert (=> b!184047 m!286131))

(push 1)

(assert (not b!184063))

(assert (not start!40202))

(assert (not b!184059))

(assert (not b!184064))

(assert (not b!184050))

(assert (not b!184067))

(assert (not b!184048))

(assert (not b!184049))

(assert (not b!184068))

(assert (not b!184052))

(assert (not b!184053))

(assert (not b!184062))

(assert (not b!184047))

(assert (not b!184054))

(assert (not b!184058))

(assert (not b!184060))

(assert (not b!184066))

(assert (not b!184051))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

