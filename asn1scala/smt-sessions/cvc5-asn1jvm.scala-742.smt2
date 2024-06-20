; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20898 () Bool)

(assert start!20898)

(declare-fun b!105598 () Bool)

(declare-fun e!69150 () Bool)

(declare-fun e!69152 () Bool)

(assert (=> b!105598 (= e!69150 e!69152)))

(declare-fun res!86963 () Bool)

(assert (=> b!105598 (=> (not res!86963) (not e!69152))))

(declare-fun lt!155922 () Bool)

(declare-datatypes ((array!4884 0))(
  ( (array!4885 (arr!2820 (Array (_ BitVec 32) (_ BitVec 8))) (size!2227 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3928 0))(
  ( (BitStream!3929 (buf!2601 array!4884) (currentByte!5100 (_ BitVec 32)) (currentBit!5095 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!6476 0))(
  ( (Unit!6477) )
))
(declare-datatypes ((tuple2!8686 0))(
  ( (tuple2!8687 (_1!4600 Unit!6476) (_2!4600 BitStream!3928)) )
))
(declare-fun lt!155933 () tuple2!8686)

(declare-datatypes ((tuple2!8688 0))(
  ( (tuple2!8689 (_1!4601 BitStream!3928) (_2!4601 Bool)) )
))
(declare-fun lt!155930 () tuple2!8688)

(assert (=> b!105598 (= res!86963 (and (= (_2!4601 lt!155930) lt!155922) (= (_1!4601 lt!155930) (_2!4600 lt!155933))))))

(declare-fun thiss!1305 () BitStream!3928)

(declare-fun readBitPure!0 (BitStream!3928) tuple2!8688)

(declare-fun readerFrom!0 (BitStream!3928 (_ BitVec 32) (_ BitVec 32)) BitStream!3928)

(assert (=> b!105598 (= lt!155930 (readBitPure!0 (readerFrom!0 (_2!4600 lt!155933) (currentBit!5095 thiss!1305) (currentByte!5100 thiss!1305))))))

(declare-fun b!105599 () Bool)

(declare-fun e!69149 () Bool)

(declare-fun e!69154 () Bool)

(assert (=> b!105599 (= e!69149 (not e!69154))))

(declare-fun res!86968 () Bool)

(assert (=> b!105599 (=> res!86968 e!69154)))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun lt!155915 () (_ BitVec 64))

(declare-fun i!615 () (_ BitVec 32))

(declare-datatypes ((tuple2!8690 0))(
  ( (tuple2!8691 (_1!4602 BitStream!3928) (_2!4602 BitStream!3928)) )
))
(declare-fun lt!155929 () tuple2!8690)

(declare-datatypes ((tuple2!8692 0))(
  ( (tuple2!8693 (_1!4603 BitStream!3928) (_2!4603 (_ BitVec 64))) )
))
(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!3928 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!8692)

(assert (=> b!105599 (= res!86968 (not (= (_1!4603 (readNLeastSignificantBitsLoopPure!0 (_1!4602 lt!155929) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!155915)) (_2!4602 lt!155929))))))

(declare-fun lt!155919 () tuple2!8686)

(declare-fun lt!155932 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!105599 (validate_offset_bits!1 ((_ sign_extend 32) (size!2227 (buf!2601 (_2!4600 lt!155919)))) ((_ sign_extend 32) (currentByte!5100 (_2!4600 lt!155933))) ((_ sign_extend 32) (currentBit!5095 (_2!4600 lt!155933))) lt!155932)))

(declare-fun lt!155914 () Unit!6476)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!3928 array!4884 (_ BitVec 64)) Unit!6476)

(assert (=> b!105599 (= lt!155914 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4600 lt!155933) (buf!2601 (_2!4600 lt!155919)) lt!155932))))

