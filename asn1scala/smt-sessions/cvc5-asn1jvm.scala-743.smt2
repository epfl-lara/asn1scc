; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21006 () Bool)

(assert start!21006)

(declare-fun b!106024 () Bool)

(declare-fun e!69415 () Bool)

(declare-datatypes ((array!4893 0))(
  ( (array!4894 (arr!2823 (Array (_ BitVec 32) (_ BitVec 8))) (size!2230 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3934 0))(
  ( (BitStream!3935 (buf!2606 array!4893) (currentByte!5112 (_ BitVec 32)) (currentBit!5107 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!8718 0))(
  ( (tuple2!8719 (_1!4616 BitStream!3934) (_2!4616 Bool)) )
))
(declare-fun lt!157072 () tuple2!8718)

(declare-fun lt!157062 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!106024 (= e!69415 (= (bitIndex!0 (size!2230 (buf!2606 (_1!4616 lt!157072))) (currentByte!5112 (_1!4616 lt!157072)) (currentBit!5107 (_1!4616 lt!157072))) lt!157062))))

(declare-fun thiss!1305 () BitStream!3934)

(declare-datatypes ((tuple2!8720 0))(
  ( (tuple2!8721 (_1!4617 BitStream!3934) (_2!4617 BitStream!3934)) )
))
(declare-fun lt!157064 () tuple2!8720)

(declare-datatypes ((Unit!6498 0))(
  ( (Unit!6499) )
))
(declare-datatypes ((tuple2!8722 0))(
  ( (tuple2!8723 (_1!4618 Unit!6498) (_2!4618 BitStream!3934)) )
))
(declare-fun lt!157071 () tuple2!8722)

(declare-fun e!69417 () Bool)

(declare-fun b!106025 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!3934 (_ BitVec 64)) BitStream!3934)

(assert (=> b!106025 (= e!69417 (= (_1!4617 lt!157064) (withMovedBitIndex!0 (_2!4617 lt!157064) (bvsub (bitIndex!0 (size!2230 (buf!2606 thiss!1305)) (currentByte!5112 thiss!1305) (currentBit!5107 thiss!1305)) (bitIndex!0 (size!2230 (buf!2606 (_2!4618 lt!157071))) (currentByte!5112 (_2!4618 lt!157071)) (currentBit!5107 (_2!4618 lt!157071)))))))))

(declare-fun b!106026 () Bool)

(declare-fun e!69420 () Bool)

(declare-fun e!69414 () Bool)

(assert (=> b!106026 (= e!69420 e!69414)))

(declare-fun res!87322 () Bool)

(assert (=> b!106026 (=> (not res!87322) (not e!69414))))

(declare-fun lt!157053 () (_ BitVec 64))

(assert (=> b!106026 (= res!87322 (= lt!157062 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!157053)))))

(declare-fun lt!157059 () tuple2!8722)

(assert (=> b!106026 (= lt!157062 (bitIndex!0 (size!2230 (buf!2606 (_2!4618 lt!157059))) (currentByte!5112 (_2!4618 lt!157059)) (currentBit!5107 (_2!4618 lt!157059))))))

(assert (=> b!106026 (= lt!157053 (bitIndex!0 (size!2230 (buf!2606 thiss!1305)) (currentByte!5112 thiss!1305) (currentBit!5107 thiss!1305)))))

(declare-fun res!87330 () Bool)

(declare-fun e!69421 () Bool)

(assert (=> start!21006 (=> (not res!87330) (not e!69421))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> start!21006 (= res!87330 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!21006 e!69421))

(assert (=> start!21006 true))

(declare-fun e!69418 () Bool)

(declare-fun inv!12 (BitStream!3934) Bool)

(assert (=> start!21006 (and (inv!12 thiss!1305) e!69418)))

(declare-fun b!106027 () Bool)

(declare-fun e!69422 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!106027 (= e!69422 (invariant!0 (currentBit!5107 thiss!1305) (currentByte!5112 thiss!1305) (size!2230 (buf!2606 (_2!4618 lt!157071)))))))

(declare-fun b!106028 () Bool)

(declare-fun e!69419 () Bool)

(assert (=> b!106028 (= e!69419 (invariant!0 (currentBit!5107 (_2!4618 lt!157071)) (currentByte!5112 (_2!4618 lt!157071)) (size!2230 (buf!2606 (_2!4618 lt!157071)))))))

(declare-fun lt!157061 () (_ BitVec 64))

(assert (=> b!106028 (= lt!157061 (bitIndex!0 (size!2230 (buf!2606 (_2!4618 lt!157059))) (currentByte!5112 (_2!4618 lt!157059)) (currentBit!5107 (_2!4618 lt!157059))))))

(assert (=> b!106028 e!69417))

(declare-fun res!87324 () Bool)

(assert (=> b!106028 (=> (not res!87324) (not e!69417))))

(declare-datatypes ((tuple2!8724 0))(
  ( (tuple2!8725 (_1!4619 BitStream!3934) (_2!4619 (_ BitVec 64))) )
))
(declare-fun lt!157070 () tuple2!8724)

(declare-fun lt!157074 () tuple2!8724)

(assert (=> b!106028 (= res!87324 (and (= (_2!4619 lt!157070) (_2!4619 lt!157074)) (= (_1!4619 lt!157070) (_1!4619 lt!157074))))))

(declare-fun lt!157057 () (_ BitVec 64))

(declare-fun lt!157058 () Unit!6498)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!3934 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!6498)

(assert (=> b!106028 (= lt!157058 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4617 lt!157064) nBits!396 i!615 lt!157057))))

(declare-fun lt!157060 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!3934 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!8724)

(assert (=> b!106028 (= lt!157074 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4617 lt!157064) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!157060))))

(declare-fun b!106029 () Bool)

(declare-fun res!87318 () Bool)

(declare-fun e!69423 () Bool)

(assert (=> b!106029 (=> (not res!87318) (not e!69423))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!106029 (= res!87318 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!106030 () Bool)

(declare-fun res!87328 () Bool)

(assert (=> b!106030 (=> (not res!87328) (not e!69423))))

(assert (=> b!106030 (= res!87328 (bvslt i!615 nBits!396))))

(declare-fun b!106031 () Bool)

(assert (=> b!106031 (= e!69421 e!69423)))

(declare-fun res!87323 () Bool)

(assert (=> b!106031 (=> (not res!87323) (not e!69423))))

(declare-fun lt!157055 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!106031 (= res!87323 (validate_offset_bits!1 ((_ sign_extend 32) (size!2230 (buf!2606 thiss!1305))) ((_ sign_extend 32) (currentByte!5112 thiss!1305)) ((_ sign_extend 32) (currentBit!5107 thiss!1305)) lt!157055))))

(assert (=> b!106031 (= lt!157055 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!106032 () Bool)

(assert (=> b!106032 (= e!69414 e!69415)))

(declare-fun res!87327 () Bool)

(assert (=> b!106032 (=> (not res!87327) (not e!69415))))

(declare-fun lt!157067 () Bool)

(assert (=> b!106032 (= res!87327 (and (= (_2!4616 lt!157072) lt!157067) (= (_1!4616 lt!157072) (_2!4618 lt!157059))))))

(declare-fun readBitPure!0 (BitStream!3934) tuple2!8718)

(declare-fun readerFrom!0 (BitStream!3934 (_ BitVec 32) (_ BitVec 32)) BitStream!3934)

(assert (=> b!106032 (= lt!157072 (readBitPure!0 (readerFrom!0 (_2!4618 lt!157059) (currentBit!5107 thiss!1305) (currentByte!5112 thiss!1305))))))

(declare-fun b!106033 () Bool)

(declare-fun res!87325 () Bool)

(assert (=> b!106033 (=> (not res!87325) (not e!69422))))

(assert (=> b!106033 (= res!87325 (invariant!0 (currentBit!5107 thiss!1305) (currentByte!5112 thiss!1305) (size!2230 (buf!2606 (_2!4618 lt!157059)))))))

(declare-fun b!106034 () Bool)

(declare-fun e!69416 () Bool)

(declare-fun lt!157056 () tuple2!8718)

(declare-fun lt!157051 () tuple2!8718)

(assert (=> b!106034 (= e!69416 (= (_2!4616 lt!157056) (_2!4616 lt!157051)))))

(declare-fun b!106035 () Bool)

(declare-fun res!87326 () Bool)

(assert (=> b!106035 (=> (not res!87326) (not e!69414))))

(declare-fun isPrefixOf!0 (BitStream!3934 BitStream!3934) Bool)

(assert (=> b!106035 (= res!87326 (isPrefixOf!0 thiss!1305 (_2!4618 lt!157059)))))

(declare-fun b!106036 () Bool)

(assert (=> b!106036 (= e!69423 (not e!69419))))

(declare-fun res!87329 () Bool)

(assert (=> b!106036 (=> res!87329 e!69419)))

(declare-fun lt!157052 () tuple2!8720)

(assert (=> b!106036 (= res!87329 (not (= (_1!4619 (readNLeastSignificantBitsLoopPure!0 (_1!4617 lt!157052) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!157060)) (_2!4617 lt!157052))))))

(declare-fun lt!157073 () (_ BitVec 64))

(assert (=> b!106036 (validate_offset_bits!1 ((_ sign_extend 32) (size!2230 (buf!2606 (_2!4618 lt!157071)))) ((_ sign_extend 32) (currentByte!5112 (_2!4618 lt!157059))) ((_ sign_extend 32) (currentBit!5107 (_2!4618 lt!157059))) lt!157073)))

(declare-fun lt!157069 () Unit!6498)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!3934 array!4893 (_ BitVec 64)) Unit!6498)

(assert (=> b!106036 (= lt!157069 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4618 lt!157059) (buf!2606 (_2!4618 lt!157071)) lt!157073))))

