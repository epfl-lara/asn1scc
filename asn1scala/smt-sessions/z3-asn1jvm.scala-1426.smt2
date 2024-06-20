; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39106 () Bool)

(assert start!39106)

(declare-fun b!175981 () Bool)

(declare-fun e!122704 () Bool)

(declare-fun e!122703 () Bool)

(assert (=> b!175981 (= e!122704 e!122703)))

(declare-fun res!145734 () Bool)

(assert (=> b!175981 (=> (not res!145734) (not e!122703))))

(declare-fun lt!271267 () (_ BitVec 64))

(declare-fun lt!271266 () (_ BitVec 64))

(assert (=> b!175981 (= res!145734 (= lt!271267 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!271266)))))

(declare-datatypes ((array!9502 0))(
  ( (array!9503 (arr!5123 (Array (_ BitVec 32) (_ BitVec 8))) (size!4193 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7494 0))(
  ( (BitStream!7495 (buf!4636 array!9502) (currentByte!8771 (_ BitVec 32)) (currentBit!8766 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!12700 0))(
  ( (Unit!12701) )
))
(declare-datatypes ((tuple2!15140 0))(
  ( (tuple2!15141 (_1!8215 Unit!12700) (_2!8215 BitStream!7494)) )
))
(declare-fun lt!271264 () tuple2!15140)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!175981 (= lt!271267 (bitIndex!0 (size!4193 (buf!4636 (_2!8215 lt!271264))) (currentByte!8771 (_2!8215 lt!271264)) (currentBit!8766 (_2!8215 lt!271264))))))

(declare-fun thiss!1204 () BitStream!7494)

(assert (=> b!175981 (= lt!271266 (bitIndex!0 (size!4193 (buf!4636 thiss!1204)) (currentByte!8771 thiss!1204) (currentBit!8766 thiss!1204)))))

(declare-fun b!175982 () Bool)

(declare-fun e!122707 () Bool)

(assert (=> b!175982 (= e!122703 e!122707)))

(declare-fun res!145737 () Bool)

(assert (=> b!175982 (=> (not res!145737) (not e!122707))))

(declare-datatypes ((tuple2!15142 0))(
  ( (tuple2!15143 (_1!8216 BitStream!7494) (_2!8216 Bool)) )
))
(declare-fun lt!271268 () tuple2!15142)

(declare-fun lt!271265 () Bool)

(assert (=> b!175982 (= res!145737 (and (= (_2!8216 lt!271268) lt!271265) (= (_1!8216 lt!271268) (_2!8215 lt!271264))))))

(declare-fun readBitPure!0 (BitStream!7494) tuple2!15142)

(declare-fun readerFrom!0 (BitStream!7494 (_ BitVec 32) (_ BitVec 32)) BitStream!7494)

(assert (=> b!175982 (= lt!271268 (readBitPure!0 (readerFrom!0 (_2!8215 lt!271264) (currentBit!8766 thiss!1204) (currentByte!8771 thiss!1204))))))

(declare-fun b!175983 () Bool)

(declare-fun e!122705 () Bool)

(declare-fun array_inv!3934 (array!9502) Bool)

(assert (=> b!175983 (= e!122705 (array_inv!3934 (buf!4636 thiss!1204)))))

(declare-fun b!175984 () Bool)

(declare-fun res!145730 () Bool)

(declare-fun e!122706 () Bool)

(assert (=> b!175984 (=> (not res!145730) (not e!122706))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!175984 (= res!145730 (not (= i!590 nBits!348)))))

(declare-fun b!175985 () Bool)

(declare-fun res!145733 () Bool)

(assert (=> b!175985 (=> (not res!145733) (not e!122703))))

(declare-fun isPrefixOf!0 (BitStream!7494 BitStream!7494) Bool)

(assert (=> b!175985 (= res!145733 (isPrefixOf!0 thiss!1204 (_2!8215 lt!271264)))))

(declare-fun res!145732 () Bool)

(assert (=> start!39106 (=> (not res!145732) (not e!122706))))

(assert (=> start!39106 (= res!145732 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!39106 e!122706))

(assert (=> start!39106 true))

(declare-fun inv!12 (BitStream!7494) Bool)

(assert (=> start!39106 (and (inv!12 thiss!1204) e!122705)))

(declare-fun b!175986 () Bool)

(declare-fun res!145731 () Bool)

(assert (=> b!175986 (=> (not res!145731) (not e!122706))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!175986 (= res!145731 (validate_offset_bits!1 ((_ sign_extend 32) (size!4193 (buf!4636 thiss!1204))) ((_ sign_extend 32) (currentByte!8771 thiss!1204)) ((_ sign_extend 32) (currentBit!8766 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!175987 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!175987 (= e!122706 (not (invariant!0 (currentBit!8766 (_2!8215 lt!271264)) (currentByte!8771 (_2!8215 lt!271264)) (size!4193 (buf!4636 (_2!8215 lt!271264))))))))

(assert (=> b!175987 e!122704))

(declare-fun res!145735 () Bool)

(assert (=> b!175987 (=> (not res!145735) (not e!122704))))

(assert (=> b!175987 (= res!145735 (= (size!4193 (buf!4636 thiss!1204)) (size!4193 (buf!4636 (_2!8215 lt!271264)))))))

(declare-fun appendBit!0 (BitStream!7494 Bool) tuple2!15140)

(assert (=> b!175987 (= lt!271264 (appendBit!0 thiss!1204 lt!271265))))

(declare-fun v!189 () (_ BitVec 64))

(assert (=> b!175987 (= lt!271265 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!175988 () Bool)

(declare-fun res!145736 () Bool)

(assert (=> b!175988 (=> (not res!145736) (not e!122706))))

(assert (=> b!175988 (= res!145736 (invariant!0 (currentBit!8766 thiss!1204) (currentByte!8771 thiss!1204) (size!4193 (buf!4636 thiss!1204))))))

(declare-fun b!175989 () Bool)

(assert (=> b!175989 (= e!122707 (= (bitIndex!0 (size!4193 (buf!4636 (_1!8216 lt!271268))) (currentByte!8771 (_1!8216 lt!271268)) (currentBit!8766 (_1!8216 lt!271268))) lt!271267))))

(assert (= (and start!39106 res!145732) b!175986))

(assert (= (and b!175986 res!145731) b!175988))

(assert (= (and b!175988 res!145736) b!175984))

(assert (= (and b!175984 res!145730) b!175987))

(assert (= (and b!175987 res!145735) b!175981))

(assert (= (and b!175981 res!145734) b!175985))

(assert (= (and b!175985 res!145733) b!175982))

(assert (= (and b!175982 res!145737) b!175989))

(assert (= start!39106 b!175983))

(declare-fun m!276175 () Bool)

(assert (=> b!175986 m!276175))

(declare-fun m!276177 () Bool)

(assert (=> b!175989 m!276177))

(declare-fun m!276179 () Bool)

(assert (=> start!39106 m!276179))

(declare-fun m!276181 () Bool)

(assert (=> b!175982 m!276181))

(assert (=> b!175982 m!276181))

(declare-fun m!276183 () Bool)

(assert (=> b!175982 m!276183))

(declare-fun m!276185 () Bool)

(assert (=> b!175988 m!276185))

(declare-fun m!276187 () Bool)

(assert (=> b!175987 m!276187))

(declare-fun m!276189 () Bool)

(assert (=> b!175987 m!276189))

(declare-fun m!276191 () Bool)

(assert (=> b!175985 m!276191))

(declare-fun m!276193 () Bool)

(assert (=> b!175983 m!276193))

(declare-fun m!276195 () Bool)

(assert (=> b!175981 m!276195))

(declare-fun m!276197 () Bool)

(assert (=> b!175981 m!276197))

(check-sat (not start!39106) (not b!175981) (not b!175983) (not b!175986) (not b!175987) (not b!175985) (not b!175982) (not b!175989) (not b!175988))
(check-sat)
(get-model)

(declare-fun d!62063 () Bool)

(assert (=> d!62063 (= (invariant!0 (currentBit!8766 thiss!1204) (currentByte!8771 thiss!1204) (size!4193 (buf!4636 thiss!1204))) (and (bvsge (currentBit!8766 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!8766 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!8771 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!8771 thiss!1204) (size!4193 (buf!4636 thiss!1204))) (and (= (currentBit!8766 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!8771 thiss!1204) (size!4193 (buf!4636 thiss!1204)))))))))

(assert (=> b!175988 d!62063))

(declare-fun d!62065 () Bool)

(assert (=> d!62065 (= (array_inv!3934 (buf!4636 thiss!1204)) (bvsge (size!4193 (buf!4636 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!175983 d!62065))

(declare-fun d!62067 () Bool)

(declare-fun e!122728 () Bool)

(assert (=> d!62067 e!122728))

(declare-fun res!145767 () Bool)

(assert (=> d!62067 (=> (not res!145767) (not e!122728))))

(declare-fun lt!271301 () (_ BitVec 64))

(declare-fun lt!271298 () (_ BitVec 64))

(declare-fun lt!271299 () (_ BitVec 64))

(assert (=> d!62067 (= res!145767 (= lt!271301 (bvsub lt!271298 lt!271299)))))

(assert (=> d!62067 (or (= (bvand lt!271298 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!271299 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!271298 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!271298 lt!271299) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!62067 (= lt!271299 (remainingBits!0 ((_ sign_extend 32) (size!4193 (buf!4636 (_1!8216 lt!271268)))) ((_ sign_extend 32) (currentByte!8771 (_1!8216 lt!271268))) ((_ sign_extend 32) (currentBit!8766 (_1!8216 lt!271268)))))))

(declare-fun lt!271300 () (_ BitVec 64))

(declare-fun lt!271297 () (_ BitVec 64))

(assert (=> d!62067 (= lt!271298 (bvmul lt!271300 lt!271297))))

(assert (=> d!62067 (or (= lt!271300 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!271297 (bvsdiv (bvmul lt!271300 lt!271297) lt!271300)))))

(assert (=> d!62067 (= lt!271297 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!62067 (= lt!271300 ((_ sign_extend 32) (size!4193 (buf!4636 (_1!8216 lt!271268)))))))

(assert (=> d!62067 (= lt!271301 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8771 (_1!8216 lt!271268))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8766 (_1!8216 lt!271268)))))))

(assert (=> d!62067 (invariant!0 (currentBit!8766 (_1!8216 lt!271268)) (currentByte!8771 (_1!8216 lt!271268)) (size!4193 (buf!4636 (_1!8216 lt!271268))))))

(assert (=> d!62067 (= (bitIndex!0 (size!4193 (buf!4636 (_1!8216 lt!271268))) (currentByte!8771 (_1!8216 lt!271268)) (currentBit!8766 (_1!8216 lt!271268))) lt!271301)))

(declare-fun b!176021 () Bool)

(declare-fun res!145766 () Bool)

(assert (=> b!176021 (=> (not res!145766) (not e!122728))))

(assert (=> b!176021 (= res!145766 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!271301))))

(declare-fun b!176022 () Bool)

(declare-fun lt!271296 () (_ BitVec 64))

(assert (=> b!176022 (= e!122728 (bvsle lt!271301 (bvmul lt!271296 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!176022 (or (= lt!271296 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!271296 #b0000000000000000000000000000000000000000000000000000000000001000) lt!271296)))))

(assert (=> b!176022 (= lt!271296 ((_ sign_extend 32) (size!4193 (buf!4636 (_1!8216 lt!271268)))))))

(assert (= (and d!62067 res!145767) b!176021))

(assert (= (and b!176021 res!145766) b!176022))

(declare-fun m!276223 () Bool)

(assert (=> d!62067 m!276223))

(declare-fun m!276225 () Bool)

(assert (=> d!62067 m!276225))

(assert (=> b!175989 d!62067))

(declare-fun d!62069 () Bool)

(declare-fun e!122729 () Bool)

(assert (=> d!62069 e!122729))

(declare-fun res!145769 () Bool)

(assert (=> d!62069 (=> (not res!145769) (not e!122729))))

(declare-fun lt!271307 () (_ BitVec 64))

(declare-fun lt!271305 () (_ BitVec 64))

(declare-fun lt!271304 () (_ BitVec 64))

(assert (=> d!62069 (= res!145769 (= lt!271307 (bvsub lt!271304 lt!271305)))))

(assert (=> d!62069 (or (= (bvand lt!271304 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!271305 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!271304 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!271304 lt!271305) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!62069 (= lt!271305 (remainingBits!0 ((_ sign_extend 32) (size!4193 (buf!4636 (_2!8215 lt!271264)))) ((_ sign_extend 32) (currentByte!8771 (_2!8215 lt!271264))) ((_ sign_extend 32) (currentBit!8766 (_2!8215 lt!271264)))))))

(declare-fun lt!271306 () (_ BitVec 64))

(declare-fun lt!271303 () (_ BitVec 64))

(assert (=> d!62069 (= lt!271304 (bvmul lt!271306 lt!271303))))

(assert (=> d!62069 (or (= lt!271306 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!271303 (bvsdiv (bvmul lt!271306 lt!271303) lt!271306)))))

(assert (=> d!62069 (= lt!271303 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!62069 (= lt!271306 ((_ sign_extend 32) (size!4193 (buf!4636 (_2!8215 lt!271264)))))))

(assert (=> d!62069 (= lt!271307 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8771 (_2!8215 lt!271264))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8766 (_2!8215 lt!271264)))))))

(assert (=> d!62069 (invariant!0 (currentBit!8766 (_2!8215 lt!271264)) (currentByte!8771 (_2!8215 lt!271264)) (size!4193 (buf!4636 (_2!8215 lt!271264))))))

(assert (=> d!62069 (= (bitIndex!0 (size!4193 (buf!4636 (_2!8215 lt!271264))) (currentByte!8771 (_2!8215 lt!271264)) (currentBit!8766 (_2!8215 lt!271264))) lt!271307)))

(declare-fun b!176023 () Bool)

(declare-fun res!145768 () Bool)

(assert (=> b!176023 (=> (not res!145768) (not e!122729))))

(assert (=> b!176023 (= res!145768 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!271307))))

(declare-fun b!176024 () Bool)

(declare-fun lt!271302 () (_ BitVec 64))

(assert (=> b!176024 (= e!122729 (bvsle lt!271307 (bvmul lt!271302 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!176024 (or (= lt!271302 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!271302 #b0000000000000000000000000000000000000000000000000000000000001000) lt!271302)))))

(assert (=> b!176024 (= lt!271302 ((_ sign_extend 32) (size!4193 (buf!4636 (_2!8215 lt!271264)))))))

(assert (= (and d!62069 res!145769) b!176023))

(assert (= (and b!176023 res!145768) b!176024))

(declare-fun m!276227 () Bool)

(assert (=> d!62069 m!276227))

(assert (=> d!62069 m!276187))

(assert (=> b!175981 d!62069))

(declare-fun d!62071 () Bool)

(declare-fun e!122730 () Bool)

(assert (=> d!62071 e!122730))

(declare-fun res!145771 () Bool)

(assert (=> d!62071 (=> (not res!145771) (not e!122730))))

(declare-fun lt!271313 () (_ BitVec 64))

(declare-fun lt!271310 () (_ BitVec 64))

(declare-fun lt!271311 () (_ BitVec 64))

(assert (=> d!62071 (= res!145771 (= lt!271313 (bvsub lt!271310 lt!271311)))))

(assert (=> d!62071 (or (= (bvand lt!271310 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!271311 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!271310 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!271310 lt!271311) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!62071 (= lt!271311 (remainingBits!0 ((_ sign_extend 32) (size!4193 (buf!4636 thiss!1204))) ((_ sign_extend 32) (currentByte!8771 thiss!1204)) ((_ sign_extend 32) (currentBit!8766 thiss!1204))))))

(declare-fun lt!271312 () (_ BitVec 64))

(declare-fun lt!271309 () (_ BitVec 64))

(assert (=> d!62071 (= lt!271310 (bvmul lt!271312 lt!271309))))

(assert (=> d!62071 (or (= lt!271312 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!271309 (bvsdiv (bvmul lt!271312 lt!271309) lt!271312)))))

(assert (=> d!62071 (= lt!271309 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!62071 (= lt!271312 ((_ sign_extend 32) (size!4193 (buf!4636 thiss!1204))))))

(assert (=> d!62071 (= lt!271313 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8771 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8766 thiss!1204))))))

(assert (=> d!62071 (invariant!0 (currentBit!8766 thiss!1204) (currentByte!8771 thiss!1204) (size!4193 (buf!4636 thiss!1204)))))

(assert (=> d!62071 (= (bitIndex!0 (size!4193 (buf!4636 thiss!1204)) (currentByte!8771 thiss!1204) (currentBit!8766 thiss!1204)) lt!271313)))

(declare-fun b!176025 () Bool)

(declare-fun res!145770 () Bool)

(assert (=> b!176025 (=> (not res!145770) (not e!122730))))

(assert (=> b!176025 (= res!145770 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!271313))))

(declare-fun b!176026 () Bool)

(declare-fun lt!271308 () (_ BitVec 64))

(assert (=> b!176026 (= e!122730 (bvsle lt!271313 (bvmul lt!271308 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!176026 (or (= lt!271308 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!271308 #b0000000000000000000000000000000000000000000000000000000000001000) lt!271308)))))

(assert (=> b!176026 (= lt!271308 ((_ sign_extend 32) (size!4193 (buf!4636 thiss!1204))))))

(assert (= (and d!62071 res!145771) b!176025))

(assert (= (and b!176025 res!145770) b!176026))

(declare-fun m!276229 () Bool)

(assert (=> d!62071 m!276229))

(assert (=> d!62071 m!276185))

(assert (=> b!175981 d!62071))

(declare-fun d!62073 () Bool)

(assert (=> d!62073 (= (invariant!0 (currentBit!8766 (_2!8215 lt!271264)) (currentByte!8771 (_2!8215 lt!271264)) (size!4193 (buf!4636 (_2!8215 lt!271264)))) (and (bvsge (currentBit!8766 (_2!8215 lt!271264)) #b00000000000000000000000000000000) (bvslt (currentBit!8766 (_2!8215 lt!271264)) #b00000000000000000000000000001000) (bvsge (currentByte!8771 (_2!8215 lt!271264)) #b00000000000000000000000000000000) (or (bvslt (currentByte!8771 (_2!8215 lt!271264)) (size!4193 (buf!4636 (_2!8215 lt!271264)))) (and (= (currentBit!8766 (_2!8215 lt!271264)) #b00000000000000000000000000000000) (= (currentByte!8771 (_2!8215 lt!271264)) (size!4193 (buf!4636 (_2!8215 lt!271264))))))))))

(assert (=> b!175987 d!62073))

(declare-fun b!176037 () Bool)

(declare-fun res!145783 () Bool)

(declare-fun e!122736 () Bool)

(assert (=> b!176037 (=> (not res!145783) (not e!122736))))

(declare-fun lt!271322 () tuple2!15140)

(assert (=> b!176037 (= res!145783 (isPrefixOf!0 thiss!1204 (_2!8215 lt!271322)))))

(declare-fun d!62075 () Bool)

(assert (=> d!62075 e!122736))

(declare-fun res!145781 () Bool)

(assert (=> d!62075 (=> (not res!145781) (not e!122736))))

(assert (=> d!62075 (= res!145781 (= (size!4193 (buf!4636 thiss!1204)) (size!4193 (buf!4636 (_2!8215 lt!271322)))))))

(declare-fun choose!16 (BitStream!7494 Bool) tuple2!15140)

(assert (=> d!62075 (= lt!271322 (choose!16 thiss!1204 lt!271265))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!62075 (validate_offset_bit!0 ((_ sign_extend 32) (size!4193 (buf!4636 thiss!1204))) ((_ sign_extend 32) (currentByte!8771 thiss!1204)) ((_ sign_extend 32) (currentBit!8766 thiss!1204)))))

(assert (=> d!62075 (= (appendBit!0 thiss!1204 lt!271265) lt!271322)))

(declare-fun b!176036 () Bool)

(declare-fun res!145780 () Bool)

(assert (=> b!176036 (=> (not res!145780) (not e!122736))))

(declare-fun lt!271323 () (_ BitVec 64))

(declare-fun lt!271324 () (_ BitVec 64))

(assert (=> b!176036 (= res!145780 (= (bitIndex!0 (size!4193 (buf!4636 (_2!8215 lt!271322))) (currentByte!8771 (_2!8215 lt!271322)) (currentBit!8766 (_2!8215 lt!271322))) (bvadd lt!271323 lt!271324)))))

(assert (=> b!176036 (or (not (= (bvand lt!271323 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!271324 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!271323 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!271323 lt!271324) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!176036 (= lt!271324 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!176036 (= lt!271323 (bitIndex!0 (size!4193 (buf!4636 thiss!1204)) (currentByte!8771 thiss!1204) (currentBit!8766 thiss!1204)))))

(declare-fun b!176038 () Bool)

(declare-fun e!122735 () Bool)

(assert (=> b!176038 (= e!122736 e!122735)))

(declare-fun res!145782 () Bool)

(assert (=> b!176038 (=> (not res!145782) (not e!122735))))

(declare-fun lt!271325 () tuple2!15142)

(assert (=> b!176038 (= res!145782 (and (= (_2!8216 lt!271325) lt!271265) (= (_1!8216 lt!271325) (_2!8215 lt!271322))))))

(assert (=> b!176038 (= lt!271325 (readBitPure!0 (readerFrom!0 (_2!8215 lt!271322) (currentBit!8766 thiss!1204) (currentByte!8771 thiss!1204))))))

(declare-fun b!176039 () Bool)

(assert (=> b!176039 (= e!122735 (= (bitIndex!0 (size!4193 (buf!4636 (_1!8216 lt!271325))) (currentByte!8771 (_1!8216 lt!271325)) (currentBit!8766 (_1!8216 lt!271325))) (bitIndex!0 (size!4193 (buf!4636 (_2!8215 lt!271322))) (currentByte!8771 (_2!8215 lt!271322)) (currentBit!8766 (_2!8215 lt!271322)))))))

(assert (= (and d!62075 res!145781) b!176036))

(assert (= (and b!176036 res!145780) b!176037))

(assert (= (and b!176037 res!145783) b!176038))

(assert (= (and b!176038 res!145782) b!176039))

(declare-fun m!276231 () Bool)

(assert (=> b!176036 m!276231))

(assert (=> b!176036 m!276197))

(declare-fun m!276233 () Bool)

(assert (=> b!176037 m!276233))

(declare-fun m!276235 () Bool)

(assert (=> b!176039 m!276235))

(assert (=> b!176039 m!276231))

(declare-fun m!276237 () Bool)

(assert (=> d!62075 m!276237))

(declare-fun m!276239 () Bool)

(assert (=> d!62075 m!276239))

(declare-fun m!276241 () Bool)

(assert (=> b!176038 m!276241))

(assert (=> b!176038 m!276241))

(declare-fun m!276243 () Bool)

(assert (=> b!176038 m!276243))

(assert (=> b!175987 d!62075))

(declare-fun d!62081 () Bool)

(declare-datatypes ((tuple2!15148 0))(
  ( (tuple2!15149 (_1!8219 Bool) (_2!8219 BitStream!7494)) )
))
(declare-fun lt!271328 () tuple2!15148)

(declare-fun readBit!0 (BitStream!7494) tuple2!15148)

(assert (=> d!62081 (= lt!271328 (readBit!0 (readerFrom!0 (_2!8215 lt!271264) (currentBit!8766 thiss!1204) (currentByte!8771 thiss!1204))))))

(assert (=> d!62081 (= (readBitPure!0 (readerFrom!0 (_2!8215 lt!271264) (currentBit!8766 thiss!1204) (currentByte!8771 thiss!1204))) (tuple2!15143 (_2!8219 lt!271328) (_1!8219 lt!271328)))))

(declare-fun bs!15496 () Bool)

(assert (= bs!15496 d!62081))

(assert (=> bs!15496 m!276181))

(declare-fun m!276245 () Bool)

(assert (=> bs!15496 m!276245))

(assert (=> b!175982 d!62081))

(declare-fun d!62083 () Bool)

(declare-fun e!122742 () Bool)

(assert (=> d!62083 e!122742))

(declare-fun res!145793 () Bool)

(assert (=> d!62083 (=> (not res!145793) (not e!122742))))

(assert (=> d!62083 (= res!145793 (invariant!0 (currentBit!8766 (_2!8215 lt!271264)) (currentByte!8771 (_2!8215 lt!271264)) (size!4193 (buf!4636 (_2!8215 lt!271264)))))))

(assert (=> d!62083 (= (readerFrom!0 (_2!8215 lt!271264) (currentBit!8766 thiss!1204) (currentByte!8771 thiss!1204)) (BitStream!7495 (buf!4636 (_2!8215 lt!271264)) (currentByte!8771 thiss!1204) (currentBit!8766 thiss!1204)))))

(declare-fun b!176048 () Bool)

(assert (=> b!176048 (= e!122742 (invariant!0 (currentBit!8766 thiss!1204) (currentByte!8771 thiss!1204) (size!4193 (buf!4636 (_2!8215 lt!271264)))))))

(assert (= (and d!62083 res!145793) b!176048))

(assert (=> d!62083 m!276187))

(declare-fun m!276249 () Bool)

(assert (=> b!176048 m!276249))

(assert (=> b!175982 d!62083))

(declare-fun d!62087 () Bool)

(assert (=> d!62087 (= (inv!12 thiss!1204) (invariant!0 (currentBit!8766 thiss!1204) (currentByte!8771 thiss!1204) (size!4193 (buf!4636 thiss!1204))))))

(declare-fun bs!15497 () Bool)

(assert (= bs!15497 d!62087))

(assert (=> bs!15497 m!276185))

(assert (=> start!39106 d!62087))

(declare-fun d!62091 () Bool)

(declare-fun res!145811 () Bool)

(declare-fun e!122753 () Bool)

(assert (=> d!62091 (=> (not res!145811) (not e!122753))))

(assert (=> d!62091 (= res!145811 (= (size!4193 (buf!4636 thiss!1204)) (size!4193 (buf!4636 (_2!8215 lt!271264)))))))

(assert (=> d!62091 (= (isPrefixOf!0 thiss!1204 (_2!8215 lt!271264)) e!122753)))

(declare-fun b!176065 () Bool)

(declare-fun res!145812 () Bool)

(assert (=> b!176065 (=> (not res!145812) (not e!122753))))

(assert (=> b!176065 (= res!145812 (bvsle (bitIndex!0 (size!4193 (buf!4636 thiss!1204)) (currentByte!8771 thiss!1204) (currentBit!8766 thiss!1204)) (bitIndex!0 (size!4193 (buf!4636 (_2!8215 lt!271264))) (currentByte!8771 (_2!8215 lt!271264)) (currentBit!8766 (_2!8215 lt!271264)))))))

(declare-fun b!176066 () Bool)

(declare-fun e!122752 () Bool)

(assert (=> b!176066 (= e!122753 e!122752)))

(declare-fun res!145813 () Bool)

(assert (=> b!176066 (=> res!145813 e!122752)))

(assert (=> b!176066 (= res!145813 (= (size!4193 (buf!4636 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!176067 () Bool)

(declare-fun arrayBitRangesEq!0 (array!9502 array!9502 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!176067 (= e!122752 (arrayBitRangesEq!0 (buf!4636 thiss!1204) (buf!4636 (_2!8215 lt!271264)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4193 (buf!4636 thiss!1204)) (currentByte!8771 thiss!1204) (currentBit!8766 thiss!1204))))))

(assert (= (and d!62091 res!145811) b!176065))

(assert (= (and b!176065 res!145812) b!176066))

(assert (= (and b!176066 (not res!145813)) b!176067))

(assert (=> b!176065 m!276197))

(assert (=> b!176065 m!276195))

(assert (=> b!176067 m!276197))

(assert (=> b!176067 m!276197))

(declare-fun m!276263 () Bool)

(assert (=> b!176067 m!276263))

(assert (=> b!175985 d!62091))

(declare-fun d!62099 () Bool)

(assert (=> d!62099 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4193 (buf!4636 thiss!1204))) ((_ sign_extend 32) (currentByte!8771 thiss!1204)) ((_ sign_extend 32) (currentBit!8766 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4193 (buf!4636 thiss!1204))) ((_ sign_extend 32) (currentByte!8771 thiss!1204)) ((_ sign_extend 32) (currentBit!8766 thiss!1204))) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun bs!15499 () Bool)

(assert (= bs!15499 d!62099))

(assert (=> bs!15499 m!276229))

(assert (=> b!175986 d!62099))

(check-sat (not d!62087) (not b!176048) (not d!62067) (not d!62069) (not b!176065) (not b!176036) (not d!62071) (not b!176039) (not d!62083) (not d!62075) (not b!176037) (not d!62099) (not d!62081) (not b!176038) (not b!176067))
