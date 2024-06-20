; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18184 () Bool)

(assert start!18184)

(declare-fun b!89945 () Bool)

(declare-fun res!74125 () Bool)

(declare-fun e!59338 () Bool)

(assert (=> b!89945 (=> (not res!74125) (not e!59338))))

(declare-datatypes ((array!4233 0))(
  ( (array!4234 (arr!2547 (Array (_ BitVec 32) (_ BitVec 8))) (size!1910 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3382 0))(
  ( (BitStream!3383 (buf!2300 array!4233) (currentByte!4563 (_ BitVec 32)) (currentBit!4558 (_ BitVec 32))) )
))
(declare-fun thiss!1152 () BitStream!3382)

(declare-fun nBits!336 () (_ BitVec 32))

(declare-fun i!576 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!89945 (= res!74125 (validate_offset_bits!1 ((_ sign_extend 32) (size!1910 (buf!2300 thiss!1152))) ((_ sign_extend 32) (currentByte!4563 thiss!1152)) ((_ sign_extend 32) (currentBit!4558 thiss!1152)) ((_ sign_extend 32) (bvsub nBits!336 i!576))))))

(declare-fun b!89946 () Bool)

(declare-fun e!59333 () Bool)

(declare-fun e!59336 () Bool)

(assert (=> b!89946 (= e!59333 e!59336)))

(declare-fun res!74126 () Bool)

(assert (=> b!89946 (=> (not res!74126) (not e!59336))))

(declare-datatypes ((Unit!5806 0))(
  ( (Unit!5807) )
))
(declare-datatypes ((tuple3!430 0))(
  ( (tuple3!431 (_1!4000 Unit!5806) (_2!4000 BitStream!3382) (_3!239 (_ BitVec 32))) )
))
(declare-fun lt!136832 () tuple3!430)

(assert (=> b!89946 (= res!74126 (bvsge (_3!239 lt!136832) #b00000000000000000000000000000000))))

(declare-datatypes ((tuple2!7522 0))(
  ( (tuple2!7523 (_1!4001 Unit!5806) (_2!4001 BitStream!3382)) )
))
(declare-fun lt!136835 () tuple2!7522)

(declare-fun thiss!1151 () BitStream!3382)

(declare-fun v!179 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstWhileWhile!0 ((_ BitVec 32) BitStream!3382 (_ BitVec 64) BitStream!3382 (_ BitVec 32)) tuple3!430)

(assert (=> b!89946 (= lt!136832 (appendBitsLSBFirstWhileWhile!0 nBits!336 thiss!1151 v!179 (_2!4001 lt!136835) (bvadd #b00000000000000000000000000000001 i!576)))))

(declare-fun b!89947 () Bool)

(assert (=> b!89947 (= e!59338 (not e!59333))))

(declare-fun res!74131 () Bool)

(assert (=> b!89947 (=> res!74131 e!59333)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!89947 (= res!74131 (not (invariant!0 (currentBit!4558 (_2!4001 lt!136835)) (currentByte!4563 (_2!4001 lt!136835)) (size!1910 (buf!2300 (_2!4001 lt!136835))))))))

(declare-fun e!59340 () Bool)

(assert (=> b!89947 e!59340))

(declare-fun res!74123 () Bool)

(assert (=> b!89947 (=> (not res!74123) (not e!59340))))

(assert (=> b!89947 (= res!74123 (= (size!1910 (buf!2300 thiss!1152)) (size!1910 (buf!2300 (_2!4001 lt!136835)))))))

(declare-fun lt!136831 () Bool)

(declare-fun appendBit!0 (BitStream!3382 Bool) tuple2!7522)

(assert (=> b!89947 (= lt!136835 (appendBit!0 thiss!1152 lt!136831))))

(assert (=> b!89947 (= lt!136831 (not (= (bvand v!179 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!576))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!89948 () Bool)

(declare-fun res!74132 () Bool)

(assert (=> b!89948 (=> res!74132 e!59333)))

(assert (=> b!89948 (= res!74132 (bvsge (bvadd #b00000000000000000000000000000001 i!576) nBits!336))))

(declare-fun b!89949 () Bool)

(declare-fun e!59334 () Bool)

(declare-fun array_inv!1756 (array!4233) Bool)

(assert (=> b!89949 (= e!59334 (array_inv!1756 (buf!2300 thiss!1151)))))

(declare-fun b!89950 () Bool)

(declare-fun res!74130 () Bool)

(declare-fun e!59341 () Bool)

(assert (=> b!89950 (=> (not res!74130) (not e!59341))))

(assert (=> b!89950 (= res!74130 (invariant!0 (currentBit!4558 thiss!1151) (currentByte!4563 thiss!1151) (size!1910 (buf!2300 thiss!1151))))))

(declare-fun b!89951 () Bool)

(declare-fun e!59342 () Bool)

(declare-datatypes ((tuple2!7524 0))(
  ( (tuple2!7525 (_1!4002 BitStream!3382) (_2!4002 Bool)) )
))
(declare-fun lt!136834 () tuple2!7524)

(declare-fun lt!136830 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!89951 (= e!59342 (= (bitIndex!0 (size!1910 (buf!2300 (_1!4002 lt!136834))) (currentByte!4563 (_1!4002 lt!136834)) (currentBit!4558 (_1!4002 lt!136834))) lt!136830))))

(declare-fun b!89952 () Bool)

(declare-fun res!74134 () Bool)

(assert (=> b!89952 (=> (not res!74134) (not e!59336))))

(assert (=> b!89952 (= res!74134 (and (bvsle (_3!239 lt!136832) nBits!336) (= (size!1910 (buf!2300 (_2!4000 lt!136832))) (size!1910 (buf!2300 thiss!1151)))))))

(declare-fun b!89953 () Bool)

(declare-fun res!74138 () Bool)

(assert (=> b!89953 (=> (not res!74138) (not e!59336))))

(declare-fun lt!136836 () (_ BitVec 64))

(assert (=> b!89953 (= res!74138 (= (bitIndex!0 (size!1910 (buf!2300 (_2!4000 lt!136832))) (currentByte!4563 (_2!4000 lt!136832)) (currentBit!4558 (_2!4000 lt!136832))) (bvadd lt!136836 ((_ sign_extend 32) (_3!239 lt!136832)))))))

(declare-fun b!89954 () Bool)

(declare-fun e!59339 () Bool)

(assert (=> b!89954 (= e!59339 (array_inv!1756 (buf!2300 thiss!1152)))))

(declare-fun b!89955 () Bool)

(declare-fun e!59337 () Bool)

(assert (=> b!89955 (= e!59340 e!59337)))

(declare-fun res!74129 () Bool)

(assert (=> b!89955 (=> (not res!74129) (not e!59337))))

(declare-fun lt!136833 () (_ BitVec 64))

(assert (=> b!89955 (= res!74129 (= lt!136830 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!136833)))))

(assert (=> b!89955 (= lt!136830 (bitIndex!0 (size!1910 (buf!2300 (_2!4001 lt!136835))) (currentByte!4563 (_2!4001 lt!136835)) (currentBit!4558 (_2!4001 lt!136835))))))

(declare-fun b!89957 () Bool)

(declare-fun res!74124 () Bool)

(assert (=> b!89957 (=> (not res!74124) (not e!59336))))

(assert (=> b!89957 (= res!74124 (invariant!0 (currentBit!4558 (_2!4000 lt!136832)) (currentByte!4563 (_2!4000 lt!136832)) (size!1910 (buf!2300 (_2!4000 lt!136832)))))))

(declare-fun b!89958 () Bool)

(declare-fun res!74136 () Bool)

(assert (=> b!89958 (=> (not res!74136) (not e!59338))))

(assert (=> b!89958 (= res!74136 (bvslt i!576 nBits!336))))

(declare-fun b!89959 () Bool)

(assert (=> b!89959 (= e!59337 e!59342)))

(declare-fun res!74128 () Bool)

(assert (=> b!89959 (=> (not res!74128) (not e!59342))))

(assert (=> b!89959 (= res!74128 (and (= (_2!4002 lt!136834) lt!136831) (= (_1!4002 lt!136834) (_2!4001 lt!136835))))))

(declare-fun readBitPure!0 (BitStream!3382) tuple2!7524)

(declare-fun readerFrom!0 (BitStream!3382 (_ BitVec 32) (_ BitVec 32)) BitStream!3382)

(assert (=> b!89959 (= lt!136834 (readBitPure!0 (readerFrom!0 (_2!4001 lt!136835) (currentBit!4558 thiss!1152) (currentByte!4563 thiss!1152))))))

(declare-fun b!89960 () Bool)

(declare-fun res!74122 () Bool)

(assert (=> b!89960 (=> (not res!74122) (not e!59337))))

(declare-fun isPrefixOf!0 (BitStream!3382 BitStream!3382) Bool)

(assert (=> b!89960 (= res!74122 (isPrefixOf!0 thiss!1152 (_2!4001 lt!136835)))))

(declare-fun b!89961 () Bool)

(assert (=> b!89961 (= e!59341 e!59338)))

(declare-fun res!74135 () Bool)

(assert (=> b!89961 (=> (not res!74135) (not e!59338))))

(assert (=> b!89961 (= res!74135 (= lt!136833 (bvadd lt!136836 ((_ sign_extend 32) i!576))))))

(assert (=> b!89961 (= lt!136833 (bitIndex!0 (size!1910 (buf!2300 thiss!1152)) (currentByte!4563 thiss!1152) (currentBit!4558 thiss!1152)))))

(assert (=> b!89961 (= lt!136836 (bitIndex!0 (size!1910 (buf!2300 thiss!1151)) (currentByte!4563 thiss!1151) (currentBit!4558 thiss!1151)))))

(declare-fun b!89962 () Bool)

(declare-fun res!74137 () Bool)

(assert (=> b!89962 (=> (not res!74137) (not e!59341))))

(assert (=> b!89962 (= res!74137 (validate_offset_bits!1 ((_ sign_extend 32) (size!1910 (buf!2300 thiss!1151))) ((_ sign_extend 32) (currentByte!4563 thiss!1151)) ((_ sign_extend 32) (currentBit!4558 thiss!1151)) ((_ sign_extend 32) nBits!336)))))

(declare-fun b!89963 () Bool)

(declare-fun res!74133 () Bool)

(assert (=> b!89963 (=> (not res!74133) (not e!59341))))

(assert (=> b!89963 (= res!74133 (invariant!0 (currentBit!4558 thiss!1152) (currentByte!4563 thiss!1152) (size!1910 (buf!2300 thiss!1152))))))

(declare-fun b!89964 () Bool)

(assert (=> b!89964 (= e!59336 (validate_offset_bits!1 ((_ sign_extend 32) (size!1910 (buf!2300 (_2!4000 lt!136832)))) ((_ sign_extend 32) (currentByte!4563 (_2!4000 lt!136832))) ((_ sign_extend 32) (currentBit!4558 (_2!4000 lt!136832))) ((_ sign_extend 32) (bvsub nBits!336 (_3!239 lt!136832)))))))

(declare-fun b!89965 () Bool)

(declare-fun res!74139 () Bool)

(assert (=> b!89965 (=> (not res!74139) (not e!59341))))

(assert (=> b!89965 (= res!74139 (and (bvsle i!576 nBits!336) (= (size!1910 (buf!2300 thiss!1152)) (size!1910 (buf!2300 thiss!1151)))))))

(declare-fun res!74127 () Bool)

(assert (=> start!18184 (=> (not res!74127) (not e!59341))))

(assert (=> start!18184 (= res!74127 (and (bvsge nBits!336 #b00000000000000000000000000000000) (bvsle nBits!336 #b00000000000000000000000001000000)))))

(assert (=> start!18184 e!59341))

(declare-fun inv!12 (BitStream!3382) Bool)

(assert (=> start!18184 (and (inv!12 thiss!1152) e!59339)))

(assert (=> start!18184 (and (inv!12 thiss!1151) e!59334)))

(assert (=> start!18184 true))

(declare-fun b!89956 () Bool)

(declare-fun res!74140 () Bool)

(assert (=> b!89956 (=> (not res!74140) (not e!59341))))

(assert (=> b!89956 (= res!74140 (bvsge i!576 #b00000000000000000000000000000000))))

(assert (= (and start!18184 res!74127) b!89962))

(assert (= (and b!89962 res!74137) b!89950))

(assert (= (and b!89950 res!74130) b!89956))

(assert (= (and b!89956 res!74140) b!89963))

(assert (= (and b!89963 res!74133) b!89965))

(assert (= (and b!89965 res!74139) b!89961))

(assert (= (and b!89961 res!74135) b!89945))

(assert (= (and b!89945 res!74125) b!89958))

(assert (= (and b!89958 res!74136) b!89947))

(assert (= (and b!89947 res!74123) b!89955))

(assert (= (and b!89955 res!74129) b!89960))

(assert (= (and b!89960 res!74122) b!89959))

(assert (= (and b!89959 res!74128) b!89951))

(assert (= (and b!89947 (not res!74131)) b!89948))

(assert (= (and b!89948 (not res!74132)) b!89946))

(assert (= (and b!89946 res!74126) b!89957))

(assert (= (and b!89957 res!74124) b!89952))

(assert (= (and b!89952 res!74134) b!89953))

(assert (= (and b!89953 res!74138) b!89964))

(assert (= start!18184 b!89954))

(assert (= start!18184 b!89949))

(declare-fun m!134585 () Bool)

(assert (=> b!89963 m!134585))

(declare-fun m!134587 () Bool)

(assert (=> start!18184 m!134587))

(declare-fun m!134589 () Bool)

(assert (=> start!18184 m!134589))

(declare-fun m!134591 () Bool)

(assert (=> b!89945 m!134591))

(declare-fun m!134593 () Bool)

(assert (=> b!89960 m!134593))

(declare-fun m!134595 () Bool)

(assert (=> b!89962 m!134595))

(declare-fun m!134597 () Bool)

(assert (=> b!89954 m!134597))

(declare-fun m!134599 () Bool)

(assert (=> b!89959 m!134599))

(assert (=> b!89959 m!134599))

(declare-fun m!134601 () Bool)

(assert (=> b!89959 m!134601))

(declare-fun m!134603 () Bool)

(assert (=> b!89953 m!134603))

(declare-fun m!134605 () Bool)

(assert (=> b!89946 m!134605))

(declare-fun m!134607 () Bool)

(assert (=> b!89961 m!134607))

(declare-fun m!134609 () Bool)

(assert (=> b!89961 m!134609))

(declare-fun m!134611 () Bool)

(assert (=> b!89951 m!134611))

(declare-fun m!134613 () Bool)

(assert (=> b!89955 m!134613))

(declare-fun m!134615 () Bool)

(assert (=> b!89964 m!134615))

(declare-fun m!134617 () Bool)

(assert (=> b!89947 m!134617))

(declare-fun m!134619 () Bool)

(assert (=> b!89947 m!134619))

(declare-fun m!134621 () Bool)

(assert (=> b!89950 m!134621))

(declare-fun m!134623 () Bool)

(assert (=> b!89949 m!134623))

(declare-fun m!134625 () Bool)

(assert (=> b!89957 m!134625))

(push 1)

(assert (not b!89951))

(assert (not b!89957))

(assert (not b!89959))

(assert (not b!89962))

(assert (not start!18184))

(assert (not b!89964))

(assert (not b!89949))

(assert (not b!89953))

(assert (not b!89954))

(assert (not b!89950))

(assert (not b!89960))

(assert (not b!89955))

(assert (not b!89945))

(assert (not b!89947))

(assert (not b!89961))

(assert (not b!89946))

(assert (not b!89963))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!28050 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!28050 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1910 (buf!2300 thiss!1152))) ((_ sign_extend 32) (currentByte!4563 thiss!1152)) ((_ sign_extend 32) (currentBit!4558 thiss!1152)) ((_ sign_extend 32) (bvsub nBits!336 i!576))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1910 (buf!2300 thiss!1152))) ((_ sign_extend 32) (currentByte!4563 thiss!1152)) ((_ sign_extend 32) (currentBit!4558 thiss!1152))) ((_ sign_extend 32) (bvsub nBits!336 i!576))))))

(declare-fun bs!6950 () Bool)

(assert (= bs!6950 d!28050))

(declare-fun m!134723 () Bool)

(assert (=> bs!6950 m!134723))

(assert (=> b!89945 d!28050))

(declare-fun d!28052 () Bool)

(declare-fun e!59424 () Bool)

(assert (=> d!28052 e!59424))

(declare-fun res!74281 () Bool)

(assert (=> d!28052 (=> (not res!74281) (not e!59424))))

(declare-fun lt!136931 () (_ BitVec 64))

(declare-fun lt!136927 () (_ BitVec 64))

(declare-fun lt!136929 () (_ BitVec 64))

(assert (=> d!28052 (= res!74281 (= lt!136931 (bvsub lt!136927 lt!136929)))))

(assert (=> d!28052 (or (= (bvand lt!136927 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!136929 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!136927 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!136927 lt!136929) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!28052 (= lt!136929 (remainingBits!0 ((_ sign_extend 32) (size!1910 (buf!2300 (_2!4001 lt!136835)))) ((_ sign_extend 32) (currentByte!4563 (_2!4001 lt!136835))) ((_ sign_extend 32) (currentBit!4558 (_2!4001 lt!136835)))))))

(declare-fun lt!136930 () (_ BitVec 64))

(declare-fun lt!136928 () (_ BitVec 64))

(assert (=> d!28052 (= lt!136927 (bvmul lt!136930 lt!136928))))

(assert (=> d!28052 (or (= lt!136930 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!136928 (bvsdiv (bvmul lt!136930 lt!136928) lt!136930)))))

(assert (=> d!28052 (= lt!136928 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!28052 (= lt!136930 ((_ sign_extend 32) (size!1910 (buf!2300 (_2!4001 lt!136835)))))))

(assert (=> d!28052 (= lt!136931 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4563 (_2!4001 lt!136835))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4558 (_2!4001 lt!136835)))))))

(assert (=> d!28052 (invariant!0 (currentBit!4558 (_2!4001 lt!136835)) (currentByte!4563 (_2!4001 lt!136835)) (size!1910 (buf!2300 (_2!4001 lt!136835))))))

(assert (=> d!28052 (= (bitIndex!0 (size!1910 (buf!2300 (_2!4001 lt!136835))) (currentByte!4563 (_2!4001 lt!136835)) (currentBit!4558 (_2!4001 lt!136835))) lt!136931)))

(declare-fun b!90117 () Bool)

(declare-fun res!74280 () Bool)

(assert (=> b!90117 (=> (not res!74280) (not e!59424))))

(assert (=> b!90117 (= res!74280 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!136931))))

(declare-fun b!90118 () Bool)

(declare-fun lt!136932 () (_ BitVec 64))

(assert (=> b!90118 (= e!59424 (bvsle lt!136931 (bvmul lt!136932 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!90118 (or (= lt!136932 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!136932 #b0000000000000000000000000000000000000000000000000000000000001000) lt!136932)))))

(assert (=> b!90118 (= lt!136932 ((_ sign_extend 32) (size!1910 (buf!2300 (_2!4001 lt!136835)))))))

(assert (= (and d!28052 res!74281) b!90117))

(assert (= (and b!90117 res!74280) b!90118))

(declare-fun m!134725 () Bool)

(assert (=> d!28052 m!134725))

(assert (=> d!28052 m!134617))

(assert (=> b!89955 d!28052))

(declare-fun d!28054 () Bool)

(assert (=> d!28054 (= (invariant!0 (currentBit!4558 (_2!4000 lt!136832)) (currentByte!4563 (_2!4000 lt!136832)) (size!1910 (buf!2300 (_2!4000 lt!136832)))) (and (bvsge (currentBit!4558 (_2!4000 lt!136832)) #b00000000000000000000000000000000) (bvslt (currentBit!4558 (_2!4000 lt!136832)) #b00000000000000000000000000001000) (bvsge (currentByte!4563 (_2!4000 lt!136832)) #b00000000000000000000000000000000) (or (bvslt (currentByte!4563 (_2!4000 lt!136832)) (size!1910 (buf!2300 (_2!4000 lt!136832)))) (and (= (currentBit!4558 (_2!4000 lt!136832)) #b00000000000000000000000000000000) (= (currentByte!4563 (_2!4000 lt!136832)) (size!1910 (buf!2300 (_2!4000 lt!136832))))))))))

(assert (=> b!89957 d!28054))

(declare-fun b!90205 () Bool)

(declare-fun res!74371 () Bool)

(declare-fun e!59457 () Bool)

(assert (=> b!90205 (=> (not res!74371) (not e!59457))))

(declare-fun lt!136995 () (_ BitVec 64))

(declare-fun lt!136991 () tuple3!430)

(declare-fun lt!136998 () (_ BitVec 64))

(assert (=> b!90205 (= res!74371 (= (bitIndex!0 (size!1910 (buf!2300 (_2!4000 lt!136991))) (currentByte!4563 (_2!4000 lt!136991)) (currentBit!4558 (_2!4000 lt!136991))) (bvadd lt!136998 lt!136995)))))

(assert (=> b!90205 (or (not (= (bvand lt!136998 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!136995 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!136998 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!136998 lt!136995) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!90205 (= lt!136995 ((_ sign_extend 32) (_3!239 lt!136991)))))

(assert (=> b!90205 (= lt!136998 (bitIndex!0 (size!1910 (buf!2300 thiss!1151)) (currentByte!4563 thiss!1151) (currentBit!4558 thiss!1151)))))

(declare-fun b!90206 () Bool)

(declare-fun e!59455 () tuple3!430)

(declare-fun lt!136997 () tuple2!7522)

(declare-fun lt!136996 () (_ BitVec 32))

(declare-fun Unit!5812 () Unit!5806)

(assert (=> b!90206 (= e!59455 (tuple3!431 Unit!5812 (_2!4001 lt!136997) lt!136996))))

(declare-fun b!90207 () Bool)

(declare-fun res!74366 () Bool)

(declare-fun e!59456 () Bool)

(assert (=> b!90207 (=> (not res!74366) (not e!59456))))

(assert (=> b!90207 (= res!74366 (= (bitIndex!0 (size!1910 (buf!2300 (_2!4001 lt!136835))) (currentByte!4563 (_2!4001 lt!136835)) (currentBit!4558 (_2!4001 lt!136835))) (bvadd (bitIndex!0 (size!1910 (buf!2300 thiss!1151)) (currentByte!4563 thiss!1151) (currentBit!4558 thiss!1151)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!576)))))))

(declare-fun b!90208 () Bool)

(declare-fun res!74369 () Bool)

(assert (=> b!90208 (=> (not res!74369) (not e!59456))))

(assert (=> b!90208 (= res!74369 (validate_offset_bits!1 ((_ sign_extend 32) (size!1910 (buf!2300 (_2!4001 lt!136835)))) ((_ sign_extend 32) (currentByte!4563 (_2!4001 lt!136835))) ((_ sign_extend 32) (currentBit!4558 (_2!4001 lt!136835))) ((_ sign_extend 32) (bvsub nBits!336 (bvadd #b00000000000000000000000000000001 i!576)))))))

(declare-fun b!90209 () Bool)

(declare-fun e!59454 () Bool)

(declare-fun e!59453 () Bool)

(assert (=> b!90209 (= e!59454 e!59453)))

(declare-fun res!74358 () Bool)

(assert (=> b!90209 (=> (not res!74358) (not e!59453))))

(declare-fun lt!136992 () Bool)

(declare-fun lt!136994 () tuple2!7524)

(declare-fun lt!136993 () tuple2!7522)

(assert (=> b!90209 (= res!74358 (and (= (_2!4002 lt!136994) lt!136992) (= (_1!4002 lt!136994) (_2!4001 lt!136993))))))

(assert (=> b!90209 (= lt!136994 (readBitPure!0 (readerFrom!0 (_2!4001 lt!136993) (currentBit!4558 (_2!4001 lt!136835)) (currentByte!4563 (_2!4001 lt!136835)))))))

(declare-fun b!90210 () Bool)

(declare-fun res!74363 () Bool)

(assert (=> b!90210 (=> (not res!74363) (not e!59457))))

(assert (=> b!90210 (= res!74363 (invariant!0 (currentBit!4558 (_2!4000 lt!136991)) (currentByte!4563 (_2!4000 lt!136991)) (size!1910 (buf!2300 (_2!4000 lt!136991)))))))

(declare-fun b!90211 () Bool)

(declare-fun res!74370 () Bool)

(assert (=> b!90211 (=> (not res!74370) (not e!59454))))

(assert (=> b!90211 (= res!74370 (= (bitIndex!0 (size!1910 (buf!2300 (_2!4001 lt!136993))) (currentByte!4563 (_2!4001 lt!136993)) (currentBit!4558 (_2!4001 lt!136993))) (bvadd (bitIndex!0 (size!1910 (buf!2300 (_2!4001 lt!136835))) (currentByte!4563 (_2!4001 lt!136835)) (currentBit!4558 (_2!4001 lt!136835))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!90212 () Bool)

(declare-fun res!74362 () Bool)

(assert (=> b!90212 (=> (not res!74362) (not e!59456))))

(assert (=> b!90212 (= res!74362 (invariant!0 (currentBit!4558 (_2!4001 lt!136835)) (currentByte!4563 (_2!4001 lt!136835)) (size!1910 (buf!2300 (_2!4001 lt!136835)))))))

(declare-fun b!90213 () Bool)

(assert (=> b!90213 (= e!59457 (bvsge (_3!239 lt!136991) nBits!336))))

(declare-fun b!90214 () Bool)

(assert (=> b!90214 (= e!59456 (bvslt (bvadd #b00000000000000000000000000000001 i!576) nBits!336))))

(declare-fun d!28058 () Bool)

(assert (=> d!28058 e!59457))

(declare-fun res!74367 () Bool)

(assert (=> d!28058 (=> (not res!74367) (not e!59457))))

(assert (=> d!28058 (= res!74367 (bvsge (_3!239 lt!136991) #b00000000000000000000000000000000))))

(assert (=> d!28058 (= lt!136991 e!59455)))

(declare-fun c!5873 () Bool)

(assert (=> d!28058 (= c!5873 (bvslt lt!136996 nBits!336))))

(assert (=> d!28058 (= lt!136996 (bvadd #b00000000000000000000000000000001 i!576 #b00000000000000000000000000000001))))

(assert (=> d!28058 (= lt!136997 lt!136993)))

(assert (=> d!28058 e!59454))

(declare-fun res!74368 () Bool)

(assert (=> d!28058 (=> (not res!74368) (not e!59454))))

(assert (=> d!28058 (= res!74368 (= (size!1910 (buf!2300 (_2!4001 lt!136835))) (size!1910 (buf!2300 (_2!4001 lt!136993)))))))

(assert (=> d!28058 (= lt!136993 (appendBit!0 (_2!4001 lt!136835) lt!136992))))

(assert (=> d!28058 (= lt!136992 (not (= (bvand v!179 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!576)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!28058 e!59456))

(declare-fun res!74365 () Bool)

(assert (=> d!28058 (=> (not res!74365) (not e!59456))))

(assert (=> d!28058 (= res!74365 (bvsge (bvadd #b00000000000000000000000000000001 i!576) #b00000000000000000000000000000000))))

(assert (=> d!28058 (= (appendBitsLSBFirstWhileWhile!0 nBits!336 thiss!1151 v!179 (_2!4001 lt!136835) (bvadd #b00000000000000000000000000000001 i!576)) lt!136991)))

(declare-fun b!90215 () Bool)

(declare-fun res!74360 () Bool)

(assert (=> b!90215 (=> (not res!74360) (not e!59457))))

(assert (=> b!90215 (= res!74360 (validate_offset_bits!1 ((_ sign_extend 32) (size!1910 (buf!2300 (_2!4000 lt!136991)))) ((_ sign_extend 32) (currentByte!4563 (_2!4000 lt!136991))) ((_ sign_extend 32) (currentBit!4558 (_2!4000 lt!136991))) ((_ sign_extend 32) (bvsub nBits!336 (_3!239 lt!136991)))))))

(assert (=> b!90215 (or (= (bvand nBits!336 #b10000000000000000000000000000000) (bvand (_3!239 lt!136991) #b10000000000000000000000000000000)) (= (bvand nBits!336 #b10000000000000000000000000000000) (bvand (bvsub nBits!336 (_3!239 lt!136991)) #b10000000000000000000000000000000)))))

(declare-fun b!90216 () Bool)

(declare-fun res!74361 () Bool)

(assert (=> b!90216 (=> (not res!74361) (not e!59456))))

(assert (=> b!90216 (= res!74361 (and (bvsle (bvadd #b00000000000000000000000000000001 i!576) nBits!336) (= (size!1910 (buf!2300 (_2!4001 lt!136835))) (size!1910 (buf!2300 thiss!1151)))))))

(declare-fun b!90217 () Bool)

(declare-fun res!74364 () Bool)

(assert (=> b!90217 (=> (not res!74364) (not e!59457))))

(assert (=> b!90217 (= res!74364 (and (bvsle (_3!239 lt!136991) nBits!336) (= (size!1910 (buf!2300 (_2!4000 lt!136991))) (size!1910 (buf!2300 thiss!1151)))))))

(declare-fun b!90218 () Bool)

(assert (=> b!90218 (= e!59455 (appendBitsLSBFirstWhileWhile!0 nBits!336 thiss!1151 v!179 (_2!4001 lt!136997) lt!136996))))

(declare-fun b!90219 () Bool)

(assert (=> b!90219 (= e!59453 (= (bitIndex!0 (size!1910 (buf!2300 (_1!4002 lt!136994))) (currentByte!4563 (_1!4002 lt!136994)) (currentBit!4558 (_1!4002 lt!136994))) (bitIndex!0 (size!1910 (buf!2300 (_2!4001 lt!136993))) (currentByte!4563 (_2!4001 lt!136993)) (currentBit!4558 (_2!4001 lt!136993)))))))

(declare-fun b!90220 () Bool)

(declare-fun res!74359 () Bool)

(assert (=> b!90220 (=> (not res!74359) (not e!59454))))

(assert (=> b!90220 (= res!74359 (isPrefixOf!0 (_2!4001 lt!136835) (_2!4001 lt!136993)))))

(assert (= (and d!28058 res!74365) b!90212))

(assert (= (and b!90212 res!74362) b!90216))

(assert (= (and b!90216 res!74361) b!90207))

(assert (= (and b!90207 res!74366) b!90208))

(assert (= (and b!90208 res!74369) b!90214))

(assert (= (and d!28058 res!74368) b!90211))

(assert (= (and b!90211 res!74370) b!90220))

(assert (= (and b!90220 res!74359) b!90209))

(assert (= (and b!90209 res!74358) b!90219))

(assert (= (and d!28058 c!5873) b!90218))

(assert (= (and d!28058 (not c!5873)) b!90206))

(assert (= (and d!28058 res!74367) b!90210))

(assert (= (and b!90210 res!74363) b!90217))

(assert (= (and b!90217 res!74364) b!90205))

(assert (= (and b!90205 res!74371) b!90215))

(assert (= (and b!90215 res!74360) b!90213))

(assert (=> b!90212 m!134617))

(declare-fun m!134751 () Bool)

(assert (=> b!90211 m!134751))

(assert (=> b!90211 m!134613))

(declare-fun m!134753 () Bool)

(assert (=> b!90210 m!134753))

(declare-fun m!134755 () Bool)

(assert (=> b!90219 m!134755))

(assert (=> b!90219 m!134751))

(declare-fun m!134757 () Bool)

(assert (=> b!90205 m!134757))

(assert (=> b!90205 m!134609))

(assert (=> b!90207 m!134613))

(assert (=> b!90207 m!134609))

(declare-fun m!134759 () Bool)

(assert (=> b!90220 m!134759))

(declare-fun m!134761 () Bool)

(assert (=> d!28058 m!134761))

(declare-fun m!134763 () Bool)

(assert (=> b!90208 m!134763))

(declare-fun m!134765 () Bool)

(assert (=> b!90209 m!134765))

(assert (=> b!90209 m!134765))

(declare-fun m!134767 () Bool)

(assert (=> b!90209 m!134767))

(declare-fun m!134769 () Bool)

(assert (=> b!90215 m!134769))

(declare-fun m!134771 () Bool)

(assert (=> b!90218 m!134771))

(assert (=> b!89946 d!28058))

(declare-fun d!28066 () Bool)

(declare-fun e!59466 () Bool)

(assert (=> d!28066 e!59466))

(declare-fun res!74391 () Bool)

(assert (=> d!28066 (=> (not res!74391) (not e!59466))))

(declare-fun lt!137011 () (_ BitVec 64))

(declare-fun lt!137015 () (_ BitVec 64))

(declare-fun lt!137013 () (_ BitVec 64))

(assert (=> d!28066 (= res!74391 (= lt!137015 (bvsub lt!137011 lt!137013)))))

(assert (=> d!28066 (or (= (bvand lt!137011 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!137013 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!137011 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!137011 lt!137013) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!28066 (= lt!137013 (remainingBits!0 ((_ sign_extend 32) (size!1910 (buf!2300 (_2!4000 lt!136832)))) ((_ sign_extend 32) (currentByte!4563 (_2!4000 lt!136832))) ((_ sign_extend 32) (currentBit!4558 (_2!4000 lt!136832)))))))

(declare-fun lt!137014 () (_ BitVec 64))

(declare-fun lt!137012 () (_ BitVec 64))

(assert (=> d!28066 (= lt!137011 (bvmul lt!137014 lt!137012))))

(assert (=> d!28066 (or (= lt!137014 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!137012 (bvsdiv (bvmul lt!137014 lt!137012) lt!137014)))))

(assert (=> d!28066 (= lt!137012 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!28066 (= lt!137014 ((_ sign_extend 32) (size!1910 (buf!2300 (_2!4000 lt!136832)))))))

(assert (=> d!28066 (= lt!137015 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4563 (_2!4000 lt!136832))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4558 (_2!4000 lt!136832)))))))

(assert (=> d!28066 (invariant!0 (currentBit!4558 (_2!4000 lt!136832)) (currentByte!4563 (_2!4000 lt!136832)) (size!1910 (buf!2300 (_2!4000 lt!136832))))))

(assert (=> d!28066 (= (bitIndex!0 (size!1910 (buf!2300 (_2!4000 lt!136832))) (currentByte!4563 (_2!4000 lt!136832)) (currentBit!4558 (_2!4000 lt!136832))) lt!137015)))

(declare-fun b!90243 () Bool)

(declare-fun res!74390 () Bool)

(assert (=> b!90243 (=> (not res!74390) (not e!59466))))

(assert (=> b!90243 (= res!74390 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!137015))))

(declare-fun b!90244 () Bool)

(declare-fun lt!137016 () (_ BitVec 64))

(assert (=> b!90244 (= e!59466 (bvsle lt!137015 (bvmul lt!137016 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!90244 (or (= lt!137016 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!137016 #b0000000000000000000000000000000000000000000000000000000000001000) lt!137016)))))

(assert (=> b!90244 (= lt!137016 ((_ sign_extend 32) (size!1910 (buf!2300 (_2!4000 lt!136832)))))))

(assert (= (and d!28066 res!74391) b!90243))

(assert (= (and b!90243 res!74390) b!90244))

(declare-fun m!134773 () Bool)

(assert (=> d!28066 m!134773))

(assert (=> d!28066 m!134625))

(assert (=> b!89953 d!28066))

(declare-fun d!28068 () Bool)

(assert (=> d!28068 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1910 (buf!2300 (_2!4000 lt!136832)))) ((_ sign_extend 32) (currentByte!4563 (_2!4000 lt!136832))) ((_ sign_extend 32) (currentBit!4558 (_2!4000 lt!136832))) ((_ sign_extend 32) (bvsub nBits!336 (_3!239 lt!136832)))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1910 (buf!2300 (_2!4000 lt!136832)))) ((_ sign_extend 32) (currentByte!4563 (_2!4000 lt!136832))) ((_ sign_extend 32) (currentBit!4558 (_2!4000 lt!136832)))) ((_ sign_extend 32) (bvsub nBits!336 (_3!239 lt!136832)))))))

(declare-fun bs!6951 () Bool)

(assert (= bs!6951 d!28068))

(assert (=> bs!6951 m!134773))

(assert (=> b!89964 d!28068))

(declare-fun d!28070 () Bool)

(assert (=> d!28070 (= (invariant!0 (currentBit!4558 thiss!1152) (currentByte!4563 thiss!1152) (size!1910 (buf!2300 thiss!1152))) (and (bvsge (currentBit!4558 thiss!1152) #b00000000000000000000000000000000) (bvslt (currentBit!4558 thiss!1152) #b00000000000000000000000000001000) (bvsge (currentByte!4563 thiss!1152) #b00000000000000000000000000000000) (or (bvslt (currentByte!4563 thiss!1152) (size!1910 (buf!2300 thiss!1152))) (and (= (currentBit!4558 thiss!1152) #b00000000000000000000000000000000) (= (currentByte!4563 thiss!1152) (size!1910 (buf!2300 thiss!1152)))))))))

(assert (=> b!89963 d!28070))

(declare-fun d!28072 () Bool)

(assert (=> d!28072 (= (array_inv!1756 (buf!2300 thiss!1152)) (bvsge (size!1910 (buf!2300 thiss!1152)) #b00000000000000000000000000000000))))

(assert (=> b!89954 d!28072))

(declare-fun d!28074 () Bool)

(declare-fun e!59469 () Bool)

(assert (=> d!28074 e!59469))

(declare-fun res!74403 () Bool)

(assert (=> d!28074 (=> (not res!74403) (not e!59469))))

(declare-fun lt!137021 () (_ BitVec 64))

(declare-fun lt!137023 () (_ BitVec 64))

(declare-fun lt!137025 () (_ BitVec 64))

(assert (=> d!28074 (= res!74403 (= lt!137025 (bvsub lt!137021 lt!137023)))))

(assert (=> d!28074 (or (= (bvand lt!137021 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!137023 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!137021 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!137021 lt!137023) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!28074 (= lt!137023 (remainingBits!0 ((_ sign_extend 32) (size!1910 (buf!2300 thiss!1152))) ((_ sign_extend 32) (currentByte!4563 thiss!1152)) ((_ sign_extend 32) (currentBit!4558 thiss!1152))))))

(declare-fun lt!137024 () (_ BitVec 64))

(declare-fun lt!137022 () (_ BitVec 64))

(assert (=> d!28074 (= lt!137021 (bvmul lt!137024 lt!137022))))

(assert (=> d!28074 (or (= lt!137024 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!137022 (bvsdiv (bvmul lt!137024 lt!137022) lt!137024)))))

(assert (=> d!28074 (= lt!137022 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!28074 (= lt!137024 ((_ sign_extend 32) (size!1910 (buf!2300 thiss!1152))))))

(assert (=> d!28074 (= lt!137025 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4563 thiss!1152)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4558 thiss!1152))))))

(assert (=> d!28074 (invariant!0 (currentBit!4558 thiss!1152) (currentByte!4563 thiss!1152) (size!1910 (buf!2300 thiss!1152)))))

(assert (=> d!28074 (= (bitIndex!0 (size!1910 (buf!2300 thiss!1152)) (currentByte!4563 thiss!1152) (currentBit!4558 thiss!1152)) lt!137025)))

(declare-fun b!90255 () Bool)

(declare-fun res!74402 () Bool)

(assert (=> b!90255 (=> (not res!74402) (not e!59469))))

(assert (=> b!90255 (= res!74402 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!137025))))

(declare-fun b!90256 () Bool)

(declare-fun lt!137026 () (_ BitVec 64))

(assert (=> b!90256 (= e!59469 (bvsle lt!137025 (bvmul lt!137026 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!90256 (or (= lt!137026 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!137026 #b0000000000000000000000000000000000000000000000000000000000001000) lt!137026)))))

(assert (=> b!90256 (= lt!137026 ((_ sign_extend 32) (size!1910 (buf!2300 thiss!1152))))))

(assert (= (and d!28074 res!74403) b!90255))

(assert (= (and b!90255 res!74402) b!90256))

(assert (=> d!28074 m!134723))

(assert (=> d!28074 m!134585))

(assert (=> b!89961 d!28074))

(declare-fun d!28076 () Bool)

(declare-fun e!59470 () Bool)

(assert (=> d!28076 e!59470))

(declare-fun res!74405 () Bool)

(assert (=> d!28076 (=> (not res!74405) (not e!59470))))

(declare-fun lt!137031 () (_ BitVec 64))

(declare-fun lt!137029 () (_ BitVec 64))

(declare-fun lt!137027 () (_ BitVec 64))

(assert (=> d!28076 (= res!74405 (= lt!137031 (bvsub lt!137027 lt!137029)))))

(assert (=> d!28076 (or (= (bvand lt!137027 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!137029 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!137027 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!137027 lt!137029) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!28076 (= lt!137029 (remainingBits!0 ((_ sign_extend 32) (size!1910 (buf!2300 thiss!1151))) ((_ sign_extend 32) (currentByte!4563 thiss!1151)) ((_ sign_extend 32) (currentBit!4558 thiss!1151))))))

(declare-fun lt!137030 () (_ BitVec 64))

(declare-fun lt!137028 () (_ BitVec 64))

(assert (=> d!28076 (= lt!137027 (bvmul lt!137030 lt!137028))))

(assert (=> d!28076 (or (= lt!137030 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!137028 (bvsdiv (bvmul lt!137030 lt!137028) lt!137030)))))

(assert (=> d!28076 (= lt!137028 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!28076 (= lt!137030 ((_ sign_extend 32) (size!1910 (buf!2300 thiss!1151))))))

(assert (=> d!28076 (= lt!137031 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4563 thiss!1151)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4558 thiss!1151))))))

(assert (=> d!28076 (invariant!0 (currentBit!4558 thiss!1151) (currentByte!4563 thiss!1151) (size!1910 (buf!2300 thiss!1151)))))

(assert (=> d!28076 (= (bitIndex!0 (size!1910 (buf!2300 thiss!1151)) (currentByte!4563 thiss!1151) (currentBit!4558 thiss!1151)) lt!137031)))

(declare-fun b!90257 () Bool)

(declare-fun res!74404 () Bool)

(assert (=> b!90257 (=> (not res!74404) (not e!59470))))

(assert (=> b!90257 (= res!74404 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!137031))))

(declare-fun b!90258 () Bool)

(declare-fun lt!137032 () (_ BitVec 64))

(assert (=> b!90258 (= e!59470 (bvsle lt!137031 (bvmul lt!137032 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!90258 (or (= lt!137032 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!137032 #b0000000000000000000000000000000000000000000000000000000000001000) lt!137032)))))

(assert (=> b!90258 (= lt!137032 ((_ sign_extend 32) (size!1910 (buf!2300 thiss!1151))))))

(assert (= (and d!28076 res!74405) b!90257))

(assert (= (and b!90257 res!74404) b!90258))

(declare-fun m!134775 () Bool)

(assert (=> d!28076 m!134775))

(assert (=> d!28076 m!134621))

(assert (=> b!89961 d!28076))

(declare-fun d!28078 () Bool)

(assert (=> d!28078 (= (invariant!0 (currentBit!4558 thiss!1151) (currentByte!4563 thiss!1151) (size!1910 (buf!2300 thiss!1151))) (and (bvsge (currentBit!4558 thiss!1151) #b00000000000000000000000000000000) (bvslt (currentBit!4558 thiss!1151) #b00000000000000000000000000001000) (bvsge (currentByte!4563 thiss!1151) #b00000000000000000000000000000000) (or (bvslt (currentByte!4563 thiss!1151) (size!1910 (buf!2300 thiss!1151))) (and (= (currentBit!4558 thiss!1151) #b00000000000000000000000000000000) (= (currentByte!4563 thiss!1151) (size!1910 (buf!2300 thiss!1151)))))))))

(assert (=> b!89950 d!28078))

(declare-fun d!28080 () Bool)

(declare-fun e!59471 () Bool)

(assert (=> d!28080 e!59471))

(declare-fun res!74407 () Bool)

(assert (=> d!28080 (=> (not res!74407) (not e!59471))))

(declare-fun lt!137037 () (_ BitVec 64))

(declare-fun lt!137035 () (_ BitVec 64))

(declare-fun lt!137033 () (_ BitVec 64))

(assert (=> d!28080 (= res!74407 (= lt!137037 (bvsub lt!137033 lt!137035)))))

(assert (=> d!28080 (or (= (bvand lt!137033 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!137035 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!137033 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!137033 lt!137035) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!28080 (= lt!137035 (remainingBits!0 ((_ sign_extend 32) (size!1910 (buf!2300 (_1!4002 lt!136834)))) ((_ sign_extend 32) (currentByte!4563 (_1!4002 lt!136834))) ((_ sign_extend 32) (currentBit!4558 (_1!4002 lt!136834)))))))

(declare-fun lt!137036 () (_ BitVec 64))

(declare-fun lt!137034 () (_ BitVec 64))

(assert (=> d!28080 (= lt!137033 (bvmul lt!137036 lt!137034))))

(assert (=> d!28080 (or (= lt!137036 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!137034 (bvsdiv (bvmul lt!137036 lt!137034) lt!137036)))))

(assert (=> d!28080 (= lt!137034 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!28080 (= lt!137036 ((_ sign_extend 32) (size!1910 (buf!2300 (_1!4002 lt!136834)))))))

(assert (=> d!28080 (= lt!137037 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4563 (_1!4002 lt!136834))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4558 (_1!4002 lt!136834)))))))

(assert (=> d!28080 (invariant!0 (currentBit!4558 (_1!4002 lt!136834)) (currentByte!4563 (_1!4002 lt!136834)) (size!1910 (buf!2300 (_1!4002 lt!136834))))))

(assert (=> d!28080 (= (bitIndex!0 (size!1910 (buf!2300 (_1!4002 lt!136834))) (currentByte!4563 (_1!4002 lt!136834)) (currentBit!4558 (_1!4002 lt!136834))) lt!137037)))

(declare-fun b!90259 () Bool)

(declare-fun res!74406 () Bool)

(assert (=> b!90259 (=> (not res!74406) (not e!59471))))

(assert (=> b!90259 (= res!74406 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!137037))))

(declare-fun b!90260 () Bool)

(declare-fun lt!137038 () (_ BitVec 64))

(assert (=> b!90260 (= e!59471 (bvsle lt!137037 (bvmul lt!137038 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!90260 (or (= lt!137038 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!137038 #b0000000000000000000000000000000000000000000000000000000000001000) lt!137038)))))

(assert (=> b!90260 (= lt!137038 ((_ sign_extend 32) (size!1910 (buf!2300 (_1!4002 lt!136834)))))))

(assert (= (and d!28080 res!74407) b!90259))

(assert (= (and b!90259 res!74406) b!90260))

(declare-fun m!134777 () Bool)

(assert (=> d!28080 m!134777))

(declare-fun m!134779 () Bool)

(assert (=> d!28080 m!134779))

(assert (=> b!89951 d!28080))

(declare-fun d!28082 () Bool)

(assert (=> d!28082 (= (inv!12 thiss!1152) (invariant!0 (currentBit!4558 thiss!1152) (currentByte!4563 thiss!1152) (size!1910 (buf!2300 thiss!1152))))))

(declare-fun bs!6952 () Bool)

(assert (= bs!6952 d!28082))

(assert (=> bs!6952 m!134585))

(assert (=> start!18184 d!28082))

(declare-fun d!28084 () Bool)

(assert (=> d!28084 (= (inv!12 thiss!1151) (invariant!0 (currentBit!4558 thiss!1151) (currentByte!4563 thiss!1151) (size!1910 (buf!2300 thiss!1151))))))

(declare-fun bs!6953 () Bool)

(assert (= bs!6953 d!28084))

(assert (=> bs!6953 m!134621))

(assert (=> start!18184 d!28084))

(declare-fun d!28086 () Bool)

(assert (=> d!28086 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1910 (buf!2300 thiss!1151))) ((_ sign_extend 32) (currentByte!4563 thiss!1151)) ((_ sign_extend 32) (currentBit!4558 thiss!1151)) ((_ sign_extend 32) nBits!336)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1910 (buf!2300 thiss!1151))) ((_ sign_extend 32) (currentByte!4563 thiss!1151)) ((_ sign_extend 32) (currentBit!4558 thiss!1151))) ((_ sign_extend 32) nBits!336)))))

(declare-fun bs!6954 () Bool)

(assert (= bs!6954 d!28086))

(assert (=> bs!6954 m!134775))

(assert (=> b!89962 d!28086))

(declare-fun d!28088 () Bool)

(assert (=> d!28088 (= (invariant!0 (currentBit!4558 (_2!4001 lt!136835)) (currentByte!4563 (_2!4001 lt!136835)) (size!1910 (buf!2300 (_2!4001 lt!136835)))) (and (bvsge (currentBit!4558 (_2!4001 lt!136835)) #b00000000000000000000000000000000) (bvslt (currentBit!4558 (_2!4001 lt!136835)) #b00000000000000000000000000001000) (bvsge (currentByte!4563 (_2!4001 lt!136835)) #b00000000000000000000000000000000) (or (bvslt (currentByte!4563 (_2!4001 lt!136835)) (size!1910 (buf!2300 (_2!4001 lt!136835)))) (and (= (currentBit!4558 (_2!4001 lt!136835)) #b00000000000000000000000000000000) (= (currentByte!4563 (_2!4001 lt!136835)) (size!1910 (buf!2300 (_2!4001 lt!136835))))))))))

(assert (=> b!89947 d!28088))

(declare-fun b!90315 () Bool)

(declare-fun e!59497 () Bool)

(declare-fun lt!137099 () tuple2!7524)

(declare-fun lt!137097 () tuple2!7522)

(assert (=> b!90315 (= e!59497 (= (bitIndex!0 (size!1910 (buf!2300 (_1!4002 lt!137099))) (currentByte!4563 (_1!4002 lt!137099)) (currentBit!4558 (_1!4002 lt!137099))) (bitIndex!0 (size!1910 (buf!2300 (_2!4001 lt!137097))) (currentByte!4563 (_2!4001 lt!137097)) (currentBit!4558 (_2!4001 lt!137097)))))))

(declare-fun b!90312 () Bool)

(declare-fun res!74458 () Bool)

(declare-fun e!59496 () Bool)

(assert (=> b!90312 (=> (not res!74458) (not e!59496))))

(declare-fun lt!137098 () (_ BitVec 64))

(declare-fun lt!137100 () (_ BitVec 64))

(assert (=> b!90312 (= res!74458 (= (bitIndex!0 (size!1910 (buf!2300 (_2!4001 lt!137097))) (currentByte!4563 (_2!4001 lt!137097)) (currentBit!4558 (_2!4001 lt!137097))) (bvadd lt!137098 lt!137100)))))

(assert (=> b!90312 (or (not (= (bvand lt!137098 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!137100 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!137098 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!137098 lt!137100) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!90312 (= lt!137100 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!90312 (= lt!137098 (bitIndex!0 (size!1910 (buf!2300 thiss!1152)) (currentByte!4563 thiss!1152) (currentBit!4558 thiss!1152)))))

(declare-fun d!28090 () Bool)

(assert (=> d!28090 e!59496))

(declare-fun res!74460 () Bool)

(assert (=> d!28090 (=> (not res!74460) (not e!59496))))

(assert (=> d!28090 (= res!74460 (= (size!1910 (buf!2300 thiss!1152)) (size!1910 (buf!2300 (_2!4001 lt!137097)))))))

(declare-fun choose!16 (BitStream!3382 Bool) tuple2!7522)

(assert (=> d!28090 (= lt!137097 (choose!16 thiss!1152 lt!136831))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!28090 (validate_offset_bit!0 ((_ sign_extend 32) (size!1910 (buf!2300 thiss!1152))) ((_ sign_extend 32) (currentByte!4563 thiss!1152)) ((_ sign_extend 32) (currentBit!4558 thiss!1152)))))

(assert (=> d!28090 (= (appendBit!0 thiss!1152 lt!136831) lt!137097)))

(declare-fun b!90314 () Bool)

(assert (=> b!90314 (= e!59496 e!59497)))

(declare-fun res!74457 () Bool)

(assert (=> b!90314 (=> (not res!74457) (not e!59497))))

(assert (=> b!90314 (= res!74457 (and (= (_2!4002 lt!137099) lt!136831) (= (_1!4002 lt!137099) (_2!4001 lt!137097))))))

(assert (=> b!90314 (= lt!137099 (readBitPure!0 (readerFrom!0 (_2!4001 lt!137097) (currentBit!4558 thiss!1152) (currentByte!4563 thiss!1152))))))

(declare-fun b!90313 () Bool)

(declare-fun res!74459 () Bool)

(assert (=> b!90313 (=> (not res!74459) (not e!59496))))

(assert (=> b!90313 (= res!74459 (isPrefixOf!0 thiss!1152 (_2!4001 lt!137097)))))

(assert (= (and d!28090 res!74460) b!90312))

(assert (= (and b!90312 res!74458) b!90313))

(assert (= (and b!90313 res!74459) b!90314))

(assert (= (and b!90314 res!74457) b!90315))

(declare-fun m!134835 () Bool)

(assert (=> b!90312 m!134835))

(assert (=> b!90312 m!134607))

(declare-fun m!134837 () Bool)

(assert (=> d!28090 m!134837))

(declare-fun m!134839 () Bool)

(assert (=> d!28090 m!134839))

(declare-fun m!134841 () Bool)

(assert (=> b!90313 m!134841))

(declare-fun m!134843 () Bool)

(assert (=> b!90315 m!134843))

(assert (=> b!90315 m!134835))

(declare-fun m!134845 () Bool)

(assert (=> b!90314 m!134845))

(assert (=> b!90314 m!134845))

(declare-fun m!134847 () Bool)

(assert (=> b!90314 m!134847))

(assert (=> b!89947 d!28090))

(declare-fun d!28136 () Bool)

(assert (=> d!28136 (= (array_inv!1756 (buf!2300 thiss!1151)) (bvsge (size!1910 (buf!2300 thiss!1151)) #b00000000000000000000000000000000))))

(assert (=> b!89949 d!28136))

(declare-fun d!28138 () Bool)

(declare-fun res!74479 () Bool)

(declare-fun e!59511 () Bool)

(assert (=> d!28138 (=> (not res!74479) (not e!59511))))

(assert (=> d!28138 (= res!74479 (= (size!1910 (buf!2300 thiss!1152)) (size!1910 (buf!2300 (_2!4001 lt!136835)))))))

(assert (=> d!28138 (= (isPrefixOf!0 thiss!1152 (_2!4001 lt!136835)) e!59511)))

(declare-fun b!90334 () Bool)

(declare-fun res!74480 () Bool)

(assert (=> b!90334 (=> (not res!74480) (not e!59511))))

(assert (=> b!90334 (= res!74480 (bvsle (bitIndex!0 (size!1910 (buf!2300 thiss!1152)) (currentByte!4563 thiss!1152) (currentBit!4558 thiss!1152)) (bitIndex!0 (size!1910 (buf!2300 (_2!4001 lt!136835))) (currentByte!4563 (_2!4001 lt!136835)) (currentBit!4558 (_2!4001 lt!136835)))))))

(declare-fun b!90335 () Bool)

(declare-fun e!59510 () Bool)

(assert (=> b!90335 (= e!59511 e!59510)))

(declare-fun res!74481 () Bool)

(assert (=> b!90335 (=> res!74481 e!59510)))

(assert (=> b!90335 (= res!74481 (= (size!1910 (buf!2300 thiss!1152)) #b00000000000000000000000000000000))))

(declare-fun b!90336 () Bool)

(declare-fun arrayBitRangesEq!0 (array!4233 array!4233 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!90336 (= e!59510 (arrayBitRangesEq!0 (buf!2300 thiss!1152) (buf!2300 (_2!4001 lt!136835)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1910 (buf!2300 thiss!1152)) (currentByte!4563 thiss!1152) (currentBit!4558 thiss!1152))))))

(assert (= (and d!28138 res!74479) b!90334))

(assert (= (and b!90334 res!74480) b!90335))

(assert (= (and b!90335 (not res!74481)) b!90336))

(assert (=> b!90334 m!134607))

(assert (=> b!90334 m!134613))

(assert (=> b!90336 m!134607))

(assert (=> b!90336 m!134607))

(declare-fun m!134853 () Bool)

(assert (=> b!90336 m!134853))

(assert (=> b!89960 d!28138))

(declare-fun d!28148 () Bool)

(declare-datatypes ((tuple2!7536 0))(
  ( (tuple2!7537 (_1!4010 Bool) (_2!4010 BitStream!3382)) )
))
(declare-fun lt!137109 () tuple2!7536)

(declare-fun readBit!0 (BitStream!3382) tuple2!7536)

(assert (=> d!28148 (= lt!137109 (readBit!0 (readerFrom!0 (_2!4001 lt!136835) (currentBit!4558 thiss!1152) (currentByte!4563 thiss!1152))))))

(assert (=> d!28148 (= (readBitPure!0 (readerFrom!0 (_2!4001 lt!136835) (currentBit!4558 thiss!1152) (currentByte!4563 thiss!1152))) (tuple2!7525 (_2!4010 lt!137109) (_1!4010 lt!137109)))))

(declare-fun bs!6964 () Bool)

(assert (= bs!6964 d!28148))

(assert (=> bs!6964 m!134599))

(declare-fun m!134855 () Bool)

(assert (=> bs!6964 m!134855))

(assert (=> b!89959 d!28148))

(declare-fun d!28150 () Bool)

(declare-fun e!59514 () Bool)

(assert (=> d!28150 e!59514))

(declare-fun res!74485 () Bool)

(assert (=> d!28150 (=> (not res!74485) (not e!59514))))

(assert (=> d!28150 (= res!74485 (invariant!0 (currentBit!4558 (_2!4001 lt!136835)) (currentByte!4563 (_2!4001 lt!136835)) (size!1910 (buf!2300 (_2!4001 lt!136835)))))))

(assert (=> d!28150 (= (readerFrom!0 (_2!4001 lt!136835) (currentBit!4558 thiss!1152) (currentByte!4563 thiss!1152)) (BitStream!3383 (buf!2300 (_2!4001 lt!136835)) (currentByte!4563 thiss!1152) (currentBit!4558 thiss!1152)))))

(declare-fun b!90339 () Bool)

(assert (=> b!90339 (= e!59514 (invariant!0 (currentBit!4558 thiss!1152) (currentByte!4563 thiss!1152) (size!1910 (buf!2300 (_2!4001 lt!136835)))))))

(assert (= (and d!28150 res!74485) b!90339))

(assert (=> d!28150 m!134617))

(declare-fun m!134857 () Bool)

(assert (=> b!90339 m!134857))

(assert (=> b!89959 d!28150))

(push 1)

(assert (not d!28076))

(assert (not b!90219))

(assert (not d!28090))

(assert (not d!28080))

(assert (not b!90314))

(assert (not d!28052))

(assert (not d!28050))

(assert (not b!90334))

(assert (not b!90212))

(assert (not b!90205))

(assert (not b!90209))

(assert (not b!90215))

(assert (not b!90208))

(assert (not b!90220))

(assert (not d!28066))

(assert (not b!90336))

(assert (not d!28058))

(assert (not b!90339))

(assert (not b!90211))

(assert (not d!28086))

(assert (not b!90210))

(assert (not b!90315))

(assert (not d!28068))

(assert (not b!90218))

(assert (not d!28148))

(assert (not d!28150))

(assert (not d!28074))

(assert (not b!90313))

(assert (not d!28084))

(assert (not b!90207))

(assert (not d!28082))

(assert (not b!90312))

(check-sat)

(pop 1)

(push 1)

(check-sat)

