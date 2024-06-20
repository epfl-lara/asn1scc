; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41548 () Bool)

(assert start!41548)

(declare-fun b!194943 () Bool)

(declare-fun e!134068 () Bool)

(declare-datatypes ((array!10006 0))(
  ( (array!10007 (arr!5342 (Array (_ BitVec 32) (_ BitVec 8))) (size!4412 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7932 0))(
  ( (BitStream!7933 (buf!4898 array!10006) (currentByte!9194 (_ BitVec 32)) (currentBit!9189 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!16852 0))(
  ( (tuple2!16853 (_1!9071 BitStream!7932) (_2!9071 (_ BitVec 64))) )
))
(declare-fun lt!303418 () tuple2!16852)

(declare-datatypes ((tuple2!16854 0))(
  ( (tuple2!16855 (_1!9072 BitStream!7932) (_2!9072 BitStream!7932)) )
))
(declare-fun lt!303442 () tuple2!16854)

(assert (=> b!194943 (= e!134068 (= (_1!9071 lt!303418) (_2!9072 lt!303442)))))

(declare-fun b!194944 () Bool)

(declare-fun e!134065 () Bool)

(declare-fun e!134064 () Bool)

(assert (=> b!194944 (= e!134065 e!134064)))

(declare-fun res!163030 () Bool)

(assert (=> b!194944 (=> res!163030 e!134064)))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun lt!303432 () (_ BitVec 64))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun lt!303431 () (_ BitVec 64))

(assert (=> b!194944 (= res!163030 (not (= lt!303431 (bvsub (bvsub (bvadd lt!303432 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-datatypes ((Unit!13779 0))(
  ( (Unit!13780) )
))
(declare-datatypes ((tuple2!16856 0))(
  ( (tuple2!16857 (_1!9073 Unit!13779) (_2!9073 BitStream!7932)) )
))
(declare-fun lt!303422 () tuple2!16856)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!194944 (= lt!303431 (bitIndex!0 (size!4412 (buf!4898 (_2!9073 lt!303422))) (currentByte!9194 (_2!9073 lt!303422)) (currentBit!9189 (_2!9073 lt!303422))))))

(declare-fun thiss!1204 () BitStream!7932)

(declare-fun isPrefixOf!0 (BitStream!7932 BitStream!7932) Bool)

(assert (=> b!194944 (isPrefixOf!0 thiss!1204 (_2!9073 lt!303422))))

(declare-fun lt!303419 () Unit!13779)

(declare-fun lt!303427 () tuple2!16856)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7932 BitStream!7932 BitStream!7932) Unit!13779)

(assert (=> b!194944 (= lt!303419 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9073 lt!303427) (_2!9073 lt!303422)))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7932 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!16856)

(assert (=> b!194944 (= lt!303422 (appendBitsLSBFirstLoopTR!0 (_2!9073 lt!303427) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!194945 () Bool)

(declare-fun e!134066 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!194945 (= e!134066 (invariant!0 (currentBit!9189 thiss!1204) (currentByte!9194 thiss!1204) (size!4412 (buf!4898 (_2!9073 lt!303422)))))))

(declare-fun b!194946 () Bool)

(declare-fun e!134076 () Bool)

(declare-datatypes ((tuple2!16858 0))(
  ( (tuple2!16859 (_1!9074 BitStream!7932) (_2!9074 Bool)) )
))
(declare-fun lt!303416 () tuple2!16858)

(declare-fun lt!303420 () (_ BitVec 64))

(assert (=> b!194946 (= e!134076 (= (bitIndex!0 (size!4412 (buf!4898 (_1!9074 lt!303416))) (currentByte!9194 (_1!9074 lt!303416)) (currentBit!9189 (_1!9074 lt!303416))) lt!303420))))

(declare-fun b!194947 () Bool)

(declare-fun res!163048 () Bool)

(declare-fun e!134075 () Bool)

(assert (=> b!194947 (=> (not res!163048) (not e!134075))))

(assert (=> b!194947 (= res!163048 (isPrefixOf!0 thiss!1204 (_2!9073 lt!303427)))))

(declare-fun b!194948 () Bool)

(declare-fun res!163028 () Bool)

(declare-fun e!134071 () Bool)

(assert (=> b!194948 (=> res!163028 e!134071)))

(assert (=> b!194948 (= res!163028 (not (= (bitIndex!0 (size!4412 (buf!4898 (_1!9071 lt!303418))) (currentByte!9194 (_1!9071 lt!303418)) (currentBit!9189 (_1!9071 lt!303418))) (bitIndex!0 (size!4412 (buf!4898 (_2!9072 lt!303442))) (currentByte!9194 (_2!9072 lt!303442)) (currentBit!9189 (_2!9072 lt!303442))))))))

(declare-fun b!194949 () Bool)

(declare-fun res!163047 () Bool)

(declare-fun e!134077 () Bool)

(assert (=> b!194949 (=> (not res!163047) (not e!134077))))

(declare-fun lt!303433 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!7932 (_ BitVec 64)) BitStream!7932)

(assert (=> b!194949 (= res!163047 (= (_1!9072 lt!303442) (withMovedBitIndex!0 (_2!9072 lt!303442) (bvsub lt!303433 lt!303431))))))

(declare-fun b!194950 () Bool)

(declare-fun res!163035 () Bool)

(assert (=> b!194950 (=> (not res!163035) (not e!134077))))

(declare-fun lt!303423 () tuple2!16854)

(assert (=> b!194950 (= res!163035 (= (_1!9072 lt!303423) (withMovedBitIndex!0 (_2!9072 lt!303423) (bvsub lt!303432 lt!303431))))))

(declare-fun b!194951 () Bool)

(declare-fun e!134063 () Bool)

(declare-fun lt!303441 () tuple2!16858)

(declare-fun lt!303414 () tuple2!16858)

(assert (=> b!194951 (= e!134063 (= (_2!9074 lt!303441) (_2!9074 lt!303414)))))

(declare-fun b!194952 () Bool)

(declare-fun e!134078 () Bool)

(declare-fun array_inv!4153 (array!10006) Bool)

(assert (=> b!194952 (= e!134078 (array_inv!4153 (buf!4898 thiss!1204)))))

(declare-fun b!194953 () Bool)

(assert (=> b!194953 (= e!134075 e!134076)))

(declare-fun res!163029 () Bool)

(assert (=> b!194953 (=> (not res!163029) (not e!134076))))

(declare-fun lt!303424 () Bool)

(assert (=> b!194953 (= res!163029 (and (= (_2!9074 lt!303416) lt!303424) (= (_1!9074 lt!303416) (_2!9073 lt!303427))))))

(declare-fun readBitPure!0 (BitStream!7932) tuple2!16858)

(declare-fun readerFrom!0 (BitStream!7932 (_ BitVec 32) (_ BitVec 32)) BitStream!7932)

(assert (=> b!194953 (= lt!303416 (readBitPure!0 (readerFrom!0 (_2!9073 lt!303427) (currentBit!9189 thiss!1204) (currentByte!9194 thiss!1204))))))

(declare-fun b!194954 () Bool)

(declare-fun e!134070 () Bool)

(declare-fun e!134067 () Bool)

(assert (=> b!194954 (= e!134070 e!134067)))

(declare-fun res!163043 () Bool)

(assert (=> b!194954 (=> (not res!163043) (not e!134067))))

(declare-fun lt!303421 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!194954 (= res!163043 (validate_offset_bits!1 ((_ sign_extend 32) (size!4412 (buf!4898 thiss!1204))) ((_ sign_extend 32) (currentByte!9194 thiss!1204)) ((_ sign_extend 32) (currentBit!9189 thiss!1204)) lt!303421))))

(assert (=> b!194954 (= lt!303421 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!194955 () Bool)

(declare-fun res!163040 () Bool)

(assert (=> b!194955 (=> (not res!163040) (not e!134067))))

(assert (=> b!194955 (= res!163040 (not (= i!590 nBits!348)))))

(declare-fun b!194956 () Bool)

(declare-fun res!163051 () Bool)

(assert (=> b!194956 (=> res!163051 e!134064)))

(assert (=> b!194956 (= res!163051 (not (isPrefixOf!0 (_2!9073 lt!303427) (_2!9073 lt!303422))))))

(declare-fun b!194957 () Bool)

(declare-fun res!163034 () Bool)

(assert (=> b!194957 (=> (not res!163034) (not e!134068))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!194957 (= res!163034 (= (_2!9071 lt!303418) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun b!194958 () Bool)

(declare-fun e!134069 () Bool)

(assert (=> b!194958 (= e!134071 e!134069)))

(declare-fun res!163046 () Bool)

(assert (=> b!194958 (=> res!163046 e!134069)))

(assert (=> b!194958 (= res!163046 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!4412 (buf!4898 (_1!9072 lt!303442)))) ((_ sign_extend 32) (currentByte!9194 (_1!9072 lt!303442))) ((_ sign_extend 32) (currentBit!9189 (_1!9072 lt!303442))) lt!303421)))))

(assert (=> b!194958 e!134068))

(declare-fun res!163052 () Bool)

(assert (=> b!194958 (=> (not res!163052) (not e!134068))))

(assert (=> b!194958 (= res!163052 (= (size!4412 (buf!4898 thiss!1204)) (size!4412 (buf!4898 (_2!9073 lt!303422)))))))

(declare-fun lt!303426 () BitStream!7932)

(declare-fun b!194959 () Bool)

(declare-fun lt!303435 () tuple2!16852)

(assert (=> b!194959 (= e!134077 (and (= lt!303433 (bvsub lt!303432 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!9072 lt!303423) lt!303426)) (= (_2!9071 lt!303418) (_2!9071 lt!303435)))))))

(declare-fun b!194960 () Bool)

(declare-fun res!163032 () Bool)

(assert (=> b!194960 (=> res!163032 e!134064)))

(assert (=> b!194960 (= res!163032 (not (isPrefixOf!0 thiss!1204 (_2!9073 lt!303427))))))

(declare-fun b!194961 () Bool)

(declare-fun e!134072 () Bool)

(assert (=> b!194961 (= e!134072 e!134071)))

(declare-fun res!163031 () Bool)

(assert (=> b!194961 (=> res!163031 e!134071)))

(assert (=> b!194961 (= res!163031 (not (= (_1!9072 lt!303423) lt!303426)))))

(assert (=> b!194961 e!134077))

(declare-fun res!163033 () Bool)

(assert (=> b!194961 (=> (not res!163033) (not e!134077))))

(declare-fun lt!303437 () tuple2!16852)

(assert (=> b!194961 (= res!163033 (and (= (_2!9071 lt!303418) (_2!9071 lt!303437)) (= (_1!9071 lt!303418) (_1!9071 lt!303437))))))

(declare-fun lt!303415 () (_ BitVec 64))

(declare-fun lt!303428 () Unit!13779)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!7932 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!13779)

(assert (=> b!194961 (= lt!303428 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9072 lt!303442) nBits!348 i!590 lt!303415))))

