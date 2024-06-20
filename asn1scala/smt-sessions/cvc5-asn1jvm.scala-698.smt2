; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19578 () Bool)

(assert start!19578)

(declare-fun res!80216 () Bool)

(declare-fun e!64017 () Bool)

(assert (=> start!19578 (=> (not res!80216) (not e!64017))))

(declare-fun nBits!388 () (_ BitVec 32))

(assert (=> start!19578 (= res!80216 (and (bvsge nBits!388 #b00000000000000000000000000000000) (bvsle nBits!388 #b00000000000000000000000001000000)))))

(assert (=> start!19578 e!64017))

(assert (=> start!19578 true))

(declare-datatypes ((array!4582 0))(
  ( (array!4583 (arr!2688 (Array (_ BitVec 32) (_ BitVec 8))) (size!2095 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3664 0))(
  ( (BitStream!3665 (buf!2443 array!4582) (currentByte!4864 (_ BitVec 32)) (currentBit!4859 (_ BitVec 32))) )
))
(declare-fun thiss!1288 () BitStream!3664)

(declare-fun e!64020 () Bool)

(declare-fun inv!12 (BitStream!3664) Bool)

(assert (=> start!19578 (and (inv!12 thiss!1288) e!64020)))

(declare-fun b!97754 () Bool)

(declare-fun res!80214 () Bool)

(assert (=> b!97754 (=> (not res!80214) (not e!64017))))

(declare-fun v!196 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!97754 (= res!80214 (= (bvand v!196 (onesLSBLong!0 nBits!388)) v!196))))

(declare-fun b!97755 () Bool)

(declare-fun e!64019 () Bool)

(declare-datatypes ((tuple2!7852 0))(
  ( (tuple2!7853 (_1!4178 BitStream!3664) (_2!4178 BitStream!3664)) )
))
(declare-fun lt!141363 () tuple2!7852)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!97755 (= e!64019 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!2095 (buf!2443 (_1!4178 lt!141363)))) ((_ sign_extend 32) (currentByte!4864 (_1!4178 lt!141363))) ((_ sign_extend 32) (currentBit!4859 (_1!4178 lt!141363))) ((_ sign_extend 32) nBits!388))))))

(declare-datatypes ((Unit!5960 0))(
  ( (Unit!5961) )
))
(declare-datatypes ((tuple2!7854 0))(
  ( (tuple2!7855 (_1!4179 Unit!5960) (_2!4179 BitStream!3664)) )
))
(declare-fun lt!141362 () tuple2!7854)

(assert (=> b!97755 (validate_offset_bits!1 ((_ sign_extend 32) (size!2095 (buf!2443 (_2!4179 lt!141362)))) ((_ sign_extend 32) (currentByte!4864 thiss!1288)) ((_ sign_extend 32) (currentBit!4859 thiss!1288)) ((_ sign_extend 32) nBits!388))))

(declare-fun lt!141364 () Unit!5960)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!3664 array!4582 (_ BitVec 64)) Unit!5960)

(assert (=> b!97755 (= lt!141364 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1288 (buf!2443 (_2!4179 lt!141362)) ((_ sign_extend 32) nBits!388)))))

(declare-fun reader!0 (BitStream!3664 BitStream!3664) tuple2!7852)

(assert (=> b!97755 (= lt!141363 (reader!0 thiss!1288 (_2!4179 lt!141362)))))

(declare-fun b!97756 () Bool)

(declare-fun array_inv!1897 (array!4582) Bool)

(assert (=> b!97756 (= e!64020 (array_inv!1897 (buf!2443 thiss!1288)))))

(declare-fun b!97757 () Bool)

(declare-fun res!80212 () Bool)

(assert (=> b!97757 (=> (not res!80212) (not e!64017))))

(assert (=> b!97757 (= res!80212 (validate_offset_bits!1 ((_ sign_extend 32) (size!2095 (buf!2443 thiss!1288))) ((_ sign_extend 32) (currentByte!4864 thiss!1288)) ((_ sign_extend 32) (currentBit!4859 thiss!1288)) ((_ sign_extend 32) nBits!388)))))

(declare-fun b!97758 () Bool)

(declare-fun res!80215 () Bool)

(assert (=> b!97758 (=> (not res!80215) (not e!64019))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!97758 (= res!80215 (= (bitIndex!0 (size!2095 (buf!2443 (_2!4179 lt!141362))) (currentByte!4864 (_2!4179 lt!141362)) (currentBit!4859 (_2!4179 lt!141362))) (bvadd (bitIndex!0 (size!2095 (buf!2443 thiss!1288)) (currentByte!4864 thiss!1288) (currentBit!4859 thiss!1288)) ((_ sign_extend 32) nBits!388))))))

(declare-fun b!97759 () Bool)

(assert (=> b!97759 (= e!64017 e!64019)))

(declare-fun res!80213 () Bool)

(assert (=> b!97759 (=> (not res!80213) (not e!64019))))

(assert (=> b!97759 (= res!80213 (= (size!2095 (buf!2443 thiss!1288)) (size!2095 (buf!2443 (_2!4179 lt!141362)))))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3664 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!7854)

(assert (=> b!97759 (= lt!141362 (appendNLeastSignificantBitsLoop!0 thiss!1288 v!196 nBits!388 #b00000000000000000000000000000000))))

(declare-fun b!97760 () Bool)

(declare-fun res!80211 () Bool)

(assert (=> b!97760 (=> (not res!80211) (not e!64019))))

(declare-fun isPrefixOf!0 (BitStream!3664 BitStream!3664) Bool)

(assert (=> b!97760 (= res!80211 (isPrefixOf!0 thiss!1288 (_2!4179 lt!141362)))))

(assert (= (and start!19578 res!80216) b!97757))

(assert (= (and b!97757 res!80212) b!97754))

(assert (= (and b!97754 res!80214) b!97759))

(assert (= (and b!97759 res!80213) b!97758))

(assert (= (and b!97758 res!80215) b!97760))

(assert (= (and b!97760 res!80211) b!97755))

(assert (= start!19578 b!97756))

(declare-fun m!142009 () Bool)

(assert (=> b!97754 m!142009))

(declare-fun m!142011 () Bool)

(assert (=> b!97760 m!142011))

(declare-fun m!142013 () Bool)

(assert (=> b!97756 m!142013))

(declare-fun m!142015 () Bool)

(assert (=> b!97758 m!142015))

(declare-fun m!142017 () Bool)

(assert (=> b!97758 m!142017))

(declare-fun m!142019 () Bool)

(assert (=> b!97757 m!142019))

(declare-fun m!142021 () Bool)

(assert (=> b!97755 m!142021))

(declare-fun m!142023 () Bool)

(assert (=> b!97755 m!142023))

(declare-fun m!142025 () Bool)

(assert (=> b!97755 m!142025))

(declare-fun m!142027 () Bool)

(assert (=> b!97755 m!142027))

(declare-fun m!142029 () Bool)

(assert (=> b!97759 m!142029))

(declare-fun m!142031 () Bool)

(assert (=> start!19578 m!142031))

(push 1)

(assert (not start!19578))

(assert (not b!97760))

(assert (not b!97759))

(assert (not b!97755))

(assert (not b!97758))

(assert (not b!97757))

(assert (not b!97756))

(assert (not b!97754))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!30688 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!30688 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2095 (buf!2443 thiss!1288))) ((_ sign_extend 32) (currentByte!4864 thiss!1288)) ((_ sign_extend 32) (currentBit!4859 thiss!1288)) ((_ sign_extend 32) nBits!388)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2095 (buf!2443 thiss!1288))) ((_ sign_extend 32) (currentByte!4864 thiss!1288)) ((_ sign_extend 32) (currentBit!4859 thiss!1288))) ((_ sign_extend 32) nBits!388)))))

