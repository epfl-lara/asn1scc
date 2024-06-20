; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38714 () Bool)

(assert start!38714)

(declare-fun b!174376 () Bool)

(declare-fun res!144422 () Bool)

(declare-fun e!121605 () Bool)

(assert (=> b!174376 (=> res!144422 e!121605)))

(declare-datatypes ((array!9389 0))(
  ( (array!9390 (arr!5073 (Array (_ BitVec 32) (_ BitVec 8))) (size!4143 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7394 0))(
  ( (BitStream!7395 (buf!4574 array!9389) (currentByte!8688 (_ BitVec 32)) (currentBit!8683 (_ BitVec 32))) )
))
(declare-fun thiss!1187 () BitStream!7394)

(declare-fun nBits!340 () (_ BitVec 32))

(declare-datatypes ((Unit!12540 0))(
  ( (Unit!12541) )
))
(declare-datatypes ((tuple2!15052 0))(
  ( (tuple2!15053 (_1!8168 Unit!12540) (_2!8168 BitStream!7394)) )
))
(declare-fun lt!268755 () tuple2!15052)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!174376 (= res!144422 (not (= (bitIndex!0 (size!4143 (buf!4574 (_2!8168 lt!268755))) (currentByte!8688 (_2!8168 lt!268755)) (currentBit!8683 (_2!8168 lt!268755))) (bvadd (bitIndex!0 (size!4143 (buf!4574 thiss!1187)) (currentByte!8688 thiss!1187) (currentBit!8683 thiss!1187)) ((_ sign_extend 32) nBits!340)))))))

(declare-fun b!174377 () Bool)

(declare-fun res!144421 () Bool)

(declare-fun e!121606 () Bool)

(assert (=> b!174377 (=> (not res!144421) (not e!121606))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!174377 (= res!144421 (invariant!0 (currentBit!8683 thiss!1187) (currentByte!8688 thiss!1187) (size!4143 (buf!4574 thiss!1187))))))

(declare-fun b!174378 () Bool)

(declare-fun e!121604 () Bool)

(declare-datatypes ((tuple2!15054 0))(
  ( (tuple2!15055 (_1!8169 BitStream!7394) (_2!8169 (_ BitVec 64))) )
))
(declare-fun lt!268757 () tuple2!15054)

(declare-datatypes ((tuple2!15056 0))(
  ( (tuple2!15057 (_1!8170 BitStream!7394) (_2!8170 BitStream!7394)) )
))
(declare-fun lt!268754 () tuple2!15056)

(assert (=> b!174378 (= e!121604 (not (= (_1!8169 lt!268757) (_2!8170 lt!268754))))))

(declare-fun b!174379 () Bool)

(assert (=> b!174379 (= e!121606 e!121605)))

(declare-fun res!144420 () Bool)

(assert (=> b!174379 (=> res!144420 e!121605)))

(assert (=> b!174379 (= res!144420 (not (= (size!4143 (buf!4574 (_2!8168 lt!268755))) (size!4143 (buf!4574 thiss!1187)))))))

(declare-fun v!186 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7394 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!15052)

(assert (=> b!174379 (= lt!268755 (appendBitsLSBFirstLoopTR!0 thiss!1187 v!186 nBits!340 #b00000000000000000000000000000000))))

(declare-fun b!174380 () Bool)

(declare-fun res!144419 () Bool)

(assert (=> b!174380 (=> res!144419 e!121605)))

(assert (=> b!174380 (= res!144419 (not (= (size!4143 (buf!4574 thiss!1187)) (size!4143 (buf!4574 (_2!8168 lt!268755))))))))

(declare-fun b!174381 () Bool)

(declare-fun res!144425 () Bool)

(assert (=> b!174381 (=> res!144425 e!121605)))

(declare-fun isPrefixOf!0 (BitStream!7394 BitStream!7394) Bool)

(assert (=> b!174381 (= res!144425 (not (isPrefixOf!0 thiss!1187 (_2!8168 lt!268755))))))

(declare-fun b!174382 () Bool)

(declare-fun e!121603 () Bool)

(declare-fun array_inv!3884 (array!9389) Bool)

(assert (=> b!174382 (= e!121603 (array_inv!3884 (buf!4574 thiss!1187)))))

(declare-fun b!174383 () Bool)

(declare-fun res!144426 () Bool)

(assert (=> b!174383 (=> (not res!144426) (not e!121606))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!174383 (= res!144426 (validate_offset_bits!1 ((_ sign_extend 32) (size!4143 (buf!4574 thiss!1187))) ((_ sign_extend 32) (currentByte!8688 thiss!1187)) ((_ sign_extend 32) (currentBit!8683 thiss!1187)) ((_ sign_extend 32) nBits!340)))))

(declare-fun res!144423 () Bool)

(assert (=> start!38714 (=> (not res!144423) (not e!121606))))

(assert (=> start!38714 (= res!144423 (and (bvsge nBits!340 #b00000000000000000000000000000000) (bvsle nBits!340 #b00000000000000000000000001000000)))))

(assert (=> start!38714 e!121606))

(assert (=> start!38714 true))

(declare-fun inv!12 (BitStream!7394) Bool)

(assert (=> start!38714 (and (inv!12 thiss!1187) e!121603)))

(declare-fun b!174384 () Bool)

(assert (=> b!174384 (= e!121605 e!121604)))

(declare-fun res!144424 () Bool)

(assert (=> b!174384 (=> res!144424 e!121604)))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!174384 (= res!144424 (not (= (_2!8169 lt!268757) (bvand v!186 (onesLSBLong!0 nBits!340)))))))

(declare-fun readNBitsLSBFirstPure!0 (BitStream!7394 (_ BitVec 32)) tuple2!15054)

(assert (=> b!174384 (= lt!268757 (readNBitsLSBFirstPure!0 (_1!8170 lt!268754) nBits!340))))

(assert (=> b!174384 (validate_offset_bits!1 ((_ sign_extend 32) (size!4143 (buf!4574 (_2!8168 lt!268755)))) ((_ sign_extend 32) (currentByte!8688 thiss!1187)) ((_ sign_extend 32) (currentBit!8683 thiss!1187)) ((_ sign_extend 32) nBits!340))))

(declare-fun lt!268756 () Unit!12540)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7394 array!9389 (_ BitVec 64)) Unit!12540)

(assert (=> b!174384 (= lt!268756 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1187 (buf!4574 (_2!8168 lt!268755)) ((_ sign_extend 32) nBits!340)))))

(declare-fun reader!0 (BitStream!7394 BitStream!7394) tuple2!15056)

(assert (=> b!174384 (= lt!268754 (reader!0 thiss!1187 (_2!8168 lt!268755)))))

(assert (= (and start!38714 res!144423) b!174383))

(assert (= (and b!174383 res!144426) b!174377))

(assert (= (and b!174377 res!144421) b!174379))

(assert (= (and b!174379 (not res!144420)) b!174376))

(assert (= (and b!174376 (not res!144422)) b!174380))

(assert (= (and b!174380 (not res!144419)) b!174381))

(assert (= (and b!174381 (not res!144425)) b!174384))

(assert (= (and b!174384 (not res!144424)) b!174378))

(assert (= start!38714 b!174382))

(declare-fun m!273727 () Bool)

(assert (=> b!174379 m!273727))

(declare-fun m!273729 () Bool)

(assert (=> b!174383 m!273729))

(declare-fun m!273731 () Bool)

(assert (=> start!38714 m!273731))

(declare-fun m!273733 () Bool)

(assert (=> b!174377 m!273733))

(declare-fun m!273735 () Bool)

(assert (=> b!174381 m!273735))

(declare-fun m!273737 () Bool)

(assert (=> b!174384 m!273737))

(declare-fun m!273739 () Bool)

(assert (=> b!174384 m!273739))

(declare-fun m!273741 () Bool)

(assert (=> b!174384 m!273741))

(declare-fun m!273743 () Bool)

(assert (=> b!174384 m!273743))

(declare-fun m!273745 () Bool)

(assert (=> b!174384 m!273745))

(declare-fun m!273747 () Bool)

(assert (=> b!174382 m!273747))

(declare-fun m!273749 () Bool)

(assert (=> b!174376 m!273749))

(declare-fun m!273751 () Bool)

(assert (=> b!174376 m!273751))

(push 1)

(assert (not b!174379))

(assert (not start!38714))

(assert (not b!174382))

(assert (not b!174383))

(assert (not b!174377))

(assert (not b!174381))

(assert (not b!174384))

(assert (not b!174376))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!61419 () Bool)

(assert (=> d!61419 (validate_offset_bits!1 ((_ sign_extend 32) (size!4143 (buf!4574 (_2!8168 lt!268755)))) ((_ sign_extend 32) (currentByte!8688 thiss!1187)) ((_ sign_extend 32) (currentBit!8683 thiss!1187)) ((_ sign_extend 32) nBits!340))))

(declare-fun lt!268877 () Unit!12540)

(declare-fun choose!9 (BitStream!7394 array!9389 (_ BitVec 64) BitStream!7394) Unit!12540)

(assert (=> d!61419 (= lt!268877 (choose!9 thiss!1187 (buf!4574 (_2!8168 lt!268755)) ((_ sign_extend 32) nBits!340) (BitStream!7395 (buf!4574 (_2!8168 lt!268755)) (currentByte!8688 thiss!1187) (currentBit!8683 thiss!1187))))))

(assert (=> d!61419 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1187 (buf!4574 (_2!8168 lt!268755)) ((_ sign_extend 32) nBits!340)) lt!268877)))

(declare-fun bs!15308 () Bool)

(assert (= bs!15308 d!61419))

(assert (=> bs!15308 m!273743))

(declare-fun m!273805 () Bool)

(assert (=> bs!15308 m!273805))

(assert (=> b!174384 d!61419))

(declare-fun d!61427 () Bool)

(assert (=> d!61427 (= (onesLSBLong!0 nBits!340) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!340))))))

(assert (=> b!174384 d!61427))

(declare-fun d!61431 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!61431 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4143 (buf!4574 (_2!8168 lt!268755)))) ((_ sign_extend 32) (currentByte!8688 thiss!1187)) ((_ sign_extend 32) (currentBit!8683 thiss!1187)) ((_ sign_extend 32) nBits!340)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4143 (buf!4574 (_2!8168 lt!268755)))) ((_ sign_extend 32) (currentByte!8688 thiss!1187)) ((_ sign_extend 32) (currentBit!8683 thiss!1187))) ((_ sign_extend 32) nBits!340)))))

(declare-fun bs!15309 () Bool)

(assert (= bs!15309 d!61431))

(declare-fun m!273807 () Bool)

(assert (=> bs!15309 m!273807))

(assert (=> b!174384 d!61431))

(declare-fun e!121632 () Bool)

(declare-fun lt!268929 () tuple2!15056)

(declare-fun lt!268918 () (_ BitVec 64))

(declare-fun b!174435 () Bool)

(declare-fun lt!268926 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!7394 (_ BitVec 64)) BitStream!7394)

(assert (=> b!174435 (= e!121632 (= (_1!8170 lt!268929) (withMovedBitIndex!0 (_2!8170 lt!268929) (bvsub lt!268926 lt!268918))))))

(assert (=> b!174435 (or (= (bvand lt!268926 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!268918 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!268926 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!268926 lt!268918) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!174435 (= lt!268918 (bitIndex!0 (size!4143 (buf!4574 (_2!8168 lt!268755))) (currentByte!8688 (_2!8168 lt!268755)) (currentBit!8683 (_2!8168 lt!268755))))))

(assert (=> b!174435 (= lt!268926 (bitIndex!0 (size!4143 (buf!4574 thiss!1187)) (currentByte!8688 thiss!1187) (currentBit!8683 thiss!1187)))))

(declare-fun d!61435 () Bool)

(assert (=> d!61435 e!121632))

(declare-fun res!144468 () Bool)

(assert (=> d!61435 (=> (not res!144468) (not e!121632))))

(assert (=> d!61435 (= res!144468 (isPrefixOf!0 (_1!8170 lt!268929) (_2!8170 lt!268929)))))

(declare-fun lt!268920 () BitStream!7394)

(assert (=> d!61435 (= lt!268929 (tuple2!15057 lt!268920 (_2!8168 lt!268755)))))

(declare-fun lt!268931 () Unit!12540)

(declare-fun lt!268922 () Unit!12540)

(assert (=> d!61435 (= lt!268931 lt!268922)))

(assert (=> d!61435 (isPrefixOf!0 lt!268920 (_2!8168 lt!268755))))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7394 BitStream!7394 BitStream!7394) Unit!12540)

(assert (=> d!61435 (= lt!268922 (lemmaIsPrefixTransitive!0 lt!268920 (_2!8168 lt!268755) (_2!8168 lt!268755)))))

(declare-fun lt!268927 () Unit!12540)

(declare-fun lt!268933 () Unit!12540)

(assert (=> d!61435 (= lt!268927 lt!268933)))

(assert (=> d!61435 (isPrefixOf!0 lt!268920 (_2!8168 lt!268755))))

(assert (=> d!61435 (= lt!268933 (lemmaIsPrefixTransitive!0 lt!268920 thiss!1187 (_2!8168 lt!268755)))))

(declare-fun lt!268921 () Unit!12540)

(declare-fun e!121631 () Unit!12540)

(assert (=> d!61435 (= lt!268921 e!121631)))

(declare-fun c!9174 () Bool)

