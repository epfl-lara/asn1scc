; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!23000 () Bool)

(assert start!23000)

(declare-fun b!116738 () Bool)

(declare-fun e!76547 () Bool)

(declare-datatypes ((array!5264 0))(
  ( (array!5265 (arr!2982 (Array (_ BitVec 32) (_ BitVec 8))) (size!2389 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4252 0))(
  ( (BitStream!4253 (buf!2799 array!5264) (currentByte!5436 (_ BitVec 32)) (currentBit!5431 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!9712 0))(
  ( (tuple2!9713 (_1!5121 BitStream!4252) (_2!5121 Bool)) )
))
(declare-fun lt!178366 () tuple2!9712)

(declare-fun lt!178374 () tuple2!9712)

(assert (=> b!116738 (= e!76547 (= (_2!5121 lt!178366) (_2!5121 lt!178374)))))

(declare-fun b!116739 () Bool)

(declare-fun res!96551 () Bool)

(declare-fun e!76541 () Bool)

(assert (=> b!116739 (=> (not res!96551) (not e!76541))))

(declare-fun thiss!1305 () BitStream!4252)

(declare-datatypes ((Unit!7183 0))(
  ( (Unit!7184) )
))
(declare-datatypes ((tuple2!9714 0))(
  ( (tuple2!9715 (_1!5122 Unit!7183) (_2!5122 BitStream!4252)) )
))
(declare-fun lt!178360 () tuple2!9714)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!116739 (= res!96551 (invariant!0 (currentBit!5431 thiss!1305) (currentByte!5436 thiss!1305) (size!2389 (buf!2799 (_2!5122 lt!178360)))))))

(declare-fun res!96548 () Bool)

(declare-fun e!76542 () Bool)

(assert (=> start!23000 (=> (not res!96548) (not e!76542))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> start!23000 (= res!96548 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!23000 e!76542))

(assert (=> start!23000 true))

(declare-fun e!76543 () Bool)

(declare-fun inv!12 (BitStream!4252) Bool)

(assert (=> start!23000 (and (inv!12 thiss!1305) e!76543)))

(declare-fun b!116740 () Bool)

(declare-fun e!76546 () Bool)

(declare-fun e!76548 () Bool)

(assert (=> b!116740 (= e!76546 e!76548)))

(declare-fun res!96545 () Bool)

(assert (=> b!116740 (=> (not res!96545) (not e!76548))))

(declare-fun lt!178365 () tuple2!9712)

(declare-fun lt!178373 () Bool)

(assert (=> b!116740 (= res!96545 (and (= (_2!5121 lt!178365) lt!178373) (= (_1!5121 lt!178365) (_2!5122 lt!178360))))))

(declare-fun readBitPure!0 (BitStream!4252) tuple2!9712)

(declare-fun readerFrom!0 (BitStream!4252 (_ BitVec 32) (_ BitVec 32)) BitStream!4252)

(assert (=> b!116740 (= lt!178365 (readBitPure!0 (readerFrom!0 (_2!5122 lt!178360) (currentBit!5431 thiss!1305) (currentByte!5436 thiss!1305))))))

(declare-fun b!116741 () Bool)

(declare-fun res!96546 () Bool)

(declare-fun e!76544 () Bool)

(assert (=> b!116741 (=> (not res!96546) (not e!76544))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!116741 (= res!96546 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!116742 () Bool)

(declare-fun array_inv!2191 (array!5264) Bool)

(assert (=> b!116742 (= e!76543 (array_inv!2191 (buf!2799 thiss!1305)))))

(declare-fun b!116743 () Bool)

(declare-fun res!96555 () Bool)

(assert (=> b!116743 (=> (not res!96555) (not e!76544))))

(assert (=> b!116743 (= res!96555 (bvslt i!615 nBits!396))))

(declare-fun b!116744 () Bool)

(declare-fun lt!178364 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!116744 (= e!76548 (= (bitIndex!0 (size!2389 (buf!2799 (_1!5121 lt!178365))) (currentByte!5436 (_1!5121 lt!178365)) (currentBit!5431 (_1!5121 lt!178365))) lt!178364))))

(declare-fun b!116745 () Bool)

(declare-fun e!76545 () Bool)

(assert (=> b!116745 (= e!76545 e!76546)))

(declare-fun res!96550 () Bool)

(assert (=> b!116745 (=> (not res!96550) (not e!76546))))

(declare-fun lt!178368 () (_ BitVec 64))

(assert (=> b!116745 (= res!96550 (= lt!178364 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!178368)))))

(assert (=> b!116745 (= lt!178364 (bitIndex!0 (size!2389 (buf!2799 (_2!5122 lt!178360))) (currentByte!5436 (_2!5122 lt!178360)) (currentBit!5431 (_2!5122 lt!178360))))))

(assert (=> b!116745 (= lt!178368 (bitIndex!0 (size!2389 (buf!2799 thiss!1305)) (currentByte!5436 thiss!1305) (currentBit!5431 thiss!1305)))))

(declare-fun b!116746 () Bool)

(declare-fun lt!178370 () tuple2!9714)

(assert (=> b!116746 (= e!76541 (invariant!0 (currentBit!5431 thiss!1305) (currentByte!5436 thiss!1305) (size!2389 (buf!2799 (_2!5122 lt!178370)))))))

(declare-fun b!116747 () Bool)

(assert (=> b!116747 (= e!76542 e!76544)))

(declare-fun res!96552 () Bool)

(assert (=> b!116747 (=> (not res!96552) (not e!76544))))

(declare-fun lt!178371 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!116747 (= res!96552 (validate_offset_bits!1 ((_ sign_extend 32) (size!2389 (buf!2799 thiss!1305))) ((_ sign_extend 32) (currentByte!5436 thiss!1305)) ((_ sign_extend 32) (currentBit!5431 thiss!1305)) lt!178371))))

(assert (=> b!116747 (= lt!178371 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!116748 () Bool)

(declare-fun res!96547 () Bool)

(assert (=> b!116748 (=> (not res!96547) (not e!76546))))

(declare-fun isPrefixOf!0 (BitStream!4252 BitStream!4252) Bool)

(assert (=> b!116748 (= res!96547 (isPrefixOf!0 thiss!1305 (_2!5122 lt!178360)))))

(declare-fun b!116749 () Bool)

(assert (=> b!116749 (= e!76544 (not (= (size!2389 (buf!2799 (_2!5122 lt!178360))) (size!2389 (buf!2799 (_2!5122 lt!178370))))))))

(declare-datatypes ((tuple2!9716 0))(
  ( (tuple2!9717 (_1!5123 BitStream!4252) (_2!5123 BitStream!4252)) )
))
(declare-fun lt!178359 () tuple2!9716)

(declare-datatypes ((tuple2!9718 0))(
  ( (tuple2!9719 (_1!5124 BitStream!4252) (_2!5124 (_ BitVec 64))) )
))
(declare-fun lt!178367 () tuple2!9718)

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4252 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!9718)

(assert (=> b!116749 (= lt!178367 (readNLeastSignificantBitsLoopPure!0 (_1!5123 lt!178359) nBits!396 i!615 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615))))))))

(assert (=> b!116749 (validate_offset_bits!1 ((_ sign_extend 32) (size!2389 (buf!2799 (_2!5122 lt!178370)))) ((_ sign_extend 32) (currentByte!5436 thiss!1305)) ((_ sign_extend 32) (currentBit!5431 thiss!1305)) lt!178371)))

(declare-fun lt!178362 () Unit!7183)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4252 array!5264 (_ BitVec 64)) Unit!7183)

(assert (=> b!116749 (= lt!178362 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2799 (_2!5122 lt!178370)) lt!178371))))

(assert (=> b!116749 (= (_2!5121 (readBitPure!0 (_1!5123 lt!178359))) lt!178373)))

(declare-fun lt!178369 () tuple2!9716)

(declare-fun reader!0 (BitStream!4252 BitStream!4252) tuple2!9716)

(assert (=> b!116749 (= lt!178369 (reader!0 (_2!5122 lt!178360) (_2!5122 lt!178370)))))

(assert (=> b!116749 (= lt!178359 (reader!0 thiss!1305 (_2!5122 lt!178370)))))

(assert (=> b!116749 e!76547))

(declare-fun res!96553 () Bool)

(assert (=> b!116749 (=> (not res!96553) (not e!76547))))

(assert (=> b!116749 (= res!96553 (= (bitIndex!0 (size!2389 (buf!2799 (_1!5121 lt!178366))) (currentByte!5436 (_1!5121 lt!178366)) (currentBit!5431 (_1!5121 lt!178366))) (bitIndex!0 (size!2389 (buf!2799 (_1!5121 lt!178374))) (currentByte!5436 (_1!5121 lt!178374)) (currentBit!5431 (_1!5121 lt!178374)))))))

(declare-fun lt!178372 () Unit!7183)

(declare-fun lt!178363 () BitStream!4252)

(declare-fun readBitPrefixLemma!0 (BitStream!4252 BitStream!4252) Unit!7183)

(assert (=> b!116749 (= lt!178372 (readBitPrefixLemma!0 lt!178363 (_2!5122 lt!178370)))))

(assert (=> b!116749 (= lt!178374 (readBitPure!0 (BitStream!4253 (buf!2799 (_2!5122 lt!178370)) (currentByte!5436 thiss!1305) (currentBit!5431 thiss!1305))))))

(assert (=> b!116749 (= lt!178366 (readBitPure!0 lt!178363))))

(assert (=> b!116749 (= lt!178363 (BitStream!4253 (buf!2799 (_2!5122 lt!178360)) (currentByte!5436 thiss!1305) (currentBit!5431 thiss!1305)))))

(assert (=> b!116749 e!76541))

(declare-fun res!96549 () Bool)

(assert (=> b!116749 (=> (not res!96549) (not e!76541))))

(assert (=> b!116749 (= res!96549 (isPrefixOf!0 thiss!1305 (_2!5122 lt!178370)))))

(declare-fun lt!178361 () Unit!7183)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4252 BitStream!4252 BitStream!4252) Unit!7183)

