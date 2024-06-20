; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19582 () Bool)

(assert start!19582)

(declare-fun b!97796 () Bool)

(declare-fun res!80251 () Bool)

(declare-fun e!64041 () Bool)

(assert (=> b!97796 (=> (not res!80251) (not e!64041))))

(declare-datatypes ((array!4586 0))(
  ( (array!4587 (arr!2690 (Array (_ BitVec 32) (_ BitVec 8))) (size!2097 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3668 0))(
  ( (BitStream!3669 (buf!2445 array!4586) (currentByte!4866 (_ BitVec 32)) (currentBit!4861 (_ BitVec 32))) )
))
(declare-fun thiss!1288 () BitStream!3668)

(declare-fun nBits!388 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!97796 (= res!80251 (validate_offset_bits!1 ((_ sign_extend 32) (size!2097 (buf!2445 thiss!1288))) ((_ sign_extend 32) (currentByte!4866 thiss!1288)) ((_ sign_extend 32) (currentBit!4861 thiss!1288)) ((_ sign_extend 32) nBits!388)))))

(declare-fun b!97797 () Bool)

(declare-fun e!64044 () Bool)

(declare-fun array_inv!1899 (array!4586) Bool)

(assert (=> b!97797 (= e!64044 (array_inv!1899 (buf!2445 thiss!1288)))))

(declare-fun b!97798 () Bool)

(declare-fun res!80249 () Bool)

(assert (=> b!97798 (=> (not res!80249) (not e!64041))))

(declare-fun v!196 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!97798 (= res!80249 (= (bvand v!196 (onesLSBLong!0 nBits!388)) v!196))))

(declare-fun res!80247 () Bool)

(assert (=> start!19582 (=> (not res!80247) (not e!64041))))

(assert (=> start!19582 (= res!80247 (and (bvsge nBits!388 #b00000000000000000000000000000000) (bvsle nBits!388 #b00000000000000000000000001000000)))))

(assert (=> start!19582 e!64041))

(assert (=> start!19582 true))

(declare-fun inv!12 (BitStream!3668) Bool)

(assert (=> start!19582 (and (inv!12 thiss!1288) e!64044)))

(declare-fun b!97799 () Bool)

(declare-fun e!64043 () Bool)

(assert (=> b!97799 (= e!64041 e!64043)))

(declare-fun res!80252 () Bool)

(assert (=> b!97799 (=> (not res!80252) (not e!64043))))

(declare-datatypes ((Unit!5964 0))(
  ( (Unit!5965) )
))
(declare-datatypes ((tuple2!7860 0))(
  ( (tuple2!7861 (_1!4182 Unit!5964) (_2!4182 BitStream!3668)) )
))
(declare-fun lt!141380 () tuple2!7860)

(assert (=> b!97799 (= res!80252 (= (size!2097 (buf!2445 thiss!1288)) (size!2097 (buf!2445 (_2!4182 lt!141380)))))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3668 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!7860)

(assert (=> b!97799 (= lt!141380 (appendNLeastSignificantBitsLoop!0 thiss!1288 v!196 nBits!388 #b00000000000000000000000000000000))))

(declare-fun b!97800 () Bool)

(declare-datatypes ((tuple2!7862 0))(
  ( (tuple2!7863 (_1!4183 BitStream!3668) (_2!4183 BitStream!3668)) )
))
(declare-fun lt!141382 () tuple2!7862)

(assert (=> b!97800 (= e!64043 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!2097 (buf!2445 (_1!4183 lt!141382)))) ((_ sign_extend 32) (currentByte!4866 (_1!4183 lt!141382))) ((_ sign_extend 32) (currentBit!4861 (_1!4183 lt!141382))) ((_ sign_extend 32) nBits!388))))))

(assert (=> b!97800 (validate_offset_bits!1 ((_ sign_extend 32) (size!2097 (buf!2445 (_2!4182 lt!141380)))) ((_ sign_extend 32) (currentByte!4866 thiss!1288)) ((_ sign_extend 32) (currentBit!4861 thiss!1288)) ((_ sign_extend 32) nBits!388))))

(declare-fun lt!141381 () Unit!5964)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!3668 array!4586 (_ BitVec 64)) Unit!5964)

(assert (=> b!97800 (= lt!141381 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1288 (buf!2445 (_2!4182 lt!141380)) ((_ sign_extend 32) nBits!388)))))

(declare-fun reader!0 (BitStream!3668 BitStream!3668) tuple2!7862)

(assert (=> b!97800 (= lt!141382 (reader!0 thiss!1288 (_2!4182 lt!141380)))))

(declare-fun b!97801 () Bool)

(declare-fun res!80248 () Bool)

(assert (=> b!97801 (=> (not res!80248) (not e!64043))))

(declare-fun isPrefixOf!0 (BitStream!3668 BitStream!3668) Bool)

(assert (=> b!97801 (= res!80248 (isPrefixOf!0 thiss!1288 (_2!4182 lt!141380)))))

(declare-fun b!97802 () Bool)

(declare-fun res!80250 () Bool)

(assert (=> b!97802 (=> (not res!80250) (not e!64043))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!97802 (= res!80250 (= (bitIndex!0 (size!2097 (buf!2445 (_2!4182 lt!141380))) (currentByte!4866 (_2!4182 lt!141380)) (currentBit!4861 (_2!4182 lt!141380))) (bvadd (bitIndex!0 (size!2097 (buf!2445 thiss!1288)) (currentByte!4866 thiss!1288) (currentBit!4861 thiss!1288)) ((_ sign_extend 32) nBits!388))))))

(assert (= (and start!19582 res!80247) b!97796))

(assert (= (and b!97796 res!80251) b!97798))

(assert (= (and b!97798 res!80249) b!97799))

(assert (= (and b!97799 res!80252) b!97802))

(assert (= (and b!97802 res!80250) b!97801))

(assert (= (and b!97801 res!80248) b!97800))

(assert (= start!19582 b!97797))

(declare-fun m!142057 () Bool)

(assert (=> b!97798 m!142057))

(declare-fun m!142059 () Bool)

(assert (=> b!97802 m!142059))

(declare-fun m!142061 () Bool)

(assert (=> b!97802 m!142061))

(declare-fun m!142063 () Bool)

(assert (=> b!97799 m!142063))

(declare-fun m!142065 () Bool)

(assert (=> b!97796 m!142065))

(declare-fun m!142067 () Bool)

(assert (=> start!19582 m!142067))

(declare-fun m!142069 () Bool)

(assert (=> b!97800 m!142069))

(declare-fun m!142071 () Bool)

(assert (=> b!97800 m!142071))

(declare-fun m!142073 () Bool)

(assert (=> b!97800 m!142073))

(declare-fun m!142075 () Bool)

(assert (=> b!97800 m!142075))

(declare-fun m!142077 () Bool)

(assert (=> b!97797 m!142077))

(declare-fun m!142079 () Bool)

(assert (=> b!97801 m!142079))

(push 1)

(assert (not b!97802))

(assert (not b!97801))

(assert (not b!97799))

(assert (not start!19582))

(assert (not b!97798))

(assert (not b!97796))

(assert (not b!97800))

(assert (not b!97797))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!30686 () Bool)

(declare-fun res!80269 () Bool)

(declare-fun e!64056 () Bool)

(assert (=> d!30686 (=> (not res!80269) (not e!64056))))

(assert (=> d!30686 (= res!80269 (= (size!2097 (buf!2445 thiss!1288)) (size!2097 (buf!2445 (_2!4182 lt!141380)))))))

(assert (=> d!30686 (= (isPrefixOf!0 thiss!1288 (_2!4182 lt!141380)) e!64056)))

(declare-fun b!97818 () Bool)

(declare-fun res!80270 () Bool)

(assert (=> b!97818 (=> (not res!80270) (not e!64056))))

(assert (=> b!97818 (= res!80270 (bvsle (bitIndex!0 (size!2097 (buf!2445 thiss!1288)) (currentByte!4866 thiss!1288) (currentBit!4861 thiss!1288)) (bitIndex!0 (size!2097 (buf!2445 (_2!4182 lt!141380))) (currentByte!4866 (_2!4182 lt!141380)) (currentBit!4861 (_2!4182 lt!141380)))))))

(declare-fun b!97819 () Bool)

(declare-fun e!64055 () Bool)

(assert (=> b!97819 (= e!64056 e!64055)))

(declare-fun res!80268 () Bool)

(assert (=> b!97819 (=> res!80268 e!64055)))

(assert (=> b!97819 (= res!80268 (= (size!2097 (buf!2445 thiss!1288)) #b00000000000000000000000000000000))))

(declare-fun b!97820 () Bool)

(declare-fun arrayBitRangesEq!0 (array!4586 array!4586 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!97820 (= e!64055 (arrayBitRangesEq!0 (buf!2445 thiss!1288) (buf!2445 (_2!4182 lt!141380)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2097 (buf!2445 thiss!1288)) (currentByte!4866 thiss!1288) (currentBit!4861 thiss!1288))))))

(assert (= (and d!30686 res!80269) b!97818))

(assert (= (and b!97818 res!80270) b!97819))

(assert (= (and b!97819 (not res!80268)) b!97820))

(assert (=> b!97818 m!142061))

(assert (=> b!97818 m!142059))

(assert (=> b!97820 m!142061))

(assert (=> b!97820 m!142061))

(declare-fun m!142097 () Bool)

(assert (=> b!97820 m!142097))

(assert (=> b!97801 d!30686))

(declare-fun d!30700 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!30700 (= (inv!12 thiss!1288) (invariant!0 (currentBit!4861 thiss!1288) (currentByte!4866 thiss!1288) (size!2097 (buf!2445 thiss!1288))))))

(declare-fun bs!7518 () Bool)

(assert (= bs!7518 d!30700))

(declare-fun m!142099 () Bool)

(assert (=> bs!7518 m!142099))

(assert (=> start!19582 d!30700))

(declare-fun d!30702 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!30702 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2097 (buf!2445 (_1!4183 lt!141382)))) ((_ sign_extend 32) (currentByte!4866 (_1!4183 lt!141382))) ((_ sign_extend 32) (currentBit!4861 (_1!4183 lt!141382))) ((_ sign_extend 32) nBits!388)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2097 (buf!2445 (_1!4183 lt!141382)))) ((_ sign_extend 32) (currentByte!4866 (_1!4183 lt!141382))) ((_ sign_extend 32) (currentBit!4861 (_1!4183 lt!141382)))) ((_ sign_extend 32) nBits!388)))))

