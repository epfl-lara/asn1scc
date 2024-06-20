; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19412 () Bool)

(assert start!19412)

(declare-fun b!96956 () Bool)

(declare-fun e!63567 () Bool)

(declare-fun e!63565 () Bool)

(assert (=> b!96956 (= e!63567 e!63565)))

(declare-fun res!79573 () Bool)

(assert (=> b!96956 (=> (not res!79573) (not e!63565))))

(declare-datatypes ((array!4538 0))(
  ( (array!4539 (arr!2669 (Array (_ BitVec 32) (_ BitVec 8))) (size!2076 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3626 0))(
  ( (BitStream!3627 (buf!2422 array!4538) (currentByte!4829 (_ BitVec 32)) (currentBit!4824 (_ BitVec 32))) )
))
(declare-fun thiss!1288 () BitStream!3626)

(declare-datatypes ((Unit!5874 0))(
  ( (Unit!5875) )
))
(declare-datatypes ((tuple2!7752 0))(
  ( (tuple2!7753 (_1!4128 Unit!5874) (_2!4128 BitStream!3626)) )
))
(declare-fun lt!139886 () tuple2!7752)

(assert (=> b!96956 (= res!79573 (= (size!2076 (buf!2422 thiss!1288)) (size!2076 (buf!2422 (_2!4128 lt!139886)))))))

(declare-fun v!196 () (_ BitVec 64))

(declare-fun nBits!388 () (_ BitVec 32))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3626 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!7752)

(assert (=> b!96956 (= lt!139886 (appendNLeastSignificantBitsLoop!0 thiss!1288 v!196 nBits!388 #b00000000000000000000000000000000))))

(declare-fun res!79570 () Bool)

(assert (=> start!19412 (=> (not res!79570) (not e!63567))))

(assert (=> start!19412 (= res!79570 (and (bvsge nBits!388 #b00000000000000000000000000000000) (bvsle nBits!388 #b00000000000000000000000001000000)))))

(assert (=> start!19412 e!63567))

(assert (=> start!19412 true))

(declare-fun e!63566 () Bool)

(declare-fun inv!12 (BitStream!3626) Bool)

(assert (=> start!19412 (and (inv!12 thiss!1288) e!63566)))

(declare-fun b!96957 () Bool)

(declare-fun res!79572 () Bool)

(assert (=> b!96957 (=> (not res!79572) (not e!63567))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!96957 (= res!79572 (= (bvand v!196 (onesLSBLong!0 nBits!388)) v!196))))

(declare-fun b!96958 () Bool)

(declare-fun res!79571 () Bool)

(assert (=> b!96958 (=> (not res!79571) (not e!63567))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!96958 (= res!79571 (validate_offset_bits!1 ((_ sign_extend 32) (size!2076 (buf!2422 thiss!1288))) ((_ sign_extend 32) (currentByte!4829 thiss!1288)) ((_ sign_extend 32) (currentBit!4824 thiss!1288)) ((_ sign_extend 32) nBits!388)))))

(declare-fun b!96959 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!96959 (= e!63565 (not (invariant!0 (currentBit!4824 (_2!4128 lt!139886)) (currentByte!4829 (_2!4128 lt!139886)) (size!2076 (buf!2422 (_2!4128 lt!139886))))))))

(declare-fun b!96960 () Bool)

(declare-fun array_inv!1878 (array!4538) Bool)

(assert (=> b!96960 (= e!63566 (array_inv!1878 (buf!2422 thiss!1288)))))

(assert (= (and start!19412 res!79570) b!96958))

(assert (= (and b!96958 res!79571) b!96957))

(assert (= (and b!96957 res!79572) b!96956))

(assert (= (and b!96956 res!79573) b!96959))

(assert (= start!19412 b!96960))

(declare-fun m!140577 () Bool)

(assert (=> b!96957 m!140577))

(declare-fun m!140579 () Bool)

(assert (=> b!96958 m!140579))

(declare-fun m!140581 () Bool)

(assert (=> start!19412 m!140581))

(declare-fun m!140583 () Bool)

(assert (=> b!96956 m!140583))

(declare-fun m!140585 () Bool)

(assert (=> b!96959 m!140585))

(declare-fun m!140587 () Bool)

(assert (=> b!96960 m!140587))

(push 1)

(assert (not b!96958))

(assert (not b!96959))

(assert (not start!19412))

(assert (not b!96956))

(assert (not b!96957))

(assert (not b!96960))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!30416 () Bool)

(assert (=> d!30416 (= (array_inv!1878 (buf!2422 thiss!1288)) (bvsge (size!2076 (buf!2422 thiss!1288)) #b00000000000000000000000000000000))))

(assert (=> b!96960 d!30416))

(declare-fun d!30420 () Bool)

(assert (=> d!30420 (= (inv!12 thiss!1288) (invariant!0 (currentBit!4824 thiss!1288) (currentByte!4829 thiss!1288) (size!2076 (buf!2422 thiss!1288))))))

(declare-fun bs!7439 () Bool)

(assert (= bs!7439 d!30420))

(declare-fun m!140591 () Bool)

(assert (=> bs!7439 m!140591))

(assert (=> start!19412 d!30420))

(declare-fun d!30422 () Bool)

(assert (=> d!30422 (= (invariant!0 (currentBit!4824 (_2!4128 lt!139886)) (currentByte!4829 (_2!4128 lt!139886)) (size!2076 (buf!2422 (_2!4128 lt!139886)))) (and (bvsge (currentBit!4824 (_2!4128 lt!139886)) #b00000000000000000000000000000000) (bvslt (currentBit!4824 (_2!4128 lt!139886)) #b00000000000000000000000000001000) (bvsge (currentByte!4829 (_2!4128 lt!139886)) #b00000000000000000000000000000000) (or (bvslt (currentByte!4829 (_2!4128 lt!139886)) (size!2076 (buf!2422 (_2!4128 lt!139886)))) (and (= (currentBit!4824 (_2!4128 lt!139886)) #b00000000000000000000000000000000) (= (currentByte!4829 (_2!4128 lt!139886)) (size!2076 (buf!2422 (_2!4128 lt!139886))))))))))

(assert (=> b!96959 d!30422))

(declare-fun d!30428 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!30428 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2076 (buf!2422 thiss!1288))) ((_ sign_extend 32) (currentByte!4829 thiss!1288)) ((_ sign_extend 32) (currentBit!4824 thiss!1288)) ((_ sign_extend 32) nBits!388)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2076 (buf!2422 thiss!1288))) ((_ sign_extend 32) (currentByte!4829 thiss!1288)) ((_ sign_extend 32) (currentBit!4824 thiss!1288))) ((_ sign_extend 32) nBits!388)))))

(declare-fun bs!7441 () Bool)

(assert (= bs!7441 d!30428))

(declare-fun m!140595 () Bool)

(assert (=> bs!7441 m!140595))

(assert (=> b!96958 d!30428))

(declare-fun b!97026 () Bool)

(declare-fun e!63603 () (_ BitVec 64))

(assert (=> b!97026 (= e!63603 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!97027 () Bool)

(declare-fun res!79621 () Bool)

(declare-fun e!63609 () Bool)

(assert (=> b!97027 (=> (not res!79621) (not e!63609))))

(declare-fun lt!140099 () tuple2!7752)

(declare-fun isPrefixOf!0 (BitStream!3626 BitStream!3626) Bool)

(assert (=> b!97027 (= res!79621 (isPrefixOf!0 thiss!1288 (_2!4128 lt!140099)))))

(declare-fun b!97028 () Bool)

(declare-fun res!79613 () Bool)

(declare-fun call!1189 () Bool)

(assert (=> b!97028 (= res!79613 call!1189)))

(declare-fun e!63606 () Bool)

(assert (=> b!97028 (=> (not res!79613) (not e!63606))))

(declare-fun b!97029 () Bool)

(declare-fun e!63602 () tuple2!7752)

(declare-fun lt!140102 () Unit!5874)

(assert (=> b!97029 (= e!63602 (tuple2!7753 lt!140102 thiss!1288))))

(declare-fun lt!140147 () BitStream!3626)

(assert (=> b!97029 (= lt!140147 thiss!1288)))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!3626) Unit!5874)

(assert (=> b!97029 (= lt!140102 (lemmaIsPrefixRefl!0 lt!140147))))

(assert (=> b!97029 call!1189))

(declare-fun b!97030 () Bool)

(declare-fun res!79622 () Bool)

(declare-fun lt!140134 () tuple2!7752)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!97030 (= res!79622 (= (bitIndex!0 (size!2076 (buf!2422 (_2!4128 lt!140134))) (currentByte!4829 (_2!4128 lt!140134)) (currentBit!4824 (_2!4128 lt!140134))) (bvadd (bitIndex!0 (size!2076 (buf!2422 thiss!1288)) (currentByte!4829 thiss!1288) (currentBit!4824 thiss!1288)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!97030 (=> (not res!79622) (not e!63606))))

(declare-fun b!97031 () Bool)

(declare-fun res!79624 () Bool)

(assert (=> b!97031 (=> (not res!79624) (not e!63609))))

(declare-fun lt!140118 () (_ BitVec 64))

(declare-fun lt!140086 () (_ BitVec 64))

(assert (=> b!97031 (= res!79624 (= (bitIndex!0 (size!2076 (buf!2422 (_2!4128 lt!140099))) (currentByte!4829 (_2!4128 lt!140099)) (currentBit!4824 (_2!4128 lt!140099))) (bvadd lt!140086 lt!140118)))))

(assert (=> b!97031 (or (not (= (bvand lt!140086 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!140118 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!140086 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!140086 lt!140118) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!97031 (= lt!140118 ((_ sign_extend 32) (bvsub nBits!388 #b00000000000000000000000000000000)))))

(assert (=> b!97031 (or (= (bvand nBits!388 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand nBits!388 #b10000000000000000000000000000000) (bvand (bvsub nBits!388 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(assert (=> b!97031 (= lt!140086 (bitIndex!0 (size!2076 (buf!2422 thiss!1288)) (currentByte!4829 thiss!1288) (currentBit!4824 thiss!1288)))))

(declare-fun b!97032 () Bool)

(declare-fun e!63600 () Bool)

(declare-datatypes ((tuple2!7758 0))(
  ( (tuple2!7759 (_1!4131 BitStream!3626) (_2!4131 Bool)) )
))
(declare-fun lt!140100 () tuple2!7758)

(assert (=> b!97032 (= e!63600 (= (bitIndex!0 (size!2076 (buf!2422 (_1!4131 lt!140100))) (currentByte!4829 (_1!4131 lt!140100)) (currentBit!4824 (_1!4131 lt!140100))) (bitIndex!0 (size!2076 (buf!2422 (_2!4128 lt!140134))) (currentByte!4829 (_2!4128 lt!140134)) (currentBit!4824 (_2!4128 lt!140134)))))))

(declare-fun d!30434 () Bool)

(assert (=> d!30434 e!63609))

(declare-fun res!79611 () Bool)

(assert (=> d!30434 (=> (not res!79611) (not e!63609))))

(assert (=> d!30434 (= res!79611 (= (size!2076 (buf!2422 thiss!1288)) (size!2076 (buf!2422 (_2!4128 lt!140099)))))))

(assert (=> d!30434 (= lt!140099 e!63602)))

(declare-fun c!6132 () Bool)

(assert (=> d!30434 (= c!6132 (bvslt #b00000000000000000000000000000000 nBits!388))))

(assert (=> d!30434 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 nBits!388) (bvsle nBits!388 #b00000000000000000000000001000000))))

(assert (=> d!30434 (= (appendNLeastSignificantBitsLoop!0 thiss!1288 v!196 nBits!388 #b00000000000000000000000000000000) lt!140099)))

(declare-fun b!97033 () Bool)

(declare-fun e!63599 () Bool)

(declare-fun lt!140137 () tuple2!7758)

(declare-fun lt!140088 () tuple2!7758)

(assert (=> b!97033 (= e!63599 (= (_2!4131 lt!140137) (_2!4131 lt!140088)))))

(declare-fun b!97034 () Bool)

(declare-fun readBitPure!0 (BitStream!3626) tuple2!7758)

(declare-fun readerFrom!0 (BitStream!3626 (_ BitVec 32) (_ BitVec 32)) BitStream!3626)

(assert (=> b!97034 (= lt!140100 (readBitPure!0 (readerFrom!0 (_2!4128 lt!140134) (currentBit!4824 thiss!1288) (currentByte!4829 thiss!1288))))))

(declare-fun lt!140115 () Bool)

(declare-fun res!79626 () Bool)

(assert (=> b!97034 (= res!79626 (and (= (_2!4131 lt!140100) lt!140115) (= (_1!4131 lt!140100) (_2!4128 lt!140134))))))

(assert (=> b!97034 (=> (not res!79626) (not e!63600))))

(assert (=> b!97034 (= e!63606 e!63600)))

(declare-fun b!97035 () Bool)

(assert (=> b!97035 (= e!63603 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!388 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!97036 () Bool)

(declare-fun e!63608 () Bool)

(declare-fun lt!140116 () (_ BitVec 64))

(assert (=> b!97036 (= e!63608 (validate_offset_bits!1 ((_ sign_extend 32) (size!2076 (buf!2422 thiss!1288))) ((_ sign_extend 32) (currentByte!4829 thiss!1288)) ((_ sign_extend 32) (currentBit!4824 thiss!1288)) lt!140116))))

(declare-fun bm!1187 () Bool)

(assert (=> bm!1187 (= call!1189 (isPrefixOf!0 (ite c!6132 thiss!1288 lt!140147) (ite c!6132 (_2!4128 lt!140134) lt!140147)))))

(declare-datatypes ((tuple2!7762 0))(
  ( (tuple2!7763 (_1!4133 BitStream!3626) (_2!4133 BitStream!3626)) )
))
(declare-fun lt!140111 () tuple2!7762)

(declare-fun b!97037 () Bool)

(declare-datatypes ((tuple2!7764 0))(
  ( (tuple2!7765 (_1!4134 BitStream!3626) (_2!4134 (_ BitVec 64))) )
))
(declare-fun lt!140125 () tuple2!7764)

(assert (=> b!97037 (= e!63609 (and (= (_2!4134 lt!140125) v!196) (= (_1!4134 lt!140125) (_2!4133 lt!140111))))))

(declare-fun lt!140087 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!3626 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!7764)

(assert (=> b!97037 (= lt!140125 (readNLeastSignificantBitsLoopPure!0 (_1!4133 lt!140111) nBits!388 #b00000000000000000000000000000000 lt!140087))))

(declare-fun lt!140123 () Unit!5874)

(declare-fun lt!140142 () Unit!5874)

(assert (=> b!97037 (= lt!140123 lt!140142)))

(assert (=> b!97037 (validate_offset_bits!1 ((_ sign_extend 32) (size!2076 (buf!2422 (_2!4128 lt!140099)))) ((_ sign_extend 32) (currentByte!4829 thiss!1288)) ((_ sign_extend 32) (currentBit!4824 thiss!1288)) lt!140116)))

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!3626 array!4538 (_ BitVec 64)) Unit!5874)

(assert (=> b!97037 (= lt!140142 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1288 (buf!2422 (_2!4128 lt!140099)) lt!140116))))

(assert (=> b!97037 e!63608))

(declare-fun res!79625 () Bool)

(assert (=> b!97037 (=> (not res!79625) (not e!63608))))

(assert (=> b!97037 (= res!79625 (and (= (size!2076 (buf!2422 thiss!1288)) (size!2076 (buf!2422 (_2!4128 lt!140099)))) (bvsge lt!140116 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!97037 (= lt!140116 ((_ sign_extend 32) (bvsub nBits!388 #b00000000000000000000000000000000)))))

(assert (=> b!97037 (or (= (bvand nBits!388 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand nBits!388 #b10000000000000000000000000000000) (bvand (bvsub nBits!388 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(assert (=> b!97037 (= lt!140087 (bvand v!196 (bvnot (onesLSBLong!0 (bvsub nBits!388 #b00000000000000000000000000000000)))))))

(assert (=> b!97037 (or (= (bvand nBits!388 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand nBits!388 #b10000000000000000000000000000000) (bvand (bvsub nBits!388 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(declare-fun reader!0 (BitStream!3626 BitStream!3626) tuple2!7762)

(assert (=> b!97037 (= lt!140111 (reader!0 thiss!1288 (_2!4128 lt!140099)))))

(declare-fun b!97038 () Bool)

(declare-fun lt!140150 () tuple2!7752)

(declare-fun Unit!5878 () Unit!5874)

(assert (=> b!97038 (= e!63602 (tuple2!7753 Unit!5878 (_2!4128 lt!140150)))))

(assert (=> b!97038 (= lt!140115 (not (= (bvand v!196 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!388 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun appendBit!0 (BitStream!3626 Bool) tuple2!7752)

(assert (=> b!97038 (= lt!140134 (appendBit!0 thiss!1288 lt!140115))))

(declare-fun res!79627 () Bool)

(assert (=> b!97038 (= res!79627 (= (size!2076 (buf!2422 thiss!1288)) (size!2076 (buf!2422 (_2!4128 lt!140134)))))))

(assert (=> b!97038 (=> (not res!79627) (not e!63606))))

(assert (=> b!97038 e!63606))

(declare-fun lt!140132 () tuple2!7752)

(assert (=> b!97038 (= lt!140132 lt!140134)))

(assert (=> b!97038 (= lt!140150 (appendNLeastSignificantBitsLoop!0 (_2!4128 lt!140132) v!196 nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!140097 () Unit!5874)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3626 BitStream!3626 BitStream!3626) Unit!5874)

(assert (=> b!97038 (= lt!140097 (lemmaIsPrefixTransitive!0 thiss!1288 (_2!4128 lt!140132) (_2!4128 lt!140150)))))

(assert (=> b!97038 (isPrefixOf!0 thiss!1288 (_2!4128 lt!140150))))

(declare-fun lt!140133 () Unit!5874)

(assert (=> b!97038 (= lt!140133 lt!140097)))

(assert (=> b!97038 (invariant!0 (currentBit!4824 thiss!1288) (currentByte!4829 thiss!1288) (size!2076 (buf!2422 (_2!4128 lt!140132))))))

(declare-fun lt!140079 () BitStream!3626)

(assert (=> b!97038 (= lt!140079 (BitStream!3627 (buf!2422 (_2!4128 lt!140132)) (currentByte!4829 thiss!1288) (currentBit!4824 thiss!1288)))))

(assert (=> b!97038 (invariant!0 (currentBit!4824 lt!140079) (currentByte!4829 lt!140079) (size!2076 (buf!2422 (_2!4128 lt!140150))))))

(declare-fun lt!140120 () BitStream!3626)

(assert (=> b!97038 (= lt!140120 (BitStream!3627 (buf!2422 (_2!4128 lt!140150)) (currentByte!4829 lt!140079) (currentBit!4824 lt!140079)))))

(assert (=> b!97038 (= lt!140137 (readBitPure!0 lt!140079))))

(assert (=> b!97038 (= lt!140088 (readBitPure!0 lt!140120))))

(declare-fun lt!140156 () Unit!5874)

(declare-fun readBitPrefixLemma!0 (BitStream!3626 BitStream!3626) Unit!5874)

(assert (=> b!97038 (= lt!140156 (readBitPrefixLemma!0 lt!140079 (_2!4128 lt!140150)))))

(declare-fun res!79617 () Bool)

(assert (=> b!97038 (= res!79617 (= (bitIndex!0 (size!2076 (buf!2422 (_1!4131 lt!140137))) (currentByte!4829 (_1!4131 lt!140137)) (currentBit!4824 (_1!4131 lt!140137))) (bitIndex!0 (size!2076 (buf!2422 (_1!4131 lt!140088))) (currentByte!4829 (_1!4131 lt!140088)) (currentBit!4824 (_1!4131 lt!140088)))))))

(assert (=> b!97038 (=> (not res!79617) (not e!63599))))

(assert (=> b!97038 e!63599))

(declare-fun lt!140154 () Unit!5874)

(assert (=> b!97038 (= lt!140154 lt!140156)))

(declare-fun lt!140153 () tuple2!7762)

(assert (=> b!97038 (= lt!140153 (reader!0 thiss!1288 (_2!4128 lt!140150)))))

(declare-fun lt!140143 () tuple2!7762)

(assert (=> b!97038 (= lt!140143 (reader!0 (_2!4128 lt!140132) (_2!4128 lt!140150)))))

(declare-fun lt!140149 () tuple2!7758)

(assert (=> b!97038 (= lt!140149 (readBitPure!0 (_1!4133 lt!140153)))))

(assert (=> b!97038 (= (_2!4131 lt!140149) lt!140115)))

(declare-fun lt!140106 () Unit!5874)

(declare-fun Unit!5882 () Unit!5874)

(assert (=> b!97038 (= lt!140106 Unit!5882)))

(declare-fun lt!140104 () (_ BitVec 64))

(assert (=> b!97038 (= lt!140104 (bvand v!196 (bvnot (onesLSBLong!0 (bvsub nBits!388 #b00000000000000000000000000000000)))))))

(declare-fun lt!140084 () (_ BitVec 64))

(assert (=> b!97038 (= lt!140084 ((_ sign_extend 32) (bvsub nBits!388 #b00000000000000000000000000000000)))))

(declare-fun lt!140113 () Unit!5874)

(assert (=> b!97038 (= lt!140113 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1288 (buf!2422 (_2!4128 lt!140150)) lt!140084))))

(assert (=> b!97038 (validate_offset_bits!1 ((_ sign_extend 32) (size!2076 (buf!2422 (_2!4128 lt!140150)))) ((_ sign_extend 32) (currentByte!4829 thiss!1288)) ((_ sign_extend 32) (currentBit!4824 thiss!1288)) lt!140084)))

(declare-fun lt!140138 () Unit!5874)

(assert (=> b!97038 (= lt!140138 lt!140113)))

(declare-fun lt!140136 () tuple2!7764)

(assert (=> b!97038 (= lt!140136 (readNLeastSignificantBitsLoopPure!0 (_1!4133 lt!140153) nBits!388 #b00000000000000000000000000000000 lt!140104))))

(declare-fun lt!140081 () (_ BitVec 64))

(assert (=> b!97038 (= lt!140081 ((_ sign_extend 32) (bvsub (bvsub nBits!388 #b00000000000000000000000000000000) #b00000000000000000000000000000001)))))

(declare-fun lt!140127 () Unit!5874)

(assert (=> b!97038 (= lt!140127 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4128 lt!140132) (buf!2422 (_2!4128 lt!140150)) lt!140081))))

(assert (=> b!97038 (validate_offset_bits!1 ((_ sign_extend 32) (size!2076 (buf!2422 (_2!4128 lt!140150)))) ((_ sign_extend 32) (currentByte!4829 (_2!4128 lt!140132))) ((_ sign_extend 32) (currentBit!4824 (_2!4128 lt!140132))) lt!140081)))

(declare-fun lt!140140 () Unit!5874)

(assert (=> b!97038 (= lt!140140 lt!140127)))

(declare-fun lt!140095 () tuple2!7764)

(assert (=> b!97038 (= lt!140095 (readNLeastSignificantBitsLoopPure!0 (_1!4133 lt!140143) nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvor lt!140104 (ite (_2!4131 lt!140149) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!388 #b00000000000000000000000000000001) #b00000000000000000000000000000000))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!140141 () tuple2!7764)

(assert (=> b!97038 (= lt!140141 (readNLeastSignificantBitsLoopPure!0 (_1!4133 lt!140153) nBits!388 #b00000000000000000000000000000000 lt!140104))))

(declare-fun c!6131 () Bool)

(assert (=> b!97038 (= c!6131 (_2!4131 (readBitPure!0 (_1!4133 lt!140153))))))

(declare-fun lt!140108 () tuple2!7764)

(declare-fun withMovedBitIndex!0 (BitStream!3626 (_ BitVec 64)) BitStream!3626)

(assert (=> b!97038 (= lt!140108 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4133 lt!140153) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvor lt!140104 e!63603)))))

(declare-fun lt!140092 () Unit!5874)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!3626 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!5874)

(assert (=> b!97038 (= lt!140092 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4133 lt!140153) nBits!388 #b00000000000000000000000000000000 lt!140104))))

(assert (=> b!97038 (and (= (_2!4134 lt!140141) (_2!4134 lt!140108)) (= (_1!4134 lt!140141) (_1!4134 lt!140108)))))

(declare-fun lt!140151 () Unit!5874)

(assert (=> b!97038 (= lt!140151 lt!140092)))

(assert (=> b!97038 (= (_1!4133 lt!140153) (withMovedBitIndex!0 (_2!4133 lt!140153) (bvsub (bitIndex!0 (size!2076 (buf!2422 thiss!1288)) (currentByte!4829 thiss!1288) (currentBit!4824 thiss!1288)) (bitIndex!0 (size!2076 (buf!2422 (_2!4128 lt!140150))) (currentByte!4829 (_2!4128 lt!140150)) (currentBit!4824 (_2!4128 lt!140150))))))))

(declare-fun lt!140148 () Unit!5874)

(declare-fun Unit!5884 () Unit!5874)

(assert (=> b!97038 (= lt!140148 Unit!5884)))

(assert (=> b!97038 (= (_1!4133 lt!140143) (withMovedBitIndex!0 (_2!4133 lt!140143) (bvsub (bitIndex!0 (size!2076 (buf!2422 (_2!4128 lt!140132))) (currentByte!4829 (_2!4128 lt!140132)) (currentBit!4824 (_2!4128 lt!140132))) (bitIndex!0 (size!2076 (buf!2422 (_2!4128 lt!140150))) (currentByte!4829 (_2!4128 lt!140150)) (currentBit!4824 (_2!4128 lt!140150))))))))

(declare-fun lt!140152 () Unit!5874)

(declare-fun Unit!5885 () Unit!5874)

(assert (=> b!97038 (= lt!140152 Unit!5885)))

(assert (=> b!97038 (= (bitIndex!0 (size!2076 (buf!2422 thiss!1288)) (currentByte!4829 thiss!1288) (currentBit!4824 thiss!1288)) (bvsub (bitIndex!0 (size!2076 (buf!2422 (_2!4128 lt!140132))) (currentByte!4829 (_2!4128 lt!140132)) (currentBit!4824 (_2!4128 lt!140132))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!140155 () Unit!5874)

(declare-fun Unit!5886 () Unit!5874)

(assert (=> b!97038 (= lt!140155 Unit!5886)))

(assert (=> b!97038 (= (_2!4134 lt!140136) (_2!4134 lt!140095))))

(declare-fun lt!140129 () Unit!5874)

(declare-fun Unit!5887 () Unit!5874)

(assert (=> b!97038 (= lt!140129 Unit!5887)))

(assert (=> b!97038 (= (_1!4134 lt!140136) (_2!4133 lt!140153))))

(assert (= (and d!30434 c!6132) b!97038))

(assert (= (and d!30434 (not c!6132)) b!97029))

(assert (= (and b!97038 res!79627) b!97030))

(assert (= (and b!97030 res!79622) b!97028))

(assert (= (and b!97028 res!79613) b!97034))

(assert (= (and b!97034 res!79626) b!97032))

(assert (= (and b!97038 res!79617) b!97033))

(assert (= (and b!97038 c!6131) b!97035))

(assert (= (and b!97038 (not c!6131)) b!97026))

(assert (= (or b!97028 b!97029) bm!1187))

(assert (= (and d!30434 res!79611) b!97031))

(assert (= (and b!97031 res!79624) b!97027))

(assert (= (and b!97027 res!79621) b!97037))

(assert (= (and b!97037 res!79625) b!97036))

(declare-fun m!140601 () Bool)

(assert (=> b!97027 m!140601))

(declare-fun m!140605 () Bool)

(assert (=> b!97034 m!140605))

(assert (=> b!97034 m!140605))

(declare-fun m!140611 () Bool)

(assert (=> b!97034 m!140611))

(declare-fun m!140613 () Bool)

(assert (=> b!97030 m!140613))

(declare-fun m!140617 () Bool)

(assert (=> b!97030 m!140617))

(declare-fun m!140620 () Bool)

(assert (=> b!97029 m!140620))

(declare-fun m!140623 () Bool)

(assert (=> b!97037 m!140623))

(declare-fun m!140629 () Bool)

(assert (=> b!97037 m!140629))

(declare-fun m!140633 () Bool)

(assert (=> b!97037 m!140633))

(declare-fun m!140637 () Bool)

(assert (=> b!97037 m!140637))

(declare-fun m!140641 () Bool)

(assert (=> b!97037 m!140641))

(assert (=> b!97038 m!140623))

(declare-fun m!140647 () Bool)

(assert (=> b!97038 m!140647))

(declare-fun m!140651 () Bool)

(assert (=> b!97038 m!140651))

(declare-fun m!140654 () Bool)

(assert (=> b!97038 m!140654))

(declare-fun m!140657 () Bool)

(assert (=> b!97038 m!140657))

(declare-fun m!140659 () Bool)

(assert (=> b!97038 m!140659))

(declare-fun m!140663 () Bool)

(assert (=> b!97038 m!140663))

(declare-fun m!140667 () Bool)

(assert (=> b!97038 m!140667))

(declare-fun m!140669 () Bool)

(assert (=> b!97038 m!140669))

(declare-fun m!140671 () Bool)

(assert (=> b!97038 m!140671))

(declare-fun m!140673 () Bool)

(assert (=> b!97038 m!140673))

(declare-fun m!140675 () Bool)

(assert (=> b!97038 m!140675))

(declare-fun m!140679 () Bool)

(assert (=> b!97038 m!140679))

(declare-fun m!140683 () Bool)

(assert (=> b!97038 m!140683))

(assert (=> b!97038 m!140617))

(declare-fun m!140693 () Bool)

(assert (=> b!97038 m!140693))

(declare-fun m!140699 () Bool)

(assert (=> b!97038 m!140699))

(declare-fun m!140703 () Bool)

(assert (=> b!97038 m!140703))

(declare-fun m!140705 () Bool)

(assert (=> b!97038 m!140705))

(declare-fun m!140707 () Bool)

(assert (=> b!97038 m!140707))

(declare-fun m!140715 () Bool)

(assert (=> b!97038 m!140715))

(assert (=> b!97038 m!140654))

(declare-fun m!140719 () Bool)

(assert (=> b!97038 m!140719))

(declare-fun m!140723 () Bool)

(assert (=> b!97038 m!140723))

(declare-fun m!140727 () Bool)

(assert (=> b!97038 m!140727))

(declare-fun m!140731 () Bool)

(assert (=> b!97038 m!140731))

(declare-fun m!140735 () Bool)

(assert (=> b!97038 m!140735))

(declare-fun m!140739 () Bool)

(assert (=> b!97038 m!140739))

(declare-fun m!140743 () Bool)

(assert (=> b!97038 m!140743))

(declare-fun m!140747 () Bool)

(assert (=> b!97038 m!140747))

(declare-fun m!140751 () Bool)

(assert (=> b!97031 m!140751))

(assert (=> b!97031 m!140617))

(declare-fun m!140759 () Bool)

(assert (=> b!97036 m!140759))

(declare-fun m!140763 () Bool)

(assert (=> bm!1187 m!140763))

(declare-fun m!140767 () Bool)

(assert (=> b!97032 m!140767))

(assert (=> b!97032 m!140613))

(assert (=> b!96956 d!30434))

(declare-fun d!30448 () Bool)

(assert (=> d!30448 (= (onesLSBLong!0 nBits!388) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!388))))))

(assert (=> b!96957 d!30448))

(push 1)

(assert (not b!97031))

(assert (not b!97030))

(assert (not d!30428))

(assert (not b!97034))

(assert (not b!97027))

(assert (not b!97036))

(assert (not bm!1187))

(assert (not b!97032))

(assert (not b!97037))

(assert (not b!97038))

(assert (not d!30420))

(assert (not b!97029))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!30510 () Bool)

(assert (=> d!30510 (= (remainingBits!0 ((_ sign_extend 32) (size!2076 (buf!2422 thiss!1288))) ((_ sign_extend 32) (currentByte!4829 thiss!1288)) ((_ sign_extend 32) (currentBit!4824 thiss!1288))) (bvsub (bvmul ((_ sign_extend 32) (size!2076 (buf!2422 thiss!1288))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4829 thiss!1288)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4824 thiss!1288)))))))

(assert (=> d!30428 d!30510))

(declare-fun d!30512 () Bool)

(assert (=> d!30512 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2076 (buf!2422 thiss!1288))) ((_ sign_extend 32) (currentByte!4829 thiss!1288)) ((_ sign_extend 32) (currentBit!4824 thiss!1288)) lt!140116) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2076 (buf!2422 thiss!1288))) ((_ sign_extend 32) (currentByte!4829 thiss!1288)) ((_ sign_extend 32) (currentBit!4824 thiss!1288))) lt!140116))))

(declare-fun bs!7461 () Bool)

(assert (= bs!7461 d!30512))

(assert (=> bs!7461 m!140595))

(assert (=> b!97036 d!30512))

(declare-fun d!30514 () Bool)

(declare-datatypes ((tuple2!7776 0))(
  ( (tuple2!7777 (_1!4140 Bool) (_2!4140 BitStream!3626)) )
))
(declare-fun lt!140466 () tuple2!7776)

(declare-fun readBit!0 (BitStream!3626) tuple2!7776)

(assert (=> d!30514 (= lt!140466 (readBit!0 (readerFrom!0 (_2!4128 lt!140134) (currentBit!4824 thiss!1288) (currentByte!4829 thiss!1288))))))

(assert (=> d!30514 (= (readBitPure!0 (readerFrom!0 (_2!4128 lt!140134) (currentBit!4824 thiss!1288) (currentByte!4829 thiss!1288))) (tuple2!7759 (_2!4140 lt!140466) (_1!4140 lt!140466)))))

(declare-fun bs!7463 () Bool)

(assert (= bs!7463 d!30514))

(assert (=> bs!7463 m!140605))

(declare-fun m!140981 () Bool)

(assert (=> bs!7463 m!140981))

(assert (=> b!97034 d!30514))

(declare-fun d!30520 () Bool)

(declare-fun e!63678 () Bool)

(assert (=> d!30520 e!63678))

(declare-fun res!79727 () Bool)

(assert (=> d!30520 (=> (not res!79727) (not e!63678))))

(assert (=> d!30520 (= res!79727 (invariant!0 (currentBit!4824 (_2!4128 lt!140134)) (currentByte!4829 (_2!4128 lt!140134)) (size!2076 (buf!2422 (_2!4128 lt!140134)))))))

(assert (=> d!30520 (= (readerFrom!0 (_2!4128 lt!140134) (currentBit!4824 thiss!1288) (currentByte!4829 thiss!1288)) (BitStream!3627 (buf!2422 (_2!4128 lt!140134)) (currentByte!4829 thiss!1288) (currentBit!4824 thiss!1288)))))

(declare-fun b!97159 () Bool)

(assert (=> b!97159 (= e!63678 (invariant!0 (currentBit!4824 thiss!1288) (currentByte!4829 thiss!1288) (size!2076 (buf!2422 (_2!4128 lt!140134)))))))

(assert (= (and d!30520 res!79727) b!97159))

(declare-fun m!140983 () Bool)

(assert (=> d!30520 m!140983))

(declare-fun m!140985 () Bool)

(assert (=> b!97159 m!140985))

(assert (=> b!97034 d!30520))

(declare-datatypes ((tuple2!7778 0))(
  ( (tuple2!7779 (_1!4141 (_ BitVec 64)) (_2!4141 BitStream!3626)) )
))
(declare-fun lt!140514 () tuple2!7778)

(declare-fun d!30524 () Bool)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!3626 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!7778)

(assert (=> d!30524 (= lt!140514 (readNLeastSignificantBitsLoop!0 (_1!4133 lt!140111) nBits!388 #b00000000000000000000000000000000 lt!140087))))

(assert (=> d!30524 (= (readNLeastSignificantBitsLoopPure!0 (_1!4133 lt!140111) nBits!388 #b00000000000000000000000000000000 lt!140087) (tuple2!7765 (_2!4141 lt!140514) (_1!4141 lt!140514)))))

(declare-fun bs!7464 () Bool)

(assert (= bs!7464 d!30524))

(declare-fun m!141069 () Bool)

(assert (=> bs!7464 m!141069))

(assert (=> b!97037 d!30524))

(declare-fun d!30528 () Bool)

(assert (=> d!30528 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2076 (buf!2422 (_2!4128 lt!140099)))) ((_ sign_extend 32) (currentByte!4829 thiss!1288)) ((_ sign_extend 32) (currentBit!4824 thiss!1288)) lt!140116) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2076 (buf!2422 (_2!4128 lt!140099)))) ((_ sign_extend 32) (currentByte!4829 thiss!1288)) ((_ sign_extend 32) (currentBit!4824 thiss!1288))) lt!140116))))

(declare-fun bs!7465 () Bool)

(assert (= bs!7465 d!30528))

(declare-fun m!141071 () Bool)

(assert (=> bs!7465 m!141071))

(assert (=> b!97037 d!30528))

(declare-fun d!30530 () Bool)

(assert (=> d!30530 (validate_offset_bits!1 ((_ sign_extend 32) (size!2076 (buf!2422 (_2!4128 lt!140099)))) ((_ sign_extend 32) (currentByte!4829 thiss!1288)) ((_ sign_extend 32) (currentBit!4824 thiss!1288)) lt!140116)))

(declare-fun lt!140545 () Unit!5874)

(declare-fun choose!9 (BitStream!3626 array!4538 (_ BitVec 64) BitStream!3626) Unit!5874)

(assert (=> d!30530 (= lt!140545 (choose!9 thiss!1288 (buf!2422 (_2!4128 lt!140099)) lt!140116 (BitStream!3627 (buf!2422 (_2!4128 lt!140099)) (currentByte!4829 thiss!1288) (currentBit!4824 thiss!1288))))))

(assert (=> d!30530 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1288 (buf!2422 (_2!4128 lt!140099)) lt!140116) lt!140545)))

(declare-fun bs!7466 () Bool)

(assert (= bs!7466 d!30530))

(assert (=> bs!7466 m!140629))

(declare-fun m!141111 () Bool)

(assert (=> bs!7466 m!141111))

(assert (=> b!97037 d!30530))

(declare-fun b!97188 () Bool)

(declare-fun lt!140639 () (_ BitVec 64))

(declare-fun e!63693 () Bool)

(declare-fun lt!140638 () tuple2!7762)

(declare-fun lt!140634 () (_ BitVec 64))

(assert (=> b!97188 (= e!63693 (= (_1!4133 lt!140638) (withMovedBitIndex!0 (_2!4133 lt!140638) (bvsub lt!140639 lt!140634))))))

(assert (=> b!97188 (or (= (bvand lt!140639 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!140634 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!140639 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!140639 lt!140634) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!97188 (= lt!140634 (bitIndex!0 (size!2076 (buf!2422 (_2!4128 lt!140099))) (currentByte!4829 (_2!4128 lt!140099)) (currentBit!4824 (_2!4128 lt!140099))))))

(assert (=> b!97188 (= lt!140639 (bitIndex!0 (size!2076 (buf!2422 thiss!1288)) (currentByte!4829 thiss!1288) (currentBit!4824 thiss!1288)))))

(declare-fun d!30538 () Bool)

(assert (=> d!30538 e!63693))

(declare-fun res!79748 () Bool)

(assert (=> d!30538 (=> (not res!79748) (not e!63693))))

(assert (=> d!30538 (= res!79748 (isPrefixOf!0 (_1!4133 lt!140638) (_2!4133 lt!140638)))))

(declare-fun lt!140630 () BitStream!3626)

(assert (=> d!30538 (= lt!140638 (tuple2!7763 lt!140630 (_2!4128 lt!140099)))))

(declare-fun lt!140633 () Unit!5874)

(declare-fun lt!140640 () Unit!5874)

(assert (=> d!30538 (= lt!140633 lt!140640)))

(assert (=> d!30538 (isPrefixOf!0 lt!140630 (_2!4128 lt!140099))))

(assert (=> d!30538 (= lt!140640 (lemmaIsPrefixTransitive!0 lt!140630 (_2!4128 lt!140099) (_2!4128 lt!140099)))))

(declare-fun lt!140627 () Unit!5874)

(declare-fun lt!140621 () Unit!5874)

(assert (=> d!30538 (= lt!140627 lt!140621)))

(assert (=> d!30538 (isPrefixOf!0 lt!140630 (_2!4128 lt!140099))))

(assert (=> d!30538 (= lt!140621 (lemmaIsPrefixTransitive!0 lt!140630 thiss!1288 (_2!4128 lt!140099)))))

(declare-fun lt!140626 () Unit!5874)

(declare-fun e!63692 () Unit!5874)

(assert (=> d!30538 (= lt!140626 e!63692)))

(declare-fun c!6148 () Bool)

(assert (=> d!30538 (= c!6148 (not (= (size!2076 (buf!2422 thiss!1288)) #b00000000000000000000000000000000)))))

(declare-fun lt!140628 () Unit!5874)

(declare-fun lt!140625 () Unit!5874)

(assert (=> d!30538 (= lt!140628 lt!140625)))

(assert (=> d!30538 (isPrefixOf!0 (_2!4128 lt!140099) (_2!4128 lt!140099))))

(assert (=> d!30538 (= lt!140625 (lemmaIsPrefixRefl!0 (_2!4128 lt!140099)))))

(declare-fun lt!140636 () Unit!5874)

(declare-fun lt!140635 () Unit!5874)

(assert (=> d!30538 (= lt!140636 lt!140635)))

(assert (=> d!30538 (= lt!140635 (lemmaIsPrefixRefl!0 (_2!4128 lt!140099)))))

(declare-fun lt!140637 () Unit!5874)

(declare-fun lt!140631 () Unit!5874)

(assert (=> d!30538 (= lt!140637 lt!140631)))

(assert (=> d!30538 (isPrefixOf!0 lt!140630 lt!140630)))

(assert (=> d!30538 (= lt!140631 (lemmaIsPrefixRefl!0 lt!140630))))

(declare-fun lt!140622 () Unit!5874)

(declare-fun lt!140623 () Unit!5874)

(assert (=> d!30538 (= lt!140622 lt!140623)))

(assert (=> d!30538 (isPrefixOf!0 thiss!1288 thiss!1288)))

(assert (=> d!30538 (= lt!140623 (lemmaIsPrefixRefl!0 thiss!1288))))

(assert (=> d!30538 (= lt!140630 (BitStream!3627 (buf!2422 (_2!4128 lt!140099)) (currentByte!4829 thiss!1288) (currentBit!4824 thiss!1288)))))

(assert (=> d!30538 (isPrefixOf!0 thiss!1288 (_2!4128 lt!140099))))

(assert (=> d!30538 (= (reader!0 thiss!1288 (_2!4128 lt!140099)) lt!140638)))

(declare-fun b!97189 () Bool)

(declare-fun lt!140629 () Unit!5874)

(assert (=> b!97189 (= e!63692 lt!140629)))

(declare-fun lt!140632 () (_ BitVec 64))

(assert (=> b!97189 (= lt!140632 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!140624 () (_ BitVec 64))

(assert (=> b!97189 (= lt!140624 (bitIndex!0 (size!2076 (buf!2422 thiss!1288)) (currentByte!4829 thiss!1288) (currentBit!4824 thiss!1288)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!4538 array!4538 (_ BitVec 64) (_ BitVec 64)) Unit!5874)

(assert (=> b!97189 (= lt!140629 (arrayBitRangesEqSymmetric!0 (buf!2422 thiss!1288) (buf!2422 (_2!4128 lt!140099)) lt!140632 lt!140624))))

(declare-fun arrayBitRangesEq!0 (array!4538 array!4538 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!97189 (arrayBitRangesEq!0 (buf!2422 (_2!4128 lt!140099)) (buf!2422 thiss!1288) lt!140632 lt!140624)))

(declare-fun b!97190 () Bool)

(declare-fun res!79749 () Bool)

(assert (=> b!97190 (=> (not res!79749) (not e!63693))))

(assert (=> b!97190 (= res!79749 (isPrefixOf!0 (_2!4133 lt!140638) (_2!4128 lt!140099)))))

(declare-fun b!97191 () Bool)

(declare-fun res!79750 () Bool)

(assert (=> b!97191 (=> (not res!79750) (not e!63693))))

(assert (=> b!97191 (= res!79750 (isPrefixOf!0 (_1!4133 lt!140638) thiss!1288))))

(declare-fun b!97192 () Bool)

(declare-fun Unit!5901 () Unit!5874)

(assert (=> b!97192 (= e!63692 Unit!5901)))

(assert (= (and d!30538 c!6148) b!97189))

(assert (= (and d!30538 (not c!6148)) b!97192))

(assert (= (and d!30538 res!79748) b!97191))

(assert (= (and b!97191 res!79750) b!97190))

(assert (= (and b!97190 res!79749) b!97188))

(declare-fun m!141159 () Bool)

(assert (=> b!97191 m!141159))

(declare-fun m!141161 () Bool)

(assert (=> b!97188 m!141161))

(assert (=> b!97188 m!140751))

(assert (=> b!97188 m!140617))

(assert (=> b!97189 m!140617))

(declare-fun m!141163 () Bool)

(assert (=> b!97189 m!141163))

(declare-fun m!141165 () Bool)

(assert (=> b!97189 m!141165))

(declare-fun m!141167 () Bool)

(assert (=> d!30538 m!141167))

(declare-fun m!141169 () Bool)

(assert (=> d!30538 m!141169))

(declare-fun m!141171 () Bool)

(assert (=> d!30538 m!141171))

(declare-fun m!141173 () Bool)

(assert (=> d!30538 m!141173))

(assert (=> d!30538 m!140601))

(declare-fun m!141175 () Bool)

(assert (=> d!30538 m!141175))

(declare-fun m!141177 () Bool)

(assert (=> d!30538 m!141177))

(declare-fun m!141179 () Bool)

(assert (=> d!30538 m!141179))

(declare-fun m!141181 () Bool)

(assert (=> d!30538 m!141181))

(declare-fun m!141183 () Bool)

(assert (=> d!30538 m!141183))

(declare-fun m!141185 () Bool)

(assert (=> d!30538 m!141185))

(declare-fun m!141187 () Bool)

(assert (=> b!97190 m!141187))

(assert (=> b!97037 d!30538))

(declare-fun d!30554 () Bool)

(assert (=> d!30554 (= (onesLSBLong!0 (bvsub nBits!388 #b00000000000000000000000000000000)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!388 #b00000000000000000000000000000000)))))))

(assert (=> b!97037 d!30554))

(declare-fun d!30556 () Bool)

(declare-fun lt!140641 () tuple2!7776)

(assert (=> d!30556 (= lt!140641 (readBit!0 lt!140079))))

(assert (=> d!30556 (= (readBitPure!0 lt!140079) (tuple2!7759 (_2!4140 lt!140641) (_1!4140 lt!140641)))))

(declare-fun bs!7469 () Bool)

(assert (= bs!7469 d!30556))

(declare-fun m!141189 () Bool)

(assert (=> bs!7469 m!141189))

(assert (=> b!97038 d!30556))

(declare-fun d!30558 () Bool)

(declare-fun e!63696 () Bool)

(assert (=> d!30558 e!63696))

(declare-fun res!79756 () Bool)

(assert (=> d!30558 (=> (not res!79756) (not e!63696))))

(declare-fun lt!140659 () (_ BitVec 64))

(declare-fun lt!140656 () (_ BitVec 64))

(declare-fun lt!140655 () (_ BitVec 64))

(assert (=> d!30558 (= res!79756 (= lt!140659 (bvsub lt!140655 lt!140656)))))

(assert (=> d!30558 (or (= (bvand lt!140655 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!140656 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!140655 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!140655 lt!140656) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!30558 (= lt!140656 (remainingBits!0 ((_ sign_extend 32) (size!2076 (buf!2422 (_2!4128 lt!140150)))) ((_ sign_extend 32) (currentByte!4829 (_2!4128 lt!140150))) ((_ sign_extend 32) (currentBit!4824 (_2!4128 lt!140150)))))))

(declare-fun lt!140658 () (_ BitVec 64))

(declare-fun lt!140654 () (_ BitVec 64))

(assert (=> d!30558 (= lt!140655 (bvmul lt!140658 lt!140654))))

(assert (=> d!30558 (or (= lt!140658 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!140654 (bvsdiv (bvmul lt!140658 lt!140654) lt!140658)))))

(assert (=> d!30558 (= lt!140654 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!30558 (= lt!140658 ((_ sign_extend 32) (size!2076 (buf!2422 (_2!4128 lt!140150)))))))

(assert (=> d!30558 (= lt!140659 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4829 (_2!4128 lt!140150))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4824 (_2!4128 lt!140150)))))))

(assert (=> d!30558 (invariant!0 (currentBit!4824 (_2!4128 lt!140150)) (currentByte!4829 (_2!4128 lt!140150)) (size!2076 (buf!2422 (_2!4128 lt!140150))))))

(assert (=> d!30558 (= (bitIndex!0 (size!2076 (buf!2422 (_2!4128 lt!140150))) (currentByte!4829 (_2!4128 lt!140150)) (currentBit!4824 (_2!4128 lt!140150))) lt!140659)))

(declare-fun b!97197 () Bool)

(declare-fun res!79755 () Bool)

(assert (=> b!97197 (=> (not res!79755) (not e!63696))))

(assert (=> b!97197 (= res!79755 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!140659))))

(declare-fun b!97198 () Bool)

(declare-fun lt!140657 () (_ BitVec 64))

(assert (=> b!97198 (= e!63696 (bvsle lt!140659 (bvmul lt!140657 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!97198 (or (= lt!140657 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!140657 #b0000000000000000000000000000000000000000000000000000000000001000) lt!140657)))))

(assert (=> b!97198 (= lt!140657 ((_ sign_extend 32) (size!2076 (buf!2422 (_2!4128 lt!140150)))))))

(assert (= (and d!30558 res!79756) b!97197))

(assert (= (and b!97197 res!79755) b!97198))

(declare-fun m!141191 () Bool)

(assert (=> d!30558 m!141191))

(declare-fun m!141193 () Bool)

(assert (=> d!30558 m!141193))

(assert (=> b!97038 d!30558))

(declare-fun b!97199 () Bool)

(declare-fun e!63698 () Bool)

(declare-fun lt!140678 () (_ BitVec 64))

(declare-fun lt!140673 () (_ BitVec 64))

(declare-fun lt!140677 () tuple2!7762)

(assert (=> b!97199 (= e!63698 (= (_1!4133 lt!140677) (withMovedBitIndex!0 (_2!4133 lt!140677) (bvsub lt!140678 lt!140673))))))

(assert (=> b!97199 (or (= (bvand lt!140678 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!140673 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!140678 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!140678 lt!140673) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!97199 (= lt!140673 (bitIndex!0 (size!2076 (buf!2422 (_2!4128 lt!140150))) (currentByte!4829 (_2!4128 lt!140150)) (currentBit!4824 (_2!4128 lt!140150))))))

(assert (=> b!97199 (= lt!140678 (bitIndex!0 (size!2076 (buf!2422 thiss!1288)) (currentByte!4829 thiss!1288) (currentBit!4824 thiss!1288)))))

(declare-fun d!30560 () Bool)

(assert (=> d!30560 e!63698))

(declare-fun res!79757 () Bool)

(assert (=> d!30560 (=> (not res!79757) (not e!63698))))

(assert (=> d!30560 (= res!79757 (isPrefixOf!0 (_1!4133 lt!140677) (_2!4133 lt!140677)))))

(declare-fun lt!140669 () BitStream!3626)

(assert (=> d!30560 (= lt!140677 (tuple2!7763 lt!140669 (_2!4128 lt!140150)))))

(declare-fun lt!140672 () Unit!5874)

(declare-fun lt!140679 () Unit!5874)

(assert (=> d!30560 (= lt!140672 lt!140679)))

(assert (=> d!30560 (isPrefixOf!0 lt!140669 (_2!4128 lt!140150))))

(assert (=> d!30560 (= lt!140679 (lemmaIsPrefixTransitive!0 lt!140669 (_2!4128 lt!140150) (_2!4128 lt!140150)))))

(declare-fun lt!140666 () Unit!5874)

(declare-fun lt!140660 () Unit!5874)

(assert (=> d!30560 (= lt!140666 lt!140660)))

(assert (=> d!30560 (isPrefixOf!0 lt!140669 (_2!4128 lt!140150))))

(assert (=> d!30560 (= lt!140660 (lemmaIsPrefixTransitive!0 lt!140669 thiss!1288 (_2!4128 lt!140150)))))

(declare-fun lt!140665 () Unit!5874)

(declare-fun e!63697 () Unit!5874)

(assert (=> d!30560 (= lt!140665 e!63697)))

(declare-fun c!6149 () Bool)

(assert (=> d!30560 (= c!6149 (not (= (size!2076 (buf!2422 thiss!1288)) #b00000000000000000000000000000000)))))

(declare-fun lt!140667 () Unit!5874)

(declare-fun lt!140664 () Unit!5874)

(assert (=> d!30560 (= lt!140667 lt!140664)))

(assert (=> d!30560 (isPrefixOf!0 (_2!4128 lt!140150) (_2!4128 lt!140150))))

(assert (=> d!30560 (= lt!140664 (lemmaIsPrefixRefl!0 (_2!4128 lt!140150)))))

(declare-fun lt!140675 () Unit!5874)

(declare-fun lt!140674 () Unit!5874)

(assert (=> d!30560 (= lt!140675 lt!140674)))

(assert (=> d!30560 (= lt!140674 (lemmaIsPrefixRefl!0 (_2!4128 lt!140150)))))

(declare-fun lt!140676 () Unit!5874)

(declare-fun lt!140670 () Unit!5874)

(assert (=> d!30560 (= lt!140676 lt!140670)))

(assert (=> d!30560 (isPrefixOf!0 lt!140669 lt!140669)))

(assert (=> d!30560 (= lt!140670 (lemmaIsPrefixRefl!0 lt!140669))))

(declare-fun lt!140661 () Unit!5874)

(declare-fun lt!140662 () Unit!5874)

(assert (=> d!30560 (= lt!140661 lt!140662)))

(assert (=> d!30560 (isPrefixOf!0 thiss!1288 thiss!1288)))

(assert (=> d!30560 (= lt!140662 (lemmaIsPrefixRefl!0 thiss!1288))))

(assert (=> d!30560 (= lt!140669 (BitStream!3627 (buf!2422 (_2!4128 lt!140150)) (currentByte!4829 thiss!1288) (currentBit!4824 thiss!1288)))))

(assert (=> d!30560 (isPrefixOf!0 thiss!1288 (_2!4128 lt!140150))))

(assert (=> d!30560 (= (reader!0 thiss!1288 (_2!4128 lt!140150)) lt!140677)))

(declare-fun b!97200 () Bool)

(declare-fun lt!140668 () Unit!5874)

(assert (=> b!97200 (= e!63697 lt!140668)))

(declare-fun lt!140671 () (_ BitVec 64))

(assert (=> b!97200 (= lt!140671 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!140663 () (_ BitVec 64))

(assert (=> b!97200 (= lt!140663 (bitIndex!0 (size!2076 (buf!2422 thiss!1288)) (currentByte!4829 thiss!1288) (currentBit!4824 thiss!1288)))))

(assert (=> b!97200 (= lt!140668 (arrayBitRangesEqSymmetric!0 (buf!2422 thiss!1288) (buf!2422 (_2!4128 lt!140150)) lt!140671 lt!140663))))

(assert (=> b!97200 (arrayBitRangesEq!0 (buf!2422 (_2!4128 lt!140150)) (buf!2422 thiss!1288) lt!140671 lt!140663)))

(declare-fun b!97201 () Bool)

(declare-fun res!79758 () Bool)

(assert (=> b!97201 (=> (not res!79758) (not e!63698))))

(assert (=> b!97201 (= res!79758 (isPrefixOf!0 (_2!4133 lt!140677) (_2!4128 lt!140150)))))

(declare-fun b!97202 () Bool)

(declare-fun res!79759 () Bool)

(assert (=> b!97202 (=> (not res!79759) (not e!63698))))

(assert (=> b!97202 (= res!79759 (isPrefixOf!0 (_1!4133 lt!140677) thiss!1288))))

(declare-fun b!97203 () Bool)

(declare-fun Unit!5903 () Unit!5874)

(assert (=> b!97203 (= e!63697 Unit!5903)))

(assert (= (and d!30560 c!6149) b!97200))

(assert (= (and d!30560 (not c!6149)) b!97203))

(assert (= (and d!30560 res!79757) b!97202))

(assert (= (and b!97202 res!79759) b!97201))

(assert (= (and b!97201 res!79758) b!97199))

(declare-fun m!141195 () Bool)

(assert (=> b!97202 m!141195))

(declare-fun m!141197 () Bool)

(assert (=> b!97199 m!141197))

(assert (=> b!97199 m!140743))

(assert (=> b!97199 m!140617))

(assert (=> b!97200 m!140617))

(declare-fun m!141199 () Bool)

(assert (=> b!97200 m!141199))

(declare-fun m!141201 () Bool)

(assert (=> b!97200 m!141201))

(assert (=> d!30560 m!141167))

(declare-fun m!141203 () Bool)

(assert (=> d!30560 m!141203))

(assert (=> d!30560 m!141171))

(declare-fun m!141205 () Bool)

(assert (=> d!30560 m!141205))

(assert (=> d!30560 m!140705))

(declare-fun m!141207 () Bool)

(assert (=> d!30560 m!141207))

(declare-fun m!141209 () Bool)

(assert (=> d!30560 m!141209))

(declare-fun m!141211 () Bool)

(assert (=> d!30560 m!141211))

(declare-fun m!141213 () Bool)

(assert (=> d!30560 m!141213))

(declare-fun m!141215 () Bool)

(assert (=> d!30560 m!141215))

(declare-fun m!141217 () Bool)

(assert (=> d!30560 m!141217))

(declare-fun m!141219 () Bool)

(assert (=> b!97201 m!141219))

(assert (=> b!97038 d!30560))

(declare-fun d!30562 () Bool)

(assert (=> d!30562 (validate_offset_bits!1 ((_ sign_extend 32) (size!2076 (buf!2422 (_2!4128 lt!140150)))) ((_ sign_extend 32) (currentByte!4829 thiss!1288)) ((_ sign_extend 32) (currentBit!4824 thiss!1288)) lt!140084)))

(declare-fun lt!140680 () Unit!5874)

(assert (=> d!30562 (= lt!140680 (choose!9 thiss!1288 (buf!2422 (_2!4128 lt!140150)) lt!140084 (BitStream!3627 (buf!2422 (_2!4128 lt!140150)) (currentByte!4829 thiss!1288) (currentBit!4824 thiss!1288))))))

(assert (=> d!30562 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1288 (buf!2422 (_2!4128 lt!140150)) lt!140084) lt!140680)))

(declare-fun bs!7470 () Bool)

(assert (= bs!7470 d!30562))

(assert (=> bs!7470 m!140727))

(declare-fun m!141221 () Bool)

(assert (=> bs!7470 m!141221))

(assert (=> b!97038 d!30562))

(declare-fun d!30564 () Bool)

(declare-fun e!63699 () Bool)

(assert (=> d!30564 e!63699))

(declare-fun res!79761 () Bool)

(assert (=> d!30564 (=> (not res!79761) (not e!63699))))

(declare-fun lt!140683 () (_ BitVec 64))

(declare-fun lt!140682 () (_ BitVec 64))

(declare-fun lt!140686 () (_ BitVec 64))

(assert (=> d!30564 (= res!79761 (= lt!140686 (bvsub lt!140682 lt!140683)))))

(assert (=> d!30564 (or (= (bvand lt!140682 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!140683 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!140682 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!140682 lt!140683) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!30564 (= lt!140683 (remainingBits!0 ((_ sign_extend 32) (size!2076 (buf!2422 thiss!1288))) ((_ sign_extend 32) (currentByte!4829 thiss!1288)) ((_ sign_extend 32) (currentBit!4824 thiss!1288))))))

(declare-fun lt!140685 () (_ BitVec 64))

(declare-fun lt!140681 () (_ BitVec 64))

(assert (=> d!30564 (= lt!140682 (bvmul lt!140685 lt!140681))))

(assert (=> d!30564 (or (= lt!140685 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!140681 (bvsdiv (bvmul lt!140685 lt!140681) lt!140685)))))

(assert (=> d!30564 (= lt!140681 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!30564 (= lt!140685 ((_ sign_extend 32) (size!2076 (buf!2422 thiss!1288))))))

(assert (=> d!30564 (= lt!140686 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4829 thiss!1288)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4824 thiss!1288))))))

(assert (=> d!30564 (invariant!0 (currentBit!4824 thiss!1288) (currentByte!4829 thiss!1288) (size!2076 (buf!2422 thiss!1288)))))

(assert (=> d!30564 (= (bitIndex!0 (size!2076 (buf!2422 thiss!1288)) (currentByte!4829 thiss!1288) (currentBit!4824 thiss!1288)) lt!140686)))

(declare-fun b!97204 () Bool)

(declare-fun res!79760 () Bool)

(assert (=> b!97204 (=> (not res!79760) (not e!63699))))

(assert (=> b!97204 (= res!79760 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!140686))))

(declare-fun b!97205 () Bool)

(declare-fun lt!140684 () (_ BitVec 64))

(assert (=> b!97205 (= e!63699 (bvsle lt!140686 (bvmul lt!140684 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!97205 (or (= lt!140684 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!140684 #b0000000000000000000000000000000000000000000000000000000000001000) lt!140684)))))

(assert (=> b!97205 (= lt!140684 ((_ sign_extend 32) (size!2076 (buf!2422 thiss!1288))))))

(assert (= (and d!30564 res!79761) b!97204))

(assert (= (and b!97204 res!79760) b!97205))

(assert (=> d!30564 m!140595))

(assert (=> d!30564 m!140591))

(assert (=> b!97038 d!30564))

(declare-fun d!30566 () Bool)

(assert (=> d!30566 (isPrefixOf!0 thiss!1288 (_2!4128 lt!140150))))

(declare-fun lt!140689 () Unit!5874)

(declare-fun choose!30 (BitStream!3626 BitStream!3626 BitStream!3626) Unit!5874)

(assert (=> d!30566 (= lt!140689 (choose!30 thiss!1288 (_2!4128 lt!140132) (_2!4128 lt!140150)))))

(assert (=> d!30566 (isPrefixOf!0 thiss!1288 (_2!4128 lt!140132))))

(assert (=> d!30566 (= (lemmaIsPrefixTransitive!0 thiss!1288 (_2!4128 lt!140132) (_2!4128 lt!140150)) lt!140689)))

(declare-fun bs!7471 () Bool)

(assert (= bs!7471 d!30566))

(assert (=> bs!7471 m!140705))

(declare-fun m!141223 () Bool)

(assert (=> bs!7471 m!141223))

(declare-fun m!141225 () Bool)

(assert (=> bs!7471 m!141225))

(assert (=> b!97038 d!30566))

(declare-fun lt!140690 () tuple2!7778)

(declare-fun d!30568 () Bool)

(assert (=> d!30568 (= lt!140690 (readNLeastSignificantBitsLoop!0 (withMovedBitIndex!0 (_1!4133 lt!140153) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvor lt!140104 e!63603)))))

(assert (=> d!30568 (= (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4133 lt!140153) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvor lt!140104 e!63603)) (tuple2!7765 (_2!4141 lt!140690) (_1!4141 lt!140690)))))

(declare-fun bs!7472 () Bool)

(assert (= bs!7472 d!30568))

(assert (=> bs!7472 m!140654))

(declare-fun m!141227 () Bool)

(assert (=> bs!7472 m!141227))

(assert (=> b!97038 d!30568))

(declare-fun d!30570 () Bool)

(declare-fun e!63700 () Bool)

(assert (=> d!30570 e!63700))

(declare-fun res!79763 () Bool)

(assert (=> d!30570 (=> (not res!79763) (not e!63700))))

(declare-fun lt!140696 () (_ BitVec 64))

(declare-fun lt!140693 () (_ BitVec 64))

(declare-fun lt!140692 () (_ BitVec 64))

(assert (=> d!30570 (= res!79763 (= lt!140696 (bvsub lt!140692 lt!140693)))))

(assert (=> d!30570 (or (= (bvand lt!140692 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!140693 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!140692 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!140692 lt!140693) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!30570 (= lt!140693 (remainingBits!0 ((_ sign_extend 32) (size!2076 (buf!2422 (_1!4131 lt!140088)))) ((_ sign_extend 32) (currentByte!4829 (_1!4131 lt!140088))) ((_ sign_extend 32) (currentBit!4824 (_1!4131 lt!140088)))))))

(declare-fun lt!140695 () (_ BitVec 64))

(declare-fun lt!140691 () (_ BitVec 64))

(assert (=> d!30570 (= lt!140692 (bvmul lt!140695 lt!140691))))

(assert (=> d!30570 (or (= lt!140695 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!140691 (bvsdiv (bvmul lt!140695 lt!140691) lt!140695)))))

(assert (=> d!30570 (= lt!140691 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!30570 (= lt!140695 ((_ sign_extend 32) (size!2076 (buf!2422 (_1!4131 lt!140088)))))))

(assert (=> d!30570 (= lt!140696 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4829 (_1!4131 lt!140088))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4824 (_1!4131 lt!140088)))))))

(assert (=> d!30570 (invariant!0 (currentBit!4824 (_1!4131 lt!140088)) (currentByte!4829 (_1!4131 lt!140088)) (size!2076 (buf!2422 (_1!4131 lt!140088))))))

(assert (=> d!30570 (= (bitIndex!0 (size!2076 (buf!2422 (_1!4131 lt!140088))) (currentByte!4829 (_1!4131 lt!140088)) (currentBit!4824 (_1!4131 lt!140088))) lt!140696)))

(declare-fun b!97206 () Bool)

(declare-fun res!79762 () Bool)

(assert (=> b!97206 (=> (not res!79762) (not e!63700))))

(assert (=> b!97206 (= res!79762 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!140696))))

(declare-fun b!97207 () Bool)

(declare-fun lt!140694 () (_ BitVec 64))

(assert (=> b!97207 (= e!63700 (bvsle lt!140696 (bvmul lt!140694 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!97207 (or (= lt!140694 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!140694 #b0000000000000000000000000000000000000000000000000000000000001000) lt!140694)))))

(assert (=> b!97207 (= lt!140694 ((_ sign_extend 32) (size!2076 (buf!2422 (_1!4131 lt!140088)))))))

(assert (= (and d!30570 res!79763) b!97206))

(assert (= (and b!97206 res!79762) b!97207))

(declare-fun m!141229 () Bool)

(assert (=> d!30570 m!141229))

(declare-fun m!141231 () Bool)

(assert (=> d!30570 m!141231))

(assert (=> b!97038 d!30570))

(declare-fun d!30572 () Bool)

(assert (=> d!30572 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2076 (buf!2422 (_2!4128 lt!140150)))) ((_ sign_extend 32) (currentByte!4829 thiss!1288)) ((_ sign_extend 32) (currentBit!4824 thiss!1288)) lt!140084) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2076 (buf!2422 (_2!4128 lt!140150)))) ((_ sign_extend 32) (currentByte!4829 thiss!1288)) ((_ sign_extend 32) (currentBit!4824 thiss!1288))) lt!140084))))

(declare-fun bs!7473 () Bool)

(assert (= bs!7473 d!30572))

(declare-fun m!141233 () Bool)

(assert (=> bs!7473 m!141233))

(assert (=> b!97038 d!30572))

(declare-fun d!30574 () Bool)

(declare-fun e!63701 () Bool)

(assert (=> d!30574 e!63701))

(declare-fun res!79765 () Bool)

(assert (=> d!30574 (=> (not res!79765) (not e!63701))))

(declare-fun lt!140699 () (_ BitVec 64))

(declare-fun lt!140698 () (_ BitVec 64))

(declare-fun lt!140702 () (_ BitVec 64))

(assert (=> d!30574 (= res!79765 (= lt!140702 (bvsub lt!140698 lt!140699)))))

(assert (=> d!30574 (or (= (bvand lt!140698 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!140699 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!140698 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!140698 lt!140699) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!30574 (= lt!140699 (remainingBits!0 ((_ sign_extend 32) (size!2076 (buf!2422 (_1!4131 lt!140137)))) ((_ sign_extend 32) (currentByte!4829 (_1!4131 lt!140137))) ((_ sign_extend 32) (currentBit!4824 (_1!4131 lt!140137)))))))

(declare-fun lt!140701 () (_ BitVec 64))

(declare-fun lt!140697 () (_ BitVec 64))

(assert (=> d!30574 (= lt!140698 (bvmul lt!140701 lt!140697))))

(assert (=> d!30574 (or (= lt!140701 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!140697 (bvsdiv (bvmul lt!140701 lt!140697) lt!140701)))))

(assert (=> d!30574 (= lt!140697 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!30574 (= lt!140701 ((_ sign_extend 32) (size!2076 (buf!2422 (_1!4131 lt!140137)))))))

(assert (=> d!30574 (= lt!140702 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4829 (_1!4131 lt!140137))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4824 (_1!4131 lt!140137)))))))

(assert (=> d!30574 (invariant!0 (currentBit!4824 (_1!4131 lt!140137)) (currentByte!4829 (_1!4131 lt!140137)) (size!2076 (buf!2422 (_1!4131 lt!140137))))))

(assert (=> d!30574 (= (bitIndex!0 (size!2076 (buf!2422 (_1!4131 lt!140137))) (currentByte!4829 (_1!4131 lt!140137)) (currentBit!4824 (_1!4131 lt!140137))) lt!140702)))

(declare-fun b!97208 () Bool)

(declare-fun res!79764 () Bool)

(assert (=> b!97208 (=> (not res!79764) (not e!63701))))

(assert (=> b!97208 (= res!79764 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!140702))))

(declare-fun b!97209 () Bool)

(declare-fun lt!140700 () (_ BitVec 64))

(assert (=> b!97209 (= e!63701 (bvsle lt!140702 (bvmul lt!140700 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!97209 (or (= lt!140700 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!140700 #b0000000000000000000000000000000000000000000000000000000000001000) lt!140700)))))

(assert (=> b!97209 (= lt!140700 ((_ sign_extend 32) (size!2076 (buf!2422 (_1!4131 lt!140137)))))))

(assert (= (and d!30574 res!79765) b!97208))

(assert (= (and b!97208 res!79764) b!97209))

(declare-fun m!141235 () Bool)

(assert (=> d!30574 m!141235))

(declare-fun m!141237 () Bool)

(assert (=> d!30574 m!141237))

(assert (=> b!97038 d!30574))

(declare-fun d!30576 () Bool)

(declare-fun e!63704 () Bool)

(assert (=> d!30576 e!63704))

(declare-fun res!79768 () Bool)

(assert (=> d!30576 (=> (not res!79768) (not e!63704))))

(declare-fun lt!140714 () tuple2!7758)

(declare-fun lt!140713 () tuple2!7758)

(assert (=> d!30576 (= res!79768 (= (bitIndex!0 (size!2076 (buf!2422 (_1!4131 lt!140714))) (currentByte!4829 (_1!4131 lt!140714)) (currentBit!4824 (_1!4131 lt!140714))) (bitIndex!0 (size!2076 (buf!2422 (_1!4131 lt!140713))) (currentByte!4829 (_1!4131 lt!140713)) (currentBit!4824 (_1!4131 lt!140713)))))))

(declare-fun lt!140712 () Unit!5874)

(declare-fun lt!140711 () BitStream!3626)

(declare-fun choose!50 (BitStream!3626 BitStream!3626 BitStream!3626 tuple2!7758 tuple2!7758 BitStream!3626 Bool tuple2!7758 tuple2!7758 BitStream!3626 Bool) Unit!5874)

(assert (=> d!30576 (= lt!140712 (choose!50 lt!140079 (_2!4128 lt!140150) lt!140711 lt!140714 (tuple2!7759 (_1!4131 lt!140714) (_2!4131 lt!140714)) (_1!4131 lt!140714) (_2!4131 lt!140714) lt!140713 (tuple2!7759 (_1!4131 lt!140713) (_2!4131 lt!140713)) (_1!4131 lt!140713) (_2!4131 lt!140713)))))

(assert (=> d!30576 (= lt!140713 (readBitPure!0 lt!140711))))

(assert (=> d!30576 (= lt!140714 (readBitPure!0 lt!140079))))

(assert (=> d!30576 (= lt!140711 (BitStream!3627 (buf!2422 (_2!4128 lt!140150)) (currentByte!4829 lt!140079) (currentBit!4824 lt!140079)))))

(assert (=> d!30576 (invariant!0 (currentBit!4824 lt!140079) (currentByte!4829 lt!140079) (size!2076 (buf!2422 (_2!4128 lt!140150))))))

(assert (=> d!30576 (= (readBitPrefixLemma!0 lt!140079 (_2!4128 lt!140150)) lt!140712)))

(declare-fun b!97212 () Bool)

(assert (=> b!97212 (= e!63704 (= (_2!4131 lt!140714) (_2!4131 lt!140713)))))

(assert (= (and d!30576 res!79768) b!97212))

(declare-fun m!141239 () Bool)

(assert (=> d!30576 m!141239))

(declare-fun m!141241 () Bool)

(assert (=> d!30576 m!141241))

(assert (=> d!30576 m!140703))

(assert (=> d!30576 m!140673))

(declare-fun m!141243 () Bool)

(assert (=> d!30576 m!141243))

(declare-fun m!141245 () Bool)

(assert (=> d!30576 m!141245))

(assert (=> b!97038 d!30576))

(declare-fun d!30578 () Bool)

(declare-fun lt!140715 () tuple2!7778)

(assert (=> d!30578 (= lt!140715 (readNLeastSignificantBitsLoop!0 (_1!4133 lt!140153) nBits!388 #b00000000000000000000000000000000 lt!140104))))

(assert (=> d!30578 (= (readNLeastSignificantBitsLoopPure!0 (_1!4133 lt!140153) nBits!388 #b00000000000000000000000000000000 lt!140104) (tuple2!7765 (_2!4141 lt!140715) (_1!4141 lt!140715)))))

(declare-fun bs!7474 () Bool)

(assert (= bs!7474 d!30578))

(declare-fun m!141247 () Bool)

(assert (=> bs!7474 m!141247))

(assert (=> b!97038 d!30578))

(declare-fun d!30580 () Bool)

(declare-fun lt!140716 () tuple2!7776)

(assert (=> d!30580 (= lt!140716 (readBit!0 lt!140120))))

(assert (=> d!30580 (= (readBitPure!0 lt!140120) (tuple2!7759 (_2!4140 lt!140716) (_1!4140 lt!140716)))))

(declare-fun bs!7475 () Bool)

(assert (= bs!7475 d!30580))

(declare-fun m!141249 () Bool)

(assert (=> bs!7475 m!141249))

(assert (=> b!97038 d!30580))

(declare-fun d!30582 () Bool)

(declare-fun res!79775 () Bool)

(declare-fun e!63709 () Bool)

(assert (=> d!30582 (=> (not res!79775) (not e!63709))))

(assert (=> d!30582 (= res!79775 (= (size!2076 (buf!2422 thiss!1288)) (size!2076 (buf!2422 (_2!4128 lt!140150)))))))

(assert (=> d!30582 (= (isPrefixOf!0 thiss!1288 (_2!4128 lt!140150)) e!63709)))

(declare-fun b!97219 () Bool)

(declare-fun res!79776 () Bool)

(assert (=> b!97219 (=> (not res!79776) (not e!63709))))

(assert (=> b!97219 (= res!79776 (bvsle (bitIndex!0 (size!2076 (buf!2422 thiss!1288)) (currentByte!4829 thiss!1288) (currentBit!4824 thiss!1288)) (bitIndex!0 (size!2076 (buf!2422 (_2!4128 lt!140150))) (currentByte!4829 (_2!4128 lt!140150)) (currentBit!4824 (_2!4128 lt!140150)))))))

(declare-fun b!97220 () Bool)

(declare-fun e!63710 () Bool)

(assert (=> b!97220 (= e!63709 e!63710)))

(declare-fun res!79777 () Bool)

(assert (=> b!97220 (=> res!79777 e!63710)))

(assert (=> b!97220 (= res!79777 (= (size!2076 (buf!2422 thiss!1288)) #b00000000000000000000000000000000))))

(declare-fun b!97221 () Bool)

(assert (=> b!97221 (= e!63710 (arrayBitRangesEq!0 (buf!2422 thiss!1288) (buf!2422 (_2!4128 lt!140150)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2076 (buf!2422 thiss!1288)) (currentByte!4829 thiss!1288) (currentBit!4824 thiss!1288))))))

(assert (= (and d!30582 res!79775) b!97219))

(assert (= (and b!97219 res!79776) b!97220))

(assert (= (and b!97220 (not res!79777)) b!97221))

(assert (=> b!97219 m!140617))

(assert (=> b!97219 m!140743))

(assert (=> b!97221 m!140617))

(assert (=> b!97221 m!140617))

(declare-fun m!141251 () Bool)

(assert (=> b!97221 m!141251))

(assert (=> b!97038 d!30582))

(declare-fun b!97222 () Bool)

(declare-fun lt!140734 () tuple2!7762)

(declare-fun e!63712 () Bool)

(declare-fun lt!140730 () (_ BitVec 64))

(declare-fun lt!140735 () (_ BitVec 64))

(assert (=> b!97222 (= e!63712 (= (_1!4133 lt!140734) (withMovedBitIndex!0 (_2!4133 lt!140734) (bvsub lt!140735 lt!140730))))))

(assert (=> b!97222 (or (= (bvand lt!140735 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!140730 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!140735 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!140735 lt!140730) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!97222 (= lt!140730 (bitIndex!0 (size!2076 (buf!2422 (_2!4128 lt!140150))) (currentByte!4829 (_2!4128 lt!140150)) (currentBit!4824 (_2!4128 lt!140150))))))

(assert (=> b!97222 (= lt!140735 (bitIndex!0 (size!2076 (buf!2422 (_2!4128 lt!140132))) (currentByte!4829 (_2!4128 lt!140132)) (currentBit!4824 (_2!4128 lt!140132))))))

(declare-fun d!30584 () Bool)

(assert (=> d!30584 e!63712))

(declare-fun res!79778 () Bool)

(assert (=> d!30584 (=> (not res!79778) (not e!63712))))

(assert (=> d!30584 (= res!79778 (isPrefixOf!0 (_1!4133 lt!140734) (_2!4133 lt!140734)))))

(declare-fun lt!140726 () BitStream!3626)

(assert (=> d!30584 (= lt!140734 (tuple2!7763 lt!140726 (_2!4128 lt!140150)))))

(declare-fun lt!140729 () Unit!5874)

(declare-fun lt!140736 () Unit!5874)

(assert (=> d!30584 (= lt!140729 lt!140736)))

(assert (=> d!30584 (isPrefixOf!0 lt!140726 (_2!4128 lt!140150))))

(assert (=> d!30584 (= lt!140736 (lemmaIsPrefixTransitive!0 lt!140726 (_2!4128 lt!140150) (_2!4128 lt!140150)))))

(declare-fun lt!140723 () Unit!5874)

(declare-fun lt!140717 () Unit!5874)

(assert (=> d!30584 (= lt!140723 lt!140717)))

(assert (=> d!30584 (isPrefixOf!0 lt!140726 (_2!4128 lt!140150))))

(assert (=> d!30584 (= lt!140717 (lemmaIsPrefixTransitive!0 lt!140726 (_2!4128 lt!140132) (_2!4128 lt!140150)))))

(declare-fun lt!140722 () Unit!5874)

(declare-fun e!63711 () Unit!5874)

(assert (=> d!30584 (= lt!140722 e!63711)))

(declare-fun c!6150 () Bool)

(assert (=> d!30584 (= c!6150 (not (= (size!2076 (buf!2422 (_2!4128 lt!140132))) #b00000000000000000000000000000000)))))

(declare-fun lt!140724 () Unit!5874)

(declare-fun lt!140721 () Unit!5874)

(assert (=> d!30584 (= lt!140724 lt!140721)))

(assert (=> d!30584 (isPrefixOf!0 (_2!4128 lt!140150) (_2!4128 lt!140150))))

(assert (=> d!30584 (= lt!140721 (lemmaIsPrefixRefl!0 (_2!4128 lt!140150)))))

(declare-fun lt!140732 () Unit!5874)

(declare-fun lt!140731 () Unit!5874)

(assert (=> d!30584 (= lt!140732 lt!140731)))

(assert (=> d!30584 (= lt!140731 (lemmaIsPrefixRefl!0 (_2!4128 lt!140150)))))

(declare-fun lt!140733 () Unit!5874)

(declare-fun lt!140727 () Unit!5874)

(assert (=> d!30584 (= lt!140733 lt!140727)))

(assert (=> d!30584 (isPrefixOf!0 lt!140726 lt!140726)))

(assert (=> d!30584 (= lt!140727 (lemmaIsPrefixRefl!0 lt!140726))))

(declare-fun lt!140718 () Unit!5874)

(declare-fun lt!140719 () Unit!5874)

(assert (=> d!30584 (= lt!140718 lt!140719)))

(assert (=> d!30584 (isPrefixOf!0 (_2!4128 lt!140132) (_2!4128 lt!140132))))

(assert (=> d!30584 (= lt!140719 (lemmaIsPrefixRefl!0 (_2!4128 lt!140132)))))

(assert (=> d!30584 (= lt!140726 (BitStream!3627 (buf!2422 (_2!4128 lt!140150)) (currentByte!4829 (_2!4128 lt!140132)) (currentBit!4824 (_2!4128 lt!140132))))))

(assert (=> d!30584 (isPrefixOf!0 (_2!4128 lt!140132) (_2!4128 lt!140150))))

(assert (=> d!30584 (= (reader!0 (_2!4128 lt!140132) (_2!4128 lt!140150)) lt!140734)))

(declare-fun b!97223 () Bool)

(declare-fun lt!140725 () Unit!5874)

(assert (=> b!97223 (= e!63711 lt!140725)))

(declare-fun lt!140728 () (_ BitVec 64))

(assert (=> b!97223 (= lt!140728 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!140720 () (_ BitVec 64))

(assert (=> b!97223 (= lt!140720 (bitIndex!0 (size!2076 (buf!2422 (_2!4128 lt!140132))) (currentByte!4829 (_2!4128 lt!140132)) (currentBit!4824 (_2!4128 lt!140132))))))

(assert (=> b!97223 (= lt!140725 (arrayBitRangesEqSymmetric!0 (buf!2422 (_2!4128 lt!140132)) (buf!2422 (_2!4128 lt!140150)) lt!140728 lt!140720))))

(assert (=> b!97223 (arrayBitRangesEq!0 (buf!2422 (_2!4128 lt!140150)) (buf!2422 (_2!4128 lt!140132)) lt!140728 lt!140720)))

(declare-fun b!97224 () Bool)

(declare-fun res!79779 () Bool)

(assert (=> b!97224 (=> (not res!79779) (not e!63712))))

(assert (=> b!97224 (= res!79779 (isPrefixOf!0 (_2!4133 lt!140734) (_2!4128 lt!140150)))))

(declare-fun b!97225 () Bool)

(declare-fun res!79780 () Bool)

(assert (=> b!97225 (=> (not res!79780) (not e!63712))))

(assert (=> b!97225 (= res!79780 (isPrefixOf!0 (_1!4133 lt!140734) (_2!4128 lt!140132)))))

(declare-fun b!97226 () Bool)

(declare-fun Unit!5905 () Unit!5874)

(assert (=> b!97226 (= e!63711 Unit!5905)))

(assert (= (and d!30584 c!6150) b!97223))

(assert (= (and d!30584 (not c!6150)) b!97226))

(assert (= (and d!30584 res!79778) b!97225))

(assert (= (and b!97225 res!79780) b!97224))

(assert (= (and b!97224 res!79779) b!97222))

(declare-fun m!141253 () Bool)

(assert (=> b!97225 m!141253))

(declare-fun m!141255 () Bool)

(assert (=> b!97222 m!141255))

(assert (=> b!97222 m!140743))

(assert (=> b!97222 m!140663))

(assert (=> b!97223 m!140663))

(declare-fun m!141257 () Bool)

(assert (=> b!97223 m!141257))

(declare-fun m!141259 () Bool)

(assert (=> b!97223 m!141259))

(declare-fun m!141261 () Bool)

(assert (=> d!30584 m!141261))

(declare-fun m!141263 () Bool)

(assert (=> d!30584 m!141263))

(declare-fun m!141265 () Bool)

(assert (=> d!30584 m!141265))

(declare-fun m!141267 () Bool)

(assert (=> d!30584 m!141267))

(declare-fun m!141269 () Bool)

(assert (=> d!30584 m!141269))

(assert (=> d!30584 m!141207))

(declare-fun m!141271 () Bool)

(assert (=> d!30584 m!141271))

(declare-fun m!141273 () Bool)

(assert (=> d!30584 m!141273))

(assert (=> d!30584 m!141213))

(declare-fun m!141275 () Bool)

(assert (=> d!30584 m!141275))

(declare-fun m!141277 () Bool)

(assert (=> d!30584 m!141277))

(declare-fun m!141279 () Bool)

(assert (=> b!97224 m!141279))

(assert (=> b!97038 d!30584))

(assert (=> b!97038 d!30554))

(declare-fun d!30586 () Bool)

(declare-fun lt!140737 () tuple2!7778)

(assert (=> d!30586 (= lt!140737 (readNLeastSignificantBitsLoop!0 (_1!4133 lt!140143) nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvor lt!140104 (ite (_2!4131 lt!140149) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!388 #b00000000000000000000000000000001) #b00000000000000000000000000000000))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!30586 (= (readNLeastSignificantBitsLoopPure!0 (_1!4133 lt!140143) nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvor lt!140104 (ite (_2!4131 lt!140149) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!388 #b00000000000000000000000000000001) #b00000000000000000000000000000000))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!7765 (_2!4141 lt!140737) (_1!4141 lt!140737)))))

(declare-fun bs!7476 () Bool)

(assert (= bs!7476 d!30586))

(declare-fun m!141281 () Bool)

(assert (=> bs!7476 m!141281))

(assert (=> b!97038 d!30586))

(declare-fun b!97236 () Bool)

(declare-fun res!79790 () Bool)

(declare-fun e!63718 () Bool)

(assert (=> b!97236 (=> (not res!79790) (not e!63718))))

(declare-fun lt!140746 () (_ BitVec 64))

(declare-fun lt!140747 () tuple2!7752)

(declare-fun lt!140749 () (_ BitVec 64))

(assert (=> b!97236 (= res!79790 (= (bitIndex!0 (size!2076 (buf!2422 (_2!4128 lt!140747))) (currentByte!4829 (_2!4128 lt!140747)) (currentBit!4824 (_2!4128 lt!140747))) (bvadd lt!140746 lt!140749)))))

(assert (=> b!97236 (or (not (= (bvand lt!140746 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!140749 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!140746 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!140746 lt!140749) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!97236 (= lt!140749 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!97236 (= lt!140746 (bitIndex!0 (size!2076 (buf!2422 thiss!1288)) (currentByte!4829 thiss!1288) (currentBit!4824 thiss!1288)))))

(declare-fun b!97237 () Bool)

(declare-fun res!79789 () Bool)

(assert (=> b!97237 (=> (not res!79789) (not e!63718))))

(assert (=> b!97237 (= res!79789 (isPrefixOf!0 thiss!1288 (_2!4128 lt!140747)))))

(declare-fun b!97238 () Bool)

(declare-fun e!63717 () Bool)

(assert (=> b!97238 (= e!63718 e!63717)))

(declare-fun res!79791 () Bool)

(assert (=> b!97238 (=> (not res!79791) (not e!63717))))

(declare-fun lt!140748 () tuple2!7758)

(assert (=> b!97238 (= res!79791 (and (= (_2!4131 lt!140748) lt!140115) (= (_1!4131 lt!140748) (_2!4128 lt!140747))))))

(assert (=> b!97238 (= lt!140748 (readBitPure!0 (readerFrom!0 (_2!4128 lt!140747) (currentBit!4824 thiss!1288) (currentByte!4829 thiss!1288))))))

(declare-fun d!30588 () Bool)

(assert (=> d!30588 e!63718))

(declare-fun res!79792 () Bool)

(assert (=> d!30588 (=> (not res!79792) (not e!63718))))

(assert (=> d!30588 (= res!79792 (= (size!2076 (buf!2422 thiss!1288)) (size!2076 (buf!2422 (_2!4128 lt!140747)))))))

(declare-fun choose!16 (BitStream!3626 Bool) tuple2!7752)

(assert (=> d!30588 (= lt!140747 (choose!16 thiss!1288 lt!140115))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!30588 (validate_offset_bit!0 ((_ sign_extend 32) (size!2076 (buf!2422 thiss!1288))) ((_ sign_extend 32) (currentByte!4829 thiss!1288)) ((_ sign_extend 32) (currentBit!4824 thiss!1288)))))

(assert (=> d!30588 (= (appendBit!0 thiss!1288 lt!140115) lt!140747)))

(declare-fun b!97239 () Bool)

(assert (=> b!97239 (= e!63717 (= (bitIndex!0 (size!2076 (buf!2422 (_1!4131 lt!140748))) (currentByte!4829 (_1!4131 lt!140748)) (currentBit!4824 (_1!4131 lt!140748))) (bitIndex!0 (size!2076 (buf!2422 (_2!4128 lt!140747))) (currentByte!4829 (_2!4128 lt!140747)) (currentBit!4824 (_2!4128 lt!140747)))))))

(assert (= (and d!30588 res!79792) b!97236))

(assert (= (and b!97236 res!79790) b!97237))

(assert (= (and b!97237 res!79789) b!97238))

(assert (= (and b!97238 res!79791) b!97239))

(declare-fun m!141283 () Bool)

(assert (=> b!97236 m!141283))

(assert (=> b!97236 m!140617))

(declare-fun m!141285 () Bool)

(assert (=> b!97237 m!141285))

(declare-fun m!141287 () Bool)

(assert (=> b!97239 m!141287))

(assert (=> b!97239 m!141283))

(declare-fun m!141289 () Bool)

(assert (=> d!30588 m!141289))

(declare-fun m!141291 () Bool)

(assert (=> d!30588 m!141291))

(declare-fun m!141293 () Bool)

(assert (=> b!97238 m!141293))

(assert (=> b!97238 m!141293))

(declare-fun m!141295 () Bool)

(assert (=> b!97238 m!141295))

(assert (=> b!97038 d!30588))

(declare-fun d!30590 () Bool)

(declare-fun e!63721 () Bool)

(assert (=> d!30590 e!63721))

(declare-fun res!79795 () Bool)

(assert (=> d!30590 (=> (not res!79795) (not e!63721))))

(declare-fun lt!140755 () (_ BitVec 64))

(declare-fun lt!140754 () BitStream!3626)

(assert (=> d!30590 (= res!79795 (= (bvadd lt!140755 (bvsub (bitIndex!0 (size!2076 (buf!2422 (_2!4128 lt!140132))) (currentByte!4829 (_2!4128 lt!140132)) (currentBit!4824 (_2!4128 lt!140132))) (bitIndex!0 (size!2076 (buf!2422 (_2!4128 lt!140150))) (currentByte!4829 (_2!4128 lt!140150)) (currentBit!4824 (_2!4128 lt!140150))))) (bitIndex!0 (size!2076 (buf!2422 lt!140754)) (currentByte!4829 lt!140754) (currentBit!4824 lt!140754))))))

(assert (=> d!30590 (or (not (= (bvand lt!140755 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bitIndex!0 (size!2076 (buf!2422 (_2!4128 lt!140132))) (currentByte!4829 (_2!4128 lt!140132)) (currentBit!4824 (_2!4128 lt!140132))) (bitIndex!0 (size!2076 (buf!2422 (_2!4128 lt!140150))) (currentByte!4829 (_2!4128 lt!140150)) (currentBit!4824 (_2!4128 lt!140150)))) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!140755 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!140755 (bvsub (bitIndex!0 (size!2076 (buf!2422 (_2!4128 lt!140132))) (currentByte!4829 (_2!4128 lt!140132)) (currentBit!4824 (_2!4128 lt!140132))) (bitIndex!0 (size!2076 (buf!2422 (_2!4128 lt!140150))) (currentByte!4829 (_2!4128 lt!140150)) (currentBit!4824 (_2!4128 lt!140150))))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!30590 (= lt!140755 (bitIndex!0 (size!2076 (buf!2422 (_2!4133 lt!140143))) (currentByte!4829 (_2!4133 lt!140143)) (currentBit!4824 (_2!4133 lt!140143))))))

(declare-fun moveBitIndex!0 (BitStream!3626 (_ BitVec 64)) tuple2!7752)

(assert (=> d!30590 (= lt!140754 (_2!4128 (moveBitIndex!0 (_2!4133 lt!140143) (bvsub (bitIndex!0 (size!2076 (buf!2422 (_2!4128 lt!140132))) (currentByte!4829 (_2!4128 lt!140132)) (currentBit!4824 (_2!4128 lt!140132))) (bitIndex!0 (size!2076 (buf!2422 (_2!4128 lt!140150))) (currentByte!4829 (_2!4128 lt!140150)) (currentBit!4824 (_2!4128 lt!140150)))))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!3626 (_ BitVec 64)) Bool)

(assert (=> d!30590 (moveBitIndexPrecond!0 (_2!4133 lt!140143) (bvsub (bitIndex!0 (size!2076 (buf!2422 (_2!4128 lt!140132))) (currentByte!4829 (_2!4128 lt!140132)) (currentBit!4824 (_2!4128 lt!140132))) (bitIndex!0 (size!2076 (buf!2422 (_2!4128 lt!140150))) (currentByte!4829 (_2!4128 lt!140150)) (currentBit!4824 (_2!4128 lt!140150)))))))

(assert (=> d!30590 (= (withMovedBitIndex!0 (_2!4133 lt!140143) (bvsub (bitIndex!0 (size!2076 (buf!2422 (_2!4128 lt!140132))) (currentByte!4829 (_2!4128 lt!140132)) (currentBit!4824 (_2!4128 lt!140132))) (bitIndex!0 (size!2076 (buf!2422 (_2!4128 lt!140150))) (currentByte!4829 (_2!4128 lt!140150)) (currentBit!4824 (_2!4128 lt!140150))))) lt!140754)))

(declare-fun b!97242 () Bool)

(assert (=> b!97242 (= e!63721 (= (size!2076 (buf!2422 (_2!4133 lt!140143))) (size!2076 (buf!2422 lt!140754))))))

(assert (= (and d!30590 res!79795) b!97242))

(declare-fun m!141297 () Bool)

(assert (=> d!30590 m!141297))

(declare-fun m!141299 () Bool)

(assert (=> d!30590 m!141299))

(declare-fun m!141301 () Bool)

(assert (=> d!30590 m!141301))

(declare-fun m!141303 () Bool)

(assert (=> d!30590 m!141303))

(assert (=> b!97038 d!30590))

(declare-fun d!30592 () Bool)

(declare-fun lt!140769 () tuple2!7764)

(declare-fun lt!140770 () tuple2!7764)

(assert (=> d!30592 (and (= (_2!4134 lt!140769) (_2!4134 lt!140770)) (= (_1!4134 lt!140769) (_1!4134 lt!140770)))))

(declare-fun lt!140768 () (_ BitVec 64))

(declare-fun lt!140771 () BitStream!3626)

(declare-fun lt!140772 () Unit!5874)

(declare-fun lt!140773 () Bool)

(declare-fun choose!45 (BitStream!3626 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!7764 tuple2!7764 BitStream!3626 (_ BitVec 64) Bool BitStream!3626 (_ BitVec 64) tuple2!7764 tuple2!7764 BitStream!3626 (_ BitVec 64)) Unit!5874)

(assert (=> d!30592 (= lt!140772 (choose!45 (_1!4133 lt!140153) nBits!388 #b00000000000000000000000000000000 lt!140104 lt!140769 (tuple2!7765 (_1!4134 lt!140769) (_2!4134 lt!140769)) (_1!4134 lt!140769) (_2!4134 lt!140769) lt!140773 lt!140771 lt!140768 lt!140770 (tuple2!7765 (_1!4134 lt!140770) (_2!4134 lt!140770)) (_1!4134 lt!140770) (_2!4134 lt!140770)))))

(assert (=> d!30592 (= lt!140770 (readNLeastSignificantBitsLoopPure!0 lt!140771 nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!140768))))

(assert (=> d!30592 (= lt!140768 (bvor lt!140104 (ite lt!140773 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!388 #b00000000000000000000000000000001) #b00000000000000000000000000000000))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!30592 (= lt!140771 (withMovedBitIndex!0 (_1!4133 lt!140153) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!30592 (= lt!140773 (_2!4131 (readBitPure!0 (_1!4133 lt!140153))))))

(assert (=> d!30592 (= lt!140769 (readNLeastSignificantBitsLoopPure!0 (_1!4133 lt!140153) nBits!388 #b00000000000000000000000000000000 lt!140104))))

(assert (=> d!30592 (= (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4133 lt!140153) nBits!388 #b00000000000000000000000000000000 lt!140104) lt!140772)))

(declare-fun bs!7478 () Bool)

(assert (= bs!7478 d!30592))

(declare-fun m!141305 () Bool)

(assert (=> bs!7478 m!141305))

(assert (=> bs!7478 m!140654))

(declare-fun m!141307 () Bool)

(assert (=> bs!7478 m!141307))

(assert (=> bs!7478 m!140735))

(assert (=> bs!7478 m!140675))

(assert (=> b!97038 d!30592))

(declare-fun b!97243 () Bool)

(declare-fun e!63725 () (_ BitVec 64))

(assert (=> b!97243 (= e!63725 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!97244 () Bool)

(declare-fun res!79799 () Bool)

(declare-fun e!63728 () Bool)

(assert (=> b!97244 (=> (not res!79799) (not e!63728))))

(declare-fun lt!140783 () tuple2!7752)

(assert (=> b!97244 (= res!79799 (isPrefixOf!0 (_2!4128 lt!140132) (_2!4128 lt!140783)))))

(declare-fun b!97245 () Bool)

(declare-fun res!79797 () Bool)

(declare-fun call!1195 () Bool)

(assert (=> b!97245 (= res!79797 call!1195)))

(declare-fun e!63726 () Bool)

(assert (=> b!97245 (=> (not res!79797) (not e!63726))))

(declare-fun b!97246 () Bool)

(declare-fun e!63724 () tuple2!7752)

(declare-fun lt!140785 () Unit!5874)

(assert (=> b!97246 (= e!63724 (tuple2!7753 lt!140785 (_2!4128 lt!140132)))))

(declare-fun lt!140809 () BitStream!3626)

(assert (=> b!97246 (= lt!140809 (_2!4128 lt!140132))))

(assert (=> b!97246 (= lt!140785 (lemmaIsPrefixRefl!0 lt!140809))))

(assert (=> b!97246 call!1195))

(declare-fun b!97247 () Bool)

(declare-fun res!79800 () Bool)

(declare-fun lt!140801 () tuple2!7752)

(assert (=> b!97247 (= res!79800 (= (bitIndex!0 (size!2076 (buf!2422 (_2!4128 lt!140801))) (currentByte!4829 (_2!4128 lt!140801)) (currentBit!4824 (_2!4128 lt!140801))) (bvadd (bitIndex!0 (size!2076 (buf!2422 (_2!4128 lt!140132))) (currentByte!4829 (_2!4128 lt!140132)) (currentBit!4824 (_2!4128 lt!140132))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!97247 (=> (not res!79800) (not e!63726))))

(declare-fun b!97248 () Bool)

(declare-fun res!79801 () Bool)

(assert (=> b!97248 (=> (not res!79801) (not e!63728))))

(declare-fun lt!140793 () (_ BitVec 64))

(declare-fun lt!140777 () (_ BitVec 64))

(assert (=> b!97248 (= res!79801 (= (bitIndex!0 (size!2076 (buf!2422 (_2!4128 lt!140783))) (currentByte!4829 (_2!4128 lt!140783)) (currentBit!4824 (_2!4128 lt!140783))) (bvadd lt!140777 lt!140793)))))

(assert (=> b!97248 (or (not (= (bvand lt!140777 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!140793 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!140777 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!140777 lt!140793) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!97248 (= lt!140793 ((_ sign_extend 32) (bvsub nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!97248 (or (= (bvand nBits!388 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b10000000000000000000000000000000)) (= (bvand nBits!388 #b10000000000000000000000000000000) (bvand (bvsub nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) #b10000000000000000000000000000000)))))

(assert (=> b!97248 (= lt!140777 (bitIndex!0 (size!2076 (buf!2422 (_2!4128 lt!140132))) (currentByte!4829 (_2!4128 lt!140132)) (currentBit!4824 (_2!4128 lt!140132))))))

(declare-fun b!97249 () Bool)

(declare-fun e!63723 () Bool)

(declare-fun lt!140784 () tuple2!7758)

(assert (=> b!97249 (= e!63723 (= (bitIndex!0 (size!2076 (buf!2422 (_1!4131 lt!140784))) (currentByte!4829 (_1!4131 lt!140784)) (currentBit!4824 (_1!4131 lt!140784))) (bitIndex!0 (size!2076 (buf!2422 (_2!4128 lt!140801))) (currentByte!4829 (_2!4128 lt!140801)) (currentBit!4824 (_2!4128 lt!140801)))))))

(declare-fun d!30594 () Bool)

(assert (=> d!30594 e!63728))

(declare-fun res!79796 () Bool)

(assert (=> d!30594 (=> (not res!79796) (not e!63728))))

(assert (=> d!30594 (= res!79796 (= (size!2076 (buf!2422 (_2!4128 lt!140132))) (size!2076 (buf!2422 (_2!4128 lt!140783)))))))

(assert (=> d!30594 (= lt!140783 e!63724)))

(declare-fun c!6152 () Bool)

(assert (=> d!30594 (= c!6152 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) nBits!388))))

(assert (=> d!30594 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) nBits!388) (bvsle nBits!388 #b00000000000000000000000001000000))))

(assert (=> d!30594 (= (appendNLeastSignificantBitsLoop!0 (_2!4128 lt!140132) v!196 nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!140783)))

(declare-fun b!97250 () Bool)

(declare-fun e!63722 () Bool)

(declare-fun lt!140803 () tuple2!7758)

(declare-fun lt!140779 () tuple2!7758)

(assert (=> b!97250 (= e!63722 (= (_2!4131 lt!140803) (_2!4131 lt!140779)))))

(declare-fun b!97251 () Bool)

(assert (=> b!97251 (= lt!140784 (readBitPure!0 (readerFrom!0 (_2!4128 lt!140801) (currentBit!4824 (_2!4128 lt!140132)) (currentByte!4829 (_2!4128 lt!140132)))))))

(declare-fun res!79803 () Bool)

(declare-fun lt!140791 () Bool)

(assert (=> b!97251 (= res!79803 (and (= (_2!4131 lt!140784) lt!140791) (= (_1!4131 lt!140784) (_2!4128 lt!140801))))))

(assert (=> b!97251 (=> (not res!79803) (not e!63723))))

(assert (=> b!97251 (= e!63726 e!63723)))

(declare-fun b!97252 () Bool)

(assert (=> b!97252 (= e!63725 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!388 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))))

(declare-fun b!97253 () Bool)

(declare-fun e!63727 () Bool)

(declare-fun lt!140792 () (_ BitVec 64))

(assert (=> b!97253 (= e!63727 (validate_offset_bits!1 ((_ sign_extend 32) (size!2076 (buf!2422 (_2!4128 lt!140132)))) ((_ sign_extend 32) (currentByte!4829 (_2!4128 lt!140132))) ((_ sign_extend 32) (currentBit!4824 (_2!4128 lt!140132))) lt!140792))))

(declare-fun bm!1192 () Bool)

(assert (=> bm!1192 (= call!1195 (isPrefixOf!0 (ite c!6152 (_2!4128 lt!140132) lt!140809) (ite c!6152 (_2!4128 lt!140801) lt!140809)))))

(declare-fun b!97254 () Bool)

(declare-fun lt!140789 () tuple2!7762)

(declare-fun lt!140796 () tuple2!7764)

(assert (=> b!97254 (= e!63728 (and (= (_2!4134 lt!140796) v!196) (= (_1!4134 lt!140796) (_2!4133 lt!140789))))))

(declare-fun lt!140778 () (_ BitVec 64))

(assert (=> b!97254 (= lt!140796 (readNLeastSignificantBitsLoopPure!0 (_1!4133 lt!140789) nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!140778))))

(declare-fun lt!140795 () Unit!5874)

(declare-fun lt!140807 () Unit!5874)

(assert (=> b!97254 (= lt!140795 lt!140807)))

(assert (=> b!97254 (validate_offset_bits!1 ((_ sign_extend 32) (size!2076 (buf!2422 (_2!4128 lt!140783)))) ((_ sign_extend 32) (currentByte!4829 (_2!4128 lt!140132))) ((_ sign_extend 32) (currentBit!4824 (_2!4128 lt!140132))) lt!140792)))

(assert (=> b!97254 (= lt!140807 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4128 lt!140132) (buf!2422 (_2!4128 lt!140783)) lt!140792))))

(assert (=> b!97254 e!63727))

(declare-fun res!79802 () Bool)

(assert (=> b!97254 (=> (not res!79802) (not e!63727))))

(assert (=> b!97254 (= res!79802 (and (= (size!2076 (buf!2422 (_2!4128 lt!140132))) (size!2076 (buf!2422 (_2!4128 lt!140783)))) (bvsge lt!140792 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!97254 (= lt!140792 ((_ sign_extend 32) (bvsub nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!97254 (or (= (bvand nBits!388 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b10000000000000000000000000000000)) (= (bvand nBits!388 #b10000000000000000000000000000000) (bvand (bvsub nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) #b10000000000000000000000000000000)))))

(assert (=> b!97254 (= lt!140778 (bvand v!196 (bvnot (onesLSBLong!0 (bvsub nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))))

(assert (=> b!97254 (or (= (bvand nBits!388 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b10000000000000000000000000000000)) (= (bvand nBits!388 #b10000000000000000000000000000000) (bvand (bvsub nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) #b10000000000000000000000000000000)))))

(assert (=> b!97254 (= lt!140789 (reader!0 (_2!4128 lt!140132) (_2!4128 lt!140783)))))

(declare-fun b!97255 () Bool)

(declare-fun lt!140812 () tuple2!7752)

(declare-fun Unit!5906 () Unit!5874)

(assert (=> b!97255 (= e!63724 (tuple2!7753 Unit!5906 (_2!4128 lt!140812)))))

(assert (=> b!97255 (= lt!140791 (not (= (bvand v!196 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!388 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!97255 (= lt!140801 (appendBit!0 (_2!4128 lt!140132) lt!140791))))

(declare-fun res!79804 () Bool)

(assert (=> b!97255 (= res!79804 (= (size!2076 (buf!2422 (_2!4128 lt!140132))) (size!2076 (buf!2422 (_2!4128 lt!140801)))))))

(assert (=> b!97255 (=> (not res!79804) (not e!63726))))

(assert (=> b!97255 e!63726))

(declare-fun lt!140799 () tuple2!7752)

(assert (=> b!97255 (= lt!140799 lt!140801)))

(assert (=> b!97255 (= lt!140812 (appendNLeastSignificantBitsLoop!0 (_2!4128 lt!140799) v!196 nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(declare-fun lt!140782 () Unit!5874)

(assert (=> b!97255 (= lt!140782 (lemmaIsPrefixTransitive!0 (_2!4128 lt!140132) (_2!4128 lt!140799) (_2!4128 lt!140812)))))

(assert (=> b!97255 (isPrefixOf!0 (_2!4128 lt!140132) (_2!4128 lt!140812))))

(declare-fun lt!140800 () Unit!5874)

(assert (=> b!97255 (= lt!140800 lt!140782)))

(assert (=> b!97255 (invariant!0 (currentBit!4824 (_2!4128 lt!140132)) (currentByte!4829 (_2!4128 lt!140132)) (size!2076 (buf!2422 (_2!4128 lt!140799))))))

(declare-fun lt!140774 () BitStream!3626)

(assert (=> b!97255 (= lt!140774 (BitStream!3627 (buf!2422 (_2!4128 lt!140799)) (currentByte!4829 (_2!4128 lt!140132)) (currentBit!4824 (_2!4128 lt!140132))))))

(assert (=> b!97255 (invariant!0 (currentBit!4824 lt!140774) (currentByte!4829 lt!140774) (size!2076 (buf!2422 (_2!4128 lt!140812))))))

(declare-fun lt!140794 () BitStream!3626)

(assert (=> b!97255 (= lt!140794 (BitStream!3627 (buf!2422 (_2!4128 lt!140812)) (currentByte!4829 lt!140774) (currentBit!4824 lt!140774)))))

(assert (=> b!97255 (= lt!140803 (readBitPure!0 lt!140774))))

(assert (=> b!97255 (= lt!140779 (readBitPure!0 lt!140794))))

(declare-fun lt!140818 () Unit!5874)

(assert (=> b!97255 (= lt!140818 (readBitPrefixLemma!0 lt!140774 (_2!4128 lt!140812)))))

(declare-fun res!79798 () Bool)

(assert (=> b!97255 (= res!79798 (= (bitIndex!0 (size!2076 (buf!2422 (_1!4131 lt!140803))) (currentByte!4829 (_1!4131 lt!140803)) (currentBit!4824 (_1!4131 lt!140803))) (bitIndex!0 (size!2076 (buf!2422 (_1!4131 lt!140779))) (currentByte!4829 (_1!4131 lt!140779)) (currentBit!4824 (_1!4131 lt!140779)))))))

(assert (=> b!97255 (=> (not res!79798) (not e!63722))))

(assert (=> b!97255 e!63722))

(declare-fun lt!140816 () Unit!5874)

(assert (=> b!97255 (= lt!140816 lt!140818)))

(declare-fun lt!140815 () tuple2!7762)

(assert (=> b!97255 (= lt!140815 (reader!0 (_2!4128 lt!140132) (_2!4128 lt!140812)))))

(declare-fun lt!140808 () tuple2!7762)

(assert (=> b!97255 (= lt!140808 (reader!0 (_2!4128 lt!140799) (_2!4128 lt!140812)))))

(declare-fun lt!140811 () tuple2!7758)

(assert (=> b!97255 (= lt!140811 (readBitPure!0 (_1!4133 lt!140815)))))

(assert (=> b!97255 (= (_2!4131 lt!140811) lt!140791)))

(declare-fun lt!140787 () Unit!5874)

(declare-fun Unit!5907 () Unit!5874)

(assert (=> b!97255 (= lt!140787 Unit!5907)))

(declare-fun lt!140786 () (_ BitVec 64))

(assert (=> b!97255 (= lt!140786 (bvand v!196 (bvnot (onesLSBLong!0 (bvsub nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))))

(declare-fun lt!140776 () (_ BitVec 64))

(assert (=> b!97255 (= lt!140776 ((_ sign_extend 32) (bvsub nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun lt!140790 () Unit!5874)

(assert (=> b!97255 (= lt!140790 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4128 lt!140132) (buf!2422 (_2!4128 lt!140812)) lt!140776))))

(assert (=> b!97255 (validate_offset_bits!1 ((_ sign_extend 32) (size!2076 (buf!2422 (_2!4128 lt!140812)))) ((_ sign_extend 32) (currentByte!4829 (_2!4128 lt!140132))) ((_ sign_extend 32) (currentBit!4824 (_2!4128 lt!140132))) lt!140776)))

(declare-fun lt!140804 () Unit!5874)

(assert (=> b!97255 (= lt!140804 lt!140790)))

(declare-fun lt!140802 () tuple2!7764)

(assert (=> b!97255 (= lt!140802 (readNLeastSignificantBitsLoopPure!0 (_1!4133 lt!140815) nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!140786))))

(declare-fun lt!140775 () (_ BitVec 64))

(assert (=> b!97255 (= lt!140775 ((_ sign_extend 32) (bvsub (bvsub nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))))

(declare-fun lt!140797 () Unit!5874)

(assert (=> b!97255 (= lt!140797 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4128 lt!140799) (buf!2422 (_2!4128 lt!140812)) lt!140775))))

(assert (=> b!97255 (validate_offset_bits!1 ((_ sign_extend 32) (size!2076 (buf!2422 (_2!4128 lt!140812)))) ((_ sign_extend 32) (currentByte!4829 (_2!4128 lt!140799))) ((_ sign_extend 32) (currentBit!4824 (_2!4128 lt!140799))) lt!140775)))

(declare-fun lt!140805 () Unit!5874)

(assert (=> b!97255 (= lt!140805 lt!140797)))

(declare-fun lt!140781 () tuple2!7764)

(assert (=> b!97255 (= lt!140781 (readNLeastSignificantBitsLoopPure!0 (_1!4133 lt!140808) nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvor lt!140786 (ite (_2!4131 lt!140811) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!388 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!140806 () tuple2!7764)

(assert (=> b!97255 (= lt!140806 (readNLeastSignificantBitsLoopPure!0 (_1!4133 lt!140815) nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!140786))))

(declare-fun c!6151 () Bool)

(assert (=> b!97255 (= c!6151 (_2!4131 (readBitPure!0 (_1!4133 lt!140815))))))

(declare-fun lt!140788 () tuple2!7764)

(assert (=> b!97255 (= lt!140788 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4133 lt!140815) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvor lt!140786 e!63725)))))

(declare-fun lt!140780 () Unit!5874)

(assert (=> b!97255 (= lt!140780 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4133 lt!140815) nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!140786))))

(assert (=> b!97255 (and (= (_2!4134 lt!140806) (_2!4134 lt!140788)) (= (_1!4134 lt!140806) (_1!4134 lt!140788)))))

(declare-fun lt!140813 () Unit!5874)

(assert (=> b!97255 (= lt!140813 lt!140780)))

(assert (=> b!97255 (= (_1!4133 lt!140815) (withMovedBitIndex!0 (_2!4133 lt!140815) (bvsub (bitIndex!0 (size!2076 (buf!2422 (_2!4128 lt!140132))) (currentByte!4829 (_2!4128 lt!140132)) (currentBit!4824 (_2!4128 lt!140132))) (bitIndex!0 (size!2076 (buf!2422 (_2!4128 lt!140812))) (currentByte!4829 (_2!4128 lt!140812)) (currentBit!4824 (_2!4128 lt!140812))))))))

(declare-fun lt!140810 () Unit!5874)

(declare-fun Unit!5908 () Unit!5874)

(assert (=> b!97255 (= lt!140810 Unit!5908)))

(assert (=> b!97255 (= (_1!4133 lt!140808) (withMovedBitIndex!0 (_2!4133 lt!140808) (bvsub (bitIndex!0 (size!2076 (buf!2422 (_2!4128 lt!140799))) (currentByte!4829 (_2!4128 lt!140799)) (currentBit!4824 (_2!4128 lt!140799))) (bitIndex!0 (size!2076 (buf!2422 (_2!4128 lt!140812))) (currentByte!4829 (_2!4128 lt!140812)) (currentBit!4824 (_2!4128 lt!140812))))))))

(declare-fun lt!140814 () Unit!5874)

(declare-fun Unit!5909 () Unit!5874)

(assert (=> b!97255 (= lt!140814 Unit!5909)))

(assert (=> b!97255 (= (bitIndex!0 (size!2076 (buf!2422 (_2!4128 lt!140132))) (currentByte!4829 (_2!4128 lt!140132)) (currentBit!4824 (_2!4128 lt!140132))) (bvsub (bitIndex!0 (size!2076 (buf!2422 (_2!4128 lt!140799))) (currentByte!4829 (_2!4128 lt!140799)) (currentBit!4824 (_2!4128 lt!140799))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!140817 () Unit!5874)

(declare-fun Unit!5910 () Unit!5874)

(assert (=> b!97255 (= lt!140817 Unit!5910)))

(assert (=> b!97255 (= (_2!4134 lt!140802) (_2!4134 lt!140781))))

(declare-fun lt!140798 () Unit!5874)

(declare-fun Unit!5911 () Unit!5874)

(assert (=> b!97255 (= lt!140798 Unit!5911)))

(assert (=> b!97255 (= (_1!4134 lt!140802) (_2!4133 lt!140815))))

(assert (= (and d!30594 c!6152) b!97255))

(assert (= (and d!30594 (not c!6152)) b!97246))

(assert (= (and b!97255 res!79804) b!97247))

(assert (= (and b!97247 res!79800) b!97245))

(assert (= (and b!97245 res!79797) b!97251))

(assert (= (and b!97251 res!79803) b!97249))

(assert (= (and b!97255 res!79798) b!97250))

(assert (= (and b!97255 c!6151) b!97252))

(assert (= (and b!97255 (not c!6151)) b!97243))

(assert (= (or b!97245 b!97246) bm!1192))

(assert (= (and d!30594 res!79796) b!97248))

(assert (= (and b!97248 res!79801) b!97244))

(assert (= (and b!97244 res!79799) b!97254))

(assert (= (and b!97254 res!79802) b!97253))

(declare-fun m!141309 () Bool)

(assert (=> b!97244 m!141309))

(declare-fun m!141311 () Bool)

(assert (=> b!97251 m!141311))

(assert (=> b!97251 m!141311))

(declare-fun m!141313 () Bool)

(assert (=> b!97251 m!141313))

(declare-fun m!141315 () Bool)

(assert (=> b!97247 m!141315))

(assert (=> b!97247 m!140663))

(declare-fun m!141317 () Bool)

(assert (=> b!97246 m!141317))

(declare-fun m!141319 () Bool)

(assert (=> b!97254 m!141319))

(declare-fun m!141321 () Bool)

(assert (=> b!97254 m!141321))

(declare-fun m!141323 () Bool)

(assert (=> b!97254 m!141323))

(declare-fun m!141325 () Bool)

(assert (=> b!97254 m!141325))

(declare-fun m!141327 () Bool)

(assert (=> b!97254 m!141327))

(assert (=> b!97255 m!141319))

(declare-fun m!141329 () Bool)

(assert (=> b!97255 m!141329))

(declare-fun m!141331 () Bool)

(assert (=> b!97255 m!141331))

(declare-fun m!141333 () Bool)

(assert (=> b!97255 m!141333))

(declare-fun m!141335 () Bool)

(assert (=> b!97255 m!141335))

(declare-fun m!141337 () Bool)

(assert (=> b!97255 m!141337))

(declare-fun m!141339 () Bool)

(assert (=> b!97255 m!141339))

(declare-fun m!141341 () Bool)

(assert (=> b!97255 m!141341))

(declare-fun m!141343 () Bool)

(assert (=> b!97255 m!141343))

(declare-fun m!141345 () Bool)

(assert (=> b!97255 m!141345))

(declare-fun m!141347 () Bool)

(assert (=> b!97255 m!141347))

(declare-fun m!141349 () Bool)

(assert (=> b!97255 m!141349))

(declare-fun m!141351 () Bool)

(assert (=> b!97255 m!141351))

(declare-fun m!141353 () Bool)

(assert (=> b!97255 m!141353))

(assert (=> b!97255 m!140663))

(declare-fun m!141355 () Bool)

(assert (=> b!97255 m!141355))

(declare-fun m!141357 () Bool)

(assert (=> b!97255 m!141357))

(declare-fun m!141359 () Bool)

(assert (=> b!97255 m!141359))

(declare-fun m!141361 () Bool)

(assert (=> b!97255 m!141361))

(declare-fun m!141363 () Bool)

(assert (=> b!97255 m!141363))

(declare-fun m!141365 () Bool)

(assert (=> b!97255 m!141365))

(assert (=> b!97255 m!141333))

(declare-fun m!141367 () Bool)

(assert (=> b!97255 m!141367))

(declare-fun m!141369 () Bool)

(assert (=> b!97255 m!141369))

(declare-fun m!141371 () Bool)

(assert (=> b!97255 m!141371))

(declare-fun m!141373 () Bool)

(assert (=> b!97255 m!141373))

(declare-fun m!141375 () Bool)

(assert (=> b!97255 m!141375))

(declare-fun m!141377 () Bool)

(assert (=> b!97255 m!141377))

(declare-fun m!141379 () Bool)

(assert (=> b!97255 m!141379))

(declare-fun m!141381 () Bool)

(assert (=> b!97255 m!141381))

(declare-fun m!141383 () Bool)

(assert (=> b!97248 m!141383))

(assert (=> b!97248 m!140663))

(declare-fun m!141385 () Bool)

(assert (=> b!97253 m!141385))

(declare-fun m!141387 () Bool)

(assert (=> bm!1192 m!141387))

(declare-fun m!141389 () Bool)

(assert (=> b!97249 m!141389))

(assert (=> b!97249 m!141315))

(assert (=> b!97038 d!30594))

(declare-fun d!30596 () Bool)

(declare-fun e!63729 () Bool)

(assert (=> d!30596 e!63729))

(declare-fun res!79806 () Bool)

(assert (=> d!30596 (=> (not res!79806) (not e!63729))))

(declare-fun lt!140824 () (_ BitVec 64))

(declare-fun lt!140820 () (_ BitVec 64))

(declare-fun lt!140821 () (_ BitVec 64))

(assert (=> d!30596 (= res!79806 (= lt!140824 (bvsub lt!140820 lt!140821)))))

(assert (=> d!30596 (or (= (bvand lt!140820 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!140821 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!140820 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!140820 lt!140821) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!30596 (= lt!140821 (remainingBits!0 ((_ sign_extend 32) (size!2076 (buf!2422 (_2!4128 lt!140132)))) ((_ sign_extend 32) (currentByte!4829 (_2!4128 lt!140132))) ((_ sign_extend 32) (currentBit!4824 (_2!4128 lt!140132)))))))

(declare-fun lt!140823 () (_ BitVec 64))

(declare-fun lt!140819 () (_ BitVec 64))

(assert (=> d!30596 (= lt!140820 (bvmul lt!140823 lt!140819))))

(assert (=> d!30596 (or (= lt!140823 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!140819 (bvsdiv (bvmul lt!140823 lt!140819) lt!140823)))))

(assert (=> d!30596 (= lt!140819 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!30596 (= lt!140823 ((_ sign_extend 32) (size!2076 (buf!2422 (_2!4128 lt!140132)))))))

(assert (=> d!30596 (= lt!140824 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4829 (_2!4128 lt!140132))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4824 (_2!4128 lt!140132)))))))

(assert (=> d!30596 (invariant!0 (currentBit!4824 (_2!4128 lt!140132)) (currentByte!4829 (_2!4128 lt!140132)) (size!2076 (buf!2422 (_2!4128 lt!140132))))))

(assert (=> d!30596 (= (bitIndex!0 (size!2076 (buf!2422 (_2!4128 lt!140132))) (currentByte!4829 (_2!4128 lt!140132)) (currentBit!4824 (_2!4128 lt!140132))) lt!140824)))

(declare-fun b!97256 () Bool)

(declare-fun res!79805 () Bool)

(assert (=> b!97256 (=> (not res!79805) (not e!63729))))

(assert (=> b!97256 (= res!79805 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!140824))))

(declare-fun b!97257 () Bool)

(declare-fun lt!140822 () (_ BitVec 64))

(assert (=> b!97257 (= e!63729 (bvsle lt!140824 (bvmul lt!140822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!97257 (or (= lt!140822 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!140822 #b0000000000000000000000000000000000000000000000000000000000001000) lt!140822)))))

(assert (=> b!97257 (= lt!140822 ((_ sign_extend 32) (size!2076 (buf!2422 (_2!4128 lt!140132)))))))

(assert (= (and d!30596 res!79806) b!97256))

(assert (= (and b!97256 res!79805) b!97257))

(declare-fun m!141391 () Bool)

(assert (=> d!30596 m!141391))

(declare-fun m!141393 () Bool)

(assert (=> d!30596 m!141393))

(assert (=> b!97038 d!30596))

(declare-fun d!30598 () Bool)

(assert (=> d!30598 (= (invariant!0 (currentBit!4824 thiss!1288) (currentByte!4829 thiss!1288) (size!2076 (buf!2422 (_2!4128 lt!140132)))) (and (bvsge (currentBit!4824 thiss!1288) #b00000000000000000000000000000000) (bvslt (currentBit!4824 thiss!1288) #b00000000000000000000000000001000) (bvsge (currentByte!4829 thiss!1288) #b00000000000000000000000000000000) (or (bvslt (currentByte!4829 thiss!1288) (size!2076 (buf!2422 (_2!4128 lt!140132)))) (and (= (currentBit!4824 thiss!1288) #b00000000000000000000000000000000) (= (currentByte!4829 thiss!1288) (size!2076 (buf!2422 (_2!4128 lt!140132))))))))))

(assert (=> b!97038 d!30598))

(declare-fun d!30600 () Bool)

(declare-fun e!63730 () Bool)

(assert (=> d!30600 e!63730))

(declare-fun res!79807 () Bool)

(assert (=> d!30600 (=> (not res!79807) (not e!63730))))

(declare-fun lt!140826 () (_ BitVec 64))

(declare-fun lt!140825 () BitStream!3626)

(assert (=> d!30600 (= res!79807 (= (bvadd lt!140826 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!2076 (buf!2422 lt!140825)) (currentByte!4829 lt!140825) (currentBit!4824 lt!140825))))))

(assert (=> d!30600 (or (not (= (bvand lt!140826 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!140826 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!140826 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!30600 (= lt!140826 (bitIndex!0 (size!2076 (buf!2422 (_1!4133 lt!140153))) (currentByte!4829 (_1!4133 lt!140153)) (currentBit!4824 (_1!4133 lt!140153))))))

(assert (=> d!30600 (= lt!140825 (_2!4128 (moveBitIndex!0 (_1!4133 lt!140153) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!30600 (moveBitIndexPrecond!0 (_1!4133 lt!140153) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!30600 (= (withMovedBitIndex!0 (_1!4133 lt!140153) #b0000000000000000000000000000000000000000000000000000000000000001) lt!140825)))

(declare-fun b!97258 () Bool)

(assert (=> b!97258 (= e!63730 (= (size!2076 (buf!2422 (_1!4133 lt!140153))) (size!2076 (buf!2422 lt!140825))))))

(assert (= (and d!30600 res!79807) b!97258))

(declare-fun m!141395 () Bool)

(assert (=> d!30600 m!141395))

(declare-fun m!141397 () Bool)

(assert (=> d!30600 m!141397))

(declare-fun m!141399 () Bool)

(assert (=> d!30600 m!141399))

(declare-fun m!141401 () Bool)

(assert (=> d!30600 m!141401))

(assert (=> b!97038 d!30600))

(declare-fun d!30602 () Bool)

(assert (=> d!30602 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2076 (buf!2422 (_2!4128 lt!140150)))) ((_ sign_extend 32) (currentByte!4829 (_2!4128 lt!140132))) ((_ sign_extend 32) (currentBit!4824 (_2!4128 lt!140132))) lt!140081) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2076 (buf!2422 (_2!4128 lt!140150)))) ((_ sign_extend 32) (currentByte!4829 (_2!4128 lt!140132))) ((_ sign_extend 32) (currentBit!4824 (_2!4128 lt!140132)))) lt!140081))))

(declare-fun bs!7479 () Bool)

(assert (= bs!7479 d!30602))

(declare-fun m!141403 () Bool)

(assert (=> bs!7479 m!141403))

(assert (=> b!97038 d!30602))

(declare-fun d!30604 () Bool)

(declare-fun e!63731 () Bool)

(assert (=> d!30604 e!63731))

(declare-fun res!79808 () Bool)

(assert (=> d!30604 (=> (not res!79808) (not e!63731))))

(declare-fun lt!140827 () BitStream!3626)

(declare-fun lt!140828 () (_ BitVec 64))

(assert (=> d!30604 (= res!79808 (= (bvadd lt!140828 (bvsub (bitIndex!0 (size!2076 (buf!2422 thiss!1288)) (currentByte!4829 thiss!1288) (currentBit!4824 thiss!1288)) (bitIndex!0 (size!2076 (buf!2422 (_2!4128 lt!140150))) (currentByte!4829 (_2!4128 lt!140150)) (currentBit!4824 (_2!4128 lt!140150))))) (bitIndex!0 (size!2076 (buf!2422 lt!140827)) (currentByte!4829 lt!140827) (currentBit!4824 lt!140827))))))

(assert (=> d!30604 (or (not (= (bvand lt!140828 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bitIndex!0 (size!2076 (buf!2422 thiss!1288)) (currentByte!4829 thiss!1288) (currentBit!4824 thiss!1288)) (bitIndex!0 (size!2076 (buf!2422 (_2!4128 lt!140150))) (currentByte!4829 (_2!4128 lt!140150)) (currentBit!4824 (_2!4128 lt!140150)))) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!140828 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!140828 (bvsub (bitIndex!0 (size!2076 (buf!2422 thiss!1288)) (currentByte!4829 thiss!1288) (currentBit!4824 thiss!1288)) (bitIndex!0 (size!2076 (buf!2422 (_2!4128 lt!140150))) (currentByte!4829 (_2!4128 lt!140150)) (currentBit!4824 (_2!4128 lt!140150))))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!30604 (= lt!140828 (bitIndex!0 (size!2076 (buf!2422 (_2!4133 lt!140153))) (currentByte!4829 (_2!4133 lt!140153)) (currentBit!4824 (_2!4133 lt!140153))))))

(assert (=> d!30604 (= lt!140827 (_2!4128 (moveBitIndex!0 (_2!4133 lt!140153) (bvsub (bitIndex!0 (size!2076 (buf!2422 thiss!1288)) (currentByte!4829 thiss!1288) (currentBit!4824 thiss!1288)) (bitIndex!0 (size!2076 (buf!2422 (_2!4128 lt!140150))) (currentByte!4829 (_2!4128 lt!140150)) (currentBit!4824 (_2!4128 lt!140150)))))))))

(assert (=> d!30604 (moveBitIndexPrecond!0 (_2!4133 lt!140153) (bvsub (bitIndex!0 (size!2076 (buf!2422 thiss!1288)) (currentByte!4829 thiss!1288) (currentBit!4824 thiss!1288)) (bitIndex!0 (size!2076 (buf!2422 (_2!4128 lt!140150))) (currentByte!4829 (_2!4128 lt!140150)) (currentBit!4824 (_2!4128 lt!140150)))))))

(assert (=> d!30604 (= (withMovedBitIndex!0 (_2!4133 lt!140153) (bvsub (bitIndex!0 (size!2076 (buf!2422 thiss!1288)) (currentByte!4829 thiss!1288) (currentBit!4824 thiss!1288)) (bitIndex!0 (size!2076 (buf!2422 (_2!4128 lt!140150))) (currentByte!4829 (_2!4128 lt!140150)) (currentBit!4824 (_2!4128 lt!140150))))) lt!140827)))

(declare-fun b!97259 () Bool)

(assert (=> b!97259 (= e!63731 (= (size!2076 (buf!2422 (_2!4133 lt!140153))) (size!2076 (buf!2422 lt!140827))))))

(assert (= (and d!30604 res!79808) b!97259))

(declare-fun m!141405 () Bool)

(assert (=> d!30604 m!141405))

(declare-fun m!141407 () Bool)

(assert (=> d!30604 m!141407))

(declare-fun m!141409 () Bool)

(assert (=> d!30604 m!141409))

(declare-fun m!141411 () Bool)

(assert (=> d!30604 m!141411))

(assert (=> b!97038 d!30604))

(declare-fun d!30606 () Bool)

(declare-fun lt!140829 () tuple2!7776)

(assert (=> d!30606 (= lt!140829 (readBit!0 (_1!4133 lt!140153)))))

(assert (=> d!30606 (= (readBitPure!0 (_1!4133 lt!140153)) (tuple2!7759 (_2!4140 lt!140829) (_1!4140 lt!140829)))))

(declare-fun bs!7480 () Bool)

(assert (= bs!7480 d!30606))

(declare-fun m!141413 () Bool)

(assert (=> bs!7480 m!141413))

(assert (=> b!97038 d!30606))

(declare-fun d!30608 () Bool)

(assert (=> d!30608 (= (invariant!0 (currentBit!4824 lt!140079) (currentByte!4829 lt!140079) (size!2076 (buf!2422 (_2!4128 lt!140150)))) (and (bvsge (currentBit!4824 lt!140079) #b00000000000000000000000000000000) (bvslt (currentBit!4824 lt!140079) #b00000000000000000000000000001000) (bvsge (currentByte!4829 lt!140079) #b00000000000000000000000000000000) (or (bvslt (currentByte!4829 lt!140079) (size!2076 (buf!2422 (_2!4128 lt!140150)))) (and (= (currentBit!4824 lt!140079) #b00000000000000000000000000000000) (= (currentByte!4829 lt!140079) (size!2076 (buf!2422 (_2!4128 lt!140150))))))))))

(assert (=> b!97038 d!30608))

(declare-fun d!30610 () Bool)

(assert (=> d!30610 (validate_offset_bits!1 ((_ sign_extend 32) (size!2076 (buf!2422 (_2!4128 lt!140150)))) ((_ sign_extend 32) (currentByte!4829 (_2!4128 lt!140132))) ((_ sign_extend 32) (currentBit!4824 (_2!4128 lt!140132))) lt!140081)))

(declare-fun lt!140830 () Unit!5874)

(assert (=> d!30610 (= lt!140830 (choose!9 (_2!4128 lt!140132) (buf!2422 (_2!4128 lt!140150)) lt!140081 (BitStream!3627 (buf!2422 (_2!4128 lt!140150)) (currentByte!4829 (_2!4128 lt!140132)) (currentBit!4824 (_2!4128 lt!140132)))))))

(assert (=> d!30610 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4128 lt!140132) (buf!2422 (_2!4128 lt!140150)) lt!140081) lt!140830)))

(declare-fun bs!7481 () Bool)

(assert (= bs!7481 d!30610))

(assert (=> bs!7481 m!140715))

(declare-fun m!141415 () Bool)

(assert (=> bs!7481 m!141415))

(assert (=> b!97038 d!30610))

(declare-fun d!30612 () Bool)

(declare-fun res!79809 () Bool)

(declare-fun e!63732 () Bool)

(assert (=> d!30612 (=> (not res!79809) (not e!63732))))

(assert (=> d!30612 (= res!79809 (= (size!2076 (buf!2422 (ite c!6132 thiss!1288 lt!140147))) (size!2076 (buf!2422 (ite c!6132 (_2!4128 lt!140134) lt!140147)))))))

(assert (=> d!30612 (= (isPrefixOf!0 (ite c!6132 thiss!1288 lt!140147) (ite c!6132 (_2!4128 lt!140134) lt!140147)) e!63732)))

(declare-fun b!97260 () Bool)

(declare-fun res!79810 () Bool)

(assert (=> b!97260 (=> (not res!79810) (not e!63732))))

(assert (=> b!97260 (= res!79810 (bvsle (bitIndex!0 (size!2076 (buf!2422 (ite c!6132 thiss!1288 lt!140147))) (currentByte!4829 (ite c!6132 thiss!1288 lt!140147)) (currentBit!4824 (ite c!6132 thiss!1288 lt!140147))) (bitIndex!0 (size!2076 (buf!2422 (ite c!6132 (_2!4128 lt!140134) lt!140147))) (currentByte!4829 (ite c!6132 (_2!4128 lt!140134) lt!140147)) (currentBit!4824 (ite c!6132 (_2!4128 lt!140134) lt!140147)))))))

(declare-fun b!97261 () Bool)

(declare-fun e!63733 () Bool)

(assert (=> b!97261 (= e!63732 e!63733)))

(declare-fun res!79811 () Bool)

(assert (=> b!97261 (=> res!79811 e!63733)))

(assert (=> b!97261 (= res!79811 (= (size!2076 (buf!2422 (ite c!6132 thiss!1288 lt!140147))) #b00000000000000000000000000000000))))

(declare-fun b!97262 () Bool)

(assert (=> b!97262 (= e!63733 (arrayBitRangesEq!0 (buf!2422 (ite c!6132 thiss!1288 lt!140147)) (buf!2422 (ite c!6132 (_2!4128 lt!140134) lt!140147)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2076 (buf!2422 (ite c!6132 thiss!1288 lt!140147))) (currentByte!4829 (ite c!6132 thiss!1288 lt!140147)) (currentBit!4824 (ite c!6132 thiss!1288 lt!140147)))))))

(assert (= (and d!30612 res!79809) b!97260))

(assert (= (and b!97260 res!79810) b!97261))

(assert (= (and b!97261 (not res!79811)) b!97262))

(declare-fun m!141417 () Bool)

(assert (=> b!97260 m!141417))

(declare-fun m!141419 () Bool)

(assert (=> b!97260 m!141419))

(assert (=> b!97262 m!141417))

(assert (=> b!97262 m!141417))

(declare-fun m!141421 () Bool)

(assert (=> b!97262 m!141421))

(assert (=> bm!1187 d!30612))

(declare-fun d!30614 () Bool)

(declare-fun res!79812 () Bool)

(declare-fun e!63734 () Bool)

(assert (=> d!30614 (=> (not res!79812) (not e!63734))))

(assert (=> d!30614 (= res!79812 (= (size!2076 (buf!2422 thiss!1288)) (size!2076 (buf!2422 (_2!4128 lt!140099)))))))

(assert (=> d!30614 (= (isPrefixOf!0 thiss!1288 (_2!4128 lt!140099)) e!63734)))

(declare-fun b!97263 () Bool)

(declare-fun res!79813 () Bool)

(assert (=> b!97263 (=> (not res!79813) (not e!63734))))

(assert (=> b!97263 (= res!79813 (bvsle (bitIndex!0 (size!2076 (buf!2422 thiss!1288)) (currentByte!4829 thiss!1288) (currentBit!4824 thiss!1288)) (bitIndex!0 (size!2076 (buf!2422 (_2!4128 lt!140099))) (currentByte!4829 (_2!4128 lt!140099)) (currentBit!4824 (_2!4128 lt!140099)))))))

(declare-fun b!97264 () Bool)

(declare-fun e!63735 () Bool)

(assert (=> b!97264 (= e!63734 e!63735)))

(declare-fun res!79814 () Bool)

(assert (=> b!97264 (=> res!79814 e!63735)))

(assert (=> b!97264 (= res!79814 (= (size!2076 (buf!2422 thiss!1288)) #b00000000000000000000000000000000))))

(declare-fun b!97265 () Bool)

(assert (=> b!97265 (= e!63735 (arrayBitRangesEq!0 (buf!2422 thiss!1288) (buf!2422 (_2!4128 lt!140099)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2076 (buf!2422 thiss!1288)) (currentByte!4829 thiss!1288) (currentBit!4824 thiss!1288))))))

(assert (= (and d!30614 res!79812) b!97263))

(assert (= (and b!97263 res!79813) b!97264))

(assert (= (and b!97264 (not res!79814)) b!97265))

(assert (=> b!97263 m!140617))

(assert (=> b!97263 m!140751))

(assert (=> b!97265 m!140617))

(assert (=> b!97265 m!140617))

(declare-fun m!141423 () Bool)

(assert (=> b!97265 m!141423))

(assert (=> b!97027 d!30614))

(declare-fun d!30616 () Bool)

(declare-fun e!63736 () Bool)

(assert (=> d!30616 e!63736))

(declare-fun res!79816 () Bool)

(assert (=> d!30616 (=> (not res!79816) (not e!63736))))

(declare-fun lt!140832 () (_ BitVec 64))

(declare-fun lt!140836 () (_ BitVec 64))

(declare-fun lt!140833 () (_ BitVec 64))

(assert (=> d!30616 (= res!79816 (= lt!140836 (bvsub lt!140832 lt!140833)))))

(assert (=> d!30616 (or (= (bvand lt!140832 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!140833 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!140832 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!140832 lt!140833) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!30616 (= lt!140833 (remainingBits!0 ((_ sign_extend 32) (size!2076 (buf!2422 (_2!4128 lt!140134)))) ((_ sign_extend 32) (currentByte!4829 (_2!4128 lt!140134))) ((_ sign_extend 32) (currentBit!4824 (_2!4128 lt!140134)))))))

(declare-fun lt!140835 () (_ BitVec 64))

(declare-fun lt!140831 () (_ BitVec 64))

(assert (=> d!30616 (= lt!140832 (bvmul lt!140835 lt!140831))))

(assert (=> d!30616 (or (= lt!140835 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!140831 (bvsdiv (bvmul lt!140835 lt!140831) lt!140835)))))

(assert (=> d!30616 (= lt!140831 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!30616 (= lt!140835 ((_ sign_extend 32) (size!2076 (buf!2422 (_2!4128 lt!140134)))))))

(assert (=> d!30616 (= lt!140836 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4829 (_2!4128 lt!140134))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4824 (_2!4128 lt!140134)))))))

(assert (=> d!30616 (invariant!0 (currentBit!4824 (_2!4128 lt!140134)) (currentByte!4829 (_2!4128 lt!140134)) (size!2076 (buf!2422 (_2!4128 lt!140134))))))

(assert (=> d!30616 (= (bitIndex!0 (size!2076 (buf!2422 (_2!4128 lt!140134))) (currentByte!4829 (_2!4128 lt!140134)) (currentBit!4824 (_2!4128 lt!140134))) lt!140836)))

(declare-fun b!97266 () Bool)

(declare-fun res!79815 () Bool)

(assert (=> b!97266 (=> (not res!79815) (not e!63736))))

(assert (=> b!97266 (= res!79815 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!140836))))

(declare-fun b!97267 () Bool)

(declare-fun lt!140834 () (_ BitVec 64))

(assert (=> b!97267 (= e!63736 (bvsle lt!140836 (bvmul lt!140834 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!97267 (or (= lt!140834 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!140834 #b0000000000000000000000000000000000000000000000000000000000001000) lt!140834)))))

(assert (=> b!97267 (= lt!140834 ((_ sign_extend 32) (size!2076 (buf!2422 (_2!4128 lt!140134)))))))

(assert (= (and d!30616 res!79816) b!97266))

(assert (= (and b!97266 res!79815) b!97267))

(declare-fun m!141425 () Bool)

(assert (=> d!30616 m!141425))

(assert (=> d!30616 m!140983))

(assert (=> b!97030 d!30616))

(assert (=> b!97030 d!30564))

(declare-fun d!30618 () Bool)

(declare-fun e!63737 () Bool)

(assert (=> d!30618 e!63737))

(declare-fun res!79818 () Bool)

(assert (=> d!30618 (=> (not res!79818) (not e!63737))))

(declare-fun lt!140838 () (_ BitVec 64))

(declare-fun lt!140842 () (_ BitVec 64))

(declare-fun lt!140839 () (_ BitVec 64))

(assert (=> d!30618 (= res!79818 (= lt!140842 (bvsub lt!140838 lt!140839)))))

(assert (=> d!30618 (or (= (bvand lt!140838 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!140839 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!140838 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!140838 lt!140839) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!30618 (= lt!140839 (remainingBits!0 ((_ sign_extend 32) (size!2076 (buf!2422 (_2!4128 lt!140099)))) ((_ sign_extend 32) (currentByte!4829 (_2!4128 lt!140099))) ((_ sign_extend 32) (currentBit!4824 (_2!4128 lt!140099)))))))

(declare-fun lt!140841 () (_ BitVec 64))

(declare-fun lt!140837 () (_ BitVec 64))

(assert (=> d!30618 (= lt!140838 (bvmul lt!140841 lt!140837))))

(assert (=> d!30618 (or (= lt!140841 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!140837 (bvsdiv (bvmul lt!140841 lt!140837) lt!140841)))))

(assert (=> d!30618 (= lt!140837 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!30618 (= lt!140841 ((_ sign_extend 32) (size!2076 (buf!2422 (_2!4128 lt!140099)))))))

(assert (=> d!30618 (= lt!140842 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4829 (_2!4128 lt!140099))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4824 (_2!4128 lt!140099)))))))

(assert (=> d!30618 (invariant!0 (currentBit!4824 (_2!4128 lt!140099)) (currentByte!4829 (_2!4128 lt!140099)) (size!2076 (buf!2422 (_2!4128 lt!140099))))))

(assert (=> d!30618 (= (bitIndex!0 (size!2076 (buf!2422 (_2!4128 lt!140099))) (currentByte!4829 (_2!4128 lt!140099)) (currentBit!4824 (_2!4128 lt!140099))) lt!140842)))

(declare-fun b!97268 () Bool)

(declare-fun res!79817 () Bool)

(assert (=> b!97268 (=> (not res!79817) (not e!63737))))

(assert (=> b!97268 (= res!79817 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!140842))))

(declare-fun b!97269 () Bool)

(declare-fun lt!140840 () (_ BitVec 64))

(assert (=> b!97269 (= e!63737 (bvsle lt!140842 (bvmul lt!140840 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!97269 (or (= lt!140840 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!140840 #b0000000000000000000000000000000000000000000000000000000000001000) lt!140840)))))

(assert (=> b!97269 (= lt!140840 ((_ sign_extend 32) (size!2076 (buf!2422 (_2!4128 lt!140099)))))))

(assert (= (and d!30618 res!79818) b!97268))

(assert (= (and b!97268 res!79817) b!97269))

(declare-fun m!141427 () Bool)

(assert (=> d!30618 m!141427))

(declare-fun m!141429 () Bool)

(assert (=> d!30618 m!141429))

(assert (=> b!97031 d!30618))

(assert (=> b!97031 d!30564))

(declare-fun d!30620 () Bool)

(assert (=> d!30620 (isPrefixOf!0 lt!140147 lt!140147)))

(declare-fun lt!140845 () Unit!5874)

(declare-fun choose!11 (BitStream!3626) Unit!5874)

(assert (=> d!30620 (= lt!140845 (choose!11 lt!140147))))

(assert (=> d!30620 (= (lemmaIsPrefixRefl!0 lt!140147) lt!140845)))

(declare-fun bs!7483 () Bool)

(assert (= bs!7483 d!30620))

(declare-fun m!141431 () Bool)

(assert (=> bs!7483 m!141431))

(declare-fun m!141433 () Bool)

(assert (=> bs!7483 m!141433))

(assert (=> b!97029 d!30620))

(declare-fun d!30622 () Bool)

(assert (=> d!30622 (= (invariant!0 (currentBit!4824 thiss!1288) (currentByte!4829 thiss!1288) (size!2076 (buf!2422 thiss!1288))) (and (bvsge (currentBit!4824 thiss!1288) #b00000000000000000000000000000000) (bvslt (currentBit!4824 thiss!1288) #b00000000000000000000000000001000) (bvsge (currentByte!4829 thiss!1288) #b00000000000000000000000000000000) (or (bvslt (currentByte!4829 thiss!1288) (size!2076 (buf!2422 thiss!1288))) (and (= (currentBit!4824 thiss!1288) #b00000000000000000000000000000000) (= (currentByte!4829 thiss!1288) (size!2076 (buf!2422 thiss!1288)))))))))

(assert (=> d!30420 d!30622))

(declare-fun d!30624 () Bool)

(declare-fun e!63738 () Bool)

(assert (=> d!30624 e!63738))

(declare-fun res!79820 () Bool)

(assert (=> d!30624 (=> (not res!79820) (not e!63738))))

(declare-fun lt!140851 () (_ BitVec 64))

(declare-fun lt!140847 () (_ BitVec 64))

(declare-fun lt!140848 () (_ BitVec 64))

(assert (=> d!30624 (= res!79820 (= lt!140851 (bvsub lt!140847 lt!140848)))))

(assert (=> d!30624 (or (= (bvand lt!140847 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!140848 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!140847 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!140847 lt!140848) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!30624 (= lt!140848 (remainingBits!0 ((_ sign_extend 32) (size!2076 (buf!2422 (_1!4131 lt!140100)))) ((_ sign_extend 32) (currentByte!4829 (_1!4131 lt!140100))) ((_ sign_extend 32) (currentBit!4824 (_1!4131 lt!140100)))))))

(declare-fun lt!140850 () (_ BitVec 64))

(declare-fun lt!140846 () (_ BitVec 64))

(assert (=> d!30624 (= lt!140847 (bvmul lt!140850 lt!140846))))

(assert (=> d!30624 (or (= lt!140850 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!140846 (bvsdiv (bvmul lt!140850 lt!140846) lt!140850)))))

(assert (=> d!30624 (= lt!140846 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!30624 (= lt!140850 ((_ sign_extend 32) (size!2076 (buf!2422 (_1!4131 lt!140100)))))))

(assert (=> d!30624 (= lt!140851 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4829 (_1!4131 lt!140100))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4824 (_1!4131 lt!140100)))))))

(assert (=> d!30624 (invariant!0 (currentBit!4824 (_1!4131 lt!140100)) (currentByte!4829 (_1!4131 lt!140100)) (size!2076 (buf!2422 (_1!4131 lt!140100))))))

(assert (=> d!30624 (= (bitIndex!0 (size!2076 (buf!2422 (_1!4131 lt!140100))) (currentByte!4829 (_1!4131 lt!140100)) (currentBit!4824 (_1!4131 lt!140100))) lt!140851)))

(declare-fun b!97270 () Bool)

(declare-fun res!79819 () Bool)

(assert (=> b!97270 (=> (not res!79819) (not e!63738))))

(assert (=> b!97270 (= res!79819 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!140851))))

(declare-fun b!97271 () Bool)

(declare-fun lt!140849 () (_ BitVec 64))

(assert (=> b!97271 (= e!63738 (bvsle lt!140851 (bvmul lt!140849 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!97271 (or (= lt!140849 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!140849 #b0000000000000000000000000000000000000000000000000000000000001000) lt!140849)))))

(assert (=> b!97271 (= lt!140849 ((_ sign_extend 32) (size!2076 (buf!2422 (_1!4131 lt!140100)))))))

(assert (= (and d!30624 res!79820) b!97270))

(assert (= (and b!97270 res!79819) b!97271))

(declare-fun m!141435 () Bool)

(assert (=> d!30624 m!141435))

(declare-fun m!141437 () Bool)

(assert (=> d!30624 m!141437))

(assert (=> b!97032 d!30624))

(assert (=> b!97032 d!30616))

(push 1)

