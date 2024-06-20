; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40340 () Bool)

(assert start!40340)

(declare-fun b!185101 () Bool)

(declare-fun res!154044 () Bool)

(declare-fun e!128182 () Bool)

(assert (=> b!185101 (=> (not res!154044) (not e!128182))))

(declare-datatypes ((array!9797 0))(
  ( (array!9798 (arr!5251 (Array (_ BitVec 32) (_ BitVec 8))) (size!4321 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7750 0))(
  ( (BitStream!7751 (buf!4779 array!9797) (currentByte!9019 (_ BitVec 32)) (currentBit!9014 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7750)

(declare-datatypes ((Unit!13256 0))(
  ( (Unit!13257) )
))
(declare-datatypes ((tuple2!16016 0))(
  ( (tuple2!16017 (_1!8653 Unit!13256) (_2!8653 BitStream!7750)) )
))
(declare-fun lt!285168 () tuple2!16016)

(declare-fun isPrefixOf!0 (BitStream!7750 BitStream!7750) Bool)

(assert (=> b!185101 (= res!154044 (isPrefixOf!0 thiss!1204 (_2!8653 lt!285168)))))

(declare-fun b!185102 () Bool)

(declare-fun e!128178 () Bool)

(declare-fun e!128181 () Bool)

(assert (=> b!185102 (= e!128178 e!128181)))

(declare-fun res!154045 () Bool)

(assert (=> b!185102 (=> res!154045 e!128181)))

(declare-fun i!590 () (_ BitVec 32))

(declare-datatypes ((tuple2!16018 0))(
  ( (tuple2!16019 (_1!8654 BitStream!7750) (_2!8654 BitStream!7750)) )
))
(declare-fun lt!285151 () tuple2!16018)

(declare-fun lt!285172 () (_ BitVec 64))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-datatypes ((tuple2!16020 0))(
  ( (tuple2!16021 (_1!8655 BitStream!7750) (_2!8655 (_ BitVec 64))) )
))
(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7750 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!16020)

(assert (=> b!185102 (= res!154045 (not (= (_1!8655 (readNBitsLSBFirstsLoopPure!0 (_1!8654 lt!285151) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!285172)) (_2!8654 lt!285151))))))

(declare-fun lt!285163 () tuple2!16016)

(declare-fun lt!285157 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!185102 (validate_offset_bits!1 ((_ sign_extend 32) (size!4321 (buf!4779 (_2!8653 lt!285163)))) ((_ sign_extend 32) (currentByte!9019 (_2!8653 lt!285168))) ((_ sign_extend 32) (currentBit!9014 (_2!8653 lt!285168))) lt!285157)))

(declare-fun lt!285169 () Unit!13256)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7750 array!9797 (_ BitVec 64)) Unit!13256)

(assert (=> b!185102 (= lt!285169 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8653 lt!285168) (buf!4779 (_2!8653 lt!285163)) lt!285157))))