(assert (=> b!116749 (= lt!178361 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5122 lt!178360) (_2!5122 lt!178370)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4252 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!9714)

(assert (=> b!116749 (= lt!178370 (appendNLeastSignificantBitsLoop!0 (_2!5122 lt!178360) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!116749 e!76545))

(declare-fun res!96554 () Bool)

(assert (=> b!116749 (=> (not res!96554) (not e!76545))))

(assert (=> b!116749 (= res!96554 (= (size!2389 (buf!2799 thiss!1305)) (size!2389 (buf!2799 (_2!5122 lt!178360)))))))

(declare-fun appendBit!0 (BitStream!4252 Bool) tuple2!9714)

(assert (=> b!116749 (= lt!178360 (appendBit!0 thiss!1305 lt!178373))))

(assert (=> b!116749 (= lt!178373 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!23000 res!96548) b!116747))

(assert (= (and b!116747 res!96552) b!116741))

(assert (= (and b!116741 res!96546) b!116743))

(assert (= (and b!116743 res!96555) b!116749))

(assert (= (and b!116749 res!96554) b!116745))

(assert (= (and b!116745 res!96550) b!116748))

(assert (= (and b!116748 res!96547) b!116740))

(assert (= (and b!116740 res!96545) b!116744))

(assert (= (and b!116749 res!96549) b!116739))

(assert (= (and b!116739 res!96551) b!116746))

(assert (= (and b!116749 res!96553) b!116738))

(assert (= start!23000 b!116742))

(declare-fun m!174827 () Bool)

(assert (=> b!116744 m!174827))

(declare-fun m!174829 () Bool)

(assert (=> b!116749 m!174829))

(declare-fun m!174831 () Bool)

(assert (=> b!116749 m!174831))

(declare-fun m!174833 () Bool)

(assert (=> b!116749 m!174833))

(declare-fun m!174835 () Bool)

(assert (=> b!116749 m!174835))

(declare-fun m!174837 () Bool)

(assert (=> b!116749 m!174837))

(declare-fun m!174839 () Bool)

(assert (=> b!116749 m!174839))

(declare-fun m!174841 () Bool)

(assert (=> b!116749 m!174841))

(declare-fun m!174843 () Bool)

(assert (=> b!116749 m!174843))

(declare-fun m!174845 () Bool)

(assert (=> b!116749 m!174845))

(declare-fun m!174847 () Bool)

(assert (=> b!116749 m!174847))

(declare-fun m!174849 () Bool)

(assert (=> b!116749 m!174849))

(declare-fun m!174851 () Bool)

(assert (=> b!116749 m!174851))

(declare-fun m!174853 () Bool)

(assert (=> b!116749 m!174853))

(declare-fun m!174855 () Bool)

(assert (=> b!116749 m!174855))

(declare-fun m!174857 () Bool)

(assert (=> b!116749 m!174857))

(declare-fun m!174859 () Bool)

(assert (=> b!116749 m!174859))

(declare-fun m!174861 () Bool)

(assert (=> b!116748 m!174861))

(declare-fun m!174863 () Bool)

(assert (=> b!116746 m!174863))

(declare-fun m!174865 () Bool)

(assert (=> b!116742 m!174865))

(declare-fun m!174867 () Bool)

(assert (=> b!116741 m!174867))

(declare-fun m!174869 () Bool)

(assert (=> b!116739 m!174869))

(declare-fun m!174871 () Bool)

(assert (=> b!116745 m!174871))

(declare-fun m!174873 () Bool)

(assert (=> b!116745 m!174873))

(declare-fun m!174875 () Bool)

(assert (=> start!23000 m!174875))

(declare-fun m!174877 () Bool)

(assert (=> b!116747 m!174877))

(declare-fun m!174879 () Bool)

(assert (=> b!116740 m!174879))

(assert (=> b!116740 m!174879))

(declare-fun m!174881 () Bool)

(assert (=> b!116740 m!174881))

(push 1)

(assert (not b!116742))

(assert (not b!116739))

(assert (not b!116749))

(assert (not start!23000))

(assert (not b!116740))

(assert (not b!116745))

(assert (not b!116746))

(assert (not b!116748))

(assert (not b!116741))

(assert (not b!116747))

(assert (not b!116744))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!37392 () Bool)

(declare-datatypes ((tuple2!9740 0))(
  ( (tuple2!9741 (_1!5135 Bool) (_2!5135 BitStream!4252)) )
))
(declare-fun lt!178609 () tuple2!9740)

(declare-fun readBit!0 (BitStream!4252) tuple2!9740)

(assert (=> d!37392 (= lt!178609 (readBit!0 (readerFrom!0 (_2!5122 lt!178360) (currentBit!5431 thiss!1305) (currentByte!5436 thiss!1305))))))

(assert (=> d!37392 (= (readBitPure!0 (readerFrom!0 (_2!5122 lt!178360) (currentBit!5431 thiss!1305) (currentByte!5436 thiss!1305))) (tuple2!9713 (_2!5135 lt!178609) (_1!5135 lt!178609)))))

(declare-fun bs!9055 () Bool)

(assert (= bs!9055 d!37392))

(assert (=> bs!9055 m!174879))

(declare-fun m!175101 () Bool)

(assert (=> bs!9055 m!175101))

(assert (=> b!116740 d!37392))

(declare-fun d!37394 () Bool)

(declare-fun e!76631 () Bool)

(assert (=> d!37394 e!76631))

(declare-fun res!96667 () Bool)

(assert (=> d!37394 (=> (not res!96667) (not e!76631))))

(assert (=> d!37394 (= res!96667 (invariant!0 (currentBit!5431 (_2!5122 lt!178360)) (currentByte!5436 (_2!5122 lt!178360)) (size!2389 (buf!2799 (_2!5122 lt!178360)))))))

(assert (=> d!37394 (= (readerFrom!0 (_2!5122 lt!178360) (currentBit!5431 thiss!1305) (currentByte!5436 thiss!1305)) (BitStream!4253 (buf!2799 (_2!5122 lt!178360)) (currentByte!5436 thiss!1305) (currentBit!5431 thiss!1305)))))

(declare-fun b!116875 () Bool)

(assert (=> b!116875 (= e!76631 (invariant!0 (currentBit!5431 thiss!1305) (currentByte!5436 thiss!1305) (size!2389 (buf!2799 (_2!5122 lt!178360)))))))

(assert (= (and d!37394 res!96667) b!116875))

(declare-fun m!175103 () Bool)

(assert (=> d!37394 m!175103))

(assert (=> b!116875 m!174869))

(assert (=> b!116740 d!37394))

(declare-fun d!37396 () Bool)

(declare-fun e!76634 () Bool)

(assert (=> d!37396 e!76634))

(declare-fun res!96672 () Bool)

(assert (=> d!37396 (=> (not res!96672) (not e!76634))))

(declare-fun lt!178624 () (_ BitVec 64))

(declare-fun lt!178622 () (_ BitVec 64))

(declare-fun lt!178623 () (_ BitVec 64))

(assert (=> d!37396 (= res!96672 (= lt!178624 (bvsub lt!178622 lt!178623)))))

(assert (=> d!37396 (or (= (bvand lt!178622 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!178623 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!178622 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!178622 lt!178623) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!37396 (= lt!178623 (remainingBits!0 ((_ sign_extend 32) (size!2389 (buf!2799 (_2!5122 lt!178360)))) ((_ sign_extend 32) (currentByte!5436 (_2!5122 lt!178360))) ((_ sign_extend 32) (currentBit!5431 (_2!5122 lt!178360)))))))

(declare-fun lt!178626 () (_ BitVec 64))

(declare-fun lt!178625 () (_ BitVec 64))

(assert (=> d!37396 (= lt!178622 (bvmul lt!178626 lt!178625))))

(assert (=> d!37396 (or (= lt!178626 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!178625 (bvsdiv (bvmul lt!178626 lt!178625) lt!178626)))))

(assert (=> d!37396 (= lt!178625 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!37396 (= lt!178626 ((_ sign_extend 32) (size!2389 (buf!2799 (_2!5122 lt!178360)))))))

(assert (=> d!37396 (= lt!178624 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5436 (_2!5122 lt!178360))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5431 (_2!5122 lt!178360)))))))

(assert (=> d!37396 (invariant!0 (currentBit!5431 (_2!5122 lt!178360)) (currentByte!5436 (_2!5122 lt!178360)) (size!2389 (buf!2799 (_2!5122 lt!178360))))))

(assert (=> d!37396 (= (bitIndex!0 (size!2389 (buf!2799 (_2!5122 lt!178360))) (currentByte!5436 (_2!5122 lt!178360)) (currentBit!5431 (_2!5122 lt!178360))) lt!178624)))

(declare-fun b!116880 () Bool)

(declare-fun res!96673 () Bool)

(assert (=> b!116880 (=> (not res!96673) (not e!76634))))

(assert (=> b!116880 (= res!96673 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!178624))))

(declare-fun b!116881 () Bool)

(declare-fun lt!178627 () (_ BitVec 64))