(declare-fun bs!7519 () Bool)

(assert (= bs!7519 d!30702))

(declare-fun m!142101 () Bool)

(assert (=> bs!7519 m!142101))

(assert (=> b!97800 d!30702))

(declare-fun d!30704 () Bool)

(assert (=> d!30704 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2097 (buf!2445 (_2!4182 lt!141380)))) ((_ sign_extend 32) (currentByte!4866 thiss!1288)) ((_ sign_extend 32) (currentBit!4861 thiss!1288)) ((_ sign_extend 32) nBits!388)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2097 (buf!2445 (_2!4182 lt!141380)))) ((_ sign_extend 32) (currentByte!4866 thiss!1288)) ((_ sign_extend 32) (currentBit!4861 thiss!1288))) ((_ sign_extend 32) nBits!388)))))

(declare-fun bs!7520 () Bool)

(assert (= bs!7520 d!30704))

(declare-fun m!142103 () Bool)

(assert (=> bs!7520 m!142103))

(assert (=> b!97800 d!30704))

(declare-fun d!30706 () Bool)

(assert (=> d!30706 (validate_offset_bits!1 ((_ sign_extend 32) (size!2097 (buf!2445 (_2!4182 lt!141380)))) ((_ sign_extend 32) (currentByte!4866 thiss!1288)) ((_ sign_extend 32) (currentBit!4861 thiss!1288)) ((_ sign_extend 32) nBits!388))))

(declare-fun lt!141391 () Unit!5964)

(declare-fun choose!9 (BitStream!3668 array!4586 (_ BitVec 64) BitStream!3668) Unit!5964)

(assert (=> d!30706 (= lt!141391 (choose!9 thiss!1288 (buf!2445 (_2!4182 lt!141380)) ((_ sign_extend 32) nBits!388) (BitStream!3669 (buf!2445 (_2!4182 lt!141380)) (currentByte!4866 thiss!1288) (currentBit!4861 thiss!1288))))))

(assert (=> d!30706 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1288 (buf!2445 (_2!4182 lt!141380)) ((_ sign_extend 32) nBits!388)) lt!141391)))

(declare-fun bs!7521 () Bool)

(assert (= bs!7521 d!30706))

(assert (=> bs!7521 m!142071))

(declare-fun m!142105 () Bool)

(assert (=> bs!7521 m!142105))

(assert (=> b!97800 d!30706))

(declare-fun b!97867 () Bool)

(declare-fun res!80301 () Bool)

(declare-fun e!64077 () Bool)

(assert (=> b!97867 (=> (not res!80301) (not e!64077))))

(declare-fun lt!141565 () tuple2!7862)

(assert (=> b!97867 (= res!80301 (isPrefixOf!0 (_1!4183 lt!141565) thiss!1288))))

(declare-fun b!97868 () Bool)

(declare-fun res!80302 () Bool)

(assert (=> b!97868 (=> (not res!80302) (not e!64077))))

