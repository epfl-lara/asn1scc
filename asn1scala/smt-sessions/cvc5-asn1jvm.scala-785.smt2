; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22620 () Bool)

(assert start!22620)

(declare-datatypes ((array!5183 0))(
  ( (array!5184 (arr!2946 (Array (_ BitVec 32) (_ BitVec 8))) (size!2353 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4180 0))(
  ( (BitStream!4181 (buf!2761 array!5183) (currentByte!5368 (_ BitVec 32)) (currentBit!5363 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!7027 0))(
  ( (Unit!7028) )
))
(declare-datatypes ((tuple2!9426 0))(
  ( (tuple2!9427 (_1!4975 Unit!7027) (_2!4975 BitStream!4180)) )
))
(declare-fun lt!173865 () tuple2!9426)

(declare-fun thiss!1305 () BitStream!4180)

(declare-fun b!114272 () Bool)

(declare-fun e!74932 () Bool)

(declare-fun lt!173863 () tuple2!9426)

(declare-fun arrayBitRangesEq!0 (array!5183 array!5183 (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!114272 (= e!74932 (arrayBitRangesEq!0 (buf!2761 (_2!4975 lt!173863)) (buf!2761 (_2!4975 lt!173865)) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!2353 (buf!2761 (_2!4975 lt!173863))) (currentByte!5368 thiss!1305) (currentBit!5363 thiss!1305)))))))

(declare-fun b!114274 () Bool)

(declare-fun res!94409 () Bool)

(declare-fun e!74935 () Bool)

(assert (=> b!114274 (=> (not res!94409) (not e!74935))))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!114274 (= res!94409 (validate_offset_bits!1 ((_ sign_extend 32) (size!2353 (buf!2761 thiss!1305))) ((_ sign_extend 32) (currentByte!5368 thiss!1305)) ((_ sign_extend 32) (currentBit!5363 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun b!114275 () Bool)

(declare-fun e!74937 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!114275 (= e!74937 (invariant!0 (currentBit!5363 thiss!1305) (currentByte!5368 thiss!1305) (size!2353 (buf!2761 (_2!4975 lt!173863)))))))

(declare-fun b!114276 () Bool)

(declare-fun e!74931 () Bool)

(declare-datatypes ((tuple2!9428 0))(
  ( (tuple2!9429 (_1!4976 BitStream!4180) (_2!4976 Bool)) )
))
(declare-fun lt!173867 () tuple2!9428)

(declare-fun lt!173866 () (_ BitVec 64))

(assert (=> b!114276 (= e!74931 (= (bitIndex!0 (size!2353 (buf!2761 (_1!4976 lt!173867))) (currentByte!5368 (_1!4976 lt!173867)) (currentBit!5363 (_1!4976 lt!173867))) lt!173866))))

(declare-fun b!114277 () Bool)

(declare-fun e!74933 () Bool)

(declare-fun array_inv!2155 (array!5183) Bool)

(assert (=> b!114277 (= e!74933 (array_inv!2155 (buf!2761 thiss!1305)))))

(declare-fun b!114278 () Bool)

(declare-fun res!94407 () Bool)

(assert (=> b!114278 (=> res!94407 e!74932)))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!114278 (= res!94407 (not (validate_offset_bit!0 ((_ sign_extend 32) (size!2353 (buf!2761 (_2!4975 lt!173863)))) ((_ sign_extend 32) (currentByte!5368 thiss!1305)) ((_ sign_extend 32) (currentBit!5363 thiss!1305)))))))

(declare-fun b!114279 () Bool)

(declare-fun res!94411 () Bool)

(declare-fun e!74936 () Bool)

(assert (=> b!114279 (=> (not res!94411) (not e!74936))))

(declare-fun isPrefixOf!0 (BitStream!4180 BitStream!4180) Bool)

(assert (=> b!114279 (= res!94411 (isPrefixOf!0 thiss!1305 (_2!4975 lt!173863)))))

(declare-fun b!114280 () Bool)

(declare-fun e!74934 () Bool)

(assert (=> b!114280 (= e!74934 e!74936)))

(declare-fun res!94413 () Bool)

(assert (=> b!114280 (=> (not res!94413) (not e!74936))))

(declare-fun lt!173862 () (_ BitVec 64))

(assert (=> b!114280 (= res!94413 (= lt!173866 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!173862)))))

(assert (=> b!114280 (= lt!173866 (bitIndex!0 (size!2353 (buf!2761 (_2!4975 lt!173863))) (currentByte!5368 (_2!4975 lt!173863)) (currentBit!5363 (_2!4975 lt!173863))))))

(assert (=> b!114280 (= lt!173862 (bitIndex!0 (size!2353 (buf!2761 thiss!1305)) (currentByte!5368 thiss!1305) (currentBit!5363 thiss!1305)))))

(declare-fun b!114281 () Bool)

(declare-fun res!94410 () Bool)

(assert (=> b!114281 (=> (not res!94410) (not e!74935))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!114281 (= res!94410 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!114282 () Bool)

(assert (=> b!114282 (= e!74936 e!74931)))

(declare-fun res!94414 () Bool)

(assert (=> b!114282 (=> (not res!94414) (not e!74931))))

(declare-fun lt!173864 () Bool)

(assert (=> b!114282 (= res!94414 (and (= (_2!4976 lt!173867) lt!173864) (= (_1!4976 lt!173867) (_2!4975 lt!173863))))))

(declare-fun readBitPure!0 (BitStream!4180) tuple2!9428)

(declare-fun readerFrom!0 (BitStream!4180 (_ BitVec 32) (_ BitVec 32)) BitStream!4180)

(assert (=> b!114282 (= lt!173867 (readBitPure!0 (readerFrom!0 (_2!4975 lt!173863) (currentBit!5363 thiss!1305) (currentByte!5368 thiss!1305))))))

(declare-fun b!114283 () Bool)

(assert (=> b!114283 (= e!74935 (not e!74932))))

(declare-fun res!94405 () Bool)

(assert (=> b!114283 (=> res!94405 e!74932)))

(assert (=> b!114283 (= res!94405 (not (= (size!2353 (buf!2761 (_2!4975 lt!173863))) (size!2353 (buf!2761 (_2!4975 lt!173865))))))))

(assert (=> b!114283 e!74937))

(declare-fun res!94406 () Bool)

(assert (=> b!114283 (=> (not res!94406) (not e!74937))))

(assert (=> b!114283 (= res!94406 (isPrefixOf!0 thiss!1305 (_2!4975 lt!173865)))))

(declare-fun lt!173861 () Unit!7027)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4180 BitStream!4180 BitStream!4180) Unit!7027)

(assert (=> b!114283 (= lt!173861 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4975 lt!173863) (_2!4975 lt!173865)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4180 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!9426)

(assert (=> b!114283 (= lt!173865 (appendNLeastSignificantBitsLoop!0 (_2!4975 lt!173863) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!114283 e!74934))

(declare-fun res!94415 () Bool)

(assert (=> b!114283 (=> (not res!94415) (not e!74934))))

(assert (=> b!114283 (= res!94415 (= (size!2353 (buf!2761 thiss!1305)) (size!2353 (buf!2761 (_2!4975 lt!173863)))))))

(declare-fun appendBit!0 (BitStream!4180 Bool) tuple2!9426)

(assert (=> b!114283 (= lt!173863 (appendBit!0 thiss!1305 lt!173864))))

(assert (=> b!114283 (= lt!173864 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!114273 () Bool)

(declare-fun res!94412 () Bool)

(assert (=> b!114273 (=> (not res!94412) (not e!74935))))

(assert (=> b!114273 (= res!94412 (bvslt i!615 nBits!396))))

(declare-fun res!94408 () Bool)

(assert (=> start!22620 (=> (not res!94408) (not e!74935))))

(assert (=> start!22620 (= res!94408 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!22620 e!74935))

(assert (=> start!22620 true))

(declare-fun inv!12 (BitStream!4180) Bool)

(assert (=> start!22620 (and (inv!12 thiss!1305) e!74933)))

(assert (= (and start!22620 res!94408) b!114274))

(assert (= (and b!114274 res!94409) b!114281))

(assert (= (and b!114281 res!94410) b!114273))

(assert (= (and b!114273 res!94412) b!114283))

(assert (= (and b!114283 res!94415) b!114280))

(assert (= (and b!114280 res!94413) b!114279))

(assert (= (and b!114279 res!94411) b!114282))

(assert (= (and b!114282 res!94414) b!114276))

(assert (= (and b!114283 res!94406) b!114275))

(assert (= (and b!114283 (not res!94405)) b!114278))

(assert (= (and b!114278 (not res!94407)) b!114272))

(assert (= start!22620 b!114277))

(declare-fun m!170647 () Bool)

(assert (=> b!114281 m!170647))

(declare-fun m!170649 () Bool)

(assert (=> b!114275 m!170649))

(declare-fun m!170651 () Bool)

(assert (=> b!114276 m!170651))

(declare-fun m!170653 () Bool)

(assert (=> b!114279 m!170653))

(declare-fun m!170655 () Bool)

(assert (=> b!114272 m!170655))

(declare-fun m!170657 () Bool)

(assert (=> b!114272 m!170657))

(declare-fun m!170659 () Bool)

(assert (=> b!114282 m!170659))

(assert (=> b!114282 m!170659))

(declare-fun m!170661 () Bool)

(assert (=> b!114282 m!170661))

(declare-fun m!170663 () Bool)

(assert (=> b!114278 m!170663))

(declare-fun m!170665 () Bool)

(assert (=> b!114280 m!170665))

(declare-fun m!170667 () Bool)

(assert (=> b!114280 m!170667))

(declare-fun m!170669 () Bool)

(assert (=> start!22620 m!170669))

(declare-fun m!170671 () Bool)

(assert (=> b!114274 m!170671))

(declare-fun m!170673 () Bool)

(assert (=> b!114283 m!170673))

(declare-fun m!170675 () Bool)

(assert (=> b!114283 m!170675))

(declare-fun m!170677 () Bool)

(assert (=> b!114283 m!170677))

(declare-fun m!170679 () Bool)

(assert (=> b!114283 m!170679))

(declare-fun m!170681 () Bool)

(assert (=> b!114277 m!170681))

(push 1)

(assert (not b!114274))

(assert (not b!114282))

(assert (not b!114281))

(assert (not b!114276))

(assert (not b!114277))

(assert (not start!22620))

(assert (not b!114275))

(assert (not b!114278))

(assert (not b!114283))

(assert (not b!114280))

(assert (not b!114279))

(assert (not b!114272))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!36692 () Bool)

(declare-fun res!94526 () Bool)

(declare-fun e!75021 () Bool)

(assert (=> d!36692 (=> (not res!94526) (not e!75021))))

(assert (=> d!36692 (= res!94526 (= (size!2353 (buf!2761 thiss!1305)) (size!2353 (buf!2761 (_2!4975 lt!173863)))))))

(assert (=> d!36692 (= (isPrefixOf!0 thiss!1305 (_2!4975 lt!173863)) e!75021)))

(declare-fun b!114404 () Bool)

(declare-fun res!94524 () Bool)

(assert (=> b!114404 (=> (not res!94524) (not e!75021))))

(assert (=> b!114404 (= res!94524 (bvsle (bitIndex!0 (size!2353 (buf!2761 thiss!1305)) (currentByte!5368 thiss!1305) (currentBit!5363 thiss!1305)) (bitIndex!0 (size!2353 (buf!2761 (_2!4975 lt!173863))) (currentByte!5368 (_2!4975 lt!173863)) (currentBit!5363 (_2!4975 lt!173863)))))))

(declare-fun b!114405 () Bool)

(declare-fun e!75020 () Bool)

(assert (=> b!114405 (= e!75021 e!75020)))

(declare-fun res!94525 () Bool)

(assert (=> b!114405 (=> res!94525 e!75020)))

(assert (=> b!114405 (= res!94525 (= (size!2353 (buf!2761 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!114406 () Bool)

(assert (=> b!114406 (= e!75020 (arrayBitRangesEq!0 (buf!2761 thiss!1305) (buf!2761 (_2!4975 lt!173863)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2353 (buf!2761 thiss!1305)) (currentByte!5368 thiss!1305) (currentBit!5363 thiss!1305))))))

(assert (= (and d!36692 res!94526) b!114404))

(assert (= (and b!114404 res!94524) b!114405))

(assert (= (and b!114405 (not res!94525)) b!114406))

(assert (=> b!114404 m!170667))

(assert (=> b!114404 m!170665))

(assert (=> b!114406 m!170667))

(assert (=> b!114406 m!170667))

(declare-fun m!170787 () Bool)

(assert (=> b!114406 m!170787))

(assert (=> b!114279 d!36692))

(declare-fun d!36700 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!36700 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!2353 (buf!2761 (_2!4975 lt!173863)))) ((_ sign_extend 32) (currentByte!5368 thiss!1305)) ((_ sign_extend 32) (currentBit!5363 thiss!1305))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2353 (buf!2761 (_2!4975 lt!173863)))) ((_ sign_extend 32) (currentByte!5368 thiss!1305)) ((_ sign_extend 32) (currentBit!5363 thiss!1305))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!8907 () Bool)

(assert (= bs!8907 d!36700))

(declare-fun m!170791 () Bool)

(assert (=> bs!8907 m!170791))

(assert (=> b!114278 d!36700))

(declare-fun d!36704 () Bool)

(assert (=> d!36704 (= (array_inv!2155 (buf!2761 thiss!1305)) (bvsge (size!2353 (buf!2761 thiss!1305)) #b00000000000000000000000000000000))))

(assert (=> b!114277 d!36704))

(declare-fun d!36706 () Bool)

(declare-fun e!75029 () Bool)

(assert (=> d!36706 e!75029))

(declare-fun res!94538 () Bool)

(assert (=> d!36706 (=> (not res!94538) (not e!75029))))

(declare-fun lt!173977 () (_ BitVec 64))

(declare-fun lt!173978 () (_ BitVec 64))

(declare-fun lt!173975 () (_ BitVec 64))

(assert (=> d!36706 (= res!94538 (= lt!173975 (bvsub lt!173977 lt!173978)))))

(assert (=> d!36706 (or (= (bvand lt!173977 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!173978 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!173977 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!173977 lt!173978) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!36706 (= lt!173978 (remainingBits!0 ((_ sign_extend 32) (size!2353 (buf!2761 (_1!4976 lt!173867)))) ((_ sign_extend 32) (currentByte!5368 (_1!4976 lt!173867))) ((_ sign_extend 32) (currentBit!5363 (_1!4976 lt!173867)))))))

(declare-fun lt!173976 () (_ BitVec 64))

(declare-fun lt!173974 () (_ BitVec 64))

(assert (=> d!36706 (= lt!173977 (bvmul lt!173976 lt!173974))))

(assert (=> d!36706 (or (= lt!173976 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!173974 (bvsdiv (bvmul lt!173976 lt!173974) lt!173976)))))

(assert (=> d!36706 (= lt!173974 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!36706 (= lt!173976 ((_ sign_extend 32) (size!2353 (buf!2761 (_1!4976 lt!173867)))))))

(assert (=> d!36706 (= lt!173975 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5368 (_1!4976 lt!173867))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5363 (_1!4976 lt!173867)))))))

(assert (=> d!36706 (invariant!0 (currentBit!5363 (_1!4976 lt!173867)) (currentByte!5368 (_1!4976 lt!173867)) (size!2353 (buf!2761 (_1!4976 lt!173867))))))

(assert (=> d!36706 (= (bitIndex!0 (size!2353 (buf!2761 (_1!4976 lt!173867))) (currentByte!5368 (_1!4976 lt!173867)) (currentBit!5363 (_1!4976 lt!173867))) lt!173975)))

(declare-fun b!114417 () Bool)

(declare-fun res!94539 () Bool)

(assert (=> b!114417 (=> (not res!94539) (not e!75029))))

(assert (=> b!114417 (= res!94539 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!173975))))

(declare-fun b!114418 () Bool)

(declare-fun lt!173973 () (_ BitVec 64))

(assert (=> b!114418 (= e!75029 (bvsle lt!173975 (bvmul lt!173973 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!114418 (or (= lt!173973 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!173973 #b0000000000000000000000000000000000000000000000000000000000001000) lt!173973)))))

(assert (=> b!114418 (= lt!173973 ((_ sign_extend 32) (size!2353 (buf!2761 (_1!4976 lt!173867)))))))

(assert (= (and d!36706 res!94538) b!114417))

(assert (= (and b!114417 res!94539) b!114418))

(declare-fun m!170799 () Bool)

(assert (=> d!36706 m!170799))

(declare-fun m!170801 () Bool)

(assert (=> d!36706 m!170801))

(assert (=> b!114276 d!36706))

(declare-fun d!36716 () Bool)

(assert (=> d!36716 (= (inv!12 thiss!1305) (invariant!0 (currentBit!5363 thiss!1305) (currentByte!5368 thiss!1305) (size!2353 (buf!2761 thiss!1305))))))

(declare-fun bs!8910 () Bool)

(assert (= bs!8910 d!36716))

(declare-fun m!170803 () Bool)

(assert (=> bs!8910 m!170803))

(assert (=> start!22620 d!36716))

(declare-fun d!36718 () Bool)

(assert (=> d!36718 (= (invariant!0 (currentBit!5363 thiss!1305) (currentByte!5368 thiss!1305) (size!2353 (buf!2761 (_2!4975 lt!173863)))) (and (bvsge (currentBit!5363 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5363 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5368 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5368 thiss!1305) (size!2353 (buf!2761 (_2!4975 lt!173863)))) (and (= (currentBit!5363 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5368 thiss!1305) (size!2353 (buf!2761 (_2!4975 lt!173863))))))))))

(assert (=> b!114275 d!36718))

(declare-fun d!36720 () Bool)

(assert (=> d!36720 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2353 (buf!2761 thiss!1305))) ((_ sign_extend 32) (currentByte!5368 thiss!1305)) ((_ sign_extend 32) (currentBit!5363 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2353 (buf!2761 thiss!1305))) ((_ sign_extend 32) (currentByte!5368 thiss!1305)) ((_ sign_extend 32) (currentBit!5363 thiss!1305))) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun bs!8911 () Bool)

(assert (= bs!8911 d!36720))

(declare-fun m!170805 () Bool)

(assert (=> bs!8911 m!170805))

(assert (=> b!114274 d!36720))

(declare-fun d!36722 () Bool)

(declare-fun res!94542 () Bool)

(declare-fun e!75031 () Bool)

(assert (=> d!36722 (=> (not res!94542) (not e!75031))))

(assert (=> d!36722 (= res!94542 (= (size!2353 (buf!2761 thiss!1305)) (size!2353 (buf!2761 (_2!4975 lt!173865)))))))

(assert (=> d!36722 (= (isPrefixOf!0 thiss!1305 (_2!4975 lt!173865)) e!75031)))

(declare-fun b!114419 () Bool)

(declare-fun res!94540 () Bool)

(assert (=> b!114419 (=> (not res!94540) (not e!75031))))

(assert (=> b!114419 (= res!94540 (bvsle (bitIndex!0 (size!2353 (buf!2761 thiss!1305)) (currentByte!5368 thiss!1305) (currentBit!5363 thiss!1305)) (bitIndex!0 (size!2353 (buf!2761 (_2!4975 lt!173865))) (currentByte!5368 (_2!4975 lt!173865)) (currentBit!5363 (_2!4975 lt!173865)))))))

(declare-fun b!114420 () Bool)

(declare-fun e!75030 () Bool)

(assert (=> b!114420 (= e!75031 e!75030)))

(declare-fun res!94541 () Bool)

(assert (=> b!114420 (=> res!94541 e!75030)))

(assert (=> b!114420 (= res!94541 (= (size!2353 (buf!2761 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!114421 () Bool)

(assert (=> b!114421 (= e!75030 (arrayBitRangesEq!0 (buf!2761 thiss!1305) (buf!2761 (_2!4975 lt!173865)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2353 (buf!2761 thiss!1305)) (currentByte!5368 thiss!1305) (currentBit!5363 thiss!1305))))))

(assert (= (and d!36722 res!94542) b!114419))

(assert (= (and b!114419 res!94540) b!114420))

(assert (= (and b!114420 (not res!94541)) b!114421))

(assert (=> b!114419 m!170667))

(declare-fun m!170807 () Bool)

(assert (=> b!114419 m!170807))

(assert (=> b!114421 m!170667))

(assert (=> b!114421 m!170667))

(declare-fun m!170809 () Bool)

(assert (=> b!114421 m!170809))

(assert (=> b!114283 d!36722))

(declare-fun d!36724 () Bool)

(assert (=> d!36724 (isPrefixOf!0 thiss!1305 (_2!4975 lt!173865))))

(declare-fun lt!173981 () Unit!7027)

(declare-fun choose!30 (BitStream!4180 BitStream!4180 BitStream!4180) Unit!7027)

(assert (=> d!36724 (= lt!173981 (choose!30 thiss!1305 (_2!4975 lt!173863) (_2!4975 lt!173865)))))

(assert (=> d!36724 (isPrefixOf!0 thiss!1305 (_2!4975 lt!173863))))

(assert (=> d!36724 (= (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4975 lt!173863) (_2!4975 lt!173865)) lt!173981)))

(declare-fun bs!8912 () Bool)

(assert (= bs!8912 d!36724))

(assert (=> bs!8912 m!170673))

(declare-fun m!170811 () Bool)

(assert (=> bs!8912 m!170811))

(assert (=> bs!8912 m!170653))

(assert (=> b!114283 d!36724))

(declare-fun b!114531 () Bool)

(declare-fun e!75102 () Bool)

(declare-fun lt!174259 () tuple2!9428)

(declare-fun lt!174271 () tuple2!9426)

(assert (=> b!114531 (= e!75102 (= (bitIndex!0 (size!2353 (buf!2761 (_1!4976 lt!174259))) (currentByte!5368 (_1!4976 lt!174259)) (currentBit!5363 (_1!4976 lt!174259))) (bitIndex!0 (size!2353 (buf!2761 (_2!4975 lt!174271))) (currentByte!5368 (_2!4975 lt!174271)) (currentBit!5363 (_2!4975 lt!174271)))))))

(declare-fun b!114532 () Bool)

(declare-fun res!94628 () Bool)

(declare-fun e!75106 () Bool)

(assert (=> b!114532 (=> (not res!94628) (not e!75106))))

(declare-fun lt!174289 () tuple2!9426)

(assert (=> b!114532 (= res!94628 (isPrefixOf!0 (_2!4975 lt!173863) (_2!4975 lt!174289)))))

(declare-fun b!114534 () Bool)

(declare-fun res!94630 () Bool)

(assert (=> b!114534 (= res!94630 (= (bitIndex!0 (size!2353 (buf!2761 (_2!4975 lt!174271))) (currentByte!5368 (_2!4975 lt!174271)) (currentBit!5363 (_2!4975 lt!174271))) (bvadd (bitIndex!0 (size!2353 (buf!2761 (_2!4975 lt!173863))) (currentByte!5368 (_2!4975 lt!173863)) (currentBit!5363 (_2!4975 lt!173863))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun e!75103 () Bool)

(assert (=> b!114534 (=> (not res!94630) (not e!75103))))

(declare-fun b!114535 () Bool)

(declare-fun e!75104 () Bool)

(declare-fun lt!174248 () (_ BitVec 64))

(assert (=> b!114535 (= e!75104 (validate_offset_bits!1 ((_ sign_extend 32) (size!2353 (buf!2761 (_2!4975 lt!173863)))) ((_ sign_extend 32) (currentByte!5368 (_2!4975 lt!173863))) ((_ sign_extend 32) (currentBit!5363 (_2!4975 lt!173863))) lt!174248))))

(declare-fun b!114536 () Bool)

(declare-fun e!75105 () tuple2!9426)

(declare-fun lt!174247 () tuple2!9426)

(declare-fun Unit!7035 () Unit!7027)

(assert (=> b!114536 (= e!75105 (tuple2!9427 Unit!7035 (_2!4975 lt!174247)))))

(declare-fun lt!174263 () Bool)

(assert (=> b!114536 (= lt!174263 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!114536 (= lt!174271 (appendBit!0 (_2!4975 lt!173863) lt!174263))))

(declare-fun res!94627 () Bool)

(assert (=> b!114536 (= res!94627 (= (size!2353 (buf!2761 (_2!4975 lt!173863))) (size!2353 (buf!2761 (_2!4975 lt!174271)))))))

(assert (=> b!114536 (=> (not res!94627) (not e!75103))))

(assert (=> b!114536 e!75103))

(declare-fun lt!174281 () tuple2!9426)

(assert (=> b!114536 (= lt!174281 lt!174271)))

(assert (=> b!114536 (= lt!174247 (appendNLeastSignificantBitsLoop!0 (_2!4975 lt!174281) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))))

(declare-fun lt!174278 () Unit!7027)

(assert (=> b!114536 (= lt!174278 (lemmaIsPrefixTransitive!0 (_2!4975 lt!173863) (_2!4975 lt!174281) (_2!4975 lt!174247)))))

(assert (=> b!114536 (isPrefixOf!0 (_2!4975 lt!173863) (_2!4975 lt!174247))))

(declare-fun lt!174256 () Unit!7027)

(assert (=> b!114536 (= lt!174256 lt!174278)))

(assert (=> b!114536 (invariant!0 (currentBit!5363 (_2!4975 lt!173863)) (currentByte!5368 (_2!4975 lt!173863)) (size!2353 (buf!2761 (_2!4975 lt!174281))))))

(declare-fun lt!174266 () BitStream!4180)

(assert (=> b!114536 (= lt!174266 (BitStream!4181 (buf!2761 (_2!4975 lt!174281)) (currentByte!5368 (_2!4975 lt!173863)) (currentBit!5363 (_2!4975 lt!173863))))))

(assert (=> b!114536 (invariant!0 (currentBit!5363 lt!174266) (currentByte!5368 lt!174266) (size!2353 (buf!2761 (_2!4975 lt!174247))))))

(declare-fun lt!174286 () BitStream!4180)

(assert (=> b!114536 (= lt!174286 (BitStream!4181 (buf!2761 (_2!4975 lt!174247)) (currentByte!5368 lt!174266) (currentBit!5363 lt!174266)))))

(declare-fun lt!174268 () tuple2!9428)

(assert (=> b!114536 (= lt!174268 (readBitPure!0 lt!174266))))

(declare-fun lt!174257 () tuple2!9428)

(assert (=> b!114536 (= lt!174257 (readBitPure!0 lt!174286))))

(declare-fun lt!174285 () Unit!7027)

(declare-fun readBitPrefixLemma!0 (BitStream!4180 BitStream!4180) Unit!7027)

(assert (=> b!114536 (= lt!174285 (readBitPrefixLemma!0 lt!174266 (_2!4975 lt!174247)))))

(declare-fun res!94632 () Bool)

(assert (=> b!114536 (= res!94632 (= (bitIndex!0 (size!2353 (buf!2761 (_1!4976 lt!174268))) (currentByte!5368 (_1!4976 lt!174268)) (currentBit!5363 (_1!4976 lt!174268))) (bitIndex!0 (size!2353 (buf!2761 (_1!4976 lt!174257))) (currentByte!5368 (_1!4976 lt!174257)) (currentBit!5363 (_1!4976 lt!174257)))))))

(declare-fun e!75100 () Bool)

(assert (=> b!114536 (=> (not res!94632) (not e!75100))))

(assert (=> b!114536 e!75100))

(declare-fun lt!174274 () Unit!7027)

(assert (=> b!114536 (= lt!174274 lt!174285)))

(declare-datatypes ((tuple2!9444 0))(
  ( (tuple2!9445 (_1!4985 BitStream!4180) (_2!4985 BitStream!4180)) )
))
(declare-fun lt!174258 () tuple2!9444)

(declare-fun reader!0 (BitStream!4180 BitStream!4180) tuple2!9444)

(assert (=> b!114536 (= lt!174258 (reader!0 (_2!4975 lt!173863) (_2!4975 lt!174247)))))

(declare-fun lt!174250 () tuple2!9444)

(assert (=> b!114536 (= lt!174250 (reader!0 (_2!4975 lt!174281) (_2!4975 lt!174247)))))

(declare-fun lt!174260 () tuple2!9428)

(assert (=> b!114536 (= lt!174260 (readBitPure!0 (_1!4985 lt!174258)))))

(assert (=> b!114536 (= (_2!4976 lt!174260) lt!174263)))

(declare-fun lt!174290 () Unit!7027)

(declare-fun Unit!7040 () Unit!7027)

(assert (=> b!114536 (= lt!174290 Unit!7040)))

(declare-fun lt!174287 () (_ BitVec 64))

(assert (=> b!114536 (= lt!174287 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(declare-fun lt!174269 () (_ BitVec 64))

(assert (=> b!114536 (= lt!174269 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(declare-fun lt!174261 () Unit!7027)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4180 array!5183 (_ BitVec 64)) Unit!7027)

(assert (=> b!114536 (= lt!174261 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4975 lt!173863) (buf!2761 (_2!4975 lt!174247)) lt!174269))))

(assert (=> b!114536 (validate_offset_bits!1 ((_ sign_extend 32) (size!2353 (buf!2761 (_2!4975 lt!174247)))) ((_ sign_extend 32) (currentByte!5368 (_2!4975 lt!173863))) ((_ sign_extend 32) (currentBit!5363 (_2!4975 lt!173863))) lt!174269)))

(declare-fun lt!174252 () Unit!7027)

(assert (=> b!114536 (= lt!174252 lt!174261)))

(declare-datatypes ((tuple2!9446 0))(
  ( (tuple2!9447 (_1!4986 BitStream!4180) (_2!4986 (_ BitVec 64))) )
))
(declare-fun lt!174255 () tuple2!9446)

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4180 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!9446)

(assert (=> b!114536 (= lt!174255 (readNLeastSignificantBitsLoopPure!0 (_1!4985 lt!174258) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!174287))))

(declare-fun lt!174275 () (_ BitVec 64))

(assert (=> b!114536 (= lt!174275 ((_ sign_extend 32) (bvsub (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b00000000000000000000000000000001)))))

(declare-fun lt!174277 () Unit!7027)

(assert (=> b!114536 (= lt!174277 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4975 lt!174281) (buf!2761 (_2!4975 lt!174247)) lt!174275))))

(assert (=> b!114536 (validate_offset_bits!1 ((_ sign_extend 32) (size!2353 (buf!2761 (_2!4975 lt!174247)))) ((_ sign_extend 32) (currentByte!5368 (_2!4975 lt!174281))) ((_ sign_extend 32) (currentBit!5363 (_2!4975 lt!174281))) lt!174275)))

(declare-fun lt!174279 () Unit!7027)

(assert (=> b!114536 (= lt!174279 lt!174277)))

(declare-fun lt!174265 () tuple2!9446)

(assert (=> b!114536 (= lt!174265 (readNLeastSignificantBitsLoopPure!0 (_1!4985 lt!174250) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!174287 (ite (_2!4976 lt!174260) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!174288 () tuple2!9446)

(assert (=> b!114536 (= lt!174288 (readNLeastSignificantBitsLoopPure!0 (_1!4985 lt!174258) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!174287))))

(declare-fun c!6943 () Bool)

(assert (=> b!114536 (= c!6943 (_2!4976 (readBitPure!0 (_1!4985 lt!174258))))))

(declare-fun e!75101 () (_ BitVec 64))

(declare-fun lt!174246 () tuple2!9446)

(declare-fun withMovedBitIndex!0 (BitStream!4180 (_ BitVec 64)) BitStream!4180)

(assert (=> b!114536 (= lt!174246 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4985 lt!174258) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!174287 e!75101)))))

(declare-fun lt!174267 () Unit!7027)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!4180 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!7027)

(assert (=> b!114536 (= lt!174267 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4985 lt!174258) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!174287))))

(assert (=> b!114536 (and (= (_2!4986 lt!174288) (_2!4986 lt!174246)) (= (_1!4986 lt!174288) (_1!4986 lt!174246)))))

(declare-fun lt!174270 () Unit!7027)

(assert (=> b!114536 (= lt!174270 lt!174267)))

(assert (=> b!114536 (= (_1!4985 lt!174258) (withMovedBitIndex!0 (_2!4985 lt!174258) (bvsub (bitIndex!0 (size!2353 (buf!2761 (_2!4975 lt!173863))) (currentByte!5368 (_2!4975 lt!173863)) (currentBit!5363 (_2!4975 lt!173863))) (bitIndex!0 (size!2353 (buf!2761 (_2!4975 lt!174247))) (currentByte!5368 (_2!4975 lt!174247)) (currentBit!5363 (_2!4975 lt!174247))))))))

(declare-fun lt!174284 () Unit!7027)

(declare-fun Unit!7041 () Unit!7027)

(assert (=> b!114536 (= lt!174284 Unit!7041)))

(assert (=> b!114536 (= (_1!4985 lt!174250) (withMovedBitIndex!0 (_2!4985 lt!174250) (bvsub (bitIndex!0 (size!2353 (buf!2761 (_2!4975 lt!174281))) (currentByte!5368 (_2!4975 lt!174281)) (currentBit!5363 (_2!4975 lt!174281))) (bitIndex!0 (size!2353 (buf!2761 (_2!4975 lt!174247))) (currentByte!5368 (_2!4975 lt!174247)) (currentBit!5363 (_2!4975 lt!174247))))))))

(declare-fun lt!174283 () Unit!7027)

(declare-fun Unit!7042 () Unit!7027)

(assert (=> b!114536 (= lt!174283 Unit!7042)))

(assert (=> b!114536 (= (bitIndex!0 (size!2353 (buf!2761 (_2!4975 lt!173863))) (currentByte!5368 (_2!4975 lt!173863)) (currentBit!5363 (_2!4975 lt!173863))) (bvsub (bitIndex!0 (size!2353 (buf!2761 (_2!4975 lt!174281))) (currentByte!5368 (_2!4975 lt!174281)) (currentBit!5363 (_2!4975 lt!174281))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!174262 () Unit!7027)

(declare-fun Unit!7043 () Unit!7027)

(assert (=> b!114536 (= lt!174262 Unit!7043)))

(assert (=> b!114536 (= (_2!4986 lt!174255) (_2!4986 lt!174265))))

(declare-fun lt!174249 () Unit!7027)

(declare-fun Unit!7044 () Unit!7027)

(assert (=> b!114536 (= lt!174249 Unit!7044)))

(assert (=> b!114536 (= (_1!4986 lt!174255) (_2!4985 lt!174258))))

(declare-fun b!114537 () Bool)

(assert (=> b!114537 (= lt!174259 (readBitPure!0 (readerFrom!0 (_2!4975 lt!174271) (currentBit!5363 (_2!4975 lt!173863)) (currentByte!5368 (_2!4975 lt!173863)))))))

(declare-fun res!94635 () Bool)

(assert (=> b!114537 (= res!94635 (and (= (_2!4976 lt!174259) lt!174263) (= (_1!4976 lt!174259) (_2!4975 lt!174271))))))

(assert (=> b!114537 (=> (not res!94635) (not e!75102))))

(assert (=> b!114537 (= e!75103 e!75102)))

(declare-fun b!114538 () Bool)

(assert (=> b!114538 (= e!75101 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!114539 () Bool)

(declare-fun res!94629 () Bool)

(assert (=> b!114539 (=> (not res!94629) (not e!75106))))

(declare-fun lt!174251 () (_ BitVec 64))

(declare-fun lt!174282 () (_ BitVec 64))

(assert (=> b!114539 (= res!94629 (= (bitIndex!0 (size!2353 (buf!2761 (_2!4975 lt!174289))) (currentByte!5368 (_2!4975 lt!174289)) (currentBit!5363 (_2!4975 lt!174289))) (bvadd lt!174282 lt!174251)))))

(assert (=> b!114539 (or (not (= (bvand lt!174282 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!174251 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!174282 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!174282 lt!174251) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!114539 (= lt!174251 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!114539 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!114539 (= lt!174282 (bitIndex!0 (size!2353 (buf!2761 (_2!4975 lt!173863))) (currentByte!5368 (_2!4975 lt!173863)) (currentBit!5363 (_2!4975 lt!173863))))))

(declare-fun c!6942 () Bool)

(declare-fun bm!1475 () Bool)

(declare-fun call!1478 () Bool)

(declare-fun lt!174264 () BitStream!4180)

(assert (=> bm!1475 (= call!1478 (isPrefixOf!0 (ite c!6942 (_2!4975 lt!173863) lt!174264) (ite c!6942 (_2!4975 lt!174271) lt!174264)))))

(declare-fun lt!174253 () tuple2!9444)

(declare-fun b!114540 () Bool)

(declare-fun lt!174272 () tuple2!9446)

(assert (=> b!114540 (= e!75106 (and (= (_2!4986 lt!174272) v!199) (= (_1!4986 lt!174272) (_2!4985 lt!174253))))))

(declare-fun lt!174280 () (_ BitVec 64))

(assert (=> b!114540 (= lt!174272 (readNLeastSignificantBitsLoopPure!0 (_1!4985 lt!174253) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!174280))))

(declare-fun lt!174276 () Unit!7027)

(declare-fun lt!174254 () Unit!7027)

(assert (=> b!114540 (= lt!174276 lt!174254)))

(assert (=> b!114540 (validate_offset_bits!1 ((_ sign_extend 32) (size!2353 (buf!2761 (_2!4975 lt!174289)))) ((_ sign_extend 32) (currentByte!5368 (_2!4975 lt!173863))) ((_ sign_extend 32) (currentBit!5363 (_2!4975 lt!173863))) lt!174248)))

(assert (=> b!114540 (= lt!174254 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4975 lt!173863) (buf!2761 (_2!4975 lt!174289)) lt!174248))))

(assert (=> b!114540 e!75104))

(declare-fun res!94631 () Bool)

(assert (=> b!114540 (=> (not res!94631) (not e!75104))))

(assert (=> b!114540 (= res!94631 (and (= (size!2353 (buf!2761 (_2!4975 lt!173863))) (size!2353 (buf!2761 (_2!4975 lt!174289)))) (bvsge lt!174248 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!114540 (= lt!174248 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!114540 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!114540 (= lt!174280 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(assert (=> b!114540 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!114540 (= lt!174253 (reader!0 (_2!4975 lt!173863) (_2!4975 lt!174289)))))

(declare-fun b!114541 () Bool)

(declare-fun res!94634 () Bool)

(assert (=> b!114541 (= res!94634 call!1478)))

(assert (=> b!114541 (=> (not res!94634) (not e!75103))))

(declare-fun b!114542 () Bool)

(declare-fun lt!174273 () Unit!7027)

(assert (=> b!114542 (= e!75105 (tuple2!9427 lt!174273 (_2!4975 lt!173863)))))

(assert (=> b!114542 (= lt!174264 (_2!4975 lt!173863))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4180) Unit!7027)

(assert (=> b!114542 (= lt!174273 (lemmaIsPrefixRefl!0 lt!174264))))

(assert (=> b!114542 call!1478))

(declare-fun b!114543 () Bool)

(assert (=> b!114543 (= e!75100 (= (_2!4976 lt!174268) (_2!4976 lt!174257)))))

(declare-fun d!36728 () Bool)

(assert (=> d!36728 e!75106))

(declare-fun res!94633 () Bool)

(assert (=> d!36728 (=> (not res!94633) (not e!75106))))

(assert (=> d!36728 (= res!94633 (= (size!2353 (buf!2761 (_2!4975 lt!173863))) (size!2353 (buf!2761 (_2!4975 lt!174289)))))))

(assert (=> d!36728 (= lt!174289 e!75105)))

(assert (=> d!36728 (= c!6942 (bvslt (bvadd #b00000000000000000000000000000001 i!615) nBits!396))))

(assert (=> d!36728 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)) (bvsle (bvadd #b00000000000000000000000000000001 i!615) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!36728 (= (appendNLeastSignificantBitsLoop!0 (_2!4975 lt!173863) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) lt!174289)))

(declare-fun b!114533 () Bool)

(assert (=> b!114533 (= e!75101 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))))))

(assert (= (and d!36728 c!6942) b!114536))

(assert (= (and d!36728 (not c!6942)) b!114542))

(assert (= (and b!114536 res!94627) b!114534))

(assert (= (and b!114534 res!94630) b!114541))

(assert (= (and b!114541 res!94634) b!114537))

(assert (= (and b!114537 res!94635) b!114531))

(assert (= (and b!114536 res!94632) b!114543))

(assert (= (and b!114536 c!6943) b!114533))

(assert (= (and b!114536 (not c!6943)) b!114538))

(assert (= (or b!114541 b!114542) bm!1475))

(assert (= (and d!36728 res!94633) b!114539))

(assert (= (and b!114539 res!94629) b!114532))

(assert (= (and b!114532 res!94628) b!114540))

(assert (= (and b!114540 res!94631) b!114535))

(declare-fun m!170933 () Bool)

(assert (=> b!114532 m!170933))

(declare-fun m!170935 () Bool)

(assert (=> b!114542 m!170935))

(declare-fun m!170937 () Bool)

(assert (=> b!114537 m!170937))

(assert (=> b!114537 m!170937))

(declare-fun m!170939 () Bool)

(assert (=> b!114537 m!170939))

(declare-fun m!170941 () Bool)

(assert (=> b!114539 m!170941))

(assert (=> b!114539 m!170665))

(declare-fun m!170943 () Bool)

(assert (=> b!114536 m!170943))

(declare-fun m!170945 () Bool)

(assert (=> b!114536 m!170945))

(declare-fun m!170947 () Bool)

(assert (=> b!114536 m!170947))

(declare-fun m!170949 () Bool)

(assert (=> b!114536 m!170949))

(declare-fun m!170951 () Bool)

(assert (=> b!114536 m!170951))

(declare-fun m!170953 () Bool)

(assert (=> b!114536 m!170953))

(declare-fun m!170955 () Bool)

(assert (=> b!114536 m!170955))

(declare-fun m!170957 () Bool)

(assert (=> b!114536 m!170957))

(declare-fun m!170959 () Bool)

(assert (=> b!114536 m!170959))

(declare-fun m!170961 () Bool)

(assert (=> b!114536 m!170961))

(declare-fun m!170963 () Bool)

(assert (=> b!114536 m!170963))

(declare-fun m!170965 () Bool)

(assert (=> b!114536 m!170965))

(declare-fun m!170967 () Bool)

(assert (=> b!114536 m!170967))

(declare-fun m!170969 () Bool)

(assert (=> b!114536 m!170969))

(declare-fun m!170971 () Bool)

(assert (=> b!114536 m!170971))

(assert (=> b!114536 m!170665))

(declare-fun m!170973 () Bool)

(assert (=> b!114536 m!170973))

(declare-fun m!170975 () Bool)

(assert (=> b!114536 m!170975))

(declare-fun m!170977 () Bool)

(assert (=> b!114536 m!170977))

(declare-fun m!170979 () Bool)

(assert (=> b!114536 m!170979))

(declare-fun m!170981 () Bool)

(assert (=> b!114536 m!170981))

(declare-fun m!170983 () Bool)

(assert (=> b!114536 m!170983))

(declare-fun m!170985 () Bool)

(assert (=> b!114536 m!170985))

(declare-fun m!170987 () Bool)

(assert (=> b!114536 m!170987))

(assert (=> b!114536 m!170983))

(declare-fun m!170989 () Bool)

(assert (=> b!114536 m!170989))

(declare-fun m!170991 () Bool)

(assert (=> b!114536 m!170991))

(declare-fun m!170993 () Bool)

(assert (=> b!114536 m!170993))

(declare-fun m!170995 () Bool)

(assert (=> b!114536 m!170995))

(declare-fun m!170997 () Bool)

(assert (=> b!114536 m!170997))

(declare-fun m!170999 () Bool)

(assert (=> bm!1475 m!170999))

(declare-fun m!171001 () Bool)

(assert (=> b!114531 m!171001))

(declare-fun m!171003 () Bool)

(assert (=> b!114531 m!171003))

(assert (=> b!114534 m!171003))

(assert (=> b!114534 m!170665))

(declare-fun m!171005 () Bool)

(assert (=> b!114540 m!171005))

(declare-fun m!171007 () Bool)

(assert (=> b!114540 m!171007))

(declare-fun m!171009 () Bool)

(assert (=> b!114540 m!171009))

(assert (=> b!114540 m!170977))

(declare-fun m!171011 () Bool)

(assert (=> b!114540 m!171011))

(declare-fun m!171013 () Bool)

(assert (=> b!114535 m!171013))

(assert (=> b!114283 d!36728))

(declare-fun b!114568 () Bool)

(declare-fun e!75117 () Bool)

(declare-fun e!75118 () Bool)

(assert (=> b!114568 (= e!75117 e!75118)))

(declare-fun res!94658 () Bool)

(assert (=> b!114568 (=> (not res!94658) (not e!75118))))

(declare-fun lt!174311 () tuple2!9428)

(declare-fun lt!174313 () tuple2!9426)

(assert (=> b!114568 (= res!94658 (and (= (_2!4976 lt!174311) lt!173864) (= (_1!4976 lt!174311) (_2!4975 lt!174313))))))

(assert (=> b!114568 (= lt!174311 (readBitPure!0 (readerFrom!0 (_2!4975 lt!174313) (currentBit!5363 thiss!1305) (currentByte!5368 thiss!1305))))))

(declare-fun b!114567 () Bool)

(declare-fun res!94656 () Bool)

(assert (=> b!114567 (=> (not res!94656) (not e!75117))))

(assert (=> b!114567 (= res!94656 (isPrefixOf!0 thiss!1305 (_2!4975 lt!174313)))))

(declare-fun b!114566 () Bool)

(declare-fun res!94659 () Bool)

(assert (=> b!114566 (=> (not res!94659) (not e!75117))))

(declare-fun lt!174312 () (_ BitVec 64))

(declare-fun lt!174314 () (_ BitVec 64))

(assert (=> b!114566 (= res!94659 (= (bitIndex!0 (size!2353 (buf!2761 (_2!4975 lt!174313))) (currentByte!5368 (_2!4975 lt!174313)) (currentBit!5363 (_2!4975 lt!174313))) (bvadd lt!174312 lt!174314)))))

(assert (=> b!114566 (or (not (= (bvand lt!174312 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!174314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!174312 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!174312 lt!174314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!114566 (= lt!174314 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!114566 (= lt!174312 (bitIndex!0 (size!2353 (buf!2761 thiss!1305)) (currentByte!5368 thiss!1305) (currentBit!5363 thiss!1305)))))

(declare-fun b!114569 () Bool)

(assert (=> b!114569 (= e!75118 (= (bitIndex!0 (size!2353 (buf!2761 (_1!4976 lt!174311))) (currentByte!5368 (_1!4976 lt!174311)) (currentBit!5363 (_1!4976 lt!174311))) (bitIndex!0 (size!2353 (buf!2761 (_2!4975 lt!174313))) (currentByte!5368 (_2!4975 lt!174313)) (currentBit!5363 (_2!4975 lt!174313)))))))

(declare-fun d!36756 () Bool)

(assert (=> d!36756 e!75117))

(declare-fun res!94657 () Bool)

(assert (=> d!36756 (=> (not res!94657) (not e!75117))))

(assert (=> d!36756 (= res!94657 (= (size!2353 (buf!2761 thiss!1305)) (size!2353 (buf!2761 (_2!4975 lt!174313)))))))

(declare-fun choose!16 (BitStream!4180 Bool) tuple2!9426)

(assert (=> d!36756 (= lt!174313 (choose!16 thiss!1305 lt!173864))))

(assert (=> d!36756 (validate_offset_bit!0 ((_ sign_extend 32) (size!2353 (buf!2761 thiss!1305))) ((_ sign_extend 32) (currentByte!5368 thiss!1305)) ((_ sign_extend 32) (currentBit!5363 thiss!1305)))))

(assert (=> d!36756 (= (appendBit!0 thiss!1305 lt!173864) lt!174313)))

(assert (= (and d!36756 res!94657) b!114566))

(assert (= (and b!114566 res!94659) b!114567))

(assert (= (and b!114567 res!94656) b!114568))

(assert (= (and b!114568 res!94658) b!114569))

(declare-fun m!171029 () Bool)

(assert (=> d!36756 m!171029))

(declare-fun m!171031 () Bool)

(assert (=> d!36756 m!171031))

(declare-fun m!171033 () Bool)

(assert (=> b!114566 m!171033))

(assert (=> b!114566 m!170667))

(declare-fun m!171035 () Bool)

(assert (=> b!114568 m!171035))

(assert (=> b!114568 m!171035))

(declare-fun m!171037 () Bool)

(assert (=> b!114568 m!171037))

(declare-fun m!171039 () Bool)

(assert (=> b!114567 m!171039))

(declare-fun m!171041 () Bool)

(assert (=> b!114569 m!171041))

(assert (=> b!114569 m!171033))

(assert (=> b!114283 d!36756))

(declare-datatypes ((tuple4!84 0))(
  ( (tuple4!85 (_1!4987 (_ BitVec 32)) (_2!4987 (_ BitVec 32)) (_3!263 (_ BitVec 32)) (_4!42 (_ BitVec 32))) )
))
(declare-fun lt!174323 () tuple4!84)

(declare-fun lt!174321 () (_ BitVec 32))

(declare-fun c!6946 () Bool)

(declare-fun bm!1478 () Bool)

(declare-fun call!1481 () Bool)

(declare-fun lt!174322 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!1478 (= call!1481 (byteRangesEq!0 (ite c!6946 (select (arr!2946 (buf!2761 (_2!4975 lt!173863))) (_3!263 lt!174323)) (select (arr!2946 (buf!2761 (_2!4975 lt!173863))) (_4!42 lt!174323))) (ite c!6946 (select (arr!2946 (buf!2761 (_2!4975 lt!173865))) (_3!263 lt!174323)) (select (arr!2946 (buf!2761 (_2!4975 lt!173865))) (_4!42 lt!174323))) (ite c!6946 lt!174321 #b00000000000000000000000000000000) lt!174322))))

(declare-fun b!114584 () Bool)

(declare-fun e!75131 () Bool)

(assert (=> b!114584 (= e!75131 call!1481)))

(declare-fun b!114585 () Bool)

(declare-fun e!75132 () Bool)

(declare-fun e!75133 () Bool)

(assert (=> b!114585 (= e!75132 e!75133)))

(assert (=> b!114585 (= c!6946 (= (_3!263 lt!174323) (_4!42 lt!174323)))))

(declare-fun e!75135 () Bool)

(declare-fun b!114586 () Bool)

(declare-fun arrayRangesEq!43 (array!5183 array!5183 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!114586 (= e!75135 (arrayRangesEq!43 (buf!2761 (_2!4975 lt!173863)) (buf!2761 (_2!4975 lt!173865)) (_1!4987 lt!174323) (_2!4987 lt!174323)))))

(declare-fun b!114587 () Bool)

(declare-fun res!94674 () Bool)

(assert (=> b!114587 (= res!94674 (= lt!174322 #b00000000000000000000000000000000))))

(assert (=> b!114587 (=> res!94674 e!75131)))

(declare-fun e!75136 () Bool)

(assert (=> b!114587 (= e!75136 e!75131)))

(declare-fun d!36760 () Bool)

(declare-fun res!94672 () Bool)

(declare-fun e!75134 () Bool)

(assert (=> d!36760 (=> res!94672 e!75134)))

(assert (=> d!36760 (= res!94672 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!2353 (buf!2761 (_2!4975 lt!173863))) (currentByte!5368 thiss!1305) (currentBit!5363 thiss!1305)))))))

(assert (=> d!36760 (= (arrayBitRangesEq!0 (buf!2761 (_2!4975 lt!173863)) (buf!2761 (_2!4975 lt!173865)) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!2353 (buf!2761 (_2!4975 lt!173863))) (currentByte!5368 thiss!1305) (currentBit!5363 thiss!1305)))) e!75134)))

(declare-fun b!114588 () Bool)

(assert (=> b!114588 (= e!75134 e!75132)))

(declare-fun res!94670 () Bool)

(assert (=> b!114588 (=> (not res!94670) (not e!75132))))

(assert (=> b!114588 (= res!94670 e!75135)))

(declare-fun res!94671 () Bool)

(assert (=> b!114588 (=> res!94671 e!75135)))

(assert (=> b!114588 (= res!94671 (bvsge (_1!4987 lt!174323) (_2!4987 lt!174323)))))

(assert (=> b!114588 (= lt!174322 ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!2353 (buf!2761 (_2!4975 lt!173863))) (currentByte!5368 thiss!1305) (currentBit!5363 thiss!1305))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!114588 (= lt!174321 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!84)

(assert (=> b!114588 (= lt!174323 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!2353 (buf!2761 (_2!4975 lt!173863))) (currentByte!5368 thiss!1305) (currentBit!5363 thiss!1305)))))))

(declare-fun b!114589 () Bool)

(assert (=> b!114589 (= e!75133 e!75136)))

(declare-fun res!94673 () Bool)

(assert (=> b!114589 (= res!94673 (byteRangesEq!0 (select (arr!2946 (buf!2761 (_2!4975 lt!173863))) (_3!263 lt!174323)) (select (arr!2946 (buf!2761 (_2!4975 lt!173865))) (_3!263 lt!174323)) lt!174321 #b00000000000000000000000000001000))))

(assert (=> b!114589 (=> (not res!94673) (not e!75136))))

(declare-fun b!114590 () Bool)

(assert (=> b!114590 (= e!75133 call!1481)))

(assert (= (and d!36760 (not res!94672)) b!114588))

(assert (= (and b!114588 (not res!94671)) b!114586))

(assert (= (and b!114588 res!94670) b!114585))

(assert (= (and b!114585 c!6946) b!114590))

(assert (= (and b!114585 (not c!6946)) b!114589))

(assert (= (and b!114589 res!94673) b!114587))

(assert (= (and b!114587 (not res!94674)) b!114584))

(assert (= (or b!114590 b!114584) bm!1478))

(declare-fun m!171043 () Bool)

(assert (=> bm!1478 m!171043))

(declare-fun m!171045 () Bool)

(assert (=> bm!1478 m!171045))

(declare-fun m!171047 () Bool)

(assert (=> bm!1478 m!171047))

(declare-fun m!171049 () Bool)

(assert (=> bm!1478 m!171049))

(declare-fun m!171051 () Bool)

(assert (=> bm!1478 m!171051))

(declare-fun m!171053 () Bool)

(assert (=> b!114586 m!171053))

(declare-fun m!171055 () Bool)

(assert (=> b!114588 m!171055))

(assert (=> b!114589 m!171051))

(assert (=> b!114589 m!171049))

(assert (=> b!114589 m!171051))

(assert (=> b!114589 m!171049))

(declare-fun m!171057 () Bool)

(assert (=> b!114589 m!171057))

(assert (=> b!114272 d!36760))

(declare-fun d!36762 () Bool)

(declare-fun e!75137 () Bool)

(assert (=> d!36762 e!75137))

(declare-fun res!94675 () Bool)

(assert (=> d!36762 (=> (not res!94675) (not e!75137))))

(declare-fun lt!174326 () (_ BitVec 64))

(declare-fun lt!174328 () (_ BitVec 64))

(declare-fun lt!174329 () (_ BitVec 64))

(assert (=> d!36762 (= res!94675 (= lt!174326 (bvsub lt!174328 lt!174329)))))

(assert (=> d!36762 (or (= (bvand lt!174328 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!174329 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!174328 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!174328 lt!174329) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!36762 (= lt!174329 (remainingBits!0 ((_ sign_extend 32) (size!2353 (buf!2761 (_2!4975 lt!173863)))) ((_ sign_extend 32) (currentByte!5368 thiss!1305)) ((_ sign_extend 32) (currentBit!5363 thiss!1305))))))

(declare-fun lt!174327 () (_ BitVec 64))

(declare-fun lt!174325 () (_ BitVec 64))

(assert (=> d!36762 (= lt!174328 (bvmul lt!174327 lt!174325))))

(assert (=> d!36762 (or (= lt!174327 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!174325 (bvsdiv (bvmul lt!174327 lt!174325) lt!174327)))))

(assert (=> d!36762 (= lt!174325 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!36762 (= lt!174327 ((_ sign_extend 32) (size!2353 (buf!2761 (_2!4975 lt!173863)))))))

(assert (=> d!36762 (= lt!174326 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5368 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5363 thiss!1305))))))

(assert (=> d!36762 (invariant!0 (currentBit!5363 thiss!1305) (currentByte!5368 thiss!1305) (size!2353 (buf!2761 (_2!4975 lt!173863))))))

(assert (=> d!36762 (= (bitIndex!0 (size!2353 (buf!2761 (_2!4975 lt!173863))) (currentByte!5368 thiss!1305) (currentBit!5363 thiss!1305)) lt!174326)))

(declare-fun b!114591 () Bool)

(declare-fun res!94676 () Bool)

(assert (=> b!114591 (=> (not res!94676) (not e!75137))))

(assert (=> b!114591 (= res!94676 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!174326))))

(declare-fun b!114592 () Bool)

(declare-fun lt!174324 () (_ BitVec 64))

(assert (=> b!114592 (= e!75137 (bvsle lt!174326 (bvmul lt!174324 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!114592 (or (= lt!174324 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!174324 #b0000000000000000000000000000000000000000000000000000000000001000) lt!174324)))))

(assert (=> b!114592 (= lt!174324 ((_ sign_extend 32) (size!2353 (buf!2761 (_2!4975 lt!173863)))))))

(assert (= (and d!36762 res!94675) b!114591))

(assert (= (and b!114591 res!94676) b!114592))

(assert (=> d!36762 m!170791))

(assert (=> d!36762 m!170649))

(assert (=> b!114272 d!36762))

(declare-fun d!36764 () Bool)

(declare-datatypes ((tuple2!9448 0))(
  ( (tuple2!9449 (_1!4989 Bool) (_2!4989 BitStream!4180)) )
))
(declare-fun lt!174332 () tuple2!9448)

(declare-fun readBit!0 (BitStream!4180) tuple2!9448)

(assert (=> d!36764 (= lt!174332 (readBit!0 (readerFrom!0 (_2!4975 lt!173863) (currentBit!5363 thiss!1305) (currentByte!5368 thiss!1305))))))

(assert (=> d!36764 (= (readBitPure!0 (readerFrom!0 (_2!4975 lt!173863) (currentBit!5363 thiss!1305) (currentByte!5368 thiss!1305))) (tuple2!9429 (_2!4989 lt!174332) (_1!4989 lt!174332)))))

(declare-fun bs!8917 () Bool)

(assert (= bs!8917 d!36764))

(assert (=> bs!8917 m!170659))

(declare-fun m!171059 () Bool)

(assert (=> bs!8917 m!171059))

(assert (=> b!114282 d!36764))

(declare-fun d!36766 () Bool)

(declare-fun e!75140 () Bool)

(assert (=> d!36766 e!75140))

(declare-fun res!94680 () Bool)

(assert (=> d!36766 (=> (not res!94680) (not e!75140))))

(assert (=> d!36766 (= res!94680 (invariant!0 (currentBit!5363 (_2!4975 lt!173863)) (currentByte!5368 (_2!4975 lt!173863)) (size!2353 (buf!2761 (_2!4975 lt!173863)))))))

(assert (=> d!36766 (= (readerFrom!0 (_2!4975 lt!173863) (currentBit!5363 thiss!1305) (currentByte!5368 thiss!1305)) (BitStream!4181 (buf!2761 (_2!4975 lt!173863)) (currentByte!5368 thiss!1305) (currentBit!5363 thiss!1305)))))

(declare-fun b!114595 () Bool)

(assert (=> b!114595 (= e!75140 (invariant!0 (currentBit!5363 thiss!1305) (currentByte!5368 thiss!1305) (size!2353 (buf!2761 (_2!4975 lt!173863)))))))

(assert (= (and d!36766 res!94680) b!114595))

(declare-fun m!171061 () Bool)

(assert (=> d!36766 m!171061))

(assert (=> b!114595 m!170649))

(assert (=> b!114282 d!36766))

(declare-fun d!36768 () Bool)

(assert (=> d!36768 (= (onesLSBLong!0 nBits!396) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!396))))))

(assert (=> b!114281 d!36768))

(declare-fun d!36770 () Bool)

(declare-fun e!75141 () Bool)

(assert (=> d!36770 e!75141))

(declare-fun res!94681 () Bool)

(assert (=> d!36770 (=> (not res!94681) (not e!75141))))

(declare-fun lt!174337 () (_ BitVec 64))

(declare-fun lt!174335 () (_ BitVec 64))

(declare-fun lt!174338 () (_ BitVec 64))

(assert (=> d!36770 (= res!94681 (= lt!174335 (bvsub lt!174337 lt!174338)))))

(assert (=> d!36770 (or (= (bvand lt!174337 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!174338 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!174337 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!174337 lt!174338) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!36770 (= lt!174338 (remainingBits!0 ((_ sign_extend 32) (size!2353 (buf!2761 (_2!4975 lt!173863)))) ((_ sign_extend 32) (currentByte!5368 (_2!4975 lt!173863))) ((_ sign_extend 32) (currentBit!5363 (_2!4975 lt!173863)))))))

(declare-fun lt!174336 () (_ BitVec 64))

(declare-fun lt!174334 () (_ BitVec 64))

(assert (=> d!36770 (= lt!174337 (bvmul lt!174336 lt!174334))))

(assert (=> d!36770 (or (= lt!174336 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!174334 (bvsdiv (bvmul lt!174336 lt!174334) lt!174336)))))

(assert (=> d!36770 (= lt!174334 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!36770 (= lt!174336 ((_ sign_extend 32) (size!2353 (buf!2761 (_2!4975 lt!173863)))))))

(assert (=> d!36770 (= lt!174335 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5368 (_2!4975 lt!173863))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5363 (_2!4975 lt!173863)))))))

(assert (=> d!36770 (invariant!0 (currentBit!5363 (_2!4975 lt!173863)) (currentByte!5368 (_2!4975 lt!173863)) (size!2353 (buf!2761 (_2!4975 lt!173863))))))

(assert (=> d!36770 (= (bitIndex!0 (size!2353 (buf!2761 (_2!4975 lt!173863))) (currentByte!5368 (_2!4975 lt!173863)) (currentBit!5363 (_2!4975 lt!173863))) lt!174335)))

(declare-fun b!114596 () Bool)

(declare-fun res!94682 () Bool)

(assert (=> b!114596 (=> (not res!94682) (not e!75141))))

(assert (=> b!114596 (= res!94682 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!174335))))

(declare-fun b!114597 () Bool)

(declare-fun lt!174333 () (_ BitVec 64))

(assert (=> b!114597 (= e!75141 (bvsle lt!174335 (bvmul lt!174333 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!114597 (or (= lt!174333 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!174333 #b0000000000000000000000000000000000000000000000000000000000001000) lt!174333)))))

(assert (=> b!114597 (= lt!174333 ((_ sign_extend 32) (size!2353 (buf!2761 (_2!4975 lt!173863)))))))

(assert (= (and d!36770 res!94681) b!114596))

(assert (= (and b!114596 res!94682) b!114597))

(declare-fun m!171063 () Bool)

(assert (=> d!36770 m!171063))

(assert (=> d!36770 m!171061))

(assert (=> b!114280 d!36770))

(declare-fun d!36772 () Bool)

(declare-fun e!75142 () Bool)

(assert (=> d!36772 e!75142))

(declare-fun res!94683 () Bool)

(assert (=> d!36772 (=> (not res!94683) (not e!75142))))

(declare-fun lt!174341 () (_ BitVec 64))

(declare-fun lt!174343 () (_ BitVec 64))

(declare-fun lt!174344 () (_ BitVec 64))

(assert (=> d!36772 (= res!94683 (= lt!174341 (bvsub lt!174343 lt!174344)))))

(assert (=> d!36772 (or (= (bvand lt!174343 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!174344 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!174343 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!174343 lt!174344) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!36772 (= lt!174344 (remainingBits!0 ((_ sign_extend 32) (size!2353 (buf!2761 thiss!1305))) ((_ sign_extend 32) (currentByte!5368 thiss!1305)) ((_ sign_extend 32) (currentBit!5363 thiss!1305))))))

(declare-fun lt!174342 () (_ BitVec 64))

(declare-fun lt!174340 () (_ BitVec 64))

(assert (=> d!36772 (= lt!174343 (bvmul lt!174342 lt!174340))))

(assert (=> d!36772 (or (= lt!174342 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!174340 (bvsdiv (bvmul lt!174342 lt!174340) lt!174342)))))

(assert (=> d!36772 (= lt!174340 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!36772 (= lt!174342 ((_ sign_extend 32) (size!2353 (buf!2761 thiss!1305))))))

(assert (=> d!36772 (= lt!174341 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5368 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5363 thiss!1305))))))

(assert (=> d!36772 (invariant!0 (currentBit!5363 thiss!1305) (currentByte!5368 thiss!1305) (size!2353 (buf!2761 thiss!1305)))))

(assert (=> d!36772 (= (bitIndex!0 (size!2353 (buf!2761 thiss!1305)) (currentByte!5368 thiss!1305) (currentBit!5363 thiss!1305)) lt!174341)))

(declare-fun b!114598 () Bool)

(declare-fun res!94684 () Bool)

(assert (=> b!114598 (=> (not res!94684) (not e!75142))))

(assert (=> b!114598 (= res!94684 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!174341))))

(declare-fun b!114599 () Bool)

(declare-fun lt!174339 () (_ BitVec 64))

(assert (=> b!114599 (= e!75142 (bvsle lt!174341 (bvmul lt!174339 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!114599 (or (= lt!174339 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!174339 #b0000000000000000000000000000000000000000000000000000000000001000) lt!174339)))))

(assert (=> b!114599 (= lt!174339 ((_ sign_extend 32) (size!2353 (buf!2761 thiss!1305))))))

(assert (= (and d!36772 res!94683) b!114598))

(assert (= (and b!114598 res!94684) b!114599))

(assert (=> d!36772 m!170805))

(assert (=> d!36772 m!170803))

(assert (=> b!114280 d!36772))

(push 1)

(assert (not b!114537))

(assert (not b!114532))

(assert (not bm!1478))

(assert (not d!36772))

(assert (not b!114588))

(assert (not d!36706))

(assert (not b!114586))

(assert (not b!114535))

(assert (not b!114421))

(assert (not b!114419))

(assert (not b!114568))

(assert (not b!114567))

(assert (not b!114540))

(assert (not b!114539))

(assert (not b!114569))

(assert (not d!36716))

(assert (not d!36766))

(assert (not b!114406))

(assert (not b!114589))

(assert (not b!114595))

(assert (not d!36720))

(assert (not d!36764))

(assert (not b!114542))

(assert (not d!36770))

(assert (not b!114534))

(assert (not b!114566))

(assert (not bm!1475))

(assert (not b!114531))

(assert (not d!36762))

(assert (not d!36724))

(assert (not d!36700))

(assert (not d!36756))

(assert (not b!114404))

(assert (not b!114536))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!36912 () Bool)

(declare-fun lt!174803 () tuple2!9448)

(assert (=> d!36912 (= lt!174803 (readBit!0 (readerFrom!0 (_2!4975 lt!174313) (currentBit!5363 thiss!1305) (currentByte!5368 thiss!1305))))))

(assert (=> d!36912 (= (readBitPure!0 (readerFrom!0 (_2!4975 lt!174313) (currentBit!5363 thiss!1305) (currentByte!5368 thiss!1305))) (tuple2!9429 (_2!4989 lt!174803) (_1!4989 lt!174803)))))

(declare-fun bs!8944 () Bool)

(assert (= bs!8944 d!36912))

(assert (=> bs!8944 m!171035))

(declare-fun m!171543 () Bool)

(assert (=> bs!8944 m!171543))

(assert (=> b!114568 d!36912))

(declare-fun d!36914 () Bool)

(declare-fun e!75256 () Bool)

(assert (=> d!36914 e!75256))

(declare-fun res!94829 () Bool)

(assert (=> d!36914 (=> (not res!94829) (not e!75256))))

(assert (=> d!36914 (= res!94829 (invariant!0 (currentBit!5363 (_2!4975 lt!174313)) (currentByte!5368 (_2!4975 lt!174313)) (size!2353 (buf!2761 (_2!4975 lt!174313)))))))

(assert (=> d!36914 (= (readerFrom!0 (_2!4975 lt!174313) (currentBit!5363 thiss!1305) (currentByte!5368 thiss!1305)) (BitStream!4181 (buf!2761 (_2!4975 lt!174313)) (currentByte!5368 thiss!1305) (currentBit!5363 thiss!1305)))))

(declare-fun b!114779 () Bool)

(assert (=> b!114779 (= e!75256 (invariant!0 (currentBit!5363 thiss!1305) (currentByte!5368 thiss!1305) (size!2353 (buf!2761 (_2!4975 lt!174313)))))))

(assert (= (and d!36914 res!94829) b!114779))

(declare-fun m!171545 () Bool)

(assert (=> d!36914 m!171545))

(declare-fun m!171547 () Bool)

(assert (=> b!114779 m!171547))

(assert (=> b!114568 d!36914))

(declare-fun bm!1485 () Bool)

(declare-fun call!1488 () Bool)

(declare-fun c!6962 () Bool)

(declare-fun lt!174805 () (_ BitVec 32))

(declare-fun lt!174804 () (_ BitVec 32))

(declare-fun lt!174806 () tuple4!84)

(assert (=> bm!1485 (= call!1488 (byteRangesEq!0 (ite c!6962 (select (arr!2946 (buf!2761 thiss!1305)) (_3!263 lt!174806)) (select (arr!2946 (buf!2761 thiss!1305)) (_4!42 lt!174806))) (ite c!6962 (select (arr!2946 (buf!2761 (_2!4975 lt!173863))) (_3!263 lt!174806)) (select (arr!2946 (buf!2761 (_2!4975 lt!173863))) (_4!42 lt!174806))) (ite c!6962 lt!174804 #b00000000000000000000000000000000) lt!174805))))

(declare-fun b!114780 () Bool)

(declare-fun e!75257 () Bool)

(assert (=> b!114780 (= e!75257 call!1488)))

(declare-fun b!114781 () Bool)

(declare-fun e!75258 () Bool)

(declare-fun e!75259 () Bool)

(assert (=> b!114781 (= e!75258 e!75259)))

(assert (=> b!114781 (= c!6962 (= (_3!263 lt!174806) (_4!42 lt!174806)))))

(declare-fun b!114782 () Bool)

(declare-fun e!75261 () Bool)

(assert (=> b!114782 (= e!75261 (arrayRangesEq!43 (buf!2761 thiss!1305) (buf!2761 (_2!4975 lt!173863)) (_1!4987 lt!174806) (_2!4987 lt!174806)))))

(declare-fun b!114783 () Bool)

(declare-fun res!94834 () Bool)

(assert (=> b!114783 (= res!94834 (= lt!174805 #b00000000000000000000000000000000))))

(assert (=> b!114783 (=> res!94834 e!75257)))

(declare-fun e!75262 () Bool)

(assert (=> b!114783 (= e!75262 e!75257)))

(declare-fun d!36916 () Bool)

(declare-fun res!94832 () Bool)

(declare-fun e!75260 () Bool)

(assert (=> d!36916 (=> res!94832 e!75260)))

(assert (=> d!36916 (= res!94832 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2353 (buf!2761 thiss!1305)) (currentByte!5368 thiss!1305) (currentBit!5363 thiss!1305))))))

(assert (=> d!36916 (= (arrayBitRangesEq!0 (buf!2761 thiss!1305) (buf!2761 (_2!4975 lt!173863)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2353 (buf!2761 thiss!1305)) (currentByte!5368 thiss!1305) (currentBit!5363 thiss!1305))) e!75260)))

(declare-fun b!114784 () Bool)

(assert (=> b!114784 (= e!75260 e!75258)))

(declare-fun res!94830 () Bool)

(assert (=> b!114784 (=> (not res!94830) (not e!75258))))

(assert (=> b!114784 (= res!94830 e!75261)))

(declare-fun res!94831 () Bool)

(assert (=> b!114784 (=> res!94831 e!75261)))

(assert (=> b!114784 (= res!94831 (bvsge (_1!4987 lt!174806) (_2!4987 lt!174806)))))

(assert (=> b!114784 (= lt!174805 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!2353 (buf!2761 thiss!1305)) (currentByte!5368 thiss!1305) (currentBit!5363 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!114784 (= lt!174804 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!114784 (= lt!174806 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2353 (buf!2761 thiss!1305)) (currentByte!5368 thiss!1305) (currentBit!5363 thiss!1305))))))

(declare-fun b!114785 () Bool)

(assert (=> b!114785 (= e!75259 e!75262)))

(declare-fun res!94833 () Bool)

(assert (=> b!114785 (= res!94833 (byteRangesEq!0 (select (arr!2946 (buf!2761 thiss!1305)) (_3!263 lt!174806)) (select (arr!2946 (buf!2761 (_2!4975 lt!173863))) (_3!263 lt!174806)) lt!174804 #b00000000000000000000000000001000))))

(assert (=> b!114785 (=> (not res!94833) (not e!75262))))

(declare-fun b!114786 () Bool)

(assert (=> b!114786 (= e!75259 call!1488)))

(assert (= (and d!36916 (not res!94832)) b!114784))

(assert (= (and b!114784 (not res!94831)) b!114782))

(assert (= (and b!114784 res!94830) b!114781))

(assert (= (and b!114781 c!6962) b!114786))

(assert (= (and b!114781 (not c!6962)) b!114785))

(assert (= (and b!114785 res!94833) b!114783))

(assert (= (and b!114783 (not res!94834)) b!114780))

(assert (= (or b!114786 b!114780) bm!1485))

(declare-fun m!171549 () Bool)

(assert (=> bm!1485 m!171549))

(declare-fun m!171551 () Bool)

(assert (=> bm!1485 m!171551))

(declare-fun m!171553 () Bool)

(assert (=> bm!1485 m!171553))

(declare-fun m!171555 () Bool)

(assert (=> bm!1485 m!171555))

(declare-fun m!171557 () Bool)

(assert (=> bm!1485 m!171557))

(declare-fun m!171559 () Bool)

(assert (=> b!114782 m!171559))

(assert (=> b!114784 m!170667))

(declare-fun m!171561 () Bool)

(assert (=> b!114784 m!171561))

(assert (=> b!114785 m!171557))

(assert (=> b!114785 m!171555))

(assert (=> b!114785 m!171557))

(assert (=> b!114785 m!171555))

(declare-fun m!171563 () Bool)

(assert (=> b!114785 m!171563))

(assert (=> b!114406 d!36916))

(assert (=> b!114406 d!36772))

(declare-fun d!36918 () Bool)

(declare-fun res!94837 () Bool)

(declare-fun e!75264 () Bool)

(assert (=> d!36918 (=> (not res!94837) (not e!75264))))

(assert (=> d!36918 (= res!94837 (= (size!2353 (buf!2761 thiss!1305)) (size!2353 (buf!2761 (_2!4975 lt!174313)))))))

(assert (=> d!36918 (= (isPrefixOf!0 thiss!1305 (_2!4975 lt!174313)) e!75264)))

(declare-fun b!114787 () Bool)

(declare-fun res!94835 () Bool)

(assert (=> b!114787 (=> (not res!94835) (not e!75264))))

(assert (=> b!114787 (= res!94835 (bvsle (bitIndex!0 (size!2353 (buf!2761 thiss!1305)) (currentByte!5368 thiss!1305) (currentBit!5363 thiss!1305)) (bitIndex!0 (size!2353 (buf!2761 (_2!4975 lt!174313))) (currentByte!5368 (_2!4975 lt!174313)) (currentBit!5363 (_2!4975 lt!174313)))))))

(declare-fun b!114788 () Bool)

(declare-fun e!75263 () Bool)

(assert (=> b!114788 (= e!75264 e!75263)))

(declare-fun res!94836 () Bool)

(assert (=> b!114788 (=> res!94836 e!75263)))

(assert (=> b!114788 (= res!94836 (= (size!2353 (buf!2761 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!114789 () Bool)

(assert (=> b!114789 (= e!75263 (arrayBitRangesEq!0 (buf!2761 thiss!1305) (buf!2761 (_2!4975 lt!174313)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2353 (buf!2761 thiss!1305)) (currentByte!5368 thiss!1305) (currentBit!5363 thiss!1305))))))

(assert (= (and d!36918 res!94837) b!114787))

(assert (= (and b!114787 res!94835) b!114788))

(assert (= (and b!114788 (not res!94836)) b!114789))

(assert (=> b!114787 m!170667))

(assert (=> b!114787 m!171033))

(assert (=> b!114789 m!170667))

(assert (=> b!114789 m!170667))

(declare-fun m!171565 () Bool)

(assert (=> b!114789 m!171565))

(assert (=> b!114567 d!36918))

(declare-fun d!36920 () Bool)

(assert (=> d!36920 (= (remainingBits!0 ((_ sign_extend 32) (size!2353 (buf!2761 (_2!4975 lt!173863)))) ((_ sign_extend 32) (currentByte!5368 (_2!4975 lt!173863))) ((_ sign_extend 32) (currentBit!5363 (_2!4975 lt!173863)))) (bvsub (bvmul ((_ sign_extend 32) (size!2353 (buf!2761 (_2!4975 lt!173863)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5368 (_2!4975 lt!173863))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5363 (_2!4975 lt!173863))))))))

(assert (=> d!36770 d!36920))

(declare-fun d!36922 () Bool)

(assert (=> d!36922 (= (invariant!0 (currentBit!5363 (_2!4975 lt!173863)) (currentByte!5368 (_2!4975 lt!173863)) (size!2353 (buf!2761 (_2!4975 lt!173863)))) (and (bvsge (currentBit!5363 (_2!4975 lt!173863)) #b00000000000000000000000000000000) (bvslt (currentBit!5363 (_2!4975 lt!173863)) #b00000000000000000000000000001000) (bvsge (currentByte!5368 (_2!4975 lt!173863)) #b00000000000000000000000000000000) (or (bvslt (currentByte!5368 (_2!4975 lt!173863)) (size!2353 (buf!2761 (_2!4975 lt!173863)))) (and (= (currentBit!5363 (_2!4975 lt!173863)) #b00000000000000000000000000000000) (= (currentByte!5368 (_2!4975 lt!173863)) (size!2353 (buf!2761 (_2!4975 lt!173863))))))))))

(assert (=> d!36770 d!36922))

(declare-fun d!36924 () Bool)

(assert (=> d!36924 (= (invariant!0 (currentBit!5363 thiss!1305) (currentByte!5368 thiss!1305) (size!2353 (buf!2761 thiss!1305))) (and (bvsge (currentBit!5363 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5363 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5368 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5368 thiss!1305) (size!2353 (buf!2761 thiss!1305))) (and (= (currentBit!5363 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5368 thiss!1305) (size!2353 (buf!2761 thiss!1305)))))))))

(assert (=> d!36716 d!36924))

(assert (=> b!114404 d!36772))

(assert (=> b!114404 d!36770))

(declare-fun d!36926 () Bool)

(declare-fun e!75265 () Bool)

(assert (=> d!36926 e!75265))

(declare-fun res!94838 () Bool)

(assert (=> d!36926 (=> (not res!94838) (not e!75265))))

(declare-fun lt!174811 () (_ BitVec 64))

(declare-fun lt!174809 () (_ BitVec 64))

(declare-fun lt!174812 () (_ BitVec 64))

(assert (=> d!36926 (= res!94838 (= lt!174809 (bvsub lt!174811 lt!174812)))))

(assert (=> d!36926 (or (= (bvand lt!174811 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!174812 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!174811 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!174811 lt!174812) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!36926 (= lt!174812 (remainingBits!0 ((_ sign_extend 32) (size!2353 (buf!2761 (_2!4975 lt!174313)))) ((_ sign_extend 32) (currentByte!5368 (_2!4975 lt!174313))) ((_ sign_extend 32) (currentBit!5363 (_2!4975 lt!174313)))))))

(declare-fun lt!174810 () (_ BitVec 64))

(declare-fun lt!174808 () (_ BitVec 64))

(assert (=> d!36926 (= lt!174811 (bvmul lt!174810 lt!174808))))

(assert (=> d!36926 (or (= lt!174810 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!174808 (bvsdiv (bvmul lt!174810 lt!174808) lt!174810)))))

(assert (=> d!36926 (= lt!174808 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!36926 (= lt!174810 ((_ sign_extend 32) (size!2353 (buf!2761 (_2!4975 lt!174313)))))))

(assert (=> d!36926 (= lt!174809 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5368 (_2!4975 lt!174313))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5363 (_2!4975 lt!174313)))))))

(assert (=> d!36926 (invariant!0 (currentBit!5363 (_2!4975 lt!174313)) (currentByte!5368 (_2!4975 lt!174313)) (size!2353 (buf!2761 (_2!4975 lt!174313))))))

(assert (=> d!36926 (= (bitIndex!0 (size!2353 (buf!2761 (_2!4975 lt!174313))) (currentByte!5368 (_2!4975 lt!174313)) (currentBit!5363 (_2!4975 lt!174313))) lt!174809)))

(declare-fun b!114790 () Bool)

(declare-fun res!94839 () Bool)

(assert (=> b!114790 (=> (not res!94839) (not e!75265))))

(assert (=> b!114790 (= res!94839 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!174809))))

(declare-fun b!114791 () Bool)

(declare-fun lt!174807 () (_ BitVec 64))

(assert (=> b!114791 (= e!75265 (bvsle lt!174809 (bvmul lt!174807 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!114791 (or (= lt!174807 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!174807 #b0000000000000000000000000000000000000000000000000000000000001000) lt!174807)))))

(assert (=> b!114791 (= lt!174807 ((_ sign_extend 32) (size!2353 (buf!2761 (_2!4975 lt!174313)))))))

(assert (= (and d!36926 res!94838) b!114790))

(assert (= (and b!114790 res!94839) b!114791))

(declare-fun m!171567 () Bool)

(assert (=> d!36926 m!171567))

(assert (=> d!36926 m!171545))

(assert (=> b!114566 d!36926))

(assert (=> b!114566 d!36772))

(assert (=> d!36766 d!36922))

(declare-fun b!114803 () Bool)

(declare-fun res!94850 () Bool)

(declare-fun e!75276 () Bool)

(assert (=> b!114803 (=> (not res!94850) (not e!75276))))

(declare-fun _$19!114 () tuple2!9426)

(assert (=> b!114803 (= res!94850 (isPrefixOf!0 thiss!1305 (_2!4975 _$19!114)))))

(declare-fun d!36928 () Bool)

(assert (=> d!36928 e!75276))

(declare-fun res!94851 () Bool)

(assert (=> d!36928 (=> (not res!94851) (not e!75276))))

(assert (=> d!36928 (= res!94851 (= (size!2353 (buf!2761 thiss!1305)) (size!2353 (buf!2761 (_2!4975 _$19!114)))))))

(declare-fun e!75274 () Bool)

(assert (=> d!36928 (and (inv!12 (_2!4975 _$19!114)) e!75274)))

(assert (=> d!36928 (= (choose!16 thiss!1305 lt!173864) _$19!114)))

(declare-fun b!114804 () Bool)

(declare-fun e!75277 () Bool)

(declare-fun lt!174815 () tuple2!9428)

(assert (=> b!114804 (= e!75277 (= (bitIndex!0 (size!2353 (buf!2761 (_1!4976 lt!174815))) (currentByte!5368 (_1!4976 lt!174815)) (currentBit!5363 (_1!4976 lt!174815))) (bitIndex!0 (size!2353 (buf!2761 (_2!4975 _$19!114))) (currentByte!5368 (_2!4975 _$19!114)) (currentBit!5363 (_2!4975 _$19!114)))))))

(declare-fun b!114805 () Bool)

(assert (=> b!114805 (= e!75276 e!75277)))

(declare-fun res!94849 () Bool)

(assert (=> b!114805 (=> (not res!94849) (not e!75277))))

(assert (=> b!114805 (= res!94849 (and (= (_2!4976 lt!174815) lt!173864) (= (_1!4976 lt!174815) (_2!4975 _$19!114))))))

(assert (=> b!114805 (= lt!174815 (readBitPure!0 (readerFrom!0 (_2!4975 _$19!114) (currentBit!5363 thiss!1305) (currentByte!5368 thiss!1305))))))

(declare-fun b!114806 () Bool)

(assert (=> b!114806 (= e!75274 (array_inv!2155 (buf!2761 (_2!4975 _$19!114))))))

(declare-fun b!114807 () Bool)

(declare-fun res!94848 () Bool)

(assert (=> b!114807 (=> (not res!94848) (not e!75276))))

(assert (=> b!114807 (= res!94848 (= (bitIndex!0 (size!2353 (buf!2761 (_2!4975 _$19!114))) (currentByte!5368 (_2!4975 _$19!114)) (currentBit!5363 (_2!4975 _$19!114))) (bvadd (bitIndex!0 (size!2353 (buf!2761 thiss!1305)) (currentByte!5368 thiss!1305) (currentBit!5363 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= d!36928 b!114806))

(assert (= (and d!36928 res!94851) b!114807))

(assert (= (and b!114807 res!94848) b!114803))

(assert (= (and b!114803 res!94850) b!114805))

(assert (= (and b!114805 res!94849) b!114804))

(declare-fun m!171569 () Bool)

(assert (=> b!114806 m!171569))

(declare-fun m!171571 () Bool)

(assert (=> b!114804 m!171571))

(declare-fun m!171573 () Bool)

(assert (=> b!114804 m!171573))

(declare-fun m!171575 () Bool)

(assert (=> d!36928 m!171575))

(assert (=> b!114807 m!171573))

(assert (=> b!114807 m!170667))

(declare-fun m!171577 () Bool)

(assert (=> b!114805 m!171577))

(assert (=> b!114805 m!171577))

(declare-fun m!171579 () Bool)

(assert (=> b!114805 m!171579))

(declare-fun m!171581 () Bool)

(assert (=> b!114803 m!171581))

(assert (=> d!36756 d!36928))

(declare-fun d!36930 () Bool)

(assert (=> d!36930 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!2353 (buf!2761 thiss!1305))) ((_ sign_extend 32) (currentByte!5368 thiss!1305)) ((_ sign_extend 32) (currentBit!5363 thiss!1305))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2353 (buf!2761 thiss!1305))) ((_ sign_extend 32) (currentByte!5368 thiss!1305)) ((_ sign_extend 32) (currentBit!5363 thiss!1305))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!8945 () Bool)

(assert (= bs!8945 d!36930))

(assert (=> bs!8945 m!170805))

(assert (=> d!36756 d!36930))

(assert (=> d!36724 d!36722))

(declare-fun d!36932 () Bool)

(assert (=> d!36932 (isPrefixOf!0 thiss!1305 (_2!4975 lt!173865))))

(assert (=> d!36932 true))

(declare-fun _$15!189 () Unit!7027)

(assert (=> d!36932 (= (choose!30 thiss!1305 (_2!4975 lt!173863) (_2!4975 lt!173865)) _$15!189)))

(declare-fun bs!8946 () Bool)

(assert (= bs!8946 d!36932))

(assert (=> bs!8946 m!170673))

(assert (=> d!36724 d!36932))

(assert (=> d!36724 d!36692))

(declare-fun d!36934 () Bool)

(assert (=> d!36934 (isPrefixOf!0 lt!174264 lt!174264)))

(declare-fun lt!174818 () Unit!7027)

(declare-fun choose!11 (BitStream!4180) Unit!7027)

(assert (=> d!36934 (= lt!174818 (choose!11 lt!174264))))

(assert (=> d!36934 (= (lemmaIsPrefixRefl!0 lt!174264) lt!174818)))

(declare-fun bs!8948 () Bool)

(assert (= bs!8948 d!36934))

(declare-fun m!171583 () Bool)

(assert (=> bs!8948 m!171583))

(declare-fun m!171585 () Bool)

(assert (=> bs!8948 m!171585))

(assert (=> b!114542 d!36934))

(declare-fun d!36936 () Bool)

(assert (=> d!36936 (= (byteRangesEq!0 (select (arr!2946 (buf!2761 (_2!4975 lt!173863))) (_3!263 lt!174323)) (select (arr!2946 (buf!2761 (_2!4975 lt!173865))) (_3!263 lt!174323)) lt!174321 #b00000000000000000000000000001000) (or (= lt!174321 #b00000000000000000000000000001000) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!2946 (buf!2761 (_2!4975 lt!173863))) (_3!263 lt!174323))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!174321)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!2946 (buf!2761 (_2!4975 lt!173865))) (_3!263 lt!174323))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!174321)))) #b00000000000000000000000011111111))))))

(declare-fun bs!8949 () Bool)

(assert (= bs!8949 d!36936))

(declare-fun m!171587 () Bool)

(assert (=> bs!8949 m!171587))

(declare-fun m!171589 () Bool)

(assert (=> bs!8949 m!171589))

(assert (=> b!114589 d!36936))

(declare-fun d!36938 () Bool)

(declare-fun e!75282 () Bool)

(assert (=> d!36938 e!75282))

(declare-fun res!94859 () Bool)

(assert (=> d!36938 (=> (not res!94859) (not e!75282))))

(declare-fun lt!174868 () tuple2!9444)

(assert (=> d!36938 (= res!94859 (isPrefixOf!0 (_1!4985 lt!174868) (_2!4985 lt!174868)))))

(declare-fun lt!174863 () BitStream!4180)

(assert (=> d!36938 (= lt!174868 (tuple2!9445 lt!174863 (_2!4975 lt!174289)))))

(declare-fun lt!174877 () Unit!7027)

(declare-fun lt!174869 () Unit!7027)

(assert (=> d!36938 (= lt!174877 lt!174869)))

(assert (=> d!36938 (isPrefixOf!0 lt!174863 (_2!4975 lt!174289))))

(assert (=> d!36938 (= lt!174869 (lemmaIsPrefixTransitive!0 lt!174863 (_2!4975 lt!174289) (_2!4975 lt!174289)))))

(declare-fun lt!174870 () Unit!7027)

(declare-fun lt!174864 () Unit!7027)

(assert (=> d!36938 (= lt!174870 lt!174864)))

(assert (=> d!36938 (isPrefixOf!0 lt!174863 (_2!4975 lt!174289))))

(assert (=> d!36938 (= lt!174864 (lemmaIsPrefixTransitive!0 lt!174863 (_2!4975 lt!173863) (_2!4975 lt!174289)))))

(declare-fun lt!174876 () Unit!7027)

(declare-fun e!75283 () Unit!7027)

(assert (=> d!36938 (= lt!174876 e!75283)))

(declare-fun c!6965 () Bool)

(assert (=> d!36938 (= c!6965 (not (= (size!2353 (buf!2761 (_2!4975 lt!173863))) #b00000000000000000000000000000000)))))

(declare-fun lt!174860 () Unit!7027)

(declare-fun lt!174878 () Unit!7027)

(assert (=> d!36938 (= lt!174860 lt!174878)))

(assert (=> d!36938 (isPrefixOf!0 (_2!4975 lt!174289) (_2!4975 lt!174289))))

(assert (=> d!36938 (= lt!174878 (lemmaIsPrefixRefl!0 (_2!4975 lt!174289)))))

(declare-fun lt!174867 () Unit!7027)

(declare-fun lt!174873 () Unit!7027)

(assert (=> d!36938 (= lt!174867 lt!174873)))

(assert (=> d!36938 (= lt!174873 (lemmaIsPrefixRefl!0 (_2!4975 lt!174289)))))

(declare-fun lt!174859 () Unit!7027)

(declare-fun lt!174874 () Unit!7027)

(assert (=> d!36938 (= lt!174859 lt!174874)))

(assert (=> d!36938 (isPrefixOf!0 lt!174863 lt!174863)))

(assert (=> d!36938 (= lt!174874 (lemmaIsPrefixRefl!0 lt!174863))))

(declare-fun lt!174862 () Unit!7027)

(declare-fun lt!174866 () Unit!7027)

(assert (=> d!36938 (= lt!174862 lt!174866)))

(assert (=> d!36938 (isPrefixOf!0 (_2!4975 lt!173863) (_2!4975 lt!173863))))

(assert (=> d!36938 (= lt!174866 (lemmaIsPrefixRefl!0 (_2!4975 lt!173863)))))

(assert (=> d!36938 (= lt!174863 (BitStream!4181 (buf!2761 (_2!4975 lt!174289)) (currentByte!5368 (_2!4975 lt!173863)) (currentBit!5363 (_2!4975 lt!173863))))))

(assert (=> d!36938 (isPrefixOf!0 (_2!4975 lt!173863) (_2!4975 lt!174289))))

(assert (=> d!36938 (= (reader!0 (_2!4975 lt!173863) (_2!4975 lt!174289)) lt!174868)))

(declare-fun b!114818 () Bool)

(declare-fun lt!174872 () Unit!7027)

(assert (=> b!114818 (= e!75283 lt!174872)))

(declare-fun lt!174861 () (_ BitVec 64))

(assert (=> b!114818 (= lt!174861 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!174871 () (_ BitVec 64))

(assert (=> b!114818 (= lt!174871 (bitIndex!0 (size!2353 (buf!2761 (_2!4975 lt!173863))) (currentByte!5368 (_2!4975 lt!173863)) (currentBit!5363 (_2!4975 lt!173863))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!5183 array!5183 (_ BitVec 64) (_ BitVec 64)) Unit!7027)

(assert (=> b!114818 (= lt!174872 (arrayBitRangesEqSymmetric!0 (buf!2761 (_2!4975 lt!173863)) (buf!2761 (_2!4975 lt!174289)) lt!174861 lt!174871))))

(assert (=> b!114818 (arrayBitRangesEq!0 (buf!2761 (_2!4975 lt!174289)) (buf!2761 (_2!4975 lt!173863)) lt!174861 lt!174871)))

(declare-fun b!114819 () Bool)

(declare-fun res!94860 () Bool)

(assert (=> b!114819 (=> (not res!94860) (not e!75282))))

(assert (=> b!114819 (= res!94860 (isPrefixOf!0 (_1!4985 lt!174868) (_2!4975 lt!173863)))))

(declare-fun b!114820 () Bool)

(declare-fun Unit!7060 () Unit!7027)

(assert (=> b!114820 (= e!75283 Unit!7060)))

(declare-fun b!114821 () Bool)

(declare-fun res!94858 () Bool)

(assert (=> b!114821 (=> (not res!94858) (not e!75282))))

(assert (=> b!114821 (= res!94858 (isPrefixOf!0 (_2!4985 lt!174868) (_2!4975 lt!174289)))))

(declare-fun lt!174875 () (_ BitVec 64))

(declare-fun lt!174865 () (_ BitVec 64))

(declare-fun b!114822 () Bool)

(assert (=> b!114822 (= e!75282 (= (_1!4985 lt!174868) (withMovedBitIndex!0 (_2!4985 lt!174868) (bvsub lt!174865 lt!174875))))))

(assert (=> b!114822 (or (= (bvand lt!174865 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!174875 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!174865 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!174865 lt!174875) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!114822 (= lt!174875 (bitIndex!0 (size!2353 (buf!2761 (_2!4975 lt!174289))) (currentByte!5368 (_2!4975 lt!174289)) (currentBit!5363 (_2!4975 lt!174289))))))

(assert (=> b!114822 (= lt!174865 (bitIndex!0 (size!2353 (buf!2761 (_2!4975 lt!173863))) (currentByte!5368 (_2!4975 lt!173863)) (currentBit!5363 (_2!4975 lt!173863))))))

(assert (= (and d!36938 c!6965) b!114818))

(assert (= (and d!36938 (not c!6965)) b!114820))

(assert (= (and d!36938 res!94859) b!114819))

(assert (= (and b!114819 res!94860) b!114821))

(assert (= (and b!114821 res!94858) b!114822))

(declare-fun m!171591 () Bool)

(assert (=> b!114819 m!171591))

(declare-fun m!171593 () Bool)

(assert (=> b!114822 m!171593))

(assert (=> b!114822 m!170941))

(assert (=> b!114822 m!170665))

(declare-fun m!171595 () Bool)

(assert (=> b!114821 m!171595))

(assert (=> b!114818 m!170665))

(declare-fun m!171597 () Bool)

(assert (=> b!114818 m!171597))

(declare-fun m!171599 () Bool)

(assert (=> b!114818 m!171599))

(declare-fun m!171601 () Bool)

(assert (=> d!36938 m!171601))

(declare-fun m!171603 () Bool)

(assert (=> d!36938 m!171603))

(declare-fun m!171605 () Bool)

(assert (=> d!36938 m!171605))

(declare-fun m!171607 () Bool)

(assert (=> d!36938 m!171607))

(assert (=> d!36938 m!170933))

(declare-fun m!171609 () Bool)

(assert (=> d!36938 m!171609))

(declare-fun m!171611 () Bool)

(assert (=> d!36938 m!171611))

(declare-fun m!171613 () Bool)

(assert (=> d!36938 m!171613))

(declare-fun m!171615 () Bool)

(assert (=> d!36938 m!171615))

(declare-fun m!171617 () Bool)

(assert (=> d!36938 m!171617))

(declare-fun m!171619 () Bool)

(assert (=> d!36938 m!171619))

(assert (=> b!114540 d!36938))

(declare-fun d!36940 () Bool)

(assert (=> d!36940 (validate_offset_bits!1 ((_ sign_extend 32) (size!2353 (buf!2761 (_2!4975 lt!174289)))) ((_ sign_extend 32) (currentByte!5368 (_2!4975 lt!173863))) ((_ sign_extend 32) (currentBit!5363 (_2!4975 lt!173863))) lt!174248)))

(declare-fun lt!174881 () Unit!7027)

(declare-fun choose!9 (BitStream!4180 array!5183 (_ BitVec 64) BitStream!4180) Unit!7027)

(assert (=> d!36940 (= lt!174881 (choose!9 (_2!4975 lt!173863) (buf!2761 (_2!4975 lt!174289)) lt!174248 (BitStream!4181 (buf!2761 (_2!4975 lt!174289)) (currentByte!5368 (_2!4975 lt!173863)) (currentBit!5363 (_2!4975 lt!173863)))))))

(assert (=> d!36940 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4975 lt!173863) (buf!2761 (_2!4975 lt!174289)) lt!174248) lt!174881)))

(declare-fun bs!8950 () Bool)

(assert (= bs!8950 d!36940))

(assert (=> bs!8950 m!171007))

(declare-fun m!171621 () Bool)

(assert (=> bs!8950 m!171621))

(assert (=> b!114540 d!36940))

(declare-fun d!36942 () Bool)

(assert (=> d!36942 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2353 (buf!2761 (_2!4975 lt!174289)))) ((_ sign_extend 32) (currentByte!5368 (_2!4975 lt!173863))) ((_ sign_extend 32) (currentBit!5363 (_2!4975 lt!173863))) lt!174248) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2353 (buf!2761 (_2!4975 lt!174289)))) ((_ sign_extend 32) (currentByte!5368 (_2!4975 lt!173863))) ((_ sign_extend 32) (currentBit!5363 (_2!4975 lt!173863)))) lt!174248))))

(declare-fun bs!8951 () Bool)

(assert (= bs!8951 d!36942))

(declare-fun m!171623 () Bool)

(assert (=> bs!8951 m!171623))

(assert (=> b!114540 d!36942))

(declare-fun d!36944 () Bool)

(assert (=> d!36944 (= (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(assert (=> b!114540 d!36944))

(declare-datatypes ((tuple2!9458 0))(
  ( (tuple2!9459 (_1!4994 (_ BitVec 64)) (_2!4994 BitStream!4180)) )
))
(declare-fun lt!174884 () tuple2!9458)

(declare-fun d!36946 () Bool)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!4180 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!9458)

(assert (=> d!36946 (= lt!174884 (readNLeastSignificantBitsLoop!0 (_1!4985 lt!174253) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!174280))))

(assert (=> d!36946 (= (readNLeastSignificantBitsLoopPure!0 (_1!4985 lt!174253) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!174280) (tuple2!9447 (_2!4994 lt!174884) (_1!4994 lt!174884)))))

(declare-fun bs!8952 () Bool)

(assert (= bs!8952 d!36946))

(declare-fun m!171625 () Bool)

(assert (=> bs!8952 m!171625))

(assert (=> b!114540 d!36946))

(declare-fun d!36948 () Bool)

(assert (=> d!36948 (= (remainingBits!0 ((_ sign_extend 32) (size!2353 (buf!2761 (_2!4975 lt!173863)))) ((_ sign_extend 32) (currentByte!5368 thiss!1305)) ((_ sign_extend 32) (currentBit!5363 thiss!1305))) (bvsub (bvmul ((_ sign_extend 32) (size!2353 (buf!2761 (_2!4975 lt!173863)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5368 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5363 thiss!1305)))))))

(assert (=> d!36762 d!36948))

(assert (=> d!36762 d!36718))

(declare-fun d!36950 () Bool)

(declare-fun res!94863 () Bool)

(declare-fun e!75285 () Bool)

(assert (=> d!36950 (=> (not res!94863) (not e!75285))))

(assert (=> d!36950 (= res!94863 (= (size!2353 (buf!2761 (ite c!6942 (_2!4975 lt!173863) lt!174264))) (size!2353 (buf!2761 (ite c!6942 (_2!4975 lt!174271) lt!174264)))))))

(assert (=> d!36950 (= (isPrefixOf!0 (ite c!6942 (_2!4975 lt!173863) lt!174264) (ite c!6942 (_2!4975 lt!174271) lt!174264)) e!75285)))

(declare-fun b!114823 () Bool)

(declare-fun res!94861 () Bool)

(assert (=> b!114823 (=> (not res!94861) (not e!75285))))

(assert (=> b!114823 (= res!94861 (bvsle (bitIndex!0 (size!2353 (buf!2761 (ite c!6942 (_2!4975 lt!173863) lt!174264))) (currentByte!5368 (ite c!6942 (_2!4975 lt!173863) lt!174264)) (currentBit!5363 (ite c!6942 (_2!4975 lt!173863) lt!174264))) (bitIndex!0 (size!2353 (buf!2761 (ite c!6942 (_2!4975 lt!174271) lt!174264))) (currentByte!5368 (ite c!6942 (_2!4975 lt!174271) lt!174264)) (currentBit!5363 (ite c!6942 (_2!4975 lt!174271) lt!174264)))))))

(declare-fun b!114824 () Bool)

(declare-fun e!75284 () Bool)

(assert (=> b!114824 (= e!75285 e!75284)))

(declare-fun res!94862 () Bool)

(assert (=> b!114824 (=> res!94862 e!75284)))

(assert (=> b!114824 (= res!94862 (= (size!2353 (buf!2761 (ite c!6942 (_2!4975 lt!173863) lt!174264))) #b00000000000000000000000000000000))))

(declare-fun b!114825 () Bool)

(assert (=> b!114825 (= e!75284 (arrayBitRangesEq!0 (buf!2761 (ite c!6942 (_2!4975 lt!173863) lt!174264)) (buf!2761 (ite c!6942 (_2!4975 lt!174271) lt!174264)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2353 (buf!2761 (ite c!6942 (_2!4975 lt!173863) lt!174264))) (currentByte!5368 (ite c!6942 (_2!4975 lt!173863) lt!174264)) (currentBit!5363 (ite c!6942 (_2!4975 lt!173863) lt!174264)))))))

(assert (= (and d!36950 res!94863) b!114823))

(assert (= (and b!114823 res!94861) b!114824))

(assert (= (and b!114824 (not res!94862)) b!114825))

(declare-fun m!171627 () Bool)

(assert (=> b!114823 m!171627))

(declare-fun m!171629 () Bool)

(assert (=> b!114823 m!171629))

(assert (=> b!114825 m!171627))

(assert (=> b!114825 m!171627))

(declare-fun m!171631 () Bool)

(assert (=> b!114825 m!171631))

(assert (=> bm!1475 d!36950))

(declare-fun d!36952 () Bool)

(assert (=> d!36952 (= (remainingBits!0 ((_ sign_extend 32) (size!2353 (buf!2761 thiss!1305))) ((_ sign_extend 32) (currentByte!5368 thiss!1305)) ((_ sign_extend 32) (currentBit!5363 thiss!1305))) (bvsub (bvmul ((_ sign_extend 32) (size!2353 (buf!2761 thiss!1305))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5368 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5363 thiss!1305)))))))

(assert (=> d!36720 d!36952))

(declare-fun d!36954 () Bool)

(assert (=> d!36954 (= (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!2353 (buf!2761 (_2!4975 lt!173863))) (currentByte!5368 thiss!1305) (currentBit!5363 thiss!1305)))) (tuple4!85 ((_ extract 31 0) (bvadd (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!2353 (buf!2761 (_2!4975 lt!173863))) (currentByte!5368 thiss!1305) (currentBit!5363 thiss!1305))) #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!2353 (buf!2761 (_2!4975 lt!173863))) (currentByte!5368 thiss!1305) (currentBit!5363 thiss!1305))) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!114588 d!36954))

(declare-fun d!36956 () Bool)

(declare-fun res!94868 () Bool)

(declare-fun e!75290 () Bool)

(assert (=> d!36956 (=> res!94868 e!75290)))

(assert (=> d!36956 (= res!94868 (= (_1!4987 lt!174323) (_2!4987 lt!174323)))))

(assert (=> d!36956 (= (arrayRangesEq!43 (buf!2761 (_2!4975 lt!173863)) (buf!2761 (_2!4975 lt!173865)) (_1!4987 lt!174323) (_2!4987 lt!174323)) e!75290)))

(declare-fun b!114830 () Bool)

(declare-fun e!75291 () Bool)

(assert (=> b!114830 (= e!75290 e!75291)))

(declare-fun res!94869 () Bool)

(assert (=> b!114830 (=> (not res!94869) (not e!75291))))

(assert (=> b!114830 (= res!94869 (= (select (arr!2946 (buf!2761 (_2!4975 lt!173863))) (_1!4987 lt!174323)) (select (arr!2946 (buf!2761 (_2!4975 lt!173865))) (_1!4987 lt!174323))))))

(declare-fun b!114831 () Bool)

(assert (=> b!114831 (= e!75291 (arrayRangesEq!43 (buf!2761 (_2!4975 lt!173863)) (buf!2761 (_2!4975 lt!173865)) (bvadd (_1!4987 lt!174323) #b00000000000000000000000000000001) (_2!4987 lt!174323)))))

(assert (= (and d!36956 (not res!94868)) b!114830))

(assert (= (and b!114830 res!94869) b!114831))

(declare-fun m!171633 () Bool)

(assert (=> b!114830 m!171633))

(declare-fun m!171635 () Bool)

(assert (=> b!114830 m!171635))

(declare-fun m!171637 () Bool)

(assert (=> b!114831 m!171637))

(assert (=> b!114586 d!36956))

(assert (=> d!36772 d!36952))

(assert (=> d!36772 d!36924))

(declare-fun d!36958 () Bool)

(declare-fun e!75292 () Bool)

(assert (=> d!36958 e!75292))

(declare-fun res!94870 () Bool)

(assert (=> d!36958 (=> (not res!94870) (not e!75292))))

(declare-fun lt!174889 () (_ BitVec 64))

(declare-fun lt!174887 () (_ BitVec 64))

(declare-fun lt!174890 () (_ BitVec 64))

(assert (=> d!36958 (= res!94870 (= lt!174887 (bvsub lt!174889 lt!174890)))))

(assert (=> d!36958 (or (= (bvand lt!174889 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!174890 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!174889 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!174889 lt!174890) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!36958 (= lt!174890 (remainingBits!0 ((_ sign_extend 32) (size!2353 (buf!2761 (_2!4975 lt!174289)))) ((_ sign_extend 32) (currentByte!5368 (_2!4975 lt!174289))) ((_ sign_extend 32) (currentBit!5363 (_2!4975 lt!174289)))))))

(declare-fun lt!174888 () (_ BitVec 64))

(declare-fun lt!174886 () (_ BitVec 64))

(assert (=> d!36958 (= lt!174889 (bvmul lt!174888 lt!174886))))

(assert (=> d!36958 (or (= lt!174888 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!174886 (bvsdiv (bvmul lt!174888 lt!174886) lt!174888)))))

(assert (=> d!36958 (= lt!174886 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!36958 (= lt!174888 ((_ sign_extend 32) (size!2353 (buf!2761 (_2!4975 lt!174289)))))))

(assert (=> d!36958 (= lt!174887 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5368 (_2!4975 lt!174289))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5363 (_2!4975 lt!174289)))))))

(assert (=> d!36958 (invariant!0 (currentBit!5363 (_2!4975 lt!174289)) (currentByte!5368 (_2!4975 lt!174289)) (size!2353 (buf!2761 (_2!4975 lt!174289))))))

(assert (=> d!36958 (= (bitIndex!0 (size!2353 (buf!2761 (_2!4975 lt!174289))) (currentByte!5368 (_2!4975 lt!174289)) (currentBit!5363 (_2!4975 lt!174289))) lt!174887)))

(declare-fun b!114832 () Bool)

(declare-fun res!94871 () Bool)

(assert (=> b!114832 (=> (not res!94871) (not e!75292))))

(assert (=> b!114832 (= res!94871 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!174887))))

(declare-fun b!114833 () Bool)

(declare-fun lt!174885 () (_ BitVec 64))

(assert (=> b!114833 (= e!75292 (bvsle lt!174887 (bvmul lt!174885 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!114833 (or (= lt!174885 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!174885 #b0000000000000000000000000000000000000000000000000000000000001000) lt!174885)))))

(assert (=> b!114833 (= lt!174885 ((_ sign_extend 32) (size!2353 (buf!2761 (_2!4975 lt!174289)))))))

(assert (= (and d!36958 res!94870) b!114832))

(assert (= (and b!114832 res!94871) b!114833))

(declare-fun m!171639 () Bool)

(assert (=> d!36958 m!171639))

(declare-fun m!171641 () Bool)

(assert (=> d!36958 m!171641))

(assert (=> b!114539 d!36958))

(assert (=> b!114539 d!36770))

(declare-fun d!36960 () Bool)

(declare-fun lt!174891 () tuple2!9448)

(assert (=> d!36960 (= lt!174891 (readBit!0 (readerFrom!0 (_2!4975 lt!174271) (currentBit!5363 (_2!4975 lt!173863)) (currentByte!5368 (_2!4975 lt!173863)))))))

(assert (=> d!36960 (= (readBitPure!0 (readerFrom!0 (_2!4975 lt!174271) (currentBit!5363 (_2!4975 lt!173863)) (currentByte!5368 (_2!4975 lt!173863)))) (tuple2!9429 (_2!4989 lt!174891) (_1!4989 lt!174891)))))

(declare-fun bs!8953 () Bool)

(assert (= bs!8953 d!36960))

(assert (=> bs!8953 m!170937))

(declare-fun m!171643 () Bool)

(assert (=> bs!8953 m!171643))

(assert (=> b!114537 d!36960))

(declare-fun d!36962 () Bool)

(declare-fun e!75293 () Bool)

(assert (=> d!36962 e!75293))

(declare-fun res!94872 () Bool)

(assert (=> d!36962 (=> (not res!94872) (not e!75293))))

(assert (=> d!36962 (= res!94872 (invariant!0 (currentBit!5363 (_2!4975 lt!174271)) (currentByte!5368 (_2!4975 lt!174271)) (size!2353 (buf!2761 (_2!4975 lt!174271)))))))

(assert (=> d!36962 (= (readerFrom!0 (_2!4975 lt!174271) (currentBit!5363 (_2!4975 lt!173863)) (currentByte!5368 (_2!4975 lt!173863))) (BitStream!4181 (buf!2761 (_2!4975 lt!174271)) (currentByte!5368 (_2!4975 lt!173863)) (currentBit!5363 (_2!4975 lt!173863))))))

(declare-fun b!114834 () Bool)

(assert (=> b!114834 (= e!75293 (invariant!0 (currentBit!5363 (_2!4975 lt!173863)) (currentByte!5368 (_2!4975 lt!173863)) (size!2353 (buf!2761 (_2!4975 lt!174271)))))))

(assert (= (and d!36962 res!94872) b!114834))

(declare-fun m!171645 () Bool)

(assert (=> d!36962 m!171645))

(declare-fun m!171647 () Bool)

(assert (=> b!114834 m!171647))

(assert (=> b!114537 d!36962))

(declare-fun lt!174893 () (_ BitVec 32))

(declare-fun lt!174892 () (_ BitVec 32))

(declare-fun lt!174894 () tuple4!84)

(declare-fun c!6966 () Bool)

(declare-fun bm!1486 () Bool)

(declare-fun call!1489 () Bool)

(assert (=> bm!1486 (= call!1489 (byteRangesEq!0 (ite c!6966 (select (arr!2946 (buf!2761 thiss!1305)) (_3!263 lt!174894)) (select (arr!2946 (buf!2761 thiss!1305)) (_4!42 lt!174894))) (ite c!6966 (select (arr!2946 (buf!2761 (_2!4975 lt!173865))) (_3!263 lt!174894)) (select (arr!2946 (buf!2761 (_2!4975 lt!173865))) (_4!42 lt!174894))) (ite c!6966 lt!174892 #b00000000000000000000000000000000) lt!174893))))

(declare-fun b!114835 () Bool)

(declare-fun e!75294 () Bool)

(assert (=> b!114835 (= e!75294 call!1489)))

(declare-fun b!114836 () Bool)

(declare-fun e!75295 () Bool)

(declare-fun e!75296 () Bool)

(assert (=> b!114836 (= e!75295 e!75296)))

(assert (=> b!114836 (= c!6966 (= (_3!263 lt!174894) (_4!42 lt!174894)))))

(declare-fun b!114837 () Bool)

(declare-fun e!75298 () Bool)

(assert (=> b!114837 (= e!75298 (arrayRangesEq!43 (buf!2761 thiss!1305) (buf!2761 (_2!4975 lt!173865)) (_1!4987 lt!174894) (_2!4987 lt!174894)))))

(declare-fun b!114838 () Bool)

(declare-fun res!94877 () Bool)

(assert (=> b!114838 (= res!94877 (= lt!174893 #b00000000000000000000000000000000))))

(assert (=> b!114838 (=> res!94877 e!75294)))

(declare-fun e!75299 () Bool)

(assert (=> b!114838 (= e!75299 e!75294)))

(declare-fun d!36964 () Bool)

(declare-fun res!94875 () Bool)

(declare-fun e!75297 () Bool)

(assert (=> d!36964 (=> res!94875 e!75297)))

(assert (=> d!36964 (= res!94875 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2353 (buf!2761 thiss!1305)) (currentByte!5368 thiss!1305) (currentBit!5363 thiss!1305))))))

(assert (=> d!36964 (= (arrayBitRangesEq!0 (buf!2761 thiss!1305) (buf!2761 (_2!4975 lt!173865)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2353 (buf!2761 thiss!1305)) (currentByte!5368 thiss!1305) (currentBit!5363 thiss!1305))) e!75297)))

(declare-fun b!114839 () Bool)

(assert (=> b!114839 (= e!75297 e!75295)))

(declare-fun res!94873 () Bool)

(assert (=> b!114839 (=> (not res!94873) (not e!75295))))

(assert (=> b!114839 (= res!94873 e!75298)))

(declare-fun res!94874 () Bool)

(assert (=> b!114839 (=> res!94874 e!75298)))

(assert (=> b!114839 (= res!94874 (bvsge (_1!4987 lt!174894) (_2!4987 lt!174894)))))

(assert (=> b!114839 (= lt!174893 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!2353 (buf!2761 thiss!1305)) (currentByte!5368 thiss!1305) (currentBit!5363 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!114839 (= lt!174892 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!114839 (= lt!174894 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2353 (buf!2761 thiss!1305)) (currentByte!5368 thiss!1305) (currentBit!5363 thiss!1305))))))

(declare-fun b!114840 () Bool)

(assert (=> b!114840 (= e!75296 e!75299)))

(declare-fun res!94876 () Bool)

(assert (=> b!114840 (= res!94876 (byteRangesEq!0 (select (arr!2946 (buf!2761 thiss!1305)) (_3!263 lt!174894)) (select (arr!2946 (buf!2761 (_2!4975 lt!173865))) (_3!263 lt!174894)) lt!174892 #b00000000000000000000000000001000))))

(assert (=> b!114840 (=> (not res!94876) (not e!75299))))

(declare-fun b!114841 () Bool)

(assert (=> b!114841 (= e!75296 call!1489)))

(assert (= (and d!36964 (not res!94875)) b!114839))

(assert (= (and b!114839 (not res!94874)) b!114837))

(assert (= (and b!114839 res!94873) b!114836))

(assert (= (and b!114836 c!6966) b!114841))

(assert (= (and b!114836 (not c!6966)) b!114840))

(assert (= (and b!114840 res!94876) b!114838))

(assert (= (and b!114838 (not res!94877)) b!114835))

(assert (= (or b!114841 b!114835) bm!1486))

(declare-fun m!171649 () Bool)

(assert (=> bm!1486 m!171649))

(declare-fun m!171651 () Bool)

(assert (=> bm!1486 m!171651))

(declare-fun m!171653 () Bool)

(assert (=> bm!1486 m!171653))

(declare-fun m!171655 () Bool)

(assert (=> bm!1486 m!171655))

(declare-fun m!171657 () Bool)

(assert (=> bm!1486 m!171657))

(declare-fun m!171659 () Bool)

(assert (=> b!114837 m!171659))

(assert (=> b!114839 m!170667))

(assert (=> b!114839 m!171561))

(assert (=> b!114840 m!171657))

(assert (=> b!114840 m!171655))

(assert (=> b!114840 m!171657))

(assert (=> b!114840 m!171655))

(declare-fun m!171661 () Bool)

(assert (=> b!114840 m!171661))

(assert (=> b!114421 d!36964))

(assert (=> b!114421 d!36772))

(declare-fun d!36966 () Bool)

(assert (=> d!36966 (= (remainingBits!0 ((_ sign_extend 32) (size!2353 (buf!2761 (_1!4976 lt!173867)))) ((_ sign_extend 32) (currentByte!5368 (_1!4976 lt!173867))) ((_ sign_extend 32) (currentBit!5363 (_1!4976 lt!173867)))) (bvsub (bvmul ((_ sign_extend 32) (size!2353 (buf!2761 (_1!4976 lt!173867)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5368 (_1!4976 lt!173867))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5363 (_1!4976 lt!173867))))))))

(assert (=> d!36706 d!36966))

(declare-fun d!36968 () Bool)

(assert (=> d!36968 (= (invariant!0 (currentBit!5363 (_1!4976 lt!173867)) (currentByte!5368 (_1!4976 lt!173867)) (size!2353 (buf!2761 (_1!4976 lt!173867)))) (and (bvsge (currentBit!5363 (_1!4976 lt!173867)) #b00000000000000000000000000000000) (bvslt (currentBit!5363 (_1!4976 lt!173867)) #b00000000000000000000000000001000) (bvsge (currentByte!5368 (_1!4976 lt!173867)) #b00000000000000000000000000000000) (or (bvslt (currentByte!5368 (_1!4976 lt!173867)) (size!2353 (buf!2761 (_1!4976 lt!173867)))) (and (= (currentBit!5363 (_1!4976 lt!173867)) #b00000000000000000000000000000000) (= (currentByte!5368 (_1!4976 lt!173867)) (size!2353 (buf!2761 (_1!4976 lt!173867))))))))))

(assert (=> d!36706 d!36968))

(declare-fun d!36970 () Bool)

(assert (=> d!36970 (= (invariant!0 (currentBit!5363 (_2!4975 lt!173863)) (currentByte!5368 (_2!4975 lt!173863)) (size!2353 (buf!2761 (_2!4975 lt!174281)))) (and (bvsge (currentBit!5363 (_2!4975 lt!173863)) #b00000000000000000000000000000000) (bvslt (currentBit!5363 (_2!4975 lt!173863)) #b00000000000000000000000000001000) (bvsge (currentByte!5368 (_2!4975 lt!173863)) #b00000000000000000000000000000000) (or (bvslt (currentByte!5368 (_2!4975 lt!173863)) (size!2353 (buf!2761 (_2!4975 lt!174281)))) (and (= (currentBit!5363 (_2!4975 lt!173863)) #b00000000000000000000000000000000) (= (currentByte!5368 (_2!4975 lt!173863)) (size!2353 (buf!2761 (_2!4975 lt!174281))))))))))

(assert (=> b!114536 d!36970))

(declare-fun d!36972 () Bool)

(declare-fun e!75302 () Bool)

(assert (=> d!36972 e!75302))

(declare-fun res!94880 () Bool)

(assert (=> d!36972 (=> (not res!94880) (not e!75302))))

(declare-fun lt!174900 () (_ BitVec 64))

(declare-fun lt!174899 () BitStream!4180)

(assert (=> d!36972 (= res!94880 (= (bvadd lt!174900 (bvsub (bitIndex!0 (size!2353 (buf!2761 (_2!4975 lt!173863))) (currentByte!5368 (_2!4975 lt!173863)) (currentBit!5363 (_2!4975 lt!173863))) (bitIndex!0 (size!2353 (buf!2761 (_2!4975 lt!174247))) (currentByte!5368 (_2!4975 lt!174247)) (currentBit!5363 (_2!4975 lt!174247))))) (bitIndex!0 (size!2353 (buf!2761 lt!174899)) (currentByte!5368 lt!174899) (currentBit!5363 lt!174899))))))

(assert (=> d!36972 (or (not (= (bvand lt!174900 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bitIndex!0 (size!2353 (buf!2761 (_2!4975 lt!173863))) (currentByte!5368 (_2!4975 lt!173863)) (currentBit!5363 (_2!4975 lt!173863))) (bitIndex!0 (size!2353 (buf!2761 (_2!4975 lt!174247))) (currentByte!5368 (_2!4975 lt!174247)) (currentBit!5363 (_2!4975 lt!174247)))) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!174900 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!174900 (bvsub (bitIndex!0 (size!2353 (buf!2761 (_2!4975 lt!173863))) (currentByte!5368 (_2!4975 lt!173863)) (currentBit!5363 (_2!4975 lt!173863))) (bitIndex!0 (size!2353 (buf!2761 (_2!4975 lt!174247))) (currentByte!5368 (_2!4975 lt!174247)) (currentBit!5363 (_2!4975 lt!174247))))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!36972 (= lt!174900 (bitIndex!0 (size!2353 (buf!2761 (_2!4985 lt!174258))) (currentByte!5368 (_2!4985 lt!174258)) (currentBit!5363 (_2!4985 lt!174258))))))

(declare-fun moveBitIndex!0 (BitStream!4180 (_ BitVec 64)) tuple2!9426)

(assert (=> d!36972 (= lt!174899 (_2!4975 (moveBitIndex!0 (_2!4985 lt!174258) (bvsub (bitIndex!0 (size!2353 (buf!2761 (_2!4975 lt!173863))) (currentByte!5368 (_2!4975 lt!173863)) (currentBit!5363 (_2!4975 lt!173863))) (bitIndex!0 (size!2353 (buf!2761 (_2!4975 lt!174247))) (currentByte!5368 (_2!4975 lt!174247)) (currentBit!5363 (_2!4975 lt!174247)))))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!4180 (_ BitVec 64)) Bool)

(assert (=> d!36972 (moveBitIndexPrecond!0 (_2!4985 lt!174258) (bvsub (bitIndex!0 (size!2353 (buf!2761 (_2!4975 lt!173863))) (currentByte!5368 (_2!4975 lt!173863)) (currentBit!5363 (_2!4975 lt!173863))) (bitIndex!0 (size!2353 (buf!2761 (_2!4975 lt!174247))) (currentByte!5368 (_2!4975 lt!174247)) (currentBit!5363 (_2!4975 lt!174247)))))))

(assert (=> d!36972 (= (withMovedBitIndex!0 (_2!4985 lt!174258) (bvsub (bitIndex!0 (size!2353 (buf!2761 (_2!4975 lt!173863))) (currentByte!5368 (_2!4975 lt!173863)) (currentBit!5363 (_2!4975 lt!173863))) (bitIndex!0 (size!2353 (buf!2761 (_2!4975 lt!174247))) (currentByte!5368 (_2!4975 lt!174247)) (currentBit!5363 (_2!4975 lt!174247))))) lt!174899)))

(declare-fun b!114844 () Bool)

(assert (=> b!114844 (= e!75302 (= (size!2353 (buf!2761 (_2!4985 lt!174258))) (size!2353 (buf!2761 lt!174899))))))

(assert (= (and d!36972 res!94880) b!114844))

(declare-fun m!171663 () Bool)

(assert (=> d!36972 m!171663))

(declare-fun m!171665 () Bool)

(assert (=> d!36972 m!171665))

(declare-fun m!171667 () Bool)

(assert (=> d!36972 m!171667))

(declare-fun m!171669 () Bool)

(assert (=> d!36972 m!171669))

(assert (=> b!114536 d!36972))

(declare-fun d!36974 () Bool)

(assert (=> d!36974 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2353 (buf!2761 (_2!4975 lt!174247)))) ((_ sign_extend 32) (currentByte!5368 (_2!4975 lt!174281))) ((_ sign_extend 32) (currentBit!5363 (_2!4975 lt!174281))) lt!174275) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2353 (buf!2761 (_2!4975 lt!174247)))) ((_ sign_extend 32) (currentByte!5368 (_2!4975 lt!174281))) ((_ sign_extend 32) (currentBit!5363 (_2!4975 lt!174281)))) lt!174275))))

(declare-fun bs!8954 () Bool)

(assert (= bs!8954 d!36974))

(declare-fun m!171671 () Bool)

(assert (=> bs!8954 m!171671))

(assert (=> b!114536 d!36974))

(declare-fun d!36976 () Bool)

(assert (=> d!36976 (validate_offset_bits!1 ((_ sign_extend 32) (size!2353 (buf!2761 (_2!4975 lt!174247)))) ((_ sign_extend 32) (currentByte!5368 (_2!4975 lt!173863))) ((_ sign_extend 32) (currentBit!5363 (_2!4975 lt!173863))) lt!174269)))

(declare-fun lt!174901 () Unit!7027)

(assert (=> d!36976 (= lt!174901 (choose!9 (_2!4975 lt!173863) (buf!2761 (_2!4975 lt!174247)) lt!174269 (BitStream!4181 (buf!2761 (_2!4975 lt!174247)) (currentByte!5368 (_2!4975 lt!173863)) (currentBit!5363 (_2!4975 lt!173863)))))))

(assert (=> d!36976 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4975 lt!173863) (buf!2761 (_2!4975 lt!174247)) lt!174269) lt!174901)))

(declare-fun bs!8955 () Bool)

(assert (= bs!8955 d!36976))

(assert (=> bs!8955 m!170955))

(declare-fun m!171673 () Bool)

(assert (=> bs!8955 m!171673))

(assert (=> b!114536 d!36976))

(declare-fun d!36978 () Bool)

(declare-fun lt!174902 () tuple2!9448)

(assert (=> d!36978 (= lt!174902 (readBit!0 lt!174266))))

(assert (=> d!36978 (= (readBitPure!0 lt!174266) (tuple2!9429 (_2!4989 lt!174902) (_1!4989 lt!174902)))))

(declare-fun bs!8956 () Bool)

(assert (= bs!8956 d!36978))

(declare-fun m!171675 () Bool)

(assert (=> bs!8956 m!171675))

(assert (=> b!114536 d!36978))

(declare-fun lt!174903 () tuple2!9458)

(declare-fun d!36980 () Bool)

(assert (=> d!36980 (= lt!174903 (readNLeastSignificantBitsLoop!0 (_1!4985 lt!174258) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!174287))))

(assert (=> d!36980 (= (readNLeastSignificantBitsLoopPure!0 (_1!4985 lt!174258) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!174287) (tuple2!9447 (_2!4994 lt!174903) (_1!4994 lt!174903)))))

(declare-fun bs!8957 () Bool)

(assert (= bs!8957 d!36980))

(declare-fun m!171677 () Bool)

(assert (=> bs!8957 m!171677))

(assert (=> b!114536 d!36980))

(assert (=> b!114536 d!36944))

(declare-fun d!36982 () Bool)

(declare-fun res!94883 () Bool)

(declare-fun e!75304 () Bool)

(assert (=> d!36982 (=> (not res!94883) (not e!75304))))

(assert (=> d!36982 (= res!94883 (= (size!2353 (buf!2761 (_2!4975 lt!173863))) (size!2353 (buf!2761 (_2!4975 lt!174247)))))))

(assert (=> d!36982 (= (isPrefixOf!0 (_2!4975 lt!173863) (_2!4975 lt!174247)) e!75304)))

(declare-fun b!114845 () Bool)

(declare-fun res!94881 () Bool)

(assert (=> b!114845 (=> (not res!94881) (not e!75304))))

(assert (=> b!114845 (= res!94881 (bvsle (bitIndex!0 (size!2353 (buf!2761 (_2!4975 lt!173863))) (currentByte!5368 (_2!4975 lt!173863)) (currentBit!5363 (_2!4975 lt!173863))) (bitIndex!0 (size!2353 (buf!2761 (_2!4975 lt!174247))) (currentByte!5368 (_2!4975 lt!174247)) (currentBit!5363 (_2!4975 lt!174247)))))))

(declare-fun b!114846 () Bool)

(declare-fun e!75303 () Bool)

(assert (=> b!114846 (= e!75304 e!75303)))

(declare-fun res!94882 () Bool)

(assert (=> b!114846 (=> res!94882 e!75303)))

(assert (=> b!114846 (= res!94882 (= (size!2353 (buf!2761 (_2!4975 lt!173863))) #b00000000000000000000000000000000))))

(declare-fun b!114847 () Bool)

(assert (=> b!114847 (= e!75303 (arrayBitRangesEq!0 (buf!2761 (_2!4975 lt!173863)) (buf!2761 (_2!4975 lt!174247)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2353 (buf!2761 (_2!4975 lt!173863))) (currentByte!5368 (_2!4975 lt!173863)) (currentBit!5363 (_2!4975 lt!173863)))))))

(assert (= (and d!36982 res!94883) b!114845))

(assert (= (and b!114845 res!94881) b!114846))

(assert (= (and b!114846 (not res!94882)) b!114847))

(assert (=> b!114845 m!170665))

(assert (=> b!114845 m!170991))

(assert (=> b!114847 m!170665))

(assert (=> b!114847 m!170665))

(declare-fun m!171679 () Bool)

(assert (=> b!114847 m!171679))

(assert (=> b!114536 d!36982))

(declare-fun d!36984 () Bool)

(assert (=> d!36984 (validate_offset_bits!1 ((_ sign_extend 32) (size!2353 (buf!2761 (_2!4975 lt!174247)))) ((_ sign_extend 32) (currentByte!5368 (_2!4975 lt!174281))) ((_ sign_extend 32) (currentBit!5363 (_2!4975 lt!174281))) lt!174275)))

(declare-fun lt!174904 () Unit!7027)

(assert (=> d!36984 (= lt!174904 (choose!9 (_2!4975 lt!174281) (buf!2761 (_2!4975 lt!174247)) lt!174275 (BitStream!4181 (buf!2761 (_2!4975 lt!174247)) (currentByte!5368 (_2!4975 lt!174281)) (currentBit!5363 (_2!4975 lt!174281)))))))

(assert (=> d!36984 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4975 lt!174281) (buf!2761 (_2!4975 lt!174247)) lt!174275) lt!174904)))

(declare-fun bs!8958 () Bool)

(assert (= bs!8958 d!36984))

(assert (=> bs!8958 m!170943))

(declare-fun m!171681 () Bool)

(assert (=> bs!8958 m!171681))

(assert (=> b!114536 d!36984))

(declare-fun d!36986 () Bool)

(assert (=> d!36986 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2353 (buf!2761 (_2!4975 lt!174247)))) ((_ sign_extend 32) (currentByte!5368 (_2!4975 lt!173863))) ((_ sign_extend 32) (currentBit!5363 (_2!4975 lt!173863))) lt!174269) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2353 (buf!2761 (_2!4975 lt!174247)))) ((_ sign_extend 32) (currentByte!5368 (_2!4975 lt!173863))) ((_ sign_extend 32) (currentBit!5363 (_2!4975 lt!173863)))) lt!174269))))

(declare-fun bs!8959 () Bool)

(assert (= bs!8959 d!36986))

(declare-fun m!171683 () Bool)

(assert (=> bs!8959 m!171683))

(assert (=> b!114536 d!36986))

(declare-fun d!36988 () Bool)

(declare-fun e!75305 () Bool)

(assert (=> d!36988 e!75305))

(declare-fun res!94884 () Bool)

(assert (=> d!36988 (=> (not res!94884) (not e!75305))))

(declare-fun lt!174906 () (_ BitVec 64))

(declare-fun lt!174905 () BitStream!4180)

(assert (=> d!36988 (= res!94884 (= (bvadd lt!174906 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!2353 (buf!2761 lt!174905)) (currentByte!5368 lt!174905) (currentBit!5363 lt!174905))))))

(assert (=> d!36988 (or (not (= (bvand lt!174906 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!174906 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!174906 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!36988 (= lt!174906 (bitIndex!0 (size!2353 (buf!2761 (_1!4985 lt!174258))) (currentByte!5368 (_1!4985 lt!174258)) (currentBit!5363 (_1!4985 lt!174258))))))

(assert (=> d!36988 (= lt!174905 (_2!4975 (moveBitIndex!0 (_1!4985 lt!174258) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!36988 (moveBitIndexPrecond!0 (_1!4985 lt!174258) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!36988 (= (withMovedBitIndex!0 (_1!4985 lt!174258) #b0000000000000000000000000000000000000000000000000000000000000001) lt!174905)))

(declare-fun b!114848 () Bool)

(assert (=> b!114848 (= e!75305 (= (size!2353 (buf!2761 (_1!4985 lt!174258))) (size!2353 (buf!2761 lt!174905))))))

(assert (= (and d!36988 res!94884) b!114848))

(declare-fun m!171685 () Bool)

(assert (=> d!36988 m!171685))

(declare-fun m!171687 () Bool)

(assert (=> d!36988 m!171687))

(declare-fun m!171689 () Bool)

(assert (=> d!36988 m!171689))

(declare-fun m!171691 () Bool)

(assert (=> d!36988 m!171691))

(assert (=> b!114536 d!36988))

(declare-fun d!36990 () Bool)

(declare-fun e!75306 () Bool)

(assert (=> d!36990 e!75306))

(declare-fun res!94886 () Bool)

(assert (=> d!36990 (=> (not res!94886) (not e!75306))))

(declare-fun lt!174916 () tuple2!9444)

(assert (=> d!36990 (= res!94886 (isPrefixOf!0 (_1!4985 lt!174916) (_2!4985 lt!174916)))))

(declare-fun lt!174911 () BitStream!4180)

(assert (=> d!36990 (= lt!174916 (tuple2!9445 lt!174911 (_2!4975 lt!174247)))))

(declare-fun lt!174925 () Unit!7027)

(declare-fun lt!174917 () Unit!7027)

(assert (=> d!36990 (= lt!174925 lt!174917)))

(assert (=> d!36990 (isPrefixOf!0 lt!174911 (_2!4975 lt!174247))))

(assert (=> d!36990 (= lt!174917 (lemmaIsPrefixTransitive!0 lt!174911 (_2!4975 lt!174247) (_2!4975 lt!174247)))))

(declare-fun lt!174918 () Unit!7027)

(declare-fun lt!174912 () Unit!7027)

(assert (=> d!36990 (= lt!174918 lt!174912)))

(assert (=> d!36990 (isPrefixOf!0 lt!174911 (_2!4975 lt!174247))))

(assert (=> d!36990 (= lt!174912 (lemmaIsPrefixTransitive!0 lt!174911 (_2!4975 lt!173863) (_2!4975 lt!174247)))))

(declare-fun lt!174924 () Unit!7027)

(declare-fun e!75307 () Unit!7027)

(assert (=> d!36990 (= lt!174924 e!75307)))

(declare-fun c!6967 () Bool)

(assert (=> d!36990 (= c!6967 (not (= (size!2353 (buf!2761 (_2!4975 lt!173863))) #b00000000000000000000000000000000)))))

(declare-fun lt!174908 () Unit!7027)

(declare-fun lt!174926 () Unit!7027)

(assert (=> d!36990 (= lt!174908 lt!174926)))

(assert (=> d!36990 (isPrefixOf!0 (_2!4975 lt!174247) (_2!4975 lt!174247))))

(assert (=> d!36990 (= lt!174926 (lemmaIsPrefixRefl!0 (_2!4975 lt!174247)))))

(declare-fun lt!174915 () Unit!7027)

(declare-fun lt!174921 () Unit!7027)

(assert (=> d!36990 (= lt!174915 lt!174921)))

(assert (=> d!36990 (= lt!174921 (lemmaIsPrefixRefl!0 (_2!4975 lt!174247)))))

(declare-fun lt!174907 () Unit!7027)

(declare-fun lt!174922 () Unit!7027)

(assert (=> d!36990 (= lt!174907 lt!174922)))

(assert (=> d!36990 (isPrefixOf!0 lt!174911 lt!174911)))

(assert (=> d!36990 (= lt!174922 (lemmaIsPrefixRefl!0 lt!174911))))

(declare-fun lt!174910 () Unit!7027)

(declare-fun lt!174914 () Unit!7027)

(assert (=> d!36990 (= lt!174910 lt!174914)))

(assert (=> d!36990 (isPrefixOf!0 (_2!4975 lt!173863) (_2!4975 lt!173863))))

(assert (=> d!36990 (= lt!174914 (lemmaIsPrefixRefl!0 (_2!4975 lt!173863)))))

(assert (=> d!36990 (= lt!174911 (BitStream!4181 (buf!2761 (_2!4975 lt!174247)) (currentByte!5368 (_2!4975 lt!173863)) (currentBit!5363 (_2!4975 lt!173863))))))

(assert (=> d!36990 (isPrefixOf!0 (_2!4975 lt!173863) (_2!4975 lt!174247))))

(assert (=> d!36990 (= (reader!0 (_2!4975 lt!173863) (_2!4975 lt!174247)) lt!174916)))

(declare-fun b!114849 () Bool)

(declare-fun lt!174920 () Unit!7027)

(assert (=> b!114849 (= e!75307 lt!174920)))

(declare-fun lt!174909 () (_ BitVec 64))

(assert (=> b!114849 (= lt!174909 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!174919 () (_ BitVec 64))

(assert (=> b!114849 (= lt!174919 (bitIndex!0 (size!2353 (buf!2761 (_2!4975 lt!173863))) (currentByte!5368 (_2!4975 lt!173863)) (currentBit!5363 (_2!4975 lt!173863))))))

(assert (=> b!114849 (= lt!174920 (arrayBitRangesEqSymmetric!0 (buf!2761 (_2!4975 lt!173863)) (buf!2761 (_2!4975 lt!174247)) lt!174909 lt!174919))))

(assert (=> b!114849 (arrayBitRangesEq!0 (buf!2761 (_2!4975 lt!174247)) (buf!2761 (_2!4975 lt!173863)) lt!174909 lt!174919)))

(declare-fun b!114850 () Bool)

(declare-fun res!94887 () Bool)

(assert (=> b!114850 (=> (not res!94887) (not e!75306))))

(assert (=> b!114850 (= res!94887 (isPrefixOf!0 (_1!4985 lt!174916) (_2!4975 lt!173863)))))

(declare-fun b!114851 () Bool)

(declare-fun Unit!7061 () Unit!7027)

(assert (=> b!114851 (= e!75307 Unit!7061)))

(declare-fun b!114852 () Bool)

(declare-fun res!94885 () Bool)

(assert (=> b!114852 (=> (not res!94885) (not e!75306))))

(assert (=> b!114852 (= res!94885 (isPrefixOf!0 (_2!4985 lt!174916) (_2!4975 lt!174247)))))

(declare-fun b!114853 () Bool)

(declare-fun lt!174923 () (_ BitVec 64))

(declare-fun lt!174913 () (_ BitVec 64))

(assert (=> b!114853 (= e!75306 (= (_1!4985 lt!174916) (withMovedBitIndex!0 (_2!4985 lt!174916) (bvsub lt!174913 lt!174923))))))

(assert (=> b!114853 (or (= (bvand lt!174913 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!174923 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!174913 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!174913 lt!174923) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!114853 (= lt!174923 (bitIndex!0 (size!2353 (buf!2761 (_2!4975 lt!174247))) (currentByte!5368 (_2!4975 lt!174247)) (currentBit!5363 (_2!4975 lt!174247))))))

(assert (=> b!114853 (= lt!174913 (bitIndex!0 (size!2353 (buf!2761 (_2!4975 lt!173863))) (currentByte!5368 (_2!4975 lt!173863)) (currentBit!5363 (_2!4975 lt!173863))))))

(assert (= (and d!36990 c!6967) b!114849))

(assert (= (and d!36990 (not c!6967)) b!114851))

(assert (= (and d!36990 res!94886) b!114850))

(assert (= (and b!114850 res!94887) b!114852))

(assert (= (and b!114852 res!94885) b!114853))

(declare-fun m!171693 () Bool)

(assert (=> b!114850 m!171693))

(declare-fun m!171695 () Bool)

(assert (=> b!114853 m!171695))

(assert (=> b!114853 m!170991))

(assert (=> b!114853 m!170665))

(declare-fun m!171697 () Bool)

(assert (=> b!114852 m!171697))

(assert (=> b!114849 m!170665))

(declare-fun m!171699 () Bool)

(assert (=> b!114849 m!171699))

(declare-fun m!171701 () Bool)

(assert (=> b!114849 m!171701))

(declare-fun m!171703 () Bool)

(assert (=> d!36990 m!171703))

(declare-fun m!171705 () Bool)

(assert (=> d!36990 m!171705))

(assert (=> d!36990 m!171605))

(declare-fun m!171707 () Bool)

(assert (=> d!36990 m!171707))

(assert (=> d!36990 m!170975))

(declare-fun m!171709 () Bool)

(assert (=> d!36990 m!171709))

(declare-fun m!171711 () Bool)

(assert (=> d!36990 m!171711))

(declare-fun m!171713 () Bool)

(assert (=> d!36990 m!171713))

(declare-fun m!171715 () Bool)

(assert (=> d!36990 m!171715))

(assert (=> d!36990 m!171617))

(declare-fun m!171717 () Bool)

(assert (=> d!36990 m!171717))

(assert (=> b!114536 d!36990))

(declare-fun d!36992 () Bool)

(declare-fun lt!174944 () tuple2!9446)

(declare-fun lt!174942 () tuple2!9446)

(assert (=> d!36992 (and (= (_2!4986 lt!174944) (_2!4986 lt!174942)) (= (_1!4986 lt!174944) (_1!4986 lt!174942)))))

(declare-fun lt!174943 () BitStream!4180)

(declare-fun lt!174940 () Unit!7027)

(declare-fun lt!174939 () (_ BitVec 64))

(declare-fun lt!174941 () Bool)

(declare-fun choose!45 (BitStream!4180 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!9446 tuple2!9446 BitStream!4180 (_ BitVec 64) Bool BitStream!4180 (_ BitVec 64) tuple2!9446 tuple2!9446 BitStream!4180 (_ BitVec 64)) Unit!7027)

(assert (=> d!36992 (= lt!174940 (choose!45 (_1!4985 lt!174258) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!174287 lt!174944 (tuple2!9447 (_1!4986 lt!174944) (_2!4986 lt!174944)) (_1!4986 lt!174944) (_2!4986 lt!174944) lt!174941 lt!174943 lt!174939 lt!174942 (tuple2!9447 (_1!4986 lt!174942) (_2!4986 lt!174942)) (_1!4986 lt!174942) (_2!4986 lt!174942)))))

(assert (=> d!36992 (= lt!174942 (readNLeastSignificantBitsLoopPure!0 lt!174943 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) lt!174939))))

(assert (=> d!36992 (= lt!174939 (bvor lt!174287 (ite lt!174941 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!36992 (= lt!174943 (withMovedBitIndex!0 (_1!4985 lt!174258) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!36992 (= lt!174941 (_2!4976 (readBitPure!0 (_1!4985 lt!174258))))))

(assert (=> d!36992 (= lt!174944 (readNLeastSignificantBitsLoopPure!0 (_1!4985 lt!174258) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!174287))))

(assert (=> d!36992 (= (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4985 lt!174258) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!174287) lt!174940)))

(declare-fun bs!8961 () Bool)

(assert (= bs!8961 d!36992))

(declare-fun m!171719 () Bool)

(assert (=> bs!8961 m!171719))

(assert (=> bs!8961 m!170963))

(assert (=> bs!8961 m!170989))

(declare-fun m!171721 () Bool)

(assert (=> bs!8961 m!171721))

(assert (=> bs!8961 m!170983))

(assert (=> b!114536 d!36992))

(declare-fun d!36994 () Bool)

(declare-fun lt!174945 () tuple2!9448)

(assert (=> d!36994 (= lt!174945 (readBit!0 lt!174286))))

(assert (=> d!36994 (= (readBitPure!0 lt!174286) (tuple2!9429 (_2!4989 lt!174945) (_1!4989 lt!174945)))))

(declare-fun bs!8962 () Bool)

(assert (= bs!8962 d!36994))

(declare-fun m!171723 () Bool)

(assert (=> bs!8962 m!171723))

(assert (=> b!114536 d!36994))

(declare-fun d!36996 () Bool)

(declare-fun e!75308 () Bool)

(assert (=> d!36996 e!75308))

(declare-fun res!94889 () Bool)

(assert (=> d!36996 (=> (not res!94889) (not e!75308))))

(declare-fun lt!174955 () tuple2!9444)

(assert (=> d!36996 (= res!94889 (isPrefixOf!0 (_1!4985 lt!174955) (_2!4985 lt!174955)))))

(declare-fun lt!174950 () BitStream!4180)

(assert (=> d!36996 (= lt!174955 (tuple2!9445 lt!174950 (_2!4975 lt!174247)))))

(declare-fun lt!174964 () Unit!7027)

(declare-fun lt!174956 () Unit!7027)

(assert (=> d!36996 (= lt!174964 lt!174956)))

(assert (=> d!36996 (isPrefixOf!0 lt!174950 (_2!4975 lt!174247))))

(assert (=> d!36996 (= lt!174956 (lemmaIsPrefixTransitive!0 lt!174950 (_2!4975 lt!174247) (_2!4975 lt!174247)))))

(declare-fun lt!174957 () Unit!7027)

(declare-fun lt!174951 () Unit!7027)

(assert (=> d!36996 (= lt!174957 lt!174951)))

(assert (=> d!36996 (isPrefixOf!0 lt!174950 (_2!4975 lt!174247))))

(assert (=> d!36996 (= lt!174951 (lemmaIsPrefixTransitive!0 lt!174950 (_2!4975 lt!174281) (_2!4975 lt!174247)))))

(declare-fun lt!174963 () Unit!7027)

(declare-fun e!75309 () Unit!7027)

(assert (=> d!36996 (= lt!174963 e!75309)))

(declare-fun c!6968 () Bool)

(assert (=> d!36996 (= c!6968 (not (= (size!2353 (buf!2761 (_2!4975 lt!174281))) #b00000000000000000000000000000000)))))

(declare-fun lt!174947 () Unit!7027)

(declare-fun lt!174965 () Unit!7027)

(assert (=> d!36996 (= lt!174947 lt!174965)))

(assert (=> d!36996 (isPrefixOf!0 (_2!4975 lt!174247) (_2!4975 lt!174247))))

(assert (=> d!36996 (= lt!174965 (lemmaIsPrefixRefl!0 (_2!4975 lt!174247)))))

(declare-fun lt!174954 () Unit!7027)

(declare-fun lt!174960 () Unit!7027)

(assert (=> d!36996 (= lt!174954 lt!174960)))

(assert (=> d!36996 (= lt!174960 (lemmaIsPrefixRefl!0 (_2!4975 lt!174247)))))

(declare-fun lt!174946 () Unit!7027)

(declare-fun lt!174961 () Unit!7027)

(assert (=> d!36996 (= lt!174946 lt!174961)))

(assert (=> d!36996 (isPrefixOf!0 lt!174950 lt!174950)))

(assert (=> d!36996 (= lt!174961 (lemmaIsPrefixRefl!0 lt!174950))))

(declare-fun lt!174949 () Unit!7027)

(declare-fun lt!174953 () Unit!7027)

(assert (=> d!36996 (= lt!174949 lt!174953)))

(assert (=> d!36996 (isPrefixOf!0 (_2!4975 lt!174281) (_2!4975 lt!174281))))

(assert (=> d!36996 (= lt!174953 (lemmaIsPrefixRefl!0 (_2!4975 lt!174281)))))

(assert (=> d!36996 (= lt!174950 (BitStream!4181 (buf!2761 (_2!4975 lt!174247)) (currentByte!5368 (_2!4975 lt!174281)) (currentBit!5363 (_2!4975 lt!174281))))))

(assert (=> d!36996 (isPrefixOf!0 (_2!4975 lt!174281) (_2!4975 lt!174247))))

(assert (=> d!36996 (= (reader!0 (_2!4975 lt!174281) (_2!4975 lt!174247)) lt!174955)))

(declare-fun b!114854 () Bool)

(declare-fun lt!174959 () Unit!7027)

(assert (=> b!114854 (= e!75309 lt!174959)))

(declare-fun lt!174948 () (_ BitVec 64))

(assert (=> b!114854 (= lt!174948 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!174958 () (_ BitVec 64))

(assert (=> b!114854 (= lt!174958 (bitIndex!0 (size!2353 (buf!2761 (_2!4975 lt!174281))) (currentByte!5368 (_2!4975 lt!174281)) (currentBit!5363 (_2!4975 lt!174281))))))

(assert (=> b!114854 (= lt!174959 (arrayBitRangesEqSymmetric!0 (buf!2761 (_2!4975 lt!174281)) (buf!2761 (_2!4975 lt!174247)) lt!174948 lt!174958))))

(assert (=> b!114854 (arrayBitRangesEq!0 (buf!2761 (_2!4975 lt!174247)) (buf!2761 (_2!4975 lt!174281)) lt!174948 lt!174958)))

(declare-fun b!114855 () Bool)

(declare-fun res!94890 () Bool)

(assert (=> b!114855 (=> (not res!94890) (not e!75308))))

(assert (=> b!114855 (= res!94890 (isPrefixOf!0 (_1!4985 lt!174955) (_2!4975 lt!174281)))))

(declare-fun b!114856 () Bool)

(declare-fun Unit!7062 () Unit!7027)

(assert (=> b!114856 (= e!75309 Unit!7062)))

(declare-fun b!114857 () Bool)

(declare-fun res!94888 () Bool)

(assert (=> b!114857 (=> (not res!94888) (not e!75308))))

(assert (=> b!114857 (= res!94888 (isPrefixOf!0 (_2!4985 lt!174955) (_2!4975 lt!174247)))))

(declare-fun lt!174952 () (_ BitVec 64))

(declare-fun b!114858 () Bool)

(declare-fun lt!174962 () (_ BitVec 64))

(assert (=> b!114858 (= e!75308 (= (_1!4985 lt!174955) (withMovedBitIndex!0 (_2!4985 lt!174955) (bvsub lt!174952 lt!174962))))))

(assert (=> b!114858 (or (= (bvand lt!174952 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!174962 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!174952 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!174952 lt!174962) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!114858 (= lt!174962 (bitIndex!0 (size!2353 (buf!2761 (_2!4975 lt!174247))) (currentByte!5368 (_2!4975 lt!174247)) (currentBit!5363 (_2!4975 lt!174247))))))

(assert (=> b!114858 (= lt!174952 (bitIndex!0 (size!2353 (buf!2761 (_2!4975 lt!174281))) (currentByte!5368 (_2!4975 lt!174281)) (currentBit!5363 (_2!4975 lt!174281))))))

(assert (= (and d!36996 c!6968) b!114854))

(assert (= (and d!36996 (not c!6968)) b!114856))

(assert (= (and d!36996 res!94889) b!114855))

(assert (= (and b!114855 res!94890) b!114857))

(assert (= (and b!114857 res!94888) b!114858))

(declare-fun m!171725 () Bool)

(assert (=> b!114855 m!171725))

(declare-fun m!171727 () Bool)

(assert (=> b!114858 m!171727))

(assert (=> b!114858 m!170991))

(assert (=> b!114858 m!170945))

(declare-fun m!171729 () Bool)

(assert (=> b!114857 m!171729))

(assert (=> b!114854 m!170945))

(declare-fun m!171731 () Bool)

(assert (=> b!114854 m!171731))

(declare-fun m!171733 () Bool)

(assert (=> b!114854 m!171733))

(declare-fun m!171735 () Bool)

(assert (=> d!36996 m!171735))

(assert (=> d!36996 m!171705))

(declare-fun m!171737 () Bool)

(assert (=> d!36996 m!171737))

(declare-fun m!171739 () Bool)

(assert (=> d!36996 m!171739))

(declare-fun m!171741 () Bool)

(assert (=> d!36996 m!171741))

(declare-fun m!171743 () Bool)

(assert (=> d!36996 m!171743))

(declare-fun m!171745 () Bool)

(assert (=> d!36996 m!171745))

(assert (=> d!36996 m!171713))

(declare-fun m!171747 () Bool)

(assert (=> d!36996 m!171747))

(declare-fun m!171749 () Bool)

(assert (=> d!36996 m!171749))

(declare-fun m!171751 () Bool)

(assert (=> d!36996 m!171751))

(assert (=> b!114536 d!36996))

(declare-fun b!114861 () Bool)

(declare-fun e!75310 () Bool)

(declare-fun e!75311 () Bool)

(assert (=> b!114861 (= e!75310 e!75311)))

(declare-fun res!94893 () Bool)

(assert (=> b!114861 (=> (not res!94893) (not e!75311))))

(declare-fun lt!174966 () tuple2!9428)

(declare-fun lt!174968 () tuple2!9426)

(assert (=> b!114861 (= res!94893 (and (= (_2!4976 lt!174966) lt!174263) (= (_1!4976 lt!174966) (_2!4975 lt!174968))))))

(assert (=> b!114861 (= lt!174966 (readBitPure!0 (readerFrom!0 (_2!4975 lt!174968) (currentBit!5363 (_2!4975 lt!173863)) (currentByte!5368 (_2!4975 lt!173863)))))))

(declare-fun b!114860 () Bool)

(declare-fun res!94891 () Bool)

(assert (=> b!114860 (=> (not res!94891) (not e!75310))))

(assert (=> b!114860 (= res!94891 (isPrefixOf!0 (_2!4975 lt!173863) (_2!4975 lt!174968)))))

(declare-fun b!114859 () Bool)

(declare-fun res!94894 () Bool)

(assert (=> b!114859 (=> (not res!94894) (not e!75310))))

(declare-fun lt!174967 () (_ BitVec 64))

(declare-fun lt!174969 () (_ BitVec 64))

(assert (=> b!114859 (= res!94894 (= (bitIndex!0 (size!2353 (buf!2761 (_2!4975 lt!174968))) (currentByte!5368 (_2!4975 lt!174968)) (currentBit!5363 (_2!4975 lt!174968))) (bvadd lt!174967 lt!174969)))))

(assert (=> b!114859 (or (not (= (bvand lt!174967 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!174969 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!174967 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!174967 lt!174969) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!114859 (= lt!174969 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!114859 (= lt!174967 (bitIndex!0 (size!2353 (buf!2761 (_2!4975 lt!173863))) (currentByte!5368 (_2!4975 lt!173863)) (currentBit!5363 (_2!4975 lt!173863))))))

(declare-fun b!114862 () Bool)

(assert (=> b!114862 (= e!75311 (= (bitIndex!0 (size!2353 (buf!2761 (_1!4976 lt!174966))) (currentByte!5368 (_1!4976 lt!174966)) (currentBit!5363 (_1!4976 lt!174966))) (bitIndex!0 (size!2353 (buf!2761 (_2!4975 lt!174968))) (currentByte!5368 (_2!4975 lt!174968)) (currentBit!5363 (_2!4975 lt!174968)))))))

(declare-fun d!36998 () Bool)

(assert (=> d!36998 e!75310))

(declare-fun res!94892 () Bool)

(assert (=> d!36998 (=> (not res!94892) (not e!75310))))

(assert (=> d!36998 (= res!94892 (= (size!2353 (buf!2761 (_2!4975 lt!173863))) (size!2353 (buf!2761 (_2!4975 lt!174968)))))))

(assert (=> d!36998 (= lt!174968 (choose!16 (_2!4975 lt!173863) lt!174263))))

(assert (=> d!36998 (validate_offset_bit!0 ((_ sign_extend 32) (size!2353 (buf!2761 (_2!4975 lt!173863)))) ((_ sign_extend 32) (currentByte!5368 (_2!4975 lt!173863))) ((_ sign_extend 32) (currentBit!5363 (_2!4975 lt!173863))))))

(assert (=> d!36998 (= (appendBit!0 (_2!4975 lt!173863) lt!174263) lt!174968)))

(assert (= (and d!36998 res!94892) b!114859))

(assert (= (and b!114859 res!94894) b!114860))

(assert (= (and b!114860 res!94891) b!114861))

(assert (= (and b!114861 res!94893) b!114862))

(declare-fun m!171753 () Bool)

(assert (=> d!36998 m!171753))

(declare-fun m!171755 () Bool)

(assert (=> d!36998 m!171755))

(declare-fun m!171757 () Bool)

(assert (=> b!114859 m!171757))

(assert (=> b!114859 m!170665))

(declare-fun m!171759 () Bool)

(assert (=> b!114861 m!171759))

(assert (=> b!114861 m!171759))

(declare-fun m!171761 () Bool)

(assert (=> b!114861 m!171761))

(declare-fun m!171763 () Bool)

(assert (=> b!114860 m!171763))

(declare-fun m!171765 () Bool)

(assert (=> b!114862 m!171765))

(assert (=> b!114862 m!171757))

(assert (=> b!114536 d!36998))

(declare-fun d!37000 () Bool)

(declare-fun e!75312 () Bool)

(assert (=> d!37000 e!75312))

(declare-fun res!94895 () Bool)

(assert (=> d!37000 (=> (not res!94895) (not e!75312))))

(declare-fun lt!174974 () (_ BitVec 64))

(declare-fun lt!174972 () (_ BitVec 64))

(declare-fun lt!174975 () (_ BitVec 64))

(assert (=> d!37000 (= res!94895 (= lt!174972 (bvsub lt!174974 lt!174975)))))

(assert (=> d!37000 (or (= (bvand lt!174974 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!174975 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!174974 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!174974 lt!174975) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!37000 (= lt!174975 (remainingBits!0 ((_ sign_extend 32) (size!2353 (buf!2761 (_1!4976 lt!174257)))) ((_ sign_extend 32) (currentByte!5368 (_1!4976 lt!174257))) ((_ sign_extend 32) (currentBit!5363 (_1!4976 lt!174257)))))))

(declare-fun lt!174973 () (_ BitVec 64))

(declare-fun lt!174971 () (_ BitVec 64))

(assert (=> d!37000 (= lt!174974 (bvmul lt!174973 lt!174971))))

(assert (=> d!37000 (or (= lt!174973 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!174971 (bvsdiv (bvmul lt!174973 lt!174971) lt!174973)))))

(assert (=> d!37000 (= lt!174971 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!37000 (= lt!174973 ((_ sign_extend 32) (size!2353 (buf!2761 (_1!4976 lt!174257)))))))

(assert (=> d!37000 (= lt!174972 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5368 (_1!4976 lt!174257))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5363 (_1!4976 lt!174257)))))))

(assert (=> d!37000 (invariant!0 (currentBit!5363 (_1!4976 lt!174257)) (currentByte!5368 (_1!4976 lt!174257)) (size!2353 (buf!2761 (_1!4976 lt!174257))))))

(assert (=> d!37000 (= (bitIndex!0 (size!2353 (buf!2761 (_1!4976 lt!174257))) (currentByte!5368 (_1!4976 lt!174257)) (currentBit!5363 (_1!4976 lt!174257))) lt!174972)))

(declare-fun b!114863 () Bool)

(declare-fun res!94896 () Bool)

(assert (=> b!114863 (=> (not res!94896) (not e!75312))))

(assert (=> b!114863 (= res!94896 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!174972))))

(declare-fun b!114864 () Bool)

(declare-fun lt!174970 () (_ BitVec 64))

(assert (=> b!114864 (= e!75312 (bvsle lt!174972 (bvmul lt!174970 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!114864 (or (= lt!174970 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!174970 #b0000000000000000000000000000000000000000000000000000000000001000) lt!174970)))))

(assert (=> b!114864 (= lt!174970 ((_ sign_extend 32) (size!2353 (buf!2761 (_1!4976 lt!174257)))))))

(assert (= (and d!37000 res!94895) b!114863))

(assert (= (and b!114863 res!94896) b!114864))

(declare-fun m!171767 () Bool)

(assert (=> d!37000 m!171767))

(declare-fun m!171769 () Bool)

(assert (=> d!37000 m!171769))

(assert (=> b!114536 d!37000))

(assert (=> b!114536 d!36770))

(declare-fun d!37002 () Bool)

(assert (=> d!37002 (isPrefixOf!0 (_2!4975 lt!173863) (_2!4975 lt!174247))))

(declare-fun lt!174976 () Unit!7027)

(assert (=> d!37002 (= lt!174976 (choose!30 (_2!4975 lt!173863) (_2!4975 lt!174281) (_2!4975 lt!174247)))))

(assert (=> d!37002 (isPrefixOf!0 (_2!4975 lt!173863) (_2!4975 lt!174281))))

(assert (=> d!37002 (= (lemmaIsPrefixTransitive!0 (_2!4975 lt!173863) (_2!4975 lt!174281) (_2!4975 lt!174247)) lt!174976)))

(declare-fun bs!8963 () Bool)

(assert (= bs!8963 d!37002))

(assert (=> bs!8963 m!170975))

(declare-fun m!171771 () Bool)

(assert (=> bs!8963 m!171771))

(declare-fun m!171773 () Bool)

(assert (=> bs!8963 m!171773))

(assert (=> b!114536 d!37002))

(declare-fun b!114865 () Bool)

(declare-fun e!75315 () Bool)

(declare-fun lt!174990 () tuple2!9428)

(declare-fun lt!175002 () tuple2!9426)

(assert (=> b!114865 (= e!75315 (= (bitIndex!0 (size!2353 (buf!2761 (_1!4976 lt!174990))) (currentByte!5368 (_1!4976 lt!174990)) (currentBit!5363 (_1!4976 lt!174990))) (bitIndex!0 (size!2353 (buf!2761 (_2!4975 lt!175002))) (currentByte!5368 (_2!4975 lt!175002)) (currentBit!5363 (_2!4975 lt!175002)))))))

(declare-fun b!114866 () Bool)

(declare-fun res!94898 () Bool)

(declare-fun e!75319 () Bool)

(assert (=> b!114866 (=> (not res!94898) (not e!75319))))

(declare-fun lt!175020 () tuple2!9426)

(assert (=> b!114866 (= res!94898 (isPrefixOf!0 (_2!4975 lt!174281) (_2!4975 lt!175020)))))

(declare-fun b!114868 () Bool)

(declare-fun res!94900 () Bool)

(assert (=> b!114868 (= res!94900 (= (bitIndex!0 (size!2353 (buf!2761 (_2!4975 lt!175002))) (currentByte!5368 (_2!4975 lt!175002)) (currentBit!5363 (_2!4975 lt!175002))) (bvadd (bitIndex!0 (size!2353 (buf!2761 (_2!4975 lt!174281))) (currentByte!5368 (_2!4975 lt!174281)) (currentBit!5363 (_2!4975 lt!174281))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun e!75316 () Bool)

(assert (=> b!114868 (=> (not res!94900) (not e!75316))))

(declare-fun b!114869 () Bool)

(declare-fun e!75317 () Bool)

(declare-fun lt!174979 () (_ BitVec 64))

(assert (=> b!114869 (= e!75317 (validate_offset_bits!1 ((_ sign_extend 32) (size!2353 (buf!2761 (_2!4975 lt!174281)))) ((_ sign_extend 32) (currentByte!5368 (_2!4975 lt!174281))) ((_ sign_extend 32) (currentBit!5363 (_2!4975 lt!174281))) lt!174979))))

(declare-fun b!114870 () Bool)

(declare-fun e!75318 () tuple2!9426)

(declare-fun lt!174978 () tuple2!9426)

(declare-fun Unit!7063 () Unit!7027)

(assert (=> b!114870 (= e!75318 (tuple2!9427 Unit!7063 (_2!4975 lt!174978)))))

(declare-fun lt!174994 () Bool)

(assert (=> b!114870 (= lt!174994 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!114870 (= lt!175002 (appendBit!0 (_2!4975 lt!174281) lt!174994))))

(declare-fun res!94897 () Bool)

(assert (=> b!114870 (= res!94897 (= (size!2353 (buf!2761 (_2!4975 lt!174281))) (size!2353 (buf!2761 (_2!4975 lt!175002)))))))

(assert (=> b!114870 (=> (not res!94897) (not e!75316))))

(assert (=> b!114870 e!75316))

(declare-fun lt!175012 () tuple2!9426)

(assert (=> b!114870 (= lt!175012 lt!175002)))

(assert (=> b!114870 (= lt!174978 (appendNLeastSignificantBitsLoop!0 (_2!4975 lt!175012) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(declare-fun lt!175009 () Unit!7027)

(assert (=> b!114870 (= lt!175009 (lemmaIsPrefixTransitive!0 (_2!4975 lt!174281) (_2!4975 lt!175012) (_2!4975 lt!174978)))))

(assert (=> b!114870 (isPrefixOf!0 (_2!4975 lt!174281) (_2!4975 lt!174978))))

(declare-fun lt!174987 () Unit!7027)

(assert (=> b!114870 (= lt!174987 lt!175009)))

(assert (=> b!114870 (invariant!0 (currentBit!5363 (_2!4975 lt!174281)) (currentByte!5368 (_2!4975 lt!174281)) (size!2353 (buf!2761 (_2!4975 lt!175012))))))

(declare-fun lt!174997 () BitStream!4180)

(assert (=> b!114870 (= lt!174997 (BitStream!4181 (buf!2761 (_2!4975 lt!175012)) (currentByte!5368 (_2!4975 lt!174281)) (currentBit!5363 (_2!4975 lt!174281))))))

(assert (=> b!114870 (invariant!0 (currentBit!5363 lt!174997) (currentByte!5368 lt!174997) (size!2353 (buf!2761 (_2!4975 lt!174978))))))

(declare-fun lt!175017 () BitStream!4180)

(assert (=> b!114870 (= lt!175017 (BitStream!4181 (buf!2761 (_2!4975 lt!174978)) (currentByte!5368 lt!174997) (currentBit!5363 lt!174997)))))

(declare-fun lt!174999 () tuple2!9428)

(assert (=> b!114870 (= lt!174999 (readBitPure!0 lt!174997))))

(declare-fun lt!174988 () tuple2!9428)

(assert (=> b!114870 (= lt!174988 (readBitPure!0 lt!175017))))

(declare-fun lt!175016 () Unit!7027)

(assert (=> b!114870 (= lt!175016 (readBitPrefixLemma!0 lt!174997 (_2!4975 lt!174978)))))

(declare-fun res!94902 () Bool)

(assert (=> b!114870 (= res!94902 (= (bitIndex!0 (size!2353 (buf!2761 (_1!4976 lt!174999))) (currentByte!5368 (_1!4976 lt!174999)) (currentBit!5363 (_1!4976 lt!174999))) (bitIndex!0 (size!2353 (buf!2761 (_1!4976 lt!174988))) (currentByte!5368 (_1!4976 lt!174988)) (currentBit!5363 (_1!4976 lt!174988)))))))

(declare-fun e!75313 () Bool)

(assert (=> b!114870 (=> (not res!94902) (not e!75313))))

(assert (=> b!114870 e!75313))

(declare-fun lt!175005 () Unit!7027)

(assert (=> b!114870 (= lt!175005 lt!175016)))

(declare-fun lt!174989 () tuple2!9444)

(assert (=> b!114870 (= lt!174989 (reader!0 (_2!4975 lt!174281) (_2!4975 lt!174978)))))

(declare-fun lt!174981 () tuple2!9444)

(assert (=> b!114870 (= lt!174981 (reader!0 (_2!4975 lt!175012) (_2!4975 lt!174978)))))

(declare-fun lt!174991 () tuple2!9428)

(assert (=> b!114870 (= lt!174991 (readBitPure!0 (_1!4985 lt!174989)))))

(assert (=> b!114870 (= (_2!4976 lt!174991) lt!174994)))

(declare-fun lt!175021 () Unit!7027)

(declare-fun Unit!7064 () Unit!7027)

(assert (=> b!114870 (= lt!175021 Unit!7064)))

(declare-fun lt!175018 () (_ BitVec 64))

(assert (=> b!114870 (= lt!175018 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001))))))))

(declare-fun lt!175000 () (_ BitVec 64))

(assert (=> b!114870 (= lt!175000 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001))))))

(declare-fun lt!174992 () Unit!7027)

(assert (=> b!114870 (= lt!174992 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4975 lt!174281) (buf!2761 (_2!4975 lt!174978)) lt!175000))))

(assert (=> b!114870 (validate_offset_bits!1 ((_ sign_extend 32) (size!2353 (buf!2761 (_2!4975 lt!174978)))) ((_ sign_extend 32) (currentByte!5368 (_2!4975 lt!174281))) ((_ sign_extend 32) (currentBit!5363 (_2!4975 lt!174281))) lt!175000)))

(declare-fun lt!174983 () Unit!7027)

(assert (=> b!114870 (= lt!174983 lt!174992)))

(declare-fun lt!174986 () tuple2!9446)

(assert (=> b!114870 (= lt!174986 (readNLeastSignificantBitsLoopPure!0 (_1!4985 lt!174989) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) lt!175018))))

(declare-fun lt!175006 () (_ BitVec 64))

(assert (=> b!114870 (= lt!175006 ((_ sign_extend 32) (bvsub (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))))

(declare-fun lt!175008 () Unit!7027)

(assert (=> b!114870 (= lt!175008 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4975 lt!175012) (buf!2761 (_2!4975 lt!174978)) lt!175006))))

(assert (=> b!114870 (validate_offset_bits!1 ((_ sign_extend 32) (size!2353 (buf!2761 (_2!4975 lt!174978)))) ((_ sign_extend 32) (currentByte!5368 (_2!4975 lt!175012))) ((_ sign_extend 32) (currentBit!5363 (_2!4975 lt!175012))) lt!175006)))

(declare-fun lt!175010 () Unit!7027)

(assert (=> b!114870 (= lt!175010 lt!175008)))

(declare-fun lt!174996 () tuple2!9446)

(assert (=> b!114870 (= lt!174996 (readNLeastSignificantBitsLoopPure!0 (_1!4985 lt!174981) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvor lt!175018 (ite (_2!4976 lt!174991) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!175019 () tuple2!9446)

(assert (=> b!114870 (= lt!175019 (readNLeastSignificantBitsLoopPure!0 (_1!4985 lt!174989) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) lt!175018))))

(declare-fun c!6970 () Bool)

(assert (=> b!114870 (= c!6970 (_2!4976 (readBitPure!0 (_1!4985 lt!174989))))))

(declare-fun e!75314 () (_ BitVec 64))

(declare-fun lt!174977 () tuple2!9446)

(assert (=> b!114870 (= lt!174977 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4985 lt!174989) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvor lt!175018 e!75314)))))

(declare-fun lt!174998 () Unit!7027)

(assert (=> b!114870 (= lt!174998 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4985 lt!174989) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) lt!175018))))

(assert (=> b!114870 (and (= (_2!4986 lt!175019) (_2!4986 lt!174977)) (= (_1!4986 lt!175019) (_1!4986 lt!174977)))))

(declare-fun lt!175001 () Unit!7027)

(assert (=> b!114870 (= lt!175001 lt!174998)))

(assert (=> b!114870 (= (_1!4985 lt!174989) (withMovedBitIndex!0 (_2!4985 lt!174989) (bvsub (bitIndex!0 (size!2353 (buf!2761 (_2!4975 lt!174281))) (currentByte!5368 (_2!4975 lt!174281)) (currentBit!5363 (_2!4975 lt!174281))) (bitIndex!0 (size!2353 (buf!2761 (_2!4975 lt!174978))) (currentByte!5368 (_2!4975 lt!174978)) (currentBit!5363 (_2!4975 lt!174978))))))))

(declare-fun lt!175015 () Unit!7027)

(declare-fun Unit!7065 () Unit!7027)

(assert (=> b!114870 (= lt!175015 Unit!7065)))

(assert (=> b!114870 (= (_1!4985 lt!174981) (withMovedBitIndex!0 (_2!4985 lt!174981) (bvsub (bitIndex!0 (size!2353 (buf!2761 (_2!4975 lt!175012))) (currentByte!5368 (_2!4975 lt!175012)) (currentBit!5363 (_2!4975 lt!175012))) (bitIndex!0 (size!2353 (buf!2761 (_2!4975 lt!174978))) (currentByte!5368 (_2!4975 lt!174978)) (currentBit!5363 (_2!4975 lt!174978))))))))

(declare-fun lt!175014 () Unit!7027)

(declare-fun Unit!7066 () Unit!7027)

(assert (=> b!114870 (= lt!175014 Unit!7066)))

(assert (=> b!114870 (= (bitIndex!0 (size!2353 (buf!2761 (_2!4975 lt!174281))) (currentByte!5368 (_2!4975 lt!174281)) (currentBit!5363 (_2!4975 lt!174281))) (bvsub (bitIndex!0 (size!2353 (buf!2761 (_2!4975 lt!175012))) (currentByte!5368 (_2!4975 lt!175012)) (currentBit!5363 (_2!4975 lt!175012))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!174993 () Unit!7027)

(declare-fun Unit!7067 () Unit!7027)

(assert (=> b!114870 (= lt!174993 Unit!7067)))

(assert (=> b!114870 (= (_2!4986 lt!174986) (_2!4986 lt!174996))))

(declare-fun lt!174980 () Unit!7027)

(declare-fun Unit!7068 () Unit!7027)

(assert (=> b!114870 (= lt!174980 Unit!7068)))

(assert (=> b!114870 (= (_1!4986 lt!174986) (_2!4985 lt!174989))))

(declare-fun b!114871 () Bool)

(assert (=> b!114871 (= lt!174990 (readBitPure!0 (readerFrom!0 (_2!4975 lt!175002) (currentBit!5363 (_2!4975 lt!174281)) (currentByte!5368 (_2!4975 lt!174281)))))))

(declare-fun res!94905 () Bool)

(assert (=> b!114871 (= res!94905 (and (= (_2!4976 lt!174990) lt!174994) (= (_1!4976 lt!174990) (_2!4975 lt!175002))))))

(assert (=> b!114871 (=> (not res!94905) (not e!75315))))

(assert (=> b!114871 (= e!75316 e!75315)))

(declare-fun b!114872 () Bool)

(assert (=> b!114872 (= e!75314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!114873 () Bool)

(declare-fun res!94899 () Bool)

(assert (=> b!114873 (=> (not res!94899) (not e!75319))))

(declare-fun lt!175013 () (_ BitVec 64))

(declare-fun lt!174982 () (_ BitVec 64))

(assert (=> b!114873 (= res!94899 (= (bitIndex!0 (size!2353 (buf!2761 (_2!4975 lt!175020))) (currentByte!5368 (_2!4975 lt!175020)) (currentBit!5363 (_2!4975 lt!175020))) (bvadd lt!175013 lt!174982)))))

(assert (=> b!114873 (or (not (= (bvand lt!175013 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!174982 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!175013 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!175013 lt!174982) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!114873 (= lt!174982 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001))))))

(assert (=> b!114873 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)) #b10000000000000000000000000000000)))))

(assert (=> b!114873 (= lt!175013 (bitIndex!0 (size!2353 (buf!2761 (_2!4975 lt!174281))) (currentByte!5368 (_2!4975 lt!174281)) (currentBit!5363 (_2!4975 lt!174281))))))

(declare-fun lt!174995 () BitStream!4180)

(declare-fun bm!1487 () Bool)

(declare-fun c!6969 () Bool)

(declare-fun call!1490 () Bool)

(assert (=> bm!1487 (= call!1490 (isPrefixOf!0 (ite c!6969 (_2!4975 lt!174281) lt!174995) (ite c!6969 (_2!4975 lt!175002) lt!174995)))))

(declare-fun lt!174984 () tuple2!9444)

(declare-fun lt!175003 () tuple2!9446)

(declare-fun b!114874 () Bool)

(assert (=> b!114874 (= e!75319 (and (= (_2!4986 lt!175003) v!199) (= (_1!4986 lt!175003) (_2!4985 lt!174984))))))

(declare-fun lt!175011 () (_ BitVec 64))

(assert (=> b!114874 (= lt!175003 (readNLeastSignificantBitsLoopPure!0 (_1!4985 lt!174984) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) lt!175011))))

(declare-fun lt!175007 () Unit!7027)

(declare-fun lt!174985 () Unit!7027)

(assert (=> b!114874 (= lt!175007 lt!174985)))

(assert (=> b!114874 (validate_offset_bits!1 ((_ sign_extend 32) (size!2353 (buf!2761 (_2!4975 lt!175020)))) ((_ sign_extend 32) (currentByte!5368 (_2!4975 lt!174281))) ((_ sign_extend 32) (currentBit!5363 (_2!4975 lt!174281))) lt!174979)))

(assert (=> b!114874 (= lt!174985 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4975 lt!174281) (buf!2761 (_2!4975 lt!175020)) lt!174979))))

(assert (=> b!114874 e!75317))

(declare-fun res!94901 () Bool)

(assert (=> b!114874 (=> (not res!94901) (not e!75317))))

(assert (=> b!114874 (= res!94901 (and (= (size!2353 (buf!2761 (_2!4975 lt!174281))) (size!2353 (buf!2761 (_2!4975 lt!175020)))) (bvsge lt!174979 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!114874 (= lt!174979 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001))))))

(assert (=> b!114874 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)) #b10000000000000000000000000000000)))))

(assert (=> b!114874 (= lt!175011 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001))))))))

(assert (=> b!114874 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)) #b10000000000000000000000000000000)))))

(assert (=> b!114874 (= lt!174984 (reader!0 (_2!4975 lt!174281) (_2!4975 lt!175020)))))

(declare-fun b!114875 () Bool)

(declare-fun res!94904 () Bool)

(assert (=> b!114875 (= res!94904 call!1490)))

(assert (=> b!114875 (=> (not res!94904) (not e!75316))))

(declare-fun b!114876 () Bool)

(declare-fun lt!175004 () Unit!7027)

(assert (=> b!114876 (= e!75318 (tuple2!9427 lt!175004 (_2!4975 lt!174281)))))

(assert (=> b!114876 (= lt!174995 (_2!4975 lt!174281))))

(assert (=> b!114876 (= lt!175004 (lemmaIsPrefixRefl!0 lt!174995))))

(assert (=> b!114876 call!1490))

(declare-fun b!114877 () Bool)

(assert (=> b!114877 (= e!75313 (= (_2!4976 lt!174999) (_2!4976 lt!174988)))))

(declare-fun d!37004 () Bool)

(assert (=> d!37004 e!75319))

(declare-fun res!94903 () Bool)

(assert (=> d!37004 (=> (not res!94903) (not e!75319))))

(assert (=> d!37004 (= res!94903 (= (size!2353 (buf!2761 (_2!4975 lt!174281))) (size!2353 (buf!2761 (_2!4975 lt!175020)))))))

(assert (=> d!37004 (= lt!175020 e!75318)))

(assert (=> d!37004 (= c!6969 (bvslt (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) nBits!396))))

(assert (=> d!37004 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)) (bvsle (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!37004 (= (appendNLeastSignificantBitsLoop!0 (_2!4975 lt!174281) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)) lt!175020)))

(declare-fun b!114867 () Bool)

(assert (=> b!114867 (= e!75314 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))))))

(assert (= (and d!37004 c!6969) b!114870))

(assert (= (and d!37004 (not c!6969)) b!114876))

(assert (= (and b!114870 res!94897) b!114868))

(assert (= (and b!114868 res!94900) b!114875))

(assert (= (and b!114875 res!94904) b!114871))

(assert (= (and b!114871 res!94905) b!114865))

(assert (= (and b!114870 res!94902) b!114877))

(assert (= (and b!114870 c!6970) b!114867))

(assert (= (and b!114870 (not c!6970)) b!114872))

(assert (= (or b!114875 b!114876) bm!1487))

(assert (= (and d!37004 res!94903) b!114873))

(assert (= (and b!114873 res!94899) b!114866))

(assert (= (and b!114866 res!94898) b!114874))

(assert (= (and b!114874 res!94901) b!114869))

(declare-fun m!171775 () Bool)

(assert (=> b!114866 m!171775))

(declare-fun m!171777 () Bool)

(assert (=> b!114876 m!171777))

(declare-fun m!171779 () Bool)

(assert (=> b!114871 m!171779))

(assert (=> b!114871 m!171779))

(declare-fun m!171781 () Bool)

(assert (=> b!114871 m!171781))

(declare-fun m!171783 () Bool)

(assert (=> b!114873 m!171783))

(assert (=> b!114873 m!170945))

(declare-fun m!171785 () Bool)

(assert (=> b!114870 m!171785))

(declare-fun m!171787 () Bool)

(assert (=> b!114870 m!171787))

(declare-fun m!171789 () Bool)

(assert (=> b!114870 m!171789))

(declare-fun m!171791 () Bool)

(assert (=> b!114870 m!171791))

(declare-fun m!171793 () Bool)

(assert (=> b!114870 m!171793))

(declare-fun m!171795 () Bool)

(assert (=> b!114870 m!171795))

(declare-fun m!171797 () Bool)

(assert (=> b!114870 m!171797))

(declare-fun m!171799 () Bool)

(assert (=> b!114870 m!171799))

(declare-fun m!171801 () Bool)

(assert (=> b!114870 m!171801))

(declare-fun m!171803 () Bool)

(assert (=> b!114870 m!171803))

(declare-fun m!171805 () Bool)

(assert (=> b!114870 m!171805))

(declare-fun m!171807 () Bool)

(assert (=> b!114870 m!171807))

(declare-fun m!171809 () Bool)

(assert (=> b!114870 m!171809))

(declare-fun m!171811 () Bool)

(assert (=> b!114870 m!171811))

(declare-fun m!171813 () Bool)

(assert (=> b!114870 m!171813))

(assert (=> b!114870 m!170945))

(declare-fun m!171815 () Bool)

(assert (=> b!114870 m!171815))

(declare-fun m!171817 () Bool)

(assert (=> b!114870 m!171817))

(declare-fun m!171819 () Bool)

(assert (=> b!114870 m!171819))

(declare-fun m!171821 () Bool)

(assert (=> b!114870 m!171821))

(declare-fun m!171823 () Bool)

(assert (=> b!114870 m!171823))

(declare-fun m!171825 () Bool)

(assert (=> b!114870 m!171825))

(declare-fun m!171827 () Bool)

(assert (=> b!114870 m!171827))

(declare-fun m!171829 () Bool)

(assert (=> b!114870 m!171829))

(assert (=> b!114870 m!171825))

(declare-fun m!171831 () Bool)

(assert (=> b!114870 m!171831))

(declare-fun m!171833 () Bool)

(assert (=> b!114870 m!171833))

(declare-fun m!171835 () Bool)

(assert (=> b!114870 m!171835))

(declare-fun m!171837 () Bool)

(assert (=> b!114870 m!171837))

(declare-fun m!171839 () Bool)

(assert (=> b!114870 m!171839))

(declare-fun m!171841 () Bool)

(assert (=> bm!1487 m!171841))

(declare-fun m!171843 () Bool)

(assert (=> b!114865 m!171843))

(declare-fun m!171845 () Bool)

(assert (=> b!114865 m!171845))

(assert (=> b!114868 m!171845))

(assert (=> b!114868 m!170945))

(declare-fun m!171847 () Bool)

(assert (=> b!114874 m!171847))

(declare-fun m!171849 () Bool)

(assert (=> b!114874 m!171849))

(declare-fun m!171851 () Bool)

(assert (=> b!114874 m!171851))

(assert (=> b!114874 m!171819))

(declare-fun m!171853 () Bool)

(assert (=> b!114874 m!171853))

(declare-fun m!171855 () Bool)

(assert (=> b!114869 m!171855))

(assert (=> b!114536 d!37004))

(declare-fun lt!175022 () tuple2!9458)

(declare-fun d!37006 () Bool)

(assert (=> d!37006 (= lt!175022 (readNLeastSignificantBitsLoop!0 (_1!4985 lt!174250) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!174287 (ite (_2!4976 lt!174260) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!37006 (= (readNLeastSignificantBitsLoopPure!0 (_1!4985 lt!174250) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!174287 (ite (_2!4976 lt!174260) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!9447 (_2!4994 lt!175022) (_1!4994 lt!175022)))))

(declare-fun bs!8964 () Bool)

(assert (= bs!8964 d!37006))

(declare-fun m!171857 () Bool)

(assert (=> bs!8964 m!171857))

(assert (=> b!114536 d!37006))

(declare-fun d!37008 () Bool)

(declare-fun e!75320 () Bool)

(assert (=> d!37008 e!75320))

(declare-fun res!94906 () Bool)

(assert (=> d!37008 (=> (not res!94906) (not e!75320))))

(declare-fun lt!175025 () (_ BitVec 64))

(declare-fun lt!175028 () (_ BitVec 64))

(declare-fun lt!175027 () (_ BitVec 64))

(assert (=> d!37008 (= res!94906 (= lt!175025 (bvsub lt!175027 lt!175028)))))

(assert (=> d!37008 (or (= (bvand lt!175027 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!175028 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!175027 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!175027 lt!175028) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!37008 (= lt!175028 (remainingBits!0 ((_ sign_extend 32) (size!2353 (buf!2761 (_2!4975 lt!174281)))) ((_ sign_extend 32) (currentByte!5368 (_2!4975 lt!174281))) ((_ sign_extend 32) (currentBit!5363 (_2!4975 lt!174281)))))))

(declare-fun lt!175026 () (_ BitVec 64))

(declare-fun lt!175024 () (_ BitVec 64))

(assert (=> d!37008 (= lt!175027 (bvmul lt!175026 lt!175024))))

(assert (=> d!37008 (or (= lt!175026 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!175024 (bvsdiv (bvmul lt!175026 lt!175024) lt!175026)))))

(assert (=> d!37008 (= lt!175024 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!37008 (= lt!175026 ((_ sign_extend 32) (size!2353 (buf!2761 (_2!4975 lt!174281)))))))

(assert (=> d!37008 (= lt!175025 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5368 (_2!4975 lt!174281))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5363 (_2!4975 lt!174281)))))))

(assert (=> d!37008 (invariant!0 (currentBit!5363 (_2!4975 lt!174281)) (currentByte!5368 (_2!4975 lt!174281)) (size!2353 (buf!2761 (_2!4975 lt!174281))))))

(assert (=> d!37008 (= (bitIndex!0 (size!2353 (buf!2761 (_2!4975 lt!174281))) (currentByte!5368 (_2!4975 lt!174281)) (currentBit!5363 (_2!4975 lt!174281))) lt!175025)))

(declare-fun b!114878 () Bool)

(declare-fun res!94907 () Bool)

(assert (=> b!114878 (=> (not res!94907) (not e!75320))))

(assert (=> b!114878 (= res!94907 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!175025))))

(declare-fun b!114879 () Bool)

(declare-fun lt!175023 () (_ BitVec 64))

(assert (=> b!114879 (= e!75320 (bvsle lt!175025 (bvmul lt!175023 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!114879 (or (= lt!175023 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!175023 #b0000000000000000000000000000000000000000000000000000000000001000) lt!175023)))))

(assert (=> b!114879 (= lt!175023 ((_ sign_extend 32) (size!2353 (buf!2761 (_2!4975 lt!174281)))))))

(assert (= (and d!37008 res!94906) b!114878))

(assert (= (and b!114878 res!94907) b!114879))

(declare-fun m!171859 () Bool)

(assert (=> d!37008 m!171859))

(declare-fun m!171861 () Bool)

(assert (=> d!37008 m!171861))

(assert (=> b!114536 d!37008))

(declare-fun d!37010 () Bool)

(declare-fun e!75321 () Bool)

(assert (=> d!37010 e!75321))

(declare-fun res!94908 () Bool)

(assert (=> d!37010 (=> (not res!94908) (not e!75321))))

(declare-fun lt!175030 () (_ BitVec 64))

(declare-fun lt!175029 () BitStream!4180)

(assert (=> d!37010 (= res!94908 (= (bvadd lt!175030 (bvsub (bitIndex!0 (size!2353 (buf!2761 (_2!4975 lt!174281))) (currentByte!5368 (_2!4975 lt!174281)) (currentBit!5363 (_2!4975 lt!174281))) (bitIndex!0 (size!2353 (buf!2761 (_2!4975 lt!174247))) (currentByte!5368 (_2!4975 lt!174247)) (currentBit!5363 (_2!4975 lt!174247))))) (bitIndex!0 (size!2353 (buf!2761 lt!175029)) (currentByte!5368 lt!175029) (currentBit!5363 lt!175029))))))

(assert (=> d!37010 (or (not (= (bvand lt!175030 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bitIndex!0 (size!2353 (buf!2761 (_2!4975 lt!174281))) (currentByte!5368 (_2!4975 lt!174281)) (currentBit!5363 (_2!4975 lt!174281))) (bitIndex!0 (size!2353 (buf!2761 (_2!4975 lt!174247))) (currentByte!5368 (_2!4975 lt!174247)) (currentBit!5363 (_2!4975 lt!174247)))) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!175030 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!175030 (bvsub (bitIndex!0 (size!2353 (buf!2761 (_2!4975 lt!174281))) (currentByte!5368 (_2!4975 lt!174281)) (currentBit!5363 (_2!4975 lt!174281))) (bitIndex!0 (size!2353 (buf!2761 (_2!4975 lt!174247))) (currentByte!5368 (_2!4975 lt!174247)) (currentBit!5363 (_2!4975 lt!174247))))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!37010 (= lt!175030 (bitIndex!0 (size!2353 (buf!2761 (_2!4985 lt!174250))) (currentByte!5368 (_2!4985 lt!174250)) (currentBit!5363 (_2!4985 lt!174250))))))

(assert (=> d!37010 (= lt!175029 (_2!4975 (moveBitIndex!0 (_2!4985 lt!174250) (bvsub (bitIndex!0 (size!2353 (buf!2761 (_2!4975 lt!174281))) (currentByte!5368 (_2!4975 lt!174281)) (currentBit!5363 (_2!4975 lt!174281))) (bitIndex!0 (size!2353 (buf!2761 (_2!4975 lt!174247))) (currentByte!5368 (_2!4975 lt!174247)) (currentBit!5363 (_2!4975 lt!174247)))))))))

(assert (=> d!37010 (moveBitIndexPrecond!0 (_2!4985 lt!174250) (bvsub (bitIndex!0 (size!2353 (buf!2761 (_2!4975 lt!174281))) (currentByte!5368 (_2!4975 lt!174281)) (currentBit!5363 (_2!4975 lt!174281))) (bitIndex!0 (size!2353 (buf!2761 (_2!4975 lt!174247))) (currentByte!5368 (_2!4975 lt!174247)) (currentBit!5363 (_2!4975 lt!174247)))))))

(assert (=> d!37010 (= (withMovedBitIndex!0 (_2!4985 lt!174250) (bvsub (bitIndex!0 (size!2353 (buf!2761 (_2!4975 lt!174281))) (currentByte!5368 (_2!4975 lt!174281)) (currentBit!5363 (_2!4975 lt!174281))) (bitIndex!0 (size!2353 (buf!2761 (_2!4975 lt!174247))) (currentByte!5368 (_2!4975 lt!174247)) (currentBit!5363 (_2!4975 lt!174247))))) lt!175029)))

(declare-fun b!114880 () Bool)

(assert (=> b!114880 (= e!75321 (= (size!2353 (buf!2761 (_2!4985 lt!174250))) (size!2353 (buf!2761 lt!175029))))))

(assert (= (and d!37010 res!94908) b!114880))

(declare-fun m!171863 () Bool)

(assert (=> d!37010 m!171863))

(declare-fun m!171865 () Bool)

(assert (=> d!37010 m!171865))

(declare-fun m!171867 () Bool)

(assert (=> d!37010 m!171867))

(declare-fun m!171869 () Bool)

(assert (=> d!37010 m!171869))

(assert (=> b!114536 d!37010))

(declare-fun d!37012 () Bool)

(declare-fun e!75322 () Bool)

(assert (=> d!37012 e!75322))

(declare-fun res!94909 () Bool)

(assert (=> d!37012 (=> (not res!94909) (not e!75322))))

(declare-fun lt!175033 () (_ BitVec 64))

(declare-fun lt!175035 () (_ BitVec 64))

(declare-fun lt!175036 () (_ BitVec 64))

(assert (=> d!37012 (= res!94909 (= lt!175033 (bvsub lt!175035 lt!175036)))))

(assert (=> d!37012 (or (= (bvand lt!175035 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!175036 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!175035 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!175035 lt!175036) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!37012 (= lt!175036 (remainingBits!0 ((_ sign_extend 32) (size!2353 (buf!2761 (_2!4975 lt!174247)))) ((_ sign_extend 32) (currentByte!5368 (_2!4975 lt!174247))) ((_ sign_extend 32) (currentBit!5363 (_2!4975 lt!174247)))))))

(declare-fun lt!175034 () (_ BitVec 64))

(declare-fun lt!175032 () (_ BitVec 64))

(assert (=> d!37012 (= lt!175035 (bvmul lt!175034 lt!175032))))

(assert (=> d!37012 (or (= lt!175034 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!175032 (bvsdiv (bvmul lt!175034 lt!175032) lt!175034)))))

(assert (=> d!37012 (= lt!175032 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!37012 (= lt!175034 ((_ sign_extend 32) (size!2353 (buf!2761 (_2!4975 lt!174247)))))))

(assert (=> d!37012 (= lt!175033 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5368 (_2!4975 lt!174247))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5363 (_2!4975 lt!174247)))))))

(assert (=> d!37012 (invariant!0 (currentBit!5363 (_2!4975 lt!174247)) (currentByte!5368 (_2!4975 lt!174247)) (size!2353 (buf!2761 (_2!4975 lt!174247))))))

(assert (=> d!37012 (= (bitIndex!0 (size!2353 (buf!2761 (_2!4975 lt!174247))) (currentByte!5368 (_2!4975 lt!174247)) (currentBit!5363 (_2!4975 lt!174247))) lt!175033)))

(declare-fun b!114881 () Bool)

(declare-fun res!94910 () Bool)

(assert (=> b!114881 (=> (not res!94910) (not e!75322))))

(assert (=> b!114881 (= res!94910 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!175033))))

(declare-fun b!114882 () Bool)

(declare-fun lt!175031 () (_ BitVec 64))

(assert (=> b!114882 (= e!75322 (bvsle lt!175033 (bvmul lt!175031 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!114882 (or (= lt!175031 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!175031 #b0000000000000000000000000000000000000000000000000000000000001000) lt!175031)))))

(assert (=> b!114882 (= lt!175031 ((_ sign_extend 32) (size!2353 (buf!2761 (_2!4975 lt!174247)))))))

(assert (= (and d!37012 res!94909) b!114881))

(assert (= (and b!114881 res!94910) b!114882))

(declare-fun m!171871 () Bool)

(assert (=> d!37012 m!171871))

(declare-fun m!171873 () Bool)

(assert (=> d!37012 m!171873))

(assert (=> b!114536 d!37012))

(declare-fun d!37014 () Bool)

(assert (=> d!37014 (= (invariant!0 (currentBit!5363 lt!174266) (currentByte!5368 lt!174266) (size!2353 (buf!2761 (_2!4975 lt!174247)))) (and (bvsge (currentBit!5363 lt!174266) #b00000000000000000000000000000000) (bvslt (currentBit!5363 lt!174266) #b00000000000000000000000000001000) (bvsge (currentByte!5368 lt!174266) #b00000000000000000000000000000000) (or (bvslt (currentByte!5368 lt!174266) (size!2353 (buf!2761 (_2!4975 lt!174247)))) (and (= (currentBit!5363 lt!174266) #b00000000000000000000000000000000) (= (currentByte!5368 lt!174266) (size!2353 (buf!2761 (_2!4975 lt!174247))))))))))

(assert (=> b!114536 d!37014))

(declare-fun d!37016 () Bool)

(declare-fun lt!175037 () tuple2!9448)

(assert (=> d!37016 (= lt!175037 (readBit!0 (_1!4985 lt!174258)))))

(assert (=> d!37016 (= (readBitPure!0 (_1!4985 lt!174258)) (tuple2!9429 (_2!4989 lt!175037) (_1!4989 lt!175037)))))

(declare-fun bs!8965 () Bool)

(assert (= bs!8965 d!37016))

(declare-fun m!171875 () Bool)

(assert (=> bs!8965 m!171875))

(assert (=> b!114536 d!37016))

(declare-fun d!37018 () Bool)

(declare-fun e!75325 () Bool)

(assert (=> d!37018 e!75325))

(declare-fun res!94913 () Bool)

(assert (=> d!37018 (=> (not res!94913) (not e!75325))))

(declare-fun lt!175048 () tuple2!9428)

(declare-fun lt!175047 () tuple2!9428)

(assert (=> d!37018 (= res!94913 (= (bitIndex!0 (size!2353 (buf!2761 (_1!4976 lt!175048))) (currentByte!5368 (_1!4976 lt!175048)) (currentBit!5363 (_1!4976 lt!175048))) (bitIndex!0 (size!2353 (buf!2761 (_1!4976 lt!175047))) (currentByte!5368 (_1!4976 lt!175047)) (currentBit!5363 (_1!4976 lt!175047)))))))

(declare-fun lt!175049 () Unit!7027)

(declare-fun lt!175046 () BitStream!4180)

(declare-fun choose!50 (BitStream!4180 BitStream!4180 BitStream!4180 tuple2!9428 tuple2!9428 BitStream!4180 Bool tuple2!9428 tuple2!9428 BitStream!4180 Bool) Unit!7027)

(assert (=> d!37018 (= lt!175049 (choose!50 lt!174266 (_2!4975 lt!174247) lt!175046 lt!175048 (tuple2!9429 (_1!4976 lt!175048) (_2!4976 lt!175048)) (_1!4976 lt!175048) (_2!4976 lt!175048) lt!175047 (tuple2!9429 (_1!4976 lt!175047) (_2!4976 lt!175047)) (_1!4976 lt!175047) (_2!4976 lt!175047)))))

(assert (=> d!37018 (= lt!175047 (readBitPure!0 lt!175046))))

(assert (=> d!37018 (= lt!175048 (readBitPure!0 lt!174266))))

(assert (=> d!37018 (= lt!175046 (BitStream!4181 (buf!2761 (_2!4975 lt!174247)) (currentByte!5368 lt!174266) (currentBit!5363 lt!174266)))))

(assert (=> d!37018 (invariant!0 (currentBit!5363 lt!174266) (currentByte!5368 lt!174266) (size!2353 (buf!2761 (_2!4975 lt!174247))))))

(assert (=> d!37018 (= (readBitPrefixLemma!0 lt!174266 (_2!4975 lt!174247)) lt!175049)))

(declare-fun b!114885 () Bool)

(assert (=> b!114885 (= e!75325 (= (_2!4976 lt!175048) (_2!4976 lt!175047)))))

(assert (= (and d!37018 res!94913) b!114885))

(assert (=> d!37018 m!170987))

(declare-fun m!171877 () Bool)

(assert (=> d!37018 m!171877))

(declare-fun m!171879 () Bool)

(assert (=> d!37018 m!171879))

(declare-fun m!171881 () Bool)

(assert (=> d!37018 m!171881))

(assert (=> d!37018 m!170959))

(declare-fun m!171883 () Bool)

(assert (=> d!37018 m!171883))

(assert (=> b!114536 d!37018))

(declare-fun d!37020 () Bool)

(declare-fun e!75326 () Bool)

(assert (=> d!37020 e!75326))

(declare-fun res!94914 () Bool)

(assert (=> d!37020 (=> (not res!94914) (not e!75326))))

(declare-fun lt!175054 () (_ BitVec 64))

(declare-fun lt!175055 () (_ BitVec 64))

(declare-fun lt!175052 () (_ BitVec 64))

(assert (=> d!37020 (= res!94914 (= lt!175052 (bvsub lt!175054 lt!175055)))))

(assert (=> d!37020 (or (= (bvand lt!175054 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!175055 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!175054 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!175054 lt!175055) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!37020 (= lt!175055 (remainingBits!0 ((_ sign_extend 32) (size!2353 (buf!2761 (_1!4976 lt!174268)))) ((_ sign_extend 32) (currentByte!5368 (_1!4976 lt!174268))) ((_ sign_extend 32) (currentBit!5363 (_1!4976 lt!174268)))))))

(declare-fun lt!175053 () (_ BitVec 64))

(declare-fun lt!175051 () (_ BitVec 64))

(assert (=> d!37020 (= lt!175054 (bvmul lt!175053 lt!175051))))

(assert (=> d!37020 (or (= lt!175053 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!175051 (bvsdiv (bvmul lt!175053 lt!175051) lt!175053)))))

(assert (=> d!37020 (= lt!175051 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!37020 (= lt!175053 ((_ sign_extend 32) (size!2353 (buf!2761 (_1!4976 lt!174268)))))))

(assert (=> d!37020 (= lt!175052 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5368 (_1!4976 lt!174268))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5363 (_1!4976 lt!174268)))))))

(assert (=> d!37020 (invariant!0 (currentBit!5363 (_1!4976 lt!174268)) (currentByte!5368 (_1!4976 lt!174268)) (size!2353 (buf!2761 (_1!4976 lt!174268))))))

(assert (=> d!37020 (= (bitIndex!0 (size!2353 (buf!2761 (_1!4976 lt!174268))) (currentByte!5368 (_1!4976 lt!174268)) (currentBit!5363 (_1!4976 lt!174268))) lt!175052)))

(declare-fun b!114886 () Bool)

(declare-fun res!94915 () Bool)

(assert (=> b!114886 (=> (not res!94915) (not e!75326))))

(assert (=> b!114886 (= res!94915 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!175052))))

(declare-fun b!114887 () Bool)

(declare-fun lt!175050 () (_ BitVec 64))

(assert (=> b!114887 (= e!75326 (bvsle lt!175052 (bvmul lt!175050 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!114887 (or (= lt!175050 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!175050 #b0000000000000000000000000000000000000000000000000000000000001000) lt!175050)))))

(assert (=> b!114887 (= lt!175050 ((_ sign_extend 32) (size!2353 (buf!2761 (_1!4976 lt!174268)))))))

(assert (= (and d!37020 res!94914) b!114886))

(assert (= (and b!114886 res!94915) b!114887))

(declare-fun m!171885 () Bool)

(assert (=> d!37020 m!171885))

(declare-fun m!171887 () Bool)

(assert (=> d!37020 m!171887))

(assert (=> b!114536 d!37020))

(declare-fun lt!175056 () tuple2!9458)

(declare-fun d!37022 () Bool)

(assert (=> d!37022 (= lt!175056 (readNLeastSignificantBitsLoop!0 (withMovedBitIndex!0 (_1!4985 lt!174258) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!174287 e!75101)))))

(assert (=> d!37022 (= (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4985 lt!174258) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!174287 e!75101)) (tuple2!9447 (_2!4994 lt!175056) (_1!4994 lt!175056)))))

(declare-fun bs!8966 () Bool)

(assert (= bs!8966 d!37022))

(assert (=> bs!8966 m!170983))

(declare-fun m!171889 () Bool)

(assert (=> bs!8966 m!171889))

(assert (=> b!114536 d!37022))

(assert (=> b!114595 d!36718))

(assert (=> b!114419 d!36772))

(declare-fun d!37024 () Bool)

(declare-fun e!75327 () Bool)

(assert (=> d!37024 e!75327))

(declare-fun res!94916 () Bool)

(assert (=> d!37024 (=> (not res!94916) (not e!75327))))

(declare-fun lt!175061 () (_ BitVec 64))

(declare-fun lt!175062 () (_ BitVec 64))

(declare-fun lt!175059 () (_ BitVec 64))

(assert (=> d!37024 (= res!94916 (= lt!175059 (bvsub lt!175061 lt!175062)))))

(assert (=> d!37024 (or (= (bvand lt!175061 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!175062 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!175061 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!175061 lt!175062) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!37024 (= lt!175062 (remainingBits!0 ((_ sign_extend 32) (size!2353 (buf!2761 (_2!4975 lt!173865)))) ((_ sign_extend 32) (currentByte!5368 (_2!4975 lt!173865))) ((_ sign_extend 32) (currentBit!5363 (_2!4975 lt!173865)))))))

(declare-fun lt!175060 () (_ BitVec 64))

(declare-fun lt!175058 () (_ BitVec 64))

(assert (=> d!37024 (= lt!175061 (bvmul lt!175060 lt!175058))))

(assert (=> d!37024 (or (= lt!175060 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!175058 (bvsdiv (bvmul lt!175060 lt!175058) lt!175060)))))

(assert (=> d!37024 (= lt!175058 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!37024 (= lt!175060 ((_ sign_extend 32) (size!2353 (buf!2761 (_2!4975 lt!173865)))))))

(assert (=> d!37024 (= lt!175059 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5368 (_2!4975 lt!173865))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5363 (_2!4975 lt!173865)))))))

(assert (=> d!37024 (invariant!0 (currentBit!5363 (_2!4975 lt!173865)) (currentByte!5368 (_2!4975 lt!173865)) (size!2353 (buf!2761 (_2!4975 lt!173865))))))

(assert (=> d!37024 (= (bitIndex!0 (size!2353 (buf!2761 (_2!4975 lt!173865))) (currentByte!5368 (_2!4975 lt!173865)) (currentBit!5363 (_2!4975 lt!173865))) lt!175059)))

(declare-fun b!114888 () Bool)

(declare-fun res!94917 () Bool)

(assert (=> b!114888 (=> (not res!94917) (not e!75327))))

(assert (=> b!114888 (= res!94917 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!175059))))

(declare-fun b!114889 () Bool)

(declare-fun lt!175057 () (_ BitVec 64))

(assert (=> b!114889 (= e!75327 (bvsle lt!175059 (bvmul lt!175057 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!114889 (or (= lt!175057 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!175057 #b0000000000000000000000000000000000000000000000000000000000001000) lt!175057)))))

(assert (=> b!114889 (= lt!175057 ((_ sign_extend 32) (size!2353 (buf!2761 (_2!4975 lt!173865)))))))

(assert (= (and d!37024 res!94916) b!114888))

(assert (= (and b!114888 res!94917) b!114889))

(declare-fun m!171891 () Bool)

(assert (=> d!37024 m!171891))

(declare-fun m!171893 () Bool)

(assert (=> d!37024 m!171893))

(assert (=> b!114419 d!37024))

(declare-fun d!37026 () Bool)

(assert (=> d!37026 (= (byteRangesEq!0 (ite c!6946 (select (arr!2946 (buf!2761 (_2!4975 lt!173863))) (_3!263 lt!174323)) (select (arr!2946 (buf!2761 (_2!4975 lt!173863))) (_4!42 lt!174323))) (ite c!6946 (select (arr!2946 (buf!2761 (_2!4975 lt!173865))) (_3!263 lt!174323)) (select (arr!2946 (buf!2761 (_2!4975 lt!173865))) (_4!42 lt!174323))) (ite c!6946 lt!174321 #b00000000000000000000000000000000) lt!174322) (or (= (ite c!6946 lt!174321 #b00000000000000000000000000000000) lt!174322) (= (bvand (bvand (bvand ((_ sign_extend 24) (ite c!6946 (select (arr!2946 (buf!2761 (_2!4975 lt!173863))) (_3!263 lt!174323)) (select (arr!2946 (buf!2761 (_2!4975 lt!173863))) (_4!42 lt!174323)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!174322))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!6946 lt!174321 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (ite c!6946 (select (arr!2946 (buf!2761 (_2!4975 lt!173865))) (_3!263 lt!174323)) (select (arr!2946 (buf!2761 (_2!4975 lt!173865))) (_4!42 lt!174323)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!174322))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!6946 lt!174321 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111))))))

(declare-fun bs!8967 () Bool)

(assert (= bs!8967 d!37026))

(declare-fun m!171895 () Bool)

(assert (=> bs!8967 m!171895))

(declare-fun m!171897 () Bool)

(assert (=> bs!8967 m!171897))

(assert (=> bm!1478 d!37026))

(declare-fun d!37028 () Bool)

(assert (=> d!37028 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2353 (buf!2761 (_2!4975 lt!173863)))) ((_ sign_extend 32) (currentByte!5368 (_2!4975 lt!173863))) ((_ sign_extend 32) (currentBit!5363 (_2!4975 lt!173863))) lt!174248) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2353 (buf!2761 (_2!4975 lt!173863)))) ((_ sign_extend 32) (currentByte!5368 (_2!4975 lt!173863))) ((_ sign_extend 32) (currentBit!5363 (_2!4975 lt!173863)))) lt!174248))))

(declare-fun bs!8968 () Bool)

(assert (= bs!8968 d!37028))

(assert (=> bs!8968 m!171063))

(assert (=> b!114535 d!37028))

(declare-fun d!37030 () Bool)

(declare-fun e!75328 () Bool)

(assert (=> d!37030 e!75328))

(declare-fun res!94918 () Bool)

(assert (=> d!37030 (=> (not res!94918) (not e!75328))))

(declare-fun lt!175068 () (_ BitVec 64))

(declare-fun lt!175067 () (_ BitVec 64))

(declare-fun lt!175065 () (_ BitVec 64))

(assert (=> d!37030 (= res!94918 (= lt!175065 (bvsub lt!175067 lt!175068)))))

(assert (=> d!37030 (or (= (bvand lt!175067 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!175068 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!175067 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!175067 lt!175068) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!37030 (= lt!175068 (remainingBits!0 ((_ sign_extend 32) (size!2353 (buf!2761 (_2!4975 lt!174271)))) ((_ sign_extend 32) (currentByte!5368 (_2!4975 lt!174271))) ((_ sign_extend 32) (currentBit!5363 (_2!4975 lt!174271)))))))

(declare-fun lt!175066 () (_ BitVec 64))

(declare-fun lt!175064 () (_ BitVec 64))

(assert (=> d!37030 (= lt!175067 (bvmul lt!175066 lt!175064))))

(assert (=> d!37030 (or (= lt!175066 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!175064 (bvsdiv (bvmul lt!175066 lt!175064) lt!175066)))))

(assert (=> d!37030 (= lt!175064 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!37030 (= lt!175066 ((_ sign_extend 32) (size!2353 (buf!2761 (_2!4975 lt!174271)))))))

(assert (=> d!37030 (= lt!175065 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5368 (_2!4975 lt!174271))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5363 (_2!4975 lt!174271)))))))

(assert (=> d!37030 (invariant!0 (currentBit!5363 (_2!4975 lt!174271)) (currentByte!5368 (_2!4975 lt!174271)) (size!2353 (buf!2761 (_2!4975 lt!174271))))))

(assert (=> d!37030 (= (bitIndex!0 (size!2353 (buf!2761 (_2!4975 lt!174271))) (currentByte!5368 (_2!4975 lt!174271)) (currentBit!5363 (_2!4975 lt!174271))) lt!175065)))

(declare-fun b!114890 () Bool)

(declare-fun res!94919 () Bool)

(assert (=> b!114890 (=> (not res!94919) (not e!75328))))

(assert (=> b!114890 (= res!94919 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!175065))))

(declare-fun b!114891 () Bool)

(declare-fun lt!175063 () (_ BitVec 64))

(assert (=> b!114891 (= e!75328 (bvsle lt!175065 (bvmul lt!175063 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!114891 (or (= lt!175063 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!175063 #b0000000000000000000000000000000000000000000000000000000000001000) lt!175063)))))

(assert (=> b!114891 (= lt!175063 ((_ sign_extend 32) (size!2353 (buf!2761 (_2!4975 lt!174271)))))))

(assert (= (and d!37030 res!94918) b!114890))

(assert (= (and b!114890 res!94919) b!114891))

(declare-fun m!171899 () Bool)

(assert (=> d!37030 m!171899))

(assert (=> d!37030 m!171645))

(assert (=> b!114534 d!37030))

(assert (=> b!114534 d!36770))

(declare-fun d!37032 () Bool)

(declare-fun res!94922 () Bool)

(declare-fun e!75330 () Bool)

(assert (=> d!37032 (=> (not res!94922) (not e!75330))))

(assert (=> d!37032 (= res!94922 (= (size!2353 (buf!2761 (_2!4975 lt!173863))) (size!2353 (buf!2761 (_2!4975 lt!174289)))))))

(assert (=> d!37032 (= (isPrefixOf!0 (_2!4975 lt!173863) (_2!4975 lt!174289)) e!75330)))

(declare-fun b!114892 () Bool)

(declare-fun res!94920 () Bool)

(assert (=> b!114892 (=> (not res!94920) (not e!75330))))

(assert (=> b!114892 (= res!94920 (bvsle (bitIndex!0 (size!2353 (buf!2761 (_2!4975 lt!173863))) (currentByte!5368 (_2!4975 lt!173863)) (currentBit!5363 (_2!4975 lt!173863))) (bitIndex!0 (size!2353 (buf!2761 (_2!4975 lt!174289))) (currentByte!5368 (_2!4975 lt!174289)) (currentBit!5363 (_2!4975 lt!174289)))))))

(declare-fun b!114893 () Bool)

(declare-fun e!75329 () Bool)

(assert (=> b!114893 (= e!75330 e!75329)))

(declare-fun res!94921 () Bool)

(assert (=> b!114893 (=> res!94921 e!75329)))

(assert (=> b!114893 (= res!94921 (= (size!2353 (buf!2761 (_2!4975 lt!173863))) #b00000000000000000000000000000000))))

(declare-fun b!114894 () Bool)

(assert (=> b!114894 (= e!75329 (arrayBitRangesEq!0 (buf!2761 (_2!4975 lt!173863)) (buf!2761 (_2!4975 lt!174289)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2353 (buf!2761 (_2!4975 lt!173863))) (currentByte!5368 (_2!4975 lt!173863)) (currentBit!5363 (_2!4975 lt!173863)))))))

(assert (= (and d!37032 res!94922) b!114892))

(assert (= (and b!114892 res!94920) b!114893))

(assert (= (and b!114893 (not res!94921)) b!114894))

(assert (=> b!114892 m!170665))

(assert (=> b!114892 m!170941))

(assert (=> b!114894 m!170665))

(assert (=> b!114894 m!170665))

(declare-fun m!171901 () Bool)

(assert (=> b!114894 m!171901))

(assert (=> b!114532 d!37032))

(declare-fun d!37034 () Bool)

(declare-fun e!75337 () Bool)

(assert (=> d!37034 e!75337))

(declare-fun res!94925 () Bool)

(assert (=> d!37034 (=> (not res!94925) (not e!75337))))

(declare-fun increaseBitIndex!0 (BitStream!4180) tuple2!9426)

(assert (=> d!37034 (= res!94925 (= (buf!2761 (_2!4975 (increaseBitIndex!0 (readerFrom!0 (_2!4975 lt!173863) (currentBit!5363 thiss!1305) (currentByte!5368 thiss!1305))))) (buf!2761 (readerFrom!0 (_2!4975 lt!173863) (currentBit!5363 thiss!1305) (currentByte!5368 thiss!1305)))))))

(declare-fun lt!175088 () Bool)

(assert (=> d!37034 (= lt!175088 (not (= (bvand ((_ sign_extend 24) (select (arr!2946 (buf!2761 (readerFrom!0 (_2!4975 lt!173863) (currentBit!5363 thiss!1305) (currentByte!5368 thiss!1305)))) (currentByte!5368 (readerFrom!0 (_2!4975 lt!173863) (currentBit!5363 thiss!1305) (currentByte!5368 thiss!1305))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5363 (readerFrom!0 (_2!4975 lt!173863) (currentBit!5363 thiss!1305) (currentByte!5368 thiss!1305)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!175087 () tuple2!9448)

(assert (=> d!37034 (= lt!175087 (tuple2!9449 (not (= (bvand ((_ sign_extend 24) (select (arr!2946 (buf!2761 (readerFrom!0 (_2!4975 lt!173863) (currentBit!5363 thiss!1305) (currentByte!5368 thiss!1305)))) (currentByte!5368 (readerFrom!0 (_2!4975 lt!173863) (currentBit!5363 thiss!1305) (currentByte!5368 thiss!1305))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5363 (readerFrom!0 (_2!4975 lt!173863) (currentBit!5363 thiss!1305) (currentByte!5368 thiss!1305)))))) #b00000000000000000000000000000000)) (_2!4975 (increaseBitIndex!0 (readerFrom!0 (_2!4975 lt!173863) (currentBit!5363 thiss!1305) (currentByte!5368 thiss!1305))))))))

(assert (=> d!37034 (validate_offset_bit!0 ((_ sign_extend 32) (size!2353 (buf!2761 (readerFrom!0 (_2!4975 lt!173863) (currentBit!5363 thiss!1305) (currentByte!5368 thiss!1305))))) ((_ sign_extend 32) (currentByte!5368 (readerFrom!0 (_2!4975 lt!173863) (currentBit!5363 thiss!1305) (currentByte!5368 thiss!1305)))) ((_ sign_extend 32) (currentBit!5363 (readerFrom!0 (_2!4975 lt!173863) (currentBit!5363 thiss!1305) (currentByte!5368 thiss!1305)))))))

(assert (=> d!37034 (= (readBit!0 (readerFrom!0 (_2!4975 lt!173863) (currentBit!5363 thiss!1305) (currentByte!5368 thiss!1305))) lt!175087)))

(declare-fun lt!175089 () (_ BitVec 64))

(declare-fun lt!175084 () (_ BitVec 64))

(declare-fun b!114897 () Bool)

(assert (=> b!114897 (= e!75337 (= (bitIndex!0 (size!2353 (buf!2761 (_2!4975 (increaseBitIndex!0 (readerFrom!0 (_2!4975 lt!173863) (currentBit!5363 thiss!1305) (currentByte!5368 thiss!1305)))))) (currentByte!5368 (_2!4975 (increaseBitIndex!0 (readerFrom!0 (_2!4975 lt!173863) (currentBit!5363 thiss!1305) (currentByte!5368 thiss!1305))))) (currentBit!5363 (_2!4975 (increaseBitIndex!0 (readerFrom!0 (_2!4975 lt!173863) (currentBit!5363 thiss!1305) (currentByte!5368 thiss!1305)))))) (bvadd lt!175089 lt!175084)))))

(assert (=> b!114897 (or (not (= (bvand lt!175089 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!175084 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!175089 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!175089 lt!175084) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!114897 (= lt!175084 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!114897 (= lt!175089 (bitIndex!0 (size!2353 (buf!2761 (readerFrom!0 (_2!4975 lt!173863) (currentBit!5363 thiss!1305) (currentByte!5368 thiss!1305)))) (currentByte!5368 (readerFrom!0 (_2!4975 lt!173863) (currentBit!5363 thiss!1305) (currentByte!5368 thiss!1305))) (currentBit!5363 (readerFrom!0 (_2!4975 lt!173863) (currentBit!5363 thiss!1305) (currentByte!5368 thiss!1305)))))))

(declare-fun lt!175085 () Bool)

(assert (=> b!114897 (= lt!175085 (not (= (bvand ((_ sign_extend 24) (select (arr!2946 (buf!2761 (readerFrom!0 (_2!4975 lt!173863) (currentBit!5363 thiss!1305) (currentByte!5368 thiss!1305)))) (currentByte!5368 (readerFrom!0 (_2!4975 lt!173863) (currentBit!5363 thiss!1305) (currentByte!5368 thiss!1305))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5363 (readerFrom!0 (_2!4975 lt!173863) (currentBit!5363 thiss!1305) (currentByte!5368 thiss!1305)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!175083 () Bool)

(assert (=> b!114897 (= lt!175083 (not (= (bvand ((_ sign_extend 24) (select (arr!2946 (buf!2761 (readerFrom!0 (_2!4975 lt!173863) (currentBit!5363 thiss!1305) (currentByte!5368 thiss!1305)))) (currentByte!5368 (readerFrom!0 (_2!4975 lt!173863) (currentBit!5363 thiss!1305) (currentByte!5368 thiss!1305))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5363 (readerFrom!0 (_2!4975 lt!173863) (currentBit!5363 thiss!1305) (currentByte!5368 thiss!1305)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!175086 () Bool)

(assert (=> b!114897 (= lt!175086 (not (= (bvand ((_ sign_extend 24) (select (arr!2946 (buf!2761 (readerFrom!0 (_2!4975 lt!173863) (currentBit!5363 thiss!1305) (currentByte!5368 thiss!1305)))) (currentByte!5368 (readerFrom!0 (_2!4975 lt!173863) (currentBit!5363 thiss!1305) (currentByte!5368 thiss!1305))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5363 (readerFrom!0 (_2!4975 lt!173863) (currentBit!5363 thiss!1305) (currentByte!5368 thiss!1305)))))) #b00000000000000000000000000000000)))))

(assert (= (and d!37034 res!94925) b!114897))

(assert (=> d!37034 m!170659))

(declare-fun m!171903 () Bool)

(assert (=> d!37034 m!171903))

(declare-fun m!171905 () Bool)

(assert (=> d!37034 m!171905))

(declare-fun m!171907 () Bool)

(assert (=> d!37034 m!171907))

(declare-fun m!171909 () Bool)

(assert (=> d!37034 m!171909))

(declare-fun m!171911 () Bool)

(assert (=> b!114897 m!171911))

(assert (=> b!114897 m!170659))

(assert (=> b!114897 m!171903))

(assert (=> b!114897 m!171907))

(declare-fun m!171913 () Bool)

(assert (=> b!114897 m!171913))

(assert (=> b!114897 m!171905))

(assert (=> d!36764 d!37034))

(assert (=> d!36700 d!36948))

(declare-fun d!37036 () Bool)

(declare-fun e!75338 () Bool)

(assert (=> d!37036 e!75338))

(declare-fun res!94926 () Bool)

(assert (=> d!37036 (=> (not res!94926) (not e!75338))))

(declare-fun lt!175095 () (_ BitVec 64))

(declare-fun lt!175092 () (_ BitVec 64))

(declare-fun lt!175094 () (_ BitVec 64))

(assert (=> d!37036 (= res!94926 (= lt!175092 (bvsub lt!175094 lt!175095)))))

(assert (=> d!37036 (or (= (bvand lt!175094 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!175095 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!175094 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!175094 lt!175095) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!37036 (= lt!175095 (remainingBits!0 ((_ sign_extend 32) (size!2353 (buf!2761 (_1!4976 lt!174259)))) ((_ sign_extend 32) (currentByte!5368 (_1!4976 lt!174259))) ((_ sign_extend 32) (currentBit!5363 (_1!4976 lt!174259)))))))

(declare-fun lt!175093 () (_ BitVec 64))

(declare-fun lt!175091 () (_ BitVec 64))

(assert (=> d!37036 (= lt!175094 (bvmul lt!175093 lt!175091))))

(assert (=> d!37036 (or (= lt!175093 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!175091 (bvsdiv (bvmul lt!175093 lt!175091) lt!175093)))))

(assert (=> d!37036 (= lt!175091 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!37036 (= lt!175093 ((_ sign_extend 32) (size!2353 (buf!2761 (_1!4976 lt!174259)))))))

(assert (=> d!37036 (= lt!175092 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5368 (_1!4976 lt!174259))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5363 (_1!4976 lt!174259)))))))

(assert (=> d!37036 (invariant!0 (currentBit!5363 (_1!4976 lt!174259)) (currentByte!5368 (_1!4976 lt!174259)) (size!2353 (buf!2761 (_1!4976 lt!174259))))))

(assert (=> d!37036 (= (bitIndex!0 (size!2353 (buf!2761 (_1!4976 lt!174259))) (currentByte!5368 (_1!4976 lt!174259)) (currentBit!5363 (_1!4976 lt!174259))) lt!175092)))

(declare-fun b!114898 () Bool)

(declare-fun res!94927 () Bool)

(assert (=> b!114898 (=> (not res!94927) (not e!75338))))

(assert (=> b!114898 (= res!94927 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!175092))))

(declare-fun b!114899 () Bool)

(declare-fun lt!175090 () (_ BitVec 64))

(assert (=> b!114899 (= e!75338 (bvsle lt!175092 (bvmul lt!175090 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!114899 (or (= lt!175090 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!175090 #b0000000000000000000000000000000000000000000000000000000000001000) lt!175090)))))

(assert (=> b!114899 (= lt!175090 ((_ sign_extend 32) (size!2353 (buf!2761 (_1!4976 lt!174259)))))))

(assert (= (and d!37036 res!94926) b!114898))

(assert (= (and b!114898 res!94927) b!114899))

(declare-fun m!171915 () Bool)

(assert (=> d!37036 m!171915))

(declare-fun m!171917 () Bool)

(assert (=> d!37036 m!171917))

(assert (=> b!114531 d!37036))

(assert (=> b!114531 d!37030))

(declare-fun d!37038 () Bool)

(declare-fun e!75339 () Bool)

(assert (=> d!37038 e!75339))

(declare-fun res!94928 () Bool)

(assert (=> d!37038 (=> (not res!94928) (not e!75339))))

(declare-fun lt!175098 () (_ BitVec 64))

(declare-fun lt!175100 () (_ BitVec 64))

(declare-fun lt!175101 () (_ BitVec 64))

(assert (=> d!37038 (= res!94928 (= lt!175098 (bvsub lt!175100 lt!175101)))))

(assert (=> d!37038 (or (= (bvand lt!175100 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!175101 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!175100 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!175100 lt!175101) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!37038 (= lt!175101 (remainingBits!0 ((_ sign_extend 32) (size!2353 (buf!2761 (_1!4976 lt!174311)))) ((_ sign_extend 32) (currentByte!5368 (_1!4976 lt!174311))) ((_ sign_extend 32) (currentBit!5363 (_1!4976 lt!174311)))))))

(declare-fun lt!175099 () (_ BitVec 64))

(declare-fun lt!175097 () (_ BitVec 64))

(assert (=> d!37038 (= lt!175100 (bvmul lt!175099 lt!175097))))

(assert (=> d!37038 (or (= lt!175099 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!175097 (bvsdiv (bvmul lt!175099 lt!175097) lt!175099)))))

(assert (=> d!37038 (= lt!175097 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!37038 (= lt!175099 ((_ sign_extend 32) (size!2353 (buf!2761 (_1!4976 lt!174311)))))))

(assert (=> d!37038 (= lt!175098 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5368 (_1!4976 lt!174311))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5363 (_1!4976 lt!174311)))))))

(assert (=> d!37038 (invariant!0 (currentBit!5363 (_1!4976 lt!174311)) (currentByte!5368 (_1!4976 lt!174311)) (size!2353 (buf!2761 (_1!4976 lt!174311))))))

(assert (=> d!37038 (= (bitIndex!0 (size!2353 (buf!2761 (_1!4976 lt!174311))) (currentByte!5368 (_1!4976 lt!174311)) (currentBit!5363 (_1!4976 lt!174311))) lt!175098)))

(declare-fun b!114900 () Bool)

(declare-fun res!94929 () Bool)

(assert (=> b!114900 (=> (not res!94929) (not e!75339))))

(assert (=> b!114900 (= res!94929 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!175098))))

(declare-fun b!114901 () Bool)

(declare-fun lt!175096 () (_ BitVec 64))

(assert (=> b!114901 (= e!75339 (bvsle lt!175098 (bvmul lt!175096 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!114901 (or (= lt!175096 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!175096 #b0000000000000000000000000000000000000000000000000000000000001000) lt!175096)))))

(assert (=> b!114901 (= lt!175096 ((_ sign_extend 32) (size!2353 (buf!2761 (_1!4976 lt!174311)))))))

(assert (= (and d!37038 res!94928) b!114900))

(assert (= (and b!114900 res!94929) b!114901))

(declare-fun m!171919 () Bool)

(assert (=> d!37038 m!171919))

(declare-fun m!171921 () Bool)

(assert (=> d!37038 m!171921))

(assert (=> b!114569 d!37038))

(assert (=> b!114569 d!36926))

(push 1)

(assert (not b!114858))

(assert (not d!36996))

(assert (not b!114855))

(assert (not d!36930))

(assert (not d!36946))

(assert (not d!37006))

(assert (not b!114789))

(assert (not b!114787))

(assert (not d!36926))

(assert (not b!114853))

(assert (not d!37002))

(assert (not b!114806))

(assert (not d!36934))

(assert (not d!36976))

(assert (not b!114821))

(assert (not b!114819))

(assert (not d!36974))

(assert (not d!37024))

(assert (not b!114862))

(assert (not b!114866))

(assert (not d!36962))

(assert (not b!114859))

(assert (not b!114854))

(assert (not b!114861))

(assert (not d!36940))

(assert (not b!114804))

(assert (not d!36986))

(assert (not d!37022))

(assert (not d!36992))

(assert (not b!114782))

(assert (not b!114837))

(assert (not b!114818))

(assert (not b!114823))

(assert (not b!114868))

(assert (not d!37016))

(assert (not b!114803))

(assert (not d!36988))

(assert (not b!114892))

(assert (not d!37020))

(assert (not d!36990))

(assert (not d!36960))

(assert (not b!114839))

(assert (not d!36984))

(assert (not d!36998))

(assert (not d!36972))

(assert (not b!114784))

(assert (not b!114834))

(assert (not d!37010))

(assert (not b!114850))

(assert (not d!37030))

(assert (not b!114779))

(assert (not d!36912))

(assert (not b!114852))

(assert (not d!36980))

(assert (not d!37028))

(assert (not b!114807))

(assert (not b!114865))

(assert (not d!37018))

(assert (not b!114894))

(assert (not bm!1486))

(assert (not b!114847))

(assert (not d!37008))

(assert (not b!114874))

(assert (not b!114860))

(assert (not b!114871))

(assert (not b!114805))

(assert (not b!114857))

(assert (not d!37038))

(assert (not b!114845))

(assert (not b!114870))

(assert (not b!114873))

(assert (not bm!1487))

(assert (not d!36978))

(assert (not d!36914))

(assert (not b!114840))

(assert (not b!114822))

(assert (not bm!1485))

(assert (not d!36938))

(assert (not b!114897))

(assert (not d!36942))

(assert (not b!114869))

(assert (not b!114831))

(assert (not b!114825))

(assert (not d!36994))

(assert (not d!37000))

(assert (not d!36932))

(assert (not d!37012))

(assert (not b!114849))

(assert (not d!36958))

(assert (not d!36928))

(assert (not b!114876))

(assert (not b!114785))

(assert (not d!37034))

(assert (not d!37036))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