(assert (=> d!61435 (= c!9174 (not (= (size!4143 (buf!4574 thiss!1187)) #b00000000000000000000000000000000)))))

(declare-fun lt!268935 () Unit!12540)

(declare-fun lt!268934 () Unit!12540)

(assert (=> d!61435 (= lt!268935 lt!268934)))

(assert (=> d!61435 (isPrefixOf!0 (_2!8168 lt!268755) (_2!8168 lt!268755))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!7394) Unit!12540)

(assert (=> d!61435 (= lt!268934 (lemmaIsPrefixRefl!0 (_2!8168 lt!268755)))))

(declare-fun lt!268928 () Unit!12540)

(declare-fun lt!268930 () Unit!12540)

(assert (=> d!61435 (= lt!268928 lt!268930)))

(assert (=> d!61435 (= lt!268930 (lemmaIsPrefixRefl!0 (_2!8168 lt!268755)))))

(declare-fun lt!268932 () Unit!12540)

(declare-fun lt!268923 () Unit!12540)

(assert (=> d!61435 (= lt!268932 lt!268923)))

(assert (=> d!61435 (isPrefixOf!0 lt!268920 lt!268920)))

(assert (=> d!61435 (= lt!268923 (lemmaIsPrefixRefl!0 lt!268920))))

(declare-fun lt!268925 () Unit!12540)

(declare-fun lt!268936 () Unit!12540)

(assert (=> d!61435 (= lt!268925 lt!268936)))

(assert (=> d!61435 (isPrefixOf!0 thiss!1187 thiss!1187)))

(assert (=> d!61435 (= lt!268936 (lemmaIsPrefixRefl!0 thiss!1187))))

(assert (=> d!61435 (= lt!268920 (BitStream!7395 (buf!4574 (_2!8168 lt!268755)) (currentByte!8688 thiss!1187) (currentBit!8683 thiss!1187)))))

(assert (=> d!61435 (isPrefixOf!0 thiss!1187 (_2!8168 lt!268755))))

(assert (=> d!61435 (= (reader!0 thiss!1187 (_2!8168 lt!268755)) lt!268929)))

(declare-fun b!174436 () Bool)

(declare-fun lt!268937 () Unit!12540)

(assert (=> b!174436 (= e!121631 lt!268937)))

(declare-fun lt!268919 () (_ BitVec 64))

(assert (=> b!174436 (= lt!268919 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!268924 () (_ BitVec 64))

(assert (=> b!174436 (= lt!268924 (bitIndex!0 (size!4143 (buf!4574 thiss!1187)) (currentByte!8688 thiss!1187) (currentBit!8683 thiss!1187)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!9389 array!9389 (_ BitVec 64) (_ BitVec 64)) Unit!12540)

(assert (=> b!174436 (= lt!268937 (arrayBitRangesEqSymmetric!0 (buf!4574 thiss!1187) (buf!4574 (_2!8168 lt!268755)) lt!268919 lt!268924))))

(declare-fun arrayBitRangesEq!0 (array!9389 array!9389 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!174436 (arrayBitRangesEq!0 (buf!4574 (_2!8168 lt!268755)) (buf!4574 thiss!1187) lt!268919 lt!268924)))

(declare-fun b!174437 () Bool)

(declare-fun Unit!12554 () Unit!12540)

(assert (=> b!174437 (= e!121631 Unit!12554)))

(declare-fun b!174438 () Bool)

(declare-fun res!144467 () Bool)

(assert (=> b!174438 (=> (not res!144467) (not e!121632))))

(assert (=> b!174438 (= res!144467 (isPrefixOf!0 (_2!8170 lt!268929) (_2!8168 lt!268755)))))

(declare-fun b!174439 () Bool)

(declare-fun res!144469 () Bool)

(assert (=> b!174439 (=> (not res!144469) (not e!121632))))

(assert (=> b!174439 (= res!144469 (isPrefixOf!0 (_1!8170 lt!268929) thiss!1187))))

(assert (= (and d!61435 c!9174) b!174436))

(assert (= (and d!61435 (not c!9174)) b!174437))

(assert (= (and d!61435 res!144468) b!174439))

(assert (= (and b!174439 res!144469) b!174438))

(assert (= (and b!174438 res!144467) b!174435))

(declare-fun m!273809 () Bool)

(assert (=> b!174439 m!273809))

(declare-fun m!273811 () Bool)

(assert (=> b!174438 m!273811))

(declare-fun m!273813 () Bool)

(assert (=> b!174435 m!273813))

(assert (=> b!174435 m!273749))

(assert (=> b!174435 m!273751))

(declare-fun m!273815 () Bool)

(assert (=> d!61435 m!273815))

(declare-fun m!273817 () Bool)

(assert (=> d!61435 m!273817))

(declare-fun m!273819 () Bool)

(assert (=> d!61435 m!273819))

(declare-fun m!273821 () Bool)

(assert (=> d!61435 m!273821))

(declare-fun m!273823 () Bool)

(assert (=> d!61435 m!273823))

(assert (=> d!61435 m!273735))

(declare-fun m!273825 () Bool)

(assert (=> d!61435 m!273825))

(declare-fun m!273827 () Bool)

(assert (=> d!61435 m!273827))

(declare-fun m!273829 () Bool)

(assert (=> d!61435 m!273829))

(declare-fun m!273831 () Bool)

(assert (=> d!61435 m!273831))

(declare-fun m!273833 () Bool)

(assert (=> d!61435 m!273833))

(assert (=> b!174436 m!273751))

(declare-fun m!273835 () Bool)

(assert (=> b!174436 m!273835))

(declare-fun m!273837 () Bool)

(assert (=> b!174436 m!273837))

(assert (=> b!174384 d!61435))

(declare-fun d!61437 () Bool)

(declare-datatypes ((tuple2!15062 0))(
  ( (tuple2!15063 (_1!8173 (_ BitVec 64)) (_2!8173 BitStream!7394)) )
))
(declare-fun lt!268980 () tuple2!15062)

(declare-fun readNBitsLSBFirst!0 (BitStream!7394 (_ BitVec 32)) tuple2!15062)

(assert (=> d!61437 (= lt!268980 (readNBitsLSBFirst!0 (_1!8170 lt!268754) nBits!340))))

(assert (=> d!61437 (= (readNBitsLSBFirstPure!0 (_1!8170 lt!268754) nBits!340) (tuple2!15055 (_2!8173 lt!268980) (_1!8173 lt!268980)))))

(declare-fun bs!15310 () Bool)

(assert (= bs!15310 d!61437))

(declare-fun m!273839 () Bool)

(assert (=> bs!15310 m!273839))

(assert (=> b!174384 d!61437))

(declare-fun b!174544 () Bool)

(declare-fun e!121691 () Bool)

(declare-datatypes ((tuple2!15064 0))(
  ( (tuple2!15065 (_1!8174 BitStream!7394) (_2!8174 Bool)) )
))
(declare-fun lt!269292 () tuple2!15064)

(declare-fun lt!269318 () tuple2!15052)

(assert (=> b!174544 (= e!121691 (= (bitIndex!0 (size!4143 (buf!4574 (_1!8174 lt!269292))) (currentByte!8688 (_1!8174 lt!269292)) (currentBit!8683 (_1!8174 lt!269292))) (bitIndex!0 (size!4143 (buf!4574 (_2!8168 lt!269318))) (currentByte!8688 (_2!8168 lt!269318)) (currentBit!8683 (_2!8168 lt!269318)))))))

(declare-fun b!174545 () Bool)

(declare-fun res!144548 () Bool)

(assert (=> b!174545 (= res!144548 (isPrefixOf!0 thiss!1187 (_2!8168 lt!269318)))))

(declare-fun e!121694 () Bool)

(assert (=> b!174545 (=> (not res!144548) (not e!121694))))

(declare-fun b!174546 () Bool)

(declare-fun e!121695 () Bool)

(declare-fun lt!269315 () (_ BitVec 64))

(assert (=> b!174546 (= e!121695 (validate_offset_bits!1 ((_ sign_extend 32) (size!4143 (buf!4574 thiss!1187))) ((_ sign_extend 32) (currentByte!8688 thiss!1187)) ((_ sign_extend 32) (currentBit!8683 thiss!1187)) lt!269315))))

(declare-fun b!174547 () Bool)

(declare-fun res!144559 () Bool)

(assert (=> b!174547 (= res!144559 (= (bitIndex!0 (size!4143 (buf!4574 (_2!8168 lt!269318))) (currentByte!8688 (_2!8168 lt!269318)) (currentBit!8683 (_2!8168 lt!269318))) (bvadd (bitIndex!0 (size!4143 (buf!4574 thiss!1187)) (currentByte!8688 thiss!1187) (currentBit!8683 thiss!1187)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!174547 (=> (not res!144559) (not e!121694))))

(declare-fun b!174548 () Bool)

(declare-fun res!144554 () Bool)

(declare-fun e!121693 () Bool)

(assert (=> b!174548 (=> (not res!144554) (not e!121693))))

(declare-fun lt!269323 () tuple2!15052)

(assert (=> b!174548 (= res!144554 (= (size!4143 (buf!4574 thiss!1187)) (size!4143 (buf!4574 (_2!8168 lt!269323)))))))

(declare-fun b!174549 () Bool)

(declare-fun e!121690 () (_ BitVec 64))

(assert (=> b!174549 (= e!121690 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!174550 () Bool)

(declare-fun e!121698 () Bool)

(assert (=> b!174550 (= e!121693 e!121698)))

(declare-fun res!144552 () Bool)

(assert (=> b!174550 (=> (not res!144552) (not e!121698))))

(declare-fun lt!269297 () tuple2!15054)

(assert (=> b!174550 (= res!144552 (= (_2!8169 lt!269297) (bvand v!186 (onesLSBLong!0 nBits!340))))))

(declare-fun lt!269333 () tuple2!15056)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7394 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!15054)

(assert (=> b!174550 (= lt!269297 (readNBitsLSBFirstsLoopPure!0 (_1!8170 lt!269333) nBits!340 #b00000000000000000000000000000000 (bvand v!186 (onesLSBLong!0 #b00000000000000000000000000000000))))))

(declare-fun lt!269335 () Unit!12540)

(declare-fun lt!269307 () Unit!12540)

(assert (=> b!174550 (= lt!269335 lt!269307)))

(assert (=> b!174550 (validate_offset_bits!1 ((_ sign_extend 32) (size!4143 (buf!4574 (_2!8168 lt!269323)))) ((_ sign_extend 32) (currentByte!8688 thiss!1187)) ((_ sign_extend 32) (currentBit!8683 thiss!1187)) lt!269315)))

(assert (=> b!174550 (= lt!269307 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1187 (buf!4574 (_2!8168 lt!269323)) lt!269315))))

(assert (=> b!174550 e!121695))

(declare-fun res!144558 () Bool)

(assert (=> b!174550 (=> (not res!144558) (not e!121695))))

(assert (=> b!174550 (= res!144558 (and (= (size!4143 (buf!4574 thiss!1187)) (size!4143 (buf!4574 (_2!8168 lt!269323)))) (bvsge lt!269315 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!174550 (= lt!269315 ((_ sign_extend 32) (bvsub nBits!340 #b00000000000000000000000000000000)))))

(assert (=> b!174550 (or (= (bvand nBits!340 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand nBits!340 #b10000000000000000000000000000000) (bvand (bvsub nBits!340 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(assert (=> b!174550 (= lt!269333 (reader!0 thiss!1187 (_2!8168 lt!269323)))))

(declare-fun d!61439 () Bool)

(assert (=> d!61439 e!121693))

(declare-fun res!144555 () Bool)

(assert (=> d!61439 (=> (not res!144555) (not e!121693))))

(assert (=> d!61439 (= res!144555 (invariant!0 (currentBit!8683 (_2!8168 lt!269323)) (currentByte!8688 (_2!8168 lt!269323)) (size!4143 (buf!4574 (_2!8168 lt!269323)))))))

(declare-fun e!121697 () tuple2!15052)

(assert (=> d!61439 (= lt!269323 e!121697)))

(declare-fun c!9189 () Bool)

(assert (=> d!61439 (= c!9189 (= #b00000000000000000000000000000000 nBits!340))))

(assert (=> d!61439 (and (bvsge nBits!340 #b00000000000000000000000000000000) (bvsle nBits!340 #b00000000000000000000000001000000))))

(assert (=> d!61439 (= (appendBitsLSBFirstLoopTR!0 thiss!1187 v!186 nBits!340 #b00000000000000000000000000000000) lt!269323)))

(declare-fun b!174551 () Bool)

(declare-fun e!121692 () Bool)

(declare-fun lt!269330 () tuple2!15064)

(declare-fun lt!269317 () tuple2!15064)

(assert (=> b!174551 (= e!121692 (= (_2!8174 lt!269330) (_2!8174 lt!269317)))))

(declare-fun b!174552 () Bool)

(assert (=> b!174552 (= e!121690 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) #b00000000000000000000000000000000)))))

(declare-fun b!174553 () Bool)

(declare-fun res!144551 () Bool)

(assert (=> b!174553 (=> (not res!144551) (not e!121693))))

(declare-fun lt!269313 () (_ BitVec 64))

(declare-fun lt!269290 () (_ BitVec 64))

(assert (=> b!174553 (= res!144551 (= (bitIndex!0 (size!4143 (buf!4574 (_2!8168 lt!269323))) (currentByte!8688 (_2!8168 lt!269323)) (currentBit!8683 (_2!8168 lt!269323))) (bvsub lt!269290 lt!269313)))))

(assert (=> b!174553 (or (= (bvand lt!269290 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!269313 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!269290 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!269290 lt!269313) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!174553 (= lt!269313 ((_ sign_extend 32) #b00000000000000000000000000000000))))

(declare-fun lt!269289 () (_ BitVec 64))

(declare-fun lt!269328 () (_ BitVec 64))

(assert (=> b!174553 (= lt!269290 (bvadd lt!269289 lt!269328))))

(assert (=> b!174553 (or (not (= (bvand lt!269289 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!269328 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!269289 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!269289 lt!269328) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!174553 (= lt!269328 ((_ sign_extend 32) nBits!340))))

(assert (=> b!174553 (= lt!269289 (bitIndex!0 (size!4143 (buf!4574 thiss!1187)) (currentByte!8688 thiss!1187) (currentBit!8683 thiss!1187)))))

(declare-fun b!174554 () Bool)

(declare-fun res!144550 () Bool)

(assert (=> b!174554 (=> (not res!144550) (not e!121693))))

(assert (=> b!174554 (= res!144550 (isPrefixOf!0 thiss!1187 (_2!8168 lt!269323)))))

(declare-fun b!174555 () Bool)

(declare-fun Unit!12555 () Unit!12540)

(assert (=> b!174555 (= e!121697 (tuple2!15053 Unit!12555 thiss!1187))))

(declare-fun lt!269332 () Unit!12540)

(assert (=> b!174555 (= lt!269332 (lemmaIsPrefixRefl!0 thiss!1187))))

(declare-fun call!2891 () Bool)

(assert (=> b!174555 call!2891))

(declare-fun lt!269288 () Unit!12540)

(assert (=> b!174555 (= lt!269288 lt!269332)))

(declare-fun bm!2888 () Bool)

(declare-fun lt!269325 () tuple2!15052)

(assert (=> bm!2888 (= call!2891 (isPrefixOf!0 thiss!1187 (ite c!9189 thiss!1187 (_2!8168 lt!269325))))))

(declare-fun b!174556 () Bool)

(declare-fun e!121696 () Bool)

(declare-fun lt!269338 () tuple2!15054)

(declare-fun lt!269287 () tuple2!15056)

(assert (=> b!174556 (= e!121696 (= (_1!8169 lt!269338) (_2!8170 lt!269287)))))

(declare-fun b!174557 () Bool)

(assert (=> b!174557 (= e!121698 (= (_1!8169 lt!269297) (_2!8170 lt!269333)))))

(declare-fun b!174558 () Bool)

(declare-fun readBitPure!0 (BitStream!7394) tuple2!15064)

(declare-fun readerFrom!0 (BitStream!7394 (_ BitVec 32) (_ BitVec 32)) BitStream!7394)

(assert (=> b!174558 (= lt!269292 (readBitPure!0 (readerFrom!0 (_2!8168 lt!269318) (currentBit!8683 thiss!1187) (currentByte!8688 thiss!1187))))))

(declare-fun res!144553 () Bool)

(declare-fun lt!269310 () Bool)

(assert (=> b!174558 (= res!144553 (and (= (_2!8174 lt!269292) lt!269310) (= (_1!8174 lt!269292) (_2!8168 lt!269318))))))

(assert (=> b!174558 (=> (not res!144553) (not e!121691))))

(assert (=> b!174558 (= e!121694 e!121691)))

(declare-fun b!174559 () Bool)

(assert (=> b!174559 (= e!121697 (tuple2!15053 (_1!8168 lt!269325) (_2!8168 lt!269325)))))

(assert (=> b!174559 (= lt!269310 (not (= (bvand v!186 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) #b00000000000000000000000000000000))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun appendBit!0 (BitStream!7394 Bool) tuple2!15052)

(assert (=> b!174559 (= lt!269318 (appendBit!0 thiss!1187 lt!269310))))

(declare-fun res!144557 () Bool)

(assert (=> b!174559 (= res!144557 (= (size!4143 (buf!4574 thiss!1187)) (size!4143 (buf!4574 (_2!8168 lt!269318)))))))

(assert (=> b!174559 (=> (not res!144557) (not e!121694))))

(assert (=> b!174559 e!121694))

(declare-fun lt!269291 () tuple2!15052)

(assert (=> b!174559 (= lt!269291 lt!269318)))

(assert (=> b!174559 (= lt!269325 (appendBitsLSBFirstLoopTR!0 (_2!8168 lt!269291) v!186 nBits!340 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!269298 () Unit!12540)

(assert (=> b!174559 (= lt!269298 (lemmaIsPrefixTransitive!0 thiss!1187 (_2!8168 lt!269291) (_2!8168 lt!269325)))))

(assert (=> b!174559 call!2891))

(declare-fun lt!269303 () Unit!12540)

(assert (=> b!174559 (= lt!269303 lt!269298)))

(assert (=> b!174559 (invariant!0 (currentBit!8683 thiss!1187) (currentByte!8688 thiss!1187) (size!4143 (buf!4574 (_2!8168 lt!269291))))))

(declare-fun lt!269300 () BitStream!7394)

(assert (=> b!174559 (= lt!269300 (BitStream!7395 (buf!4574 (_2!8168 lt!269291)) (currentByte!8688 thiss!1187) (currentBit!8683 thiss!1187)))))

(assert (=> b!174559 (invariant!0 (currentBit!8683 lt!269300) (currentByte!8688 lt!269300) (size!4143 (buf!4574 (_2!8168 lt!269325))))))

(declare-fun lt!269316 () BitStream!7394)

(assert (=> b!174559 (= lt!269316 (BitStream!7395 (buf!4574 (_2!8168 lt!269325)) (currentByte!8688 lt!269300) (currentBit!8683 lt!269300)))))

(assert (=> b!174559 (= lt!269330 (readBitPure!0 lt!269300))))

(assert (=> b!174559 (= lt!269317 (readBitPure!0 lt!269316))))

(declare-fun lt!269331 () Unit!12540)

(declare-fun readBitPrefixLemma!0 (BitStream!7394 BitStream!7394) Unit!12540)

(assert (=> b!174559 (= lt!269331 (readBitPrefixLemma!0 lt!269300 (_2!8168 lt!269325)))))

(declare-fun res!144549 () Bool)

(assert (=> b!174559 (= res!144549 (= (bitIndex!0 (size!4143 (buf!4574 (_1!8174 lt!269330))) (currentByte!8688 (_1!8174 lt!269330)) (currentBit!8683 (_1!8174 lt!269330))) (bitIndex!0 (size!4143 (buf!4574 (_1!8174 lt!269317))) (currentByte!8688 (_1!8174 lt!269317)) (currentBit!8683 (_1!8174 lt!269317)))))))

(assert (=> b!174559 (=> (not res!144549) (not e!121692))))

(assert (=> b!174559 e!121692))

(declare-fun lt!269336 () Unit!12540)

(assert (=> b!174559 (= lt!269336 lt!269331)))

(declare-fun lt!269306 () tuple2!15056)

(assert (=> b!174559 (= lt!269306 (reader!0 thiss!1187 (_2!8168 lt!269325)))))

(declare-fun lt!269299 () tuple2!15056)

(assert (=> b!174559 (= lt!269299 (reader!0 (_2!8168 lt!269291) (_2!8168 lt!269325)))))

(declare-fun lt!269284 () tuple2!15064)

(assert (=> b!174559 (= lt!269284 (readBitPure!0 (_1!8170 lt!269306)))))

(assert (=> b!174559 (= (_2!8174 lt!269284) lt!269310)))

(declare-fun lt!269327 () Unit!12540)

(declare-fun Unit!12556 () Unit!12540)

(assert (=> b!174559 (= lt!269327 Unit!12556)))

(declare-fun lt!269329 () (_ BitVec 64))

(assert (=> b!174559 (= lt!269329 (bvand v!186 (onesLSBLong!0 #b00000000000000000000000000000000)))))

(declare-fun lt!269324 () (_ BitVec 64))

(assert (=> b!174559 (= lt!269324 ((_ sign_extend 32) (bvsub nBits!340 #b00000000000000000000000000000000)))))

(declare-fun lt!269294 () Unit!12540)

(assert (=> b!174559 (= lt!269294 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1187 (buf!4574 (_2!8168 lt!269325)) lt!269324))))

(assert (=> b!174559 (validate_offset_bits!1 ((_ sign_extend 32) (size!4143 (buf!4574 (_2!8168 lt!269325)))) ((_ sign_extend 32) (currentByte!8688 thiss!1187)) ((_ sign_extend 32) (currentBit!8683 thiss!1187)) lt!269324)))

(declare-fun lt!269302 () Unit!12540)

(assert (=> b!174559 (= lt!269302 lt!269294)))

(declare-fun lt!269311 () tuple2!15054)

(assert (=> b!174559 (= lt!269311 (readNBitsLSBFirstsLoopPure!0 (_1!8170 lt!269306) nBits!340 #b00000000000000000000000000000000 lt!269329))))

(declare-fun lt!269295 () (_ BitVec 64))

(assert (=> b!174559 (= lt!269295 ((_ sign_extend 32) (bvsub (bvsub nBits!340 #b00000000000000000000000000000000) #b00000000000000000000000000000001)))))

(declare-fun lt!269314 () Unit!12540)

(assert (=> b!174559 (= lt!269314 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8168 lt!269291) (buf!4574 (_2!8168 lt!269325)) lt!269295))))

(assert (=> b!174559 (validate_offset_bits!1 ((_ sign_extend 32) (size!4143 (buf!4574 (_2!8168 lt!269325)))) ((_ sign_extend 32) (currentByte!8688 (_2!8168 lt!269291))) ((_ sign_extend 32) (currentBit!8683 (_2!8168 lt!269291))) lt!269295)))

(declare-fun lt!269339 () Unit!12540)

(assert (=> b!174559 (= lt!269339 lt!269314)))

(declare-fun lt!269320 () tuple2!15054)

(assert (=> b!174559 (= lt!269320 (readNBitsLSBFirstsLoopPure!0 (_1!8170 lt!269299) nBits!340 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvor lt!269329 (ite (_2!8174 lt!269284) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) #b00000000000000000000000000000000)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!269309 () tuple2!15054)

(assert (=> b!174559 (= lt!269309 (readNBitsLSBFirstsLoopPure!0 (_1!8170 lt!269306) nBits!340 #b00000000000000000000000000000000 lt!269329))))

(declare-fun c!9188 () Bool)

(assert (=> b!174559 (= c!9188 (_2!8174 (readBitPure!0 (_1!8170 lt!269306))))))

(declare-fun lt!269321 () tuple2!15054)

(assert (=> b!174559 (= lt!269321 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!8170 lt!269306) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!340 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvor lt!269329 e!121690)))))

(declare-fun lt!269304 () Unit!12540)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!7394 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!12540)

(assert (=> b!174559 (= lt!269304 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8170 lt!269306) nBits!340 #b00000000000000000000000000000000 lt!269329))))

(assert (=> b!174559 (and (= (_2!8169 lt!269309) (_2!8169 lt!269321)) (= (_1!8169 lt!269309) (_1!8169 lt!269321)))))

(declare-fun lt!269293 () Unit!12540)

(assert (=> b!174559 (= lt!269293 lt!269304)))

(assert (=> b!174559 (= (_1!8170 lt!269306) (withMovedBitIndex!0 (_2!8170 lt!269306) (bvsub (bitIndex!0 (size!4143 (buf!4574 thiss!1187)) (currentByte!8688 thiss!1187) (currentBit!8683 thiss!1187)) (bitIndex!0 (size!4143 (buf!4574 (_2!8168 lt!269325))) (currentByte!8688 (_2!8168 lt!269325)) (currentBit!8683 (_2!8168 lt!269325))))))))

(declare-fun lt!269305 () Unit!12540)

(declare-fun Unit!12557 () Unit!12540)

(assert (=> b!174559 (= lt!269305 Unit!12557)))

(assert (=> b!174559 (= (_1!8170 lt!269299) (withMovedBitIndex!0 (_2!8170 lt!269299) (bvsub (bitIndex!0 (size!4143 (buf!4574 (_2!8168 lt!269291))) (currentByte!8688 (_2!8168 lt!269291)) (currentBit!8683 (_2!8168 lt!269291))) (bitIndex!0 (size!4143 (buf!4574 (_2!8168 lt!269325))) (currentByte!8688 (_2!8168 lt!269325)) (currentBit!8683 (_2!8168 lt!269325))))))))

(declare-fun lt!269326 () Unit!12540)

(declare-fun Unit!12558 () Unit!12540)

(assert (=> b!174559 (= lt!269326 Unit!12558)))

(assert (=> b!174559 (= (bitIndex!0 (size!4143 (buf!4574 thiss!1187)) (currentByte!8688 thiss!1187) (currentBit!8683 thiss!1187)) (bvsub (bitIndex!0 (size!4143 (buf!4574 (_2!8168 lt!269291))) (currentByte!8688 (_2!8168 lt!269291)) (currentBit!8683 (_2!8168 lt!269291))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!269308 () Unit!12540)

(declare-fun Unit!12559 () Unit!12540)

(assert (=> b!174559 (= lt!269308 Unit!12559)))

(assert (=> b!174559 (= (_2!8169 lt!269311) (_2!8169 lt!269320))))

(declare-fun lt!269337 () Unit!12540)

(declare-fun Unit!12560 () Unit!12540)

(assert (=> b!174559 (= lt!269337 Unit!12560)))

(assert (=> b!174559 (invariant!0 (currentBit!8683 (_2!8168 lt!269325)) (currentByte!8688 (_2!8168 lt!269325)) (size!4143 (buf!4574 (_2!8168 lt!269325))))))

(declare-fun lt!269301 () Unit!12540)

(declare-fun Unit!12561 () Unit!12540)

(assert (=> b!174559 (= lt!269301 Unit!12561)))

(assert (=> b!174559 (= (size!4143 (buf!4574 thiss!1187)) (size!4143 (buf!4574 (_2!8168 lt!269325))))))

(declare-fun lt!269285 () Unit!12540)

(declare-fun Unit!12562 () Unit!12540)

(assert (=> b!174559 (= lt!269285 Unit!12562)))

(assert (=> b!174559 (= (bitIndex!0 (size!4143 (buf!4574 (_2!8168 lt!269325))) (currentByte!8688 (_2!8168 lt!269325)) (currentBit!8683 (_2!8168 lt!269325))) (bvsub (bvadd (bitIndex!0 (size!4143 (buf!4574 thiss!1187)) (currentByte!8688 thiss!1187) (currentBit!8683 thiss!1187)) ((_ sign_extend 32) nBits!340)) ((_ sign_extend 32) #b00000000000000000000000000000000)))))

(declare-fun lt!269319 () Unit!12540)

(declare-fun Unit!12563 () Unit!12540)

(assert (=> b!174559 (= lt!269319 Unit!12563)))

(declare-fun lt!269296 () Unit!12540)

(declare-fun Unit!12564 () Unit!12540)

(assert (=> b!174559 (= lt!269296 Unit!12564)))

(assert (=> b!174559 (= lt!269287 (reader!0 thiss!1187 (_2!8168 lt!269325)))))

(declare-fun lt!269312 () (_ BitVec 64))

(assert (=> b!174559 (= lt!269312 ((_ sign_extend 32) (bvsub nBits!340 #b00000000000000000000000000000000)))))

(declare-fun lt!269322 () Unit!12540)

(assert (=> b!174559 (= lt!269322 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1187 (buf!4574 (_2!8168 lt!269325)) lt!269312))))

(assert (=> b!174559 (validate_offset_bits!1 ((_ sign_extend 32) (size!4143 (buf!4574 (_2!8168 lt!269325)))) ((_ sign_extend 32) (currentByte!8688 thiss!1187)) ((_ sign_extend 32) (currentBit!8683 thiss!1187)) lt!269312)))

(declare-fun lt!269286 () Unit!12540)

(assert (=> b!174559 (= lt!269286 lt!269322)))

(assert (=> b!174559 (= lt!269338 (readNBitsLSBFirstsLoopPure!0 (_1!8170 lt!269287) nBits!340 #b00000000000000000000000000000000 (bvand v!186 (onesLSBLong!0 #b00000000000000000000000000000000))))))

(declare-fun res!144556 () Bool)

(assert (=> b!174559 (= res!144556 (= (_2!8169 lt!269338) (bvand v!186 (onesLSBLong!0 nBits!340))))))

(assert (=> b!174559 (=> (not res!144556) (not e!121696))))

(assert (=> b!174559 e!121696))

(declare-fun lt!269334 () Unit!12540)

(declare-fun Unit!12565 () Unit!12540)

(assert (=> b!174559 (= lt!269334 Unit!12565)))

(assert (= (and d!61439 c!9189) b!174555))

(assert (= (and d!61439 (not c!9189)) b!174559))

(assert (= (and b!174559 res!144557) b!174547))

(assert (= (and b!174547 res!144559) b!174545))

(assert (= (and b!174545 res!144548) b!174558))

(assert (= (and b!174558 res!144553) b!174544))

(assert (= (and b!174559 res!144549) b!174551))

(assert (= (and b!174559 c!9188) b!174552))

(assert (= (and b!174559 (not c!9188)) b!174549))

(assert (= (and b!174559 res!144556) b!174556))

(assert (= (or b!174555 b!174559) bm!2888))

(assert (= (and d!61439 res!144555) b!174548))

(assert (= (and b!174548 res!144554) b!174553))

(assert (= (and b!174553 res!144551) b!174554))

(assert (= (and b!174554 res!144550) b!174550))

(assert (= (and b!174550 res!144558) b!174546))

(assert (= (and b!174550 res!144552) b!174557))

(declare-fun m!273967 () Bool)

(assert (=> b!174544 m!273967))

(declare-fun m!273969 () Bool)

(assert (=> b!174544 m!273969))

(assert (=> b!174555 m!273827))

(declare-fun m!273971 () Bool)

(assert (=> b!174554 m!273971))

(declare-fun m!273973 () Bool)

(assert (=> b!174545 m!273973))

(declare-fun m!273975 () Bool)

(assert (=> b!174553 m!273975))

(assert (=> b!174553 m!273751))

(declare-fun m!273977 () Bool)

(assert (=> bm!2888 m!273977))

(declare-fun m!273979 () Bool)

(assert (=> b!174558 m!273979))

(assert (=> b!174558 m!273979))

(declare-fun m!273981 () Bool)

(assert (=> b!174558 m!273981))

(declare-fun m!273983 () Bool)

(assert (=> b!174546 m!273983))

(declare-fun m!273985 () Bool)

(assert (=> b!174559 m!273985))

(assert (=> b!174559 m!273751))

(declare-fun m!273987 () Bool)

(assert (=> b!174559 m!273987))

(declare-fun m!273989 () Bool)

(assert (=> b!174559 m!273989))

(declare-fun m!273991 () Bool)

(assert (=> b!174559 m!273991))

(declare-fun m!273993 () Bool)

(assert (=> b!174559 m!273993))

(declare-fun m!273995 () Bool)

(assert (=> b!174559 m!273995))

(declare-fun m!273997 () Bool)

(assert (=> b!174559 m!273997))

(declare-fun m!273999 () Bool)

(assert (=> b!174559 m!273999))

(declare-fun m!274001 () Bool)

(assert (=> b!174559 m!274001))

(declare-fun m!274003 () Bool)

(assert (=> b!174559 m!274003))

(declare-fun m!274005 () Bool)

(assert (=> b!174559 m!274005))

(declare-fun m!274007 () Bool)

(assert (=> b!174559 m!274007))

(declare-fun m!274009 () Bool)

(assert (=> b!174559 m!274009))

(declare-fun m!274011 () Bool)

(assert (=> b!174559 m!274011))

(declare-fun m!274013 () Bool)

(assert (=> b!174559 m!274013))

(declare-fun m!274015 () Bool)

(assert (=> b!174559 m!274015))

(declare-fun m!274017 () Bool)

(assert (=> b!174559 m!274017))

(declare-fun m!274019 () Bool)

(assert (=> b!174559 m!274019))

(declare-fun m!274021 () Bool)

(assert (=> b!174559 m!274021))

(declare-fun m!274023 () Bool)

(assert (=> b!174559 m!274023))

(declare-fun m!274025 () Bool)

(assert (=> b!174559 m!274025))

(declare-fun m!274027 () Bool)

(assert (=> b!174559 m!274027))

(declare-fun m!274029 () Bool)

(assert (=> b!174559 m!274029))

(declare-fun m!274031 () Bool)

(assert (=> b!174559 m!274031))

(declare-fun m!274033 () Bool)

(assert (=> b!174559 m!274033))

(declare-fun m!274035 () Bool)

(assert (=> b!174559 m!274035))

(declare-fun m!274037 () Bool)

(assert (=> b!174559 m!274037))

(assert (=> b!174559 m!274005))

(assert (=> b!174559 m!273737))

(declare-fun m!274039 () Bool)

(assert (=> b!174559 m!274039))

(declare-fun m!274041 () Bool)

(assert (=> b!174559 m!274041))

(declare-fun m!274043 () Bool)

(assert (=> b!174559 m!274043))

(declare-fun m!274045 () Bool)

(assert (=> b!174559 m!274045))

(declare-fun m!274047 () Bool)

(assert (=> d!61439 m!274047))

(assert (=> b!174547 m!273969))

(assert (=> b!174547 m!273751))

(assert (=> b!174550 m!274001))

(declare-fun m!274049 () Bool)

(assert (=> b!174550 m!274049))

(declare-fun m!274051 () Bool)

(assert (=> b!174550 m!274051))

(assert (=> b!174550 m!273737))

(declare-fun m!274053 () Bool)

(assert (=> b!174550 m!274053))

(declare-fun m!274055 () Bool)

(assert (=> b!174550 m!274055))

(assert (=> b!174379 d!61439))

(declare-fun d!61459 () Bool)

(assert (=> d!61459 (= (inv!12 thiss!1187) (invariant!0 (currentBit!8683 thiss!1187) (currentByte!8688 thiss!1187) (size!4143 (buf!4574 thiss!1187))))))

(declare-fun bs!15316 () Bool)

(assert (= bs!15316 d!61459))

(assert (=> bs!15316 m!273733))

(assert (=> start!38714 d!61459))

(declare-fun d!61461 () Bool)

(declare-fun res!144568 () Bool)

(declare-fun e!121704 () Bool)

(assert (=> d!61461 (=> (not res!144568) (not e!121704))))

(assert (=> d!61461 (= res!144568 (= (size!4143 (buf!4574 thiss!1187)) (size!4143 (buf!4574 (_2!8168 lt!268755)))))))

(assert (=> d!61461 (= (isPrefixOf!0 thiss!1187 (_2!8168 lt!268755)) e!121704)))

(declare-fun b!174566 () Bool)

(declare-fun res!144566 () Bool)

(assert (=> b!174566 (=> (not res!144566) (not e!121704))))

(assert (=> b!174566 (= res!144566 (bvsle (bitIndex!0 (size!4143 (buf!4574 thiss!1187)) (currentByte!8688 thiss!1187) (currentBit!8683 thiss!1187)) (bitIndex!0 (size!4143 (buf!4574 (_2!8168 lt!268755))) (currentByte!8688 (_2!8168 lt!268755)) (currentBit!8683 (_2!8168 lt!268755)))))))

(declare-fun b!174567 () Bool)

(declare-fun e!121703 () Bool)

(assert (=> b!174567 (= e!121704 e!121703)))

(declare-fun res!144567 () Bool)

(assert (=> b!174567 (=> res!144567 e!121703)))

(assert (=> b!174567 (= res!144567 (= (size!4143 (buf!4574 thiss!1187)) #b00000000000000000000000000000000))))

(declare-fun b!174568 () Bool)

(assert (=> b!174568 (= e!121703 (arrayBitRangesEq!0 (buf!4574 thiss!1187) (buf!4574 (_2!8168 lt!268755)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4143 (buf!4574 thiss!1187)) (currentByte!8688 thiss!1187) (currentBit!8683 thiss!1187))))))

(assert (= (and d!61461 res!144568) b!174566))

(assert (= (and b!174566 res!144566) b!174567))

(assert (= (and b!174567 (not res!144567)) b!174568))

(assert (=> b!174566 m!273751))

(assert (=> b!174566 m!273749))

(assert (=> b!174568 m!273751))

(assert (=> b!174568 m!273751))

(declare-fun m!274057 () Bool)

(assert (=> b!174568 m!274057))

(assert (=> b!174381 d!61461))

(declare-fun d!61463 () Bool)

(declare-fun e!121707 () Bool)

(assert (=> d!61463 e!121707))

(declare-fun res!144574 () Bool)

(assert (=> d!61463 (=> (not res!144574) (not e!121707))))

(declare-fun lt!269356 () (_ BitVec 64))

(declare-fun lt!269353 () (_ BitVec 64))

(declare-fun lt!269354 () (_ BitVec 64))

(assert (=> d!61463 (= res!144574 (= lt!269356 (bvsub lt!269354 lt!269353)))))

(assert (=> d!61463 (or (= (bvand lt!269354 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!269353 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!269354 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!269354 lt!269353) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!61463 (= lt!269353 (remainingBits!0 ((_ sign_extend 32) (size!4143 (buf!4574 (_2!8168 lt!268755)))) ((_ sign_extend 32) (currentByte!8688 (_2!8168 lt!268755))) ((_ sign_extend 32) (currentBit!8683 (_2!8168 lt!268755)))))))

(declare-fun lt!269352 () (_ BitVec 64))

(declare-fun lt!269357 () (_ BitVec 64))

(assert (=> d!61463 (= lt!269354 (bvmul lt!269352 lt!269357))))

(assert (=> d!61463 (or (= lt!269352 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!269357 (bvsdiv (bvmul lt!269352 lt!269357) lt!269352)))))

(assert (=> d!61463 (= lt!269357 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!61463 (= lt!269352 ((_ sign_extend 32) (size!4143 (buf!4574 (_2!8168 lt!268755)))))))

(assert (=> d!61463 (= lt!269356 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8688 (_2!8168 lt!268755))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8683 (_2!8168 lt!268755)))))))

(assert (=> d!61463 (invariant!0 (currentBit!8683 (_2!8168 lt!268755)) (currentByte!8688 (_2!8168 lt!268755)) (size!4143 (buf!4574 (_2!8168 lt!268755))))))

(assert (=> d!61463 (= (bitIndex!0 (size!4143 (buf!4574 (_2!8168 lt!268755))) (currentByte!8688 (_2!8168 lt!268755)) (currentBit!8683 (_2!8168 lt!268755))) lt!269356)))

(declare-fun b!174573 () Bool)

(declare-fun res!144573 () Bool)

(assert (=> b!174573 (=> (not res!144573) (not e!121707))))

(assert (=> b!174573 (= res!144573 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!269356))))

(declare-fun b!174574 () Bool)

(declare-fun lt!269355 () (_ BitVec 64))

(assert (=> b!174574 (= e!121707 (bvsle lt!269356 (bvmul lt!269355 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!174574 (or (= lt!269355 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!269355 #b0000000000000000000000000000000000000000000000000000000000001000) lt!269355)))))

(assert (=> b!174574 (= lt!269355 ((_ sign_extend 32) (size!4143 (buf!4574 (_2!8168 lt!268755)))))))

(assert (= (and d!61463 res!144574) b!174573))

(assert (= (and b!174573 res!144573) b!174574))

(declare-fun m!274059 () Bool)

(assert (=> d!61463 m!274059))

(declare-fun m!274061 () Bool)

(assert (=> d!61463 m!274061))

(assert (=> b!174376 d!61463))

(declare-fun d!61465 () Bool)

(declare-fun e!121708 () Bool)

(assert (=> d!61465 e!121708))

(declare-fun res!144576 () Bool)

(assert (=> d!61465 (=> (not res!144576) (not e!121708))))

(declare-fun lt!269362 () (_ BitVec 64))

(declare-fun lt!269359 () (_ BitVec 64))

(declare-fun lt!269360 () (_ BitVec 64))

(assert (=> d!61465 (= res!144576 (= lt!269362 (bvsub lt!269360 lt!269359)))))

(assert (=> d!61465 (or (= (bvand lt!269360 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!269359 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!269360 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!269360 lt!269359) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!61465 (= lt!269359 (remainingBits!0 ((_ sign_extend 32) (size!4143 (buf!4574 thiss!1187))) ((_ sign_extend 32) (currentByte!8688 thiss!1187)) ((_ sign_extend 32) (currentBit!8683 thiss!1187))))))

(declare-fun lt!269358 () (_ BitVec 64))

(declare-fun lt!269363 () (_ BitVec 64))

(assert (=> d!61465 (= lt!269360 (bvmul lt!269358 lt!269363))))

(assert (=> d!61465 (or (= lt!269358 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!269363 (bvsdiv (bvmul lt!269358 lt!269363) lt!269358)))))

(assert (=> d!61465 (= lt!269363 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!61465 (= lt!269358 ((_ sign_extend 32) (size!4143 (buf!4574 thiss!1187))))))

(assert (=> d!61465 (= lt!269362 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8688 thiss!1187)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8683 thiss!1187))))))

(assert (=> d!61465 (invariant!0 (currentBit!8683 thiss!1187) (currentByte!8688 thiss!1187) (size!4143 (buf!4574 thiss!1187)))))

(assert (=> d!61465 (= (bitIndex!0 (size!4143 (buf!4574 thiss!1187)) (currentByte!8688 thiss!1187) (currentBit!8683 thiss!1187)) lt!269362)))

(declare-fun b!174575 () Bool)

(declare-fun res!144575 () Bool)

(assert (=> b!174575 (=> (not res!144575) (not e!121708))))

(assert (=> b!174575 (= res!144575 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!269362))))

(declare-fun b!174576 () Bool)

(declare-fun lt!269361 () (_ BitVec 64))

(assert (=> b!174576 (= e!121708 (bvsle lt!269362 (bvmul lt!269361 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!174576 (or (= lt!269361 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!269361 #b0000000000000000000000000000000000000000000000000000000000001000) lt!269361)))))

(assert (=> b!174576 (= lt!269361 ((_ sign_extend 32) (size!4143 (buf!4574 thiss!1187))))))

(assert (= (and d!61465 res!144576) b!174575))

(assert (= (and b!174575 res!144575) b!174576))

(declare-fun m!274063 () Bool)

(assert (=> d!61465 m!274063))

(assert (=> d!61465 m!273733))

(assert (=> b!174376 d!61465))

(declare-fun d!61467 () Bool)

(assert (=> d!61467 (= (array_inv!3884 (buf!4574 thiss!1187)) (bvsge (size!4143 (buf!4574 thiss!1187)) #b00000000000000000000000000000000))))

(assert (=> b!174382 d!61467))

(declare-fun d!61469 () Bool)

(assert (=> d!61469 (= (invariant!0 (currentBit!8683 thiss!1187) (currentByte!8688 thiss!1187) (size!4143 (buf!4574 thiss!1187))) (and (bvsge (currentBit!8683 thiss!1187) #b00000000000000000000000000000000) (bvslt (currentBit!8683 thiss!1187) #b00000000000000000000000000001000) (bvsge (currentByte!8688 thiss!1187) #b00000000000000000000000000000000) (or (bvslt (currentByte!8688 thiss!1187) (size!4143 (buf!4574 thiss!1187))) (and (= (currentBit!8683 thiss!1187) #b00000000000000000000000000000000) (= (currentByte!8688 thiss!1187) (size!4143 (buf!4574 thiss!1187)))))))))

(assert (=> b!174377 d!61469))

(declare-fun d!61471 () Bool)

(assert (=> d!61471 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4143 (buf!4574 thiss!1187))) ((_ sign_extend 32) (currentByte!8688 thiss!1187)) ((_ sign_extend 32) (currentBit!8683 thiss!1187)) ((_ sign_extend 32) nBits!340)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4143 (buf!4574 thiss!1187))) ((_ sign_extend 32) (currentByte!8688 thiss!1187)) ((_ sign_extend 32) (currentBit!8683 thiss!1187))) ((_ sign_extend 32) nBits!340)))))

(declare-fun bs!15317 () Bool)

(assert (= bs!15317 d!61471))

(assert (=> bs!15317 m!274063))

(assert (=> b!174383 d!61471))

(push 1)

(assert (not b!174546))

(assert (not d!61419))

(assert (not bm!2888))

(assert (not d!61439))

(assert (not b!174553))

(assert (not b!174568))

(assert (not d!61431))

(assert (not d!61465))

(assert (not b!174436))

(assert (not b!174439))

(assert (not b!174438))

(assert (not b!174555))

(assert (not b!174550))

(assert (not b!174435))

(assert (not b!174566))

(assert (not d!61459))

(assert (not d!61471))

(assert (not b!174554))

(assert (not b!174558))

(assert (not b!174547))

(assert (not d!61435))

(assert (not b!174544))

(assert (not d!61437))

(assert (not b!174559))

(assert (not d!61463))

(assert (not b!174545))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!61741 () Bool)

(declare-fun e!121912 () Bool)

(assert (=> d!61741 e!121912))

(declare-fun res!144841 () Bool)

(assert (=> d!61741 (=> (not res!144841) (not e!121912))))

(declare-fun lt!270068 () BitStream!7394)

(declare-fun lt!270069 () (_ BitVec 64))

(assert (=> d!61741 (= res!144841 (= (bvadd lt!270069 (bvsub lt!268926 lt!268918)) (bitIndex!0 (size!4143 (buf!4574 lt!270068)) (currentByte!8688 lt!270068) (currentBit!8683 lt!270068))))))

(assert (=> d!61741 (or (not (= (bvand lt!270069 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!268926 lt!268918) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!270069 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!270069 (bvsub lt!268926 lt!268918)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!61741 (= lt!270069 (bitIndex!0 (size!4143 (buf!4574 (_2!8170 lt!268929))) (currentByte!8688 (_2!8170 lt!268929)) (currentBit!8683 (_2!8170 lt!268929))))))

(declare-fun moveBitIndex!0 (BitStream!7394 (_ BitVec 64)) tuple2!15052)

(assert (=> d!61741 (= lt!270068 (_2!8168 (moveBitIndex!0 (_2!8170 lt!268929) (bvsub lt!268926 lt!268918))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!7394 (_ BitVec 64)) Bool)

(assert (=> d!61741 (moveBitIndexPrecond!0 (_2!8170 lt!268929) (bvsub lt!268926 lt!268918))))

(assert (=> d!61741 (= (withMovedBitIndex!0 (_2!8170 lt!268929) (bvsub lt!268926 lt!268918)) lt!270068)))

(declare-fun b!174889 () Bool)

(assert (=> b!174889 (= e!121912 (= (size!4143 (buf!4574 (_2!8170 lt!268929))) (size!4143 (buf!4574 lt!270068))))))

(assert (= (and d!61741 res!144841) b!174889))

(declare-fun m!274891 () Bool)

(assert (=> d!61741 m!274891))

(declare-fun m!274893 () Bool)

(assert (=> d!61741 m!274893))

(declare-fun m!274895 () Bool)

(assert (=> d!61741 m!274895))

(declare-fun m!274897 () Bool)

(assert (=> d!61741 m!274897))

(assert (=> b!174435 d!61741))

(assert (=> b!174435 d!61463))

(assert (=> b!174435 d!61465))

(assert (=> b!174436 d!61465))

(declare-fun d!61743 () Bool)

(assert (=> d!61743 (arrayBitRangesEq!0 (buf!4574 (_2!8168 lt!268755)) (buf!4574 thiss!1187) lt!268919 lt!268924)))

(declare-fun lt!270072 () Unit!12540)

(declare-fun choose!8 (array!9389 array!9389 (_ BitVec 64) (_ BitVec 64)) Unit!12540)

(assert (=> d!61743 (= lt!270072 (choose!8 (buf!4574 thiss!1187) (buf!4574 (_2!8168 lt!268755)) lt!268919 lt!268924))))

(assert (=> d!61743 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!268919) (bvsle lt!268919 lt!268924))))

(assert (=> d!61743 (= (arrayBitRangesEqSymmetric!0 (buf!4574 thiss!1187) (buf!4574 (_2!8168 lt!268755)) lt!268919 lt!268924) lt!270072)))

(declare-fun bs!15376 () Bool)

(assert (= bs!15376 d!61743))

(assert (=> bs!15376 m!273837))

(declare-fun m!274899 () Bool)

(assert (=> bs!15376 m!274899))

(assert (=> b!174436 d!61743))

(declare-fun d!61745 () Bool)

(declare-fun res!144853 () Bool)

(declare-fun e!121930 () Bool)

(assert (=> d!61745 (=> res!144853 e!121930)))

(assert (=> d!61745 (= res!144853 (bvsge lt!268919 lt!268924))))

(assert (=> d!61745 (= (arrayBitRangesEq!0 (buf!4574 (_2!8168 lt!268755)) (buf!4574 thiss!1187) lt!268919 lt!268924) e!121930)))

(declare-fun b!174904 () Bool)

(declare-fun e!121927 () Bool)

(declare-fun e!121929 () Bool)

(assert (=> b!174904 (= e!121927 e!121929)))

(declare-fun res!144854 () Bool)

(declare-fun call!2907 () Bool)

(assert (=> b!174904 (= res!144854 call!2907)))

(assert (=> b!174904 (=> (not res!144854) (not e!121929))))

(declare-fun b!174905 () Bool)

(assert (=> b!174905 (= e!121927 call!2907)))

(declare-datatypes ((tuple4!256 0))(
  ( (tuple4!257 (_1!8181 (_ BitVec 32)) (_2!8181 (_ BitVec 32)) (_3!644 (_ BitVec 32)) (_4!128 (_ BitVec 32))) )
))
(declare-fun lt!270079 () tuple4!256)

(declare-fun b!174906 () Bool)

(declare-fun lt!270080 () (_ BitVec 32))

(declare-fun e!121926 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!174906 (= e!121926 (byteRangesEq!0 (select (arr!5073 (buf!4574 (_2!8168 lt!268755))) (_4!128 lt!270079)) (select (arr!5073 (buf!4574 thiss!1187)) (_4!128 lt!270079)) #b00000000000000000000000000000000 lt!270080))))

(declare-fun bm!2904 () Bool)

(declare-fun lt!270081 () (_ BitVec 32))

(declare-fun c!9216 () Bool)

(assert (=> bm!2904 (= call!2907 (byteRangesEq!0 (select (arr!5073 (buf!4574 (_2!8168 lt!268755))) (_3!644 lt!270079)) (select (arr!5073 (buf!4574 thiss!1187)) (_3!644 lt!270079)) lt!270081 (ite c!9216 lt!270080 #b00000000000000000000000000001000)))))

(declare-fun b!174907 () Bool)

(declare-fun res!144855 () Bool)

(assert (=> b!174907 (= res!144855 (= lt!270080 #b00000000000000000000000000000000))))

(assert (=> b!174907 (=> res!144855 e!121926)))

(assert (=> b!174907 (= e!121929 e!121926)))

(declare-fun b!174908 () Bool)

(declare-fun e!121928 () Bool)

(assert (=> b!174908 (= e!121928 e!121927)))

(assert (=> b!174908 (= c!9216 (= (_3!644 lt!270079) (_4!128 lt!270079)))))

(declare-fun b!174909 () Bool)

(declare-fun e!121925 () Bool)

(declare-fun arrayRangesEq!690 (array!9389 array!9389 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!174909 (= e!121925 (arrayRangesEq!690 (buf!4574 (_2!8168 lt!268755)) (buf!4574 thiss!1187) (_1!8181 lt!270079) (_2!8181 lt!270079)))))

(declare-fun b!174910 () Bool)

(assert (=> b!174910 (= e!121930 e!121928)))

(declare-fun res!144856 () Bool)

(assert (=> b!174910 (=> (not res!144856) (not e!121928))))

(assert (=> b!174910 (= res!144856 e!121925)))

(declare-fun res!144852 () Bool)

(assert (=> b!174910 (=> res!144852 e!121925)))

(assert (=> b!174910 (= res!144852 (bvsge (_1!8181 lt!270079) (_2!8181 lt!270079)))))

(assert (=> b!174910 (= lt!270080 ((_ extract 31 0) (bvsrem lt!268924 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!174910 (= lt!270081 ((_ extract 31 0) (bvsrem lt!268919 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!256)

(assert (=> b!174910 (= lt!270079 (arrayBitIndices!0 lt!268919 lt!268924))))

(assert (= (and d!61745 (not res!144853)) b!174910))

(assert (= (and b!174910 (not res!144852)) b!174909))

(assert (= (and b!174910 res!144856) b!174908))

(assert (= (and b!174908 c!9216) b!174905))

(assert (= (and b!174908 (not c!9216)) b!174904))

(assert (= (and b!174904 res!144854) b!174907))

(assert (= (and b!174907 (not res!144855)) b!174906))

(assert (= (or b!174905 b!174904) bm!2904))

(declare-fun m!274901 () Bool)

(assert (=> b!174906 m!274901))

(declare-fun m!274903 () Bool)

(assert (=> b!174906 m!274903))

(assert (=> b!174906 m!274901))

(assert (=> b!174906 m!274903))

(declare-fun m!274905 () Bool)

(assert (=> b!174906 m!274905))

(declare-fun m!274907 () Bool)

(assert (=> bm!2904 m!274907))

(declare-fun m!274909 () Bool)

(assert (=> bm!2904 m!274909))

(assert (=> bm!2904 m!274907))

(assert (=> bm!2904 m!274909))

(declare-fun m!274911 () Bool)

(assert (=> bm!2904 m!274911))

(declare-fun m!274913 () Bool)

(assert (=> b!174909 m!274913))

(declare-fun m!274915 () Bool)

(assert (=> b!174910 m!274915))

(assert (=> b!174436 d!61745))

(declare-fun d!61747 () Bool)

(declare-fun e!121931 () Bool)

(assert (=> d!61747 e!121931))

(declare-fun res!144858 () Bool)

(assert (=> d!61747 (=> (not res!144858) (not e!121931))))

(declare-fun lt!270084 () (_ BitVec 64))

(declare-fun lt!270086 () (_ BitVec 64))

(declare-fun lt!270083 () (_ BitVec 64))

(assert (=> d!61747 (= res!144858 (= lt!270086 (bvsub lt!270084 lt!270083)))))

(assert (=> d!61747 (or (= (bvand lt!270084 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!270083 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!270084 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!270084 lt!270083) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!61747 (= lt!270083 (remainingBits!0 ((_ sign_extend 32) (size!4143 (buf!4574 (_2!8168 lt!269318)))) ((_ sign_extend 32) (currentByte!8688 (_2!8168 lt!269318))) ((_ sign_extend 32) (currentBit!8683 (_2!8168 lt!269318)))))))

(declare-fun lt!270082 () (_ BitVec 64))

(declare-fun lt!270087 () (_ BitVec 64))

(assert (=> d!61747 (= lt!270084 (bvmul lt!270082 lt!270087))))

(assert (=> d!61747 (or (= lt!270082 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!270087 (bvsdiv (bvmul lt!270082 lt!270087) lt!270082)))))

(assert (=> d!61747 (= lt!270087 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!61747 (= lt!270082 ((_ sign_extend 32) (size!4143 (buf!4574 (_2!8168 lt!269318)))))))

(assert (=> d!61747 (= lt!270086 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8688 (_2!8168 lt!269318))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8683 (_2!8168 lt!269318)))))))

(assert (=> d!61747 (invariant!0 (currentBit!8683 (_2!8168 lt!269318)) (currentByte!8688 (_2!8168 lt!269318)) (size!4143 (buf!4574 (_2!8168 lt!269318))))))

(assert (=> d!61747 (= (bitIndex!0 (size!4143 (buf!4574 (_2!8168 lt!269318))) (currentByte!8688 (_2!8168 lt!269318)) (currentBit!8683 (_2!8168 lt!269318))) lt!270086)))

(declare-fun b!174911 () Bool)

(declare-fun res!144857 () Bool)

(assert (=> b!174911 (=> (not res!144857) (not e!121931))))

(assert (=> b!174911 (= res!144857 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!270086))))

(declare-fun b!174912 () Bool)

(declare-fun lt!270085 () (_ BitVec 64))

(assert (=> b!174912 (= e!121931 (bvsle lt!270086 (bvmul lt!270085 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!174912 (or (= lt!270085 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!270085 #b0000000000000000000000000000000000000000000000000000000000001000) lt!270085)))))

(assert (=> b!174912 (= lt!270085 ((_ sign_extend 32) (size!4143 (buf!4574 (_2!8168 lt!269318)))))))

(assert (= (and d!61747 res!144858) b!174911))

(assert (= (and b!174911 res!144857) b!174912))

(declare-fun m!274917 () Bool)

(assert (=> d!61747 m!274917))

(declare-fun m!274919 () Bool)

(assert (=> d!61747 m!274919))

(assert (=> b!174547 d!61747))

(assert (=> b!174547 d!61465))

(declare-fun d!61749 () Bool)

(assert (=> d!61749 (= (remainingBits!0 ((_ sign_extend 32) (size!4143 (buf!4574 (_2!8168 lt!268755)))) ((_ sign_extend 32) (currentByte!8688 thiss!1187)) ((_ sign_extend 32) (currentBit!8683 thiss!1187))) (bvsub (bvmul ((_ sign_extend 32) (size!4143 (buf!4574 (_2!8168 lt!268755)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!8688 thiss!1187)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8683 thiss!1187)))))))

(assert (=> d!61431 d!61749))

(declare-fun d!61751 () Bool)

(assert (=> d!61751 (= (onesLSBLong!0 #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!174550 d!61751))

(declare-fun d!61753 () Bool)

(declare-fun lt!270090 () tuple2!15062)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!7394 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!15062)

(assert (=> d!61753 (= lt!270090 (readNBitsLSBFirstsLoop!0 (_1!8170 lt!269333) nBits!340 #b00000000000000000000000000000000 (bvand v!186 (onesLSBLong!0 #b00000000000000000000000000000000))))))

(assert (=> d!61753 (= (readNBitsLSBFirstsLoopPure!0 (_1!8170 lt!269333) nBits!340 #b00000000000000000000000000000000 (bvand v!186 (onesLSBLong!0 #b00000000000000000000000000000000))) (tuple2!15055 (_2!8173 lt!270090) (_1!8173 lt!270090)))))

(declare-fun bs!15377 () Bool)

(assert (= bs!15377 d!61753))

(declare-fun m!274921 () Bool)

(assert (=> bs!15377 m!274921))

(assert (=> b!174550 d!61753))

(declare-fun b!174913 () Bool)

(declare-fun lt!270102 () tuple2!15056)

(declare-fun e!121933 () Bool)

(declare-fun lt!270099 () (_ BitVec 64))

(declare-fun lt!270091 () (_ BitVec 64))

(assert (=> b!174913 (= e!121933 (= (_1!8170 lt!270102) (withMovedBitIndex!0 (_2!8170 lt!270102) (bvsub lt!270099 lt!270091))))))

(assert (=> b!174913 (or (= (bvand lt!270099 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!270091 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!270099 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!270099 lt!270091) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!174913 (= lt!270091 (bitIndex!0 (size!4143 (buf!4574 (_2!8168 lt!269323))) (currentByte!8688 (_2!8168 lt!269323)) (currentBit!8683 (_2!8168 lt!269323))))))

(assert (=> b!174913 (= lt!270099 (bitIndex!0 (size!4143 (buf!4574 thiss!1187)) (currentByte!8688 thiss!1187) (currentBit!8683 thiss!1187)))))

(declare-fun d!61755 () Bool)

(assert (=> d!61755 e!121933))

(declare-fun res!144860 () Bool)

(assert (=> d!61755 (=> (not res!144860) (not e!121933))))

(assert (=> d!61755 (= res!144860 (isPrefixOf!0 (_1!8170 lt!270102) (_2!8170 lt!270102)))))

(declare-fun lt!270093 () BitStream!7394)

(assert (=> d!61755 (= lt!270102 (tuple2!15057 lt!270093 (_2!8168 lt!269323)))))

(declare-fun lt!270104 () Unit!12540)

(declare-fun lt!270095 () Unit!12540)

(assert (=> d!61755 (= lt!270104 lt!270095)))

(assert (=> d!61755 (isPrefixOf!0 lt!270093 (_2!8168 lt!269323))))

(assert (=> d!61755 (= lt!270095 (lemmaIsPrefixTransitive!0 lt!270093 (_2!8168 lt!269323) (_2!8168 lt!269323)))))

(declare-fun lt!270100 () Unit!12540)

(declare-fun lt!270106 () Unit!12540)

(assert (=> d!61755 (= lt!270100 lt!270106)))

(assert (=> d!61755 (isPrefixOf!0 lt!270093 (_2!8168 lt!269323))))

(assert (=> d!61755 (= lt!270106 (lemmaIsPrefixTransitive!0 lt!270093 thiss!1187 (_2!8168 lt!269323)))))

(declare-fun lt!270094 () Unit!12540)

(declare-fun e!121932 () Unit!12540)

(assert (=> d!61755 (= lt!270094 e!121932)))

(declare-fun c!9217 () Bool)

(assert (=> d!61755 (= c!9217 (not (= (size!4143 (buf!4574 thiss!1187)) #b00000000000000000000000000000000)))))

(declare-fun lt!270108 () Unit!12540)

(declare-fun lt!270107 () Unit!12540)

(assert (=> d!61755 (= lt!270108 lt!270107)))

(assert (=> d!61755 (isPrefixOf!0 (_2!8168 lt!269323) (_2!8168 lt!269323))))

(assert (=> d!61755 (= lt!270107 (lemmaIsPrefixRefl!0 (_2!8168 lt!269323)))))

(declare-fun lt!270101 () Unit!12540)

(declare-fun lt!270103 () Unit!12540)

(assert (=> d!61755 (= lt!270101 lt!270103)))

(assert (=> d!61755 (= lt!270103 (lemmaIsPrefixRefl!0 (_2!8168 lt!269323)))))

(declare-fun lt!270105 () Unit!12540)

(declare-fun lt!270096 () Unit!12540)

(assert (=> d!61755 (= lt!270105 lt!270096)))

(assert (=> d!61755 (isPrefixOf!0 lt!270093 lt!270093)))

(assert (=> d!61755 (= lt!270096 (lemmaIsPrefixRefl!0 lt!270093))))

(declare-fun lt!270098 () Unit!12540)

(declare-fun lt!270109 () Unit!12540)

(assert (=> d!61755 (= lt!270098 lt!270109)))

(assert (=> d!61755 (isPrefixOf!0 thiss!1187 thiss!1187)))

(assert (=> d!61755 (= lt!270109 (lemmaIsPrefixRefl!0 thiss!1187))))

(assert (=> d!61755 (= lt!270093 (BitStream!7395 (buf!4574 (_2!8168 lt!269323)) (currentByte!8688 thiss!1187) (currentBit!8683 thiss!1187)))))

(assert (=> d!61755 (isPrefixOf!0 thiss!1187 (_2!8168 lt!269323))))

(assert (=> d!61755 (= (reader!0 thiss!1187 (_2!8168 lt!269323)) lt!270102)))

(declare-fun b!174914 () Bool)

(declare-fun lt!270110 () Unit!12540)

(assert (=> b!174914 (= e!121932 lt!270110)))

(declare-fun lt!270092 () (_ BitVec 64))

(assert (=> b!174914 (= lt!270092 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!270097 () (_ BitVec 64))

(assert (=> b!174914 (= lt!270097 (bitIndex!0 (size!4143 (buf!4574 thiss!1187)) (currentByte!8688 thiss!1187) (currentBit!8683 thiss!1187)))))

(assert (=> b!174914 (= lt!270110 (arrayBitRangesEqSymmetric!0 (buf!4574 thiss!1187) (buf!4574 (_2!8168 lt!269323)) lt!270092 lt!270097))))

(assert (=> b!174914 (arrayBitRangesEq!0 (buf!4574 (_2!8168 lt!269323)) (buf!4574 thiss!1187) lt!270092 lt!270097)))

(declare-fun b!174915 () Bool)

(declare-fun Unit!12606 () Unit!12540)

(assert (=> b!174915 (= e!121932 Unit!12606)))

(declare-fun b!174916 () Bool)

(declare-fun res!144859 () Bool)

(assert (=> b!174916 (=> (not res!144859) (not e!121933))))

(assert (=> b!174916 (= res!144859 (isPrefixOf!0 (_2!8170 lt!270102) (_2!8168 lt!269323)))))

(declare-fun b!174917 () Bool)

(declare-fun res!144861 () Bool)

(assert (=> b!174917 (=> (not res!144861) (not e!121933))))

(assert (=> b!174917 (= res!144861 (isPrefixOf!0 (_1!8170 lt!270102) thiss!1187))))

(assert (= (and d!61755 c!9217) b!174914))

(assert (= (and d!61755 (not c!9217)) b!174915))

(assert (= (and d!61755 res!144860) b!174917))

(assert (= (and b!174917 res!144861) b!174916))

(assert (= (and b!174916 res!144859) b!174913))

(declare-fun m!274923 () Bool)

(assert (=> b!174917 m!274923))

(declare-fun m!274925 () Bool)

(assert (=> b!174916 m!274925))

(declare-fun m!274927 () Bool)

(assert (=> b!174913 m!274927))

(assert (=> b!174913 m!273975))

(assert (=> b!174913 m!273751))

(declare-fun m!274929 () Bool)

(assert (=> d!61755 m!274929))

(assert (=> d!61755 m!273817))

(declare-fun m!274931 () Bool)

(assert (=> d!61755 m!274931))

(declare-fun m!274933 () Bool)

(assert (=> d!61755 m!274933))

(declare-fun m!274935 () Bool)

(assert (=> d!61755 m!274935))

(assert (=> d!61755 m!273971))

(declare-fun m!274937 () Bool)

(assert (=> d!61755 m!274937))

(assert (=> d!61755 m!273827))

(declare-fun m!274939 () Bool)

(assert (=> d!61755 m!274939))

(declare-fun m!274941 () Bool)

(assert (=> d!61755 m!274941))

(declare-fun m!274943 () Bool)

(assert (=> d!61755 m!274943))

(assert (=> b!174914 m!273751))

(declare-fun m!274945 () Bool)

(assert (=> b!174914 m!274945))

(declare-fun m!274947 () Bool)

(assert (=> b!174914 m!274947))

(assert (=> b!174550 d!61755))

(declare-fun d!61757 () Bool)

(assert (=> d!61757 (validate_offset_bits!1 ((_ sign_extend 32) (size!4143 (buf!4574 (_2!8168 lt!269323)))) ((_ sign_extend 32) (currentByte!8688 thiss!1187)) ((_ sign_extend 32) (currentBit!8683 thiss!1187)) lt!269315)))

(declare-fun lt!270111 () Unit!12540)

(assert (=> d!61757 (= lt!270111 (choose!9 thiss!1187 (buf!4574 (_2!8168 lt!269323)) lt!269315 (BitStream!7395 (buf!4574 (_2!8168 lt!269323)) (currentByte!8688 thiss!1187) (currentBit!8683 thiss!1187))))))

(assert (=> d!61757 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1187 (buf!4574 (_2!8168 lt!269323)) lt!269315) lt!270111)))

(declare-fun bs!15378 () Bool)

(assert (= bs!15378 d!61757))

(assert (=> bs!15378 m!274053))

(declare-fun m!274949 () Bool)

(assert (=> bs!15378 m!274949))

(assert (=> b!174550 d!61757))

(assert (=> b!174550 d!61427))

(declare-fun d!61759 () Bool)

(assert (=> d!61759 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4143 (buf!4574 (_2!8168 lt!269323)))) ((_ sign_extend 32) (currentByte!8688 thiss!1187)) ((_ sign_extend 32) (currentBit!8683 thiss!1187)) lt!269315) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4143 (buf!4574 (_2!8168 lt!269323)))) ((_ sign_extend 32) (currentByte!8688 thiss!1187)) ((_ sign_extend 32) (currentBit!8683 thiss!1187))) lt!269315))))

(declare-fun bs!15379 () Bool)

(assert (= bs!15379 d!61759))

(declare-fun m!274951 () Bool)

(assert (=> bs!15379 m!274951))

(assert (=> b!174550 d!61759))

(declare-fun d!61761 () Bool)

(assert (=> d!61761 (= (remainingBits!0 ((_ sign_extend 32) (size!4143 (buf!4574 (_2!8168 lt!268755)))) ((_ sign_extend 32) (currentByte!8688 (_2!8168 lt!268755))) ((_ sign_extend 32) (currentBit!8683 (_2!8168 lt!268755)))) (bvsub (bvmul ((_ sign_extend 32) (size!4143 (buf!4574 (_2!8168 lt!268755)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!8688 (_2!8168 lt!268755))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8683 (_2!8168 lt!268755))))))))

(assert (=> d!61463 d!61761))

(declare-fun d!61763 () Bool)

(assert (=> d!61763 (= (invariant!0 (currentBit!8683 (_2!8168 lt!268755)) (currentByte!8688 (_2!8168 lt!268755)) (size!4143 (buf!4574 (_2!8168 lt!268755)))) (and (bvsge (currentBit!8683 (_2!8168 lt!268755)) #b00000000000000000000000000000000) (bvslt (currentBit!8683 (_2!8168 lt!268755)) #b00000000000000000000000000001000) (bvsge (currentByte!8688 (_2!8168 lt!268755)) #b00000000000000000000000000000000) (or (bvslt (currentByte!8688 (_2!8168 lt!268755)) (size!4143 (buf!4574 (_2!8168 lt!268755)))) (and (= (currentBit!8683 (_2!8168 lt!268755)) #b00000000000000000000000000000000) (= (currentByte!8688 (_2!8168 lt!268755)) (size!4143 (buf!4574 (_2!8168 lt!268755))))))))))

(assert (=> d!61463 d!61763))

(declare-fun d!61765 () Bool)

(assert (=> d!61765 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4143 (buf!4574 thiss!1187))) ((_ sign_extend 32) (currentByte!8688 thiss!1187)) ((_ sign_extend 32) (currentBit!8683 thiss!1187)) lt!269315) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4143 (buf!4574 thiss!1187))) ((_ sign_extend 32) (currentByte!8688 thiss!1187)) ((_ sign_extend 32) (currentBit!8683 thiss!1187))) lt!269315))))

(declare-fun bs!15380 () Bool)

(assert (= bs!15380 d!61765))

(assert (=> bs!15380 m!274063))

(assert (=> b!174546 d!61765))

(assert (=> d!61419 d!61431))

(declare-fun d!61767 () Bool)

(assert (=> d!61767 (validate_offset_bits!1 ((_ sign_extend 32) (size!4143 (buf!4574 (_2!8168 lt!268755)))) ((_ sign_extend 32) (currentByte!8688 thiss!1187)) ((_ sign_extend 32) (currentBit!8683 thiss!1187)) ((_ sign_extend 32) nBits!340))))

(assert (=> d!61767 true))

(declare-fun _$6!360 () Unit!12540)

(assert (=> d!61767 (= (choose!9 thiss!1187 (buf!4574 (_2!8168 lt!268755)) ((_ sign_extend 32) nBits!340) (BitStream!7395 (buf!4574 (_2!8168 lt!268755)) (currentByte!8688 thiss!1187) (currentBit!8683 thiss!1187))) _$6!360)))

(declare-fun bs!15381 () Bool)

(assert (= bs!15381 d!61767))

(assert (=> bs!15381 m!273743))

(assert (=> d!61419 d!61767))

(assert (=> d!61459 d!61469))

(declare-fun d!61769 () Bool)

(assert (=> d!61769 (isPrefixOf!0 lt!268920 (_2!8168 lt!268755))))

(declare-fun lt!270114 () Unit!12540)

(declare-fun choose!30 (BitStream!7394 BitStream!7394 BitStream!7394) Unit!12540)

(assert (=> d!61769 (= lt!270114 (choose!30 lt!268920 thiss!1187 (_2!8168 lt!268755)))))

(assert (=> d!61769 (isPrefixOf!0 lt!268920 thiss!1187)))

(assert (=> d!61769 (= (lemmaIsPrefixTransitive!0 lt!268920 thiss!1187 (_2!8168 lt!268755)) lt!270114)))

(declare-fun bs!15382 () Bool)

(assert (= bs!15382 d!61769))

(assert (=> bs!15382 m!273815))

(declare-fun m!274953 () Bool)

(assert (=> bs!15382 m!274953))

(declare-fun m!274955 () Bool)

(assert (=> bs!15382 m!274955))

(assert (=> d!61435 d!61769))

(declare-fun d!61771 () Bool)

(assert (=> d!61771 (isPrefixOf!0 lt!268920 (_2!8168 lt!268755))))

(declare-fun lt!270115 () Unit!12540)

(assert (=> d!61771 (= lt!270115 (choose!30 lt!268920 (_2!8168 lt!268755) (_2!8168 lt!268755)))))

(assert (=> d!61771 (isPrefixOf!0 lt!268920 (_2!8168 lt!268755))))

(assert (=> d!61771 (= (lemmaIsPrefixTransitive!0 lt!268920 (_2!8168 lt!268755) (_2!8168 lt!268755)) lt!270115)))

(declare-fun bs!15383 () Bool)

(assert (= bs!15383 d!61771))

(assert (=> bs!15383 m!273815))

(declare-fun m!274957 () Bool)

(assert (=> bs!15383 m!274957))

(assert (=> bs!15383 m!273815))

(assert (=> d!61435 d!61771))

(declare-fun d!61773 () Bool)

(declare-fun res!144864 () Bool)

(declare-fun e!121935 () Bool)

(assert (=> d!61773 (=> (not res!144864) (not e!121935))))

(assert (=> d!61773 (= res!144864 (= (size!4143 (buf!4574 lt!268920)) (size!4143 (buf!4574 lt!268920))))))

(assert (=> d!61773 (= (isPrefixOf!0 lt!268920 lt!268920) e!121935)))

(declare-fun b!174918 () Bool)

(declare-fun res!144862 () Bool)

(assert (=> b!174918 (=> (not res!144862) (not e!121935))))

(assert (=> b!174918 (= res!144862 (bvsle (bitIndex!0 (size!4143 (buf!4574 lt!268920)) (currentByte!8688 lt!268920) (currentBit!8683 lt!268920)) (bitIndex!0 (size!4143 (buf!4574 lt!268920)) (currentByte!8688 lt!268920) (currentBit!8683 lt!268920))))))

(declare-fun b!174919 () Bool)

(declare-fun e!121934 () Bool)

(assert (=> b!174919 (= e!121935 e!121934)))

(declare-fun res!144863 () Bool)

(assert (=> b!174919 (=> res!144863 e!121934)))

(assert (=> b!174919 (= res!144863 (= (size!4143 (buf!4574 lt!268920)) #b00000000000000000000000000000000))))

(declare-fun b!174920 () Bool)

(assert (=> b!174920 (= e!121934 (arrayBitRangesEq!0 (buf!4574 lt!268920) (buf!4574 lt!268920) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4143 (buf!4574 lt!268920)) (currentByte!8688 lt!268920) (currentBit!8683 lt!268920))))))

(assert (= (and d!61773 res!144864) b!174918))

(assert (= (and b!174918 res!144862) b!174919))

(assert (= (and b!174919 (not res!144863)) b!174920))

(declare-fun m!274959 () Bool)

(assert (=> b!174918 m!274959))

(assert (=> b!174918 m!274959))

(assert (=> b!174920 m!274959))

(assert (=> b!174920 m!274959))

(declare-fun m!274961 () Bool)

(assert (=> b!174920 m!274961))

(assert (=> d!61435 d!61773))

(declare-fun d!61775 () Bool)

(assert (=> d!61775 (isPrefixOf!0 thiss!1187 thiss!1187)))

(declare-fun lt!270118 () Unit!12540)

(declare-fun choose!11 (BitStream!7394) Unit!12540)

(assert (=> d!61775 (= lt!270118 (choose!11 thiss!1187))))

(assert (=> d!61775 (= (lemmaIsPrefixRefl!0 thiss!1187) lt!270118)))

(declare-fun bs!15385 () Bool)

(assert (= bs!15385 d!61775))

(assert (=> bs!15385 m!273817))

(declare-fun m!274963 () Bool)

(assert (=> bs!15385 m!274963))

(assert (=> d!61435 d!61775))

(declare-fun d!61777 () Bool)

(assert (=> d!61777 (isPrefixOf!0 (_2!8168 lt!268755) (_2!8168 lt!268755))))

(declare-fun lt!270119 () Unit!12540)

(assert (=> d!61777 (= lt!270119 (choose!11 (_2!8168 lt!268755)))))

(assert (=> d!61777 (= (lemmaIsPrefixRefl!0 (_2!8168 lt!268755)) lt!270119)))

(declare-fun bs!15386 () Bool)

(assert (= bs!15386 d!61777))

(assert (=> bs!15386 m!273833))

(declare-fun m!274965 () Bool)

(assert (=> bs!15386 m!274965))

(assert (=> d!61435 d!61777))

(declare-fun d!61779 () Bool)

(declare-fun res!144867 () Bool)

(declare-fun e!121937 () Bool)

(assert (=> d!61779 (=> (not res!144867) (not e!121937))))

(assert (=> d!61779 (= res!144867 (= (size!4143 (buf!4574 lt!268920)) (size!4143 (buf!4574 (_2!8168 lt!268755)))))))

(assert (=> d!61779 (= (isPrefixOf!0 lt!268920 (_2!8168 lt!268755)) e!121937)))

(declare-fun b!174921 () Bool)

(declare-fun res!144865 () Bool)

(assert (=> b!174921 (=> (not res!144865) (not e!121937))))

(assert (=> b!174921 (= res!144865 (bvsle (bitIndex!0 (size!4143 (buf!4574 lt!268920)) (currentByte!8688 lt!268920) (currentBit!8683 lt!268920)) (bitIndex!0 (size!4143 (buf!4574 (_2!8168 lt!268755))) (currentByte!8688 (_2!8168 lt!268755)) (currentBit!8683 (_2!8168 lt!268755)))))))

(declare-fun b!174922 () Bool)

(declare-fun e!121936 () Bool)

(assert (=> b!174922 (= e!121937 e!121936)))

(declare-fun res!144866 () Bool)

(assert (=> b!174922 (=> res!144866 e!121936)))

(assert (=> b!174922 (= res!144866 (= (size!4143 (buf!4574 lt!268920)) #b00000000000000000000000000000000))))

(declare-fun b!174923 () Bool)

(assert (=> b!174923 (= e!121936 (arrayBitRangesEq!0 (buf!4574 lt!268920) (buf!4574 (_2!8168 lt!268755)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4143 (buf!4574 lt!268920)) (currentByte!8688 lt!268920) (currentBit!8683 lt!268920))))))

(assert (= (and d!61779 res!144867) b!174921))

(assert (= (and b!174921 res!144865) b!174922))

(assert (= (and b!174922 (not res!144866)) b!174923))

(assert (=> b!174921 m!274959))

(assert (=> b!174921 m!273749))

(assert (=> b!174923 m!274959))

(assert (=> b!174923 m!274959))

(declare-fun m!274967 () Bool)

(assert (=> b!174923 m!274967))

(assert (=> d!61435 d!61779))

(declare-fun d!61781 () Bool)

(declare-fun res!144870 () Bool)

(declare-fun e!121939 () Bool)

(assert (=> d!61781 (=> (not res!144870) (not e!121939))))

(assert (=> d!61781 (= res!144870 (= (size!4143 (buf!4574 (_2!8168 lt!268755))) (size!4143 (buf!4574 (_2!8168 lt!268755)))))))

(assert (=> d!61781 (= (isPrefixOf!0 (_2!8168 lt!268755) (_2!8168 lt!268755)) e!121939)))

(declare-fun b!174924 () Bool)

(declare-fun res!144868 () Bool)

(assert (=> b!174924 (=> (not res!144868) (not e!121939))))

(assert (=> b!174924 (= res!144868 (bvsle (bitIndex!0 (size!4143 (buf!4574 (_2!8168 lt!268755))) (currentByte!8688 (_2!8168 lt!268755)) (currentBit!8683 (_2!8168 lt!268755))) (bitIndex!0 (size!4143 (buf!4574 (_2!8168 lt!268755))) (currentByte!8688 (_2!8168 lt!268755)) (currentBit!8683 (_2!8168 lt!268755)))))))

(declare-fun b!174925 () Bool)

(declare-fun e!121938 () Bool)

(assert (=> b!174925 (= e!121939 e!121938)))

(declare-fun res!144869 () Bool)

(assert (=> b!174925 (=> res!144869 e!121938)))

(assert (=> b!174925 (= res!144869 (= (size!4143 (buf!4574 (_2!8168 lt!268755))) #b00000000000000000000000000000000))))

(declare-fun b!174926 () Bool)

(assert (=> b!174926 (= e!121938 (arrayBitRangesEq!0 (buf!4574 (_2!8168 lt!268755)) (buf!4574 (_2!8168 lt!268755)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4143 (buf!4574 (_2!8168 lt!268755))) (currentByte!8688 (_2!8168 lt!268755)) (currentBit!8683 (_2!8168 lt!268755)))))))

(assert (= (and d!61781 res!144870) b!174924))

(assert (= (and b!174924 res!144868) b!174925))

(assert (= (and b!174925 (not res!144869)) b!174926))

(assert (=> b!174924 m!273749))

(assert (=> b!174924 m!273749))

(assert (=> b!174926 m!273749))

(assert (=> b!174926 m!273749))

(declare-fun m!274969 () Bool)

(assert (=> b!174926 m!274969))

(assert (=> d!61435 d!61781))

(declare-fun d!61783 () Bool)

(declare-fun res!144873 () Bool)

(declare-fun e!121941 () Bool)

(assert (=> d!61783 (=> (not res!144873) (not e!121941))))

(assert (=> d!61783 (= res!144873 (= (size!4143 (buf!4574 (_1!8170 lt!268929))) (size!4143 (buf!4574 (_2!8170 lt!268929)))))))

(assert (=> d!61783 (= (isPrefixOf!0 (_1!8170 lt!268929) (_2!8170 lt!268929)) e!121941)))

(declare-fun b!174927 () Bool)

(declare-fun res!144871 () Bool)

(assert (=> b!174927 (=> (not res!144871) (not e!121941))))

(assert (=> b!174927 (= res!144871 (bvsle (bitIndex!0 (size!4143 (buf!4574 (_1!8170 lt!268929))) (currentByte!8688 (_1!8170 lt!268929)) (currentBit!8683 (_1!8170 lt!268929))) (bitIndex!0 (size!4143 (buf!4574 (_2!8170 lt!268929))) (currentByte!8688 (_2!8170 lt!268929)) (currentBit!8683 (_2!8170 lt!268929)))))))

(declare-fun b!174928 () Bool)

(declare-fun e!121940 () Bool)

(assert (=> b!174928 (= e!121941 e!121940)))

(declare-fun res!144872 () Bool)

(assert (=> b!174928 (=> res!144872 e!121940)))

(assert (=> b!174928 (= res!144872 (= (size!4143 (buf!4574 (_1!8170 lt!268929))) #b00000000000000000000000000000000))))

(declare-fun b!174929 () Bool)

(assert (=> b!174929 (= e!121940 (arrayBitRangesEq!0 (buf!4574 (_1!8170 lt!268929)) (buf!4574 (_2!8170 lt!268929)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4143 (buf!4574 (_1!8170 lt!268929))) (currentByte!8688 (_1!8170 lt!268929)) (currentBit!8683 (_1!8170 lt!268929)))))))

(assert (= (and d!61783 res!144873) b!174927))

(assert (= (and b!174927 res!144871) b!174928))

(assert (= (and b!174928 (not res!144872)) b!174929))

(declare-fun m!274971 () Bool)

(assert (=> b!174927 m!274971))

(assert (=> b!174927 m!274893))

(assert (=> b!174929 m!274971))

(assert (=> b!174929 m!274971))

(declare-fun m!274973 () Bool)

(assert (=> b!174929 m!274973))

(assert (=> d!61435 d!61783))

(declare-fun d!61785 () Bool)

(assert (=> d!61785 (isPrefixOf!0 lt!268920 lt!268920)))

(declare-fun lt!270120 () Unit!12540)

(assert (=> d!61785 (= lt!270120 (choose!11 lt!268920))))

(assert (=> d!61785 (= (lemmaIsPrefixRefl!0 lt!268920) lt!270120)))

(declare-fun bs!15387 () Bool)

(assert (= bs!15387 d!61785))

(assert (=> bs!15387 m!273829))

(declare-fun m!274975 () Bool)

(assert (=> bs!15387 m!274975))

(assert (=> d!61435 d!61785))

(assert (=> d!61435 d!61461))

(declare-fun d!61787 () Bool)

(declare-fun res!144876 () Bool)

(declare-fun e!121943 () Bool)

(assert (=> d!61787 (=> (not res!144876) (not e!121943))))

(assert (=> d!61787 (= res!144876 (= (size!4143 (buf!4574 thiss!1187)) (size!4143 (buf!4574 thiss!1187))))))

(assert (=> d!61787 (= (isPrefixOf!0 thiss!1187 thiss!1187) e!121943)))

(declare-fun b!174930 () Bool)

(declare-fun res!144874 () Bool)

(assert (=> b!174930 (=> (not res!144874) (not e!121943))))

(assert (=> b!174930 (= res!144874 (bvsle (bitIndex!0 (size!4143 (buf!4574 thiss!1187)) (currentByte!8688 thiss!1187) (currentBit!8683 thiss!1187)) (bitIndex!0 (size!4143 (buf!4574 thiss!1187)) (currentByte!8688 thiss!1187) (currentBit!8683 thiss!1187))))))

(declare-fun b!174931 () Bool)

(declare-fun e!121942 () Bool)

(assert (=> b!174931 (= e!121943 e!121942)))

(declare-fun res!144875 () Bool)

(assert (=> b!174931 (=> res!144875 e!121942)))

(assert (=> b!174931 (= res!144875 (= (size!4143 (buf!4574 thiss!1187)) #b00000000000000000000000000000000))))

(declare-fun b!174932 () Bool)

(assert (=> b!174932 (= e!121942 (arrayBitRangesEq!0 (buf!4574 thiss!1187) (buf!4574 thiss!1187) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4143 (buf!4574 thiss!1187)) (currentByte!8688 thiss!1187) (currentBit!8683 thiss!1187))))))

(assert (= (and d!61787 res!144876) b!174930))

(assert (= (and b!174930 res!144874) b!174931))

(assert (= (and b!174931 (not res!144875)) b!174932))

(assert (=> b!174930 m!273751))

(assert (=> b!174930 m!273751))

(assert (=> b!174932 m!273751))

(assert (=> b!174932 m!273751))

(declare-fun m!274977 () Bool)

(assert (=> b!174932 m!274977))

(assert (=> d!61435 d!61787))

(declare-fun d!61789 () Bool)

(declare-fun res!144879 () Bool)

(declare-fun e!121945 () Bool)

(assert (=> d!61789 (=> (not res!144879) (not e!121945))))

(assert (=> d!61789 (= res!144879 (= (size!4143 (buf!4574 thiss!1187)) (size!4143 (buf!4574 (_2!8168 lt!269318)))))))

(assert (=> d!61789 (= (isPrefixOf!0 thiss!1187 (_2!8168 lt!269318)) e!121945)))

(declare-fun b!174933 () Bool)

(declare-fun res!144877 () Bool)

(assert (=> b!174933 (=> (not res!144877) (not e!121945))))

(assert (=> b!174933 (= res!144877 (bvsle (bitIndex!0 (size!4143 (buf!4574 thiss!1187)) (currentByte!8688 thiss!1187) (currentBit!8683 thiss!1187)) (bitIndex!0 (size!4143 (buf!4574 (_2!8168 lt!269318))) (currentByte!8688 (_2!8168 lt!269318)) (currentBit!8683 (_2!8168 lt!269318)))))))

(declare-fun b!174934 () Bool)

(declare-fun e!121944 () Bool)

(assert (=> b!174934 (= e!121945 e!121944)))

(declare-fun res!144878 () Bool)

(assert (=> b!174934 (=> res!144878 e!121944)))

(assert (=> b!174934 (= res!144878 (= (size!4143 (buf!4574 thiss!1187)) #b00000000000000000000000000000000))))

(declare-fun b!174935 () Bool)

(assert (=> b!174935 (= e!121944 (arrayBitRangesEq!0 (buf!4574 thiss!1187) (buf!4574 (_2!8168 lt!269318)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4143 (buf!4574 thiss!1187)) (currentByte!8688 thiss!1187) (currentBit!8683 thiss!1187))))))

(assert (= (and d!61789 res!144879) b!174933))

(assert (= (and b!174933 res!144877) b!174934))

(assert (= (and b!174934 (not res!144878)) b!174935))

(assert (=> b!174933 m!273751))

(assert (=> b!174933 m!273969))

(assert (=> b!174935 m!273751))

(assert (=> b!174935 m!273751))

(declare-fun m!274979 () Bool)

(assert (=> b!174935 m!274979))

(assert (=> b!174545 d!61789))

(declare-fun d!61791 () Bool)

(declare-fun e!121946 () Bool)

(assert (=> d!61791 e!121946))

(declare-fun res!144881 () Bool)

(assert (=> d!61791 (=> (not res!144881) (not e!121946))))

(declare-fun lt!270122 () (_ BitVec 64))

(declare-fun lt!270125 () (_ BitVec 64))

(declare-fun lt!270123 () (_ BitVec 64))

(assert (=> d!61791 (= res!144881 (= lt!270125 (bvsub lt!270123 lt!270122)))))

(assert (=> d!61791 (or (= (bvand lt!270123 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!270122 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!270123 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!270123 lt!270122) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!61791 (= lt!270122 (remainingBits!0 ((_ sign_extend 32) (size!4143 (buf!4574 (_1!8174 lt!269292)))) ((_ sign_extend 32) (currentByte!8688 (_1!8174 lt!269292))) ((_ sign_extend 32) (currentBit!8683 (_1!8174 lt!269292)))))))

(declare-fun lt!270121 () (_ BitVec 64))

(declare-fun lt!270126 () (_ BitVec 64))

(assert (=> d!61791 (= lt!270123 (bvmul lt!270121 lt!270126))))

(assert (=> d!61791 (or (= lt!270121 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!270126 (bvsdiv (bvmul lt!270121 lt!270126) lt!270121)))))

(assert (=> d!61791 (= lt!270126 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!61791 (= lt!270121 ((_ sign_extend 32) (size!4143 (buf!4574 (_1!8174 lt!269292)))))))

(assert (=> d!61791 (= lt!270125 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8688 (_1!8174 lt!269292))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8683 (_1!8174 lt!269292)))))))

(assert (=> d!61791 (invariant!0 (currentBit!8683 (_1!8174 lt!269292)) (currentByte!8688 (_1!8174 lt!269292)) (size!4143 (buf!4574 (_1!8174 lt!269292))))))

(assert (=> d!61791 (= (bitIndex!0 (size!4143 (buf!4574 (_1!8174 lt!269292))) (currentByte!8688 (_1!8174 lt!269292)) (currentBit!8683 (_1!8174 lt!269292))) lt!270125)))

(declare-fun b!174936 () Bool)

(declare-fun res!144880 () Bool)

(assert (=> b!174936 (=> (not res!144880) (not e!121946))))

(assert (=> b!174936 (= res!144880 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!270125))))

(declare-fun b!174937 () Bool)

(declare-fun lt!270124 () (_ BitVec 64))

(assert (=> b!174937 (= e!121946 (bvsle lt!270125 (bvmul lt!270124 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!174937 (or (= lt!270124 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!270124 #b0000000000000000000000000000000000000000000000000000000000001000) lt!270124)))))

(assert (=> b!174937 (= lt!270124 ((_ sign_extend 32) (size!4143 (buf!4574 (_1!8174 lt!269292)))))))

(assert (= (and d!61791 res!144881) b!174936))

(assert (= (and b!174936 res!144880) b!174937))

(declare-fun m!274981 () Bool)

(assert (=> d!61791 m!274981))

(declare-fun m!274983 () Bool)

(assert (=> d!61791 m!274983))

(assert (=> b!174544 d!61791))

(assert (=> b!174544 d!61747))

(declare-fun d!61793 () Bool)

(declare-fun res!144883 () Bool)

(declare-fun e!121952 () Bool)

(assert (=> d!61793 (=> res!144883 e!121952)))

(assert (=> d!61793 (= res!144883 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4143 (buf!4574 thiss!1187)) (currentByte!8688 thiss!1187) (currentBit!8683 thiss!1187))))))

(assert (=> d!61793 (= (arrayBitRangesEq!0 (buf!4574 thiss!1187) (buf!4574 (_2!8168 lt!268755)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4143 (buf!4574 thiss!1187)) (currentByte!8688 thiss!1187) (currentBit!8683 thiss!1187))) e!121952)))

(declare-fun b!174938 () Bool)

(declare-fun e!121949 () Bool)

(declare-fun e!121951 () Bool)

(assert (=> b!174938 (= e!121949 e!121951)))

(declare-fun res!144884 () Bool)

(declare-fun call!2908 () Bool)

(assert (=> b!174938 (= res!144884 call!2908)))

(assert (=> b!174938 (=> (not res!144884) (not e!121951))))

(declare-fun b!174939 () Bool)

(assert (=> b!174939 (= e!121949 call!2908)))

(declare-fun lt!270128 () (_ BitVec 32))

(declare-fun e!121948 () Bool)

(declare-fun lt!270127 () tuple4!256)

(declare-fun b!174940 () Bool)

(assert (=> b!174940 (= e!121948 (byteRangesEq!0 (select (arr!5073 (buf!4574 thiss!1187)) (_4!128 lt!270127)) (select (arr!5073 (buf!4574 (_2!8168 lt!268755))) (_4!128 lt!270127)) #b00000000000000000000000000000000 lt!270128))))

(declare-fun bm!2905 () Bool)

(declare-fun lt!270129 () (_ BitVec 32))

(declare-fun c!9218 () Bool)

(assert (=> bm!2905 (= call!2908 (byteRangesEq!0 (select (arr!5073 (buf!4574 thiss!1187)) (_3!644 lt!270127)) (select (arr!5073 (buf!4574 (_2!8168 lt!268755))) (_3!644 lt!270127)) lt!270129 (ite c!9218 lt!270128 #b00000000000000000000000000001000)))))

(declare-fun b!174941 () Bool)

(declare-fun res!144885 () Bool)

(assert (=> b!174941 (= res!144885 (= lt!270128 #b00000000000000000000000000000000))))

(assert (=> b!174941 (=> res!144885 e!121948)))

(assert (=> b!174941 (= e!121951 e!121948)))

(declare-fun b!174942 () Bool)

(declare-fun e!121950 () Bool)

(assert (=> b!174942 (= e!121950 e!121949)))

(assert (=> b!174942 (= c!9218 (= (_3!644 lt!270127) (_4!128 lt!270127)))))

(declare-fun b!174943 () Bool)

(declare-fun e!121947 () Bool)

(assert (=> b!174943 (= e!121947 (arrayRangesEq!690 (buf!4574 thiss!1187) (buf!4574 (_2!8168 lt!268755)) (_1!8181 lt!270127) (_2!8181 lt!270127)))))

(declare-fun b!174944 () Bool)

(assert (=> b!174944 (= e!121952 e!121950)))

(declare-fun res!144886 () Bool)

(assert (=> b!174944 (=> (not res!144886) (not e!121950))))

(assert (=> b!174944 (= res!144886 e!121947)))

(declare-fun res!144882 () Bool)

(assert (=> b!174944 (=> res!144882 e!121947)))

(assert (=> b!174944 (= res!144882 (bvsge (_1!8181 lt!270127) (_2!8181 lt!270127)))))

(assert (=> b!174944 (= lt!270128 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!4143 (buf!4574 thiss!1187)) (currentByte!8688 thiss!1187) (currentBit!8683 thiss!1187)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!174944 (= lt!270129 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!174944 (= lt!270127 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4143 (buf!4574 thiss!1187)) (currentByte!8688 thiss!1187) (currentBit!8683 thiss!1187))))))

(assert (= (and d!61793 (not res!144883)) b!174944))

(assert (= (and b!174944 (not res!144882)) b!174943))

(assert (= (and b!174944 res!144886) b!174942))

(assert (= (and b!174942 c!9218) b!174939))

(assert (= (and b!174942 (not c!9218)) b!174938))

(assert (= (and b!174938 res!144884) b!174941))

(assert (= (and b!174941 (not res!144885)) b!174940))

(assert (= (or b!174939 b!174938) bm!2905))

(declare-fun m!274985 () Bool)

(assert (=> b!174940 m!274985))

(declare-fun m!274987 () Bool)

(assert (=> b!174940 m!274987))

(assert (=> b!174940 m!274985))

(assert (=> b!174940 m!274987))

(declare-fun m!274989 () Bool)

(assert (=> b!174940 m!274989))

(declare-fun m!274991 () Bool)

(assert (=> bm!2905 m!274991))

(declare-fun m!274993 () Bool)

(assert (=> bm!2905 m!274993))

(assert (=> bm!2905 m!274991))

(assert (=> bm!2905 m!274993))

(declare-fun m!274995 () Bool)

(assert (=> bm!2905 m!274995))

(declare-fun m!274997 () Bool)

(assert (=> b!174943 m!274997))

(assert (=> b!174944 m!273751))

(declare-fun m!274999 () Bool)

(assert (=> b!174944 m!274999))

(assert (=> b!174568 d!61793))

(assert (=> b!174568 d!61465))

(declare-fun d!61795 () Bool)

(declare-datatypes ((tuple2!15074 0))(
  ( (tuple2!15075 (_1!8182 Bool) (_2!8182 BitStream!7394)) )
))
(declare-fun lt!270132 () tuple2!15074)

(declare-fun readBit!0 (BitStream!7394) tuple2!15074)

(assert (=> d!61795 (= lt!270132 (readBit!0 (readerFrom!0 (_2!8168 lt!269318) (currentBit!8683 thiss!1187) (currentByte!8688 thiss!1187))))))

(assert (=> d!61795 (= (readBitPure!0 (readerFrom!0 (_2!8168 lt!269318) (currentBit!8683 thiss!1187) (currentByte!8688 thiss!1187))) (tuple2!15065 (_2!8182 lt!270132) (_1!8182 lt!270132)))))

(declare-fun bs!15388 () Bool)

(assert (= bs!15388 d!61795))

(assert (=> bs!15388 m!273979))

(declare-fun m!275001 () Bool)

(assert (=> bs!15388 m!275001))

(assert (=> b!174558 d!61795))

(declare-fun d!61797 () Bool)

(declare-fun e!121955 () Bool)

(assert (=> d!61797 e!121955))

(declare-fun res!144890 () Bool)

(assert (=> d!61797 (=> (not res!144890) (not e!121955))))

(assert (=> d!61797 (= res!144890 (invariant!0 (currentBit!8683 (_2!8168 lt!269318)) (currentByte!8688 (_2!8168 lt!269318)) (size!4143 (buf!4574 (_2!8168 lt!269318)))))))

(assert (=> d!61797 (= (readerFrom!0 (_2!8168 lt!269318) (currentBit!8683 thiss!1187) (currentByte!8688 thiss!1187)) (BitStream!7395 (buf!4574 (_2!8168 lt!269318)) (currentByte!8688 thiss!1187) (currentBit!8683 thiss!1187)))))

(declare-fun b!174947 () Bool)

(assert (=> b!174947 (= e!121955 (invariant!0 (currentBit!8683 thiss!1187) (currentByte!8688 thiss!1187) (size!4143 (buf!4574 (_2!8168 lt!269318)))))))

(assert (= (and d!61797 res!144890) b!174947))

(assert (=> d!61797 m!274919))

(declare-fun m!275003 () Bool)

(assert (=> b!174947 m!275003))

(assert (=> b!174558 d!61797))

(declare-fun d!61799 () Bool)

(assert (=> d!61799 (= (remainingBits!0 ((_ sign_extend 32) (size!4143 (buf!4574 thiss!1187))) ((_ sign_extend 32) (currentByte!8688 thiss!1187)) ((_ sign_extend 32) (currentBit!8683 thiss!1187))) (bvsub (bvmul ((_ sign_extend 32) (size!4143 (buf!4574 thiss!1187))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!8688 thiss!1187)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8683 thiss!1187)))))))

(assert (=> d!61471 d!61799))

(assert (=> b!174566 d!61465))

(assert (=> b!174566 d!61463))

(declare-fun d!61801 () Bool)

(assert (=> d!61801 (= (invariant!0 (currentBit!8683 (_2!8168 lt!269323)) (currentByte!8688 (_2!8168 lt!269323)) (size!4143 (buf!4574 (_2!8168 lt!269323)))) (and (bvsge (currentBit!8683 (_2!8168 lt!269323)) #b00000000000000000000000000000000) (bvslt (currentBit!8683 (_2!8168 lt!269323)) #b00000000000000000000000000001000) (bvsge (currentByte!8688 (_2!8168 lt!269323)) #b00000000000000000000000000000000) (or (bvslt (currentByte!8688 (_2!8168 lt!269323)) (size!4143 (buf!4574 (_2!8168 lt!269323)))) (and (= (currentBit!8683 (_2!8168 lt!269323)) #b00000000000000000000000000000000) (= (currentByte!8688 (_2!8168 lt!269323)) (size!4143 (buf!4574 (_2!8168 lt!269323))))))))))

(assert (=> d!61439 d!61801))

(declare-fun d!61803 () Bool)

(declare-fun e!121958 () Bool)

(assert (=> d!61803 e!121958))

(declare-fun res!144893 () Bool)

(assert (=> d!61803 (=> (not res!144893) (not e!121958))))

(declare-fun lt!270142 () tuple2!15062)

(assert (=> d!61803 (= res!144893 (= (buf!4574 (_2!8173 lt!270142)) (buf!4574 (_1!8170 lt!268754))))))

(declare-fun lt!270144 () tuple2!15062)

(assert (=> d!61803 (= lt!270142 (tuple2!15063 (_1!8173 lt!270144) (_2!8173 lt!270144)))))

(assert (=> d!61803 (= lt!270144 (readNBitsLSBFirstsLoop!0 (_1!8170 lt!268754) nBits!340 #b00000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!61803 (and (bvsge nBits!340 #b00000000000000000000000000000000) (bvsle nBits!340 #b00000000000000000000000001000000))))

(assert (=> d!61803 (= (readNBitsLSBFirst!0 (_1!8170 lt!268754) nBits!340) lt!270142)))

(declare-fun b!174950 () Bool)

(declare-fun lt!270141 () (_ BitVec 64))

(declare-fun lt!270143 () (_ BitVec 64))

(assert (=> b!174950 (= e!121958 (= (bitIndex!0 (size!4143 (buf!4574 (_2!8173 lt!270142))) (currentByte!8688 (_2!8173 lt!270142)) (currentBit!8683 (_2!8173 lt!270142))) (bvadd lt!270143 lt!270141)))))

(assert (=> b!174950 (or (not (= (bvand lt!270143 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!270141 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!270143 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!270143 lt!270141) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!174950 (= lt!270141 ((_ sign_extend 32) nBits!340))))

(assert (=> b!174950 (= lt!270143 (bitIndex!0 (size!4143 (buf!4574 (_1!8170 lt!268754))) (currentByte!8688 (_1!8170 lt!268754)) (currentBit!8683 (_1!8170 lt!268754))))))

(assert (= (and d!61803 res!144893) b!174950))

(declare-fun m!275005 () Bool)

(assert (=> d!61803 m!275005))

(declare-fun m!275007 () Bool)

(assert (=> b!174950 m!275007))

(declare-fun m!275009 () Bool)

(assert (=> b!174950 m!275009))

(assert (=> d!61437 d!61803))

(assert (=> b!174559 d!61751))

(declare-fun d!61805 () Bool)

(declare-fun e!121959 () Bool)

(assert (=> d!61805 e!121959))

(declare-fun res!144895 () Bool)

(assert (=> d!61805 (=> (not res!144895) (not e!121959))))

(declare-fun lt!270147 () (_ BitVec 64))

(declare-fun lt!270146 () (_ BitVec 64))

(declare-fun lt!270149 () (_ BitVec 64))

(assert (=> d!61805 (= res!144895 (= lt!270149 (bvsub lt!270147 lt!270146)))))

(assert (=> d!61805 (or (= (bvand lt!270147 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!270146 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!270147 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!270147 lt!270146) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!61805 (= lt!270146 (remainingBits!0 ((_ sign_extend 32) (size!4143 (buf!4574 (_2!8168 lt!269325)))) ((_ sign_extend 32) (currentByte!8688 (_2!8168 lt!269325))) ((_ sign_extend 32) (currentBit!8683 (_2!8168 lt!269325)))))))

(declare-fun lt!270145 () (_ BitVec 64))

(declare-fun lt!270150 () (_ BitVec 64))

(assert (=> d!61805 (= lt!270147 (bvmul lt!270145 lt!270150))))

(assert (=> d!61805 (or (= lt!270145 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!270150 (bvsdiv (bvmul lt!270145 lt!270150) lt!270145)))))

(assert (=> d!61805 (= lt!270150 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!61805 (= lt!270145 ((_ sign_extend 32) (size!4143 (buf!4574 (_2!8168 lt!269325)))))))

(assert (=> d!61805 (= lt!270149 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8688 (_2!8168 lt!269325))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8683 (_2!8168 lt!269325)))))))

(assert (=> d!61805 (invariant!0 (currentBit!8683 (_2!8168 lt!269325)) (currentByte!8688 (_2!8168 lt!269325)) (size!4143 (buf!4574 (_2!8168 lt!269325))))))

(assert (=> d!61805 (= (bitIndex!0 (size!4143 (buf!4574 (_2!8168 lt!269325))) (currentByte!8688 (_2!8168 lt!269325)) (currentBit!8683 (_2!8168 lt!269325))) lt!270149)))

(declare-fun b!174951 () Bool)

(declare-fun res!144894 () Bool)

(assert (=> b!174951 (=> (not res!144894) (not e!121959))))

(assert (=> b!174951 (= res!144894 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!270149))))

(declare-fun b!174952 () Bool)

(declare-fun lt!270148 () (_ BitVec 64))

(assert (=> b!174952 (= e!121959 (bvsle lt!270149 (bvmul lt!270148 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!174952 (or (= lt!270148 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!270148 #b0000000000000000000000000000000000000000000000000000000000001000) lt!270148)))))

(assert (=> b!174952 (= lt!270148 ((_ sign_extend 32) (size!4143 (buf!4574 (_2!8168 lt!269325)))))))

(assert (= (and d!61805 res!144895) b!174951))

(assert (= (and b!174951 res!144894) b!174952))

(declare-fun m!275011 () Bool)

(assert (=> d!61805 m!275011))

(assert (=> d!61805 m!274035))

(assert (=> b!174559 d!61805))

(declare-fun d!61807 () Bool)

(declare-fun e!121960 () Bool)

(assert (=> d!61807 e!121960))

(declare-fun res!144896 () Bool)

(assert (=> d!61807 (=> (not res!144896) (not e!121960))))

(declare-fun lt!270152 () (_ BitVec 64))

(declare-fun lt!270151 () BitStream!7394)

(assert (=> d!61807 (= res!144896 (= (bvadd lt!270152 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!4143 (buf!4574 lt!270151)) (currentByte!8688 lt!270151) (currentBit!8683 lt!270151))))))

(assert (=> d!61807 (or (not (= (bvand lt!270152 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!270152 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!270152 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!61807 (= lt!270152 (bitIndex!0 (size!4143 (buf!4574 (_1!8170 lt!269306))) (currentByte!8688 (_1!8170 lt!269306)) (currentBit!8683 (_1!8170 lt!269306))))))

(assert (=> d!61807 (= lt!270151 (_2!8168 (moveBitIndex!0 (_1!8170 lt!269306) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!61807 (moveBitIndexPrecond!0 (_1!8170 lt!269306) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!61807 (= (withMovedBitIndex!0 (_1!8170 lt!269306) #b0000000000000000000000000000000000000000000000000000000000000001) lt!270151)))

(declare-fun b!174953 () Bool)

(assert (=> b!174953 (= e!121960 (= (size!4143 (buf!4574 (_1!8170 lt!269306))) (size!4143 (buf!4574 lt!270151))))))

(assert (= (and d!61807 res!144896) b!174953))

(declare-fun m!275013 () Bool)

(assert (=> d!61807 m!275013))

(declare-fun m!275015 () Bool)

(assert (=> d!61807 m!275015))

(declare-fun m!275017 () Bool)

(assert (=> d!61807 m!275017))

(declare-fun m!275019 () Bool)

(assert (=> d!61807 m!275019))

(assert (=> b!174559 d!61807))

(declare-fun b!174966 () Bool)

(declare-fun e!121965 () Bool)

(declare-fun lt!270163 () tuple2!15064)

(declare-fun lt!270162 () tuple2!15052)

(assert (=> b!174966 (= e!121965 (= (bitIndex!0 (size!4143 (buf!4574 (_1!8174 lt!270163))) (currentByte!8688 (_1!8174 lt!270163)) (currentBit!8683 (_1!8174 lt!270163))) (bitIndex!0 (size!4143 (buf!4574 (_2!8168 lt!270162))) (currentByte!8688 (_2!8168 lt!270162)) (currentBit!8683 (_2!8168 lt!270162)))))))

(declare-fun b!174965 () Bool)

(declare-fun e!121966 () Bool)

(assert (=> b!174965 (= e!121966 e!121965)))

(declare-fun res!144906 () Bool)

(assert (=> b!174965 (=> (not res!144906) (not e!121965))))

(assert (=> b!174965 (= res!144906 (and (= (_2!8174 lt!270163) lt!269310) (= (_1!8174 lt!270163) (_2!8168 lt!270162))))))

(assert (=> b!174965 (= lt!270163 (readBitPure!0 (readerFrom!0 (_2!8168 lt!270162) (currentBit!8683 thiss!1187) (currentByte!8688 thiss!1187))))))

(declare-fun d!61809 () Bool)

(assert (=> d!61809 e!121966))

(declare-fun res!144907 () Bool)

(assert (=> d!61809 (=> (not res!144907) (not e!121966))))

(assert (=> d!61809 (= res!144907 (= (size!4143 (buf!4574 thiss!1187)) (size!4143 (buf!4574 (_2!8168 lt!270162)))))))

(declare-fun choose!16 (BitStream!7394 Bool) tuple2!15052)

(assert (=> d!61809 (= lt!270162 (choose!16 thiss!1187 lt!269310))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!61809 (validate_offset_bit!0 ((_ sign_extend 32) (size!4143 (buf!4574 thiss!1187))) ((_ sign_extend 32) (currentByte!8688 thiss!1187)) ((_ sign_extend 32) (currentBit!8683 thiss!1187)))))

(assert (=> d!61809 (= (appendBit!0 thiss!1187 lt!269310) lt!270162)))

(declare-fun b!174964 () Bool)

(declare-fun res!144908 () Bool)

(assert (=> b!174964 (=> (not res!144908) (not e!121966))))

(assert (=> b!174964 (= res!144908 (isPrefixOf!0 thiss!1187 (_2!8168 lt!270162)))))

(declare-fun b!174963 () Bool)

(declare-fun res!144905 () Bool)

(assert (=> b!174963 (=> (not res!144905) (not e!121966))))

(declare-fun lt!270164 () (_ BitVec 64))

(declare-fun lt!270161 () (_ BitVec 64))

(assert (=> b!174963 (= res!144905 (= (bitIndex!0 (size!4143 (buf!4574 (_2!8168 lt!270162))) (currentByte!8688 (_2!8168 lt!270162)) (currentBit!8683 (_2!8168 lt!270162))) (bvadd lt!270161 lt!270164)))))

(assert (=> b!174963 (or (not (= (bvand lt!270161 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!270164 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!270161 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!270161 lt!270164) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!174963 (= lt!270164 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!174963 (= lt!270161 (bitIndex!0 (size!4143 (buf!4574 thiss!1187)) (currentByte!8688 thiss!1187) (currentBit!8683 thiss!1187)))))

(assert (= (and d!61809 res!144907) b!174963))

(assert (= (and b!174963 res!144905) b!174964))

(assert (= (and b!174964 res!144908) b!174965))

(assert (= (and b!174965 res!144906) b!174966))

(declare-fun m!275021 () Bool)

(assert (=> b!174964 m!275021))

(declare-fun m!275023 () Bool)

(assert (=> b!174963 m!275023))

(assert (=> b!174963 m!273751))

(declare-fun m!275025 () Bool)

(assert (=> b!174965 m!275025))

(assert (=> b!174965 m!275025))

(declare-fun m!275027 () Bool)

(assert (=> b!174965 m!275027))

(declare-fun m!275029 () Bool)

(assert (=> d!61809 m!275029))

(declare-fun m!275031 () Bool)

(assert (=> d!61809 m!275031))

(declare-fun m!275033 () Bool)

(assert (=> b!174966 m!275033))

(assert (=> b!174966 m!275023))

(assert (=> b!174559 d!61809))

(declare-fun d!61811 () Bool)

(declare-fun lt!270181 () tuple2!15054)

(declare-fun lt!270178 () tuple2!15054)

(assert (=> d!61811 (and (= (_2!8169 lt!270181) (_2!8169 lt!270178)) (= (_1!8169 lt!270181) (_1!8169 lt!270178)))))

(declare-fun lt!270182 () Unit!12540)

(declare-fun lt!270180 () (_ BitVec 64))

(declare-fun lt!270179 () Bool)

(declare-fun lt!270177 () BitStream!7394)

(declare-fun choose!56 (BitStream!7394 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!15054 tuple2!15054 BitStream!7394 (_ BitVec 64) Bool BitStream!7394 (_ BitVec 64) tuple2!15054 tuple2!15054 BitStream!7394 (_ BitVec 64)) Unit!12540)

(assert (=> d!61811 (= lt!270182 (choose!56 (_1!8170 lt!269306) nBits!340 #b00000000000000000000000000000000 lt!269329 lt!270181 (tuple2!15055 (_1!8169 lt!270181) (_2!8169 lt!270181)) (_1!8169 lt!270181) (_2!8169 lt!270181) lt!270179 lt!270177 lt!270180 lt!270178 (tuple2!15055 (_1!8169 lt!270178) (_2!8169 lt!270178)) (_1!8169 lt!270178) (_2!8169 lt!270178)))))

(assert (=> d!61811 (= lt!270178 (readNBitsLSBFirstsLoopPure!0 lt!270177 nBits!340 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!270180))))

(assert (=> d!61811 (= lt!270180 (bvor lt!269329 (ite lt!270179 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) #b00000000000000000000000000000000)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!61811 (= lt!270177 (withMovedBitIndex!0 (_1!8170 lt!269306) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!61811 (= lt!270179 (_2!8174 (readBitPure!0 (_1!8170 lt!269306))))))

(assert (=> d!61811 (= lt!270181 (readNBitsLSBFirstsLoopPure!0 (_1!8170 lt!269306) nBits!340 #b00000000000000000000000000000000 lt!269329))))

(assert (=> d!61811 (= (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8170 lt!269306) nBits!340 #b00000000000000000000000000000000 lt!269329) lt!270182)))

(declare-fun bs!15390 () Bool)

(assert (= bs!15390 d!61811))

(declare-fun m!275035 () Bool)

(assert (=> bs!15390 m!275035))

(declare-fun m!275037 () Bool)

(assert (=> bs!15390 m!275037))

(assert (=> bs!15390 m!273989))

(assert (=> bs!15390 m!274005))

(assert (=> bs!15390 m!273999))

(assert (=> b!174559 d!61811))

(declare-fun d!61813 () Bool)

(declare-fun lt!270183 () tuple2!15062)

(assert (=> d!61813 (= lt!270183 (readNBitsLSBFirstsLoop!0 (withMovedBitIndex!0 (_1!8170 lt!269306) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!340 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvor lt!269329 e!121690)))))

(assert (=> d!61813 (= (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!8170 lt!269306) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!340 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvor lt!269329 e!121690)) (tuple2!15055 (_2!8173 lt!270183) (_1!8173 lt!270183)))))

(declare-fun bs!15391 () Bool)

(assert (= bs!15391 d!61813))

(assert (=> bs!15391 m!274005))

(declare-fun m!275039 () Bool)

(assert (=> bs!15391 m!275039))

(assert (=> b!174559 d!61813))

(declare-fun d!61815 () Bool)

(assert (=> d!61815 (validate_offset_bits!1 ((_ sign_extend 32) (size!4143 (buf!4574 (_2!8168 lt!269325)))) ((_ sign_extend 32) (currentByte!8688 thiss!1187)) ((_ sign_extend 32) (currentBit!8683 thiss!1187)) lt!269312)))

(declare-fun lt!270184 () Unit!12540)

(assert (=> d!61815 (= lt!270184 (choose!9 thiss!1187 (buf!4574 (_2!8168 lt!269325)) lt!269312 (BitStream!7395 (buf!4574 (_2!8168 lt!269325)) (currentByte!8688 thiss!1187) (currentBit!8683 thiss!1187))))))

(assert (=> d!61815 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1187 (buf!4574 (_2!8168 lt!269325)) lt!269312) lt!270184)))

(declare-fun bs!15392 () Bool)

(assert (= bs!15392 d!61815))

(assert (=> bs!15392 m!274021))

(declare-fun m!275041 () Bool)

(assert (=> bs!15392 m!275041))

(assert (=> b!174559 d!61815))

(declare-fun d!61817 () Bool)

(declare-fun lt!270185 () tuple2!15074)

(assert (=> d!61817 (= lt!270185 (readBit!0 lt!269300))))

(assert (=> d!61817 (= (readBitPure!0 lt!269300) (tuple2!15065 (_2!8182 lt!270185) (_1!8182 lt!270185)))))

(declare-fun bs!15393 () Bool)

(assert (= bs!15393 d!61817))

(declare-fun m!275043 () Bool)

(assert (=> bs!15393 m!275043))

(assert (=> b!174559 d!61817))

(declare-fun lt!270186 () tuple2!15062)

(declare-fun d!61819 () Bool)

(assert (=> d!61819 (= lt!270186 (readNBitsLSBFirstsLoop!0 (_1!8170 lt!269306) nBits!340 #b00000000000000000000000000000000 lt!269329))))

(assert (=> d!61819 (= (readNBitsLSBFirstsLoopPure!0 (_1!8170 lt!269306) nBits!340 #b00000000000000000000000000000000 lt!269329) (tuple2!15055 (_2!8173 lt!270186) (_1!8173 lt!270186)))))

(declare-fun bs!15394 () Bool)

(assert (= bs!15394 d!61819))

(declare-fun m!275045 () Bool)

(assert (=> bs!15394 m!275045))

(assert (=> b!174559 d!61819))

(assert (=> b!174559 d!61427))

(declare-fun d!61821 () Bool)

(assert (=> d!61821 (= (invariant!0 (currentBit!8683 lt!269300) (currentByte!8688 lt!269300) (size!4143 (buf!4574 (_2!8168 lt!269325)))) (and (bvsge (currentBit!8683 lt!269300) #b00000000000000000000000000000000) (bvslt (currentBit!8683 lt!269300) #b00000000000000000000000000001000) (bvsge (currentByte!8688 lt!269300) #b00000000000000000000000000000000) (or (bvslt (currentByte!8688 lt!269300) (size!4143 (buf!4574 (_2!8168 lt!269325)))) (and (= (currentBit!8683 lt!269300) #b00000000000000000000000000000000) (= (currentByte!8688 lt!269300) (size!4143 (buf!4574 (_2!8168 lt!269325))))))))))

(assert (=> b!174559 d!61821))

(declare-fun d!61823 () Bool)

(assert (=> d!61823 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4143 (buf!4574 (_2!8168 lt!269325)))) ((_ sign_extend 32) (currentByte!8688 (_2!8168 lt!269291))) ((_ sign_extend 32) (currentBit!8683 (_2!8168 lt!269291))) lt!269295) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4143 (buf!4574 (_2!8168 lt!269325)))) ((_ sign_extend 32) (currentByte!8688 (_2!8168 lt!269291))) ((_ sign_extend 32) (currentBit!8683 (_2!8168 lt!269291)))) lt!269295))))

(declare-fun bs!15395 () Bool)

(assert (= bs!15395 d!61823))

(declare-fun m!275047 () Bool)

(assert (=> bs!15395 m!275047))

(assert (=> b!174559 d!61823))

(declare-fun d!61825 () Bool)

(declare-fun e!121967 () Bool)

(assert (=> d!61825 e!121967))

(declare-fun res!144909 () Bool)

(assert (=> d!61825 (=> (not res!144909) (not e!121967))))

(declare-fun lt!270187 () BitStream!7394)

(declare-fun lt!270188 () (_ BitVec 64))

(assert (=> d!61825 (= res!144909 (= (bvadd lt!270188 (bvsub (bitIndex!0 (size!4143 (buf!4574 thiss!1187)) (currentByte!8688 thiss!1187) (currentBit!8683 thiss!1187)) (bitIndex!0 (size!4143 (buf!4574 (_2!8168 lt!269325))) (currentByte!8688 (_2!8168 lt!269325)) (currentBit!8683 (_2!8168 lt!269325))))) (bitIndex!0 (size!4143 (buf!4574 lt!270187)) (currentByte!8688 lt!270187) (currentBit!8683 lt!270187))))))

(assert (=> d!61825 (or (not (= (bvand lt!270188 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bitIndex!0 (size!4143 (buf!4574 thiss!1187)) (currentByte!8688 thiss!1187) (currentBit!8683 thiss!1187)) (bitIndex!0 (size!4143 (buf!4574 (_2!8168 lt!269325))) (currentByte!8688 (_2!8168 lt!269325)) (currentBit!8683 (_2!8168 lt!269325)))) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!270188 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!270188 (bvsub (bitIndex!0 (size!4143 (buf!4574 thiss!1187)) (currentByte!8688 thiss!1187) (currentBit!8683 thiss!1187)) (bitIndex!0 (size!4143 (buf!4574 (_2!8168 lt!269325))) (currentByte!8688 (_2!8168 lt!269325)) (currentBit!8683 (_2!8168 lt!269325))))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!61825 (= lt!270188 (bitIndex!0 (size!4143 (buf!4574 (_2!8170 lt!269306))) (currentByte!8688 (_2!8170 lt!269306)) (currentBit!8683 (_2!8170 lt!269306))))))

(assert (=> d!61825 (= lt!270187 (_2!8168 (moveBitIndex!0 (_2!8170 lt!269306) (bvsub (bitIndex!0 (size!4143 (buf!4574 thiss!1187)) (currentByte!8688 thiss!1187) (currentBit!8683 thiss!1187)) (bitIndex!0 (size!4143 (buf!4574 (_2!8168 lt!269325))) (currentByte!8688 (_2!8168 lt!269325)) (currentBit!8683 (_2!8168 lt!269325)))))))))

(assert (=> d!61825 (moveBitIndexPrecond!0 (_2!8170 lt!269306) (bvsub (bitIndex!0 (size!4143 (buf!4574 thiss!1187)) (currentByte!8688 thiss!1187) (currentBit!8683 thiss!1187)) (bitIndex!0 (size!4143 (buf!4574 (_2!8168 lt!269325))) (currentByte!8688 (_2!8168 lt!269325)) (currentBit!8683 (_2!8168 lt!269325)))))))

(assert (=> d!61825 (= (withMovedBitIndex!0 (_2!8170 lt!269306) (bvsub (bitIndex!0 (size!4143 (buf!4574 thiss!1187)) (currentByte!8688 thiss!1187) (currentBit!8683 thiss!1187)) (bitIndex!0 (size!4143 (buf!4574 (_2!8168 lt!269325))) (currentByte!8688 (_2!8168 lt!269325)) (currentBit!8683 (_2!8168 lt!269325))))) lt!270187)))

(declare-fun b!174967 () Bool)

(assert (=> b!174967 (= e!121967 (= (size!4143 (buf!4574 (_2!8170 lt!269306))) (size!4143 (buf!4574 lt!270187))))))

(assert (= (and d!61825 res!144909) b!174967))

(declare-fun m!275049 () Bool)

(assert (=> d!61825 m!275049))

(declare-fun m!275051 () Bool)

(assert (=> d!61825 m!275051))

(declare-fun m!275053 () Bool)

(assert (=> d!61825 m!275053))

(declare-fun m!275055 () Bool)

(assert (=> d!61825 m!275055))

(assert (=> b!174559 d!61825))

(declare-fun b!174968 () Bool)

(declare-fun e!121969 () Bool)

(declare-fun lt!270197 () tuple2!15064)

(declare-fun lt!270223 () tuple2!15052)

(assert (=> b!174968 (= e!121969 (= (bitIndex!0 (size!4143 (buf!4574 (_1!8174 lt!270197))) (currentByte!8688 (_1!8174 lt!270197)) (currentBit!8683 (_1!8174 lt!270197))) (bitIndex!0 (size!4143 (buf!4574 (_2!8168 lt!270223))) (currentByte!8688 (_2!8168 lt!270223)) (currentBit!8683 (_2!8168 lt!270223)))))))

(declare-fun b!174969 () Bool)

(declare-fun res!144910 () Bool)

(assert (=> b!174969 (= res!144910 (isPrefixOf!0 (_2!8168 lt!269291) (_2!8168 lt!270223)))))

(declare-fun e!121972 () Bool)

(assert (=> b!174969 (=> (not res!144910) (not e!121972))))

(declare-fun b!174970 () Bool)

(declare-fun e!121973 () Bool)

(declare-fun lt!270220 () (_ BitVec 64))

(assert (=> b!174970 (= e!121973 (validate_offset_bits!1 ((_ sign_extend 32) (size!4143 (buf!4574 (_2!8168 lt!269291)))) ((_ sign_extend 32) (currentByte!8688 (_2!8168 lt!269291))) ((_ sign_extend 32) (currentBit!8683 (_2!8168 lt!269291))) lt!270220))))

(declare-fun b!174971 () Bool)

(declare-fun res!144921 () Bool)

(assert (=> b!174971 (= res!144921 (= (bitIndex!0 (size!4143 (buf!4574 (_2!8168 lt!270223))) (currentByte!8688 (_2!8168 lt!270223)) (currentBit!8683 (_2!8168 lt!270223))) (bvadd (bitIndex!0 (size!4143 (buf!4574 (_2!8168 lt!269291))) (currentByte!8688 (_2!8168 lt!269291)) (currentBit!8683 (_2!8168 lt!269291))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!174971 (=> (not res!144921) (not e!121972))))

(declare-fun b!174972 () Bool)

(declare-fun res!144916 () Bool)

(declare-fun e!121971 () Bool)

(assert (=> b!174972 (=> (not res!144916) (not e!121971))))

(declare-fun lt!270228 () tuple2!15052)

(assert (=> b!174972 (= res!144916 (= (size!4143 (buf!4574 (_2!8168 lt!269291))) (size!4143 (buf!4574 (_2!8168 lt!270228)))))))

(declare-fun b!174973 () Bool)

(declare-fun e!121968 () (_ BitVec 64))

(assert (=> b!174973 (= e!121968 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!174974 () Bool)

(declare-fun e!121976 () Bool)

(assert (=> b!174974 (= e!121971 e!121976)))

(declare-fun res!144914 () Bool)

(assert (=> b!174974 (=> (not res!144914) (not e!121976))))

(declare-fun lt!270202 () tuple2!15054)

(assert (=> b!174974 (= res!144914 (= (_2!8169 lt!270202) (bvand v!186 (onesLSBLong!0 nBits!340))))))

(declare-fun lt!270238 () tuple2!15056)

(assert (=> b!174974 (= lt!270202 (readNBitsLSBFirstsLoopPure!0 (_1!8170 lt!270238) nBits!340 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvand v!186 (onesLSBLong!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))))

(declare-fun lt!270240 () Unit!12540)

(declare-fun lt!270212 () Unit!12540)

(assert (=> b!174974 (= lt!270240 lt!270212)))

(assert (=> b!174974 (validate_offset_bits!1 ((_ sign_extend 32) (size!4143 (buf!4574 (_2!8168 lt!270228)))) ((_ sign_extend 32) (currentByte!8688 (_2!8168 lt!269291))) ((_ sign_extend 32) (currentBit!8683 (_2!8168 lt!269291))) lt!270220)))

(assert (=> b!174974 (= lt!270212 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8168 lt!269291) (buf!4574 (_2!8168 lt!270228)) lt!270220))))

(assert (=> b!174974 e!121973))

(declare-fun res!144920 () Bool)

(assert (=> b!174974 (=> (not res!144920) (not e!121973))))

(assert (=> b!174974 (= res!144920 (and (= (size!4143 (buf!4574 (_2!8168 lt!269291))) (size!4143 (buf!4574 (_2!8168 lt!270228)))) (bvsge lt!270220 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!174974 (= lt!270220 ((_ sign_extend 32) (bvsub nBits!340 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!174974 (or (= (bvand nBits!340 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b10000000000000000000000000000000)) (= (bvand nBits!340 #b10000000000000000000000000000000) (bvand (bvsub nBits!340 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) #b10000000000000000000000000000000)))))

(assert (=> b!174974 (= lt!270238 (reader!0 (_2!8168 lt!269291) (_2!8168 lt!270228)))))

(declare-fun d!61827 () Bool)

(assert (=> d!61827 e!121971))

(declare-fun res!144917 () Bool)

(assert (=> d!61827 (=> (not res!144917) (not e!121971))))

(assert (=> d!61827 (= res!144917 (invariant!0 (currentBit!8683 (_2!8168 lt!270228)) (currentByte!8688 (_2!8168 lt!270228)) (size!4143 (buf!4574 (_2!8168 lt!270228)))))))

(declare-fun e!121975 () tuple2!15052)

(assert (=> d!61827 (= lt!270228 e!121975)))

(declare-fun c!9220 () Bool)

(assert (=> d!61827 (= c!9220 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) nBits!340))))

(assert (=> d!61827 (and (bvsge nBits!340 #b00000000000000000000000000000000) (bvsle nBits!340 #b00000000000000000000000001000000))))

(assert (=> d!61827 (= (appendBitsLSBFirstLoopTR!0 (_2!8168 lt!269291) v!186 nBits!340 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!270228)))

(declare-fun b!174975 () Bool)

(declare-fun e!121970 () Bool)

(declare-fun lt!270235 () tuple2!15064)

(declare-fun lt!270222 () tuple2!15064)

(assert (=> b!174975 (= e!121970 (= (_2!8174 lt!270235) (_2!8174 lt!270222)))))

(declare-fun b!174976 () Bool)

(assert (=> b!174976 (= e!121968 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!174977 () Bool)

(declare-fun res!144913 () Bool)

(assert (=> b!174977 (=> (not res!144913) (not e!121971))))

(declare-fun lt!270218 () (_ BitVec 64))

(declare-fun lt!270195 () (_ BitVec 64))

(assert (=> b!174977 (= res!144913 (= (bitIndex!0 (size!4143 (buf!4574 (_2!8168 lt!270228))) (currentByte!8688 (_2!8168 lt!270228)) (currentBit!8683 (_2!8168 lt!270228))) (bvsub lt!270195 lt!270218)))))

(assert (=> b!174977 (or (= (bvand lt!270195 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!270218 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!270195 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!270195 lt!270218) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!174977 (= lt!270218 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!270194 () (_ BitVec 64))

(declare-fun lt!270233 () (_ BitVec 64))

(assert (=> b!174977 (= lt!270195 (bvadd lt!270194 lt!270233))))

(assert (=> b!174977 (or (not (= (bvand lt!270194 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!270233 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!270194 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!270194 lt!270233) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!174977 (= lt!270233 ((_ sign_extend 32) nBits!340))))

(assert (=> b!174977 (= lt!270194 (bitIndex!0 (size!4143 (buf!4574 (_2!8168 lt!269291))) (currentByte!8688 (_2!8168 lt!269291)) (currentBit!8683 (_2!8168 lt!269291))))))

(declare-fun b!174978 () Bool)

(declare-fun res!144912 () Bool)

(assert (=> b!174978 (=> (not res!144912) (not e!121971))))

(assert (=> b!174978 (= res!144912 (isPrefixOf!0 (_2!8168 lt!269291) (_2!8168 lt!270228)))))

(declare-fun b!174979 () Bool)

(declare-fun Unit!12607 () Unit!12540)

(assert (=> b!174979 (= e!121975 (tuple2!15053 Unit!12607 (_2!8168 lt!269291)))))

(declare-fun lt!270237 () Unit!12540)

(assert (=> b!174979 (= lt!270237 (lemmaIsPrefixRefl!0 (_2!8168 lt!269291)))))

(declare-fun call!2909 () Bool)

(assert (=> b!174979 call!2909))

(declare-fun lt!270193 () Unit!12540)

(assert (=> b!174979 (= lt!270193 lt!270237)))

(declare-fun lt!270230 () tuple2!15052)

(declare-fun bm!2906 () Bool)

(assert (=> bm!2906 (= call!2909 (isPrefixOf!0 (_2!8168 lt!269291) (ite c!9220 (_2!8168 lt!269291) (_2!8168 lt!270230))))))

(declare-fun b!174980 () Bool)

(declare-fun e!121974 () Bool)

(declare-fun lt!270243 () tuple2!15054)

(declare-fun lt!270192 () tuple2!15056)

(assert (=> b!174980 (= e!121974 (= (_1!8169 lt!270243) (_2!8170 lt!270192)))))

(declare-fun b!174981 () Bool)

(assert (=> b!174981 (= e!121976 (= (_1!8169 lt!270202) (_2!8170 lt!270238)))))

(declare-fun b!174982 () Bool)

(assert (=> b!174982 (= lt!270197 (readBitPure!0 (readerFrom!0 (_2!8168 lt!270223) (currentBit!8683 (_2!8168 lt!269291)) (currentByte!8688 (_2!8168 lt!269291)))))))

(declare-fun lt!270215 () Bool)

(declare-fun res!144915 () Bool)

(assert (=> b!174982 (= res!144915 (and (= (_2!8174 lt!270197) lt!270215) (= (_1!8174 lt!270197) (_2!8168 lt!270223))))))

(assert (=> b!174982 (=> (not res!144915) (not e!121969))))

(assert (=> b!174982 (= e!121972 e!121969)))

(declare-fun b!174983 () Bool)

(assert (=> b!174983 (= e!121975 (tuple2!15053 (_1!8168 lt!270230) (_2!8168 lt!270230)))))

(assert (=> b!174983 (= lt!270215 (not (= (bvand v!186 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!174983 (= lt!270223 (appendBit!0 (_2!8168 lt!269291) lt!270215))))

(declare-fun res!144919 () Bool)

(assert (=> b!174983 (= res!144919 (= (size!4143 (buf!4574 (_2!8168 lt!269291))) (size!4143 (buf!4574 (_2!8168 lt!270223)))))))

(assert (=> b!174983 (=> (not res!144919) (not e!121972))))

(assert (=> b!174983 e!121972))

(declare-fun lt!270196 () tuple2!15052)

(assert (=> b!174983 (= lt!270196 lt!270223)))

(assert (=> b!174983 (= lt!270230 (appendBitsLSBFirstLoopTR!0 (_2!8168 lt!270196) v!186 nBits!340 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(declare-fun lt!270203 () Unit!12540)

(assert (=> b!174983 (= lt!270203 (lemmaIsPrefixTransitive!0 (_2!8168 lt!269291) (_2!8168 lt!270196) (_2!8168 lt!270230)))))

(assert (=> b!174983 call!2909))

(declare-fun lt!270208 () Unit!12540)

(assert (=> b!174983 (= lt!270208 lt!270203)))

(assert (=> b!174983 (invariant!0 (currentBit!8683 (_2!8168 lt!269291)) (currentByte!8688 (_2!8168 lt!269291)) (size!4143 (buf!4574 (_2!8168 lt!270196))))))

(declare-fun lt!270205 () BitStream!7394)

(assert (=> b!174983 (= lt!270205 (BitStream!7395 (buf!4574 (_2!8168 lt!270196)) (currentByte!8688 (_2!8168 lt!269291)) (currentBit!8683 (_2!8168 lt!269291))))))

(assert (=> b!174983 (invariant!0 (currentBit!8683 lt!270205) (currentByte!8688 lt!270205) (size!4143 (buf!4574 (_2!8168 lt!270230))))))

(declare-fun lt!270221 () BitStream!7394)

(assert (=> b!174983 (= lt!270221 (BitStream!7395 (buf!4574 (_2!8168 lt!270230)) (currentByte!8688 lt!270205) (currentBit!8683 lt!270205)))))

(assert (=> b!174983 (= lt!270235 (readBitPure!0 lt!270205))))

(assert (=> b!174983 (= lt!270222 (readBitPure!0 lt!270221))))

(declare-fun lt!270236 () Unit!12540)

(assert (=> b!174983 (= lt!270236 (readBitPrefixLemma!0 lt!270205 (_2!8168 lt!270230)))))

(declare-fun res!144911 () Bool)

(assert (=> b!174983 (= res!144911 (= (bitIndex!0 (size!4143 (buf!4574 (_1!8174 lt!270235))) (currentByte!8688 (_1!8174 lt!270235)) (currentBit!8683 (_1!8174 lt!270235))) (bitIndex!0 (size!4143 (buf!4574 (_1!8174 lt!270222))) (currentByte!8688 (_1!8174 lt!270222)) (currentBit!8683 (_1!8174 lt!270222)))))))

(assert (=> b!174983 (=> (not res!144911) (not e!121970))))

(assert (=> b!174983 e!121970))

(declare-fun lt!270241 () Unit!12540)

(assert (=> b!174983 (= lt!270241 lt!270236)))

(declare-fun lt!270211 () tuple2!15056)

(assert (=> b!174983 (= lt!270211 (reader!0 (_2!8168 lt!269291) (_2!8168 lt!270230)))))

(declare-fun lt!270204 () tuple2!15056)

(assert (=> b!174983 (= lt!270204 (reader!0 (_2!8168 lt!270196) (_2!8168 lt!270230)))))

(declare-fun lt!270189 () tuple2!15064)

(assert (=> b!174983 (= lt!270189 (readBitPure!0 (_1!8170 lt!270211)))))

(assert (=> b!174983 (= (_2!8174 lt!270189) lt!270215)))

(declare-fun lt!270232 () Unit!12540)

(declare-fun Unit!12608 () Unit!12540)

(assert (=> b!174983 (= lt!270232 Unit!12608)))

(declare-fun lt!270234 () (_ BitVec 64))

(assert (=> b!174983 (= lt!270234 (bvand v!186 (onesLSBLong!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun lt!270229 () (_ BitVec 64))

(assert (=> b!174983 (= lt!270229 ((_ sign_extend 32) (bvsub nBits!340 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun lt!270199 () Unit!12540)

(assert (=> b!174983 (= lt!270199 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8168 lt!269291) (buf!4574 (_2!8168 lt!270230)) lt!270229))))

(assert (=> b!174983 (validate_offset_bits!1 ((_ sign_extend 32) (size!4143 (buf!4574 (_2!8168 lt!270230)))) ((_ sign_extend 32) (currentByte!8688 (_2!8168 lt!269291))) ((_ sign_extend 32) (currentBit!8683 (_2!8168 lt!269291))) lt!270229)))

(declare-fun lt!270207 () Unit!12540)

(assert (=> b!174983 (= lt!270207 lt!270199)))

(declare-fun lt!270216 () tuple2!15054)

(assert (=> b!174983 (= lt!270216 (readNBitsLSBFirstsLoopPure!0 (_1!8170 lt!270211) nBits!340 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!270234))))

(declare-fun lt!270200 () (_ BitVec 64))

(assert (=> b!174983 (= lt!270200 ((_ sign_extend 32) (bvsub (bvsub nBits!340 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))))

(declare-fun lt!270219 () Unit!12540)

(assert (=> b!174983 (= lt!270219 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8168 lt!270196) (buf!4574 (_2!8168 lt!270230)) lt!270200))))

(assert (=> b!174983 (validate_offset_bits!1 ((_ sign_extend 32) (size!4143 (buf!4574 (_2!8168 lt!270230)))) ((_ sign_extend 32) (currentByte!8688 (_2!8168 lt!270196))) ((_ sign_extend 32) (currentBit!8683 (_2!8168 lt!270196))) lt!270200)))

(declare-fun lt!270244 () Unit!12540)

(assert (=> b!174983 (= lt!270244 lt!270219)))

(declare-fun lt!270225 () tuple2!15054)

(assert (=> b!174983 (= lt!270225 (readNBitsLSBFirstsLoopPure!0 (_1!8170 lt!270204) nBits!340 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvor lt!270234 (ite (_2!8174 lt!270189) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!270214 () tuple2!15054)

(assert (=> b!174983 (= lt!270214 (readNBitsLSBFirstsLoopPure!0 (_1!8170 lt!270211) nBits!340 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!270234))))

(declare-fun c!9219 () Bool)

(assert (=> b!174983 (= c!9219 (_2!8174 (readBitPure!0 (_1!8170 lt!270211))))))

(declare-fun lt!270226 () tuple2!15054)

(assert (=> b!174983 (= lt!270226 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!8170 lt!270211) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!340 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvor lt!270234 e!121968)))))

(declare-fun lt!270209 () Unit!12540)

(assert (=> b!174983 (= lt!270209 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8170 lt!270211) nBits!340 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!270234))))

(assert (=> b!174983 (and (= (_2!8169 lt!270214) (_2!8169 lt!270226)) (= (_1!8169 lt!270214) (_1!8169 lt!270226)))))

(declare-fun lt!270198 () Unit!12540)

(assert (=> b!174983 (= lt!270198 lt!270209)))

(assert (=> b!174983 (= (_1!8170 lt!270211) (withMovedBitIndex!0 (_2!8170 lt!270211) (bvsub (bitIndex!0 (size!4143 (buf!4574 (_2!8168 lt!269291))) (currentByte!8688 (_2!8168 lt!269291)) (currentBit!8683 (_2!8168 lt!269291))) (bitIndex!0 (size!4143 (buf!4574 (_2!8168 lt!270230))) (currentByte!8688 (_2!8168 lt!270230)) (currentBit!8683 (_2!8168 lt!270230))))))))

(declare-fun lt!270210 () Unit!12540)

(declare-fun Unit!12609 () Unit!12540)

(assert (=> b!174983 (= lt!270210 Unit!12609)))

(assert (=> b!174983 (= (_1!8170 lt!270204) (withMovedBitIndex!0 (_2!8170 lt!270204) (bvsub (bitIndex!0 (size!4143 (buf!4574 (_2!8168 lt!270196))) (currentByte!8688 (_2!8168 lt!270196)) (currentBit!8683 (_2!8168 lt!270196))) (bitIndex!0 (size!4143 (buf!4574 (_2!8168 lt!270230))) (currentByte!8688 (_2!8168 lt!270230)) (currentBit!8683 (_2!8168 lt!270230))))))))

(declare-fun lt!270231 () Unit!12540)

(declare-fun Unit!12610 () Unit!12540)

(assert (=> b!174983 (= lt!270231 Unit!12610)))

(assert (=> b!174983 (= (bitIndex!0 (size!4143 (buf!4574 (_2!8168 lt!269291))) (currentByte!8688 (_2!8168 lt!269291)) (currentBit!8683 (_2!8168 lt!269291))) (bvsub (bitIndex!0 (size!4143 (buf!4574 (_2!8168 lt!270196))) (currentByte!8688 (_2!8168 lt!270196)) (currentBit!8683 (_2!8168 lt!270196))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!270213 () Unit!12540)

(declare-fun Unit!12611 () Unit!12540)

(assert (=> b!174983 (= lt!270213 Unit!12611)))

(assert (=> b!174983 (= (_2!8169 lt!270216) (_2!8169 lt!270225))))

(declare-fun lt!270242 () Unit!12540)

(declare-fun Unit!12612 () Unit!12540)

(assert (=> b!174983 (= lt!270242 Unit!12612)))

(assert (=> b!174983 (invariant!0 (currentBit!8683 (_2!8168 lt!270230)) (currentByte!8688 (_2!8168 lt!270230)) (size!4143 (buf!4574 (_2!8168 lt!270230))))))

(declare-fun lt!270206 () Unit!12540)

(declare-fun Unit!12613 () Unit!12540)

(assert (=> b!174983 (= lt!270206 Unit!12613)))

(assert (=> b!174983 (= (size!4143 (buf!4574 (_2!8168 lt!269291))) (size!4143 (buf!4574 (_2!8168 lt!270230))))))

(declare-fun lt!270190 () Unit!12540)

(declare-fun Unit!12614 () Unit!12540)

(assert (=> b!174983 (= lt!270190 Unit!12614)))

(assert (=> b!174983 (= (bitIndex!0 (size!4143 (buf!4574 (_2!8168 lt!270230))) (currentByte!8688 (_2!8168 lt!270230)) (currentBit!8683 (_2!8168 lt!270230))) (bvsub (bvadd (bitIndex!0 (size!4143 (buf!4574 (_2!8168 lt!269291))) (currentByte!8688 (_2!8168 lt!269291)) (currentBit!8683 (_2!8168 lt!269291))) ((_ sign_extend 32) nBits!340)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun lt!270224 () Unit!12540)

(declare-fun Unit!12615 () Unit!12540)

(assert (=> b!174983 (= lt!270224 Unit!12615)))

(declare-fun lt!270201 () Unit!12540)

(declare-fun Unit!12616 () Unit!12540)

(assert (=> b!174983 (= lt!270201 Unit!12616)))

(assert (=> b!174983 (= lt!270192 (reader!0 (_2!8168 lt!269291) (_2!8168 lt!270230)))))

(declare-fun lt!270217 () (_ BitVec 64))

(assert (=> b!174983 (= lt!270217 ((_ sign_extend 32) (bvsub nBits!340 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun lt!270227 () Unit!12540)

(assert (=> b!174983 (= lt!270227 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8168 lt!269291) (buf!4574 (_2!8168 lt!270230)) lt!270217))))

(assert (=> b!174983 (validate_offset_bits!1 ((_ sign_extend 32) (size!4143 (buf!4574 (_2!8168 lt!270230)))) ((_ sign_extend 32) (currentByte!8688 (_2!8168 lt!269291))) ((_ sign_extend 32) (currentBit!8683 (_2!8168 lt!269291))) lt!270217)))

(declare-fun lt!270191 () Unit!12540)

(assert (=> b!174983 (= lt!270191 lt!270227)))

(assert (=> b!174983 (= lt!270243 (readNBitsLSBFirstsLoopPure!0 (_1!8170 lt!270192) nBits!340 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvand v!186 (onesLSBLong!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))))

(declare-fun res!144918 () Bool)

(assert (=> b!174983 (= res!144918 (= (_2!8169 lt!270243) (bvand v!186 (onesLSBLong!0 nBits!340))))))

(assert (=> b!174983 (=> (not res!144918) (not e!121974))))

(assert (=> b!174983 e!121974))

(declare-fun lt!270239 () Unit!12540)

(declare-fun Unit!12617 () Unit!12540)

(assert (=> b!174983 (= lt!270239 Unit!12617)))

(assert (= (and d!61827 c!9220) b!174979))

(assert (= (and d!61827 (not c!9220)) b!174983))

(assert (= (and b!174983 res!144919) b!174971))

(assert (= (and b!174971 res!144921) b!174969))

(assert (= (and b!174969 res!144910) b!174982))

(assert (= (and b!174982 res!144915) b!174968))

(assert (= (and b!174983 res!144911) b!174975))

(assert (= (and b!174983 c!9219) b!174976))

(assert (= (and b!174983 (not c!9219)) b!174973))

(assert (= (and b!174983 res!144918) b!174980))

(assert (= (or b!174979 b!174983) bm!2906))

(assert (= (and d!61827 res!144917) b!174972))

(assert (= (and b!174972 res!144916) b!174977))

(assert (= (and b!174977 res!144913) b!174978))

(assert (= (and b!174978 res!144912) b!174974))

(assert (= (and b!174974 res!144920) b!174970))

(assert (= (and b!174974 res!144914) b!174981))

(declare-fun m!275057 () Bool)

(assert (=> b!174968 m!275057))

(declare-fun m!275059 () Bool)

(assert (=> b!174968 m!275059))

(declare-fun m!275061 () Bool)

(assert (=> b!174979 m!275061))

(declare-fun m!275063 () Bool)

(assert (=> b!174978 m!275063))

(declare-fun m!275065 () Bool)

(assert (=> b!174969 m!275065))

(declare-fun m!275067 () Bool)

(assert (=> b!174977 m!275067))

(assert (=> b!174977 m!274039))

(declare-fun m!275069 () Bool)

(assert (=> bm!2906 m!275069))

(declare-fun m!275071 () Bool)

(assert (=> b!174982 m!275071))

(assert (=> b!174982 m!275071))

(declare-fun m!275073 () Bool)

(assert (=> b!174982 m!275073))

(declare-fun m!275075 () Bool)

(assert (=> b!174970 m!275075))

(declare-fun m!275077 () Bool)

(assert (=> b!174983 m!275077))

(assert (=> b!174983 m!274039))

(declare-fun m!275079 () Bool)

(assert (=> b!174983 m!275079))

(declare-fun m!275081 () Bool)

(assert (=> b!174983 m!275081))

(declare-fun m!275083 () Bool)

(assert (=> b!174983 m!275083))

(declare-fun m!275085 () Bool)

(assert (=> b!174983 m!275085))

(declare-fun m!275087 () Bool)

(assert (=> b!174983 m!275087))

(declare-fun m!275089 () Bool)

(assert (=> b!174983 m!275089))

(declare-fun m!275091 () Bool)

(assert (=> b!174983 m!275091))

(declare-fun m!275093 () Bool)

(assert (=> b!174983 m!275093))

(declare-fun m!275095 () Bool)

(assert (=> b!174983 m!275095))

(declare-fun m!275097 () Bool)

(assert (=> b!174983 m!275097))

(declare-fun m!275099 () Bool)

(assert (=> b!174983 m!275099))

(declare-fun m!275101 () Bool)

(assert (=> b!174983 m!275101))

(declare-fun m!275103 () Bool)

(assert (=> b!174983 m!275103))

(declare-fun m!275105 () Bool)

(assert (=> b!174983 m!275105))

(declare-fun m!275107 () Bool)

(assert (=> b!174983 m!275107))

(declare-fun m!275109 () Bool)

(assert (=> b!174983 m!275109))

(declare-fun m!275111 () Bool)

(assert (=> b!174983 m!275111))

(declare-fun m!275113 () Bool)

(assert (=> b!174983 m!275113))

(declare-fun m!275115 () Bool)

(assert (=> b!174983 m!275115))

(declare-fun m!275117 () Bool)

(assert (=> b!174983 m!275117))

(declare-fun m!275119 () Bool)

(assert (=> b!174983 m!275119))

(declare-fun m!275121 () Bool)

(assert (=> b!174983 m!275121))

(declare-fun m!275123 () Bool)

(assert (=> b!174983 m!275123))

(declare-fun m!275125 () Bool)

(assert (=> b!174983 m!275125))

(declare-fun m!275127 () Bool)

(assert (=> b!174983 m!275127))

(declare-fun m!275129 () Bool)

(assert (=> b!174983 m!275129))

(assert (=> b!174983 m!275097))

(assert (=> b!174983 m!273737))

(declare-fun m!275131 () Bool)

(assert (=> b!174983 m!275131))

(declare-fun m!275133 () Bool)

(assert (=> b!174983 m!275133))

(declare-fun m!275135 () Bool)

(assert (=> b!174983 m!275135))

(declare-fun m!275137 () Bool)

(assert (=> b!174983 m!275137))

(declare-fun m!275139 () Bool)

(assert (=> d!61827 m!275139))

(assert (=> b!174971 m!275059))

(assert (=> b!174971 m!274039))

(assert (=> b!174974 m!275093))

(declare-fun m!275141 () Bool)

(assert (=> b!174974 m!275141))

(declare-fun m!275143 () Bool)

(assert (=> b!174974 m!275143))

(assert (=> b!174974 m!273737))

(declare-fun m!275145 () Bool)

(assert (=> b!174974 m!275145))

(declare-fun m!275147 () Bool)

(assert (=> b!174974 m!275147))

(assert (=> b!174559 d!61827))

(declare-fun d!61829 () Bool)

(declare-fun e!121977 () Bool)

(assert (=> d!61829 e!121977))

(declare-fun res!144923 () Bool)

(assert (=> d!61829 (=> (not res!144923) (not e!121977))))

(declare-fun lt!270246 () (_ BitVec 64))

(declare-fun lt!270249 () (_ BitVec 64))

(declare-fun lt!270247 () (_ BitVec 64))

(assert (=> d!61829 (= res!144923 (= lt!270249 (bvsub lt!270247 lt!270246)))))

(assert (=> d!61829 (or (= (bvand lt!270247 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!270246 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!270247 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!270247 lt!270246) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!61829 (= lt!270246 (remainingBits!0 ((_ sign_extend 32) (size!4143 (buf!4574 (_1!8174 lt!269317)))) ((_ sign_extend 32) (currentByte!8688 (_1!8174 lt!269317))) ((_ sign_extend 32) (currentBit!8683 (_1!8174 lt!269317)))))))

(declare-fun lt!270245 () (_ BitVec 64))

(declare-fun lt!270250 () (_ BitVec 64))

(assert (=> d!61829 (= lt!270247 (bvmul lt!270245 lt!270250))))

(assert (=> d!61829 (or (= lt!270245 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!270250 (bvsdiv (bvmul lt!270245 lt!270250) lt!270245)))))

(assert (=> d!61829 (= lt!270250 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!61829 (= lt!270245 ((_ sign_extend 32) (size!4143 (buf!4574 (_1!8174 lt!269317)))))))

(assert (=> d!61829 (= lt!270249 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8688 (_1!8174 lt!269317))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8683 (_1!8174 lt!269317)))))))

(assert (=> d!61829 (invariant!0 (currentBit!8683 (_1!8174 lt!269317)) (currentByte!8688 (_1!8174 lt!269317)) (size!4143 (buf!4574 (_1!8174 lt!269317))))))

(assert (=> d!61829 (= (bitIndex!0 (size!4143 (buf!4574 (_1!8174 lt!269317))) (currentByte!8688 (_1!8174 lt!269317)) (currentBit!8683 (_1!8174 lt!269317))) lt!270249)))

(declare-fun b!174984 () Bool)

(declare-fun res!144922 () Bool)

(assert (=> b!174984 (=> (not res!144922) (not e!121977))))

(assert (=> b!174984 (= res!144922 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!270249))))

(declare-fun b!174985 () Bool)

(declare-fun lt!270248 () (_ BitVec 64))

(assert (=> b!174985 (= e!121977 (bvsle lt!270249 (bvmul lt!270248 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!174985 (or (= lt!270248 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!270248 #b0000000000000000000000000000000000000000000000000000000000001000) lt!270248)))))

(assert (=> b!174985 (= lt!270248 ((_ sign_extend 32) (size!4143 (buf!4574 (_1!8174 lt!269317)))))))

(assert (= (and d!61829 res!144923) b!174984))

(assert (= (and b!174984 res!144922) b!174985))

(declare-fun m!275149 () Bool)

(assert (=> d!61829 m!275149))

(declare-fun m!275151 () Bool)

(assert (=> d!61829 m!275151))

(assert (=> b!174559 d!61829))

(declare-fun d!61831 () Bool)

(assert (=> d!61831 (validate_offset_bits!1 ((_ sign_extend 32) (size!4143 (buf!4574 (_2!8168 lt!269325)))) ((_ sign_extend 32) (currentByte!8688 (_2!8168 lt!269291))) ((_ sign_extend 32) (currentBit!8683 (_2!8168 lt!269291))) lt!269295)))

(declare-fun lt!270251 () Unit!12540)

(assert (=> d!61831 (= lt!270251 (choose!9 (_2!8168 lt!269291) (buf!4574 (_2!8168 lt!269325)) lt!269295 (BitStream!7395 (buf!4574 (_2!8168 lt!269325)) (currentByte!8688 (_2!8168 lt!269291)) (currentBit!8683 (_2!8168 lt!269291)))))))

(assert (=> d!61831 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8168 lt!269291) (buf!4574 (_2!8168 lt!269325)) lt!269295) lt!270251)))

(declare-fun bs!15396 () Bool)

(assert (= bs!15396 d!61831))

(assert (=> bs!15396 m!274031))

(declare-fun m!275153 () Bool)

(assert (=> bs!15396 m!275153))

(assert (=> b!174559 d!61831))

(declare-fun d!61833 () Bool)

(assert (=> d!61833 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4143 (buf!4574 (_2!8168 lt!269325)))) ((_ sign_extend 32) (currentByte!8688 thiss!1187)) ((_ sign_extend 32) (currentBit!8683 thiss!1187)) lt!269324) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4143 (buf!4574 (_2!8168 lt!269325)))) ((_ sign_extend 32) (currentByte!8688 thiss!1187)) ((_ sign_extend 32) (currentBit!8683 thiss!1187))) lt!269324))))

(declare-fun bs!15397 () Bool)

(assert (= bs!15397 d!61833))

(declare-fun m!275155 () Bool)

(assert (=> bs!15397 m!275155))

(assert (=> b!174559 d!61833))

(declare-fun d!61835 () Bool)

(declare-fun e!121978 () Bool)

(assert (=> d!61835 e!121978))

(declare-fun res!144925 () Bool)

(assert (=> d!61835 (=> (not res!144925) (not e!121978))))

(declare-fun lt!270253 () (_ BitVec 64))

(declare-fun lt!270256 () (_ BitVec 64))

(declare-fun lt!270254 () (_ BitVec 64))

(assert (=> d!61835 (= res!144925 (= lt!270256 (bvsub lt!270254 lt!270253)))))

(assert (=> d!61835 (or (= (bvand lt!270254 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!270253 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!270254 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!270254 lt!270253) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!61835 (= lt!270253 (remainingBits!0 ((_ sign_extend 32) (size!4143 (buf!4574 (_1!8174 lt!269330)))) ((_ sign_extend 32) (currentByte!8688 (_1!8174 lt!269330))) ((_ sign_extend 32) (currentBit!8683 (_1!8174 lt!269330)))))))

(declare-fun lt!270252 () (_ BitVec 64))

(declare-fun lt!270257 () (_ BitVec 64))

(assert (=> d!61835 (= lt!270254 (bvmul lt!270252 lt!270257))))

(assert (=> d!61835 (or (= lt!270252 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!270257 (bvsdiv (bvmul lt!270252 lt!270257) lt!270252)))))

(assert (=> d!61835 (= lt!270257 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!61835 (= lt!270252 ((_ sign_extend 32) (size!4143 (buf!4574 (_1!8174 lt!269330)))))))

(assert (=> d!61835 (= lt!270256 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8688 (_1!8174 lt!269330))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8683 (_1!8174 lt!269330)))))))

(assert (=> d!61835 (invariant!0 (currentBit!8683 (_1!8174 lt!269330)) (currentByte!8688 (_1!8174 lt!269330)) (size!4143 (buf!4574 (_1!8174 lt!269330))))))

(assert (=> d!61835 (= (bitIndex!0 (size!4143 (buf!4574 (_1!8174 lt!269330))) (currentByte!8688 (_1!8174 lt!269330)) (currentBit!8683 (_1!8174 lt!269330))) lt!270256)))

(declare-fun b!174986 () Bool)

(declare-fun res!144924 () Bool)

(assert (=> b!174986 (=> (not res!144924) (not e!121978))))

(assert (=> b!174986 (= res!144924 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!270256))))

(declare-fun b!174987 () Bool)

(declare-fun lt!270255 () (_ BitVec 64))

(assert (=> b!174987 (= e!121978 (bvsle lt!270256 (bvmul lt!270255 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!174987 (or (= lt!270255 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!270255 #b0000000000000000000000000000000000000000000000000000000000001000) lt!270255)))))

(assert (=> b!174987 (= lt!270255 ((_ sign_extend 32) (size!4143 (buf!4574 (_1!8174 lt!269330)))))))

(assert (= (and d!61835 res!144925) b!174986))

(assert (= (and b!174986 res!144924) b!174987))

(declare-fun m!275157 () Bool)

(assert (=> d!61835 m!275157))

(declare-fun m!275159 () Bool)

(assert (=> d!61835 m!275159))

(assert (=> b!174559 d!61835))

(declare-fun d!61837 () Bool)

(declare-fun lt!270258 () tuple2!15074)

(assert (=> d!61837 (= lt!270258 (readBit!0 (_1!8170 lt!269306)))))

(assert (=> d!61837 (= (readBitPure!0 (_1!8170 lt!269306)) (tuple2!15065 (_2!8182 lt!270258) (_1!8182 lt!270258)))))

(declare-fun bs!15398 () Bool)

(assert (= bs!15398 d!61837))

(declare-fun m!275161 () Bool)

(assert (=> bs!15398 m!275161))

(assert (=> b!174559 d!61837))

(declare-fun d!61839 () Bool)

(declare-fun e!121979 () Bool)

(assert (=> d!61839 e!121979))

(declare-fun res!144927 () Bool)

(assert (=> d!61839 (=> (not res!144927) (not e!121979))))

(declare-fun lt!270263 () (_ BitVec 64))

(declare-fun lt!270261 () (_ BitVec 64))

(declare-fun lt!270260 () (_ BitVec 64))

(assert (=> d!61839 (= res!144927 (= lt!270263 (bvsub lt!270261 lt!270260)))))

(assert (=> d!61839 (or (= (bvand lt!270261 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!270260 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!270261 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!270261 lt!270260) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!61839 (= lt!270260 (remainingBits!0 ((_ sign_extend 32) (size!4143 (buf!4574 (_2!8168 lt!269291)))) ((_ sign_extend 32) (currentByte!8688 (_2!8168 lt!269291))) ((_ sign_extend 32) (currentBit!8683 (_2!8168 lt!269291)))))))

(declare-fun lt!270259 () (_ BitVec 64))

(declare-fun lt!270264 () (_ BitVec 64))

(assert (=> d!61839 (= lt!270261 (bvmul lt!270259 lt!270264))))

(assert (=> d!61839 (or (= lt!270259 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!270264 (bvsdiv (bvmul lt!270259 lt!270264) lt!270259)))))

(assert (=> d!61839 (= lt!270264 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!61839 (= lt!270259 ((_ sign_extend 32) (size!4143 (buf!4574 (_2!8168 lt!269291)))))))

(assert (=> d!61839 (= lt!270263 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8688 (_2!8168 lt!269291))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8683 (_2!8168 lt!269291)))))))

(assert (=> d!61839 (invariant!0 (currentBit!8683 (_2!8168 lt!269291)) (currentByte!8688 (_2!8168 lt!269291)) (size!4143 (buf!4574 (_2!8168 lt!269291))))))

(assert (=> d!61839 (= (bitIndex!0 (size!4143 (buf!4574 (_2!8168 lt!269291))) (currentByte!8688 (_2!8168 lt!269291)) (currentBit!8683 (_2!8168 lt!269291))) lt!270263)))

(declare-fun b!174988 () Bool)

(declare-fun res!144926 () Bool)

(assert (=> b!174988 (=> (not res!144926) (not e!121979))))

(assert (=> b!174988 (= res!144926 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!270263))))

(declare-fun b!174989 () Bool)

(declare-fun lt!270262 () (_ BitVec 64))

(assert (=> b!174989 (= e!121979 (bvsle lt!270263 (bvmul lt!270262 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!174989 (or (= lt!270262 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!270262 #b0000000000000000000000000000000000000000000000000000000000001000) lt!270262)))))

(assert (=> b!174989 (= lt!270262 ((_ sign_extend 32) (size!4143 (buf!4574 (_2!8168 lt!269291)))))))

(assert (= (and d!61839 res!144927) b!174988))

(assert (= (and b!174988 res!144926) b!174989))

(declare-fun m!275163 () Bool)

(assert (=> d!61839 m!275163))

(declare-fun m!275165 () Bool)

(assert (=> d!61839 m!275165))

(assert (=> b!174559 d!61839))

(declare-fun d!61841 () Bool)

(assert (=> d!61841 (= (invariant!0 (currentBit!8683 thiss!1187) (currentByte!8688 thiss!1187) (size!4143 (buf!4574 (_2!8168 lt!269291)))) (and (bvsge (currentBit!8683 thiss!1187) #b00000000000000000000000000000000) (bvslt (currentBit!8683 thiss!1187) #b00000000000000000000000000001000) (bvsge (currentByte!8688 thiss!1187) #b00000000000000000000000000000000) (or (bvslt (currentByte!8688 thiss!1187) (size!4143 (buf!4574 (_2!8168 lt!269291)))) (and (= (currentBit!8683 thiss!1187) #b00000000000000000000000000000000) (= (currentByte!8688 thiss!1187) (size!4143 (buf!4574 (_2!8168 lt!269291))))))))))

(assert (=> b!174559 d!61841))

(declare-fun d!61843 () Bool)

(declare-fun e!121982 () Bool)

(assert (=> d!61843 e!121982))

(declare-fun res!144930 () Bool)

(assert (=> d!61843 (=> (not res!144930) (not e!121982))))

(declare-fun lt!270275 () tuple2!15064)

(declare-fun lt!270273 () tuple2!15064)

(assert (=> d!61843 (= res!144930 (= (bitIndex!0 (size!4143 (buf!4574 (_1!8174 lt!270275))) (currentByte!8688 (_1!8174 lt!270275)) (currentBit!8683 (_1!8174 lt!270275))) (bitIndex!0 (size!4143 (buf!4574 (_1!8174 lt!270273))) (currentByte!8688 (_1!8174 lt!270273)) (currentBit!8683 (_1!8174 lt!270273)))))))

(declare-fun lt!270274 () Unit!12540)

(declare-fun lt!270276 () BitStream!7394)

(declare-fun choose!50 (BitStream!7394 BitStream!7394 BitStream!7394 tuple2!15064 tuple2!15064 BitStream!7394 Bool tuple2!15064 tuple2!15064 BitStream!7394 Bool) Unit!12540)

(assert (=> d!61843 (= lt!270274 (choose!50 lt!269300 (_2!8168 lt!269325) lt!270276 lt!270275 (tuple2!15065 (_1!8174 lt!270275) (_2!8174 lt!270275)) (_1!8174 lt!270275) (_2!8174 lt!270275) lt!270273 (tuple2!15065 (_1!8174 lt!270273) (_2!8174 lt!270273)) (_1!8174 lt!270273) (_2!8174 lt!270273)))))

(assert (=> d!61843 (= lt!270273 (readBitPure!0 lt!270276))))

(assert (=> d!61843 (= lt!270275 (readBitPure!0 lt!269300))))

(assert (=> d!61843 (= lt!270276 (BitStream!7395 (buf!4574 (_2!8168 lt!269325)) (currentByte!8688 lt!269300) (currentBit!8683 lt!269300)))))

(assert (=> d!61843 (invariant!0 (currentBit!8683 lt!269300) (currentByte!8688 lt!269300) (size!4143 (buf!4574 (_2!8168 lt!269325))))))

(assert (=> d!61843 (= (readBitPrefixLemma!0 lt!269300 (_2!8168 lt!269325)) lt!270274)))

(declare-fun b!174992 () Bool)

(assert (=> b!174992 (= e!121982 (= (_2!8174 lt!270275) (_2!8174 lt!270273)))))

(assert (= (and d!61843 res!144930) b!174992))

(declare-fun m!275167 () Bool)

(assert (=> d!61843 m!275167))

(assert (=> d!61843 m!274017))

(declare-fun m!275169 () Bool)

(assert (=> d!61843 m!275169))

(assert (=> d!61843 m!274019))

(declare-fun m!275171 () Bool)

(assert (=> d!61843 m!275171))

(declare-fun m!275173 () Bool)

(assert (=> d!61843 m!275173))

(assert (=> b!174559 d!61843))

(declare-fun d!61845 () Bool)

(assert (=> d!61845 (validate_offset_bits!1 ((_ sign_extend 32) (size!4143 (buf!4574 (_2!8168 lt!269325)))) ((_ sign_extend 32) (currentByte!8688 thiss!1187)) ((_ sign_extend 32) (currentBit!8683 thiss!1187)) lt!269324)))

(declare-fun lt!270277 () Unit!12540)

(assert (=> d!61845 (= lt!270277 (choose!9 thiss!1187 (buf!4574 (_2!8168 lt!269325)) lt!269324 (BitStream!7395 (buf!4574 (_2!8168 lt!269325)) (currentByte!8688 thiss!1187) (currentBit!8683 thiss!1187))))))

(assert (=> d!61845 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1187 (buf!4574 (_2!8168 lt!269325)) lt!269324) lt!270277)))

(declare-fun bs!15399 () Bool)

(assert (= bs!15399 d!61845))

(assert (=> bs!15399 m!274013))

(declare-fun m!275175 () Bool)

(assert (=> bs!15399 m!275175))

(assert (=> b!174559 d!61845))

(declare-fun lt!270286 () (_ BitVec 64))

(declare-fun b!174993 () Bool)

(declare-fun e!121984 () Bool)

(declare-fun lt!270289 () tuple2!15056)

(declare-fun lt!270278 () (_ BitVec 64))

(assert (=> b!174993 (= e!121984 (= (_1!8170 lt!270289) (withMovedBitIndex!0 (_2!8170 lt!270289) (bvsub lt!270286 lt!270278))))))

(assert (=> b!174993 (or (= (bvand lt!270286 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!270278 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!270286 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!270286 lt!270278) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!174993 (= lt!270278 (bitIndex!0 (size!4143 (buf!4574 (_2!8168 lt!269325))) (currentByte!8688 (_2!8168 lt!269325)) (currentBit!8683 (_2!8168 lt!269325))))))

(assert (=> b!174993 (= lt!270286 (bitIndex!0 (size!4143 (buf!4574 thiss!1187)) (currentByte!8688 thiss!1187) (currentBit!8683 thiss!1187)))))

(declare-fun d!61847 () Bool)

(assert (=> d!61847 e!121984))

(declare-fun res!144932 () Bool)

(assert (=> d!61847 (=> (not res!144932) (not e!121984))))

(assert (=> d!61847 (= res!144932 (isPrefixOf!0 (_1!8170 lt!270289) (_2!8170 lt!270289)))))

(declare-fun lt!270280 () BitStream!7394)

(assert (=> d!61847 (= lt!270289 (tuple2!15057 lt!270280 (_2!8168 lt!269325)))))

(declare-fun lt!270291 () Unit!12540)

(declare-fun lt!270282 () Unit!12540)

(assert (=> d!61847 (= lt!270291 lt!270282)))

(assert (=> d!61847 (isPrefixOf!0 lt!270280 (_2!8168 lt!269325))))

(assert (=> d!61847 (= lt!270282 (lemmaIsPrefixTransitive!0 lt!270280 (_2!8168 lt!269325) (_2!8168 lt!269325)))))

(declare-fun lt!270287 () Unit!12540)

(declare-fun lt!270293 () Unit!12540)

(assert (=> d!61847 (= lt!270287 lt!270293)))

(assert (=> d!61847 (isPrefixOf!0 lt!270280 (_2!8168 lt!269325))))

(assert (=> d!61847 (= lt!270293 (lemmaIsPrefixTransitive!0 lt!270280 thiss!1187 (_2!8168 lt!269325)))))

(declare-fun lt!270281 () Unit!12540)

(declare-fun e!121983 () Unit!12540)

(assert (=> d!61847 (= lt!270281 e!121983)))

(declare-fun c!9221 () Bool)

(assert (=> d!61847 (= c!9221 (not (= (size!4143 (buf!4574 thiss!1187)) #b00000000000000000000000000000000)))))

(declare-fun lt!270295 () Unit!12540)

(declare-fun lt!270294 () Unit!12540)

(assert (=> d!61847 (= lt!270295 lt!270294)))

(assert (=> d!61847 (isPrefixOf!0 (_2!8168 lt!269325) (_2!8168 lt!269325))))

(assert (=> d!61847 (= lt!270294 (lemmaIsPrefixRefl!0 (_2!8168 lt!269325)))))

(declare-fun lt!270288 () Unit!12540)

(declare-fun lt!270290 () Unit!12540)

(assert (=> d!61847 (= lt!270288 lt!270290)))

(assert (=> d!61847 (= lt!270290 (lemmaIsPrefixRefl!0 (_2!8168 lt!269325)))))

(declare-fun lt!270292 () Unit!12540)

(declare-fun lt!270283 () Unit!12540)

(assert (=> d!61847 (= lt!270292 lt!270283)))

(assert (=> d!61847 (isPrefixOf!0 lt!270280 lt!270280)))

(assert (=> d!61847 (= lt!270283 (lemmaIsPrefixRefl!0 lt!270280))))

(declare-fun lt!270285 () Unit!12540)

(declare-fun lt!270296 () Unit!12540)

(assert (=> d!61847 (= lt!270285 lt!270296)))

(assert (=> d!61847 (isPrefixOf!0 thiss!1187 thiss!1187)))

(assert (=> d!61847 (= lt!270296 (lemmaIsPrefixRefl!0 thiss!1187))))

(assert (=> d!61847 (= lt!270280 (BitStream!7395 (buf!4574 (_2!8168 lt!269325)) (currentByte!8688 thiss!1187) (currentBit!8683 thiss!1187)))))

(assert (=> d!61847 (isPrefixOf!0 thiss!1187 (_2!8168 lt!269325))))

(assert (=> d!61847 (= (reader!0 thiss!1187 (_2!8168 lt!269325)) lt!270289)))

(declare-fun b!174994 () Bool)

(declare-fun lt!270297 () Unit!12540)

(assert (=> b!174994 (= e!121983 lt!270297)))

(declare-fun lt!270279 () (_ BitVec 64))

(assert (=> b!174994 (= lt!270279 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!270284 () (_ BitVec 64))

(assert (=> b!174994 (= lt!270284 (bitIndex!0 (size!4143 (buf!4574 thiss!1187)) (currentByte!8688 thiss!1187) (currentBit!8683 thiss!1187)))))

(assert (=> b!174994 (= lt!270297 (arrayBitRangesEqSymmetric!0 (buf!4574 thiss!1187) (buf!4574 (_2!8168 lt!269325)) lt!270279 lt!270284))))

(assert (=> b!174994 (arrayBitRangesEq!0 (buf!4574 (_2!8168 lt!269325)) (buf!4574 thiss!1187) lt!270279 lt!270284)))

(declare-fun b!174995 () Bool)

(declare-fun Unit!12618 () Unit!12540)

(assert (=> b!174995 (= e!121983 Unit!12618)))

(declare-fun b!174996 () Bool)

(declare-fun res!144931 () Bool)

(assert (=> b!174996 (=> (not res!144931) (not e!121984))))

(assert (=> b!174996 (= res!144931 (isPrefixOf!0 (_2!8170 lt!270289) (_2!8168 lt!269325)))))

(declare-fun b!174997 () Bool)

(declare-fun res!144933 () Bool)

(assert (=> b!174997 (=> (not res!144933) (not e!121984))))

(assert (=> b!174997 (= res!144933 (isPrefixOf!0 (_1!8170 lt!270289) thiss!1187))))

(assert (= (and d!61847 c!9221) b!174994))

(assert (= (and d!61847 (not c!9221)) b!174995))

(assert (= (and d!61847 res!144932) b!174997))

(assert (= (and b!174997 res!144933) b!174996))

(assert (= (and b!174996 res!144931) b!174993))

(declare-fun m!275177 () Bool)

(assert (=> b!174997 m!275177))

(declare-fun m!275179 () Bool)

(assert (=> b!174996 m!275179))

(declare-fun m!275181 () Bool)

(assert (=> b!174993 m!275181))

(assert (=> b!174993 m!274041))

(assert (=> b!174993 m!273751))

(declare-fun m!275183 () Bool)

(assert (=> d!61847 m!275183))

(assert (=> d!61847 m!273817))

(declare-fun m!275185 () Bool)

(assert (=> d!61847 m!275185))

(declare-fun m!275187 () Bool)

(assert (=> d!61847 m!275187))

(declare-fun m!275189 () Bool)

(assert (=> d!61847 m!275189))

(declare-fun m!275191 () Bool)

(assert (=> d!61847 m!275191))

(declare-fun m!275193 () Bool)

(assert (=> d!61847 m!275193))

(assert (=> d!61847 m!273827))

(declare-fun m!275195 () Bool)

(assert (=> d!61847 m!275195))

(declare-fun m!275197 () Bool)

(assert (=> d!61847 m!275197))

(declare-fun m!275199 () Bool)

(assert (=> d!61847 m!275199))

(assert (=> b!174994 m!273751))

(declare-fun m!275201 () Bool)

(assert (=> b!174994 m!275201))

(declare-fun m!275203 () Bool)

(assert (=> b!174994 m!275203))

(assert (=> b!174559 d!61847))

(declare-fun lt!270298 () tuple2!15062)

(declare-fun d!61849 () Bool)

(assert (=> d!61849 (= lt!270298 (readNBitsLSBFirstsLoop!0 (_1!8170 lt!269299) nBits!340 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvor lt!269329 (ite (_2!8174 lt!269284) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) #b00000000000000000000000000000000)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!61849 (= (readNBitsLSBFirstsLoopPure!0 (_1!8170 lt!269299) nBits!340 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvor lt!269329 (ite (_2!8174 lt!269284) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) #b00000000000000000000000000000000)) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!15055 (_2!8173 lt!270298) (_1!8173 lt!270298)))))

(declare-fun bs!15400 () Bool)

(assert (= bs!15400 d!61849))

(declare-fun m!275205 () Bool)

(assert (=> bs!15400 m!275205))

(assert (=> b!174559 d!61849))

(assert (=> b!174559 d!61465))

(declare-fun d!61851 () Bool)

(assert (=> d!61851 (isPrefixOf!0 thiss!1187 (_2!8168 lt!269325))))

(declare-fun lt!270299 () Unit!12540)

(assert (=> d!61851 (= lt!270299 (choose!30 thiss!1187 (_2!8168 lt!269291) (_2!8168 lt!269325)))))

(assert (=> d!61851 (isPrefixOf!0 thiss!1187 (_2!8168 lt!269291))))

(assert (=> d!61851 (= (lemmaIsPrefixTransitive!0 thiss!1187 (_2!8168 lt!269291) (_2!8168 lt!269325)) lt!270299)))

(declare-fun bs!15401 () Bool)

(assert (= bs!15401 d!61851))

(assert (=> bs!15401 m!275191))

(declare-fun m!275207 () Bool)

(assert (=> bs!15401 m!275207))

(declare-fun m!275209 () Bool)

(assert (=> bs!15401 m!275209))

(assert (=> b!174559 d!61851))

(declare-fun d!61853 () Bool)

(declare-fun lt!270300 () tuple2!15062)

(assert (=> d!61853 (= lt!270300 (readNBitsLSBFirstsLoop!0 (_1!8170 lt!269287) nBits!340 #b00000000000000000000000000000000 (bvand v!186 (onesLSBLong!0 #b00000000000000000000000000000000))))))

(assert (=> d!61853 (= (readNBitsLSBFirstsLoopPure!0 (_1!8170 lt!269287) nBits!340 #b00000000000000000000000000000000 (bvand v!186 (onesLSBLong!0 #b00000000000000000000000000000000))) (tuple2!15055 (_2!8173 lt!270300) (_1!8173 lt!270300)))))

(declare-fun bs!15402 () Bool)

(assert (= bs!15402 d!61853))

(declare-fun m!275211 () Bool)

(assert (=> bs!15402 m!275211))

(assert (=> b!174559 d!61853))

(declare-fun d!61855 () Bool)

(assert (=> d!61855 (= (invariant!0 (currentBit!8683 (_2!8168 lt!269325)) (currentByte!8688 (_2!8168 lt!269325)) (size!4143 (buf!4574 (_2!8168 lt!269325)))) (and (bvsge (currentBit!8683 (_2!8168 lt!269325)) #b00000000000000000000000000000000) (bvslt (currentBit!8683 (_2!8168 lt!269325)) #b00000000000000000000000000001000) (bvsge (currentByte!8688 (_2!8168 lt!269325)) #b00000000000000000000000000000000) (or (bvslt (currentByte!8688 (_2!8168 lt!269325)) (size!4143 (buf!4574 (_2!8168 lt!269325)))) (and (= (currentBit!8683 (_2!8168 lt!269325)) #b00000000000000000000000000000000) (= (currentByte!8688 (_2!8168 lt!269325)) (size!4143 (buf!4574 (_2!8168 lt!269325))))))))))

(assert (=> b!174559 d!61855))

(declare-fun lt!270301 () (_ BitVec 64))

(declare-fun lt!270312 () tuple2!15056)

(declare-fun lt!270309 () (_ BitVec 64))

(declare-fun b!174998 () Bool)

(declare-fun e!121986 () Bool)

(assert (=> b!174998 (= e!121986 (= (_1!8170 lt!270312) (withMovedBitIndex!0 (_2!8170 lt!270312) (bvsub lt!270309 lt!270301))))))

(assert (=> b!174998 (or (= (bvand lt!270309 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!270301 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!270309 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!270309 lt!270301) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!174998 (= lt!270301 (bitIndex!0 (size!4143 (buf!4574 (_2!8168 lt!269325))) (currentByte!8688 (_2!8168 lt!269325)) (currentBit!8683 (_2!8168 lt!269325))))))

(assert (=> b!174998 (= lt!270309 (bitIndex!0 (size!4143 (buf!4574 (_2!8168 lt!269291))) (currentByte!8688 (_2!8168 lt!269291)) (currentBit!8683 (_2!8168 lt!269291))))))

(declare-fun d!61857 () Bool)

(assert (=> d!61857 e!121986))

(declare-fun res!144935 () Bool)

(assert (=> d!61857 (=> (not res!144935) (not e!121986))))

(assert (=> d!61857 (= res!144935 (isPrefixOf!0 (_1!8170 lt!270312) (_2!8170 lt!270312)))))

(declare-fun lt!270303 () BitStream!7394)

(assert (=> d!61857 (= lt!270312 (tuple2!15057 lt!270303 (_2!8168 lt!269325)))))

(declare-fun lt!270314 () Unit!12540)

(declare-fun lt!270305 () Unit!12540)

(assert (=> d!61857 (= lt!270314 lt!270305)))

(assert (=> d!61857 (isPrefixOf!0 lt!270303 (_2!8168 lt!269325))))

(assert (=> d!61857 (= lt!270305 (lemmaIsPrefixTransitive!0 lt!270303 (_2!8168 lt!269325) (_2!8168 lt!269325)))))

(declare-fun lt!270310 () Unit!12540)

(declare-fun lt!270316 () Unit!12540)

(assert (=> d!61857 (= lt!270310 lt!270316)))

(assert (=> d!61857 (isPrefixOf!0 lt!270303 (_2!8168 lt!269325))))

(assert (=> d!61857 (= lt!270316 (lemmaIsPrefixTransitive!0 lt!270303 (_2!8168 lt!269291) (_2!8168 lt!269325)))))

(declare-fun lt!270304 () Unit!12540)

(declare-fun e!121985 () Unit!12540)

(assert (=> d!61857 (= lt!270304 e!121985)))

(declare-fun c!9222 () Bool)

(assert (=> d!61857 (= c!9222 (not (= (size!4143 (buf!4574 (_2!8168 lt!269291))) #b00000000000000000000000000000000)))))

(declare-fun lt!270318 () Unit!12540)

(declare-fun lt!270317 () Unit!12540)

(assert (=> d!61857 (= lt!270318 lt!270317)))

(assert (=> d!61857 (isPrefixOf!0 (_2!8168 lt!269325) (_2!8168 lt!269325))))

(assert (=> d!61857 (= lt!270317 (lemmaIsPrefixRefl!0 (_2!8168 lt!269325)))))

(declare-fun lt!270311 () Unit!12540)

(declare-fun lt!270313 () Unit!12540)

(assert (=> d!61857 (= lt!270311 lt!270313)))

(assert (=> d!61857 (= lt!270313 (lemmaIsPrefixRefl!0 (_2!8168 lt!269325)))))

(declare-fun lt!270315 () Unit!12540)

(declare-fun lt!270306 () Unit!12540)

(assert (=> d!61857 (= lt!270315 lt!270306)))

(assert (=> d!61857 (isPrefixOf!0 lt!270303 lt!270303)))

(assert (=> d!61857 (= lt!270306 (lemmaIsPrefixRefl!0 lt!270303))))

(declare-fun lt!270308 () Unit!12540)

(declare-fun lt!270319 () Unit!12540)

(assert (=> d!61857 (= lt!270308 lt!270319)))

(assert (=> d!61857 (isPrefixOf!0 (_2!8168 lt!269291) (_2!8168 lt!269291))))

(assert (=> d!61857 (= lt!270319 (lemmaIsPrefixRefl!0 (_2!8168 lt!269291)))))

(assert (=> d!61857 (= lt!270303 (BitStream!7395 (buf!4574 (_2!8168 lt!269325)) (currentByte!8688 (_2!8168 lt!269291)) (currentBit!8683 (_2!8168 lt!269291))))))

(assert (=> d!61857 (isPrefixOf!0 (_2!8168 lt!269291) (_2!8168 lt!269325))))

(assert (=> d!61857 (= (reader!0 (_2!8168 lt!269291) (_2!8168 lt!269325)) lt!270312)))

(declare-fun b!174999 () Bool)

(declare-fun lt!270320 () Unit!12540)

(assert (=> b!174999 (= e!121985 lt!270320)))

(declare-fun lt!270302 () (_ BitVec 64))

(assert (=> b!174999 (= lt!270302 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!270307 () (_ BitVec 64))

(assert (=> b!174999 (= lt!270307 (bitIndex!0 (size!4143 (buf!4574 (_2!8168 lt!269291))) (currentByte!8688 (_2!8168 lt!269291)) (currentBit!8683 (_2!8168 lt!269291))))))

(assert (=> b!174999 (= lt!270320 (arrayBitRangesEqSymmetric!0 (buf!4574 (_2!8168 lt!269291)) (buf!4574 (_2!8168 lt!269325)) lt!270302 lt!270307))))

(assert (=> b!174999 (arrayBitRangesEq!0 (buf!4574 (_2!8168 lt!269325)) (buf!4574 (_2!8168 lt!269291)) lt!270302 lt!270307)))

(declare-fun b!175000 () Bool)

(declare-fun Unit!12619 () Unit!12540)

(assert (=> b!175000 (= e!121985 Unit!12619)))

(declare-fun b!175001 () Bool)

(declare-fun res!144934 () Bool)

(assert (=> b!175001 (=> (not res!144934) (not e!121986))))

(assert (=> b!175001 (= res!144934 (isPrefixOf!0 (_2!8170 lt!270312) (_2!8168 lt!269325)))))

(declare-fun b!175002 () Bool)

(declare-fun res!144936 () Bool)

(assert (=> b!175002 (=> (not res!144936) (not e!121986))))

(assert (=> b!175002 (= res!144936 (isPrefixOf!0 (_1!8170 lt!270312) (_2!8168 lt!269291)))))

(assert (= (and d!61857 c!9222) b!174999))

(assert (= (and d!61857 (not c!9222)) b!175000))

(assert (= (and d!61857 res!144935) b!175002))

(assert (= (and b!175002 res!144936) b!175001))

(assert (= (and b!175001 res!144934) b!174998))

(declare-fun m!275213 () Bool)

(assert (=> b!175002 m!275213))

(declare-fun m!275215 () Bool)

(assert (=> b!175001 m!275215))

(declare-fun m!275217 () Bool)

(assert (=> b!174998 m!275217))

(assert (=> b!174998 m!274041))

(assert (=> b!174998 m!274039))

(declare-fun m!275219 () Bool)

(assert (=> d!61857 m!275219))

(declare-fun m!275221 () Bool)

(assert (=> d!61857 m!275221))

(declare-fun m!275223 () Bool)

(assert (=> d!61857 m!275223))

(declare-fun m!275225 () Bool)

(assert (=> d!61857 m!275225))

(assert (=> d!61857 m!275189))

(declare-fun m!275227 () Bool)

(assert (=> d!61857 m!275227))

(declare-fun m!275229 () Bool)

(assert (=> d!61857 m!275229))

(assert (=> d!61857 m!275061))

(declare-fun m!275231 () Bool)

(assert (=> d!61857 m!275231))

(declare-fun m!275233 () Bool)

(assert (=> d!61857 m!275233))

(assert (=> d!61857 m!275199))

(assert (=> b!174999 m!274039))

(declare-fun m!275235 () Bool)

(assert (=> b!174999 m!275235))

(declare-fun m!275237 () Bool)

(assert (=> b!174999 m!275237))

(assert (=> b!174559 d!61857))

(declare-fun d!61859 () Bool)

(declare-fun lt!270321 () tuple2!15074)

(assert (=> d!61859 (= lt!270321 (readBit!0 lt!269316))))

(assert (=> d!61859 (= (readBitPure!0 lt!269316) (tuple2!15065 (_2!8182 lt!270321) (_1!8182 lt!270321)))))

(declare-fun bs!15403 () Bool)

(assert (= bs!15403 d!61859))

(declare-fun m!275239 () Bool)

(assert (=> bs!15403 m!275239))

(assert (=> b!174559 d!61859))

(declare-fun d!61861 () Bool)

(declare-fun e!121987 () Bool)

(assert (=> d!61861 e!121987))

(declare-fun res!144937 () Bool)

(assert (=> d!61861 (=> (not res!144937) (not e!121987))))

(declare-fun lt!270322 () BitStream!7394)

(declare-fun lt!270323 () (_ BitVec 64))

(assert (=> d!61861 (= res!144937 (= (bvadd lt!270323 (bvsub (bitIndex!0 (size!4143 (buf!4574 (_2!8168 lt!269291))) (currentByte!8688 (_2!8168 lt!269291)) (currentBit!8683 (_2!8168 lt!269291))) (bitIndex!0 (size!4143 (buf!4574 (_2!8168 lt!269325))) (currentByte!8688 (_2!8168 lt!269325)) (currentBit!8683 (_2!8168 lt!269325))))) (bitIndex!0 (size!4143 (buf!4574 lt!270322)) (currentByte!8688 lt!270322) (currentBit!8683 lt!270322))))))

(assert (=> d!61861 (or (not (= (bvand lt!270323 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bitIndex!0 (size!4143 (buf!4574 (_2!8168 lt!269291))) (currentByte!8688 (_2!8168 lt!269291)) (currentBit!8683 (_2!8168 lt!269291))) (bitIndex!0 (size!4143 (buf!4574 (_2!8168 lt!269325))) (currentByte!8688 (_2!8168 lt!269325)) (currentBit!8683 (_2!8168 lt!269325)))) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!270323 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!270323 (bvsub (bitIndex!0 (size!4143 (buf!4574 (_2!8168 lt!269291))) (currentByte!8688 (_2!8168 lt!269291)) (currentBit!8683 (_2!8168 lt!269291))) (bitIndex!0 (size!4143 (buf!4574 (_2!8168 lt!269325))) (currentByte!8688 (_2!8168 lt!269325)) (currentBit!8683 (_2!8168 lt!269325))))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!61861 (= lt!270323 (bitIndex!0 (size!4143 (buf!4574 (_2!8170 lt!269299))) (currentByte!8688 (_2!8170 lt!269299)) (currentBit!8683 (_2!8170 lt!269299))))))

(assert (=> d!61861 (= lt!270322 (_2!8168 (moveBitIndex!0 (_2!8170 lt!269299) (bvsub (bitIndex!0 (size!4143 (buf!4574 (_2!8168 lt!269291))) (currentByte!8688 (_2!8168 lt!269291)) (currentBit!8683 (_2!8168 lt!269291))) (bitIndex!0 (size!4143 (buf!4574 (_2!8168 lt!269325))) (currentByte!8688 (_2!8168 lt!269325)) (currentBit!8683 (_2!8168 lt!269325)))))))))

(assert (=> d!61861 (moveBitIndexPrecond!0 (_2!8170 lt!269299) (bvsub (bitIndex!0 (size!4143 (buf!4574 (_2!8168 lt!269291))) (currentByte!8688 (_2!8168 lt!269291)) (currentBit!8683 (_2!8168 lt!269291))) (bitIndex!0 (size!4143 (buf!4574 (_2!8168 lt!269325))) (currentByte!8688 (_2!8168 lt!269325)) (currentBit!8683 (_2!8168 lt!269325)))))))

(assert (=> d!61861 (= (withMovedBitIndex!0 (_2!8170 lt!269299) (bvsub (bitIndex!0 (size!4143 (buf!4574 (_2!8168 lt!269291))) (currentByte!8688 (_2!8168 lt!269291)) (currentBit!8683 (_2!8168 lt!269291))) (bitIndex!0 (size!4143 (buf!4574 (_2!8168 lt!269325))) (currentByte!8688 (_2!8168 lt!269325)) (currentBit!8683 (_2!8168 lt!269325))))) lt!270322)))

(declare-fun b!175003 () Bool)

(assert (=> b!175003 (= e!121987 (= (size!4143 (buf!4574 (_2!8170 lt!269299))) (size!4143 (buf!4574 lt!270322))))))

(assert (= (and d!61861 res!144937) b!175003))

(declare-fun m!275241 () Bool)

(assert (=> d!61861 m!275241))

(declare-fun m!275243 () Bool)

(assert (=> d!61861 m!275243))

(declare-fun m!275245 () Bool)

(assert (=> d!61861 m!275245))

(declare-fun m!275247 () Bool)

(assert (=> d!61861 m!275247))

(assert (=> b!174559 d!61861))

(declare-fun d!61863 () Bool)

(assert (=> d!61863 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4143 (buf!4574 (_2!8168 lt!269325)))) ((_ sign_extend 32) (currentByte!8688 thiss!1187)) ((_ sign_extend 32) (currentBit!8683 thiss!1187)) lt!269312) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4143 (buf!4574 (_2!8168 lt!269325)))) ((_ sign_extend 32) (currentByte!8688 thiss!1187)) ((_ sign_extend 32) (currentBit!8683 thiss!1187))) lt!269312))))

(declare-fun bs!15404 () Bool)

(assert (= bs!15404 d!61863))

(assert (=> bs!15404 m!275155))

(assert (=> b!174559 d!61863))

(declare-fun d!61865 () Bool)

(declare-fun res!144940 () Bool)

(declare-fun e!121989 () Bool)

(assert (=> d!61865 (=> (not res!144940) (not e!121989))))

(assert (=> d!61865 (= res!144940 (= (size!4143 (buf!4574 thiss!1187)) (size!4143 (buf!4574 (_2!8168 lt!269323)))))))

(assert (=> d!61865 (= (isPrefixOf!0 thiss!1187 (_2!8168 lt!269323)) e!121989)))

(declare-fun b!175004 () Bool)

(declare-fun res!144938 () Bool)

(assert (=> b!175004 (=> (not res!144938) (not e!121989))))

(assert (=> b!175004 (= res!144938 (bvsle (bitIndex!0 (size!4143 (buf!4574 thiss!1187)) (currentByte!8688 thiss!1187) (currentBit!8683 thiss!1187)) (bitIndex!0 (size!4143 (buf!4574 (_2!8168 lt!269323))) (currentByte!8688 (_2!8168 lt!269323)) (currentBit!8683 (_2!8168 lt!269323)))))))

(declare-fun b!175005 () Bool)

(declare-fun e!121988 () Bool)

(assert (=> b!175005 (= e!121989 e!121988)))

(declare-fun res!144939 () Bool)

(assert (=> b!175005 (=> res!144939 e!121988)))

(assert (=> b!175005 (= res!144939 (= (size!4143 (buf!4574 thiss!1187)) #b00000000000000000000000000000000))))

(declare-fun b!175006 () Bool)

(assert (=> b!175006 (= e!121988 (arrayBitRangesEq!0 (buf!4574 thiss!1187) (buf!4574 (_2!8168 lt!269323)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4143 (buf!4574 thiss!1187)) (currentByte!8688 thiss!1187) (currentBit!8683 thiss!1187))))))

(assert (= (and d!61865 res!144940) b!175004))

(assert (= (and b!175004 res!144938) b!175005))

(assert (= (and b!175005 (not res!144939)) b!175006))

(assert (=> b!175004 m!273751))

(assert (=> b!175004 m!273975))

(assert (=> b!175006 m!273751))

(assert (=> b!175006 m!273751))

(declare-fun m!275249 () Bool)

(assert (=> b!175006 m!275249))

(assert (=> b!174554 d!61865))

(assert (=> d!61465 d!61799))

(assert (=> d!61465 d!61469))

(declare-fun d!61867 () Bool)

(declare-fun e!121990 () Bool)

(assert (=> d!61867 e!121990))

(declare-fun res!144942 () Bool)

(assert (=> d!61867 (=> (not res!144942) (not e!121990))))

(declare-fun lt!270325 () (_ BitVec 64))

(declare-fun lt!270328 () (_ BitVec 64))

(declare-fun lt!270326 () (_ BitVec 64))

(assert (=> d!61867 (= res!144942 (= lt!270328 (bvsub lt!270326 lt!270325)))))

(assert (=> d!61867 (or (= (bvand lt!270326 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!270325 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!270326 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!270326 lt!270325) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!61867 (= lt!270325 (remainingBits!0 ((_ sign_extend 32) (size!4143 (buf!4574 (_2!8168 lt!269323)))) ((_ sign_extend 32) (currentByte!8688 (_2!8168 lt!269323))) ((_ sign_extend 32) (currentBit!8683 (_2!8168 lt!269323)))))))

(declare-fun lt!270324 () (_ BitVec 64))

(declare-fun lt!270329 () (_ BitVec 64))

(assert (=> d!61867 (= lt!270326 (bvmul lt!270324 lt!270329))))

(assert (=> d!61867 (or (= lt!270324 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!270329 (bvsdiv (bvmul lt!270324 lt!270329) lt!270324)))))

(assert (=> d!61867 (= lt!270329 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!61867 (= lt!270324 ((_ sign_extend 32) (size!4143 (buf!4574 (_2!8168 lt!269323)))))))

(assert (=> d!61867 (= lt!270328 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8688 (_2!8168 lt!269323))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8683 (_2!8168 lt!269323)))))))

(assert (=> d!61867 (invariant!0 (currentBit!8683 (_2!8168 lt!269323)) (currentByte!8688 (_2!8168 lt!269323)) (size!4143 (buf!4574 (_2!8168 lt!269323))))))

(assert (=> d!61867 (= (bitIndex!0 (size!4143 (buf!4574 (_2!8168 lt!269323))) (currentByte!8688 (_2!8168 lt!269323)) (currentBit!8683 (_2!8168 lt!269323))) lt!270328)))

(declare-fun b!175007 () Bool)

(declare-fun res!144941 () Bool)

(assert (=> b!175007 (=> (not res!144941) (not e!121990))))

(assert (=> b!175007 (= res!144941 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!270328))))

(declare-fun b!175008 () Bool)

(declare-fun lt!270327 () (_ BitVec 64))

(assert (=> b!175008 (= e!121990 (bvsle lt!270328 (bvmul lt!270327 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!175008 (or (= lt!270327 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!270327 #b0000000000000000000000000000000000000000000000000000000000001000) lt!270327)))))

(assert (=> b!175008 (= lt!270327 ((_ sign_extend 32) (size!4143 (buf!4574 (_2!8168 lt!269323)))))))

(assert (= (and d!61867 res!144942) b!175007))

(assert (= (and b!175007 res!144941) b!175008))

(declare-fun m!275251 () Bool)

(assert (=> d!61867 m!275251))

(assert (=> d!61867 m!274047))

(assert (=> b!174553 d!61867))

(assert (=> b!174553 d!61465))

(declare-fun d!61869 () Bool)

(declare-fun res!144945 () Bool)

(declare-fun e!121992 () Bool)

(assert (=> d!61869 (=> (not res!144945) (not e!121992))))

(assert (=> d!61869 (= res!144945 (= (size!4143 (buf!4574 thiss!1187)) (size!4143 (buf!4574 (ite c!9189 thiss!1187 (_2!8168 lt!269325))))))))

(assert (=> d!61869 (= (isPrefixOf!0 thiss!1187 (ite c!9189 thiss!1187 (_2!8168 lt!269325))) e!121992)))

(declare-fun b!175009 () Bool)

(declare-fun res!144943 () Bool)

(assert (=> b!175009 (=> (not res!144943) (not e!121992))))

(assert (=> b!175009 (= res!144943 (bvsle (bitIndex!0 (size!4143 (buf!4574 thiss!1187)) (currentByte!8688 thiss!1187) (currentBit!8683 thiss!1187)) (bitIndex!0 (size!4143 (buf!4574 (ite c!9189 thiss!1187 (_2!8168 lt!269325)))) (currentByte!8688 (ite c!9189 thiss!1187 (_2!8168 lt!269325))) (currentBit!8683 (ite c!9189 thiss!1187 (_2!8168 lt!269325))))))))

(declare-fun b!175010 () Bool)

(declare-fun e!121991 () Bool)

(assert (=> b!175010 (= e!121992 e!121991)))

(declare-fun res!144944 () Bool)

(assert (=> b!175010 (=> res!144944 e!121991)))

(assert (=> b!175010 (= res!144944 (= (size!4143 (buf!4574 thiss!1187)) #b00000000000000000000000000000000))))

(declare-fun b!175011 () Bool)

(assert (=> b!175011 (= e!121991 (arrayBitRangesEq!0 (buf!4574 thiss!1187) (buf!4574 (ite c!9189 thiss!1187 (_2!8168 lt!269325))) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4143 (buf!4574 thiss!1187)) (currentByte!8688 thiss!1187) (currentBit!8683 thiss!1187))))))

(assert (= (and d!61869 res!144945) b!175009))

(assert (= (and b!175009 res!144943) b!175010))

(assert (= (and b!175010 (not res!144944)) b!175011))

(assert (=> b!175009 m!273751))

(declare-fun m!275253 () Bool)

(assert (=> b!175009 m!275253))

(assert (=> b!175011 m!273751))

(assert (=> b!175011 m!273751))

(declare-fun m!275255 () Bool)

(assert (=> b!175011 m!275255))

(assert (=> bm!2888 d!61869))

(declare-fun d!61871 () Bool)

(declare-fun res!144948 () Bool)

(declare-fun e!121994 () Bool)

(assert (=> d!61871 (=> (not res!144948) (not e!121994))))

(assert (=> d!61871 (= res!144948 (= (size!4143 (buf!4574 (_2!8170 lt!268929))) (size!4143 (buf!4574 (_2!8168 lt!268755)))))))

(assert (=> d!61871 (= (isPrefixOf!0 (_2!8170 lt!268929) (_2!8168 lt!268755)) e!121994)))

(declare-fun b!175012 () Bool)

(declare-fun res!144946 () Bool)

(assert (=> b!175012 (=> (not res!144946) (not e!121994))))

(assert (=> b!175012 (= res!144946 (bvsle (bitIndex!0 (size!4143 (buf!4574 (_2!8170 lt!268929))) (currentByte!8688 (_2!8170 lt!268929)) (currentBit!8683 (_2!8170 lt!268929))) (bitIndex!0 (size!4143 (buf!4574 (_2!8168 lt!268755))) (currentByte!8688 (_2!8168 lt!268755)) (currentBit!8683 (_2!8168 lt!268755)))))))

(declare-fun b!175013 () Bool)

(declare-fun e!121993 () Bool)

(assert (=> b!175013 (= e!121994 e!121993)))

(declare-fun res!144947 () Bool)

(assert (=> b!175013 (=> res!144947 e!121993)))

(assert (=> b!175013 (= res!144947 (= (size!4143 (buf!4574 (_2!8170 lt!268929))) #b00000000000000000000000000000000))))

(declare-fun b!175014 () Bool)

(assert (=> b!175014 (= e!121993 (arrayBitRangesEq!0 (buf!4574 (_2!8170 lt!268929)) (buf!4574 (_2!8168 lt!268755)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4143 (buf!4574 (_2!8170 lt!268929))) (currentByte!8688 (_2!8170 lt!268929)) (currentBit!8683 (_2!8170 lt!268929)))))))

(assert (= (and d!61871 res!144948) b!175012))

(assert (= (and b!175012 res!144946) b!175013))

(assert (= (and b!175013 (not res!144947)) b!175014))

(assert (=> b!175012 m!274893))

(assert (=> b!175012 m!273749))

(assert (=> b!175014 m!274893))

(assert (=> b!175014 m!274893))

(declare-fun m!275257 () Bool)

(assert (=> b!175014 m!275257))

(assert (=> b!174438 d!61871))

(assert (=> b!174555 d!61775))

(declare-fun d!61873 () Bool)

(declare-fun res!144951 () Bool)

(declare-fun e!121996 () Bool)

(assert (=> d!61873 (=> (not res!144951) (not e!121996))))

(assert (=> d!61873 (= res!144951 (= (size!4143 (buf!4574 (_1!8170 lt!268929))) (size!4143 (buf!4574 thiss!1187))))))

(assert (=> d!61873 (= (isPrefixOf!0 (_1!8170 lt!268929) thiss!1187) e!121996)))

(declare-fun b!175015 () Bool)

(declare-fun res!144949 () Bool)

(assert (=> b!175015 (=> (not res!144949) (not e!121996))))

(assert (=> b!175015 (= res!144949 (bvsle (bitIndex!0 (size!4143 (buf!4574 (_1!8170 lt!268929))) (currentByte!8688 (_1!8170 lt!268929)) (currentBit!8683 (_1!8170 lt!268929))) (bitIndex!0 (size!4143 (buf!4574 thiss!1187)) (currentByte!8688 thiss!1187) (currentBit!8683 thiss!1187))))))

(declare-fun b!175016 () Bool)

(declare-fun e!121995 () Bool)

(assert (=> b!175016 (= e!121996 e!121995)))

(declare-fun res!144950 () Bool)

(assert (=> b!175016 (=> res!144950 e!121995)))

(assert (=> b!175016 (= res!144950 (= (size!4143 (buf!4574 (_1!8170 lt!268929))) #b00000000000000000000000000000000))))

(declare-fun b!175017 () Bool)

(assert (=> b!175017 (= e!121995 (arrayBitRangesEq!0 (buf!4574 (_1!8170 lt!268929)) (buf!4574 thiss!1187) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4143 (buf!4574 (_1!8170 lt!268929))) (currentByte!8688 (_1!8170 lt!268929)) (currentBit!8683 (_1!8170 lt!268929)))))))

(assert (= (and d!61873 res!144951) b!175015))

(assert (= (and b!175015 res!144949) b!175016))

(assert (= (and b!175016 (not res!144950)) b!175017))

(assert (=> b!175015 m!274971))

(assert (=> b!175015 m!273751))

(assert (=> b!175017 m!274971))

(assert (=> b!175017 m!274971))

(declare-fun m!275259 () Bool)

(assert (=> b!175017 m!275259))

(assert (=> b!174439 d!61873))

(push 1)

(assert (not b!174921))

(assert (not d!61833))

(assert (not b!175017))

(assert (not d!61785))

(assert (not d!61805))

(assert (not d!61741))

(assert (not b!175012))

(assert (not d!61747))

(assert (not b!174935))

(assert (not d!61813))

(assert (not d!61743))

(assert (not b!175001))

(assert (not b!174993))

(assert (not b!174944))

(assert (not b!174927))

(assert (not d!61795))

(assert (not b!174923))

(assert (not b!174966))

(assert (not b!174983))

(assert (not b!174971))

(assert (not d!61823))

(assert (not d!61845))

(assert (not d!61769))

(assert (not d!61849))

(assert (not b!175014))

(assert (not b!174970))

(assert (not b!174933))

(assert (not b!174994))

(assert (not d!61777))

(assert (not b!174979))

(assert (not b!174965))

(assert (not b!174996))

(assert (not b!175011))

(assert (not b!174974))

(assert (not b!174940))

(assert (not b!174998))

(assert (not d!61839))

(assert (not b!175006))

(assert (not b!174929))

(assert (not b!174932))

(assert (not b!175009))

(assert (not d!61835))

(assert (not b!174950))

(assert (not b!174910))

(assert (not b!175002))

(assert (not bm!2905))

(assert (not bm!2904))

(assert (not d!61857))

(assert (not b!174914))

(assert (not b!174964))

(assert (not b!174924))

(assert (not d!61867))

(assert (not b!174920))

(assert (not b!175004))

(assert (not d!61775))

(assert (not d!61859))

(assert (not b!174978))

(assert (not d!61819))

(assert (not b!174926))

(assert (not d!61843))

(assert (not b!174918))

(assert (not b!174930))

(assert (not b!174913))

(assert (not b!174917))

(assert (not d!61753))

(assert (not b!174963))

(assert (not bm!2906))

(assert (not b!174906))

(assert (not d!61827))

(assert (not d!61815))

(assert (not b!174969))

(assert (not d!61861))

(assert (not d!61755))

(assert (not d!61809))

(assert (not d!61759))

(assert (not d!61803))

(assert (not d!61765))

(assert (not d!61791))

(assert (not b!174968))

(assert (not b!174999))

(assert (not d!61863))

(assert (not b!174916))

(assert (not d!61829))

(assert (not d!61837))

(assert (not d!61811))

(assert (not b!174982))

(assert (not b!174997))

(assert (not b!174947))

(assert (not d!61831))

(assert (not b!174909))

(assert (not d!61851))

(assert (not d!61817))

(assert (not b!174943))

(assert (not d!61847))

(assert (not b!174977))

(assert (not b!175015))

(assert (not d!61757))

(assert (not d!61807))

(assert (not d!61771))

(assert (not d!61797))

(assert (not d!61853))

(assert (not d!61767))

(assert (not d!61825))

(check-sat)

(pop 1)

(push 1)

(check-sat)

