; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!23792 () Bool)

(assert start!23792)

(declare-fun b!120373 () Bool)

(declare-fun e!78837 () Bool)

(declare-datatypes ((array!5357 0))(
  ( (array!5358 (arr!3018 (Array (_ BitVec 32) (_ BitVec 8))) (size!2425 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4324 0))(
  ( (BitStream!4325 (buf!2856 array!5357) (currentByte!5535 (_ BitVec 32)) (currentBit!5530 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!10084 0))(
  ( (tuple2!10085 (_1!5307 BitStream!4324) (_2!5307 Bool)) )
))
(declare-fun lt!187389 () tuple2!10084)

(declare-fun lt!187374 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!120373 (= e!78837 (= (bitIndex!0 (size!2425 (buf!2856 (_1!5307 lt!187389))) (currentByte!5535 (_1!5307 lt!187389)) (currentBit!5530 (_1!5307 lt!187389))) lt!187374))))

(declare-fun b!120374 () Bool)

(declare-fun e!78838 () Bool)

(declare-fun lt!187392 () (_ BitVec 64))

(declare-fun lt!187369 () (_ BitVec 64))

(assert (=> b!120374 (= e!78838 (or (= lt!187392 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!187392 (bvand (bvsub lt!187369 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!120374 (= lt!187392 (bvand lt!187369 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!10086 0))(
  ( (tuple2!10087 (_1!5308 BitStream!4324) (_2!5308 BitStream!4324)) )
))
(declare-fun lt!187384 () tuple2!10086)

(declare-fun lt!187390 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!4324 (_ BitVec 64)) BitStream!4324)

(assert (=> b!120374 (= (_1!5308 lt!187384) (withMovedBitIndex!0 (_2!5308 lt!187384) (bvsub lt!187369 lt!187390)))))

(declare-datatypes ((Unit!7417 0))(
  ( (Unit!7418) )
))
(declare-datatypes ((tuple2!10088 0))(
  ( (tuple2!10089 (_1!5309 Unit!7417) (_2!5309 BitStream!4324)) )
))
(declare-fun lt!187377 () tuple2!10088)

(assert (=> b!120374 (= lt!187369 (bitIndex!0 (size!2425 (buf!2856 (_2!5309 lt!187377))) (currentByte!5535 (_2!5309 lt!187377)) (currentBit!5530 (_2!5309 lt!187377))))))

(declare-fun lt!187387 () tuple2!10086)

(declare-fun lt!187379 () (_ BitVec 64))

(assert (=> b!120374 (= (_1!5308 lt!187387) (withMovedBitIndex!0 (_2!5308 lt!187387) (bvsub lt!187379 lt!187390)))))

(declare-fun lt!187370 () tuple2!10088)

(assert (=> b!120374 (= lt!187390 (bitIndex!0 (size!2425 (buf!2856 (_2!5309 lt!187370))) (currentByte!5535 (_2!5309 lt!187370)) (currentBit!5530 (_2!5309 lt!187370))))))

(declare-fun thiss!1305 () BitStream!4324)

(assert (=> b!120374 (= lt!187379 (bitIndex!0 (size!2425 (buf!2856 thiss!1305)) (currentByte!5535 thiss!1305) (currentBit!5530 thiss!1305)))))

(declare-datatypes ((tuple2!10090 0))(
  ( (tuple2!10091 (_1!5310 BitStream!4324) (_2!5310 (_ BitVec 64))) )
))
(declare-fun lt!187378 () tuple2!10090)

(declare-fun lt!187388 () tuple2!10090)

(assert (=> b!120374 (and (= (_2!5310 lt!187378) (_2!5310 lt!187388)) (= (_1!5310 lt!187378) (_1!5310 lt!187388)))))

(declare-fun lt!187375 () (_ BitVec 64))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun lt!187368 () Unit!7417)

(declare-fun i!615 () (_ BitVec 32))

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!4324 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!7417)

(assert (=> b!120374 (= lt!187368 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!5308 lt!187387) nBits!396 i!615 lt!187375))))

(declare-fun lt!187383 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4324 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!10090)

(assert (=> b!120374 (= lt!187388 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!5308 lt!187387) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!187383))))

(declare-fun b!120375 () Bool)

(declare-fun e!78832 () Bool)

(declare-fun e!78831 () Bool)

(assert (=> b!120375 (= e!78832 e!78831)))

(declare-fun res!99662 () Bool)

(assert (=> b!120375 (=> (not res!99662) (not e!78831))))

(declare-fun lt!187382 () (_ BitVec 64))

(assert (=> b!120375 (= res!99662 (= lt!187374 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!187382)))))

(assert (=> b!120375 (= lt!187374 (bitIndex!0 (size!2425 (buf!2856 (_2!5309 lt!187377))) (currentByte!5535 (_2!5309 lt!187377)) (currentBit!5530 (_2!5309 lt!187377))))))

(assert (=> b!120375 (= lt!187382 (bitIndex!0 (size!2425 (buf!2856 thiss!1305)) (currentByte!5535 thiss!1305) (currentBit!5530 thiss!1305)))))

(declare-fun b!120376 () Bool)

(declare-fun res!99654 () Bool)

(declare-fun e!78834 () Bool)

(assert (=> b!120376 (=> (not res!99654) (not e!78834))))

(assert (=> b!120376 (= res!99654 (bvslt i!615 nBits!396))))

(declare-fun res!99657 () Bool)

(declare-fun e!78835 () Bool)

(assert (=> start!23792 (=> (not res!99657) (not e!78835))))

(assert (=> start!23792 (= res!99657 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!23792 e!78835))

(assert (=> start!23792 true))

(declare-fun e!78833 () Bool)

(declare-fun inv!12 (BitStream!4324) Bool)

(assert (=> start!23792 (and (inv!12 thiss!1305) e!78833)))

(declare-fun b!120377 () Bool)

(declare-fun res!99655 () Bool)

(declare-fun e!78839 () Bool)

(assert (=> b!120377 (=> (not res!99655) (not e!78839))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!120377 (= res!99655 (invariant!0 (currentBit!5530 thiss!1305) (currentByte!5535 thiss!1305) (size!2425 (buf!2856 (_2!5309 lt!187377)))))))

(declare-fun b!120378 () Bool)

(declare-fun e!78836 () Bool)

(declare-fun lt!187365 () tuple2!10084)

(declare-fun lt!187381 () tuple2!10084)

(assert (=> b!120378 (= e!78836 (= (_2!5307 lt!187365) (_2!5307 lt!187381)))))

(declare-fun b!120379 () Bool)

(declare-fun res!99656 () Bool)

(assert (=> b!120379 (=> (not res!99656) (not e!78831))))

(declare-fun isPrefixOf!0 (BitStream!4324 BitStream!4324) Bool)

(assert (=> b!120379 (= res!99656 (isPrefixOf!0 thiss!1305 (_2!5309 lt!187377)))))

(declare-fun b!120380 () Bool)

(assert (=> b!120380 (= e!78839 (invariant!0 (currentBit!5530 thiss!1305) (currentByte!5535 thiss!1305) (size!2425 (buf!2856 (_2!5309 lt!187370)))))))

(declare-fun b!120381 () Bool)

(declare-fun res!99652 () Bool)

(assert (=> b!120381 (=> (not res!99652) (not e!78834))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!120381 (= res!99652 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!120382 () Bool)

(assert (=> b!120382 (= e!78835 e!78834)))

(declare-fun res!99661 () Bool)

(assert (=> b!120382 (=> (not res!99661) (not e!78834))))

(declare-fun lt!187391 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!120382 (= res!99661 (validate_offset_bits!1 ((_ sign_extend 32) (size!2425 (buf!2856 thiss!1305))) ((_ sign_extend 32) (currentByte!5535 thiss!1305)) ((_ sign_extend 32) (currentBit!5530 thiss!1305)) lt!187391))))

(assert (=> b!120382 (= lt!187391 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!120383 () Bool)

(declare-fun array_inv!2227 (array!5357) Bool)

(assert (=> b!120383 (= e!78833 (array_inv!2227 (buf!2856 thiss!1305)))))

(declare-fun b!120384 () Bool)

(assert (=> b!120384 (= e!78831 e!78837)))

(declare-fun res!99660 () Bool)

(assert (=> b!120384 (=> (not res!99660) (not e!78837))))

(declare-fun lt!187372 () Bool)

(assert (=> b!120384 (= res!99660 (and (= (_2!5307 lt!187389) lt!187372) (= (_1!5307 lt!187389) (_2!5309 lt!187377))))))

(declare-fun readBitPure!0 (BitStream!4324) tuple2!10084)

(declare-fun readerFrom!0 (BitStream!4324 (_ BitVec 32) (_ BitVec 32)) BitStream!4324)

(assert (=> b!120384 (= lt!187389 (readBitPure!0 (readerFrom!0 (_2!5309 lt!187377) (currentBit!5530 thiss!1305) (currentByte!5535 thiss!1305))))))

(declare-fun b!120385 () Bool)

(assert (=> b!120385 (= e!78834 (not e!78838))))

(declare-fun res!99659 () Bool)

(assert (=> b!120385 (=> res!99659 e!78838)))

(assert (=> b!120385 (= res!99659 (not (= (_1!5310 (readNLeastSignificantBitsLoopPure!0 (_1!5308 lt!187384) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!187383)) (_2!5308 lt!187384))))))

(declare-fun lt!187367 () (_ BitVec 64))

(assert (=> b!120385 (validate_offset_bits!1 ((_ sign_extend 32) (size!2425 (buf!2856 (_2!5309 lt!187370)))) ((_ sign_extend 32) (currentByte!5535 (_2!5309 lt!187377))) ((_ sign_extend 32) (currentBit!5530 (_2!5309 lt!187377))) lt!187367)))

(declare-fun lt!187380 () Unit!7417)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4324 array!5357 (_ BitVec 64)) Unit!7417)

(assert (=> b!120385 (= lt!187380 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5309 lt!187377) (buf!2856 (_2!5309 lt!187370)) lt!187367))))

(assert (=> b!120385 (= lt!187367 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!187385 () tuple2!10084)

(declare-fun lt!187373 () (_ BitVec 64))

(assert (=> b!120385 (= lt!187383 (bvor lt!187375 (ite (_2!5307 lt!187385) lt!187373 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!120385 (= lt!187378 (readNLeastSignificantBitsLoopPure!0 (_1!5308 lt!187387) nBits!396 i!615 lt!187375))))

(assert (=> b!120385 (validate_offset_bits!1 ((_ sign_extend 32) (size!2425 (buf!2856 (_2!5309 lt!187370)))) ((_ sign_extend 32) (currentByte!5535 thiss!1305)) ((_ sign_extend 32) (currentBit!5530 thiss!1305)) lt!187391)))

(declare-fun lt!187386 () Unit!7417)

(assert (=> b!120385 (= lt!187386 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2856 (_2!5309 lt!187370)) lt!187391))))

(assert (=> b!120385 (= lt!187375 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(assert (=> b!120385 (= (_2!5307 lt!187385) lt!187372)))

(assert (=> b!120385 (= lt!187385 (readBitPure!0 (_1!5308 lt!187387)))))

(declare-fun reader!0 (BitStream!4324 BitStream!4324) tuple2!10086)

(assert (=> b!120385 (= lt!187384 (reader!0 (_2!5309 lt!187377) (_2!5309 lt!187370)))))

(assert (=> b!120385 (= lt!187387 (reader!0 thiss!1305 (_2!5309 lt!187370)))))

(assert (=> b!120385 e!78836))

(declare-fun res!99663 () Bool)

(assert (=> b!120385 (=> (not res!99663) (not e!78836))))

(assert (=> b!120385 (= res!99663 (= (bitIndex!0 (size!2425 (buf!2856 (_1!5307 lt!187365))) (currentByte!5535 (_1!5307 lt!187365)) (currentBit!5530 (_1!5307 lt!187365))) (bitIndex!0 (size!2425 (buf!2856 (_1!5307 lt!187381))) (currentByte!5535 (_1!5307 lt!187381)) (currentBit!5530 (_1!5307 lt!187381)))))))

(declare-fun lt!187371 () Unit!7417)

(declare-fun lt!187376 () BitStream!4324)

(declare-fun readBitPrefixLemma!0 (BitStream!4324 BitStream!4324) Unit!7417)

(assert (=> b!120385 (= lt!187371 (readBitPrefixLemma!0 lt!187376 (_2!5309 lt!187370)))))

(assert (=> b!120385 (= lt!187381 (readBitPure!0 (BitStream!4325 (buf!2856 (_2!5309 lt!187370)) (currentByte!5535 thiss!1305) (currentBit!5530 thiss!1305))))))

(assert (=> b!120385 (= lt!187365 (readBitPure!0 lt!187376))))

(assert (=> b!120385 (= lt!187376 (BitStream!4325 (buf!2856 (_2!5309 lt!187377)) (currentByte!5535 thiss!1305) (currentBit!5530 thiss!1305)))))

(assert (=> b!120385 e!78839))

(declare-fun res!99658 () Bool)

(assert (=> b!120385 (=> (not res!99658) (not e!78839))))

(assert (=> b!120385 (= res!99658 (isPrefixOf!0 thiss!1305 (_2!5309 lt!187370)))))

(declare-fun lt!187366 () Unit!7417)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4324 BitStream!4324 BitStream!4324) Unit!7417)

(assert (=> b!120385 (= lt!187366 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5309 lt!187377) (_2!5309 lt!187370)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4324 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!10088)

(assert (=> b!120385 (= lt!187370 (appendNLeastSignificantBitsLoop!0 (_2!5309 lt!187377) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!120385 e!78832))

(declare-fun res!99653 () Bool)

(assert (=> b!120385 (=> (not res!99653) (not e!78832))))

(assert (=> b!120385 (= res!99653 (= (size!2425 (buf!2856 thiss!1305)) (size!2425 (buf!2856 (_2!5309 lt!187377)))))))

(declare-fun appendBit!0 (BitStream!4324 Bool) tuple2!10088)

(assert (=> b!120385 (= lt!187377 (appendBit!0 thiss!1305 lt!187372))))

(assert (=> b!120385 (= lt!187372 (not (= (bvand v!199 lt!187373) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!120385 (= lt!187373 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(assert (= (and start!23792 res!99657) b!120382))

(assert (= (and b!120382 res!99661) b!120381))

(assert (= (and b!120381 res!99652) b!120376))

(assert (= (and b!120376 res!99654) b!120385))

(assert (= (and b!120385 res!99653) b!120375))

(assert (= (and b!120375 res!99662) b!120379))

(assert (= (and b!120379 res!99656) b!120384))

(assert (= (and b!120384 res!99660) b!120373))

(assert (= (and b!120385 res!99658) b!120377))

(assert (= (and b!120377 res!99655) b!120380))

(assert (= (and b!120385 res!99663) b!120378))

(assert (= (and b!120385 (not res!99659)) b!120374))

(assert (= start!23792 b!120383))

(declare-fun m!181853 () Bool)

(assert (=> b!120380 m!181853))

(declare-fun m!181855 () Bool)

(assert (=> b!120385 m!181855))

(declare-fun m!181857 () Bool)

(assert (=> b!120385 m!181857))

(declare-fun m!181859 () Bool)

(assert (=> b!120385 m!181859))

(declare-fun m!181861 () Bool)

(assert (=> b!120385 m!181861))

(declare-fun m!181863 () Bool)

(assert (=> b!120385 m!181863))

(declare-fun m!181865 () Bool)

(assert (=> b!120385 m!181865))

(declare-fun m!181867 () Bool)

(assert (=> b!120385 m!181867))

(declare-fun m!181869 () Bool)

(assert (=> b!120385 m!181869))

(declare-fun m!181871 () Bool)

(assert (=> b!120385 m!181871))

(declare-fun m!181873 () Bool)

(assert (=> b!120385 m!181873))

(declare-fun m!181875 () Bool)

(assert (=> b!120385 m!181875))

(declare-fun m!181877 () Bool)

(assert (=> b!120385 m!181877))

(declare-fun m!181879 () Bool)

(assert (=> b!120385 m!181879))

(declare-fun m!181881 () Bool)

(assert (=> b!120385 m!181881))

(declare-fun m!181883 () Bool)

(assert (=> b!120385 m!181883))

(declare-fun m!181885 () Bool)

(assert (=> b!120385 m!181885))

(declare-fun m!181887 () Bool)

(assert (=> b!120385 m!181887))

(declare-fun m!181889 () Bool)

(assert (=> b!120385 m!181889))

(declare-fun m!181891 () Bool)

(assert (=> b!120385 m!181891))

(declare-fun m!181893 () Bool)

(assert (=> b!120375 m!181893))

(declare-fun m!181895 () Bool)

(assert (=> b!120375 m!181895))

(declare-fun m!181897 () Bool)

(assert (=> b!120382 m!181897))

(declare-fun m!181899 () Bool)

(assert (=> b!120377 m!181899))

(declare-fun m!181901 () Bool)

(assert (=> b!120384 m!181901))

(assert (=> b!120384 m!181901))

(declare-fun m!181903 () Bool)

(assert (=> b!120384 m!181903))

(declare-fun m!181905 () Bool)

(assert (=> b!120374 m!181905))

(assert (=> b!120374 m!181895))

(declare-fun m!181907 () Bool)

(assert (=> b!120374 m!181907))

(declare-fun m!181909 () Bool)

(assert (=> b!120374 m!181909))

(declare-fun m!181911 () Bool)

(assert (=> b!120374 m!181911))

(assert (=> b!120374 m!181907))

(declare-fun m!181913 () Bool)

(assert (=> b!120374 m!181913))

(declare-fun m!181915 () Bool)

(assert (=> b!120374 m!181915))

(assert (=> b!120374 m!181893))

(declare-fun m!181917 () Bool)

(assert (=> b!120373 m!181917))

(declare-fun m!181919 () Bool)

(assert (=> b!120381 m!181919))

(declare-fun m!181921 () Bool)

(assert (=> b!120383 m!181921))

(declare-fun m!181923 () Bool)

(assert (=> b!120379 m!181923))

(declare-fun m!181925 () Bool)

(assert (=> start!23792 m!181925))

(push 1)

(assert (not b!120377))

(assert (not b!120380))

(assert (not b!120385))

(assert (not b!120375))

(assert (not b!120384))

(assert (not b!120381))

(assert (not b!120382))

(assert (not b!120383))

(assert (not start!23792))

(assert (not b!120373))

(assert (not b!120374))

(assert (not b!120379))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!38794 () Bool)

(declare-datatypes ((tuple2!10112 0))(
  ( (tuple2!10113 (_1!5321 Bool) (_2!5321 BitStream!4324)) )
))
(declare-fun lt!187682 () tuple2!10112)

(declare-fun readBit!0 (BitStream!4324) tuple2!10112)

(assert (=> d!38794 (= lt!187682 (readBit!0 (readerFrom!0 (_2!5309 lt!187377) (currentBit!5530 thiss!1305) (currentByte!5535 thiss!1305))))))

(assert (=> d!38794 (= (readBitPure!0 (readerFrom!0 (_2!5309 lt!187377) (currentBit!5530 thiss!1305) (currentByte!5535 thiss!1305))) (tuple2!10085 (_2!5321 lt!187682) (_1!5321 lt!187682)))))

(declare-fun bs!9383 () Bool)

(assert (= bs!9383 d!38794))

(assert (=> bs!9383 m!181901))

(declare-fun m!182157 () Bool)

(assert (=> bs!9383 m!182157))

(assert (=> b!120384 d!38794))

(declare-fun d!38798 () Bool)

(declare-fun e!78920 () Bool)

(assert (=> d!38798 e!78920))

(declare-fun res!99769 () Bool)

(assert (=> d!38798 (=> (not res!99769) (not e!78920))))

(assert (=> d!38798 (= res!99769 (invariant!0 (currentBit!5530 (_2!5309 lt!187377)) (currentByte!5535 (_2!5309 lt!187377)) (size!2425 (buf!2856 (_2!5309 lt!187377)))))))

(assert (=> d!38798 (= (readerFrom!0 (_2!5309 lt!187377) (currentBit!5530 thiss!1305) (currentByte!5535 thiss!1305)) (BitStream!4325 (buf!2856 (_2!5309 lt!187377)) (currentByte!5535 thiss!1305) (currentBit!5530 thiss!1305)))))

(declare-fun b!120505 () Bool)

(assert (=> b!120505 (= e!78920 (invariant!0 (currentBit!5530 thiss!1305) (currentByte!5535 thiss!1305) (size!2425 (buf!2856 (_2!5309 lt!187377)))))))

(assert (= (and d!38798 res!99769) b!120505))

(declare-fun m!182159 () Bool)

(assert (=> d!38798 m!182159))

(assert (=> b!120505 m!181899))

(assert (=> b!120384 d!38798))

(declare-fun d!38800 () Bool)

(declare-fun e!78934 () Bool)

(assert (=> d!38800 e!78934))

(declare-fun res!99794 () Bool)

(assert (=> d!38800 (=> (not res!99794) (not e!78934))))

(declare-fun lt!187730 () (_ BitVec 64))

(declare-fun lt!187728 () (_ BitVec 64))

(declare-fun lt!187729 () (_ BitVec 64))

(assert (=> d!38800 (= res!99794 (= lt!187730 (bvsub lt!187728 lt!187729)))))

(assert (=> d!38800 (or (= (bvand lt!187728 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!187729 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!187728 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!187728 lt!187729) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!38800 (= lt!187729 (remainingBits!0 ((_ sign_extend 32) (size!2425 (buf!2856 (_1!5307 lt!187389)))) ((_ sign_extend 32) (currentByte!5535 (_1!5307 lt!187389))) ((_ sign_extend 32) (currentBit!5530 (_1!5307 lt!187389)))))))

(declare-fun lt!187725 () (_ BitVec 64))

(declare-fun lt!187727 () (_ BitVec 64))

(assert (=> d!38800 (= lt!187728 (bvmul lt!187725 lt!187727))))

(assert (=> d!38800 (or (= lt!187725 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!187727 (bvsdiv (bvmul lt!187725 lt!187727) lt!187725)))))

(assert (=> d!38800 (= lt!187727 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!38800 (= lt!187725 ((_ sign_extend 32) (size!2425 (buf!2856 (_1!5307 lt!187389)))))))

(assert (=> d!38800 (= lt!187730 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5535 (_1!5307 lt!187389))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5530 (_1!5307 lt!187389)))))))

(assert (=> d!38800 (invariant!0 (currentBit!5530 (_1!5307 lt!187389)) (currentByte!5535 (_1!5307 lt!187389)) (size!2425 (buf!2856 (_1!5307 lt!187389))))))

(assert (=> d!38800 (= (bitIndex!0 (size!2425 (buf!2856 (_1!5307 lt!187389))) (currentByte!5535 (_1!5307 lt!187389)) (currentBit!5530 (_1!5307 lt!187389))) lt!187730)))

(declare-fun b!120529 () Bool)

(declare-fun res!99793 () Bool)

(assert (=> b!120529 (=> (not res!99793) (not e!78934))))

(assert (=> b!120529 (= res!99793 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!187730))))

(declare-fun b!120530 () Bool)

(declare-fun lt!187726 () (_ BitVec 64))

(assert (=> b!120530 (= e!78934 (bvsle lt!187730 (bvmul lt!187726 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!120530 (or (= lt!187726 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!187726 #b0000000000000000000000000000000000000000000000000000000000001000) lt!187726)))))

(assert (=> b!120530 (= lt!187726 ((_ sign_extend 32) (size!2425 (buf!2856 (_1!5307 lt!187389)))))))

(assert (= (and d!38800 res!99794) b!120529))

(assert (= (and b!120529 res!99793) b!120530))

(declare-fun m!182175 () Bool)

(assert (=> d!38800 m!182175))

(declare-fun m!182177 () Bool)

(assert (=> d!38800 m!182177))

(assert (=> b!120373 d!38800))

(declare-fun d!38820 () Bool)

(assert (=> d!38820 (= (array_inv!2227 (buf!2856 thiss!1305)) (bvsge (size!2425 (buf!2856 thiss!1305)) #b00000000000000000000000000000000))))

(assert (=> b!120383 d!38820))

(declare-fun d!38822 () Bool)

(assert (=> d!38822 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2425 (buf!2856 thiss!1305))) ((_ sign_extend 32) (currentByte!5535 thiss!1305)) ((_ sign_extend 32) (currentBit!5530 thiss!1305)) lt!187391) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2425 (buf!2856 thiss!1305))) ((_ sign_extend 32) (currentByte!5535 thiss!1305)) ((_ sign_extend 32) (currentBit!5530 thiss!1305))) lt!187391))))

(declare-fun bs!9386 () Bool)

(assert (= bs!9386 d!38822))

(declare-fun m!182179 () Bool)

(assert (=> bs!9386 m!182179))

(assert (=> b!120382 d!38822))

(declare-fun d!38824 () Bool)

(assert (=> d!38824 (= (onesLSBLong!0 nBits!396) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!396))))))

(assert (=> b!120381 d!38824))

(declare-fun d!38826 () Bool)

(assert (=> d!38826 (= (invariant!0 (currentBit!5530 thiss!1305) (currentByte!5535 thiss!1305) (size!2425 (buf!2856 (_2!5309 lt!187370)))) (and (bvsge (currentBit!5530 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5530 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5535 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5535 thiss!1305) (size!2425 (buf!2856 (_2!5309 lt!187370)))) (and (= (currentBit!5530 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5535 thiss!1305) (size!2425 (buf!2856 (_2!5309 lt!187370))))))))))

(assert (=> b!120380 d!38826))

(declare-fun d!38830 () Bool)

(declare-fun res!99805 () Bool)

(declare-fun e!78943 () Bool)

(assert (=> d!38830 (=> (not res!99805) (not e!78943))))

(assert (=> d!38830 (= res!99805 (= (size!2425 (buf!2856 thiss!1305)) (size!2425 (buf!2856 (_2!5309 lt!187377)))))))

(assert (=> d!38830 (= (isPrefixOf!0 thiss!1305 (_2!5309 lt!187377)) e!78943)))

(declare-fun b!120540 () Bool)

(declare-fun res!99806 () Bool)

(assert (=> b!120540 (=> (not res!99806) (not e!78943))))

(assert (=> b!120540 (= res!99806 (bvsle (bitIndex!0 (size!2425 (buf!2856 thiss!1305)) (currentByte!5535 thiss!1305) (currentBit!5530 thiss!1305)) (bitIndex!0 (size!2425 (buf!2856 (_2!5309 lt!187377))) (currentByte!5535 (_2!5309 lt!187377)) (currentBit!5530 (_2!5309 lt!187377)))))))

(declare-fun b!120541 () Bool)

(declare-fun e!78942 () Bool)

(assert (=> b!120541 (= e!78943 e!78942)))

(declare-fun res!99807 () Bool)

(assert (=> b!120541 (=> res!99807 e!78942)))

(assert (=> b!120541 (= res!99807 (= (size!2425 (buf!2856 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!120542 () Bool)

(declare-fun arrayBitRangesEq!0 (array!5357 array!5357 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!120542 (= e!78942 (arrayBitRangesEq!0 (buf!2856 thiss!1305) (buf!2856 (_2!5309 lt!187377)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2425 (buf!2856 thiss!1305)) (currentByte!5535 thiss!1305) (currentBit!5530 thiss!1305))))))

(assert (= (and d!38830 res!99805) b!120540))

(assert (= (and b!120540 res!99806) b!120541))

(assert (= (and b!120541 (not res!99807)) b!120542))

(assert (=> b!120540 m!181895))

(assert (=> b!120540 m!181893))

(assert (=> b!120542 m!181895))

(assert (=> b!120542 m!181895))

(declare-fun m!182183 () Bool)

(assert (=> b!120542 m!182183))

(assert (=> b!120379 d!38830))

(declare-fun d!38836 () Bool)

(assert (=> d!38836 (= (invariant!0 (currentBit!5530 thiss!1305) (currentByte!5535 thiss!1305) (size!2425 (buf!2856 (_2!5309 lt!187377)))) (and (bvsge (currentBit!5530 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5530 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5535 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5535 thiss!1305) (size!2425 (buf!2856 (_2!5309 lt!187377)))) (and (= (currentBit!5530 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5535 thiss!1305) (size!2425 (buf!2856 (_2!5309 lt!187377))))))))))

(assert (=> b!120377 d!38836))

(declare-fun d!38838 () Bool)

(assert (=> d!38838 (= (inv!12 thiss!1305) (invariant!0 (currentBit!5530 thiss!1305) (currentByte!5535 thiss!1305) (size!2425 (buf!2856 thiss!1305))))))

(declare-fun bs!9388 () Bool)

(assert (= bs!9388 d!38838))

(declare-fun m!182185 () Bool)

(assert (=> bs!9388 m!182185))

(assert (=> start!23792 d!38838))

(declare-fun d!38840 () Bool)

(declare-fun e!78944 () Bool)

(assert (=> d!38840 e!78944))

(declare-fun res!99809 () Bool)

(assert (=> d!38840 (=> (not res!99809) (not e!78944))))

(declare-fun lt!187738 () (_ BitVec 64))

(declare-fun lt!187737 () (_ BitVec 64))

(declare-fun lt!187739 () (_ BitVec 64))

(assert (=> d!38840 (= res!99809 (= lt!187739 (bvsub lt!187737 lt!187738)))))

(assert (=> d!38840 (or (= (bvand lt!187737 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!187738 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!187737 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!187737 lt!187738) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38840 (= lt!187738 (remainingBits!0 ((_ sign_extend 32) (size!2425 (buf!2856 (_2!5309 lt!187377)))) ((_ sign_extend 32) (currentByte!5535 (_2!5309 lt!187377))) ((_ sign_extend 32) (currentBit!5530 (_2!5309 lt!187377)))))))

(declare-fun lt!187734 () (_ BitVec 64))

(declare-fun lt!187736 () (_ BitVec 64))

(assert (=> d!38840 (= lt!187737 (bvmul lt!187734 lt!187736))))

(assert (=> d!38840 (or (= lt!187734 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!187736 (bvsdiv (bvmul lt!187734 lt!187736) lt!187734)))))

(assert (=> d!38840 (= lt!187736 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!38840 (= lt!187734 ((_ sign_extend 32) (size!2425 (buf!2856 (_2!5309 lt!187377)))))))

(assert (=> d!38840 (= lt!187739 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5535 (_2!5309 lt!187377))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5530 (_2!5309 lt!187377)))))))

(assert (=> d!38840 (invariant!0 (currentBit!5530 (_2!5309 lt!187377)) (currentByte!5535 (_2!5309 lt!187377)) (size!2425 (buf!2856 (_2!5309 lt!187377))))))

(assert (=> d!38840 (= (bitIndex!0 (size!2425 (buf!2856 (_2!5309 lt!187377))) (currentByte!5535 (_2!5309 lt!187377)) (currentBit!5530 (_2!5309 lt!187377))) lt!187739)))

(declare-fun b!120543 () Bool)

(declare-fun res!99808 () Bool)

(assert (=> b!120543 (=> (not res!99808) (not e!78944))))

(assert (=> b!120543 (= res!99808 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!187739))))

(declare-fun b!120544 () Bool)

(declare-fun lt!187735 () (_ BitVec 64))

(assert (=> b!120544 (= e!78944 (bvsle lt!187739 (bvmul lt!187735 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!120544 (or (= lt!187735 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!187735 #b0000000000000000000000000000000000000000000000000000000000001000) lt!187735)))))

(assert (=> b!120544 (= lt!187735 ((_ sign_extend 32) (size!2425 (buf!2856 (_2!5309 lt!187377)))))))

(assert (= (and d!38840 res!99809) b!120543))

(assert (= (and b!120543 res!99808) b!120544))

(declare-fun m!182187 () Bool)

(assert (=> d!38840 m!182187))

(assert (=> d!38840 m!182159))

(assert (=> b!120375 d!38840))

(declare-fun d!38842 () Bool)

(declare-fun e!78945 () Bool)

(assert (=> d!38842 e!78945))

(declare-fun res!99811 () Bool)

(assert (=> d!38842 (=> (not res!99811) (not e!78945))))

(declare-fun lt!187744 () (_ BitVec 64))

(declare-fun lt!187743 () (_ BitVec 64))

(declare-fun lt!187745 () (_ BitVec 64))

(assert (=> d!38842 (= res!99811 (= lt!187745 (bvsub lt!187743 lt!187744)))))

(assert (=> d!38842 (or (= (bvand lt!187743 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!187744 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!187743 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!187743 lt!187744) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38842 (= lt!187744 (remainingBits!0 ((_ sign_extend 32) (size!2425 (buf!2856 thiss!1305))) ((_ sign_extend 32) (currentByte!5535 thiss!1305)) ((_ sign_extend 32) (currentBit!5530 thiss!1305))))))

(declare-fun lt!187740 () (_ BitVec 64))

(declare-fun lt!187742 () (_ BitVec 64))

(assert (=> d!38842 (= lt!187743 (bvmul lt!187740 lt!187742))))

(assert (=> d!38842 (or (= lt!187740 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!187742 (bvsdiv (bvmul lt!187740 lt!187742) lt!187740)))))

(assert (=> d!38842 (= lt!187742 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!38842 (= lt!187740 ((_ sign_extend 32) (size!2425 (buf!2856 thiss!1305))))))

(assert (=> d!38842 (= lt!187745 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5535 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5530 thiss!1305))))))

(assert (=> d!38842 (invariant!0 (currentBit!5530 thiss!1305) (currentByte!5535 thiss!1305) (size!2425 (buf!2856 thiss!1305)))))

(assert (=> d!38842 (= (bitIndex!0 (size!2425 (buf!2856 thiss!1305)) (currentByte!5535 thiss!1305) (currentBit!5530 thiss!1305)) lt!187745)))

(declare-fun b!120545 () Bool)

(declare-fun res!99810 () Bool)

(assert (=> b!120545 (=> (not res!99810) (not e!78945))))

(assert (=> b!120545 (= res!99810 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!187745))))

(declare-fun b!120546 () Bool)

(declare-fun lt!187741 () (_ BitVec 64))

(assert (=> b!120546 (= e!78945 (bvsle lt!187745 (bvmul lt!187741 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!120546 (or (= lt!187741 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!187741 #b0000000000000000000000000000000000000000000000000000000000001000) lt!187741)))))

(assert (=> b!120546 (= lt!187741 ((_ sign_extend 32) (size!2425 (buf!2856 thiss!1305))))))

(assert (= (and d!38842 res!99811) b!120545))

(assert (= (and b!120545 res!99810) b!120546))

(assert (=> d!38842 m!182179))

(assert (=> d!38842 m!182185))

(assert (=> b!120375 d!38842))

(declare-fun d!38844 () Bool)

(assert (=> d!38844 (= (onesLSBLong!0 (bvsub nBits!396 i!615)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!396 i!615)))))))

(assert (=> b!120385 d!38844))

(declare-fun d!38846 () Bool)

(declare-fun lt!187746 () tuple2!10112)

(assert (=> d!38846 (= lt!187746 (readBit!0 lt!187376))))

(assert (=> d!38846 (= (readBitPure!0 lt!187376) (tuple2!10085 (_2!5321 lt!187746) (_1!5321 lt!187746)))))

(declare-fun bs!9389 () Bool)

(assert (= bs!9389 d!38846))

(declare-fun m!182189 () Bool)

(assert (=> bs!9389 m!182189))

(assert (=> b!120385 d!38846))

(declare-fun d!38848 () Bool)

(assert (=> d!38848 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2425 (buf!2856 (_2!5309 lt!187370)))) ((_ sign_extend 32) (currentByte!5535 thiss!1305)) ((_ sign_extend 32) (currentBit!5530 thiss!1305)) lt!187391) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2425 (buf!2856 (_2!5309 lt!187370)))) ((_ sign_extend 32) (currentByte!5535 thiss!1305)) ((_ sign_extend 32) (currentBit!5530 thiss!1305))) lt!187391))))

(declare-fun bs!9390 () Bool)

(assert (= bs!9390 d!38848))

(declare-fun m!182191 () Bool)

(assert (=> bs!9390 m!182191))

(assert (=> b!120385 d!38848))

(declare-datatypes ((tuple2!10118 0))(
  ( (tuple2!10119 (_1!5324 (_ BitVec 64)) (_2!5324 BitStream!4324)) )
))
(declare-fun lt!187749 () tuple2!10118)

(declare-fun d!38850 () Bool)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!4324 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!10118)

(assert (=> d!38850 (= lt!187749 (readNLeastSignificantBitsLoop!0 (_1!5308 lt!187384) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!187383))))

(assert (=> d!38850 (= (readNLeastSignificantBitsLoopPure!0 (_1!5308 lt!187384) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!187383) (tuple2!10091 (_2!5324 lt!187749) (_1!5324 lt!187749)))))

(declare-fun bs!9392 () Bool)

(assert (= bs!9392 d!38850))

(declare-fun m!182193 () Bool)

(assert (=> bs!9392 m!182193))

(assert (=> b!120385 d!38850))

(declare-fun d!38852 () Bool)

(declare-fun lt!187752 () tuple2!10112)

(assert (=> d!38852 (= lt!187752 (readBit!0 (_1!5308 lt!187387)))))

(assert (=> d!38852 (= (readBitPure!0 (_1!5308 lt!187387)) (tuple2!10085 (_2!5321 lt!187752) (_1!5321 lt!187752)))))

(declare-fun bs!9393 () Bool)

(assert (= bs!9393 d!38852))

(declare-fun m!182195 () Bool)

(assert (=> bs!9393 m!182195))

(assert (=> b!120385 d!38852))

(declare-fun d!38854 () Bool)

(assert (=> d!38854 (validate_offset_bits!1 ((_ sign_extend 32) (size!2425 (buf!2856 (_2!5309 lt!187370)))) ((_ sign_extend 32) (currentByte!5535 (_2!5309 lt!187377))) ((_ sign_extend 32) (currentBit!5530 (_2!5309 lt!187377))) lt!187367)))

(declare-fun lt!187771 () Unit!7417)

(declare-fun choose!9 (BitStream!4324 array!5357 (_ BitVec 64) BitStream!4324) Unit!7417)

(assert (=> d!38854 (= lt!187771 (choose!9 (_2!5309 lt!187377) (buf!2856 (_2!5309 lt!187370)) lt!187367 (BitStream!4325 (buf!2856 (_2!5309 lt!187370)) (currentByte!5535 (_2!5309 lt!187377)) (currentBit!5530 (_2!5309 lt!187377)))))))

(assert (=> d!38854 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5309 lt!187377) (buf!2856 (_2!5309 lt!187370)) lt!187367) lt!187771)))

(declare-fun bs!9395 () Bool)

(assert (= bs!9395 d!38854))

(assert (=> bs!9395 m!181865))

(declare-fun m!182201 () Bool)

(assert (=> bs!9395 m!182201))

(assert (=> b!120385 d!38854))

(declare-fun d!38858 () Bool)

(declare-fun lt!187772 () tuple2!10112)

(assert (=> d!38858 (= lt!187772 (readBit!0 (BitStream!4325 (buf!2856 (_2!5309 lt!187370)) (currentByte!5535 thiss!1305) (currentBit!5530 thiss!1305))))))

(assert (=> d!38858 (= (readBitPure!0 (BitStream!4325 (buf!2856 (_2!5309 lt!187370)) (currentByte!5535 thiss!1305) (currentBit!5530 thiss!1305))) (tuple2!10085 (_2!5321 lt!187772) (_1!5321 lt!187772)))))

(declare-fun bs!9396 () Bool)

(assert (= bs!9396 d!38858))

(declare-fun m!182203 () Bool)

(assert (=> bs!9396 m!182203))

(assert (=> b!120385 d!38858))

(declare-fun d!38860 () Bool)

(assert (=> d!38860 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2425 (buf!2856 (_2!5309 lt!187370)))) ((_ sign_extend 32) (currentByte!5535 (_2!5309 lt!187377))) ((_ sign_extend 32) (currentBit!5530 (_2!5309 lt!187377))) lt!187367) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2425 (buf!2856 (_2!5309 lt!187370)))) ((_ sign_extend 32) (currentByte!5535 (_2!5309 lt!187377))) ((_ sign_extend 32) (currentBit!5530 (_2!5309 lt!187377)))) lt!187367))))

(declare-fun bs!9397 () Bool)

(assert (= bs!9397 d!38860))

(declare-fun m!182205 () Bool)

(assert (=> bs!9397 m!182205))

(assert (=> b!120385 d!38860))

(declare-fun d!38862 () Bool)

(assert (=> d!38862 (validate_offset_bits!1 ((_ sign_extend 32) (size!2425 (buf!2856 (_2!5309 lt!187370)))) ((_ sign_extend 32) (currentByte!5535 thiss!1305)) ((_ sign_extend 32) (currentBit!5530 thiss!1305)) lt!187391)))

(declare-fun lt!187773 () Unit!7417)

(assert (=> d!38862 (= lt!187773 (choose!9 thiss!1305 (buf!2856 (_2!5309 lt!187370)) lt!187391 (BitStream!4325 (buf!2856 (_2!5309 lt!187370)) (currentByte!5535 thiss!1305) (currentBit!5530 thiss!1305))))))

(assert (=> d!38862 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2856 (_2!5309 lt!187370)) lt!187391) lt!187773)))

