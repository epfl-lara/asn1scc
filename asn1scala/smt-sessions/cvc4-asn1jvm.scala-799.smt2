; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!23112 () Bool)

(assert start!23112)

(declare-fun b!117346 () Bool)

(declare-fun res!97069 () Bool)

(declare-fun e!76934 () Bool)

(assert (=> b!117346 (=> (not res!97069) (not e!76934))))

(declare-datatypes ((array!5283 0))(
  ( (array!5284 (arr!2990 (Array (_ BitVec 32) (_ BitVec 8))) (size!2397 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4268 0))(
  ( (BitStream!4269 (buf!2810 array!5283) (currentByte!5453 (_ BitVec 32)) (currentBit!5448 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4268)

(declare-datatypes ((Unit!7217 0))(
  ( (Unit!7218) )
))
(declare-datatypes ((tuple2!9788 0))(
  ( (tuple2!9789 (_1!5159 Unit!7217) (_2!5159 BitStream!4268)) )
))
(declare-fun lt!179644 () tuple2!9788)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!117346 (= res!97069 (invariant!0 (currentBit!5448 thiss!1305) (currentByte!5453 thiss!1305) (size!2397 (buf!2810 (_2!5159 lt!179644)))))))

(declare-fun b!117347 () Bool)

(declare-fun e!76933 () Bool)

(declare-fun lt!179646 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!117347 (= e!76933 (validate_offset_bits!1 ((_ sign_extend 32) (size!2397 (buf!2810 (_2!5159 lt!179644)))) ((_ sign_extend 32) (currentByte!5453 (_2!5159 lt!179644))) ((_ sign_extend 32) (currentBit!5448 (_2!5159 lt!179644))) lt!179646))))

(declare-fun b!117349 () Bool)

(declare-fun res!97076 () Bool)

(declare-fun e!76937 () Bool)

(assert (=> b!117349 (=> (not res!97076) (not e!76937))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!117349 (= res!97076 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!117350 () Bool)

(declare-fun e!76936 () Bool)

(declare-fun array_inv!2199 (array!5283) Bool)

(assert (=> b!117350 (= e!76936 (array_inv!2199 (buf!2810 thiss!1305)))))

(declare-fun b!117351 () Bool)

(assert (=> b!117351 (= e!76937 (not e!76933))))

(declare-fun res!97080 () Bool)

(assert (=> b!117351 (=> res!97080 e!76933)))

(declare-fun lt!179655 () tuple2!9788)

(assert (=> b!117351 (= res!97080 (or (not (= (size!2397 (buf!2810 (_2!5159 lt!179644))) (size!2397 (buf!2810 (_2!5159 lt!179655))))) (bvslt lt!179646 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun i!615 () (_ BitVec 32))

(assert (=> b!117351 (= lt!179646 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!9790 0))(
  ( (tuple2!9791 (_1!5160 BitStream!4268) (_2!5160 (_ BitVec 64))) )
))
(declare-fun lt!179640 () tuple2!9790)

(declare-datatypes ((tuple2!9792 0))(
  ( (tuple2!9793 (_1!5161 BitStream!4268) (_2!5161 BitStream!4268)) )
))
(declare-fun lt!179641 () tuple2!9792)

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4268 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!9790)

(assert (=> b!117351 (= lt!179640 (readNLeastSignificantBitsLoopPure!0 (_1!5161 lt!179641) nBits!396 i!615 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615))))))))

(declare-fun lt!179653 () (_ BitVec 64))

(assert (=> b!117351 (validate_offset_bits!1 ((_ sign_extend 32) (size!2397 (buf!2810 (_2!5159 lt!179655)))) ((_ sign_extend 32) (currentByte!5453 thiss!1305)) ((_ sign_extend 32) (currentBit!5448 thiss!1305)) lt!179653)))

(declare-fun lt!179643 () Unit!7217)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4268 array!5283 (_ BitVec 64)) Unit!7217)

(assert (=> b!117351 (= lt!179643 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2810 (_2!5159 lt!179655)) lt!179653))))

(declare-fun lt!179650 () Bool)

(declare-datatypes ((tuple2!9794 0))(
  ( (tuple2!9795 (_1!5162 BitStream!4268) (_2!5162 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!4268) tuple2!9794)

(assert (=> b!117351 (= (_2!5162 (readBitPure!0 (_1!5161 lt!179641))) lt!179650)))

(declare-fun lt!179654 () tuple2!9792)

(declare-fun reader!0 (BitStream!4268 BitStream!4268) tuple2!9792)

(assert (=> b!117351 (= lt!179654 (reader!0 (_2!5159 lt!179644) (_2!5159 lt!179655)))))

(assert (=> b!117351 (= lt!179641 (reader!0 thiss!1305 (_2!5159 lt!179655)))))

(declare-fun e!76938 () Bool)

(assert (=> b!117351 e!76938))

(declare-fun res!97070 () Bool)

(assert (=> b!117351 (=> (not res!97070) (not e!76938))))

(declare-fun lt!179645 () tuple2!9794)

(declare-fun lt!179648 () tuple2!9794)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!117351 (= res!97070 (= (bitIndex!0 (size!2397 (buf!2810 (_1!5162 lt!179645))) (currentByte!5453 (_1!5162 lt!179645)) (currentBit!5448 (_1!5162 lt!179645))) (bitIndex!0 (size!2397 (buf!2810 (_1!5162 lt!179648))) (currentByte!5453 (_1!5162 lt!179648)) (currentBit!5448 (_1!5162 lt!179648)))))))

(declare-fun lt!179642 () Unit!7217)

(declare-fun lt!179652 () BitStream!4268)

(declare-fun readBitPrefixLemma!0 (BitStream!4268 BitStream!4268) Unit!7217)

(assert (=> b!117351 (= lt!179642 (readBitPrefixLemma!0 lt!179652 (_2!5159 lt!179655)))))

(assert (=> b!117351 (= lt!179648 (readBitPure!0 (BitStream!4269 (buf!2810 (_2!5159 lt!179655)) (currentByte!5453 thiss!1305) (currentBit!5448 thiss!1305))))))

(assert (=> b!117351 (= lt!179645 (readBitPure!0 lt!179652))))

(assert (=> b!117351 (= lt!179652 (BitStream!4269 (buf!2810 (_2!5159 lt!179644)) (currentByte!5453 thiss!1305) (currentBit!5448 thiss!1305)))))

(assert (=> b!117351 e!76934))

(declare-fun res!97072 () Bool)

(assert (=> b!117351 (=> (not res!97072) (not e!76934))))

(declare-fun isPrefixOf!0 (BitStream!4268 BitStream!4268) Bool)

(assert (=> b!117351 (= res!97072 (isPrefixOf!0 thiss!1305 (_2!5159 lt!179655)))))

(declare-fun lt!179639 () Unit!7217)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4268 BitStream!4268 BitStream!4268) Unit!7217)

