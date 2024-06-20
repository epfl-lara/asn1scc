; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16078 () Bool)

(assert start!16078)

(declare-fun res!67057 () Bool)

(declare-fun e!53290 () Bool)

(assert (=> start!16078 (=> (not res!67057) (not e!53290))))

(declare-fun nBits!516 () (_ BitVec 64))

(assert (=> start!16078 (= res!67057 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516) (bvsle nBits!516 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!16078 e!53290))

(assert (=> start!16078 true))

(declare-datatypes ((array!3588 0))(
  ( (array!3589 (arr!2272 (Array (_ BitVec 32) (_ BitVec 8))) (size!1653 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2868 0))(
  ( (BitStream!2869 (buf!2043 array!3588) (currentByte!3956 (_ BitVec 32)) (currentBit!3951 (_ BitVec 32))) )
))
(declare-fun thiss!1716 () BitStream!2868)

(declare-fun e!53291 () Bool)

(declare-fun inv!12 (BitStream!2868) Bool)

(assert (=> start!16078 (and (inv!12 thiss!1716) e!53291)))

(declare-fun b!81085 () Bool)

(declare-fun res!67056 () Bool)

(assert (=> b!81085 (=> (not res!67056) (not e!53290))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!81085 (= res!67056 (validate_offset_bits!1 ((_ sign_extend 32) (size!1653 (buf!2043 thiss!1716))) ((_ sign_extend 32) (currentByte!3956 thiss!1716)) ((_ sign_extend 32) (currentBit!3951 thiss!1716)) nBits!516))))

(declare-fun b!81086 () Bool)

(declare-fun lt!128754 () (_ BitVec 32))

(declare-datatypes ((Unit!5400 0))(
  ( (Unit!5401) )
))
(declare-datatypes ((tuple3!342 0))(
  ( (tuple3!343 (_1!3779 Unit!5400) (_2!3779 BitStream!2868) (_3!192 array!3588)) )
))
(declare-fun readBitsLoop!0 (BitStream!2868 (_ BitVec 64) array!3588 (_ BitVec 64) (_ BitVec 64)) tuple3!342)

(assert (=> b!81086 (= e!53290 (not (= (size!1653 (_3!192 (readBitsLoop!0 thiss!1716 nBits!516 (array!3589 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) lt!128754) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516))) lt!128754)))))

(assert (=> b!81086 (= lt!128754 ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!81087 () Bool)

(declare-fun array_inv!1499 (array!3588) Bool)

(assert (=> b!81087 (= e!53291 (array_inv!1499 (buf!2043 thiss!1716)))))

(assert (= (and start!16078 res!67057) b!81085))

(assert (= (and b!81085 res!67056) b!81086))

(assert (= start!16078 b!81087))

(declare-fun m!126875 () Bool)

(assert (=> start!16078 m!126875))

(declare-fun m!126877 () Bool)

(assert (=> b!81085 m!126877))

(declare-fun m!126879 () Bool)

(assert (=> b!81086 m!126879))

(declare-fun m!126881 () Bool)

(assert (=> b!81087 m!126881))

(check-sat (not b!81087) (not start!16078) (not b!81086) (not b!81085))
(check-sat)
(get-model)

(declare-fun d!25324 () Bool)

(assert (=> d!25324 (= (array_inv!1499 (buf!2043 thiss!1716)) (bvsge (size!1653 (buf!2043 thiss!1716)) #b00000000000000000000000000000000))))

(assert (=> b!81087 d!25324))

(declare-fun d!25326 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!25326 (= (inv!12 thiss!1716) (invariant!0 (currentBit!3951 thiss!1716) (currentByte!3956 thiss!1716) (size!1653 (buf!2043 thiss!1716))))))

(declare-fun bs!6201 () Bool)

(assert (= bs!6201 d!25326))

(declare-fun m!126891 () Bool)

(assert (=> bs!6201 m!126891))

(assert (=> start!16078 d!25326))

(declare-fun b!81125 () Bool)

(declare-fun res!67083 () Bool)

(declare-fun e!53319 () Bool)

(assert (=> b!81125 (=> (not res!67083) (not e!53319))))

(declare-fun lt!128935 () tuple3!342)

(declare-fun arrayBitRangesEq!0 (array!3588 array!3588 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!81125 (= res!67083 (arrayBitRangesEq!0 (array!3589 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) lt!128754) (_3!192 lt!128935) #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!81126 () Bool)

(declare-fun res!67085 () Bool)

(assert (=> b!81126 (=> (not res!67085) (not e!53319))))

(declare-fun e!53316 () Bool)

(assert (=> b!81126 (= res!67085 e!53316)))

(declare-fun res!67082 () Bool)

(assert (=> b!81126 (=> res!67082 e!53316)))

(assert (=> b!81126 (= res!67082 (not (bvslt #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516)))))

(declare-fun bm!1073 () Bool)

(declare-fun lt!128921 () (_ BitVec 64))

(declare-fun call!1077 () Bool)

(declare-fun lt!128916 () tuple3!342)

(declare-fun c!5691 () Bool)

(assert (=> bm!1073 (= call!1077 (arrayBitRangesEq!0 (array!3589 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) lt!128754) (ite c!5691 (_3!192 lt!128916) (array!3589 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) lt!128754)) (ite c!5691 lt!128921 #b0000000000000000000000000000000000000000000000000000000000000000) (ite c!5691 #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul ((_ sign_extend 32) (size!1653 (array!3589 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) lt!128754))) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!128924 () array!3588)

(declare-fun call!1076 () Bool)

(declare-fun lt!128914 () (_ BitVec 64))

(declare-fun bm!1074 () Bool)

(declare-fun lt!128915 () array!3588)

(declare-fun lt!128933 () (_ BitVec 64))

(assert (=> bm!1074 (= call!1076 (arrayBitRangesEq!0 (ite c!5691 (array!3589 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) lt!128754) lt!128915) (ite c!5691 (_3!192 lt!128916) lt!128924) (ite c!5691 #b0000000000000000000000000000000000000000000000000000000000000000 lt!128914) (ite c!5691 #b0000000000000000000000000000000000000000000000000000000000000000 lt!128933)))))

(declare-fun b!81127 () Bool)

(declare-datatypes ((List!806 0))(
  ( (Nil!803) (Cons!802 (h!921 Bool) (t!1556 List!806)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!2868 array!3588 (_ BitVec 64) (_ BitVec 64)) List!806)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2868 BitStream!2868 (_ BitVec 64)) List!806)

(assert (=> b!81127 (= e!53319 (= (byteArrayBitContentToList!0 (_2!3779 lt!128935) (_3!192 lt!128935) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub nBits!516 #b0000000000000000000000000000000000000000000000000000000000000000)) (bitStreamReadBitsIntoList!0 (_2!3779 lt!128935) thiss!1716 (bvsub nBits!516 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!81127 (or (= (bvand nBits!516 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!516 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!516 #b0000000000000000000000000000000000000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!81127 (or (= (bvand nBits!516 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!516 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!516 #b0000000000000000000000000000000000000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!53317 () Bool)

(declare-fun b!81128 () Bool)

(assert (=> b!81128 (= e!53317 (and (= (buf!2043 thiss!1716) (buf!2043 (_2!3779 lt!128916))) (= (size!1653 (array!3589 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) lt!128754)) (size!1653 (_3!192 lt!128916)))))))

(declare-fun d!25328 () Bool)

(assert (=> d!25328 e!53319))

(declare-fun res!67081 () Bool)

(assert (=> d!25328 (=> (not res!67081) (not e!53319))))

(declare-fun lt!128907 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> d!25328 (= res!67081 (= (bvsub lt!128907 #b0000000000000000000000000000000000000000000000000000000000000000) (bitIndex!0 (size!1653 (buf!2043 (_2!3779 lt!128935))) (currentByte!3956 (_2!3779 lt!128935)) (currentBit!3951 (_2!3779 lt!128935)))))))

(assert (=> d!25328 (or (= (bvand lt!128907 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!128907 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!128907 #b0000000000000000000000000000000000000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!128920 () (_ BitVec 64))

(assert (=> d!25328 (= lt!128907 (bvadd lt!128920 nBits!516))))

(assert (=> d!25328 (or (not (= (bvand lt!128920 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!516 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!128920 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!128920 nBits!516) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!25328 (= lt!128920 (bitIndex!0 (size!1653 (buf!2043 thiss!1716)) (currentByte!3956 thiss!1716) (currentBit!3951 thiss!1716)))))

(declare-fun e!53318 () tuple3!342)

(assert (=> d!25328 (= lt!128935 e!53318)))

(assert (=> d!25328 (= c!5691 (bvslt #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516))))

(assert (=> d!25328 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516) (bvsle nBits!516 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!25328 (= (readBitsLoop!0 thiss!1716 nBits!516 (array!3589 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) lt!128754) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516) lt!128935)))

(declare-fun b!81129 () Bool)

(declare-fun res!67084 () Bool)

(assert (=> b!81129 (=> (not res!67084) (not e!53319))))

(assert (=> b!81129 (= res!67084 (and (= (buf!2043 thiss!1716) (buf!2043 (_2!3779 lt!128935))) (= (size!1653 (array!3589 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) lt!128754)) (size!1653 (_3!192 lt!128935)))))))

(declare-fun b!81130 () Bool)

(declare-fun lt!128926 () Unit!5400)

(assert (=> b!81130 (= e!53318 (tuple3!343 lt!128926 thiss!1716 (array!3589 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) lt!128754)))))

(declare-fun lt!128929 () Unit!5400)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!3588) Unit!5400)

(assert (=> b!81130 (= lt!128929 (arrayBitRangesEqReflexiveLemma!0 (array!3589 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) lt!128754)))))

(assert (=> b!81130 call!1077))

(declare-fun lt!128922 () Unit!5400)

(assert (=> b!81130 (= lt!128922 lt!128929)))

(assert (=> b!81130 (= lt!128915 (array!3589 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) lt!128754))))

(assert (=> b!81130 (= lt!128924 (array!3589 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) lt!128754))))

(declare-fun lt!128905 () (_ BitVec 64))

(assert (=> b!81130 (= lt!128905 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!128931 () (_ BitVec 64))

(assert (=> b!81130 (= lt!128931 ((_ sign_extend 32) (size!1653 (array!3589 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) lt!128754))))))

(declare-fun lt!128903 () (_ BitVec 64))

(assert (=> b!81130 (= lt!128903 (bvmul lt!128931 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> b!81130 (= lt!128914 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!81130 (= lt!128933 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun arrayBitRangesEqSlicedLemma!0 (array!3588 array!3588 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!5400)

(assert (=> b!81130 (= lt!128926 (arrayBitRangesEqSlicedLemma!0 lt!128915 lt!128924 lt!128905 lt!128903 lt!128914 lt!128933))))

(assert (=> b!81130 call!1076))

(declare-fun b!81131 () Bool)

(declare-fun lt!128902 () Unit!5400)

(assert (=> b!81131 (= e!53318 (tuple3!343 lt!128902 (_2!3779 lt!128916) (_3!192 lt!128916)))))

(declare-datatypes ((tuple2!7174 0))(
  ( (tuple2!7175 (_1!3781 Bool) (_2!3781 BitStream!2868)) )
))
(declare-fun lt!128919 () tuple2!7174)

(declare-fun readBit!0 (BitStream!2868) tuple2!7174)

(assert (=> b!81131 (= lt!128919 (readBit!0 thiss!1716))))

(declare-fun lt!128923 () (_ BitVec 32))

(assert (=> b!81131 (= lt!128923 ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!128937 () (_ BitVec 32))

(assert (=> b!81131 (= lt!128937 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!128930 () array!3588)

(assert (=> b!81131 (= lt!128930 (array!3589 (store (arr!2272 (array!3589 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) lt!128754)) lt!128923 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!2272 (array!3589 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) lt!128754)) lt!128923)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!128937)))) ((_ sign_extend 24) (ite (_1!3781 lt!128919) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!128937) #b00000000))))) (size!1653 (array!3589 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) lt!128754))))))

(declare-fun lt!128912 () (_ BitVec 64))

(assert (=> b!81131 (= lt!128912 (bvsub nBits!516 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!128904 () (_ BitVec 64))

(assert (=> b!81131 (= lt!128904 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!128913 () Unit!5400)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2868 BitStream!2868 (_ BitVec 64) (_ BitVec 64)) Unit!5400)

(assert (=> b!81131 (= lt!128913 (validateOffsetBitsIneqLemma!0 thiss!1716 (_2!3781 lt!128919) lt!128912 lt!128904))))

(assert (=> b!81131 (validate_offset_bits!1 ((_ sign_extend 32) (size!1653 (buf!2043 (_2!3781 lt!128919)))) ((_ sign_extend 32) (currentByte!3956 (_2!3781 lt!128919))) ((_ sign_extend 32) (currentBit!3951 (_2!3781 lt!128919))) (bvsub lt!128912 lt!128904))))

(declare-fun lt!128932 () Unit!5400)

(assert (=> b!81131 (= lt!128932 lt!128913)))

(assert (=> b!81131 (= lt!128916 (readBitsLoop!0 (_2!3781 lt!128919) nBits!516 lt!128930 (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) nBits!516))))

(declare-fun res!67080 () Bool)

(assert (=> b!81131 (= res!67080 (= (bvsub (bvadd (bitIndex!0 (size!1653 (buf!2043 thiss!1716)) (currentByte!3956 thiss!1716) (currentBit!3951 thiss!1716)) nBits!516) #b0000000000000000000000000000000000000000000000000000000000000000) (bitIndex!0 (size!1653 (buf!2043 (_2!3779 lt!128916))) (currentByte!3956 (_2!3779 lt!128916)) (currentBit!3951 (_2!3779 lt!128916)))))))

(assert (=> b!81131 (=> (not res!67080) (not e!53317))))

(assert (=> b!81131 e!53317))

(declare-fun lt!128934 () Unit!5400)

(declare-fun Unit!5404 () Unit!5400)

(assert (=> b!81131 (= lt!128934 Unit!5404)))

(declare-fun lt!128911 () (_ BitVec 32))

(assert (=> b!81131 (= lt!128911 ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!128908 () (_ BitVec 32))

(assert (=> b!81131 (= lt!128908 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!128910 () Unit!5400)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!3588 (_ BitVec 64) Bool) Unit!5400)

(assert (=> b!81131 (= lt!128910 (arrayBitRangesUpdatedAtLemma!0 (array!3589 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) lt!128754) #b0000000000000000000000000000000000000000000000000000000000000000 (_1!3781 lt!128919)))))

(assert (=> b!81131 (arrayBitRangesEq!0 (array!3589 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) lt!128754) (array!3589 (store (arr!2272 (array!3589 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) lt!128754)) lt!128911 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!2272 (array!3589 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) lt!128754)) lt!128911)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!128908)))) ((_ sign_extend 24) (ite (_1!3781 lt!128919) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!128908) #b00000000))))) (size!1653 (array!3589 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) lt!128754))) #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!128925 () Unit!5400)

(assert (=> b!81131 (= lt!128925 lt!128910)))

(assert (=> b!81131 (= lt!128921 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!128936 () Unit!5400)

(declare-fun arrayBitRangesEqTransitive!0 (array!3588 array!3588 array!3588 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!5400)

(assert (=> b!81131 (= lt!128936 (arrayBitRangesEqTransitive!0 (array!3589 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) lt!128754) lt!128930 (_3!192 lt!128916) lt!128921 #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!81131 call!1077))

(declare-fun lt!128918 () Unit!5400)

(assert (=> b!81131 (= lt!128918 lt!128936)))

(assert (=> b!81131 call!1076))

(declare-fun lt!128917 () Unit!5400)

(declare-fun Unit!5406 () Unit!5400)

(assert (=> b!81131 (= lt!128917 Unit!5406)))

(declare-fun lt!128927 () Unit!5400)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!3588 array!3588 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!5400)

(assert (=> b!81131 (= lt!128927 (arrayBitRangesEqImpliesEq!0 lt!128930 (_3!192 lt!128916) #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bitAt!0 (array!3588 (_ BitVec 64)) Bool)

(assert (=> b!81131 (= (bitAt!0 lt!128930 #b0000000000000000000000000000000000000000000000000000000000000000) (bitAt!0 (_3!192 lt!128916) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!128906 () Unit!5400)

(assert (=> b!81131 (= lt!128906 lt!128927)))

(declare-fun lt!128928 () Unit!5400)

(declare-fun Unit!5407 () Unit!5400)

(assert (=> b!81131 (= lt!128928 Unit!5407)))

(declare-fun lt!128909 () Bool)

(assert (=> b!81131 (= lt!128909 (= (bitAt!0 (_3!192 lt!128916) #b0000000000000000000000000000000000000000000000000000000000000000) (_1!3781 lt!128919)))))

(declare-fun Unit!5409 () Unit!5400)

(assert (=> b!81131 (= lt!128902 Unit!5409)))

(assert (=> b!81131 lt!128909))

(declare-fun b!81132 () Bool)

(declare-datatypes ((tuple2!7180 0))(
  ( (tuple2!7181 (_1!3784 BitStream!2868) (_2!3784 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!2868) tuple2!7180)

(assert (=> b!81132 (= e!53316 (= (bitAt!0 (_3!192 lt!128935) #b0000000000000000000000000000000000000000000000000000000000000000) (_2!3784 (readBitPure!0 thiss!1716))))))

(declare-fun b!81133 () Bool)

(declare-fun res!67086 () Bool)

(assert (=> b!81133 (=> (not res!67086) (not e!53319))))

(assert (=> b!81133 (= res!67086 (invariant!0 (currentBit!3951 (_2!3779 lt!128935)) (currentByte!3956 (_2!3779 lt!128935)) (size!1653 (buf!2043 (_2!3779 lt!128935)))))))

(assert (= (and d!25328 c!5691) b!81131))

(assert (= (and d!25328 (not c!5691)) b!81130))

(assert (= (and b!81131 res!67080) b!81128))

(assert (= (or b!81131 b!81130) bm!1074))

(assert (= (or b!81131 b!81130) bm!1073))

(assert (= (and d!25328 res!67081) b!81129))

(assert (= (and b!81129 res!67084) b!81125))

(assert (= (and b!81125 res!67083) b!81126))

(assert (= (and b!81126 (not res!67082)) b!81132))

(assert (= (and b!81126 res!67085) b!81133))

(assert (= (and b!81133 res!67086) b!81127))

(declare-fun m!126897 () Bool)

(assert (=> b!81125 m!126897))

(declare-fun m!126899 () Bool)

(assert (=> bm!1074 m!126899))

(declare-fun m!126901 () Bool)

(assert (=> b!81132 m!126901))

(declare-fun m!126903 () Bool)

(assert (=> b!81132 m!126903))

(declare-fun m!126905 () Bool)

(assert (=> b!81127 m!126905))

(declare-fun m!126907 () Bool)

(assert (=> b!81127 m!126907))

(declare-fun m!126909 () Bool)

(assert (=> d!25328 m!126909))

(declare-fun m!126911 () Bool)

(assert (=> d!25328 m!126911))

(declare-fun m!126913 () Bool)

(assert (=> b!81133 m!126913))

(declare-fun m!126915 () Bool)

(assert (=> b!81130 m!126915))

(declare-fun m!126917 () Bool)

(assert (=> b!81130 m!126917))

(declare-fun m!126919 () Bool)

(assert (=> b!81131 m!126919))

(assert (=> b!81131 m!126911))

(declare-fun m!126921 () Bool)

(assert (=> b!81131 m!126921))

(declare-fun m!126923 () Bool)

(assert (=> b!81131 m!126923))

(declare-fun m!126925 () Bool)

(assert (=> b!81131 m!126925))

(declare-fun m!126927 () Bool)

(assert (=> b!81131 m!126927))

(declare-fun m!126929 () Bool)

(assert (=> b!81131 m!126929))

(declare-fun m!126931 () Bool)

(assert (=> b!81131 m!126931))

(declare-fun m!126933 () Bool)

(assert (=> b!81131 m!126933))

(declare-fun m!126935 () Bool)

(assert (=> b!81131 m!126935))

(declare-fun m!126937 () Bool)

(assert (=> b!81131 m!126937))

(declare-fun m!126939 () Bool)

(assert (=> b!81131 m!126939))

(declare-fun m!126941 () Bool)

(assert (=> b!81131 m!126941))

(declare-fun m!126943 () Bool)

(assert (=> b!81131 m!126943))

(declare-fun m!126945 () Bool)

(assert (=> b!81131 m!126945))

(declare-fun m!126947 () Bool)

(assert (=> b!81131 m!126947))

(declare-fun m!126949 () Bool)

(assert (=> b!81131 m!126949))

(declare-fun m!126951 () Bool)

(assert (=> b!81131 m!126951))

(declare-fun m!126953 () Bool)

(assert (=> bm!1073 m!126953))

(assert (=> b!81086 d!25328))

(declare-fun d!25340 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!25340 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1653 (buf!2043 thiss!1716))) ((_ sign_extend 32) (currentByte!3956 thiss!1716)) ((_ sign_extend 32) (currentBit!3951 thiss!1716)) nBits!516) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1653 (buf!2043 thiss!1716))) ((_ sign_extend 32) (currentByte!3956 thiss!1716)) ((_ sign_extend 32) (currentBit!3951 thiss!1716))) nBits!516))))

(declare-fun bs!6204 () Bool)

(assert (= bs!6204 d!25340))

(declare-fun m!126955 () Bool)

(assert (=> bs!6204 m!126955))

(assert (=> b!81085 d!25340))

(check-sat (not b!81133) (not b!81131) (not d!25328) (not b!81132) (not b!81127) (not bm!1073) (not b!81125) (not bm!1074) (not d!25340) (not b!81130) (not d!25326))
(check-sat)