(declare-fun bs!9398 () Bool)

(assert (= bs!9398 d!38862))

(assert (=> bs!9398 m!181889))

(declare-fun m!182207 () Bool)

(assert (=> bs!9398 m!182207))

(assert (=> b!120385 d!38862))

(declare-fun d!38864 () Bool)

(assert (=> d!38864 (isPrefixOf!0 thiss!1305 (_2!5309 lt!187370))))

(declare-fun lt!187779 () Unit!7417)

(declare-fun choose!30 (BitStream!4324 BitStream!4324 BitStream!4324) Unit!7417)

(assert (=> d!38864 (= lt!187779 (choose!30 thiss!1305 (_2!5309 lt!187377) (_2!5309 lt!187370)))))

(assert (=> d!38864 (isPrefixOf!0 thiss!1305 (_2!5309 lt!187377))))

(assert (=> d!38864 (= (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5309 lt!187377) (_2!5309 lt!187370)) lt!187779)))

(declare-fun bs!9400 () Bool)

(assert (= bs!9400 d!38864))

(assert (=> bs!9400 m!181879))

(declare-fun m!182211 () Bool)

(assert (=> bs!9400 m!182211))

(assert (=> bs!9400 m!181923))

(assert (=> b!120385 d!38864))

(declare-fun d!38868 () Bool)