(assert (=> b!105599 (= lt!155932 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!155913 () (_ BitVec 64))

(declare-fun lt!155912 () (_ BitVec 64))

(declare-fun lt!155928 () tuple2!8688)

(assert (=> b!105599 (= lt!155915 (bvor lt!155912 (ite (_2!4601 lt!155928) lt!155913 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!155925 () tuple2!8692)

(declare-fun lt!155918 () tuple2!8690)

(assert (=> b!105599 (= lt!155925 (readNLeastSignificantBitsLoopPure!0 (_1!4602 lt!155918) nBits!396 i!615 lt!155912))))

(declare-fun lt!155921 () (_ BitVec 64))

(assert (=> b!105599 (validate_offset_bits!1 ((_ sign_extend 32) (size!2227 (buf!2601 (_2!4600 lt!155919)))) ((_ sign_extend 32) (currentByte!5100 thiss!1305)) ((_ sign_extend 32) (currentBit!5095 thiss!1305)) lt!155921)))

(declare-fun lt!155920 () Unit!6476)

(assert (=> b!105599 (= lt!155920 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2601 (_2!4600 lt!155919)) lt!155921))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!105599 (= lt!155912 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(assert (=> b!105599 (= (_2!4601 lt!155928) lt!155922)))

(assert (=> b!105599 (= lt!155928 (readBitPure!0 (_1!4602 lt!155918)))))

(declare-fun reader!0 (BitStream!3928 BitStream!3928) tuple2!8690)

(assert (=> b!105599 (= lt!155929 (reader!0 (_2!4600 lt!155933) (_2!4600 lt!155919)))))

(assert (=> b!105599 (= lt!155918 (reader!0 thiss!1305 (_2!4600 lt!155919)))))

(declare-fun e!69151 () Bool)

(assert (=> b!105599 e!69151))

(declare-fun res!86959 () Bool)

(assert (=> b!105599 (=> (not res!86959) (not e!69151))))

(declare-fun lt!155934 () tuple2!8688)

(declare-fun lt!155931 () tuple2!8688)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!105599 (= res!86959 (= (bitIndex!0 (size!2227 (buf!2601 (_1!4601 lt!155934))) (currentByte!5100 (_1!4601 lt!155934)) (currentBit!5095 (_1!4601 lt!155934))) (bitIndex!0 (size!2227 (buf!2601 (_1!4601 lt!155931))) (currentByte!5100 (_1!4601 lt!155931)) (currentBit!5095 (_1!4601 lt!155931)))))))

(declare-fun lt!155916 () Unit!6476)

(declare-fun lt!155924 () BitStream!3928)

(declare-fun readBitPrefixLemma!0 (BitStream!3928 BitStream!3928) Unit!6476)

(assert (=> b!105599 (= lt!155916 (readBitPrefixLemma!0 lt!155924 (_2!4600 lt!155919)))))

(assert (=> b!105599 (= lt!155931 (readBitPure!0 (BitStream!3929 (buf!2601 (_2!4600 lt!155919)) (currentByte!5100 thiss!1305) (currentBit!5095 thiss!1305))))))

(assert (=> b!105599 (= lt!155934 (readBitPure!0 lt!155924))))

(assert (=> b!105599 (= lt!155924 (BitStream!3929 (buf!2601 (_2!4600 lt!155933)) (currentByte!5100 thiss!1305) (currentBit!5095 thiss!1305)))))

(declare-fun e!69148 () Bool)

(assert (=> b!105599 e!69148))

(declare-fun res!86960 () Bool)

(assert (=> b!105599 (=> (not res!86960) (not e!69148))))

(declare-fun isPrefixOf!0 (BitStream!3928 BitStream!3928) Bool)

(assert (=> b!105599 (= res!86960 (isPrefixOf!0 thiss!1305 (_2!4600 lt!155919)))))

(declare-fun lt!155923 () Unit!6476)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3928 BitStream!3928 BitStream!3928) Unit!6476)

(assert (=> b!105599 (= lt!155923 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4600 lt!155933) (_2!4600 lt!155919)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3928 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8686)

(assert (=> b!105599 (= lt!155919 (appendNLeastSignificantBitsLoop!0 (_2!4600 lt!155933) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!69156 () Bool)

(assert (=> b!105599 e!69156))

(declare-fun res!86964 () Bool)

(assert (=> b!105599 (=> (not res!86964) (not e!69156))))

(assert (=> b!105599 (= res!86964 (= (size!2227 (buf!2601 thiss!1305)) (size!2227 (buf!2601 (_2!4600 lt!155933)))))))

(declare-fun appendBit!0 (BitStream!3928 Bool) tuple2!8686)

(assert (=> b!105599 (= lt!155933 (appendBit!0 thiss!1305 lt!155922))))

(assert (=> b!105599 (= lt!155922 (not (= (bvand v!199 lt!155913) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!105599 (= lt!155913 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!105600 () Bool)

(assert (=> b!105600 (= e!69151 (= (_2!4601 lt!155934) (_2!4601 lt!155931)))))

(declare-fun b!105601 () Bool)

(declare-fun res!86958 () Bool)

(assert (=> b!105601 (=> (not res!86958) (not e!69148))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!105601 (= res!86958 (invariant!0 (currentBit!5095 thiss!1305) (currentByte!5100 thiss!1305) (size!2227 (buf!2601 (_2!4600 lt!155933)))))))

(declare-fun res!86961 () Bool)

(declare-fun e!69153 () Bool)

(assert (=> start!20898 (=> (not res!86961) (not e!69153))))

(assert (=> start!20898 (= res!86961 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!20898 e!69153))

(assert (=> start!20898 true))

(declare-fun e!69157 () Bool)

(declare-fun inv!12 (BitStream!3928) Bool)

(assert (=> start!20898 (and (inv!12 thiss!1305) e!69157)))

(declare-fun b!105602 () Bool)

(assert (=> b!105602 (= e!69153 e!69149)))

(declare-fun res!86970 () Bool)

(assert (=> b!105602 (=> (not res!86970) (not e!69149))))

(assert (=> b!105602 (= res!86970 (validate_offset_bits!1 ((_ sign_extend 32) (size!2227 (buf!2601 thiss!1305))) ((_ sign_extend 32) (currentByte!5100 thiss!1305)) ((_ sign_extend 32) (currentBit!5095 thiss!1305)) lt!155921))))

(assert (=> b!105602 (= lt!155921 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!105603 () Bool)

(declare-fun res!86966 () Bool)

(assert (=> b!105603 (=> (not res!86966) (not e!69150))))

(assert (=> b!105603 (= res!86966 (isPrefixOf!0 thiss!1305 (_2!4600 lt!155933)))))

(declare-fun b!105604 () Bool)

(declare-fun array_inv!2029 (array!4884) Bool)

(assert (=> b!105604 (= e!69157 (array_inv!2029 (buf!2601 thiss!1305)))))

(declare-fun b!105605 () Bool)

(assert (=> b!105605 (= e!69156 e!69150)))

(declare-fun res!86962 () Bool)

(assert (=> b!105605 (=> (not res!86962) (not e!69150))))

(declare-fun lt!155917 () (_ BitVec 64))

(declare-fun lt!155911 () (_ BitVec 64))

(assert (=> b!105605 (= res!86962 (= lt!155917 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!155911)))))

(assert (=> b!105605 (= lt!155917 (bitIndex!0 (size!2227 (buf!2601 (_2!4600 lt!155933))) (currentByte!5100 (_2!4600 lt!155933)) (currentBit!5095 (_2!4600 lt!155933))))))

(assert (=> b!105605 (= lt!155911 (bitIndex!0 (size!2227 (buf!2601 thiss!1305)) (currentByte!5100 thiss!1305) (currentBit!5095 thiss!1305)))))

(declare-fun b!105606 () Bool)

(assert (=> b!105606 (= e!69152 (= (bitIndex!0 (size!2227 (buf!2601 (_1!4601 lt!155930))) (currentByte!5100 (_1!4601 lt!155930)) (currentBit!5095 (_1!4601 lt!155930))) lt!155917))))

(declare-fun b!105607 () Bool)

(assert (=> b!105607 (= e!69148 (invariant!0 (currentBit!5095 thiss!1305) (currentByte!5100 thiss!1305) (size!2227 (buf!2601 (_2!4600 lt!155919)))))))

(declare-fun b!105608 () Bool)

(assert (=> b!105608 (= e!69154 (invariant!0 (currentBit!5095 (_2!4600 lt!155933)) (currentByte!5100 (_2!4600 lt!155933)) (size!2227 (buf!2601 (_2!4600 lt!155933)))))))

(declare-fun e!69147 () Bool)

(assert (=> b!105608 e!69147))

(declare-fun res!86967 () Bool)

(assert (=> b!105608 (=> (not res!86967) (not e!69147))))

(declare-fun lt!155927 () tuple2!8692)

(assert (=> b!105608 (= res!86967 (and (= (_2!4603 lt!155925) (_2!4603 lt!155927)) (= (_1!4603 lt!155925) (_1!4603 lt!155927))))))

(declare-fun lt!155926 () Unit!6476)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!3928 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!6476)

(assert (=> b!105608 (= lt!155926 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4602 lt!155918) nBits!396 i!615 lt!155912))))

(declare-fun withMovedBitIndex!0 (BitStream!3928 (_ BitVec 64)) BitStream!3928)

(assert (=> b!105608 (= lt!155927 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4602 lt!155918) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!155915))))

(declare-fun b!105609 () Bool)

(declare-fun res!86965 () Bool)

(assert (=> b!105609 (=> (not res!86965) (not e!69149))))

(assert (=> b!105609 (= res!86965 (bvslt i!615 nBits!396))))

(declare-fun b!105610 () Bool)

(declare-fun res!86969 () Bool)

(assert (=> b!105610 (=> (not res!86969) (not e!69149))))

(assert (=> b!105610 (= res!86969 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!105611 () Bool)

(assert (=> b!105611 (= e!69147 (= (_1!4602 lt!155918) (withMovedBitIndex!0 (_2!4602 lt!155918) (bvsub (bitIndex!0 (size!2227 (buf!2601 thiss!1305)) (currentByte!5100 thiss!1305) (currentBit!5095 thiss!1305)) (bitIndex!0 (size!2227 (buf!2601 (_2!4600 lt!155919))) (currentByte!5100 (_2!4600 lt!155919)) (currentBit!5095 (_2!4600 lt!155919)))))))))

(assert (= (and start!20898 res!86961) b!105602))

(assert (= (and b!105602 res!86970) b!105610))

(assert (= (and b!105610 res!86969) b!105609))

(assert (= (and b!105609 res!86965) b!105599))

(assert (= (and b!105599 res!86964) b!105605))

(assert (= (and b!105605 res!86962) b!105603))

(assert (= (and b!105603 res!86966) b!105598))

(assert (= (and b!105598 res!86963) b!105606))

(assert (= (and b!105599 res!86960) b!105601))

(assert (= (and b!105601 res!86958) b!105607))

(assert (= (and b!105599 res!86959) b!105600))

(assert (= (and b!105599 (not res!86968)) b!105608))

(assert (= (and b!105608 res!86967) b!105611))

(assert (= start!20898 b!105604))

(declare-fun m!155233 () Bool)

(assert (=> b!105601 m!155233))

(declare-fun m!155235 () Bool)

(assert (=> b!105602 m!155235))

(declare-fun m!155237 () Bool)

(assert (=> b!105607 m!155237))

(declare-fun m!155239 () Bool)

(assert (=> b!105604 m!155239))

(declare-fun m!155241 () Bool)

(assert (=> b!105598 m!155241))

(assert (=> b!105598 m!155241))

(declare-fun m!155243 () Bool)

(assert (=> b!105598 m!155243))

(declare-fun m!155245 () Bool)

(assert (=> b!105599 m!155245))

(declare-fun m!155247 () Bool)

(assert (=> b!105599 m!155247))

(declare-fun m!155249 () Bool)

(assert (=> b!105599 m!155249))

(declare-fun m!155251 () Bool)

(assert (=> b!105599 m!155251))

(declare-fun m!155253 () Bool)

(assert (=> b!105599 m!155253))

(declare-fun m!155255 () Bool)

(assert (=> b!105599 m!155255))

(declare-fun m!155257 () Bool)

(assert (=> b!105599 m!155257))

(declare-fun m!155259 () Bool)

(assert (=> b!105599 m!155259))

(declare-fun m!155261 () Bool)

(assert (=> b!105599 m!155261))

(declare-fun m!155263 () Bool)

(assert (=> b!105599 m!155263))

(declare-fun m!155265 () Bool)

(assert (=> b!105599 m!155265))

(declare-fun m!155267 () Bool)

(assert (=> b!105599 m!155267))

(declare-fun m!155269 () Bool)

(assert (=> b!105599 m!155269))

(declare-fun m!155271 () Bool)

(assert (=> b!105599 m!155271))

(declare-fun m!155273 () Bool)

(assert (=> b!105599 m!155273))

(declare-fun m!155275 () Bool)

(assert (=> b!105599 m!155275))

(declare-fun m!155277 () Bool)

(assert (=> b!105599 m!155277))

(declare-fun m!155279 () Bool)

(assert (=> b!105599 m!155279))

(declare-fun m!155281 () Bool)

(assert (=> b!105599 m!155281))

(declare-fun m!155283 () Bool)

(assert (=> b!105611 m!155283))

(declare-fun m!155285 () Bool)

(assert (=> b!105611 m!155285))

(declare-fun m!155287 () Bool)

(assert (=> b!105611 m!155287))

(declare-fun m!155289 () Bool)

(assert (=> start!20898 m!155289))

(declare-fun m!155291 () Bool)

(assert (=> b!105603 m!155291))

(declare-fun m!155293 () Bool)

(assert (=> b!105608 m!155293))

(declare-fun m!155295 () Bool)

(assert (=> b!105608 m!155295))

(declare-fun m!155297 () Bool)

(assert (=> b!105608 m!155297))

(assert (=> b!105608 m!155297))

(declare-fun m!155299 () Bool)

(assert (=> b!105608 m!155299))

(declare-fun m!155301 () Bool)

(assert (=> b!105610 m!155301))

(declare-fun m!155303 () Bool)

(assert (=> b!105605 m!155303))

(assert (=> b!105605 m!155283))

(declare-fun m!155305 () Bool)

(assert (=> b!105606 m!155305))

(push 1)

(assert (not b!105606))

(assert (not b!105601))

(assert (not b!105598))

(assert (not b!105608))

(assert (not b!105599))

(assert (not b!105604))

(assert (not b!105603))

(assert (not b!105605))

(assert (not b!105610))

(assert (not start!20898))

(assert (not b!105602))

(assert (not b!105611))

(assert (not b!105607))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!33132 () Bool)

(declare-fun res!87057 () Bool)

(declare-fun e!69229 () Bool)

(assert (=> d!33132 (=> (not res!87057) (not e!69229))))

(assert (=> d!33132 (= res!87057 (= (size!2227 (buf!2601 thiss!1305)) (size!2227 (buf!2601 (_2!4600 lt!155933)))))))

(assert (=> d!33132 (= (isPrefixOf!0 thiss!1305 (_2!4600 lt!155933)) e!69229)))

(declare-fun b!105702 () Bool)

(declare-fun res!87056 () Bool)

(assert (=> b!105702 (=> (not res!87056) (not e!69229))))

(assert (=> b!105702 (= res!87056 (bvsle (bitIndex!0 (size!2227 (buf!2601 thiss!1305)) (currentByte!5100 thiss!1305) (currentBit!5095 thiss!1305)) (bitIndex!0 (size!2227 (buf!2601 (_2!4600 lt!155933))) (currentByte!5100 (_2!4600 lt!155933)) (currentBit!5095 (_2!4600 lt!155933)))))))

(declare-fun b!105703 () Bool)

(declare-fun e!69228 () Bool)

(assert (=> b!105703 (= e!69229 e!69228)))

(declare-fun res!87055 () Bool)

(assert (=> b!105703 (=> res!87055 e!69228)))

(assert (=> b!105703 (= res!87055 (= (size!2227 (buf!2601 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!105704 () Bool)

(declare-fun arrayBitRangesEq!0 (array!4884 array!4884 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!105704 (= e!69228 (arrayBitRangesEq!0 (buf!2601 thiss!1305) (buf!2601 (_2!4600 lt!155933)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2227 (buf!2601 thiss!1305)) (currentByte!5100 thiss!1305) (currentBit!5095 thiss!1305))))))

(assert (= (and d!33132 res!87057) b!105702))

(assert (= (and b!105702 res!87056) b!105703))

(assert (= (and b!105703 (not res!87055)) b!105704))

(assert (=> b!105702 m!155283))

(assert (=> b!105702 m!155303))

(assert (=> b!105704 m!155283))

(assert (=> b!105704 m!155283))

(declare-fun m!155455 () Bool)

(assert (=> b!105704 m!155455))

(assert (=> b!105603 d!33132))

(declare-fun d!33134 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!33134 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2227 (buf!2601 thiss!1305))) ((_ sign_extend 32) (currentByte!5100 thiss!1305)) ((_ sign_extend 32) (currentBit!5095 thiss!1305)) lt!155921) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2227 (buf!2601 thiss!1305))) ((_ sign_extend 32) (currentByte!5100 thiss!1305)) ((_ sign_extend 32) (currentBit!5095 thiss!1305))) lt!155921))))

(declare-fun bs!8096 () Bool)

(assert (= bs!8096 d!33134))

(declare-fun m!155457 () Bool)

(assert (=> bs!8096 m!155457))

(assert (=> b!105602 d!33134))

(declare-fun d!33136 () Bool)

(assert (=> d!33136 (= (array_inv!2029 (buf!2601 thiss!1305)) (bvsge (size!2227 (buf!2601 thiss!1305)) #b00000000000000000000000000000000))))

(assert (=> b!105604 d!33136))

(declare-fun d!33138 () Bool)

(declare-fun e!69232 () Bool)

(assert (=> d!33138 e!69232))

(declare-fun res!87062 () Bool)

(assert (=> d!33138 (=> (not res!87062) (not e!69232))))

(declare-fun lt!156093 () (_ BitVec 64))

(declare-fun lt!156095 () (_ BitVec 64))

(declare-fun lt!156094 () (_ BitVec 64))

(assert (=> d!33138 (= res!87062 (= lt!156095 (bvsub lt!156093 lt!156094)))))

(assert (=> d!33138 (or (= (bvand lt!156093 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!156094 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!156093 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!156093 lt!156094) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!33138 (= lt!156094 (remainingBits!0 ((_ sign_extend 32) (size!2227 (buf!2601 (_2!4600 lt!155933)))) ((_ sign_extend 32) (currentByte!5100 (_2!4600 lt!155933))) ((_ sign_extend 32) (currentBit!5095 (_2!4600 lt!155933)))))))

(declare-fun lt!156096 () (_ BitVec 64))

(declare-fun lt!156092 () (_ BitVec 64))

(assert (=> d!33138 (= lt!156093 (bvmul lt!156096 lt!156092))))

(assert (=> d!33138 (or (= lt!156096 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!156092 (bvsdiv (bvmul lt!156096 lt!156092) lt!156096)))))

(assert (=> d!33138 (= lt!156092 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!33138 (= lt!156096 ((_ sign_extend 32) (size!2227 (buf!2601 (_2!4600 lt!155933)))))))

(assert (=> d!33138 (= lt!156095 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5100 (_2!4600 lt!155933))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5095 (_2!4600 lt!155933)))))))

(assert (=> d!33138 (invariant!0 (currentBit!5095 (_2!4600 lt!155933)) (currentByte!5100 (_2!4600 lt!155933)) (size!2227 (buf!2601 (_2!4600 lt!155933))))))

(assert (=> d!33138 (= (bitIndex!0 (size!2227 (buf!2601 (_2!4600 lt!155933))) (currentByte!5100 (_2!4600 lt!155933)) (currentBit!5095 (_2!4600 lt!155933))) lt!156095)))

(declare-fun b!105709 () Bool)

(declare-fun res!87063 () Bool)

(assert (=> b!105709 (=> (not res!87063) (not e!69232))))

(assert (=> b!105709 (= res!87063 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!156095))))

(declare-fun b!105710 () Bool)

(declare-fun lt!156091 () (_ BitVec 64))

(assert (=> b!105710 (= e!69232 (bvsle lt!156095 (bvmul lt!156091 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!105710 (or (= lt!156091 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!156091 #b0000000000000000000000000000000000000000000000000000000000001000) lt!156091)))))

(assert (=> b!105710 (= lt!156091 ((_ sign_extend 32) (size!2227 (buf!2601 (_2!4600 lt!155933)))))))

(assert (= (and d!33138 res!87062) b!105709))

(assert (= (and b!105709 res!87063) b!105710))

(declare-fun m!155459 () Bool)

(assert (=> d!33138 m!155459))

(assert (=> d!33138 m!155293))

(assert (=> b!105605 d!33138))

(declare-fun d!33140 () Bool)

(declare-fun e!69233 () Bool)

(assert (=> d!33140 e!69233))

(declare-fun res!87064 () Bool)

(assert (=> d!33140 (=> (not res!87064) (not e!69233))))

(declare-fun lt!156101 () (_ BitVec 64))

(declare-fun lt!156100 () (_ BitVec 64))

(declare-fun lt!156099 () (_ BitVec 64))

(assert (=> d!33140 (= res!87064 (= lt!156101 (bvsub lt!156099 lt!156100)))))

(assert (=> d!33140 (or (= (bvand lt!156099 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!156100 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!156099 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!156099 lt!156100) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!33140 (= lt!156100 (remainingBits!0 ((_ sign_extend 32) (size!2227 (buf!2601 thiss!1305))) ((_ sign_extend 32) (currentByte!5100 thiss!1305)) ((_ sign_extend 32) (currentBit!5095 thiss!1305))))))

(declare-fun lt!156102 () (_ BitVec 64))

(declare-fun lt!156098 () (_ BitVec 64))

(assert (=> d!33140 (= lt!156099 (bvmul lt!156102 lt!156098))))

(assert (=> d!33140 (or (= lt!156102 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!156098 (bvsdiv (bvmul lt!156102 lt!156098) lt!156102)))))

(assert (=> d!33140 (= lt!156098 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!33140 (= lt!156102 ((_ sign_extend 32) (size!2227 (buf!2601 thiss!1305))))))

(assert (=> d!33140 (= lt!156101 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5100 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5095 thiss!1305))))))

(assert (=> d!33140 (invariant!0 (currentBit!5095 thiss!1305) (currentByte!5100 thiss!1305) (size!2227 (buf!2601 thiss!1305)))))

(assert (=> d!33140 (= (bitIndex!0 (size!2227 (buf!2601 thiss!1305)) (currentByte!5100 thiss!1305) (currentBit!5095 thiss!1305)) lt!156101)))

(declare-fun b!105711 () Bool)

(declare-fun res!87065 () Bool)

(assert (=> b!105711 (=> (not res!87065) (not e!69233))))

(assert (=> b!105711 (= res!87065 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!156101))))

(declare-fun b!105712 () Bool)

(declare-fun lt!156097 () (_ BitVec 64))

(assert (=> b!105712 (= e!69233 (bvsle lt!156101 (bvmul lt!156097 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!105712 (or (= lt!156097 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!156097 #b0000000000000000000000000000000000000000000000000000000000001000) lt!156097)))))

(assert (=> b!105712 (= lt!156097 ((_ sign_extend 32) (size!2227 (buf!2601 thiss!1305))))))

(assert (= (and d!33140 res!87064) b!105711))

(assert (= (and b!105711 res!87065) b!105712))

(assert (=> d!33140 m!155457))

(declare-fun m!155461 () Bool)

(assert (=> d!33140 m!155461))

(assert (=> b!105605 d!33140))

(declare-fun d!33142 () Bool)

(assert (=> d!33142 (= (invariant!0 (currentBit!5095 thiss!1305) (currentByte!5100 thiss!1305) (size!2227 (buf!2601 (_2!4600 lt!155919)))) (and (bvsge (currentBit!5095 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5095 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5100 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5100 thiss!1305) (size!2227 (buf!2601 (_2!4600 lt!155919)))) (and (= (currentBit!5095 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5100 thiss!1305) (size!2227 (buf!2601 (_2!4600 lt!155919))))))))))

(assert (=> b!105607 d!33142))

(declare-fun d!33144 () Bool)

(assert (=> d!33144 (= (inv!12 thiss!1305) (invariant!0 (currentBit!5095 thiss!1305) (currentByte!5100 thiss!1305) (size!2227 (buf!2601 thiss!1305))))))

(declare-fun bs!8097 () Bool)

(assert (= bs!8097 d!33144))

(assert (=> bs!8097 m!155461))

(assert (=> start!20898 d!33144))

(declare-fun d!33146 () Bool)

(declare-fun e!69234 () Bool)

(assert (=> d!33146 e!69234))

(declare-fun res!87066 () Bool)

(assert (=> d!33146 (=> (not res!87066) (not e!69234))))

(declare-fun lt!156105 () (_ BitVec 64))

(declare-fun lt!156106 () (_ BitVec 64))

(declare-fun lt!156107 () (_ BitVec 64))

(assert (=> d!33146 (= res!87066 (= lt!156107 (bvsub lt!156105 lt!156106)))))

(assert (=> d!33146 (or (= (bvand lt!156105 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!156106 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!156105 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!156105 lt!156106) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!33146 (= lt!156106 (remainingBits!0 ((_ sign_extend 32) (size!2227 (buf!2601 (_1!4601 lt!155930)))) ((_ sign_extend 32) (currentByte!5100 (_1!4601 lt!155930))) ((_ sign_extend 32) (currentBit!5095 (_1!4601 lt!155930)))))))

(declare-fun lt!156108 () (_ BitVec 64))

(declare-fun lt!156104 () (_ BitVec 64))

(assert (=> d!33146 (= lt!156105 (bvmul lt!156108 lt!156104))))

(assert (=> d!33146 (or (= lt!156108 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!156104 (bvsdiv (bvmul lt!156108 lt!156104) lt!156108)))))

(assert (=> d!33146 (= lt!156104 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!33146 (= lt!156108 ((_ sign_extend 32) (size!2227 (buf!2601 (_1!4601 lt!155930)))))))

(assert (=> d!33146 (= lt!156107 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5100 (_1!4601 lt!155930))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5095 (_1!4601 lt!155930)))))))

(assert (=> d!33146 (invariant!0 (currentBit!5095 (_1!4601 lt!155930)) (currentByte!5100 (_1!4601 lt!155930)) (size!2227 (buf!2601 (_1!4601 lt!155930))))))

(assert (=> d!33146 (= (bitIndex!0 (size!2227 (buf!2601 (_1!4601 lt!155930))) (currentByte!5100 (_1!4601 lt!155930)) (currentBit!5095 (_1!4601 lt!155930))) lt!156107)))

(declare-fun b!105713 () Bool)

(declare-fun res!87067 () Bool)

(assert (=> b!105713 (=> (not res!87067) (not e!69234))))

(assert (=> b!105713 (= res!87067 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!156107))))

(declare-fun b!105714 () Bool)

(declare-fun lt!156103 () (_ BitVec 64))

(assert (=> b!105714 (= e!69234 (bvsle lt!156107 (bvmul lt!156103 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!105714 (or (= lt!156103 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!156103 #b0000000000000000000000000000000000000000000000000000000000001000) lt!156103)))))

(assert (=> b!105714 (= lt!156103 ((_ sign_extend 32) (size!2227 (buf!2601 (_1!4601 lt!155930)))))))

(assert (= (and d!33146 res!87066) b!105713))

(assert (= (and b!105713 res!87067) b!105714))

(declare-fun m!155463 () Bool)

(assert (=> d!33146 m!155463))

(declare-fun m!155465 () Bool)

(assert (=> d!33146 m!155465))

(assert (=> b!105606 d!33146))

(declare-fun d!33148 () Bool)

(assert (=> d!33148 (= (invariant!0 (currentBit!5095 (_2!4600 lt!155933)) (currentByte!5100 (_2!4600 lt!155933)) (size!2227 (buf!2601 (_2!4600 lt!155933)))) (and (bvsge (currentBit!5095 (_2!4600 lt!155933)) #b00000000000000000000000000000000) (bvslt (currentBit!5095 (_2!4600 lt!155933)) #b00000000000000000000000000001000) (bvsge (currentByte!5100 (_2!4600 lt!155933)) #b00000000000000000000000000000000) (or (bvslt (currentByte!5100 (_2!4600 lt!155933)) (size!2227 (buf!2601 (_2!4600 lt!155933)))) (and (= (currentBit!5095 (_2!4600 lt!155933)) #b00000000000000000000000000000000) (= (currentByte!5100 (_2!4600 lt!155933)) (size!2227 (buf!2601 (_2!4600 lt!155933))))))))))

(assert (=> b!105608 d!33148))

(declare-fun d!33150 () Bool)

(declare-fun lt!156125 () tuple2!8692)

(declare-fun lt!156122 () tuple2!8692)

(assert (=> d!33150 (and (= (_2!4603 lt!156125) (_2!4603 lt!156122)) (= (_1!4603 lt!156125) (_1!4603 lt!156122)))))

(declare-fun lt!156126 () BitStream!3928)

(declare-fun lt!156121 () Unit!6476)

(declare-fun lt!156124 () (_ BitVec 64))

(declare-fun lt!156123 () Bool)

(declare-fun choose!45 (BitStream!3928 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!8692 tuple2!8692 BitStream!3928 (_ BitVec 64) Bool BitStream!3928 (_ BitVec 64) tuple2!8692 tuple2!8692 BitStream!3928 (_ BitVec 64)) Unit!6476)

(assert (=> d!33150 (= lt!156121 (choose!45 (_1!4602 lt!155918) nBits!396 i!615 lt!155912 lt!156125 (tuple2!8693 (_1!4603 lt!156125) (_2!4603 lt!156125)) (_1!4603 lt!156125) (_2!4603 lt!156125) lt!156123 lt!156126 lt!156124 lt!156122 (tuple2!8693 (_1!4603 lt!156122) (_2!4603 lt!156122)) (_1!4603 lt!156122) (_2!4603 lt!156122)))))

(assert (=> d!33150 (= lt!156122 (readNLeastSignificantBitsLoopPure!0 lt!156126 nBits!396 (bvadd i!615 #b00000000000000000000000000000001) lt!156124))))

(assert (=> d!33150 (= lt!156124 (bvor lt!155912 (ite lt!156123 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!33150 (= lt!156126 (withMovedBitIndex!0 (_1!4602 lt!155918) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!33150 (= lt!156123 (_2!4601 (readBitPure!0 (_1!4602 lt!155918))))))

(assert (=> d!33150 (= lt!156125 (readNLeastSignificantBitsLoopPure!0 (_1!4602 lt!155918) nBits!396 i!615 lt!155912))))

(assert (=> d!33150 (= (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4602 lt!155918) nBits!396 i!615 lt!155912) lt!156121)))

(declare-fun bs!8099 () Bool)

(assert (= bs!8099 d!33150))

(assert (=> bs!8099 m!155245))

(declare-fun m!155467 () Bool)

(assert (=> bs!8099 m!155467))

(assert (=> bs!8099 m!155259))

(declare-fun m!155469 () Bool)

(assert (=> bs!8099 m!155469))

(assert (=> bs!8099 m!155297))

(assert (=> b!105608 d!33150))

(declare-fun d!33152 () Bool)

(declare-datatypes ((tuple2!8710 0))(
  ( (tuple2!8711 (_1!4612 (_ BitVec 64)) (_2!4612 BitStream!3928)) )
))
(declare-fun lt!156129 () tuple2!8710)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!3928 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!8710)

(assert (=> d!33152 (= lt!156129 (readNLeastSignificantBitsLoop!0 (withMovedBitIndex!0 (_1!4602 lt!155918) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!155915))))

(assert (=> d!33152 (= (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4602 lt!155918) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!155915) (tuple2!8693 (_2!4612 lt!156129) (_1!4612 lt!156129)))))

(declare-fun bs!8100 () Bool)

(assert (= bs!8100 d!33152))

(assert (=> bs!8100 m!155297))

(declare-fun m!155471 () Bool)

(assert (=> bs!8100 m!155471))

(assert (=> b!105608 d!33152))

(declare-fun d!33154 () Bool)

(declare-fun e!69237 () Bool)

(assert (=> d!33154 e!69237))

(declare-fun res!87070 () Bool)

(assert (=> d!33154 (=> (not res!87070) (not e!69237))))

(declare-fun lt!156135 () (_ BitVec 64))

(declare-fun lt!156134 () BitStream!3928)

(assert (=> d!33154 (= res!87070 (= (bvadd lt!156135 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!2227 (buf!2601 lt!156134)) (currentByte!5100 lt!156134) (currentBit!5095 lt!156134))))))

(assert (=> d!33154 (or (not (= (bvand lt!156135 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!156135 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!156135 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!33154 (= lt!156135 (bitIndex!0 (size!2227 (buf!2601 (_1!4602 lt!155918))) (currentByte!5100 (_1!4602 lt!155918)) (currentBit!5095 (_1!4602 lt!155918))))))

(declare-fun moveBitIndex!0 (BitStream!3928 (_ BitVec 64)) tuple2!8686)

(assert (=> d!33154 (= lt!156134 (_2!4600 (moveBitIndex!0 (_1!4602 lt!155918) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun moveBitIndexPrecond!0 (BitStream!3928 (_ BitVec 64)) Bool)

(assert (=> d!33154 (moveBitIndexPrecond!0 (_1!4602 lt!155918) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!33154 (= (withMovedBitIndex!0 (_1!4602 lt!155918) #b0000000000000000000000000000000000000000000000000000000000000001) lt!156134)))

(declare-fun b!105717 () Bool)

(assert (=> b!105717 (= e!69237 (= (size!2227 (buf!2601 (_1!4602 lt!155918))) (size!2227 (buf!2601 lt!156134))))))

(assert (= (and d!33154 res!87070) b!105717))

(declare-fun m!155473 () Bool)

(assert (=> d!33154 m!155473))

(declare-fun m!155475 () Bool)

(assert (=> d!33154 m!155475))

(declare-fun m!155477 () Bool)

(assert (=> d!33154 m!155477))

(declare-fun m!155479 () Bool)

(assert (=> d!33154 m!155479))

(assert (=> b!105608 d!33154))

(declare-fun d!33156 () Bool)

(assert (=> d!33156 (= (onesLSBLong!0 (bvsub nBits!396 i!615)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!396 i!615)))))))

(assert (=> b!105599 d!33156))

(declare-fun d!33158 () Bool)

(declare-datatypes ((tuple2!8712 0))(
  ( (tuple2!8713 (_1!4613 Bool) (_2!4613 BitStream!3928)) )
))
(declare-fun lt!156138 () tuple2!8712)

(declare-fun readBit!0 (BitStream!3928) tuple2!8712)

(assert (=> d!33158 (= lt!156138 (readBit!0 lt!155924))))

(assert (=> d!33158 (= (readBitPure!0 lt!155924) (tuple2!8689 (_2!4613 lt!156138) (_1!4613 lt!156138)))))

(declare-fun bs!8101 () Bool)

(assert (= bs!8101 d!33158))

(declare-fun m!155481 () Bool)

(assert (=> bs!8101 m!155481))

(assert (=> b!105599 d!33158))

(declare-fun b!105730 () Bool)

(declare-fun e!69242 () Bool)

(declare-fun lt!156148 () tuple2!8688)

(declare-fun lt!156147 () tuple2!8686)

(assert (=> b!105730 (= e!69242 (= (bitIndex!0 (size!2227 (buf!2601 (_1!4601 lt!156148))) (currentByte!5100 (_1!4601 lt!156148)) (currentBit!5095 (_1!4601 lt!156148))) (bitIndex!0 (size!2227 (buf!2601 (_2!4600 lt!156147))) (currentByte!5100 (_2!4600 lt!156147)) (currentBit!5095 (_2!4600 lt!156147)))))))

(declare-fun b!105729 () Bool)

(declare-fun e!69243 () Bool)

(assert (=> b!105729 (= e!69243 e!69242)))

(declare-fun res!87080 () Bool)

(assert (=> b!105729 (=> (not res!87080) (not e!69242))))

(assert (=> b!105729 (= res!87080 (and (= (_2!4601 lt!156148) lt!155922) (= (_1!4601 lt!156148) (_2!4600 lt!156147))))))

(assert (=> b!105729 (= lt!156148 (readBitPure!0 (readerFrom!0 (_2!4600 lt!156147) (currentBit!5095 thiss!1305) (currentByte!5100 thiss!1305))))))

(declare-fun d!33160 () Bool)

(assert (=> d!33160 e!69243))

(declare-fun res!87079 () Bool)

(assert (=> d!33160 (=> (not res!87079) (not e!69243))))

(assert (=> d!33160 (= res!87079 (= (size!2227 (buf!2601 thiss!1305)) (size!2227 (buf!2601 (_2!4600 lt!156147)))))))

(declare-fun choose!16 (BitStream!3928 Bool) tuple2!8686)

(assert (=> d!33160 (= lt!156147 (choose!16 thiss!1305 lt!155922))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!33160 (validate_offset_bit!0 ((_ sign_extend 32) (size!2227 (buf!2601 thiss!1305))) ((_ sign_extend 32) (currentByte!5100 thiss!1305)) ((_ sign_extend 32) (currentBit!5095 thiss!1305)))))

(assert (=> d!33160 (= (appendBit!0 thiss!1305 lt!155922) lt!156147)))

(declare-fun b!105727 () Bool)

(declare-fun res!87082 () Bool)

(assert (=> b!105727 (=> (not res!87082) (not e!69243))))

(declare-fun lt!156150 () (_ BitVec 64))

(declare-fun lt!156149 () (_ BitVec 64))

(assert (=> b!105727 (= res!87082 (= (bitIndex!0 (size!2227 (buf!2601 (_2!4600 lt!156147))) (currentByte!5100 (_2!4600 lt!156147)) (currentBit!5095 (_2!4600 lt!156147))) (bvadd lt!156149 lt!156150)))))

(assert (=> b!105727 (or (not (= (bvand lt!156149 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!156150 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!156149 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!156149 lt!156150) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!105727 (= lt!156150 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!105727 (= lt!156149 (bitIndex!0 (size!2227 (buf!2601 thiss!1305)) (currentByte!5100 thiss!1305) (currentBit!5095 thiss!1305)))))

(declare-fun b!105728 () Bool)

(declare-fun res!87081 () Bool)

(assert (=> b!105728 (=> (not res!87081) (not e!69243))))

(assert (=> b!105728 (= res!87081 (isPrefixOf!0 thiss!1305 (_2!4600 lt!156147)))))

(assert (= (and d!33160 res!87079) b!105727))

(assert (= (and b!105727 res!87082) b!105728))

(assert (= (and b!105728 res!87081) b!105729))

(assert (= (and b!105729 res!87080) b!105730))

(declare-fun m!155483 () Bool)

(assert (=> d!33160 m!155483))

(declare-fun m!155485 () Bool)

(assert (=> d!33160 m!155485))

(declare-fun m!155487 () Bool)

(assert (=> b!105727 m!155487))

(assert (=> b!105727 m!155283))

(declare-fun m!155489 () Bool)

(assert (=> b!105730 m!155489))

(assert (=> b!105730 m!155487))

(declare-fun m!155491 () Bool)

(assert (=> b!105728 m!155491))

(declare-fun m!155493 () Bool)

(assert (=> b!105729 m!155493))

(assert (=> b!105729 m!155493))

(declare-fun m!155495 () Bool)

(assert (=> b!105729 m!155495))

(assert (=> b!105599 d!33160))

(declare-fun d!33162 () Bool)

(declare-fun lt!156151 () tuple2!8712)

(assert (=> d!33162 (= lt!156151 (readBit!0 (_1!4602 lt!155918)))))

(assert (=> d!33162 (= (readBitPure!0 (_1!4602 lt!155918)) (tuple2!8689 (_2!4613 lt!156151) (_1!4613 lt!156151)))))

(declare-fun bs!8102 () Bool)

(assert (= bs!8102 d!33162))

(declare-fun m!155497 () Bool)

(assert (=> bs!8102 m!155497))

(assert (=> b!105599 d!33162))

(declare-fun d!33164 () Bool)

(declare-fun lt!156152 () tuple2!8710)

(assert (=> d!33164 (= lt!156152 (readNLeastSignificantBitsLoop!0 (_1!4602 lt!155929) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!155915))))

(assert (=> d!33164 (= (readNLeastSignificantBitsLoopPure!0 (_1!4602 lt!155929) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!155915) (tuple2!8693 (_2!4612 lt!156152) (_1!4612 lt!156152)))))

(declare-fun bs!8103 () Bool)

(assert (= bs!8103 d!33164))

(declare-fun m!155499 () Bool)

(assert (=> bs!8103 m!155499))

(assert (=> b!105599 d!33164))

(declare-fun d!33166 () Bool)

(declare-fun lt!156153 () tuple2!8710)

(assert (=> d!33166 (= lt!156153 (readNLeastSignificantBitsLoop!0 (_1!4602 lt!155918) nBits!396 i!615 lt!155912))))

(assert (=> d!33166 (= (readNLeastSignificantBitsLoopPure!0 (_1!4602 lt!155918) nBits!396 i!615 lt!155912) (tuple2!8693 (_2!4612 lt!156153) (_1!4612 lt!156153)))))

(declare-fun bs!8104 () Bool)

(assert (= bs!8104 d!33166))

(declare-fun m!155501 () Bool)

(assert (=> bs!8104 m!155501))

(assert (=> b!105599 d!33166))

(declare-fun d!33168 () Bool)

(declare-fun e!69246 () Bool)

(assert (=> d!33168 e!69246))

(declare-fun res!87085 () Bool)

(assert (=> d!33168 (=> (not res!87085) (not e!69246))))

(declare-fun lt!156162 () tuple2!8688)

(declare-fun lt!156163 () tuple2!8688)

(assert (=> d!33168 (= res!87085 (= (bitIndex!0 (size!2227 (buf!2601 (_1!4601 lt!156162))) (currentByte!5100 (_1!4601 lt!156162)) (currentBit!5095 (_1!4601 lt!156162))) (bitIndex!0 (size!2227 (buf!2601 (_1!4601 lt!156163))) (currentByte!5100 (_1!4601 lt!156163)) (currentBit!5095 (_1!4601 lt!156163)))))))

(declare-fun lt!156165 () Unit!6476)

(declare-fun lt!156164 () BitStream!3928)

(declare-fun choose!50 (BitStream!3928 BitStream!3928 BitStream!3928 tuple2!8688 tuple2!8688 BitStream!3928 Bool tuple2!8688 tuple2!8688 BitStream!3928 Bool) Unit!6476)

(assert (=> d!33168 (= lt!156165 (choose!50 lt!155924 (_2!4600 lt!155919) lt!156164 lt!156162 (tuple2!8689 (_1!4601 lt!156162) (_2!4601 lt!156162)) (_1!4601 lt!156162) (_2!4601 lt!156162) lt!156163 (tuple2!8689 (_1!4601 lt!156163) (_2!4601 lt!156163)) (_1!4601 lt!156163) (_2!4601 lt!156163)))))

(assert (=> d!33168 (= lt!156163 (readBitPure!0 lt!156164))))

(assert (=> d!33168 (= lt!156162 (readBitPure!0 lt!155924))))

(assert (=> d!33168 (= lt!156164 (BitStream!3929 (buf!2601 (_2!4600 lt!155919)) (currentByte!5100 lt!155924) (currentBit!5095 lt!155924)))))

(assert (=> d!33168 (invariant!0 (currentBit!5095 lt!155924) (currentByte!5100 lt!155924) (size!2227 (buf!2601 (_2!4600 lt!155919))))))

(assert (=> d!33168 (= (readBitPrefixLemma!0 lt!155924 (_2!4600 lt!155919)) lt!156165)))

(declare-fun b!105733 () Bool)

(assert (=> b!105733 (= e!69246 (= (_2!4601 lt!156162) (_2!4601 lt!156163)))))

(assert (= (and d!33168 res!87085) b!105733))

(assert (=> d!33168 m!155265))

(declare-fun m!155505 () Bool)

(assert (=> d!33168 m!155505))

(declare-fun m!155507 () Bool)

(assert (=> d!33168 m!155507))

(declare-fun m!155509 () Bool)

(assert (=> d!33168 m!155509))

(declare-fun m!155511 () Bool)

(assert (=> d!33168 m!155511))

(declare-fun m!155513 () Bool)

(assert (=> d!33168 m!155513))

(assert (=> b!105599 d!33168))

(declare-fun d!33178 () Bool)

(declare-fun e!69247 () Bool)

(assert (=> d!33178 e!69247))

(declare-fun res!87086 () Bool)

(assert (=> d!33178 (=> (not res!87086) (not e!69247))))

(declare-fun lt!156169 () (_ BitVec 64))

(declare-fun lt!156168 () (_ BitVec 64))

(declare-fun lt!156170 () (_ BitVec 64))

(assert (=> d!33178 (= res!87086 (= lt!156170 (bvsub lt!156168 lt!156169)))))

(assert (=> d!33178 (or (= (bvand lt!156168 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!156169 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!156168 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!156168 lt!156169) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!33178 (= lt!156169 (remainingBits!0 ((_ sign_extend 32) (size!2227 (buf!2601 (_1!4601 lt!155934)))) ((_ sign_extend 32) (currentByte!5100 (_1!4601 lt!155934))) ((_ sign_extend 32) (currentBit!5095 (_1!4601 lt!155934)))))))

(declare-fun lt!156171 () (_ BitVec 64))

(declare-fun lt!156167 () (_ BitVec 64))

(assert (=> d!33178 (= lt!156168 (bvmul lt!156171 lt!156167))))

(assert (=> d!33178 (or (= lt!156171 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!156167 (bvsdiv (bvmul lt!156171 lt!156167) lt!156171)))))

(assert (=> d!33178 (= lt!156167 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!33178 (= lt!156171 ((_ sign_extend 32) (size!2227 (buf!2601 (_1!4601 lt!155934)))))))

(assert (=> d!33178 (= lt!156170 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5100 (_1!4601 lt!155934))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5095 (_1!4601 lt!155934)))))))

(assert (=> d!33178 (invariant!0 (currentBit!5095 (_1!4601 lt!155934)) (currentByte!5100 (_1!4601 lt!155934)) (size!2227 (buf!2601 (_1!4601 lt!155934))))))

(assert (=> d!33178 (= (bitIndex!0 (size!2227 (buf!2601 (_1!4601 lt!155934))) (currentByte!5100 (_1!4601 lt!155934)) (currentBit!5095 (_1!4601 lt!155934))) lt!156170)))

(declare-fun b!105734 () Bool)

(declare-fun res!87087 () Bool)

(assert (=> b!105734 (=> (not res!87087) (not e!69247))))

(assert (=> b!105734 (= res!87087 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!156170))))

(declare-fun b!105735 () Bool)

(declare-fun lt!156166 () (_ BitVec 64))

(assert (=> b!105735 (= e!69247 (bvsle lt!156170 (bvmul lt!156166 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!105735 (or (= lt!156166 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!156166 #b0000000000000000000000000000000000000000000000000000000000001000) lt!156166)))))

(assert (=> b!105735 (= lt!156166 ((_ sign_extend 32) (size!2227 (buf!2601 (_1!4601 lt!155934)))))))

(assert (= (and d!33178 res!87086) b!105734))

(assert (= (and b!105734 res!87087) b!105735))

(declare-fun m!155515 () Bool)

(assert (=> d!33178 m!155515))

(declare-fun m!155517 () Bool)

(assert (=> d!33178 m!155517))

(assert (=> b!105599 d!33178))

(declare-fun d!33180 () Bool)

(declare-fun res!87090 () Bool)

(declare-fun e!69249 () Bool)

(assert (=> d!33180 (=> (not res!87090) (not e!69249))))

(assert (=> d!33180 (= res!87090 (= (size!2227 (buf!2601 thiss!1305)) (size!2227 (buf!2601 (_2!4600 lt!155919)))))))

(assert (=> d!33180 (= (isPrefixOf!0 thiss!1305 (_2!4600 lt!155919)) e!69249)))

(declare-fun b!105736 () Bool)

(declare-fun res!87089 () Bool)

(assert (=> b!105736 (=> (not res!87089) (not e!69249))))

(assert (=> b!105736 (= res!87089 (bvsle (bitIndex!0 (size!2227 (buf!2601 thiss!1305)) (currentByte!5100 thiss!1305) (currentBit!5095 thiss!1305)) (bitIndex!0 (size!2227 (buf!2601 (_2!4600 lt!155919))) (currentByte!5100 (_2!4600 lt!155919)) (currentBit!5095 (_2!4600 lt!155919)))))))

(declare-fun b!105737 () Bool)

(declare-fun e!69248 () Bool)

(assert (=> b!105737 (= e!69249 e!69248)))

(declare-fun res!87088 () Bool)

(assert (=> b!105737 (=> res!87088 e!69248)))

(assert (=> b!105737 (= res!87088 (= (size!2227 (buf!2601 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!105738 () Bool)

(assert (=> b!105738 (= e!69248 (arrayBitRangesEq!0 (buf!2601 thiss!1305) (buf!2601 (_2!4600 lt!155919)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2227 (buf!2601 thiss!1305)) (currentByte!5100 thiss!1305) (currentBit!5095 thiss!1305))))))

(assert (= (and d!33180 res!87090) b!105736))

(assert (= (and b!105736 res!87089) b!105737))

(assert (= (and b!105737 (not res!87088)) b!105738))

(assert (=> b!105736 m!155283))

(assert (=> b!105736 m!155285))

(assert (=> b!105738 m!155283))

(assert (=> b!105738 m!155283))

(declare-fun m!155519 () Bool)

(assert (=> b!105738 m!155519))

(assert (=> b!105599 d!33180))

(declare-fun d!33182 () Bool)

(assert (=> d!33182 (isPrefixOf!0 thiss!1305 (_2!4600 lt!155919))))

(declare-fun lt!156174 () Unit!6476)

(declare-fun choose!30 (BitStream!3928 BitStream!3928 BitStream!3928) Unit!6476)

(assert (=> d!33182 (= lt!156174 (choose!30 thiss!1305 (_2!4600 lt!155933) (_2!4600 lt!155919)))))

(assert (=> d!33182 (isPrefixOf!0 thiss!1305 (_2!4600 lt!155933))))

(assert (=> d!33182 (= (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4600 lt!155933) (_2!4600 lt!155919)) lt!156174)))

(declare-fun bs!8106 () Bool)

(assert (= bs!8106 d!33182))

(assert (=> bs!8106 m!155273))

(declare-fun m!155521 () Bool)

(assert (=> bs!8106 m!155521))

(assert (=> bs!8106 m!155291))

(assert (=> b!105599 d!33182))

(declare-fun d!33184 () Bool)

(assert (=> d!33184 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2227 (buf!2601 (_2!4600 lt!155919)))) ((_ sign_extend 32) (currentByte!5100 (_2!4600 lt!155933))) ((_ sign_extend 32) (currentBit!5095 (_2!4600 lt!155933))) lt!155932) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2227 (buf!2601 (_2!4600 lt!155919)))) ((_ sign_extend 32) (currentByte!5100 (_2!4600 lt!155933))) ((_ sign_extend 32) (currentBit!5095 (_2!4600 lt!155933)))) lt!155932))))

(declare-fun bs!8107 () Bool)

(assert (= bs!8107 d!33184))

(declare-fun m!155523 () Bool)

(assert (=> bs!8107 m!155523))

(assert (=> b!105599 d!33184))

(declare-fun d!33186 () Bool)

(assert (=> d!33186 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2227 (buf!2601 (_2!4600 lt!155919)))) ((_ sign_extend 32) (currentByte!5100 thiss!1305)) ((_ sign_extend 32) (currentBit!5095 thiss!1305)) lt!155921) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2227 (buf!2601 (_2!4600 lt!155919)))) ((_ sign_extend 32) (currentByte!5100 thiss!1305)) ((_ sign_extend 32) (currentBit!5095 thiss!1305))) lt!155921))))

(declare-fun bs!8108 () Bool)

(assert (= bs!8108 d!33186))

(declare-fun m!155525 () Bool)

(assert (=> bs!8108 m!155525))

(assert (=> b!105599 d!33186))

(declare-fun d!33188 () Bool)

(declare-fun lt!156175 () tuple2!8712)

(assert (=> d!33188 (= lt!156175 (readBit!0 (BitStream!3929 (buf!2601 (_2!4600 lt!155919)) (currentByte!5100 thiss!1305) (currentBit!5095 thiss!1305))))))

(assert (=> d!33188 (= (readBitPure!0 (BitStream!3929 (buf!2601 (_2!4600 lt!155919)) (currentByte!5100 thiss!1305) (currentBit!5095 thiss!1305))) (tuple2!8689 (_2!4613 lt!156175) (_1!4613 lt!156175)))))

(declare-fun bs!8109 () Bool)

(assert (= bs!8109 d!33188))

(declare-fun m!155527 () Bool)

(assert (=> bs!8109 m!155527))

(assert (=> b!105599 d!33188))

(declare-fun b!105798 () Bool)

(declare-fun lt!156379 () tuple2!8692)

(declare-fun lt!156393 () tuple2!8690)

(declare-fun e!69289 () Bool)

(assert (=> b!105798 (= e!69289 (and (= (_2!4603 lt!156379) v!199) (= (_1!4603 lt!156379) (_2!4602 lt!156393))))))

(declare-fun lt!156389 () (_ BitVec 64))

(assert (=> b!105798 (= lt!156379 (readNLeastSignificantBitsLoopPure!0 (_1!4602 lt!156393) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!156389))))

(declare-fun lt!156390 () Unit!6476)

(declare-fun lt!156397 () Unit!6476)

(assert (=> b!105798 (= lt!156390 lt!156397)))

(declare-fun lt!156354 () tuple2!8686)

(declare-fun lt!156356 () (_ BitVec 64))

(assert (=> b!105798 (validate_offset_bits!1 ((_ sign_extend 32) (size!2227 (buf!2601 (_2!4600 lt!156354)))) ((_ sign_extend 32) (currentByte!5100 (_2!4600 lt!155933))) ((_ sign_extend 32) (currentBit!5095 (_2!4600 lt!155933))) lt!156356)))

(assert (=> b!105798 (= lt!156397 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4600 lt!155933) (buf!2601 (_2!4600 lt!156354)) lt!156356))))

(declare-fun e!69292 () Bool)

(assert (=> b!105798 e!69292))

(declare-fun res!87149 () Bool)

(assert (=> b!105798 (=> (not res!87149) (not e!69292))))

(assert (=> b!105798 (= res!87149 (and (= (size!2227 (buf!2601 (_2!4600 lt!155933))) (size!2227 (buf!2601 (_2!4600 lt!156354)))) (bvsge lt!156356 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!105798 (= lt!156356 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!105798 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!105798 (= lt!156389 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(assert (=> b!105798 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!105798 (= lt!156393 (reader!0 (_2!4600 lt!155933) (_2!4600 lt!156354)))))

(declare-fun b!105799 () Bool)

(declare-fun e!69287 () Bool)

(declare-fun lt!156357 () tuple2!8688)

(declare-fun lt!156364 () tuple2!8688)

(assert (=> b!105799 (= e!69287 (= (_2!4601 lt!156357) (_2!4601 lt!156364)))))

(declare-fun d!33190 () Bool)

(assert (=> d!33190 e!69289))

(declare-fun res!87148 () Bool)

(assert (=> d!33190 (=> (not res!87148) (not e!69289))))

(assert (=> d!33190 (= res!87148 (= (size!2227 (buf!2601 (_2!4600 lt!155933))) (size!2227 (buf!2601 (_2!4600 lt!156354)))))))

(declare-fun e!69290 () tuple2!8686)

(assert (=> d!33190 (= lt!156354 e!69290)))

(declare-fun c!6520 () Bool)

(assert (=> d!33190 (= c!6520 (bvslt (bvadd #b00000000000000000000000000000001 i!615) nBits!396))))

(assert (=> d!33190 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)) (bvsle (bvadd #b00000000000000000000000000000001 i!615) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!33190 (= (appendNLeastSignificantBitsLoop!0 (_2!4600 lt!155933) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) lt!156354)))

(declare-fun b!105800 () Bool)

(declare-fun e!69293 () (_ BitVec 64))

(assert (=> b!105800 (= e!69293 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!105801 () Bool)

(declare-fun lt!156394 () Unit!6476)

(assert (=> b!105801 (= e!69290 (tuple2!8687 lt!156394 (_2!4600 lt!155933)))))

(declare-fun lt!156366 () BitStream!3928)

(assert (=> b!105801 (= lt!156366 (_2!4600 lt!155933))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!3928) Unit!6476)

(assert (=> b!105801 (= lt!156394 (lemmaIsPrefixRefl!0 lt!156366))))

(declare-fun call!1326 () Bool)

(assert (=> b!105801 call!1326))

(declare-fun b!105802 () Bool)

(declare-fun res!87146 () Bool)

(declare-fun lt!156371 () tuple2!8686)

(assert (=> b!105802 (= res!87146 (= (bitIndex!0 (size!2227 (buf!2601 (_2!4600 lt!156371))) (currentByte!5100 (_2!4600 lt!156371)) (currentBit!5095 (_2!4600 lt!156371))) (bvadd (bitIndex!0 (size!2227 (buf!2601 (_2!4600 lt!155933))) (currentByte!5100 (_2!4600 lt!155933)) (currentBit!5095 (_2!4600 lt!155933))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun e!69291 () Bool)

(assert (=> b!105802 (=> (not res!87146) (not e!69291))))

(declare-fun b!105803 () Bool)

(declare-fun e!69288 () Bool)

(declare-fun lt!156396 () tuple2!8688)

(assert (=> b!105803 (= e!69288 (= (bitIndex!0 (size!2227 (buf!2601 (_1!4601 lt!156396))) (currentByte!5100 (_1!4601 lt!156396)) (currentBit!5095 (_1!4601 lt!156396))) (bitIndex!0 (size!2227 (buf!2601 (_2!4600 lt!156371))) (currentByte!5100 (_2!4600 lt!156371)) (currentBit!5095 (_2!4600 lt!156371)))))))

(declare-fun b!105804 () Bool)

(declare-fun res!87144 () Bool)

(assert (=> b!105804 (=> (not res!87144) (not e!69289))))

(assert (=> b!105804 (= res!87144 (isPrefixOf!0 (_2!4600 lt!155933) (_2!4600 lt!156354)))))

(declare-fun lt!156374 () tuple2!8686)

(declare-fun bm!1323 () Bool)

(assert (=> bm!1323 (= call!1326 (isPrefixOf!0 (ite c!6520 (_2!4600 lt!155933) lt!156366) (ite c!6520 (_2!4600 lt!156374) lt!156366)))))

(declare-fun b!105805 () Bool)

(declare-fun res!87151 () Bool)

(assert (=> b!105805 (= res!87151 (isPrefixOf!0 (_2!4600 lt!155933) (_2!4600 lt!156371)))))

(assert (=> b!105805 (=> (not res!87151) (not e!69291))))

(declare-fun b!105806 () Bool)

(declare-fun res!87145 () Bool)

(assert (=> b!105806 (=> (not res!87145) (not e!69289))))

(declare-fun lt!156358 () (_ BitVec 64))

(declare-fun lt!156375 () (_ BitVec 64))

(assert (=> b!105806 (= res!87145 (= (bitIndex!0 (size!2227 (buf!2601 (_2!4600 lt!156354))) (currentByte!5100 (_2!4600 lt!156354)) (currentBit!5095 (_2!4600 lt!156354))) (bvadd lt!156375 lt!156358)))))

(assert (=> b!105806 (or (not (= (bvand lt!156375 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!156358 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!156375 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!156375 lt!156358) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!105806 (= lt!156358 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!105806 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!105806 (= lt!156375 (bitIndex!0 (size!2227 (buf!2601 (_2!4600 lt!155933))) (currentByte!5100 (_2!4600 lt!155933)) (currentBit!5095 (_2!4600 lt!155933))))))

(declare-fun b!105807 () Bool)

(assert (=> b!105807 (= lt!156396 (readBitPure!0 (readerFrom!0 (_2!4600 lt!156371) (currentBit!5095 (_2!4600 lt!155933)) (currentByte!5100 (_2!4600 lt!155933)))))))

(declare-fun res!87143 () Bool)

(declare-fun lt!156373 () Bool)

(assert (=> b!105807 (= res!87143 (and (= (_2!4601 lt!156396) lt!156373) (= (_1!4601 lt!156396) (_2!4600 lt!156371))))))

(assert (=> b!105807 (=> (not res!87143) (not e!69288))))

(assert (=> b!105807 (= e!69291 e!69288)))

(declare-fun b!105808 () Bool)

(assert (=> b!105808 (= e!69293 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))))))

(declare-fun b!105809 () Bool)

(declare-fun Unit!6482 () Unit!6476)

(assert (=> b!105809 (= e!69290 (tuple2!8687 Unit!6482 (_2!4600 lt!156374)))))

(assert (=> b!105809 (= lt!156373 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!105809 (= lt!156371 (appendBit!0 (_2!4600 lt!155933) lt!156373))))

(declare-fun res!87150 () Bool)

(assert (=> b!105809 (= res!87150 (= (size!2227 (buf!2601 (_2!4600 lt!155933))) (size!2227 (buf!2601 (_2!4600 lt!156371)))))))

(assert (=> b!105809 (=> (not res!87150) (not e!69291))))

(assert (=> b!105809 e!69291))

(declare-fun lt!156370 () tuple2!8686)

(assert (=> b!105809 (= lt!156370 lt!156371)))

(assert (=> b!105809 (= lt!156374 (appendNLeastSignificantBitsLoop!0 (_2!4600 lt!156370) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))))

(declare-fun lt!156368 () Unit!6476)

(assert (=> b!105809 (= lt!156368 (lemmaIsPrefixTransitive!0 (_2!4600 lt!155933) (_2!4600 lt!156370) (_2!4600 lt!156374)))))

(assert (=> b!105809 call!1326))

(declare-fun lt!156369 () Unit!6476)

(assert (=> b!105809 (= lt!156369 lt!156368)))

(assert (=> b!105809 (invariant!0 (currentBit!5095 (_2!4600 lt!155933)) (currentByte!5100 (_2!4600 lt!155933)) (size!2227 (buf!2601 (_2!4600 lt!156370))))))

(declare-fun lt!156398 () BitStream!3928)

(assert (=> b!105809 (= lt!156398 (BitStream!3929 (buf!2601 (_2!4600 lt!156370)) (currentByte!5100 (_2!4600 lt!155933)) (currentBit!5095 (_2!4600 lt!155933))))))

(assert (=> b!105809 (invariant!0 (currentBit!5095 lt!156398) (currentByte!5100 lt!156398) (size!2227 (buf!2601 (_2!4600 lt!156374))))))

(declare-fun lt!156367 () BitStream!3928)

(assert (=> b!105809 (= lt!156367 (BitStream!3929 (buf!2601 (_2!4600 lt!156374)) (currentByte!5100 lt!156398) (currentBit!5095 lt!156398)))))

(assert (=> b!105809 (= lt!156357 (readBitPure!0 lt!156398))))

(assert (=> b!105809 (= lt!156364 (readBitPure!0 lt!156367))))

(declare-fun lt!156359 () Unit!6476)

(assert (=> b!105809 (= lt!156359 (readBitPrefixLemma!0 lt!156398 (_2!4600 lt!156374)))))

(declare-fun res!87147 () Bool)

(assert (=> b!105809 (= res!87147 (= (bitIndex!0 (size!2227 (buf!2601 (_1!4601 lt!156357))) (currentByte!5100 (_1!4601 lt!156357)) (currentBit!5095 (_1!4601 lt!156357))) (bitIndex!0 (size!2227 (buf!2601 (_1!4601 lt!156364))) (currentByte!5100 (_1!4601 lt!156364)) (currentBit!5095 (_1!4601 lt!156364)))))))

(assert (=> b!105809 (=> (not res!87147) (not e!69287))))

(assert (=> b!105809 e!69287))

(declare-fun lt!156385 () Unit!6476)

(assert (=> b!105809 (= lt!156385 lt!156359)))

(declare-fun lt!156395 () tuple2!8690)

(assert (=> b!105809 (= lt!156395 (reader!0 (_2!4600 lt!155933) (_2!4600 lt!156374)))))

(declare-fun lt!156387 () tuple2!8690)

(assert (=> b!105809 (= lt!156387 (reader!0 (_2!4600 lt!156370) (_2!4600 lt!156374)))))

(declare-fun lt!156382 () tuple2!8688)

(assert (=> b!105809 (= lt!156382 (readBitPure!0 (_1!4602 lt!156395)))))

(assert (=> b!105809 (= (_2!4601 lt!156382) lt!156373)))

(declare-fun lt!156376 () Unit!6476)

(declare-fun Unit!6483 () Unit!6476)

(assert (=> b!105809 (= lt!156376 Unit!6483)))

(declare-fun lt!156362 () (_ BitVec 64))

(assert (=> b!105809 (= lt!156362 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(declare-fun lt!156355 () (_ BitVec 64))

(assert (=> b!105809 (= lt!156355 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(declare-fun lt!156384 () Unit!6476)

(assert (=> b!105809 (= lt!156384 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4600 lt!155933) (buf!2601 (_2!4600 lt!156374)) lt!156355))))

(assert (=> b!105809 (validate_offset_bits!1 ((_ sign_extend 32) (size!2227 (buf!2601 (_2!4600 lt!156374)))) ((_ sign_extend 32) (currentByte!5100 (_2!4600 lt!155933))) ((_ sign_extend 32) (currentBit!5095 (_2!4600 lt!155933))) lt!156355)))

(declare-fun lt!156361 () Unit!6476)

(assert (=> b!105809 (= lt!156361 lt!156384)))

(declare-fun lt!156380 () tuple2!8692)

(assert (=> b!105809 (= lt!156380 (readNLeastSignificantBitsLoopPure!0 (_1!4602 lt!156395) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!156362))))

(declare-fun lt!156381 () (_ BitVec 64))

(assert (=> b!105809 (= lt!156381 ((_ sign_extend 32) (bvsub (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b00000000000000000000000000000001)))))

(declare-fun lt!156360 () Unit!6476)

(assert (=> b!105809 (= lt!156360 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4600 lt!156370) (buf!2601 (_2!4600 lt!156374)) lt!156381))))

(assert (=> b!105809 (validate_offset_bits!1 ((_ sign_extend 32) (size!2227 (buf!2601 (_2!4600 lt!156374)))) ((_ sign_extend 32) (currentByte!5100 (_2!4600 lt!156370))) ((_ sign_extend 32) (currentBit!5095 (_2!4600 lt!156370))) lt!156381)))

(declare-fun lt!156377 () Unit!6476)

(assert (=> b!105809 (= lt!156377 lt!156360)))

(declare-fun lt!156383 () tuple2!8692)

(assert (=> b!105809 (= lt!156383 (readNLeastSignificantBitsLoopPure!0 (_1!4602 lt!156387) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!156362 (ite (_2!4601 lt!156382) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!156372 () tuple2!8692)

(assert (=> b!105809 (= lt!156372 (readNLeastSignificantBitsLoopPure!0 (_1!4602 lt!156395) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!156362))))

(declare-fun c!6519 () Bool)

(assert (=> b!105809 (= c!6519 (_2!4601 (readBitPure!0 (_1!4602 lt!156395))))))

(declare-fun lt!156391 () tuple2!8692)

(assert (=> b!105809 (= lt!156391 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4602 lt!156395) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!156362 e!69293)))))

(declare-fun lt!156378 () Unit!6476)

(assert (=> b!105809 (= lt!156378 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4602 lt!156395) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!156362))))

(assert (=> b!105809 (and (= (_2!4603 lt!156372) (_2!4603 lt!156391)) (= (_1!4603 lt!156372) (_1!4603 lt!156391)))))

(declare-fun lt!156365 () Unit!6476)

(assert (=> b!105809 (= lt!156365 lt!156378)))

(assert (=> b!105809 (= (_1!4602 lt!156395) (withMovedBitIndex!0 (_2!4602 lt!156395) (bvsub (bitIndex!0 (size!2227 (buf!2601 (_2!4600 lt!155933))) (currentByte!5100 (_2!4600 lt!155933)) (currentBit!5095 (_2!4600 lt!155933))) (bitIndex!0 (size!2227 (buf!2601 (_2!4600 lt!156374))) (currentByte!5100 (_2!4600 lt!156374)) (currentBit!5095 (_2!4600 lt!156374))))))))

(declare-fun lt!156386 () Unit!6476)

(declare-fun Unit!6484 () Unit!6476)

(assert (=> b!105809 (= lt!156386 Unit!6484)))

(assert (=> b!105809 (= (_1!4602 lt!156387) (withMovedBitIndex!0 (_2!4602 lt!156387) (bvsub (bitIndex!0 (size!2227 (buf!2601 (_2!4600 lt!156370))) (currentByte!5100 (_2!4600 lt!156370)) (currentBit!5095 (_2!4600 lt!156370))) (bitIndex!0 (size!2227 (buf!2601 (_2!4600 lt!156374))) (currentByte!5100 (_2!4600 lt!156374)) (currentBit!5095 (_2!4600 lt!156374))))))))

(declare-fun lt!156363 () Unit!6476)

(declare-fun Unit!6485 () Unit!6476)

(assert (=> b!105809 (= lt!156363 Unit!6485)))

(assert (=> b!105809 (= (bitIndex!0 (size!2227 (buf!2601 (_2!4600 lt!155933))) (currentByte!5100 (_2!4600 lt!155933)) (currentBit!5095 (_2!4600 lt!155933))) (bvsub (bitIndex!0 (size!2227 (buf!2601 (_2!4600 lt!156370))) (currentByte!5100 (_2!4600 lt!156370)) (currentBit!5095 (_2!4600 lt!156370))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!156392 () Unit!6476)

(declare-fun Unit!6486 () Unit!6476)

(assert (=> b!105809 (= lt!156392 Unit!6486)))

(assert (=> b!105809 (= (_2!4603 lt!156380) (_2!4603 lt!156383))))

(declare-fun lt!156388 () Unit!6476)

(declare-fun Unit!6487 () Unit!6476)

(assert (=> b!105809 (= lt!156388 Unit!6487)))

(assert (=> b!105809 (= (_1!4603 lt!156380) (_2!4602 lt!156395))))

(declare-fun b!105810 () Bool)

(assert (=> b!105810 (= e!69292 (validate_offset_bits!1 ((_ sign_extend 32) (size!2227 (buf!2601 (_2!4600 lt!155933)))) ((_ sign_extend 32) (currentByte!5100 (_2!4600 lt!155933))) ((_ sign_extend 32) (currentBit!5095 (_2!4600 lt!155933))) lt!156356))))

(assert (= (and d!33190 c!6520) b!105809))

(assert (= (and d!33190 (not c!6520)) b!105801))

(assert (= (and b!105809 res!87150) b!105802))

(assert (= (and b!105802 res!87146) b!105805))

(assert (= (and b!105805 res!87151) b!105807))

(assert (= (and b!105807 res!87143) b!105803))

(assert (= (and b!105809 res!87147) b!105799))

(assert (= (and b!105809 c!6519) b!105808))

(assert (= (and b!105809 (not c!6519)) b!105800))

(assert (= (or b!105809 b!105801) bm!1323))

(assert (= (and d!33190 res!87148) b!105806))

(assert (= (and b!105806 res!87145) b!105804))

(assert (= (and b!105804 res!87144) b!105798))

(assert (= (and b!105798 res!87149) b!105810))

(declare-fun m!155587 () Bool)

(assert (=> b!105809 m!155587))

(declare-fun m!155589 () Bool)

(assert (=> b!105809 m!155589))

(declare-fun m!155591 () Bool)

(assert (=> b!105809 m!155591))

(declare-fun m!155593 () Bool)

(assert (=> b!105809 m!155593))

(declare-fun m!155595 () Bool)

(assert (=> b!105809 m!155595))

(declare-fun m!155597 () Bool)

(assert (=> b!105809 m!155597))

(declare-fun m!155599 () Bool)

(assert (=> b!105809 m!155599))

(declare-fun m!155601 () Bool)

(assert (=> b!105809 m!155601))

(declare-fun m!155603 () Bool)

(assert (=> b!105809 m!155603))

(declare-fun m!155605 () Bool)

(assert (=> b!105809 m!155605))

(assert (=> b!105809 m!155303))

(declare-fun m!155607 () Bool)

(assert (=> b!105809 m!155607))

(declare-fun m!155609 () Bool)

(assert (=> b!105809 m!155609))

(declare-fun m!155611 () Bool)

(assert (=> b!105809 m!155611))

(declare-fun m!155613 () Bool)

(assert (=> b!105809 m!155613))

(declare-fun m!155615 () Bool)

(assert (=> b!105809 m!155615))

(declare-fun m!155617 () Bool)

(assert (=> b!105809 m!155617))

(declare-fun m!155619 () Bool)

(assert (=> b!105809 m!155619))

(declare-fun m!155621 () Bool)

(assert (=> b!105809 m!155621))

(declare-fun m!155623 () Bool)

(assert (=> b!105809 m!155623))

(declare-fun m!155625 () Bool)

(assert (=> b!105809 m!155625))

(declare-fun m!155627 () Bool)

(assert (=> b!105809 m!155627))

(assert (=> b!105809 m!155615))

(declare-fun m!155629 () Bool)

(assert (=> b!105809 m!155629))

(declare-fun m!155631 () Bool)

(assert (=> b!105809 m!155631))

(declare-fun m!155633 () Bool)

(assert (=> b!105809 m!155633))

(declare-fun m!155635 () Bool)

(assert (=> b!105809 m!155635))

(declare-fun m!155637 () Bool)

(assert (=> b!105809 m!155637))

(declare-fun m!155639 () Bool)

(assert (=> b!105809 m!155639))

(declare-fun m!155641 () Bool)

(assert (=> b!105801 m!155641))

(declare-fun m!155643 () Bool)

(assert (=> b!105802 m!155643))

(assert (=> b!105802 m!155303))

(declare-fun m!155645 () Bool)

(assert (=> b!105806 m!155645))

(assert (=> b!105806 m!155303))

(declare-fun m!155647 () Bool)

(assert (=> b!105810 m!155647))

(declare-fun m!155649 () Bool)

(assert (=> bm!1323 m!155649))

(declare-fun m!155651 () Bool)

(assert (=> b!105803 m!155651))

(assert (=> b!105803 m!155643))

(declare-fun m!155653 () Bool)

(assert (=> b!105798 m!155653))

(assert (=> b!105798 m!155607))

(declare-fun m!155655 () Bool)

(assert (=> b!105798 m!155655))

(declare-fun m!155657 () Bool)

(assert (=> b!105798 m!155657))

(declare-fun m!155659 () Bool)

(assert (=> b!105798 m!155659))

(declare-fun m!155661 () Bool)

(assert (=> b!105805 m!155661))

(declare-fun m!155663 () Bool)

(assert (=> b!105804 m!155663))

(declare-fun m!155665 () Bool)

(assert (=> b!105807 m!155665))

(assert (=> b!105807 m!155665))

(declare-fun m!155667 () Bool)

(assert (=> b!105807 m!155667))

(assert (=> b!105599 d!33190))

(declare-fun d!33232 () Bool)

(assert (=> d!33232 (validate_offset_bits!1 ((_ sign_extend 32) (size!2227 (buf!2601 (_2!4600 lt!155919)))) ((_ sign_extend 32) (currentByte!5100 thiss!1305)) ((_ sign_extend 32) (currentBit!5095 thiss!1305)) lt!155921)))

(declare-fun lt!156401 () Unit!6476)

(declare-fun choose!9 (BitStream!3928 array!4884 (_ BitVec 64) BitStream!3928) Unit!6476)

(assert (=> d!33232 (= lt!156401 (choose!9 thiss!1305 (buf!2601 (_2!4600 lt!155919)) lt!155921 (BitStream!3929 (buf!2601 (_2!4600 lt!155919)) (currentByte!5100 thiss!1305) (currentBit!5095 thiss!1305))))))

(assert (=> d!33232 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2601 (_2!4600 lt!155919)) lt!155921) lt!156401)))

(declare-fun bs!8117 () Bool)

(assert (= bs!8117 d!33232))

(assert (=> bs!8117 m!155261))

(declare-fun m!155669 () Bool)

(assert (=> bs!8117 m!155669))

(assert (=> b!105599 d!33232))

(declare-fun d!33234 () Bool)

(declare-fun e!69294 () Bool)

(assert (=> d!33234 e!69294))

(declare-fun res!87152 () Bool)

(assert (=> d!33234 (=> (not res!87152) (not e!69294))))

(declare-fun lt!156404 () (_ BitVec 64))

(declare-fun lt!156405 () (_ BitVec 64))

(declare-fun lt!156406 () (_ BitVec 64))

(assert (=> d!33234 (= res!87152 (= lt!156406 (bvsub lt!156404 lt!156405)))))

(assert (=> d!33234 (or (= (bvand lt!156404 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!156405 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!156404 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!156404 lt!156405) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!33234 (= lt!156405 (remainingBits!0 ((_ sign_extend 32) (size!2227 (buf!2601 (_1!4601 lt!155931)))) ((_ sign_extend 32) (currentByte!5100 (_1!4601 lt!155931))) ((_ sign_extend 32) (currentBit!5095 (_1!4601 lt!155931)))))))

(declare-fun lt!156407 () (_ BitVec 64))

(declare-fun lt!156403 () (_ BitVec 64))

(assert (=> d!33234 (= lt!156404 (bvmul lt!156407 lt!156403))))

(assert (=> d!33234 (or (= lt!156407 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!156403 (bvsdiv (bvmul lt!156407 lt!156403) lt!156407)))))

(assert (=> d!33234 (= lt!156403 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!33234 (= lt!156407 ((_ sign_extend 32) (size!2227 (buf!2601 (_1!4601 lt!155931)))))))

(assert (=> d!33234 (= lt!156406 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5100 (_1!4601 lt!155931))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5095 (_1!4601 lt!155931)))))))

(assert (=> d!33234 (invariant!0 (currentBit!5095 (_1!4601 lt!155931)) (currentByte!5100 (_1!4601 lt!155931)) (size!2227 (buf!2601 (_1!4601 lt!155931))))))

(assert (=> d!33234 (= (bitIndex!0 (size!2227 (buf!2601 (_1!4601 lt!155931))) (currentByte!5100 (_1!4601 lt!155931)) (currentBit!5095 (_1!4601 lt!155931))) lt!156406)))

(declare-fun b!105811 () Bool)

(declare-fun res!87153 () Bool)

(assert (=> b!105811 (=> (not res!87153) (not e!69294))))

(assert (=> b!105811 (= res!87153 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!156406))))

(declare-fun b!105812 () Bool)

(declare-fun lt!156402 () (_ BitVec 64))

(assert (=> b!105812 (= e!69294 (bvsle lt!156406 (bvmul lt!156402 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!105812 (or (= lt!156402 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!156402 #b0000000000000000000000000000000000000000000000000000000000001000) lt!156402)))))

(assert (=> b!105812 (= lt!156402 ((_ sign_extend 32) (size!2227 (buf!2601 (_1!4601 lt!155931)))))))

(assert (= (and d!33234 res!87152) b!105811))

(assert (= (and b!105811 res!87153) b!105812))

(declare-fun m!155671 () Bool)

(assert (=> d!33234 m!155671))

(declare-fun m!155673 () Bool)

(assert (=> d!33234 m!155673))

(assert (=> b!105599 d!33234))

(declare-fun d!33236 () Bool)

(declare-fun e!69314 () Bool)

(assert (=> d!33236 e!69314))

(declare-fun res!87180 () Bool)

(assert (=> d!33236 (=> (not res!87180) (not e!69314))))

(declare-fun lt!156541 () tuple2!8690)

(assert (=> d!33236 (= res!87180 (isPrefixOf!0 (_1!4602 lt!156541) (_2!4602 lt!156541)))))

(declare-fun lt!156557 () BitStream!3928)

(assert (=> d!33236 (= lt!156541 (tuple2!8691 lt!156557 (_2!4600 lt!155919)))))

(declare-fun lt!156548 () Unit!6476)

(declare-fun lt!156551 () Unit!6476)

(assert (=> d!33236 (= lt!156548 lt!156551)))

(assert (=> d!33236 (isPrefixOf!0 lt!156557 (_2!4600 lt!155919))))

(assert (=> d!33236 (= lt!156551 (lemmaIsPrefixTransitive!0 lt!156557 (_2!4600 lt!155919) (_2!4600 lt!155919)))))

(declare-fun lt!156546 () Unit!6476)

(declare-fun lt!156553 () Unit!6476)

(assert (=> d!33236 (= lt!156546 lt!156553)))

(assert (=> d!33236 (isPrefixOf!0 lt!156557 (_2!4600 lt!155919))))

(assert (=> d!33236 (= lt!156553 (lemmaIsPrefixTransitive!0 lt!156557 (_2!4600 lt!155933) (_2!4600 lt!155919)))))

(declare-fun lt!156547 () Unit!6476)

(declare-fun e!69313 () Unit!6476)

(assert (=> d!33236 (= lt!156547 e!69313)))

(declare-fun c!6527 () Bool)

(assert (=> d!33236 (= c!6527 (not (= (size!2227 (buf!2601 (_2!4600 lt!155933))) #b00000000000000000000000000000000)))))

(declare-fun lt!156539 () Unit!6476)

(declare-fun lt!156543 () Unit!6476)

(assert (=> d!33236 (= lt!156539 lt!156543)))

(assert (=> d!33236 (isPrefixOf!0 (_2!4600 lt!155919) (_2!4600 lt!155919))))

(assert (=> d!33236 (= lt!156543 (lemmaIsPrefixRefl!0 (_2!4600 lt!155919)))))

(declare-fun lt!156556 () Unit!6476)

(declare-fun lt!156550 () Unit!6476)

(assert (=> d!33236 (= lt!156556 lt!156550)))

(assert (=> d!33236 (= lt!156550 (lemmaIsPrefixRefl!0 (_2!4600 lt!155919)))))

(declare-fun lt!156554 () Unit!6476)

(declare-fun lt!156552 () Unit!6476)

(assert (=> d!33236 (= lt!156554 lt!156552)))

(assert (=> d!33236 (isPrefixOf!0 lt!156557 lt!156557)))

(assert (=> d!33236 (= lt!156552 (lemmaIsPrefixRefl!0 lt!156557))))

(declare-fun lt!156538 () Unit!6476)

(declare-fun lt!156540 () Unit!6476)

(assert (=> d!33236 (= lt!156538 lt!156540)))

(assert (=> d!33236 (isPrefixOf!0 (_2!4600 lt!155933) (_2!4600 lt!155933))))

(assert (=> d!33236 (= lt!156540 (lemmaIsPrefixRefl!0 (_2!4600 lt!155933)))))

(assert (=> d!33236 (= lt!156557 (BitStream!3929 (buf!2601 (_2!4600 lt!155919)) (currentByte!5100 (_2!4600 lt!155933)) (currentBit!5095 (_2!4600 lt!155933))))))

(assert (=> d!33236 (isPrefixOf!0 (_2!4600 lt!155933) (_2!4600 lt!155919))))

(assert (=> d!33236 (= (reader!0 (_2!4600 lt!155933) (_2!4600 lt!155919)) lt!156541)))

(declare-fun b!105849 () Bool)

(declare-fun lt!156544 () Unit!6476)

(assert (=> b!105849 (= e!69313 lt!156544)))

(declare-fun lt!156549 () (_ BitVec 64))

(assert (=> b!105849 (= lt!156549 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!156545 () (_ BitVec 64))

(assert (=> b!105849 (= lt!156545 (bitIndex!0 (size!2227 (buf!2601 (_2!4600 lt!155933))) (currentByte!5100 (_2!4600 lt!155933)) (currentBit!5095 (_2!4600 lt!155933))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!4884 array!4884 (_ BitVec 64) (_ BitVec 64)) Unit!6476)

(assert (=> b!105849 (= lt!156544 (arrayBitRangesEqSymmetric!0 (buf!2601 (_2!4600 lt!155933)) (buf!2601 (_2!4600 lt!155919)) lt!156549 lt!156545))))

(assert (=> b!105849 (arrayBitRangesEq!0 (buf!2601 (_2!4600 lt!155919)) (buf!2601 (_2!4600 lt!155933)) lt!156549 lt!156545)))

(declare-fun b!105850 () Bool)

(declare-fun Unit!6488 () Unit!6476)

(assert (=> b!105850 (= e!69313 Unit!6488)))

(declare-fun b!105851 () Bool)

(declare-fun res!87179 () Bool)

(assert (=> b!105851 (=> (not res!87179) (not e!69314))))

(assert (=> b!105851 (= res!87179 (isPrefixOf!0 (_1!4602 lt!156541) (_2!4600 lt!155933)))))

(declare-fun b!105852 () Bool)

(declare-fun lt!156555 () (_ BitVec 64))

(declare-fun lt!156542 () (_ BitVec 64))

(assert (=> b!105852 (= e!69314 (= (_1!4602 lt!156541) (withMovedBitIndex!0 (_2!4602 lt!156541) (bvsub lt!156542 lt!156555))))))

(assert (=> b!105852 (or (= (bvand lt!156542 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!156555 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!156542 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!156542 lt!156555) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!105852 (= lt!156555 (bitIndex!0 (size!2227 (buf!2601 (_2!4600 lt!155919))) (currentByte!5100 (_2!4600 lt!155919)) (currentBit!5095 (_2!4600 lt!155919))))))

(assert (=> b!105852 (= lt!156542 (bitIndex!0 (size!2227 (buf!2601 (_2!4600 lt!155933))) (currentByte!5100 (_2!4600 lt!155933)) (currentBit!5095 (_2!4600 lt!155933))))))

(declare-fun b!105853 () Bool)

(declare-fun res!87178 () Bool)

(assert (=> b!105853 (=> (not res!87178) (not e!69314))))

(assert (=> b!105853 (= res!87178 (isPrefixOf!0 (_2!4602 lt!156541) (_2!4600 lt!155919)))))

(assert (= (and d!33236 c!6527) b!105849))

(assert (= (and d!33236 (not c!6527)) b!105850))

(assert (= (and d!33236 res!87180) b!105851))

(assert (= (and b!105851 res!87179) b!105853))

(assert (= (and b!105853 res!87178) b!105852))

(declare-fun m!155675 () Bool)

(assert (=> b!105853 m!155675))

(declare-fun m!155677 () Bool)

(assert (=> b!105852 m!155677))

(assert (=> b!105852 m!155285))

(assert (=> b!105852 m!155303))

(declare-fun m!155679 () Bool)

(assert (=> d!33236 m!155679))

(declare-fun m!155681 () Bool)

(assert (=> d!33236 m!155681))

(declare-fun m!155683 () Bool)

(assert (=> d!33236 m!155683))

(declare-fun m!155685 () Bool)

(assert (=> d!33236 m!155685))

(declare-fun m!155687 () Bool)

(assert (=> d!33236 m!155687))

(declare-fun m!155689 () Bool)

(assert (=> d!33236 m!155689))

(declare-fun m!155691 () Bool)

(assert (=> d!33236 m!155691))

(declare-fun m!155693 () Bool)

(assert (=> d!33236 m!155693))

(declare-fun m!155695 () Bool)

(assert (=> d!33236 m!155695))

(declare-fun m!155697 () Bool)

(assert (=> d!33236 m!155697))

(declare-fun m!155699 () Bool)

(assert (=> d!33236 m!155699))

(declare-fun m!155701 () Bool)

(assert (=> b!105851 m!155701))

(assert (=> b!105849 m!155303))

(declare-fun m!155703 () Bool)

(assert (=> b!105849 m!155703))

(declare-fun m!155705 () Bool)

(assert (=> b!105849 m!155705))

(assert (=> b!105599 d!33236))

(declare-fun d!33238 () Bool)

(declare-fun e!69316 () Bool)

(assert (=> d!33238 e!69316))

(declare-fun res!87183 () Bool)

(assert (=> d!33238 (=> (not res!87183) (not e!69316))))

(declare-fun lt!156561 () tuple2!8690)

(assert (=> d!33238 (= res!87183 (isPrefixOf!0 (_1!4602 lt!156561) (_2!4602 lt!156561)))))

(declare-fun lt!156577 () BitStream!3928)

(assert (=> d!33238 (= lt!156561 (tuple2!8691 lt!156577 (_2!4600 lt!155919)))))

(declare-fun lt!156568 () Unit!6476)

(declare-fun lt!156571 () Unit!6476)

(assert (=> d!33238 (= lt!156568 lt!156571)))

(assert (=> d!33238 (isPrefixOf!0 lt!156577 (_2!4600 lt!155919))))

(assert (=> d!33238 (= lt!156571 (lemmaIsPrefixTransitive!0 lt!156577 (_2!4600 lt!155919) (_2!4600 lt!155919)))))

(declare-fun lt!156566 () Unit!6476)

(declare-fun lt!156573 () Unit!6476)

(assert (=> d!33238 (= lt!156566 lt!156573)))

(assert (=> d!33238 (isPrefixOf!0 lt!156577 (_2!4600 lt!155919))))

(assert (=> d!33238 (= lt!156573 (lemmaIsPrefixTransitive!0 lt!156577 thiss!1305 (_2!4600 lt!155919)))))

(declare-fun lt!156567 () Unit!6476)

(declare-fun e!69315 () Unit!6476)

(assert (=> d!33238 (= lt!156567 e!69315)))

(declare-fun c!6528 () Bool)

(assert (=> d!33238 (= c!6528 (not (= (size!2227 (buf!2601 thiss!1305)) #b00000000000000000000000000000000)))))

(declare-fun lt!156559 () Unit!6476)

(declare-fun lt!156563 () Unit!6476)

(assert (=> d!33238 (= lt!156559 lt!156563)))

(assert (=> d!33238 (isPrefixOf!0 (_2!4600 lt!155919) (_2!4600 lt!155919))))

(assert (=> d!33238 (= lt!156563 (lemmaIsPrefixRefl!0 (_2!4600 lt!155919)))))

(declare-fun lt!156576 () Unit!6476)

(declare-fun lt!156570 () Unit!6476)

(assert (=> d!33238 (= lt!156576 lt!156570)))

(assert (=> d!33238 (= lt!156570 (lemmaIsPrefixRefl!0 (_2!4600 lt!155919)))))

(declare-fun lt!156574 () Unit!6476)

(declare-fun lt!156572 () Unit!6476)

(assert (=> d!33238 (= lt!156574 lt!156572)))

(assert (=> d!33238 (isPrefixOf!0 lt!156577 lt!156577)))

(assert (=> d!33238 (= lt!156572 (lemmaIsPrefixRefl!0 lt!156577))))

(declare-fun lt!156558 () Unit!6476)

(declare-fun lt!156560 () Unit!6476)

(assert (=> d!33238 (= lt!156558 lt!156560)))

(assert (=> d!33238 (isPrefixOf!0 thiss!1305 thiss!1305)))

(assert (=> d!33238 (= lt!156560 (lemmaIsPrefixRefl!0 thiss!1305))))

(assert (=> d!33238 (= lt!156577 (BitStream!3929 (buf!2601 (_2!4600 lt!155919)) (currentByte!5100 thiss!1305) (currentBit!5095 thiss!1305)))))

(assert (=> d!33238 (isPrefixOf!0 thiss!1305 (_2!4600 lt!155919))))

(assert (=> d!33238 (= (reader!0 thiss!1305 (_2!4600 lt!155919)) lt!156561)))

(declare-fun b!105854 () Bool)

(declare-fun lt!156564 () Unit!6476)

(assert (=> b!105854 (= e!69315 lt!156564)))

(declare-fun lt!156569 () (_ BitVec 64))

(assert (=> b!105854 (= lt!156569 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!156565 () (_ BitVec 64))

(assert (=> b!105854 (= lt!156565 (bitIndex!0 (size!2227 (buf!2601 thiss!1305)) (currentByte!5100 thiss!1305) (currentBit!5095 thiss!1305)))))

(assert (=> b!105854 (= lt!156564 (arrayBitRangesEqSymmetric!0 (buf!2601 thiss!1305) (buf!2601 (_2!4600 lt!155919)) lt!156569 lt!156565))))

(assert (=> b!105854 (arrayBitRangesEq!0 (buf!2601 (_2!4600 lt!155919)) (buf!2601 thiss!1305) lt!156569 lt!156565)))

(declare-fun b!105855 () Bool)

(declare-fun Unit!6489 () Unit!6476)

(assert (=> b!105855 (= e!69315 Unit!6489)))

(declare-fun b!105856 () Bool)

(declare-fun res!87182 () Bool)

(assert (=> b!105856 (=> (not res!87182) (not e!69316))))

(assert (=> b!105856 (= res!87182 (isPrefixOf!0 (_1!4602 lt!156561) thiss!1305))))

(declare-fun b!105857 () Bool)

(declare-fun lt!156562 () (_ BitVec 64))

(declare-fun lt!156575 () (_ BitVec 64))

(assert (=> b!105857 (= e!69316 (= (_1!4602 lt!156561) (withMovedBitIndex!0 (_2!4602 lt!156561) (bvsub lt!156562 lt!156575))))))

(assert (=> b!105857 (or (= (bvand lt!156562 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!156575 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!156562 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!156562 lt!156575) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!105857 (= lt!156575 (bitIndex!0 (size!2227 (buf!2601 (_2!4600 lt!155919))) (currentByte!5100 (_2!4600 lt!155919)) (currentBit!5095 (_2!4600 lt!155919))))))

(assert (=> b!105857 (= lt!156562 (bitIndex!0 (size!2227 (buf!2601 thiss!1305)) (currentByte!5100 thiss!1305) (currentBit!5095 thiss!1305)))))

(declare-fun b!105858 () Bool)

(declare-fun res!87181 () Bool)

(assert (=> b!105858 (=> (not res!87181) (not e!69316))))

(assert (=> b!105858 (= res!87181 (isPrefixOf!0 (_2!4602 lt!156561) (_2!4600 lt!155919)))))

(assert (= (and d!33238 c!6528) b!105854))

(assert (= (and d!33238 (not c!6528)) b!105855))

(assert (= (and d!33238 res!87183) b!105856))

(assert (= (and b!105856 res!87182) b!105858))

(assert (= (and b!105858 res!87181) b!105857))

(declare-fun m!155707 () Bool)

(assert (=> b!105858 m!155707))

(declare-fun m!155709 () Bool)

(assert (=> b!105857 m!155709))

(assert (=> b!105857 m!155285))

(assert (=> b!105857 m!155283))

(declare-fun m!155711 () Bool)

(assert (=> d!33238 m!155711))

(assert (=> d!33238 m!155681))

(declare-fun m!155713 () Bool)

(assert (=> d!33238 m!155713))

(declare-fun m!155715 () Bool)

(assert (=> d!33238 m!155715))

(assert (=> d!33238 m!155687))

(declare-fun m!155717 () Bool)

(assert (=> d!33238 m!155717))

(declare-fun m!155719 () Bool)

(assert (=> d!33238 m!155719))

(declare-fun m!155721 () Bool)

(assert (=> d!33238 m!155721))

(declare-fun m!155723 () Bool)

(assert (=> d!33238 m!155723))

(declare-fun m!155725 () Bool)

(assert (=> d!33238 m!155725))

(assert (=> d!33238 m!155273))

(declare-fun m!155727 () Bool)

(assert (=> b!105856 m!155727))

(assert (=> b!105854 m!155283))

(declare-fun m!155729 () Bool)

(assert (=> b!105854 m!155729))

(declare-fun m!155731 () Bool)

(assert (=> b!105854 m!155731))

(assert (=> b!105599 d!33238))

(declare-fun d!33240 () Bool)

(assert (=> d!33240 (validate_offset_bits!1 ((_ sign_extend 32) (size!2227 (buf!2601 (_2!4600 lt!155919)))) ((_ sign_extend 32) (currentByte!5100 (_2!4600 lt!155933))) ((_ sign_extend 32) (currentBit!5095 (_2!4600 lt!155933))) lt!155932)))

(declare-fun lt!156623 () Unit!6476)

(assert (=> d!33240 (= lt!156623 (choose!9 (_2!4600 lt!155933) (buf!2601 (_2!4600 lt!155919)) lt!155932 (BitStream!3929 (buf!2601 (_2!4600 lt!155919)) (currentByte!5100 (_2!4600 lt!155933)) (currentBit!5095 (_2!4600 lt!155933)))))))

(assert (=> d!33240 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4600 lt!155933) (buf!2601 (_2!4600 lt!155919)) lt!155932) lt!156623)))

(declare-fun bs!8118 () Bool)

(assert (= bs!8118 d!33240))

(assert (=> bs!8118 m!155271))

(declare-fun m!155733 () Bool)

(assert (=> bs!8118 m!155733))

(assert (=> b!105599 d!33240))

(declare-fun d!33242 () Bool)

(declare-fun lt!156624 () tuple2!8712)

(assert (=> d!33242 (= lt!156624 (readBit!0 (readerFrom!0 (_2!4600 lt!155933) (currentBit!5095 thiss!1305) (currentByte!5100 thiss!1305))))))

(assert (=> d!33242 (= (readBitPure!0 (readerFrom!0 (_2!4600 lt!155933) (currentBit!5095 thiss!1305) (currentByte!5100 thiss!1305))) (tuple2!8689 (_2!4613 lt!156624) (_1!4613 lt!156624)))))

(declare-fun bs!8119 () Bool)

(assert (= bs!8119 d!33242))

(assert (=> bs!8119 m!155241))

(declare-fun m!155735 () Bool)

(assert (=> bs!8119 m!155735))

(assert (=> b!105598 d!33242))

(declare-fun d!33244 () Bool)

(declare-fun e!69326 () Bool)

(assert (=> d!33244 e!69326))

(declare-fun res!87196 () Bool)

(assert (=> d!33244 (=> (not res!87196) (not e!69326))))

(assert (=> d!33244 (= res!87196 (invariant!0 (currentBit!5095 (_2!4600 lt!155933)) (currentByte!5100 (_2!4600 lt!155933)) (size!2227 (buf!2601 (_2!4600 lt!155933)))))))

(assert (=> d!33244 (= (readerFrom!0 (_2!4600 lt!155933) (currentBit!5095 thiss!1305) (currentByte!5100 thiss!1305)) (BitStream!3929 (buf!2601 (_2!4600 lt!155933)) (currentByte!5100 thiss!1305) (currentBit!5095 thiss!1305)))))

(declare-fun b!105874 () Bool)

(assert (=> b!105874 (= e!69326 (invariant!0 (currentBit!5095 thiss!1305) (currentByte!5100 thiss!1305) (size!2227 (buf!2601 (_2!4600 lt!155933)))))))

(assert (= (and d!33244 res!87196) b!105874))

(assert (=> d!33244 m!155293))

(assert (=> b!105874 m!155233))

(assert (=> b!105598 d!33244))

(declare-fun d!33246 () Bool)

(declare-fun e!69327 () Bool)

(assert (=> d!33246 e!69327))

(declare-fun res!87197 () Bool)

(assert (=> d!33246 (=> (not res!87197) (not e!69327))))

(declare-fun lt!156626 () (_ BitVec 64))

(declare-fun lt!156625 () BitStream!3928)

(assert (=> d!33246 (= res!87197 (= (bvadd lt!156626 (bvsub (bitIndex!0 (size!2227 (buf!2601 thiss!1305)) (currentByte!5100 thiss!1305) (currentBit!5095 thiss!1305)) (bitIndex!0 (size!2227 (buf!2601 (_2!4600 lt!155919))) (currentByte!5100 (_2!4600 lt!155919)) (currentBit!5095 (_2!4600 lt!155919))))) (bitIndex!0 (size!2227 (buf!2601 lt!156625)) (currentByte!5100 lt!156625) (currentBit!5095 lt!156625))))))

(assert (=> d!33246 (or (not (= (bvand lt!156626 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bitIndex!0 (size!2227 (buf!2601 thiss!1305)) (currentByte!5100 thiss!1305) (currentBit!5095 thiss!1305)) (bitIndex!0 (size!2227 (buf!2601 (_2!4600 lt!155919))) (currentByte!5100 (_2!4600 lt!155919)) (currentBit!5095 (_2!4600 lt!155919)))) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!156626 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!156626 (bvsub (bitIndex!0 (size!2227 (buf!2601 thiss!1305)) (currentByte!5100 thiss!1305) (currentBit!5095 thiss!1305)) (bitIndex!0 (size!2227 (buf!2601 (_2!4600 lt!155919))) (currentByte!5100 (_2!4600 lt!155919)) (currentBit!5095 (_2!4600 lt!155919))))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!33246 (= lt!156626 (bitIndex!0 (size!2227 (buf!2601 (_2!4602 lt!155918))) (currentByte!5100 (_2!4602 lt!155918)) (currentBit!5095 (_2!4602 lt!155918))))))

(assert (=> d!33246 (= lt!156625 (_2!4600 (moveBitIndex!0 (_2!4602 lt!155918) (bvsub (bitIndex!0 (size!2227 (buf!2601 thiss!1305)) (currentByte!5100 thiss!1305) (currentBit!5095 thiss!1305)) (bitIndex!0 (size!2227 (buf!2601 (_2!4600 lt!155919))) (currentByte!5100 (_2!4600 lt!155919)) (currentBit!5095 (_2!4600 lt!155919)))))))))

(assert (=> d!33246 (moveBitIndexPrecond!0 (_2!4602 lt!155918) (bvsub (bitIndex!0 (size!2227 (buf!2601 thiss!1305)) (currentByte!5100 thiss!1305) (currentBit!5095 thiss!1305)) (bitIndex!0 (size!2227 (buf!2601 (_2!4600 lt!155919))) (currentByte!5100 (_2!4600 lt!155919)) (currentBit!5095 (_2!4600 lt!155919)))))))

(assert (=> d!33246 (= (withMovedBitIndex!0 (_2!4602 lt!155918) (bvsub (bitIndex!0 (size!2227 (buf!2601 thiss!1305)) (currentByte!5100 thiss!1305) (currentBit!5095 thiss!1305)) (bitIndex!0 (size!2227 (buf!2601 (_2!4600 lt!155919))) (currentByte!5100 (_2!4600 lt!155919)) (currentBit!5095 (_2!4600 lt!155919))))) lt!156625)))

(declare-fun b!105875 () Bool)

(assert (=> b!105875 (= e!69327 (= (size!2227 (buf!2601 (_2!4602 lt!155918))) (size!2227 (buf!2601 lt!156625))))))

(assert (= (and d!33246 res!87197) b!105875))

(declare-fun m!155771 () Bool)

(assert (=> d!33246 m!155771))

(declare-fun m!155775 () Bool)

(assert (=> d!33246 m!155775))

(declare-fun m!155779 () Bool)

(assert (=> d!33246 m!155779))

(declare-fun m!155781 () Bool)

(assert (=> d!33246 m!155781))

(assert (=> b!105611 d!33246))

(assert (=> b!105611 d!33140))

(declare-fun d!33248 () Bool)

(declare-fun e!69328 () Bool)

(assert (=> d!33248 e!69328))

(declare-fun res!87198 () Bool)

(assert (=> d!33248 (=> (not res!87198) (not e!69328))))

(declare-fun lt!156630 () (_ BitVec 64))

(declare-fun lt!156629 () (_ BitVec 64))

(declare-fun lt!156631 () (_ BitVec 64))

(assert (=> d!33248 (= res!87198 (= lt!156631 (bvsub lt!156629 lt!156630)))))

(assert (=> d!33248 (or (= (bvand lt!156629 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!156630 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!156629 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!156629 lt!156630) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!33248 (= lt!156630 (remainingBits!0 ((_ sign_extend 32) (size!2227 (buf!2601 (_2!4600 lt!155919)))) ((_ sign_extend 32) (currentByte!5100 (_2!4600 lt!155919))) ((_ sign_extend 32) (currentBit!5095 (_2!4600 lt!155919)))))))

(declare-fun lt!156632 () (_ BitVec 64))

(declare-fun lt!156628 () (_ BitVec 64))

(assert (=> d!33248 (= lt!156629 (bvmul lt!156632 lt!156628))))

(assert (=> d!33248 (or (= lt!156632 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!156628 (bvsdiv (bvmul lt!156632 lt!156628) lt!156632)))))

(assert (=> d!33248 (= lt!156628 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!33248 (= lt!156632 ((_ sign_extend 32) (size!2227 (buf!2601 (_2!4600 lt!155919)))))))

(assert (=> d!33248 (= lt!156631 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5100 (_2!4600 lt!155919))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5095 (_2!4600 lt!155919)))))))

(assert (=> d!33248 (invariant!0 (currentBit!5095 (_2!4600 lt!155919)) (currentByte!5100 (_2!4600 lt!155919)) (size!2227 (buf!2601 (_2!4600 lt!155919))))))

(assert (=> d!33248 (= (bitIndex!0 (size!2227 (buf!2601 (_2!4600 lt!155919))) (currentByte!5100 (_2!4600 lt!155919)) (currentBit!5095 (_2!4600 lt!155919))) lt!156631)))

(declare-fun b!105876 () Bool)

(declare-fun res!87199 () Bool)

(assert (=> b!105876 (=> (not res!87199) (not e!69328))))

(assert (=> b!105876 (= res!87199 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!156631))))

(declare-fun b!105877 () Bool)

(declare-fun lt!156627 () (_ BitVec 64))

(assert (=> b!105877 (= e!69328 (bvsle lt!156631 (bvmul lt!156627 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!105877 (or (= lt!156627 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!156627 #b0000000000000000000000000000000000000000000000000000000000001000) lt!156627)))))

(assert (=> b!105877 (= lt!156627 ((_ sign_extend 32) (size!2227 (buf!2601 (_2!4600 lt!155919)))))))

(assert (= (and d!33248 res!87198) b!105876))

(assert (= (and b!105876 res!87199) b!105877))

(declare-fun m!155807 () Bool)

(assert (=> d!33248 m!155807))

(declare-fun m!155809 () Bool)

(assert (=> d!33248 m!155809))

(assert (=> b!105611 d!33248))

(declare-fun d!33250 () Bool)

(assert (=> d!33250 (= (onesLSBLong!0 nBits!396) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!396))))))

(assert (=> b!105610 d!33250))

(declare-fun d!33252 () Bool)

(assert (=> d!33252 (= (invariant!0 (currentBit!5095 thiss!1305) (currentByte!5100 thiss!1305) (size!2227 (buf!2601 (_2!4600 lt!155933)))) (and (bvsge (currentBit!5095 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5095 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5100 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5100 thiss!1305) (size!2227 (buf!2601 (_2!4600 lt!155933)))) (and (= (currentBit!5095 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5100 thiss!1305) (size!2227 (buf!2601 (_2!4600 lt!155933))))))))))

(assert (=> b!105601 d!33252))

(push 1)

(assert (not b!105728))

(assert (not b!105801))

(assert (not b!105810))

(assert (not b!105853))

(assert (not d!33188))

(assert (not d!33242))

(assert (not b!105849))

(assert (not d!33166))

(assert (not b!105874))

(assert (not b!105730))

(assert (not d!33140))

(assert (not d!33236))

(assert (not b!105804))

(assert (not b!105852))

(assert (not b!105809))

(assert (not b!105851))

(assert (not d!33162))

(assert (not d!33158))

(assert (not b!105802))

(assert (not d!33184))

(assert (not d!33168))

(assert (not b!105857))

(assert (not bm!1323))

(assert (not d!33144))

(assert (not d!33232))

(assert (not d!33246))

(assert (not b!105704))

(assert (not b!105805))

(assert (not d!33152))

(assert (not b!105856))

(assert (not b!105806))

(assert (not d!33234))

(assert (not d!33160))

(assert (not b!105807))

(assert (not d!33138))

(assert (not d!33150))

(assert (not b!105858))

(assert (not d!33146))

(assert (not d!33240))

(assert (not b!105854))

(assert (not d!33244))

(assert (not b!105702))

(assert (not d!33134))

(assert (not d!33186))

(assert (not b!105738))

(assert (not b!105803))

(assert (not b!105727))

(assert (not d!33154))

(assert (not b!105736))

(assert (not d!33178))

(assert (not d!33238))

(assert (not d!33182))

(assert (not d!33164))

(assert (not b!105729))

(assert (not b!105798))

(assert (not d!33248))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

