; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39170 () Bool)

(assert start!39170)

(declare-fun b!176223 () Bool)

(declare-fun e!122857 () Bool)

(declare-datatypes ((array!9515 0))(
  ( (array!9516 (arr!5128 (Array (_ BitVec 32) (_ BitVec 8))) (size!4198 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7504 0))(
  ( (BitStream!7505 (buf!4641 array!9515) (currentByte!8785 (_ BitVec 32)) (currentBit!8780 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!12710 0))(
  ( (Unit!12711) )
))
(declare-datatypes ((tuple2!15166 0))(
  ( (tuple2!15167 (_1!8228 Unit!12710) (_2!8228 BitStream!7504)) )
))
(declare-fun lt!271477 () tuple2!15166)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!176223 (= e!122857 (invariant!0 (currentBit!8780 (_2!8228 lt!271477)) (currentByte!8785 (_2!8228 lt!271477)) (size!4198 (buf!4641 (_2!8228 lt!271477)))))))

(declare-fun b!176224 () Bool)

(declare-fun res!145959 () Bool)

(declare-fun e!122858 () Bool)

(assert (=> b!176224 (=> (not res!145959) (not e!122858))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun thiss!1204 () BitStream!7504)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!176224 (= res!145959 (validate_offset_bits!1 ((_ sign_extend 32) (size!4198 (buf!4641 thiss!1204))) ((_ sign_extend 32) (currentByte!8785 thiss!1204)) ((_ sign_extend 32) (currentBit!8780 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!176225 () Bool)

(declare-fun e!122859 () Bool)

(declare-datatypes ((tuple2!15168 0))(
  ( (tuple2!15169 (_1!8229 BitStream!7504) (_2!8229 Bool)) )
))
(declare-fun lt!271478 () tuple2!15168)

(declare-fun lt!271476 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!176225 (= e!122859 (= (bitIndex!0 (size!4198 (buf!4641 (_1!8229 lt!271478))) (currentByte!8785 (_1!8229 lt!271478)) (currentBit!8780 (_1!8229 lt!271478))) lt!271476))))

(declare-fun b!176226 () Bool)

(declare-fun res!145963 () Bool)

(declare-fun e!122856 () Bool)

(assert (=> b!176226 (=> (not res!145963) (not e!122856))))

(declare-fun isPrefixOf!0 (BitStream!7504 BitStream!7504) Bool)

(assert (=> b!176226 (= res!145963 (isPrefixOf!0 thiss!1204 (_2!8228 lt!271477)))))

(declare-fun b!176227 () Bool)

(assert (=> b!176227 (= e!122856 e!122859)))

(declare-fun res!145962 () Bool)

(assert (=> b!176227 (=> (not res!145962) (not e!122859))))

(declare-fun lt!271475 () Bool)

(assert (=> b!176227 (= res!145962 (and (= (_2!8229 lt!271478) lt!271475) (= (_1!8229 lt!271478) (_2!8228 lt!271477))))))

(declare-fun readBitPure!0 (BitStream!7504) tuple2!15168)

(declare-fun readerFrom!0 (BitStream!7504 (_ BitVec 32) (_ BitVec 32)) BitStream!7504)

(assert (=> b!176227 (= lt!271478 (readBitPure!0 (readerFrom!0 (_2!8228 lt!271477) (currentBit!8780 thiss!1204) (currentByte!8785 thiss!1204))))))

(declare-fun b!176229 () Bool)

(declare-fun res!145964 () Bool)

(assert (=> b!176229 (=> (not res!145964) (not e!122858))))

(assert (=> b!176229 (= res!145964 (invariant!0 (currentBit!8780 thiss!1204) (currentByte!8785 thiss!1204) (size!4198 (buf!4641 thiss!1204))))))

(declare-fun b!176230 () Bool)

(declare-fun res!145961 () Bool)

(assert (=> b!176230 (=> (not res!145961) (not e!122858))))

(assert (=> b!176230 (= res!145961 (not (= i!590 nBits!348)))))

(declare-fun res!145958 () Bool)

(assert (=> start!39170 (=> (not res!145958) (not e!122858))))

(assert (=> start!39170 (= res!145958 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!39170 e!122858))

(assert (=> start!39170 true))

(declare-fun e!122855 () Bool)

(declare-fun inv!12 (BitStream!7504) Bool)

(assert (=> start!39170 (and (inv!12 thiss!1204) e!122855)))

(declare-fun b!176228 () Bool)

(assert (=> b!176228 (= e!122858 (not e!122857))))

(declare-fun res!145960 () Bool)

(assert (=> b!176228 (=> res!145960 e!122857)))

(assert (=> b!176228 (= res!145960 (not (= (bitIndex!0 (size!4198 (buf!4641 (_2!8228 lt!271477))) (currentByte!8785 (_2!8228 lt!271477)) (currentBit!8780 (_2!8228 lt!271477))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!4198 (buf!4641 thiss!1204)) (currentByte!8785 thiss!1204) (currentBit!8780 thiss!1204))))))))

(declare-fun e!122854 () Bool)

(assert (=> b!176228 e!122854))

(declare-fun res!145965 () Bool)

(assert (=> b!176228 (=> (not res!145965) (not e!122854))))

(assert (=> b!176228 (= res!145965 (= (size!4198 (buf!4641 thiss!1204)) (size!4198 (buf!4641 (_2!8228 lt!271477)))))))

(declare-fun appendBit!0 (BitStream!7504 Bool) tuple2!15166)

(assert (=> b!176228 (= lt!271477 (appendBit!0 thiss!1204 lt!271475))))

(declare-fun v!189 () (_ BitVec 64))

(assert (=> b!176228 (= lt!271475 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!176231 () Bool)

(declare-fun array_inv!3939 (array!9515) Bool)

(assert (=> b!176231 (= e!122855 (array_inv!3939 (buf!4641 thiss!1204)))))

(declare-fun b!176232 () Bool)

(assert (=> b!176232 (= e!122854 e!122856)))

(declare-fun res!145957 () Bool)

(assert (=> b!176232 (=> (not res!145957) (not e!122856))))

(declare-fun lt!271474 () (_ BitVec 64))

(assert (=> b!176232 (= res!145957 (= lt!271476 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!271474)))))

(assert (=> b!176232 (= lt!271476 (bitIndex!0 (size!4198 (buf!4641 (_2!8228 lt!271477))) (currentByte!8785 (_2!8228 lt!271477)) (currentBit!8780 (_2!8228 lt!271477))))))

(assert (=> b!176232 (= lt!271474 (bitIndex!0 (size!4198 (buf!4641 thiss!1204)) (currentByte!8785 thiss!1204) (currentBit!8780 thiss!1204)))))

(assert (= (and start!39170 res!145958) b!176224))

(assert (= (and b!176224 res!145959) b!176229))

(assert (= (and b!176229 res!145964) b!176230))

(assert (= (and b!176230 res!145961) b!176228))

(assert (= (and b!176228 res!145965) b!176232))

(assert (= (and b!176232 res!145957) b!176226))

(assert (= (and b!176226 res!145963) b!176227))

(assert (= (and b!176227 res!145962) b!176225))

(assert (= (and b!176228 (not res!145960)) b!176223))

(assert (= start!39170 b!176231))

(declare-fun m!276373 () Bool)

(assert (=> b!176229 m!276373))

(declare-fun m!276375 () Bool)

(assert (=> b!176228 m!276375))

(declare-fun m!276377 () Bool)

(assert (=> b!176228 m!276377))

(declare-fun m!276379 () Bool)

(assert (=> b!176228 m!276379))

(declare-fun m!276381 () Bool)

(assert (=> b!176224 m!276381))

(declare-fun m!276383 () Bool)

(assert (=> b!176226 m!276383))

(declare-fun m!276385 () Bool)

(assert (=> b!176227 m!276385))

(assert (=> b!176227 m!276385))

(declare-fun m!276387 () Bool)

(assert (=> b!176227 m!276387))

(declare-fun m!276389 () Bool)

(assert (=> b!176225 m!276389))

(declare-fun m!276391 () Bool)

(assert (=> start!39170 m!276391))

(assert (=> b!176232 m!276375))

(assert (=> b!176232 m!276377))

(declare-fun m!276393 () Bool)

(assert (=> b!176231 m!276393))

(declare-fun m!276395 () Bool)

(assert (=> b!176223 m!276395))

(push 1)

(assert (not b!176229))

(assert (not b!176228))

(assert (not b!176227))

(assert (not b!176225))

(assert (not b!176224))

(assert (not b!176226))

(assert (not b!176223))

(assert (not b!176232))

(assert (not b!176231))

(assert (not start!39170))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!62145 () Bool)

(declare-fun res!146036 () Bool)

(declare-fun e!122911 () Bool)

(assert (=> d!62145 (=> (not res!146036) (not e!122911))))

(assert (=> d!62145 (= res!146036 (= (size!4198 (buf!4641 thiss!1204)) (size!4198 (buf!4641 (_2!8228 lt!271477)))))))

(assert (=> d!62145 (= (isPrefixOf!0 thiss!1204 (_2!8228 lt!271477)) e!122911)))

(declare-fun b!176307 () Bool)

(declare-fun res!146035 () Bool)

(assert (=> b!176307 (=> (not res!146035) (not e!122911))))

(assert (=> b!176307 (= res!146035 (bvsle (bitIndex!0 (size!4198 (buf!4641 thiss!1204)) (currentByte!8785 thiss!1204) (currentBit!8780 thiss!1204)) (bitIndex!0 (size!4198 (buf!4641 (_2!8228 lt!271477))) (currentByte!8785 (_2!8228 lt!271477)) (currentBit!8780 (_2!8228 lt!271477)))))))

(declare-fun b!176308 () Bool)

(declare-fun e!122912 () Bool)

(assert (=> b!176308 (= e!122911 e!122912)))

(declare-fun res!146034 () Bool)

(assert (=> b!176308 (=> res!146034 e!122912)))

(assert (=> b!176308 (= res!146034 (= (size!4198 (buf!4641 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!176309 () Bool)

(declare-fun arrayBitRangesEq!0 (array!9515 array!9515 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!176309 (= e!122912 (arrayBitRangesEq!0 (buf!4641 thiss!1204) (buf!4641 (_2!8228 lt!271477)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4198 (buf!4641 thiss!1204)) (currentByte!8785 thiss!1204) (currentBit!8780 thiss!1204))))))

(assert (= (and d!62145 res!146036) b!176307))

(assert (= (and b!176307 res!146035) b!176308))

(assert (= (and b!176308 (not res!146034)) b!176309))

(assert (=> b!176307 m!276377))

(assert (=> b!176307 m!276375))

(assert (=> b!176309 m!276377))

(assert (=> b!176309 m!276377))

(declare-fun m!276449 () Bool)

(assert (=> b!176309 m!276449))

(assert (=> b!176226 d!62145))

(declare-fun d!62147 () Bool)

(assert (=> d!62147 (= (array_inv!3939 (buf!4641 thiss!1204)) (bvsge (size!4198 (buf!4641 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!176231 d!62147))

(declare-fun d!62149 () Bool)

(declare-fun e!122915 () Bool)

(assert (=> d!62149 e!122915))

(declare-fun res!146041 () Bool)

(assert (=> d!62149 (=> (not res!146041) (not e!122915))))

(declare-fun lt!271548 () (_ BitVec 64))

(declare-fun lt!271545 () (_ BitVec 64))

(declare-fun lt!271546 () (_ BitVec 64))

(assert (=> d!62149 (= res!146041 (= lt!271546 (bvsub lt!271548 lt!271545)))))

(assert (=> d!62149 (or (= (bvand lt!271548 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!271545 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!271548 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!271548 lt!271545) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!62149 (= lt!271545 (remainingBits!0 ((_ sign_extend 32) (size!4198 (buf!4641 (_2!8228 lt!271477)))) ((_ sign_extend 32) (currentByte!8785 (_2!8228 lt!271477))) ((_ sign_extend 32) (currentBit!8780 (_2!8228 lt!271477)))))))

(declare-fun lt!271550 () (_ BitVec 64))

(declare-fun lt!271547 () (_ BitVec 64))

(assert (=> d!62149 (= lt!271548 (bvmul lt!271550 lt!271547))))

(assert (=> d!62149 (or (= lt!271550 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!271547 (bvsdiv (bvmul lt!271550 lt!271547) lt!271550)))))

(assert (=> d!62149 (= lt!271547 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!62149 (= lt!271550 ((_ sign_extend 32) (size!4198 (buf!4641 (_2!8228 lt!271477)))))))

(assert (=> d!62149 (= lt!271546 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8785 (_2!8228 lt!271477))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8780 (_2!8228 lt!271477)))))))

(assert (=> d!62149 (invariant!0 (currentBit!8780 (_2!8228 lt!271477)) (currentByte!8785 (_2!8228 lt!271477)) (size!4198 (buf!4641 (_2!8228 lt!271477))))))

(assert (=> d!62149 (= (bitIndex!0 (size!4198 (buf!4641 (_2!8228 lt!271477))) (currentByte!8785 (_2!8228 lt!271477)) (currentBit!8780 (_2!8228 lt!271477))) lt!271546)))

(declare-fun b!176314 () Bool)

(declare-fun res!146042 () Bool)

(assert (=> b!176314 (=> (not res!146042) (not e!122915))))

(assert (=> b!176314 (= res!146042 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!271546))))

(declare-fun b!176315 () Bool)

(declare-fun lt!271549 () (_ BitVec 64))

(assert (=> b!176315 (= e!122915 (bvsle lt!271546 (bvmul lt!271549 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!176315 (or (= lt!271549 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!271549 #b0000000000000000000000000000000000000000000000000000000000001000) lt!271549)))))

(assert (=> b!176315 (= lt!271549 ((_ sign_extend 32) (size!4198 (buf!4641 (_2!8228 lt!271477)))))))

(assert (= (and d!62149 res!146041) b!176314))

(assert (= (and b!176314 res!146042) b!176315))

(declare-fun m!276451 () Bool)

(assert (=> d!62149 m!276451))

(assert (=> d!62149 m!276395))

(assert (=> b!176232 d!62149))

(declare-fun d!62151 () Bool)

(declare-fun e!122916 () Bool)

(assert (=> d!62151 e!122916))

(declare-fun res!146043 () Bool)

(assert (=> d!62151 (=> (not res!146043) (not e!122916))))

(declare-fun lt!271554 () (_ BitVec 64))

(declare-fun lt!271551 () (_ BitVec 64))

(declare-fun lt!271552 () (_ BitVec 64))

(assert (=> d!62151 (= res!146043 (= lt!271552 (bvsub lt!271554 lt!271551)))))

(assert (=> d!62151 (or (= (bvand lt!271554 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!271551 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!271554 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!271554 lt!271551) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!62151 (= lt!271551 (remainingBits!0 ((_ sign_extend 32) (size!4198 (buf!4641 thiss!1204))) ((_ sign_extend 32) (currentByte!8785 thiss!1204)) ((_ sign_extend 32) (currentBit!8780 thiss!1204))))))

(declare-fun lt!271556 () (_ BitVec 64))

(declare-fun lt!271553 () (_ BitVec 64))

(assert (=> d!62151 (= lt!271554 (bvmul lt!271556 lt!271553))))

(assert (=> d!62151 (or (= lt!271556 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!271553 (bvsdiv (bvmul lt!271556 lt!271553) lt!271556)))))

(assert (=> d!62151 (= lt!271553 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!62151 (= lt!271556 ((_ sign_extend 32) (size!4198 (buf!4641 thiss!1204))))))

(assert (=> d!62151 (= lt!271552 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8785 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8780 thiss!1204))))))

(assert (=> d!62151 (invariant!0 (currentBit!8780 thiss!1204) (currentByte!8785 thiss!1204) (size!4198 (buf!4641 thiss!1204)))))

(assert (=> d!62151 (= (bitIndex!0 (size!4198 (buf!4641 thiss!1204)) (currentByte!8785 thiss!1204) (currentBit!8780 thiss!1204)) lt!271552)))

(declare-fun b!176316 () Bool)

(declare-fun res!146044 () Bool)

(assert (=> b!176316 (=> (not res!146044) (not e!122916))))

(assert (=> b!176316 (= res!146044 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!271552))))

(declare-fun b!176317 () Bool)

(declare-fun lt!271555 () (_ BitVec 64))

(assert (=> b!176317 (= e!122916 (bvsle lt!271552 (bvmul lt!271555 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!176317 (or (= lt!271555 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!271555 #b0000000000000000000000000000000000000000000000000000000000001000) lt!271555)))))

(assert (=> b!176317 (= lt!271555 ((_ sign_extend 32) (size!4198 (buf!4641 thiss!1204))))))

(assert (= (and d!62151 res!146043) b!176316))

(assert (= (and b!176316 res!146044) b!176317))

(declare-fun m!276453 () Bool)

(assert (=> d!62151 m!276453))

(assert (=> d!62151 m!276373))

(assert (=> b!176232 d!62151))

(declare-fun d!62153 () Bool)

(declare-datatypes ((tuple2!15178 0))(
  ( (tuple2!15179 (_1!8234 Bool) (_2!8234 BitStream!7504)) )
))
(declare-fun lt!271559 () tuple2!15178)

(declare-fun readBit!0 (BitStream!7504) tuple2!15178)

(assert (=> d!62153 (= lt!271559 (readBit!0 (readerFrom!0 (_2!8228 lt!271477) (currentBit!8780 thiss!1204) (currentByte!8785 thiss!1204))))))

(assert (=> d!62153 (= (readBitPure!0 (readerFrom!0 (_2!8228 lt!271477) (currentBit!8780 thiss!1204) (currentByte!8785 thiss!1204))) (tuple2!15169 (_2!8234 lt!271559) (_1!8234 lt!271559)))))

(declare-fun bs!15511 () Bool)

(assert (= bs!15511 d!62153))

(assert (=> bs!15511 m!276385))

(declare-fun m!276455 () Bool)

(assert (=> bs!15511 m!276455))

(assert (=> b!176227 d!62153))

(declare-fun d!62155 () Bool)

(declare-fun e!122919 () Bool)

(assert (=> d!62155 e!122919))

(declare-fun res!146048 () Bool)

(assert (=> d!62155 (=> (not res!146048) (not e!122919))))

(assert (=> d!62155 (= res!146048 (invariant!0 (currentBit!8780 (_2!8228 lt!271477)) (currentByte!8785 (_2!8228 lt!271477)) (size!4198 (buf!4641 (_2!8228 lt!271477)))))))

(assert (=> d!62155 (= (readerFrom!0 (_2!8228 lt!271477) (currentBit!8780 thiss!1204) (currentByte!8785 thiss!1204)) (BitStream!7505 (buf!4641 (_2!8228 lt!271477)) (currentByte!8785 thiss!1204) (currentBit!8780 thiss!1204)))))

(declare-fun b!176320 () Bool)

(assert (=> b!176320 (= e!122919 (invariant!0 (currentBit!8780 thiss!1204) (currentByte!8785 thiss!1204) (size!4198 (buf!4641 (_2!8228 lt!271477)))))))

(assert (= (and d!62155 res!146048) b!176320))

(assert (=> d!62155 m!276395))

(declare-fun m!276457 () Bool)

(assert (=> b!176320 m!276457))

(assert (=> b!176227 d!62155))

(declare-fun d!62157 () Bool)

(assert (=> d!62157 (= (invariant!0 (currentBit!8780 thiss!1204) (currentByte!8785 thiss!1204) (size!4198 (buf!4641 thiss!1204))) (and (bvsge (currentBit!8780 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!8780 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!8785 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!8785 thiss!1204) (size!4198 (buf!4641 thiss!1204))) (and (= (currentBit!8780 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!8785 thiss!1204) (size!4198 (buf!4641 thiss!1204)))))))))

(assert (=> b!176229 d!62157))

(assert (=> b!176228 d!62149))

(assert (=> b!176228 d!62151))

(declare-fun b!176358 () Bool)

(declare-fun res!146088 () Bool)

(declare-fun e!122939 () Bool)

(assert (=> b!176358 (=> (not res!146088) (not e!122939))))

(declare-fun lt!271622 () tuple2!15166)

(declare-fun lt!271620 () (_ BitVec 64))

(declare-fun lt!271619 () (_ BitVec 64))

(assert (=> b!176358 (= res!146088 (= (bitIndex!0 (size!4198 (buf!4641 (_2!8228 lt!271622))) (currentByte!8785 (_2!8228 lt!271622)) (currentBit!8780 (_2!8228 lt!271622))) (bvadd lt!271620 lt!271619)))))

(assert (=> b!176358 (or (not (= (bvand lt!271620 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!271619 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!271620 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!271620 lt!271619) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!176358 (= lt!271619 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!176358 (= lt!271620 (bitIndex!0 (size!4198 (buf!4641 thiss!1204)) (currentByte!8785 thiss!1204) (currentBit!8780 thiss!1204)))))

(declare-fun d!62159 () Bool)

(assert (=> d!62159 e!122939))

(declare-fun res!146087 () Bool)

(assert (=> d!62159 (=> (not res!146087) (not e!122939))))

(assert (=> d!62159 (= res!146087 (= (size!4198 (buf!4641 thiss!1204)) (size!4198 (buf!4641 (_2!8228 lt!271622)))))))

(declare-fun choose!16 (BitStream!7504 Bool) tuple2!15166)

(assert (=> d!62159 (= lt!271622 (choose!16 thiss!1204 lt!271475))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!62159 (validate_offset_bit!0 ((_ sign_extend 32) (size!4198 (buf!4641 thiss!1204))) ((_ sign_extend 32) (currentByte!8785 thiss!1204)) ((_ sign_extend 32) (currentBit!8780 thiss!1204)))))

(assert (=> d!62159 (= (appendBit!0 thiss!1204 lt!271475) lt!271622)))

(declare-fun b!176361 () Bool)

(declare-fun e!122940 () Bool)

(declare-fun lt!271621 () tuple2!15168)

(assert (=> b!176361 (= e!122940 (= (bitIndex!0 (size!4198 (buf!4641 (_1!8229 lt!271621))) (currentByte!8785 (_1!8229 lt!271621)) (currentBit!8780 (_1!8229 lt!271621))) (bitIndex!0 (size!4198 (buf!4641 (_2!8228 lt!271622))) (currentByte!8785 (_2!8228 lt!271622)) (currentBit!8780 (_2!8228 lt!271622)))))))

(declare-fun b!176359 () Bool)

(declare-fun res!146085 () Bool)

(assert (=> b!176359 (=> (not res!146085) (not e!122939))))

(assert (=> b!176359 (= res!146085 (isPrefixOf!0 thiss!1204 (_2!8228 lt!271622)))))

(declare-fun b!176360 () Bool)

(assert (=> b!176360 (= e!122939 e!122940)))

(declare-fun res!146086 () Bool)

(assert (=> b!176360 (=> (not res!146086) (not e!122940))))

(assert (=> b!176360 (= res!146086 (and (= (_2!8229 lt!271621) lt!271475) (= (_1!8229 lt!271621) (_2!8228 lt!271622))))))

(assert (=> b!176360 (= lt!271621 (readBitPure!0 (readerFrom!0 (_2!8228 lt!271622) (currentBit!8780 thiss!1204) (currentByte!8785 thiss!1204))))))

(assert (= (and d!62159 res!146087) b!176358))

(assert (= (and b!176358 res!146088) b!176359))

(assert (= (and b!176359 res!146085) b!176360))

(assert (= (and b!176360 res!146086) b!176361))

(declare-fun m!276489 () Bool)

(assert (=> b!176361 m!276489))

(declare-fun m!276491 () Bool)

(assert (=> b!176361 m!276491))

(declare-fun m!276493 () Bool)

(assert (=> b!176359 m!276493))

(declare-fun m!276495 () Bool)

(assert (=> b!176360 m!276495))

(assert (=> b!176360 m!276495))

(declare-fun m!276497 () Bool)

(assert (=> b!176360 m!276497))

(assert (=> b!176358 m!276491))

(assert (=> b!176358 m!276377))

(declare-fun m!276499 () Bool)

(assert (=> d!62159 m!276499))

(declare-fun m!276501 () Bool)

(assert (=> d!62159 m!276501))

(assert (=> b!176228 d!62159))

(declare-fun d!62189 () Bool)

(assert (=> d!62189 (= (invariant!0 (currentBit!8780 (_2!8228 lt!271477)) (currentByte!8785 (_2!8228 lt!271477)) (size!4198 (buf!4641 (_2!8228 lt!271477)))) (and (bvsge (currentBit!8780 (_2!8228 lt!271477)) #b00000000000000000000000000000000) (bvslt (currentBit!8780 (_2!8228 lt!271477)) #b00000000000000000000000000001000) (bvsge (currentByte!8785 (_2!8228 lt!271477)) #b00000000000000000000000000000000) (or (bvslt (currentByte!8785 (_2!8228 lt!271477)) (size!4198 (buf!4641 (_2!8228 lt!271477)))) (and (= (currentBit!8780 (_2!8228 lt!271477)) #b00000000000000000000000000000000) (= (currentByte!8785 (_2!8228 lt!271477)) (size!4198 (buf!4641 (_2!8228 lt!271477))))))))))

(assert (=> b!176223 d!62189))

(declare-fun d!62191 () Bool)

(declare-fun e!122941 () Bool)

(assert (=> d!62191 e!122941))

(declare-fun res!146089 () Bool)

(assert (=> d!62191 (=> (not res!146089) (not e!122941))))

(declare-fun lt!271623 () (_ BitVec 64))

(declare-fun lt!271624 () (_ BitVec 64))

(declare-fun lt!271626 () (_ BitVec 64))

(assert (=> d!62191 (= res!146089 (= lt!271624 (bvsub lt!271626 lt!271623)))))

(assert (=> d!62191 (or (= (bvand lt!271626 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!271623 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!271626 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!271626 lt!271623) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!62191 (= lt!271623 (remainingBits!0 ((_ sign_extend 32) (size!4198 (buf!4641 (_1!8229 lt!271478)))) ((_ sign_extend 32) (currentByte!8785 (_1!8229 lt!271478))) ((_ sign_extend 32) (currentBit!8780 (_1!8229 lt!271478)))))))

(declare-fun lt!271628 () (_ BitVec 64))

(declare-fun lt!271625 () (_ BitVec 64))

(assert (=> d!62191 (= lt!271626 (bvmul lt!271628 lt!271625))))

(assert (=> d!62191 (or (= lt!271628 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!271625 (bvsdiv (bvmul lt!271628 lt!271625) lt!271628)))))

(assert (=> d!62191 (= lt!271625 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!62191 (= lt!271628 ((_ sign_extend 32) (size!4198 (buf!4641 (_1!8229 lt!271478)))))))

(assert (=> d!62191 (= lt!271624 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8785 (_1!8229 lt!271478))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8780 (_1!8229 lt!271478)))))))

(assert (=> d!62191 (invariant!0 (currentBit!8780 (_1!8229 lt!271478)) (currentByte!8785 (_1!8229 lt!271478)) (size!4198 (buf!4641 (_1!8229 lt!271478))))))

(assert (=> d!62191 (= (bitIndex!0 (size!4198 (buf!4641 (_1!8229 lt!271478))) (currentByte!8785 (_1!8229 lt!271478)) (currentBit!8780 (_1!8229 lt!271478))) lt!271624)))

(declare-fun b!176362 () Bool)

(declare-fun res!146090 () Bool)

(assert (=> b!176362 (=> (not res!146090) (not e!122941))))

(assert (=> b!176362 (= res!146090 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!271624))))

(declare-fun b!176363 () Bool)

(declare-fun lt!271627 () (_ BitVec 64))

(assert (=> b!176363 (= e!122941 (bvsle lt!271624 (bvmul lt!271627 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!176363 (or (= lt!271627 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!271627 #b0000000000000000000000000000000000000000000000000000000000001000) lt!271627)))))

(assert (=> b!176363 (= lt!271627 ((_ sign_extend 32) (size!4198 (buf!4641 (_1!8229 lt!271478)))))))

(assert (= (and d!62191 res!146089) b!176362))

(assert (= (and b!176362 res!146090) b!176363))

(declare-fun m!276503 () Bool)

(assert (=> d!62191 m!276503))

(declare-fun m!276505 () Bool)

(assert (=> d!62191 m!276505))

(assert (=> b!176225 d!62191))

(declare-fun d!62193 () Bool)

(assert (=> d!62193 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4198 (buf!4641 thiss!1204))) ((_ sign_extend 32) (currentByte!8785 thiss!1204)) ((_ sign_extend 32) (currentBit!8780 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4198 (buf!4641 thiss!1204))) ((_ sign_extend 32) (currentByte!8785 thiss!1204)) ((_ sign_extend 32) (currentBit!8780 thiss!1204))) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun bs!15515 () Bool)

(assert (= bs!15515 d!62193))

(assert (=> bs!15515 m!276453))

(assert (=> b!176224 d!62193))

(declare-fun d!62195 () Bool)

(assert (=> d!62195 (= (inv!12 thiss!1204) (invariant!0 (currentBit!8780 thiss!1204) (currentByte!8785 thiss!1204) (size!4198 (buf!4641 thiss!1204))))))

(declare-fun bs!15516 () Bool)

(assert (= bs!15516 d!62195))

(assert (=> bs!15516 m!276373))

(assert (=> start!39170 d!62195))

(push 1)

(assert (not d!62151))

(assert (not b!176361))

(assert (not d!62153))

(assert (not d!62149))

(assert (not b!176320))

(assert (not b!176359))

(assert (not d!62191))

(assert (not b!176360))

(assert (not b!176309))

(assert (not d!62195))

(assert (not b!176307))

(assert (not b!176358))

(assert (not d!62193))

(assert (not d!62159))

(assert (not d!62155))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