(assert (=> b!106036 (= lt!157073 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!157063 () tuple2!8718)

(declare-fun lt!157068 () (_ BitVec 64))

(assert (=> b!106036 (= lt!157060 (bvor lt!157057 (ite (_2!4616 lt!157063) lt!157068 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!106036 (= lt!157070 (readNLeastSignificantBitsLoopPure!0 (_1!4617 lt!157064) nBits!396 i!615 lt!157057))))

(assert (=> b!106036 (validate_offset_bits!1 ((_ sign_extend 32) (size!2230 (buf!2606 (_2!4618 lt!157071)))) ((_ sign_extend 32) (currentByte!5112 thiss!1305)) ((_ sign_extend 32) (currentBit!5107 thiss!1305)) lt!157055)))

(declare-fun lt!157066 () Unit!6498)

(assert (=> b!106036 (= lt!157066 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2606 (_2!4618 lt!157071)) lt!157055))))

(assert (=> b!106036 (= lt!157057 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(assert (=> b!106036 (= (_2!4616 lt!157063) lt!157067)))

(assert (=> b!106036 (= lt!157063 (readBitPure!0 (_1!4617 lt!157064)))))

(declare-fun reader!0 (BitStream!3934 BitStream!3934) tuple2!8720)

(assert (=> b!106036 (= lt!157052 (reader!0 (_2!4618 lt!157059) (_2!4618 lt!157071)))))

(assert (=> b!106036 (= lt!157064 (reader!0 thiss!1305 (_2!4618 lt!157071)))))

(assert (=> b!106036 e!69416))

(declare-fun res!87319 () Bool)

(assert (=> b!106036 (=> (not res!87319) (not e!69416))))

(assert (=> b!106036 (= res!87319 (= (bitIndex!0 (size!2230 (buf!2606 (_1!4616 lt!157056))) (currentByte!5112 (_1!4616 lt!157056)) (currentBit!5107 (_1!4616 lt!157056))) (bitIndex!0 (size!2230 (buf!2606 (_1!4616 lt!157051))) (currentByte!5112 (_1!4616 lt!157051)) (currentBit!5107 (_1!4616 lt!157051)))))))

(declare-fun lt!157075 () Unit!6498)

(declare-fun lt!157054 () BitStream!3934)

(declare-fun readBitPrefixLemma!0 (BitStream!3934 BitStream!3934) Unit!6498)

(assert (=> b!106036 (= lt!157075 (readBitPrefixLemma!0 lt!157054 (_2!4618 lt!157071)))))

(assert (=> b!106036 (= lt!157051 (readBitPure!0 (BitStream!3935 (buf!2606 (_2!4618 lt!157071)) (currentByte!5112 thiss!1305) (currentBit!5107 thiss!1305))))))

(assert (=> b!106036 (= lt!157056 (readBitPure!0 lt!157054))))

(assert (=> b!106036 (= lt!157054 (BitStream!3935 (buf!2606 (_2!4618 lt!157059)) (currentByte!5112 thiss!1305) (currentBit!5107 thiss!1305)))))

(assert (=> b!106036 e!69422))

(declare-fun res!87321 () Bool)

(assert (=> b!106036 (=> (not res!87321) (not e!69422))))

(assert (=> b!106036 (= res!87321 (isPrefixOf!0 thiss!1305 (_2!4618 lt!157071)))))

(declare-fun lt!157065 () Unit!6498)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3934 BitStream!3934 BitStream!3934) Unit!6498)

(assert (=> b!106036 (= lt!157065 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4618 lt!157059) (_2!4618 lt!157071)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3934 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8722)

(assert (=> b!106036 (= lt!157071 (appendNLeastSignificantBitsLoop!0 (_2!4618 lt!157059) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!106036 e!69420))

(declare-fun res!87320 () Bool)

(assert (=> b!106036 (=> (not res!87320) (not e!69420))))

(assert (=> b!106036 (= res!87320 (= (size!2230 (buf!2606 thiss!1305)) (size!2230 (buf!2606 (_2!4618 lt!157059)))))))

(declare-fun appendBit!0 (BitStream!3934 Bool) tuple2!8722)

(assert (=> b!106036 (= lt!157059 (appendBit!0 thiss!1305 lt!157067))))

(assert (=> b!106036 (= lt!157067 (not (= (bvand v!199 lt!157068) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!106036 (= lt!157068 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!106037 () Bool)

(declare-fun array_inv!2032 (array!4893) Bool)

(assert (=> b!106037 (= e!69418 (array_inv!2032 (buf!2606 thiss!1305)))))

(assert (= (and start!21006 res!87330) b!106031))

(assert (= (and b!106031 res!87323) b!106029))

(assert (= (and b!106029 res!87318) b!106030))

(assert (= (and b!106030 res!87328) b!106036))

(assert (= (and b!106036 res!87320) b!106026))

(assert (= (and b!106026 res!87322) b!106035))

(assert (= (and b!106035 res!87326) b!106032))

(assert (= (and b!106032 res!87327) b!106024))

(assert (= (and b!106036 res!87321) b!106033))

(assert (= (and b!106033 res!87325) b!106027))

(assert (= (and b!106036 res!87319) b!106034))

(assert (= (and b!106036 (not res!87329)) b!106028))

(assert (= (and b!106028 res!87324) b!106025))

(assert (= start!21006 b!106037))

(declare-fun m!155995 () Bool)

(assert (=> b!106033 m!155995))

(declare-fun m!155997 () Bool)

(assert (=> b!106027 m!155997))

(declare-fun m!155999 () Bool)

(assert (=> b!106029 m!155999))

(declare-fun m!156001 () Bool)

(assert (=> b!106035 m!156001))

(declare-fun m!156003 () Bool)

(assert (=> b!106025 m!156003))

(declare-fun m!156005 () Bool)

(assert (=> b!106025 m!156005))

(declare-fun m!156007 () Bool)

(assert (=> b!106025 m!156007))

(declare-fun m!156009 () Bool)

(assert (=> start!21006 m!156009))

(declare-fun m!156011 () Bool)

(assert (=> b!106037 m!156011))

(declare-fun m!156013 () Bool)

(assert (=> b!106032 m!156013))

(assert (=> b!106032 m!156013))

(declare-fun m!156015 () Bool)

(assert (=> b!106032 m!156015))

(declare-fun m!156017 () Bool)

(assert (=> b!106028 m!156017))

(declare-fun m!156019 () Bool)

(assert (=> b!106028 m!156019))

(declare-fun m!156021 () Bool)

(assert (=> b!106028 m!156021))

(declare-fun m!156023 () Bool)

(assert (=> b!106028 m!156023))

(declare-fun m!156025 () Bool)

(assert (=> b!106028 m!156025))

(assert (=> b!106028 m!156021))

(declare-fun m!156027 () Bool)

(assert (=> b!106031 m!156027))

(declare-fun m!156029 () Bool)

(assert (=> b!106024 m!156029))

(declare-fun m!156031 () Bool)

(assert (=> b!106036 m!156031))

(declare-fun m!156033 () Bool)

(assert (=> b!106036 m!156033))

(declare-fun m!156035 () Bool)

(assert (=> b!106036 m!156035))

(declare-fun m!156037 () Bool)

(assert (=> b!106036 m!156037))

(declare-fun m!156039 () Bool)

(assert (=> b!106036 m!156039))

(declare-fun m!156041 () Bool)

(assert (=> b!106036 m!156041))

(declare-fun m!156043 () Bool)

(assert (=> b!106036 m!156043))

(declare-fun m!156045 () Bool)

(assert (=> b!106036 m!156045))

(declare-fun m!156047 () Bool)

(assert (=> b!106036 m!156047))

(declare-fun m!156049 () Bool)

(assert (=> b!106036 m!156049))

(declare-fun m!156051 () Bool)

(assert (=> b!106036 m!156051))

(declare-fun m!156053 () Bool)

(assert (=> b!106036 m!156053))

(declare-fun m!156055 () Bool)

(assert (=> b!106036 m!156055))

(declare-fun m!156057 () Bool)

(assert (=> b!106036 m!156057))

(declare-fun m!156059 () Bool)

(assert (=> b!106036 m!156059))

(declare-fun m!156061 () Bool)

(assert (=> b!106036 m!156061))

(declare-fun m!156063 () Bool)

(assert (=> b!106036 m!156063))

(declare-fun m!156065 () Bool)

(assert (=> b!106036 m!156065))

(declare-fun m!156067 () Bool)

(assert (=> b!106036 m!156067))

(assert (=> b!106026 m!156017))

(assert (=> b!106026 m!156003))

(push 1)

(assert (not b!106024))

(assert (not b!106035))

(assert (not start!21006))

(assert (not b!106033))

(assert (not b!106036))

(assert (not b!106025))

(assert (not b!106029))

(assert (not b!106027))

(assert (not b!106037))

(assert (not b!106028))

(assert (not b!106031))

(assert (not b!106026))

(assert (not b!106032))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!33322 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!33322 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2230 (buf!2606 thiss!1305))) ((_ sign_extend 32) (currentByte!5112 thiss!1305)) ((_ sign_extend 32) (currentBit!5107 thiss!1305)) lt!157055) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2230 (buf!2606 thiss!1305))) ((_ sign_extend 32) (currentByte!5112 thiss!1305)) ((_ sign_extend 32) (currentBit!5107 thiss!1305))) lt!157055))))

(declare-fun bs!8138 () Bool)

(assert (= bs!8138 d!33322))

(declare-fun m!156217 () Bool)

(assert (=> bs!8138 m!156217))

(assert (=> b!106031 d!33322))

(declare-fun d!33324 () Bool)

(declare-datatypes ((tuple2!8742 0))(
  ( (tuple2!8743 (_1!4628 Bool) (_2!4628 BitStream!3934)) )
))
(declare-fun lt!157228 () tuple2!8742)

(declare-fun readBit!0 (BitStream!3934) tuple2!8742)

(assert (=> d!33324 (= lt!157228 (readBit!0 (readerFrom!0 (_2!4618 lt!157059) (currentBit!5107 thiss!1305) (currentByte!5112 thiss!1305))))))

(assert (=> d!33324 (= (readBitPure!0 (readerFrom!0 (_2!4618 lt!157059) (currentBit!5107 thiss!1305) (currentByte!5112 thiss!1305))) (tuple2!8719 (_2!4628 lt!157228) (_1!4628 lt!157228)))))

(declare-fun bs!8139 () Bool)

(assert (= bs!8139 d!33324))

(assert (=> bs!8139 m!156013))

(declare-fun m!156219 () Bool)

(assert (=> bs!8139 m!156219))

(assert (=> b!106032 d!33324))

(declare-fun d!33326 () Bool)

(declare-fun e!69492 () Bool)

(assert (=> d!33326 e!69492))

(declare-fun res!87412 () Bool)

(assert (=> d!33326 (=> (not res!87412) (not e!69492))))

(assert (=> d!33326 (= res!87412 (invariant!0 (currentBit!5107 (_2!4618 lt!157059)) (currentByte!5112 (_2!4618 lt!157059)) (size!2230 (buf!2606 (_2!4618 lt!157059)))))))

(assert (=> d!33326 (= (readerFrom!0 (_2!4618 lt!157059) (currentBit!5107 thiss!1305) (currentByte!5112 thiss!1305)) (BitStream!3935 (buf!2606 (_2!4618 lt!157059)) (currentByte!5112 thiss!1305) (currentBit!5107 thiss!1305)))))

(declare-fun b!106124 () Bool)

(assert (=> b!106124 (= e!69492 (invariant!0 (currentBit!5107 thiss!1305) (currentByte!5112 thiss!1305) (size!2230 (buf!2606 (_2!4618 lt!157059)))))))

(assert (= (and d!33326 res!87412) b!106124))

(declare-fun m!156221 () Bool)

(assert (=> d!33326 m!156221))

(assert (=> b!106124 m!155995))

(assert (=> b!106032 d!33326))

(declare-fun d!33328 () Bool)

(assert (=> d!33328 (= (invariant!0 (currentBit!5107 thiss!1305) (currentByte!5112 thiss!1305) (size!2230 (buf!2606 (_2!4618 lt!157059)))) (and (bvsge (currentBit!5107 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5107 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5112 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5112 thiss!1305) (size!2230 (buf!2606 (_2!4618 lt!157059)))) (and (= (currentBit!5107 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5112 thiss!1305) (size!2230 (buf!2606 (_2!4618 lt!157059))))))))))

(assert (=> b!106033 d!33328))

(declare-fun d!33330 () Bool)

(declare-fun e!69495 () Bool)

(assert (=> d!33330 e!69495))

(declare-fun res!87418 () Bool)

(assert (=> d!33330 (=> (not res!87418) (not e!69495))))

(declare-fun lt!157245 () (_ BitVec 64))

(declare-fun lt!157244 () (_ BitVec 64))

(declare-fun lt!157242 () (_ BitVec 64))

(assert (=> d!33330 (= res!87418 (= lt!157245 (bvsub lt!157244 lt!157242)))))

(assert (=> d!33330 (or (= (bvand lt!157244 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!157242 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!157244 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!157244 lt!157242) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!33330 (= lt!157242 (remainingBits!0 ((_ sign_extend 32) (size!2230 (buf!2606 (_1!4616 lt!157072)))) ((_ sign_extend 32) (currentByte!5112 (_1!4616 lt!157072))) ((_ sign_extend 32) (currentBit!5107 (_1!4616 lt!157072)))))))

(declare-fun lt!157243 () (_ BitVec 64))

(declare-fun lt!157241 () (_ BitVec 64))

(assert (=> d!33330 (= lt!157244 (bvmul lt!157243 lt!157241))))

(assert (=> d!33330 (or (= lt!157243 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!157241 (bvsdiv (bvmul lt!157243 lt!157241) lt!157243)))))

(assert (=> d!33330 (= lt!157241 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!33330 (= lt!157243 ((_ sign_extend 32) (size!2230 (buf!2606 (_1!4616 lt!157072)))))))

(assert (=> d!33330 (= lt!157245 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5112 (_1!4616 lt!157072))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5107 (_1!4616 lt!157072)))))))

(assert (=> d!33330 (invariant!0 (currentBit!5107 (_1!4616 lt!157072)) (currentByte!5112 (_1!4616 lt!157072)) (size!2230 (buf!2606 (_1!4616 lt!157072))))))

(assert (=> d!33330 (= (bitIndex!0 (size!2230 (buf!2606 (_1!4616 lt!157072))) (currentByte!5112 (_1!4616 lt!157072)) (currentBit!5107 (_1!4616 lt!157072))) lt!157245)))

(declare-fun b!106129 () Bool)

(declare-fun res!87417 () Bool)

(assert (=> b!106129 (=> (not res!87417) (not e!69495))))

(assert (=> b!106129 (= res!87417 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!157245))))

(declare-fun b!106130 () Bool)

(declare-fun lt!157246 () (_ BitVec 64))

