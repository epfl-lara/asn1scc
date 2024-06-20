; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19408 () Bool)

(assert start!19408)

(declare-fun b!96926 () Bool)

(declare-fun e!63542 () Bool)

(declare-fun e!63541 () Bool)

(assert (=> b!96926 (= e!63542 e!63541)))

(declare-fun res!79549 () Bool)

(assert (=> b!96926 (=> (not res!79549) (not e!63541))))

(declare-datatypes ((array!4534 0))(
  ( (array!4535 (arr!2667 (Array (_ BitVec 32) (_ BitVec 8))) (size!2074 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3622 0))(
  ( (BitStream!3623 (buf!2420 array!4534) (currentByte!4827 (_ BitVec 32)) (currentBit!4822 (_ BitVec 32))) )
))
(declare-fun thiss!1288 () BitStream!3622)

(declare-datatypes ((Unit!5870 0))(
  ( (Unit!5871) )
))
(declare-datatypes ((tuple2!7748 0))(
  ( (tuple2!7749 (_1!4126 Unit!5870) (_2!4126 BitStream!3622)) )
))
(declare-fun lt!139880 () tuple2!7748)

(assert (=> b!96926 (= res!79549 (= (size!2074 (buf!2420 thiss!1288)) (size!2074 (buf!2420 (_2!4126 lt!139880)))))))

(declare-fun v!196 () (_ BitVec 64))

(declare-fun nBits!388 () (_ BitVec 32))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3622 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!7748)

(assert (=> b!96926 (= lt!139880 (appendNLeastSignificantBitsLoop!0 thiss!1288 v!196 nBits!388 #b00000000000000000000000000000000))))

(declare-fun b!96927 () Bool)

(declare-fun res!79548 () Bool)

(assert (=> b!96927 (=> (not res!79548) (not e!63542))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!96927 (= res!79548 (= (bvand v!196 (onesLSBLong!0 nBits!388)) v!196))))

(declare-fun b!96928 () Bool)

(declare-fun e!63540 () Bool)

(declare-fun array_inv!1876 (array!4534) Bool)

(assert (=> b!96928 (= e!63540 (array_inv!1876 (buf!2420 thiss!1288)))))

(declare-fun b!96929 () Bool)

(declare-fun res!79546 () Bool)

(assert (=> b!96929 (=> (not res!79546) (not e!63542))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!96929 (= res!79546 (validate_offset_bits!1 ((_ sign_extend 32) (size!2074 (buf!2420 thiss!1288))) ((_ sign_extend 32) (currentByte!4827 thiss!1288)) ((_ sign_extend 32) (currentBit!4822 thiss!1288)) ((_ sign_extend 32) nBits!388)))))

(declare-fun res!79547 () Bool)

(assert (=> start!19408 (=> (not res!79547) (not e!63542))))

(assert (=> start!19408 (= res!79547 (and (bvsge nBits!388 #b00000000000000000000000000000000) (bvsle nBits!388 #b00000000000000000000000001000000)))))

(assert (=> start!19408 e!63542))

(assert (=> start!19408 true))

(declare-fun inv!12 (BitStream!3622) Bool)

(assert (=> start!19408 (and (inv!12 thiss!1288) e!63540)))

(declare-fun b!96930 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!96930 (= e!63541 (not (invariant!0 (currentBit!4822 (_2!4126 lt!139880)) (currentByte!4827 (_2!4126 lt!139880)) (size!2074 (buf!2420 (_2!4126 lt!139880))))))))

(assert (= (and start!19408 res!79547) b!96929))

(assert (= (and b!96929 res!79546) b!96927))

(assert (= (and b!96927 res!79548) b!96926))

(assert (= (and b!96926 res!79549) b!96930))

(assert (= start!19408 b!96928))

(declare-fun m!140553 () Bool)

(assert (=> b!96927 m!140553))

(declare-fun m!140555 () Bool)

(assert (=> start!19408 m!140555))

(declare-fun m!140557 () Bool)

(assert (=> b!96926 m!140557))

(declare-fun m!140559 () Bool)

(assert (=> b!96930 m!140559))

(declare-fun m!140561 () Bool)

(assert (=> b!96928 m!140561))

(declare-fun m!140563 () Bool)

(assert (=> b!96929 m!140563))

(push 1)

(assert (not b!96926))

(assert (not b!96930))

(assert (not b!96928))

(assert (not start!19408))

(assert (not b!96929))

(assert (not b!96927))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!30414 () Bool)

(assert (=> d!30414 (= (inv!12 thiss!1288) (invariant!0 (currentBit!4822 thiss!1288) (currentByte!4827 thiss!1288) (size!2074 (buf!2420 thiss!1288))))))

(declare-fun bs!7438 () Bool)

(assert (= bs!7438 d!30414))

(declare-fun m!140589 () Bool)

(assert (=> bs!7438 m!140589))

(assert (=> start!19408 d!30414))

(declare-fun d!30418 () Bool)

(assert (=> d!30418 (= (invariant!0 (currentBit!4822 (_2!4126 lt!139880)) (currentByte!4827 (_2!4126 lt!139880)) (size!2074 (buf!2420 (_2!4126 lt!139880)))) (and (bvsge (currentBit!4822 (_2!4126 lt!139880)) #b00000000000000000000000000000000) (bvslt (currentBit!4822 (_2!4126 lt!139880)) #b00000000000000000000000000001000) (bvsge (currentByte!4827 (_2!4126 lt!139880)) #b00000000000000000000000000000000) (or (bvslt (currentByte!4827 (_2!4126 lt!139880)) (size!2074 (buf!2420 (_2!4126 lt!139880)))) (and (= (currentBit!4822 (_2!4126 lt!139880)) #b00000000000000000000000000000000) (= (currentByte!4827 (_2!4126 lt!139880)) (size!2074 (buf!2420 (_2!4126 lt!139880))))))))))

(assert (=> b!96930 d!30418))

(declare-fun d!30424 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!30424 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2074 (buf!2420 thiss!1288))) ((_ sign_extend 32) (currentByte!4827 thiss!1288)) ((_ sign_extend 32) (currentBit!4822 thiss!1288)) ((_ sign_extend 32) nBits!388)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2074 (buf!2420 thiss!1288))) ((_ sign_extend 32) (currentByte!4827 thiss!1288)) ((_ sign_extend 32) (currentBit!4822 thiss!1288))) ((_ sign_extend 32) nBits!388)))))

(declare-fun bs!7440 () Bool)

(assert (= bs!7440 d!30424))

(declare-fun m!140593 () Bool)

(assert (=> bs!7440 m!140593))

(assert (=> b!96929 d!30424))

(declare-fun d!30426 () Bool)

(assert (=> d!30426 (= (array_inv!1876 (buf!2420 thiss!1288)) (bvsge (size!2074 (buf!2420 thiss!1288)) #b00000000000000000000000000000000))))

(assert (=> b!96928 d!30426))

(declare-fun d!30430 () Bool)

(assert (=> d!30430 (= (onesLSBLong!0 nBits!388) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!388))))))

(assert (=> b!96927 d!30430))

(declare-fun b!97013 () Bool)

(declare-fun e!63601 () Bool)

(declare-fun lt!140076 () (_ BitVec 64))

(assert (=> b!97013 (= e!63601 (validate_offset_bits!1 ((_ sign_extend 32) (size!2074 (buf!2420 thiss!1288))) ((_ sign_extend 32) (currentByte!4827 thiss!1288)) ((_ sign_extend 32) (currentBit!4822 thiss!1288)) lt!140076))))

(declare-fun e!63598 () Bool)

(declare-datatypes ((tuple2!7754 0))(
  ( (tuple2!7755 (_1!4129 BitStream!3622) (_2!4129 BitStream!3622)) )
))
(declare-fun lt!140146 () tuple2!7754)

(declare-fun b!97014 () Bool)

(declare-datatypes ((tuple2!7756 0))(
  ( (tuple2!7757 (_1!4130 BitStream!3622) (_2!4130 (_ BitVec 64))) )
))
(declare-fun lt!140096 () tuple2!7756)

(assert (=> b!97014 (= e!63598 (and (= (_2!4130 lt!140096) v!196) (= (_1!4130 lt!140096) (_2!4129 lt!140146))))))

(declare-fun lt!140122 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!3622 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!7756)

(assert (=> b!97014 (= lt!140096 (readNLeastSignificantBitsLoopPure!0 (_1!4129 lt!140146) nBits!388 #b00000000000000000000000000000000 lt!140122))))

(declare-fun lt!140107 () Unit!5870)

(declare-fun lt!140080 () Unit!5870)

(assert (=> b!97014 (= lt!140107 lt!140080)))

(declare-fun lt!140067 () tuple2!7748)

(assert (=> b!97014 (validate_offset_bits!1 ((_ sign_extend 32) (size!2074 (buf!2420 (_2!4126 lt!140067)))) ((_ sign_extend 32) (currentByte!4827 thiss!1288)) ((_ sign_extend 32) (currentBit!4822 thiss!1288)) lt!140076)))

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!3622 array!4534 (_ BitVec 64)) Unit!5870)

(assert (=> b!97014 (= lt!140080 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1288 (buf!2420 (_2!4126 lt!140067)) lt!140076))))

(assert (=> b!97014 e!63601))

(declare-fun res!79616 () Bool)

(assert (=> b!97014 (=> (not res!79616) (not e!63601))))

(assert (=> b!97014 (= res!79616 (and (= (size!2074 (buf!2420 thiss!1288)) (size!2074 (buf!2420 (_2!4126 lt!140067)))) (bvsge lt!140076 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!97014 (= lt!140076 ((_ sign_extend 32) (bvsub nBits!388 #b00000000000000000000000000000000)))))

(assert (=> b!97014 (or (= (bvand nBits!388 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand nBits!388 #b10000000000000000000000000000000) (bvand (bvsub nBits!388 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(assert (=> b!97014 (= lt!140122 (bvand v!196 (bvnot (onesLSBLong!0 (bvsub nBits!388 #b00000000000000000000000000000000)))))))

(assert (=> b!97014 (or (= (bvand nBits!388 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand nBits!388 #b10000000000000000000000000000000) (bvand (bvsub nBits!388 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(declare-fun reader!0 (BitStream!3622 BitStream!3622) tuple2!7754)

(assert (=> b!97014 (= lt!140146 (reader!0 thiss!1288 (_2!4126 lt!140067)))))

(declare-fun c!6130 () Bool)

(declare-fun call!1190 () Bool)

(declare-fun lt!140114 () tuple2!7748)

(declare-fun bm!1186 () Bool)

(declare-fun lt!140112 () BitStream!3622)

(declare-fun isPrefixOf!0 (BitStream!3622 BitStream!3622) Bool)

(assert (=> bm!1186 (= call!1190 (isPrefixOf!0 (ite c!6130 thiss!1288 lt!140112) (ite c!6130 (_2!4126 lt!140114) lt!140112)))))

(declare-fun b!97015 () Bool)

(declare-fun e!63604 () (_ BitVec 64))

(assert (=> b!97015 (= e!63604 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!388 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!97017 () Bool)

(declare-fun res!79610 () Bool)

(assert (=> b!97017 (=> (not res!79610) (not e!63598))))

(declare-fun lt!140068 () (_ BitVec 64))

(declare-fun lt!140130 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!97017 (= res!79610 (= (bitIndex!0 (size!2074 (buf!2420 (_2!4126 lt!140067))) (currentByte!4827 (_2!4126 lt!140067)) (currentBit!4822 (_2!4126 lt!140067))) (bvadd lt!140130 lt!140068)))))

(assert (=> b!97017 (or (not (= (bvand lt!140130 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!140068 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!140130 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!140130 lt!140068) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!97017 (= lt!140068 ((_ sign_extend 32) (bvsub nBits!388 #b00000000000000000000000000000000)))))

(assert (=> b!97017 (or (= (bvand nBits!388 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand nBits!388 #b10000000000000000000000000000000) (bvand (bvsub nBits!388 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(assert (=> b!97017 (= lt!140130 (bitIndex!0 (size!2074 (buf!2420 thiss!1288)) (currentByte!4827 thiss!1288) (currentBit!4822 thiss!1288)))))

(declare-fun b!97018 () Bool)

(declare-datatypes ((tuple2!7760 0))(
  ( (tuple2!7761 (_1!4132 BitStream!3622) (_2!4132 Bool)) )
))
(declare-fun lt!140091 () tuple2!7760)

(declare-fun lt!140090 () tuple2!7748)

(declare-fun readBitPure!0 (BitStream!3622) tuple2!7760)

(declare-fun readerFrom!0 (BitStream!3622 (_ BitVec 32) (_ BitVec 32)) BitStream!3622)

(assert (=> b!97018 (= lt!140091 (readBitPure!0 (readerFrom!0 (_2!4126 lt!140090) (currentBit!4822 thiss!1288) (currentByte!4827 thiss!1288))))))

(declare-fun res!79620 () Bool)

(declare-fun lt!140071 () Bool)

(assert (=> b!97018 (= res!79620 (and (= (_2!4132 lt!140091) lt!140071) (= (_1!4132 lt!140091) (_2!4126 lt!140090))))))

(declare-fun e!63597 () Bool)

(assert (=> b!97018 (=> (not res!79620) (not e!63597))))

(declare-fun e!63605 () Bool)

(assert (=> b!97018 (= e!63605 e!63597)))

(declare-fun b!97019 () Bool)

(declare-fun e!63607 () tuple2!7748)

(declare-fun lt!140073 () Unit!5870)

(assert (=> b!97019 (= e!63607 (tuple2!7749 lt!140073 thiss!1288))))

(assert (=> b!97019 (= lt!140112 thiss!1288)))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!3622) Unit!5870)

(assert (=> b!97019 (= lt!140073 (lemmaIsPrefixRefl!0 lt!140112))))

(assert (=> b!97019 call!1190))

(declare-fun b!97020 () Bool)

(declare-fun res!79614 () Bool)

(assert (=> b!97020 (= res!79614 (isPrefixOf!0 thiss!1288 (_2!4126 lt!140090)))))

(assert (=> b!97020 (=> (not res!79614) (not e!63605))))

(declare-fun b!97021 () Bool)

(declare-fun Unit!5876 () Unit!5870)

(assert (=> b!97021 (= e!63607 (tuple2!7749 Unit!5876 (_2!4126 lt!140114)))))

(assert (=> b!97021 (= lt!140071 (not (= (bvand v!196 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!388 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun appendBit!0 (BitStream!3622 Bool) tuple2!7748)

(assert (=> b!97021 (= lt!140090 (appendBit!0 thiss!1288 lt!140071))))

(declare-fun res!79612 () Bool)

(assert (=> b!97021 (= res!79612 (= (size!2074 (buf!2420 thiss!1288)) (size!2074 (buf!2420 (_2!4126 lt!140090)))))))

(assert (=> b!97021 (=> (not res!79612) (not e!63605))))

(assert (=> b!97021 e!63605))

(declare-fun lt!140072 () tuple2!7748)

(assert (=> b!97021 (= lt!140072 lt!140090)))

(assert (=> b!97021 (= lt!140114 (appendNLeastSignificantBitsLoop!0 (_2!4126 lt!140072) v!196 nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!140083 () Unit!5870)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3622 BitStream!3622 BitStream!3622) Unit!5870)

(assert (=> b!97021 (= lt!140083 (lemmaIsPrefixTransitive!0 thiss!1288 (_2!4126 lt!140072) (_2!4126 lt!140114)))))

(assert (=> b!97021 call!1190))

(declare-fun lt!140145 () Unit!5870)

(assert (=> b!97021 (= lt!140145 lt!140083)))

(assert (=> b!97021 (invariant!0 (currentBit!4822 thiss!1288) (currentByte!4827 thiss!1288) (size!2074 (buf!2420 (_2!4126 lt!140072))))))

(declare-fun lt!140082 () BitStream!3622)

(assert (=> b!97021 (= lt!140082 (BitStream!3623 (buf!2420 (_2!4126 lt!140072)) (currentByte!4827 thiss!1288) (currentBit!4822 thiss!1288)))))

(assert (=> b!97021 (invariant!0 (currentBit!4822 lt!140082) (currentByte!4827 lt!140082) (size!2074 (buf!2420 (_2!4126 lt!140114))))))

(declare-fun lt!140135 () BitStream!3622)

(assert (=> b!97021 (= lt!140135 (BitStream!3623 (buf!2420 (_2!4126 lt!140114)) (currentByte!4827 lt!140082) (currentBit!4822 lt!140082)))))

(declare-fun lt!140075 () tuple2!7760)

(assert (=> b!97021 (= lt!140075 (readBitPure!0 lt!140082))))

(declare-fun lt!140089 () tuple2!7760)

(assert (=> b!97021 (= lt!140089 (readBitPure!0 lt!140135))))

(declare-fun lt!140121 () Unit!5870)

(declare-fun readBitPrefixLemma!0 (BitStream!3622 BitStream!3622) Unit!5870)

(assert (=> b!97021 (= lt!140121 (readBitPrefixLemma!0 lt!140082 (_2!4126 lt!140114)))))

(declare-fun res!79615 () Bool)

(assert (=> b!97021 (= res!79615 (= (bitIndex!0 (size!2074 (buf!2420 (_1!4132 lt!140075))) (currentByte!4827 (_1!4132 lt!140075)) (currentBit!4822 (_1!4132 lt!140075))) (bitIndex!0 (size!2074 (buf!2420 (_1!4132 lt!140089))) (currentByte!4827 (_1!4132 lt!140089)) (currentBit!4822 (_1!4132 lt!140089)))))))

(declare-fun e!63596 () Bool)

(assert (=> b!97021 (=> (not res!79615) (not e!63596))))

(assert (=> b!97021 e!63596))

(declare-fun lt!140131 () Unit!5870)

(assert (=> b!97021 (= lt!140131 lt!140121)))

(declare-fun lt!140124 () tuple2!7754)

(assert (=> b!97021 (= lt!140124 (reader!0 thiss!1288 (_2!4126 lt!140114)))))

(declare-fun lt!140117 () tuple2!7754)

(assert (=> b!97021 (= lt!140117 (reader!0 (_2!4126 lt!140072) (_2!4126 lt!140114)))))

(declare-fun lt!140139 () tuple2!7760)

(assert (=> b!97021 (= lt!140139 (readBitPure!0 (_1!4129 lt!140124)))))

(assert (=> b!97021 (= (_2!4132 lt!140139) lt!140071)))

(declare-fun lt!140110 () Unit!5870)

(declare-fun Unit!5877 () Unit!5870)

(assert (=> b!97021 (= lt!140110 Unit!5877)))

(declare-fun lt!140094 () (_ BitVec 64))

(assert (=> b!97021 (= lt!140094 (bvand v!196 (bvnot (onesLSBLong!0 (bvsub nBits!388 #b00000000000000000000000000000000)))))))

(declare-fun lt!140101 () (_ BitVec 64))

(assert (=> b!97021 (= lt!140101 ((_ sign_extend 32) (bvsub nBits!388 #b00000000000000000000000000000000)))))

(declare-fun lt!140093 () Unit!5870)

(assert (=> b!97021 (= lt!140093 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1288 (buf!2420 (_2!4126 lt!140114)) lt!140101))))

(assert (=> b!97021 (validate_offset_bits!1 ((_ sign_extend 32) (size!2074 (buf!2420 (_2!4126 lt!140114)))) ((_ sign_extend 32) (currentByte!4827 thiss!1288)) ((_ sign_extend 32) (currentBit!4822 thiss!1288)) lt!140101)))

(declare-fun lt!140109 () Unit!5870)

(assert (=> b!97021 (= lt!140109 lt!140093)))

(declare-fun lt!140077 () tuple2!7756)

(assert (=> b!97021 (= lt!140077 (readNLeastSignificantBitsLoopPure!0 (_1!4129 lt!140124) nBits!388 #b00000000000000000000000000000000 lt!140094))))

(declare-fun lt!140085 () (_ BitVec 64))

(assert (=> b!97021 (= lt!140085 ((_ sign_extend 32) (bvsub (bvsub nBits!388 #b00000000000000000000000000000000) #b00000000000000000000000000000001)))))

(declare-fun lt!140105 () Unit!5870)

(assert (=> b!97021 (= lt!140105 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4126 lt!140072) (buf!2420 (_2!4126 lt!140114)) lt!140085))))

(assert (=> b!97021 (validate_offset_bits!1 ((_ sign_extend 32) (size!2074 (buf!2420 (_2!4126 lt!140114)))) ((_ sign_extend 32) (currentByte!4827 (_2!4126 lt!140072))) ((_ sign_extend 32) (currentBit!4822 (_2!4126 lt!140072))) lt!140085)))

(declare-fun lt!140070 () Unit!5870)

(assert (=> b!97021 (= lt!140070 lt!140105)))

(declare-fun lt!140069 () tuple2!7756)

(assert (=> b!97021 (= lt!140069 (readNLeastSignificantBitsLoopPure!0 (_1!4129 lt!140117) nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvor lt!140094 (ite (_2!4132 lt!140139) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!388 #b00000000000000000000000000000001) #b00000000000000000000000000000000))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!140074 () tuple2!7756)

(assert (=> b!97021 (= lt!140074 (readNLeastSignificantBitsLoopPure!0 (_1!4129 lt!140124) nBits!388 #b00000000000000000000000000000000 lt!140094))))

(declare-fun c!6129 () Bool)

(assert (=> b!97021 (= c!6129 (_2!4132 (readBitPure!0 (_1!4129 lt!140124))))))

(declare-fun lt!140098 () tuple2!7756)

(declare-fun withMovedBitIndex!0 (BitStream!3622 (_ BitVec 64)) BitStream!3622)

(assert (=> b!97021 (= lt!140098 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4129 lt!140124) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvor lt!140094 e!63604)))))

(declare-fun lt!140144 () Unit!5870)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!3622 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!5870)

(assert (=> b!97021 (= lt!140144 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4129 lt!140124) nBits!388 #b00000000000000000000000000000000 lt!140094))))

(assert (=> b!97021 (and (= (_2!4130 lt!140074) (_2!4130 lt!140098)) (= (_1!4130 lt!140074) (_1!4130 lt!140098)))))

(declare-fun lt!140119 () Unit!5870)

(assert (=> b!97021 (= lt!140119 lt!140144)))

(assert (=> b!97021 (= (_1!4129 lt!140124) (withMovedBitIndex!0 (_2!4129 lt!140124) (bvsub (bitIndex!0 (size!2074 (buf!2420 thiss!1288)) (currentByte!4827 thiss!1288) (currentBit!4822 thiss!1288)) (bitIndex!0 (size!2074 (buf!2420 (_2!4126 lt!140114))) (currentByte!4827 (_2!4126 lt!140114)) (currentBit!4822 (_2!4126 lt!140114))))))))

(declare-fun lt!140128 () Unit!5870)

(declare-fun Unit!5879 () Unit!5870)

(assert (=> b!97021 (= lt!140128 Unit!5879)))

(assert (=> b!97021 (= (_1!4129 lt!140117) (withMovedBitIndex!0 (_2!4129 lt!140117) (bvsub (bitIndex!0 (size!2074 (buf!2420 (_2!4126 lt!140072))) (currentByte!4827 (_2!4126 lt!140072)) (currentBit!4822 (_2!4126 lt!140072))) (bitIndex!0 (size!2074 (buf!2420 (_2!4126 lt!140114))) (currentByte!4827 (_2!4126 lt!140114)) (currentBit!4822 (_2!4126 lt!140114))))))))

(declare-fun lt!140078 () Unit!5870)

(declare-fun Unit!5880 () Unit!5870)

(assert (=> b!97021 (= lt!140078 Unit!5880)))

(assert (=> b!97021 (= (bitIndex!0 (size!2074 (buf!2420 thiss!1288)) (currentByte!4827 thiss!1288) (currentBit!4822 thiss!1288)) (bvsub (bitIndex!0 (size!2074 (buf!2420 (_2!4126 lt!140072))) (currentByte!4827 (_2!4126 lt!140072)) (currentBit!4822 (_2!4126 lt!140072))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!140126 () Unit!5870)

(declare-fun Unit!5881 () Unit!5870)

(assert (=> b!97021 (= lt!140126 Unit!5881)))

(assert (=> b!97021 (= (_2!4130 lt!140077) (_2!4130 lt!140069))))

(declare-fun lt!140103 () Unit!5870)

(declare-fun Unit!5883 () Unit!5870)

(assert (=> b!97021 (= lt!140103 Unit!5883)))

(assert (=> b!97021 (= (_1!4130 lt!140077) (_2!4129 lt!140124))))

(declare-fun d!30432 () Bool)

(assert (=> d!30432 e!63598))

(declare-fun res!79618 () Bool)

(assert (=> d!30432 (=> (not res!79618) (not e!63598))))

(assert (=> d!30432 (= res!79618 (= (size!2074 (buf!2420 thiss!1288)) (size!2074 (buf!2420 (_2!4126 lt!140067)))))))

(assert (=> d!30432 (= lt!140067 e!63607)))

(assert (=> d!30432 (= c!6130 (bvslt #b00000000000000000000000000000000 nBits!388))))

(assert (=> d!30432 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 nBits!388) (bvsle nBits!388 #b00000000000000000000000001000000))))

(assert (=> d!30432 (= (appendNLeastSignificantBitsLoop!0 thiss!1288 v!196 nBits!388 #b00000000000000000000000000000000) lt!140067)))

(declare-fun b!97016 () Bool)

(assert (=> b!97016 (= e!63597 (= (bitIndex!0 (size!2074 (buf!2420 (_1!4132 lt!140091))) (currentByte!4827 (_1!4132 lt!140091)) (currentBit!4822 (_1!4132 lt!140091))) (bitIndex!0 (size!2074 (buf!2420 (_2!4126 lt!140090))) (currentByte!4827 (_2!4126 lt!140090)) (currentBit!4822 (_2!4126 lt!140090)))))))

(declare-fun b!97022 () Bool)

(declare-fun res!79623 () Bool)

(assert (=> b!97022 (=> (not res!79623) (not e!63598))))

(assert (=> b!97022 (= res!79623 (isPrefixOf!0 thiss!1288 (_2!4126 lt!140067)))))

(declare-fun b!97023 () Bool)

(declare-fun res!79619 () Bool)

(assert (=> b!97023 (= res!79619 (= (bitIndex!0 (size!2074 (buf!2420 (_2!4126 lt!140090))) (currentByte!4827 (_2!4126 lt!140090)) (currentBit!4822 (_2!4126 lt!140090))) (bvadd (bitIndex!0 (size!2074 (buf!2420 thiss!1288)) (currentByte!4827 thiss!1288) (currentBit!4822 thiss!1288)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!97023 (=> (not res!79619) (not e!63605))))

(declare-fun b!97024 () Bool)

(assert (=> b!97024 (= e!63596 (= (_2!4132 lt!140075) (_2!4132 lt!140089)))))

(declare-fun b!97025 () Bool)

(assert (=> b!97025 (= e!63604 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (= (and d!30432 c!6130) b!97021))

(assert (= (and d!30432 (not c!6130)) b!97019))

(assert (= (and b!97021 res!79612) b!97023))

(assert (= (and b!97023 res!79619) b!97020))

(assert (= (and b!97020 res!79614) b!97018))

(assert (= (and b!97018 res!79620) b!97016))

(assert (= (and b!97021 res!79615) b!97024))

(assert (= (and b!97021 c!6129) b!97015))

(assert (= (and b!97021 (not c!6129)) b!97025))

(assert (= (or b!97021 b!97019) bm!1186))

(assert (= (and d!30432 res!79618) b!97017))

(assert (= (and b!97017 res!79610) b!97022))

(assert (= (and b!97022 res!79623) b!97014))

(assert (= (and b!97014 res!79616) b!97013))

(declare-fun m!140603 () Bool)

(assert (=> b!97017 m!140603))

(declare-fun m!140607 () Bool)

(assert (=> b!97017 m!140607))

(declare-fun m!140609 () Bool)

(assert (=> b!97021 m!140609))

(declare-fun m!140615 () Bool)

(assert (=> b!97021 m!140615))

(declare-fun m!140621 () Bool)

(assert (=> b!97021 m!140621))

(declare-fun m!140625 () Bool)

(assert (=> b!97021 m!140625))

(declare-fun m!140627 () Bool)

(assert (=> b!97021 m!140627))

(declare-fun m!140631 () Bool)

(assert (=> b!97021 m!140631))

(declare-fun m!140635 () Bool)

(assert (=> b!97021 m!140635))

(declare-fun m!140639 () Bool)

(assert (=> b!97021 m!140639))

(declare-fun m!140643 () Bool)

(assert (=> b!97021 m!140643))

(declare-fun m!140645 () Bool)

(assert (=> b!97021 m!140645))

(assert (=> b!97021 m!140607))

(declare-fun m!140649 () Bool)

(assert (=> b!97021 m!140649))

(assert (=> b!97021 m!140625))

(declare-fun m!140655 () Bool)

(assert (=> b!97021 m!140655))

(declare-fun m!140661 () Bool)

(assert (=> b!97021 m!140661))

(declare-fun m!140665 () Bool)

(assert (=> b!97021 m!140665))

(declare-fun m!140677 () Bool)

(assert (=> b!97021 m!140677))

(declare-fun m!140681 () Bool)

(assert (=> b!97021 m!140681))

(declare-fun m!140685 () Bool)

(assert (=> b!97021 m!140685))

(declare-fun m!140687 () Bool)

(assert (=> b!97021 m!140687))

(declare-fun m!140689 () Bool)

(assert (=> b!97021 m!140689))

(declare-fun m!140691 () Bool)

(assert (=> b!97021 m!140691))

(declare-fun m!140695 () Bool)

(assert (=> b!97021 m!140695))

(declare-fun m!140697 () Bool)

(assert (=> b!97021 m!140697))

(declare-fun m!140701 () Bool)

(assert (=> b!97021 m!140701))

(declare-fun m!140709 () Bool)

(assert (=> b!97021 m!140709))

(declare-fun m!140711 () Bool)

(assert (=> b!97021 m!140711))

(declare-fun m!140713 () Bool)

(assert (=> b!97021 m!140713))

(declare-fun m!140717 () Bool)

(assert (=> b!97021 m!140717))

(declare-fun m!140721 () Bool)

(assert (=> bm!1186 m!140721))

(declare-fun m!140725 () Bool)

(assert (=> b!97013 m!140725))

(declare-fun m!140729 () Bool)

(assert (=> b!97014 m!140729))

(declare-fun m!140733 () Bool)

(assert (=> b!97014 m!140733))

(assert (=> b!97014 m!140697))

(declare-fun m!140737 () Bool)

(assert (=> b!97014 m!140737))

(declare-fun m!140741 () Bool)

(assert (=> b!97014 m!140741))

(declare-fun m!140745 () Bool)

(assert (=> b!97016 m!140745))

(declare-fun m!140749 () Bool)

(assert (=> b!97016 m!140749))

(declare-fun m!140753 () Bool)

(assert (=> b!97022 m!140753))

(declare-fun m!140755 () Bool)

(assert (=> b!97019 m!140755))

(declare-fun m!140757 () Bool)

(assert (=> b!97018 m!140757))

(assert (=> b!97018 m!140757))

(declare-fun m!140761 () Bool)

(assert (=> b!97018 m!140761))

(declare-fun m!140765 () Bool)

(assert (=> b!97020 m!140765))

(assert (=> b!97023 m!140749))

(assert (=> b!97023 m!140607))

(assert (=> b!96926 d!30432))

(push 1)

(assert (not d!30414))

(assert (not b!97020))

(assert (not b!97013))

(assert (not b!97022))

(assert (not b!97023))

(assert (not bm!1186))

(assert (not b!97021))

(assert (not d!30424))

(assert (not b!97017))

(assert (not b!97018))

(assert (not b!97019))

(assert (not b!97016))

(assert (not b!97014))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!30450 () Bool)

(assert (=> d!30450 (isPrefixOf!0 lt!140112 lt!140112)))

(declare-fun lt!140294 () Unit!5870)

(declare-fun choose!11 (BitStream!3622) Unit!5870)

(assert (=> d!30450 (= lt!140294 (choose!11 lt!140112))))

(assert (=> d!30450 (= (lemmaIsPrefixRefl!0 lt!140112) lt!140294)))

(declare-fun bs!7445 () Bool)

(assert (= bs!7445 d!30450))

(declare-fun m!140853 () Bool)

(assert (=> bs!7445 m!140853))

(declare-fun m!140855 () Bool)

(assert (=> bs!7445 m!140855))

(assert (=> b!97019 d!30450))

(declare-fun d!30452 () Bool)

(declare-datatypes ((tuple2!7772 0))(
  ( (tuple2!7773 (_1!4138 Bool) (_2!4138 BitStream!3622)) )
))
(declare-fun lt!140297 () tuple2!7772)

(declare-fun readBit!0 (BitStream!3622) tuple2!7772)

(assert (=> d!30452 (= lt!140297 (readBit!0 (readerFrom!0 (_2!4126 lt!140090) (currentBit!4822 thiss!1288) (currentByte!4827 thiss!1288))))))

(assert (=> d!30452 (= (readBitPure!0 (readerFrom!0 (_2!4126 lt!140090) (currentBit!4822 thiss!1288) (currentByte!4827 thiss!1288))) (tuple2!7761 (_2!4138 lt!140297) (_1!4138 lt!140297)))))

(declare-fun bs!7446 () Bool)

(assert (= bs!7446 d!30452))

(assert (=> bs!7446 m!140757))

(declare-fun m!140857 () Bool)

(assert (=> bs!7446 m!140857))

(assert (=> b!97018 d!30452))

(declare-fun d!30454 () Bool)

(declare-fun e!63633 () Bool)

(assert (=> d!30454 e!63633))

(declare-fun res!79658 () Bool)

(assert (=> d!30454 (=> (not res!79658) (not e!63633))))

(assert (=> d!30454 (= res!79658 (invariant!0 (currentBit!4822 (_2!4126 lt!140090)) (currentByte!4827 (_2!4126 lt!140090)) (size!2074 (buf!2420 (_2!4126 lt!140090)))))))

(assert (=> d!30454 (= (readerFrom!0 (_2!4126 lt!140090) (currentBit!4822 thiss!1288) (currentByte!4827 thiss!1288)) (BitStream!3623 (buf!2420 (_2!4126 lt!140090)) (currentByte!4827 thiss!1288) (currentBit!4822 thiss!1288)))))

(declare-fun b!97080 () Bool)

(assert (=> b!97080 (= e!63633 (invariant!0 (currentBit!4822 thiss!1288) (currentByte!4827 thiss!1288) (size!2074 (buf!2420 (_2!4126 lt!140090)))))))

(assert (= (and d!30454 res!79658) b!97080))

(declare-fun m!140859 () Bool)

(assert (=> d!30454 m!140859))

(declare-fun m!140861 () Bool)

(assert (=> b!97080 m!140861))

(assert (=> b!97018 d!30454))

(declare-fun d!30456 () Bool)

(assert (=> d!30456 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2074 (buf!2420 (_2!4126 lt!140067)))) ((_ sign_extend 32) (currentByte!4827 thiss!1288)) ((_ sign_extend 32) (currentBit!4822 thiss!1288)) lt!140076) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2074 (buf!2420 (_2!4126 lt!140067)))) ((_ sign_extend 32) (currentByte!4827 thiss!1288)) ((_ sign_extend 32) (currentBit!4822 thiss!1288))) lt!140076))))

(declare-fun bs!7447 () Bool)

(assert (= bs!7447 d!30456))

(declare-fun m!140863 () Bool)

(assert (=> bs!7447 m!140863))

(assert (=> b!97014 d!30456))

(declare-fun d!30458 () Bool)

(assert (=> d!30458 (validate_offset_bits!1 ((_ sign_extend 32) (size!2074 (buf!2420 (_2!4126 lt!140067)))) ((_ sign_extend 32) (currentByte!4827 thiss!1288)) ((_ sign_extend 32) (currentBit!4822 thiss!1288)) lt!140076)))

(declare-fun lt!140300 () Unit!5870)

(declare-fun choose!9 (BitStream!3622 array!4534 (_ BitVec 64) BitStream!3622) Unit!5870)

(assert (=> d!30458 (= lt!140300 (choose!9 thiss!1288 (buf!2420 (_2!4126 lt!140067)) lt!140076 (BitStream!3623 (buf!2420 (_2!4126 lt!140067)) (currentByte!4827 thiss!1288) (currentBit!4822 thiss!1288))))))

(assert (=> d!30458 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1288 (buf!2420 (_2!4126 lt!140067)) lt!140076) lt!140300)))

(declare-fun bs!7448 () Bool)

(assert (= bs!7448 d!30458))

(assert (=> bs!7448 m!140741))

(declare-fun m!140865 () Bool)

(assert (=> bs!7448 m!140865))

(assert (=> b!97014 d!30458))

(declare-fun e!63639 () Bool)

(declare-fun lt!140356 () tuple2!7754)

(declare-fun lt!140343 () (_ BitVec 64))

(declare-fun lt!140355 () (_ BitVec 64))

(declare-fun b!97091 () Bool)

(assert (=> b!97091 (= e!63639 (= (_1!4129 lt!140356) (withMovedBitIndex!0 (_2!4129 lt!140356) (bvsub lt!140343 lt!140355))))))

(assert (=> b!97091 (or (= (bvand lt!140343 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!140355 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!140343 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!140343 lt!140355) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!97091 (= lt!140355 (bitIndex!0 (size!2074 (buf!2420 (_2!4126 lt!140067))) (currentByte!4827 (_2!4126 lt!140067)) (currentBit!4822 (_2!4126 lt!140067))))))

(assert (=> b!97091 (= lt!140343 (bitIndex!0 (size!2074 (buf!2420 thiss!1288)) (currentByte!4827 thiss!1288) (currentBit!4822 thiss!1288)))))

(declare-fun b!97092 () Bool)

(declare-fun e!63638 () Unit!5870)

(declare-fun Unit!5894 () Unit!5870)

(assert (=> b!97092 (= e!63638 Unit!5894)))

(declare-fun b!97093 () Bool)

(declare-fun res!79666 () Bool)

(assert (=> b!97093 (=> (not res!79666) (not e!63639))))

(assert (=> b!97093 (= res!79666 (isPrefixOf!0 (_1!4129 lt!140356) thiss!1288))))

(declare-fun b!97094 () Bool)

(declare-fun res!79667 () Bool)

(assert (=> b!97094 (=> (not res!79667) (not e!63639))))

(assert (=> b!97094 (= res!79667 (isPrefixOf!0 (_2!4129 lt!140356) (_2!4126 lt!140067)))))

(declare-fun d!30460 () Bool)

(assert (=> d!30460 e!63639))

(declare-fun res!79665 () Bool)

(assert (=> d!30460 (=> (not res!79665) (not e!63639))))

(assert (=> d!30460 (= res!79665 (isPrefixOf!0 (_1!4129 lt!140356) (_2!4129 lt!140356)))))

(declare-fun lt!140360 () BitStream!3622)

(assert (=> d!30460 (= lt!140356 (tuple2!7755 lt!140360 (_2!4126 lt!140067)))))

(declare-fun lt!140351 () Unit!5870)

(declare-fun lt!140357 () Unit!5870)

(assert (=> d!30460 (= lt!140351 lt!140357)))

(assert (=> d!30460 (isPrefixOf!0 lt!140360 (_2!4126 lt!140067))))

(assert (=> d!30460 (= lt!140357 (lemmaIsPrefixTransitive!0 lt!140360 (_2!4126 lt!140067) (_2!4126 lt!140067)))))

(declare-fun lt!140352 () Unit!5870)

(declare-fun lt!140341 () Unit!5870)

(assert (=> d!30460 (= lt!140352 lt!140341)))

(assert (=> d!30460 (isPrefixOf!0 lt!140360 (_2!4126 lt!140067))))

(assert (=> d!30460 (= lt!140341 (lemmaIsPrefixTransitive!0 lt!140360 thiss!1288 (_2!4126 lt!140067)))))

(declare-fun lt!140346 () Unit!5870)

(assert (=> d!30460 (= lt!140346 e!63638)))

(declare-fun c!6141 () Bool)

(assert (=> d!30460 (= c!6141 (not (= (size!2074 (buf!2420 thiss!1288)) #b00000000000000000000000000000000)))))

(declare-fun lt!140349 () Unit!5870)

(declare-fun lt!140353 () Unit!5870)

(assert (=> d!30460 (= lt!140349 lt!140353)))

(assert (=> d!30460 (isPrefixOf!0 (_2!4126 lt!140067) (_2!4126 lt!140067))))

(assert (=> d!30460 (= lt!140353 (lemmaIsPrefixRefl!0 (_2!4126 lt!140067)))))

(declare-fun lt!140348 () Unit!5870)

(declare-fun lt!140345 () Unit!5870)

(assert (=> d!30460 (= lt!140348 lt!140345)))

(assert (=> d!30460 (= lt!140345 (lemmaIsPrefixRefl!0 (_2!4126 lt!140067)))))

(declare-fun lt!140354 () Unit!5870)

(declare-fun lt!140358 () Unit!5870)

(assert (=> d!30460 (= lt!140354 lt!140358)))

(assert (=> d!30460 (isPrefixOf!0 lt!140360 lt!140360)))

(assert (=> d!30460 (= lt!140358 (lemmaIsPrefixRefl!0 lt!140360))))

(declare-fun lt!140350 () Unit!5870)

(declare-fun lt!140359 () Unit!5870)

(assert (=> d!30460 (= lt!140350 lt!140359)))

(assert (=> d!30460 (isPrefixOf!0 thiss!1288 thiss!1288)))

(assert (=> d!30460 (= lt!140359 (lemmaIsPrefixRefl!0 thiss!1288))))

(assert (=> d!30460 (= lt!140360 (BitStream!3623 (buf!2420 (_2!4126 lt!140067)) (currentByte!4827 thiss!1288) (currentBit!4822 thiss!1288)))))

(assert (=> d!30460 (isPrefixOf!0 thiss!1288 (_2!4126 lt!140067))))

(assert (=> d!30460 (= (reader!0 thiss!1288 (_2!4126 lt!140067)) lt!140356)))

(declare-fun b!97095 () Bool)

(declare-fun lt!140342 () Unit!5870)

(assert (=> b!97095 (= e!63638 lt!140342)))

(declare-fun lt!140344 () (_ BitVec 64))

(assert (=> b!97095 (= lt!140344 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!140347 () (_ BitVec 64))

(assert (=> b!97095 (= lt!140347 (bitIndex!0 (size!2074 (buf!2420 thiss!1288)) (currentByte!4827 thiss!1288) (currentBit!4822 thiss!1288)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!4534 array!4534 (_ BitVec 64) (_ BitVec 64)) Unit!5870)

(assert (=> b!97095 (= lt!140342 (arrayBitRangesEqSymmetric!0 (buf!2420 thiss!1288) (buf!2420 (_2!4126 lt!140067)) lt!140344 lt!140347))))

(declare-fun arrayBitRangesEq!0 (array!4534 array!4534 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!97095 (arrayBitRangesEq!0 (buf!2420 (_2!4126 lt!140067)) (buf!2420 thiss!1288) lt!140344 lt!140347)))

(assert (= (and d!30460 c!6141) b!97095))

(assert (= (and d!30460 (not c!6141)) b!97092))

(assert (= (and d!30460 res!79665) b!97093))

(assert (= (and b!97093 res!79666) b!97094))

(assert (= (and b!97094 res!79667) b!97091))

(assert (=> d!30460 m!140753))

(declare-fun m!140867 () Bool)

(assert (=> d!30460 m!140867))

(declare-fun m!140869 () Bool)

(assert (=> d!30460 m!140869))

(declare-fun m!140871 () Bool)

(assert (=> d!30460 m!140871))

(declare-fun m!140873 () Bool)

(assert (=> d!30460 m!140873))

(declare-fun m!140875 () Bool)

(assert (=> d!30460 m!140875))

(declare-fun m!140877 () Bool)

(assert (=> d!30460 m!140877))

(declare-fun m!140879 () Bool)

(assert (=> d!30460 m!140879))

(declare-fun m!140881 () Bool)

(assert (=> d!30460 m!140881))

(declare-fun m!140883 () Bool)

(assert (=> d!30460 m!140883))

(declare-fun m!140885 () Bool)

(assert (=> d!30460 m!140885))

(declare-fun m!140887 () Bool)

(assert (=> b!97094 m!140887))

(assert (=> b!97095 m!140607))

(declare-fun m!140889 () Bool)

(assert (=> b!97095 m!140889))

(declare-fun m!140891 () Bool)

(assert (=> b!97095 m!140891))

(declare-fun m!140893 () Bool)

(assert (=> b!97091 m!140893))

(assert (=> b!97091 m!140603))

(assert (=> b!97091 m!140607))

(declare-fun m!140895 () Bool)

(assert (=> b!97093 m!140895))

(assert (=> b!97014 d!30460))

(declare-datatypes ((tuple2!7774 0))(
  ( (tuple2!7775 (_1!4139 (_ BitVec 64)) (_2!4139 BitStream!3622)) )
))
(declare-fun lt!140363 () tuple2!7774)

(declare-fun d!30462 () Bool)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!3622 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!7774)

(assert (=> d!30462 (= lt!140363 (readNLeastSignificantBitsLoop!0 (_1!4129 lt!140146) nBits!388 #b00000000000000000000000000000000 lt!140122))))

(assert (=> d!30462 (= (readNLeastSignificantBitsLoopPure!0 (_1!4129 lt!140146) nBits!388 #b00000000000000000000000000000000 lt!140122) (tuple2!7757 (_2!4139 lt!140363) (_1!4139 lt!140363)))))

(declare-fun bs!7449 () Bool)

(assert (= bs!7449 d!30462))

(declare-fun m!140897 () Bool)

(assert (=> bs!7449 m!140897))

(assert (=> b!97014 d!30462))

(declare-fun d!30464 () Bool)

(assert (=> d!30464 (= (onesLSBLong!0 (bvsub nBits!388 #b00000000000000000000000000000000)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!388 #b00000000000000000000000000000000)))))))

(assert (=> b!97014 d!30464))

(declare-fun d!30466 () Bool)

(declare-fun res!79675 () Bool)

(declare-fun e!63644 () Bool)

(assert (=> d!30466 (=> (not res!79675) (not e!63644))))

(assert (=> d!30466 (= res!79675 (= (size!2074 (buf!2420 thiss!1288)) (size!2074 (buf!2420 (_2!4126 lt!140090)))))))

(assert (=> d!30466 (= (isPrefixOf!0 thiss!1288 (_2!4126 lt!140090)) e!63644)))

(declare-fun b!97102 () Bool)

(declare-fun res!79674 () Bool)

(assert (=> b!97102 (=> (not res!79674) (not e!63644))))

(assert (=> b!97102 (= res!79674 (bvsle (bitIndex!0 (size!2074 (buf!2420 thiss!1288)) (currentByte!4827 thiss!1288) (currentBit!4822 thiss!1288)) (bitIndex!0 (size!2074 (buf!2420 (_2!4126 lt!140090))) (currentByte!4827 (_2!4126 lt!140090)) (currentBit!4822 (_2!4126 lt!140090)))))))

(declare-fun b!97103 () Bool)

(declare-fun e!63645 () Bool)

(assert (=> b!97103 (= e!63644 e!63645)))

(declare-fun res!79676 () Bool)

(assert (=> b!97103 (=> res!79676 e!63645)))

(assert (=> b!97103 (= res!79676 (= (size!2074 (buf!2420 thiss!1288)) #b00000000000000000000000000000000))))

(declare-fun b!97104 () Bool)

(assert (=> b!97104 (= e!63645 (arrayBitRangesEq!0 (buf!2420 thiss!1288) (buf!2420 (_2!4126 lt!140090)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2074 (buf!2420 thiss!1288)) (currentByte!4827 thiss!1288) (currentBit!4822 thiss!1288))))))

(assert (= (and d!30466 res!79675) b!97102))

(assert (= (and b!97102 res!79674) b!97103))

(assert (= (and b!97103 (not res!79676)) b!97104))

(assert (=> b!97102 m!140607))

(assert (=> b!97102 m!140749))

(assert (=> b!97104 m!140607))

(assert (=> b!97104 m!140607))

(declare-fun m!140899 () Bool)

(assert (=> b!97104 m!140899))

(assert (=> b!97020 d!30466))

(declare-fun d!30468 () Bool)

(assert (=> d!30468 (= (invariant!0 (currentBit!4822 thiss!1288) (currentByte!4827 thiss!1288) (size!2074 (buf!2420 thiss!1288))) (and (bvsge (currentBit!4822 thiss!1288) #b00000000000000000000000000000000) (bvslt (currentBit!4822 thiss!1288) #b00000000000000000000000000001000) (bvsge (currentByte!4827 thiss!1288) #b00000000000000000000000000000000) (or (bvslt (currentByte!4827 thiss!1288) (size!2074 (buf!2420 thiss!1288))) (and (= (currentBit!4822 thiss!1288) #b00000000000000000000000000000000) (= (currentByte!4827 thiss!1288) (size!2074 (buf!2420 thiss!1288)))))))))

(assert (=> d!30414 d!30468))

(declare-fun d!30470 () Bool)

(declare-fun res!79678 () Bool)

(declare-fun e!63646 () Bool)

(assert (=> d!30470 (=> (not res!79678) (not e!63646))))

(assert (=> d!30470 (= res!79678 (= (size!2074 (buf!2420 (ite c!6130 thiss!1288 lt!140112))) (size!2074 (buf!2420 (ite c!6130 (_2!4126 lt!140114) lt!140112)))))))

(assert (=> d!30470 (= (isPrefixOf!0 (ite c!6130 thiss!1288 lt!140112) (ite c!6130 (_2!4126 lt!140114) lt!140112)) e!63646)))

(declare-fun b!97105 () Bool)

(declare-fun res!79677 () Bool)

(assert (=> b!97105 (=> (not res!79677) (not e!63646))))

(assert (=> b!97105 (= res!79677 (bvsle (bitIndex!0 (size!2074 (buf!2420 (ite c!6130 thiss!1288 lt!140112))) (currentByte!4827 (ite c!6130 thiss!1288 lt!140112)) (currentBit!4822 (ite c!6130 thiss!1288 lt!140112))) (bitIndex!0 (size!2074 (buf!2420 (ite c!6130 (_2!4126 lt!140114) lt!140112))) (currentByte!4827 (ite c!6130 (_2!4126 lt!140114) lt!140112)) (currentBit!4822 (ite c!6130 (_2!4126 lt!140114) lt!140112)))))))

(declare-fun b!97106 () Bool)

(declare-fun e!63647 () Bool)

(assert (=> b!97106 (= e!63646 e!63647)))

(declare-fun res!79679 () Bool)

(assert (=> b!97106 (=> res!79679 e!63647)))

(assert (=> b!97106 (= res!79679 (= (size!2074 (buf!2420 (ite c!6130 thiss!1288 lt!140112))) #b00000000000000000000000000000000))))

(declare-fun b!97107 () Bool)

(assert (=> b!97107 (= e!63647 (arrayBitRangesEq!0 (buf!2420 (ite c!6130 thiss!1288 lt!140112)) (buf!2420 (ite c!6130 (_2!4126 lt!140114) lt!140112)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2074 (buf!2420 (ite c!6130 thiss!1288 lt!140112))) (currentByte!4827 (ite c!6130 thiss!1288 lt!140112)) (currentBit!4822 (ite c!6130 thiss!1288 lt!140112)))))))

(assert (= (and d!30470 res!79678) b!97105))

(assert (= (and b!97105 res!79677) b!97106))

(assert (= (and b!97106 (not res!79679)) b!97107))

(declare-fun m!140901 () Bool)

(assert (=> b!97105 m!140901))

(declare-fun m!140903 () Bool)

(assert (=> b!97105 m!140903))

(assert (=> b!97107 m!140901))

(assert (=> b!97107 m!140901))

(declare-fun m!140905 () Bool)

(assert (=> b!97107 m!140905))

(assert (=> bm!1186 d!30470))

(declare-fun d!30472 () Bool)

(assert (=> d!30472 (= (remainingBits!0 ((_ sign_extend 32) (size!2074 (buf!2420 thiss!1288))) ((_ sign_extend 32) (currentByte!4827 thiss!1288)) ((_ sign_extend 32) (currentBit!4822 thiss!1288))) (bvsub (bvmul ((_ sign_extend 32) (size!2074 (buf!2420 thiss!1288))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4827 thiss!1288)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4822 thiss!1288)))))))

(assert (=> d!30424 d!30472))

(declare-fun d!30474 () Bool)

(declare-fun e!63650 () Bool)

(assert (=> d!30474 e!63650))

(declare-fun res!79684 () Bool)

(assert (=> d!30474 (=> (not res!79684) (not e!63650))))

(declare-fun lt!140380 () (_ BitVec 64))

(declare-fun lt!140379 () (_ BitVec 64))

(declare-fun lt!140377 () (_ BitVec 64))

(assert (=> d!30474 (= res!79684 (= lt!140380 (bvsub lt!140377 lt!140379)))))

(assert (=> d!30474 (or (= (bvand lt!140377 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!140379 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!140377 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!140377 lt!140379) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!30474 (= lt!140379 (remainingBits!0 ((_ sign_extend 32) (size!2074 (buf!2420 (_1!4132 lt!140091)))) ((_ sign_extend 32) (currentByte!4827 (_1!4132 lt!140091))) ((_ sign_extend 32) (currentBit!4822 (_1!4132 lt!140091)))))))

(declare-fun lt!140381 () (_ BitVec 64))

(declare-fun lt!140378 () (_ BitVec 64))

(assert (=> d!30474 (= lt!140377 (bvmul lt!140381 lt!140378))))

(assert (=> d!30474 (or (= lt!140381 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!140378 (bvsdiv (bvmul lt!140381 lt!140378) lt!140381)))))

(assert (=> d!30474 (= lt!140378 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!30474 (= lt!140381 ((_ sign_extend 32) (size!2074 (buf!2420 (_1!4132 lt!140091)))))))

(assert (=> d!30474 (= lt!140380 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4827 (_1!4132 lt!140091))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4822 (_1!4132 lt!140091)))))))

(assert (=> d!30474 (invariant!0 (currentBit!4822 (_1!4132 lt!140091)) (currentByte!4827 (_1!4132 lt!140091)) (size!2074 (buf!2420 (_1!4132 lt!140091))))))

(assert (=> d!30474 (= (bitIndex!0 (size!2074 (buf!2420 (_1!4132 lt!140091))) (currentByte!4827 (_1!4132 lt!140091)) (currentBit!4822 (_1!4132 lt!140091))) lt!140380)))

(declare-fun b!97112 () Bool)

(declare-fun res!79685 () Bool)

(assert (=> b!97112 (=> (not res!79685) (not e!63650))))

(assert (=> b!97112 (= res!79685 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!140380))))

(declare-fun b!97113 () Bool)

(declare-fun lt!140376 () (_ BitVec 64))

(assert (=> b!97113 (= e!63650 (bvsle lt!140380 (bvmul lt!140376 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!97113 (or (= lt!140376 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!140376 #b0000000000000000000000000000000000000000000000000000000000001000) lt!140376)))))

(assert (=> b!97113 (= lt!140376 ((_ sign_extend 32) (size!2074 (buf!2420 (_1!4132 lt!140091)))))))

(assert (= (and d!30474 res!79684) b!97112))

(assert (= (and b!97112 res!79685) b!97113))

(declare-fun m!140907 () Bool)

(assert (=> d!30474 m!140907))

(declare-fun m!140909 () Bool)

(assert (=> d!30474 m!140909))

(assert (=> b!97016 d!30474))

(declare-fun d!30476 () Bool)

(declare-fun e!63651 () Bool)

(assert (=> d!30476 e!63651))

(declare-fun res!79686 () Bool)

(assert (=> d!30476 (=> (not res!79686) (not e!63651))))

(declare-fun lt!140386 () (_ BitVec 64))

(declare-fun lt!140385 () (_ BitVec 64))

(declare-fun lt!140383 () (_ BitVec 64))

(assert (=> d!30476 (= res!79686 (= lt!140386 (bvsub lt!140383 lt!140385)))))

(assert (=> d!30476 (or (= (bvand lt!140383 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!140385 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!140383 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!140383 lt!140385) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!30476 (= lt!140385 (remainingBits!0 ((_ sign_extend 32) (size!2074 (buf!2420 (_2!4126 lt!140090)))) ((_ sign_extend 32) (currentByte!4827 (_2!4126 lt!140090))) ((_ sign_extend 32) (currentBit!4822 (_2!4126 lt!140090)))))))

(declare-fun lt!140387 () (_ BitVec 64))

(declare-fun lt!140384 () (_ BitVec 64))

(assert (=> d!30476 (= lt!140383 (bvmul lt!140387 lt!140384))))

(assert (=> d!30476 (or (= lt!140387 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!140384 (bvsdiv (bvmul lt!140387 lt!140384) lt!140387)))))

(assert (=> d!30476 (= lt!140384 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!30476 (= lt!140387 ((_ sign_extend 32) (size!2074 (buf!2420 (_2!4126 lt!140090)))))))

(assert (=> d!30476 (= lt!140386 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4827 (_2!4126 lt!140090))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4822 (_2!4126 lt!140090)))))))

(assert (=> d!30476 (invariant!0 (currentBit!4822 (_2!4126 lt!140090)) (currentByte!4827 (_2!4126 lt!140090)) (size!2074 (buf!2420 (_2!4126 lt!140090))))))

(assert (=> d!30476 (= (bitIndex!0 (size!2074 (buf!2420 (_2!4126 lt!140090))) (currentByte!4827 (_2!4126 lt!140090)) (currentBit!4822 (_2!4126 lt!140090))) lt!140386)))

(declare-fun b!97114 () Bool)

(declare-fun res!79687 () Bool)

(assert (=> b!97114 (=> (not res!79687) (not e!63651))))

(assert (=> b!97114 (= res!79687 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!140386))))

(declare-fun b!97115 () Bool)

(declare-fun lt!140382 () (_ BitVec 64))

(assert (=> b!97115 (= e!63651 (bvsle lt!140386 (bvmul lt!140382 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!97115 (or (= lt!140382 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!140382 #b0000000000000000000000000000000000000000000000000000000000001000) lt!140382)))))

(assert (=> b!97115 (= lt!140382 ((_ sign_extend 32) (size!2074 (buf!2420 (_2!4126 lt!140090)))))))

(assert (= (and d!30476 res!79686) b!97114))

(assert (= (and b!97114 res!79687) b!97115))

(declare-fun m!140911 () Bool)

(assert (=> d!30476 m!140911))

(assert (=> d!30476 m!140859))

(assert (=> b!97016 d!30476))

(declare-fun d!30478 () Bool)

(declare-fun res!79689 () Bool)

(declare-fun e!63652 () Bool)

(assert (=> d!30478 (=> (not res!79689) (not e!63652))))

(assert (=> d!30478 (= res!79689 (= (size!2074 (buf!2420 thiss!1288)) (size!2074 (buf!2420 (_2!4126 lt!140067)))))))

(assert (=> d!30478 (= (isPrefixOf!0 thiss!1288 (_2!4126 lt!140067)) e!63652)))

(declare-fun b!97116 () Bool)

(declare-fun res!79688 () Bool)

(assert (=> b!97116 (=> (not res!79688) (not e!63652))))

(assert (=> b!97116 (= res!79688 (bvsle (bitIndex!0 (size!2074 (buf!2420 thiss!1288)) (currentByte!4827 thiss!1288) (currentBit!4822 thiss!1288)) (bitIndex!0 (size!2074 (buf!2420 (_2!4126 lt!140067))) (currentByte!4827 (_2!4126 lt!140067)) (currentBit!4822 (_2!4126 lt!140067)))))))

(declare-fun b!97117 () Bool)

(declare-fun e!63653 () Bool)

(assert (=> b!97117 (= e!63652 e!63653)))

(declare-fun res!79690 () Bool)

(assert (=> b!97117 (=> res!79690 e!63653)))

(assert (=> b!97117 (= res!79690 (= (size!2074 (buf!2420 thiss!1288)) #b00000000000000000000000000000000))))

(declare-fun b!97118 () Bool)

(assert (=> b!97118 (= e!63653 (arrayBitRangesEq!0 (buf!2420 thiss!1288) (buf!2420 (_2!4126 lt!140067)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2074 (buf!2420 thiss!1288)) (currentByte!4827 thiss!1288) (currentBit!4822 thiss!1288))))))

(assert (= (and d!30478 res!79689) b!97116))

(assert (= (and b!97116 res!79688) b!97117))

(assert (= (and b!97117 (not res!79690)) b!97118))

(assert (=> b!97116 m!140607))

(assert (=> b!97116 m!140603))

(assert (=> b!97118 m!140607))

(assert (=> b!97118 m!140607))

(declare-fun m!140913 () Bool)

(assert (=> b!97118 m!140913))

(assert (=> b!97022 d!30478))

(declare-fun b!97128 () Bool)

(declare-fun res!79702 () Bool)

(declare-fun e!63659 () Bool)

(assert (=> b!97128 (=> (not res!79702) (not e!63659))))

(declare-fun lt!140399 () (_ BitVec 64))

(declare-fun lt!140398 () (_ BitVec 64))

(declare-fun lt!140397 () tuple2!7748)

(assert (=> b!97128 (= res!79702 (= (bitIndex!0 (size!2074 (buf!2420 (_2!4126 lt!140397))) (currentByte!4827 (_2!4126 lt!140397)) (currentBit!4822 (_2!4126 lt!140397))) (bvadd lt!140399 lt!140398)))))

(assert (=> b!97128 (or (not (= (bvand lt!140399 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!140398 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!140399 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!140399 lt!140398) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!97128 (= lt!140398 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!97128 (= lt!140399 (bitIndex!0 (size!2074 (buf!2420 thiss!1288)) (currentByte!4827 thiss!1288) (currentBit!4822 thiss!1288)))))

(declare-fun d!30480 () Bool)

(assert (=> d!30480 e!63659))

(declare-fun res!79701 () Bool)

(assert (=> d!30480 (=> (not res!79701) (not e!63659))))

(assert (=> d!30480 (= res!79701 (= (size!2074 (buf!2420 thiss!1288)) (size!2074 (buf!2420 (_2!4126 lt!140397)))))))

(declare-fun choose!16 (BitStream!3622 Bool) tuple2!7748)

(assert (=> d!30480 (= lt!140397 (choose!16 thiss!1288 lt!140071))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!30480 (validate_offset_bit!0 ((_ sign_extend 32) (size!2074 (buf!2420 thiss!1288))) ((_ sign_extend 32) (currentByte!4827 thiss!1288)) ((_ sign_extend 32) (currentBit!4822 thiss!1288)))))

(assert (=> d!30480 (= (appendBit!0 thiss!1288 lt!140071) lt!140397)))

(declare-fun b!97130 () Bool)

(declare-fun e!63658 () Bool)

(assert (=> b!97130 (= e!63659 e!63658)))

(declare-fun res!79699 () Bool)

(assert (=> b!97130 (=> (not res!79699) (not e!63658))))

(declare-fun lt!140396 () tuple2!7760)

(assert (=> b!97130 (= res!79699 (and (= (_2!4132 lt!140396) lt!140071) (= (_1!4132 lt!140396) (_2!4126 lt!140397))))))

(assert (=> b!97130 (= lt!140396 (readBitPure!0 (readerFrom!0 (_2!4126 lt!140397) (currentBit!4822 thiss!1288) (currentByte!4827 thiss!1288))))))

(declare-fun b!97129 () Bool)

(declare-fun res!79700 () Bool)

(assert (=> b!97129 (=> (not res!79700) (not e!63659))))

(assert (=> b!97129 (= res!79700 (isPrefixOf!0 thiss!1288 (_2!4126 lt!140397)))))

(declare-fun b!97131 () Bool)

(assert (=> b!97131 (= e!63658 (= (bitIndex!0 (size!2074 (buf!2420 (_1!4132 lt!140396))) (currentByte!4827 (_1!4132 lt!140396)) (currentBit!4822 (_1!4132 lt!140396))) (bitIndex!0 (size!2074 (buf!2420 (_2!4126 lt!140397))) (currentByte!4827 (_2!4126 lt!140397)) (currentBit!4822 (_2!4126 lt!140397)))))))

(assert (= (and d!30480 res!79701) b!97128))

(assert (= (and b!97128 res!79702) b!97129))

(assert (= (and b!97129 res!79700) b!97130))

(assert (= (and b!97130 res!79699) b!97131))

(declare-fun m!140915 () Bool)

(assert (=> b!97130 m!140915))

(assert (=> b!97130 m!140915))

(declare-fun m!140917 () Bool)

(assert (=> b!97130 m!140917))

(declare-fun m!140919 () Bool)

(assert (=> b!97129 m!140919))

(declare-fun m!140921 () Bool)

(assert (=> b!97131 m!140921))

(declare-fun m!140923 () Bool)

(assert (=> b!97131 m!140923))

(declare-fun m!140925 () Bool)

(assert (=> d!30480 m!140925))

(declare-fun m!140927 () Bool)

(assert (=> d!30480 m!140927))

(assert (=> b!97128 m!140923))

(assert (=> b!97128 m!140607))

(assert (=> b!97021 d!30480))

(declare-fun d!30482 () Bool)

(declare-fun lt!140400 () tuple2!7772)

(assert (=> d!30482 (= lt!140400 (readBit!0 lt!140082))))

(assert (=> d!30482 (= (readBitPure!0 lt!140082) (tuple2!7761 (_2!4138 lt!140400) (_1!4138 lt!140400)))))

(declare-fun bs!7450 () Bool)

(assert (= bs!7450 d!30482))

(declare-fun m!140929 () Bool)

(assert (=> bs!7450 m!140929))

(assert (=> b!97021 d!30482))

(declare-fun d!30484 () Bool)

(assert (=> d!30484 (isPrefixOf!0 thiss!1288 (_2!4126 lt!140114))))

(declare-fun lt!140403 () Unit!5870)

(declare-fun choose!30 (BitStream!3622 BitStream!3622 BitStream!3622) Unit!5870)

(assert (=> d!30484 (= lt!140403 (choose!30 thiss!1288 (_2!4126 lt!140072) (_2!4126 lt!140114)))))

(assert (=> d!30484 (isPrefixOf!0 thiss!1288 (_2!4126 lt!140072))))

(assert (=> d!30484 (= (lemmaIsPrefixTransitive!0 thiss!1288 (_2!4126 lt!140072) (_2!4126 lt!140114)) lt!140403)))

(declare-fun bs!7451 () Bool)

(assert (= bs!7451 d!30484))

(declare-fun m!140931 () Bool)

(assert (=> bs!7451 m!140931))

(declare-fun m!140933 () Bool)

(assert (=> bs!7451 m!140933))

(declare-fun m!140935 () Bool)

(assert (=> bs!7451 m!140935))

(assert (=> b!97021 d!30484))

(declare-fun d!30486 () Bool)

(declare-fun lt!140418 () tuple2!7756)

(declare-fun lt!140416 () tuple2!7756)

(assert (=> d!30486 (and (= (_2!4130 lt!140418) (_2!4130 lt!140416)) (= (_1!4130 lt!140418) (_1!4130 lt!140416)))))

(declare-fun lt!140420 () Bool)

(declare-fun lt!140417 () BitStream!3622)

(declare-fun lt!140421 () (_ BitVec 64))

(declare-fun lt!140419 () Unit!5870)

(declare-fun choose!45 (BitStream!3622 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!7756 tuple2!7756 BitStream!3622 (_ BitVec 64) Bool BitStream!3622 (_ BitVec 64) tuple2!7756 tuple2!7756 BitStream!3622 (_ BitVec 64)) Unit!5870)

(assert (=> d!30486 (= lt!140419 (choose!45 (_1!4129 lt!140124) nBits!388 #b00000000000000000000000000000000 lt!140094 lt!140418 (tuple2!7757 (_1!4130 lt!140418) (_2!4130 lt!140418)) (_1!4130 lt!140418) (_2!4130 lt!140418) lt!140420 lt!140417 lt!140421 lt!140416 (tuple2!7757 (_1!4130 lt!140416) (_2!4130 lt!140416)) (_1!4130 lt!140416) (_2!4130 lt!140416)))))

(assert (=> d!30486 (= lt!140416 (readNLeastSignificantBitsLoopPure!0 lt!140417 nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!140421))))

(assert (=> d!30486 (= lt!140421 (bvor lt!140094 (ite lt!140420 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!388 #b00000000000000000000000000000001) #b00000000000000000000000000000000))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!30486 (= lt!140417 (withMovedBitIndex!0 (_1!4129 lt!140124) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!30486 (= lt!140420 (_2!4132 (readBitPure!0 (_1!4129 lt!140124))))))

(assert (=> d!30486 (= lt!140418 (readNLeastSignificantBitsLoopPure!0 (_1!4129 lt!140124) nBits!388 #b00000000000000000000000000000000 lt!140094))))

(assert (=> d!30486 (= (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4129 lt!140124) nBits!388 #b00000000000000000000000000000000 lt!140094) lt!140419)))

(declare-fun bs!7453 () Bool)

(assert (= bs!7453 d!30486))

(assert (=> bs!7453 m!140713))

(declare-fun m!140937 () Bool)

(assert (=> bs!7453 m!140937))

(assert (=> bs!7453 m!140625))

(declare-fun m!140939 () Bool)

(assert (=> bs!7453 m!140939))

(assert (=> bs!7453 m!140643))

(assert (=> b!97021 d!30486))

(declare-fun d!30488 () Bool)

(declare-fun e!63660 () Bool)

(assert (=> d!30488 e!63660))

(declare-fun res!79703 () Bool)

(assert (=> d!30488 (=> (not res!79703) (not e!63660))))

(declare-fun lt!140423 () (_ BitVec 64))

(declare-fun lt!140425 () (_ BitVec 64))

(declare-fun lt!140426 () (_ BitVec 64))

(assert (=> d!30488 (= res!79703 (= lt!140426 (bvsub lt!140423 lt!140425)))))

(assert (=> d!30488 (or (= (bvand lt!140423 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!140425 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!140423 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!140423 lt!140425) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!30488 (= lt!140425 (remainingBits!0 ((_ sign_extend 32) (size!2074 (buf!2420 (_1!4132 lt!140075)))) ((_ sign_extend 32) (currentByte!4827 (_1!4132 lt!140075))) ((_ sign_extend 32) (currentBit!4822 (_1!4132 lt!140075)))))))

(declare-fun lt!140427 () (_ BitVec 64))

(declare-fun lt!140424 () (_ BitVec 64))

(assert (=> d!30488 (= lt!140423 (bvmul lt!140427 lt!140424))))

(assert (=> d!30488 (or (= lt!140427 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!140424 (bvsdiv (bvmul lt!140427 lt!140424) lt!140427)))))

(assert (=> d!30488 (= lt!140424 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!30488 (= lt!140427 ((_ sign_extend 32) (size!2074 (buf!2420 (_1!4132 lt!140075)))))))

(assert (=> d!30488 (= lt!140426 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4827 (_1!4132 lt!140075))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4822 (_1!4132 lt!140075)))))))

(assert (=> d!30488 (invariant!0 (currentBit!4822 (_1!4132 lt!140075)) (currentByte!4827 (_1!4132 lt!140075)) (size!2074 (buf!2420 (_1!4132 lt!140075))))))

(assert (=> d!30488 (= (bitIndex!0 (size!2074 (buf!2420 (_1!4132 lt!140075))) (currentByte!4827 (_1!4132 lt!140075)) (currentBit!4822 (_1!4132 lt!140075))) lt!140426)))

(declare-fun b!97132 () Bool)

(declare-fun res!79704 () Bool)

(assert (=> b!97132 (=> (not res!79704) (not e!63660))))

(assert (=> b!97132 (= res!79704 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!140426))))

(declare-fun b!97133 () Bool)

(declare-fun lt!140422 () (_ BitVec 64))

(assert (=> b!97133 (= e!63660 (bvsle lt!140426 (bvmul lt!140422 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!97133 (or (= lt!140422 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!140422 #b0000000000000000000000000000000000000000000000000000000000001000) lt!140422)))))

(assert (=> b!97133 (= lt!140422 ((_ sign_extend 32) (size!2074 (buf!2420 (_1!4132 lt!140075)))))))

(assert (= (and d!30488 res!79703) b!97132))

(assert (= (and b!97132 res!79704) b!97133))

(declare-fun m!140941 () Bool)

(assert (=> d!30488 m!140941))

(declare-fun m!140943 () Bool)

(assert (=> d!30488 m!140943))

(assert (=> b!97021 d!30488))

(declare-fun d!30490 () Bool)

(declare-fun e!63661 () Bool)

(assert (=> d!30490 e!63661))

(declare-fun res!79705 () Bool)

(assert (=> d!30490 (=> (not res!79705) (not e!63661))))

(declare-fun lt!140432 () (_ BitVec 64))

(declare-fun lt!140431 () (_ BitVec 64))

(declare-fun lt!140429 () (_ BitVec 64))

(assert (=> d!30490 (= res!79705 (= lt!140432 (bvsub lt!140429 lt!140431)))))

(assert (=> d!30490 (or (= (bvand lt!140429 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!140431 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!140429 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!140429 lt!140431) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!30490 (= lt!140431 (remainingBits!0 ((_ sign_extend 32) (size!2074 (buf!2420 (_2!4126 lt!140072)))) ((_ sign_extend 32) (currentByte!4827 (_2!4126 lt!140072))) ((_ sign_extend 32) (currentBit!4822 (_2!4126 lt!140072)))))))

(declare-fun lt!140433 () (_ BitVec 64))

(declare-fun lt!140430 () (_ BitVec 64))

(assert (=> d!30490 (= lt!140429 (bvmul lt!140433 lt!140430))))

(assert (=> d!30490 (or (= lt!140433 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!140430 (bvsdiv (bvmul lt!140433 lt!140430) lt!140433)))))

(assert (=> d!30490 (= lt!140430 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!30490 (= lt!140433 ((_ sign_extend 32) (size!2074 (buf!2420 (_2!4126 lt!140072)))))))

(assert (=> d!30490 (= lt!140432 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4827 (_2!4126 lt!140072))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4822 (_2!4126 lt!140072)))))))

(assert (=> d!30490 (invariant!0 (currentBit!4822 (_2!4126 lt!140072)) (currentByte!4827 (_2!4126 lt!140072)) (size!2074 (buf!2420 (_2!4126 lt!140072))))))

(assert (=> d!30490 (= (bitIndex!0 (size!2074 (buf!2420 (_2!4126 lt!140072))) (currentByte!4827 (_2!4126 lt!140072)) (currentBit!4822 (_2!4126 lt!140072))) lt!140432)))

(declare-fun b!97134 () Bool)

(declare-fun res!79706 () Bool)

(assert (=> b!97134 (=> (not res!79706) (not e!63661))))

(assert (=> b!97134 (= res!79706 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!140432))))

(declare-fun b!97135 () Bool)

(declare-fun lt!140428 () (_ BitVec 64))

(assert (=> b!97135 (= e!63661 (bvsle lt!140432 (bvmul lt!140428 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!97135 (or (= lt!140428 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!140428 #b0000000000000000000000000000000000000000000000000000000000001000) lt!140428)))))

(assert (=> b!97135 (= lt!140428 ((_ sign_extend 32) (size!2074 (buf!2420 (_2!4126 lt!140072)))))))

(assert (= (and d!30490 res!79705) b!97134))

(assert (= (and b!97134 res!79706) b!97135))

(declare-fun m!140945 () Bool)

(assert (=> d!30490 m!140945))

(declare-fun m!140947 () Bool)

(assert (=> d!30490 m!140947))

(assert (=> b!97021 d!30490))

(declare-fun d!30492 () Bool)

(declare-fun lt!140434 () tuple2!7774)

(assert (=> d!30492 (= lt!140434 (readNLeastSignificantBitsLoop!0 (_1!4129 lt!140124) nBits!388 #b00000000000000000000000000000000 lt!140094))))

(assert (=> d!30492 (= (readNLeastSignificantBitsLoopPure!0 (_1!4129 lt!140124) nBits!388 #b00000000000000000000000000000000 lt!140094) (tuple2!7757 (_2!4139 lt!140434) (_1!4139 lt!140434)))))

(declare-fun bs!7454 () Bool)

(assert (= bs!7454 d!30492))

(declare-fun m!140949 () Bool)

(assert (=> bs!7454 m!140949))

(assert (=> b!97021 d!30492))

(declare-fun d!30494 () Bool)

(assert (=> d!30494 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2074 (buf!2420 (_2!4126 lt!140114)))) ((_ sign_extend 32) (currentByte!4827 (_2!4126 lt!140072))) ((_ sign_extend 32) (currentBit!4822 (_2!4126 lt!140072))) lt!140085) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2074 (buf!2420 (_2!4126 lt!140114)))) ((_ sign_extend 32) (currentByte!4827 (_2!4126 lt!140072))) ((_ sign_extend 32) (currentBit!4822 (_2!4126 lt!140072)))) lt!140085))))

(declare-fun bs!7455 () Bool)

(assert (= bs!7455 d!30494))

(declare-fun m!140951 () Bool)

(assert (=> bs!7455 m!140951))

(assert (=> b!97021 d!30494))

(declare-fun d!30496 () Bool)

(declare-fun lt!140435 () tuple2!7774)

(assert (=> d!30496 (= lt!140435 (readNLeastSignificantBitsLoop!0 (withMovedBitIndex!0 (_1!4129 lt!140124) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvor lt!140094 e!63604)))))

(assert (=> d!30496 (= (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4129 lt!140124) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvor lt!140094 e!63604)) (tuple2!7757 (_2!4139 lt!140435) (_1!4139 lt!140435)))))

(declare-fun bs!7456 () Bool)

(assert (= bs!7456 d!30496))

(assert (=> bs!7456 m!140625))

(declare-fun m!140953 () Bool)

(assert (=> bs!7456 m!140953))

(assert (=> b!97021 d!30496))

(declare-fun d!30498 () Bool)

(declare-fun lt!140436 () tuple2!7772)

(assert (=> d!30498 (= lt!140436 (readBit!0 lt!140135))))

(assert (=> d!30498 (= (readBitPure!0 lt!140135) (tuple2!7761 (_2!4138 lt!140436) (_1!4138 lt!140436)))))

(declare-fun bs!7457 () Bool)

(assert (= bs!7457 d!30498))

(declare-fun m!140955 () Bool)

(assert (=> bs!7457 m!140955))

(assert (=> b!97021 d!30498))

(declare-fun d!30500 () Bool)

(assert (=> d!30500 (validate_offset_bits!1 ((_ sign_extend 32) (size!2074 (buf!2420 (_2!4126 lt!140114)))) ((_ sign_extend 32) (currentByte!4827 thiss!1288)) ((_ sign_extend 32) (currentBit!4822 thiss!1288)) lt!140101)))

(declare-fun lt!140437 () Unit!5870)

(assert (=> d!30500 (= lt!140437 (choose!9 thiss!1288 (buf!2420 (_2!4126 lt!140114)) lt!140101 (BitStream!3623 (buf!2420 (_2!4126 lt!140114)) (currentByte!4827 thiss!1288) (currentBit!4822 thiss!1288))))))

(assert (=> d!30500 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1288 (buf!2420 (_2!4126 lt!140114)) lt!140101) lt!140437)))

(declare-fun bs!7458 () Bool)

(assert (= bs!7458 d!30500))

(assert (=> bs!7458 m!140631))

(declare-fun m!140957 () Bool)

(assert (=> bs!7458 m!140957))

(assert (=> b!97021 d!30500))

(declare-fun d!30502 () Bool)

(declare-fun lt!140438 () tuple2!7774)

(assert (=> d!30502 (= lt!140438 (readNLeastSignificantBitsLoop!0 (_1!4129 lt!140117) nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvor lt!140094 (ite (_2!4132 lt!140139) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!388 #b00000000000000000000000000000001) #b00000000000000000000000000000000))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!30502 (= (readNLeastSignificantBitsLoopPure!0 (_1!4129 lt!140117) nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvor lt!140094 (ite (_2!4132 lt!140139) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!388 #b00000000000000000000000000000001) #b00000000000000000000000000000000))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!7757 (_2!4139 lt!140438) (_1!4139 lt!140438)))))

(declare-fun bs!7459 () Bool)

(assert (= bs!7459 d!30502))

(declare-fun m!140959 () Bool)

(assert (=> bs!7459 m!140959))

(assert (=> b!97021 d!30502))

(declare-fun d!30504 () Bool)

(declare-fun e!63664 () Bool)

(assert (=> d!30504 e!63664))

(declare-fun res!79709 () Bool)

(assert (=> d!30504 (=> (not res!79709) (not e!63664))))

(declare-fun lt!140450 () tuple2!7760)

(declare-fun lt!140447 () tuple2!7760)

(assert (=> d!30504 (= res!79709 (= (bitIndex!0 (size!2074 (buf!2420 (_1!4132 lt!140450))) (currentByte!4827 (_1!4132 lt!140450)) (currentBit!4822 (_1!4132 lt!140450))) (bitIndex!0 (size!2074 (buf!2420 (_1!4132 lt!140447))) (currentByte!4827 (_1!4132 lt!140447)) (currentBit!4822 (_1!4132 lt!140447)))))))

(declare-fun lt!140449 () Unit!5870)

(declare-fun lt!140448 () BitStream!3622)

(declare-fun choose!50 (BitStream!3622 BitStream!3622 BitStream!3622 tuple2!7760 tuple2!7760 BitStream!3622 Bool tuple2!7760 tuple2!7760 BitStream!3622 Bool) Unit!5870)

(assert (=> d!30504 (= lt!140449 (choose!50 lt!140082 (_2!4126 lt!140114) lt!140448 lt!140450 (tuple2!7761 (_1!4132 lt!140450) (_2!4132 lt!140450)) (_1!4132 lt!140450) (_2!4132 lt!140450) lt!140447 (tuple2!7761 (_1!4132 lt!140447) (_2!4132 lt!140447)) (_1!4132 lt!140447) (_2!4132 lt!140447)))))

(assert (=> d!30504 (= lt!140447 (readBitPure!0 lt!140448))))

(assert (=> d!30504 (= lt!140450 (readBitPure!0 lt!140082))))

(assert (=> d!30504 (= lt!140448 (BitStream!3623 (buf!2420 (_2!4126 lt!140114)) (currentByte!4827 lt!140082) (currentBit!4822 lt!140082)))))

(assert (=> d!30504 (invariant!0 (currentBit!4822 lt!140082) (currentByte!4827 lt!140082) (size!2074 (buf!2420 (_2!4126 lt!140114))))))

(assert (=> d!30504 (= (readBitPrefixLemma!0 lt!140082 (_2!4126 lt!140114)) lt!140449)))

(declare-fun b!97138 () Bool)

(assert (=> b!97138 (= e!63664 (= (_2!4132 lt!140450) (_2!4132 lt!140447)))))

(assert (= (and d!30504 res!79709) b!97138))

(assert (=> d!30504 m!140645))

(declare-fun m!140961 () Bool)

(assert (=> d!30504 m!140961))

(assert (=> d!30504 m!140649))

(declare-fun m!140963 () Bool)

(assert (=> d!30504 m!140963))

(declare-fun m!140965 () Bool)

(assert (=> d!30504 m!140965))

(declare-fun m!140967 () Bool)

(assert (=> d!30504 m!140967))

(assert (=> b!97021 d!30504))

(declare-fun d!30506 () Bool)

(assert (=> d!30506 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2074 (buf!2420 (_2!4126 lt!140114)))) ((_ sign_extend 32) (currentByte!4827 thiss!1288)) ((_ sign_extend 32) (currentBit!4822 thiss!1288)) lt!140101) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2074 (buf!2420 (_2!4126 lt!140114)))) ((_ sign_extend 32) (currentByte!4827 thiss!1288)) ((_ sign_extend 32) (currentBit!4822 thiss!1288))) lt!140101))))

(declare-fun bs!7460 () Bool)

(assert (= bs!7460 d!30506))

(declare-fun m!140969 () Bool)

(assert (=> bs!7460 m!140969))

(assert (=> b!97021 d!30506))

(declare-fun d!30508 () Bool)

(declare-fun e!63667 () Bool)

(assert (=> d!30508 e!63667))

(declare-fun res!79712 () Bool)

(assert (=> d!30508 (=> (not res!79712) (not e!63667))))

(declare-fun lt!140456 () (_ BitVec 64))

(declare-fun lt!140455 () BitStream!3622)

(assert (=> d!30508 (= res!79712 (= (bvadd lt!140456 (bvsub (bitIndex!0 (size!2074 (buf!2420 thiss!1288)) (currentByte!4827 thiss!1288) (currentBit!4822 thiss!1288)) (bitIndex!0 (size!2074 (buf!2420 (_2!4126 lt!140114))) (currentByte!4827 (_2!4126 lt!140114)) (currentBit!4822 (_2!4126 lt!140114))))) (bitIndex!0 (size!2074 (buf!2420 lt!140455)) (currentByte!4827 lt!140455) (currentBit!4822 lt!140455))))))

(assert (=> d!30508 (or (not (= (bvand lt!140456 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bitIndex!0 (size!2074 (buf!2420 thiss!1288)) (currentByte!4827 thiss!1288) (currentBit!4822 thiss!1288)) (bitIndex!0 (size!2074 (buf!2420 (_2!4126 lt!140114))) (currentByte!4827 (_2!4126 lt!140114)) (currentBit!4822 (_2!4126 lt!140114)))) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!140456 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!140456 (bvsub (bitIndex!0 (size!2074 (buf!2420 thiss!1288)) (currentByte!4827 thiss!1288) (currentBit!4822 thiss!1288)) (bitIndex!0 (size!2074 (buf!2420 (_2!4126 lt!140114))) (currentByte!4827 (_2!4126 lt!140114)) (currentBit!4822 (_2!4126 lt!140114))))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!30508 (= lt!140456 (bitIndex!0 (size!2074 (buf!2420 (_2!4129 lt!140124))) (currentByte!4827 (_2!4129 lt!140124)) (currentBit!4822 (_2!4129 lt!140124))))))

(declare-fun moveBitIndex!0 (BitStream!3622 (_ BitVec 64)) tuple2!7748)

(assert (=> d!30508 (= lt!140455 (_2!4126 (moveBitIndex!0 (_2!4129 lt!140124) (bvsub (bitIndex!0 (size!2074 (buf!2420 thiss!1288)) (currentByte!4827 thiss!1288) (currentBit!4822 thiss!1288)) (bitIndex!0 (size!2074 (buf!2420 (_2!4126 lt!140114))) (currentByte!4827 (_2!4126 lt!140114)) (currentBit!4822 (_2!4126 lt!140114)))))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!3622 (_ BitVec 64)) Bool)

(assert (=> d!30508 (moveBitIndexPrecond!0 (_2!4129 lt!140124) (bvsub (bitIndex!0 (size!2074 (buf!2420 thiss!1288)) (currentByte!4827 thiss!1288) (currentBit!4822 thiss!1288)) (bitIndex!0 (size!2074 (buf!2420 (_2!4126 lt!140114))) (currentByte!4827 (_2!4126 lt!140114)) (currentBit!4822 (_2!4126 lt!140114)))))))

(assert (=> d!30508 (= (withMovedBitIndex!0 (_2!4129 lt!140124) (bvsub (bitIndex!0 (size!2074 (buf!2420 thiss!1288)) (currentByte!4827 thiss!1288) (currentBit!4822 thiss!1288)) (bitIndex!0 (size!2074 (buf!2420 (_2!4126 lt!140114))) (currentByte!4827 (_2!4126 lt!140114)) (currentBit!4822 (_2!4126 lt!140114))))) lt!140455)))

(declare-fun b!97141 () Bool)

(assert (=> b!97141 (= e!63667 (= (size!2074 (buf!2420 (_2!4129 lt!140124))) (size!2074 (buf!2420 lt!140455))))))

(assert (= (and d!30508 res!79712) b!97141))

(declare-fun m!140971 () Bool)

(assert (=> d!30508 m!140971))

(declare-fun m!140973 () Bool)

(assert (=> d!30508 m!140973))

(declare-fun m!140975 () Bool)

(assert (=> d!30508 m!140975))

(declare-fun m!140977 () Bool)

(assert (=> d!30508 m!140977))

(assert (=> b!97021 d!30508))

(declare-fun d!30516 () Bool)

(declare-fun lt!140459 () tuple2!7772)

(assert (=> d!30516 (= lt!140459 (readBit!0 (_1!4129 lt!140124)))))

(assert (=> d!30516 (= (readBitPure!0 (_1!4129 lt!140124)) (tuple2!7761 (_2!4138 lt!140459) (_1!4138 lt!140459)))))

(declare-fun bs!7462 () Bool)

(assert (= bs!7462 d!30516))

(declare-fun m!140979 () Bool)

(assert (=> bs!7462 m!140979))

(assert (=> b!97021 d!30516))

(declare-fun d!30518 () Bool)

(declare-fun e!63668 () Bool)

(assert (=> d!30518 e!63668))

(declare-fun res!79713 () Bool)

(assert (=> d!30518 (=> (not res!79713) (not e!63668))))

(declare-fun lt!140464 () (_ BitVec 64))

(declare-fun lt!140461 () (_ BitVec 64))

(declare-fun lt!140463 () (_ BitVec 64))

(assert (=> d!30518 (= res!79713 (= lt!140464 (bvsub lt!140461 lt!140463)))))

(assert (=> d!30518 (or (= (bvand lt!140461 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!140463 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!140461 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!140461 lt!140463) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!30518 (= lt!140463 (remainingBits!0 ((_ sign_extend 32) (size!2074 (buf!2420 thiss!1288))) ((_ sign_extend 32) (currentByte!4827 thiss!1288)) ((_ sign_extend 32) (currentBit!4822 thiss!1288))))))

(declare-fun lt!140465 () (_ BitVec 64))

(declare-fun lt!140462 () (_ BitVec 64))

(assert (=> d!30518 (= lt!140461 (bvmul lt!140465 lt!140462))))

(assert (=> d!30518 (or (= lt!140465 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!140462 (bvsdiv (bvmul lt!140465 lt!140462) lt!140465)))))

(assert (=> d!30518 (= lt!140462 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!30518 (= lt!140465 ((_ sign_extend 32) (size!2074 (buf!2420 thiss!1288))))))

(assert (=> d!30518 (= lt!140464 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4827 thiss!1288)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4822 thiss!1288))))))

(assert (=> d!30518 (invariant!0 (currentBit!4822 thiss!1288) (currentByte!4827 thiss!1288) (size!2074 (buf!2420 thiss!1288)))))

(assert (=> d!30518 (= (bitIndex!0 (size!2074 (buf!2420 thiss!1288)) (currentByte!4827 thiss!1288) (currentBit!4822 thiss!1288)) lt!140464)))

(declare-fun b!97142 () Bool)

(declare-fun res!79714 () Bool)

(assert (=> b!97142 (=> (not res!79714) (not e!63668))))

(assert (=> b!97142 (= res!79714 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!140464))))

(declare-fun b!97143 () Bool)

(declare-fun lt!140460 () (_ BitVec 64))

(assert (=> b!97143 (= e!63668 (bvsle lt!140464 (bvmul lt!140460 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!97143 (or (= lt!140460 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!140460 #b0000000000000000000000000000000000000000000000000000000000001000) lt!140460)))))

(assert (=> b!97143 (= lt!140460 ((_ sign_extend 32) (size!2074 (buf!2420 thiss!1288))))))

(assert (= (and d!30518 res!79713) b!97142))

(assert (= (and b!97142 res!79714) b!97143))

(assert (=> d!30518 m!140593))

(assert (=> d!30518 m!140589))

(assert (=> b!97021 d!30518))

(declare-fun b!97144 () Bool)

(declare-fun e!63672 () Bool)

(declare-fun lt!140476 () (_ BitVec 64))

(assert (=> b!97144 (= e!63672 (validate_offset_bits!1 ((_ sign_extend 32) (size!2074 (buf!2420 (_2!4126 lt!140072)))) ((_ sign_extend 32) (currentByte!4827 (_2!4126 lt!140072))) ((_ sign_extend 32) (currentBit!4822 (_2!4126 lt!140072))) lt!140476))))

(declare-fun lt!140488 () tuple2!7756)

(declare-fun b!97145 () Bool)

(declare-fun lt!140511 () tuple2!7754)

(declare-fun e!63671 () Bool)

(assert (=> b!97145 (= e!63671 (and (= (_2!4130 lt!140488) v!196) (= (_1!4130 lt!140488) (_2!4129 lt!140511))))))

(declare-fun lt!140501 () (_ BitVec 64))

(assert (=> b!97145 (= lt!140488 (readNLeastSignificantBitsLoopPure!0 (_1!4129 lt!140511) nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!140501))))

(declare-fun lt!140493 () Unit!5870)

(declare-fun lt!140479 () Unit!5870)

(assert (=> b!97145 (= lt!140493 lt!140479)))

(declare-fun lt!140467 () tuple2!7748)

(assert (=> b!97145 (validate_offset_bits!1 ((_ sign_extend 32) (size!2074 (buf!2420 (_2!4126 lt!140467)))) ((_ sign_extend 32) (currentByte!4827 (_2!4126 lt!140072))) ((_ sign_extend 32) (currentBit!4822 (_2!4126 lt!140072))) lt!140476)))

(assert (=> b!97145 (= lt!140479 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4126 lt!140072) (buf!2420 (_2!4126 lt!140467)) lt!140476))))

(assert (=> b!97145 e!63672))

(declare-fun res!79720 () Bool)

(assert (=> b!97145 (=> (not res!79720) (not e!63672))))

(assert (=> b!97145 (= res!79720 (and (= (size!2074 (buf!2420 (_2!4126 lt!140072))) (size!2074 (buf!2420 (_2!4126 lt!140467)))) (bvsge lt!140476 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!97145 (= lt!140476 ((_ sign_extend 32) (bvsub nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!97145 (or (= (bvand nBits!388 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b10000000000000000000000000000000)) (= (bvand nBits!388 #b10000000000000000000000000000000) (bvand (bvsub nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) #b10000000000000000000000000000000)))))

(assert (=> b!97145 (= lt!140501 (bvand v!196 (bvnot (onesLSBLong!0 (bvsub nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))))

(assert (=> b!97145 (or (= (bvand nBits!388 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b10000000000000000000000000000000)) (= (bvand nBits!388 #b10000000000000000000000000000000) (bvand (bvsub nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) #b10000000000000000000000000000000)))))

(assert (=> b!97145 (= lt!140511 (reader!0 (_2!4126 lt!140072) (_2!4126 lt!140467)))))

(declare-fun lt!140496 () BitStream!3622)

(declare-fun call!1194 () Bool)

(declare-fun bm!1191 () Bool)

(declare-fun lt!140497 () tuple2!7748)

(declare-fun c!6143 () Bool)

(assert (=> bm!1191 (= call!1194 (isPrefixOf!0 (ite c!6143 (_2!4126 lt!140072) lt!140496) (ite c!6143 (_2!4126 lt!140497) lt!140496)))))

(declare-fun b!97146 () Bool)

(declare-fun e!63673 () (_ BitVec 64))

(assert (=> b!97146 (= e!63673 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!388 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))))

(declare-fun b!97148 () Bool)

(declare-fun res!79716 () Bool)

(assert (=> b!97148 (=> (not res!79716) (not e!63671))))

(declare-fun lt!140505 () (_ BitVec 64))

(declare-fun lt!140468 () (_ BitVec 64))

(assert (=> b!97148 (= res!79716 (= (bitIndex!0 (size!2074 (buf!2420 (_2!4126 lt!140467))) (currentByte!4827 (_2!4126 lt!140467)) (currentBit!4822 (_2!4126 lt!140467))) (bvadd lt!140505 lt!140468)))))

(assert (=> b!97148 (or (not (= (bvand lt!140505 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!140468 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!140505 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!140505 lt!140468) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!97148 (= lt!140468 ((_ sign_extend 32) (bvsub nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!97148 (or (= (bvand nBits!388 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b10000000000000000000000000000000)) (= (bvand nBits!388 #b10000000000000000000000000000000) (bvand (bvsub nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) #b10000000000000000000000000000000)))))

(assert (=> b!97148 (= lt!140505 (bitIndex!0 (size!2074 (buf!2420 (_2!4126 lt!140072))) (currentByte!4827 (_2!4126 lt!140072)) (currentBit!4822 (_2!4126 lt!140072))))))

(declare-fun b!97149 () Bool)

(declare-fun lt!140485 () tuple2!7760)

(declare-fun lt!140484 () tuple2!7748)

(assert (=> b!97149 (= lt!140485 (readBitPure!0 (readerFrom!0 (_2!4126 lt!140484) (currentBit!4822 (_2!4126 lt!140072)) (currentByte!4827 (_2!4126 lt!140072)))))))

(declare-fun res!79723 () Bool)

(declare-fun lt!140471 () Bool)

(assert (=> b!97149 (= res!79723 (and (= (_2!4132 lt!140485) lt!140471) (= (_1!4132 lt!140485) (_2!4126 lt!140484))))))

(declare-fun e!63670 () Bool)

(assert (=> b!97149 (=> (not res!79723) (not e!63670))))

(declare-fun e!63674 () Bool)

(assert (=> b!97149 (= e!63674 e!63670)))

(declare-fun b!97150 () Bool)

(declare-fun e!63675 () tuple2!7748)

(declare-fun lt!140473 () Unit!5870)

(assert (=> b!97150 (= e!63675 (tuple2!7749 lt!140473 (_2!4126 lt!140072)))))

(assert (=> b!97150 (= lt!140496 (_2!4126 lt!140072))))

(assert (=> b!97150 (= lt!140473 (lemmaIsPrefixRefl!0 lt!140496))))

(assert (=> b!97150 call!1194))

(declare-fun b!97151 () Bool)

(declare-fun res!79718 () Bool)

(assert (=> b!97151 (= res!79718 (isPrefixOf!0 (_2!4126 lt!140072) (_2!4126 lt!140484)))))

(assert (=> b!97151 (=> (not res!79718) (not e!63674))))

(declare-fun b!97152 () Bool)

(declare-fun Unit!5895 () Unit!5870)

(assert (=> b!97152 (= e!63675 (tuple2!7749 Unit!5895 (_2!4126 lt!140497)))))

(assert (=> b!97152 (= lt!140471 (not (= (bvand v!196 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!388 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!97152 (= lt!140484 (appendBit!0 (_2!4126 lt!140072) lt!140471))))

(declare-fun res!79717 () Bool)

(assert (=> b!97152 (= res!79717 (= (size!2074 (buf!2420 (_2!4126 lt!140072))) (size!2074 (buf!2420 (_2!4126 lt!140484)))))))

(assert (=> b!97152 (=> (not res!79717) (not e!63674))))

(assert (=> b!97152 e!63674))

(declare-fun lt!140472 () tuple2!7748)

(assert (=> b!97152 (= lt!140472 lt!140484)))

(assert (=> b!97152 (= lt!140497 (appendNLeastSignificantBitsLoop!0 (_2!4126 lt!140472) v!196 nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(declare-fun lt!140481 () Unit!5870)

(assert (=> b!97152 (= lt!140481 (lemmaIsPrefixTransitive!0 (_2!4126 lt!140072) (_2!4126 lt!140472) (_2!4126 lt!140497)))))

(assert (=> b!97152 call!1194))

(declare-fun lt!140510 () Unit!5870)

(assert (=> b!97152 (= lt!140510 lt!140481)))

(assert (=> b!97152 (invariant!0 (currentBit!4822 (_2!4126 lt!140072)) (currentByte!4827 (_2!4126 lt!140072)) (size!2074 (buf!2420 (_2!4126 lt!140472))))))

(declare-fun lt!140480 () BitStream!3622)

(assert (=> b!97152 (= lt!140480 (BitStream!3623 (buf!2420 (_2!4126 lt!140472)) (currentByte!4827 (_2!4126 lt!140072)) (currentBit!4822 (_2!4126 lt!140072))))))

(assert (=> b!97152 (invariant!0 (currentBit!4822 lt!140480) (currentByte!4827 lt!140480) (size!2074 (buf!2420 (_2!4126 lt!140497))))))

(declare-fun lt!140507 () BitStream!3622)

(assert (=> b!97152 (= lt!140507 (BitStream!3623 (buf!2420 (_2!4126 lt!140497)) (currentByte!4827 lt!140480) (currentBit!4822 lt!140480)))))

(declare-fun lt!140475 () tuple2!7760)

(assert (=> b!97152 (= lt!140475 (readBitPure!0 lt!140480))))

(declare-fun lt!140483 () tuple2!7760)

(assert (=> b!97152 (= lt!140483 (readBitPure!0 lt!140507))))

(declare-fun lt!140500 () Unit!5870)

(assert (=> b!97152 (= lt!140500 (readBitPrefixLemma!0 lt!140480 (_2!4126 lt!140497)))))

(declare-fun res!79719 () Bool)

(assert (=> b!97152 (= res!79719 (= (bitIndex!0 (size!2074 (buf!2420 (_1!4132 lt!140475))) (currentByte!4827 (_1!4132 lt!140475)) (currentBit!4822 (_1!4132 lt!140475))) (bitIndex!0 (size!2074 (buf!2420 (_1!4132 lt!140483))) (currentByte!4827 (_1!4132 lt!140483)) (currentBit!4822 (_1!4132 lt!140483)))))))

(declare-fun e!63669 () Bool)

(assert (=> b!97152 (=> (not res!79719) (not e!63669))))

(assert (=> b!97152 e!63669))

(declare-fun lt!140506 () Unit!5870)

(assert (=> b!97152 (= lt!140506 lt!140500)))

(declare-fun lt!140502 () tuple2!7754)

(assert (=> b!97152 (= lt!140502 (reader!0 (_2!4126 lt!140072) (_2!4126 lt!140497)))))

(declare-fun lt!140498 () tuple2!7754)

(assert (=> b!97152 (= lt!140498 (reader!0 (_2!4126 lt!140472) (_2!4126 lt!140497)))))

(declare-fun lt!140508 () tuple2!7760)

(assert (=> b!97152 (= lt!140508 (readBitPure!0 (_1!4129 lt!140502)))))

(assert (=> b!97152 (= (_2!4132 lt!140508) lt!140471)))

(declare-fun lt!140495 () Unit!5870)

(declare-fun Unit!5896 () Unit!5870)

(assert (=> b!97152 (= lt!140495 Unit!5896)))

(declare-fun lt!140487 () (_ BitVec 64))

(assert (=> b!97152 (= lt!140487 (bvand v!196 (bvnot (onesLSBLong!0 (bvsub nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))))

(declare-fun lt!140490 () (_ BitVec 64))

(assert (=> b!97152 (= lt!140490 ((_ sign_extend 32) (bvsub nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun lt!140486 () Unit!5870)

(assert (=> b!97152 (= lt!140486 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4126 lt!140072) (buf!2420 (_2!4126 lt!140497)) lt!140490))))

(assert (=> b!97152 (validate_offset_bits!1 ((_ sign_extend 32) (size!2074 (buf!2420 (_2!4126 lt!140497)))) ((_ sign_extend 32) (currentByte!4827 (_2!4126 lt!140072))) ((_ sign_extend 32) (currentBit!4822 (_2!4126 lt!140072))) lt!140490)))

(declare-fun lt!140494 () Unit!5870)

(assert (=> b!97152 (= lt!140494 lt!140486)))

(declare-fun lt!140477 () tuple2!7756)

(assert (=> b!97152 (= lt!140477 (readNLeastSignificantBitsLoopPure!0 (_1!4129 lt!140502) nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!140487))))

(declare-fun lt!140482 () (_ BitVec 64))

(assert (=> b!97152 (= lt!140482 ((_ sign_extend 32) (bvsub (bvsub nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))))

(declare-fun lt!140492 () Unit!5870)

(assert (=> b!97152 (= lt!140492 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4126 lt!140472) (buf!2420 (_2!4126 lt!140497)) lt!140482))))

(assert (=> b!97152 (validate_offset_bits!1 ((_ sign_extend 32) (size!2074 (buf!2420 (_2!4126 lt!140497)))) ((_ sign_extend 32) (currentByte!4827 (_2!4126 lt!140472))) ((_ sign_extend 32) (currentBit!4822 (_2!4126 lt!140472))) lt!140482)))

(declare-fun lt!140470 () Unit!5870)

(assert (=> b!97152 (= lt!140470 lt!140492)))

(declare-fun lt!140469 () tuple2!7756)

(assert (=> b!97152 (= lt!140469 (readNLeastSignificantBitsLoopPure!0 (_1!4129 lt!140498) nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvor lt!140487 (ite (_2!4132 lt!140508) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!388 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!140474 () tuple2!7756)

(assert (=> b!97152 (= lt!140474 (readNLeastSignificantBitsLoopPure!0 (_1!4129 lt!140502) nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!140487))))

(declare-fun c!6142 () Bool)

(assert (=> b!97152 (= c!6142 (_2!4132 (readBitPure!0 (_1!4129 lt!140502))))))

(declare-fun lt!140489 () tuple2!7756)

(assert (=> b!97152 (= lt!140489 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4129 lt!140502) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvor lt!140487 e!63673)))))

(declare-fun lt!140509 () Unit!5870)

(assert (=> b!97152 (= lt!140509 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4129 lt!140502) nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!140487))))

(assert (=> b!97152 (and (= (_2!4130 lt!140474) (_2!4130 lt!140489)) (= (_1!4130 lt!140474) (_1!4130 lt!140489)))))

(declare-fun lt!140499 () Unit!5870)

(assert (=> b!97152 (= lt!140499 lt!140509)))

(assert (=> b!97152 (= (_1!4129 lt!140502) (withMovedBitIndex!0 (_2!4129 lt!140502) (bvsub (bitIndex!0 (size!2074 (buf!2420 (_2!4126 lt!140072))) (currentByte!4827 (_2!4126 lt!140072)) (currentBit!4822 (_2!4126 lt!140072))) (bitIndex!0 (size!2074 (buf!2420 (_2!4126 lt!140497))) (currentByte!4827 (_2!4126 lt!140497)) (currentBit!4822 (_2!4126 lt!140497))))))))

(declare-fun lt!140504 () Unit!5870)

(declare-fun Unit!5897 () Unit!5870)

(assert (=> b!97152 (= lt!140504 Unit!5897)))

(assert (=> b!97152 (= (_1!4129 lt!140498) (withMovedBitIndex!0 (_2!4129 lt!140498) (bvsub (bitIndex!0 (size!2074 (buf!2420 (_2!4126 lt!140472))) (currentByte!4827 (_2!4126 lt!140472)) (currentBit!4822 (_2!4126 lt!140472))) (bitIndex!0 (size!2074 (buf!2420 (_2!4126 lt!140497))) (currentByte!4827 (_2!4126 lt!140497)) (currentBit!4822 (_2!4126 lt!140497))))))))

(declare-fun lt!140478 () Unit!5870)

(declare-fun Unit!5898 () Unit!5870)

(assert (=> b!97152 (= lt!140478 Unit!5898)))

(assert (=> b!97152 (= (bitIndex!0 (size!2074 (buf!2420 (_2!4126 lt!140072))) (currentByte!4827 (_2!4126 lt!140072)) (currentBit!4822 (_2!4126 lt!140072))) (bvsub (bitIndex!0 (size!2074 (buf!2420 (_2!4126 lt!140472))) (currentByte!4827 (_2!4126 lt!140472)) (currentBit!4822 (_2!4126 lt!140472))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!140503 () Unit!5870)

(declare-fun Unit!5899 () Unit!5870)

(assert (=> b!97152 (= lt!140503 Unit!5899)))

(assert (=> b!97152 (= (_2!4130 lt!140477) (_2!4130 lt!140469))))

(declare-fun lt!140491 () Unit!5870)

(declare-fun Unit!5900 () Unit!5870)

(assert (=> b!97152 (= lt!140491 Unit!5900)))

(assert (=> b!97152 (= (_1!4130 lt!140477) (_2!4129 lt!140502))))

(declare-fun d!30522 () Bool)

(assert (=> d!30522 e!63671))

(declare-fun res!79721 () Bool)

(assert (=> d!30522 (=> (not res!79721) (not e!63671))))

(assert (=> d!30522 (= res!79721 (= (size!2074 (buf!2420 (_2!4126 lt!140072))) (size!2074 (buf!2420 (_2!4126 lt!140467)))))))

(assert (=> d!30522 (= lt!140467 e!63675)))

(assert (=> d!30522 (= c!6143 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) nBits!388))))

(assert (=> d!30522 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) nBits!388) (bvsle nBits!388 #b00000000000000000000000001000000))))

(assert (=> d!30522 (= (appendNLeastSignificantBitsLoop!0 (_2!4126 lt!140072) v!196 nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!140467)))

(declare-fun b!97147 () Bool)

(assert (=> b!97147 (= e!63670 (= (bitIndex!0 (size!2074 (buf!2420 (_1!4132 lt!140485))) (currentByte!4827 (_1!4132 lt!140485)) (currentBit!4822 (_1!4132 lt!140485))) (bitIndex!0 (size!2074 (buf!2420 (_2!4126 lt!140484))) (currentByte!4827 (_2!4126 lt!140484)) (currentBit!4822 (_2!4126 lt!140484)))))))

(declare-fun b!97153 () Bool)

(declare-fun res!79724 () Bool)

(assert (=> b!97153 (=> (not res!79724) (not e!63671))))

(assert (=> b!97153 (= res!79724 (isPrefixOf!0 (_2!4126 lt!140072) (_2!4126 lt!140467)))))

(declare-fun b!97154 () Bool)

(declare-fun res!79722 () Bool)

(assert (=> b!97154 (= res!79722 (= (bitIndex!0 (size!2074 (buf!2420 (_2!4126 lt!140484))) (currentByte!4827 (_2!4126 lt!140484)) (currentBit!4822 (_2!4126 lt!140484))) (bvadd (bitIndex!0 (size!2074 (buf!2420 (_2!4126 lt!140072))) (currentByte!4827 (_2!4126 lt!140072)) (currentBit!4822 (_2!4126 lt!140072))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!97154 (=> (not res!79722) (not e!63674))))

(declare-fun b!97155 () Bool)

(assert (=> b!97155 (= e!63669 (= (_2!4132 lt!140475) (_2!4132 lt!140483)))))

(declare-fun b!97156 () Bool)

(assert (=> b!97156 (= e!63673 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (= (and d!30522 c!6143) b!97152))

(assert (= (and d!30522 (not c!6143)) b!97150))

(assert (= (and b!97152 res!79717) b!97154))

(assert (= (and b!97154 res!79722) b!97151))

(assert (= (and b!97151 res!79718) b!97149))

(assert (= (and b!97149 res!79723) b!97147))

(assert (= (and b!97152 res!79719) b!97155))

(assert (= (and b!97152 c!6142) b!97146))

(assert (= (and b!97152 (not c!6142)) b!97156))

(assert (= (or b!97152 b!97150) bm!1191))

(assert (= (and d!30522 res!79721) b!97148))

(assert (= (and b!97148 res!79716) b!97153))

(assert (= (and b!97153 res!79724) b!97145))

(assert (= (and b!97145 res!79720) b!97144))

(declare-fun m!140987 () Bool)

(assert (=> b!97148 m!140987))

(assert (=> b!97148 m!140691))

(declare-fun m!140989 () Bool)

(assert (=> b!97152 m!140989))

(declare-fun m!140991 () Bool)

(assert (=> b!97152 m!140991))

(declare-fun m!140993 () Bool)

(assert (=> b!97152 m!140993))

(declare-fun m!140995 () Bool)

(assert (=> b!97152 m!140995))

(declare-fun m!140997 () Bool)

(assert (=> b!97152 m!140997))

(declare-fun m!140999 () Bool)

(assert (=> b!97152 m!140999))

(declare-fun m!141001 () Bool)

(assert (=> b!97152 m!141001))

(declare-fun m!141003 () Bool)

(assert (=> b!97152 m!141003))

(declare-fun m!141005 () Bool)

(assert (=> b!97152 m!141005))

(declare-fun m!141007 () Bool)

(assert (=> b!97152 m!141007))

(assert (=> b!97152 m!140691))

(declare-fun m!141009 () Bool)

(assert (=> b!97152 m!141009))

(assert (=> b!97152 m!140995))

(declare-fun m!141011 () Bool)

(assert (=> b!97152 m!141011))

(declare-fun m!141013 () Bool)

(assert (=> b!97152 m!141013))

(declare-fun m!141015 () Bool)

(assert (=> b!97152 m!141015))

(declare-fun m!141017 () Bool)

(assert (=> b!97152 m!141017))

(declare-fun m!141019 () Bool)

(assert (=> b!97152 m!141019))

(declare-fun m!141021 () Bool)

(assert (=> b!97152 m!141021))

(declare-fun m!141023 () Bool)

(assert (=> b!97152 m!141023))

(declare-fun m!141025 () Bool)

(assert (=> b!97152 m!141025))

(declare-fun m!141027 () Bool)

(assert (=> b!97152 m!141027))

(declare-fun m!141029 () Bool)

(assert (=> b!97152 m!141029))

(declare-fun m!141031 () Bool)

(assert (=> b!97152 m!141031))

(declare-fun m!141033 () Bool)

(assert (=> b!97152 m!141033))

(declare-fun m!141035 () Bool)

(assert (=> b!97152 m!141035))

(declare-fun m!141037 () Bool)

(assert (=> b!97152 m!141037))

(declare-fun m!141039 () Bool)

(assert (=> b!97152 m!141039))

(declare-fun m!141041 () Bool)

(assert (=> b!97152 m!141041))

(declare-fun m!141043 () Bool)

(assert (=> bm!1191 m!141043))

(declare-fun m!141045 () Bool)

(assert (=> b!97144 m!141045))

(declare-fun m!141047 () Bool)

(assert (=> b!97145 m!141047))

(declare-fun m!141049 () Bool)

(assert (=> b!97145 m!141049))

(assert (=> b!97145 m!141031))

(declare-fun m!141051 () Bool)

(assert (=> b!97145 m!141051))

(declare-fun m!141053 () Bool)

(assert (=> b!97145 m!141053))

(declare-fun m!141055 () Bool)

(assert (=> b!97147 m!141055))

(declare-fun m!141057 () Bool)

(assert (=> b!97147 m!141057))

(declare-fun m!141059 () Bool)

(assert (=> b!97153 m!141059))

(declare-fun m!141061 () Bool)

(assert (=> b!97150 m!141061))

(declare-fun m!141063 () Bool)

(assert (=> b!97149 m!141063))

(assert (=> b!97149 m!141063))

(declare-fun m!141065 () Bool)

(assert (=> b!97149 m!141065))

(declare-fun m!141067 () Bool)

(assert (=> b!97151 m!141067))

(assert (=> b!97154 m!141057))

(assert (=> b!97154 m!140691))

(assert (=> b!97021 d!30522))

(declare-fun lt!140530 () tuple2!7754)

(declare-fun b!97160 () Bool)

(declare-fun e!63680 () Bool)

(declare-fun lt!140529 () (_ BitVec 64))

(declare-fun lt!140517 () (_ BitVec 64))

(assert (=> b!97160 (= e!63680 (= (_1!4129 lt!140530) (withMovedBitIndex!0 (_2!4129 lt!140530) (bvsub lt!140517 lt!140529))))))

(assert (=> b!97160 (or (= (bvand lt!140517 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!140529 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!140517 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!140517 lt!140529) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!97160 (= lt!140529 (bitIndex!0 (size!2074 (buf!2420 (_2!4126 lt!140114))) (currentByte!4827 (_2!4126 lt!140114)) (currentBit!4822 (_2!4126 lt!140114))))))

(assert (=> b!97160 (= lt!140517 (bitIndex!0 (size!2074 (buf!2420 thiss!1288)) (currentByte!4827 thiss!1288) (currentBit!4822 thiss!1288)))))

(declare-fun b!97161 () Bool)

(declare-fun e!63679 () Unit!5870)

(declare-fun Unit!5902 () Unit!5870)

(assert (=> b!97161 (= e!63679 Unit!5902)))

(declare-fun b!97162 () Bool)

(declare-fun res!79729 () Bool)

(assert (=> b!97162 (=> (not res!79729) (not e!63680))))

(assert (=> b!97162 (= res!79729 (isPrefixOf!0 (_1!4129 lt!140530) thiss!1288))))

(declare-fun b!97163 () Bool)

(declare-fun res!79730 () Bool)

(assert (=> b!97163 (=> (not res!79730) (not e!63680))))

(assert (=> b!97163 (= res!79730 (isPrefixOf!0 (_2!4129 lt!140530) (_2!4126 lt!140114)))))

(declare-fun d!30526 () Bool)

(assert (=> d!30526 e!63680))

(declare-fun res!79728 () Bool)

(assert (=> d!30526 (=> (not res!79728) (not e!63680))))

(assert (=> d!30526 (= res!79728 (isPrefixOf!0 (_1!4129 lt!140530) (_2!4129 lt!140530)))))

(declare-fun lt!140534 () BitStream!3622)

(assert (=> d!30526 (= lt!140530 (tuple2!7755 lt!140534 (_2!4126 lt!140114)))))

(declare-fun lt!140525 () Unit!5870)

(declare-fun lt!140531 () Unit!5870)

(assert (=> d!30526 (= lt!140525 lt!140531)))

(assert (=> d!30526 (isPrefixOf!0 lt!140534 (_2!4126 lt!140114))))

(assert (=> d!30526 (= lt!140531 (lemmaIsPrefixTransitive!0 lt!140534 (_2!4126 lt!140114) (_2!4126 lt!140114)))))

(declare-fun lt!140526 () Unit!5870)

(declare-fun lt!140515 () Unit!5870)

(assert (=> d!30526 (= lt!140526 lt!140515)))

(assert (=> d!30526 (isPrefixOf!0 lt!140534 (_2!4126 lt!140114))))

(assert (=> d!30526 (= lt!140515 (lemmaIsPrefixTransitive!0 lt!140534 thiss!1288 (_2!4126 lt!140114)))))

(declare-fun lt!140520 () Unit!5870)

(assert (=> d!30526 (= lt!140520 e!63679)))

(declare-fun c!6144 () Bool)

(assert (=> d!30526 (= c!6144 (not (= (size!2074 (buf!2420 thiss!1288)) #b00000000000000000000000000000000)))))

(declare-fun lt!140523 () Unit!5870)

(declare-fun lt!140527 () Unit!5870)

(assert (=> d!30526 (= lt!140523 lt!140527)))

(assert (=> d!30526 (isPrefixOf!0 (_2!4126 lt!140114) (_2!4126 lt!140114))))

(assert (=> d!30526 (= lt!140527 (lemmaIsPrefixRefl!0 (_2!4126 lt!140114)))))

(declare-fun lt!140522 () Unit!5870)

(declare-fun lt!140519 () Unit!5870)

(assert (=> d!30526 (= lt!140522 lt!140519)))

(assert (=> d!30526 (= lt!140519 (lemmaIsPrefixRefl!0 (_2!4126 lt!140114)))))

(declare-fun lt!140528 () Unit!5870)

(declare-fun lt!140532 () Unit!5870)

(assert (=> d!30526 (= lt!140528 lt!140532)))

(assert (=> d!30526 (isPrefixOf!0 lt!140534 lt!140534)))

(assert (=> d!30526 (= lt!140532 (lemmaIsPrefixRefl!0 lt!140534))))

(declare-fun lt!140524 () Unit!5870)

(declare-fun lt!140533 () Unit!5870)

(assert (=> d!30526 (= lt!140524 lt!140533)))

(assert (=> d!30526 (isPrefixOf!0 thiss!1288 thiss!1288)))

(assert (=> d!30526 (= lt!140533 (lemmaIsPrefixRefl!0 thiss!1288))))

(assert (=> d!30526 (= lt!140534 (BitStream!3623 (buf!2420 (_2!4126 lt!140114)) (currentByte!4827 thiss!1288) (currentBit!4822 thiss!1288)))))

(assert (=> d!30526 (isPrefixOf!0 thiss!1288 (_2!4126 lt!140114))))

(assert (=> d!30526 (= (reader!0 thiss!1288 (_2!4126 lt!140114)) lt!140530)))

(declare-fun b!97164 () Bool)

(declare-fun lt!140516 () Unit!5870)

(assert (=> b!97164 (= e!63679 lt!140516)))

(declare-fun lt!140518 () (_ BitVec 64))

(assert (=> b!97164 (= lt!140518 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!140521 () (_ BitVec 64))

(assert (=> b!97164 (= lt!140521 (bitIndex!0 (size!2074 (buf!2420 thiss!1288)) (currentByte!4827 thiss!1288) (currentBit!4822 thiss!1288)))))

(assert (=> b!97164 (= lt!140516 (arrayBitRangesEqSymmetric!0 (buf!2420 thiss!1288) (buf!2420 (_2!4126 lt!140114)) lt!140518 lt!140521))))

(assert (=> b!97164 (arrayBitRangesEq!0 (buf!2420 (_2!4126 lt!140114)) (buf!2420 thiss!1288) lt!140518 lt!140521)))

(assert (= (and d!30526 c!6144) b!97164))

(assert (= (and d!30526 (not c!6144)) b!97161))

(assert (= (and d!30526 res!79728) b!97162))

(assert (= (and b!97162 res!79729) b!97163))

(assert (= (and b!97163 res!79730) b!97160))

(assert (=> d!30526 m!140931))

(declare-fun m!141073 () Bool)

(assert (=> d!30526 m!141073))

(declare-fun m!141075 () Bool)

(assert (=> d!30526 m!141075))

(declare-fun m!141077 () Bool)

(assert (=> d!30526 m!141077))

(declare-fun m!141079 () Bool)

(assert (=> d!30526 m!141079))

(assert (=> d!30526 m!140875))

(declare-fun m!141081 () Bool)

(assert (=> d!30526 m!141081))

(assert (=> d!30526 m!140879))

(declare-fun m!141083 () Bool)

(assert (=> d!30526 m!141083))

(declare-fun m!141085 () Bool)

(assert (=> d!30526 m!141085))

(declare-fun m!141087 () Bool)

(assert (=> d!30526 m!141087))

(declare-fun m!141089 () Bool)

(assert (=> b!97163 m!141089))

(assert (=> b!97164 m!140607))

(declare-fun m!141091 () Bool)

(assert (=> b!97164 m!141091))

(declare-fun m!141093 () Bool)

(assert (=> b!97164 m!141093))

(declare-fun m!141095 () Bool)

(assert (=> b!97160 m!141095))

(assert (=> b!97160 m!140717))

(assert (=> b!97160 m!140607))

(declare-fun m!141097 () Bool)

(assert (=> b!97162 m!141097))

(assert (=> b!97021 d!30526))

(declare-fun d!30532 () Bool)

(declare-fun e!63681 () Bool)

(assert (=> d!30532 e!63681))

(declare-fun res!79731 () Bool)

(assert (=> d!30532 (=> (not res!79731) (not e!63681))))

(declare-fun lt!140539 () (_ BitVec 64))

(declare-fun lt!140536 () (_ BitVec 64))

(declare-fun lt!140538 () (_ BitVec 64))

(assert (=> d!30532 (= res!79731 (= lt!140539 (bvsub lt!140536 lt!140538)))))

(assert (=> d!30532 (or (= (bvand lt!140536 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!140538 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!140536 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!140536 lt!140538) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!30532 (= lt!140538 (remainingBits!0 ((_ sign_extend 32) (size!2074 (buf!2420 (_2!4126 lt!140114)))) ((_ sign_extend 32) (currentByte!4827 (_2!4126 lt!140114))) ((_ sign_extend 32) (currentBit!4822 (_2!4126 lt!140114)))))))

(declare-fun lt!140540 () (_ BitVec 64))

(declare-fun lt!140537 () (_ BitVec 64))

(assert (=> d!30532 (= lt!140536 (bvmul lt!140540 lt!140537))))

(assert (=> d!30532 (or (= lt!140540 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!140537 (bvsdiv (bvmul lt!140540 lt!140537) lt!140540)))))

(assert (=> d!30532 (= lt!140537 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!30532 (= lt!140540 ((_ sign_extend 32) (size!2074 (buf!2420 (_2!4126 lt!140114)))))))

(assert (=> d!30532 (= lt!140539 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4827 (_2!4126 lt!140114))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4822 (_2!4126 lt!140114)))))))

(assert (=> d!30532 (invariant!0 (currentBit!4822 (_2!4126 lt!140114)) (currentByte!4827 (_2!4126 lt!140114)) (size!2074 (buf!2420 (_2!4126 lt!140114))))))

(assert (=> d!30532 (= (bitIndex!0 (size!2074 (buf!2420 (_2!4126 lt!140114))) (currentByte!4827 (_2!4126 lt!140114)) (currentBit!4822 (_2!4126 lt!140114))) lt!140539)))

(declare-fun b!97165 () Bool)

(declare-fun res!79732 () Bool)

(assert (=> b!97165 (=> (not res!79732) (not e!63681))))

(assert (=> b!97165 (= res!79732 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!140539))))

(declare-fun b!97166 () Bool)

(declare-fun lt!140535 () (_ BitVec 64))

(assert (=> b!97166 (= e!63681 (bvsle lt!140539 (bvmul lt!140535 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!97166 (or (= lt!140535 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!140535 #b0000000000000000000000000000000000000000000000000000000000001000) lt!140535)))))

(assert (=> b!97166 (= lt!140535 ((_ sign_extend 32) (size!2074 (buf!2420 (_2!4126 lt!140114)))))))

(assert (= (and d!30532 res!79731) b!97165))

(assert (= (and b!97165 res!79732) b!97166))

(declare-fun m!141099 () Bool)

(assert (=> d!30532 m!141099))

(declare-fun m!141101 () Bool)

(assert (=> d!30532 m!141101))

(assert (=> b!97021 d!30532))

(declare-fun d!30534 () Bool)

(declare-fun e!63682 () Bool)

(assert (=> d!30534 e!63682))

(declare-fun res!79733 () Bool)

(assert (=> d!30534 (=> (not res!79733) (not e!63682))))

(declare-fun lt!140544 () (_ BitVec 64))

(declare-fun lt!140543 () BitStream!3622)

(assert (=> d!30534 (= res!79733 (= (bvadd lt!140544 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!2074 (buf!2420 lt!140543)) (currentByte!4827 lt!140543) (currentBit!4822 lt!140543))))))

(assert (=> d!30534 (or (not (= (bvand lt!140544 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!140544 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!140544 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!30534 (= lt!140544 (bitIndex!0 (size!2074 (buf!2420 (_1!4129 lt!140124))) (currentByte!4827 (_1!4129 lt!140124)) (currentBit!4822 (_1!4129 lt!140124))))))

(assert (=> d!30534 (= lt!140543 (_2!4126 (moveBitIndex!0 (_1!4129 lt!140124) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!30534 (moveBitIndexPrecond!0 (_1!4129 lt!140124) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!30534 (= (withMovedBitIndex!0 (_1!4129 lt!140124) #b0000000000000000000000000000000000000000000000000000000000000001) lt!140543)))

(declare-fun b!97167 () Bool)

(assert (=> b!97167 (= e!63682 (= (size!2074 (buf!2420 (_1!4129 lt!140124))) (size!2074 (buf!2420 lt!140543))))))

(assert (= (and d!30534 res!79733) b!97167))

(declare-fun m!141103 () Bool)

(assert (=> d!30534 m!141103))

(declare-fun m!141105 () Bool)

(assert (=> d!30534 m!141105))

(declare-fun m!141107 () Bool)

(assert (=> d!30534 m!141107))

(declare-fun m!141109 () Bool)

(assert (=> d!30534 m!141109))

(assert (=> b!97021 d!30534))

(declare-fun d!30536 () Bool)

(assert (=> d!30536 (validate_offset_bits!1 ((_ sign_extend 32) (size!2074 (buf!2420 (_2!4126 lt!140114)))) ((_ sign_extend 32) (currentByte!4827 (_2!4126 lt!140072))) ((_ sign_extend 32) (currentBit!4822 (_2!4126 lt!140072))) lt!140085)))

(declare-fun lt!140546 () Unit!5870)

(assert (=> d!30536 (= lt!140546 (choose!9 (_2!4126 lt!140072) (buf!2420 (_2!4126 lt!140114)) lt!140085 (BitStream!3623 (buf!2420 (_2!4126 lt!140114)) (currentByte!4827 (_2!4126 lt!140072)) (currentBit!4822 (_2!4126 lt!140072)))))))

(assert (=> d!30536 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4126 lt!140072) (buf!2420 (_2!4126 lt!140114)) lt!140085) lt!140546)))

(declare-fun bs!7467 () Bool)

(assert (= bs!7467 d!30536))

(assert (=> bs!7467 m!140615))

(declare-fun m!141113 () Bool)

(assert (=> bs!7467 m!141113))

(assert (=> b!97021 d!30536))

(declare-fun lt!140562 () tuple2!7754)

(declare-fun lt!140549 () (_ BitVec 64))

(declare-fun e!63684 () Bool)

(declare-fun lt!140561 () (_ BitVec 64))

(declare-fun b!97168 () Bool)

(assert (=> b!97168 (= e!63684 (= (_1!4129 lt!140562) (withMovedBitIndex!0 (_2!4129 lt!140562) (bvsub lt!140549 lt!140561))))))

(assert (=> b!97168 (or (= (bvand lt!140549 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!140561 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!140549 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!140549 lt!140561) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!97168 (= lt!140561 (bitIndex!0 (size!2074 (buf!2420 (_2!4126 lt!140114))) (currentByte!4827 (_2!4126 lt!140114)) (currentBit!4822 (_2!4126 lt!140114))))))

(assert (=> b!97168 (= lt!140549 (bitIndex!0 (size!2074 (buf!2420 (_2!4126 lt!140072))) (currentByte!4827 (_2!4126 lt!140072)) (currentBit!4822 (_2!4126 lt!140072))))))

(declare-fun b!97169 () Bool)

(declare-fun e!63683 () Unit!5870)

(declare-fun Unit!5904 () Unit!5870)

(assert (=> b!97169 (= e!63683 Unit!5904)))

(declare-fun b!97170 () Bool)

(declare-fun res!79735 () Bool)

(assert (=> b!97170 (=> (not res!79735) (not e!63684))))

(assert (=> b!97170 (= res!79735 (isPrefixOf!0 (_1!4129 lt!140562) (_2!4126 lt!140072)))))

(declare-fun b!97171 () Bool)

(declare-fun res!79736 () Bool)

(assert (=> b!97171 (=> (not res!79736) (not e!63684))))

(assert (=> b!97171 (= res!79736 (isPrefixOf!0 (_2!4129 lt!140562) (_2!4126 lt!140114)))))

(declare-fun d!30540 () Bool)

(assert (=> d!30540 e!63684))

(declare-fun res!79734 () Bool)

(assert (=> d!30540 (=> (not res!79734) (not e!63684))))

(assert (=> d!30540 (= res!79734 (isPrefixOf!0 (_1!4129 lt!140562) (_2!4129 lt!140562)))))

(declare-fun lt!140566 () BitStream!3622)

(assert (=> d!30540 (= lt!140562 (tuple2!7755 lt!140566 (_2!4126 lt!140114)))))

(declare-fun lt!140557 () Unit!5870)

(declare-fun lt!140563 () Unit!5870)

(assert (=> d!30540 (= lt!140557 lt!140563)))

(assert (=> d!30540 (isPrefixOf!0 lt!140566 (_2!4126 lt!140114))))

(assert (=> d!30540 (= lt!140563 (lemmaIsPrefixTransitive!0 lt!140566 (_2!4126 lt!140114) (_2!4126 lt!140114)))))

(declare-fun lt!140558 () Unit!5870)

(declare-fun lt!140547 () Unit!5870)

(assert (=> d!30540 (= lt!140558 lt!140547)))

(assert (=> d!30540 (isPrefixOf!0 lt!140566 (_2!4126 lt!140114))))

(assert (=> d!30540 (= lt!140547 (lemmaIsPrefixTransitive!0 lt!140566 (_2!4126 lt!140072) (_2!4126 lt!140114)))))

(declare-fun lt!140552 () Unit!5870)

(assert (=> d!30540 (= lt!140552 e!63683)))

(declare-fun c!6145 () Bool)

(assert (=> d!30540 (= c!6145 (not (= (size!2074 (buf!2420 (_2!4126 lt!140072))) #b00000000000000000000000000000000)))))

(declare-fun lt!140555 () Unit!5870)

(declare-fun lt!140559 () Unit!5870)

(assert (=> d!30540 (= lt!140555 lt!140559)))

(assert (=> d!30540 (isPrefixOf!0 (_2!4126 lt!140114) (_2!4126 lt!140114))))

(assert (=> d!30540 (= lt!140559 (lemmaIsPrefixRefl!0 (_2!4126 lt!140114)))))

(declare-fun lt!140554 () Unit!5870)

(declare-fun lt!140551 () Unit!5870)

(assert (=> d!30540 (= lt!140554 lt!140551)))

(assert (=> d!30540 (= lt!140551 (lemmaIsPrefixRefl!0 (_2!4126 lt!140114)))))

(declare-fun lt!140560 () Unit!5870)

(declare-fun lt!140564 () Unit!5870)

(assert (=> d!30540 (= lt!140560 lt!140564)))

(assert (=> d!30540 (isPrefixOf!0 lt!140566 lt!140566)))

(assert (=> d!30540 (= lt!140564 (lemmaIsPrefixRefl!0 lt!140566))))

(declare-fun lt!140556 () Unit!5870)

(declare-fun lt!140565 () Unit!5870)

(assert (=> d!30540 (= lt!140556 lt!140565)))

(assert (=> d!30540 (isPrefixOf!0 (_2!4126 lt!140072) (_2!4126 lt!140072))))

(assert (=> d!30540 (= lt!140565 (lemmaIsPrefixRefl!0 (_2!4126 lt!140072)))))

(assert (=> d!30540 (= lt!140566 (BitStream!3623 (buf!2420 (_2!4126 lt!140114)) (currentByte!4827 (_2!4126 lt!140072)) (currentBit!4822 (_2!4126 lt!140072))))))

(assert (=> d!30540 (isPrefixOf!0 (_2!4126 lt!140072) (_2!4126 lt!140114))))

(assert (=> d!30540 (= (reader!0 (_2!4126 lt!140072) (_2!4126 lt!140114)) lt!140562)))

(declare-fun b!97172 () Bool)

(declare-fun lt!140548 () Unit!5870)

(assert (=> b!97172 (= e!63683 lt!140548)))

(declare-fun lt!140550 () (_ BitVec 64))

(assert (=> b!97172 (= lt!140550 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!140553 () (_ BitVec 64))

(assert (=> b!97172 (= lt!140553 (bitIndex!0 (size!2074 (buf!2420 (_2!4126 lt!140072))) (currentByte!4827 (_2!4126 lt!140072)) (currentBit!4822 (_2!4126 lt!140072))))))

(assert (=> b!97172 (= lt!140548 (arrayBitRangesEqSymmetric!0 (buf!2420 (_2!4126 lt!140072)) (buf!2420 (_2!4126 lt!140114)) lt!140550 lt!140553))))

(assert (=> b!97172 (arrayBitRangesEq!0 (buf!2420 (_2!4126 lt!140114)) (buf!2420 (_2!4126 lt!140072)) lt!140550 lt!140553)))

(assert (= (and d!30540 c!6145) b!97172))

(assert (= (and d!30540 (not c!6145)) b!97169))

(assert (= (and d!30540 res!79734) b!97170))

(assert (= (and b!97170 res!79735) b!97171))

(assert (= (and b!97171 res!79736) b!97168))

(declare-fun m!141115 () Bool)

(assert (=> d!30540 m!141115))

(assert (=> d!30540 m!141073))

(declare-fun m!141117 () Bool)

(assert (=> d!30540 m!141117))

(declare-fun m!141119 () Bool)

(assert (=> d!30540 m!141119))

(declare-fun m!141121 () Bool)

(assert (=> d!30540 m!141121))

(declare-fun m!141123 () Bool)

(assert (=> d!30540 m!141123))

(declare-fun m!141125 () Bool)

(assert (=> d!30540 m!141125))

(declare-fun m!141127 () Bool)

(assert (=> d!30540 m!141127))

(declare-fun m!141129 () Bool)

(assert (=> d!30540 m!141129))

(assert (=> d!30540 m!141085))

(declare-fun m!141131 () Bool)

(assert (=> d!30540 m!141131))

(declare-fun m!141133 () Bool)

(assert (=> b!97171 m!141133))

(assert (=> b!97172 m!140691))

(declare-fun m!141135 () Bool)

(assert (=> b!97172 m!141135))

(declare-fun m!141137 () Bool)

(assert (=> b!97172 m!141137))

(declare-fun m!141139 () Bool)

(assert (=> b!97168 m!141139))

(assert (=> b!97168 m!140717))

(assert (=> b!97168 m!140691))

(declare-fun m!141141 () Bool)

(assert (=> b!97170 m!141141))

(assert (=> b!97021 d!30540))

(declare-fun d!30542 () Bool)

(declare-fun e!63685 () Bool)

(assert (=> d!30542 e!63685))

(declare-fun res!79737 () Bool)

(assert (=> d!30542 (=> (not res!79737) (not e!63685))))

(declare-fun lt!140571 () (_ BitVec 64))

(declare-fun lt!140570 () (_ BitVec 64))

(declare-fun lt!140568 () (_ BitVec 64))

(assert (=> d!30542 (= res!79737 (= lt!140571 (bvsub lt!140568 lt!140570)))))

(assert (=> d!30542 (or (= (bvand lt!140568 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!140570 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!140568 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!140568 lt!140570) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!30542 (= lt!140570 (remainingBits!0 ((_ sign_extend 32) (size!2074 (buf!2420 (_1!4132 lt!140089)))) ((_ sign_extend 32) (currentByte!4827 (_1!4132 lt!140089))) ((_ sign_extend 32) (currentBit!4822 (_1!4132 lt!140089)))))))

(declare-fun lt!140572 () (_ BitVec 64))

(declare-fun lt!140569 () (_ BitVec 64))

(assert (=> d!30542 (= lt!140568 (bvmul lt!140572 lt!140569))))

(assert (=> d!30542 (or (= lt!140572 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!140569 (bvsdiv (bvmul lt!140572 lt!140569) lt!140572)))))

(assert (=> d!30542 (= lt!140569 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!30542 (= lt!140572 ((_ sign_extend 32) (size!2074 (buf!2420 (_1!4132 lt!140089)))))))

(assert (=> d!30542 (= lt!140571 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4827 (_1!4132 lt!140089))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4822 (_1!4132 lt!140089)))))))

(assert (=> d!30542 (invariant!0 (currentBit!4822 (_1!4132 lt!140089)) (currentByte!4827 (_1!4132 lt!140089)) (size!2074 (buf!2420 (_1!4132 lt!140089))))))

(assert (=> d!30542 (= (bitIndex!0 (size!2074 (buf!2420 (_1!4132 lt!140089))) (currentByte!4827 (_1!4132 lt!140089)) (currentBit!4822 (_1!4132 lt!140089))) lt!140571)))

(declare-fun b!97173 () Bool)

(declare-fun res!79738 () Bool)

(assert (=> b!97173 (=> (not res!79738) (not e!63685))))

(assert (=> b!97173 (= res!79738 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!140571))))

(declare-fun b!97174 () Bool)

(declare-fun lt!140567 () (_ BitVec 64))

(assert (=> b!97174 (= e!63685 (bvsle lt!140571 (bvmul lt!140567 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!97174 (or (= lt!140567 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!140567 #b0000000000000000000000000000000000000000000000000000000000001000) lt!140567)))))

(assert (=> b!97174 (= lt!140567 ((_ sign_extend 32) (size!2074 (buf!2420 (_1!4132 lt!140089)))))))

(assert (= (and d!30542 res!79737) b!97173))

(assert (= (and b!97173 res!79738) b!97174))

(declare-fun m!141143 () Bool)

(assert (=> d!30542 m!141143))

(declare-fun m!141145 () Bool)

(assert (=> d!30542 m!141145))

(assert (=> b!97021 d!30542))

(assert (=> b!97021 d!30464))

(declare-fun d!30544 () Bool)

(assert (=> d!30544 (= (invariant!0 (currentBit!4822 thiss!1288) (currentByte!4827 thiss!1288) (size!2074 (buf!2420 (_2!4126 lt!140072)))) (and (bvsge (currentBit!4822 thiss!1288) #b00000000000000000000000000000000) (bvslt (currentBit!4822 thiss!1288) #b00000000000000000000000000001000) (bvsge (currentByte!4827 thiss!1288) #b00000000000000000000000000000000) (or (bvslt (currentByte!4827 thiss!1288) (size!2074 (buf!2420 (_2!4126 lt!140072)))) (and (= (currentBit!4822 thiss!1288) #b00000000000000000000000000000000) (= (currentByte!4827 thiss!1288) (size!2074 (buf!2420 (_2!4126 lt!140072))))))))))

(assert (=> b!97021 d!30544))

(declare-fun d!30546 () Bool)

(declare-fun e!63686 () Bool)

(assert (=> d!30546 e!63686))

(declare-fun res!79739 () Bool)

(assert (=> d!30546 (=> (not res!79739) (not e!63686))))

(declare-fun lt!140573 () BitStream!3622)

(declare-fun lt!140574 () (_ BitVec 64))

(assert (=> d!30546 (= res!79739 (= (bvadd lt!140574 (bvsub (bitIndex!0 (size!2074 (buf!2420 (_2!4126 lt!140072))) (currentByte!4827 (_2!4126 lt!140072)) (currentBit!4822 (_2!4126 lt!140072))) (bitIndex!0 (size!2074 (buf!2420 (_2!4126 lt!140114))) (currentByte!4827 (_2!4126 lt!140114)) (currentBit!4822 (_2!4126 lt!140114))))) (bitIndex!0 (size!2074 (buf!2420 lt!140573)) (currentByte!4827 lt!140573) (currentBit!4822 lt!140573))))))

(assert (=> d!30546 (or (not (= (bvand lt!140574 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bitIndex!0 (size!2074 (buf!2420 (_2!4126 lt!140072))) (currentByte!4827 (_2!4126 lt!140072)) (currentBit!4822 (_2!4126 lt!140072))) (bitIndex!0 (size!2074 (buf!2420 (_2!4126 lt!140114))) (currentByte!4827 (_2!4126 lt!140114)) (currentBit!4822 (_2!4126 lt!140114)))) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!140574 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!140574 (bvsub (bitIndex!0 (size!2074 (buf!2420 (_2!4126 lt!140072))) (currentByte!4827 (_2!4126 lt!140072)) (currentBit!4822 (_2!4126 lt!140072))) (bitIndex!0 (size!2074 (buf!2420 (_2!4126 lt!140114))) (currentByte!4827 (_2!4126 lt!140114)) (currentBit!4822 (_2!4126 lt!140114))))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!30546 (= lt!140574 (bitIndex!0 (size!2074 (buf!2420 (_2!4129 lt!140117))) (currentByte!4827 (_2!4129 lt!140117)) (currentBit!4822 (_2!4129 lt!140117))))))

(assert (=> d!30546 (= lt!140573 (_2!4126 (moveBitIndex!0 (_2!4129 lt!140117) (bvsub (bitIndex!0 (size!2074 (buf!2420 (_2!4126 lt!140072))) (currentByte!4827 (_2!4126 lt!140072)) (currentBit!4822 (_2!4126 lt!140072))) (bitIndex!0 (size!2074 (buf!2420 (_2!4126 lt!140114))) (currentByte!4827 (_2!4126 lt!140114)) (currentBit!4822 (_2!4126 lt!140114)))))))))

(assert (=> d!30546 (moveBitIndexPrecond!0 (_2!4129 lt!140117) (bvsub (bitIndex!0 (size!2074 (buf!2420 (_2!4126 lt!140072))) (currentByte!4827 (_2!4126 lt!140072)) (currentBit!4822 (_2!4126 lt!140072))) (bitIndex!0 (size!2074 (buf!2420 (_2!4126 lt!140114))) (currentByte!4827 (_2!4126 lt!140114)) (currentBit!4822 (_2!4126 lt!140114)))))))

(assert (=> d!30546 (= (withMovedBitIndex!0 (_2!4129 lt!140117) (bvsub (bitIndex!0 (size!2074 (buf!2420 (_2!4126 lt!140072))) (currentByte!4827 (_2!4126 lt!140072)) (currentBit!4822 (_2!4126 lt!140072))) (bitIndex!0 (size!2074 (buf!2420 (_2!4126 lt!140114))) (currentByte!4827 (_2!4126 lt!140114)) (currentBit!4822 (_2!4126 lt!140114))))) lt!140573)))

(declare-fun b!97175 () Bool)

(assert (=> b!97175 (= e!63686 (= (size!2074 (buf!2420 (_2!4129 lt!140117))) (size!2074 (buf!2420 lt!140573))))))

(assert (= (and d!30546 res!79739) b!97175))

(declare-fun m!141147 () Bool)

(assert (=> d!30546 m!141147))

(declare-fun m!141149 () Bool)

(assert (=> d!30546 m!141149))

(declare-fun m!141151 () Bool)

(assert (=> d!30546 m!141151))

(declare-fun m!141153 () Bool)

(assert (=> d!30546 m!141153))

(assert (=> b!97021 d!30546))

(declare-fun d!30548 () Bool)

(assert (=> d!30548 (= (invariant!0 (currentBit!4822 lt!140082) (currentByte!4827 lt!140082) (size!2074 (buf!2420 (_2!4126 lt!140114)))) (and (bvsge (currentBit!4822 lt!140082) #b00000000000000000000000000000000) (bvslt (currentBit!4822 lt!140082) #b00000000000000000000000000001000) (bvsge (currentByte!4827 lt!140082) #b00000000000000000000000000000000) (or (bvslt (currentByte!4827 lt!140082) (size!2074 (buf!2420 (_2!4126 lt!140114)))) (and (= (currentBit!4822 lt!140082) #b00000000000000000000000000000000) (= (currentByte!4827 lt!140082) (size!2074 (buf!2420 (_2!4126 lt!140114))))))))))

(assert (=> b!97021 d!30548))

(declare-fun d!30550 () Bool)

(assert (=> d!30550 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2074 (buf!2420 thiss!1288))) ((_ sign_extend 32) (currentByte!4827 thiss!1288)) ((_ sign_extend 32) (currentBit!4822 thiss!1288)) lt!140076) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2074 (buf!2420 thiss!1288))) ((_ sign_extend 32) (currentByte!4827 thiss!1288)) ((_ sign_extend 32) (currentBit!4822 thiss!1288))) lt!140076))))

(declare-fun bs!7468 () Bool)

(assert (= bs!7468 d!30550))

(assert (=> bs!7468 m!140593))

(assert (=> b!97013 d!30550))

(assert (=> b!97023 d!30476))

(assert (=> b!97023 d!30518))

(declare-fun d!30552 () Bool)

(declare-fun e!63687 () Bool)

(assert (=> d!30552 e!63687))

(declare-fun res!79740 () Bool)

(assert (=> d!30552 (=> (not res!79740) (not e!63687))))

(declare-fun lt!140579 () (_ BitVec 64))

(declare-fun lt!140576 () (_ BitVec 64))

(declare-fun lt!140578 () (_ BitVec 64))

(assert (=> d!30552 (= res!79740 (= lt!140579 (bvsub lt!140576 lt!140578)))))

(assert (=> d!30552 (or (= (bvand lt!140576 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!140578 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!140576 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!140576 lt!140578) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!30552 (= lt!140578 (remainingBits!0 ((_ sign_extend 32) (size!2074 (buf!2420 (_2!4126 lt!140067)))) ((_ sign_extend 32) (currentByte!4827 (_2!4126 lt!140067))) ((_ sign_extend 32) (currentBit!4822 (_2!4126 lt!140067)))))))

(declare-fun lt!140580 () (_ BitVec 64))

(declare-fun lt!140577 () (_ BitVec 64))

(assert (=> d!30552 (= lt!140576 (bvmul lt!140580 lt!140577))))

(assert (=> d!30552 (or (= lt!140580 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!140577 (bvsdiv (bvmul lt!140580 lt!140577) lt!140580)))))

(assert (=> d!30552 (= lt!140577 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!30552 (= lt!140580 ((_ sign_extend 32) (size!2074 (buf!2420 (_2!4126 lt!140067)))))))

(assert (=> d!30552 (= lt!140579 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4827 (_2!4126 lt!140067))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4822 (_2!4126 lt!140067)))))))

(assert (=> d!30552 (invariant!0 (currentBit!4822 (_2!4126 lt!140067)) (currentByte!4827 (_2!4126 lt!140067)) (size!2074 (buf!2420 (_2!4126 lt!140067))))))

(assert (=> d!30552 (= (bitIndex!0 (size!2074 (buf!2420 (_2!4126 lt!140067))) (currentByte!4827 (_2!4126 lt!140067)) (currentBit!4822 (_2!4126 lt!140067))) lt!140579)))

(declare-fun b!97176 () Bool)

(declare-fun res!79741 () Bool)

(assert (=> b!97176 (=> (not res!79741) (not e!63687))))

(assert (=> b!97176 (= res!79741 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!140579))))

(declare-fun b!97177 () Bool)

(declare-fun lt!140575 () (_ BitVec 64))

(assert (=> b!97177 (= e!63687 (bvsle lt!140579 (bvmul lt!140575 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!97177 (or (= lt!140575 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!140575 #b0000000000000000000000000000000000000000000000000000000000001000) lt!140575)))))

(assert (=> b!97177 (= lt!140575 ((_ sign_extend 32) (size!2074 (buf!2420 (_2!4126 lt!140067)))))))

(assert (= (and d!30552 res!79740) b!97176))

(assert (= (and b!97176 res!79741) b!97177))

(declare-fun m!141155 () Bool)

(assert (=> d!30552 m!141155))

(declare-fun m!141157 () Bool)

(assert (=> d!30552 m!141157))

(assert (=> b!97017 d!30552))

(assert (=> b!97017 d!30518))

(push 1)

(assert (not b!97170))

(assert (not b!97152))

(assert (not d!30450))

(assert (not d!30532))

(assert (not b!97104))

(assert (not d!30482))

(assert (not d!30518))

(assert (not d!30542))

(assert (not d!30526))

(assert (not d!30484))

(assert (not d!30494))

(assert (not b!97131))

(assert (not b!97102))

(assert (not d!30504))

(assert (not d!30474))

(assert (not b!97118))

(assert (not d!30462))

(assert (not b!97145))

(assert (not bm!1191))

(assert (not d!30480))

(assert (not b!97153))

(assert (not d!30516))

(assert (not b!97163))

(assert (not d!30460))

(assert (not b!97168))

(assert (not d!30456))

(assert (not b!97147))

(assert (not d!30536))

(assert (not b!97149))

(assert (not b!97093))

(assert (not b!97172))

(assert (not d!30454))

(assert (not d!30540))

(assert (not b!97130))

(assert (not b!97091))

(assert (not b!97128))

(assert (not b!97162))

(assert (not b!97160))

(assert (not b!97164))

(assert (not b!97144))

(assert (not d!30496))

(assert (not d!30552))

(assert (not b!97148))

(assert (not d!30490))

(assert (not b!97129))

(assert (not d!30488))

(assert (not b!97116))

(assert (not b!97094))

(assert (not d!30486))

(assert (not b!97150))

(assert (not d!30534))

(assert (not b!97107))

(assert (not d!30500))

(assert (not d!30458))

(assert (not d!30498))

(assert (not b!97095))

(assert (not d!30546))

(assert (not b!97171))

(assert (not d!30506))

(assert (not d!30550))

(assert (not d!30452))

(assert (not d!30508))

(assert (not b!97154))

(assert (not d!30492))

(assert (not b!97080))

(assert (not b!97151))

(assert (not d!30502))

(assert (not b!97105))

(assert (not d!30476))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