(declare-fun bs!7514 () Bool)

(assert (= bs!7514 d!30688))

(declare-fun m!142089 () Bool)

(assert (=> bs!7514 m!142089))

(assert (=> b!97757 d!30688))

(declare-fun d!30690 () Bool)

(assert (=> d!30690 (= (array_inv!1897 (buf!2443 thiss!1288)) (bvsge (size!2095 (buf!2443 thiss!1288)) #b00000000000000000000000000000000))))

(assert (=> b!97756 d!30690))

(declare-fun d!30692 () Bool)

(assert (=> d!30692 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2095 (buf!2443 (_1!4178 lt!141363)))) ((_ sign_extend 32) (currentByte!4864 (_1!4178 lt!141363))) ((_ sign_extend 32) (currentBit!4859 (_1!4178 lt!141363))) ((_ sign_extend 32) nBits!388)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2095 (buf!2443 (_1!4178 lt!141363)))) ((_ sign_extend 32) (currentByte!4864 (_1!4178 lt!141363))) ((_ sign_extend 32) (currentBit!4859 (_1!4178 lt!141363)))) ((_ sign_extend 32) nBits!388)))))

(declare-fun bs!7515 () Bool)

(assert (= bs!7515 d!30692))

(declare-fun m!142091 () Bool)

(assert (=> bs!7515 m!142091))

(assert (=> b!97755 d!30692))

(declare-fun d!30694 () Bool)

(assert (=> d!30694 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2095 (buf!2443 (_2!4179 lt!141362)))) ((_ sign_extend 32) (currentByte!4864 thiss!1288)) ((_ sign_extend 32) (currentBit!4859 thiss!1288)) ((_ sign_extend 32) nBits!388)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2095 (buf!2443 (_2!4179 lt!141362)))) ((_ sign_extend 32) (currentByte!4864 thiss!1288)) ((_ sign_extend 32) (currentBit!4859 thiss!1288))) ((_ sign_extend 32) nBits!388)))))

(declare-fun bs!7516 () Bool)

(assert (= bs!7516 d!30694))

(declare-fun m!142093 () Bool)

(assert (=> bs!7516 m!142093))

(assert (=> b!97755 d!30694))

(declare-fun d!30696 () Bool)

(assert (=> d!30696 (validate_offset_bits!1 ((_ sign_extend 32) (size!2095 (buf!2443 (_2!4179 lt!141362)))) ((_ sign_extend 32) (currentByte!4864 thiss!1288)) ((_ sign_extend 32) (currentBit!4859 thiss!1288)) ((_ sign_extend 32) nBits!388))))

(declare-fun lt!141388 () Unit!5960)

(declare-fun choose!9 (BitStream!3664 array!4582 (_ BitVec 64) BitStream!3664) Unit!5960)

(assert (=> d!30696 (= lt!141388 (choose!9 thiss!1288 (buf!2443 (_2!4179 lt!141362)) ((_ sign_extend 32) nBits!388) (BitStream!3665 (buf!2443 (_2!4179 lt!141362)) (currentByte!4864 thiss!1288) (currentBit!4859 thiss!1288))))))

(assert (=> d!30696 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1288 (buf!2443 (_2!4179 lt!141362)) ((_ sign_extend 32) nBits!388)) lt!141388)))

(declare-fun bs!7517 () Bool)

(assert (= bs!7517 d!30696))

(assert (=> bs!7517 m!142023))

(declare-fun m!142095 () Bool)

(assert (=> bs!7517 m!142095))

(assert (=> b!97755 d!30696))

(declare-fun b!97846 () Bool)

(declare-fun res!80287 () Bool)

(declare-fun e!64068 () Bool)

(assert (=> b!97846 (=> (not res!80287) (not e!64068))))

(declare-fun lt!141520 () tuple2!7852)

(assert (=> b!97846 (= res!80287 (isPrefixOf!0 (_2!4178 lt!141520) (_2!4179 lt!141362)))))

(declare-fun b!97847 () Bool)

(declare-fun lt!141512 () (_ BitVec 64))

(declare-fun lt!141519 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!3664 (_ BitVec 64)) BitStream!3664)

(assert (=> b!97847 (= e!64068 (= (_1!4178 lt!141520) (withMovedBitIndex!0 (_2!4178 lt!141520) (bvsub lt!141519 lt!141512))))))