(assert (=> b!116881 (= e!76634 (bvsle lt!178624 (bvmul lt!178627 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!116881 (or (= lt!178627 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!178627 #b0000000000000000000000000000000000000000000000000000000000001000) lt!178627)))))

(assert (=> b!116881 (= lt!178627 ((_ sign_extend 32) (size!2389 (buf!2799 (_2!5122 lt!178360)))))))

(assert (= (and d!37396 res!96672) b!116880))

(assert (= (and b!116880 res!96673) b!116881))

(declare-fun m!175105 () Bool)

(assert (=> d!37396 m!175105))

(assert (=> d!37396 m!175103))

(assert (=> b!116745 d!37396))

(declare-fun d!37398 () Bool)

(declare-fun e!76635 () Bool)

(assert (=> d!37398 e!76635))

(declare-fun res!96674 () Bool)

(assert (=> d!37398 (=> (not res!96674) (not e!76635))))

(declare-fun lt!178629 () (_ BitVec 64))

(declare-fun lt!178628 () (_ BitVec 64))

(declare-fun lt!178630 () (_ BitVec 64))

(assert (=> d!37398 (= res!96674 (= lt!178630 (bvsub lt!178628 lt!178629)))))

(assert (=> d!37398 (or (= (bvand lt!178628 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!178629 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!178628 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!178628 lt!178629) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!37398 (= lt!178629 (remainingBits!0 ((_ sign_extend 32) (size!2389 (buf!2799 thiss!1305))) ((_ sign_extend 32) (currentByte!5436 thiss!1305)) ((_ sign_extend 32) (currentBit!5431 thiss!1305))))))

(declare-fun lt!178632 () (_ BitVec 64))

(declare-fun lt!178631 () (_ BitVec 64))

(assert (=> d!37398 (= lt!178628 (bvmul lt!178632 lt!178631))))

(assert (=> d!37398 (or (= lt!178632 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!178631 (bvsdiv (bvmul lt!178632 lt!178631) lt!178632)))))

(assert (=> d!37398 (= lt!178631 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!37398 (= lt!178632 ((_ sign_extend 32) (size!2389 (buf!2799 thiss!1305))))))

(assert (=> d!37398 (= lt!178630 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5436 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5431 thiss!1305))))))

(assert (=> d!37398 (invariant!0 (currentBit!5431 thiss!1305) (currentByte!5436 thiss!1305) (size!2389 (buf!2799 thiss!1305)))))

(assert (=> d!37398 (= (bitIndex!0 (size!2389 (buf!2799 thiss!1305)) (currentByte!5436 thiss!1305) (currentBit!5431 thiss!1305)) lt!178630)))

(declare-fun b!116882 () Bool)

(declare-fun res!96675 () Bool)

(assert (=> b!116882 (=> (not res!96675) (not e!76635))))

(assert (=> b!116882 (= res!96675 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!178630))))

(declare-fun b!116883 () Bool)

(declare-fun lt!178633 () (_ BitVec 64))

(assert (=> b!116883 (= e!76635 (bvsle lt!178630 (bvmul lt!178633 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!116883 (or (= lt!178633 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!178633 #b0000000000000000000000000000000000000000000000000000000000001000) lt!178633)))))

(assert (=> b!116883 (= lt!178633 ((_ sign_extend 32) (size!2389 (buf!2799 thiss!1305))))))

(assert (= (and d!37398 res!96674) b!116882))

(assert (= (and b!116882 res!96675) b!116883))

(declare-fun m!175107 () Bool)

(assert (=> d!37398 m!175107))

(declare-fun m!175109 () Bool)

(assert (=> d!37398 m!175109))

(assert (=> b!116745 d!37398))

(declare-fun d!37400 () Bool)

(assert (=> d!37400 (= (invariant!0 (currentBit!5431 thiss!1305) (currentByte!5436 thiss!1305) (size!2389 (buf!2799 (_2!5122 lt!178370)))) (and (bvsge (currentBit!5431 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5431 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5436 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5436 thiss!1305) (size!2389 (buf!2799 (_2!5122 lt!178370)))) (and (= (currentBit!5431 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5436 thiss!1305) (size!2389 (buf!2799 (_2!5122 lt!178370))))))))))

(assert (=> b!116746 d!37400))

(declare-fun d!37402 () Bool)

(declare-fun e!76636 () Bool)

(assert (=> d!37402 e!76636))

(declare-fun res!96676 () Bool)

(assert (=> d!37402 (=> (not res!96676) (not e!76636))))

(declare-fun lt!178636 () (_ BitVec 64))

(declare-fun lt!178635 () (_ BitVec 64))

(declare-fun lt!178634 () (_ BitVec 64))

(assert (=> d!37402 (= res!96676 (= lt!178636 (bvsub lt!178634 lt!178635)))))

(assert (=> d!37402 (or (= (bvand lt!178634 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!178635 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!178634 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!178634 lt!178635) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!37402 (= lt!178635 (remainingBits!0 ((_ sign_extend 32) (size!2389 (buf!2799 (_1!5121 lt!178365)))) ((_ sign_extend 32) (currentByte!5436 (_1!5121 lt!178365))) ((_ sign_extend 32) (currentBit!5431 (_1!5121 lt!178365)))))))

(declare-fun lt!178638 () (_ BitVec 64))

(declare-fun lt!178637 () (_ BitVec 64))

(assert (=> d!37402 (= lt!178634 (bvmul lt!178638 lt!178637))))

(assert (=> d!37402 (or (= lt!178638 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!178637 (bvsdiv (bvmul lt!178638 lt!178637) lt!178638)))))

(assert (=> d!37402 (= lt!178637 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!37402 (= lt!178638 ((_ sign_extend 32) (size!2389 (buf!2799 (_1!5121 lt!178365)))))))

(assert (=> d!37402 (= lt!178636 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5436 (_1!5121 lt!178365))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5431 (_1!5121 lt!178365)))))))

(assert (=> d!37402 (invariant!0 (currentBit!5431 (_1!5121 lt!178365)) (currentByte!5436 (_1!5121 lt!178365)) (size!2389 (buf!2799 (_1!5121 lt!178365))))))

(assert (=> d!37402 (= (bitIndex!0 (size!2389 (buf!2799 (_1!5121 lt!178365))) (currentByte!5436 (_1!5121 lt!178365)) (currentBit!5431 (_1!5121 lt!178365))) lt!178636)))

(declare-fun b!116884 () Bool)

(declare-fun res!96677 () Bool)

(assert (=> b!116884 (=> (not res!96677) (not e!76636))))

(assert (=> b!116884 (= res!96677 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!178636))))

(declare-fun b!116885 () Bool)

(declare-fun lt!178639 () (_ BitVec 64))

(assert (=> b!116885 (= e!76636 (bvsle lt!178636 (bvmul lt!178639 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!116885 (or (= lt!178639 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!178639 #b0000000000000000000000000000000000000000000000000000000000001000) lt!178639)))))

(assert (=> b!116885 (= lt!178639 ((_ sign_extend 32) (size!2389 (buf!2799 (_1!5121 lt!178365)))))))

(assert (= (and d!37402 res!96676) b!116884))

(assert (= (and b!116884 res!96677) b!116885))

(declare-fun m!175111 () Bool)

(assert (=> d!37402 m!175111))

(declare-fun m!175113 () Bool)

(assert (=> d!37402 m!175113))

(assert (=> b!116744 d!37402))

(declare-fun d!37404 () Bool)

(assert (=> d!37404 (= (onesLSBLong!0 (bvsub nBits!396 i!615)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!396 i!615)))))))

(assert (=> b!116749 d!37404))

(declare-fun d!37406 () Bool)

(declare-fun lt!178640 () tuple2!9740)

(assert (=> d!37406 (= lt!178640 (readBit!0 lt!178363))))

(assert (=> d!37406 (= (readBitPure!0 lt!178363) (tuple2!9713 (_2!5135 lt!178640) (_1!5135 lt!178640)))))

(declare-fun bs!9056 () Bool)

(assert (= bs!9056 d!37406))

(declare-fun m!175115 () Bool)

(assert (=> bs!9056 m!175115))

(assert (=> b!116749 d!37406))

(declare-fun d!37408 () Bool)

(declare-fun res!96686 () Bool)

(declare-fun e!76641 () Bool)

(assert (=> d!37408 (=> (not res!96686) (not e!76641))))

(assert (=> d!37408 (= res!96686 (= (size!2389 (buf!2799 thiss!1305)) (size!2389 (buf!2799 (_2!5122 lt!178370)))))))

(assert (=> d!37408 (= (isPrefixOf!0 thiss!1305 (_2!5122 lt!178370)) e!76641)))

(declare-fun b!116892 () Bool)

(declare-fun res!96684 () Bool)

(assert (=> b!116892 (=> (not res!96684) (not e!76641))))

(assert (=> b!116892 (= res!96684 (bvsle (bitIndex!0 (size!2389 (buf!2799 thiss!1305)) (currentByte!5436 thiss!1305) (currentBit!5431 thiss!1305)) (bitIndex!0 (size!2389 (buf!2799 (_2!5122 lt!178370))) (currentByte!5436 (_2!5122 lt!178370)) (currentBit!5431 (_2!5122 lt!178370)))))))

(declare-fun b!116893 () Bool)

(declare-fun e!76642 () Bool)

(assert (=> b!116893 (= e!76641 e!76642)))

(declare-fun res!96685 () Bool)

(assert (=> b!116893 (=> res!96685 e!76642)))

(assert (=> b!116893 (= res!96685 (= (size!2389 (buf!2799 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!116894 () Bool)

(declare-fun arrayBitRangesEq!0 (array!5264 array!5264 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!116894 (= e!76642 (arrayBitRangesEq!0 (buf!2799 thiss!1305) (buf!2799 (_2!5122 lt!178370)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2389 (buf!2799 thiss!1305)) (currentByte!5436 thiss!1305) (currentBit!5431 thiss!1305))))))

(assert (= (and d!37408 res!96686) b!116892))

(assert (= (and b!116892 res!96684) b!116893))

(assert (= (and b!116893 (not res!96685)) b!116894))

(assert (=> b!116892 m!174873))

(declare-fun m!175117 () Bool)

(assert (=> b!116892 m!175117))

(assert (=> b!116894 m!174873))

(assert (=> b!116894 m!174873))

(declare-fun m!175119 () Bool)

(assert (=> b!116894 m!175119))

(assert (=> b!116749 d!37408))

(declare-fun d!37412 () Bool)

(assert (=> d!37412 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2389 (buf!2799 (_2!5122 lt!178370)))) ((_ sign_extend 32) (currentByte!5436 thiss!1305)) ((_ sign_extend 32) (currentBit!5431 thiss!1305)) lt!178371) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2389 (buf!2799 (_2!5122 lt!178370)))) ((_ sign_extend 32) (currentByte!5436 thiss!1305)) ((_ sign_extend 32) (currentBit!5431 thiss!1305))) lt!178371))))

(declare-fun bs!9057 () Bool)

(assert (= bs!9057 d!37412))

(declare-fun m!175121 () Bool)

(assert (=> bs!9057 m!175121))

(assert (=> b!116749 d!37412))

(declare-fun d!37414 () Bool)

(declare-fun lt!178641 () tuple2!9740)

(assert (=> d!37414 (= lt!178641 (readBit!0 (BitStream!4253 (buf!2799 (_2!5122 lt!178370)) (currentByte!5436 thiss!1305) (currentBit!5431 thiss!1305))))))

(assert (=> d!37414 (= (readBitPure!0 (BitStream!4253 (buf!2799 (_2!5122 lt!178370)) (currentByte!5436 thiss!1305) (currentBit!5431 thiss!1305))) (tuple2!9713 (_2!5135 lt!178641) (_1!5135 lt!178641)))))

(declare-fun bs!9058 () Bool)

(assert (= bs!9058 d!37414))

(declare-fun m!175123 () Bool)

(assert (=> bs!9058 m!175123))

(assert (=> b!116749 d!37414))

(declare-fun d!37416 () Bool)

(declare-fun e!76651 () Bool)

(assert (=> d!37416 e!76651))

(declare-fun res!96698 () Bool)

(assert (=> d!37416 (=> (not res!96698) (not e!76651))))

(declare-fun lt!178653 () tuple2!9712)

(declare-fun lt!178656 () tuple2!9712)

(assert (=> d!37416 (= res!96698 (= (bitIndex!0 (size!2389 (buf!2799 (_1!5121 lt!178653))) (currentByte!5436 (_1!5121 lt!178653)) (currentBit!5431 (_1!5121 lt!178653))) (bitIndex!0 (size!2389 (buf!2799 (_1!5121 lt!178656))) (currentByte!5436 (_1!5121 lt!178656)) (currentBit!5431 (_1!5121 lt!178656)))))))

(declare-fun lt!178654 () Unit!7183)

(declare-fun lt!178655 () BitStream!4252)

(declare-fun choose!50 (BitStream!4252 BitStream!4252 BitStream!4252 tuple2!9712 tuple2!9712 BitStream!4252 Bool tuple2!9712 tuple2!9712 BitStream!4252 Bool) Unit!7183)

(assert (=> d!37416 (= lt!178654 (choose!50 lt!178363 (_2!5122 lt!178370) lt!178655 lt!178653 (tuple2!9713 (_1!5121 lt!178653) (_2!5121 lt!178653)) (_1!5121 lt!178653) (_2!5121 lt!178653) lt!178656 (tuple2!9713 (_1!5121 lt!178656) (_2!5121 lt!178656)) (_1!5121 lt!178656) (_2!5121 lt!178656)))))

(assert (=> d!37416 (= lt!178656 (readBitPure!0 lt!178655))))

(assert (=> d!37416 (= lt!178653 (readBitPure!0 lt!178363))))

(assert (=> d!37416 (= lt!178655 (BitStream!4253 (buf!2799 (_2!5122 lt!178370)) (currentByte!5436 lt!178363) (currentBit!5431 lt!178363)))))

(assert (=> d!37416 (invariant!0 (currentBit!5431 lt!178363) (currentByte!5436 lt!178363) (size!2389 (buf!2799 (_2!5122 lt!178370))))))

(assert (=> d!37416 (= (readBitPrefixLemma!0 lt!178363 (_2!5122 lt!178370)) lt!178654)))

(declare-fun b!116906 () Bool)

(assert (=> b!116906 (= e!76651 (= (_2!5121 lt!178653) (_2!5121 lt!178656)))))

(assert (= (and d!37416 res!96698) b!116906))

(declare-fun m!175129 () Bool)

(assert (=> d!37416 m!175129))

(declare-fun m!175131 () Bool)

(assert (=> d!37416 m!175131))

(declare-fun m!175133 () Bool)

(assert (=> d!37416 m!175133))

(declare-fun m!175135 () Bool)

(assert (=> d!37416 m!175135))

(assert (=> d!37416 m!174843))

(declare-fun m!175137 () Bool)

(assert (=> d!37416 m!175137))

(assert (=> b!116749 d!37416))

(declare-datatypes ((tuple2!9742 0))(
  ( (tuple2!9743 (_1!5136 (_ BitVec 64)) (_2!5136 BitStream!4252)) )
))
(declare-fun lt!178659 () tuple2!9742)

(declare-fun d!37422 () Bool)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!4252 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!9742)

(assert (=> d!37422 (= lt!178659 (readNLeastSignificantBitsLoop!0 (_1!5123 lt!178359) nBits!396 i!615 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615))))))))

(assert (=> d!37422 (= (readNLeastSignificantBitsLoopPure!0 (_1!5123 lt!178359) nBits!396 i!615 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615))))) (tuple2!9719 (_2!5136 lt!178659) (_1!5136 lt!178659)))))

(declare-fun bs!9061 () Bool)

(assert (= bs!9061 d!37422))

(declare-fun m!175143 () Bool)

(assert (=> bs!9061 m!175143))

(assert (=> b!116749 d!37422))

(declare-fun b!116928 () Bool)

(declare-fun e!76663 () Bool)

(declare-fun lt!178689 () tuple2!9712)

(declare-fun lt!178688 () tuple2!9714)

(assert (=> b!116928 (= e!76663 (= (bitIndex!0 (size!2389 (buf!2799 (_1!5121 lt!178689))) (currentByte!5436 (_1!5121 lt!178689)) (currentBit!5431 (_1!5121 lt!178689))) (bitIndex!0 (size!2389 (buf!2799 (_2!5122 lt!178688))) (currentByte!5436 (_2!5122 lt!178688)) (currentBit!5431 (_2!5122 lt!178688)))))))

(declare-fun d!37427 () Bool)

(declare-fun e!76662 () Bool)

(assert (=> d!37427 e!76662))

(declare-fun res!96717 () Bool)

(assert (=> d!37427 (=> (not res!96717) (not e!76662))))

(assert (=> d!37427 (= res!96717 (= (size!2389 (buf!2799 thiss!1305)) (size!2389 (buf!2799 (_2!5122 lt!178688)))))))

(declare-fun choose!16 (BitStream!4252 Bool) tuple2!9714)

(assert (=> d!37427 (= lt!178688 (choose!16 thiss!1305 lt!178373))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!37427 (validate_offset_bit!0 ((_ sign_extend 32) (size!2389 (buf!2799 thiss!1305))) ((_ sign_extend 32) (currentByte!5436 thiss!1305)) ((_ sign_extend 32) (currentBit!5431 thiss!1305)))))

(assert (=> d!37427 (= (appendBit!0 thiss!1305 lt!178373) lt!178688)))

(declare-fun b!116925 () Bool)

(declare-fun res!96720 () Bool)

(assert (=> b!116925 (=> (not res!96720) (not e!76662))))

(declare-fun lt!178687 () (_ BitVec 64))

(declare-fun lt!178690 () (_ BitVec 64))

(assert (=> b!116925 (= res!96720 (= (bitIndex!0 (size!2389 (buf!2799 (_2!5122 lt!178688))) (currentByte!5436 (_2!5122 lt!178688)) (currentBit!5431 (_2!5122 lt!178688))) (bvadd lt!178687 lt!178690)))))

(assert (=> b!116925 (or (not (= (bvand lt!178687 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!178690 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!178687 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!178687 lt!178690) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!116925 (= lt!178690 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!116925 (= lt!178687 (bitIndex!0 (size!2389 (buf!2799 thiss!1305)) (currentByte!5436 thiss!1305) (currentBit!5431 thiss!1305)))))

(declare-fun b!116927 () Bool)

(assert (=> b!116927 (= e!76662 e!76663)))

(declare-fun res!96718 () Bool)

(assert (=> b!116927 (=> (not res!96718) (not e!76663))))

(assert (=> b!116927 (= res!96718 (and (= (_2!5121 lt!178689) lt!178373) (= (_1!5121 lt!178689) (_2!5122 lt!178688))))))

(assert (=> b!116927 (= lt!178689 (readBitPure!0 (readerFrom!0 (_2!5122 lt!178688) (currentBit!5431 thiss!1305) (currentByte!5436 thiss!1305))))))

(declare-fun b!116926 () Bool)

(declare-fun res!96719 () Bool)

(assert (=> b!116926 (=> (not res!96719) (not e!76662))))

(assert (=> b!116926 (= res!96719 (isPrefixOf!0 thiss!1305 (_2!5122 lt!178688)))))

(assert (= (and d!37427 res!96717) b!116925))

(assert (= (and b!116925 res!96720) b!116926))

(assert (= (and b!116926 res!96719) b!116927))

(assert (= (and b!116927 res!96718) b!116928))

(declare-fun m!175153 () Bool)

(assert (=> b!116926 m!175153))

(declare-fun m!175155 () Bool)

(assert (=> d!37427 m!175155))

(declare-fun m!175157 () Bool)

(assert (=> d!37427 m!175157))

(declare-fun m!175159 () Bool)

(assert (=> b!116925 m!175159))

(assert (=> b!116925 m!174873))

(declare-fun m!175161 () Bool)

(assert (=> b!116928 m!175161))

(assert (=> b!116928 m!175159))

(declare-fun m!175163 () Bool)

(assert (=> b!116927 m!175163))

(assert (=> b!116927 m!175163))

(declare-fun m!175165 () Bool)

(assert (=> b!116927 m!175165))

(assert (=> b!116749 d!37427))

(declare-fun b!116947 () Bool)

(declare-fun e!76673 () Unit!7183)

(declare-fun lt!178775 () Unit!7183)

(assert (=> b!116947 (= e!76673 lt!178775)))

(declare-fun lt!178771 () (_ BitVec 64))

(assert (=> b!116947 (= lt!178771 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!178778 () (_ BitVec 64))

(assert (=> b!116947 (= lt!178778 (bitIndex!0 (size!2389 (buf!2799 thiss!1305)) (currentByte!5436 thiss!1305) (currentBit!5431 thiss!1305)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!5264 array!5264 (_ BitVec 64) (_ BitVec 64)) Unit!7183)

(assert (=> b!116947 (= lt!178775 (arrayBitRangesEqSymmetric!0 (buf!2799 thiss!1305) (buf!2799 (_2!5122 lt!178370)) lt!178771 lt!178778))))

(assert (=> b!116947 (arrayBitRangesEq!0 (buf!2799 (_2!5122 lt!178370)) (buf!2799 thiss!1305) lt!178771 lt!178778)))

(declare-fun b!116948 () Bool)

(declare-fun res!96734 () Bool)

(declare-fun e!76674 () Bool)

(assert (=> b!116948 (=> (not res!96734) (not e!76674))))

(declare-fun lt!178784 () tuple2!9716)

(assert (=> b!116948 (= res!96734 (isPrefixOf!0 (_1!5123 lt!178784) thiss!1305))))

(declare-fun b!116949 () Bool)

(declare-fun res!96735 () Bool)

(assert (=> b!116949 (=> (not res!96735) (not e!76674))))

(assert (=> b!116949 (= res!96735 (isPrefixOf!0 (_2!5123 lt!178784) (_2!5122 lt!178370)))))

(declare-fun b!116950 () Bool)

(declare-fun Unit!7197 () Unit!7183)

(assert (=> b!116950 (= e!76673 Unit!7197)))

(declare-fun b!116946 () Bool)

(declare-fun lt!178779 () (_ BitVec 64))

(declare-fun lt!178781 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!4252 (_ BitVec 64)) BitStream!4252)

(assert (=> b!116946 (= e!76674 (= (_1!5123 lt!178784) (withMovedBitIndex!0 (_2!5123 lt!178784) (bvsub lt!178781 lt!178779))))))

(assert (=> b!116946 (or (= (bvand lt!178781 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!178779 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!178781 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!178781 lt!178779) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!116946 (= lt!178779 (bitIndex!0 (size!2389 (buf!2799 (_2!5122 lt!178370))) (currentByte!5436 (_2!5122 lt!178370)) (currentBit!5431 (_2!5122 lt!178370))))))

(assert (=> b!116946 (= lt!178781 (bitIndex!0 (size!2389 (buf!2799 thiss!1305)) (currentByte!5436 thiss!1305) (currentBit!5431 thiss!1305)))))

(declare-fun d!37444 () Bool)

(assert (=> d!37444 e!76674))

(declare-fun res!96736 () Bool)

(assert (=> d!37444 (=> (not res!96736) (not e!76674))))

(assert (=> d!37444 (= res!96736 (isPrefixOf!0 (_1!5123 lt!178784) (_2!5123 lt!178784)))))

(declare-fun lt!178777 () BitStream!4252)

(assert (=> d!37444 (= lt!178784 (tuple2!9717 lt!178777 (_2!5122 lt!178370)))))

(declare-fun lt!178765 () Unit!7183)

(declare-fun lt!178770 () Unit!7183)

(assert (=> d!37444 (= lt!178765 lt!178770)))

(assert (=> d!37444 (isPrefixOf!0 lt!178777 (_2!5122 lt!178370))))

(assert (=> d!37444 (= lt!178770 (lemmaIsPrefixTransitive!0 lt!178777 (_2!5122 lt!178370) (_2!5122 lt!178370)))))

(declare-fun lt!178782 () Unit!7183)

(declare-fun lt!178766 () Unit!7183)

(assert (=> d!37444 (= lt!178782 lt!178766)))

(assert (=> d!37444 (isPrefixOf!0 lt!178777 (_2!5122 lt!178370))))

(assert (=> d!37444 (= lt!178766 (lemmaIsPrefixTransitive!0 lt!178777 thiss!1305 (_2!5122 lt!178370)))))

(declare-fun lt!178783 () Unit!7183)

(assert (=> d!37444 (= lt!178783 e!76673)))

(declare-fun c!7037 () Bool)

(assert (=> d!37444 (= c!7037 (not (= (size!2389 (buf!2799 thiss!1305)) #b00000000000000000000000000000000)))))

(declare-fun lt!178774 () Unit!7183)

(declare-fun lt!178780 () Unit!7183)

(assert (=> d!37444 (= lt!178774 lt!178780)))

(assert (=> d!37444 (isPrefixOf!0 (_2!5122 lt!178370) (_2!5122 lt!178370))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4252) Unit!7183)

(assert (=> d!37444 (= lt!178780 (lemmaIsPrefixRefl!0 (_2!5122 lt!178370)))))

(declare-fun lt!178769 () Unit!7183)

(declare-fun lt!178772 () Unit!7183)

(assert (=> d!37444 (= lt!178769 lt!178772)))

(assert (=> d!37444 (= lt!178772 (lemmaIsPrefixRefl!0 (_2!5122 lt!178370)))))

(declare-fun lt!178768 () Unit!7183)

(declare-fun lt!178773 () Unit!7183)

(assert (=> d!37444 (= lt!178768 lt!178773)))

(assert (=> d!37444 (isPrefixOf!0 lt!178777 lt!178777)))

(assert (=> d!37444 (= lt!178773 (lemmaIsPrefixRefl!0 lt!178777))))

(declare-fun lt!178776 () Unit!7183)

(declare-fun lt!178767 () Unit!7183)

(assert (=> d!37444 (= lt!178776 lt!178767)))

(assert (=> d!37444 (isPrefixOf!0 thiss!1305 thiss!1305)))

(assert (=> d!37444 (= lt!178767 (lemmaIsPrefixRefl!0 thiss!1305))))

(assert (=> d!37444 (= lt!178777 (BitStream!4253 (buf!2799 (_2!5122 lt!178370)) (currentByte!5436 thiss!1305) (currentBit!5431 thiss!1305)))))

(assert (=> d!37444 (isPrefixOf!0 thiss!1305 (_2!5122 lt!178370))))

(assert (=> d!37444 (= (reader!0 thiss!1305 (_2!5122 lt!178370)) lt!178784)))

(assert (= (and d!37444 c!7037) b!116947))

(assert (= (and d!37444 (not c!7037)) b!116950))

(assert (= (and d!37444 res!96736) b!116948))

(assert (= (and b!116948 res!96734) b!116949))

(assert (= (and b!116949 res!96735) b!116946))

(assert (=> b!116947 m!174873))

(declare-fun m!175195 () Bool)

(assert (=> b!116947 m!175195))

(declare-fun m!175197 () Bool)

(assert (=> b!116947 m!175197))

(declare-fun m!175199 () Bool)

(assert (=> b!116949 m!175199))

(declare-fun m!175201 () Bool)

(assert (=> b!116948 m!175201))

(declare-fun m!175203 () Bool)

(assert (=> b!116946 m!175203))

(assert (=> b!116946 m!175117))

(assert (=> b!116946 m!174873))

(declare-fun m!175205 () Bool)

(assert (=> d!37444 m!175205))

(declare-fun m!175207 () Bool)

(assert (=> d!37444 m!175207))

(declare-fun m!175209 () Bool)

(assert (=> d!37444 m!175209))

(declare-fun m!175211 () Bool)

(assert (=> d!37444 m!175211))

(declare-fun m!175213 () Bool)

(assert (=> d!37444 m!175213))

(declare-fun m!175215 () Bool)

(assert (=> d!37444 m!175215))

(declare-fun m!175217 () Bool)

(assert (=> d!37444 m!175217))

(assert (=> d!37444 m!174829))

(declare-fun m!175219 () Bool)

(assert (=> d!37444 m!175219))

(declare-fun m!175221 () Bool)

(assert (=> d!37444 m!175221))

(declare-fun m!175223 () Bool)

(assert (=> d!37444 m!175223))

(assert (=> b!116749 d!37444))

(declare-fun b!116952 () Bool)

(declare-fun e!76675 () Unit!7183)

(declare-fun lt!178795 () Unit!7183)

(assert (=> b!116952 (= e!76675 lt!178795)))

(declare-fun lt!178791 () (_ BitVec 64))

(assert (=> b!116952 (= lt!178791 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!178798 () (_ BitVec 64))

(assert (=> b!116952 (= lt!178798 (bitIndex!0 (size!2389 (buf!2799 (_2!5122 lt!178360))) (currentByte!5436 (_2!5122 lt!178360)) (currentBit!5431 (_2!5122 lt!178360))))))

(assert (=> b!116952 (= lt!178795 (arrayBitRangesEqSymmetric!0 (buf!2799 (_2!5122 lt!178360)) (buf!2799 (_2!5122 lt!178370)) lt!178791 lt!178798))))

(assert (=> b!116952 (arrayBitRangesEq!0 (buf!2799 (_2!5122 lt!178370)) (buf!2799 (_2!5122 lt!178360)) lt!178791 lt!178798)))

(declare-fun b!116953 () Bool)

(declare-fun res!96737 () Bool)

(declare-fun e!76676 () Bool)

(assert (=> b!116953 (=> (not res!96737) (not e!76676))))

(declare-fun lt!178804 () tuple2!9716)

(assert (=> b!116953 (= res!96737 (isPrefixOf!0 (_1!5123 lt!178804) (_2!5122 lt!178360)))))

(declare-fun b!116954 () Bool)

(declare-fun res!96738 () Bool)

(assert (=> b!116954 (=> (not res!96738) (not e!76676))))

(assert (=> b!116954 (= res!96738 (isPrefixOf!0 (_2!5123 lt!178804) (_2!5122 lt!178370)))))

(declare-fun b!116955 () Bool)

(declare-fun Unit!7198 () Unit!7183)

(assert (=> b!116955 (= e!76675 Unit!7198)))

(declare-fun lt!178799 () (_ BitVec 64))

(declare-fun lt!178801 () (_ BitVec 64))

(declare-fun b!116951 () Bool)

(assert (=> b!116951 (= e!76676 (= (_1!5123 lt!178804) (withMovedBitIndex!0 (_2!5123 lt!178804) (bvsub lt!178801 lt!178799))))))

(assert (=> b!116951 (or (= (bvand lt!178801 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!178799 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!178801 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!178801 lt!178799) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!116951 (= lt!178799 (bitIndex!0 (size!2389 (buf!2799 (_2!5122 lt!178370))) (currentByte!5436 (_2!5122 lt!178370)) (currentBit!5431 (_2!5122 lt!178370))))))

(assert (=> b!116951 (= lt!178801 (bitIndex!0 (size!2389 (buf!2799 (_2!5122 lt!178360))) (currentByte!5436 (_2!5122 lt!178360)) (currentBit!5431 (_2!5122 lt!178360))))))

(declare-fun d!37462 () Bool)

(assert (=> d!37462 e!76676))

(declare-fun res!96739 () Bool)

(assert (=> d!37462 (=> (not res!96739) (not e!76676))))

(assert (=> d!37462 (= res!96739 (isPrefixOf!0 (_1!5123 lt!178804) (_2!5123 lt!178804)))))

(declare-fun lt!178797 () BitStream!4252)

(assert (=> d!37462 (= lt!178804 (tuple2!9717 lt!178797 (_2!5122 lt!178370)))))

(declare-fun lt!178785 () Unit!7183)

(declare-fun lt!178790 () Unit!7183)

(assert (=> d!37462 (= lt!178785 lt!178790)))

(assert (=> d!37462 (isPrefixOf!0 lt!178797 (_2!5122 lt!178370))))

(assert (=> d!37462 (= lt!178790 (lemmaIsPrefixTransitive!0 lt!178797 (_2!5122 lt!178370) (_2!5122 lt!178370)))))

(declare-fun lt!178802 () Unit!7183)

(declare-fun lt!178786 () Unit!7183)

(assert (=> d!37462 (= lt!178802 lt!178786)))

(assert (=> d!37462 (isPrefixOf!0 lt!178797 (_2!5122 lt!178370))))

(assert (=> d!37462 (= lt!178786 (lemmaIsPrefixTransitive!0 lt!178797 (_2!5122 lt!178360) (_2!5122 lt!178370)))))

(declare-fun lt!178803 () Unit!7183)

(assert (=> d!37462 (= lt!178803 e!76675)))

(declare-fun c!7038 () Bool)

(assert (=> d!37462 (= c!7038 (not (= (size!2389 (buf!2799 (_2!5122 lt!178360))) #b00000000000000000000000000000000)))))

(declare-fun lt!178794 () Unit!7183)

(declare-fun lt!178800 () Unit!7183)

(assert (=> d!37462 (= lt!178794 lt!178800)))

(assert (=> d!37462 (isPrefixOf!0 (_2!5122 lt!178370) (_2!5122 lt!178370))))

(assert (=> d!37462 (= lt!178800 (lemmaIsPrefixRefl!0 (_2!5122 lt!178370)))))

(declare-fun lt!178789 () Unit!7183)

(declare-fun lt!178792 () Unit!7183)

(assert (=> d!37462 (= lt!178789 lt!178792)))

(assert (=> d!37462 (= lt!178792 (lemmaIsPrefixRefl!0 (_2!5122 lt!178370)))))

(declare-fun lt!178788 () Unit!7183)

(declare-fun lt!178793 () Unit!7183)

(assert (=> d!37462 (= lt!178788 lt!178793)))

(assert (=> d!37462 (isPrefixOf!0 lt!178797 lt!178797)))

(assert (=> d!37462 (= lt!178793 (lemmaIsPrefixRefl!0 lt!178797))))

(declare-fun lt!178796 () Unit!7183)

(declare-fun lt!178787 () Unit!7183)

(assert (=> d!37462 (= lt!178796 lt!178787)))

(assert (=> d!37462 (isPrefixOf!0 (_2!5122 lt!178360) (_2!5122 lt!178360))))

(assert (=> d!37462 (= lt!178787 (lemmaIsPrefixRefl!0 (_2!5122 lt!178360)))))

(assert (=> d!37462 (= lt!178797 (BitStream!4253 (buf!2799 (_2!5122 lt!178370)) (currentByte!5436 (_2!5122 lt!178360)) (currentBit!5431 (_2!5122 lt!178360))))))

(assert (=> d!37462 (isPrefixOf!0 (_2!5122 lt!178360) (_2!5122 lt!178370))))

(assert (=> d!37462 (= (reader!0 (_2!5122 lt!178360) (_2!5122 lt!178370)) lt!178804)))

(assert (= (and d!37462 c!7038) b!116952))

(assert (= (and d!37462 (not c!7038)) b!116955))

(assert (= (and d!37462 res!96739) b!116953))

(assert (= (and b!116953 res!96737) b!116954))

(assert (= (and b!116954 res!96738) b!116951))

(assert (=> b!116952 m!174871))

(declare-fun m!175225 () Bool)

(assert (=> b!116952 m!175225))

(declare-fun m!175227 () Bool)

(assert (=> b!116952 m!175227))

(declare-fun m!175229 () Bool)

(assert (=> b!116954 m!175229))

(declare-fun m!175231 () Bool)

(assert (=> b!116953 m!175231))

(declare-fun m!175233 () Bool)

(assert (=> b!116951 m!175233))

(assert (=> b!116951 m!175117))

(assert (=> b!116951 m!174871))

(declare-fun m!175235 () Bool)

(assert (=> d!37462 m!175235))

(declare-fun m!175237 () Bool)

(assert (=> d!37462 m!175237))

(declare-fun m!175239 () Bool)

(assert (=> d!37462 m!175239))

(declare-fun m!175241 () Bool)

(assert (=> d!37462 m!175241))

(assert (=> d!37462 m!175213))

(declare-fun m!175243 () Bool)

(assert (=> d!37462 m!175243))

(declare-fun m!175245 () Bool)

(assert (=> d!37462 m!175245))

(declare-fun m!175247 () Bool)

(assert (=> d!37462 m!175247))

(assert (=> d!37462 m!175219))

(declare-fun m!175249 () Bool)

(assert (=> d!37462 m!175249))

(declare-fun m!175251 () Bool)

(assert (=> d!37462 m!175251))

(assert (=> b!116749 d!37462))

(declare-fun d!37464 () Bool)

(assert (=> d!37464 (validate_offset_bits!1 ((_ sign_extend 32) (size!2389 (buf!2799 (_2!5122 lt!178370)))) ((_ sign_extend 32) (currentByte!5436 thiss!1305)) ((_ sign_extend 32) (currentBit!5431 thiss!1305)) lt!178371)))

(declare-fun lt!178815 () Unit!7183)

(declare-fun choose!9 (BitStream!4252 array!5264 (_ BitVec 64) BitStream!4252) Unit!7183)

(assert (=> d!37464 (= lt!178815 (choose!9 thiss!1305 (buf!2799 (_2!5122 lt!178370)) lt!178371 (BitStream!4253 (buf!2799 (_2!5122 lt!178370)) (currentByte!5436 thiss!1305) (currentBit!5431 thiss!1305))))))

(assert (=> d!37464 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2799 (_2!5122 lt!178370)) lt!178371) lt!178815)))

(declare-fun bs!9069 () Bool)

(assert (= bs!9069 d!37464))

(assert (=> bs!9069 m!174833))

(declare-fun m!175253 () Bool)

(assert (=> bs!9069 m!175253))

(assert (=> b!116749 d!37464))

(declare-fun d!37466 () Bool)

(declare-fun e!76681 () Bool)

(assert (=> d!37466 e!76681))

(declare-fun res!96748 () Bool)

(assert (=> d!37466 (=> (not res!96748) (not e!76681))))

(declare-fun lt!178818 () (_ BitVec 64))

(declare-fun lt!178817 () (_ BitVec 64))

(declare-fun lt!178816 () (_ BitVec 64))

(assert (=> d!37466 (= res!96748 (= lt!178818 (bvsub lt!178816 lt!178817)))))

(assert (=> d!37466 (or (= (bvand lt!178816 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!178817 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!178816 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!178816 lt!178817) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!37466 (= lt!178817 (remainingBits!0 ((_ sign_extend 32) (size!2389 (buf!2799 (_1!5121 lt!178366)))) ((_ sign_extend 32) (currentByte!5436 (_1!5121 lt!178366))) ((_ sign_extend 32) (currentBit!5431 (_1!5121 lt!178366)))))))

(declare-fun lt!178820 () (_ BitVec 64))

(declare-fun lt!178819 () (_ BitVec 64))

(assert (=> d!37466 (= lt!178816 (bvmul lt!178820 lt!178819))))

(assert (=> d!37466 (or (= lt!178820 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!178819 (bvsdiv (bvmul lt!178820 lt!178819) lt!178820)))))

(assert (=> d!37466 (= lt!178819 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!37466 (= lt!178820 ((_ sign_extend 32) (size!2389 (buf!2799 (_1!5121 lt!178366)))))))

(assert (=> d!37466 (= lt!178818 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5436 (_1!5121 lt!178366))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5431 (_1!5121 lt!178366)))))))

(assert (=> d!37466 (invariant!0 (currentBit!5431 (_1!5121 lt!178366)) (currentByte!5436 (_1!5121 lt!178366)) (size!2389 (buf!2799 (_1!5121 lt!178366))))))

(assert (=> d!37466 (= (bitIndex!0 (size!2389 (buf!2799 (_1!5121 lt!178366))) (currentByte!5436 (_1!5121 lt!178366)) (currentBit!5431 (_1!5121 lt!178366))) lt!178818)))

(declare-fun b!116965 () Bool)

(declare-fun res!96749 () Bool)

(assert (=> b!116965 (=> (not res!96749) (not e!76681))))

(assert (=> b!116965 (= res!96749 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!178818))))

(declare-fun b!116966 () Bool)

(declare-fun lt!178821 () (_ BitVec 64))

(assert (=> b!116966 (= e!76681 (bvsle lt!178818 (bvmul lt!178821 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!116966 (or (= lt!178821 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!178821 #b0000000000000000000000000000000000000000000000000000000000001000) lt!178821)))))

(assert (=> b!116966 (= lt!178821 ((_ sign_extend 32) (size!2389 (buf!2799 (_1!5121 lt!178366)))))))

(assert (= (and d!37466 res!96748) b!116965))

(assert (= (and b!116965 res!96749) b!116966))

(declare-fun m!175255 () Bool)

(assert (=> d!37466 m!175255))

(declare-fun m!175257 () Bool)

(assert (=> d!37466 m!175257))

(assert (=> b!116749 d!37466))

(declare-fun d!37468 () Bool)

(assert (=> d!37468 (isPrefixOf!0 thiss!1305 (_2!5122 lt!178370))))

(declare-fun lt!178828 () Unit!7183)

(declare-fun choose!30 (BitStream!4252 BitStream!4252 BitStream!4252) Unit!7183)

(assert (=> d!37468 (= lt!178828 (choose!30 thiss!1305 (_2!5122 lt!178360) (_2!5122 lt!178370)))))

(assert (=> d!37468 (isPrefixOf!0 thiss!1305 (_2!5122 lt!178360))))

(assert (=> d!37468 (= (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5122 lt!178360) (_2!5122 lt!178370)) lt!178828)))

(declare-fun bs!9070 () Bool)

(assert (= bs!9070 d!37468))

(assert (=> bs!9070 m!174829))

(declare-fun m!175275 () Bool)

(assert (=> bs!9070 m!175275))

(assert (=> bs!9070 m!174861))

(assert (=> b!116749 d!37468))

(declare-fun d!37474 () Bool)

(declare-fun e!76684 () Bool)

(assert (=> d!37474 e!76684))

(declare-fun res!96754 () Bool)

(assert (=> d!37474 (=> (not res!96754) (not e!76684))))

(declare-fun lt!178832 () (_ BitVec 64))

(declare-fun lt!178831 () (_ BitVec 64))

(declare-fun lt!178830 () (_ BitVec 64))

(assert (=> d!37474 (= res!96754 (= lt!178832 (bvsub lt!178830 lt!178831)))))

(assert (=> d!37474 (or (= (bvand lt!178830 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!178831 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!178830 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!178830 lt!178831) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!37474 (= lt!178831 (remainingBits!0 ((_ sign_extend 32) (size!2389 (buf!2799 (_1!5121 lt!178374)))) ((_ sign_extend 32) (currentByte!5436 (_1!5121 lt!178374))) ((_ sign_extend 32) (currentBit!5431 (_1!5121 lt!178374)))))))

(declare-fun lt!178834 () (_ BitVec 64))

(declare-fun lt!178833 () (_ BitVec 64))

(assert (=> d!37474 (= lt!178830 (bvmul lt!178834 lt!178833))))

(assert (=> d!37474 (or (= lt!178834 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!178833 (bvsdiv (bvmul lt!178834 lt!178833) lt!178834)))))

(assert (=> d!37474 (= lt!178833 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!37474 (= lt!178834 ((_ sign_extend 32) (size!2389 (buf!2799 (_1!5121 lt!178374)))))))

(assert (=> d!37474 (= lt!178832 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5436 (_1!5121 lt!178374))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5431 (_1!5121 lt!178374)))))))

(assert (=> d!37474 (invariant!0 (currentBit!5431 (_1!5121 lt!178374)) (currentByte!5436 (_1!5121 lt!178374)) (size!2389 (buf!2799 (_1!5121 lt!178374))))))

(assert (=> d!37474 (= (bitIndex!0 (size!2389 (buf!2799 (_1!5121 lt!178374))) (currentByte!5436 (_1!5121 lt!178374)) (currentBit!5431 (_1!5121 lt!178374))) lt!178832)))

(declare-fun b!116971 () Bool)

(declare-fun res!96755 () Bool)

(assert (=> b!116971 (=> (not res!96755) (not e!76684))))

(assert (=> b!116971 (= res!96755 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!178832))))

(declare-fun b!116972 () Bool)

(declare-fun lt!178835 () (_ BitVec 64))

(assert (=> b!116972 (= e!76684 (bvsle lt!178832 (bvmul lt!178835 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!116972 (or (= lt!178835 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!178835 #b0000000000000000000000000000000000000000000000000000000000001000) lt!178835)))))

(assert (=> b!116972 (= lt!178835 ((_ sign_extend 32) (size!2389 (buf!2799 (_1!5121 lt!178374)))))))

(assert (= (and d!37474 res!96754) b!116971))

(assert (= (and b!116971 res!96755) b!116972))

(declare-fun m!175277 () Bool)

(assert (=> d!37474 m!175277))

(declare-fun m!175279 () Bool)

(assert (=> d!37474 m!175279))

(assert (=> b!116749 d!37474))

(declare-fun b!117070 () Bool)

(declare-fun e!76739 () tuple2!9714)

(declare-fun lt!179160 () Unit!7183)

(assert (=> b!117070 (= e!76739 (tuple2!9715 lt!179160 (_2!5122 lt!178360)))))

(declare-fun lt!179148 () BitStream!4252)

(assert (=> b!117070 (= lt!179148 (_2!5122 lt!178360))))

(assert (=> b!117070 (= lt!179160 (lemmaIsPrefixRefl!0 lt!179148))))

(declare-fun call!1514 () Bool)

(assert (=> b!117070 call!1514))

(declare-fun lt!179179 () tuple2!9714)

(declare-fun bm!1511 () Bool)

(declare-fun c!7053 () Bool)

(assert (=> bm!1511 (= call!1514 (isPrefixOf!0 (ite c!7053 (_2!5122 lt!178360) lt!179148) (ite c!7053 (_2!5122 lt!179179) lt!179148)))))

(declare-fun b!117071 () Bool)

(declare-fun e!76743 () Bool)

(declare-fun lt!179157 () tuple2!9712)

(assert (=> b!117071 (= e!76743 (= (bitIndex!0 (size!2389 (buf!2799 (_1!5121 lt!179157))) (currentByte!5436 (_1!5121 lt!179157)) (currentBit!5431 (_1!5121 lt!179157))) (bitIndex!0 (size!2389 (buf!2799 (_2!5122 lt!179179))) (currentByte!5436 (_2!5122 lt!179179)) (currentBit!5431 (_2!5122 lt!179179)))))))

(declare-fun b!117072 () Bool)

(declare-fun res!96833 () Bool)

(assert (=> b!117072 (= res!96833 (= (bitIndex!0 (size!2389 (buf!2799 (_2!5122 lt!179179))) (currentByte!5436 (_2!5122 lt!179179)) (currentBit!5431 (_2!5122 lt!179179))) (bvadd (bitIndex!0 (size!2389 (buf!2799 (_2!5122 lt!178360))) (currentByte!5436 (_2!5122 lt!178360)) (currentBit!5431 (_2!5122 lt!178360))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun e!76741 () Bool)

(assert (=> b!117072 (=> (not res!96833) (not e!76741))))

(declare-fun b!117073 () Bool)

(declare-fun res!96836 () Bool)

(declare-fun e!76740 () Bool)

(assert (=> b!117073 (=> (not res!96836) (not e!76740))))

(declare-fun lt!179180 () tuple2!9714)

(assert (=> b!117073 (= res!96836 (isPrefixOf!0 (_2!5122 lt!178360) (_2!5122 lt!179180)))))

(declare-fun d!37476 () Bool)

(assert (=> d!37476 e!76740))

(declare-fun res!96834 () Bool)

(assert (=> d!37476 (=> (not res!96834) (not e!76740))))

(assert (=> d!37476 (= res!96834 (= (size!2389 (buf!2799 (_2!5122 lt!178360))) (size!2389 (buf!2799 (_2!5122 lt!179180)))))))

(assert (=> d!37476 (= lt!179180 e!76739)))

(assert (=> d!37476 (= c!7053 (bvslt (bvadd #b00000000000000000000000000000001 i!615) nBits!396))))

(assert (=> d!37476 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)) (bvsle (bvadd #b00000000000000000000000000000001 i!615) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!37476 (= (appendNLeastSignificantBitsLoop!0 (_2!5122 lt!178360) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) lt!179180)))

(declare-fun b!117074 () Bool)

(declare-fun e!76742 () Bool)

(declare-fun lt!179189 () tuple2!9712)

(declare-fun lt!179178 () tuple2!9712)

(assert (=> b!117074 (= e!76742 (= (_2!5121 lt!179189) (_2!5121 lt!179178)))))

(declare-fun b!117075 () Bool)

(declare-fun e!76737 () (_ BitVec 64))

(assert (=> b!117075 (= e!76737 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))))))

(declare-fun b!117076 () Bool)

(declare-fun e!76738 () Bool)

(declare-fun lt!179146 () (_ BitVec 64))

(assert (=> b!117076 (= e!76738 (validate_offset_bits!1 ((_ sign_extend 32) (size!2389 (buf!2799 (_2!5122 lt!178360)))) ((_ sign_extend 32) (currentByte!5436 (_2!5122 lt!178360))) ((_ sign_extend 32) (currentBit!5431 (_2!5122 lt!178360))) lt!179146))))

(declare-fun b!117077 () Bool)

(declare-fun res!96835 () Bool)

(assert (=> b!117077 (= res!96835 call!1514)))

(assert (=> b!117077 (=> (not res!96835) (not e!76741))))

(declare-fun b!117078 () Bool)

(declare-fun res!96828 () Bool)

(assert (=> b!117078 (=> (not res!96828) (not e!76740))))

(declare-fun lt!179185 () (_ BitVec 64))

(declare-fun lt!179190 () (_ BitVec 64))

(assert (=> b!117078 (= res!96828 (= (bitIndex!0 (size!2389 (buf!2799 (_2!5122 lt!179180))) (currentByte!5436 (_2!5122 lt!179180)) (currentBit!5431 (_2!5122 lt!179180))) (bvadd lt!179190 lt!179185)))))

(assert (=> b!117078 (or (not (= (bvand lt!179190 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!179185 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!179190 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!179190 lt!179185) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!117078 (= lt!179185 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!117078 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!117078 (= lt!179190 (bitIndex!0 (size!2389 (buf!2799 (_2!5122 lt!178360))) (currentByte!5436 (_2!5122 lt!178360)) (currentBit!5431 (_2!5122 lt!178360))))))

(declare-fun b!117079 () Bool)

(assert (=> b!117079 (= e!76737 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!117080 () Bool)

(declare-fun lt!179156 () tuple2!9714)

(declare-fun Unit!7199 () Unit!7183)

(assert (=> b!117080 (= e!76739 (tuple2!9715 Unit!7199 (_2!5122 lt!179156)))))

(declare-fun lt!179159 () Bool)

(assert (=> b!117080 (= lt!179159 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!117080 (= lt!179179 (appendBit!0 (_2!5122 lt!178360) lt!179159))))

(declare-fun res!96832 () Bool)

(assert (=> b!117080 (= res!96832 (= (size!2389 (buf!2799 (_2!5122 lt!178360))) (size!2389 (buf!2799 (_2!5122 lt!179179)))))))

(assert (=> b!117080 (=> (not res!96832) (not e!76741))))

(assert (=> b!117080 e!76741))

(declare-fun lt!179152 () tuple2!9714)

(assert (=> b!117080 (= lt!179152 lt!179179)))

(assert (=> b!117080 (= lt!179156 (appendNLeastSignificantBitsLoop!0 (_2!5122 lt!179152) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))))

(declare-fun lt!179147 () Unit!7183)

(assert (=> b!117080 (= lt!179147 (lemmaIsPrefixTransitive!0 (_2!5122 lt!178360) (_2!5122 lt!179152) (_2!5122 lt!179156)))))

(assert (=> b!117080 (isPrefixOf!0 (_2!5122 lt!178360) (_2!5122 lt!179156))))

(declare-fun lt!179169 () Unit!7183)

(assert (=> b!117080 (= lt!179169 lt!179147)))

(assert (=> b!117080 (invariant!0 (currentBit!5431 (_2!5122 lt!178360)) (currentByte!5436 (_2!5122 lt!178360)) (size!2389 (buf!2799 (_2!5122 lt!179152))))))

(declare-fun lt!179150 () BitStream!4252)

(assert (=> b!117080 (= lt!179150 (BitStream!4253 (buf!2799 (_2!5122 lt!179152)) (currentByte!5436 (_2!5122 lt!178360)) (currentBit!5431 (_2!5122 lt!178360))))))

(assert (=> b!117080 (invariant!0 (currentBit!5431 lt!179150) (currentByte!5436 lt!179150) (size!2389 (buf!2799 (_2!5122 lt!179156))))))

(declare-fun lt!179158 () BitStream!4252)

(assert (=> b!117080 (= lt!179158 (BitStream!4253 (buf!2799 (_2!5122 lt!179156)) (currentByte!5436 lt!179150) (currentBit!5431 lt!179150)))))

(assert (=> b!117080 (= lt!179189 (readBitPure!0 lt!179150))))

(assert (=> b!117080 (= lt!179178 (readBitPure!0 lt!179158))))

(declare-fun lt!179162 () Unit!7183)

(assert (=> b!117080 (= lt!179162 (readBitPrefixLemma!0 lt!179150 (_2!5122 lt!179156)))))

(declare-fun res!96829 () Bool)

(assert (=> b!117080 (= res!96829 (= (bitIndex!0 (size!2389 (buf!2799 (_1!5121 lt!179189))) (currentByte!5436 (_1!5121 lt!179189)) (currentBit!5431 (_1!5121 lt!179189))) (bitIndex!0 (size!2389 (buf!2799 (_1!5121 lt!179178))) (currentByte!5436 (_1!5121 lt!179178)) (currentBit!5431 (_1!5121 lt!179178)))))))

(assert (=> b!117080 (=> (not res!96829) (not e!76742))))

(assert (=> b!117080 e!76742))

(declare-fun lt!179155 () Unit!7183)

(assert (=> b!117080 (= lt!179155 lt!179162)))

(declare-fun lt!179161 () tuple2!9716)

(assert (=> b!117080 (= lt!179161 (reader!0 (_2!5122 lt!178360) (_2!5122 lt!179156)))))

(declare-fun lt!179187 () tuple2!9716)

(assert (=> b!117080 (= lt!179187 (reader!0 (_2!5122 lt!179152) (_2!5122 lt!179156)))))

(declare-fun lt!179172 () tuple2!9712)

(assert (=> b!117080 (= lt!179172 (readBitPure!0 (_1!5123 lt!179161)))))

(assert (=> b!117080 (= (_2!5121 lt!179172) lt!179159)))

(declare-fun lt!179167 () Unit!7183)

(declare-fun Unit!7200 () Unit!7183)

(assert (=> b!117080 (= lt!179167 Unit!7200)))

(declare-fun lt!179151 () (_ BitVec 64))

(assert (=> b!117080 (= lt!179151 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(declare-fun lt!179175 () (_ BitVec 64))

(assert (=> b!117080 (= lt!179175 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(declare-fun lt!179184 () Unit!7183)

(assert (=> b!117080 (= lt!179184 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5122 lt!178360) (buf!2799 (_2!5122 lt!179156)) lt!179175))))

(assert (=> b!117080 (validate_offset_bits!1 ((_ sign_extend 32) (size!2389 (buf!2799 (_2!5122 lt!179156)))) ((_ sign_extend 32) (currentByte!5436 (_2!5122 lt!178360))) ((_ sign_extend 32) (currentBit!5431 (_2!5122 lt!178360))) lt!179175)))

(declare-fun lt!179173 () Unit!7183)

(assert (=> b!117080 (= lt!179173 lt!179184)))

(declare-fun lt!179174 () tuple2!9718)

(assert (=> b!117080 (= lt!179174 (readNLeastSignificantBitsLoopPure!0 (_1!5123 lt!179161) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!179151))))

(declare-fun lt!179170 () (_ BitVec 64))

(assert (=> b!117080 (= lt!179170 ((_ sign_extend 32) (bvsub (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b00000000000000000000000000000001)))))

(declare-fun lt!179183 () Unit!7183)

(assert (=> b!117080 (= lt!179183 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5122 lt!179152) (buf!2799 (_2!5122 lt!179156)) lt!179170))))

(assert (=> b!117080 (validate_offset_bits!1 ((_ sign_extend 32) (size!2389 (buf!2799 (_2!5122 lt!179156)))) ((_ sign_extend 32) (currentByte!5436 (_2!5122 lt!179152))) ((_ sign_extend 32) (currentBit!5431 (_2!5122 lt!179152))) lt!179170)))

(declare-fun lt!179176 () Unit!7183)

(assert (=> b!117080 (= lt!179176 lt!179183)))

(declare-fun lt!179153 () tuple2!9718)

(assert (=> b!117080 (= lt!179153 (readNLeastSignificantBitsLoopPure!0 (_1!5123 lt!179187) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!179151 (ite (_2!5121 lt!179172) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!179163 () tuple2!9718)

(assert (=> b!117080 (= lt!179163 (readNLeastSignificantBitsLoopPure!0 (_1!5123 lt!179161) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!179151))))

(declare-fun c!7052 () Bool)

(assert (=> b!117080 (= c!7052 (_2!5121 (readBitPure!0 (_1!5123 lt!179161))))))

(declare-fun lt!179168 () tuple2!9718)

(assert (=> b!117080 (= lt!179168 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!5123 lt!179161) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!179151 e!76737)))))

(declare-fun lt!179182 () Unit!7183)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!4252 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!7183)

(assert (=> b!117080 (= lt!179182 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!5123 lt!179161) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!179151))))

(assert (=> b!117080 (and (= (_2!5124 lt!179163) (_2!5124 lt!179168)) (= (_1!5124 lt!179163) (_1!5124 lt!179168)))))

(declare-fun lt!179171 () Unit!7183)

(assert (=> b!117080 (= lt!179171 lt!179182)))

(assert (=> b!117080 (= (_1!5123 lt!179161) (withMovedBitIndex!0 (_2!5123 lt!179161) (bvsub (bitIndex!0 (size!2389 (buf!2799 (_2!5122 lt!178360))) (currentByte!5436 (_2!5122 lt!178360)) (currentBit!5431 (_2!5122 lt!178360))) (bitIndex!0 (size!2389 (buf!2799 (_2!5122 lt!179156))) (currentByte!5436 (_2!5122 lt!179156)) (currentBit!5431 (_2!5122 lt!179156))))))))

(declare-fun lt!179186 () Unit!7183)

(declare-fun Unit!7201 () Unit!7183)

(assert (=> b!117080 (= lt!179186 Unit!7201)))

(assert (=> b!117080 (= (_1!5123 lt!179187) (withMovedBitIndex!0 (_2!5123 lt!179187) (bvsub (bitIndex!0 (size!2389 (buf!2799 (_2!5122 lt!179152))) (currentByte!5436 (_2!5122 lt!179152)) (currentBit!5431 (_2!5122 lt!179152))) (bitIndex!0 (size!2389 (buf!2799 (_2!5122 lt!179156))) (currentByte!5436 (_2!5122 lt!179156)) (currentBit!5431 (_2!5122 lt!179156))))))))

(declare-fun lt!179166 () Unit!7183)

(declare-fun Unit!7202 () Unit!7183)

(assert (=> b!117080 (= lt!179166 Unit!7202)))

(assert (=> b!117080 (= (bitIndex!0 (size!2389 (buf!2799 (_2!5122 lt!178360))) (currentByte!5436 (_2!5122 lt!178360)) (currentBit!5431 (_2!5122 lt!178360))) (bvsub (bitIndex!0 (size!2389 (buf!2799 (_2!5122 lt!179152))) (currentByte!5436 (_2!5122 lt!179152)) (currentBit!5431 (_2!5122 lt!179152))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!179164 () Unit!7183)

(declare-fun Unit!7203 () Unit!7183)

(assert (=> b!117080 (= lt!179164 Unit!7203)))

(assert (=> b!117080 (= (_2!5124 lt!179174) (_2!5124 lt!179153))))

(declare-fun lt!179177 () Unit!7183)

(declare-fun Unit!7204 () Unit!7183)

(assert (=> b!117080 (= lt!179177 Unit!7204)))

(assert (=> b!117080 (= (_1!5124 lt!179174) (_2!5123 lt!179161))))

(declare-fun b!117081 () Bool)

(declare-fun lt!179188 () tuple2!9716)

(declare-fun lt!179181 () tuple2!9718)

(assert (=> b!117081 (= e!76740 (and (= (_2!5124 lt!179181) v!199) (= (_1!5124 lt!179181) (_2!5123 lt!179188))))))

(declare-fun lt!179165 () (_ BitVec 64))

(assert (=> b!117081 (= lt!179181 (readNLeastSignificantBitsLoopPure!0 (_1!5123 lt!179188) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!179165))))

(declare-fun lt!179154 () Unit!7183)

(declare-fun lt!179149 () Unit!7183)

(assert (=> b!117081 (= lt!179154 lt!179149)))

(assert (=> b!117081 (validate_offset_bits!1 ((_ sign_extend 32) (size!2389 (buf!2799 (_2!5122 lt!179180)))) ((_ sign_extend 32) (currentByte!5436 (_2!5122 lt!178360))) ((_ sign_extend 32) (currentBit!5431 (_2!5122 lt!178360))) lt!179146)))

(assert (=> b!117081 (= lt!179149 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5122 lt!178360) (buf!2799 (_2!5122 lt!179180)) lt!179146))))

(assert (=> b!117081 e!76738))

(declare-fun res!96830 () Bool)

(assert (=> b!117081 (=> (not res!96830) (not e!76738))))

(assert (=> b!117081 (= res!96830 (and (= (size!2389 (buf!2799 (_2!5122 lt!178360))) (size!2389 (buf!2799 (_2!5122 lt!179180)))) (bvsge lt!179146 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!117081 (= lt!179146 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!117081 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!117081 (= lt!179165 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(assert (=> b!117081 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!117081 (= lt!179188 (reader!0 (_2!5122 lt!178360) (_2!5122 lt!179180)))))

(declare-fun b!117082 () Bool)

(assert (=> b!117082 (= lt!179157 (readBitPure!0 (readerFrom!0 (_2!5122 lt!179179) (currentBit!5431 (_2!5122 lt!178360)) (currentByte!5436 (_2!5122 lt!178360)))))))

(declare-fun res!96831 () Bool)

(assert (=> b!117082 (= res!96831 (and (= (_2!5121 lt!179157) lt!179159) (= (_1!5121 lt!179157) (_2!5122 lt!179179))))))

(assert (=> b!117082 (=> (not res!96831) (not e!76743))))

(assert (=> b!117082 (= e!76741 e!76743)))

(assert (= (and d!37476 c!7053) b!117080))

(assert (= (and d!37476 (not c!7053)) b!117070))

(assert (= (and b!117080 res!96832) b!117072))

(assert (= (and b!117072 res!96833) b!117077))

(assert (= (and b!117077 res!96835) b!117082))

(assert (= (and b!117082 res!96831) b!117071))

(assert (= (and b!117080 res!96829) b!117074))

(assert (= (and b!117080 c!7052) b!117075))

(assert (= (and b!117080 (not c!7052)) b!117079))

(assert (= (or b!117077 b!117070) bm!1511))

(assert (= (and d!37476 res!96834) b!117078))

(assert (= (and b!117078 res!96828) b!117073))

(assert (= (and b!117073 res!96836) b!117081))

(assert (= (and b!117081 res!96830) b!117076))

(declare-fun m!175417 () Bool)

(assert (=> b!117072 m!175417))

(assert (=> b!117072 m!174871))

(declare-fun m!175419 () Bool)

(assert (=> b!117080 m!175419))

(declare-fun m!175421 () Bool)

(assert (=> b!117080 m!175421))

(declare-fun m!175423 () Bool)

(assert (=> b!117080 m!175423))

(declare-fun m!175425 () Bool)

(assert (=> b!117080 m!175425))

(declare-fun m!175427 () Bool)

(assert (=> b!117080 m!175427))

(declare-fun m!175429 () Bool)

(assert (=> b!117080 m!175429))

(declare-fun m!175431 () Bool)

(assert (=> b!117080 m!175431))

(declare-fun m!175433 () Bool)

(assert (=> b!117080 m!175433))

(declare-fun m!175435 () Bool)

(assert (=> b!117080 m!175435))

(declare-fun m!175437 () Bool)

(assert (=> b!117080 m!175437))

(declare-fun m!175439 () Bool)

(assert (=> b!117080 m!175439))

(declare-fun m!175441 () Bool)

(assert (=> b!117080 m!175441))

(declare-fun m!175443 () Bool)

(assert (=> b!117080 m!175443))

(declare-fun m!175445 () Bool)

(assert (=> b!117080 m!175445))

(declare-fun m!175447 () Bool)

(assert (=> b!117080 m!175447))

(declare-fun m!175449 () Bool)

(assert (=> b!117080 m!175449))

(declare-fun m!175451 () Bool)

(assert (=> b!117080 m!175451))

(declare-fun m!175453 () Bool)

(assert (=> b!117080 m!175453))

(declare-fun m!175455 () Bool)

(assert (=> b!117080 m!175455))

(declare-fun m!175457 () Bool)

(assert (=> b!117080 m!175457))

(declare-fun m!175459 () Bool)

(assert (=> b!117080 m!175459))

(declare-fun m!175461 () Bool)

(assert (=> b!117080 m!175461))

(declare-fun m!175463 () Bool)

(assert (=> b!117080 m!175463))

(assert (=> b!117080 m!175441))

(declare-fun m!175465 () Bool)

(assert (=> b!117080 m!175465))

(declare-fun m!175467 () Bool)

(assert (=> b!117080 m!175467))

(declare-fun m!175469 () Bool)

(assert (=> b!117080 m!175469))

(declare-fun m!175471 () Bool)

(assert (=> b!117080 m!175471))

(assert (=> b!117080 m!174871))

(declare-fun m!175473 () Bool)

(assert (=> b!117080 m!175473))

(declare-fun m!175475 () Bool)

(assert (=> b!117078 m!175475))

(assert (=> b!117078 m!174871))

(declare-fun m!175477 () Bool)

(assert (=> b!117081 m!175477))

(declare-fun m!175479 () Bool)

(assert (=> b!117081 m!175479))

(assert (=> b!117081 m!175433))

(declare-fun m!175481 () Bool)

(assert (=> b!117081 m!175481))

(declare-fun m!175483 () Bool)

(assert (=> b!117081 m!175483))

(declare-fun m!175485 () Bool)

(assert (=> b!117070 m!175485))

(declare-fun m!175487 () Bool)

(assert (=> b!117082 m!175487))

(assert (=> b!117082 m!175487))

(declare-fun m!175489 () Bool)

(assert (=> b!117082 m!175489))

(declare-fun m!175491 () Bool)

(assert (=> b!117071 m!175491))

(assert (=> b!117071 m!175417))

(declare-fun m!175493 () Bool)

(assert (=> b!117076 m!175493))

(declare-fun m!175495 () Bool)

(assert (=> bm!1511 m!175495))

(declare-fun m!175497 () Bool)

(assert (=> b!117073 m!175497))

(assert (=> b!116749 d!37476))

(declare-fun d!37498 () Bool)

(declare-fun lt!179191 () tuple2!9740)

(assert (=> d!37498 (= lt!179191 (readBit!0 (_1!5123 lt!178359)))))

(assert (=> d!37498 (= (readBitPure!0 (_1!5123 lt!178359)) (tuple2!9713 (_2!5135 lt!179191) (_1!5135 lt!179191)))))

(declare-fun bs!9074 () Bool)

(assert (= bs!9074 d!37498))

(declare-fun m!175499 () Bool)

(assert (=> bs!9074 m!175499))

(assert (=> b!116749 d!37498))

(declare-fun d!37500 () Bool)

(assert (=> d!37500 (= (invariant!0 (currentBit!5431 thiss!1305) (currentByte!5436 thiss!1305) (size!2389 (buf!2799 (_2!5122 lt!178360)))) (and (bvsge (currentBit!5431 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5431 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5436 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5436 thiss!1305) (size!2389 (buf!2799 (_2!5122 lt!178360)))) (and (= (currentBit!5431 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5436 thiss!1305) (size!2389 (buf!2799 (_2!5122 lt!178360))))))))))

(assert (=> b!116739 d!37500))

(declare-fun d!37502 () Bool)

(declare-fun res!96839 () Bool)

(declare-fun e!76744 () Bool)

(assert (=> d!37502 (=> (not res!96839) (not e!76744))))

(assert (=> d!37502 (= res!96839 (= (size!2389 (buf!2799 thiss!1305)) (size!2389 (buf!2799 (_2!5122 lt!178360)))))))

(assert (=> d!37502 (= (isPrefixOf!0 thiss!1305 (_2!5122 lt!178360)) e!76744)))

(declare-fun b!117083 () Bool)

(declare-fun res!96837 () Bool)

(assert (=> b!117083 (=> (not res!96837) (not e!76744))))

(assert (=> b!117083 (= res!96837 (bvsle (bitIndex!0 (size!2389 (buf!2799 thiss!1305)) (currentByte!5436 thiss!1305) (currentBit!5431 thiss!1305)) (bitIndex!0 (size!2389 (buf!2799 (_2!5122 lt!178360))) (currentByte!5436 (_2!5122 lt!178360)) (currentBit!5431 (_2!5122 lt!178360)))))))

(declare-fun b!117084 () Bool)

(declare-fun e!76745 () Bool)

(assert (=> b!117084 (= e!76744 e!76745)))

(declare-fun res!96838 () Bool)

(assert (=> b!117084 (=> res!96838 e!76745)))

(assert (=> b!117084 (= res!96838 (= (size!2389 (buf!2799 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!117085 () Bool)

(assert (=> b!117085 (= e!76745 (arrayBitRangesEq!0 (buf!2799 thiss!1305) (buf!2799 (_2!5122 lt!178360)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2389 (buf!2799 thiss!1305)) (currentByte!5436 thiss!1305) (currentBit!5431 thiss!1305))))))

(assert (= (and d!37502 res!96839) b!117083))

(assert (= (and b!117083 res!96837) b!117084))

(assert (= (and b!117084 (not res!96838)) b!117085))

(assert (=> b!117083 m!174873))

(assert (=> b!117083 m!174871))

(assert (=> b!117085 m!174873))

(assert (=> b!117085 m!174873))

(declare-fun m!175501 () Bool)

(assert (=> b!117085 m!175501))

(assert (=> b!116748 d!37502))

(declare-fun d!37504 () Bool)

(assert (=> d!37504 (= (inv!12 thiss!1305) (invariant!0 (currentBit!5431 thiss!1305) (currentByte!5436 thiss!1305) (size!2389 (buf!2799 thiss!1305))))))

(declare-fun bs!9075 () Bool)

(assert (= bs!9075 d!37504))

(assert (=> bs!9075 m!175109))

(assert (=> start!23000 d!37504))

(declare-fun d!37506 () Bool)

(assert (=> d!37506 (= (onesLSBLong!0 nBits!396) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!396))))))

(assert (=> b!116741 d!37506))

(declare-fun d!37508 () Bool)

(assert (=> d!37508 (= (array_inv!2191 (buf!2799 thiss!1305)) (bvsge (size!2389 (buf!2799 thiss!1305)) #b00000000000000000000000000000000))))

(assert (=> b!116742 d!37508))

(declare-fun d!37510 () Bool)

(assert (=> d!37510 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2389 (buf!2799 thiss!1305))) ((_ sign_extend 32) (currentByte!5436 thiss!1305)) ((_ sign_extend 32) (currentBit!5431 thiss!1305)) lt!178371) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2389 (buf!2799 thiss!1305))) ((_ sign_extend 32) (currentByte!5436 thiss!1305)) ((_ sign_extend 32) (currentBit!5431 thiss!1305))) lt!178371))))

(declare-fun bs!9076 () Bool)

(assert (= bs!9076 d!37510))

(assert (=> bs!9076 m!175107))

(assert (=> b!116747 d!37510))

(push 1)

(assert (not d!37398))

(assert (not b!116927))

(assert (not d!37416))

(assert (not d!37392))

(assert (not d!37402))

(assert (not b!116953))

(assert (not b!117078))

(assert (not b!116894))

(assert (not d!37427))

(assert (not b!117085))

(assert (not b!117073))

(assert (not b!116947))

(assert (not b!117082))

(assert (not b!116926))

(assert (not d!37466))

(assert (not b!116949))

(assert (not b!117083))

(assert (not d!37422))

(assert (not b!116954))

(assert (not b!116892))

(assert (not d!37394))

(assert (not d!37462))

(assert (not b!116946))

(assert (not d!37468))

(assert (not b!117072))

(assert (not b!117070))

(assert (not d!37474))

(assert (not b!117076))

(assert (not d!37406))

(assert (not b!117081))

(assert (not b!116951))

(assert (not b!116875))

(assert (not d!37396))

(assert (not d!37414))

(assert (not b!116948))

(assert (not d!37510))

(assert (not b!116952))

(assert (not b!116925))

(assert (not b!116928))

(assert (not d!37498))

(assert (not d!37444))

(assert (not b!117071))

(assert (not d!37504))

(assert (not bm!1511))

(assert (not b!117080))

(assert (not d!37464))

(assert (not d!37412))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