(assert (=> b!117351 (= lt!179639 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5159 lt!179644) (_2!5159 lt!179655)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4268 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!9788)

(assert (=> b!117351 (= lt!179655 (appendNLeastSignificantBitsLoop!0 (_2!5159 lt!179644) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!76935 () Bool)

(assert (=> b!117351 e!76935))

(declare-fun res!97074 () Bool)

(assert (=> b!117351 (=> (not res!97074) (not e!76935))))

(assert (=> b!117351 (= res!97074 (= (size!2397 (buf!2810 thiss!1305)) (size!2397 (buf!2810 (_2!5159 lt!179644)))))))

(declare-fun appendBit!0 (BitStream!4268 Bool) tuple2!9788)

(assert (=> b!117351 (= lt!179644 (appendBit!0 thiss!1305 lt!179650))))

(assert (=> b!117351 (= lt!179650 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!117352 () Bool)

(assert (=> b!117352 (= e!76938 (= (_2!5162 lt!179645) (_2!5162 lt!179648)))))

(declare-fun b!117353 () Bool)

(declare-fun e!76932 () Bool)

(assert (=> b!117353 (= e!76935 e!76932)))

(declare-fun res!97071 () Bool)

(assert (=> b!117353 (=> (not res!97071) (not e!76932))))

(declare-fun lt!179649 () (_ BitVec 64))

(declare-fun lt!179647 () (_ BitVec 64))

(assert (=> b!117353 (= res!97071 (= lt!179649 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!179647)))))

(assert (=> b!117353 (= lt!179649 (bitIndex!0 (size!2397 (buf!2810 (_2!5159 lt!179644))) (currentByte!5453 (_2!5159 lt!179644)) (currentBit!5448 (_2!5159 lt!179644))))))

(assert (=> b!117353 (= lt!179647 (bitIndex!0 (size!2397 (buf!2810 thiss!1305)) (currentByte!5453 thiss!1305) (currentBit!5448 thiss!1305)))))

(declare-fun b!117354 () Bool)

(declare-fun e!76939 () Bool)

(assert (=> b!117354 (= e!76939 e!76937)))

(declare-fun res!97079 () Bool)

(assert (=> b!117354 (=> (not res!97079) (not e!76937))))

(assert (=> b!117354 (= res!97079 (validate_offset_bits!1 ((_ sign_extend 32) (size!2397 (buf!2810 thiss!1305))) ((_ sign_extend 32) (currentByte!5453 thiss!1305)) ((_ sign_extend 32) (currentBit!5448 thiss!1305)) lt!179653))))

(assert (=> b!117354 (= lt!179653 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!117355 () Bool)

(declare-fun e!76941 () Bool)

(assert (=> b!117355 (= e!76932 e!76941)))

(declare-fun res!97077 () Bool)

(assert (=> b!117355 (=> (not res!97077) (not e!76941))))

(declare-fun lt!179651 () tuple2!9794)

(assert (=> b!117355 (= res!97077 (and (= (_2!5162 lt!179651) lt!179650) (= (_1!5162 lt!179651) (_2!5159 lt!179644))))))

(declare-fun readerFrom!0 (BitStream!4268 (_ BitVec 32) (_ BitVec 32)) BitStream!4268)

(assert (=> b!117355 (= lt!179651 (readBitPure!0 (readerFrom!0 (_2!5159 lt!179644) (currentBit!5448 thiss!1305) (currentByte!5453 thiss!1305))))))

(declare-fun b!117356 () Bool)

(assert (=> b!117356 (= e!76934 (invariant!0 (currentBit!5448 thiss!1305) (currentByte!5453 thiss!1305) (size!2397 (buf!2810 (_2!5159 lt!179655)))))))

(declare-fun b!117348 () Bool)

(assert (=> b!117348 (= e!76941 (= (bitIndex!0 (size!2397 (buf!2810 (_1!5162 lt!179651))) (currentByte!5453 (_1!5162 lt!179651)) (currentBit!5448 (_1!5162 lt!179651))) lt!179649))))

(declare-fun res!97073 () Bool)

(assert (=> start!23112 (=> (not res!97073) (not e!76939))))

(assert (=> start!23112 (= res!97073 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!23112 e!76939))

(assert (=> start!23112 true))

(declare-fun inv!12 (BitStream!4268) Bool)

(assert (=> start!23112 (and (inv!12 thiss!1305) e!76936)))

(declare-fun b!117357 () Bool)

(declare-fun res!97078 () Bool)

(assert (=> b!117357 (=> (not res!97078) (not e!76937))))

(assert (=> b!117357 (= res!97078 (bvslt i!615 nBits!396))))

(declare-fun b!117358 () Bool)

(declare-fun res!97075 () Bool)

(assert (=> b!117358 (=> (not res!97075) (not e!76932))))

(assert (=> b!117358 (= res!97075 (isPrefixOf!0 thiss!1305 (_2!5159 lt!179644)))))

(assert (= (and start!23112 res!97073) b!117354))

(assert (= (and b!117354 res!97079) b!117349))

(assert (= (and b!117349 res!97076) b!117357))

(assert (= (and b!117357 res!97078) b!117351))

(assert (= (and b!117351 res!97074) b!117353))

(assert (= (and b!117353 res!97071) b!117358))

(assert (= (and b!117358 res!97075) b!117355))

(assert (= (and b!117355 res!97077) b!117348))

(assert (= (and b!117351 res!97072) b!117346))

(assert (= (and b!117346 res!97069) b!117356))

(assert (= (and b!117351 res!97070) b!117352))

(assert (= (and b!117351 (not res!97080)) b!117347))

(assert (= start!23112 b!117350))

(declare-fun m!175897 () Bool)

(assert (=> b!117348 m!175897))

(declare-fun m!175899 () Bool)

(assert (=> b!117351 m!175899))

(declare-fun m!175901 () Bool)

(assert (=> b!117351 m!175901))

(declare-fun m!175903 () Bool)

(assert (=> b!117351 m!175903))

(declare-fun m!175905 () Bool)

(assert (=> b!117351 m!175905))

(declare-fun m!175907 () Bool)

(assert (=> b!117351 m!175907))

(declare-fun m!175909 () Bool)

(assert (=> b!117351 m!175909))

(declare-fun m!175911 () Bool)

(assert (=> b!117351 m!175911))

(declare-fun m!175913 () Bool)

(assert (=> b!117351 m!175913))

(declare-fun m!175915 () Bool)

(assert (=> b!117351 m!175915))

(declare-fun m!175917 () Bool)

(assert (=> b!117351 m!175917))

(declare-fun m!175919 () Bool)

(assert (=> b!117351 m!175919))

(declare-fun m!175921 () Bool)

(assert (=> b!117351 m!175921))

(declare-fun m!175923 () Bool)

(assert (=> b!117351 m!175923))

(declare-fun m!175925 () Bool)

(assert (=> b!117351 m!175925))

(declare-fun m!175927 () Bool)

(assert (=> b!117351 m!175927))

(declare-fun m!175929 () Bool)

(assert (=> b!117351 m!175929))

(declare-fun m!175931 () Bool)

(assert (=> b!117346 m!175931))

(declare-fun m!175933 () Bool)

(assert (=> b!117353 m!175933))

(declare-fun m!175935 () Bool)

(assert (=> b!117353 m!175935))

(declare-fun m!175937 () Bool)

(assert (=> b!117350 m!175937))

(declare-fun m!175939 () Bool)

(assert (=> b!117347 m!175939))

(declare-fun m!175941 () Bool)

(assert (=> b!117356 m!175941))

(declare-fun m!175943 () Bool)

(assert (=> b!117354 m!175943))

(declare-fun m!175945 () Bool)

(assert (=> b!117355 m!175945))

(assert (=> b!117355 m!175945))

(declare-fun m!175947 () Bool)

(assert (=> b!117355 m!175947))

(declare-fun m!175949 () Bool)

(assert (=> b!117358 m!175949))

(declare-fun m!175951 () Bool)

(assert (=> b!117349 m!175951))

(declare-fun m!175953 () Bool)

(assert (=> start!23112 m!175953))

(push 1)

(assert (not b!117358))

(assert (not b!117348))

(assert (not start!23112))

(assert (not b!117353))

(assert (not b!117351))

(assert (not b!117350))

(assert (not b!117356))

(assert (not b!117347))

(assert (not b!117346))

(assert (not b!117354))

(assert (not b!117355))

(assert (not b!117349))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!37560 () Bool)

(declare-fun e!76974 () Bool)

(assert (=> d!37560 e!76974))

(declare-fun res!97140 () Bool)

(assert (=> d!37560 (=> (not res!97140) (not e!76974))))

(declare-fun lt!179813 () (_ BitVec 64))

(declare-fun lt!179816 () (_ BitVec 64))

(declare-fun lt!179815 () (_ BitVec 64))

(assert (=> d!37560 (= res!97140 (= lt!179815 (bvsub lt!179816 lt!179813)))))

(assert (=> d!37560 (or (= (bvand lt!179816 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!179813 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!179816 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!179816 lt!179813) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!37560 (= lt!179813 (remainingBits!0 ((_ sign_extend 32) (size!2397 (buf!2810 (_2!5159 lt!179644)))) ((_ sign_extend 32) (currentByte!5453 (_2!5159 lt!179644))) ((_ sign_extend 32) (currentBit!5448 (_2!5159 lt!179644)))))))

(declare-fun lt!179818 () (_ BitVec 64))

(declare-fun lt!179814 () (_ BitVec 64))

(assert (=> d!37560 (= lt!179816 (bvmul lt!179818 lt!179814))))

(assert (=> d!37560 (or (= lt!179818 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!179814 (bvsdiv (bvmul lt!179818 lt!179814) lt!179818)))))

(assert (=> d!37560 (= lt!179814 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!37560 (= lt!179818 ((_ sign_extend 32) (size!2397 (buf!2810 (_2!5159 lt!179644)))))))

(assert (=> d!37560 (= lt!179815 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5453 (_2!5159 lt!179644))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5448 (_2!5159 lt!179644)))))))

(assert (=> d!37560 (invariant!0 (currentBit!5448 (_2!5159 lt!179644)) (currentByte!5453 (_2!5159 lt!179644)) (size!2397 (buf!2810 (_2!5159 lt!179644))))))

(assert (=> d!37560 (= (bitIndex!0 (size!2397 (buf!2810 (_2!5159 lt!179644))) (currentByte!5453 (_2!5159 lt!179644)) (currentBit!5448 (_2!5159 lt!179644))) lt!179815)))

(declare-fun b!117425 () Bool)

(declare-fun res!97141 () Bool)

(assert (=> b!117425 (=> (not res!97141) (not e!76974))))

(assert (=> b!117425 (= res!97141 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!179815))))

(declare-fun b!117426 () Bool)

(declare-fun lt!179817 () (_ BitVec 64))

(assert (=> b!117426 (= e!76974 (bvsle lt!179815 (bvmul lt!179817 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!117426 (or (= lt!179817 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!179817 #b0000000000000000000000000000000000000000000000000000000000001000) lt!179817)))))

(assert (=> b!117426 (= lt!179817 ((_ sign_extend 32) (size!2397 (buf!2810 (_2!5159 lt!179644)))))))

(assert (= (and d!37560 res!97140) b!117425))

(assert (= (and b!117425 res!97141) b!117426))

(declare-fun m!176043 () Bool)

(assert (=> d!37560 m!176043))

(declare-fun m!176045 () Bool)

(assert (=> d!37560 m!176045))

(assert (=> b!117353 d!37560))

(declare-fun d!37566 () Bool)

(declare-fun e!76975 () Bool)

(assert (=> d!37566 e!76975))

(declare-fun res!97142 () Bool)

(assert (=> d!37566 (=> (not res!97142) (not e!76975))))

(declare-fun lt!179822 () (_ BitVec 64))

(declare-fun lt!179819 () (_ BitVec 64))

(declare-fun lt!179821 () (_ BitVec 64))

(assert (=> d!37566 (= res!97142 (= lt!179821 (bvsub lt!179822 lt!179819)))))

(assert (=> d!37566 (or (= (bvand lt!179822 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!179819 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!179822 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!179822 lt!179819) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!37566 (= lt!179819 (remainingBits!0 ((_ sign_extend 32) (size!2397 (buf!2810 thiss!1305))) ((_ sign_extend 32) (currentByte!5453 thiss!1305)) ((_ sign_extend 32) (currentBit!5448 thiss!1305))))))

(declare-fun lt!179824 () (_ BitVec 64))

(declare-fun lt!179820 () (_ BitVec 64))

(assert (=> d!37566 (= lt!179822 (bvmul lt!179824 lt!179820))))

(assert (=> d!37566 (or (= lt!179824 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!179820 (bvsdiv (bvmul lt!179824 lt!179820) lt!179824)))))

(assert (=> d!37566 (= lt!179820 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!37566 (= lt!179824 ((_ sign_extend 32) (size!2397 (buf!2810 thiss!1305))))))

(assert (=> d!37566 (= lt!179821 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5453 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5448 thiss!1305))))))

(assert (=> d!37566 (invariant!0 (currentBit!5448 thiss!1305) (currentByte!5453 thiss!1305) (size!2397 (buf!2810 thiss!1305)))))

(assert (=> d!37566 (= (bitIndex!0 (size!2397 (buf!2810 thiss!1305)) (currentByte!5453 thiss!1305) (currentBit!5448 thiss!1305)) lt!179821)))

(declare-fun b!117427 () Bool)

(declare-fun res!97143 () Bool)

(assert (=> b!117427 (=> (not res!97143) (not e!76975))))

(assert (=> b!117427 (= res!97143 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!179821))))

(declare-fun b!117428 () Bool)

(declare-fun lt!179823 () (_ BitVec 64))

(assert (=> b!117428 (= e!76975 (bvsle lt!179821 (bvmul lt!179823 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!117428 (or (= lt!179823 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!179823 #b0000000000000000000000000000000000000000000000000000000000001000) lt!179823)))))

(assert (=> b!117428 (= lt!179823 ((_ sign_extend 32) (size!2397 (buf!2810 thiss!1305))))))

(assert (= (and d!37566 res!97142) b!117427))

(assert (= (and b!117427 res!97143) b!117428))

(declare-fun m!176047 () Bool)

(assert (=> d!37566 m!176047))

(declare-fun m!176049 () Bool)

(assert (=> d!37566 m!176049))

(assert (=> b!117353 d!37566))

(declare-fun d!37568 () Bool)

(assert (=> d!37568 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2397 (buf!2810 thiss!1305))) ((_ sign_extend 32) (currentByte!5453 thiss!1305)) ((_ sign_extend 32) (currentBit!5448 thiss!1305)) lt!179653) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2397 (buf!2810 thiss!1305))) ((_ sign_extend 32) (currentByte!5453 thiss!1305)) ((_ sign_extend 32) (currentBit!5448 thiss!1305))) lt!179653))))

(declare-fun bs!9088 () Bool)

(assert (= bs!9088 d!37568))

(assert (=> bs!9088 m!176047))

(assert (=> b!117354 d!37568))

(declare-fun d!37570 () Bool)

(assert (=> d!37570 (= (onesLSBLong!0 nBits!396) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!396))))))

(assert (=> b!117349 d!37570))

(declare-fun d!37572 () Bool)

(assert (=> d!37572 (= (array_inv!2199 (buf!2810 thiss!1305)) (bvsge (size!2397 (buf!2810 thiss!1305)) #b00000000000000000000000000000000))))

(assert (=> b!117350 d!37572))

(declare-fun d!37574 () Bool)

(assert (=> d!37574 (= (inv!12 thiss!1305) (invariant!0 (currentBit!5448 thiss!1305) (currentByte!5453 thiss!1305) (size!2397 (buf!2810 thiss!1305))))))

(declare-fun bs!9089 () Bool)

(assert (= bs!9089 d!37574))

(assert (=> bs!9089 m!176049))

(assert (=> start!23112 d!37574))

(declare-fun d!37576 () Bool)

(assert (=> d!37576 (= (onesLSBLong!0 (bvsub nBits!396 i!615)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!396 i!615)))))))

(assert (=> b!117351 d!37576))

(declare-fun d!37578 () Bool)

(assert (=> d!37578 (validate_offset_bits!1 ((_ sign_extend 32) (size!2397 (buf!2810 (_2!5159 lt!179655)))) ((_ sign_extend 32) (currentByte!5453 thiss!1305)) ((_ sign_extend 32) (currentBit!5448 thiss!1305)) lt!179653)))

(declare-fun lt!179827 () Unit!7217)

(declare-fun choose!9 (BitStream!4268 array!5283 (_ BitVec 64) BitStream!4268) Unit!7217)

(assert (=> d!37578 (= lt!179827 (choose!9 thiss!1305 (buf!2810 (_2!5159 lt!179655)) lt!179653 (BitStream!4269 (buf!2810 (_2!5159 lt!179655)) (currentByte!5453 thiss!1305) (currentBit!5448 thiss!1305))))))

(assert (=> d!37578 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2810 (_2!5159 lt!179655)) lt!179653) lt!179827)))

(declare-fun bs!9090 () Bool)

(assert (= bs!9090 d!37578))

(assert (=> bs!9090 m!175915))

(declare-fun m!176051 () Bool)

(assert (=> bs!9090 m!176051))

(assert (=> b!117351 d!37578))

(declare-fun b!117463 () Bool)

(declare-fun e!76992 () Unit!7217)

(declare-fun Unit!7227 () Unit!7217)

(assert (=> b!117463 (= e!76992 Unit!7227)))

(declare-fun b!117464 () Bool)

(declare-fun lt!179972 () Unit!7217)

(assert (=> b!117464 (= e!76992 lt!179972)))

(declare-fun lt!179973 () (_ BitVec 64))

(assert (=> b!117464 (= lt!179973 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!179978 () (_ BitVec 64))

(assert (=> b!117464 (= lt!179978 (bitIndex!0 (size!2397 (buf!2810 thiss!1305)) (currentByte!5453 thiss!1305) (currentBit!5448 thiss!1305)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!5283 array!5283 (_ BitVec 64) (_ BitVec 64)) Unit!7217)

(assert (=> b!117464 (= lt!179972 (arrayBitRangesEqSymmetric!0 (buf!2810 thiss!1305) (buf!2810 (_2!5159 lt!179655)) lt!179973 lt!179978))))

(declare-fun arrayBitRangesEq!0 (array!5283 array!5283 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!117464 (arrayBitRangesEq!0 (buf!2810 (_2!5159 lt!179655)) (buf!2810 thiss!1305) lt!179973 lt!179978)))

(declare-fun b!117465 () Bool)

(declare-fun res!97166 () Bool)

(declare-fun e!76991 () Bool)

(assert (=> b!117465 (=> (not res!97166) (not e!76991))))

(declare-fun lt!179964 () tuple2!9792)

(assert (=> b!117465 (= res!97166 (isPrefixOf!0 (_1!5161 lt!179964) thiss!1305))))

(declare-fun b!117466 () Bool)

(declare-fun res!97167 () Bool)

(assert (=> b!117466 (=> (not res!97167) (not e!76991))))

(assert (=> b!117466 (= res!97167 (isPrefixOf!0 (_2!5161 lt!179964) (_2!5159 lt!179655)))))

(declare-fun b!117462 () Bool)

(declare-fun lt!179960 () (_ BitVec 64))

(declare-fun lt!179966 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!4268 (_ BitVec 64)) BitStream!4268)

(assert (=> b!117462 (= e!76991 (= (_1!5161 lt!179964) (withMovedBitIndex!0 (_2!5161 lt!179964) (bvsub lt!179960 lt!179966))))))

(assert (=> b!117462 (or (= (bvand lt!179960 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!179966 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!179960 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!179960 lt!179966) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!117462 (= lt!179966 (bitIndex!0 (size!2397 (buf!2810 (_2!5159 lt!179655))) (currentByte!5453 (_2!5159 lt!179655)) (currentBit!5448 (_2!5159 lt!179655))))))

(assert (=> b!117462 (= lt!179960 (bitIndex!0 (size!2397 (buf!2810 thiss!1305)) (currentByte!5453 thiss!1305) (currentBit!5448 thiss!1305)))))

(declare-fun d!37580 () Bool)

(assert (=> d!37580 e!76991))

(declare-fun res!97165 () Bool)

(assert (=> d!37580 (=> (not res!97165) (not e!76991))))

(assert (=> d!37580 (= res!97165 (isPrefixOf!0 (_1!5161 lt!179964) (_2!5161 lt!179964)))))

(declare-fun lt!179961 () BitStream!4268)

(assert (=> d!37580 (= lt!179964 (tuple2!9793 lt!179961 (_2!5159 lt!179655)))))

(declare-fun lt!179970 () Unit!7217)

(declare-fun lt!179974 () Unit!7217)

(assert (=> d!37580 (= lt!179970 lt!179974)))

(assert (=> d!37580 (isPrefixOf!0 lt!179961 (_2!5159 lt!179655))))

(assert (=> d!37580 (= lt!179974 (lemmaIsPrefixTransitive!0 lt!179961 (_2!5159 lt!179655) (_2!5159 lt!179655)))))

(declare-fun lt!179969 () Unit!7217)

(declare-fun lt!179962 () Unit!7217)

(assert (=> d!37580 (= lt!179969 lt!179962)))

(assert (=> d!37580 (isPrefixOf!0 lt!179961 (_2!5159 lt!179655))))

(assert (=> d!37580 (= lt!179962 (lemmaIsPrefixTransitive!0 lt!179961 thiss!1305 (_2!5159 lt!179655)))))

(declare-fun lt!179963 () Unit!7217)

(assert (=> d!37580 (= lt!179963 e!76992)))

(declare-fun c!7070 () Bool)

(assert (=> d!37580 (= c!7070 (not (= (size!2397 (buf!2810 thiss!1305)) #b00000000000000000000000000000000)))))

(declare-fun lt!179968 () Unit!7217)

(declare-fun lt!179977 () Unit!7217)

(assert (=> d!37580 (= lt!179968 lt!179977)))

(assert (=> d!37580 (isPrefixOf!0 (_2!5159 lt!179655) (_2!5159 lt!179655))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4268) Unit!7217)

(assert (=> d!37580 (= lt!179977 (lemmaIsPrefixRefl!0 (_2!5159 lt!179655)))))

(declare-fun lt!179971 () Unit!7217)

(declare-fun lt!179967 () Unit!7217)

(assert (=> d!37580 (= lt!179971 lt!179967)))

(assert (=> d!37580 (= lt!179967 (lemmaIsPrefixRefl!0 (_2!5159 lt!179655)))))

(declare-fun lt!179979 () Unit!7217)

(declare-fun lt!179965 () Unit!7217)

(assert (=> d!37580 (= lt!179979 lt!179965)))

(assert (=> d!37580 (isPrefixOf!0 lt!179961 lt!179961)))

(assert (=> d!37580 (= lt!179965 (lemmaIsPrefixRefl!0 lt!179961))))

(declare-fun lt!179975 () Unit!7217)

(declare-fun lt!179976 () Unit!7217)

(assert (=> d!37580 (= lt!179975 lt!179976)))

(assert (=> d!37580 (isPrefixOf!0 thiss!1305 thiss!1305)))

(assert (=> d!37580 (= lt!179976 (lemmaIsPrefixRefl!0 thiss!1305))))

(assert (=> d!37580 (= lt!179961 (BitStream!4269 (buf!2810 (_2!5159 lt!179655)) (currentByte!5453 thiss!1305) (currentBit!5448 thiss!1305)))))

(assert (=> d!37580 (isPrefixOf!0 thiss!1305 (_2!5159 lt!179655))))

(assert (=> d!37580 (= (reader!0 thiss!1305 (_2!5159 lt!179655)) lt!179964)))

(assert (= (and d!37580 c!7070) b!117464))

(assert (= (and d!37580 (not c!7070)) b!117463))

(assert (= (and d!37580 res!97165) b!117465))

(assert (= (and b!117465 res!97166) b!117466))

(assert (= (and b!117466 res!97167) b!117462))

(declare-fun m!176123 () Bool)

(assert (=> b!117462 m!176123))

(declare-fun m!176125 () Bool)

(assert (=> b!117462 m!176125))

(assert (=> b!117462 m!175935))

(declare-fun m!176127 () Bool)

(assert (=> d!37580 m!176127))

(declare-fun m!176129 () Bool)

(assert (=> d!37580 m!176129))

(declare-fun m!176131 () Bool)

(assert (=> d!37580 m!176131))

(declare-fun m!176133 () Bool)

(assert (=> d!37580 m!176133))

(declare-fun m!176135 () Bool)

(assert (=> d!37580 m!176135))

(declare-fun m!176139 () Bool)

(assert (=> d!37580 m!176139))

(declare-fun m!176143 () Bool)

(assert (=> d!37580 m!176143))

(declare-fun m!176145 () Bool)

(assert (=> d!37580 m!176145))

(assert (=> d!37580 m!175917))

(declare-fun m!176147 () Bool)

(assert (=> d!37580 m!176147))

(declare-fun m!176149 () Bool)

(assert (=> d!37580 m!176149))

(declare-fun m!176151 () Bool)

(assert (=> b!117466 m!176151))

(declare-fun m!176153 () Bool)

(assert (=> b!117465 m!176153))

(assert (=> b!117464 m!175935))

(declare-fun m!176155 () Bool)

(assert (=> b!117464 m!176155))

(declare-fun m!176157 () Bool)

(assert (=> b!117464 m!176157))

(assert (=> b!117351 d!37580))

(declare-fun d!37590 () Bool)

(declare-fun e!76997 () Bool)

(assert (=> d!37590 e!76997))

(declare-fun res!97174 () Bool)

(assert (=> d!37590 (=> (not res!97174) (not e!76997))))

(declare-fun lt!180011 () tuple2!9794)

(declare-fun lt!180009 () tuple2!9794)

(assert (=> d!37590 (= res!97174 (= (bitIndex!0 (size!2397 (buf!2810 (_1!5162 lt!180011))) (currentByte!5453 (_1!5162 lt!180011)) (currentBit!5448 (_1!5162 lt!180011))) (bitIndex!0 (size!2397 (buf!2810 (_1!5162 lt!180009))) (currentByte!5453 (_1!5162 lt!180009)) (currentBit!5448 (_1!5162 lt!180009)))))))

(declare-fun lt!180012 () BitStream!4268)

(declare-fun lt!180010 () Unit!7217)

(declare-fun choose!50 (BitStream!4268 BitStream!4268 BitStream!4268 tuple2!9794 tuple2!9794 BitStream!4268 Bool tuple2!9794 tuple2!9794 BitStream!4268 Bool) Unit!7217)

(assert (=> d!37590 (= lt!180010 (choose!50 lt!179652 (_2!5159 lt!179655) lt!180012 lt!180011 (tuple2!9795 (_1!5162 lt!180011) (_2!5162 lt!180011)) (_1!5162 lt!180011) (_2!5162 lt!180011) lt!180009 (tuple2!9795 (_1!5162 lt!180009) (_2!5162 lt!180009)) (_1!5162 lt!180009) (_2!5162 lt!180009)))))

(assert (=> d!37590 (= lt!180009 (readBitPure!0 lt!180012))))

(assert (=> d!37590 (= lt!180011 (readBitPure!0 lt!179652))))

(assert (=> d!37590 (= lt!180012 (BitStream!4269 (buf!2810 (_2!5159 lt!179655)) (currentByte!5453 lt!179652) (currentBit!5448 lt!179652)))))

(assert (=> d!37590 (invariant!0 (currentBit!5448 lt!179652) (currentByte!5453 lt!179652) (size!2397 (buf!2810 (_2!5159 lt!179655))))))

(assert (=> d!37590 (= (readBitPrefixLemma!0 lt!179652 (_2!5159 lt!179655)) lt!180010)))

(declare-fun b!117473 () Bool)

(assert (=> b!117473 (= e!76997 (= (_2!5162 lt!180011) (_2!5162 lt!180009)))))

(assert (= (and d!37590 res!97174) b!117473))

(declare-fun m!176171 () Bool)

(assert (=> d!37590 m!176171))

(assert (=> d!37590 m!175905))

(declare-fun m!176173 () Bool)

(assert (=> d!37590 m!176173))

(declare-fun m!176175 () Bool)

(assert (=> d!37590 m!176175))

(declare-fun m!176177 () Bool)

(assert (=> d!37590 m!176177))

(declare-fun m!176179 () Bool)

(assert (=> d!37590 m!176179))

(assert (=> b!117351 d!37590))

(declare-fun d!37602 () Bool)

(assert (=> d!37602 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2397 (buf!2810 (_2!5159 lt!179655)))) ((_ sign_extend 32) (currentByte!5453 thiss!1305)) ((_ sign_extend 32) (currentBit!5448 thiss!1305)) lt!179653) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2397 (buf!2810 (_2!5159 lt!179655)))) ((_ sign_extend 32) (currentByte!5453 thiss!1305)) ((_ sign_extend 32) (currentBit!5448 thiss!1305))) lt!179653))))

(declare-fun bs!9095 () Bool)

(assert (= bs!9095 d!37602))

(declare-fun m!176181 () Bool)

(assert (=> bs!9095 m!176181))

(assert (=> b!117351 d!37602))

(declare-fun d!37604 () Bool)

(declare-datatypes ((tuple2!9802 0))(
  ( (tuple2!9803 (_1!5166 Bool) (_2!5166 BitStream!4268)) )
))
(declare-fun lt!180016 () tuple2!9802)

(declare-fun readBit!0 (BitStream!4268) tuple2!9802)

(assert (=> d!37604 (= lt!180016 (readBit!0 lt!179652))))

(assert (=> d!37604 (= (readBitPure!0 lt!179652) (tuple2!9795 (_2!5166 lt!180016) (_1!5166 lt!180016)))))

(declare-fun bs!9096 () Bool)

(assert (= bs!9096 d!37604))

(declare-fun m!176183 () Bool)

(assert (=> bs!9096 m!176183))

(assert (=> b!117351 d!37604))

(declare-fun d!37606 () Bool)

(declare-fun e!77002 () Bool)

(assert (=> d!37606 e!77002))

(declare-fun res!97181 () Bool)

(assert (=> d!37606 (=> (not res!97181) (not e!77002))))

(declare-fun lt!180017 () (_ BitVec 64))

(declare-fun lt!180019 () (_ BitVec 64))

(declare-fun lt!180020 () (_ BitVec 64))

(assert (=> d!37606 (= res!97181 (= lt!180019 (bvsub lt!180020 lt!180017)))))

(assert (=> d!37606 (or (= (bvand lt!180020 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!180017 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!180020 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!180020 lt!180017) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!37606 (= lt!180017 (remainingBits!0 ((_ sign_extend 32) (size!2397 (buf!2810 (_1!5162 lt!179648)))) ((_ sign_extend 32) (currentByte!5453 (_1!5162 lt!179648))) ((_ sign_extend 32) (currentBit!5448 (_1!5162 lt!179648)))))))

(declare-fun lt!180022 () (_ BitVec 64))

(declare-fun lt!180018 () (_ BitVec 64))

(assert (=> d!37606 (= lt!180020 (bvmul lt!180022 lt!180018))))

(assert (=> d!37606 (or (= lt!180022 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!180018 (bvsdiv (bvmul lt!180022 lt!180018) lt!180022)))))

(assert (=> d!37606 (= lt!180018 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!37606 (= lt!180022 ((_ sign_extend 32) (size!2397 (buf!2810 (_1!5162 lt!179648)))))))

(assert (=> d!37606 (= lt!180019 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5453 (_1!5162 lt!179648))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5448 (_1!5162 lt!179648)))))))

(assert (=> d!37606 (invariant!0 (currentBit!5448 (_1!5162 lt!179648)) (currentByte!5453 (_1!5162 lt!179648)) (size!2397 (buf!2810 (_1!5162 lt!179648))))))

(assert (=> d!37606 (= (bitIndex!0 (size!2397 (buf!2810 (_1!5162 lt!179648))) (currentByte!5453 (_1!5162 lt!179648)) (currentBit!5448 (_1!5162 lt!179648))) lt!180019)))

(declare-fun b!117480 () Bool)

(declare-fun res!97182 () Bool)

(assert (=> b!117480 (=> (not res!97182) (not e!77002))))

(assert (=> b!117480 (= res!97182 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!180019))))

(declare-fun b!117481 () Bool)

(declare-fun lt!180021 () (_ BitVec 64))

(assert (=> b!117481 (= e!77002 (bvsle lt!180019 (bvmul lt!180021 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!117481 (or (= lt!180021 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!180021 #b0000000000000000000000000000000000000000000000000000000000001000) lt!180021)))))

(assert (=> b!117481 (= lt!180021 ((_ sign_extend 32) (size!2397 (buf!2810 (_1!5162 lt!179648)))))))

(assert (= (and d!37606 res!97181) b!117480))

(assert (= (and b!117480 res!97182) b!117481))

(declare-fun m!176185 () Bool)

(assert (=> d!37606 m!176185))

(declare-fun m!176187 () Bool)

(assert (=> d!37606 m!176187))

(assert (=> b!117351 d!37606))

(declare-fun b!117579 () Bool)

(declare-fun res!97267 () Bool)

(declare-fun e!77061 () Bool)

(assert (=> b!117579 (=> (not res!97267) (not e!77061))))

(declare-fun lt!180314 () tuple2!9788)

(assert (=> b!117579 (= res!97267 (isPrefixOf!0 (_2!5159 lt!179644) (_2!5159 lt!180314)))))

(declare-fun b!117580 () Bool)

(declare-fun e!77063 () Bool)

(declare-fun lt!180329 () tuple2!9794)

(declare-fun lt!180342 () tuple2!9794)

(assert (=> b!117580 (= e!77063 (= (_2!5162 lt!180329) (_2!5162 lt!180342)))))

(declare-fun lt!180330 () tuple2!9788)

(declare-fun call!1523 () Bool)

(declare-fun lt!180355 () BitStream!4268)

(declare-fun bm!1520 () Bool)

(declare-fun c!7083 () Bool)

(assert (=> bm!1520 (= call!1523 (isPrefixOf!0 (ite c!7083 (_2!5159 lt!179644) lt!180355) (ite c!7083 (_2!5159 lt!180330) lt!180355)))))

(declare-fun b!117581 () Bool)

(declare-fun lt!180315 () tuple2!9794)

(assert (=> b!117581 (= lt!180315 (readBitPure!0 (readerFrom!0 (_2!5159 lt!180330) (currentBit!5448 (_2!5159 lt!179644)) (currentByte!5453 (_2!5159 lt!179644)))))))

(declare-fun res!97265 () Bool)

(declare-fun lt!180347 () Bool)

(assert (=> b!117581 (= res!97265 (and (= (_2!5162 lt!180315) lt!180347) (= (_1!5162 lt!180315) (_2!5159 lt!180330))))))

(declare-fun e!77064 () Bool)

(assert (=> b!117581 (=> (not res!97265) (not e!77064))))

(declare-fun e!77059 () Bool)

(assert (=> b!117581 (= e!77059 e!77064)))

(declare-fun b!117582 () Bool)

(declare-fun e!77060 () (_ BitVec 64))

(assert (=> b!117582 (= e!77060 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))))))

(declare-fun lt!180324 () tuple2!9790)

(declare-fun b!117583 () Bool)

(declare-fun lt!180346 () tuple2!9792)

(assert (=> b!117583 (= e!77061 (and (= (_2!5160 lt!180324) v!199) (= (_1!5160 lt!180324) (_2!5161 lt!180346))))))

(declare-fun lt!180348 () (_ BitVec 64))

(assert (=> b!117583 (= lt!180324 (readNLeastSignificantBitsLoopPure!0 (_1!5161 lt!180346) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!180348))))

(declare-fun lt!180336 () Unit!7217)

(declare-fun lt!180323 () Unit!7217)

(assert (=> b!117583 (= lt!180336 lt!180323)))

(declare-fun lt!180340 () (_ BitVec 64))

(assert (=> b!117583 (validate_offset_bits!1 ((_ sign_extend 32) (size!2397 (buf!2810 (_2!5159 lt!180314)))) ((_ sign_extend 32) (currentByte!5453 (_2!5159 lt!179644))) ((_ sign_extend 32) (currentBit!5448 (_2!5159 lt!179644))) lt!180340)))

(assert (=> b!117583 (= lt!180323 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5159 lt!179644) (buf!2810 (_2!5159 lt!180314)) lt!180340))))

(declare-fun e!77062 () Bool)

(assert (=> b!117583 e!77062))

(declare-fun res!97261 () Bool)

(assert (=> b!117583 (=> (not res!97261) (not e!77062))))

(assert (=> b!117583 (= res!97261 (and (= (size!2397 (buf!2810 (_2!5159 lt!179644))) (size!2397 (buf!2810 (_2!5159 lt!180314)))) (bvsge lt!180340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!117583 (= lt!180340 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!117583 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!117583 (= lt!180348 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(assert (=> b!117583 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!117583 (= lt!180346 (reader!0 (_2!5159 lt!179644) (_2!5159 lt!180314)))))

(declare-fun d!37608 () Bool)

(assert (=> d!37608 e!77061))

(declare-fun res!97264 () Bool)

(assert (=> d!37608 (=> (not res!97264) (not e!77061))))

(assert (=> d!37608 (= res!97264 (= (size!2397 (buf!2810 (_2!5159 lt!179644))) (size!2397 (buf!2810 (_2!5159 lt!180314)))))))

(declare-fun e!77065 () tuple2!9788)

(assert (=> d!37608 (= lt!180314 e!77065)))

(assert (=> d!37608 (= c!7083 (bvslt (bvadd #b00000000000000000000000000000001 i!615) nBits!396))))

(assert (=> d!37608 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)) (bvsle (bvadd #b00000000000000000000000000000001 i!615) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!37608 (= (appendNLeastSignificantBitsLoop!0 (_2!5159 lt!179644) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) lt!180314)))

(declare-fun b!117584 () Bool)

(declare-fun res!97262 () Bool)

(assert (=> b!117584 (= res!97262 call!1523)))

(assert (=> b!117584 (=> (not res!97262) (not e!77059))))

(declare-fun b!117585 () Bool)

(assert (=> b!117585 (= e!77064 (= (bitIndex!0 (size!2397 (buf!2810 (_1!5162 lt!180315))) (currentByte!5453 (_1!5162 lt!180315)) (currentBit!5448 (_1!5162 lt!180315))) (bitIndex!0 (size!2397 (buf!2810 (_2!5159 lt!180330))) (currentByte!5453 (_2!5159 lt!180330)) (currentBit!5448 (_2!5159 lt!180330)))))))

(declare-fun b!117586 () Bool)

(declare-fun res!97266 () Bool)

(assert (=> b!117586 (=> (not res!97266) (not e!77061))))

(declare-fun lt!180317 () (_ BitVec 64))

(declare-fun lt!180349 () (_ BitVec 64))

(assert (=> b!117586 (= res!97266 (= (bitIndex!0 (size!2397 (buf!2810 (_2!5159 lt!180314))) (currentByte!5453 (_2!5159 lt!180314)) (currentBit!5448 (_2!5159 lt!180314))) (bvadd lt!180317 lt!180349)))))

(assert (=> b!117586 (or (not (= (bvand lt!180317 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!180349 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!180317 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!180317 lt!180349) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!117586 (= lt!180349 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!117586 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!117586 (= lt!180317 (bitIndex!0 (size!2397 (buf!2810 (_2!5159 lt!179644))) (currentByte!5453 (_2!5159 lt!179644)) (currentBit!5448 (_2!5159 lt!179644))))))

(declare-fun b!117587 () Bool)

(assert (=> b!117587 (= e!77060 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!117588 () Bool)

(declare-fun res!97260 () Bool)

(assert (=> b!117588 (= res!97260 (= (bitIndex!0 (size!2397 (buf!2810 (_2!5159 lt!180330))) (currentByte!5453 (_2!5159 lt!180330)) (currentBit!5448 (_2!5159 lt!180330))) (bvadd (bitIndex!0 (size!2397 (buf!2810 (_2!5159 lt!179644))) (currentByte!5453 (_2!5159 lt!179644)) (currentBit!5448 (_2!5159 lt!179644))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!117588 (=> (not res!97260) (not e!77059))))

(declare-fun b!117589 () Bool)

(declare-fun lt!180338 () tuple2!9788)

(declare-fun Unit!7230 () Unit!7217)

(assert (=> b!117589 (= e!77065 (tuple2!9789 Unit!7230 (_2!5159 lt!180338)))))

(assert (=> b!117589 (= lt!180347 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!117589 (= lt!180330 (appendBit!0 (_2!5159 lt!179644) lt!180347))))

(declare-fun res!97259 () Bool)

(assert (=> b!117589 (= res!97259 (= (size!2397 (buf!2810 (_2!5159 lt!179644))) (size!2397 (buf!2810 (_2!5159 lt!180330)))))))

(assert (=> b!117589 (=> (not res!97259) (not e!77059))))

(assert (=> b!117589 e!77059))

(declare-fun lt!180333 () tuple2!9788)

(assert (=> b!117589 (= lt!180333 lt!180330)))

(assert (=> b!117589 (= lt!180338 (appendNLeastSignificantBitsLoop!0 (_2!5159 lt!180333) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))))

(declare-fun lt!180354 () Unit!7217)

(assert (=> b!117589 (= lt!180354 (lemmaIsPrefixTransitive!0 (_2!5159 lt!179644) (_2!5159 lt!180333) (_2!5159 lt!180338)))))

(assert (=> b!117589 (isPrefixOf!0 (_2!5159 lt!179644) (_2!5159 lt!180338))))

(declare-fun lt!180320 () Unit!7217)

(assert (=> b!117589 (= lt!180320 lt!180354)))

(assert (=> b!117589 (invariant!0 (currentBit!5448 (_2!5159 lt!179644)) (currentByte!5453 (_2!5159 lt!179644)) (size!2397 (buf!2810 (_2!5159 lt!180333))))))

(declare-fun lt!180331 () BitStream!4268)

(assert (=> b!117589 (= lt!180331 (BitStream!4269 (buf!2810 (_2!5159 lt!180333)) (currentByte!5453 (_2!5159 lt!179644)) (currentBit!5448 (_2!5159 lt!179644))))))

(assert (=> b!117589 (invariant!0 (currentBit!5448 lt!180331) (currentByte!5453 lt!180331) (size!2397 (buf!2810 (_2!5159 lt!180338))))))

(declare-fun lt!180337 () BitStream!4268)

(assert (=> b!117589 (= lt!180337 (BitStream!4269 (buf!2810 (_2!5159 lt!180338)) (currentByte!5453 lt!180331) (currentBit!5448 lt!180331)))))

(assert (=> b!117589 (= lt!180329 (readBitPure!0 lt!180331))))

(assert (=> b!117589 (= lt!180342 (readBitPure!0 lt!180337))))

(declare-fun lt!180345 () Unit!7217)

(assert (=> b!117589 (= lt!180345 (readBitPrefixLemma!0 lt!180331 (_2!5159 lt!180338)))))

(declare-fun res!97263 () Bool)

(assert (=> b!117589 (= res!97263 (= (bitIndex!0 (size!2397 (buf!2810 (_1!5162 lt!180329))) (currentByte!5453 (_1!5162 lt!180329)) (currentBit!5448 (_1!5162 lt!180329))) (bitIndex!0 (size!2397 (buf!2810 (_1!5162 lt!180342))) (currentByte!5453 (_1!5162 lt!180342)) (currentBit!5448 (_1!5162 lt!180342)))))))

(assert (=> b!117589 (=> (not res!97263) (not e!77063))))

(assert (=> b!117589 e!77063))

(declare-fun lt!180350 () Unit!7217)

(assert (=> b!117589 (= lt!180350 lt!180345)))

(declare-fun lt!180339 () tuple2!9792)

(assert (=> b!117589 (= lt!180339 (reader!0 (_2!5159 lt!179644) (_2!5159 lt!180338)))))

(declare-fun lt!180318 () tuple2!9792)

(assert (=> b!117589 (= lt!180318 (reader!0 (_2!5159 lt!180333) (_2!5159 lt!180338)))))

(declare-fun lt!180311 () tuple2!9794)

(assert (=> b!117589 (= lt!180311 (readBitPure!0 (_1!5161 lt!180339)))))

(assert (=> b!117589 (= (_2!5162 lt!180311) lt!180347)))

(declare-fun lt!180325 () Unit!7217)

(declare-fun Unit!7232 () Unit!7217)

(assert (=> b!117589 (= lt!180325 Unit!7232)))

(declare-fun lt!180322 () (_ BitVec 64))

(assert (=> b!117589 (= lt!180322 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(declare-fun lt!180343 () (_ BitVec 64))

(assert (=> b!117589 (= lt!180343 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(declare-fun lt!180344 () Unit!7217)

(assert (=> b!117589 (= lt!180344 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5159 lt!179644) (buf!2810 (_2!5159 lt!180338)) lt!180343))))

(assert (=> b!117589 (validate_offset_bits!1 ((_ sign_extend 32) (size!2397 (buf!2810 (_2!5159 lt!180338)))) ((_ sign_extend 32) (currentByte!5453 (_2!5159 lt!179644))) ((_ sign_extend 32) (currentBit!5448 (_2!5159 lt!179644))) lt!180343)))

(declare-fun lt!180313 () Unit!7217)

(assert (=> b!117589 (= lt!180313 lt!180344)))

(declare-fun lt!180335 () tuple2!9790)

(assert (=> b!117589 (= lt!180335 (readNLeastSignificantBitsLoopPure!0 (_1!5161 lt!180339) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!180322))))

(declare-fun lt!180351 () (_ BitVec 64))

(assert (=> b!117589 (= lt!180351 ((_ sign_extend 32) (bvsub (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b00000000000000000000000000000001)))))

(declare-fun lt!180353 () Unit!7217)

(assert (=> b!117589 (= lt!180353 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5159 lt!180333) (buf!2810 (_2!5159 lt!180338)) lt!180351))))

(assert (=> b!117589 (validate_offset_bits!1 ((_ sign_extend 32) (size!2397 (buf!2810 (_2!5159 lt!180338)))) ((_ sign_extend 32) (currentByte!5453 (_2!5159 lt!180333))) ((_ sign_extend 32) (currentBit!5448 (_2!5159 lt!180333))) lt!180351)))

(declare-fun lt!180321 () Unit!7217)

(assert (=> b!117589 (= lt!180321 lt!180353)))

(declare-fun lt!180332 () tuple2!9790)

(assert (=> b!117589 (= lt!180332 (readNLeastSignificantBitsLoopPure!0 (_1!5161 lt!180318) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!180322 (ite (_2!5162 lt!180311) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!180341 () tuple2!9790)

(assert (=> b!117589 (= lt!180341 (readNLeastSignificantBitsLoopPure!0 (_1!5161 lt!180339) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!180322))))

(declare-fun c!7082 () Bool)

(assert (=> b!117589 (= c!7082 (_2!5162 (readBitPure!0 (_1!5161 lt!180339))))))

(declare-fun lt!180319 () tuple2!9790)

(assert (=> b!117589 (= lt!180319 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!5161 lt!180339) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!180322 e!77060)))))

(declare-fun lt!180352 () Unit!7217)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!4268 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!7217)

(assert (=> b!117589 (= lt!180352 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!5161 lt!180339) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!180322))))

(assert (=> b!117589 (and (= (_2!5160 lt!180341) (_2!5160 lt!180319)) (= (_1!5160 lt!180341) (_1!5160 lt!180319)))))

(declare-fun lt!180326 () Unit!7217)

(assert (=> b!117589 (= lt!180326 lt!180352)))

(assert (=> b!117589 (= (_1!5161 lt!180339) (withMovedBitIndex!0 (_2!5161 lt!180339) (bvsub (bitIndex!0 (size!2397 (buf!2810 (_2!5159 lt!179644))) (currentByte!5453 (_2!5159 lt!179644)) (currentBit!5448 (_2!5159 lt!179644))) (bitIndex!0 (size!2397 (buf!2810 (_2!5159 lt!180338))) (currentByte!5453 (_2!5159 lt!180338)) (currentBit!5448 (_2!5159 lt!180338))))))))

(declare-fun lt!180312 () Unit!7217)

(declare-fun Unit!7234 () Unit!7217)

(assert (=> b!117589 (= lt!180312 Unit!7234)))

(assert (=> b!117589 (= (_1!5161 lt!180318) (withMovedBitIndex!0 (_2!5161 lt!180318) (bvsub (bitIndex!0 (size!2397 (buf!2810 (_2!5159 lt!180333))) (currentByte!5453 (_2!5159 lt!180333)) (currentBit!5448 (_2!5159 lt!180333))) (bitIndex!0 (size!2397 (buf!2810 (_2!5159 lt!180338))) (currentByte!5453 (_2!5159 lt!180338)) (currentBit!5448 (_2!5159 lt!180338))))))))

(declare-fun lt!180328 () Unit!7217)

(declare-fun Unit!7235 () Unit!7217)

(assert (=> b!117589 (= lt!180328 Unit!7235)))

(assert (=> b!117589 (= (bitIndex!0 (size!2397 (buf!2810 (_2!5159 lt!179644))) (currentByte!5453 (_2!5159 lt!179644)) (currentBit!5448 (_2!5159 lt!179644))) (bvsub (bitIndex!0 (size!2397 (buf!2810 (_2!5159 lt!180333))) (currentByte!5453 (_2!5159 lt!180333)) (currentBit!5448 (_2!5159 lt!180333))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!180316 () Unit!7217)

(declare-fun Unit!7238 () Unit!7217)

(assert (=> b!117589 (= lt!180316 Unit!7238)))

(assert (=> b!117589 (= (_2!5160 lt!180335) (_2!5160 lt!180332))))

(declare-fun lt!180334 () Unit!7217)

(declare-fun Unit!7240 () Unit!7217)

(assert (=> b!117589 (= lt!180334 Unit!7240)))

(assert (=> b!117589 (= (_1!5160 lt!180335) (_2!5161 lt!180339))))

(declare-fun b!117590 () Bool)

(assert (=> b!117590 (= e!77062 (validate_offset_bits!1 ((_ sign_extend 32) (size!2397 (buf!2810 (_2!5159 lt!179644)))) ((_ sign_extend 32) (currentByte!5453 (_2!5159 lt!179644))) ((_ sign_extend 32) (currentBit!5448 (_2!5159 lt!179644))) lt!180340))))

(declare-fun b!117591 () Bool)

(declare-fun lt!180327 () Unit!7217)

(assert (=> b!117591 (= e!77065 (tuple2!9789 lt!180327 (_2!5159 lt!179644)))))

(assert (=> b!117591 (= lt!180355 (_2!5159 lt!179644))))

(assert (=> b!117591 (= lt!180327 (lemmaIsPrefixRefl!0 lt!180355))))

(assert (=> b!117591 call!1523))

(assert (= (and d!37608 c!7083) b!117589))

(assert (= (and d!37608 (not c!7083)) b!117591))

(assert (= (and b!117589 res!97259) b!117588))

(assert (= (and b!117588 res!97260) b!117584))

(assert (= (and b!117584 res!97262) b!117581))

(assert (= (and b!117581 res!97265) b!117585))

(assert (= (and b!117589 res!97263) b!117580))

(assert (= (and b!117589 c!7082) b!117582))

(assert (= (and b!117589 (not c!7082)) b!117587))

(assert (= (or b!117584 b!117591) bm!1520))

(assert (= (and d!37608 res!97264) b!117586))

(assert (= (and b!117586 res!97266) b!117579))

(assert (= (and b!117579 res!97267) b!117583))

(assert (= (and b!117583 res!97261) b!117590))

(declare-fun m!176343 () Bool)

(assert (=> b!117591 m!176343))

(declare-fun m!176345 () Bool)

(assert (=> b!117590 m!176345))

(declare-fun m!176347 () Bool)

(assert (=> b!117581 m!176347))

(assert (=> b!117581 m!176347))

(declare-fun m!176349 () Bool)

(assert (=> b!117581 m!176349))

(declare-fun m!176351 () Bool)

(assert (=> b!117586 m!176351))

(assert (=> b!117586 m!175933))

(declare-fun m!176353 () Bool)

(assert (=> b!117583 m!176353))

(declare-fun m!176355 () Bool)

(assert (=> b!117583 m!176355))

(declare-fun m!176357 () Bool)

(assert (=> b!117583 m!176357))

(declare-fun m!176359 () Bool)

(assert (=> b!117583 m!176359))

(declare-fun m!176361 () Bool)

(assert (=> b!117583 m!176361))

(declare-fun m!176363 () Bool)

(assert (=> b!117579 m!176363))

(declare-fun m!176365 () Bool)

(assert (=> bm!1520 m!176365))

(declare-fun m!176367 () Bool)

(assert (=> b!117585 m!176367))

(declare-fun m!176369 () Bool)

(assert (=> b!117585 m!176369))

(declare-fun m!176371 () Bool)

(assert (=> b!117589 m!176371))

(declare-fun m!176373 () Bool)

(assert (=> b!117589 m!176373))

(declare-fun m!176375 () Bool)

(assert (=> b!117589 m!176375))

(declare-fun m!176377 () Bool)

(assert (=> b!117589 m!176377))

(declare-fun m!176379 () Bool)

(assert (=> b!117589 m!176379))

(declare-fun m!176381 () Bool)

(assert (=> b!117589 m!176381))

(declare-fun m!176383 () Bool)

(assert (=> b!117589 m!176383))

(declare-fun m!176385 () Bool)

(assert (=> b!117589 m!176385))

(declare-fun m!176387 () Bool)

(assert (=> b!117589 m!176387))

(declare-fun m!176389 () Bool)

(assert (=> b!117589 m!176389))

(declare-fun m!176391 () Bool)

(assert (=> b!117589 m!176391))

(declare-fun m!176393 () Bool)

(assert (=> b!117589 m!176393))

(declare-fun m!176395 () Bool)

(assert (=> b!117589 m!176395))

(assert (=> b!117589 m!175933))

(declare-fun m!176397 () Bool)

(assert (=> b!117589 m!176397))

(declare-fun m!176399 () Bool)

(assert (=> b!117589 m!176399))

(declare-fun m!176401 () Bool)

(assert (=> b!117589 m!176401))

(declare-fun m!176403 () Bool)

(assert (=> b!117589 m!176403))

(declare-fun m!176405 () Bool)

(assert (=> b!117589 m!176405))

(declare-fun m!176407 () Bool)

(assert (=> b!117589 m!176407))

(declare-fun m!176409 () Bool)

(assert (=> b!117589 m!176409))

(declare-fun m!176411 () Bool)

(assert (=> b!117589 m!176411))

(declare-fun m!176413 () Bool)

(assert (=> b!117589 m!176413))

(declare-fun m!176415 () Bool)

(assert (=> b!117589 m!176415))

(declare-fun m!176417 () Bool)

(assert (=> b!117589 m!176417))

(assert (=> b!117589 m!176415))

(assert (=> b!117589 m!176359))

(declare-fun m!176419 () Bool)

(assert (=> b!117589 m!176419))

(declare-fun m!176421 () Bool)

(assert (=> b!117589 m!176421))

(declare-fun m!176423 () Bool)

(assert (=> b!117589 m!176423))

(assert (=> b!117588 m!176369))

(assert (=> b!117588 m!175933))

(assert (=> b!117351 d!37608))

(declare-fun d!37658 () Bool)

(declare-fun e!77074 () Bool)

(assert (=> d!37658 e!77074))

(declare-fun res!97278 () Bool)

(assert (=> d!37658 (=> (not res!97278) (not e!77074))))

(declare-fun lt!180392 () (_ BitVec 64))

(declare-fun lt!180394 () (_ BitVec 64))

(declare-fun lt!180395 () (_ BitVec 64))

(assert (=> d!37658 (= res!97278 (= lt!180394 (bvsub lt!180395 lt!180392)))))

(assert (=> d!37658 (or (= (bvand lt!180395 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!180392 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!180395 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!180395 lt!180392) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!37658 (= lt!180392 (remainingBits!0 ((_ sign_extend 32) (size!2397 (buf!2810 (_1!5162 lt!179645)))) ((_ sign_extend 32) (currentByte!5453 (_1!5162 lt!179645))) ((_ sign_extend 32) (currentBit!5448 (_1!5162 lt!179645)))))))

(declare-fun lt!180397 () (_ BitVec 64))

(declare-fun lt!180393 () (_ BitVec 64))

(assert (=> d!37658 (= lt!180395 (bvmul lt!180397 lt!180393))))

(assert (=> d!37658 (or (= lt!180397 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!180393 (bvsdiv (bvmul lt!180397 lt!180393) lt!180397)))))

(assert (=> d!37658 (= lt!180393 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!37658 (= lt!180397 ((_ sign_extend 32) (size!2397 (buf!2810 (_1!5162 lt!179645)))))))

(assert (=> d!37658 (= lt!180394 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5453 (_1!5162 lt!179645))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5448 (_1!5162 lt!179645)))))))

(assert (=> d!37658 (invariant!0 (currentBit!5448 (_1!5162 lt!179645)) (currentByte!5453 (_1!5162 lt!179645)) (size!2397 (buf!2810 (_1!5162 lt!179645))))))

(assert (=> d!37658 (= (bitIndex!0 (size!2397 (buf!2810 (_1!5162 lt!179645))) (currentByte!5453 (_1!5162 lt!179645)) (currentBit!5448 (_1!5162 lt!179645))) lt!180394)))

(declare-fun b!117606 () Bool)

(declare-fun res!97279 () Bool)

(assert (=> b!117606 (=> (not res!97279) (not e!77074))))

(assert (=> b!117606 (= res!97279 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!180394))))

(declare-fun b!117607 () Bool)

(declare-fun lt!180396 () (_ BitVec 64))

(assert (=> b!117607 (= e!77074 (bvsle lt!180394 (bvmul lt!180396 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!117607 (or (= lt!180396 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!180396 #b0000000000000000000000000000000000000000000000000000000000001000) lt!180396)))))

(assert (=> b!117607 (= lt!180396 ((_ sign_extend 32) (size!2397 (buf!2810 (_1!5162 lt!179645)))))))

(assert (= (and d!37658 res!97278) b!117606))

(assert (= (and b!117606 res!97279) b!117607))

(declare-fun m!176425 () Bool)

(assert (=> d!37658 m!176425))

(declare-fun m!176427 () Bool)

(assert (=> d!37658 m!176427))

(assert (=> b!117351 d!37658))

(declare-fun b!117631 () Bool)

(declare-fun e!77086 () Bool)

(declare-fun e!77085 () Bool)

(assert (=> b!117631 (= e!77086 e!77085)))

(declare-fun res!97296 () Bool)

(assert (=> b!117631 (=> (not res!97296) (not e!77085))))

(declare-fun lt!180460 () tuple2!9794)

(declare-fun lt!180463 () tuple2!9788)

(assert (=> b!117631 (= res!97296 (and (= (_2!5162 lt!180460) lt!179650) (= (_1!5162 lt!180460) (_2!5159 lt!180463))))))

(assert (=> b!117631 (= lt!180460 (readBitPure!0 (readerFrom!0 (_2!5159 lt!180463) (currentBit!5448 thiss!1305) (currentByte!5453 thiss!1305))))))

(declare-fun d!37660 () Bool)

(assert (=> d!37660 e!77086))

(declare-fun res!97297 () Bool)

(assert (=> d!37660 (=> (not res!97297) (not e!77086))))

(assert (=> d!37660 (= res!97297 (= (size!2397 (buf!2810 thiss!1305)) (size!2397 (buf!2810 (_2!5159 lt!180463)))))))

(declare-fun choose!16 (BitStream!4268 Bool) tuple2!9788)

(assert (=> d!37660 (= lt!180463 (choose!16 thiss!1305 lt!179650))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!37660 (validate_offset_bit!0 ((_ sign_extend 32) (size!2397 (buf!2810 thiss!1305))) ((_ sign_extend 32) (currentByte!5453 thiss!1305)) ((_ sign_extend 32) (currentBit!5448 thiss!1305)))))

(assert (=> d!37660 (= (appendBit!0 thiss!1305 lt!179650) lt!180463)))

(declare-fun b!117629 () Bool)

(declare-fun res!97298 () Bool)

(assert (=> b!117629 (=> (not res!97298) (not e!77086))))

(declare-fun lt!180461 () (_ BitVec 64))

(declare-fun lt!180462 () (_ BitVec 64))

(assert (=> b!117629 (= res!97298 (= (bitIndex!0 (size!2397 (buf!2810 (_2!5159 lt!180463))) (currentByte!5453 (_2!5159 lt!180463)) (currentBit!5448 (_2!5159 lt!180463))) (bvadd lt!180461 lt!180462)))))

(assert (=> b!117629 (or (not (= (bvand lt!180461 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!180462 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!180461 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!180461 lt!180462) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!117629 (= lt!180462 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!117629 (= lt!180461 (bitIndex!0 (size!2397 (buf!2810 thiss!1305)) (currentByte!5453 thiss!1305) (currentBit!5448 thiss!1305)))))

(declare-fun b!117630 () Bool)

(declare-fun res!97299 () Bool)

(assert (=> b!117630 (=> (not res!97299) (not e!77086))))

(assert (=> b!117630 (= res!97299 (isPrefixOf!0 thiss!1305 (_2!5159 lt!180463)))))

(declare-fun b!117632 () Bool)

(assert (=> b!117632 (= e!77085 (= (bitIndex!0 (size!2397 (buf!2810 (_1!5162 lt!180460))) (currentByte!5453 (_1!5162 lt!180460)) (currentBit!5448 (_1!5162 lt!180460))) (bitIndex!0 (size!2397 (buf!2810 (_2!5159 lt!180463))) (currentByte!5453 (_2!5159 lt!180463)) (currentBit!5448 (_2!5159 lt!180463)))))))

(assert (= (and d!37660 res!97297) b!117629))

(assert (= (and b!117629 res!97298) b!117630))

(assert (= (and b!117630 res!97299) b!117631))

(assert (= (and b!117631 res!97296) b!117632))

(declare-fun m!176429 () Bool)

(assert (=> b!117630 m!176429))

(declare-fun m!176431 () Bool)

(assert (=> b!117631 m!176431))

(assert (=> b!117631 m!176431))

(declare-fun m!176433 () Bool)

(assert (=> b!117631 m!176433))

(declare-fun m!176435 () Bool)

(assert (=> b!117632 m!176435))

(declare-fun m!176437 () Bool)

(assert (=> b!117632 m!176437))

(declare-fun m!176439 () Bool)

(assert (=> d!37660 m!176439))

(declare-fun m!176441 () Bool)

(assert (=> d!37660 m!176441))

(assert (=> b!117629 m!176437))

(assert (=> b!117629 m!175935))

(assert (=> b!117351 d!37660))

(declare-fun d!37662 () Bool)

(declare-fun lt!180509 () tuple2!9802)

(assert (=> d!37662 (= lt!180509 (readBit!0 (_1!5161 lt!179641)))))

(assert (=> d!37662 (= (readBitPure!0 (_1!5161 lt!179641)) (tuple2!9795 (_2!5166 lt!180509) (_1!5166 lt!180509)))))

(declare-fun bs!9108 () Bool)

(assert (= bs!9108 d!37662))

(declare-fun m!176443 () Bool)

(assert (=> bs!9108 m!176443))

(assert (=> b!117351 d!37662))

(declare-datatypes ((tuple2!9806 0))(
  ( (tuple2!9807 (_1!5168 (_ BitVec 64)) (_2!5168 BitStream!4268)) )
))
(declare-fun lt!180512 () tuple2!9806)

(declare-fun d!37664 () Bool)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!4268 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!9806)

(assert (=> d!37664 (= lt!180512 (readNLeastSignificantBitsLoop!0 (_1!5161 lt!179641) nBits!396 i!615 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615))))))))

(assert (=> d!37664 (= (readNLeastSignificantBitsLoopPure!0 (_1!5161 lt!179641) nBits!396 i!615 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615))))) (tuple2!9791 (_2!5168 lt!180512) (_1!5168 lt!180512)))))

(declare-fun bs!9109 () Bool)

(assert (= bs!9109 d!37664))

(declare-fun m!176477 () Bool)

(assert (=> bs!9109 m!176477))

(assert (=> b!117351 d!37664))

(declare-fun b!117647 () Bool)

(declare-fun e!77095 () Unit!7217)

(declare-fun Unit!7242 () Unit!7217)

(assert (=> b!117647 (= e!77095 Unit!7242)))

(declare-fun b!117648 () Bool)

(declare-fun lt!180525 () Unit!7217)

(assert (=> b!117648 (= e!77095 lt!180525)))

(declare-fun lt!180526 () (_ BitVec 64))

(assert (=> b!117648 (= lt!180526 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!180531 () (_ BitVec 64))

(assert (=> b!117648 (= lt!180531 (bitIndex!0 (size!2397 (buf!2810 (_2!5159 lt!179644))) (currentByte!5453 (_2!5159 lt!179644)) (currentBit!5448 (_2!5159 lt!179644))))))

(assert (=> b!117648 (= lt!180525 (arrayBitRangesEqSymmetric!0 (buf!2810 (_2!5159 lt!179644)) (buf!2810 (_2!5159 lt!179655)) lt!180526 lt!180531))))

(assert (=> b!117648 (arrayBitRangesEq!0 (buf!2810 (_2!5159 lt!179655)) (buf!2810 (_2!5159 lt!179644)) lt!180526 lt!180531)))

(declare-fun b!117649 () Bool)

(declare-fun res!97310 () Bool)

(declare-fun e!77094 () Bool)

(assert (=> b!117649 (=> (not res!97310) (not e!77094))))

(declare-fun lt!180517 () tuple2!9792)

(assert (=> b!117649 (= res!97310 (isPrefixOf!0 (_1!5161 lt!180517) (_2!5159 lt!179644)))))

(declare-fun b!117650 () Bool)

(declare-fun res!97311 () Bool)

(assert (=> b!117650 (=> (not res!97311) (not e!77094))))

(assert (=> b!117650 (= res!97311 (isPrefixOf!0 (_2!5161 lt!180517) (_2!5159 lt!179655)))))

(declare-fun lt!180513 () (_ BitVec 64))

(declare-fun b!117646 () Bool)

(declare-fun lt!180519 () (_ BitVec 64))

(assert (=> b!117646 (= e!77094 (= (_1!5161 lt!180517) (withMovedBitIndex!0 (_2!5161 lt!180517) (bvsub lt!180513 lt!180519))))))

(assert (=> b!117646 (or (= (bvand lt!180513 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!180519 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!180513 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!180513 lt!180519) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!117646 (= lt!180519 (bitIndex!0 (size!2397 (buf!2810 (_2!5159 lt!179655))) (currentByte!5453 (_2!5159 lt!179655)) (currentBit!5448 (_2!5159 lt!179655))))))

(assert (=> b!117646 (= lt!180513 (bitIndex!0 (size!2397 (buf!2810 (_2!5159 lt!179644))) (currentByte!5453 (_2!5159 lt!179644)) (currentBit!5448 (_2!5159 lt!179644))))))

(declare-fun d!37666 () Bool)

(assert (=> d!37666 e!77094))

(declare-fun res!97309 () Bool)

(assert (=> d!37666 (=> (not res!97309) (not e!77094))))

(assert (=> d!37666 (= res!97309 (isPrefixOf!0 (_1!5161 lt!180517) (_2!5161 lt!180517)))))

(declare-fun lt!180514 () BitStream!4268)

(assert (=> d!37666 (= lt!180517 (tuple2!9793 lt!180514 (_2!5159 lt!179655)))))

(declare-fun lt!180523 () Unit!7217)

(declare-fun lt!180527 () Unit!7217)

(assert (=> d!37666 (= lt!180523 lt!180527)))

(assert (=> d!37666 (isPrefixOf!0 lt!180514 (_2!5159 lt!179655))))

(assert (=> d!37666 (= lt!180527 (lemmaIsPrefixTransitive!0 lt!180514 (_2!5159 lt!179655) (_2!5159 lt!179655)))))

(declare-fun lt!180522 () Unit!7217)

(declare-fun lt!180515 () Unit!7217)

(assert (=> d!37666 (= lt!180522 lt!180515)))

(assert (=> d!37666 (isPrefixOf!0 lt!180514 (_2!5159 lt!179655))))

(assert (=> d!37666 (= lt!180515 (lemmaIsPrefixTransitive!0 lt!180514 (_2!5159 lt!179644) (_2!5159 lt!179655)))))

(declare-fun lt!180516 () Unit!7217)

(assert (=> d!37666 (= lt!180516 e!77095)))

(declare-fun c!7090 () Bool)

(assert (=> d!37666 (= c!7090 (not (= (size!2397 (buf!2810 (_2!5159 lt!179644))) #b00000000000000000000000000000000)))))

(declare-fun lt!180521 () Unit!7217)

(declare-fun lt!180530 () Unit!7217)

(assert (=> d!37666 (= lt!180521 lt!180530)))

(assert (=> d!37666 (isPrefixOf!0 (_2!5159 lt!179655) (_2!5159 lt!179655))))

(assert (=> d!37666 (= lt!180530 (lemmaIsPrefixRefl!0 (_2!5159 lt!179655)))))

(declare-fun lt!180524 () Unit!7217)

(declare-fun lt!180520 () Unit!7217)

(assert (=> d!37666 (= lt!180524 lt!180520)))

(assert (=> d!37666 (= lt!180520 (lemmaIsPrefixRefl!0 (_2!5159 lt!179655)))))

(declare-fun lt!180532 () Unit!7217)

(declare-fun lt!180518 () Unit!7217)

(assert (=> d!37666 (= lt!180532 lt!180518)))

(assert (=> d!37666 (isPrefixOf!0 lt!180514 lt!180514)))

(assert (=> d!37666 (= lt!180518 (lemmaIsPrefixRefl!0 lt!180514))))

(declare-fun lt!180528 () Unit!7217)

(declare-fun lt!180529 () Unit!7217)

(assert (=> d!37666 (= lt!180528 lt!180529)))

(assert (=> d!37666 (isPrefixOf!0 (_2!5159 lt!179644) (_2!5159 lt!179644))))

(assert (=> d!37666 (= lt!180529 (lemmaIsPrefixRefl!0 (_2!5159 lt!179644)))))

(assert (=> d!37666 (= lt!180514 (BitStream!4269 (buf!2810 (_2!5159 lt!179655)) (currentByte!5453 (_2!5159 lt!179644)) (currentBit!5448 (_2!5159 lt!179644))))))

(assert (=> d!37666 (isPrefixOf!0 (_2!5159 lt!179644) (_2!5159 lt!179655))))

(assert (=> d!37666 (= (reader!0 (_2!5159 lt!179644) (_2!5159 lt!179655)) lt!180517)))

(assert (= (and d!37666 c!7090) b!117648))

(assert (= (and d!37666 (not c!7090)) b!117647))

(assert (= (and d!37666 res!97309) b!117649))

(assert (= (and b!117649 res!97310) b!117650))

(assert (= (and b!117650 res!97311) b!117646))

(declare-fun m!176529 () Bool)

(assert (=> b!117646 m!176529))

(assert (=> b!117646 m!176125))

(assert (=> b!117646 m!175933))

(declare-fun m!176531 () Bool)

(assert (=> d!37666 m!176531))

(assert (=> d!37666 m!176129))

(declare-fun m!176533 () Bool)

(assert (=> d!37666 m!176533))

(declare-fun m!176535 () Bool)

(assert (=> d!37666 m!176535))

(declare-fun m!176537 () Bool)

(assert (=> d!37666 m!176537))

(declare-fun m!176539 () Bool)

(assert (=> d!37666 m!176539))

(declare-fun m!176541 () Bool)

(assert (=> d!37666 m!176541))

(assert (=> d!37666 m!176145))

(declare-fun m!176543 () Bool)

(assert (=> d!37666 m!176543))

(declare-fun m!176545 () Bool)

(assert (=> d!37666 m!176545))

(declare-fun m!176547 () Bool)

(assert (=> d!37666 m!176547))

(declare-fun m!176549 () Bool)

(assert (=> b!117650 m!176549))

(declare-fun m!176551 () Bool)

(assert (=> b!117649 m!176551))

(assert (=> b!117648 m!175933))

(declare-fun m!176553 () Bool)

(assert (=> b!117648 m!176553))

(declare-fun m!176555 () Bool)

(assert (=> b!117648 m!176555))

(assert (=> b!117351 d!37666))

(declare-fun d!37672 () Bool)

(declare-fun res!97321 () Bool)

(declare-fun e!77103 () Bool)

(assert (=> d!37672 (=> (not res!97321) (not e!77103))))

(assert (=> d!37672 (= res!97321 (= (size!2397 (buf!2810 thiss!1305)) (size!2397 (buf!2810 (_2!5159 lt!179655)))))))

(assert (=> d!37672 (= (isPrefixOf!0 thiss!1305 (_2!5159 lt!179655)) e!77103)))

(declare-fun b!117660 () Bool)

(declare-fun res!97322 () Bool)

(assert (=> b!117660 (=> (not res!97322) (not e!77103))))

(assert (=> b!117660 (= res!97322 (bvsle (bitIndex!0 (size!2397 (buf!2810 thiss!1305)) (currentByte!5453 thiss!1305) (currentBit!5448 thiss!1305)) (bitIndex!0 (size!2397 (buf!2810 (_2!5159 lt!179655))) (currentByte!5453 (_2!5159 lt!179655)) (currentBit!5448 (_2!5159 lt!179655)))))))

(declare-fun b!117661 () Bool)

(declare-fun e!77102 () Bool)

(assert (=> b!117661 (= e!77103 e!77102)))

(declare-fun res!97323 () Bool)

(assert (=> b!117661 (=> res!97323 e!77102)))

(assert (=> b!117661 (= res!97323 (= (size!2397 (buf!2810 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!117662 () Bool)

(assert (=> b!117662 (= e!77102 (arrayBitRangesEq!0 (buf!2810 thiss!1305) (buf!2810 (_2!5159 lt!179655)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2397 (buf!2810 thiss!1305)) (currentByte!5453 thiss!1305) (currentBit!5448 thiss!1305))))))

(assert (= (and d!37672 res!97321) b!117660))

(assert (= (and b!117660 res!97322) b!117661))

(assert (= (and b!117661 (not res!97323)) b!117662))

(assert (=> b!117660 m!175935))

(assert (=> b!117660 m!176125))

(assert (=> b!117662 m!175935))

(assert (=> b!117662 m!175935))

(declare-fun m!176559 () Bool)

(assert (=> b!117662 m!176559))

(assert (=> b!117351 d!37672))

(declare-fun d!37680 () Bool)

(assert (=> d!37680 (isPrefixOf!0 thiss!1305 (_2!5159 lt!179655))))

(declare-fun lt!180535 () Unit!7217)

(declare-fun choose!30 (BitStream!4268 BitStream!4268 BitStream!4268) Unit!7217)

(assert (=> d!37680 (= lt!180535 (choose!30 thiss!1305 (_2!5159 lt!179644) (_2!5159 lt!179655)))))

(assert (=> d!37680 (isPrefixOf!0 thiss!1305 (_2!5159 lt!179644))))

(assert (=> d!37680 (= (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5159 lt!179644) (_2!5159 lt!179655)) lt!180535)))

(declare-fun bs!9112 () Bool)

(assert (= bs!9112 d!37680))

(assert (=> bs!9112 m!175917))

(declare-fun m!176561 () Bool)

(assert (=> bs!9112 m!176561))

(assert (=> bs!9112 m!175949))

(assert (=> b!117351 d!37680))

(declare-fun d!37682 () Bool)

(declare-fun lt!180536 () tuple2!9802)

(assert (=> d!37682 (= lt!180536 (readBit!0 (BitStream!4269 (buf!2810 (_2!5159 lt!179655)) (currentByte!5453 thiss!1305) (currentBit!5448 thiss!1305))))))

(assert (=> d!37682 (= (readBitPure!0 (BitStream!4269 (buf!2810 (_2!5159 lt!179655)) (currentByte!5453 thiss!1305) (currentBit!5448 thiss!1305))) (tuple2!9795 (_2!5166 lt!180536) (_1!5166 lt!180536)))))

(declare-fun bs!9113 () Bool)

(assert (= bs!9113 d!37682))

(declare-fun m!176563 () Bool)

(assert (=> bs!9113 m!176563))

(assert (=> b!117351 d!37682))

(declare-fun d!37684 () Bool)

(assert (=> d!37684 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2397 (buf!2810 (_2!5159 lt!179644)))) ((_ sign_extend 32) (currentByte!5453 (_2!5159 lt!179644))) ((_ sign_extend 32) (currentBit!5448 (_2!5159 lt!179644))) lt!179646) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2397 (buf!2810 (_2!5159 lt!179644)))) ((_ sign_extend 32) (currentByte!5453 (_2!5159 lt!179644))) ((_ sign_extend 32) (currentBit!5448 (_2!5159 lt!179644)))) lt!179646))))

(declare-fun bs!9114 () Bool)

(assert (= bs!9114 d!37684))

(assert (=> bs!9114 m!176043))

(assert (=> b!117347 d!37684))

(declare-fun d!37686 () Bool)

(declare-fun res!97324 () Bool)

(declare-fun e!77105 () Bool)

(assert (=> d!37686 (=> (not res!97324) (not e!77105))))

(assert (=> d!37686 (= res!97324 (= (size!2397 (buf!2810 thiss!1305)) (size!2397 (buf!2810 (_2!5159 lt!179644)))))))

(assert (=> d!37686 (= (isPrefixOf!0 thiss!1305 (_2!5159 lt!179644)) e!77105)))

(declare-fun b!117663 () Bool)

(declare-fun res!97325 () Bool)

(assert (=> b!117663 (=> (not res!97325) (not e!77105))))

(assert (=> b!117663 (= res!97325 (bvsle (bitIndex!0 (size!2397 (buf!2810 thiss!1305)) (currentByte!5453 thiss!1305) (currentBit!5448 thiss!1305)) (bitIndex!0 (size!2397 (buf!2810 (_2!5159 lt!179644))) (currentByte!5453 (_2!5159 lt!179644)) (currentBit!5448 (_2!5159 lt!179644)))))))

(declare-fun b!117664 () Bool)

(declare-fun e!77104 () Bool)

(assert (=> b!117664 (= e!77105 e!77104)))

(declare-fun res!97326 () Bool)

(assert (=> b!117664 (=> res!97326 e!77104)))

(assert (=> b!117664 (= res!97326 (= (size!2397 (buf!2810 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!117665 () Bool)

(assert (=> b!117665 (= e!77104 (arrayBitRangesEq!0 (buf!2810 thiss!1305) (buf!2810 (_2!5159 lt!179644)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2397 (buf!2810 thiss!1305)) (currentByte!5453 thiss!1305) (currentBit!5448 thiss!1305))))))

(assert (= (and d!37686 res!97324) b!117663))

(assert (= (and b!117663 res!97325) b!117664))

(assert (= (and b!117664 (not res!97326)) b!117665))

(assert (=> b!117663 m!175935))

(assert (=> b!117663 m!175933))

(assert (=> b!117665 m!175935))

(assert (=> b!117665 m!175935))

(declare-fun m!176565 () Bool)

(assert (=> b!117665 m!176565))

(assert (=> b!117358 d!37686))

(declare-fun d!37688 () Bool)

(declare-fun e!77106 () Bool)

(assert (=> d!37688 e!77106))

(declare-fun res!97327 () Bool)

(assert (=> d!37688 (=> (not res!97327) (not e!77106))))

(declare-fun lt!180539 () (_ BitVec 64))

(declare-fun lt!180537 () (_ BitVec 64))

(declare-fun lt!180540 () (_ BitVec 64))

(assert (=> d!37688 (= res!97327 (= lt!180539 (bvsub lt!180540 lt!180537)))))

(assert (=> d!37688 (or (= (bvand lt!180540 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!180537 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!180540 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!180540 lt!180537) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!37688 (= lt!180537 (remainingBits!0 ((_ sign_extend 32) (size!2397 (buf!2810 (_1!5162 lt!179651)))) ((_ sign_extend 32) (currentByte!5453 (_1!5162 lt!179651))) ((_ sign_extend 32) (currentBit!5448 (_1!5162 lt!179651)))))))

(declare-fun lt!180542 () (_ BitVec 64))

(declare-fun lt!180538 () (_ BitVec 64))

(assert (=> d!37688 (= lt!180540 (bvmul lt!180542 lt!180538))))

(assert (=> d!37688 (or (= lt!180542 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!180538 (bvsdiv (bvmul lt!180542 lt!180538) lt!180542)))))

(assert (=> d!37688 (= lt!180538 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!37688 (= lt!180542 ((_ sign_extend 32) (size!2397 (buf!2810 (_1!5162 lt!179651)))))))

(assert (=> d!37688 (= lt!180539 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5453 (_1!5162 lt!179651))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5448 (_1!5162 lt!179651)))))))

(assert (=> d!37688 (invariant!0 (currentBit!5448 (_1!5162 lt!179651)) (currentByte!5453 (_1!5162 lt!179651)) (size!2397 (buf!2810 (_1!5162 lt!179651))))))

(assert (=> d!37688 (= (bitIndex!0 (size!2397 (buf!2810 (_1!5162 lt!179651))) (currentByte!5453 (_1!5162 lt!179651)) (currentBit!5448 (_1!5162 lt!179651))) lt!180539)))

(declare-fun b!117666 () Bool)

(declare-fun res!97328 () Bool)

(assert (=> b!117666 (=> (not res!97328) (not e!77106))))

(assert (=> b!117666 (= res!97328 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!180539))))

(declare-fun b!117667 () Bool)

(declare-fun lt!180541 () (_ BitVec 64))

(assert (=> b!117667 (= e!77106 (bvsle lt!180539 (bvmul lt!180541 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!117667 (or (= lt!180541 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!180541 #b0000000000000000000000000000000000000000000000000000000000001000) lt!180541)))))

(assert (=> b!117667 (= lt!180541 ((_ sign_extend 32) (size!2397 (buf!2810 (_1!5162 lt!179651)))))))

(assert (= (and d!37688 res!97327) b!117666))

(assert (= (and b!117666 res!97328) b!117667))

(declare-fun m!176567 () Bool)

(assert (=> d!37688 m!176567))

(declare-fun m!176569 () Bool)

(assert (=> d!37688 m!176569))

(assert (=> b!117348 d!37688))

(declare-fun d!37690 () Bool)

(declare-fun lt!180543 () tuple2!9802)

(assert (=> d!37690 (= lt!180543 (readBit!0 (readerFrom!0 (_2!5159 lt!179644) (currentBit!5448 thiss!1305) (currentByte!5453 thiss!1305))))))

(assert (=> d!37690 (= (readBitPure!0 (readerFrom!0 (_2!5159 lt!179644) (currentBit!5448 thiss!1305) (currentByte!5453 thiss!1305))) (tuple2!9795 (_2!5166 lt!180543) (_1!5166 lt!180543)))))

(declare-fun bs!9115 () Bool)

(assert (= bs!9115 d!37690))

(assert (=> bs!9115 m!175945))

(declare-fun m!176571 () Bool)

(assert (=> bs!9115 m!176571))

(assert (=> b!117355 d!37690))

(declare-fun d!37692 () Bool)

(declare-fun e!77109 () Bool)

(assert (=> d!37692 e!77109))

(declare-fun res!97332 () Bool)

(assert (=> d!37692 (=> (not res!97332) (not e!77109))))

(assert (=> d!37692 (= res!97332 (invariant!0 (currentBit!5448 (_2!5159 lt!179644)) (currentByte!5453 (_2!5159 lt!179644)) (size!2397 (buf!2810 (_2!5159 lt!179644)))))))

(assert (=> d!37692 (= (readerFrom!0 (_2!5159 lt!179644) (currentBit!5448 thiss!1305) (currentByte!5453 thiss!1305)) (BitStream!4269 (buf!2810 (_2!5159 lt!179644)) (currentByte!5453 thiss!1305) (currentBit!5448 thiss!1305)))))

(declare-fun b!117670 () Bool)

(assert (=> b!117670 (= e!77109 (invariant!0 (currentBit!5448 thiss!1305) (currentByte!5453 thiss!1305) (size!2397 (buf!2810 (_2!5159 lt!179644)))))))

(assert (= (and d!37692 res!97332) b!117670))

(assert (=> d!37692 m!176045))

(assert (=> b!117670 m!175931))

(assert (=> b!117355 d!37692))

(declare-fun d!37694 () Bool)

(assert (=> d!37694 (= (invariant!0 (currentBit!5448 thiss!1305) (currentByte!5453 thiss!1305) (size!2397 (buf!2810 (_2!5159 lt!179655)))) (and (bvsge (currentBit!5448 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5448 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5453 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5453 thiss!1305) (size!2397 (buf!2810 (_2!5159 lt!179655)))) (and (= (currentBit!5448 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5453 thiss!1305) (size!2397 (buf!2810 (_2!5159 lt!179655))))))))))

(assert (=> b!117356 d!37694))

(declare-fun d!37696 () Bool)

(assert (=> d!37696 (= (invariant!0 (currentBit!5448 thiss!1305) (currentByte!5453 thiss!1305) (size!2397 (buf!2810 (_2!5159 lt!179644)))) (and (bvsge (currentBit!5448 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5448 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5453 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5453 thiss!1305) (size!2397 (buf!2810 (_2!5159 lt!179644)))) (and (= (currentBit!5448 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5453 thiss!1305) (size!2397 (buf!2810 (_2!5159 lt!179644))))))))))

(assert (=> b!117346 d!37696))

(push 1)

(assert (not b!117588))

(assert (not b!117581))

(assert (not b!117464))

(assert (not b!117465))

(assert (not d!37560))

(assert (not d!37664))

(assert (not b!117646))

(assert (not b!117662))

(assert (not b!117583))

(assert (not d!37692))

(assert (not d!37590))

(assert (not d!37666))

(assert (not d!37688))

(assert (not b!117648))

(assert (not d!37680))

(assert (not d!37578))

(assert (not b!117650))

(assert (not d!37602))

(assert (not b!117670))

(assert (not b!117630))

(assert (not b!117462))

(assert (not b!117590))

(assert (not b!117579))

(assert (not b!117589))

(assert (not b!117663))

(assert (not d!37658))

(assert (not d!37682))

(assert (not b!117660))

(assert (not d!37660))

(assert (not d!37606))

(assert (not d!37690))

(assert (not b!117466))

(assert (not b!117585))

(assert (not d!37574))

(assert (not d!37580))

(assert (not b!117649))

(assert (not b!117631))

(assert (not b!117629))

(assert (not d!37684))

(assert (not d!37604))

(assert (not b!117632))

(assert (not d!37568))

(assert (not b!117665))

(assert (not d!37662))

(assert (not b!117591))

(assert (not bm!1520))

(assert (not b!117586))

(assert (not d!37566))

(check-sat)

(pop 1)

(push 1)

(check-sat)