(assert (=> b!185102 (= lt!285157 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!285166 () (_ BitVec 64))

(declare-datatypes ((tuple2!16022 0))(
  ( (tuple2!16023 (_1!8656 BitStream!7750) (_2!8656 Bool)) )
))
(declare-fun lt!285167 () tuple2!16022)

(declare-fun lt!285162 () (_ BitVec 64))

(assert (=> b!185102 (= lt!285172 (bvor lt!285166 (ite (_2!8656 lt!285167) lt!285162 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!285148 () tuple2!16018)

(declare-fun lt!285165 () tuple2!16020)

(assert (=> b!185102 (= lt!285165 (readNBitsLSBFirstsLoopPure!0 (_1!8654 lt!285148) nBits!348 i!590 lt!285166))))

(declare-fun lt!285164 () (_ BitVec 64))

(assert (=> b!185102 (validate_offset_bits!1 ((_ sign_extend 32) (size!4321 (buf!4779 (_2!8653 lt!285163)))) ((_ sign_extend 32) (currentByte!9019 thiss!1204)) ((_ sign_extend 32) (currentBit!9014 thiss!1204)) lt!285164)))

(declare-fun lt!285170 () Unit!13256)

(assert (=> b!185102 (= lt!285170 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4779 (_2!8653 lt!285163)) lt!285164))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!185102 (= lt!285166 (bvand v!189 (onesLSBLong!0 i!590)))))

(declare-fun lt!285155 () Bool)

(assert (=> b!185102 (= (_2!8656 lt!285167) lt!285155)))

(declare-fun readBitPure!0 (BitStream!7750) tuple2!16022)

(assert (=> b!185102 (= lt!285167 (readBitPure!0 (_1!8654 lt!285148)))))

(declare-fun reader!0 (BitStream!7750 BitStream!7750) tuple2!16018)

(assert (=> b!185102 (= lt!285151 (reader!0 (_2!8653 lt!285168) (_2!8653 lt!285163)))))

(assert (=> b!185102 (= lt!285148 (reader!0 thiss!1204 (_2!8653 lt!285163)))))

(declare-fun e!128174 () Bool)

(assert (=> b!185102 e!128174))

(declare-fun res!154033 () Bool)

(assert (=> b!185102 (=> (not res!154033) (not e!128174))))

(declare-fun lt!285156 () tuple2!16022)

(declare-fun lt!285153 () tuple2!16022)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!185102 (= res!154033 (= (bitIndex!0 (size!4321 (buf!4779 (_1!8656 lt!285156))) (currentByte!9019 (_1!8656 lt!285156)) (currentBit!9014 (_1!8656 lt!285156))) (bitIndex!0 (size!4321 (buf!4779 (_1!8656 lt!285153))) (currentByte!9019 (_1!8656 lt!285153)) (currentBit!9014 (_1!8656 lt!285153)))))))

(declare-fun lt!285149 () Unit!13256)

(declare-fun lt!285160 () BitStream!7750)

(declare-fun readBitPrefixLemma!0 (BitStream!7750 BitStream!7750) Unit!13256)

(assert (=> b!185102 (= lt!285149 (readBitPrefixLemma!0 lt!285160 (_2!8653 lt!285163)))))

(assert (=> b!185102 (= lt!285153 (readBitPure!0 (BitStream!7751 (buf!4779 (_2!8653 lt!285163)) (currentByte!9019 thiss!1204) (currentBit!9014 thiss!1204))))))

(assert (=> b!185102 (= lt!285156 (readBitPure!0 lt!285160))))

(declare-fun e!128172 () Bool)

(assert (=> b!185102 e!128172))

(declare-fun res!154043 () Bool)

(assert (=> b!185102 (=> (not res!154043) (not e!128172))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!185102 (= res!154043 (invariant!0 (currentBit!9014 thiss!1204) (currentByte!9019 thiss!1204) (size!4321 (buf!4779 (_2!8653 lt!285168)))))))

(assert (=> b!185102 (= lt!285160 (BitStream!7751 (buf!4779 (_2!8653 lt!285168)) (currentByte!9019 thiss!1204) (currentBit!9014 thiss!1204)))))

(declare-fun b!185103 () Bool)

(declare-fun res!154031 () Bool)

(assert (=> b!185103 (=> res!154031 e!128178)))

(assert (=> b!185103 (= res!154031 (not (isPrefixOf!0 (_2!8653 lt!285168) (_2!8653 lt!285163))))))

(declare-fun b!185104 () Bool)

(declare-fun res!154040 () Bool)

(declare-fun e!128170 () Bool)

(assert (=> b!185104 (=> (not res!154040) (not e!128170))))

(assert (=> b!185104 (= res!154040 (not (= i!590 nBits!348)))))

(declare-fun b!185105 () Bool)

(declare-fun e!128173 () Bool)

(assert (=> b!185105 (= e!128170 (not e!128173))))

(declare-fun res!154042 () Bool)

(assert (=> b!185105 (=> res!154042 e!128173)))

(declare-fun lt!285159 () (_ BitVec 64))

(declare-fun lt!285152 () (_ BitVec 64))

(assert (=> b!185105 (= res!154042 (not (= lt!285159 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!285152))))))

(assert (=> b!185105 (= lt!285159 (bitIndex!0 (size!4321 (buf!4779 (_2!8653 lt!285168))) (currentByte!9019 (_2!8653 lt!285168)) (currentBit!9014 (_2!8653 lt!285168))))))

(assert (=> b!185105 (= lt!285152 (bitIndex!0 (size!4321 (buf!4779 thiss!1204)) (currentByte!9019 thiss!1204) (currentBit!9014 thiss!1204)))))

(declare-fun e!128175 () Bool)

(assert (=> b!185105 e!128175))

(declare-fun res!154030 () Bool)

(assert (=> b!185105 (=> (not res!154030) (not e!128175))))

(assert (=> b!185105 (= res!154030 (= (size!4321 (buf!4779 thiss!1204)) (size!4321 (buf!4779 (_2!8653 lt!285168)))))))

(declare-fun appendBit!0 (BitStream!7750 Bool) tuple2!16016)

(assert (=> b!185105 (= lt!285168 (appendBit!0 thiss!1204 lt!285155))))

(assert (=> b!185105 (= lt!285155 (not (= (bvand v!189 lt!285162) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!185105 (= lt!285162 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!185106 () Bool)

(declare-fun e!128180 () Bool)

(assert (=> b!185106 (= e!128180 e!128170)))

(declare-fun res!154038 () Bool)

(assert (=> b!185106 (=> (not res!154038) (not e!128170))))

(assert (=> b!185106 (= res!154038 (validate_offset_bits!1 ((_ sign_extend 32) (size!4321 (buf!4779 thiss!1204))) ((_ sign_extend 32) (currentByte!9019 thiss!1204)) ((_ sign_extend 32) (currentBit!9014 thiss!1204)) lt!285164))))

(assert (=> b!185106 (= lt!285164 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!185107 () Bool)

(assert (=> b!185107 (= e!128174 (= (_2!8656 lt!285156) (_2!8656 lt!285153)))))

(declare-fun b!185108 () Bool)

(assert (=> b!185108 (= e!128181 (invariant!0 (currentBit!9014 (_2!8653 lt!285168)) (currentByte!9019 (_2!8653 lt!285168)) (size!4321 (buf!4779 (_2!8653 lt!285168)))))))

(declare-fun e!128179 () Bool)

(assert (=> b!185108 e!128179))

(declare-fun res!154047 () Bool)

(assert (=> b!185108 (=> (not res!154047) (not e!128179))))

(declare-fun lt!285154 () tuple2!16020)

(assert (=> b!185108 (= res!154047 (and (= (_2!8655 lt!285165) (_2!8655 lt!285154)) (= (_1!8655 lt!285165) (_1!8655 lt!285154))))))

(declare-fun lt!285173 () Unit!13256)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!7750 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!13256)

(assert (=> b!185108 (= lt!285173 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8654 lt!285148) nBits!348 i!590 lt!285166))))

(declare-fun withMovedBitIndex!0 (BitStream!7750 (_ BitVec 64)) BitStream!7750)

(assert (=> b!185108 (= lt!285154 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!8654 lt!285148) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!285172))))

(declare-fun b!185109 () Bool)

(declare-fun res!154032 () Bool)

(assert (=> b!185109 (=> res!154032 e!128178)))

(assert (=> b!185109 (= res!154032 (not (invariant!0 (currentBit!9014 (_2!8653 lt!285163)) (currentByte!9019 (_2!8653 lt!285163)) (size!4321 (buf!4779 (_2!8653 lt!285163))))))))

(declare-fun b!185100 () Bool)

(assert (=> b!185100 (= e!128173 e!128178)))

(declare-fun res!154037 () Bool)

(assert (=> b!185100 (=> res!154037 e!128178)))

(declare-fun lt!285158 () (_ BitVec 64))

(assert (=> b!185100 (= res!154037 (not (= lt!285158 (bvsub (bvsub (bvadd lt!285159 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!185100 (= lt!285158 (bitIndex!0 (size!4321 (buf!4779 (_2!8653 lt!285163))) (currentByte!9019 (_2!8653 lt!285163)) (currentBit!9014 (_2!8653 lt!285163))))))

(assert (=> b!185100 (isPrefixOf!0 thiss!1204 (_2!8653 lt!285163))))

(declare-fun lt!285150 () Unit!13256)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7750 BitStream!7750 BitStream!7750) Unit!13256)

(assert (=> b!185100 (= lt!285150 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8653 lt!285168) (_2!8653 lt!285163)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7750 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!16016)

(assert (=> b!185100 (= lt!285163 (appendBitsLSBFirstLoopTR!0 (_2!8653 lt!285168) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun res!154036 () Bool)

(assert (=> start!40340 (=> (not res!154036) (not e!128180))))

(assert (=> start!40340 (= res!154036 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!40340 e!128180))

(assert (=> start!40340 true))

(declare-fun e!128171 () Bool)

(declare-fun inv!12 (BitStream!7750) Bool)

(assert (=> start!40340 (and (inv!12 thiss!1204) e!128171)))

(declare-fun b!185110 () Bool)

(assert (=> b!185110 (= e!128179 (= (_1!8654 lt!285148) (withMovedBitIndex!0 (_2!8654 lt!285148) (bvsub lt!285152 lt!285158))))))

(declare-fun b!185111 () Bool)

(assert (=> b!185111 (= e!128175 e!128182)))

(declare-fun res!154039 () Bool)

(assert (=> b!185111 (=> (not res!154039) (not e!128182))))

(declare-fun lt!285147 () (_ BitVec 64))

(declare-fun lt!285171 () (_ BitVec 64))

(assert (=> b!185111 (= res!154039 (= lt!285147 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!285171)))))

(assert (=> b!185111 (= lt!285147 (bitIndex!0 (size!4321 (buf!4779 (_2!8653 lt!285168))) (currentByte!9019 (_2!8653 lt!285168)) (currentBit!9014 (_2!8653 lt!285168))))))

(assert (=> b!185111 (= lt!285171 (bitIndex!0 (size!4321 (buf!4779 thiss!1204)) (currentByte!9019 thiss!1204) (currentBit!9014 thiss!1204)))))

(declare-fun b!185112 () Bool)

(declare-fun array_inv!4062 (array!9797) Bool)

(assert (=> b!185112 (= e!128171 (array_inv!4062 (buf!4779 thiss!1204)))))

(declare-fun b!185113 () Bool)

(declare-fun res!154041 () Bool)

(assert (=> b!185113 (=> res!154041 e!128178)))

(assert (=> b!185113 (= res!154041 (or (not (= (size!4321 (buf!4779 (_2!8653 lt!285163))) (size!4321 (buf!4779 thiss!1204)))) (not (= lt!285158 (bvsub (bvadd lt!285152 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!185114 () Bool)

(declare-fun e!128177 () Bool)

(assert (=> b!185114 (= e!128182 e!128177)))

(declare-fun res!154034 () Bool)

(assert (=> b!185114 (=> (not res!154034) (not e!128177))))

(declare-fun lt!285161 () tuple2!16022)

(assert (=> b!185114 (= res!154034 (and (= (_2!8656 lt!285161) lt!285155) (= (_1!8656 lt!285161) (_2!8653 lt!285168))))))

(declare-fun readerFrom!0 (BitStream!7750 (_ BitVec 32) (_ BitVec 32)) BitStream!7750)

(assert (=> b!185114 (= lt!285161 (readBitPure!0 (readerFrom!0 (_2!8653 lt!285168) (currentBit!9014 thiss!1204) (currentByte!9019 thiss!1204))))))

(declare-fun b!185115 () Bool)

(declare-fun res!154046 () Bool)

(assert (=> b!185115 (=> res!154046 e!128178)))

(assert (=> b!185115 (= res!154046 (not (isPrefixOf!0 thiss!1204 (_2!8653 lt!285168))))))

(declare-fun b!185116 () Bool)

(declare-fun res!154035 () Bool)

(assert (=> b!185116 (=> (not res!154035) (not e!128170))))

(assert (=> b!185116 (= res!154035 (invariant!0 (currentBit!9014 thiss!1204) (currentByte!9019 thiss!1204) (size!4321 (buf!4779 thiss!1204))))))

(declare-fun b!185117 () Bool)

(assert (=> b!185117 (= e!128177 (= (bitIndex!0 (size!4321 (buf!4779 (_1!8656 lt!285161))) (currentByte!9019 (_1!8656 lt!285161)) (currentBit!9014 (_1!8656 lt!285161))) lt!285147))))

(declare-fun b!185118 () Bool)

(assert (=> b!185118 (= e!128172 (invariant!0 (currentBit!9014 thiss!1204) (currentByte!9019 thiss!1204) (size!4321 (buf!4779 (_2!8653 lt!285163)))))))

(assert (= (and start!40340 res!154036) b!185106))

(assert (= (and b!185106 res!154038) b!185116))

(assert (= (and b!185116 res!154035) b!185104))

(assert (= (and b!185104 res!154040) b!185105))

(assert (= (and b!185105 res!154030) b!185111))

(assert (= (and b!185111 res!154039) b!185101))

(assert (= (and b!185101 res!154044) b!185114))

(assert (= (and b!185114 res!154034) b!185117))

(assert (= (and b!185105 (not res!154042)) b!185100))

(assert (= (and b!185100 (not res!154037)) b!185109))

(assert (= (and b!185109 (not res!154032)) b!185113))

(assert (= (and b!185113 (not res!154041)) b!185103))

(assert (= (and b!185103 (not res!154031)) b!185115))

(assert (= (and b!185115 (not res!154046)) b!185102))

(assert (= (and b!185102 res!154043) b!185118))

(assert (= (and b!185102 res!154033) b!185107))

(assert (= (and b!185102 (not res!154045)) b!185108))

(assert (= (and b!185108 res!154047) b!185110))

(assert (= start!40340 b!185112))

(declare-fun m!287665 () Bool)

(assert (=> b!185115 m!287665))

(declare-fun m!287667 () Bool)

(assert (=> b!185112 m!287667))

(declare-fun m!287669 () Bool)

(assert (=> b!185106 m!287669))

(declare-fun m!287671 () Bool)

(assert (=> b!185117 m!287671))

(declare-fun m!287673 () Bool)

(assert (=> b!185102 m!287673))

(declare-fun m!287675 () Bool)

(assert (=> b!185102 m!287675))

(declare-fun m!287677 () Bool)

(assert (=> b!185102 m!287677))

(declare-fun m!287679 () Bool)

(assert (=> b!185102 m!287679))

(declare-fun m!287681 () Bool)

(assert (=> b!185102 m!287681))

(declare-fun m!287683 () Bool)

(assert (=> b!185102 m!287683))

(declare-fun m!287685 () Bool)

(assert (=> b!185102 m!287685))

(declare-fun m!287687 () Bool)

(assert (=> b!185102 m!287687))

(declare-fun m!287689 () Bool)

(assert (=> b!185102 m!287689))

(declare-fun m!287691 () Bool)

(assert (=> b!185102 m!287691))

(declare-fun m!287693 () Bool)

(assert (=> b!185102 m!287693))

(declare-fun m!287695 () Bool)

(assert (=> b!185102 m!287695))

(declare-fun m!287697 () Bool)

(assert (=> b!185102 m!287697))

(declare-fun m!287699 () Bool)

(assert (=> b!185102 m!287699))

(declare-fun m!287701 () Bool)

(assert (=> b!185102 m!287701))

(declare-fun m!287703 () Bool)

(assert (=> b!185102 m!287703))

(declare-fun m!287705 () Bool)

(assert (=> b!185109 m!287705))

(declare-fun m!287707 () Bool)

(assert (=> start!40340 m!287707))

(declare-fun m!287709 () Bool)

(assert (=> b!185118 m!287709))

(declare-fun m!287711 () Bool)

(assert (=> b!185116 m!287711))

(declare-fun m!287713 () Bool)

(assert (=> b!185103 m!287713))

(declare-fun m!287715 () Bool)

(assert (=> b!185114 m!287715))

(assert (=> b!185114 m!287715))

(declare-fun m!287717 () Bool)

(assert (=> b!185114 m!287717))

(declare-fun m!287719 () Bool)

(assert (=> b!185100 m!287719))

(declare-fun m!287721 () Bool)

(assert (=> b!185100 m!287721))

(declare-fun m!287723 () Bool)

(assert (=> b!185100 m!287723))

(declare-fun m!287725 () Bool)

(assert (=> b!185100 m!287725))

(declare-fun m!287727 () Bool)

(assert (=> b!185105 m!287727))

(declare-fun m!287729 () Bool)

(assert (=> b!185105 m!287729))

(declare-fun m!287731 () Bool)

(assert (=> b!185105 m!287731))

(assert (=> b!185111 m!287727))

(assert (=> b!185111 m!287729))

(declare-fun m!287733 () Bool)

(assert (=> b!185108 m!287733))

(declare-fun m!287735 () Bool)

(assert (=> b!185108 m!287735))

(declare-fun m!287737 () Bool)

(assert (=> b!185108 m!287737))

(assert (=> b!185108 m!287737))

(declare-fun m!287739 () Bool)

(assert (=> b!185108 m!287739))

(declare-fun m!287741 () Bool)

(assert (=> b!185110 m!287741))

(assert (=> b!185101 m!287665))

(push 1)

(assert (not b!185108))

(assert (not b!185111))

(assert (not b!185109))

(assert (not b!185103))

(assert (not b!185116))

(assert (not b!185115))

(assert (not b!185112))

(assert (not start!40340))

(assert (not b!185118))

(assert (not b!185102))

(assert (not b!185100))

(assert (not b!185101))

(assert (not b!185114))

(assert (not b!185105))

(assert (not b!185106))

(assert (not b!185110))

(assert (not b!185117))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!63865 () Bool)

(declare-fun e!128263 () Bool)

(assert (=> d!63865 e!128263))

(declare-fun res!154160 () Bool)

(assert (=> d!63865 (=> (not res!154160) (not e!128263))))

(declare-fun lt!285349 () (_ BitVec 64))

(declare-fun lt!285353 () (_ BitVec 64))

(declare-fun lt!285351 () (_ BitVec 64))

(assert (=> d!63865 (= res!154160 (= lt!285349 (bvsub lt!285351 lt!285353)))))

(assert (=> d!63865 (or (= (bvand lt!285351 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!285353 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!285351 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!285351 lt!285353) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!63865 (= lt!285353 (remainingBits!0 ((_ sign_extend 32) (size!4321 (buf!4779 (_1!8656 lt!285161)))) ((_ sign_extend 32) (currentByte!9019 (_1!8656 lt!285161))) ((_ sign_extend 32) (currentBit!9014 (_1!8656 lt!285161)))))))

(declare-fun lt!285348 () (_ BitVec 64))

(declare-fun lt!285350 () (_ BitVec 64))

(assert (=> d!63865 (= lt!285351 (bvmul lt!285348 lt!285350))))

(assert (=> d!63865 (or (= lt!285348 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!285350 (bvsdiv (bvmul lt!285348 lt!285350) lt!285348)))))

(assert (=> d!63865 (= lt!285350 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!63865 (= lt!285348 ((_ sign_extend 32) (size!4321 (buf!4779 (_1!8656 lt!285161)))))))

(assert (=> d!63865 (= lt!285349 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9019 (_1!8656 lt!285161))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9014 (_1!8656 lt!285161)))))))

(assert (=> d!63865 (invariant!0 (currentBit!9014 (_1!8656 lt!285161)) (currentByte!9019 (_1!8656 lt!285161)) (size!4321 (buf!4779 (_1!8656 lt!285161))))))

(assert (=> d!63865 (= (bitIndex!0 (size!4321 (buf!4779 (_1!8656 lt!285161))) (currentByte!9019 (_1!8656 lt!285161)) (currentBit!9014 (_1!8656 lt!285161))) lt!285349)))

(declare-fun b!185237 () Bool)

(declare-fun res!154161 () Bool)

(assert (=> b!185237 (=> (not res!154161) (not e!128263))))

(assert (=> b!185237 (= res!154161 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!285349))))

(declare-fun b!185238 () Bool)

(declare-fun lt!285352 () (_ BitVec 64))

(assert (=> b!185238 (= e!128263 (bvsle lt!285349 (bvmul lt!285352 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!185238 (or (= lt!285352 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!285352 #b0000000000000000000000000000000000000000000000000000000000001000) lt!285352)))))

(assert (=> b!185238 (= lt!285352 ((_ sign_extend 32) (size!4321 (buf!4779 (_1!8656 lt!285161)))))))

(assert (= (and d!63865 res!154160) b!185237))

(assert (= (and b!185237 res!154161) b!185238))

(declare-fun m!287899 () Bool)

(assert (=> d!63865 m!287899))

(declare-fun m!287901 () Bool)

(assert (=> d!63865 m!287901))

(assert (=> b!185117 d!63865))

(declare-fun d!63867 () Bool)

(assert (=> d!63867 (= (invariant!0 (currentBit!9014 thiss!1204) (currentByte!9019 thiss!1204) (size!4321 (buf!4779 (_2!8653 lt!285163)))) (and (bvsge (currentBit!9014 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9014 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9019 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9019 thiss!1204) (size!4321 (buf!4779 (_2!8653 lt!285163)))) (and (= (currentBit!9014 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9019 thiss!1204) (size!4321 (buf!4779 (_2!8653 lt!285163))))))))))

(assert (=> b!185118 d!63867))

(declare-fun d!63869 () Bool)

(assert (=> d!63869 (= (invariant!0 (currentBit!9014 (_2!8653 lt!285168)) (currentByte!9019 (_2!8653 lt!285168)) (size!4321 (buf!4779 (_2!8653 lt!285168)))) (and (bvsge (currentBit!9014 (_2!8653 lt!285168)) #b00000000000000000000000000000000) (bvslt (currentBit!9014 (_2!8653 lt!285168)) #b00000000000000000000000000001000) (bvsge (currentByte!9019 (_2!8653 lt!285168)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9019 (_2!8653 lt!285168)) (size!4321 (buf!4779 (_2!8653 lt!285168)))) (and (= (currentBit!9014 (_2!8653 lt!285168)) #b00000000000000000000000000000000) (= (currentByte!9019 (_2!8653 lt!285168)) (size!4321 (buf!4779 (_2!8653 lt!285168))))))))))

(assert (=> b!185108 d!63869))

(declare-fun d!63871 () Bool)

(declare-fun lt!285366 () tuple2!16020)

(declare-fun lt!285368 () tuple2!16020)

(assert (=> d!63871 (and (= (_2!8655 lt!285366) (_2!8655 lt!285368)) (= (_1!8655 lt!285366) (_1!8655 lt!285368)))))

(declare-fun lt!285369 () BitStream!7750)

(declare-fun lt!285367 () (_ BitVec 64))

(declare-fun lt!285370 () Bool)

(declare-fun lt!285371 () Unit!13256)

(declare-fun choose!56 (BitStream!7750 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!16020 tuple2!16020 BitStream!7750 (_ BitVec 64) Bool BitStream!7750 (_ BitVec 64) tuple2!16020 tuple2!16020 BitStream!7750 (_ BitVec 64)) Unit!13256)

(assert (=> d!63871 (= lt!285371 (choose!56 (_1!8654 lt!285148) nBits!348 i!590 lt!285166 lt!285366 (tuple2!16021 (_1!8655 lt!285366) (_2!8655 lt!285366)) (_1!8655 lt!285366) (_2!8655 lt!285366) lt!285370 lt!285369 lt!285367 lt!285368 (tuple2!16021 (_1!8655 lt!285368) (_2!8655 lt!285368)) (_1!8655 lt!285368) (_2!8655 lt!285368)))))

(assert (=> d!63871 (= lt!285368 (readNBitsLSBFirstsLoopPure!0 lt!285369 nBits!348 (bvadd i!590 #b00000000000000000000000000000001) lt!285367))))

(assert (=> d!63871 (= lt!285367 (bvor lt!285166 (ite lt!285370 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63871 (= lt!285369 (withMovedBitIndex!0 (_1!8654 lt!285148) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!63871 (= lt!285370 (_2!8656 (readBitPure!0 (_1!8654 lt!285148))))))

(assert (=> d!63871 (= lt!285366 (readNBitsLSBFirstsLoopPure!0 (_1!8654 lt!285148) nBits!348 i!590 lt!285166))))

(assert (=> d!63871 (= (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8654 lt!285148) nBits!348 i!590 lt!285166) lt!285371)))

(declare-fun bs!15905 () Bool)

(assert (= bs!15905 d!63871))

(assert (=> bs!15905 m!287737))

(declare-fun m!287903 () Bool)

(assert (=> bs!15905 m!287903))

(assert (=> bs!15905 m!287683))

(declare-fun m!287905 () Bool)

(assert (=> bs!15905 m!287905))

(assert (=> bs!15905 m!287675))

(assert (=> b!185108 d!63871))

(declare-datatypes ((tuple2!16040 0))(
  ( (tuple2!16041 (_1!8665 (_ BitVec 64)) (_2!8665 BitStream!7750)) )
))
(declare-fun lt!285374 () tuple2!16040)

(declare-fun d!63873 () Bool)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!7750 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!16040)

(assert (=> d!63873 (= lt!285374 (readNBitsLSBFirstsLoop!0 (withMovedBitIndex!0 (_1!8654 lt!285148) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!285172))))

(assert (=> d!63873 (= (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!8654 lt!285148) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!285172) (tuple2!16021 (_2!8665 lt!285374) (_1!8665 lt!285374)))))

(declare-fun bs!15906 () Bool)

(assert (= bs!15906 d!63873))

(assert (=> bs!15906 m!287737))

(declare-fun m!287907 () Bool)

(assert (=> bs!15906 m!287907))

(assert (=> b!185108 d!63873))

(declare-fun d!63875 () Bool)

(declare-fun e!128266 () Bool)

(assert (=> d!63875 e!128266))

(declare-fun res!154164 () Bool)

(assert (=> d!63875 (=> (not res!154164) (not e!128266))))

(declare-fun lt!285380 () (_ BitVec 64))

(declare-fun lt!285379 () BitStream!7750)

(assert (=> d!63875 (= res!154164 (= (bvadd lt!285380 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!4321 (buf!4779 lt!285379)) (currentByte!9019 lt!285379) (currentBit!9014 lt!285379))))))

(assert (=> d!63875 (or (not (= (bvand lt!285380 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!285380 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!285380 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63875 (= lt!285380 (bitIndex!0 (size!4321 (buf!4779 (_1!8654 lt!285148))) (currentByte!9019 (_1!8654 lt!285148)) (currentBit!9014 (_1!8654 lt!285148))))))

(declare-fun moveBitIndex!0 (BitStream!7750 (_ BitVec 64)) tuple2!16016)

(assert (=> d!63875 (= lt!285379 (_2!8653 (moveBitIndex!0 (_1!8654 lt!285148) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun moveBitIndexPrecond!0 (BitStream!7750 (_ BitVec 64)) Bool)

(assert (=> d!63875 (moveBitIndexPrecond!0 (_1!8654 lt!285148) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!63875 (= (withMovedBitIndex!0 (_1!8654 lt!285148) #b0000000000000000000000000000000000000000000000000000000000000001) lt!285379)))

(declare-fun b!185241 () Bool)

(assert (=> b!185241 (= e!128266 (= (size!4321 (buf!4779 (_1!8654 lt!285148))) (size!4321 (buf!4779 lt!285379))))))

(assert (= (and d!63875 res!154164) b!185241))

(declare-fun m!287909 () Bool)

(assert (=> d!63875 m!287909))

(declare-fun m!287911 () Bool)

(assert (=> d!63875 m!287911))

(declare-fun m!287913 () Bool)

(assert (=> d!63875 m!287913))

(declare-fun m!287915 () Bool)

(assert (=> d!63875 m!287915))

(assert (=> b!185108 d!63875))

(declare-fun d!63877 () Bool)

(assert (=> d!63877 (= (invariant!0 (currentBit!9014 (_2!8653 lt!285163)) (currentByte!9019 (_2!8653 lt!285163)) (size!4321 (buf!4779 (_2!8653 lt!285163)))) (and (bvsge (currentBit!9014 (_2!8653 lt!285163)) #b00000000000000000000000000000000) (bvslt (currentBit!9014 (_2!8653 lt!285163)) #b00000000000000000000000000001000) (bvsge (currentByte!9019 (_2!8653 lt!285163)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9019 (_2!8653 lt!285163)) (size!4321 (buf!4779 (_2!8653 lt!285163)))) (and (= (currentBit!9014 (_2!8653 lt!285163)) #b00000000000000000000000000000000) (= (currentByte!9019 (_2!8653 lt!285163)) (size!4321 (buf!4779 (_2!8653 lt!285163))))))))))

(assert (=> b!185109 d!63877))

(declare-fun d!63879 () Bool)

(declare-fun e!128267 () Bool)

(assert (=> d!63879 e!128267))

(declare-fun res!154165 () Bool)

(assert (=> d!63879 (=> (not res!154165) (not e!128267))))

(declare-fun lt!285381 () BitStream!7750)

(declare-fun lt!285382 () (_ BitVec 64))

(assert (=> d!63879 (= res!154165 (= (bvadd lt!285382 (bvsub lt!285152 lt!285158)) (bitIndex!0 (size!4321 (buf!4779 lt!285381)) (currentByte!9019 lt!285381) (currentBit!9014 lt!285381))))))

(assert (=> d!63879 (or (not (= (bvand lt!285382 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!285152 lt!285158) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!285382 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!285382 (bvsub lt!285152 lt!285158)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63879 (= lt!285382 (bitIndex!0 (size!4321 (buf!4779 (_2!8654 lt!285148))) (currentByte!9019 (_2!8654 lt!285148)) (currentBit!9014 (_2!8654 lt!285148))))))

(assert (=> d!63879 (= lt!285381 (_2!8653 (moveBitIndex!0 (_2!8654 lt!285148) (bvsub lt!285152 lt!285158))))))

(assert (=> d!63879 (moveBitIndexPrecond!0 (_2!8654 lt!285148) (bvsub lt!285152 lt!285158))))

(assert (=> d!63879 (= (withMovedBitIndex!0 (_2!8654 lt!285148) (bvsub lt!285152 lt!285158)) lt!285381)))

(declare-fun b!185242 () Bool)

(assert (=> b!185242 (= e!128267 (= (size!4321 (buf!4779 (_2!8654 lt!285148))) (size!4321 (buf!4779 lt!285381))))))

(assert (= (and d!63879 res!154165) b!185242))

(declare-fun m!287917 () Bool)

(assert (=> d!63879 m!287917))

(declare-fun m!287919 () Bool)

(assert (=> d!63879 m!287919))

(declare-fun m!287921 () Bool)

(assert (=> d!63879 m!287921))

(declare-fun m!287923 () Bool)

(assert (=> d!63879 m!287923))

(assert (=> b!185110 d!63879))

(declare-fun d!63881 () Bool)

(declare-fun e!128268 () Bool)

(assert (=> d!63881 e!128268))

(declare-fun res!154166 () Bool)

(assert (=> d!63881 (=> (not res!154166) (not e!128268))))

(declare-fun lt!285386 () (_ BitVec 64))

(declare-fun lt!285388 () (_ BitVec 64))

(declare-fun lt!285384 () (_ BitVec 64))

(assert (=> d!63881 (= res!154166 (= lt!285384 (bvsub lt!285386 lt!285388)))))

(assert (=> d!63881 (or (= (bvand lt!285386 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!285388 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!285386 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!285386 lt!285388) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63881 (= lt!285388 (remainingBits!0 ((_ sign_extend 32) (size!4321 (buf!4779 (_2!8653 lt!285163)))) ((_ sign_extend 32) (currentByte!9019 (_2!8653 lt!285163))) ((_ sign_extend 32) (currentBit!9014 (_2!8653 lt!285163)))))))

(declare-fun lt!285383 () (_ BitVec 64))

(declare-fun lt!285385 () (_ BitVec 64))

(assert (=> d!63881 (= lt!285386 (bvmul lt!285383 lt!285385))))

(assert (=> d!63881 (or (= lt!285383 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!285385 (bvsdiv (bvmul lt!285383 lt!285385) lt!285383)))))

(assert (=> d!63881 (= lt!285385 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!63881 (= lt!285383 ((_ sign_extend 32) (size!4321 (buf!4779 (_2!8653 lt!285163)))))))

(assert (=> d!63881 (= lt!285384 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9019 (_2!8653 lt!285163))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9014 (_2!8653 lt!285163)))))))

(assert (=> d!63881 (invariant!0 (currentBit!9014 (_2!8653 lt!285163)) (currentByte!9019 (_2!8653 lt!285163)) (size!4321 (buf!4779 (_2!8653 lt!285163))))))

(assert (=> d!63881 (= (bitIndex!0 (size!4321 (buf!4779 (_2!8653 lt!285163))) (currentByte!9019 (_2!8653 lt!285163)) (currentBit!9014 (_2!8653 lt!285163))) lt!285384)))

(declare-fun b!185243 () Bool)

(declare-fun res!154167 () Bool)

(assert (=> b!185243 (=> (not res!154167) (not e!128268))))

(assert (=> b!185243 (= res!154167 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!285384))))

(declare-fun b!185244 () Bool)

(declare-fun lt!285387 () (_ BitVec 64))

(assert (=> b!185244 (= e!128268 (bvsle lt!285384 (bvmul lt!285387 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!185244 (or (= lt!285387 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!285387 #b0000000000000000000000000000000000000000000000000000000000001000) lt!285387)))))

(assert (=> b!185244 (= lt!285387 ((_ sign_extend 32) (size!4321 (buf!4779 (_2!8653 lt!285163)))))))

(assert (= (and d!63881 res!154166) b!185243))

(assert (= (and b!185243 res!154167) b!185244))

(declare-fun m!287925 () Bool)

(assert (=> d!63881 m!287925))

(assert (=> d!63881 m!287705))

(assert (=> b!185100 d!63881))

(declare-fun d!63883 () Bool)

(declare-fun res!154176 () Bool)

(declare-fun e!128274 () Bool)

(assert (=> d!63883 (=> (not res!154176) (not e!128274))))

(assert (=> d!63883 (= res!154176 (= (size!4321 (buf!4779 thiss!1204)) (size!4321 (buf!4779 (_2!8653 lt!285163)))))))

(assert (=> d!63883 (= (isPrefixOf!0 thiss!1204 (_2!8653 lt!285163)) e!128274)))

(declare-fun b!185251 () Bool)

(declare-fun res!154174 () Bool)

(assert (=> b!185251 (=> (not res!154174) (not e!128274))))

(assert (=> b!185251 (= res!154174 (bvsle (bitIndex!0 (size!4321 (buf!4779 thiss!1204)) (currentByte!9019 thiss!1204) (currentBit!9014 thiss!1204)) (bitIndex!0 (size!4321 (buf!4779 (_2!8653 lt!285163))) (currentByte!9019 (_2!8653 lt!285163)) (currentBit!9014 (_2!8653 lt!285163)))))))

(declare-fun b!185252 () Bool)

(declare-fun e!128273 () Bool)

(assert (=> b!185252 (= e!128274 e!128273)))

(declare-fun res!154175 () Bool)

(assert (=> b!185252 (=> res!154175 e!128273)))

(assert (=> b!185252 (= res!154175 (= (size!4321 (buf!4779 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!185253 () Bool)

(declare-fun arrayBitRangesEq!0 (array!9797 array!9797 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!185253 (= e!128273 (arrayBitRangesEq!0 (buf!4779 thiss!1204) (buf!4779 (_2!8653 lt!285163)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4321 (buf!4779 thiss!1204)) (currentByte!9019 thiss!1204) (currentBit!9014 thiss!1204))))))

(assert (= (and d!63883 res!154176) b!185251))

(assert (= (and b!185251 res!154174) b!185252))

(assert (= (and b!185252 (not res!154175)) b!185253))

(assert (=> b!185251 m!287729))

(assert (=> b!185251 m!287719))

(assert (=> b!185253 m!287729))

(assert (=> b!185253 m!287729))

(declare-fun m!287927 () Bool)

(assert (=> b!185253 m!287927))

(assert (=> b!185100 d!63883))

(declare-fun d!63885 () Bool)

(assert (=> d!63885 (isPrefixOf!0 thiss!1204 (_2!8653 lt!285163))))

(declare-fun lt!285391 () Unit!13256)

(declare-fun choose!30 (BitStream!7750 BitStream!7750 BitStream!7750) Unit!13256)

(assert (=> d!63885 (= lt!285391 (choose!30 thiss!1204 (_2!8653 lt!285168) (_2!8653 lt!285163)))))

(assert (=> d!63885 (isPrefixOf!0 thiss!1204 (_2!8653 lt!285168))))

(assert (=> d!63885 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8653 lt!285168) (_2!8653 lt!285163)) lt!285391)))

(declare-fun bs!15907 () Bool)

(assert (= bs!15907 d!63885))

(assert (=> bs!15907 m!287721))

(declare-fun m!287929 () Bool)

(assert (=> bs!15907 m!287929))

(assert (=> bs!15907 m!287665))

(assert (=> b!185100 d!63885))

(declare-fun b!185359 () Bool)

(declare-fun e!128334 () Bool)

(declare-fun lt!285752 () tuple2!16020)

(declare-fun lt!285706 () tuple2!16018)

(assert (=> b!185359 (= e!128334 (= (_1!8655 lt!285752) (_2!8654 lt!285706)))))

(declare-fun b!185360 () Bool)

(declare-fun res!154266 () Bool)

(declare-fun e!128337 () Bool)

(assert (=> b!185360 (=> (not res!154266) (not e!128337))))

(declare-fun lt!285725 () tuple2!16016)

(assert (=> b!185360 (= res!154266 (= (size!4321 (buf!4779 (_2!8653 lt!285168))) (size!4321 (buf!4779 (_2!8653 lt!285725)))))))

(declare-fun b!185361 () Bool)

(declare-fun res!154277 () Bool)

(declare-fun lt!285723 () tuple2!16016)

(assert (=> b!185361 (= res!154277 (isPrefixOf!0 (_2!8653 lt!285168) (_2!8653 lt!285723)))))

(declare-fun e!128338 () Bool)

(assert (=> b!185361 (=> (not res!154277) (not e!128338))))

(declare-fun b!185362 () Bool)

(declare-fun res!154269 () Bool)

(assert (=> b!185362 (=> (not res!154269) (not e!128337))))

(assert (=> b!185362 (= res!154269 (isPrefixOf!0 (_2!8653 lt!285168) (_2!8653 lt!285725)))))

(declare-fun b!185363 () Bool)

(declare-fun e!128342 () Bool)

(declare-fun lt!285748 () tuple2!16020)

(declare-fun lt!285717 () tuple2!16018)

(assert (=> b!185363 (= e!128342 (= (_1!8655 lt!285748) (_2!8654 lt!285717)))))

(declare-fun b!185364 () Bool)

(declare-fun e!128336 () Bool)

(declare-fun lt!285747 () tuple2!16022)

(assert (=> b!185364 (= e!128336 (= (bitIndex!0 (size!4321 (buf!4779 (_1!8656 lt!285747))) (currentByte!9019 (_1!8656 lt!285747)) (currentBit!9014 (_1!8656 lt!285747))) (bitIndex!0 (size!4321 (buf!4779 (_2!8653 lt!285723))) (currentByte!9019 (_2!8653 lt!285723)) (currentBit!9014 (_2!8653 lt!285723)))))))

(declare-fun b!185365 () Bool)

(assert (=> b!185365 (= lt!285747 (readBitPure!0 (readerFrom!0 (_2!8653 lt!285723) (currentBit!9014 (_2!8653 lt!285168)) (currentByte!9019 (_2!8653 lt!285168)))))))

(declare-fun lt!285709 () Bool)

(declare-fun res!154268 () Bool)

(assert (=> b!185365 (= res!154268 (and (= (_2!8656 lt!285747) lt!285709) (= (_1!8656 lt!285747) (_2!8653 lt!285723))))))

(assert (=> b!185365 (=> (not res!154268) (not e!128336))))

(assert (=> b!185365 (= e!128338 e!128336)))

(declare-fun b!185366 () Bool)

(declare-fun e!128340 () Bool)

(declare-fun lt!285702 () tuple2!16022)

(declare-fun lt!285719 () tuple2!16022)

(assert (=> b!185366 (= e!128340 (= (_2!8656 lt!285702) (_2!8656 lt!285719)))))

(declare-fun b!185367 () Bool)

(declare-fun res!154270 () Bool)

(assert (=> b!185367 (= res!154270 (= (bitIndex!0 (size!4321 (buf!4779 (_2!8653 lt!285723))) (currentByte!9019 (_2!8653 lt!285723)) (currentBit!9014 (_2!8653 lt!285723))) (bvadd (bitIndex!0 (size!4321 (buf!4779 (_2!8653 lt!285168))) (currentByte!9019 (_2!8653 lt!285168)) (currentBit!9014 (_2!8653 lt!285168))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!185367 (=> (not res!154270) (not e!128338))))

(declare-fun d!63887 () Bool)

(assert (=> d!63887 e!128337))

(declare-fun res!154273 () Bool)

(assert (=> d!63887 (=> (not res!154273) (not e!128337))))

(assert (=> d!63887 (= res!154273 (invariant!0 (currentBit!9014 (_2!8653 lt!285725)) (currentByte!9019 (_2!8653 lt!285725)) (size!4321 (buf!4779 (_2!8653 lt!285725)))))))

(declare-fun e!128335 () tuple2!16016)

(assert (=> d!63887 (= lt!285725 e!128335)))

(declare-fun c!9466 () Bool)

(assert (=> d!63887 (= c!9466 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!63887 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!63887 (= (appendBitsLSBFirstLoopTR!0 (_2!8653 lt!285168) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!285725)))

(declare-fun call!2984 () Bool)

(declare-fun lt!285711 () tuple2!16016)

(declare-fun bm!2981 () Bool)

(assert (=> bm!2981 (= call!2984 (isPrefixOf!0 (_2!8653 lt!285168) (ite c!9466 (_2!8653 lt!285168) (_2!8653 lt!285711))))))

(declare-fun b!185368 () Bool)

(declare-fun e!128339 () Bool)

(declare-fun lt!285701 () (_ BitVec 64))

(assert (=> b!185368 (= e!128339 (validate_offset_bits!1 ((_ sign_extend 32) (size!4321 (buf!4779 (_2!8653 lt!285168)))) ((_ sign_extend 32) (currentByte!9019 (_2!8653 lt!285168))) ((_ sign_extend 32) (currentBit!9014 (_2!8653 lt!285168))) lt!285701))))

(declare-fun b!185369 () Bool)

(assert (=> b!185369 (= e!128335 (tuple2!16017 (_1!8653 lt!285711) (_2!8653 lt!285711)))))

(assert (=> b!185369 (= lt!285709 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!185369 (= lt!285723 (appendBit!0 (_2!8653 lt!285168) lt!285709))))

(declare-fun res!154272 () Bool)

(assert (=> b!185369 (= res!154272 (= (size!4321 (buf!4779 (_2!8653 lt!285168))) (size!4321 (buf!4779 (_2!8653 lt!285723)))))))

(assert (=> b!185369 (=> (not res!154272) (not e!128338))))

(assert (=> b!185369 e!128338))

(declare-fun lt!285738 () tuple2!16016)

(assert (=> b!185369 (= lt!285738 lt!285723)))

(assert (=> b!185369 (= lt!285711 (appendBitsLSBFirstLoopTR!0 (_2!8653 lt!285738) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!285727 () Unit!13256)

(assert (=> b!185369 (= lt!285727 (lemmaIsPrefixTransitive!0 (_2!8653 lt!285168) (_2!8653 lt!285738) (_2!8653 lt!285711)))))

(assert (=> b!185369 call!2984))

(declare-fun lt!285708 () Unit!13256)

(assert (=> b!185369 (= lt!285708 lt!285727)))

(assert (=> b!185369 (invariant!0 (currentBit!9014 (_2!8653 lt!285168)) (currentByte!9019 (_2!8653 lt!285168)) (size!4321 (buf!4779 (_2!8653 lt!285738))))))

(declare-fun lt!285729 () BitStream!7750)

(assert (=> b!185369 (= lt!285729 (BitStream!7751 (buf!4779 (_2!8653 lt!285738)) (currentByte!9019 (_2!8653 lt!285168)) (currentBit!9014 (_2!8653 lt!285168))))))

(assert (=> b!185369 (invariant!0 (currentBit!9014 lt!285729) (currentByte!9019 lt!285729) (size!4321 (buf!4779 (_2!8653 lt!285711))))))

(declare-fun lt!285737 () BitStream!7750)

(assert (=> b!185369 (= lt!285737 (BitStream!7751 (buf!4779 (_2!8653 lt!285711)) (currentByte!9019 lt!285729) (currentBit!9014 lt!285729)))))

(assert (=> b!185369 (= lt!285702 (readBitPure!0 lt!285729))))

(assert (=> b!185369 (= lt!285719 (readBitPure!0 lt!285737))))

(declare-fun lt!285734 () Unit!13256)

(assert (=> b!185369 (= lt!285734 (readBitPrefixLemma!0 lt!285729 (_2!8653 lt!285711)))))

(declare-fun res!154275 () Bool)

(assert (=> b!185369 (= res!154275 (= (bitIndex!0 (size!4321 (buf!4779 (_1!8656 lt!285702))) (currentByte!9019 (_1!8656 lt!285702)) (currentBit!9014 (_1!8656 lt!285702))) (bitIndex!0 (size!4321 (buf!4779 (_1!8656 lt!285719))) (currentByte!9019 (_1!8656 lt!285719)) (currentBit!9014 (_1!8656 lt!285719)))))))

(assert (=> b!185369 (=> (not res!154275) (not e!128340))))

(assert (=> b!185369 e!128340))

(declare-fun lt!285704 () Unit!13256)

(assert (=> b!185369 (= lt!285704 lt!285734)))

(declare-fun lt!285722 () tuple2!16018)

(assert (=> b!185369 (= lt!285722 (reader!0 (_2!8653 lt!285168) (_2!8653 lt!285711)))))

(declare-fun lt!285740 () tuple2!16018)

(assert (=> b!185369 (= lt!285740 (reader!0 (_2!8653 lt!285738) (_2!8653 lt!285711)))))

(declare-fun lt!285714 () tuple2!16022)

(assert (=> b!185369 (= lt!285714 (readBitPure!0 (_1!8654 lt!285722)))))

(assert (=> b!185369 (= (_2!8656 lt!285714) lt!285709)))

(declare-fun lt!285753 () Unit!13256)

(declare-fun Unit!13262 () Unit!13256)

(assert (=> b!185369 (= lt!285753 Unit!13262)))

(declare-fun lt!285736 () (_ BitVec 64))

(assert (=> b!185369 (= lt!285736 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!285724 () (_ BitVec 64))

(assert (=> b!185369 (= lt!285724 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!285712 () Unit!13256)

(assert (=> b!185369 (= lt!285712 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8653 lt!285168) (buf!4779 (_2!8653 lt!285711)) lt!285724))))

(assert (=> b!185369 (validate_offset_bits!1 ((_ sign_extend 32) (size!4321 (buf!4779 (_2!8653 lt!285711)))) ((_ sign_extend 32) (currentByte!9019 (_2!8653 lt!285168))) ((_ sign_extend 32) (currentBit!9014 (_2!8653 lt!285168))) lt!285724)))

(declare-fun lt!285744 () Unit!13256)

(assert (=> b!185369 (= lt!285744 lt!285712)))

(declare-fun lt!285713 () tuple2!16020)

(assert (=> b!185369 (= lt!285713 (readNBitsLSBFirstsLoopPure!0 (_1!8654 lt!285722) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!285736))))

(declare-fun lt!285731 () (_ BitVec 64))

(assert (=> b!185369 (= lt!285731 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!285742 () Unit!13256)

(assert (=> b!185369 (= lt!285742 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8653 lt!285738) (buf!4779 (_2!8653 lt!285711)) lt!285731))))

(assert (=> b!185369 (validate_offset_bits!1 ((_ sign_extend 32) (size!4321 (buf!4779 (_2!8653 lt!285711)))) ((_ sign_extend 32) (currentByte!9019 (_2!8653 lt!285738))) ((_ sign_extend 32) (currentBit!9014 (_2!8653 lt!285738))) lt!285731)))

(declare-fun lt!285735 () Unit!13256)

(assert (=> b!185369 (= lt!285735 lt!285742)))

(declare-fun lt!285732 () tuple2!16020)

(assert (=> b!185369 (= lt!285732 (readNBitsLSBFirstsLoopPure!0 (_1!8654 lt!285740) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!285736 (ite (_2!8656 lt!285714) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!285728 () tuple2!16020)

(assert (=> b!185369 (= lt!285728 (readNBitsLSBFirstsLoopPure!0 (_1!8654 lt!285722) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!285736))))

(declare-fun c!9465 () Bool)

(assert (=> b!185369 (= c!9465 (_2!8656 (readBitPure!0 (_1!8654 lt!285722))))))

(declare-fun lt!285733 () tuple2!16020)

(declare-fun e!128341 () (_ BitVec 64))

(assert (=> b!185369 (= lt!285733 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!8654 lt!285722) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!285736 e!128341)))))

(declare-fun lt!285705 () Unit!13256)

(assert (=> b!185369 (= lt!285705 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8654 lt!285722) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!285736))))

(assert (=> b!185369 (and (= (_2!8655 lt!285728) (_2!8655 lt!285733)) (= (_1!8655 lt!285728) (_1!8655 lt!285733)))))

(declare-fun lt!285726 () Unit!13256)

(assert (=> b!185369 (= lt!285726 lt!285705)))

(assert (=> b!185369 (= (_1!8654 lt!285722) (withMovedBitIndex!0 (_2!8654 lt!285722) (bvsub (bitIndex!0 (size!4321 (buf!4779 (_2!8653 lt!285168))) (currentByte!9019 (_2!8653 lt!285168)) (currentBit!9014 (_2!8653 lt!285168))) (bitIndex!0 (size!4321 (buf!4779 (_2!8653 lt!285711))) (currentByte!9019 (_2!8653 lt!285711)) (currentBit!9014 (_2!8653 lt!285711))))))))

(declare-fun lt!285718 () Unit!13256)

(declare-fun Unit!13263 () Unit!13256)

(assert (=> b!185369 (= lt!285718 Unit!13263)))

(assert (=> b!185369 (= (_1!8654 lt!285740) (withMovedBitIndex!0 (_2!8654 lt!285740) (bvsub (bitIndex!0 (size!4321 (buf!4779 (_2!8653 lt!285738))) (currentByte!9019 (_2!8653 lt!285738)) (currentBit!9014 (_2!8653 lt!285738))) (bitIndex!0 (size!4321 (buf!4779 (_2!8653 lt!285711))) (currentByte!9019 (_2!8653 lt!285711)) (currentBit!9014 (_2!8653 lt!285711))))))))

(declare-fun lt!285721 () Unit!13256)

(declare-fun Unit!13264 () Unit!13256)

(assert (=> b!185369 (= lt!285721 Unit!13264)))

(assert (=> b!185369 (= (bitIndex!0 (size!4321 (buf!4779 (_2!8653 lt!285168))) (currentByte!9019 (_2!8653 lt!285168)) (currentBit!9014 (_2!8653 lt!285168))) (bvsub (bitIndex!0 (size!4321 (buf!4779 (_2!8653 lt!285738))) (currentByte!9019 (_2!8653 lt!285738)) (currentBit!9014 (_2!8653 lt!285738))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!285751 () Unit!13256)

(declare-fun Unit!13265 () Unit!13256)

(assert (=> b!185369 (= lt!285751 Unit!13265)))

(assert (=> b!185369 (= (_2!8655 lt!285713) (_2!8655 lt!285732))))

(declare-fun lt!285703 () Unit!13256)

(declare-fun Unit!13266 () Unit!13256)

(assert (=> b!185369 (= lt!285703 Unit!13266)))

(assert (=> b!185369 (invariant!0 (currentBit!9014 (_2!8653 lt!285711)) (currentByte!9019 (_2!8653 lt!285711)) (size!4321 (buf!4779 (_2!8653 lt!285711))))))

(declare-fun lt!285749 () Unit!13256)

(declare-fun Unit!13267 () Unit!13256)

(assert (=> b!185369 (= lt!285749 Unit!13267)))

(assert (=> b!185369 (= (size!4321 (buf!4779 (_2!8653 lt!285168))) (size!4321 (buf!4779 (_2!8653 lt!285711))))))

(declare-fun lt!285700 () Unit!13256)

(declare-fun Unit!13268 () Unit!13256)

(assert (=> b!185369 (= lt!285700 Unit!13268)))

(assert (=> b!185369 (= (bitIndex!0 (size!4321 (buf!4779 (_2!8653 lt!285711))) (currentByte!9019 (_2!8653 lt!285711)) (currentBit!9014 (_2!8653 lt!285711))) (bvsub (bvadd (bitIndex!0 (size!4321 (buf!4779 (_2!8653 lt!285168))) (currentByte!9019 (_2!8653 lt!285168)) (currentBit!9014 (_2!8653 lt!285168))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!285715 () Unit!13256)

(declare-fun Unit!13269 () Unit!13256)

(assert (=> b!185369 (= lt!285715 Unit!13269)))

(declare-fun lt!285745 () Unit!13256)

(declare-fun Unit!13270 () Unit!13256)

(assert (=> b!185369 (= lt!285745 Unit!13270)))

(assert (=> b!185369 (= lt!285717 (reader!0 (_2!8653 lt!285168) (_2!8653 lt!285711)))))

(declare-fun lt!285739 () (_ BitVec 64))

(assert (=> b!185369 (= lt!285739 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!285698 () Unit!13256)

(assert (=> b!185369 (= lt!285698 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8653 lt!285168) (buf!4779 (_2!8653 lt!285711)) lt!285739))))

(assert (=> b!185369 (validate_offset_bits!1 ((_ sign_extend 32) (size!4321 (buf!4779 (_2!8653 lt!285711)))) ((_ sign_extend 32) (currentByte!9019 (_2!8653 lt!285168))) ((_ sign_extend 32) (currentBit!9014 (_2!8653 lt!285168))) lt!285739)))

(declare-fun lt!285730 () Unit!13256)

(assert (=> b!185369 (= lt!285730 lt!285698)))

(assert (=> b!185369 (= lt!285748 (readNBitsLSBFirstsLoopPure!0 (_1!8654 lt!285717) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!154271 () Bool)

(assert (=> b!185369 (= res!154271 (= (_2!8655 lt!285748) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!185369 (=> (not res!154271) (not e!128342))))

(assert (=> b!185369 e!128342))

(declare-fun lt!285716 () Unit!13256)

(declare-fun Unit!13271 () Unit!13256)

(assert (=> b!185369 (= lt!285716 Unit!13271)))

(declare-fun b!185370 () Bool)

(declare-fun Unit!13272 () Unit!13256)

(assert (=> b!185370 (= e!128335 (tuple2!16017 Unit!13272 (_2!8653 lt!285168)))))

(declare-fun lt!285707 () Unit!13256)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!7750) Unit!13256)

(assert (=> b!185370 (= lt!285707 (lemmaIsPrefixRefl!0 (_2!8653 lt!285168)))))

(assert (=> b!185370 call!2984))

(declare-fun lt!285750 () Unit!13256)

(assert (=> b!185370 (= lt!285750 lt!285707)))

(declare-fun b!185371 () Bool)

(assert (=> b!185371 (= e!128337 e!128334)))

(declare-fun res!154274 () Bool)

(assert (=> b!185371 (=> (not res!154274) (not e!128334))))

(assert (=> b!185371 (= res!154274 (= (_2!8655 lt!285752) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!185371 (= lt!285752 (readNBitsLSBFirstsLoopPure!0 (_1!8654 lt!285706) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!285746 () Unit!13256)

(declare-fun lt!285710 () Unit!13256)

(assert (=> b!185371 (= lt!285746 lt!285710)))

(assert (=> b!185371 (validate_offset_bits!1 ((_ sign_extend 32) (size!4321 (buf!4779 (_2!8653 lt!285725)))) ((_ sign_extend 32) (currentByte!9019 (_2!8653 lt!285168))) ((_ sign_extend 32) (currentBit!9014 (_2!8653 lt!285168))) lt!285701)))

(assert (=> b!185371 (= lt!285710 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8653 lt!285168) (buf!4779 (_2!8653 lt!285725)) lt!285701))))

(assert (=> b!185371 e!128339))

(declare-fun res!154267 () Bool)

(assert (=> b!185371 (=> (not res!154267) (not e!128339))))

(assert (=> b!185371 (= res!154267 (and (= (size!4321 (buf!4779 (_2!8653 lt!285168))) (size!4321 (buf!4779 (_2!8653 lt!285725)))) (bvsge lt!285701 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!185371 (= lt!285701 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!185371 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!185371 (= lt!285706 (reader!0 (_2!8653 lt!285168) (_2!8653 lt!285725)))))

(declare-fun b!185372 () Bool)

(assert (=> b!185372 (= e!128341 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!185373 () Bool)

(assert (=> b!185373 (= e!128341 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!185374 () Bool)

(declare-fun res!154276 () Bool)

(assert (=> b!185374 (=> (not res!154276) (not e!128337))))

(declare-fun lt!285699 () (_ BitVec 64))

(declare-fun lt!285720 () (_ BitVec 64))

(assert (=> b!185374 (= res!154276 (= (bitIndex!0 (size!4321 (buf!4779 (_2!8653 lt!285725))) (currentByte!9019 (_2!8653 lt!285725)) (currentBit!9014 (_2!8653 lt!285725))) (bvsub lt!285699 lt!285720)))))

(assert (=> b!185374 (or (= (bvand lt!285699 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!285720 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!285699 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!285699 lt!285720) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!185374 (= lt!285720 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!285743 () (_ BitVec 64))

(declare-fun lt!285741 () (_ BitVec 64))

(assert (=> b!185374 (= lt!285699 (bvadd lt!285743 lt!285741))))

(assert (=> b!185374 (or (not (= (bvand lt!285743 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!285741 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!285743 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!285743 lt!285741) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!185374 (= lt!285741 ((_ sign_extend 32) nBits!348))))

(assert (=> b!185374 (= lt!285743 (bitIndex!0 (size!4321 (buf!4779 (_2!8653 lt!285168))) (currentByte!9019 (_2!8653 lt!285168)) (currentBit!9014 (_2!8653 lt!285168))))))

(assert (= (and d!63887 c!9466) b!185370))

(assert (= (and d!63887 (not c!9466)) b!185369))

(assert (= (and b!185369 res!154272) b!185367))

(assert (= (and b!185367 res!154270) b!185361))

(assert (= (and b!185361 res!154277) b!185365))

(assert (= (and b!185365 res!154268) b!185364))

(assert (= (and b!185369 res!154275) b!185366))

(assert (= (and b!185369 c!9465) b!185372))

(assert (= (and b!185369 (not c!9465)) b!185373))

(assert (= (and b!185369 res!154271) b!185363))

(assert (= (or b!185370 b!185369) bm!2981))

(assert (= (and d!63887 res!154273) b!185360))

(assert (= (and b!185360 res!154266) b!185374))

(assert (= (and b!185374 res!154276) b!185362))

(assert (= (and b!185362 res!154269) b!185371))

(assert (= (and b!185371 res!154267) b!185368))

(assert (= (and b!185371 res!154274) b!185359))

(declare-fun m!288071 () Bool)

(assert (=> b!185368 m!288071))

(declare-fun m!288073 () Bool)

(assert (=> b!185365 m!288073))

(assert (=> b!185365 m!288073))

(declare-fun m!288075 () Bool)

(assert (=> b!185365 m!288075))

(declare-fun m!288077 () Bool)

(assert (=> b!185371 m!288077))

(declare-fun m!288079 () Bool)

(assert (=> b!185371 m!288079))

(declare-fun m!288081 () Bool)

(assert (=> b!185371 m!288081))

(declare-fun m!288083 () Bool)

(assert (=> b!185371 m!288083))

(declare-fun m!288085 () Bool)

(assert (=> b!185371 m!288085))

(declare-fun m!288087 () Bool)

(assert (=> b!185371 m!288087))

(declare-fun m!288089 () Bool)

(assert (=> b!185364 m!288089))

(declare-fun m!288091 () Bool)

(assert (=> b!185364 m!288091))

(declare-fun m!288093 () Bool)

(assert (=> bm!2981 m!288093))

(declare-fun m!288095 () Bool)

(assert (=> b!185362 m!288095))

(declare-fun m!288097 () Bool)

(assert (=> b!185361 m!288097))

(declare-fun m!288099 () Bool)

(assert (=> b!185369 m!288099))

(assert (=> b!185369 m!288077))

(declare-fun m!288101 () Bool)

(assert (=> b!185369 m!288101))

(declare-fun m!288103 () Bool)

(assert (=> b!185369 m!288103))

(declare-fun m!288105 () Bool)

(assert (=> b!185369 m!288105))

(declare-fun m!288107 () Bool)

(assert (=> b!185369 m!288107))

(declare-fun m!288109 () Bool)

(assert (=> b!185369 m!288109))

(declare-fun m!288111 () Bool)

(assert (=> b!185369 m!288111))

(declare-fun m!288113 () Bool)

(assert (=> b!185369 m!288113))

(declare-fun m!288115 () Bool)

(assert (=> b!185369 m!288115))

(declare-fun m!288117 () Bool)

(assert (=> b!185369 m!288117))

(declare-fun m!288119 () Bool)

(assert (=> b!185369 m!288119))

(declare-fun m!288121 () Bool)

(assert (=> b!185369 m!288121))

(declare-fun m!288123 () Bool)

(assert (=> b!185369 m!288123))

(declare-fun m!288125 () Bool)

(assert (=> b!185369 m!288125))

(declare-fun m!288127 () Bool)

(assert (=> b!185369 m!288127))

(declare-fun m!288129 () Bool)

(assert (=> b!185369 m!288129))

(declare-fun m!288131 () Bool)

(assert (=> b!185369 m!288131))

(declare-fun m!288133 () Bool)

(assert (=> b!185369 m!288133))

(declare-fun m!288135 () Bool)

(assert (=> b!185369 m!288135))

(assert (=> b!185369 m!288081))

(assert (=> b!185369 m!287727))

(declare-fun m!288137 () Bool)

(assert (=> b!185369 m!288137))

(declare-fun m!288139 () Bool)

(assert (=> b!185369 m!288139))

(declare-fun m!288141 () Bool)

(assert (=> b!185369 m!288141))

(declare-fun m!288143 () Bool)

(assert (=> b!185369 m!288143))

(declare-fun m!288145 () Bool)

(assert (=> b!185369 m!288145))

(declare-fun m!288147 () Bool)

(assert (=> b!185369 m!288147))

(declare-fun m!288149 () Bool)

(assert (=> b!185369 m!288149))

(assert (=> b!185369 m!288139))

(declare-fun m!288151 () Bool)

(assert (=> b!185369 m!288151))

(declare-fun m!288153 () Bool)

(assert (=> b!185369 m!288153))

(declare-fun m!288155 () Bool)

(assert (=> b!185369 m!288155))

(declare-fun m!288157 () Bool)

(assert (=> b!185369 m!288157))

(declare-fun m!288159 () Bool)

(assert (=> d!63887 m!288159))

(assert (=> b!185367 m!288091))

(assert (=> b!185367 m!287727))

(declare-fun m!288161 () Bool)

(assert (=> b!185374 m!288161))

(assert (=> b!185374 m!287727))

(declare-fun m!288163 () Bool)

(assert (=> b!185370 m!288163))

(assert (=> b!185100 d!63887))

(declare-fun d!63965 () Bool)

(declare-fun e!128343 () Bool)

(assert (=> d!63965 e!128343))

(declare-fun res!154278 () Bool)

(assert (=> d!63965 (=> (not res!154278) (not e!128343))))

(declare-fun lt!285759 () (_ BitVec 64))

(declare-fun lt!285755 () (_ BitVec 64))

(declare-fun lt!285757 () (_ BitVec 64))

(assert (=> d!63965 (= res!154278 (= lt!285755 (bvsub lt!285757 lt!285759)))))

(assert (=> d!63965 (or (= (bvand lt!285757 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!285759 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!285757 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!285757 lt!285759) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63965 (= lt!285759 (remainingBits!0 ((_ sign_extend 32) (size!4321 (buf!4779 (_2!8653 lt!285168)))) ((_ sign_extend 32) (currentByte!9019 (_2!8653 lt!285168))) ((_ sign_extend 32) (currentBit!9014 (_2!8653 lt!285168)))))))

(declare-fun lt!285754 () (_ BitVec 64))

(declare-fun lt!285756 () (_ BitVec 64))

(assert (=> d!63965 (= lt!285757 (bvmul lt!285754 lt!285756))))

(assert (=> d!63965 (or (= lt!285754 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!285756 (bvsdiv (bvmul lt!285754 lt!285756) lt!285754)))))

(assert (=> d!63965 (= lt!285756 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!63965 (= lt!285754 ((_ sign_extend 32) (size!4321 (buf!4779 (_2!8653 lt!285168)))))))

(assert (=> d!63965 (= lt!285755 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9019 (_2!8653 lt!285168))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9014 (_2!8653 lt!285168)))))))

(assert (=> d!63965 (invariant!0 (currentBit!9014 (_2!8653 lt!285168)) (currentByte!9019 (_2!8653 lt!285168)) (size!4321 (buf!4779 (_2!8653 lt!285168))))))

(assert (=> d!63965 (= (bitIndex!0 (size!4321 (buf!4779 (_2!8653 lt!285168))) (currentByte!9019 (_2!8653 lt!285168)) (currentBit!9014 (_2!8653 lt!285168))) lt!285755)))

(declare-fun b!185375 () Bool)

(declare-fun res!154279 () Bool)

(assert (=> b!185375 (=> (not res!154279) (not e!128343))))

(assert (=> b!185375 (= res!154279 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!285755))))

(declare-fun b!185376 () Bool)

(declare-fun lt!285758 () (_ BitVec 64))

(assert (=> b!185376 (= e!128343 (bvsle lt!285755 (bvmul lt!285758 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!185376 (or (= lt!285758 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!285758 #b0000000000000000000000000000000000000000000000000000000000001000) lt!285758)))))

(assert (=> b!185376 (= lt!285758 ((_ sign_extend 32) (size!4321 (buf!4779 (_2!8653 lt!285168)))))))

(assert (= (and d!63965 res!154278) b!185375))

(assert (= (and b!185375 res!154279) b!185376))

(declare-fun m!288165 () Bool)

(assert (=> d!63965 m!288165))

(assert (=> d!63965 m!287733))

(assert (=> b!185111 d!63965))

(declare-fun d!63967 () Bool)

(declare-fun e!128344 () Bool)

(assert (=> d!63967 e!128344))

(declare-fun res!154280 () Bool)

(assert (=> d!63967 (=> (not res!154280) (not e!128344))))

(declare-fun lt!285761 () (_ BitVec 64))

(declare-fun lt!285763 () (_ BitVec 64))

(declare-fun lt!285765 () (_ BitVec 64))

(assert (=> d!63967 (= res!154280 (= lt!285761 (bvsub lt!285763 lt!285765)))))

(assert (=> d!63967 (or (= (bvand lt!285763 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!285765 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!285763 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!285763 lt!285765) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63967 (= lt!285765 (remainingBits!0 ((_ sign_extend 32) (size!4321 (buf!4779 thiss!1204))) ((_ sign_extend 32) (currentByte!9019 thiss!1204)) ((_ sign_extend 32) (currentBit!9014 thiss!1204))))))

(declare-fun lt!285760 () (_ BitVec 64))

(declare-fun lt!285762 () (_ BitVec 64))

(assert (=> d!63967 (= lt!285763 (bvmul lt!285760 lt!285762))))

(assert (=> d!63967 (or (= lt!285760 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!285762 (bvsdiv (bvmul lt!285760 lt!285762) lt!285760)))))

(assert (=> d!63967 (= lt!285762 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!63967 (= lt!285760 ((_ sign_extend 32) (size!4321 (buf!4779 thiss!1204))))))

(assert (=> d!63967 (= lt!285761 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9019 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9014 thiss!1204))))))

(assert (=> d!63967 (invariant!0 (currentBit!9014 thiss!1204) (currentByte!9019 thiss!1204) (size!4321 (buf!4779 thiss!1204)))))

(assert (=> d!63967 (= (bitIndex!0 (size!4321 (buf!4779 thiss!1204)) (currentByte!9019 thiss!1204) (currentBit!9014 thiss!1204)) lt!285761)))

(declare-fun b!185377 () Bool)

(declare-fun res!154281 () Bool)

(assert (=> b!185377 (=> (not res!154281) (not e!128344))))

(assert (=> b!185377 (= res!154281 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!285761))))

(declare-fun b!185378 () Bool)

(declare-fun lt!285764 () (_ BitVec 64))

(assert (=> b!185378 (= e!128344 (bvsle lt!285761 (bvmul lt!285764 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!185378 (or (= lt!285764 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!285764 #b0000000000000000000000000000000000000000000000000000000000001000) lt!285764)))))

(assert (=> b!185378 (= lt!285764 ((_ sign_extend 32) (size!4321 (buf!4779 thiss!1204))))))

(assert (= (and d!63967 res!154280) b!185377))

(assert (= (and b!185377 res!154281) b!185378))

(declare-fun m!288167 () Bool)

(assert (=> d!63967 m!288167))

(assert (=> d!63967 m!287711))

(assert (=> b!185111 d!63967))

(declare-fun d!63969 () Bool)

(assert (=> d!63969 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9014 thiss!1204) (currentByte!9019 thiss!1204) (size!4321 (buf!4779 thiss!1204))))))

(declare-fun bs!15924 () Bool)

(assert (= bs!15924 d!63969))

(assert (=> bs!15924 m!287711))

(assert (=> start!40340 d!63969))

(declare-fun d!63971 () Bool)

(assert (=> d!63971 (= (array_inv!4062 (buf!4779 thiss!1204)) (bvsge (size!4321 (buf!4779 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!185112 d!63971))

(declare-fun d!63973 () Bool)

(declare-fun res!154284 () Bool)

(declare-fun e!128346 () Bool)

(assert (=> d!63973 (=> (not res!154284) (not e!128346))))

(assert (=> d!63973 (= res!154284 (= (size!4321 (buf!4779 thiss!1204)) (size!4321 (buf!4779 (_2!8653 lt!285168)))))))

(assert (=> d!63973 (= (isPrefixOf!0 thiss!1204 (_2!8653 lt!285168)) e!128346)))

(declare-fun b!185379 () Bool)

(declare-fun res!154282 () Bool)

(assert (=> b!185379 (=> (not res!154282) (not e!128346))))

(assert (=> b!185379 (= res!154282 (bvsle (bitIndex!0 (size!4321 (buf!4779 thiss!1204)) (currentByte!9019 thiss!1204) (currentBit!9014 thiss!1204)) (bitIndex!0 (size!4321 (buf!4779 (_2!8653 lt!285168))) (currentByte!9019 (_2!8653 lt!285168)) (currentBit!9014 (_2!8653 lt!285168)))))))

(declare-fun b!185380 () Bool)

(declare-fun e!128345 () Bool)

(assert (=> b!185380 (= e!128346 e!128345)))

(declare-fun res!154283 () Bool)

(assert (=> b!185380 (=> res!154283 e!128345)))

(assert (=> b!185380 (= res!154283 (= (size!4321 (buf!4779 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!185381 () Bool)

(assert (=> b!185381 (= e!128345 (arrayBitRangesEq!0 (buf!4779 thiss!1204) (buf!4779 (_2!8653 lt!285168)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4321 (buf!4779 thiss!1204)) (currentByte!9019 thiss!1204) (currentBit!9014 thiss!1204))))))

(assert (= (and d!63973 res!154284) b!185379))

(assert (= (and b!185379 res!154282) b!185380))

(assert (= (and b!185380 (not res!154283)) b!185381))

(assert (=> b!185379 m!287729))

(assert (=> b!185379 m!287727))

(assert (=> b!185381 m!287729))

(assert (=> b!185381 m!287729))

(declare-fun m!288169 () Bool)

(assert (=> b!185381 m!288169))

(assert (=> b!185101 d!63973))

(declare-fun d!63975 () Bool)

(declare-datatypes ((tuple2!16042 0))(
  ( (tuple2!16043 (_1!8666 Bool) (_2!8666 BitStream!7750)) )
))
(declare-fun lt!285768 () tuple2!16042)

(declare-fun readBit!0 (BitStream!7750) tuple2!16042)

(assert (=> d!63975 (= lt!285768 (readBit!0 (BitStream!7751 (buf!4779 (_2!8653 lt!285163)) (currentByte!9019 thiss!1204) (currentBit!9014 thiss!1204))))))

(assert (=> d!63975 (= (readBitPure!0 (BitStream!7751 (buf!4779 (_2!8653 lt!285163)) (currentByte!9019 thiss!1204) (currentBit!9014 thiss!1204))) (tuple2!16023 (_2!8666 lt!285768) (_1!8666 lt!285768)))))

(declare-fun bs!15925 () Bool)

(assert (= bs!15925 d!63975))

(declare-fun m!288171 () Bool)

(assert (=> bs!15925 m!288171))

(assert (=> b!185102 d!63975))

(declare-fun d!63977 () Bool)

(assert (=> d!63977 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4321 (buf!4779 (_2!8653 lt!285163)))) ((_ sign_extend 32) (currentByte!9019 (_2!8653 lt!285168))) ((_ sign_extend 32) (currentBit!9014 (_2!8653 lt!285168))) lt!285157) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4321 (buf!4779 (_2!8653 lt!285163)))) ((_ sign_extend 32) (currentByte!9019 (_2!8653 lt!285168))) ((_ sign_extend 32) (currentBit!9014 (_2!8653 lt!285168)))) lt!285157))))

(declare-fun bs!15926 () Bool)

(assert (= bs!15926 d!63977))

(declare-fun m!288173 () Bool)

(assert (=> bs!15926 m!288173))

(assert (=> b!185102 d!63977))

(declare-fun d!63979 () Bool)

(assert (=> d!63979 (= (onesLSBLong!0 i!590) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 i!590))))))

(assert (=> b!185102 d!63979))

(declare-fun d!63981 () Bool)

(declare-fun e!128349 () Bool)

(assert (=> d!63981 e!128349))

(declare-fun res!154287 () Bool)

(assert (=> d!63981 (=> (not res!154287) (not e!128349))))

(declare-fun lt!285778 () tuple2!16022)

(declare-fun lt!285777 () tuple2!16022)

(assert (=> d!63981 (= res!154287 (= (bitIndex!0 (size!4321 (buf!4779 (_1!8656 lt!285778))) (currentByte!9019 (_1!8656 lt!285778)) (currentBit!9014 (_1!8656 lt!285778))) (bitIndex!0 (size!4321 (buf!4779 (_1!8656 lt!285777))) (currentByte!9019 (_1!8656 lt!285777)) (currentBit!9014 (_1!8656 lt!285777)))))))

(declare-fun lt!285780 () BitStream!7750)

(declare-fun lt!285779 () Unit!13256)

(declare-fun choose!50 (BitStream!7750 BitStream!7750 BitStream!7750 tuple2!16022 tuple2!16022 BitStream!7750 Bool tuple2!16022 tuple2!16022 BitStream!7750 Bool) Unit!13256)

(assert (=> d!63981 (= lt!285779 (choose!50 lt!285160 (_2!8653 lt!285163) lt!285780 lt!285778 (tuple2!16023 (_1!8656 lt!285778) (_2!8656 lt!285778)) (_1!8656 lt!285778) (_2!8656 lt!285778) lt!285777 (tuple2!16023 (_1!8656 lt!285777) (_2!8656 lt!285777)) (_1!8656 lt!285777) (_2!8656 lt!285777)))))

(assert (=> d!63981 (= lt!285777 (readBitPure!0 lt!285780))))

(assert (=> d!63981 (= lt!285778 (readBitPure!0 lt!285160))))

(assert (=> d!63981 (= lt!285780 (BitStream!7751 (buf!4779 (_2!8653 lt!285163)) (currentByte!9019 lt!285160) (currentBit!9014 lt!285160)))))

(assert (=> d!63981 (invariant!0 (currentBit!9014 lt!285160) (currentByte!9019 lt!285160) (size!4321 (buf!4779 (_2!8653 lt!285163))))))

(assert (=> d!63981 (= (readBitPrefixLemma!0 lt!285160 (_2!8653 lt!285163)) lt!285779)))

(declare-fun b!185384 () Bool)

(assert (=> b!185384 (= e!128349 (= (_2!8656 lt!285778) (_2!8656 lt!285777)))))

(assert (= (and d!63981 res!154287) b!185384))

(declare-fun m!288175 () Bool)

(assert (=> d!63981 m!288175))

(declare-fun m!288177 () Bool)

(assert (=> d!63981 m!288177))

(assert (=> d!63981 m!287689))

(declare-fun m!288179 () Bool)

(assert (=> d!63981 m!288179))

(declare-fun m!288181 () Bool)

(assert (=> d!63981 m!288181))

(declare-fun m!288183 () Bool)

(assert (=> d!63981 m!288183))

(assert (=> b!185102 d!63981))

(declare-fun d!63983 () Bool)

(declare-fun e!128350 () Bool)

(assert (=> d!63983 e!128350))

(declare-fun res!154288 () Bool)

(assert (=> d!63983 (=> (not res!154288) (not e!128350))))

(declare-fun lt!285782 () (_ BitVec 64))

(declare-fun lt!285784 () (_ BitVec 64))

(declare-fun lt!285786 () (_ BitVec 64))

(assert (=> d!63983 (= res!154288 (= lt!285782 (bvsub lt!285784 lt!285786)))))

(assert (=> d!63983 (or (= (bvand lt!285784 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!285786 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!285784 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!285784 lt!285786) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63983 (= lt!285786 (remainingBits!0 ((_ sign_extend 32) (size!4321 (buf!4779 (_1!8656 lt!285153)))) ((_ sign_extend 32) (currentByte!9019 (_1!8656 lt!285153))) ((_ sign_extend 32) (currentBit!9014 (_1!8656 lt!285153)))))))

(declare-fun lt!285781 () (_ BitVec 64))

(declare-fun lt!285783 () (_ BitVec 64))

(assert (=> d!63983 (= lt!285784 (bvmul lt!285781 lt!285783))))

(assert (=> d!63983 (or (= lt!285781 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!285783 (bvsdiv (bvmul lt!285781 lt!285783) lt!285781)))))

(assert (=> d!63983 (= lt!285783 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!63983 (= lt!285781 ((_ sign_extend 32) (size!4321 (buf!4779 (_1!8656 lt!285153)))))))

(assert (=> d!63983 (= lt!285782 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9019 (_1!8656 lt!285153))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9014 (_1!8656 lt!285153)))))))

(assert (=> d!63983 (invariant!0 (currentBit!9014 (_1!8656 lt!285153)) (currentByte!9019 (_1!8656 lt!285153)) (size!4321 (buf!4779 (_1!8656 lt!285153))))))

(assert (=> d!63983 (= (bitIndex!0 (size!4321 (buf!4779 (_1!8656 lt!285153))) (currentByte!9019 (_1!8656 lt!285153)) (currentBit!9014 (_1!8656 lt!285153))) lt!285782)))

(declare-fun b!185385 () Bool)

(declare-fun res!154289 () Bool)

(assert (=> b!185385 (=> (not res!154289) (not e!128350))))

(assert (=> b!185385 (= res!154289 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!285782))))

(declare-fun b!185386 () Bool)

(declare-fun lt!285785 () (_ BitVec 64))

(assert (=> b!185386 (= e!128350 (bvsle lt!285782 (bvmul lt!285785 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!185386 (or (= lt!285785 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!285785 #b0000000000000000000000000000000000000000000000000000000000001000) lt!285785)))))

(assert (=> b!185386 (= lt!285785 ((_ sign_extend 32) (size!4321 (buf!4779 (_1!8656 lt!285153)))))))

(assert (= (and d!63983 res!154288) b!185385))

(assert (= (and b!185385 res!154289) b!185386))

(declare-fun m!288185 () Bool)

(assert (=> d!63983 m!288185))

(declare-fun m!288187 () Bool)

(assert (=> d!63983 m!288187))

(assert (=> b!185102 d!63983))

(declare-fun lt!285828 () (_ BitVec 64))

(declare-fun b!185397 () Bool)

(declare-fun lt!285845 () (_ BitVec 64))

(declare-fun e!128355 () Bool)

(declare-fun lt!285841 () tuple2!16018)

(assert (=> b!185397 (= e!128355 (= (_1!8654 lt!285841) (withMovedBitIndex!0 (_2!8654 lt!285841) (bvsub lt!285845 lt!285828))))))

(assert (=> b!185397 (or (= (bvand lt!285845 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!285828 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!285845 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!285845 lt!285828) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!185397 (= lt!285828 (bitIndex!0 (size!4321 (buf!4779 (_2!8653 lt!285163))) (currentByte!9019 (_2!8653 lt!285163)) (currentBit!9014 (_2!8653 lt!285163))))))

(assert (=> b!185397 (= lt!285845 (bitIndex!0 (size!4321 (buf!4779 (_2!8653 lt!285168))) (currentByte!9019 (_2!8653 lt!285168)) (currentBit!9014 (_2!8653 lt!285168))))))

(declare-fun b!185398 () Bool)

(declare-fun res!154296 () Bool)

(assert (=> b!185398 (=> (not res!154296) (not e!128355))))

(assert (=> b!185398 (= res!154296 (isPrefixOf!0 (_2!8654 lt!285841) (_2!8653 lt!285163)))))

(declare-fun b!185399 () Bool)

(declare-fun e!128356 () Unit!13256)

(declare-fun lt!285831 () Unit!13256)

(assert (=> b!185399 (= e!128356 lt!285831)))

(declare-fun lt!285843 () (_ BitVec 64))

(assert (=> b!185399 (= lt!285843 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!285844 () (_ BitVec 64))

(assert (=> b!185399 (= lt!285844 (bitIndex!0 (size!4321 (buf!4779 (_2!8653 lt!285168))) (currentByte!9019 (_2!8653 lt!285168)) (currentBit!9014 (_2!8653 lt!285168))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!9797 array!9797 (_ BitVec 64) (_ BitVec 64)) Unit!13256)

(assert (=> b!185399 (= lt!285831 (arrayBitRangesEqSymmetric!0 (buf!4779 (_2!8653 lt!285168)) (buf!4779 (_2!8653 lt!285163)) lt!285843 lt!285844))))

(assert (=> b!185399 (arrayBitRangesEq!0 (buf!4779 (_2!8653 lt!285163)) (buf!4779 (_2!8653 lt!285168)) lt!285843 lt!285844)))

(declare-fun d!63985 () Bool)

(assert (=> d!63985 e!128355))

(declare-fun res!154298 () Bool)

(assert (=> d!63985 (=> (not res!154298) (not e!128355))))

(assert (=> d!63985 (= res!154298 (isPrefixOf!0 (_1!8654 lt!285841) (_2!8654 lt!285841)))))

(declare-fun lt!285842 () BitStream!7750)

(assert (=> d!63985 (= lt!285841 (tuple2!16019 lt!285842 (_2!8653 lt!285163)))))

(declare-fun lt!285838 () Unit!13256)

(declare-fun lt!285835 () Unit!13256)

(assert (=> d!63985 (= lt!285838 lt!285835)))

(assert (=> d!63985 (isPrefixOf!0 lt!285842 (_2!8653 lt!285163))))

(assert (=> d!63985 (= lt!285835 (lemmaIsPrefixTransitive!0 lt!285842 (_2!8653 lt!285163) (_2!8653 lt!285163)))))

(declare-fun lt!285839 () Unit!13256)

(declare-fun lt!285846 () Unit!13256)

(assert (=> d!63985 (= lt!285839 lt!285846)))

(assert (=> d!63985 (isPrefixOf!0 lt!285842 (_2!8653 lt!285163))))

(assert (=> d!63985 (= lt!285846 (lemmaIsPrefixTransitive!0 lt!285842 (_2!8653 lt!285168) (_2!8653 lt!285163)))))

(declare-fun lt!285836 () Unit!13256)

(assert (=> d!63985 (= lt!285836 e!128356)))

(declare-fun c!9469 () Bool)

(assert (=> d!63985 (= c!9469 (not (= (size!4321 (buf!4779 (_2!8653 lt!285168))) #b00000000000000000000000000000000)))))

(declare-fun lt!285832 () Unit!13256)

(declare-fun lt!285827 () Unit!13256)

(assert (=> d!63985 (= lt!285832 lt!285827)))

(assert (=> d!63985 (isPrefixOf!0 (_2!8653 lt!285163) (_2!8653 lt!285163))))

(assert (=> d!63985 (= lt!285827 (lemmaIsPrefixRefl!0 (_2!8653 lt!285163)))))

(declare-fun lt!285837 () Unit!13256)

(declare-fun lt!285840 () Unit!13256)

(assert (=> d!63985 (= lt!285837 lt!285840)))

(assert (=> d!63985 (= lt!285840 (lemmaIsPrefixRefl!0 (_2!8653 lt!285163)))))

(declare-fun lt!285833 () Unit!13256)

(declare-fun lt!285834 () Unit!13256)

(assert (=> d!63985 (= lt!285833 lt!285834)))

(assert (=> d!63985 (isPrefixOf!0 lt!285842 lt!285842)))

(assert (=> d!63985 (= lt!285834 (lemmaIsPrefixRefl!0 lt!285842))))

(declare-fun lt!285829 () Unit!13256)

(declare-fun lt!285830 () Unit!13256)

(assert (=> d!63985 (= lt!285829 lt!285830)))

(assert (=> d!63985 (isPrefixOf!0 (_2!8653 lt!285168) (_2!8653 lt!285168))))

(assert (=> d!63985 (= lt!285830 (lemmaIsPrefixRefl!0 (_2!8653 lt!285168)))))

(assert (=> d!63985 (= lt!285842 (BitStream!7751 (buf!4779 (_2!8653 lt!285163)) (currentByte!9019 (_2!8653 lt!285168)) (currentBit!9014 (_2!8653 lt!285168))))))

(assert (=> d!63985 (isPrefixOf!0 (_2!8653 lt!285168) (_2!8653 lt!285163))))

(assert (=> d!63985 (= (reader!0 (_2!8653 lt!285168) (_2!8653 lt!285163)) lt!285841)))

(declare-fun b!185400 () Bool)

(declare-fun Unit!13273 () Unit!13256)

(assert (=> b!185400 (= e!128356 Unit!13273)))

(declare-fun b!185401 () Bool)

(declare-fun res!154297 () Bool)

(assert (=> b!185401 (=> (not res!154297) (not e!128355))))

(assert (=> b!185401 (= res!154297 (isPrefixOf!0 (_1!8654 lt!285841) (_2!8653 lt!285168)))))

(assert (= (and d!63985 c!9469) b!185399))

(assert (= (and d!63985 (not c!9469)) b!185400))

(assert (= (and d!63985 res!154298) b!185401))

(assert (= (and b!185401 res!154297) b!185398))

(assert (= (and b!185398 res!154296) b!185397))

(declare-fun m!288189 () Bool)

(assert (=> b!185401 m!288189))

(assert (=> b!185399 m!287727))

(declare-fun m!288191 () Bool)

(assert (=> b!185399 m!288191))

(declare-fun m!288193 () Bool)

(assert (=> b!185399 m!288193))

(declare-fun m!288195 () Bool)

(assert (=> d!63985 m!288195))

(declare-fun m!288197 () Bool)

(assert (=> d!63985 m!288197))

(assert (=> d!63985 m!287713))

(declare-fun m!288199 () Bool)

(assert (=> d!63985 m!288199))

(declare-fun m!288201 () Bool)

(assert (=> d!63985 m!288201))

(declare-fun m!288203 () Bool)

(assert (=> d!63985 m!288203))

(declare-fun m!288205 () Bool)

(assert (=> d!63985 m!288205))

(declare-fun m!288207 () Bool)

(assert (=> d!63985 m!288207))

(declare-fun m!288209 () Bool)

(assert (=> d!63985 m!288209))

(assert (=> d!63985 m!288163))

(declare-fun m!288211 () Bool)

(assert (=> d!63985 m!288211))

(declare-fun m!288213 () Bool)

(assert (=> b!185398 m!288213))

(declare-fun m!288215 () Bool)

(assert (=> b!185397 m!288215))

(assert (=> b!185397 m!287719))

(assert (=> b!185397 m!287727))

(assert (=> b!185102 d!63985))

(declare-fun lt!285847 () tuple2!16040)

(declare-fun d!63987 () Bool)

(assert (=> d!63987 (= lt!285847 (readNBitsLSBFirstsLoop!0 (_1!8654 lt!285151) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!285172))))

(assert (=> d!63987 (= (readNBitsLSBFirstsLoopPure!0 (_1!8654 lt!285151) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!285172) (tuple2!16021 (_2!8665 lt!285847) (_1!8665 lt!285847)))))

(declare-fun bs!15927 () Bool)

(assert (= bs!15927 d!63987))

(declare-fun m!288217 () Bool)

(assert (=> bs!15927 m!288217))

(assert (=> b!185102 d!63987))

(declare-fun d!63989 () Bool)

(assert (=> d!63989 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4321 (buf!4779 (_2!8653 lt!285163)))) ((_ sign_extend 32) (currentByte!9019 thiss!1204)) ((_ sign_extend 32) (currentBit!9014 thiss!1204)) lt!285164) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4321 (buf!4779 (_2!8653 lt!285163)))) ((_ sign_extend 32) (currentByte!9019 thiss!1204)) ((_ sign_extend 32) (currentBit!9014 thiss!1204))) lt!285164))))

(declare-fun bs!15928 () Bool)

(assert (= bs!15928 d!63989))

(declare-fun m!288219 () Bool)

(assert (=> bs!15928 m!288219))

(assert (=> b!185102 d!63989))

(declare-fun d!63991 () Bool)

(declare-fun e!128357 () Bool)

(assert (=> d!63991 e!128357))

(declare-fun res!154299 () Bool)

(assert (=> d!63991 (=> (not res!154299) (not e!128357))))

(declare-fun lt!285853 () (_ BitVec 64))

(declare-fun lt!285851 () (_ BitVec 64))

(declare-fun lt!285849 () (_ BitVec 64))

(assert (=> d!63991 (= res!154299 (= lt!285849 (bvsub lt!285851 lt!285853)))))

(assert (=> d!63991 (or (= (bvand lt!285851 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!285853 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!285851 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!285851 lt!285853) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63991 (= lt!285853 (remainingBits!0 ((_ sign_extend 32) (size!4321 (buf!4779 (_1!8656 lt!285156)))) ((_ sign_extend 32) (currentByte!9019 (_1!8656 lt!285156))) ((_ sign_extend 32) (currentBit!9014 (_1!8656 lt!285156)))))))

(declare-fun lt!285848 () (_ BitVec 64))

(declare-fun lt!285850 () (_ BitVec 64))

(assert (=> d!63991 (= lt!285851 (bvmul lt!285848 lt!285850))))

(assert (=> d!63991 (or (= lt!285848 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!285850 (bvsdiv (bvmul lt!285848 lt!285850) lt!285848)))))

(assert (=> d!63991 (= lt!285850 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!63991 (= lt!285848 ((_ sign_extend 32) (size!4321 (buf!4779 (_1!8656 lt!285156)))))))

(assert (=> d!63991 (= lt!285849 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9019 (_1!8656 lt!285156))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9014 (_1!8656 lt!285156)))))))

(assert (=> d!63991 (invariant!0 (currentBit!9014 (_1!8656 lt!285156)) (currentByte!9019 (_1!8656 lt!285156)) (size!4321 (buf!4779 (_1!8656 lt!285156))))))

(assert (=> d!63991 (= (bitIndex!0 (size!4321 (buf!4779 (_1!8656 lt!285156))) (currentByte!9019 (_1!8656 lt!285156)) (currentBit!9014 (_1!8656 lt!285156))) lt!285849)))

(declare-fun b!185402 () Bool)

(declare-fun res!154300 () Bool)

(assert (=> b!185402 (=> (not res!154300) (not e!128357))))

(assert (=> b!185402 (= res!154300 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!285849))))

(declare-fun b!185403 () Bool)

(declare-fun lt!285852 () (_ BitVec 64))

(assert (=> b!185403 (= e!128357 (bvsle lt!285849 (bvmul lt!285852 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!185403 (or (= lt!285852 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!285852 #b0000000000000000000000000000000000000000000000000000000000001000) lt!285852)))))

(assert (=> b!185403 (= lt!285852 ((_ sign_extend 32) (size!4321 (buf!4779 (_1!8656 lt!285156)))))))

(assert (= (and d!63991 res!154299) b!185402))

(assert (= (and b!185402 res!154300) b!185403))

(declare-fun m!288221 () Bool)

(assert (=> d!63991 m!288221))

(declare-fun m!288223 () Bool)

(assert (=> d!63991 m!288223))

(assert (=> b!185102 d!63991))

(declare-fun d!63993 () Bool)

(declare-fun lt!285854 () tuple2!16040)

(assert (=> d!63993 (= lt!285854 (readNBitsLSBFirstsLoop!0 (_1!8654 lt!285148) nBits!348 i!590 lt!285166))))

(assert (=> d!63993 (= (readNBitsLSBFirstsLoopPure!0 (_1!8654 lt!285148) nBits!348 i!590 lt!285166) (tuple2!16021 (_2!8665 lt!285854) (_1!8665 lt!285854)))))

(declare-fun bs!15929 () Bool)

(assert (= bs!15929 d!63993))

(declare-fun m!288225 () Bool)

(assert (=> bs!15929 m!288225))

(assert (=> b!185102 d!63993))

(declare-fun d!63995 () Bool)

(assert (=> d!63995 (validate_offset_bits!1 ((_ sign_extend 32) (size!4321 (buf!4779 (_2!8653 lt!285163)))) ((_ sign_extend 32) (currentByte!9019 (_2!8653 lt!285168))) ((_ sign_extend 32) (currentBit!9014 (_2!8653 lt!285168))) lt!285157)))

(declare-fun lt!285857 () Unit!13256)

(declare-fun choose!9 (BitStream!7750 array!9797 (_ BitVec 64) BitStream!7750) Unit!13256)

(assert (=> d!63995 (= lt!285857 (choose!9 (_2!8653 lt!285168) (buf!4779 (_2!8653 lt!285163)) lt!285157 (BitStream!7751 (buf!4779 (_2!8653 lt!285163)) (currentByte!9019 (_2!8653 lt!285168)) (currentBit!9014 (_2!8653 lt!285168)))))))

(assert (=> d!63995 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8653 lt!285168) (buf!4779 (_2!8653 lt!285163)) lt!285157) lt!285857)))

(declare-fun bs!15930 () Bool)

(assert (= bs!15930 d!63995))

(assert (=> bs!15930 m!287691))

(declare-fun m!288227 () Bool)

(assert (=> bs!15930 m!288227))

(assert (=> b!185102 d!63995))

(declare-fun d!63997 () Bool)

(declare-fun lt!285858 () tuple2!16042)

(assert (=> d!63997 (= lt!285858 (readBit!0 lt!285160))))

(assert (=> d!63997 (= (readBitPure!0 lt!285160) (tuple2!16023 (_2!8666 lt!285858) (_1!8666 lt!285858)))))

(declare-fun bs!15931 () Bool)

(assert (= bs!15931 d!63997))

(declare-fun m!288229 () Bool)

(assert (=> bs!15931 m!288229))

(assert (=> b!185102 d!63997))

(declare-fun d!63999 () Bool)

(assert (=> d!63999 (validate_offset_bits!1 ((_ sign_extend 32) (size!4321 (buf!4779 (_2!8653 lt!285163)))) ((_ sign_extend 32) (currentByte!9019 thiss!1204)) ((_ sign_extend 32) (currentBit!9014 thiss!1204)) lt!285164)))

(declare-fun lt!285859 () Unit!13256)

(assert (=> d!63999 (= lt!285859 (choose!9 thiss!1204 (buf!4779 (_2!8653 lt!285163)) lt!285164 (BitStream!7751 (buf!4779 (_2!8653 lt!285163)) (currentByte!9019 thiss!1204) (currentBit!9014 thiss!1204))))))

(assert (=> d!63999 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4779 (_2!8653 lt!285163)) lt!285164) lt!285859)))

(declare-fun bs!15932 () Bool)

(assert (= bs!15932 d!63999))

(assert (=> bs!15932 m!287703))

(declare-fun m!288231 () Bool)

(assert (=> bs!15932 m!288231))

(assert (=> b!185102 d!63999))

(declare-fun d!64001 () Bool)

(declare-fun lt!285860 () tuple2!16042)

(assert (=> d!64001 (= lt!285860 (readBit!0 (_1!8654 lt!285148)))))

(assert (=> d!64001 (= (readBitPure!0 (_1!8654 lt!285148)) (tuple2!16023 (_2!8666 lt!285860) (_1!8666 lt!285860)))))

(declare-fun bs!15933 () Bool)

(assert (= bs!15933 d!64001))

(declare-fun m!288233 () Bool)

(assert (=> bs!15933 m!288233))

(assert (=> b!185102 d!64001))

(declare-fun e!128358 () Bool)

(declare-fun lt!285862 () (_ BitVec 64))

(declare-fun lt!285875 () tuple2!16018)

(declare-fun b!185404 () Bool)

(declare-fun lt!285879 () (_ BitVec 64))

(assert (=> b!185404 (= e!128358 (= (_1!8654 lt!285875) (withMovedBitIndex!0 (_2!8654 lt!285875) (bvsub lt!285879 lt!285862))))))

(assert (=> b!185404 (or (= (bvand lt!285879 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!285862 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!285879 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!285879 lt!285862) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!185404 (= lt!285862 (bitIndex!0 (size!4321 (buf!4779 (_2!8653 lt!285163))) (currentByte!9019 (_2!8653 lt!285163)) (currentBit!9014 (_2!8653 lt!285163))))))

(assert (=> b!185404 (= lt!285879 (bitIndex!0 (size!4321 (buf!4779 thiss!1204)) (currentByte!9019 thiss!1204) (currentBit!9014 thiss!1204)))))

(declare-fun b!185405 () Bool)

(declare-fun res!154301 () Bool)

(assert (=> b!185405 (=> (not res!154301) (not e!128358))))

(assert (=> b!185405 (= res!154301 (isPrefixOf!0 (_2!8654 lt!285875) (_2!8653 lt!285163)))))

(declare-fun b!185406 () Bool)

(declare-fun e!128359 () Unit!13256)

(declare-fun lt!285865 () Unit!13256)

(assert (=> b!185406 (= e!128359 lt!285865)))

(declare-fun lt!285877 () (_ BitVec 64))

(assert (=> b!185406 (= lt!285877 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!285878 () (_ BitVec 64))

(assert (=> b!185406 (= lt!285878 (bitIndex!0 (size!4321 (buf!4779 thiss!1204)) (currentByte!9019 thiss!1204) (currentBit!9014 thiss!1204)))))

(assert (=> b!185406 (= lt!285865 (arrayBitRangesEqSymmetric!0 (buf!4779 thiss!1204) (buf!4779 (_2!8653 lt!285163)) lt!285877 lt!285878))))

(assert (=> b!185406 (arrayBitRangesEq!0 (buf!4779 (_2!8653 lt!285163)) (buf!4779 thiss!1204) lt!285877 lt!285878)))

(declare-fun d!64003 () Bool)

(assert (=> d!64003 e!128358))

(declare-fun res!154303 () Bool)

(assert (=> d!64003 (=> (not res!154303) (not e!128358))))

(assert (=> d!64003 (= res!154303 (isPrefixOf!0 (_1!8654 lt!285875) (_2!8654 lt!285875)))))

(declare-fun lt!285876 () BitStream!7750)

(assert (=> d!64003 (= lt!285875 (tuple2!16019 lt!285876 (_2!8653 lt!285163)))))

(declare-fun lt!285872 () Unit!13256)

(declare-fun lt!285869 () Unit!13256)

(assert (=> d!64003 (= lt!285872 lt!285869)))

(assert (=> d!64003 (isPrefixOf!0 lt!285876 (_2!8653 lt!285163))))

(assert (=> d!64003 (= lt!285869 (lemmaIsPrefixTransitive!0 lt!285876 (_2!8653 lt!285163) (_2!8653 lt!285163)))))

(declare-fun lt!285873 () Unit!13256)

(declare-fun lt!285880 () Unit!13256)

(assert (=> d!64003 (= lt!285873 lt!285880)))

(assert (=> d!64003 (isPrefixOf!0 lt!285876 (_2!8653 lt!285163))))

(assert (=> d!64003 (= lt!285880 (lemmaIsPrefixTransitive!0 lt!285876 thiss!1204 (_2!8653 lt!285163)))))

(declare-fun lt!285870 () Unit!13256)

(assert (=> d!64003 (= lt!285870 e!128359)))

(declare-fun c!9470 () Bool)

(assert (=> d!64003 (= c!9470 (not (= (size!4321 (buf!4779 thiss!1204)) #b00000000000000000000000000000000)))))

(declare-fun lt!285866 () Unit!13256)

(declare-fun lt!285861 () Unit!13256)

(assert (=> d!64003 (= lt!285866 lt!285861)))

(assert (=> d!64003 (isPrefixOf!0 (_2!8653 lt!285163) (_2!8653 lt!285163))))

(assert (=> d!64003 (= lt!285861 (lemmaIsPrefixRefl!0 (_2!8653 lt!285163)))))

(declare-fun lt!285871 () Unit!13256)

(declare-fun lt!285874 () Unit!13256)

(assert (=> d!64003 (= lt!285871 lt!285874)))

(assert (=> d!64003 (= lt!285874 (lemmaIsPrefixRefl!0 (_2!8653 lt!285163)))))

(declare-fun lt!285867 () Unit!13256)

(declare-fun lt!285868 () Unit!13256)

(assert (=> d!64003 (= lt!285867 lt!285868)))

(assert (=> d!64003 (isPrefixOf!0 lt!285876 lt!285876)))

(assert (=> d!64003 (= lt!285868 (lemmaIsPrefixRefl!0 lt!285876))))

(declare-fun lt!285863 () Unit!13256)

(declare-fun lt!285864 () Unit!13256)

(assert (=> d!64003 (= lt!285863 lt!285864)))

(assert (=> d!64003 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!64003 (= lt!285864 (lemmaIsPrefixRefl!0 thiss!1204))))

(assert (=> d!64003 (= lt!285876 (BitStream!7751 (buf!4779 (_2!8653 lt!285163)) (currentByte!9019 thiss!1204) (currentBit!9014 thiss!1204)))))

(assert (=> d!64003 (isPrefixOf!0 thiss!1204 (_2!8653 lt!285163))))

(assert (=> d!64003 (= (reader!0 thiss!1204 (_2!8653 lt!285163)) lt!285875)))

(declare-fun b!185407 () Bool)

(declare-fun Unit!13274 () Unit!13256)

(assert (=> b!185407 (= e!128359 Unit!13274)))

(declare-fun b!185408 () Bool)

(declare-fun res!154302 () Bool)

(assert (=> b!185408 (=> (not res!154302) (not e!128358))))

(assert (=> b!185408 (= res!154302 (isPrefixOf!0 (_1!8654 lt!285875) thiss!1204))))

(assert (= (and d!64003 c!9470) b!185406))

(assert (= (and d!64003 (not c!9470)) b!185407))

(assert (= (and d!64003 res!154303) b!185408))

(assert (= (and b!185408 res!154302) b!185405))

(assert (= (and b!185405 res!154301) b!185404))

(declare-fun m!288235 () Bool)

(assert (=> b!185408 m!288235))

(assert (=> b!185406 m!287729))

(declare-fun m!288237 () Bool)

(assert (=> b!185406 m!288237))

(declare-fun m!288239 () Bool)

(assert (=> b!185406 m!288239))

(assert (=> d!64003 m!288195))

(declare-fun m!288241 () Bool)

(assert (=> d!64003 m!288241))

(assert (=> d!64003 m!287721))

(assert (=> d!64003 m!288199))

(declare-fun m!288243 () Bool)

(assert (=> d!64003 m!288243))

(declare-fun m!288245 () Bool)

(assert (=> d!64003 m!288245))

(declare-fun m!288247 () Bool)

(assert (=> d!64003 m!288247))

(declare-fun m!288249 () Bool)

(assert (=> d!64003 m!288249))

(declare-fun m!288251 () Bool)

(assert (=> d!64003 m!288251))

(declare-fun m!288253 () Bool)

(assert (=> d!64003 m!288253))

(declare-fun m!288255 () Bool)

(assert (=> d!64003 m!288255))

(declare-fun m!288257 () Bool)

(assert (=> b!185405 m!288257))

(declare-fun m!288259 () Bool)

(assert (=> b!185404 m!288259))

(assert (=> b!185404 m!287719))

(assert (=> b!185404 m!287729))

(assert (=> b!185102 d!64003))

(declare-fun d!64005 () Bool)

(assert (=> d!64005 (= (invariant!0 (currentBit!9014 thiss!1204) (currentByte!9019 thiss!1204) (size!4321 (buf!4779 (_2!8653 lt!285168)))) (and (bvsge (currentBit!9014 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9014 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9019 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9019 thiss!1204) (size!4321 (buf!4779 (_2!8653 lt!285168)))) (and (= (currentBit!9014 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9019 thiss!1204) (size!4321 (buf!4779 (_2!8653 lt!285168))))))))))

(assert (=> b!185102 d!64005))

(declare-fun d!64007 () Bool)

(declare-fun lt!285881 () tuple2!16042)

(assert (=> d!64007 (= lt!285881 (readBit!0 (readerFrom!0 (_2!8653 lt!285168) (currentBit!9014 thiss!1204) (currentByte!9019 thiss!1204))))))

(assert (=> d!64007 (= (readBitPure!0 (readerFrom!0 (_2!8653 lt!285168) (currentBit!9014 thiss!1204) (currentByte!9019 thiss!1204))) (tuple2!16023 (_2!8666 lt!285881) (_1!8666 lt!285881)))))

(declare-fun bs!15934 () Bool)

(assert (= bs!15934 d!64007))

(assert (=> bs!15934 m!287715))

(declare-fun m!288261 () Bool)

(assert (=> bs!15934 m!288261))

(assert (=> b!185114 d!64007))

(declare-fun d!64009 () Bool)

(declare-fun e!128362 () Bool)

(assert (=> d!64009 e!128362))

(declare-fun res!154307 () Bool)

(assert (=> d!64009 (=> (not res!154307) (not e!128362))))

(assert (=> d!64009 (= res!154307 (invariant!0 (currentBit!9014 (_2!8653 lt!285168)) (currentByte!9019 (_2!8653 lt!285168)) (size!4321 (buf!4779 (_2!8653 lt!285168)))))))

(assert (=> d!64009 (= (readerFrom!0 (_2!8653 lt!285168) (currentBit!9014 thiss!1204) (currentByte!9019 thiss!1204)) (BitStream!7751 (buf!4779 (_2!8653 lt!285168)) (currentByte!9019 thiss!1204) (currentBit!9014 thiss!1204)))))

(declare-fun b!185411 () Bool)

(assert (=> b!185411 (= e!128362 (invariant!0 (currentBit!9014 thiss!1204) (currentByte!9019 thiss!1204) (size!4321 (buf!4779 (_2!8653 lt!285168)))))))

(assert (= (and d!64009 res!154307) b!185411))

(assert (=> d!64009 m!287733))

(assert (=> b!185411 m!287695))

(assert (=> b!185114 d!64009))

(declare-fun d!64011 () Bool)

(declare-fun res!154310 () Bool)

(declare-fun e!128364 () Bool)

(assert (=> d!64011 (=> (not res!154310) (not e!128364))))

(assert (=> d!64011 (= res!154310 (= (size!4321 (buf!4779 (_2!8653 lt!285168))) (size!4321 (buf!4779 (_2!8653 lt!285163)))))))

(assert (=> d!64011 (= (isPrefixOf!0 (_2!8653 lt!285168) (_2!8653 lt!285163)) e!128364)))

(declare-fun b!185412 () Bool)

(declare-fun res!154308 () Bool)

(assert (=> b!185412 (=> (not res!154308) (not e!128364))))

(assert (=> b!185412 (= res!154308 (bvsle (bitIndex!0 (size!4321 (buf!4779 (_2!8653 lt!285168))) (currentByte!9019 (_2!8653 lt!285168)) (currentBit!9014 (_2!8653 lt!285168))) (bitIndex!0 (size!4321 (buf!4779 (_2!8653 lt!285163))) (currentByte!9019 (_2!8653 lt!285163)) (currentBit!9014 (_2!8653 lt!285163)))))))

(declare-fun b!185413 () Bool)

(declare-fun e!128363 () Bool)

(assert (=> b!185413 (= e!128364 e!128363)))

(declare-fun res!154309 () Bool)

(assert (=> b!185413 (=> res!154309 e!128363)))

(assert (=> b!185413 (= res!154309 (= (size!4321 (buf!4779 (_2!8653 lt!285168))) #b00000000000000000000000000000000))))

(declare-fun b!185414 () Bool)

(assert (=> b!185414 (= e!128363 (arrayBitRangesEq!0 (buf!4779 (_2!8653 lt!285168)) (buf!4779 (_2!8653 lt!285163)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4321 (buf!4779 (_2!8653 lt!285168))) (currentByte!9019 (_2!8653 lt!285168)) (currentBit!9014 (_2!8653 lt!285168)))))))

(assert (= (and d!64011 res!154310) b!185412))

(assert (= (and b!185412 res!154308) b!185413))

(assert (= (and b!185413 (not res!154309)) b!185414))

(assert (=> b!185412 m!287727))

(assert (=> b!185412 m!287719))

(assert (=> b!185414 m!287727))

(assert (=> b!185414 m!287727))

(declare-fun m!288263 () Bool)

(assert (=> b!185414 m!288263))

(assert (=> b!185103 d!64011))

(assert (=> b!185115 d!63973))

(declare-fun d!64013 () Bool)

(assert (=> d!64013 (= (invariant!0 (currentBit!9014 thiss!1204) (currentByte!9019 thiss!1204) (size!4321 (buf!4779 thiss!1204))) (and (bvsge (currentBit!9014 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9014 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9019 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9019 thiss!1204) (size!4321 (buf!4779 thiss!1204))) (and (= (currentBit!9014 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9019 thiss!1204) (size!4321 (buf!4779 thiss!1204)))))))))

(assert (=> b!185116 d!64013))

(assert (=> b!185105 d!63965))

(assert (=> b!185105 d!63967))

(declare-fun d!64015 () Bool)

(declare-fun e!128369 () Bool)

(assert (=> d!64015 e!128369))

(declare-fun res!154320 () Bool)

(assert (=> d!64015 (=> (not res!154320) (not e!128369))))

(declare-fun lt!285892 () tuple2!16016)

(assert (=> d!64015 (= res!154320 (= (size!4321 (buf!4779 thiss!1204)) (size!4321 (buf!4779 (_2!8653 lt!285892)))))))

(declare-fun choose!16 (BitStream!7750 Bool) tuple2!16016)

(assert (=> d!64015 (= lt!285892 (choose!16 thiss!1204 lt!285155))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!64015 (validate_offset_bit!0 ((_ sign_extend 32) (size!4321 (buf!4779 thiss!1204))) ((_ sign_extend 32) (currentByte!9019 thiss!1204)) ((_ sign_extend 32) (currentBit!9014 thiss!1204)))))

(assert (=> d!64015 (= (appendBit!0 thiss!1204 lt!285155) lt!285892)))

(declare-fun b!185424 () Bool)

(declare-fun res!154321 () Bool)

(assert (=> b!185424 (=> (not res!154321) (not e!128369))))

(declare-fun lt!285890 () (_ BitVec 64))

(declare-fun lt!285893 () (_ BitVec 64))

(assert (=> b!185424 (= res!154321 (= (bitIndex!0 (size!4321 (buf!4779 (_2!8653 lt!285892))) (currentByte!9019 (_2!8653 lt!285892)) (currentBit!9014 (_2!8653 lt!285892))) (bvadd lt!285893 lt!285890)))))

(assert (=> b!185424 (or (not (= (bvand lt!285893 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!285890 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!285893 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!285893 lt!285890) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!185424 (= lt!285890 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!185424 (= lt!285893 (bitIndex!0 (size!4321 (buf!4779 thiss!1204)) (currentByte!9019 thiss!1204) (currentBit!9014 thiss!1204)))))

(declare-fun b!185425 () Bool)

(declare-fun res!154319 () Bool)

(assert (=> b!185425 (=> (not res!154319) (not e!128369))))

(assert (=> b!185425 (= res!154319 (isPrefixOf!0 thiss!1204 (_2!8653 lt!285892)))))

(declare-fun b!185426 () Bool)

(declare-fun e!128370 () Bool)

(assert (=> b!185426 (= e!128369 e!128370)))

(declare-fun res!154322 () Bool)

(assert (=> b!185426 (=> (not res!154322) (not e!128370))))

(declare-fun lt!285891 () tuple2!16022)

(assert (=> b!185426 (= res!154322 (and (= (_2!8656 lt!285891) lt!285155) (= (_1!8656 lt!285891) (_2!8653 lt!285892))))))

(assert (=> b!185426 (= lt!285891 (readBitPure!0 (readerFrom!0 (_2!8653 lt!285892) (currentBit!9014 thiss!1204) (currentByte!9019 thiss!1204))))))

(declare-fun b!185427 () Bool)

(assert (=> b!185427 (= e!128370 (= (bitIndex!0 (size!4321 (buf!4779 (_1!8656 lt!285891))) (currentByte!9019 (_1!8656 lt!285891)) (currentBit!9014 (_1!8656 lt!285891))) (bitIndex!0 (size!4321 (buf!4779 (_2!8653 lt!285892))) (currentByte!9019 (_2!8653 lt!285892)) (currentBit!9014 (_2!8653 lt!285892)))))))

(assert (= (and d!64015 res!154320) b!185424))

(assert (= (and b!185424 res!154321) b!185425))

(assert (= (and b!185425 res!154319) b!185426))

(assert (= (and b!185426 res!154322) b!185427))

(declare-fun m!288265 () Bool)

(assert (=> d!64015 m!288265))

(declare-fun m!288267 () Bool)

(assert (=> d!64015 m!288267))

(declare-fun m!288269 () Bool)

(assert (=> b!185425 m!288269))

(declare-fun m!288271 () Bool)

(assert (=> b!185427 m!288271))

(declare-fun m!288273 () Bool)

(assert (=> b!185427 m!288273))

(assert (=> b!185424 m!288273))

(assert (=> b!185424 m!287729))

(declare-fun m!288275 () Bool)

(assert (=> b!185426 m!288275))

(assert (=> b!185426 m!288275))

(declare-fun m!288277 () Bool)

(assert (=> b!185426 m!288277))

(assert (=> b!185105 d!64015))

(declare-fun d!64017 () Bool)

(assert (=> d!64017 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4321 (buf!4779 thiss!1204))) ((_ sign_extend 32) (currentByte!9019 thiss!1204)) ((_ sign_extend 32) (currentBit!9014 thiss!1204)) lt!285164) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4321 (buf!4779 thiss!1204))) ((_ sign_extend 32) (currentByte!9019 thiss!1204)) ((_ sign_extend 32) (currentBit!9014 thiss!1204))) lt!285164))))

(declare-fun bs!15935 () Bool)

(assert (= bs!15935 d!64017))

(assert (=> bs!15935 m!288167))

(assert (=> b!185106 d!64017))

(push 1)

(assert (not b!185425))

(assert (not d!63865))

(assert (not d!63991))

(assert (not d!64007))

(assert (not d!63881))

(assert (not b!185371))

(assert (not bm!2981))

(assert (not d!63997))

(assert (not b!185411))

(assert (not d!63999))

(assert (not d!63989))

(assert (not d!64017))

(assert (not d!63871))

(assert (not b!185364))

(assert (not b!185369))

(assert (not b!185405))

(assert (not b!185424))

(assert (not b!185426))

(assert (not d!63887))

(assert (not d!63985))

(assert (not d!64003))

(assert (not b!185365))

(assert (not d!63983))

(assert (not b!185408))

(assert (not b!185361))

(assert (not d!63885))

(assert (not b!185397))

(assert (not b!185381))

(assert (not b!185401))

(assert (not b!185414))

(assert (not b!185374))

(assert (not b!185412))

(assert (not d!64001))

(assert (not b!185362))

(assert (not d!63965))

(assert (not b!185398))

(assert (not d!64009))

(assert (not b!185367))

(assert (not d!63879))

(assert (not b!185406))

(assert (not b!185379))

(assert (not d!64015))

(assert (not d!63875))

(assert (not d!63873))

(assert (not b!185404))

(assert (not d!63981))

(assert (not b!185253))

(assert (not b!185368))

(assert (not d!63977))

(assert (not d!63969))

(assert (not b!185399))

(assert (not b!185370))

(assert (not d!63975))

(assert (not d!63987))

(assert (not d!63995))

(assert (not b!185251))

(assert (not b!185427))

(assert (not d!63993))

(assert (not d!63967))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