(declare-fun e!78946 () Bool)

(assert (=> d!38868 e!78946))

(declare-fun res!99813 () Bool)

(assert (=> d!38868 (=> (not res!99813) (not e!78946))))

(declare-fun lt!187784 () (_ BitVec 64))

(declare-fun lt!187785 () (_ BitVec 64))

(declare-fun lt!187783 () (_ BitVec 64))

(assert (=> d!38868 (= res!99813 (= lt!187785 (bvsub lt!187783 lt!187784)))))

(assert (=> d!38868 (or (= (bvand lt!187783 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!187784 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!187783 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!187783 lt!187784) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38868 (= lt!187784 (remainingBits!0 ((_ sign_extend 32) (size!2425 (buf!2856 (_1!5307 lt!187365)))) ((_ sign_extend 32) (currentByte!5535 (_1!5307 lt!187365))) ((_ sign_extend 32) (currentBit!5530 (_1!5307 lt!187365)))))))

(declare-fun lt!187780 () (_ BitVec 64))

(declare-fun lt!187782 () (_ BitVec 64))

(assert (=> d!38868 (= lt!187783 (bvmul lt!187780 lt!187782))))

(assert (=> d!38868 (or (= lt!187780 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!187782 (bvsdiv (bvmul lt!187780 lt!187782) lt!187780)))))

(assert (=> d!38868 (= lt!187782 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!38868 (= lt!187780 ((_ sign_extend 32) (size!2425 (buf!2856 (_1!5307 lt!187365)))))))

(assert (=> d!38868 (= lt!187785 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5535 (_1!5307 lt!187365))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5530 (_1!5307 lt!187365)))))))