(assert (=> b!97847 (or (= (bvand lt!141519 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!141512 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!141519 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!141519 lt!141512) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!97847 (= lt!141512 (bitIndex!0 (size!2095 (buf!2443 (_2!4179 lt!141362))) (currentByte!4864 (_2!4179 lt!141362)) (currentBit!4859 (_2!4179 lt!141362))))))

(assert (=> b!97847 (= lt!141519 (bitIndex!0 (size!2095 (buf!2443 thiss!1288)) (currentByte!4864 thiss!1288) (currentBit!4859 thiss!1288)))))

(declare-fun b!97848 () Bool)

(declare-fun e!64067 () Unit!5960)

(declare-fun lt!141528 () Unit!5960)

(assert (=> b!97848 (= e!64067 lt!141528)))

(declare-fun lt!141530 () (_ BitVec 64))

(assert (=> b!97848 (= lt!141530 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!141514 () (_ BitVec 64))

(assert (=> b!97848 (= lt!141514 (bitIndex!0 (size!2095 (buf!2443 thiss!1288)) (currentByte!4864 thiss!1288) (currentBit!4859 thiss!1288)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!4582 array!4582 (_ BitVec 64) (_ BitVec 64)) Unit!5960)

(assert (=> b!97848 (= lt!141528 (arrayBitRangesEqSymmetric!0 (buf!2443 thiss!1288) (buf!2443 (_2!4179 lt!141362)) lt!141530 lt!141514))))

(declare-fun arrayBitRangesEq!0 (array!4582 array!4582 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!97848 (arrayBitRangesEq!0 (buf!2443 (_2!4179 lt!141362)) (buf!2443 thiss!1288) lt!141530 lt!141514)))

(declare-fun b!97849 () Bool)

(declare-fun res!80288 () Bool)

(assert (=> b!97849 (=> (not res!80288) (not e!64068))))

(assert (=> b!97849 (= res!80288 (isPrefixOf!0 (_1!4178 lt!141520) thiss!1288))))

(declare-fun b!97850 () Bool)

(declare-fun Unit!5980 () Unit!5960)

(assert (=> b!97850 (= e!64067 Unit!5980)))

(declare-fun d!30698 () Bool)

(assert (=> d!30698 e!64068))

(declare-fun res!80286 () Bool)

(assert (=> d!30698 (=> (not res!80286) (not e!64068))))

(assert (=> d!30698 (= res!80286 (isPrefixOf!0 (_1!4178 lt!141520) (_2!4178 lt!141520)))))

(declare-fun lt!141513 () BitStream!3664)

(assert (=> d!30698 (= lt!141520 (tuple2!7853 lt!141513 (_2!4179 lt!141362)))))

(declare-fun lt!141515 () Unit!5960)

(declare-fun lt!141525 () Unit!5960)

(assert (=> d!30698 (= lt!141515 lt!141525)))

(assert (=> d!30698 (isPrefixOf!0 lt!141513 (_2!4179 lt!141362))))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3664 BitStream!3664 BitStream!3664) Unit!5960)

(assert (=> d!30698 (= lt!141525 (lemmaIsPrefixTransitive!0 lt!141513 (_2!4179 lt!141362) (_2!4179 lt!141362)))))

(declare-fun lt!141516 () Unit!5960)

(declare-fun lt!141526 () Unit!5960)

(assert (=> d!30698 (= lt!141516 lt!141526)))

(assert (=> d!30698 (isPrefixOf!0 lt!141513 (_2!4179 lt!141362))))

(assert (=> d!30698 (= lt!141526 (lemmaIsPrefixTransitive!0 lt!141513 thiss!1288 (_2!4179 lt!141362)))))

(declare-fun lt!141523 () Unit!5960)

(assert (=> d!30698 (= lt!141523 e!64067)))

(declare-fun c!6176 () Bool)

(assert (=> d!30698 (= c!6176 (not (= (size!2095 (buf!2443 thiss!1288)) #b00000000000000000000000000000000)))))

(declare-fun lt!141529 () Unit!5960)

(declare-fun lt!141527 () Unit!5960)

(assert (=> d!30698 (= lt!141529 lt!141527)))

(assert (=> d!30698 (isPrefixOf!0 (_2!4179 lt!141362) (_2!4179 lt!141362))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!3664) Unit!5960)

(assert (=> d!30698 (= lt!141527 (lemmaIsPrefixRefl!0 (_2!4179 lt!141362)))))

(declare-fun lt!141521 () Unit!5960)

(declare-fun lt!141517 () Unit!5960)

(assert (=> d!30698 (= lt!141521 lt!141517)))

(assert (=> d!30698 (= lt!141517 (lemmaIsPrefixRefl!0 (_2!4179 lt!141362)))))

(declare-fun lt!141518 () Unit!5960)

(declare-fun lt!141531 () Unit!5960)

(assert (=> d!30698 (= lt!141518 lt!141531)))

(assert (=> d!30698 (isPrefixOf!0 lt!141513 lt!141513)))

(assert (=> d!30698 (= lt!141531 (lemmaIsPrefixRefl!0 lt!141513))))

(declare-fun lt!141522 () Unit!5960)

(declare-fun lt!141524 () Unit!5960)

(assert (=> d!30698 (= lt!141522 lt!141524)))

(assert (=> d!30698 (isPrefixOf!0 thiss!1288 thiss!1288)))

(assert (=> d!30698 (= lt!141524 (lemmaIsPrefixRefl!0 thiss!1288))))

(assert (=> d!30698 (= lt!141513 (BitStream!3665 (buf!2443 (_2!4179 lt!141362)) (currentByte!4864 thiss!1288) (currentBit!4859 thiss!1288)))))

(assert (=> d!30698 (isPrefixOf!0 thiss!1288 (_2!4179 lt!141362))))

(assert (=> d!30698 (= (reader!0 thiss!1288 (_2!4179 lt!141362)) lt!141520)))

(assert (= (and d!30698 c!6176) b!97848))

(assert (= (and d!30698 (not c!6176)) b!97850))

(assert (= (and d!30698 res!80286) b!97849))

(assert (= (and b!97849 res!80288) b!97846))

(assert (= (and b!97846 res!80287) b!97847))

(declare-fun m!142137 () Bool)

(assert (=> d!30698 m!142137))

(declare-fun m!142139 () Bool)

(assert (=> d!30698 m!142139))

(declare-fun m!142141 () Bool)

(assert (=> d!30698 m!142141))

(declare-fun m!142143 () Bool)

(assert (=> d!30698 m!142143))

(declare-fun m!142145 () Bool)

(assert (=> d!30698 m!142145))

(declare-fun m!142147 () Bool)

(assert (=> d!30698 m!142147))

(declare-fun m!142149 () Bool)

(assert (=> d!30698 m!142149))

(assert (=> d!30698 m!142011))

(declare-fun m!142151 () Bool)

(assert (=> d!30698 m!142151))

(declare-fun m!142153 () Bool)

(assert (=> d!30698 m!142153))

(declare-fun m!142155 () Bool)

(assert (=> d!30698 m!142155))

(assert (=> b!97848 m!142017))

(declare-fun m!142157 () Bool)

(assert (=> b!97848 m!142157))

(declare-fun m!142159 () Bool)

(assert (=> b!97848 m!142159))

(declare-fun m!142161 () Bool)

(assert (=> b!97847 m!142161))

(assert (=> b!97847 m!142015))

(assert (=> b!97847 m!142017))

(declare-fun m!142163 () Bool)

(assert (=> b!97846 m!142163))

(declare-fun m!142165 () Bool)

(assert (=> b!97849 m!142165))

(assert (=> b!97755 d!30698))

(declare-fun d!30712 () Bool)

(declare-fun res!80305 () Bool)

(declare-fun e!64080 () Bool)

(assert (=> d!30712 (=> (not res!80305) (not e!64080))))

(assert (=> d!30712 (= res!80305 (= (size!2095 (buf!2443 thiss!1288)) (size!2095 (buf!2443 (_2!4179 lt!141362)))))))

(assert (=> d!30712 (= (isPrefixOf!0 thiss!1288 (_2!4179 lt!141362)) e!64080)))

(declare-fun b!97872 () Bool)

(declare-fun res!80306 () Bool)

(assert (=> b!97872 (=> (not res!80306) (not e!64080))))

(assert (=> b!97872 (= res!80306 (bvsle (bitIndex!0 (size!2095 (buf!2443 thiss!1288)) (currentByte!4864 thiss!1288) (currentBit!4859 thiss!1288)) (bitIndex!0 (size!2095 (buf!2443 (_2!4179 lt!141362))) (currentByte!4864 (_2!4179 lt!141362)) (currentBit!4859 (_2!4179 lt!141362)))))))

(declare-fun b!97873 () Bool)

(declare-fun e!64079 () Bool)

(assert (=> b!97873 (= e!64080 e!64079)))

(declare-fun res!80304 () Bool)

(assert (=> b!97873 (=> res!80304 e!64079)))

(assert (=> b!97873 (= res!80304 (= (size!2095 (buf!2443 thiss!1288)) #b00000000000000000000000000000000))))

(declare-fun b!97874 () Bool)

(assert (=> b!97874 (= e!64079 (arrayBitRangesEq!0 (buf!2443 thiss!1288) (buf!2443 (_2!4179 lt!141362)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2095 (buf!2443 thiss!1288)) (currentByte!4864 thiss!1288) (currentBit!4859 thiss!1288))))))

(assert (= (and d!30712 res!80305) b!97872))

(assert (= (and b!97872 res!80306) b!97873))

(assert (= (and b!97873 (not res!80304)) b!97874))

(assert (=> b!97872 m!142017))

(assert (=> b!97872 m!142015))

(assert (=> b!97874 m!142017))

(assert (=> b!97874 m!142017))

(declare-fun m!142191 () Bool)

(assert (=> b!97874 m!142191))

(assert (=> b!97760 d!30712))

(declare-fun d!30714 () Bool)

(assert (=> d!30714 (= (onesLSBLong!0 nBits!388) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!388))))))

(assert (=> b!97754 d!30714))

(declare-fun b!97995 () Bool)

(declare-datatypes ((tuple2!7872 0))(
  ( (tuple2!7873 (_1!4188 BitStream!3664) (_2!4188 Bool)) )
))
(declare-fun lt!142014 () tuple2!7872)

(declare-fun lt!141996 () tuple2!7854)

(declare-fun readBitPure!0 (BitStream!3664) tuple2!7872)

(declare-fun readerFrom!0 (BitStream!3664 (_ BitVec 32) (_ BitVec 32)) BitStream!3664)

(assert (=> b!97995 (= lt!142014 (readBitPure!0 (readerFrom!0 (_2!4179 lt!141996) (currentBit!4859 thiss!1288) (currentByte!4864 thiss!1288))))))

(declare-fun res!80402 () Bool)

(declare-fun lt!141998 () Bool)

(assert (=> b!97995 (= res!80402 (and (= (_2!4188 lt!142014) lt!141998) (= (_1!4188 lt!142014) (_2!4179 lt!141996))))))

(declare-fun e!64148 () Bool)

(assert (=> b!97995 (=> (not res!80402) (not e!64148))))

(declare-fun e!64146 () Bool)

(assert (=> b!97995 (= e!64146 e!64148)))

(declare-fun b!97996 () Bool)

(declare-fun e!64149 () (_ BitVec 64))

(assert (=> b!97996 (= e!64149 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!388 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!97997 () Bool)

(declare-fun e!64151 () Bool)

(declare-fun lt!141982 () tuple2!7872)

(declare-fun lt!142003 () tuple2!7872)

(assert (=> b!97997 (= e!64151 (= (_2!4188 lt!141982) (_2!4188 lt!142003)))))

(declare-fun b!97998 () Bool)

(declare-fun e!64147 () tuple2!7854)

(declare-fun lt!142013 () tuple2!7854)

(declare-fun Unit!5981 () Unit!5960)

(assert (=> b!97998 (= e!64147 (tuple2!7855 Unit!5981 (_2!4179 lt!142013)))))

(assert (=> b!97998 (= lt!141998 (not (= (bvand v!196 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!388 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun appendBit!0 (BitStream!3664 Bool) tuple2!7854)

(assert (=> b!97998 (= lt!141996 (appendBit!0 thiss!1288 lt!141998))))

(declare-fun res!80398 () Bool)

(assert (=> b!97998 (= res!80398 (= (size!2095 (buf!2443 thiss!1288)) (size!2095 (buf!2443 (_2!4179 lt!141996)))))))

(assert (=> b!97998 (=> (not res!80398) (not e!64146))))

(assert (=> b!97998 e!64146))

(declare-fun lt!142009 () tuple2!7854)

(assert (=> b!97998 (= lt!142009 lt!141996)))

(assert (=> b!97998 (= lt!142013 (appendNLeastSignificantBitsLoop!0 (_2!4179 lt!142009) v!196 nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!142006 () Unit!5960)

(assert (=> b!97998 (= lt!142006 (lemmaIsPrefixTransitive!0 thiss!1288 (_2!4179 lt!142009) (_2!4179 lt!142013)))))

(assert (=> b!97998 (isPrefixOf!0 thiss!1288 (_2!4179 lt!142013))))

(declare-fun lt!141993 () Unit!5960)

(assert (=> b!97998 (= lt!141993 lt!142006)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!97998 (invariant!0 (currentBit!4859 thiss!1288) (currentByte!4864 thiss!1288) (size!2095 (buf!2443 (_2!4179 lt!142009))))))

(declare-fun lt!142021 () BitStream!3664)

(assert (=> b!97998 (= lt!142021 (BitStream!3665 (buf!2443 (_2!4179 lt!142009)) (currentByte!4864 thiss!1288) (currentBit!4859 thiss!1288)))))

(assert (=> b!97998 (invariant!0 (currentBit!4859 lt!142021) (currentByte!4864 lt!142021) (size!2095 (buf!2443 (_2!4179 lt!142013))))))

(declare-fun lt!142020 () BitStream!3664)

(assert (=> b!97998 (= lt!142020 (BitStream!3665 (buf!2443 (_2!4179 lt!142013)) (currentByte!4864 lt!142021) (currentBit!4859 lt!142021)))))

(assert (=> b!97998 (= lt!141982 (readBitPure!0 lt!142021))))

(assert (=> b!97998 (= lt!142003 (readBitPure!0 lt!142020))))

(declare-fun lt!141991 () Unit!5960)

(declare-fun readBitPrefixLemma!0 (BitStream!3664 BitStream!3664) Unit!5960)

(assert (=> b!97998 (= lt!141991 (readBitPrefixLemma!0 lt!142021 (_2!4179 lt!142013)))))

(declare-fun res!80400 () Bool)

(assert (=> b!97998 (= res!80400 (= (bitIndex!0 (size!2095 (buf!2443 (_1!4188 lt!141982))) (currentByte!4864 (_1!4188 lt!141982)) (currentBit!4859 (_1!4188 lt!141982))) (bitIndex!0 (size!2095 (buf!2443 (_1!4188 lt!142003))) (currentByte!4864 (_1!4188 lt!142003)) (currentBit!4859 (_1!4188 lt!142003)))))))

(assert (=> b!97998 (=> (not res!80400) (not e!64151))))

(assert (=> b!97998 e!64151))

(declare-fun lt!141985 () Unit!5960)

(assert (=> b!97998 (= lt!141985 lt!141991)))

(declare-fun lt!141990 () tuple2!7852)

(assert (=> b!97998 (= lt!141990 (reader!0 thiss!1288 (_2!4179 lt!142013)))))

(declare-fun lt!141981 () tuple2!7852)

(assert (=> b!97998 (= lt!141981 (reader!0 (_2!4179 lt!142009) (_2!4179 lt!142013)))))

(declare-fun lt!141992 () tuple2!7872)

(assert (=> b!97998 (= lt!141992 (readBitPure!0 (_1!4178 lt!141990)))))

(assert (=> b!97998 (= (_2!4188 lt!141992) lt!141998)))

(declare-fun lt!142023 () Unit!5960)

(declare-fun Unit!5982 () Unit!5960)

(assert (=> b!97998 (= lt!142023 Unit!5982)))

(declare-fun lt!141989 () (_ BitVec 64))

(assert (=> b!97998 (= lt!141989 (bvand v!196 (bvnot (onesLSBLong!0 (bvsub nBits!388 #b00000000000000000000000000000000)))))))

(declare-fun lt!142016 () (_ BitVec 64))

(assert (=> b!97998 (= lt!142016 ((_ sign_extend 32) (bvsub nBits!388 #b00000000000000000000000000000000)))))

(declare-fun lt!142007 () Unit!5960)

(assert (=> b!97998 (= lt!142007 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1288 (buf!2443 (_2!4179 lt!142013)) lt!142016))))

(assert (=> b!97998 (validate_offset_bits!1 ((_ sign_extend 32) (size!2095 (buf!2443 (_2!4179 lt!142013)))) ((_ sign_extend 32) (currentByte!4864 thiss!1288)) ((_ sign_extend 32) (currentBit!4859 thiss!1288)) lt!142016)))

(declare-fun lt!142004 () Unit!5960)

(assert (=> b!97998 (= lt!142004 lt!142007)))

(declare-datatypes ((tuple2!7874 0))(
  ( (tuple2!7875 (_1!4189 BitStream!3664) (_2!4189 (_ BitVec 64))) )
))
(declare-fun lt!142019 () tuple2!7874)

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!3664 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!7874)

(assert (=> b!97998 (= lt!142019 (readNLeastSignificantBitsLoopPure!0 (_1!4178 lt!141990) nBits!388 #b00000000000000000000000000000000 lt!141989))))

(declare-fun lt!142024 () (_ BitVec 64))

(assert (=> b!97998 (= lt!142024 ((_ sign_extend 32) (bvsub (bvsub nBits!388 #b00000000000000000000000000000000) #b00000000000000000000000000000001)))))

(declare-fun lt!141988 () Unit!5960)

(assert (=> b!97998 (= lt!141988 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4179 lt!142009) (buf!2443 (_2!4179 lt!142013)) lt!142024))))

(assert (=> b!97998 (validate_offset_bits!1 ((_ sign_extend 32) (size!2095 (buf!2443 (_2!4179 lt!142013)))) ((_ sign_extend 32) (currentByte!4864 (_2!4179 lt!142009))) ((_ sign_extend 32) (currentBit!4859 (_2!4179 lt!142009))) lt!142024)))

(declare-fun lt!141986 () Unit!5960)

(assert (=> b!97998 (= lt!141986 lt!141988)))

(declare-fun lt!141995 () tuple2!7874)

(assert (=> b!97998 (= lt!141995 (readNLeastSignificantBitsLoopPure!0 (_1!4178 lt!141981) nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvor lt!141989 (ite (_2!4188 lt!141992) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!388 #b00000000000000000000000000000001) #b00000000000000000000000000000000))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!141984 () tuple2!7874)

(assert (=> b!97998 (= lt!141984 (readNLeastSignificantBitsLoopPure!0 (_1!4178 lt!141990) nBits!388 #b00000000000000000000000000000000 lt!141989))))

(declare-fun c!6197 () Bool)

(assert (=> b!97998 (= c!6197 (_2!4188 (readBitPure!0 (_1!4178 lt!141990))))))

(declare-fun lt!141987 () tuple2!7874)

(assert (=> b!97998 (= lt!141987 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4178 lt!141990) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvor lt!141989 e!64149)))))

(declare-fun lt!142011 () Unit!5960)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!3664 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!5960)

(assert (=> b!97998 (= lt!142011 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4178 lt!141990) nBits!388 #b00000000000000000000000000000000 lt!141989))))

(assert (=> b!97998 (and (= (_2!4189 lt!141984) (_2!4189 lt!141987)) (= (_1!4189 lt!141984) (_1!4189 lt!141987)))))

(declare-fun lt!142001 () Unit!5960)

(assert (=> b!97998 (= lt!142001 lt!142011)))

(assert (=> b!97998 (= (_1!4178 lt!141990) (withMovedBitIndex!0 (_2!4178 lt!141990) (bvsub (bitIndex!0 (size!2095 (buf!2443 thiss!1288)) (currentByte!4864 thiss!1288) (currentBit!4859 thiss!1288)) (bitIndex!0 (size!2095 (buf!2443 (_2!4179 lt!142013))) (currentByte!4864 (_2!4179 lt!142013)) (currentBit!4859 (_2!4179 lt!142013))))))))

(declare-fun lt!141994 () Unit!5960)

(declare-fun Unit!5983 () Unit!5960)

(assert (=> b!97998 (= lt!141994 Unit!5983)))

(assert (=> b!97998 (= (_1!4178 lt!141981) (withMovedBitIndex!0 (_2!4178 lt!141981) (bvsub (bitIndex!0 (size!2095 (buf!2443 (_2!4179 lt!142009))) (currentByte!4864 (_2!4179 lt!142009)) (currentBit!4859 (_2!4179 lt!142009))) (bitIndex!0 (size!2095 (buf!2443 (_2!4179 lt!142013))) (currentByte!4864 (_2!4179 lt!142013)) (currentBit!4859 (_2!4179 lt!142013))))))))

(declare-fun lt!142015 () Unit!5960)

(declare-fun Unit!5984 () Unit!5960)

(assert (=> b!97998 (= lt!142015 Unit!5984)))

(assert (=> b!97998 (= (bitIndex!0 (size!2095 (buf!2443 thiss!1288)) (currentByte!4864 thiss!1288) (currentBit!4859 thiss!1288)) (bvsub (bitIndex!0 (size!2095 (buf!2443 (_2!4179 lt!142009))) (currentByte!4864 (_2!4179 lt!142009)) (currentBit!4859 (_2!4179 lt!142009))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!141997 () Unit!5960)

(declare-fun Unit!5985 () Unit!5960)

(assert (=> b!97998 (= lt!141997 Unit!5985)))

(assert (=> b!97998 (= (_2!4189 lt!142019) (_2!4189 lt!141995))))

(declare-fun lt!141983 () Unit!5960)

(declare-fun Unit!5986 () Unit!5960)

(assert (=> b!97998 (= lt!141983 Unit!5986)))

(assert (=> b!97998 (= (_1!4189 lt!142019) (_2!4178 lt!141990))))

(declare-fun b!97999 () Bool)

(assert (=> b!97999 (= e!64149 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun bm!1210 () Bool)

(declare-fun c!6196 () Bool)

(declare-fun call!1213 () Bool)

(declare-fun lt!141999 () BitStream!3664)

(assert (=> bm!1210 (= call!1213 (isPrefixOf!0 (ite c!6196 thiss!1288 lt!141999) (ite c!6196 (_2!4179 lt!141996) lt!141999)))))

(declare-fun d!30718 () Bool)

(declare-fun e!64145 () Bool)

(assert (=> d!30718 e!64145))

(declare-fun res!80397 () Bool)

(assert (=> d!30718 (=> (not res!80397) (not e!64145))))

(declare-fun lt!142017 () tuple2!7854)

(assert (=> d!30718 (= res!80397 (= (size!2095 (buf!2443 thiss!1288)) (size!2095 (buf!2443 (_2!4179 lt!142017)))))))

(assert (=> d!30718 (= lt!142017 e!64147)))

(assert (=> d!30718 (= c!6196 (bvslt #b00000000000000000000000000000000 nBits!388))))

(assert (=> d!30718 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 nBits!388) (bvsle nBits!388 #b00000000000000000000000001000000))))

(assert (=> d!30718 (= (appendNLeastSignificantBitsLoop!0 thiss!1288 v!196 nBits!388 #b00000000000000000000000000000000) lt!142017)))

(declare-fun b!98000 () Bool)

(declare-fun lt!142008 () Unit!5960)

(assert (=> b!98000 (= e!64147 (tuple2!7855 lt!142008 thiss!1288))))

(assert (=> b!98000 (= lt!141999 thiss!1288)))

(assert (=> b!98000 (= lt!142008 (lemmaIsPrefixRefl!0 lt!141999))))

(assert (=> b!98000 call!1213))

(declare-fun b!98001 () Bool)

(declare-fun res!80395 () Bool)

(assert (=> b!98001 (=> (not res!80395) (not e!64145))))

(declare-fun lt!142012 () (_ BitVec 64))

(declare-fun lt!141980 () (_ BitVec 64))

(assert (=> b!98001 (= res!80395 (= (bitIndex!0 (size!2095 (buf!2443 (_2!4179 lt!142017))) (currentByte!4864 (_2!4179 lt!142017)) (currentBit!4859 (_2!4179 lt!142017))) (bvadd lt!141980 lt!142012)))))

(assert (=> b!98001 (or (not (= (bvand lt!141980 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!142012 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!141980 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!141980 lt!142012) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!98001 (= lt!142012 ((_ sign_extend 32) (bvsub nBits!388 #b00000000000000000000000000000000)))))

(assert (=> b!98001 (or (= (bvand nBits!388 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand nBits!388 #b10000000000000000000000000000000) (bvand (bvsub nBits!388 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(assert (=> b!98001 (= lt!141980 (bitIndex!0 (size!2095 (buf!2443 thiss!1288)) (currentByte!4864 thiss!1288) (currentBit!4859 thiss!1288)))))

(declare-fun b!98002 () Bool)

(assert (=> b!98002 (= e!64148 (= (bitIndex!0 (size!2095 (buf!2443 (_1!4188 lt!142014))) (currentByte!4864 (_1!4188 lt!142014)) (currentBit!4859 (_1!4188 lt!142014))) (bitIndex!0 (size!2095 (buf!2443 (_2!4179 lt!141996))) (currentByte!4864 (_2!4179 lt!141996)) (currentBit!4859 (_2!4179 lt!141996)))))))

(declare-fun b!98003 () Bool)

(declare-fun e!64150 () Bool)

(declare-fun lt!142002 () (_ BitVec 64))

(assert (=> b!98003 (= e!64150 (validate_offset_bits!1 ((_ sign_extend 32) (size!2095 (buf!2443 thiss!1288))) ((_ sign_extend 32) (currentByte!4864 thiss!1288)) ((_ sign_extend 32) (currentBit!4859 thiss!1288)) lt!142002))))

(declare-fun b!98004 () Bool)

(declare-fun res!80403 () Bool)

(assert (=> b!98004 (= res!80403 call!1213)))

(assert (=> b!98004 (=> (not res!80403) (not e!64146))))

(declare-fun b!98005 () Bool)

(declare-fun res!80401 () Bool)

(assert (=> b!98005 (=> (not res!80401) (not e!64145))))

(assert (=> b!98005 (= res!80401 (isPrefixOf!0 thiss!1288 (_2!4179 lt!142017)))))

(declare-fun b!98006 () Bool)

(declare-fun res!80396 () Bool)

(assert (=> b!98006 (= res!80396 (= (bitIndex!0 (size!2095 (buf!2443 (_2!4179 lt!141996))) (currentByte!4864 (_2!4179 lt!141996)) (currentBit!4859 (_2!4179 lt!141996))) (bvadd (bitIndex!0 (size!2095 (buf!2443 thiss!1288)) (currentByte!4864 thiss!1288) (currentBit!4859 thiss!1288)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!98006 (=> (not res!80396) (not e!64146))))

(declare-fun lt!142005 () tuple2!7874)

(declare-fun lt!142022 () tuple2!7852)

(declare-fun b!98007 () Bool)

(assert (=> b!98007 (= e!64145 (and (= (_2!4189 lt!142005) v!196) (= (_1!4189 lt!142005) (_2!4178 lt!142022))))))

(declare-fun lt!142000 () (_ BitVec 64))

(assert (=> b!98007 (= lt!142005 (readNLeastSignificantBitsLoopPure!0 (_1!4178 lt!142022) nBits!388 #b00000000000000000000000000000000 lt!142000))))

(declare-fun lt!142018 () Unit!5960)

(declare-fun lt!142010 () Unit!5960)

(assert (=> b!98007 (= lt!142018 lt!142010)))

(assert (=> b!98007 (validate_offset_bits!1 ((_ sign_extend 32) (size!2095 (buf!2443 (_2!4179 lt!142017)))) ((_ sign_extend 32) (currentByte!4864 thiss!1288)) ((_ sign_extend 32) (currentBit!4859 thiss!1288)) lt!142002)))

(assert (=> b!98007 (= lt!142010 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1288 (buf!2443 (_2!4179 lt!142017)) lt!142002))))

(assert (=> b!98007 e!64150))

(declare-fun res!80399 () Bool)

(assert (=> b!98007 (=> (not res!80399) (not e!64150))))

(assert (=> b!98007 (= res!80399 (and (= (size!2095 (buf!2443 thiss!1288)) (size!2095 (buf!2443 (_2!4179 lt!142017)))) (bvsge lt!142002 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!98007 (= lt!142002 ((_ sign_extend 32) (bvsub nBits!388 #b00000000000000000000000000000000)))))

(assert (=> b!98007 (or (= (bvand nBits!388 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand nBits!388 #b10000000000000000000000000000000) (bvand (bvsub nBits!388 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(assert (=> b!98007 (= lt!142000 (bvand v!196 (bvnot (onesLSBLong!0 (bvsub nBits!388 #b00000000000000000000000000000000)))))))

(assert (=> b!98007 (or (= (bvand nBits!388 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand nBits!388 #b10000000000000000000000000000000) (bvand (bvsub nBits!388 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(assert (=> b!98007 (= lt!142022 (reader!0 thiss!1288 (_2!4179 lt!142017)))))

(assert (= (and d!30718 c!6196) b!97998))

(assert (= (and d!30718 (not c!6196)) b!98000))

(assert (= (and b!97998 res!80398) b!98006))

(assert (= (and b!98006 res!80396) b!98004))

(assert (= (and b!98004 res!80403) b!97995))

(assert (= (and b!97995 res!80402) b!98002))

(assert (= (and b!97998 res!80400) b!97997))

(assert (= (and b!97998 c!6197) b!97996))

(assert (= (and b!97998 (not c!6197)) b!97999))

(assert (= (or b!98004 b!98000) bm!1210))

(assert (= (and d!30718 res!80397) b!98001))

(assert (= (and b!98001 res!80395) b!98005))

(assert (= (and b!98005 res!80401) b!98007))

(assert (= (and b!98007 res!80399) b!98003))

(declare-fun m!142377 () Bool)

(assert (=> b!98006 m!142377))

(assert (=> b!98006 m!142017))

(declare-fun m!142379 () Bool)

(assert (=> b!98005 m!142379))

(declare-fun m!142381 () Bool)

(assert (=> bm!1210 m!142381))

(declare-fun m!142383 () Bool)

(assert (=> b!97998 m!142383))

(declare-fun m!142385 () Bool)

(assert (=> b!97998 m!142385))

(declare-fun m!142387 () Bool)

(assert (=> b!97998 m!142387))

(declare-fun m!142389 () Bool)

(assert (=> b!97998 m!142389))

(declare-fun m!142391 () Bool)

(assert (=> b!97998 m!142391))

(declare-fun m!142393 () Bool)

(assert (=> b!97998 m!142393))

(declare-fun m!142395 () Bool)

(assert (=> b!97998 m!142395))

(declare-fun m!142397 () Bool)

(assert (=> b!97998 m!142397))

(declare-fun m!142399 () Bool)

(assert (=> b!97998 m!142399))

(declare-fun m!142401 () Bool)

(assert (=> b!97998 m!142401))

(declare-fun m!142403 () Bool)

(assert (=> b!97998 m!142403))

(declare-fun m!142405 () Bool)

(assert (=> b!97998 m!142405))

(declare-fun m!142407 () Bool)

(assert (=> b!97998 m!142407))

(declare-fun m!142409 () Bool)

(assert (=> b!97998 m!142409))

(assert (=> b!97998 m!142017))

(declare-fun m!142411 () Bool)

(assert (=> b!97998 m!142411))

(declare-fun m!142413 () Bool)

(assert (=> b!97998 m!142413))

(declare-fun m!142415 () Bool)

(assert (=> b!97998 m!142415))

(declare-fun m!142417 () Bool)

(assert (=> b!97998 m!142417))

(declare-fun m!142419 () Bool)

(assert (=> b!97998 m!142419))

(declare-fun m!142421 () Bool)

(assert (=> b!97998 m!142421))

(declare-fun m!142423 () Bool)

(assert (=> b!97998 m!142423))

(declare-fun m!142425 () Bool)

(assert (=> b!97998 m!142425))

(declare-fun m!142427 () Bool)

(assert (=> b!97998 m!142427))

(declare-fun m!142429 () Bool)

(assert (=> b!97998 m!142429))

(declare-fun m!142431 () Bool)

(assert (=> b!97998 m!142431))

(declare-fun m!142433 () Bool)

(assert (=> b!97998 m!142433))

(declare-fun m!142435 () Bool)

(assert (=> b!97998 m!142435))

(declare-fun m!142437 () Bool)

(assert (=> b!97998 m!142437))

(assert (=> b!97998 m!142395))

(declare-fun m!142439 () Bool)

(assert (=> b!98000 m!142439))

(declare-fun m!142441 () Bool)

(assert (=> b!97995 m!142441))

(assert (=> b!97995 m!142441))

(declare-fun m!142443 () Bool)

(assert (=> b!97995 m!142443))

(declare-fun m!142445 () Bool)

(assert (=> b!98003 m!142445))

(declare-fun m!142447 () Bool)

(assert (=> b!98002 m!142447))

(assert (=> b!98002 m!142377))

(declare-fun m!142449 () Bool)

(assert (=> b!98001 m!142449))

(assert (=> b!98001 m!142017))

(declare-fun m!142451 () Bool)

(assert (=> b!98007 m!142451))

(declare-fun m!142453 () Bool)

(assert (=> b!98007 m!142453))

(declare-fun m!142455 () Bool)

(assert (=> b!98007 m!142455))

(assert (=> b!98007 m!142403))

(declare-fun m!142457 () Bool)

(assert (=> b!98007 m!142457))

(assert (=> b!97759 d!30718))

(declare-fun d!30742 () Bool)

(assert (=> d!30742 (= (inv!12 thiss!1288) (invariant!0 (currentBit!4859 thiss!1288) (currentByte!4864 thiss!1288) (size!2095 (buf!2443 thiss!1288))))))

(declare-fun bs!7525 () Bool)

(assert (= bs!7525 d!30742))

(declare-fun m!142459 () Bool)

(assert (=> bs!7525 m!142459))

(assert (=> start!19578 d!30742))

(declare-fun d!30744 () Bool)

(declare-fun e!64154 () Bool)

(assert (=> d!30744 e!64154))

(declare-fun res!80409 () Bool)

(assert (=> d!30744 (=> (not res!80409) (not e!64154))))

(declare-fun lt!142037 () (_ BitVec 64))

(declare-fun lt!142042 () (_ BitVec 64))

(declare-fun lt!142039 () (_ BitVec 64))

(assert (=> d!30744 (= res!80409 (= lt!142039 (bvsub lt!142037 lt!142042)))))

(assert (=> d!30744 (or (= (bvand lt!142037 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!142042 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!142037 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!142037 lt!142042) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!30744 (= lt!142042 (remainingBits!0 ((_ sign_extend 32) (size!2095 (buf!2443 (_2!4179 lt!141362)))) ((_ sign_extend 32) (currentByte!4864 (_2!4179 lt!141362))) ((_ sign_extend 32) (currentBit!4859 (_2!4179 lt!141362)))))))

(declare-fun lt!142038 () (_ BitVec 64))

(declare-fun lt!142041 () (_ BitVec 64))

(assert (=> d!30744 (= lt!142037 (bvmul lt!142038 lt!142041))))

(assert (=> d!30744 (or (= lt!142038 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!142041 (bvsdiv (bvmul lt!142038 lt!142041) lt!142038)))))

(assert (=> d!30744 (= lt!142041 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!30744 (= lt!142038 ((_ sign_extend 32) (size!2095 (buf!2443 (_2!4179 lt!141362)))))))

(assert (=> d!30744 (= lt!142039 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4864 (_2!4179 lt!141362))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4859 (_2!4179 lt!141362)))))))

(assert (=> d!30744 (invariant!0 (currentBit!4859 (_2!4179 lt!141362)) (currentByte!4864 (_2!4179 lt!141362)) (size!2095 (buf!2443 (_2!4179 lt!141362))))))

(assert (=> d!30744 (= (bitIndex!0 (size!2095 (buf!2443 (_2!4179 lt!141362))) (currentByte!4864 (_2!4179 lt!141362)) (currentBit!4859 (_2!4179 lt!141362))) lt!142039)))

(declare-fun b!98012 () Bool)

(declare-fun res!80408 () Bool)

(assert (=> b!98012 (=> (not res!80408) (not e!64154))))

(assert (=> b!98012 (= res!80408 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!142039))))

(declare-fun b!98013 () Bool)

(declare-fun lt!142040 () (_ BitVec 64))

(assert (=> b!98013 (= e!64154 (bvsle lt!142039 (bvmul lt!142040 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!98013 (or (= lt!142040 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!142040 #b0000000000000000000000000000000000000000000000000000000000001000) lt!142040)))))

(assert (=> b!98013 (= lt!142040 ((_ sign_extend 32) (size!2095 (buf!2443 (_2!4179 lt!141362)))))))

(assert (= (and d!30744 res!80409) b!98012))

(assert (= (and b!98012 res!80408) b!98013))

(declare-fun m!142461 () Bool)

(assert (=> d!30744 m!142461))

(declare-fun m!142463 () Bool)

(assert (=> d!30744 m!142463))

(assert (=> b!97758 d!30744))

(declare-fun d!30746 () Bool)

(declare-fun e!64155 () Bool)

(assert (=> d!30746 e!64155))

(declare-fun res!80411 () Bool)

(assert (=> d!30746 (=> (not res!80411) (not e!64155))))

(declare-fun lt!142043 () (_ BitVec 64))

(declare-fun lt!142048 () (_ BitVec 64))

(declare-fun lt!142045 () (_ BitVec 64))

(assert (=> d!30746 (= res!80411 (= lt!142045 (bvsub lt!142043 lt!142048)))))

(assert (=> d!30746 (or (= (bvand lt!142043 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!142048 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!142043 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!142043 lt!142048) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!30746 (= lt!142048 (remainingBits!0 ((_ sign_extend 32) (size!2095 (buf!2443 thiss!1288))) ((_ sign_extend 32) (currentByte!4864 thiss!1288)) ((_ sign_extend 32) (currentBit!4859 thiss!1288))))))

(declare-fun lt!142044 () (_ BitVec 64))

(declare-fun lt!142047 () (_ BitVec 64))

(assert (=> d!30746 (= lt!142043 (bvmul lt!142044 lt!142047))))

(assert (=> d!30746 (or (= lt!142044 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!142047 (bvsdiv (bvmul lt!142044 lt!142047) lt!142044)))))

(assert (=> d!30746 (= lt!142047 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!30746 (= lt!142044 ((_ sign_extend 32) (size!2095 (buf!2443 thiss!1288))))))

(assert (=> d!30746 (= lt!142045 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4864 thiss!1288)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4859 thiss!1288))))))

(assert (=> d!30746 (invariant!0 (currentBit!4859 thiss!1288) (currentByte!4864 thiss!1288) (size!2095 (buf!2443 thiss!1288)))))

(assert (=> d!30746 (= (bitIndex!0 (size!2095 (buf!2443 thiss!1288)) (currentByte!4864 thiss!1288) (currentBit!4859 thiss!1288)) lt!142045)))

(declare-fun b!98014 () Bool)

(declare-fun res!80410 () Bool)

(assert (=> b!98014 (=> (not res!80410) (not e!64155))))

(assert (=> b!98014 (= res!80410 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!142045))))

(declare-fun b!98015 () Bool)

(declare-fun lt!142046 () (_ BitVec 64))

(assert (=> b!98015 (= e!64155 (bvsle lt!142045 (bvmul lt!142046 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!98015 (or (= lt!142046 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!142046 #b0000000000000000000000000000000000000000000000000000000000001000) lt!142046)))))

(assert (=> b!98015 (= lt!142046 ((_ sign_extend 32) (size!2095 (buf!2443 thiss!1288))))))

(assert (= (and d!30746 res!80411) b!98014))

(assert (= (and b!98014 res!80410) b!98015))

(assert (=> d!30746 m!142089))

(assert (=> d!30746 m!142459))

(assert (=> b!97758 d!30746))

(push 1)

(assert (not d!30746))

(assert (not d!30696))

(assert (not b!98002))

(assert (not b!98000))

(assert (not d!30694))

(assert (not b!97872))

(assert (not d!30698))

(assert (not b!97849))

(assert (not b!98003))

(assert (not b!98007))

(assert (not b!97847))

(assert (not b!97874))

(assert (not b!97998))

(assert (not d!30742))

(assert (not bm!1210))

(assert (not b!97846))

(assert (not d!30692))

(assert (not d!30744))

(assert (not b!98005))

(assert (not b!97995))

(assert (not b!98006))

(assert (not d!30688))

(assert (not b!97848))

(assert (not b!98001))

(check-sat)

(pop 1)

(push 1)

(check-sat)

