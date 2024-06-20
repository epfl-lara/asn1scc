; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16080 () Bool)

(assert start!16080)

(declare-fun res!67063 () Bool)

(declare-fun e!53299 () Bool)

(assert (=> start!16080 (=> (not res!67063) (not e!53299))))

(declare-fun nBits!516 () (_ BitVec 64))

(assert (=> start!16080 (= res!67063 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516) (bvsle nBits!516 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!16080 e!53299))

(assert (=> start!16080 true))

(declare-datatypes ((array!3590 0))(
  ( (array!3591 (arr!2273 (Array (_ BitVec 32) (_ BitVec 8))) (size!1654 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2870 0))(
  ( (BitStream!2871 (buf!2044 array!3590) (currentByte!3957 (_ BitVec 32)) (currentBit!3952 (_ BitVec 32))) )
))
(declare-fun thiss!1716 () BitStream!2870)

(declare-fun e!53301 () Bool)

(declare-fun inv!12 (BitStream!2870) Bool)

(assert (=> start!16080 (and (inv!12 thiss!1716) e!53301)))

(declare-fun b!81094 () Bool)

(declare-fun res!67062 () Bool)

(assert (=> b!81094 (=> (not res!67062) (not e!53299))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!81094 (= res!67062 (validate_offset_bits!1 ((_ sign_extend 32) (size!1654 (buf!2044 thiss!1716))) ((_ sign_extend 32) (currentByte!3957 thiss!1716)) ((_ sign_extend 32) (currentBit!3952 thiss!1716)) nBits!516))))

(declare-fun b!81095 () Bool)

(declare-fun lt!128757 () (_ BitVec 32))

(declare-datatypes ((Unit!5402 0))(
  ( (Unit!5403) )
))
(declare-datatypes ((tuple3!344 0))(
  ( (tuple3!345 (_1!3780 Unit!5402) (_2!3780 BitStream!2870) (_3!193 array!3590)) )
))
(declare-fun readBitsLoop!0 (BitStream!2870 (_ BitVec 64) array!3590 (_ BitVec 64) (_ BitVec 64)) tuple3!344)

(assert (=> b!81095 (= e!53299 (not (= (size!1654 (_3!193 (readBitsLoop!0 thiss!1716 nBits!516 (array!3591 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) lt!128757) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516))) lt!128757)))))

(assert (=> b!81095 (= lt!128757 ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!81096 () Bool)

(declare-fun array_inv!1500 (array!3590) Bool)

(assert (=> b!81096 (= e!53301 (array_inv!1500 (buf!2044 thiss!1716)))))

(assert (= (and start!16080 res!67063) b!81094))

(assert (= (and b!81094 res!67062) b!81095))

(assert (= start!16080 b!81096))

(declare-fun m!126883 () Bool)

(assert (=> start!16080 m!126883))

(declare-fun m!126885 () Bool)

(assert (=> b!81094 m!126885))

(declare-fun m!126887 () Bool)

(assert (=> b!81095 m!126887))

(declare-fun m!126889 () Bool)

(assert (=> b!81096 m!126889))

(push 1)

(assert (not b!81095))

(assert (not b!81096))

(assert (not start!16080))

(assert (not b!81094))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun lt!129059 () (_ BitVec 64))

(declare-fun c!5693 () Bool)

(declare-fun lt!129079 () array!3590)

(declare-fun lt!129077 () (_ BitVec 64))

(declare-fun lt!129052 () (_ BitVec 64))

(declare-fun lt!129047 () array!3590)

(declare-fun lt!129057 () tuple3!344)

(declare-fun bm!1085 () Bool)

(declare-fun call!1089 () Bool)

(declare-fun arrayBitRangesEq!0 (array!3590 array!3590 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> bm!1085 (= call!1089 (arrayBitRangesEq!0 (ite c!5693 (array!3591 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) lt!128757) lt!129047) (ite c!5693 (_3!193 lt!129057) lt!129079) (ite c!5693 lt!129077 lt!129059) (ite c!5693 #b0000000000000000000000000000000000000000000000000000000000000000 lt!129052)))))

(declare-fun b!81169 () Bool)

(declare-fun e!53335 () tuple3!344)

(declare-fun lt!129064 () Unit!5402)

(assert (=> b!81169 (= e!53335 (tuple3!345 lt!129064 (_2!3780 lt!129057) (_3!193 lt!129057)))))

(declare-datatypes ((tuple2!7178 0))(
  ( (tuple2!7179 (_1!3783 Bool) (_2!3783 BitStream!2870)) )
))
(declare-fun lt!129072 () tuple2!7178)

(declare-fun readBit!0 (BitStream!2870) tuple2!7178)

(assert (=> b!81169 (= lt!129072 (readBit!0 thiss!1716))))

(declare-fun lt!129070 () (_ BitVec 32))

(assert (=> b!81169 (= lt!129070 ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!129060 () (_ BitVec 32))

(assert (=> b!81169 (= lt!129060 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!129078 () array!3590)

(assert (=> b!81169 (= lt!129078 (array!3591 (store (arr!2273 (array!3591 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) lt!128757)) lt!129070 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!2273 (array!3591 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) lt!128757)) lt!129070)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!129060)))) ((_ sign_extend 24) (ite (_1!3783 lt!129072) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!129060) #b00000000))))) (size!1654 (array!3591 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) lt!128757))))))

(declare-fun lt!129063 () (_ BitVec 64))

(assert (=> b!81169 (= lt!129063 (bvsub nBits!516 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!129068 () (_ BitVec 64))

(assert (=> b!81169 (= lt!129068 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!129081 () Unit!5402)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2870 BitStream!2870 (_ BitVec 64) (_ BitVec 64)) Unit!5402)

(assert (=> b!81169 (= lt!129081 (validateOffsetBitsIneqLemma!0 thiss!1716 (_2!3783 lt!129072) lt!129063 lt!129068))))

(assert (=> b!81169 (validate_offset_bits!1 ((_ sign_extend 32) (size!1654 (buf!2044 (_2!3783 lt!129072)))) ((_ sign_extend 32) (currentByte!3957 (_2!3783 lt!129072))) ((_ sign_extend 32) (currentBit!3952 (_2!3783 lt!129072))) (bvsub lt!129063 lt!129068))))

(declare-fun lt!129048 () Unit!5402)

(assert (=> b!81169 (= lt!129048 lt!129081)))

(assert (=> b!81169 (= lt!129057 (readBitsLoop!0 (_2!3783 lt!129072) nBits!516 lt!129078 (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) nBits!516))))

(declare-fun res!67121 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!81169 (= res!67121 (= (bvsub (bvadd (bitIndex!0 (size!1654 (buf!2044 thiss!1716)) (currentByte!3957 thiss!1716) (currentBit!3952 thiss!1716)) nBits!516) #b0000000000000000000000000000000000000000000000000000000000000000) (bitIndex!0 (size!1654 (buf!2044 (_2!3780 lt!129057))) (currentByte!3957 (_2!3780 lt!129057)) (currentBit!3952 (_2!3780 lt!129057)))))))

(declare-fun e!53334 () Bool)

(assert (=> b!81169 (=> (not res!67121) (not e!53334))))

(assert (=> b!81169 e!53334))

(declare-fun lt!129051 () Unit!5402)

(declare-fun Unit!5412 () Unit!5402)

(assert (=> b!81169 (= lt!129051 Unit!5412)))

(declare-fun lt!129076 () (_ BitVec 32))

(assert (=> b!81169 (= lt!129076 ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!129066 () (_ BitVec 32))

(assert (=> b!81169 (= lt!129066 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!129055 () Unit!5402)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!3590 (_ BitVec 64) Bool) Unit!5402)

(assert (=> b!81169 (= lt!129055 (arrayBitRangesUpdatedAtLemma!0 (array!3591 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) lt!128757) #b0000000000000000000000000000000000000000000000000000000000000000 (_1!3783 lt!129072)))))

(declare-fun call!1088 () Bool)

(assert (=> b!81169 call!1088))

(declare-fun lt!129067 () Unit!5402)

(assert (=> b!81169 (= lt!129067 lt!129055)))

(assert (=> b!81169 (= lt!129077 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!129065 () Unit!5402)

(declare-fun arrayBitRangesEqTransitive!0 (array!3590 array!3590 array!3590 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!5402)

(assert (=> b!81169 (= lt!129065 (arrayBitRangesEqTransitive!0 (array!3591 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) lt!128757) lt!129078 (_3!193 lt!129057) lt!129077 #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!81169 call!1089))

(declare-fun lt!129050 () Unit!5402)

(assert (=> b!81169 (= lt!129050 lt!129065)))

(assert (=> b!81169 (arrayBitRangesEq!0 (array!3591 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) lt!128757) (_3!193 lt!129057) #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!129071 () Unit!5402)

(declare-fun Unit!5413 () Unit!5402)

(assert (=> b!81169 (= lt!129071 Unit!5413)))

(declare-fun lt!129056 () Unit!5402)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!3590 array!3590 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!5402)

(assert (=> b!81169 (= lt!129056 (arrayBitRangesEqImpliesEq!0 lt!129078 (_3!193 lt!129057) #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bitAt!0 (array!3590 (_ BitVec 64)) Bool)

(assert (=> b!81169 (= (bitAt!0 lt!129078 #b0000000000000000000000000000000000000000000000000000000000000000) (bitAt!0 (_3!193 lt!129057) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!129054 () Unit!5402)

(assert (=> b!81169 (= lt!129054 lt!129056)))

(declare-fun lt!129074 () Unit!5402)

(declare-fun Unit!5414 () Unit!5402)

(assert (=> b!81169 (= lt!129074 Unit!5414)))

(declare-fun lt!129053 () Bool)

(assert (=> b!81169 (= lt!129053 (= (bitAt!0 (_3!193 lt!129057) #b0000000000000000000000000000000000000000000000000000000000000000) (_1!3783 lt!129072)))))

(declare-fun Unit!5415 () Unit!5402)

(assert (=> b!81169 (= lt!129064 Unit!5415)))

(assert (=> b!81169 lt!129053))

(declare-fun b!81170 () Bool)

(declare-fun lt!129058 () tuple3!344)

(declare-fun e!53336 () Bool)

(declare-datatypes ((List!808 0))(
  ( (Nil!805) (Cons!804 (h!923 Bool) (t!1558 List!808)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!2870 array!3590 (_ BitVec 64) (_ BitVec 64)) List!808)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2870 BitStream!2870 (_ BitVec 64)) List!808)

(assert (=> b!81170 (= e!53336 (= (byteArrayBitContentToList!0 (_2!3780 lt!129058) (_3!193 lt!129058) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub nBits!516 #b0000000000000000000000000000000000000000000000000000000000000000)) (bitStreamReadBitsIntoList!0 (_2!3780 lt!129058) thiss!1716 (bvsub nBits!516 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!81170 (or (= (bvand nBits!516 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!516 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!516 #b0000000000000000000000000000000000000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!81170 (or (= (bvand nBits!516 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!516 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!516 #b0000000000000000000000000000000000000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!81171 () Bool)

(declare-fun e!53337 () Bool)

(declare-datatypes ((tuple2!7184 0))(
  ( (tuple2!7185 (_1!3786 BitStream!2870) (_2!3786 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!2870) tuple2!7184)

(assert (=> b!81171 (= e!53337 (= (bitAt!0 (_3!193 lt!129058) #b0000000000000000000000000000000000000000000000000000000000000000) (_2!3786 (readBitPure!0 thiss!1716))))))

(declare-fun b!81172 () Bool)

(declare-fun lt!129049 () Unit!5402)

(assert (=> b!81172 (= e!53335 (tuple3!345 lt!129049 thiss!1716 (array!3591 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) lt!128757)))))

(declare-fun lt!129075 () Unit!5402)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!3590) Unit!5402)

(assert (=> b!81172 (= lt!129075 (arrayBitRangesEqReflexiveLemma!0 (array!3591 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) lt!128757)))))

(assert (=> b!81172 call!1088))

(declare-fun lt!129062 () Unit!5402)

(assert (=> b!81172 (= lt!129062 lt!129075)))

(assert (=> b!81172 (= lt!129047 (array!3591 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) lt!128757))))

(assert (=> b!81172 (= lt!129079 (array!3591 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) lt!128757))))

(declare-fun lt!129073 () (_ BitVec 64))

(assert (=> b!81172 (= lt!129073 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!129046 () (_ BitVec 64))

(assert (=> b!81172 (= lt!129046 ((_ sign_extend 32) (size!1654 (array!3591 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) lt!128757))))))

(declare-fun lt!129069 () (_ BitVec 64))

(assert (=> b!81172 (= lt!129069 (bvmul lt!129046 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> b!81172 (= lt!129059 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!81172 (= lt!129052 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun arrayBitRangesEqSlicedLemma!0 (array!3590 array!3590 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!5402)

(assert (=> b!81172 (= lt!129049 (arrayBitRangesEqSlicedLemma!0 lt!129047 lt!129079 lt!129073 lt!129069 lt!129059 lt!129052))))

(assert (=> b!81172 call!1089))

(declare-fun b!81173 () Bool)

(assert (=> b!81173 (= e!53334 (and (= (buf!2044 thiss!1716) (buf!2044 (_2!3780 lt!129057))) (= (size!1654 (array!3591 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) lt!128757)) (size!1654 (_3!193 lt!129057)))))))

(declare-fun b!81174 () Bool)

(declare-fun res!67123 () Bool)

(assert (=> b!81174 (=> (not res!67123) (not e!53336))))

(assert (=> b!81174 (= res!67123 e!53337)))

(declare-fun res!67122 () Bool)

(assert (=> b!81174 (=> res!67122 e!53337)))

(assert (=> b!81174 (= res!67122 (not (bvslt #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516)))))

(declare-fun d!25338 () Bool)

(assert (=> d!25338 e!53336))

(declare-fun res!67124 () Bool)

(assert (=> d!25338 (=> (not res!67124) (not e!53336))))

(declare-fun lt!129080 () (_ BitVec 64))

(assert (=> d!25338 (= res!67124 (= (bvsub lt!129080 #b0000000000000000000000000000000000000000000000000000000000000000) (bitIndex!0 (size!1654 (buf!2044 (_2!3780 lt!129058))) (currentByte!3957 (_2!3780 lt!129058)) (currentBit!3952 (_2!3780 lt!129058)))))))