(assert (=> d!38868 (invariant!0 (currentBit!5530 (_1!5307 lt!187365)) (currentByte!5535 (_1!5307 lt!187365)) (size!2425 (buf!2856 (_1!5307 lt!187365))))))

(assert (=> d!38868 (= (bitIndex!0 (size!2425 (buf!2856 (_1!5307 lt!187365))) (currentByte!5535 (_1!5307 lt!187365)) (currentBit!5530 (_1!5307 lt!187365))) lt!187785)))

(declare-fun b!120547 () Bool)

(declare-fun res!99812 () Bool)

(assert (=> b!120547 (=> (not res!99812) (not e!78946))))

(assert (=> b!120547 (= res!99812 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!187785))))

(declare-fun b!120548 () Bool)

(declare-fun lt!187781 () (_ BitVec 64))

(assert (=> b!120548 (= e!78946 (bvsle lt!187785 (bvmul lt!187781 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!120548 (or (= lt!187781 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!187781 #b0000000000000000000000000000000000000000000000000000000000001000) lt!187781)))))

(assert (=> b!120548 (= lt!187781 ((_ sign_extend 32) (size!2425 (buf!2856 (_1!5307 lt!187365)))))))

(assert (= (and d!38868 res!99813) b!120547))

(assert (= (and b!120547 res!99812) b!120548))

(declare-fun m!182213 () Bool)

(assert (=> d!38868 m!182213))

(declare-fun m!182215 () Bool)

(assert (=> d!38868 m!182215))

(assert (=> b!120385 d!38868))

(declare-fun lt!187850 () (_ BitVec 64))

(declare-fun lt!187846 () tuple2!10086)

(declare-fun lt!187855 () (_ BitVec 64))

(declare-fun b!120569 () Bool)

(declare-fun e!78959 () Bool)

(assert (=> b!120569 (= e!78959 (= (_1!5308 lt!187846) (withMovedBitIndex!0 (_2!5308 lt!187846) (bvsub lt!187855 lt!187850))))))

(assert (=> b!120569 (or (= (bvand lt!187855 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!187850 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!187855 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!187855 lt!187850) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!120569 (= lt!187850 (bitIndex!0 (size!2425 (buf!2856 (_2!5309 lt!187370))) (currentByte!5535 (_2!5309 lt!187370)) (currentBit!5530 (_2!5309 lt!187370))))))

(assert (=> b!120569 (= lt!187855 (bitIndex!0 (size!2425 (buf!2856 thiss!1305)) (currentByte!5535 thiss!1305) (currentBit!5530 thiss!1305)))))

(declare-fun b!120570 () Bool)

(declare-fun e!78960 () Unit!7417)

(declare-fun lt!187845 () Unit!7417)

(assert (=> b!120570 (= e!78960 lt!187845)))

(declare-fun lt!187849 () (_ BitVec 64))

(assert (=> b!120570 (= lt!187849 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!187852 () (_ BitVec 64))

(assert (=> b!120570 (= lt!187852 (bitIndex!0 (size!2425 (buf!2856 thiss!1305)) (currentByte!5535 thiss!1305) (currentBit!5530 thiss!1305)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!5357 array!5357 (_ BitVec 64) (_ BitVec 64)) Unit!7417)

(assert (=> b!120570 (= lt!187845 (arrayBitRangesEqSymmetric!0 (buf!2856 thiss!1305) (buf!2856 (_2!5309 lt!187370)) lt!187849 lt!187852))))

(assert (=> b!120570 (arrayBitRangesEq!0 (buf!2856 (_2!5309 lt!187370)) (buf!2856 thiss!1305) lt!187849 lt!187852)))

(declare-fun b!120571 () Bool)

(declare-fun res!99832 () Bool)

(assert (=> b!120571 (=> (not res!99832) (not e!78959))))

(assert (=> b!120571 (= res!99832 (isPrefixOf!0 (_1!5308 lt!187846) thiss!1305))))

(declare-fun d!38870 () Bool)

(assert (=> d!38870 e!78959))

(declare-fun res!99831 () Bool)

(assert (=> d!38870 (=> (not res!99831) (not e!78959))))

(assert (=> d!38870 (= res!99831 (isPrefixOf!0 (_1!5308 lt!187846) (_2!5308 lt!187846)))))

(declare-fun lt!187847 () BitStream!4324)

(assert (=> d!38870 (= lt!187846 (tuple2!10087 lt!187847 (_2!5309 lt!187370)))))

(declare-fun lt!187861 () Unit!7417)

(declare-fun lt!187858 () Unit!7417)

(assert (=> d!38870 (= lt!187861 lt!187858)))

(assert (=> d!38870 (isPrefixOf!0 lt!187847 (_2!5309 lt!187370))))

(assert (=> d!38870 (= lt!187858 (lemmaIsPrefixTransitive!0 lt!187847 (_2!5309 lt!187370) (_2!5309 lt!187370)))))

(declare-fun lt!187856 () Unit!7417)

(declare-fun lt!187862 () Unit!7417)

(assert (=> d!38870 (= lt!187856 lt!187862)))

(assert (=> d!38870 (isPrefixOf!0 lt!187847 (_2!5309 lt!187370))))

(assert (=> d!38870 (= lt!187862 (lemmaIsPrefixTransitive!0 lt!187847 thiss!1305 (_2!5309 lt!187370)))))

(declare-fun lt!187860 () Unit!7417)

(assert (=> d!38870 (= lt!187860 e!78960)))

(declare-fun c!7247 () Bool)

(assert (=> d!38870 (= c!7247 (not (= (size!2425 (buf!2856 thiss!1305)) #b00000000000000000000000000000000)))))

(declare-fun lt!187851 () Unit!7417)

(declare-fun lt!187854 () Unit!7417)

(assert (=> d!38870 (= lt!187851 lt!187854)))

(assert (=> d!38870 (isPrefixOf!0 (_2!5309 lt!187370) (_2!5309 lt!187370))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4324) Unit!7417)

(assert (=> d!38870 (= lt!187854 (lemmaIsPrefixRefl!0 (_2!5309 lt!187370)))))

(declare-fun lt!187848 () Unit!7417)

(declare-fun lt!187863 () Unit!7417)

(assert (=> d!38870 (= lt!187848 lt!187863)))

(assert (=> d!38870 (= lt!187863 (lemmaIsPrefixRefl!0 (_2!5309 lt!187370)))))

(declare-fun lt!187853 () Unit!7417)

(declare-fun lt!187857 () Unit!7417)

(assert (=> d!38870 (= lt!187853 lt!187857)))

(assert (=> d!38870 (isPrefixOf!0 lt!187847 lt!187847)))

(assert (=> d!38870 (= lt!187857 (lemmaIsPrefixRefl!0 lt!187847))))

(declare-fun lt!187864 () Unit!7417)

(declare-fun lt!187859 () Unit!7417)

(assert (=> d!38870 (= lt!187864 lt!187859)))

(assert (=> d!38870 (isPrefixOf!0 thiss!1305 thiss!1305)))

(assert (=> d!38870 (= lt!187859 (lemmaIsPrefixRefl!0 thiss!1305))))

(assert (=> d!38870 (= lt!187847 (BitStream!4325 (buf!2856 (_2!5309 lt!187370)) (currentByte!5535 thiss!1305) (currentBit!5530 thiss!1305)))))

(assert (=> d!38870 (isPrefixOf!0 thiss!1305 (_2!5309 lt!187370))))

(assert (=> d!38870 (= (reader!0 thiss!1305 (_2!5309 lt!187370)) lt!187846)))

(declare-fun b!120572 () Bool)

(declare-fun Unit!7431 () Unit!7417)

(assert (=> b!120572 (= e!78960 Unit!7431)))

(declare-fun b!120573 () Bool)

(declare-fun res!99830 () Bool)

(assert (=> b!120573 (=> (not res!99830) (not e!78959))))

(assert (=> b!120573 (= res!99830 (isPrefixOf!0 (_2!5308 lt!187846) (_2!5309 lt!187370)))))

(assert (= (and d!38870 c!7247) b!120570))

(assert (= (and d!38870 (not c!7247)) b!120572))

(assert (= (and d!38870 res!99831) b!120571))

(assert (= (and b!120571 res!99832) b!120573))

(assert (= (and b!120573 res!99830) b!120569))

(declare-fun m!182249 () Bool)

(assert (=> d!38870 m!182249))

(declare-fun m!182251 () Bool)

(assert (=> d!38870 m!182251))

(assert (=> d!38870 m!181879))

(declare-fun m!182253 () Bool)

(assert (=> d!38870 m!182253))

(declare-fun m!182255 () Bool)

(assert (=> d!38870 m!182255))

(declare-fun m!182257 () Bool)

(assert (=> d!38870 m!182257))

(declare-fun m!182259 () Bool)

(assert (=> d!38870 m!182259))

(declare-fun m!182261 () Bool)

(assert (=> d!38870 m!182261))

(declare-fun m!182263 () Bool)

(assert (=> d!38870 m!182263))

(declare-fun m!182265 () Bool)

(assert (=> d!38870 m!182265))

(declare-fun m!182267 () Bool)

(assert (=> d!38870 m!182267))

(assert (=> b!120570 m!181895))

(declare-fun m!182269 () Bool)

(assert (=> b!120570 m!182269))

(declare-fun m!182271 () Bool)

(assert (=> b!120570 m!182271))

(declare-fun m!182273 () Bool)

(assert (=> b!120569 m!182273))

(assert (=> b!120569 m!181915))

(assert (=> b!120569 m!181895))

(declare-fun m!182275 () Bool)

(assert (=> b!120573 m!182275))

(declare-fun m!182277 () Bool)

(assert (=> b!120571 m!182277))

(assert (=> b!120385 d!38870))

(declare-fun b!120728 () Bool)

(declare-fun e!79054 () Bool)

(declare-fun lt!188406 () tuple2!10084)

(declare-fun lt!188378 () tuple2!10088)

(assert (=> b!120728 (= e!79054 (= (bitIndex!0 (size!2425 (buf!2856 (_1!5307 lt!188406))) (currentByte!5535 (_1!5307 lt!188406)) (currentBit!5530 (_1!5307 lt!188406))) (bitIndex!0 (size!2425 (buf!2856 (_2!5309 lt!188378))) (currentByte!5535 (_2!5309 lt!188378)) (currentBit!5530 (_2!5309 lt!188378)))))))

(declare-fun b!120729 () Bool)

(declare-fun e!79051 () Bool)

(declare-fun lt!188402 () (_ BitVec 64))

(assert (=> b!120729 (= e!79051 (validate_offset_bits!1 ((_ sign_extend 32) (size!2425 (buf!2856 (_2!5309 lt!187377)))) ((_ sign_extend 32) (currentByte!5535 (_2!5309 lt!187377))) ((_ sign_extend 32) (currentBit!5530 (_2!5309 lt!187377))) lt!188402))))

(declare-fun b!120730 () Bool)

(declare-fun res!99952 () Bool)

(declare-fun e!79053 () Bool)

(assert (=> b!120730 (=> (not res!99952) (not e!79053))))

(declare-fun lt!188371 () tuple2!10088)

(assert (=> b!120730 (= res!99952 (isPrefixOf!0 (_2!5309 lt!187377) (_2!5309 lt!188371)))))

(declare-fun b!120732 () Bool)

(declare-fun e!79052 () Bool)

(declare-fun lt!188376 () tuple2!10084)

(declare-fun lt!188379 () tuple2!10084)

(assert (=> b!120732 (= e!79052 (= (_2!5307 lt!188376) (_2!5307 lt!188379)))))

(declare-fun b!120733 () Bool)

(declare-fun e!79049 () tuple2!10088)

(declare-fun lt!188390 () Unit!7417)

(assert (=> b!120733 (= e!79049 (tuple2!10089 lt!188390 (_2!5309 lt!187377)))))

(declare-fun lt!188407 () BitStream!4324)

(assert (=> b!120733 (= lt!188407 (_2!5309 lt!187377))))

(assert (=> b!120733 (= lt!188390 (lemmaIsPrefixRefl!0 lt!188407))))

(declare-fun call!1580 () Bool)

(assert (=> b!120733 call!1580))

(declare-fun b!120734 () Bool)

(assert (=> b!120734 (= lt!188406 (readBitPure!0 (readerFrom!0 (_2!5309 lt!188378) (currentBit!5530 (_2!5309 lt!187377)) (currentByte!5535 (_2!5309 lt!187377)))))))

(declare-fun res!99957 () Bool)

(declare-fun lt!188377 () Bool)

(assert (=> b!120734 (= res!99957 (and (= (_2!5307 lt!188406) lt!188377) (= (_1!5307 lt!188406) (_2!5309 lt!188378))))))

(assert (=> b!120734 (=> (not res!99957) (not e!79054))))

(declare-fun e!79048 () Bool)

(assert (=> b!120734 (= e!79048 e!79054)))

(declare-fun b!120735 () Bool)

(declare-fun res!99950 () Bool)

(assert (=> b!120735 (= res!99950 (= (bitIndex!0 (size!2425 (buf!2856 (_2!5309 lt!188378))) (currentByte!5535 (_2!5309 lt!188378)) (currentBit!5530 (_2!5309 lt!188378))) (bvadd (bitIndex!0 (size!2425 (buf!2856 (_2!5309 lt!187377))) (currentByte!5535 (_2!5309 lt!187377)) (currentBit!5530 (_2!5309 lt!187377))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!120735 (=> (not res!99950) (not e!79048))))

(declare-fun lt!188380 () tuple2!10086)

(declare-fun b!120736 () Bool)

(declare-fun lt!188388 () tuple2!10090)

(assert (=> b!120736 (= e!79053 (and (= (_2!5310 lt!188388) v!199) (= (_1!5310 lt!188388) (_2!5308 lt!188380))))))

(declare-fun lt!188415 () (_ BitVec 64))

(assert (=> b!120736 (= lt!188388 (readNLeastSignificantBitsLoopPure!0 (_1!5308 lt!188380) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!188415))))

(declare-fun lt!188391 () Unit!7417)

(declare-fun lt!188408 () Unit!7417)

(assert (=> b!120736 (= lt!188391 lt!188408)))

(assert (=> b!120736 (validate_offset_bits!1 ((_ sign_extend 32) (size!2425 (buf!2856 (_2!5309 lt!188371)))) ((_ sign_extend 32) (currentByte!5535 (_2!5309 lt!187377))) ((_ sign_extend 32) (currentBit!5530 (_2!5309 lt!187377))) lt!188402)))

(assert (=> b!120736 (= lt!188408 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5309 lt!187377) (buf!2856 (_2!5309 lt!188371)) lt!188402))))

(assert (=> b!120736 e!79051))

(declare-fun res!99958 () Bool)

(assert (=> b!120736 (=> (not res!99958) (not e!79051))))

(assert (=> b!120736 (= res!99958 (and (= (size!2425 (buf!2856 (_2!5309 lt!187377))) (size!2425 (buf!2856 (_2!5309 lt!188371)))) (bvsge lt!188402 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!120736 (= lt!188402 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!120736 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!120736 (= lt!188415 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(assert (=> b!120736 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!120736 (= lt!188380 (reader!0 (_2!5309 lt!187377) (_2!5309 lt!188371)))))

(declare-fun b!120737 () Bool)

(declare-fun lt!188397 () tuple2!10088)

(declare-fun Unit!7433 () Unit!7417)

(assert (=> b!120737 (= e!79049 (tuple2!10089 Unit!7433 (_2!5309 lt!188397)))))

(assert (=> b!120737 (= lt!188377 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!120737 (= lt!188378 (appendBit!0 (_2!5309 lt!187377) lt!188377))))

(declare-fun res!99954 () Bool)

(assert (=> b!120737 (= res!99954 (= (size!2425 (buf!2856 (_2!5309 lt!187377))) (size!2425 (buf!2856 (_2!5309 lt!188378)))))))

(assert (=> b!120737 (=> (not res!99954) (not e!79048))))

(assert (=> b!120737 e!79048))

(declare-fun lt!188399 () tuple2!10088)

(assert (=> b!120737 (= lt!188399 lt!188378)))

(assert (=> b!120737 (= lt!188397 (appendNLeastSignificantBitsLoop!0 (_2!5309 lt!188399) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))))

(declare-fun lt!188403 () Unit!7417)

(assert (=> b!120737 (= lt!188403 (lemmaIsPrefixTransitive!0 (_2!5309 lt!187377) (_2!5309 lt!188399) (_2!5309 lt!188397)))))

(assert (=> b!120737 (isPrefixOf!0 (_2!5309 lt!187377) (_2!5309 lt!188397))))

(declare-fun lt!188398 () Unit!7417)

(assert (=> b!120737 (= lt!188398 lt!188403)))

(assert (=> b!120737 (invariant!0 (currentBit!5530 (_2!5309 lt!187377)) (currentByte!5535 (_2!5309 lt!187377)) (size!2425 (buf!2856 (_2!5309 lt!188399))))))

(declare-fun lt!188374 () BitStream!4324)

(assert (=> b!120737 (= lt!188374 (BitStream!4325 (buf!2856 (_2!5309 lt!188399)) (currentByte!5535 (_2!5309 lt!187377)) (currentBit!5530 (_2!5309 lt!187377))))))

(assert (=> b!120737 (invariant!0 (currentBit!5530 lt!188374) (currentByte!5535 lt!188374) (size!2425 (buf!2856 (_2!5309 lt!188397))))))

(declare-fun lt!188372 () BitStream!4324)

(assert (=> b!120737 (= lt!188372 (BitStream!4325 (buf!2856 (_2!5309 lt!188397)) (currentByte!5535 lt!188374) (currentBit!5530 lt!188374)))))

(assert (=> b!120737 (= lt!188376 (readBitPure!0 lt!188374))))

(assert (=> b!120737 (= lt!188379 (readBitPure!0 lt!188372))))

(declare-fun lt!188392 () Unit!7417)

(assert (=> b!120737 (= lt!188392 (readBitPrefixLemma!0 lt!188374 (_2!5309 lt!188397)))))

(declare-fun res!99956 () Bool)

(assert (=> b!120737 (= res!99956 (= (bitIndex!0 (size!2425 (buf!2856 (_1!5307 lt!188376))) (currentByte!5535 (_1!5307 lt!188376)) (currentBit!5530 (_1!5307 lt!188376))) (bitIndex!0 (size!2425 (buf!2856 (_1!5307 lt!188379))) (currentByte!5535 (_1!5307 lt!188379)) (currentBit!5530 (_1!5307 lt!188379)))))))

(assert (=> b!120737 (=> (not res!99956) (not e!79052))))

(assert (=> b!120737 e!79052))

(declare-fun lt!188384 () Unit!7417)

(assert (=> b!120737 (= lt!188384 lt!188392)))

(declare-fun lt!188381 () tuple2!10086)

(assert (=> b!120737 (= lt!188381 (reader!0 (_2!5309 lt!187377) (_2!5309 lt!188397)))))

(declare-fun lt!188382 () tuple2!10086)

(assert (=> b!120737 (= lt!188382 (reader!0 (_2!5309 lt!188399) (_2!5309 lt!188397)))))

(declare-fun lt!188385 () tuple2!10084)

(assert (=> b!120737 (= lt!188385 (readBitPure!0 (_1!5308 lt!188381)))))

(assert (=> b!120737 (= (_2!5307 lt!188385) lt!188377)))

(declare-fun lt!188405 () Unit!7417)

(declare-fun Unit!7434 () Unit!7417)

(assert (=> b!120737 (= lt!188405 Unit!7434)))

(declare-fun lt!188410 () (_ BitVec 64))

(assert (=> b!120737 (= lt!188410 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(declare-fun lt!188393 () (_ BitVec 64))

(assert (=> b!120737 (= lt!188393 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(declare-fun lt!188383 () Unit!7417)

(assert (=> b!120737 (= lt!188383 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5309 lt!187377) (buf!2856 (_2!5309 lt!188397)) lt!188393))))

(assert (=> b!120737 (validate_offset_bits!1 ((_ sign_extend 32) (size!2425 (buf!2856 (_2!5309 lt!188397)))) ((_ sign_extend 32) (currentByte!5535 (_2!5309 lt!187377))) ((_ sign_extend 32) (currentBit!5530 (_2!5309 lt!187377))) lt!188393)))

(declare-fun lt!188412 () Unit!7417)

(assert (=> b!120737 (= lt!188412 lt!188383)))

(declare-fun lt!188400 () tuple2!10090)

(assert (=> b!120737 (= lt!188400 (readNLeastSignificantBitsLoopPure!0 (_1!5308 lt!188381) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!188410))))

(declare-fun lt!188389 () (_ BitVec 64))

(assert (=> b!120737 (= lt!188389 ((_ sign_extend 32) (bvsub (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b00000000000000000000000000000001)))))

(declare-fun lt!188386 () Unit!7417)

(assert (=> b!120737 (= lt!188386 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5309 lt!188399) (buf!2856 (_2!5309 lt!188397)) lt!188389))))

(assert (=> b!120737 (validate_offset_bits!1 ((_ sign_extend 32) (size!2425 (buf!2856 (_2!5309 lt!188397)))) ((_ sign_extend 32) (currentByte!5535 (_2!5309 lt!188399))) ((_ sign_extend 32) (currentBit!5530 (_2!5309 lt!188399))) lt!188389)))

(declare-fun lt!188413 () Unit!7417)

(assert (=> b!120737 (= lt!188413 lt!188386)))

(declare-fun lt!188373 () tuple2!10090)

(assert (=> b!120737 (= lt!188373 (readNLeastSignificantBitsLoopPure!0 (_1!5308 lt!188382) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!188410 (ite (_2!5307 lt!188385) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!188375 () tuple2!10090)

(assert (=> b!120737 (= lt!188375 (readNLeastSignificantBitsLoopPure!0 (_1!5308 lt!188381) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!188410))))

(declare-fun c!7268 () Bool)

(assert (=> b!120737 (= c!7268 (_2!5307 (readBitPure!0 (_1!5308 lt!188381))))))

(declare-fun e!79050 () (_ BitVec 64))

(declare-fun lt!188395 () tuple2!10090)

(assert (=> b!120737 (= lt!188395 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!5308 lt!188381) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!188410 e!79050)))))

(declare-fun lt!188401 () Unit!7417)

(assert (=> b!120737 (= lt!188401 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!5308 lt!188381) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!188410))))

(assert (=> b!120737 (and (= (_2!5310 lt!188375) (_2!5310 lt!188395)) (= (_1!5310 lt!188375) (_1!5310 lt!188395)))))

(declare-fun lt!188414 () Unit!7417)

(assert (=> b!120737 (= lt!188414 lt!188401)))

(assert (=> b!120737 (= (_1!5308 lt!188381) (withMovedBitIndex!0 (_2!5308 lt!188381) (bvsub (bitIndex!0 (size!2425 (buf!2856 (_2!5309 lt!187377))) (currentByte!5535 (_2!5309 lt!187377)) (currentBit!5530 (_2!5309 lt!187377))) (bitIndex!0 (size!2425 (buf!2856 (_2!5309 lt!188397))) (currentByte!5535 (_2!5309 lt!188397)) (currentBit!5530 (_2!5309 lt!188397))))))))

(declare-fun lt!188409 () Unit!7417)

(declare-fun Unit!7435 () Unit!7417)

(assert (=> b!120737 (= lt!188409 Unit!7435)))

(assert (=> b!120737 (= (_1!5308 lt!188382) (withMovedBitIndex!0 (_2!5308 lt!188382) (bvsub (bitIndex!0 (size!2425 (buf!2856 (_2!5309 lt!188399))) (currentByte!5535 (_2!5309 lt!188399)) (currentBit!5530 (_2!5309 lt!188399))) (bitIndex!0 (size!2425 (buf!2856 (_2!5309 lt!188397))) (currentByte!5535 (_2!5309 lt!188397)) (currentBit!5530 (_2!5309 lt!188397))))))))

(declare-fun lt!188411 () Unit!7417)

(declare-fun Unit!7436 () Unit!7417)

(assert (=> b!120737 (= lt!188411 Unit!7436)))

(assert (=> b!120737 (= (bitIndex!0 (size!2425 (buf!2856 (_2!5309 lt!187377))) (currentByte!5535 (_2!5309 lt!187377)) (currentBit!5530 (_2!5309 lt!187377))) (bvsub (bitIndex!0 (size!2425 (buf!2856 (_2!5309 lt!188399))) (currentByte!5535 (_2!5309 lt!188399)) (currentBit!5530 (_2!5309 lt!188399))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!188396 () Unit!7417)

(declare-fun Unit!7437 () Unit!7417)

(assert (=> b!120737 (= lt!188396 Unit!7437)))

(assert (=> b!120737 (= (_2!5310 lt!188400) (_2!5310 lt!188373))))

(declare-fun lt!188387 () Unit!7417)

(declare-fun Unit!7438 () Unit!7417)

(assert (=> b!120737 (= lt!188387 Unit!7438)))

(assert (=> b!120737 (= (_1!5310 lt!188400) (_2!5308 lt!188381))))

(declare-fun b!120738 () Bool)

(assert (=> b!120738 (= e!79050 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))))))

(declare-fun bm!1577 () Bool)

(declare-fun c!7267 () Bool)

(assert (=> bm!1577 (= call!1580 (isPrefixOf!0 (ite c!7267 (_2!5309 lt!187377) lt!188407) (ite c!7267 (_2!5309 lt!188378) lt!188407)))))

(declare-fun b!120731 () Bool)

(assert (=> b!120731 (= e!79050 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun d!38884 () Bool)

(assert (=> d!38884 e!79053))

(declare-fun res!99955 () Bool)

(assert (=> d!38884 (=> (not res!99955) (not e!79053))))

(assert (=> d!38884 (= res!99955 (= (size!2425 (buf!2856 (_2!5309 lt!187377))) (size!2425 (buf!2856 (_2!5309 lt!188371)))))))

(assert (=> d!38884 (= lt!188371 e!79049)))

(assert (=> d!38884 (= c!7267 (bvslt (bvadd #b00000000000000000000000000000001 i!615) nBits!396))))

(assert (=> d!38884 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)) (bvsle (bvadd #b00000000000000000000000000000001 i!615) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!38884 (= (appendNLeastSignificantBitsLoop!0 (_2!5309 lt!187377) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) lt!188371)))

(declare-fun b!120739 () Bool)

(declare-fun res!99951 () Bool)

(assert (=> b!120739 (= res!99951 call!1580)))

(assert (=> b!120739 (=> (not res!99951) (not e!79048))))

(declare-fun b!120740 () Bool)

(declare-fun res!99953 () Bool)

(assert (=> b!120740 (=> (not res!99953) (not e!79053))))

(declare-fun lt!188404 () (_ BitVec 64))

(declare-fun lt!188394 () (_ BitVec 64))

(assert (=> b!120740 (= res!99953 (= (bitIndex!0 (size!2425 (buf!2856 (_2!5309 lt!188371))) (currentByte!5535 (_2!5309 lt!188371)) (currentBit!5530 (_2!5309 lt!188371))) (bvadd lt!188404 lt!188394)))))

(assert (=> b!120740 (or (not (= (bvand lt!188404 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!188394 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!188404 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!188404 lt!188394) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!120740 (= lt!188394 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!120740 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!120740 (= lt!188404 (bitIndex!0 (size!2425 (buf!2856 (_2!5309 lt!187377))) (currentByte!5535 (_2!5309 lt!187377)) (currentBit!5530 (_2!5309 lt!187377))))))

(assert (= (and d!38884 c!7267) b!120737))

(assert (= (and d!38884 (not c!7267)) b!120733))

(assert (= (and b!120737 res!99954) b!120735))

(assert (= (and b!120735 res!99950) b!120739))

(assert (= (and b!120739 res!99951) b!120734))

(assert (= (and b!120734 res!99957) b!120728))

(assert (= (and b!120737 res!99956) b!120732))

(assert (= (and b!120737 c!7268) b!120738))

(assert (= (and b!120737 (not c!7268)) b!120731))

(assert (= (or b!120739 b!120733) bm!1577))

(assert (= (and d!38884 res!99955) b!120740))

(assert (= (and b!120740 res!99953) b!120730))

(assert (= (and b!120730 res!99952) b!120736))

(assert (= (and b!120736 res!99958) b!120729))

(declare-fun m!182561 () Bool)

(assert (=> b!120728 m!182561))

(declare-fun m!182563 () Bool)

(assert (=> b!120728 m!182563))

(declare-fun m!182565 () Bool)

(assert (=> b!120737 m!182565))

(declare-fun m!182567 () Bool)

(assert (=> b!120737 m!182567))

(declare-fun m!182569 () Bool)

(assert (=> b!120737 m!182569))

(declare-fun m!182571 () Bool)

(assert (=> b!120737 m!182571))

(declare-fun m!182573 () Bool)

(assert (=> b!120737 m!182573))

(assert (=> b!120737 m!181893))

(declare-fun m!182575 () Bool)

(assert (=> b!120737 m!182575))

(declare-fun m!182577 () Bool)

(assert (=> b!120737 m!182577))

(declare-fun m!182579 () Bool)

(assert (=> b!120737 m!182579))

(declare-fun m!182581 () Bool)

(assert (=> b!120737 m!182581))

(declare-fun m!182583 () Bool)

(assert (=> b!120737 m!182583))

(declare-fun m!182585 () Bool)

(assert (=> b!120737 m!182585))

(declare-fun m!182587 () Bool)

(assert (=> b!120737 m!182587))

(declare-fun m!182589 () Bool)

(assert (=> b!120737 m!182589))

(declare-fun m!182591 () Bool)

(assert (=> b!120737 m!182591))

(declare-fun m!182593 () Bool)

(assert (=> b!120737 m!182593))

(declare-fun m!182595 () Bool)

(assert (=> b!120737 m!182595))

(declare-fun m!182597 () Bool)

(assert (=> b!120737 m!182597))

(declare-fun m!182599 () Bool)

(assert (=> b!120737 m!182599))

(assert (=> b!120737 m!182593))

(declare-fun m!182601 () Bool)

(assert (=> b!120737 m!182601))

(declare-fun m!182603 () Bool)

(assert (=> b!120737 m!182603))

(declare-fun m!182605 () Bool)

(assert (=> b!120737 m!182605))

(declare-fun m!182607 () Bool)

(assert (=> b!120737 m!182607))

(declare-fun m!182609 () Bool)

(assert (=> b!120737 m!182609))

(declare-fun m!182611 () Bool)

(assert (=> b!120737 m!182611))

(declare-fun m!182613 () Bool)

(assert (=> b!120737 m!182613))

(declare-fun m!182615 () Bool)

(assert (=> b!120737 m!182615))

(declare-fun m!182617 () Bool)

(assert (=> b!120737 m!182617))

(declare-fun m!182619 () Bool)

(assert (=> b!120737 m!182619))

(declare-fun m!182621 () Bool)

(assert (=> b!120734 m!182621))

(assert (=> b!120734 m!182621))

(declare-fun m!182623 () Bool)

(assert (=> b!120734 m!182623))

(assert (=> b!120735 m!182563))

(assert (=> b!120735 m!181893))

(declare-fun m!182625 () Bool)

(assert (=> bm!1577 m!182625))

(declare-fun m!182627 () Bool)

(assert (=> b!120740 m!182627))

(assert (=> b!120740 m!181893))

(declare-fun m!182629 () Bool)

(assert (=> b!120729 m!182629))

(declare-fun m!182631 () Bool)

(assert (=> b!120736 m!182631))

(declare-fun m!182633 () Bool)

(assert (=> b!120736 m!182633))

(declare-fun m!182635 () Bool)

(assert (=> b!120736 m!182635))

(declare-fun m!182637 () Bool)

(assert (=> b!120736 m!182637))

(assert (=> b!120736 m!182585))

(declare-fun m!182639 () Bool)

(assert (=> b!120733 m!182639))

(declare-fun m!182641 () Bool)

(assert (=> b!120730 m!182641))

(assert (=> b!120385 d!38884))

(declare-fun d!38950 () Bool)

(declare-fun e!79061 () Bool)

(assert (=> d!38950 e!79061))

(declare-fun res!99966 () Bool)

(assert (=> d!38950 (=> (not res!99966) (not e!79061))))

(declare-fun lt!188444 () tuple2!10084)

(declare-fun lt!188446 () tuple2!10084)

(assert (=> d!38950 (= res!99966 (= (bitIndex!0 (size!2425 (buf!2856 (_1!5307 lt!188444))) (currentByte!5535 (_1!5307 lt!188444)) (currentBit!5530 (_1!5307 lt!188444))) (bitIndex!0 (size!2425 (buf!2856 (_1!5307 lt!188446))) (currentByte!5535 (_1!5307 lt!188446)) (currentBit!5530 (_1!5307 lt!188446)))))))

(declare-fun lt!188445 () BitStream!4324)

(declare-fun lt!188447 () Unit!7417)

(declare-fun choose!50 (BitStream!4324 BitStream!4324 BitStream!4324 tuple2!10084 tuple2!10084 BitStream!4324 Bool tuple2!10084 tuple2!10084 BitStream!4324 Bool) Unit!7417)

(assert (=> d!38950 (= lt!188447 (choose!50 lt!187376 (_2!5309 lt!187370) lt!188445 lt!188444 (tuple2!10085 (_1!5307 lt!188444) (_2!5307 lt!188444)) (_1!5307 lt!188444) (_2!5307 lt!188444) lt!188446 (tuple2!10085 (_1!5307 lt!188446) (_2!5307 lt!188446)) (_1!5307 lt!188446) (_2!5307 lt!188446)))))

(assert (=> d!38950 (= lt!188446 (readBitPure!0 lt!188445))))

(assert (=> d!38950 (= lt!188444 (readBitPure!0 lt!187376))))

(assert (=> d!38950 (= lt!188445 (BitStream!4325 (buf!2856 (_2!5309 lt!187370)) (currentByte!5535 lt!187376) (currentBit!5530 lt!187376)))))

(assert (=> d!38950 (invariant!0 (currentBit!5530 lt!187376) (currentByte!5535 lt!187376) (size!2425 (buf!2856 (_2!5309 lt!187370))))))

(assert (=> d!38950 (= (readBitPrefixLemma!0 lt!187376 (_2!5309 lt!187370)) lt!188447)))

(declare-fun b!120748 () Bool)

(assert (=> b!120748 (= e!79061 (= (_2!5307 lt!188444) (_2!5307 lt!188446)))))

(assert (= (and d!38950 res!99966) b!120748))

(declare-fun m!182663 () Bool)

(assert (=> d!38950 m!182663))

(assert (=> d!38950 m!181863))

(declare-fun m!182665 () Bool)

(assert (=> d!38950 m!182665))

(declare-fun m!182667 () Bool)

(assert (=> d!38950 m!182667))

(declare-fun m!182669 () Bool)

(assert (=> d!38950 m!182669))

(declare-fun m!182671 () Bool)

(assert (=> d!38950 m!182671))

(assert (=> b!120385 d!38950))

(declare-fun lt!188453 () (_ BitVec 64))

(declare-fun e!79062 () Bool)

(declare-fun lt!188449 () tuple2!10086)

(declare-fun lt!188458 () (_ BitVec 64))

(declare-fun b!120749 () Bool)

(assert (=> b!120749 (= e!79062 (= (_1!5308 lt!188449) (withMovedBitIndex!0 (_2!5308 lt!188449) (bvsub lt!188458 lt!188453))))))

(assert (=> b!120749 (or (= (bvand lt!188458 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!188453 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!188458 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!188458 lt!188453) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!120749 (= lt!188453 (bitIndex!0 (size!2425 (buf!2856 (_2!5309 lt!187370))) (currentByte!5535 (_2!5309 lt!187370)) (currentBit!5530 (_2!5309 lt!187370))))))

(assert (=> b!120749 (= lt!188458 (bitIndex!0 (size!2425 (buf!2856 (_2!5309 lt!187377))) (currentByte!5535 (_2!5309 lt!187377)) (currentBit!5530 (_2!5309 lt!187377))))))

(declare-fun b!120750 () Bool)

(declare-fun e!79063 () Unit!7417)

(declare-fun lt!188448 () Unit!7417)

(assert (=> b!120750 (= e!79063 lt!188448)))

(declare-fun lt!188452 () (_ BitVec 64))

(assert (=> b!120750 (= lt!188452 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!188455 () (_ BitVec 64))

(assert (=> b!120750 (= lt!188455 (bitIndex!0 (size!2425 (buf!2856 (_2!5309 lt!187377))) (currentByte!5535 (_2!5309 lt!187377)) (currentBit!5530 (_2!5309 lt!187377))))))

(assert (=> b!120750 (= lt!188448 (arrayBitRangesEqSymmetric!0 (buf!2856 (_2!5309 lt!187377)) (buf!2856 (_2!5309 lt!187370)) lt!188452 lt!188455))))

(assert (=> b!120750 (arrayBitRangesEq!0 (buf!2856 (_2!5309 lt!187370)) (buf!2856 (_2!5309 lt!187377)) lt!188452 lt!188455)))

(declare-fun b!120751 () Bool)

(declare-fun res!99969 () Bool)

(assert (=> b!120751 (=> (not res!99969) (not e!79062))))

(assert (=> b!120751 (= res!99969 (isPrefixOf!0 (_1!5308 lt!188449) (_2!5309 lt!187377)))))

(declare-fun d!38962 () Bool)

(assert (=> d!38962 e!79062))

(declare-fun res!99968 () Bool)

(assert (=> d!38962 (=> (not res!99968) (not e!79062))))

(assert (=> d!38962 (= res!99968 (isPrefixOf!0 (_1!5308 lt!188449) (_2!5308 lt!188449)))))

(declare-fun lt!188450 () BitStream!4324)

(assert (=> d!38962 (= lt!188449 (tuple2!10087 lt!188450 (_2!5309 lt!187370)))))

(declare-fun lt!188464 () Unit!7417)

(declare-fun lt!188461 () Unit!7417)

(assert (=> d!38962 (= lt!188464 lt!188461)))

(assert (=> d!38962 (isPrefixOf!0 lt!188450 (_2!5309 lt!187370))))

(assert (=> d!38962 (= lt!188461 (lemmaIsPrefixTransitive!0 lt!188450 (_2!5309 lt!187370) (_2!5309 lt!187370)))))

(declare-fun lt!188459 () Unit!7417)

(declare-fun lt!188465 () Unit!7417)

(assert (=> d!38962 (= lt!188459 lt!188465)))

(assert (=> d!38962 (isPrefixOf!0 lt!188450 (_2!5309 lt!187370))))

(assert (=> d!38962 (= lt!188465 (lemmaIsPrefixTransitive!0 lt!188450 (_2!5309 lt!187377) (_2!5309 lt!187370)))))

(declare-fun lt!188463 () Unit!7417)

(assert (=> d!38962 (= lt!188463 e!79063)))

(declare-fun c!7269 () Bool)

(assert (=> d!38962 (= c!7269 (not (= (size!2425 (buf!2856 (_2!5309 lt!187377))) #b00000000000000000000000000000000)))))

(declare-fun lt!188454 () Unit!7417)

(declare-fun lt!188457 () Unit!7417)

(assert (=> d!38962 (= lt!188454 lt!188457)))

(assert (=> d!38962 (isPrefixOf!0 (_2!5309 lt!187370) (_2!5309 lt!187370))))

(assert (=> d!38962 (= lt!188457 (lemmaIsPrefixRefl!0 (_2!5309 lt!187370)))))

(declare-fun lt!188451 () Unit!7417)

(declare-fun lt!188466 () Unit!7417)

(assert (=> d!38962 (= lt!188451 lt!188466)))

(assert (=> d!38962 (= lt!188466 (lemmaIsPrefixRefl!0 (_2!5309 lt!187370)))))

(declare-fun lt!188456 () Unit!7417)

(declare-fun lt!188460 () Unit!7417)

(assert (=> d!38962 (= lt!188456 lt!188460)))

(assert (=> d!38962 (isPrefixOf!0 lt!188450 lt!188450)))

(assert (=> d!38962 (= lt!188460 (lemmaIsPrefixRefl!0 lt!188450))))

(declare-fun lt!188467 () Unit!7417)

(declare-fun lt!188462 () Unit!7417)

(assert (=> d!38962 (= lt!188467 lt!188462)))

(assert (=> d!38962 (isPrefixOf!0 (_2!5309 lt!187377) (_2!5309 lt!187377))))

(assert (=> d!38962 (= lt!188462 (lemmaIsPrefixRefl!0 (_2!5309 lt!187377)))))

(assert (=> d!38962 (= lt!188450 (BitStream!4325 (buf!2856 (_2!5309 lt!187370)) (currentByte!5535 (_2!5309 lt!187377)) (currentBit!5530 (_2!5309 lt!187377))))))

(assert (=> d!38962 (isPrefixOf!0 (_2!5309 lt!187377) (_2!5309 lt!187370))))

(assert (=> d!38962 (= (reader!0 (_2!5309 lt!187377) (_2!5309 lt!187370)) lt!188449)))

(declare-fun b!120752 () Bool)

(declare-fun Unit!7440 () Unit!7417)

(assert (=> b!120752 (= e!79063 Unit!7440)))

(declare-fun b!120753 () Bool)

(declare-fun res!99967 () Bool)

(assert (=> b!120753 (=> (not res!99967) (not e!79062))))

(assert (=> b!120753 (= res!99967 (isPrefixOf!0 (_2!5308 lt!188449) (_2!5309 lt!187370)))))

(assert (= (and d!38962 c!7269) b!120750))

(assert (= (and d!38962 (not c!7269)) b!120752))

(assert (= (and d!38962 res!99968) b!120751))

(assert (= (and b!120751 res!99969) b!120753))

(assert (= (and b!120753 res!99967) b!120749))

(declare-fun m!182673 () Bool)

(assert (=> d!38962 m!182673))

(assert (=> d!38962 m!182251))

(declare-fun m!182675 () Bool)

(assert (=> d!38962 m!182675))

(declare-fun m!182677 () Bool)

(assert (=> d!38962 m!182677))

(declare-fun m!182679 () Bool)

(assert (=> d!38962 m!182679))

(declare-fun m!182681 () Bool)

(assert (=> d!38962 m!182681))

(declare-fun m!182683 () Bool)

(assert (=> d!38962 m!182683))

(declare-fun m!182685 () Bool)

(assert (=> d!38962 m!182685))

(assert (=> d!38962 m!182263))

(declare-fun m!182687 () Bool)

(assert (=> d!38962 m!182687))

(declare-fun m!182689 () Bool)

(assert (=> d!38962 m!182689))

(assert (=> b!120750 m!181893))

(declare-fun m!182691 () Bool)

(assert (=> b!120750 m!182691))

(declare-fun m!182693 () Bool)

(assert (=> b!120750 m!182693))

(declare-fun m!182695 () Bool)

(assert (=> b!120749 m!182695))

(assert (=> b!120749 m!181915))

(assert (=> b!120749 m!181893))

(declare-fun m!182697 () Bool)

(assert (=> b!120753 m!182697))

(declare-fun m!182699 () Bool)

(assert (=> b!120751 m!182699))

(assert (=> b!120385 d!38962))

(declare-fun d!38964 () Bool)

(declare-fun e!79064 () Bool)

(assert (=> d!38964 e!79064))

(declare-fun res!99971 () Bool)

(assert (=> d!38964 (=> (not res!99971) (not e!79064))))

(declare-fun lt!188472 () (_ BitVec 64))

(declare-fun lt!188473 () (_ BitVec 64))

(declare-fun lt!188471 () (_ BitVec 64))

(assert (=> d!38964 (= res!99971 (= lt!188473 (bvsub lt!188471 lt!188472)))))

(assert (=> d!38964 (or (= (bvand lt!188471 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!188472 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!188471 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!188471 lt!188472) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38964 (= lt!188472 (remainingBits!0 ((_ sign_extend 32) (size!2425 (buf!2856 (_1!5307 lt!187381)))) ((_ sign_extend 32) (currentByte!5535 (_1!5307 lt!187381))) ((_ sign_extend 32) (currentBit!5530 (_1!5307 lt!187381)))))))

(declare-fun lt!188468 () (_ BitVec 64))

(declare-fun lt!188470 () (_ BitVec 64))

(assert (=> d!38964 (= lt!188471 (bvmul lt!188468 lt!188470))))

(assert (=> d!38964 (or (= lt!188468 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!188470 (bvsdiv (bvmul lt!188468 lt!188470) lt!188468)))))

(assert (=> d!38964 (= lt!188470 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!38964 (= lt!188468 ((_ sign_extend 32) (size!2425 (buf!2856 (_1!5307 lt!187381)))))))

(assert (=> d!38964 (= lt!188473 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5535 (_1!5307 lt!187381))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5530 (_1!5307 lt!187381)))))))

(assert (=> d!38964 (invariant!0 (currentBit!5530 (_1!5307 lt!187381)) (currentByte!5535 (_1!5307 lt!187381)) (size!2425 (buf!2856 (_1!5307 lt!187381))))))

(assert (=> d!38964 (= (bitIndex!0 (size!2425 (buf!2856 (_1!5307 lt!187381))) (currentByte!5535 (_1!5307 lt!187381)) (currentBit!5530 (_1!5307 lt!187381))) lt!188473)))

(declare-fun b!120754 () Bool)

(declare-fun res!99970 () Bool)

(assert (=> b!120754 (=> (not res!99970) (not e!79064))))

(assert (=> b!120754 (= res!99970 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!188473))))

(declare-fun b!120755 () Bool)

(declare-fun lt!188469 () (_ BitVec 64))

(assert (=> b!120755 (= e!79064 (bvsle lt!188473 (bvmul lt!188469 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!120755 (or (= lt!188469 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!188469 #b0000000000000000000000000000000000000000000000000000000000001000) lt!188469)))))

(assert (=> b!120755 (= lt!188469 ((_ sign_extend 32) (size!2425 (buf!2856 (_1!5307 lt!187381)))))))

(assert (= (and d!38964 res!99971) b!120754))

(assert (= (and b!120754 res!99970) b!120755))

(declare-fun m!182701 () Bool)

(assert (=> d!38964 m!182701))

(declare-fun m!182703 () Bool)

(assert (=> d!38964 m!182703))

(assert (=> b!120385 d!38964))

(declare-fun d!38966 () Bool)

(declare-fun res!99972 () Bool)

(declare-fun e!79066 () Bool)

(assert (=> d!38966 (=> (not res!99972) (not e!79066))))

(assert (=> d!38966 (= res!99972 (= (size!2425 (buf!2856 thiss!1305)) (size!2425 (buf!2856 (_2!5309 lt!187370)))))))

(assert (=> d!38966 (= (isPrefixOf!0 thiss!1305 (_2!5309 lt!187370)) e!79066)))

(declare-fun b!120756 () Bool)

(declare-fun res!99973 () Bool)

(assert (=> b!120756 (=> (not res!99973) (not e!79066))))

(assert (=> b!120756 (= res!99973 (bvsle (bitIndex!0 (size!2425 (buf!2856 thiss!1305)) (currentByte!5535 thiss!1305) (currentBit!5530 thiss!1305)) (bitIndex!0 (size!2425 (buf!2856 (_2!5309 lt!187370))) (currentByte!5535 (_2!5309 lt!187370)) (currentBit!5530 (_2!5309 lt!187370)))))))

(declare-fun b!120757 () Bool)

(declare-fun e!79065 () Bool)

(assert (=> b!120757 (= e!79066 e!79065)))

(declare-fun res!99974 () Bool)

(assert (=> b!120757 (=> res!99974 e!79065)))

(assert (=> b!120757 (= res!99974 (= (size!2425 (buf!2856 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!120758 () Bool)

(assert (=> b!120758 (= e!79065 (arrayBitRangesEq!0 (buf!2856 thiss!1305) (buf!2856 (_2!5309 lt!187370)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2425 (buf!2856 thiss!1305)) (currentByte!5535 thiss!1305) (currentBit!5530 thiss!1305))))))

(assert (= (and d!38966 res!99972) b!120756))

(assert (= (and b!120756 res!99973) b!120757))

(assert (= (and b!120757 (not res!99974)) b!120758))

(assert (=> b!120756 m!181895))

(assert (=> b!120756 m!181915))

(assert (=> b!120758 m!181895))

(assert (=> b!120758 m!181895))

(declare-fun m!182705 () Bool)

(assert (=> b!120758 m!182705))

(assert (=> b!120385 d!38966))

(declare-fun d!38968 () Bool)

(declare-fun lt!188474 () tuple2!10118)

(assert (=> d!38968 (= lt!188474 (readNLeastSignificantBitsLoop!0 (_1!5308 lt!187387) nBits!396 i!615 lt!187375))))

(assert (=> d!38968 (= (readNLeastSignificantBitsLoopPure!0 (_1!5308 lt!187387) nBits!396 i!615 lt!187375) (tuple2!10091 (_2!5324 lt!188474) (_1!5324 lt!188474)))))

(declare-fun bs!9420 () Bool)

(assert (= bs!9420 d!38968))

(declare-fun m!182707 () Bool)

(assert (=> bs!9420 m!182707))

(assert (=> b!120385 d!38968))

(declare-fun b!120786 () Bool)

(declare-fun res!99999 () Bool)

(declare-fun e!79080 () Bool)

(assert (=> b!120786 (=> (not res!99999) (not e!79080))))

(declare-fun lt!188522 () tuple2!10088)

(declare-fun lt!188524 () (_ BitVec 64))

(declare-fun lt!188521 () (_ BitVec 64))

(assert (=> b!120786 (= res!99999 (= (bitIndex!0 (size!2425 (buf!2856 (_2!5309 lt!188522))) (currentByte!5535 (_2!5309 lt!188522)) (currentBit!5530 (_2!5309 lt!188522))) (bvadd lt!188524 lt!188521)))))

(assert (=> b!120786 (or (not (= (bvand lt!188524 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!188521 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!188524 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!188524 lt!188521) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!120786 (= lt!188521 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!120786 (= lt!188524 (bitIndex!0 (size!2425 (buf!2856 thiss!1305)) (currentByte!5535 thiss!1305) (currentBit!5530 thiss!1305)))))

(declare-fun d!38970 () Bool)

(assert (=> d!38970 e!79080))

(declare-fun res!100000 () Bool)

(assert (=> d!38970 (=> (not res!100000) (not e!79080))))

(assert (=> d!38970 (= res!100000 (= (size!2425 (buf!2856 thiss!1305)) (size!2425 (buf!2856 (_2!5309 lt!188522)))))))

(declare-fun choose!16 (BitStream!4324 Bool) tuple2!10088)

(assert (=> d!38970 (= lt!188522 (choose!16 thiss!1305 lt!187372))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!38970 (validate_offset_bit!0 ((_ sign_extend 32) (size!2425 (buf!2856 thiss!1305))) ((_ sign_extend 32) (currentByte!5535 thiss!1305)) ((_ sign_extend 32) (currentBit!5530 thiss!1305)))))

(assert (=> d!38970 (= (appendBit!0 thiss!1305 lt!187372) lt!188522)))

(declare-fun b!120789 () Bool)

(declare-fun e!79079 () Bool)

(declare-fun lt!188523 () tuple2!10084)

(assert (=> b!120789 (= e!79079 (= (bitIndex!0 (size!2425 (buf!2856 (_1!5307 lt!188523))) (currentByte!5535 (_1!5307 lt!188523)) (currentBit!5530 (_1!5307 lt!188523))) (bitIndex!0 (size!2425 (buf!2856 (_2!5309 lt!188522))) (currentByte!5535 (_2!5309 lt!188522)) (currentBit!5530 (_2!5309 lt!188522)))))))

(declare-fun b!120787 () Bool)

(declare-fun res!99998 () Bool)

(assert (=> b!120787 (=> (not res!99998) (not e!79080))))

(assert (=> b!120787 (= res!99998 (isPrefixOf!0 thiss!1305 (_2!5309 lt!188522)))))

(declare-fun b!120788 () Bool)

(assert (=> b!120788 (= e!79080 e!79079)))

(declare-fun res!100001 () Bool)

(assert (=> b!120788 (=> (not res!100001) (not e!79079))))

(assert (=> b!120788 (= res!100001 (and (= (_2!5307 lt!188523) lt!187372) (= (_1!5307 lt!188523) (_2!5309 lt!188522))))))

(assert (=> b!120788 (= lt!188523 (readBitPure!0 (readerFrom!0 (_2!5309 lt!188522) (currentBit!5530 thiss!1305) (currentByte!5535 thiss!1305))))))

(assert (= (and d!38970 res!100000) b!120786))

(assert (= (and b!120786 res!99999) b!120787))

(assert (= (and b!120787 res!99998) b!120788))

(assert (= (and b!120788 res!100001) b!120789))

(declare-fun m!182759 () Bool)

(assert (=> b!120786 m!182759))

(assert (=> b!120786 m!181895))

(declare-fun m!182761 () Bool)

(assert (=> d!38970 m!182761))

(declare-fun m!182763 () Bool)

(assert (=> d!38970 m!182763))

(declare-fun m!182765 () Bool)

(assert (=> b!120789 m!182765))

(assert (=> b!120789 m!182759))

(declare-fun m!182767 () Bool)

(assert (=> b!120787 m!182767))

(declare-fun m!182769 () Bool)

(assert (=> b!120788 m!182769))

(assert (=> b!120788 m!182769))

(declare-fun m!182771 () Bool)

(assert (=> b!120788 m!182771))

(assert (=> b!120385 d!38970))

(declare-fun d!38984 () Bool)

(declare-fun lt!188537 () tuple2!10090)

(declare-fun lt!188538 () tuple2!10090)

(assert (=> d!38984 (and (= (_2!5310 lt!188537) (_2!5310 lt!188538)) (= (_1!5310 lt!188537) (_1!5310 lt!188538)))))

(declare-fun lt!188539 () Bool)

(declare-fun lt!188541 () BitStream!4324)

(declare-fun lt!188542 () Unit!7417)

(declare-fun lt!188540 () (_ BitVec 64))

(declare-fun choose!45 (BitStream!4324 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!10090 tuple2!10090 BitStream!4324 (_ BitVec 64) Bool BitStream!4324 (_ BitVec 64) tuple2!10090 tuple2!10090 BitStream!4324 (_ BitVec 64)) Unit!7417)

(assert (=> d!38984 (= lt!188542 (choose!45 (_1!5308 lt!187387) nBits!396 i!615 lt!187375 lt!188537 (tuple2!10091 (_1!5310 lt!188537) (_2!5310 lt!188537)) (_1!5310 lt!188537) (_2!5310 lt!188537) lt!188539 lt!188541 lt!188540 lt!188538 (tuple2!10091 (_1!5310 lt!188538) (_2!5310 lt!188538)) (_1!5310 lt!188538) (_2!5310 lt!188538)))))

(assert (=> d!38984 (= lt!188538 (readNLeastSignificantBitsLoopPure!0 lt!188541 nBits!396 (bvadd i!615 #b00000000000000000000000000000001) lt!188540))))

(assert (=> d!38984 (= lt!188540 (bvor lt!187375 (ite lt!188539 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38984 (= lt!188541 (withMovedBitIndex!0 (_1!5308 lt!187387) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!38984 (= lt!188539 (_2!5307 (readBitPure!0 (_1!5308 lt!187387))))))

(assert (=> d!38984 (= lt!188537 (readNLeastSignificantBitsLoopPure!0 (_1!5308 lt!187387) nBits!396 i!615 lt!187375))))

(assert (=> d!38984 (= (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!5308 lt!187387) nBits!396 i!615 lt!187375) lt!188542)))

(declare-fun bs!9426 () Bool)

(assert (= bs!9426 d!38984))

(assert (=> bs!9426 m!181907))

(assert (=> bs!9426 m!181875))

(declare-fun m!182773 () Bool)

(assert (=> bs!9426 m!182773))

(declare-fun m!182775 () Bool)

(assert (=> bs!9426 m!182775))

(assert (=> bs!9426 m!181871))

(assert (=> b!120374 d!38984))

(declare-fun d!38986 () Bool)

(declare-fun e!79083 () Bool)

(assert (=> d!38986 e!79083))

(declare-fun res!100004 () Bool)

(assert (=> d!38986 (=> (not res!100004) (not e!79083))))

(declare-fun lt!188548 () (_ BitVec 64))

(declare-fun lt!188547 () BitStream!4324)

(assert (=> d!38986 (= res!100004 (= (bvadd lt!188548 (bvsub lt!187369 lt!187390)) (bitIndex!0 (size!2425 (buf!2856 lt!188547)) (currentByte!5535 lt!188547) (currentBit!5530 lt!188547))))))

(assert (=> d!38986 (or (not (= (bvand lt!188548 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!187369 lt!187390) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!188548 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!188548 (bvsub lt!187369 lt!187390)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38986 (= lt!188548 (bitIndex!0 (size!2425 (buf!2856 (_2!5308 lt!187384))) (currentByte!5535 (_2!5308 lt!187384)) (currentBit!5530 (_2!5308 lt!187384))))))

(declare-fun moveBitIndex!0 (BitStream!4324 (_ BitVec 64)) tuple2!10088)

(assert (=> d!38986 (= lt!188547 (_2!5309 (moveBitIndex!0 (_2!5308 lt!187384) (bvsub lt!187369 lt!187390))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!4324 (_ BitVec 64)) Bool)

(assert (=> d!38986 (moveBitIndexPrecond!0 (_2!5308 lt!187384) (bvsub lt!187369 lt!187390))))

(assert (=> d!38986 (= (withMovedBitIndex!0 (_2!5308 lt!187384) (bvsub lt!187369 lt!187390)) lt!188547)))

(declare-fun b!120792 () Bool)

(assert (=> b!120792 (= e!79083 (= (size!2425 (buf!2856 (_2!5308 lt!187384))) (size!2425 (buf!2856 lt!188547))))))

(assert (= (and d!38986 res!100004) b!120792))

(declare-fun m!182777 () Bool)

(assert (=> d!38986 m!182777))

(declare-fun m!182779 () Bool)

(assert (=> d!38986 m!182779))

(declare-fun m!182781 () Bool)

(assert (=> d!38986 m!182781))

(declare-fun m!182783 () Bool)

(assert (=> d!38986 m!182783))

(assert (=> b!120374 d!38986))

(declare-fun d!38988 () Bool)

(declare-fun e!79084 () Bool)

(assert (=> d!38988 e!79084))

(declare-fun res!100006 () Bool)

(assert (=> d!38988 (=> (not res!100006) (not e!79084))))

(declare-fun lt!188554 () (_ BitVec 64))

(declare-fun lt!188552 () (_ BitVec 64))

(declare-fun lt!188553 () (_ BitVec 64))

(assert (=> d!38988 (= res!100006 (= lt!188554 (bvsub lt!188552 lt!188553)))))

(assert (=> d!38988 (or (= (bvand lt!188552 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!188553 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!188552 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!188552 lt!188553) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38988 (= lt!188553 (remainingBits!0 ((_ sign_extend 32) (size!2425 (buf!2856 (_2!5309 lt!187370)))) ((_ sign_extend 32) (currentByte!5535 (_2!5309 lt!187370))) ((_ sign_extend 32) (currentBit!5530 (_2!5309 lt!187370)))))))

(declare-fun lt!188549 () (_ BitVec 64))

(declare-fun lt!188551 () (_ BitVec 64))

(assert (=> d!38988 (= lt!188552 (bvmul lt!188549 lt!188551))))

(assert (=> d!38988 (or (= lt!188549 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!188551 (bvsdiv (bvmul lt!188549 lt!188551) lt!188549)))))

(assert (=> d!38988 (= lt!188551 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!38988 (= lt!188549 ((_ sign_extend 32) (size!2425 (buf!2856 (_2!5309 lt!187370)))))))

(assert (=> d!38988 (= lt!188554 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5535 (_2!5309 lt!187370))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5530 (_2!5309 lt!187370)))))))

(assert (=> d!38988 (invariant!0 (currentBit!5530 (_2!5309 lt!187370)) (currentByte!5535 (_2!5309 lt!187370)) (size!2425 (buf!2856 (_2!5309 lt!187370))))))

(assert (=> d!38988 (= (bitIndex!0 (size!2425 (buf!2856 (_2!5309 lt!187370))) (currentByte!5535 (_2!5309 lt!187370)) (currentBit!5530 (_2!5309 lt!187370))) lt!188554)))

(declare-fun b!120793 () Bool)

(declare-fun res!100005 () Bool)

(assert (=> b!120793 (=> (not res!100005) (not e!79084))))

(assert (=> b!120793 (= res!100005 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!188554))))

(declare-fun b!120794 () Bool)

(declare-fun lt!188550 () (_ BitVec 64))

(assert (=> b!120794 (= e!79084 (bvsle lt!188554 (bvmul lt!188550 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!120794 (or (= lt!188550 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!188550 #b0000000000000000000000000000000000000000000000000000000000001000) lt!188550)))))

(assert (=> b!120794 (= lt!188550 ((_ sign_extend 32) (size!2425 (buf!2856 (_2!5309 lt!187370)))))))

(assert (= (and d!38988 res!100006) b!120793))

(assert (= (and b!120793 res!100005) b!120794))

(declare-fun m!182785 () Bool)

(assert (=> d!38988 m!182785))

(declare-fun m!182787 () Bool)

(assert (=> d!38988 m!182787))

(assert (=> b!120374 d!38988))

(declare-fun d!38990 () Bool)

(declare-fun e!79085 () Bool)

(assert (=> d!38990 e!79085))

(declare-fun res!100007 () Bool)

(assert (=> d!38990 (=> (not res!100007) (not e!79085))))

(declare-fun lt!188555 () BitStream!4324)

(declare-fun lt!188556 () (_ BitVec 64))

(assert (=> d!38990 (= res!100007 (= (bvadd lt!188556 (bvsub lt!187379 lt!187390)) (bitIndex!0 (size!2425 (buf!2856 lt!188555)) (currentByte!5535 lt!188555) (currentBit!5530 lt!188555))))))

(assert (=> d!38990 (or (not (= (bvand lt!188556 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!187379 lt!187390) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!188556 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!188556 (bvsub lt!187379 lt!187390)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38990 (= lt!188556 (bitIndex!0 (size!2425 (buf!2856 (_2!5308 lt!187387))) (currentByte!5535 (_2!5308 lt!187387)) (currentBit!5530 (_2!5308 lt!187387))))))

(assert (=> d!38990 (= lt!188555 (_2!5309 (moveBitIndex!0 (_2!5308 lt!187387) (bvsub lt!187379 lt!187390))))))

(assert (=> d!38990 (moveBitIndexPrecond!0 (_2!5308 lt!187387) (bvsub lt!187379 lt!187390))))

(assert (=> d!38990 (= (withMovedBitIndex!0 (_2!5308 lt!187387) (bvsub lt!187379 lt!187390)) lt!188555)))

(declare-fun b!120795 () Bool)

(assert (=> b!120795 (= e!79085 (= (size!2425 (buf!2856 (_2!5308 lt!187387))) (size!2425 (buf!2856 lt!188555))))))

(assert (= (and d!38990 res!100007) b!120795))

(declare-fun m!182789 () Bool)

(assert (=> d!38990 m!182789))

(declare-fun m!182791 () Bool)

(assert (=> d!38990 m!182791))

(declare-fun m!182793 () Bool)

(assert (=> d!38990 m!182793))

(declare-fun m!182795 () Bool)

(assert (=> d!38990 m!182795))

(assert (=> b!120374 d!38990))

(declare-fun d!38992 () Bool)

(declare-fun e!79086 () Bool)

(assert (=> d!38992 e!79086))

(declare-fun res!100008 () Bool)

(assert (=> d!38992 (=> (not res!100008) (not e!79086))))

(declare-fun lt!188558 () (_ BitVec 64))

(declare-fun lt!188557 () BitStream!4324)

(assert (=> d!38992 (= res!100008 (= (bvadd lt!188558 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!2425 (buf!2856 lt!188557)) (currentByte!5535 lt!188557) (currentBit!5530 lt!188557))))))

(assert (=> d!38992 (or (not (= (bvand lt!188558 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!188558 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!188558 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38992 (= lt!188558 (bitIndex!0 (size!2425 (buf!2856 (_1!5308 lt!187387))) (currentByte!5535 (_1!5308 lt!187387)) (currentBit!5530 (_1!5308 lt!187387))))))

(assert (=> d!38992 (= lt!188557 (_2!5309 (moveBitIndex!0 (_1!5308 lt!187387) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!38992 (moveBitIndexPrecond!0 (_1!5308 lt!187387) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!38992 (= (withMovedBitIndex!0 (_1!5308 lt!187387) #b0000000000000000000000000000000000000000000000000000000000000001) lt!188557)))

(declare-fun b!120796 () Bool)

(assert (=> b!120796 (= e!79086 (= (size!2425 (buf!2856 (_1!5308 lt!187387))) (size!2425 (buf!2856 lt!188557))))))

(assert (= (and d!38992 res!100008) b!120796))

(declare-fun m!182797 () Bool)

(assert (=> d!38992 m!182797))

(declare-fun m!182799 () Bool)

(assert (=> d!38992 m!182799))

(declare-fun m!182801 () Bool)

(assert (=> d!38992 m!182801))

(declare-fun m!182803 () Bool)

(assert (=> d!38992 m!182803))

(assert (=> b!120374 d!38992))

(assert (=> b!120374 d!38842))

(assert (=> b!120374 d!38840))

(declare-fun d!38994 () Bool)

(declare-fun lt!188559 () tuple2!10118)

(assert (=> d!38994 (= lt!188559 (readNLeastSignificantBitsLoop!0 (withMovedBitIndex!0 (_1!5308 lt!187387) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!187383))))

(assert (=> d!38994 (= (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!5308 lt!187387) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!187383) (tuple2!10091 (_2!5324 lt!188559) (_1!5324 lt!188559)))))

(declare-fun bs!9427 () Bool)

(assert (= bs!9427 d!38994))

(assert (=> bs!9427 m!181907))

(declare-fun m!182805 () Bool)

(assert (=> bs!9427 m!182805))

(assert (=> b!120374 d!38994))

(push 1)

(assert (not b!120753))

(assert (not b!120540))

(assert (not d!38850))

(assert (not d!38798))

(assert (not d!38858))

(assert (not d!38868))

(assert (not d!38794))

(assert (not b!120734))

(assert (not d!38870))

(assert (not b!120749))

(assert (not b!120729))

(assert (not b!120789))

(assert (not d!38854))

(assert (not b!120542))

(assert (not d!38864))

(assert (not d!38862))

(assert (not b!120736))

(assert (not d!38838))

(assert (not b!120570))

(assert (not d!38990))

(assert (not d!38846))

(assert (not b!120787))

(assert (not d!38800))

(assert (not d!38986))

(assert (not d!38968))

(assert (not b!120571))

(assert (not d!38822))

(assert (not b!120786))

(assert (not b!120758))

(assert (not d!38840))

(assert (not d!38988))

(assert (not b!120751))

(assert (not d!38970))

(assert (not d!38842))

(assert (not d!38964))

(assert (not d!38984))

(assert (not b!120735))

(assert (not d!38848))

(assert (not bm!1577))

(assert (not b!120573))

(assert (not b!120788))

(assert (not d!38860))

(assert (not b!120737))

(assert (not d!38994))

(assert (not b!120740))

(assert (not d!38852))

(assert (not d!38962))

(assert (not b!120730))

(assert (not b!120728))

(assert (not b!120569))

(assert (not b!120750))

(assert (not b!120733))

(assert (not d!38992))

(assert (not b!120756))

(assert (not b!120505))

(assert (not d!38950))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