(assert (=> b!97868 (= res!80302 (isPrefixOf!0 (_2!4183 lt!141565) (_2!4182 lt!141380)))))

(declare-fun b!97869 () Bool)

(declare-fun e!64078 () Unit!5964)

(declare-fun Unit!5967 () Unit!5964)

(assert (=> b!97869 (= e!64078 Unit!5967)))

(declare-fun b!97870 () Bool)

(declare-fun lt!141568 () Unit!5964)

(assert (=> b!97870 (= e!64078 lt!141568)))

(declare-fun lt!141560 () (_ BitVec 64))

(assert (=> b!97870 (= lt!141560 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!141553 () (_ BitVec 64))

(assert (=> b!97870 (= lt!141553 (bitIndex!0 (size!2097 (buf!2445 thiss!1288)) (currentByte!4866 thiss!1288) (currentBit!4861 thiss!1288)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!4586 array!4586 (_ BitVec 64) (_ BitVec 64)) Unit!5964)

(assert (=> b!97870 (= lt!141568 (arrayBitRangesEqSymmetric!0 (buf!2445 thiss!1288) (buf!2445 (_2!4182 lt!141380)) lt!141560 lt!141553))))

(assert (=> b!97870 (arrayBitRangesEq!0 (buf!2445 (_2!4182 lt!141380)) (buf!2445 thiss!1288) lt!141560 lt!141553)))

(declare-fun d!30708 () Bool)

(assert (=> d!30708 e!64077))

(declare-fun res!80303 () Bool)

(assert (=> d!30708 (=> (not res!80303) (not e!64077))))

(assert (=> d!30708 (= res!80303 (isPrefixOf!0 (_1!4183 lt!141565) (_2!4183 lt!141565)))))

(declare-fun lt!141564 () BitStream!3668)

(assert (=> d!30708 (= lt!141565 (tuple2!7863 lt!141564 (_2!4182 lt!141380)))))

(declare-fun lt!141562 () Unit!5964)

(declare-fun lt!141557 () Unit!5964)

(assert (=> d!30708 (= lt!141562 lt!141557)))

(assert (=> d!30708 (isPrefixOf!0 lt!141564 (_2!4182 lt!141380))))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3668 BitStream!3668 BitStream!3668) Unit!5964)

(assert (=> d!30708 (= lt!141557 (lemmaIsPrefixTransitive!0 lt!141564 (_2!4182 lt!141380) (_2!4182 lt!141380)))))

(declare-fun lt!141571 () Unit!5964)

(declare-fun lt!141561 () Unit!5964)

(assert (=> d!30708 (= lt!141571 lt!141561)))

(assert (=> d!30708 (isPrefixOf!0 lt!141564 (_2!4182 lt!141380))))

(assert (=> d!30708 (= lt!141561 (lemmaIsPrefixTransitive!0 lt!141564 thiss!1288 (_2!4182 lt!141380)))))

(declare-fun lt!141552 () Unit!5964)

(assert (=> d!30708 (= lt!141552 e!64078)))

(declare-fun c!6179 () Bool)

(assert (=> d!30708 (= c!6179 (not (= (size!2097 (buf!2445 thiss!1288)) #b00000000000000000000000000000000)))))

(declare-fun lt!141563 () Unit!5964)

(declare-fun lt!141556 () Unit!5964)

(assert (=> d!30708 (= lt!141563 lt!141556)))

(assert (=> d!30708 (isPrefixOf!0 (_2!4182 lt!141380) (_2!4182 lt!141380))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!3668) Unit!5964)

(assert (=> d!30708 (= lt!141556 (lemmaIsPrefixRefl!0 (_2!4182 lt!141380)))))

(declare-fun lt!141558 () Unit!5964)

(declare-fun lt!141554 () Unit!5964)

(assert (=> d!30708 (= lt!141558 lt!141554)))

(assert (=> d!30708 (= lt!141554 (lemmaIsPrefixRefl!0 (_2!4182 lt!141380)))))

(declare-fun lt!141570 () Unit!5964)

(declare-fun lt!141559 () Unit!5964)

(assert (=> d!30708 (= lt!141570 lt!141559)))

(assert (=> d!30708 (isPrefixOf!0 lt!141564 lt!141564)))

(assert (=> d!30708 (= lt!141559 (lemmaIsPrefixRefl!0 lt!141564))))

(declare-fun lt!141567 () Unit!5964)

(declare-fun lt!141569 () Unit!5964)

(assert (=> d!30708 (= lt!141567 lt!141569)))

(assert (=> d!30708 (isPrefixOf!0 thiss!1288 thiss!1288)))

(assert (=> d!30708 (= lt!141569 (lemmaIsPrefixRefl!0 thiss!1288))))

(assert (=> d!30708 (= lt!141564 (BitStream!3669 (buf!2445 (_2!4182 lt!141380)) (currentByte!4866 thiss!1288) (currentBit!4861 thiss!1288)))))

(assert (=> d!30708 (isPrefixOf!0 thiss!1288 (_2!4182 lt!141380))))

(assert (=> d!30708 (= (reader!0 thiss!1288 (_2!4182 lt!141380)) lt!141565)))

(declare-fun b!97871 () Bool)

(declare-fun lt!141566 () (_ BitVec 64))

(declare-fun lt!141555 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!3668 (_ BitVec 64)) BitStream!3668)

(assert (=> b!97871 (= e!64077 (= (_1!4183 lt!141565) (withMovedBitIndex!0 (_2!4183 lt!141565) (bvsub lt!141566 lt!141555))))))

(assert (=> b!97871 (or (= (bvand lt!141566 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!141555 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!141566 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!141566 lt!141555) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!97871 (= lt!141555 (bitIndex!0 (size!2097 (buf!2445 (_2!4182 lt!141380))) (currentByte!4866 (_2!4182 lt!141380)) (currentBit!4861 (_2!4182 lt!141380))))))

(assert (=> b!97871 (= lt!141566 (bitIndex!0 (size!2097 (buf!2445 thiss!1288)) (currentByte!4866 thiss!1288) (currentBit!4861 thiss!1288)))))

(assert (= (and d!30708 c!6179) b!97870))

(assert (= (and d!30708 (not c!6179)) b!97869))

(assert (= (and d!30708 res!80303) b!97867))

(assert (= (and b!97867 res!80301) b!97868))

(assert (= (and b!97868 res!80302) b!97871))

(declare-fun m!142167 () Bool)

(assert (=> b!97867 m!142167))

(declare-fun m!142169 () Bool)

(assert (=> d!30708 m!142169))

(declare-fun m!142171 () Bool)

(assert (=> d!30708 m!142171))

(declare-fun m!142173 () Bool)

(assert (=> d!30708 m!142173))

(declare-fun m!142175 () Bool)

(assert (=> d!30708 m!142175))

(declare-fun m!142177 () Bool)

(assert (=> d!30708 m!142177))

(assert (=> d!30708 m!142079))

(declare-fun m!142179 () Bool)

(assert (=> d!30708 m!142179))

(declare-fun m!142181 () Bool)

(assert (=> d!30708 m!142181))

(declare-fun m!142183 () Bool)

(assert (=> d!30708 m!142183))

(declare-fun m!142185 () Bool)

(assert (=> d!30708 m!142185))

(declare-fun m!142187 () Bool)

(assert (=> d!30708 m!142187))

(declare-fun m!142189 () Bool)

(assert (=> b!97871 m!142189))

(assert (=> b!97871 m!142059))

(assert (=> b!97871 m!142061))

(declare-fun m!142193 () Bool)

(assert (=> b!97868 m!142193))

(assert (=> b!97870 m!142061))

(declare-fun m!142195 () Bool)

(assert (=> b!97870 m!142195))

(declare-fun m!142197 () Bool)

(assert (=> b!97870 m!142197))

(assert (=> b!97800 d!30708))

(declare-fun d!30716 () Bool)

(declare-fun e!64118 () Bool)

(assert (=> d!30716 e!64118))

(declare-fun res!80353 () Bool)

(assert (=> d!30716 (=> (not res!80353) (not e!64118))))

(declare-fun lt!141841 () tuple2!7860)

(assert (=> d!30716 (= res!80353 (= (size!2097 (buf!2445 thiss!1288)) (size!2097 (buf!2445 (_2!4182 lt!141841)))))))

(declare-fun e!64119 () tuple2!7860)

(assert (=> d!30716 (= lt!141841 e!64119)))

(declare-fun c!6191 () Bool)

(assert (=> d!30716 (= c!6191 (bvslt #b00000000000000000000000000000000 nBits!388))))

(assert (=> d!30716 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 nBits!388) (bvsle nBits!388 #b00000000000000000000000001000000))))

(assert (=> d!30716 (= (appendNLeastSignificantBitsLoop!0 thiss!1288 v!196 nBits!388 #b00000000000000000000000000000000) lt!141841)))

(declare-fun b!97940 () Bool)

(declare-fun lt!141813 () tuple2!7860)

(declare-fun Unit!5970 () Unit!5964)

(assert (=> b!97940 (= e!64119 (tuple2!7861 Unit!5970 (_2!4182 lt!141813)))))

(declare-fun lt!141802 () Bool)

(assert (=> b!97940 (= lt!141802 (not (= (bvand v!196 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!388 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!141812 () tuple2!7860)

(declare-fun appendBit!0 (BitStream!3668 Bool) tuple2!7860)

(assert (=> b!97940 (= lt!141812 (appendBit!0 thiss!1288 lt!141802))))

(declare-fun res!80357 () Bool)

(assert (=> b!97940 (= res!80357 (= (size!2097 (buf!2445 thiss!1288)) (size!2097 (buf!2445 (_2!4182 lt!141812)))))))

(declare-fun e!64117 () Bool)

(assert (=> b!97940 (=> (not res!80357) (not e!64117))))

(assert (=> b!97940 e!64117))

(declare-fun lt!141826 () tuple2!7860)

(assert (=> b!97940 (= lt!141826 lt!141812)))

(assert (=> b!97940 (= lt!141813 (appendNLeastSignificantBitsLoop!0 (_2!4182 lt!141826) v!196 nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!141801 () Unit!5964)

(assert (=> b!97940 (= lt!141801 (lemmaIsPrefixTransitive!0 thiss!1288 (_2!4182 lt!141826) (_2!4182 lt!141813)))))

(assert (=> b!97940 (isPrefixOf!0 thiss!1288 (_2!4182 lt!141813))))

(declare-fun lt!141833 () Unit!5964)

(assert (=> b!97940 (= lt!141833 lt!141801)))

(assert (=> b!97940 (invariant!0 (currentBit!4861 thiss!1288) (currentByte!4866 thiss!1288) (size!2097 (buf!2445 (_2!4182 lt!141826))))))

(declare-fun lt!141800 () BitStream!3668)

(assert (=> b!97940 (= lt!141800 (BitStream!3669 (buf!2445 (_2!4182 lt!141826)) (currentByte!4866 thiss!1288) (currentBit!4861 thiss!1288)))))

(assert (=> b!97940 (invariant!0 (currentBit!4861 lt!141800) (currentByte!4866 lt!141800) (size!2097 (buf!2445 (_2!4182 lt!141813))))))

(declare-fun lt!141814 () BitStream!3668)

(assert (=> b!97940 (= lt!141814 (BitStream!3669 (buf!2445 (_2!4182 lt!141813)) (currentByte!4866 lt!141800) (currentBit!4861 lt!141800)))))

(declare-datatypes ((tuple2!7868 0))(
  ( (tuple2!7869 (_1!4186 BitStream!3668) (_2!4186 Bool)) )
))
(declare-fun lt!141832 () tuple2!7868)

(declare-fun readBitPure!0 (BitStream!3668) tuple2!7868)

(assert (=> b!97940 (= lt!141832 (readBitPure!0 lt!141800))))

(declare-fun lt!141797 () tuple2!7868)

(assert (=> b!97940 (= lt!141797 (readBitPure!0 lt!141814))))

(declare-fun lt!141836 () Unit!5964)

(declare-fun readBitPrefixLemma!0 (BitStream!3668 BitStream!3668) Unit!5964)

(assert (=> b!97940 (= lt!141836 (readBitPrefixLemma!0 lt!141800 (_2!4182 lt!141813)))))

(declare-fun res!80360 () Bool)

(assert (=> b!97940 (= res!80360 (= (bitIndex!0 (size!2097 (buf!2445 (_1!4186 lt!141832))) (currentByte!4866 (_1!4186 lt!141832)) (currentBit!4861 (_1!4186 lt!141832))) (bitIndex!0 (size!2097 (buf!2445 (_1!4186 lt!141797))) (currentByte!4866 (_1!4186 lt!141797)) (currentBit!4861 (_1!4186 lt!141797)))))))

(declare-fun e!64122 () Bool)

(assert (=> b!97940 (=> (not res!80360) (not e!64122))))

(assert (=> b!97940 e!64122))

(declare-fun lt!141835 () Unit!5964)

(assert (=> b!97940 (= lt!141835 lt!141836)))

(declare-fun lt!141822 () tuple2!7862)

(assert (=> b!97940 (= lt!141822 (reader!0 thiss!1288 (_2!4182 lt!141813)))))

(declare-fun lt!141821 () tuple2!7862)

(assert (=> b!97940 (= lt!141821 (reader!0 (_2!4182 lt!141826) (_2!4182 lt!141813)))))

(declare-fun lt!141818 () tuple2!7868)

(assert (=> b!97940 (= lt!141818 (readBitPure!0 (_1!4183 lt!141822)))))

(assert (=> b!97940 (= (_2!4186 lt!141818) lt!141802)))

(declare-fun lt!141839 () Unit!5964)

(declare-fun Unit!5975 () Unit!5964)

(assert (=> b!97940 (= lt!141839 Unit!5975)))

(declare-fun lt!141806 () (_ BitVec 64))

(assert (=> b!97940 (= lt!141806 (bvand v!196 (bvnot (onesLSBLong!0 (bvsub nBits!388 #b00000000000000000000000000000000)))))))

(declare-fun lt!141837 () (_ BitVec 64))

(assert (=> b!97940 (= lt!141837 ((_ sign_extend 32) (bvsub nBits!388 #b00000000000000000000000000000000)))))

(declare-fun lt!141828 () Unit!5964)

(assert (=> b!97940 (= lt!141828 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1288 (buf!2445 (_2!4182 lt!141813)) lt!141837))))

(assert (=> b!97940 (validate_offset_bits!1 ((_ sign_extend 32) (size!2097 (buf!2445 (_2!4182 lt!141813)))) ((_ sign_extend 32) (currentByte!4866 thiss!1288)) ((_ sign_extend 32) (currentBit!4861 thiss!1288)) lt!141837)))

(declare-fun lt!141823 () Unit!5964)

(assert (=> b!97940 (= lt!141823 lt!141828)))

(declare-datatypes ((tuple2!7870 0))(
  ( (tuple2!7871 (_1!4187 BitStream!3668) (_2!4187 (_ BitVec 64))) )
))
(declare-fun lt!141803 () tuple2!7870)

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!3668 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!7870)

(assert (=> b!97940 (= lt!141803 (readNLeastSignificantBitsLoopPure!0 (_1!4183 lt!141822) nBits!388 #b00000000000000000000000000000000 lt!141806))))

(declare-fun lt!141834 () (_ BitVec 64))

(assert (=> b!97940 (= lt!141834 ((_ sign_extend 32) (bvsub (bvsub nBits!388 #b00000000000000000000000000000000) #b00000000000000000000000000000001)))))

(declare-fun lt!141808 () Unit!5964)

(assert (=> b!97940 (= lt!141808 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4182 lt!141826) (buf!2445 (_2!4182 lt!141813)) lt!141834))))

(assert (=> b!97940 (validate_offset_bits!1 ((_ sign_extend 32) (size!2097 (buf!2445 (_2!4182 lt!141813)))) ((_ sign_extend 32) (currentByte!4866 (_2!4182 lt!141826))) ((_ sign_extend 32) (currentBit!4861 (_2!4182 lt!141826))) lt!141834)))

(declare-fun lt!141817 () Unit!5964)

(assert (=> b!97940 (= lt!141817 lt!141808)))

(declare-fun lt!141798 () tuple2!7870)

(assert (=> b!97940 (= lt!141798 (readNLeastSignificantBitsLoopPure!0 (_1!4183 lt!141821) nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvor lt!141806 (ite (_2!4186 lt!141818) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!388 #b00000000000000000000000000000001) #b00000000000000000000000000000000))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!141816 () tuple2!7870)

(assert (=> b!97940 (= lt!141816 (readNLeastSignificantBitsLoopPure!0 (_1!4183 lt!141822) nBits!388 #b00000000000000000000000000000000 lt!141806))))

(declare-fun c!6190 () Bool)

(assert (=> b!97940 (= c!6190 (_2!4186 (readBitPure!0 (_1!4183 lt!141822))))))

(declare-fun lt!141811 () tuple2!7870)

(declare-fun e!64120 () (_ BitVec 64))

(assert (=> b!97940 (= lt!141811 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4183 lt!141822) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvor lt!141806 e!64120)))))

(declare-fun lt!141831 () Unit!5964)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!3668 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!5964)

(assert (=> b!97940 (= lt!141831 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4183 lt!141822) nBits!388 #b00000000000000000000000000000000 lt!141806))))

(assert (=> b!97940 (and (= (_2!4187 lt!141816) (_2!4187 lt!141811)) (= (_1!4187 lt!141816) (_1!4187 lt!141811)))))

(declare-fun lt!141815 () Unit!5964)

(assert (=> b!97940 (= lt!141815 lt!141831)))

(assert (=> b!97940 (= (_1!4183 lt!141822) (withMovedBitIndex!0 (_2!4183 lt!141822) (bvsub (bitIndex!0 (size!2097 (buf!2445 thiss!1288)) (currentByte!4866 thiss!1288) (currentBit!4861 thiss!1288)) (bitIndex!0 (size!2097 (buf!2445 (_2!4182 lt!141813))) (currentByte!4866 (_2!4182 lt!141813)) (currentBit!4861 (_2!4182 lt!141813))))))))

(declare-fun lt!141824 () Unit!5964)

(declare-fun Unit!5976 () Unit!5964)

(assert (=> b!97940 (= lt!141824 Unit!5976)))

(assert (=> b!97940 (= (_1!4183 lt!141821) (withMovedBitIndex!0 (_2!4183 lt!141821) (bvsub (bitIndex!0 (size!2097 (buf!2445 (_2!4182 lt!141826))) (currentByte!4866 (_2!4182 lt!141826)) (currentBit!4861 (_2!4182 lt!141826))) (bitIndex!0 (size!2097 (buf!2445 (_2!4182 lt!141813))) (currentByte!4866 (_2!4182 lt!141813)) (currentBit!4861 (_2!4182 lt!141813))))))))

(declare-fun lt!141799 () Unit!5964)

(declare-fun Unit!5977 () Unit!5964)

(assert (=> b!97940 (= lt!141799 Unit!5977)))

(assert (=> b!97940 (= (bitIndex!0 (size!2097 (buf!2445 thiss!1288)) (currentByte!4866 thiss!1288) (currentBit!4861 thiss!1288)) (bvsub (bitIndex!0 (size!2097 (buf!2445 (_2!4182 lt!141826))) (currentByte!4866 (_2!4182 lt!141826)) (currentBit!4861 (_2!4182 lt!141826))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!141829 () Unit!5964)

(declare-fun Unit!5978 () Unit!5964)

(assert (=> b!97940 (= lt!141829 Unit!5978)))

(assert (=> b!97940 (= (_2!4187 lt!141803) (_2!4187 lt!141798))))

(declare-fun lt!141810 () Unit!5964)

(declare-fun Unit!5979 () Unit!5964)

(assert (=> b!97940 (= lt!141810 Unit!5979)))

(assert (=> b!97940 (= (_1!4187 lt!141803) (_2!4183 lt!141822))))

(declare-fun b!97941 () Bool)

(declare-fun res!80359 () Bool)

(assert (=> b!97941 (=> (not res!80359) (not e!64118))))

(declare-fun lt!141809 () (_ BitVec 64))

(declare-fun lt!141840 () (_ BitVec 64))

(assert (=> b!97941 (= res!80359 (= (bitIndex!0 (size!2097 (buf!2445 (_2!4182 lt!141841))) (currentByte!4866 (_2!4182 lt!141841)) (currentBit!4861 (_2!4182 lt!141841))) (bvadd lt!141809 lt!141840)))))

(assert (=> b!97941 (or (not (= (bvand lt!141809 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!141840 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!141809 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!141809 lt!141840) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!97941 (= lt!141840 ((_ sign_extend 32) (bvsub nBits!388 #b00000000000000000000000000000000)))))

(assert (=> b!97941 (or (= (bvand nBits!388 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand nBits!388 #b10000000000000000000000000000000) (bvand (bvsub nBits!388 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(assert (=> b!97941 (= lt!141809 (bitIndex!0 (size!2097 (buf!2445 thiss!1288)) (currentByte!4866 thiss!1288) (currentBit!4861 thiss!1288)))))

(declare-fun b!97942 () Bool)

(declare-fun res!80355 () Bool)

(declare-fun call!1210 () Bool)

(assert (=> b!97942 (= res!80355 call!1210)))

(assert (=> b!97942 (=> (not res!80355) (not e!64117))))

(declare-fun b!97943 () Bool)

(declare-fun res!80356 () Bool)

(assert (=> b!97943 (= res!80356 (= (bitIndex!0 (size!2097 (buf!2445 (_2!4182 lt!141812))) (currentByte!4866 (_2!4182 lt!141812)) (currentBit!4861 (_2!4182 lt!141812))) (bvadd (bitIndex!0 (size!2097 (buf!2445 thiss!1288)) (currentByte!4866 thiss!1288) (currentBit!4861 thiss!1288)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!97943 (=> (not res!80356) (not e!64117))))

(declare-fun b!97944 () Bool)

(assert (=> b!97944 (= e!64120 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!388 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!97945 () Bool)

(declare-fun e!64121 () Bool)

(declare-fun lt!141807 () (_ BitVec 64))

(assert (=> b!97945 (= e!64121 (validate_offset_bits!1 ((_ sign_extend 32) (size!2097 (buf!2445 thiss!1288))) ((_ sign_extend 32) (currentByte!4866 thiss!1288)) ((_ sign_extend 32) (currentBit!4861 thiss!1288)) lt!141807))))

(declare-fun b!97946 () Bool)

(declare-fun lt!141827 () tuple2!7868)

(declare-fun readerFrom!0 (BitStream!3668 (_ BitVec 32) (_ BitVec 32)) BitStream!3668)

(assert (=> b!97946 (= lt!141827 (readBitPure!0 (readerFrom!0 (_2!4182 lt!141812) (currentBit!4861 thiss!1288) (currentByte!4866 thiss!1288))))))

(declare-fun res!80358 () Bool)

(assert (=> b!97946 (= res!80358 (and (= (_2!4186 lt!141827) lt!141802) (= (_1!4186 lt!141827) (_2!4182 lt!141812))))))

(declare-fun e!64116 () Bool)

(assert (=> b!97946 (=> (not res!80358) (not e!64116))))

(assert (=> b!97946 (= e!64117 e!64116)))

(declare-fun b!97947 () Bool)

(assert (=> b!97947 (= e!64122 (= (_2!4186 lt!141832) (_2!4186 lt!141797)))))

(declare-fun b!97948 () Bool)

(assert (=> b!97948 (= e!64116 (= (bitIndex!0 (size!2097 (buf!2445 (_1!4186 lt!141827))) (currentByte!4866 (_1!4186 lt!141827)) (currentBit!4861 (_1!4186 lt!141827))) (bitIndex!0 (size!2097 (buf!2445 (_2!4182 lt!141812))) (currentByte!4866 (_2!4182 lt!141812)) (currentBit!4861 (_2!4182 lt!141812)))))))

(declare-fun bm!1207 () Bool)

(declare-fun lt!141830 () BitStream!3668)

(assert (=> bm!1207 (= call!1210 (isPrefixOf!0 (ite c!6191 thiss!1288 lt!141830) (ite c!6191 (_2!4182 lt!141812) lt!141830)))))

(declare-fun b!97949 () Bool)

(assert (=> b!97949 (= e!64120 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!97950 () Bool)

(declare-fun lt!141838 () Unit!5964)

(assert (=> b!97950 (= e!64119 (tuple2!7861 lt!141838 thiss!1288))))

(assert (=> b!97950 (= lt!141830 thiss!1288)))

(assert (=> b!97950 (= lt!141838 (lemmaIsPrefixRefl!0 lt!141830))))

(assert (=> b!97950 call!1210))

(declare-fun b!97951 () Bool)

(declare-fun res!80354 () Bool)

(assert (=> b!97951 (=> (not res!80354) (not e!64118))))

(assert (=> b!97951 (= res!80354 (isPrefixOf!0 thiss!1288 (_2!4182 lt!141841)))))

(declare-fun lt!141820 () tuple2!7862)

(declare-fun b!97952 () Bool)

(declare-fun lt!141805 () tuple2!7870)

(assert (=> b!97952 (= e!64118 (and (= (_2!4187 lt!141805) v!196) (= (_1!4187 lt!141805) (_2!4183 lt!141820))))))

(declare-fun lt!141804 () (_ BitVec 64))

(assert (=> b!97952 (= lt!141805 (readNLeastSignificantBitsLoopPure!0 (_1!4183 lt!141820) nBits!388 #b00000000000000000000000000000000 lt!141804))))

(declare-fun lt!141825 () Unit!5964)

(declare-fun lt!141819 () Unit!5964)

(assert (=> b!97952 (= lt!141825 lt!141819)))

(assert (=> b!97952 (validate_offset_bits!1 ((_ sign_extend 32) (size!2097 (buf!2445 (_2!4182 lt!141841)))) ((_ sign_extend 32) (currentByte!4866 thiss!1288)) ((_ sign_extend 32) (currentBit!4861 thiss!1288)) lt!141807)))

(assert (=> b!97952 (= lt!141819 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1288 (buf!2445 (_2!4182 lt!141841)) lt!141807))))

(assert (=> b!97952 e!64121))

(declare-fun res!80352 () Bool)

(assert (=> b!97952 (=> (not res!80352) (not e!64121))))

(assert (=> b!97952 (= res!80352 (and (= (size!2097 (buf!2445 thiss!1288)) (size!2097 (buf!2445 (_2!4182 lt!141841)))) (bvsge lt!141807 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!97952 (= lt!141807 ((_ sign_extend 32) (bvsub nBits!388 #b00000000000000000000000000000000)))))

(assert (=> b!97952 (or (= (bvand nBits!388 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand nBits!388 #b10000000000000000000000000000000) (bvand (bvsub nBits!388 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(assert (=> b!97952 (= lt!141804 (bvand v!196 (bvnot (onesLSBLong!0 (bvsub nBits!388 #b00000000000000000000000000000000)))))))

(assert (=> b!97952 (or (= (bvand nBits!388 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand nBits!388 #b10000000000000000000000000000000) (bvand (bvsub nBits!388 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(assert (=> b!97952 (= lt!141820 (reader!0 thiss!1288 (_2!4182 lt!141841)))))

(assert (= (and d!30716 c!6191) b!97940))

(assert (= (and d!30716 (not c!6191)) b!97950))

(assert (= (and b!97940 res!80357) b!97943))

(assert (= (and b!97943 res!80356) b!97942))

(assert (= (and b!97942 res!80355) b!97946))

(assert (= (and b!97946 res!80358) b!97948))

(assert (= (and b!97940 res!80360) b!97947))

(assert (= (and b!97940 c!6190) b!97944))

(assert (= (and b!97940 (not c!6190)) b!97949))

(assert (= (or b!97942 b!97950) bm!1207))

(assert (= (and d!30716 res!80353) b!97941))

(assert (= (and b!97941 res!80359) b!97951))

(assert (= (and b!97951 res!80354) b!97952))

(assert (= (and b!97952 res!80352) b!97945))

(declare-fun m!142283 () Bool)

(assert (=> b!97952 m!142283))

(declare-fun m!142285 () Bool)

(assert (=> b!97952 m!142285))

(declare-fun m!142287 () Bool)

(assert (=> b!97952 m!142287))

(declare-fun m!142289 () Bool)

(assert (=> b!97952 m!142289))

(declare-fun m!142291 () Bool)

(assert (=> b!97952 m!142291))

(declare-fun m!142293 () Bool)

(assert (=> bm!1207 m!142293))

(declare-fun m!142295 () Bool)

(assert (=> b!97946 m!142295))

(assert (=> b!97946 m!142295))

(declare-fun m!142297 () Bool)

(assert (=> b!97946 m!142297))

(declare-fun m!142299 () Bool)

(assert (=> b!97951 m!142299))

(declare-fun m!142301 () Bool)

(assert (=> b!97948 m!142301))

(declare-fun m!142303 () Bool)

(assert (=> b!97948 m!142303))

(declare-fun m!142305 () Bool)

(assert (=> b!97940 m!142305))

(declare-fun m!142307 () Bool)

(assert (=> b!97940 m!142307))

(declare-fun m!142309 () Bool)

(assert (=> b!97940 m!142309))

(declare-fun m!142311 () Bool)

(assert (=> b!97940 m!142311))

(declare-fun m!142313 () Bool)

(assert (=> b!97940 m!142313))

(declare-fun m!142315 () Bool)

(assert (=> b!97940 m!142315))

(declare-fun m!142317 () Bool)

(assert (=> b!97940 m!142317))

(declare-fun m!142319 () Bool)

(assert (=> b!97940 m!142319))

(declare-fun m!142321 () Bool)

(assert (=> b!97940 m!142321))

(declare-fun m!142323 () Bool)

(assert (=> b!97940 m!142323))

(declare-fun m!142325 () Bool)

(assert (=> b!97940 m!142325))

(assert (=> b!97940 m!142061))

(declare-fun m!142327 () Bool)

(assert (=> b!97940 m!142327))

(declare-fun m!142329 () Bool)

(assert (=> b!97940 m!142329))

(declare-fun m!142331 () Bool)

(assert (=> b!97940 m!142331))

(declare-fun m!142333 () Bool)

(assert (=> b!97940 m!142333))

(declare-fun m!142335 () Bool)

(assert (=> b!97940 m!142335))

(declare-fun m!142337 () Bool)

(assert (=> b!97940 m!142337))

(declare-fun m!142339 () Bool)

(assert (=> b!97940 m!142339))

(declare-fun m!142341 () Bool)

(assert (=> b!97940 m!142341))

(declare-fun m!142343 () Bool)

(assert (=> b!97940 m!142343))

(declare-fun m!142345 () Bool)

(assert (=> b!97940 m!142345))

(declare-fun m!142347 () Bool)

(assert (=> b!97940 m!142347))

(declare-fun m!142349 () Bool)

(assert (=> b!97940 m!142349))

(declare-fun m!142351 () Bool)

(assert (=> b!97940 m!142351))

(assert (=> b!97940 m!142285))

(declare-fun m!142353 () Bool)

(assert (=> b!97940 m!142353))

(assert (=> b!97940 m!142309))

(declare-fun m!142355 () Bool)

(assert (=> b!97940 m!142355))

(declare-fun m!142357 () Bool)

(assert (=> b!97940 m!142357))

(declare-fun m!142359 () Bool)

(assert (=> b!97950 m!142359))

(declare-fun m!142361 () Bool)

(assert (=> b!97941 m!142361))

(assert (=> b!97941 m!142061))

(assert (=> b!97943 m!142303))

(assert (=> b!97943 m!142061))

(declare-fun m!142363 () Bool)

(assert (=> b!97945 m!142363))

(assert (=> b!97799 d!30716))

(declare-fun d!30728 () Bool)

(assert (=> d!30728 (= (onesLSBLong!0 nBits!388) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!388))))))

(assert (=> b!97798 d!30728))

(declare-fun d!30730 () Bool)

(assert (=> d!30730 (= (array_inv!1899 (buf!2445 thiss!1288)) (bvsge (size!2097 (buf!2445 thiss!1288)) #b00000000000000000000000000000000))))

(assert (=> b!97797 d!30730))

(declare-fun d!30732 () Bool)

(declare-fun e!64129 () Bool)

(assert (=> d!30732 e!64129))

(declare-fun res!80373 () Bool)

(assert (=> d!30732 (=> (not res!80373) (not e!64129))))

(declare-fun lt!141878 () (_ BitVec 64))

(declare-fun lt!141879 () (_ BitVec 64))

(declare-fun lt!141880 () (_ BitVec 64))

(assert (=> d!30732 (= res!80373 (= lt!141880 (bvsub lt!141878 lt!141879)))))

(assert (=> d!30732 (or (= (bvand lt!141878 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!141879 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!141878 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!141878 lt!141879) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!30732 (= lt!141879 (remainingBits!0 ((_ sign_extend 32) (size!2097 (buf!2445 (_2!4182 lt!141380)))) ((_ sign_extend 32) (currentByte!4866 (_2!4182 lt!141380))) ((_ sign_extend 32) (currentBit!4861 (_2!4182 lt!141380)))))))

(declare-fun lt!141881 () (_ BitVec 64))

(declare-fun lt!141883 () (_ BitVec 64))

(assert (=> d!30732 (= lt!141878 (bvmul lt!141881 lt!141883))))

(assert (=> d!30732 (or (= lt!141881 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!141883 (bvsdiv (bvmul lt!141881 lt!141883) lt!141881)))))

(assert (=> d!30732 (= lt!141883 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!30732 (= lt!141881 ((_ sign_extend 32) (size!2097 (buf!2445 (_2!4182 lt!141380)))))))

(assert (=> d!30732 (= lt!141880 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4866 (_2!4182 lt!141380))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4861 (_2!4182 lt!141380)))))))

(assert (=> d!30732 (invariant!0 (currentBit!4861 (_2!4182 lt!141380)) (currentByte!4866 (_2!4182 lt!141380)) (size!2097 (buf!2445 (_2!4182 lt!141380))))))

(assert (=> d!30732 (= (bitIndex!0 (size!2097 (buf!2445 (_2!4182 lt!141380))) (currentByte!4866 (_2!4182 lt!141380)) (currentBit!4861 (_2!4182 lt!141380))) lt!141880)))

(declare-fun b!97965 () Bool)

(declare-fun res!80374 () Bool)

(assert (=> b!97965 (=> (not res!80374) (not e!64129))))

(assert (=> b!97965 (= res!80374 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!141880))))

(declare-fun b!97966 () Bool)

(declare-fun lt!141882 () (_ BitVec 64))

(assert (=> b!97966 (= e!64129 (bvsle lt!141880 (bvmul lt!141882 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!97966 (or (= lt!141882 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!141882 #b0000000000000000000000000000000000000000000000000000000000001000) lt!141882)))))

(assert (=> b!97966 (= lt!141882 ((_ sign_extend 32) (size!2097 (buf!2445 (_2!4182 lt!141380)))))))

(assert (= (and d!30732 res!80373) b!97965))

(assert (= (and b!97965 res!80374) b!97966))

(declare-fun m!142371 () Bool)

(assert (=> d!30732 m!142371))

(declare-fun m!142373 () Bool)

(assert (=> d!30732 m!142373))

(assert (=> b!97802 d!30732))

(declare-fun d!30738 () Bool)

(declare-fun e!64130 () Bool)

(assert (=> d!30738 e!64130))

(declare-fun res!80375 () Bool)

(assert (=> d!30738 (=> (not res!80375) (not e!64130))))

(declare-fun lt!141885 () (_ BitVec 64))

(declare-fun lt!141886 () (_ BitVec 64))

(declare-fun lt!141884 () (_ BitVec 64))

(assert (=> d!30738 (= res!80375 (= lt!141886 (bvsub lt!141884 lt!141885)))))

(assert (=> d!30738 (or (= (bvand lt!141884 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!141885 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!141884 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!141884 lt!141885) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!30738 (= lt!141885 (remainingBits!0 ((_ sign_extend 32) (size!2097 (buf!2445 thiss!1288))) ((_ sign_extend 32) (currentByte!4866 thiss!1288)) ((_ sign_extend 32) (currentBit!4861 thiss!1288))))))

(declare-fun lt!141887 () (_ BitVec 64))

(declare-fun lt!141889 () (_ BitVec 64))

(assert (=> d!30738 (= lt!141884 (bvmul lt!141887 lt!141889))))

(assert (=> d!30738 (or (= lt!141887 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!141889 (bvsdiv (bvmul lt!141887 lt!141889) lt!141887)))))

(assert (=> d!30738 (= lt!141889 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!30738 (= lt!141887 ((_ sign_extend 32) (size!2097 (buf!2445 thiss!1288))))))

(assert (=> d!30738 (= lt!141886 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4866 thiss!1288)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4861 thiss!1288))))))

(assert (=> d!30738 (invariant!0 (currentBit!4861 thiss!1288) (currentByte!4866 thiss!1288) (size!2097 (buf!2445 thiss!1288)))))

(assert (=> d!30738 (= (bitIndex!0 (size!2097 (buf!2445 thiss!1288)) (currentByte!4866 thiss!1288) (currentBit!4861 thiss!1288)) lt!141886)))

(declare-fun b!97967 () Bool)

(declare-fun res!80376 () Bool)

(assert (=> b!97967 (=> (not res!80376) (not e!64130))))

(assert (=> b!97967 (= res!80376 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!141886))))

(declare-fun b!97968 () Bool)

(declare-fun lt!141888 () (_ BitVec 64))

(assert (=> b!97968 (= e!64130 (bvsle lt!141886 (bvmul lt!141888 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!97968 (or (= lt!141888 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!141888 #b0000000000000000000000000000000000000000000000000000000000001000) lt!141888)))))

(assert (=> b!97968 (= lt!141888 ((_ sign_extend 32) (size!2097 (buf!2445 thiss!1288))))))

(assert (= (and d!30738 res!80375) b!97967))

(assert (= (and b!97967 res!80376) b!97968))

(declare-fun m!142375 () Bool)

(assert (=> d!30738 m!142375))

(assert (=> d!30738 m!142099))

(assert (=> b!97802 d!30738))

(declare-fun d!30740 () Bool)

(assert (=> d!30740 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2097 (buf!2445 thiss!1288))) ((_ sign_extend 32) (currentByte!4866 thiss!1288)) ((_ sign_extend 32) (currentBit!4861 thiss!1288)) ((_ sign_extend 32) nBits!388)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2097 (buf!2445 thiss!1288))) ((_ sign_extend 32) (currentByte!4866 thiss!1288)) ((_ sign_extend 32) (currentBit!4861 thiss!1288))) ((_ sign_extend 32) nBits!388)))))

(declare-fun bs!7524 () Bool)

(assert (= bs!7524 d!30740))

(assert (=> bs!7524 m!142375))

(assert (=> b!97796 d!30740))

(push 1)

(assert (not d!30708))

(assert (not b!97951))

(assert (not b!97946))

(assert (not b!97945))

(assert (not b!97867))

(assert (not d!30702))

(assert (not d!30732))

(assert (not b!97818))

(assert (not b!97868))

(assert (not bm!1207))

(assert (not d!30704))

(assert (not d!30738))

(assert (not b!97943))

(assert (not b!97940))

(assert (not b!97820))

(assert (not d!30740))

(assert (not b!97948))

(assert (not b!97871))

(assert (not d!30700))

(assert (not b!97870))

(assert (not b!97941))

(assert (not b!97952))

(assert (not d!30706))

(assert (not b!97950))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