(assert (=> b!106130 (= e!69495 (bvsle lt!157245 (bvmul lt!157246 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!106130 (or (= lt!157246 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!157246 #b0000000000000000000000000000000000000000000000000000000000001000) lt!157246)))))

(assert (=> b!106130 (= lt!157246 ((_ sign_extend 32) (size!2230 (buf!2606 (_1!4616 lt!157072)))))))

(assert (= (and d!33330 res!87418) b!106129))

(assert (= (and b!106129 res!87417) b!106130))

(declare-fun m!156223 () Bool)

(assert (=> d!33330 m!156223))

(declare-fun m!156225 () Bool)

(assert (=> d!33330 m!156225))

(assert (=> b!106024 d!33330))

(declare-fun d!33332 () Bool)

(declare-fun res!87427 () Bool)

(declare-fun e!69501 () Bool)

(assert (=> d!33332 (=> (not res!87427) (not e!69501))))

(assert (=> d!33332 (= res!87427 (= (size!2230 (buf!2606 thiss!1305)) (size!2230 (buf!2606 (_2!4618 lt!157059)))))))

(assert (=> d!33332 (= (isPrefixOf!0 thiss!1305 (_2!4618 lt!157059)) e!69501)))

(declare-fun b!106137 () Bool)

(declare-fun res!87426 () Bool)

(assert (=> b!106137 (=> (not res!87426) (not e!69501))))

(assert (=> b!106137 (= res!87426 (bvsle (bitIndex!0 (size!2230 (buf!2606 thiss!1305)) (currentByte!5112 thiss!1305) (currentBit!5107 thiss!1305)) (bitIndex!0 (size!2230 (buf!2606 (_2!4618 lt!157059))) (currentByte!5112 (_2!4618 lt!157059)) (currentBit!5107 (_2!4618 lt!157059)))))))

(declare-fun b!106138 () Bool)

(declare-fun e!69500 () Bool)

(assert (=> b!106138 (= e!69501 e!69500)))

(declare-fun res!87425 () Bool)

(assert (=> b!106138 (=> res!87425 e!69500)))

(assert (=> b!106138 (= res!87425 (= (size!2230 (buf!2606 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!106139 () Bool)

(declare-fun arrayBitRangesEq!0 (array!4893 array!4893 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!106139 (= e!69500 (arrayBitRangesEq!0 (buf!2606 thiss!1305) (buf!2606 (_2!4618 lt!157059)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2230 (buf!2606 thiss!1305)) (currentByte!5112 thiss!1305) (currentBit!5107 thiss!1305))))))

(assert (= (and d!33332 res!87427) b!106137))

(assert (= (and b!106137 res!87426) b!106138))

(assert (= (and b!106138 (not res!87425)) b!106139))

(assert (=> b!106137 m!156003))

(assert (=> b!106137 m!156017))

(assert (=> b!106139 m!156003))

(assert (=> b!106139 m!156003))

(declare-fun m!156229 () Bool)

(assert (=> b!106139 m!156229))

(assert (=> b!106035 d!33332))

(declare-fun d!33338 () Bool)

(assert (=> d!33338 (= (inv!12 thiss!1305) (invariant!0 (currentBit!5107 thiss!1305) (currentByte!5112 thiss!1305) (size!2230 (buf!2606 thiss!1305))))))

(declare-fun bs!8141 () Bool)

(assert (= bs!8141 d!33338))

(declare-fun m!156231 () Bool)

(assert (=> bs!8141 m!156231))

(assert (=> start!21006 d!33338))

(declare-fun d!33340 () Bool)

(declare-fun e!69504 () Bool)

(assert (=> d!33340 e!69504))

(declare-fun res!87430 () Bool)

(assert (=> d!33340 (=> (not res!87430) (not e!69504))))

(declare-fun lt!157252 () (_ BitVec 64))

(declare-fun lt!157251 () BitStream!3934)

(assert (=> d!33340 (= res!87430 (= (bvadd lt!157252 (bvsub (bitIndex!0 (size!2230 (buf!2606 thiss!1305)) (currentByte!5112 thiss!1305) (currentBit!5107 thiss!1305)) (bitIndex!0 (size!2230 (buf!2606 (_2!4618 lt!157071))) (currentByte!5112 (_2!4618 lt!157071)) (currentBit!5107 (_2!4618 lt!157071))))) (bitIndex!0 (size!2230 (buf!2606 lt!157251)) (currentByte!5112 lt!157251) (currentBit!5107 lt!157251))))))

(assert (=> d!33340 (or (not (= (bvand lt!157252 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bitIndex!0 (size!2230 (buf!2606 thiss!1305)) (currentByte!5112 thiss!1305) (currentBit!5107 thiss!1305)) (bitIndex!0 (size!2230 (buf!2606 (_2!4618 lt!157071))) (currentByte!5112 (_2!4618 lt!157071)) (currentBit!5107 (_2!4618 lt!157071)))) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!157252 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!157252 (bvsub (bitIndex!0 (size!2230 (buf!2606 thiss!1305)) (currentByte!5112 thiss!1305) (currentBit!5107 thiss!1305)) (bitIndex!0 (size!2230 (buf!2606 (_2!4618 lt!157071))) (currentByte!5112 (_2!4618 lt!157071)) (currentBit!5107 (_2!4618 lt!157071))))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!33340 (= lt!157252 (bitIndex!0 (size!2230 (buf!2606 (_2!4617 lt!157064))) (currentByte!5112 (_2!4617 lt!157064)) (currentBit!5107 (_2!4617 lt!157064))))))

(declare-fun moveBitIndex!0 (BitStream!3934 (_ BitVec 64)) tuple2!8722)

(assert (=> d!33340 (= lt!157251 (_2!4618 (moveBitIndex!0 (_2!4617 lt!157064) (bvsub (bitIndex!0 (size!2230 (buf!2606 thiss!1305)) (currentByte!5112 thiss!1305) (currentBit!5107 thiss!1305)) (bitIndex!0 (size!2230 (buf!2606 (_2!4618 lt!157071))) (currentByte!5112 (_2!4618 lt!157071)) (currentBit!5107 (_2!4618 lt!157071)))))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!3934 (_ BitVec 64)) Bool)

(assert (=> d!33340 (moveBitIndexPrecond!0 (_2!4617 lt!157064) (bvsub (bitIndex!0 (size!2230 (buf!2606 thiss!1305)) (currentByte!5112 thiss!1305) (currentBit!5107 thiss!1305)) (bitIndex!0 (size!2230 (buf!2606 (_2!4618 lt!157071))) (currentByte!5112 (_2!4618 lt!157071)) (currentBit!5107 (_2!4618 lt!157071)))))))

(assert (=> d!33340 (= (withMovedBitIndex!0 (_2!4617 lt!157064) (bvsub (bitIndex!0 (size!2230 (buf!2606 thiss!1305)) (currentByte!5112 thiss!1305) (currentBit!5107 thiss!1305)) (bitIndex!0 (size!2230 (buf!2606 (_2!4618 lt!157071))) (currentByte!5112 (_2!4618 lt!157071)) (currentBit!5107 (_2!4618 lt!157071))))) lt!157251)))

(declare-fun b!106142 () Bool)

(assert (=> b!106142 (= e!69504 (= (size!2230 (buf!2606 (_2!4617 lt!157064))) (size!2230 (buf!2606 lt!157251))))))

(assert (= (and d!33340 res!87430) b!106142))

(declare-fun m!156233 () Bool)

(assert (=> d!33340 m!156233))

(declare-fun m!156235 () Bool)

(assert (=> d!33340 m!156235))

(declare-fun m!156237 () Bool)

(assert (=> d!33340 m!156237))

(declare-fun m!156239 () Bool)

(assert (=> d!33340 m!156239))

(assert (=> b!106025 d!33340))

(declare-fun d!33342 () Bool)

(declare-fun e!69505 () Bool)

(assert (=> d!33342 e!69505))

(declare-fun res!87432 () Bool)

(assert (=> d!33342 (=> (not res!87432) (not e!69505))))

(declare-fun lt!157256 () (_ BitVec 64))

(declare-fun lt!157257 () (_ BitVec 64))

(declare-fun lt!157254 () (_ BitVec 64))

(assert (=> d!33342 (= res!87432 (= lt!157257 (bvsub lt!157256 lt!157254)))))

(assert (=> d!33342 (or (= (bvand lt!157256 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!157254 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!157256 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!157256 lt!157254) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!33342 (= lt!157254 (remainingBits!0 ((_ sign_extend 32) (size!2230 (buf!2606 thiss!1305))) ((_ sign_extend 32) (currentByte!5112 thiss!1305)) ((_ sign_extend 32) (currentBit!5107 thiss!1305))))))

(declare-fun lt!157255 () (_ BitVec 64))

(declare-fun lt!157253 () (_ BitVec 64))

(assert (=> d!33342 (= lt!157256 (bvmul lt!157255 lt!157253))))

(assert (=> d!33342 (or (= lt!157255 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!157253 (bvsdiv (bvmul lt!157255 lt!157253) lt!157255)))))

(assert (=> d!33342 (= lt!157253 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!33342 (= lt!157255 ((_ sign_extend 32) (size!2230 (buf!2606 thiss!1305))))))

(assert (=> d!33342 (= lt!157257 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5112 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5107 thiss!1305))))))

(assert (=> d!33342 (invariant!0 (currentBit!5107 thiss!1305) (currentByte!5112 thiss!1305) (size!2230 (buf!2606 thiss!1305)))))

(assert (=> d!33342 (= (bitIndex!0 (size!2230 (buf!2606 thiss!1305)) (currentByte!5112 thiss!1305) (currentBit!5107 thiss!1305)) lt!157257)))

(declare-fun b!106143 () Bool)

(declare-fun res!87431 () Bool)

(assert (=> b!106143 (=> (not res!87431) (not e!69505))))

(assert (=> b!106143 (= res!87431 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!157257))))

(declare-fun b!106144 () Bool)

(declare-fun lt!157258 () (_ BitVec 64))

(assert (=> b!106144 (= e!69505 (bvsle lt!157257 (bvmul lt!157258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!106144 (or (= lt!157258 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!157258 #b0000000000000000000000000000000000000000000000000000000000001000) lt!157258)))))

(assert (=> b!106144 (= lt!157258 ((_ sign_extend 32) (size!2230 (buf!2606 thiss!1305))))))

(assert (= (and d!33342 res!87432) b!106143))

(assert (= (and b!106143 res!87431) b!106144))

(assert (=> d!33342 m!156217))

(assert (=> d!33342 m!156231))

(assert (=> b!106025 d!33342))

(declare-fun d!33344 () Bool)

(declare-fun e!69506 () Bool)

(assert (=> d!33344 e!69506))

(declare-fun res!87434 () Bool)

(assert (=> d!33344 (=> (not res!87434) (not e!69506))))

(declare-fun lt!157260 () (_ BitVec 64))

(declare-fun lt!157263 () (_ BitVec 64))

(declare-fun lt!157262 () (_ BitVec 64))

(assert (=> d!33344 (= res!87434 (= lt!157263 (bvsub lt!157262 lt!157260)))))

(assert (=> d!33344 (or (= (bvand lt!157262 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!157260 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!157262 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!157262 lt!157260) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!33344 (= lt!157260 (remainingBits!0 ((_ sign_extend 32) (size!2230 (buf!2606 (_2!4618 lt!157071)))) ((_ sign_extend 32) (currentByte!5112 (_2!4618 lt!157071))) ((_ sign_extend 32) (currentBit!5107 (_2!4618 lt!157071)))))))

(declare-fun lt!157261 () (_ BitVec 64))

(declare-fun lt!157259 () (_ BitVec 64))

(assert (=> d!33344 (= lt!157262 (bvmul lt!157261 lt!157259))))

(assert (=> d!33344 (or (= lt!157261 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!157259 (bvsdiv (bvmul lt!157261 lt!157259) lt!157261)))))

(assert (=> d!33344 (= lt!157259 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!33344 (= lt!157261 ((_ sign_extend 32) (size!2230 (buf!2606 (_2!4618 lt!157071)))))))

(assert (=> d!33344 (= lt!157263 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5112 (_2!4618 lt!157071))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5107 (_2!4618 lt!157071)))))))

(assert (=> d!33344 (invariant!0 (currentBit!5107 (_2!4618 lt!157071)) (currentByte!5112 (_2!4618 lt!157071)) (size!2230 (buf!2606 (_2!4618 lt!157071))))))

(assert (=> d!33344 (= (bitIndex!0 (size!2230 (buf!2606 (_2!4618 lt!157071))) (currentByte!5112 (_2!4618 lt!157071)) (currentBit!5107 (_2!4618 lt!157071))) lt!157263)))

(declare-fun b!106145 () Bool)

(declare-fun res!87433 () Bool)

(assert (=> b!106145 (=> (not res!87433) (not e!69506))))

(assert (=> b!106145 (= res!87433 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!157263))))

(declare-fun b!106146 () Bool)

(declare-fun lt!157264 () (_ BitVec 64))

(assert (=> b!106146 (= e!69506 (bvsle lt!157263 (bvmul lt!157264 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!106146 (or (= lt!157264 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!157264 #b0000000000000000000000000000000000000000000000000000000000001000) lt!157264)))))

(assert (=> b!106146 (= lt!157264 ((_ sign_extend 32) (size!2230 (buf!2606 (_2!4618 lt!157071)))))))

(assert (= (and d!33344 res!87434) b!106145))

(assert (= (and b!106145 res!87433) b!106146))

(declare-fun m!156241 () Bool)

(assert (=> d!33344 m!156241))

(assert (=> d!33344 m!156019))

(assert (=> b!106025 d!33344))

(declare-fun d!33346 () Bool)

(assert (=> d!33346 (= (onesLSBLong!0 (bvsub nBits!396 i!615)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!396 i!615)))))))

(assert (=> b!106036 d!33346))

(declare-fun d!33348 () Bool)

(assert (=> d!33348 (validate_offset_bits!1 ((_ sign_extend 32) (size!2230 (buf!2606 (_2!4618 lt!157071)))) ((_ sign_extend 32) (currentByte!5112 (_2!4618 lt!157059))) ((_ sign_extend 32) (currentBit!5107 (_2!4618 lt!157059))) lt!157073)))

(declare-fun lt!157279 () Unit!6498)

(declare-fun choose!9 (BitStream!3934 array!4893 (_ BitVec 64) BitStream!3934) Unit!6498)

(assert (=> d!33348 (= lt!157279 (choose!9 (_2!4618 lt!157059) (buf!2606 (_2!4618 lt!157071)) lt!157073 (BitStream!3935 (buf!2606 (_2!4618 lt!157071)) (currentByte!5112 (_2!4618 lt!157059)) (currentBit!5107 (_2!4618 lt!157059)))))))

(assert (=> d!33348 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4618 lt!157059) (buf!2606 (_2!4618 lt!157071)) lt!157073) lt!157279)))

(declare-fun bs!8143 () Bool)

(assert (= bs!8143 d!33348))

(assert (=> bs!8143 m!156043))

(declare-fun m!156243 () Bool)

(assert (=> bs!8143 m!156243))

(assert (=> b!106036 d!33348))

(declare-fun d!33350 () Bool)

(declare-fun lt!157286 () tuple2!8742)

(assert (=> d!33350 (= lt!157286 (readBit!0 (_1!4617 lt!157064)))))

(assert (=> d!33350 (= (readBitPure!0 (_1!4617 lt!157064)) (tuple2!8719 (_2!4628 lt!157286) (_1!4628 lt!157286)))))

(declare-fun bs!8144 () Bool)

(assert (= bs!8144 d!33350))

(declare-fun m!156245 () Bool)

(assert (=> bs!8144 m!156245))

(assert (=> b!106036 d!33350))

(declare-fun d!33352 () Bool)

(declare-fun e!69509 () Bool)

(assert (=> d!33352 e!69509))

(declare-fun res!87437 () Bool)

(assert (=> d!33352 (=> (not res!87437) (not e!69509))))

(declare-fun lt!157296 () tuple2!8718)

(declare-fun lt!157297 () tuple2!8718)

(assert (=> d!33352 (= res!87437 (= (bitIndex!0 (size!2230 (buf!2606 (_1!4616 lt!157296))) (currentByte!5112 (_1!4616 lt!157296)) (currentBit!5107 (_1!4616 lt!157296))) (bitIndex!0 (size!2230 (buf!2606 (_1!4616 lt!157297))) (currentByte!5112 (_1!4616 lt!157297)) (currentBit!5107 (_1!4616 lt!157297)))))))

(declare-fun lt!157298 () BitStream!3934)

(declare-fun lt!157295 () Unit!6498)

(declare-fun choose!50 (BitStream!3934 BitStream!3934 BitStream!3934 tuple2!8718 tuple2!8718 BitStream!3934 Bool tuple2!8718 tuple2!8718 BitStream!3934 Bool) Unit!6498)

(assert (=> d!33352 (= lt!157295 (choose!50 lt!157054 (_2!4618 lt!157071) lt!157298 lt!157296 (tuple2!8719 (_1!4616 lt!157296) (_2!4616 lt!157296)) (_1!4616 lt!157296) (_2!4616 lt!157296) lt!157297 (tuple2!8719 (_1!4616 lt!157297) (_2!4616 lt!157297)) (_1!4616 lt!157297) (_2!4616 lt!157297)))))

(assert (=> d!33352 (= lt!157297 (readBitPure!0 lt!157298))))

(assert (=> d!33352 (= lt!157296 (readBitPure!0 lt!157054))))

(assert (=> d!33352 (= lt!157298 (BitStream!3935 (buf!2606 (_2!4618 lt!157071)) (currentByte!5112 lt!157054) (currentBit!5107 lt!157054)))))

(assert (=> d!33352 (invariant!0 (currentBit!5107 lt!157054) (currentByte!5112 lt!157054) (size!2230 (buf!2606 (_2!4618 lt!157071))))))

(assert (=> d!33352 (= (readBitPrefixLemma!0 lt!157054 (_2!4618 lt!157071)) lt!157295)))

(declare-fun b!106149 () Bool)

(assert (=> b!106149 (= e!69509 (= (_2!4616 lt!157296) (_2!4616 lt!157297)))))

(assert (= (and d!33352 res!87437) b!106149))

(declare-fun m!156251 () Bool)

(assert (=> d!33352 m!156251))

(assert (=> d!33352 m!156059))

(declare-fun m!156253 () Bool)

(assert (=> d!33352 m!156253))

(declare-fun m!156255 () Bool)

(assert (=> d!33352 m!156255))

(declare-fun m!156257 () Bool)

(assert (=> d!33352 m!156257))

(declare-fun m!156259 () Bool)

(assert (=> d!33352 m!156259))

(assert (=> b!106036 d!33352))

(declare-fun b!106178 () Bool)

(declare-fun e!69527 () Unit!6498)

(declare-fun Unit!6504 () Unit!6498)

(assert (=> b!106178 (= e!69527 Unit!6504)))

(declare-fun lt!157372 () (_ BitVec 64))

(declare-fun e!69526 () Bool)

(declare-fun b!106179 () Bool)

(declare-fun lt!157390 () (_ BitVec 64))

(declare-fun lt!157389 () tuple2!8720)

(assert (=> b!106179 (= e!69526 (= (_1!4617 lt!157389) (withMovedBitIndex!0 (_2!4617 lt!157389) (bvsub lt!157390 lt!157372))))))

(assert (=> b!106179 (or (= (bvand lt!157390 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!157372 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!157390 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!157390 lt!157372) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!106179 (= lt!157372 (bitIndex!0 (size!2230 (buf!2606 (_2!4618 lt!157071))) (currentByte!5112 (_2!4618 lt!157071)) (currentBit!5107 (_2!4618 lt!157071))))))

(assert (=> b!106179 (= lt!157390 (bitIndex!0 (size!2230 (buf!2606 thiss!1305)) (currentByte!5112 thiss!1305) (currentBit!5107 thiss!1305)))))

(declare-fun b!106180 () Bool)

(declare-fun lt!157375 () Unit!6498)

(assert (=> b!106180 (= e!69527 lt!157375)))

(declare-fun lt!157380 () (_ BitVec 64))

(assert (=> b!106180 (= lt!157380 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!157387 () (_ BitVec 64))

(assert (=> b!106180 (= lt!157387 (bitIndex!0 (size!2230 (buf!2606 thiss!1305)) (currentByte!5112 thiss!1305) (currentBit!5107 thiss!1305)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!4893 array!4893 (_ BitVec 64) (_ BitVec 64)) Unit!6498)

(assert (=> b!106180 (= lt!157375 (arrayBitRangesEqSymmetric!0 (buf!2606 thiss!1305) (buf!2606 (_2!4618 lt!157071)) lt!157380 lt!157387))))

(assert (=> b!106180 (arrayBitRangesEq!0 (buf!2606 (_2!4618 lt!157071)) (buf!2606 thiss!1305) lt!157380 lt!157387)))

(declare-fun b!106181 () Bool)

(declare-fun res!87463 () Bool)

(assert (=> b!106181 (=> (not res!87463) (not e!69526))))

(assert (=> b!106181 (= res!87463 (isPrefixOf!0 (_1!4617 lt!157389) thiss!1305))))

(declare-fun d!33358 () Bool)

(assert (=> d!33358 e!69526))

(declare-fun res!87462 () Bool)

(assert (=> d!33358 (=> (not res!87462) (not e!69526))))

(assert (=> d!33358 (= res!87462 (isPrefixOf!0 (_1!4617 lt!157389) (_2!4617 lt!157389)))))

(declare-fun lt!157391 () BitStream!3934)

(assert (=> d!33358 (= lt!157389 (tuple2!8721 lt!157391 (_2!4618 lt!157071)))))

(declare-fun lt!157383 () Unit!6498)

(declare-fun lt!157386 () Unit!6498)

(assert (=> d!33358 (= lt!157383 lt!157386)))

(assert (=> d!33358 (isPrefixOf!0 lt!157391 (_2!4618 lt!157071))))

(assert (=> d!33358 (= lt!157386 (lemmaIsPrefixTransitive!0 lt!157391 (_2!4618 lt!157071) (_2!4618 lt!157071)))))

(declare-fun lt!157381 () Unit!6498)

(declare-fun lt!157376 () Unit!6498)

(assert (=> d!33358 (= lt!157381 lt!157376)))

(assert (=> d!33358 (isPrefixOf!0 lt!157391 (_2!4618 lt!157071))))

(assert (=> d!33358 (= lt!157376 (lemmaIsPrefixTransitive!0 lt!157391 thiss!1305 (_2!4618 lt!157071)))))

(declare-fun lt!157382 () Unit!6498)

(assert (=> d!33358 (= lt!157382 e!69527)))

(declare-fun c!6546 () Bool)

(assert (=> d!33358 (= c!6546 (not (= (size!2230 (buf!2606 thiss!1305)) #b00000000000000000000000000000000)))))

(declare-fun lt!157378 () Unit!6498)

(declare-fun lt!157374 () Unit!6498)

(assert (=> d!33358 (= lt!157378 lt!157374)))

(assert (=> d!33358 (isPrefixOf!0 (_2!4618 lt!157071) (_2!4618 lt!157071))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!3934) Unit!6498)

(assert (=> d!33358 (= lt!157374 (lemmaIsPrefixRefl!0 (_2!4618 lt!157071)))))

(declare-fun lt!157384 () Unit!6498)

(declare-fun lt!157385 () Unit!6498)

(assert (=> d!33358 (= lt!157384 lt!157385)))

(assert (=> d!33358 (= lt!157385 (lemmaIsPrefixRefl!0 (_2!4618 lt!157071)))))

(declare-fun lt!157379 () Unit!6498)

(declare-fun lt!157377 () Unit!6498)

(assert (=> d!33358 (= lt!157379 lt!157377)))

(assert (=> d!33358 (isPrefixOf!0 lt!157391 lt!157391)))

(assert (=> d!33358 (= lt!157377 (lemmaIsPrefixRefl!0 lt!157391))))

(declare-fun lt!157373 () Unit!6498)

(declare-fun lt!157388 () Unit!6498)

(assert (=> d!33358 (= lt!157373 lt!157388)))

(assert (=> d!33358 (isPrefixOf!0 thiss!1305 thiss!1305)))

(assert (=> d!33358 (= lt!157388 (lemmaIsPrefixRefl!0 thiss!1305))))

(assert (=> d!33358 (= lt!157391 (BitStream!3935 (buf!2606 (_2!4618 lt!157071)) (currentByte!5112 thiss!1305) (currentBit!5107 thiss!1305)))))

(assert (=> d!33358 (isPrefixOf!0 thiss!1305 (_2!4618 lt!157071))))

(assert (=> d!33358 (= (reader!0 thiss!1305 (_2!4618 lt!157071)) lt!157389)))

(declare-fun b!106182 () Bool)

(declare-fun res!87464 () Bool)

(assert (=> b!106182 (=> (not res!87464) (not e!69526))))

(assert (=> b!106182 (= res!87464 (isPrefixOf!0 (_2!4617 lt!157389) (_2!4618 lt!157071)))))

(assert (= (and d!33358 c!6546) b!106180))

(assert (= (and d!33358 (not c!6546)) b!106178))

(assert (= (and d!33358 res!87462) b!106181))

(assert (= (and b!106181 res!87463) b!106182))

(assert (= (and b!106182 res!87464) b!106179))

(declare-fun m!156281 () Bool)

(assert (=> d!33358 m!156281))

(declare-fun m!156283 () Bool)

(assert (=> d!33358 m!156283))

(declare-fun m!156285 () Bool)

(assert (=> d!33358 m!156285))

(declare-fun m!156287 () Bool)

(assert (=> d!33358 m!156287))

(declare-fun m!156289 () Bool)

(assert (=> d!33358 m!156289))

(declare-fun m!156291 () Bool)

(assert (=> d!33358 m!156291))

(declare-fun m!156293 () Bool)

(assert (=> d!33358 m!156293))

(declare-fun m!156295 () Bool)

(assert (=> d!33358 m!156295))

(declare-fun m!156297 () Bool)

(assert (=> d!33358 m!156297))

(assert (=> d!33358 m!156045))

(declare-fun m!156299 () Bool)

(assert (=> d!33358 m!156299))

(declare-fun m!156301 () Bool)

(assert (=> b!106182 m!156301))

(declare-fun m!156303 () Bool)

(assert (=> b!106179 m!156303))

(assert (=> b!106179 m!156005))

(assert (=> b!106179 m!156003))

(assert (=> b!106180 m!156003))

(declare-fun m!156305 () Bool)

(assert (=> b!106180 m!156305))

(declare-fun m!156307 () Bool)

(assert (=> b!106180 m!156307))

(declare-fun m!156309 () Bool)

(assert (=> b!106181 m!156309))

(assert (=> b!106036 d!33358))

(declare-fun d!33374 () Bool)

(declare-datatypes ((tuple2!8746 0))(
  ( (tuple2!8747 (_1!4630 (_ BitVec 64)) (_2!4630 BitStream!3934)) )
))
(declare-fun lt!157394 () tuple2!8746)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!3934 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!8746)

(assert (=> d!33374 (= lt!157394 (readNLeastSignificantBitsLoop!0 (_1!4617 lt!157064) nBits!396 i!615 lt!157057))))

(assert (=> d!33374 (= (readNLeastSignificantBitsLoopPure!0 (_1!4617 lt!157064) nBits!396 i!615 lt!157057) (tuple2!8725 (_2!4630 lt!157394) (_1!4630 lt!157394)))))

(declare-fun bs!8149 () Bool)

(assert (= bs!8149 d!33374))

(declare-fun m!156311 () Bool)

(assert (=> bs!8149 m!156311))

(assert (=> b!106036 d!33374))

(declare-fun d!33376 () Bool)

(declare-fun e!69528 () Bool)

(assert (=> d!33376 e!69528))

(declare-fun res!87466 () Bool)

(assert (=> d!33376 (=> (not res!87466) (not e!69528))))

(declare-fun lt!157396 () (_ BitVec 64))

(declare-fun lt!157398 () (_ BitVec 64))

(declare-fun lt!157399 () (_ BitVec 64))

(assert (=> d!33376 (= res!87466 (= lt!157399 (bvsub lt!157398 lt!157396)))))

(assert (=> d!33376 (or (= (bvand lt!157398 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!157396 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!157398 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!157398 lt!157396) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!33376 (= lt!157396 (remainingBits!0 ((_ sign_extend 32) (size!2230 (buf!2606 (_1!4616 lt!157051)))) ((_ sign_extend 32) (currentByte!5112 (_1!4616 lt!157051))) ((_ sign_extend 32) (currentBit!5107 (_1!4616 lt!157051)))))))

(declare-fun lt!157397 () (_ BitVec 64))

(declare-fun lt!157395 () (_ BitVec 64))

(assert (=> d!33376 (= lt!157398 (bvmul lt!157397 lt!157395))))

(assert (=> d!33376 (or (= lt!157397 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!157395 (bvsdiv (bvmul lt!157397 lt!157395) lt!157397)))))

(assert (=> d!33376 (= lt!157395 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!33376 (= lt!157397 ((_ sign_extend 32) (size!2230 (buf!2606 (_1!4616 lt!157051)))))))

(assert (=> d!33376 (= lt!157399 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5112 (_1!4616 lt!157051))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5107 (_1!4616 lt!157051)))))))

(assert (=> d!33376 (invariant!0 (currentBit!5107 (_1!4616 lt!157051)) (currentByte!5112 (_1!4616 lt!157051)) (size!2230 (buf!2606 (_1!4616 lt!157051))))))

(assert (=> d!33376 (= (bitIndex!0 (size!2230 (buf!2606 (_1!4616 lt!157051))) (currentByte!5112 (_1!4616 lt!157051)) (currentBit!5107 (_1!4616 lt!157051))) lt!157399)))

(declare-fun b!106183 () Bool)

(declare-fun res!87465 () Bool)

(assert (=> b!106183 (=> (not res!87465) (not e!69528))))

(assert (=> b!106183 (= res!87465 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!157399))))

(declare-fun b!106184 () Bool)

(declare-fun lt!157400 () (_ BitVec 64))

(assert (=> b!106184 (= e!69528 (bvsle lt!157399 (bvmul lt!157400 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!106184 (or (= lt!157400 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!157400 #b0000000000000000000000000000000000000000000000000000000000001000) lt!157400)))))

(assert (=> b!106184 (= lt!157400 ((_ sign_extend 32) (size!2230 (buf!2606 (_1!4616 lt!157051)))))))

(assert (= (and d!33376 res!87466) b!106183))

(assert (= (and b!106183 res!87465) b!106184))

(declare-fun m!156313 () Bool)

(assert (=> d!33376 m!156313))

(declare-fun m!156315 () Bool)

(assert (=> d!33376 m!156315))

(assert (=> b!106036 d!33376))

(declare-fun d!33378 () Bool)

(assert (=> d!33378 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2230 (buf!2606 (_2!4618 lt!157071)))) ((_ sign_extend 32) (currentByte!5112 (_2!4618 lt!157059))) ((_ sign_extend 32) (currentBit!5107 (_2!4618 lt!157059))) lt!157073) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2230 (buf!2606 (_2!4618 lt!157071)))) ((_ sign_extend 32) (currentByte!5112 (_2!4618 lt!157059))) ((_ sign_extend 32) (currentBit!5107 (_2!4618 lt!157059)))) lt!157073))))

(declare-fun bs!8150 () Bool)

(assert (= bs!8150 d!33378))

(declare-fun m!156317 () Bool)

(assert (=> bs!8150 m!156317))

(assert (=> b!106036 d!33378))

(declare-fun d!33380 () Bool)

(assert (=> d!33380 (isPrefixOf!0 thiss!1305 (_2!4618 lt!157071))))

(declare-fun lt!157403 () Unit!6498)

(declare-fun choose!30 (BitStream!3934 BitStream!3934 BitStream!3934) Unit!6498)

(assert (=> d!33380 (= lt!157403 (choose!30 thiss!1305 (_2!4618 lt!157059) (_2!4618 lt!157071)))))

(assert (=> d!33380 (isPrefixOf!0 thiss!1305 (_2!4618 lt!157059))))

(assert (=> d!33380 (= (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4618 lt!157059) (_2!4618 lt!157071)) lt!157403)))

(declare-fun bs!8151 () Bool)

(assert (= bs!8151 d!33380))

(assert (=> bs!8151 m!156045))

(declare-fun m!156319 () Bool)

(assert (=> bs!8151 m!156319))

(assert (=> bs!8151 m!156001))

(assert (=> b!106036 d!33380))

(declare-fun d!33382 () Bool)

(declare-fun e!69591 () Bool)

(assert (=> d!33382 e!69591))

(declare-fun res!87549 () Bool)

(assert (=> d!33382 (=> (not res!87549) (not e!69591))))

(declare-fun lt!157733 () tuple2!8722)

(assert (=> d!33382 (= res!87549 (= (size!2230 (buf!2606 (_2!4618 lt!157059))) (size!2230 (buf!2606 (_2!4618 lt!157733)))))))

(declare-fun e!69589 () tuple2!8722)

(assert (=> d!33382 (= lt!157733 e!69589)))

(declare-fun c!6557 () Bool)

(assert (=> d!33382 (= c!6557 (bvslt (bvadd #b00000000000000000000000000000001 i!615) nBits!396))))

(assert (=> d!33382 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)) (bvsle (bvadd #b00000000000000000000000000000001 i!615) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!33382 (= (appendNLeastSignificantBitsLoop!0 (_2!4618 lt!157059) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) lt!157733)))

(declare-fun lt!157707 () tuple2!8724)

(declare-fun b!106286 () Bool)

(declare-fun lt!157722 () tuple2!8720)

(assert (=> b!106286 (= e!69591 (and (= (_2!4619 lt!157707) v!199) (= (_1!4619 lt!157707) (_2!4617 lt!157722))))))

(declare-fun lt!157730 () (_ BitVec 64))

(assert (=> b!106286 (= lt!157707 (readNLeastSignificantBitsLoopPure!0 (_1!4617 lt!157722) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!157730))))

(declare-fun lt!157738 () Unit!6498)

(declare-fun lt!157719 () Unit!6498)

(assert (=> b!106286 (= lt!157738 lt!157719)))

(declare-fun lt!157709 () (_ BitVec 64))

(assert (=> b!106286 (validate_offset_bits!1 ((_ sign_extend 32) (size!2230 (buf!2606 (_2!4618 lt!157733)))) ((_ sign_extend 32) (currentByte!5112 (_2!4618 lt!157059))) ((_ sign_extend 32) (currentBit!5107 (_2!4618 lt!157059))) lt!157709)))

(assert (=> b!106286 (= lt!157719 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4618 lt!157059) (buf!2606 (_2!4618 lt!157733)) lt!157709))))

(declare-fun e!69588 () Bool)

(assert (=> b!106286 e!69588))

(declare-fun res!87554 () Bool)

(assert (=> b!106286 (=> (not res!87554) (not e!69588))))

(assert (=> b!106286 (= res!87554 (and (= (size!2230 (buf!2606 (_2!4618 lt!157059))) (size!2230 (buf!2606 (_2!4618 lt!157733)))) (bvsge lt!157709 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!106286 (= lt!157709 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!106286 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!106286 (= lt!157730 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(assert (=> b!106286 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!106286 (= lt!157722 (reader!0 (_2!4618 lt!157059) (_2!4618 lt!157733)))))

(declare-fun b!106287 () Bool)

(declare-fun e!69587 () (_ BitVec 64))

(assert (=> b!106287 (= e!69587 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!106288 () Bool)

(declare-fun lt!157727 () Unit!6498)

(assert (=> b!106288 (= e!69589 (tuple2!8723 lt!157727 (_2!4618 lt!157059)))))

(declare-fun lt!157740 () BitStream!3934)

(assert (=> b!106288 (= lt!157740 (_2!4618 lt!157059))))

(assert (=> b!106288 (= lt!157727 (lemmaIsPrefixRefl!0 lt!157740))))

(declare-fun call!1338 () Bool)

(assert (=> b!106288 call!1338))

(declare-fun b!106289 () Bool)

(declare-fun res!87551 () Bool)

(declare-fun lt!157710 () tuple2!8722)

(assert (=> b!106289 (= res!87551 (= (bitIndex!0 (size!2230 (buf!2606 (_2!4618 lt!157710))) (currentByte!5112 (_2!4618 lt!157710)) (currentBit!5107 (_2!4618 lt!157710))) (bvadd (bitIndex!0 (size!2230 (buf!2606 (_2!4618 lt!157059))) (currentByte!5112 (_2!4618 lt!157059)) (currentBit!5107 (_2!4618 lt!157059))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun e!69593 () Bool)

(assert (=> b!106289 (=> (not res!87551) (not e!69593))))

(declare-fun b!106290 () Bool)

(declare-fun e!69592 () Bool)

(declare-fun lt!157718 () tuple2!8718)

(assert (=> b!106290 (= e!69592 (= (bitIndex!0 (size!2230 (buf!2606 (_1!4616 lt!157718))) (currentByte!5112 (_1!4616 lt!157718)) (currentBit!5107 (_1!4616 lt!157718))) (bitIndex!0 (size!2230 (buf!2606 (_2!4618 lt!157710))) (currentByte!5112 (_2!4618 lt!157710)) (currentBit!5107 (_2!4618 lt!157710)))))))

(declare-fun b!106291 () Bool)

(declare-fun res!87552 () Bool)

(assert (=> b!106291 (=> (not res!87552) (not e!69591))))

(assert (=> b!106291 (= res!87552 (isPrefixOf!0 (_2!4618 lt!157059) (_2!4618 lt!157733)))))

(declare-fun b!106292 () Bool)

(declare-fun lt!157713 () tuple2!8722)

(declare-fun Unit!6506 () Unit!6498)

(assert (=> b!106292 (= e!69589 (tuple2!8723 Unit!6506 (_2!4618 lt!157713)))))

(declare-fun lt!157734 () Bool)

(assert (=> b!106292 (= lt!157734 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!106292 (= lt!157710 (appendBit!0 (_2!4618 lt!157059) lt!157734))))

(declare-fun res!87548 () Bool)

(assert (=> b!106292 (= res!87548 (= (size!2230 (buf!2606 (_2!4618 lt!157059))) (size!2230 (buf!2606 (_2!4618 lt!157710)))))))

(assert (=> b!106292 (=> (not res!87548) (not e!69593))))

(assert (=> b!106292 e!69593))

(declare-fun lt!157731 () tuple2!8722)

(assert (=> b!106292 (= lt!157731 lt!157710)))

(assert (=> b!106292 (= lt!157713 (appendNLeastSignificantBitsLoop!0 (_2!4618 lt!157731) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))))

(declare-fun lt!157715 () Unit!6498)

(assert (=> b!106292 (= lt!157715 (lemmaIsPrefixTransitive!0 (_2!4618 lt!157059) (_2!4618 lt!157731) (_2!4618 lt!157713)))))

(assert (=> b!106292 call!1338))

(declare-fun lt!157717 () Unit!6498)

(assert (=> b!106292 (= lt!157717 lt!157715)))

(assert (=> b!106292 (invariant!0 (currentBit!5107 (_2!4618 lt!157059)) (currentByte!5112 (_2!4618 lt!157059)) (size!2230 (buf!2606 (_2!4618 lt!157731))))))

(declare-fun lt!157737 () BitStream!3934)

(assert (=> b!106292 (= lt!157737 (BitStream!3935 (buf!2606 (_2!4618 lt!157731)) (currentByte!5112 (_2!4618 lt!157059)) (currentBit!5107 (_2!4618 lt!157059))))))

(assert (=> b!106292 (invariant!0 (currentBit!5107 lt!157737) (currentByte!5112 lt!157737) (size!2230 (buf!2606 (_2!4618 lt!157713))))))

(declare-fun lt!157743 () BitStream!3934)

(assert (=> b!106292 (= lt!157743 (BitStream!3935 (buf!2606 (_2!4618 lt!157713)) (currentByte!5112 lt!157737) (currentBit!5107 lt!157737)))))

(declare-fun lt!157726 () tuple2!8718)

(assert (=> b!106292 (= lt!157726 (readBitPure!0 lt!157737))))

(declare-fun lt!157750 () tuple2!8718)

(assert (=> b!106292 (= lt!157750 (readBitPure!0 lt!157743))))

(declare-fun lt!157749 () Unit!6498)

(assert (=> b!106292 (= lt!157749 (readBitPrefixLemma!0 lt!157737 (_2!4618 lt!157713)))))

(declare-fun res!87550 () Bool)

(assert (=> b!106292 (= res!87550 (= (bitIndex!0 (size!2230 (buf!2606 (_1!4616 lt!157726))) (currentByte!5112 (_1!4616 lt!157726)) (currentBit!5107 (_1!4616 lt!157726))) (bitIndex!0 (size!2230 (buf!2606 (_1!4616 lt!157750))) (currentByte!5112 (_1!4616 lt!157750)) (currentBit!5107 (_1!4616 lt!157750)))))))

(declare-fun e!69590 () Bool)

(assert (=> b!106292 (=> (not res!87550) (not e!69590))))

(assert (=> b!106292 e!69590))

(declare-fun lt!157735 () Unit!6498)

(assert (=> b!106292 (= lt!157735 lt!157749)))

(declare-fun lt!157729 () tuple2!8720)

(assert (=> b!106292 (= lt!157729 (reader!0 (_2!4618 lt!157059) (_2!4618 lt!157713)))))

(declare-fun lt!157724 () tuple2!8720)

(assert (=> b!106292 (= lt!157724 (reader!0 (_2!4618 lt!157731) (_2!4618 lt!157713)))))

(declare-fun lt!157712 () tuple2!8718)

(assert (=> b!106292 (= lt!157712 (readBitPure!0 (_1!4617 lt!157729)))))

(assert (=> b!106292 (= (_2!4616 lt!157712) lt!157734)))

(declare-fun lt!157720 () Unit!6498)

(declare-fun Unit!6508 () Unit!6498)

(assert (=> b!106292 (= lt!157720 Unit!6508)))

(declare-fun lt!157721 () (_ BitVec 64))

(assert (=> b!106292 (= lt!157721 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(declare-fun lt!157741 () (_ BitVec 64))

(assert (=> b!106292 (= lt!157741 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(declare-fun lt!157706 () Unit!6498)

(assert (=> b!106292 (= lt!157706 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4618 lt!157059) (buf!2606 (_2!4618 lt!157713)) lt!157741))))

(assert (=> b!106292 (validate_offset_bits!1 ((_ sign_extend 32) (size!2230 (buf!2606 (_2!4618 lt!157713)))) ((_ sign_extend 32) (currentByte!5112 (_2!4618 lt!157059))) ((_ sign_extend 32) (currentBit!5107 (_2!4618 lt!157059))) lt!157741)))

(declare-fun lt!157716 () Unit!6498)

(assert (=> b!106292 (= lt!157716 lt!157706)))

(declare-fun lt!157708 () tuple2!8724)

(assert (=> b!106292 (= lt!157708 (readNLeastSignificantBitsLoopPure!0 (_1!4617 lt!157729) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!157721))))

(declare-fun lt!157747 () (_ BitVec 64))

(assert (=> b!106292 (= lt!157747 ((_ sign_extend 32) (bvsub (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b00000000000000000000000000000001)))))

(declare-fun lt!157745 () Unit!6498)

(assert (=> b!106292 (= lt!157745 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4618 lt!157731) (buf!2606 (_2!4618 lt!157713)) lt!157747))))

(assert (=> b!106292 (validate_offset_bits!1 ((_ sign_extend 32) (size!2230 (buf!2606 (_2!4618 lt!157713)))) ((_ sign_extend 32) (currentByte!5112 (_2!4618 lt!157731))) ((_ sign_extend 32) (currentBit!5107 (_2!4618 lt!157731))) lt!157747)))

(declare-fun lt!157744 () Unit!6498)

(assert (=> b!106292 (= lt!157744 lt!157745)))

(declare-fun lt!157725 () tuple2!8724)

(assert (=> b!106292 (= lt!157725 (readNLeastSignificantBitsLoopPure!0 (_1!4617 lt!157724) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!157721 (ite (_2!4616 lt!157712) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!157714 () tuple2!8724)

(assert (=> b!106292 (= lt!157714 (readNLeastSignificantBitsLoopPure!0 (_1!4617 lt!157729) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!157721))))

(declare-fun c!6558 () Bool)

(assert (=> b!106292 (= c!6558 (_2!4616 (readBitPure!0 (_1!4617 lt!157729))))))

(declare-fun lt!157739 () tuple2!8724)

(assert (=> b!106292 (= lt!157739 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4617 lt!157729) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!157721 e!69587)))))

(declare-fun lt!157736 () Unit!6498)

(assert (=> b!106292 (= lt!157736 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4617 lt!157729) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!157721))))

(assert (=> b!106292 (and (= (_2!4619 lt!157714) (_2!4619 lt!157739)) (= (_1!4619 lt!157714) (_1!4619 lt!157739)))))

(declare-fun lt!157728 () Unit!6498)

(assert (=> b!106292 (= lt!157728 lt!157736)))

(assert (=> b!106292 (= (_1!4617 lt!157729) (withMovedBitIndex!0 (_2!4617 lt!157729) (bvsub (bitIndex!0 (size!2230 (buf!2606 (_2!4618 lt!157059))) (currentByte!5112 (_2!4618 lt!157059)) (currentBit!5107 (_2!4618 lt!157059))) (bitIndex!0 (size!2230 (buf!2606 (_2!4618 lt!157713))) (currentByte!5112 (_2!4618 lt!157713)) (currentBit!5107 (_2!4618 lt!157713))))))))

(declare-fun lt!157723 () Unit!6498)

(declare-fun Unit!6509 () Unit!6498)

(assert (=> b!106292 (= lt!157723 Unit!6509)))

(assert (=> b!106292 (= (_1!4617 lt!157724) (withMovedBitIndex!0 (_2!4617 lt!157724) (bvsub (bitIndex!0 (size!2230 (buf!2606 (_2!4618 lt!157731))) (currentByte!5112 (_2!4618 lt!157731)) (currentBit!5107 (_2!4618 lt!157731))) (bitIndex!0 (size!2230 (buf!2606 (_2!4618 lt!157713))) (currentByte!5112 (_2!4618 lt!157713)) (currentBit!5107 (_2!4618 lt!157713))))))))

(declare-fun lt!157732 () Unit!6498)

(declare-fun Unit!6510 () Unit!6498)

(assert (=> b!106292 (= lt!157732 Unit!6510)))

(assert (=> b!106292 (= (bitIndex!0 (size!2230 (buf!2606 (_2!4618 lt!157059))) (currentByte!5112 (_2!4618 lt!157059)) (currentBit!5107 (_2!4618 lt!157059))) (bvsub (bitIndex!0 (size!2230 (buf!2606 (_2!4618 lt!157731))) (currentByte!5112 (_2!4618 lt!157731)) (currentBit!5107 (_2!4618 lt!157731))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!157748 () Unit!6498)

(declare-fun Unit!6512 () Unit!6498)

(assert (=> b!106292 (= lt!157748 Unit!6512)))

(assert (=> b!106292 (= (_2!4619 lt!157708) (_2!4619 lt!157725))))

(declare-fun lt!157746 () Unit!6498)

(declare-fun Unit!6513 () Unit!6498)

(assert (=> b!106292 (= lt!157746 Unit!6513)))

(assert (=> b!106292 (= (_1!4619 lt!157708) (_2!4617 lt!157729))))

(declare-fun b!106293 () Bool)

(declare-fun res!87556 () Bool)

(assert (=> b!106293 (=> (not res!87556) (not e!69591))))

(declare-fun lt!157711 () (_ BitVec 64))

(declare-fun lt!157742 () (_ BitVec 64))

(assert (=> b!106293 (= res!87556 (= (bitIndex!0 (size!2230 (buf!2606 (_2!4618 lt!157733))) (currentByte!5112 (_2!4618 lt!157733)) (currentBit!5107 (_2!4618 lt!157733))) (bvadd lt!157742 lt!157711)))))

(assert (=> b!106293 (or (not (= (bvand lt!157742 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!157711 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!157742 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!157742 lt!157711) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!106293 (= lt!157711 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!106293 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!106293 (= lt!157742 (bitIndex!0 (size!2230 (buf!2606 (_2!4618 lt!157059))) (currentByte!5112 (_2!4618 lt!157059)) (currentBit!5107 (_2!4618 lt!157059))))))

(declare-fun b!106294 () Bool)

(declare-fun res!87553 () Bool)

(assert (=> b!106294 (= res!87553 (isPrefixOf!0 (_2!4618 lt!157059) (_2!4618 lt!157710)))))

(assert (=> b!106294 (=> (not res!87553) (not e!69593))))

(declare-fun bm!1335 () Bool)

(assert (=> bm!1335 (= call!1338 (isPrefixOf!0 (ite c!6557 (_2!4618 lt!157059) lt!157740) (ite c!6557 (_2!4618 lt!157713) lt!157740)))))

(declare-fun b!106295 () Bool)

(assert (=> b!106295 (= e!69590 (= (_2!4616 lt!157726) (_2!4616 lt!157750)))))

(declare-fun b!106296 () Bool)

(assert (=> b!106296 (= e!69587 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))))))

(declare-fun b!106297 () Bool)

(assert (=> b!106297 (= lt!157718 (readBitPure!0 (readerFrom!0 (_2!4618 lt!157710) (currentBit!5107 (_2!4618 lt!157059)) (currentByte!5112 (_2!4618 lt!157059)))))))

(declare-fun res!87555 () Bool)

(assert (=> b!106297 (= res!87555 (and (= (_2!4616 lt!157718) lt!157734) (= (_1!4616 lt!157718) (_2!4618 lt!157710))))))

(assert (=> b!106297 (=> (not res!87555) (not e!69592))))

(assert (=> b!106297 (= e!69593 e!69592)))

(declare-fun b!106298 () Bool)

(assert (=> b!106298 (= e!69588 (validate_offset_bits!1 ((_ sign_extend 32) (size!2230 (buf!2606 (_2!4618 lt!157059)))) ((_ sign_extend 32) (currentByte!5112 (_2!4618 lt!157059))) ((_ sign_extend 32) (currentBit!5107 (_2!4618 lt!157059))) lt!157709))))

(assert (= (and d!33382 c!6557) b!106292))

(assert (= (and d!33382 (not c!6557)) b!106288))

(assert (= (and b!106292 res!87548) b!106289))

(assert (= (and b!106289 res!87551) b!106294))

(assert (= (and b!106294 res!87553) b!106297))

(assert (= (and b!106297 res!87555) b!106290))

(assert (= (and b!106292 res!87550) b!106295))

(assert (= (and b!106292 c!6558) b!106296))

(assert (= (and b!106292 (not c!6558)) b!106287))

(assert (= (or b!106292 b!106288) bm!1335))

(assert (= (and d!33382 res!87549) b!106293))

(assert (= (and b!106293 res!87556) b!106291))

(assert (= (and b!106291 res!87552) b!106286))

(assert (= (and b!106286 res!87554) b!106298))

(declare-fun m!156463 () Bool)

(assert (=> b!106294 m!156463))

(declare-fun m!156465 () Bool)

(assert (=> b!106293 m!156465))

(assert (=> b!106293 m!156017))

(declare-fun m!156469 () Bool)

(assert (=> b!106288 m!156469))

(declare-fun m!156473 () Bool)

(assert (=> bm!1335 m!156473))

(declare-fun m!156475 () Bool)

(assert (=> b!106289 m!156475))

(assert (=> b!106289 m!156017))

(declare-fun m!156479 () Bool)

(assert (=> b!106286 m!156479))

(declare-fun m!156481 () Bool)

(assert (=> b!106286 m!156481))

(declare-fun m!156483 () Bool)

(assert (=> b!106286 m!156483))

(declare-fun m!156485 () Bool)

(assert (=> b!106286 m!156485))

(declare-fun m!156487 () Bool)

(assert (=> b!106286 m!156487))

(declare-fun m!156490 () Bool)

(assert (=> b!106298 m!156490))

(declare-fun m!156493 () Bool)

(assert (=> b!106297 m!156493))

(assert (=> b!106297 m!156493))

(declare-fun m!156497 () Bool)

(assert (=> b!106297 m!156497))

(declare-fun m!156499 () Bool)

(assert (=> b!106290 m!156499))

(assert (=> b!106290 m!156475))

(declare-fun m!156503 () Bool)

(assert (=> b!106292 m!156503))

(declare-fun m!156505 () Bool)

(assert (=> b!106292 m!156505))

(declare-fun m!156507 () Bool)

(assert (=> b!106292 m!156507))

(declare-fun m!156509 () Bool)

(assert (=> b!106292 m!156509))

(declare-fun m!156511 () Bool)

(assert (=> b!106292 m!156511))

(declare-fun m!156513 () Bool)

(assert (=> b!106292 m!156513))

(declare-fun m!156515 () Bool)

(assert (=> b!106292 m!156515))

(assert (=> b!106292 m!156017))

(declare-fun m!156517 () Bool)

(assert (=> b!106292 m!156517))

(assert (=> b!106292 m!156485))

(declare-fun m!156519 () Bool)

(assert (=> b!106292 m!156519))

(declare-fun m!156521 () Bool)

(assert (=> b!106292 m!156521))

(declare-fun m!156523 () Bool)

(assert (=> b!106292 m!156523))

(declare-fun m!156525 () Bool)

(assert (=> b!106292 m!156525))

(declare-fun m!156527 () Bool)

(assert (=> b!106292 m!156527))

(declare-fun m!156529 () Bool)

(assert (=> b!106292 m!156529))

(declare-fun m!156531 () Bool)

(assert (=> b!106292 m!156531))

(declare-fun m!156533 () Bool)

(assert (=> b!106292 m!156533))

(declare-fun m!156535 () Bool)

(assert (=> b!106292 m!156535))

(declare-fun m!156537 () Bool)

(assert (=> b!106292 m!156537))

(declare-fun m!156539 () Bool)

(assert (=> b!106292 m!156539))

(declare-fun m!156541 () Bool)

(assert (=> b!106292 m!156541))

(declare-fun m!156543 () Bool)

(assert (=> b!106292 m!156543))

(declare-fun m!156545 () Bool)

(assert (=> b!106292 m!156545))

(assert (=> b!106292 m!156521))

(declare-fun m!156547 () Bool)

(assert (=> b!106292 m!156547))

(declare-fun m!156549 () Bool)

(assert (=> b!106292 m!156549))

(declare-fun m!156551 () Bool)

(assert (=> b!106292 m!156551))

(declare-fun m!156553 () Bool)

(assert (=> b!106292 m!156553))

(declare-fun m!156555 () Bool)

(assert (=> b!106291 m!156555))

(assert (=> b!106036 d!33382))

(declare-fun d!33436 () Bool)

(declare-fun res!87564 () Bool)

(declare-fun e!69598 () Bool)

(assert (=> d!33436 (=> (not res!87564) (not e!69598))))

(assert (=> d!33436 (= res!87564 (= (size!2230 (buf!2606 thiss!1305)) (size!2230 (buf!2606 (_2!4618 lt!157071)))))))

(assert (=> d!33436 (= (isPrefixOf!0 thiss!1305 (_2!4618 lt!157071)) e!69598)))

(declare-fun b!106304 () Bool)

(declare-fun res!87563 () Bool)

(assert (=> b!106304 (=> (not res!87563) (not e!69598))))

(assert (=> b!106304 (= res!87563 (bvsle (bitIndex!0 (size!2230 (buf!2606 thiss!1305)) (currentByte!5112 thiss!1305) (currentBit!5107 thiss!1305)) (bitIndex!0 (size!2230 (buf!2606 (_2!4618 lt!157071))) (currentByte!5112 (_2!4618 lt!157071)) (currentBit!5107 (_2!4618 lt!157071)))))))

(declare-fun b!106305 () Bool)

(declare-fun e!69597 () Bool)

(assert (=> b!106305 (= e!69598 e!69597)))

(declare-fun res!87562 () Bool)

(assert (=> b!106305 (=> res!87562 e!69597)))

(assert (=> b!106305 (= res!87562 (= (size!2230 (buf!2606 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!106306 () Bool)

(assert (=> b!106306 (= e!69597 (arrayBitRangesEq!0 (buf!2606 thiss!1305) (buf!2606 (_2!4618 lt!157071)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2230 (buf!2606 thiss!1305)) (currentByte!5112 thiss!1305) (currentBit!5107 thiss!1305))))))

(assert (= (and d!33436 res!87564) b!106304))

(assert (= (and b!106304 res!87563) b!106305))

(assert (= (and b!106305 (not res!87562)) b!106306))

(assert (=> b!106304 m!156003))

(assert (=> b!106304 m!156005))

(assert (=> b!106306 m!156003))

(assert (=> b!106306 m!156003))

(declare-fun m!156557 () Bool)

(assert (=> b!106306 m!156557))

(assert (=> b!106036 d!33436))

(declare-fun b!106324 () Bool)

(declare-fun e!69608 () Bool)

(declare-fun lt!157799 () tuple2!8718)

(declare-fun lt!157798 () tuple2!8722)

(assert (=> b!106324 (= e!69608 (= (bitIndex!0 (size!2230 (buf!2606 (_1!4616 lt!157799))) (currentByte!5112 (_1!4616 lt!157799)) (currentBit!5107 (_1!4616 lt!157799))) (bitIndex!0 (size!2230 (buf!2606 (_2!4618 lt!157798))) (currentByte!5112 (_2!4618 lt!157798)) (currentBit!5107 (_2!4618 lt!157798)))))))

(declare-fun b!106323 () Bool)

(declare-fun e!69607 () Bool)

(assert (=> b!106323 (= e!69607 e!69608)))

(declare-fun res!87580 () Bool)

(assert (=> b!106323 (=> (not res!87580) (not e!69608))))

(assert (=> b!106323 (= res!87580 (and (= (_2!4616 lt!157799) lt!157067) (= (_1!4616 lt!157799) (_2!4618 lt!157798))))))

(assert (=> b!106323 (= lt!157799 (readBitPure!0 (readerFrom!0 (_2!4618 lt!157798) (currentBit!5107 thiss!1305) (currentByte!5112 thiss!1305))))))

(declare-fun b!106322 () Bool)

(declare-fun res!87578 () Bool)

(assert (=> b!106322 (=> (not res!87578) (not e!69607))))

(assert (=> b!106322 (= res!87578 (isPrefixOf!0 thiss!1305 (_2!4618 lt!157798)))))

(declare-fun b!106321 () Bool)

(declare-fun res!87581 () Bool)

(assert (=> b!106321 (=> (not res!87581) (not e!69607))))

(declare-fun lt!157800 () (_ BitVec 64))

(declare-fun lt!157797 () (_ BitVec 64))

(assert (=> b!106321 (= res!87581 (= (bitIndex!0 (size!2230 (buf!2606 (_2!4618 lt!157798))) (currentByte!5112 (_2!4618 lt!157798)) (currentBit!5107 (_2!4618 lt!157798))) (bvadd lt!157800 lt!157797)))))

(assert (=> b!106321 (or (not (= (bvand lt!157800 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!157797 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!157800 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!157800 lt!157797) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!106321 (= lt!157797 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!106321 (= lt!157800 (bitIndex!0 (size!2230 (buf!2606 thiss!1305)) (currentByte!5112 thiss!1305) (currentBit!5107 thiss!1305)))))

(declare-fun d!33438 () Bool)

(assert (=> d!33438 e!69607))

(declare-fun res!87579 () Bool)

(assert (=> d!33438 (=> (not res!87579) (not e!69607))))

(assert (=> d!33438 (= res!87579 (= (size!2230 (buf!2606 thiss!1305)) (size!2230 (buf!2606 (_2!4618 lt!157798)))))))

(declare-fun choose!16 (BitStream!3934 Bool) tuple2!8722)

(assert (=> d!33438 (= lt!157798 (choose!16 thiss!1305 lt!157067))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!33438 (validate_offset_bit!0 ((_ sign_extend 32) (size!2230 (buf!2606 thiss!1305))) ((_ sign_extend 32) (currentByte!5112 thiss!1305)) ((_ sign_extend 32) (currentBit!5107 thiss!1305)))))

(assert (=> d!33438 (= (appendBit!0 thiss!1305 lt!157067) lt!157798)))

(assert (= (and d!33438 res!87579) b!106321))

(assert (= (and b!106321 res!87581) b!106322))

(assert (= (and b!106322 res!87578) b!106323))

(assert (= (and b!106323 res!87580) b!106324))

(declare-fun m!156583 () Bool)

(assert (=> b!106324 m!156583))

(declare-fun m!156585 () Bool)

(assert (=> b!106324 m!156585))

(assert (=> b!106321 m!156585))

(assert (=> b!106321 m!156003))

(declare-fun m!156587 () Bool)

(assert (=> d!33438 m!156587))

(declare-fun m!156589 () Bool)

(assert (=> d!33438 m!156589))

(declare-fun m!156591 () Bool)

(assert (=> b!106323 m!156591))

(assert (=> b!106323 m!156591))

(declare-fun m!156593 () Bool)

(assert (=> b!106323 m!156593))

(declare-fun m!156595 () Bool)

(assert (=> b!106322 m!156595))

(assert (=> b!106036 d!33438))

(declare-fun b!106325 () Bool)

(declare-fun e!69610 () Unit!6498)

(declare-fun Unit!6517 () Unit!6498)

(assert (=> b!106325 (= e!69610 Unit!6517)))

(declare-fun lt!157801 () (_ BitVec 64))

(declare-fun lt!157818 () tuple2!8720)

(declare-fun e!69609 () Bool)

(declare-fun b!106326 () Bool)

(declare-fun lt!157819 () (_ BitVec 64))

(assert (=> b!106326 (= e!69609 (= (_1!4617 lt!157818) (withMovedBitIndex!0 (_2!4617 lt!157818) (bvsub lt!157819 lt!157801))))))

(assert (=> b!106326 (or (= (bvand lt!157819 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!157801 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!157819 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!157819 lt!157801) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!106326 (= lt!157801 (bitIndex!0 (size!2230 (buf!2606 (_2!4618 lt!157071))) (currentByte!5112 (_2!4618 lt!157071)) (currentBit!5107 (_2!4618 lt!157071))))))

(assert (=> b!106326 (= lt!157819 (bitIndex!0 (size!2230 (buf!2606 (_2!4618 lt!157059))) (currentByte!5112 (_2!4618 lt!157059)) (currentBit!5107 (_2!4618 lt!157059))))))

(declare-fun b!106327 () Bool)

(declare-fun lt!157804 () Unit!6498)

(assert (=> b!106327 (= e!69610 lt!157804)))

(declare-fun lt!157809 () (_ BitVec 64))

(assert (=> b!106327 (= lt!157809 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!157816 () (_ BitVec 64))

(assert (=> b!106327 (= lt!157816 (bitIndex!0 (size!2230 (buf!2606 (_2!4618 lt!157059))) (currentByte!5112 (_2!4618 lt!157059)) (currentBit!5107 (_2!4618 lt!157059))))))

(assert (=> b!106327 (= lt!157804 (arrayBitRangesEqSymmetric!0 (buf!2606 (_2!4618 lt!157059)) (buf!2606 (_2!4618 lt!157071)) lt!157809 lt!157816))))

(assert (=> b!106327 (arrayBitRangesEq!0 (buf!2606 (_2!4618 lt!157071)) (buf!2606 (_2!4618 lt!157059)) lt!157809 lt!157816)))

(declare-fun b!106328 () Bool)

(declare-fun res!87583 () Bool)

(assert (=> b!106328 (=> (not res!87583) (not e!69609))))

(assert (=> b!106328 (= res!87583 (isPrefixOf!0 (_1!4617 lt!157818) (_2!4618 lt!157059)))))

(declare-fun d!33454 () Bool)

(assert (=> d!33454 e!69609))

(declare-fun res!87582 () Bool)

(assert (=> d!33454 (=> (not res!87582) (not e!69609))))

(assert (=> d!33454 (= res!87582 (isPrefixOf!0 (_1!4617 lt!157818) (_2!4617 lt!157818)))))

(declare-fun lt!157820 () BitStream!3934)

(assert (=> d!33454 (= lt!157818 (tuple2!8721 lt!157820 (_2!4618 lt!157071)))))

(declare-fun lt!157812 () Unit!6498)

(declare-fun lt!157815 () Unit!6498)

(assert (=> d!33454 (= lt!157812 lt!157815)))

(assert (=> d!33454 (isPrefixOf!0 lt!157820 (_2!4618 lt!157071))))

(assert (=> d!33454 (= lt!157815 (lemmaIsPrefixTransitive!0 lt!157820 (_2!4618 lt!157071) (_2!4618 lt!157071)))))

(declare-fun lt!157810 () Unit!6498)

(declare-fun lt!157805 () Unit!6498)

(assert (=> d!33454 (= lt!157810 lt!157805)))

(assert (=> d!33454 (isPrefixOf!0 lt!157820 (_2!4618 lt!157071))))

(assert (=> d!33454 (= lt!157805 (lemmaIsPrefixTransitive!0 lt!157820 (_2!4618 lt!157059) (_2!4618 lt!157071)))))

(declare-fun lt!157811 () Unit!6498)

(assert (=> d!33454 (= lt!157811 e!69610)))

(declare-fun c!6559 () Bool)

(assert (=> d!33454 (= c!6559 (not (= (size!2230 (buf!2606 (_2!4618 lt!157059))) #b00000000000000000000000000000000)))))

(declare-fun lt!157807 () Unit!6498)

(declare-fun lt!157803 () Unit!6498)

(assert (=> d!33454 (= lt!157807 lt!157803)))

(assert (=> d!33454 (isPrefixOf!0 (_2!4618 lt!157071) (_2!4618 lt!157071))))

(assert (=> d!33454 (= lt!157803 (lemmaIsPrefixRefl!0 (_2!4618 lt!157071)))))

(declare-fun lt!157813 () Unit!6498)

(declare-fun lt!157814 () Unit!6498)

(assert (=> d!33454 (= lt!157813 lt!157814)))

(assert (=> d!33454 (= lt!157814 (lemmaIsPrefixRefl!0 (_2!4618 lt!157071)))))

(declare-fun lt!157808 () Unit!6498)

(declare-fun lt!157806 () Unit!6498)

(assert (=> d!33454 (= lt!157808 lt!157806)))

(assert (=> d!33454 (isPrefixOf!0 lt!157820 lt!157820)))

(assert (=> d!33454 (= lt!157806 (lemmaIsPrefixRefl!0 lt!157820))))

(declare-fun lt!157802 () Unit!6498)

(declare-fun lt!157817 () Unit!6498)

(assert (=> d!33454 (= lt!157802 lt!157817)))

(assert (=> d!33454 (isPrefixOf!0 (_2!4618 lt!157059) (_2!4618 lt!157059))))

(assert (=> d!33454 (= lt!157817 (lemmaIsPrefixRefl!0 (_2!4618 lt!157059)))))

(assert (=> d!33454 (= lt!157820 (BitStream!3935 (buf!2606 (_2!4618 lt!157071)) (currentByte!5112 (_2!4618 lt!157059)) (currentBit!5107 (_2!4618 lt!157059))))))

(assert (=> d!33454 (isPrefixOf!0 (_2!4618 lt!157059) (_2!4618 lt!157071))))

(assert (=> d!33454 (= (reader!0 (_2!4618 lt!157059) (_2!4618 lt!157071)) lt!157818)))

(declare-fun b!106329 () Bool)

(declare-fun res!87584 () Bool)

(assert (=> b!106329 (=> (not res!87584) (not e!69609))))

(assert (=> b!106329 (= res!87584 (isPrefixOf!0 (_2!4617 lt!157818) (_2!4618 lt!157071)))))

(assert (= (and d!33454 c!6559) b!106327))

(assert (= (and d!33454 (not c!6559)) b!106325))

(assert (= (and d!33454 res!87582) b!106328))

(assert (= (and b!106328 res!87583) b!106329))

(assert (= (and b!106329 res!87584) b!106326))

(declare-fun m!156597 () Bool)

(assert (=> d!33454 m!156597))

(declare-fun m!156599 () Bool)

(assert (=> d!33454 m!156599))

(declare-fun m!156601 () Bool)

(assert (=> d!33454 m!156601))

(declare-fun m!156603 () Bool)

(assert (=> d!33454 m!156603))

(declare-fun m!156605 () Bool)

(assert (=> d!33454 m!156605))

(declare-fun m!156607 () Bool)

(assert (=> d!33454 m!156607))

(declare-fun m!156609 () Bool)

(assert (=> d!33454 m!156609))

(declare-fun m!156611 () Bool)

(assert (=> d!33454 m!156611))

(assert (=> d!33454 m!156297))

(declare-fun m!156613 () Bool)

(assert (=> d!33454 m!156613))

(assert (=> d!33454 m!156299))

(declare-fun m!156615 () Bool)

(assert (=> b!106329 m!156615))

(declare-fun m!156617 () Bool)

(assert (=> b!106326 m!156617))

(assert (=> b!106326 m!156005))

(assert (=> b!106326 m!156017))

(assert (=> b!106327 m!156017))

(declare-fun m!156619 () Bool)

(assert (=> b!106327 m!156619))

(declare-fun m!156621 () Bool)

(assert (=> b!106327 m!156621))

(declare-fun m!156623 () Bool)

(assert (=> b!106328 m!156623))

(assert (=> b!106036 d!33454))

(declare-fun d!33456 () Bool)

(declare-fun lt!157821 () tuple2!8742)

(assert (=> d!33456 (= lt!157821 (readBit!0 (BitStream!3935 (buf!2606 (_2!4618 lt!157071)) (currentByte!5112 thiss!1305) (currentBit!5107 thiss!1305))))))

(assert (=> d!33456 (= (readBitPure!0 (BitStream!3935 (buf!2606 (_2!4618 lt!157071)) (currentByte!5112 thiss!1305) (currentBit!5107 thiss!1305))) (tuple2!8719 (_2!4628 lt!157821) (_1!4628 lt!157821)))))

(declare-fun bs!8170 () Bool)

(assert (= bs!8170 d!33456))

(declare-fun m!156625 () Bool)

(assert (=> bs!8170 m!156625))

(assert (=> b!106036 d!33456))

(declare-fun d!33458 () Bool)

(declare-fun e!69611 () Bool)

(assert (=> d!33458 e!69611))

(declare-fun res!87586 () Bool)

(assert (=> d!33458 (=> (not res!87586) (not e!69611))))

(declare-fun lt!157826 () (_ BitVec 64))

(declare-fun lt!157825 () (_ BitVec 64))

(declare-fun lt!157823 () (_ BitVec 64))

(assert (=> d!33458 (= res!87586 (= lt!157826 (bvsub lt!157825 lt!157823)))))

(assert (=> d!33458 (or (= (bvand lt!157825 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!157823 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!157825 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!157825 lt!157823) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!33458 (= lt!157823 (remainingBits!0 ((_ sign_extend 32) (size!2230 (buf!2606 (_1!4616 lt!157056)))) ((_ sign_extend 32) (currentByte!5112 (_1!4616 lt!157056))) ((_ sign_extend 32) (currentBit!5107 (_1!4616 lt!157056)))))))

(declare-fun lt!157824 () (_ BitVec 64))

(declare-fun lt!157822 () (_ BitVec 64))

(assert (=> d!33458 (= lt!157825 (bvmul lt!157824 lt!157822))))

(assert (=> d!33458 (or (= lt!157824 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!157822 (bvsdiv (bvmul lt!157824 lt!157822) lt!157824)))))

(assert (=> d!33458 (= lt!157822 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!33458 (= lt!157824 ((_ sign_extend 32) (size!2230 (buf!2606 (_1!4616 lt!157056)))))))

(assert (=> d!33458 (= lt!157826 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5112 (_1!4616 lt!157056))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5107 (_1!4616 lt!157056)))))))

(assert (=> d!33458 (invariant!0 (currentBit!5107 (_1!4616 lt!157056)) (currentByte!5112 (_1!4616 lt!157056)) (size!2230 (buf!2606 (_1!4616 lt!157056))))))

(assert (=> d!33458 (= (bitIndex!0 (size!2230 (buf!2606 (_1!4616 lt!157056))) (currentByte!5112 (_1!4616 lt!157056)) (currentBit!5107 (_1!4616 lt!157056))) lt!157826)))

(declare-fun b!106330 () Bool)

(declare-fun res!87585 () Bool)

(assert (=> b!106330 (=> (not res!87585) (not e!69611))))

(assert (=> b!106330 (= res!87585 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!157826))))

(declare-fun b!106331 () Bool)

(declare-fun lt!157827 () (_ BitVec 64))

(assert (=> b!106331 (= e!69611 (bvsle lt!157826 (bvmul lt!157827 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!106331 (or (= lt!157827 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!157827 #b0000000000000000000000000000000000000000000000000000000000001000) lt!157827)))))

(assert (=> b!106331 (= lt!157827 ((_ sign_extend 32) (size!2230 (buf!2606 (_1!4616 lt!157056)))))))

(assert (= (and d!33458 res!87586) b!106330))

(assert (= (and b!106330 res!87585) b!106331))

(declare-fun m!156627 () Bool)

(assert (=> d!33458 m!156627))

(declare-fun m!156629 () Bool)

(assert (=> d!33458 m!156629))

(assert (=> b!106036 d!33458))

(declare-fun d!33460 () Bool)

(assert (=> d!33460 (validate_offset_bits!1 ((_ sign_extend 32) (size!2230 (buf!2606 (_2!4618 lt!157071)))) ((_ sign_extend 32) (currentByte!5112 thiss!1305)) ((_ sign_extend 32) (currentBit!5107 thiss!1305)) lt!157055)))

(declare-fun lt!157828 () Unit!6498)

(assert (=> d!33460 (= lt!157828 (choose!9 thiss!1305 (buf!2606 (_2!4618 lt!157071)) lt!157055 (BitStream!3935 (buf!2606 (_2!4618 lt!157071)) (currentByte!5112 thiss!1305) (currentBit!5107 thiss!1305))))))

(assert (=> d!33460 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2606 (_2!4618 lt!157071)) lt!157055) lt!157828)))

(declare-fun bs!8171 () Bool)

(assert (= bs!8171 d!33460))

(assert (=> bs!8171 m!156033))

(declare-fun m!156631 () Bool)

(assert (=> bs!8171 m!156631))

(assert (=> b!106036 d!33460))

(declare-fun d!33462 () Bool)

(assert (=> d!33462 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2230 (buf!2606 (_2!4618 lt!157071)))) ((_ sign_extend 32) (currentByte!5112 thiss!1305)) ((_ sign_extend 32) (currentBit!5107 thiss!1305)) lt!157055) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2230 (buf!2606 (_2!4618 lt!157071)))) ((_ sign_extend 32) (currentByte!5112 thiss!1305)) ((_ sign_extend 32) (currentBit!5107 thiss!1305))) lt!157055))))

(declare-fun bs!8172 () Bool)

(assert (= bs!8172 d!33462))

(declare-fun m!156633 () Bool)

(assert (=> bs!8172 m!156633))

(assert (=> b!106036 d!33462))

(declare-fun lt!157829 () tuple2!8746)

(declare-fun d!33464 () Bool)

(assert (=> d!33464 (= lt!157829 (readNLeastSignificantBitsLoop!0 (_1!4617 lt!157052) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!157060))))

(assert (=> d!33464 (= (readNLeastSignificantBitsLoopPure!0 (_1!4617 lt!157052) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!157060) (tuple2!8725 (_2!4630 lt!157829) (_1!4630 lt!157829)))))

(declare-fun bs!8173 () Bool)

(assert (= bs!8173 d!33464))

(declare-fun m!156635 () Bool)

(assert (=> bs!8173 m!156635))

(assert (=> b!106036 d!33464))

(declare-fun d!33466 () Bool)

(declare-fun lt!157830 () tuple2!8742)

(assert (=> d!33466 (= lt!157830 (readBit!0 lt!157054))))

(assert (=> d!33466 (= (readBitPure!0 lt!157054) (tuple2!8719 (_2!4628 lt!157830) (_1!4628 lt!157830)))))

(declare-fun bs!8174 () Bool)

(assert (= bs!8174 d!33466))

(declare-fun m!156637 () Bool)

(assert (=> bs!8174 m!156637))

(assert (=> b!106036 d!33466))

(declare-fun d!33468 () Bool)

(declare-fun e!69612 () Bool)

(assert (=> d!33468 e!69612))

(declare-fun res!87588 () Bool)

(assert (=> d!33468 (=> (not res!87588) (not e!69612))))

(declare-fun lt!157832 () (_ BitVec 64))

(declare-fun lt!157834 () (_ BitVec 64))

(declare-fun lt!157835 () (_ BitVec 64))

(assert (=> d!33468 (= res!87588 (= lt!157835 (bvsub lt!157834 lt!157832)))))

(assert (=> d!33468 (or (= (bvand lt!157834 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!157832 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!157834 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!157834 lt!157832) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!33468 (= lt!157832 (remainingBits!0 ((_ sign_extend 32) (size!2230 (buf!2606 (_2!4618 lt!157059)))) ((_ sign_extend 32) (currentByte!5112 (_2!4618 lt!157059))) ((_ sign_extend 32) (currentBit!5107 (_2!4618 lt!157059)))))))

(declare-fun lt!157833 () (_ BitVec 64))

(declare-fun lt!157831 () (_ BitVec 64))

(assert (=> d!33468 (= lt!157834 (bvmul lt!157833 lt!157831))))

(assert (=> d!33468 (or (= lt!157833 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!157831 (bvsdiv (bvmul lt!157833 lt!157831) lt!157833)))))

(assert (=> d!33468 (= lt!157831 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!33468 (= lt!157833 ((_ sign_extend 32) (size!2230 (buf!2606 (_2!4618 lt!157059)))))))

(assert (=> d!33468 (= lt!157835 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5112 (_2!4618 lt!157059))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5107 (_2!4618 lt!157059)))))))

(assert (=> d!33468 (invariant!0 (currentBit!5107 (_2!4618 lt!157059)) (currentByte!5112 (_2!4618 lt!157059)) (size!2230 (buf!2606 (_2!4618 lt!157059))))))

(assert (=> d!33468 (= (bitIndex!0 (size!2230 (buf!2606 (_2!4618 lt!157059))) (currentByte!5112 (_2!4618 lt!157059)) (currentBit!5107 (_2!4618 lt!157059))) lt!157835)))

(declare-fun b!106332 () Bool)

(declare-fun res!87587 () Bool)

(assert (=> b!106332 (=> (not res!87587) (not e!69612))))

(assert (=> b!106332 (= res!87587 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!157835))))

(declare-fun b!106333 () Bool)

(declare-fun lt!157836 () (_ BitVec 64))

(assert (=> b!106333 (= e!69612 (bvsle lt!157835 (bvmul lt!157836 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!106333 (or (= lt!157836 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!157836 #b0000000000000000000000000000000000000000000000000000000000001000) lt!157836)))))

(assert (=> b!106333 (= lt!157836 ((_ sign_extend 32) (size!2230 (buf!2606 (_2!4618 lt!157059)))))))

(assert (= (and d!33468 res!87588) b!106332))

(assert (= (and b!106332 res!87587) b!106333))

(declare-fun m!156639 () Bool)

(assert (=> d!33468 m!156639))

(assert (=> d!33468 m!156221))

(assert (=> b!106026 d!33468))

(assert (=> b!106026 d!33342))

(declare-fun d!33470 () Bool)

(assert (=> d!33470 (= (array_inv!2032 (buf!2606 thiss!1305)) (bvsge (size!2230 (buf!2606 thiss!1305)) #b00000000000000000000000000000000))))

(assert (=> b!106037 d!33470))

(declare-fun d!33472 () Bool)

(assert (=> d!33472 (= (invariant!0 (currentBit!5107 thiss!1305) (currentByte!5112 thiss!1305) (size!2230 (buf!2606 (_2!4618 lt!157071)))) (and (bvsge (currentBit!5107 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5107 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5112 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5112 thiss!1305) (size!2230 (buf!2606 (_2!4618 lt!157071)))) (and (= (currentBit!5107 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5112 thiss!1305) (size!2230 (buf!2606 (_2!4618 lt!157071))))))))))

(assert (=> b!106027 d!33472))

(declare-fun d!33474 () Bool)

(declare-fun lt!157854 () tuple2!8724)

(declare-fun lt!157852 () tuple2!8724)

(assert (=> d!33474 (and (= (_2!4619 lt!157854) (_2!4619 lt!157852)) (= (_1!4619 lt!157854) (_1!4619 lt!157852)))))

(declare-fun lt!157851 () Bool)

(declare-fun lt!157853 () Unit!6498)

(declare-fun lt!157850 () (_ BitVec 64))

(declare-fun lt!157849 () BitStream!3934)

(declare-fun choose!45 (BitStream!3934 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!8724 tuple2!8724 BitStream!3934 (_ BitVec 64) Bool BitStream!3934 (_ BitVec 64) tuple2!8724 tuple2!8724 BitStream!3934 (_ BitVec 64)) Unit!6498)

(assert (=> d!33474 (= lt!157853 (choose!45 (_1!4617 lt!157064) nBits!396 i!615 lt!157057 lt!157854 (tuple2!8725 (_1!4619 lt!157854) (_2!4619 lt!157854)) (_1!4619 lt!157854) (_2!4619 lt!157854) lt!157851 lt!157849 lt!157850 lt!157852 (tuple2!8725 (_1!4619 lt!157852) (_2!4619 lt!157852)) (_1!4619 lt!157852) (_2!4619 lt!157852)))))

(assert (=> d!33474 (= lt!157852 (readNLeastSignificantBitsLoopPure!0 lt!157849 nBits!396 (bvadd i!615 #b00000000000000000000000000000001) lt!157850))))

(assert (=> d!33474 (= lt!157850 (bvor lt!157057 (ite lt!157851 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!33474 (= lt!157849 (withMovedBitIndex!0 (_1!4617 lt!157064) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!33474 (= lt!157851 (_2!4616 (readBitPure!0 (_1!4617 lt!157064))))))

(assert (=> d!33474 (= lt!157854 (readNLeastSignificantBitsLoopPure!0 (_1!4617 lt!157064) nBits!396 i!615 lt!157057))))

(assert (=> d!33474 (= (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4617 lt!157064) nBits!396 i!615 lt!157057) lt!157853)))

(declare-fun bs!8176 () Bool)

(assert (= bs!8176 d!33474))

(assert (=> bs!8176 m!156021))

(assert (=> bs!8176 m!156047))

(declare-fun m!156641 () Bool)

(assert (=> bs!8176 m!156641))

(assert (=> bs!8176 m!156039))

(declare-fun m!156643 () Bool)

(assert (=> bs!8176 m!156643))

(assert (=> b!106028 d!33474))

(declare-fun d!33476 () Bool)

(declare-fun e!69613 () Bool)

(assert (=> d!33476 e!69613))

(declare-fun res!87589 () Bool)

(assert (=> d!33476 (=> (not res!87589) (not e!69613))))

(declare-fun lt!157856 () (_ BitVec 64))

(declare-fun lt!157855 () BitStream!3934)

(assert (=> d!33476 (= res!87589 (= (bvadd lt!157856 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!2230 (buf!2606 lt!157855)) (currentByte!5112 lt!157855) (currentBit!5107 lt!157855))))))

(assert (=> d!33476 (or (not (= (bvand lt!157856 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!157856 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!157856 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!33476 (= lt!157856 (bitIndex!0 (size!2230 (buf!2606 (_1!4617 lt!157064))) (currentByte!5112 (_1!4617 lt!157064)) (currentBit!5107 (_1!4617 lt!157064))))))

(assert (=> d!33476 (= lt!157855 (_2!4618 (moveBitIndex!0 (_1!4617 lt!157064) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!33476 (moveBitIndexPrecond!0 (_1!4617 lt!157064) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!33476 (= (withMovedBitIndex!0 (_1!4617 lt!157064) #b0000000000000000000000000000000000000000000000000000000000000001) lt!157855)))

(declare-fun b!106334 () Bool)

(assert (=> b!106334 (= e!69613 (= (size!2230 (buf!2606 (_1!4617 lt!157064))) (size!2230 (buf!2606 lt!157855))))))

(assert (= (and d!33476 res!87589) b!106334))

(declare-fun m!156645 () Bool)

(assert (=> d!33476 m!156645))

(declare-fun m!156647 () Bool)

(assert (=> d!33476 m!156647))

(declare-fun m!156649 () Bool)

(assert (=> d!33476 m!156649))

(declare-fun m!156651 () Bool)

(assert (=> d!33476 m!156651))

(assert (=> b!106028 d!33476))

(declare-fun d!33478 () Bool)

(assert (=> d!33478 (= (invariant!0 (currentBit!5107 (_2!4618 lt!157071)) (currentByte!5112 (_2!4618 lt!157071)) (size!2230 (buf!2606 (_2!4618 lt!157071)))) (and (bvsge (currentBit!5107 (_2!4618 lt!157071)) #b00000000000000000000000000000000) (bvslt (currentBit!5107 (_2!4618 lt!157071)) #b00000000000000000000000000001000) (bvsge (currentByte!5112 (_2!4618 lt!157071)) #b00000000000000000000000000000000) (or (bvslt (currentByte!5112 (_2!4618 lt!157071)) (size!2230 (buf!2606 (_2!4618 lt!157071)))) (and (= (currentBit!5107 (_2!4618 lt!157071)) #b00000000000000000000000000000000) (= (currentByte!5112 (_2!4618 lt!157071)) (size!2230 (buf!2606 (_2!4618 lt!157071))))))))))

(assert (=> b!106028 d!33478))

(declare-fun d!33480 () Bool)

(declare-fun lt!157857 () tuple2!8746)

(assert (=> d!33480 (= lt!157857 (readNLeastSignificantBitsLoop!0 (withMovedBitIndex!0 (_1!4617 lt!157064) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!157060))))

(assert (=> d!33480 (= (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4617 lt!157064) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!157060) (tuple2!8725 (_2!4630 lt!157857) (_1!4630 lt!157857)))))

(declare-fun bs!8177 () Bool)

(assert (= bs!8177 d!33480))

(assert (=> bs!8177 m!156021))

(declare-fun m!156653 () Bool)

(assert (=> bs!8177 m!156653))

(assert (=> b!106028 d!33480))

(assert (=> b!106028 d!33468))

(declare-fun d!33482 () Bool)

(assert (=> d!33482 (= (onesLSBLong!0 nBits!396) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!396))))))

(assert (=> b!106029 d!33482))

(push 1)

(assert (not b!106326))

(assert (not d!33378))

(assert (not d!33480))

(assert (not d!33458))

(assert (not d!33342))

(assert (not d!33456))

(assert (not b!106290))

(assert (not d!33468))

(assert (not d!33358))

(assert (not b!106304))

(assert (not d!33466))

(assert (not b!106139))

(assert (not b!106137))

(assert (not d!33464))

(assert (not b!106297))

(assert (not b!106288))

(assert (not b!106181))

(assert (not d!33454))

(assert (not b!106124))

(assert (not d!33340))

(assert (not b!106292))

(assert (not bm!1335))

(assert (not d!33350))

(assert (not d!33376))

(assert (not b!106327))

(assert (not d!33462))

(assert (not d!33476))

(assert (not b!106322))

(assert (not b!106328))

(assert (not d!33338))

(assert (not d!33474))

(assert (not d!33352))

(assert (not b!106180))

(assert (not b!106306))

(assert (not d!33322))

(assert (not b!106182))

(assert (not b!106298))

(assert (not b!106293))

(assert (not d!33344))

(assert (not b!106291))

(assert (not b!106286))

(assert (not b!106179))

(assert (not d!33330))

(assert (not d!33326))

(assert (not b!106289))

(assert (not d!33348))

(assert (not d!33380))

(assert (not b!106294))

(assert (not b!106329))

(assert (not b!106323))

(assert (not b!106321))

(assert (not d!33324))

(assert (not d!33460))

(assert (not d!33374))

(assert (not d!33438))

(assert (not b!106324))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