(declare-fun lt!303417 () (_ BitVec 64))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7932 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!16852)

(assert (=> b!194961 (= lt!303437 (readNBitsLSBFirstsLoopPure!0 lt!303426 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!303417))))

(assert (=> b!194961 (= lt!303426 (withMovedBitIndex!0 (_1!9072 lt!303442) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!194962 () Bool)

(declare-fun res!163053 () Bool)

(assert (=> b!194962 (=> res!163053 e!134064)))

(assert (=> b!194962 (= res!163053 (or (not (= (size!4412 (buf!4898 (_2!9073 lt!303422))) (size!4412 (buf!4898 thiss!1204)))) (not (= lt!303431 (bvsub (bvadd lt!303433 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!194963 () Bool)

(declare-fun res!163039 () Bool)

(assert (=> b!194963 (=> res!163039 e!134069)))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!194963 (= res!163039 (not (= (bvand lt!303415 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!194964 () Bool)

(assert (=> b!194964 (= e!134067 (not e!134065))))

(declare-fun res!163041 () Bool)

(assert (=> b!194964 (=> res!163041 e!134065)))

(assert (=> b!194964 (= res!163041 (not (= lt!303432 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!303433))))))

(assert (=> b!194964 (= lt!303432 (bitIndex!0 (size!4412 (buf!4898 (_2!9073 lt!303427))) (currentByte!9194 (_2!9073 lt!303427)) (currentBit!9189 (_2!9073 lt!303427))))))

(assert (=> b!194964 (= lt!303433 (bitIndex!0 (size!4412 (buf!4898 thiss!1204)) (currentByte!9194 thiss!1204) (currentBit!9189 thiss!1204)))))

(declare-fun e!134073 () Bool)

(assert (=> b!194964 e!134073))

(declare-fun res!163050 () Bool)

(assert (=> b!194964 (=> (not res!163050) (not e!134073))))

(assert (=> b!194964 (= res!163050 (= (size!4412 (buf!4898 thiss!1204)) (size!4412 (buf!4898 (_2!9073 lt!303427)))))))

(declare-fun appendBit!0 (BitStream!7932 Bool) tuple2!16856)

(assert (=> b!194964 (= lt!303427 (appendBit!0 thiss!1204 lt!303424))))

(declare-fun lt!303434 () (_ BitVec 64))

(assert (=> b!194964 (= lt!303424 (not (= (bvand v!189 lt!303434) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!194964 (= lt!303434 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!194965 () Bool)

(assert (=> b!194965 (= e!134069 (= (bvand lt!303415 #b1111111111111111111111111111111111111111111111111111111111111111) lt!303415))))

(declare-fun b!194966 () Bool)

(assert (=> b!194966 (= e!134064 e!134072)))

(declare-fun res!163036 () Bool)

(assert (=> b!194966 (=> res!163036 e!134072)))

(assert (=> b!194966 (= res!163036 (not (= (_1!9071 lt!303435) (_2!9072 lt!303423))))))

(assert (=> b!194966 (= lt!303435 (readNBitsLSBFirstsLoopPure!0 (_1!9072 lt!303423) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!303417))))

(declare-fun lt!303429 () (_ BitVec 64))

(assert (=> b!194966 (validate_offset_bits!1 ((_ sign_extend 32) (size!4412 (buf!4898 (_2!9073 lt!303422)))) ((_ sign_extend 32) (currentByte!9194 (_2!9073 lt!303427))) ((_ sign_extend 32) (currentBit!9189 (_2!9073 lt!303427))) lt!303429)))

(declare-fun lt!303430 () Unit!13779)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7932 array!10006 (_ BitVec 64)) Unit!13779)

(assert (=> b!194966 (= lt!303430 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9073 lt!303427) (buf!4898 (_2!9073 lt!303422)) lt!303429))))

(assert (=> b!194966 (= lt!303429 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!303438 () tuple2!16858)

(assert (=> b!194966 (= lt!303417 (bvor lt!303415 (ite (_2!9074 lt!303438) lt!303434 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!194966 (= lt!303418 (readNBitsLSBFirstsLoopPure!0 (_1!9072 lt!303442) nBits!348 i!590 lt!303415))))

(assert (=> b!194966 (validate_offset_bits!1 ((_ sign_extend 32) (size!4412 (buf!4898 (_2!9073 lt!303422)))) ((_ sign_extend 32) (currentByte!9194 thiss!1204)) ((_ sign_extend 32) (currentBit!9189 thiss!1204)) lt!303421)))

(declare-fun lt!303439 () Unit!13779)

(assert (=> b!194966 (= lt!303439 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4898 (_2!9073 lt!303422)) lt!303421))))

(assert (=> b!194966 (= lt!303415 (bvand v!189 (onesLSBLong!0 i!590)))))

(assert (=> b!194966 (= (_2!9074 lt!303438) lt!303424)))

(assert (=> b!194966 (= lt!303438 (readBitPure!0 (_1!9072 lt!303442)))))

(declare-fun reader!0 (BitStream!7932 BitStream!7932) tuple2!16854)

(assert (=> b!194966 (= lt!303423 (reader!0 (_2!9073 lt!303427) (_2!9073 lt!303422)))))

(assert (=> b!194966 (= lt!303442 (reader!0 thiss!1204 (_2!9073 lt!303422)))))

(assert (=> b!194966 e!134063))

(declare-fun res!163042 () Bool)

(assert (=> b!194966 (=> (not res!163042) (not e!134063))))

(assert (=> b!194966 (= res!163042 (= (bitIndex!0 (size!4412 (buf!4898 (_1!9074 lt!303441))) (currentByte!9194 (_1!9074 lt!303441)) (currentBit!9189 (_1!9074 lt!303441))) (bitIndex!0 (size!4412 (buf!4898 (_1!9074 lt!303414))) (currentByte!9194 (_1!9074 lt!303414)) (currentBit!9189 (_1!9074 lt!303414)))))))

(declare-fun lt!303425 () Unit!13779)

(declare-fun lt!303440 () BitStream!7932)

(declare-fun readBitPrefixLemma!0 (BitStream!7932 BitStream!7932) Unit!13779)

(assert (=> b!194966 (= lt!303425 (readBitPrefixLemma!0 lt!303440 (_2!9073 lt!303422)))))

(assert (=> b!194966 (= lt!303414 (readBitPure!0 (BitStream!7933 (buf!4898 (_2!9073 lt!303422)) (currentByte!9194 thiss!1204) (currentBit!9189 thiss!1204))))))

(assert (=> b!194966 (= lt!303441 (readBitPure!0 lt!303440))))

(assert (=> b!194966 e!134066))

(declare-fun res!163038 () Bool)

(assert (=> b!194966 (=> (not res!163038) (not e!134066))))

(assert (=> b!194966 (= res!163038 (invariant!0 (currentBit!9189 thiss!1204) (currentByte!9194 thiss!1204) (size!4412 (buf!4898 (_2!9073 lt!303427)))))))

(assert (=> b!194966 (= lt!303440 (BitStream!7933 (buf!4898 (_2!9073 lt!303427)) (currentByte!9194 thiss!1204) (currentBit!9189 thiss!1204)))))

(declare-fun res!163037 () Bool)

(assert (=> start!41548 (=> (not res!163037) (not e!134070))))

(assert (=> start!41548 (= res!163037 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!41548 e!134070))

(assert (=> start!41548 true))

(declare-fun inv!12 (BitStream!7932) Bool)

(assert (=> start!41548 (and (inv!12 thiss!1204) e!134078)))

(declare-fun b!194967 () Bool)

(declare-fun res!163049 () Bool)

(assert (=> b!194967 (=> res!163049 e!134064)))

(assert (=> b!194967 (= res!163049 (not (invariant!0 (currentBit!9189 (_2!9073 lt!303422)) (currentByte!9194 (_2!9073 lt!303422)) (size!4412 (buf!4898 (_2!9073 lt!303422))))))))

(declare-fun b!194968 () Bool)

(assert (=> b!194968 (= e!134073 e!134075)))

(declare-fun res!163044 () Bool)

(assert (=> b!194968 (=> (not res!163044) (not e!134075))))

(declare-fun lt!303436 () (_ BitVec 64))

(assert (=> b!194968 (= res!163044 (= lt!303420 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!303436)))))

(assert (=> b!194968 (= lt!303420 (bitIndex!0 (size!4412 (buf!4898 (_2!9073 lt!303427))) (currentByte!9194 (_2!9073 lt!303427)) (currentBit!9189 (_2!9073 lt!303427))))))

(assert (=> b!194968 (= lt!303436 (bitIndex!0 (size!4412 (buf!4898 thiss!1204)) (currentByte!9194 thiss!1204) (currentBit!9189 thiss!1204)))))

(declare-fun b!194969 () Bool)

(declare-fun res!163045 () Bool)

(assert (=> b!194969 (=> (not res!163045) (not e!134067))))

(assert (=> b!194969 (= res!163045 (invariant!0 (currentBit!9189 thiss!1204) (currentByte!9194 thiss!1204) (size!4412 (buf!4898 thiss!1204))))))

(assert (= (and start!41548 res!163037) b!194954))

(assert (= (and b!194954 res!163043) b!194969))

(assert (= (and b!194969 res!163045) b!194955))

(assert (= (and b!194955 res!163040) b!194964))

(assert (= (and b!194964 res!163050) b!194968))

(assert (= (and b!194968 res!163044) b!194947))

(assert (= (and b!194947 res!163048) b!194953))

(assert (= (and b!194953 res!163029) b!194946))

(assert (= (and b!194964 (not res!163041)) b!194944))

(assert (= (and b!194944 (not res!163030)) b!194967))

(assert (= (and b!194967 (not res!163049)) b!194962))

(assert (= (and b!194962 (not res!163053)) b!194956))

(assert (= (and b!194956 (not res!163051)) b!194960))

(assert (= (and b!194960 (not res!163032)) b!194966))

(assert (= (and b!194966 res!163038) b!194945))

(assert (= (and b!194966 res!163042) b!194951))

(assert (= (and b!194966 (not res!163036)) b!194961))

(assert (= (and b!194961 res!163033) b!194949))

(assert (= (and b!194949 res!163047) b!194950))

(assert (= (and b!194950 res!163035) b!194959))

(assert (= (and b!194961 (not res!163031)) b!194948))

(assert (= (and b!194948 (not res!163028)) b!194958))

(assert (= (and b!194958 res!163052) b!194957))

(assert (= (and b!194957 res!163034) b!194943))

(assert (= (and b!194958 (not res!163046)) b!194963))

(assert (= (and b!194963 (not res!163039)) b!194965))

(assert (= start!41548 b!194952))

(declare-fun m!302097 () Bool)

(assert (=> b!194948 m!302097))

(declare-fun m!302099 () Bool)

(assert (=> b!194948 m!302099))

(declare-fun m!302101 () Bool)

(assert (=> b!194945 m!302101))

(declare-fun m!302103 () Bool)

(assert (=> b!194961 m!302103))

(declare-fun m!302105 () Bool)

(assert (=> b!194961 m!302105))

(declare-fun m!302107 () Bool)

(assert (=> b!194961 m!302107))

(declare-fun m!302109 () Bool)

(assert (=> b!194956 m!302109))

(declare-fun m!302111 () Bool)

(assert (=> b!194958 m!302111))

(declare-fun m!302113 () Bool)

(assert (=> b!194967 m!302113))

(declare-fun m!302115 () Bool)

(assert (=> b!194966 m!302115))

(declare-fun m!302117 () Bool)

(assert (=> b!194966 m!302117))

(declare-fun m!302119 () Bool)

(assert (=> b!194966 m!302119))

(declare-fun m!302121 () Bool)

(assert (=> b!194966 m!302121))

(declare-fun m!302123 () Bool)

(assert (=> b!194966 m!302123))

(declare-fun m!302125 () Bool)

(assert (=> b!194966 m!302125))

(declare-fun m!302127 () Bool)

(assert (=> b!194966 m!302127))

(declare-fun m!302129 () Bool)

(assert (=> b!194966 m!302129))

(declare-fun m!302131 () Bool)

(assert (=> b!194966 m!302131))

(declare-fun m!302133 () Bool)

(assert (=> b!194966 m!302133))

(declare-fun m!302135 () Bool)

(assert (=> b!194966 m!302135))

(declare-fun m!302137 () Bool)

(assert (=> b!194966 m!302137))

(declare-fun m!302139 () Bool)

(assert (=> b!194966 m!302139))

(declare-fun m!302141 () Bool)

(assert (=> b!194966 m!302141))

(declare-fun m!302143 () Bool)

(assert (=> b!194966 m!302143))

(declare-fun m!302145 () Bool)

(assert (=> b!194966 m!302145))

(declare-fun m!302147 () Bool)

(assert (=> b!194947 m!302147))

(declare-fun m!302149 () Bool)

(assert (=> b!194952 m!302149))

(declare-fun m!302151 () Bool)

(assert (=> b!194968 m!302151))

(declare-fun m!302153 () Bool)

(assert (=> b!194968 m!302153))

(assert (=> b!194960 m!302147))

(declare-fun m!302155 () Bool)

(assert (=> start!41548 m!302155))

(declare-fun m!302157 () Bool)

(assert (=> b!194963 m!302157))

(declare-fun m!302159 () Bool)

(assert (=> b!194944 m!302159))

(declare-fun m!302161 () Bool)

(assert (=> b!194944 m!302161))

(declare-fun m!302163 () Bool)

(assert (=> b!194944 m!302163))

(declare-fun m!302165 () Bool)

(assert (=> b!194944 m!302165))

(declare-fun m!302167 () Bool)

(assert (=> b!194954 m!302167))

(declare-fun m!302169 () Bool)

(assert (=> b!194946 m!302169))

(declare-fun m!302171 () Bool)

(assert (=> b!194957 m!302171))

(declare-fun m!302173 () Bool)

(assert (=> b!194953 m!302173))

(assert (=> b!194953 m!302173))

(declare-fun m!302175 () Bool)

(assert (=> b!194953 m!302175))

(declare-fun m!302177 () Bool)

(assert (=> b!194949 m!302177))

(assert (=> b!194964 m!302151))

(assert (=> b!194964 m!302153))

(declare-fun m!302179 () Bool)

(assert (=> b!194964 m!302179))

(declare-fun m!302181 () Bool)

(assert (=> b!194969 m!302181))

(declare-fun m!302183 () Bool)

(assert (=> b!194950 m!302183))

(check-sat (not b!194956) (not b!194960) (not b!194958) (not b!194952) (not b!194969) (not b!194961) (not b!194968) (not b!194950) (not b!194945) (not b!194949) (not start!41548) (not b!194953) (not b!194967) (not b!194966) (not b!194946) (not b!194964) (not b!194948) (not b!194947) (not b!194963) (not b!194954) (not b!194944) (not b!194957))
