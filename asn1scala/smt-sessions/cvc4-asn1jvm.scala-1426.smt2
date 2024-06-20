; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39108 () Bool)

(assert start!39108)

(declare-fun b!176008 () Bool)

(declare-fun e!122722 () Bool)

(declare-fun e!122724 () Bool)

(assert (=> b!176008 (= e!122722 e!122724)))

(declare-fun res!145757 () Bool)

(assert (=> b!176008 (=> (not res!145757) (not e!122724))))

(declare-fun lt!271282 () (_ BitVec 64))

(declare-fun lt!271281 () (_ BitVec 64))

(assert (=> b!176008 (= res!145757 (= lt!271282 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!271281)))))

(declare-datatypes ((array!9504 0))(
  ( (array!9505 (arr!5124 (Array (_ BitVec 32) (_ BitVec 8))) (size!4194 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7496 0))(
  ( (BitStream!7497 (buf!4637 array!9504) (currentByte!8772 (_ BitVec 32)) (currentBit!8767 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!12702 0))(
  ( (Unit!12703) )
))
(declare-datatypes ((tuple2!15144 0))(
  ( (tuple2!15145 (_1!8217 Unit!12702) (_2!8217 BitStream!7496)) )
))
(declare-fun lt!271280 () tuple2!15144)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!176008 (= lt!271282 (bitIndex!0 (size!4194 (buf!4637 (_2!8217 lt!271280))) (currentByte!8772 (_2!8217 lt!271280)) (currentBit!8767 (_2!8217 lt!271280))))))

(declare-fun thiss!1204 () BitStream!7496)

(assert (=> b!176008 (= lt!271281 (bitIndex!0 (size!4194 (buf!4637 thiss!1204)) (currentByte!8772 thiss!1204) (currentBit!8767 thiss!1204)))))

(declare-fun b!176009 () Bool)

(declare-fun res!145756 () Bool)

(declare-fun e!122721 () Bool)

(assert (=> b!176009 (=> (not res!145756) (not e!122721))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!176009 (= res!145756 (invariant!0 (currentBit!8767 thiss!1204) (currentByte!8772 thiss!1204) (size!4194 (buf!4637 thiss!1204))))))

(declare-fun res!145754 () Bool)

(assert (=> start!39108 (=> (not res!145754) (not e!122721))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> start!39108 (= res!145754 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!39108 e!122721))

(assert (=> start!39108 true))

(declare-fun e!122725 () Bool)

(declare-fun inv!12 (BitStream!7496) Bool)

(assert (=> start!39108 (and (inv!12 thiss!1204) e!122725)))

(declare-fun b!176010 () Bool)

(declare-fun array_inv!3935 (array!9504) Bool)

(assert (=> b!176010 (= e!122725 (array_inv!3935 (buf!4637 thiss!1204)))))

(declare-fun b!176011 () Bool)

(declare-fun res!145755 () Bool)

(assert (=> b!176011 (=> (not res!145755) (not e!122721))))

(assert (=> b!176011 (= res!145755 (not (= i!590 nBits!348)))))

(declare-fun b!176012 () Bool)

(declare-fun res!145759 () Bool)

(assert (=> b!176012 (=> (not res!145759) (not e!122721))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!176012 (= res!145759 (validate_offset_bits!1 ((_ sign_extend 32) (size!4194 (buf!4637 thiss!1204))) ((_ sign_extend 32) (currentByte!8772 thiss!1204)) ((_ sign_extend 32) (currentBit!8767 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!176013 () Bool)

(declare-fun e!122720 () Bool)

(declare-datatypes ((tuple2!15146 0))(
  ( (tuple2!15147 (_1!8218 BitStream!7496) (_2!8218 Bool)) )
))
(declare-fun lt!271283 () tuple2!15146)

(assert (=> b!176013 (= e!122720 (= (bitIndex!0 (size!4194 (buf!4637 (_1!8218 lt!271283))) (currentByte!8772 (_1!8218 lt!271283)) (currentBit!8767 (_1!8218 lt!271283))) lt!271282))))

(declare-fun b!176014 () Bool)

(assert (=> b!176014 (= e!122721 (not (invariant!0 (currentBit!8767 (_2!8217 lt!271280)) (currentByte!8772 (_2!8217 lt!271280)) (size!4194 (buf!4637 (_2!8217 lt!271280))))))))

(assert (=> b!176014 e!122722))

(declare-fun res!145758 () Bool)

(assert (=> b!176014 (=> (not res!145758) (not e!122722))))

(assert (=> b!176014 (= res!145758 (= (size!4194 (buf!4637 thiss!1204)) (size!4194 (buf!4637 (_2!8217 lt!271280)))))))

(declare-fun lt!271279 () Bool)

(declare-fun appendBit!0 (BitStream!7496 Bool) tuple2!15144)

(assert (=> b!176014 (= lt!271280 (appendBit!0 thiss!1204 lt!271279))))

(declare-fun v!189 () (_ BitVec 64))

(assert (=> b!176014 (= lt!271279 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!176015 () Bool)

(assert (=> b!176015 (= e!122724 e!122720)))

(declare-fun res!145761 () Bool)

(assert (=> b!176015 (=> (not res!145761) (not e!122720))))

(assert (=> b!176015 (= res!145761 (and (= (_2!8218 lt!271283) lt!271279) (= (_1!8218 lt!271283) (_2!8217 lt!271280))))))

(declare-fun readBitPure!0 (BitStream!7496) tuple2!15146)

(declare-fun readerFrom!0 (BitStream!7496 (_ BitVec 32) (_ BitVec 32)) BitStream!7496)

(assert (=> b!176015 (= lt!271283 (readBitPure!0 (readerFrom!0 (_2!8217 lt!271280) (currentBit!8767 thiss!1204) (currentByte!8772 thiss!1204))))))

(declare-fun b!176016 () Bool)

(declare-fun res!145760 () Bool)

(assert (=> b!176016 (=> (not res!145760) (not e!122724))))

(declare-fun isPrefixOf!0 (BitStream!7496 BitStream!7496) Bool)

(assert (=> b!176016 (= res!145760 (isPrefixOf!0 thiss!1204 (_2!8217 lt!271280)))))

(assert (= (and start!39108 res!145754) b!176012))

(assert (= (and b!176012 res!145759) b!176009))

(assert (= (and b!176009 res!145756) b!176011))

(assert (= (and b!176011 res!145755) b!176014))

(assert (= (and b!176014 res!145758) b!176008))

(assert (= (and b!176008 res!145757) b!176016))

(assert (= (and b!176016 res!145760) b!176015))

(assert (= (and b!176015 res!145761) b!176013))

(assert (= start!39108 b!176010))

(declare-fun m!276199 () Bool)

(assert (=> b!176009 m!276199))

(declare-fun m!276201 () Bool)

(assert (=> b!176010 m!276201))

(declare-fun m!276203 () Bool)

(assert (=> b!176013 m!276203))

(declare-fun m!276205 () Bool)

(assert (=> b!176012 m!276205))

(declare-fun m!276207 () Bool)

(assert (=> b!176008 m!276207))

(declare-fun m!276209 () Bool)

(assert (=> b!176008 m!276209))

(declare-fun m!276211 () Bool)

(assert (=> start!39108 m!276211))

(declare-fun m!276213 () Bool)

(assert (=> b!176014 m!276213))

(declare-fun m!276215 () Bool)

(assert (=> b!176014 m!276215))

(declare-fun m!276217 () Bool)

(assert (=> b!176016 m!276217))

(declare-fun m!276219 () Bool)

(assert (=> b!176015 m!276219))

(assert (=> b!176015 m!276219))

(declare-fun m!276221 () Bool)

(assert (=> b!176015 m!276221))

(push 1)

(assert (not b!176016))

(assert (not b!176014))

(assert (not b!176013))

(assert (not b!176008))

(assert (not b!176012))

(assert (not b!176015))

(assert (not start!39108))

(assert (not b!176010))

(assert (not b!176009))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!62079 () Bool)

(declare-fun e!122741 () Bool)

(assert (=> d!62079 e!122741))

(declare-fun res!145792 () Bool)

(assert (=> d!62079 (=> (not res!145792) (not e!122741))))

(declare-fun lt!271342 () (_ BitVec 64))

(declare-fun lt!271343 () (_ BitVec 64))

(declare-fun lt!271345 () (_ BitVec 64))

(assert (=> d!62079 (= res!145792 (= lt!271345 (bvsub lt!271343 lt!271342)))))

(assert (=> d!62079 (or (= (bvand lt!271343 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!271342 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!271343 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!271343 lt!271342) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!62079 (= lt!271342 (remainingBits!0 ((_ sign_extend 32) (size!4194 (buf!4637 (_2!8217 lt!271280)))) ((_ sign_extend 32) (currentByte!8772 (_2!8217 lt!271280))) ((_ sign_extend 32) (currentBit!8767 (_2!8217 lt!271280)))))))

(declare-fun lt!271344 () (_ BitVec 64))

(declare-fun lt!271346 () (_ BitVec 64))

(assert (=> d!62079 (= lt!271343 (bvmul lt!271344 lt!271346))))

(assert (=> d!62079 (or (= lt!271344 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!271346 (bvsdiv (bvmul lt!271344 lt!271346) lt!271344)))))

(assert (=> d!62079 (= lt!271346 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!62079 (= lt!271344 ((_ sign_extend 32) (size!4194 (buf!4637 (_2!8217 lt!271280)))))))

(assert (=> d!62079 (= lt!271345 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8772 (_2!8217 lt!271280))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8767 (_2!8217 lt!271280)))))))

(assert (=> d!62079 (invariant!0 (currentBit!8767 (_2!8217 lt!271280)) (currentByte!8772 (_2!8217 lt!271280)) (size!4194 (buf!4637 (_2!8217 lt!271280))))))

(assert (=> d!62079 (= (bitIndex!0 (size!4194 (buf!4637 (_2!8217 lt!271280))) (currentByte!8772 (_2!8217 lt!271280)) (currentBit!8767 (_2!8217 lt!271280))) lt!271345)))

(declare-fun b!176046 () Bool)

(declare-fun res!145791 () Bool)

(assert (=> b!176046 (=> (not res!145791) (not e!122741))))

(assert (=> b!176046 (= res!145791 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!271345))))

(declare-fun b!176047 () Bool)

(declare-fun lt!271341 () (_ BitVec 64))

(assert (=> b!176047 (= e!122741 (bvsle lt!271345 (bvmul lt!271341 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!176047 (or (= lt!271341 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!271341 #b0000000000000000000000000000000000000000000000000000000000001000) lt!271341)))))

(assert (=> b!176047 (= lt!271341 ((_ sign_extend 32) (size!4194 (buf!4637 (_2!8217 lt!271280)))))))

(assert (= (and d!62079 res!145792) b!176046))

(assert (= (and b!176046 res!145791) b!176047))

(declare-fun m!276247 () Bool)

(assert (=> d!62079 m!276247))

(assert (=> d!62079 m!276213))

(assert (=> b!176008 d!62079))

(declare-fun d!62085 () Bool)

(declare-fun e!122743 () Bool)

(assert (=> d!62085 e!122743))

(declare-fun res!145795 () Bool)

(assert (=> d!62085 (=> (not res!145795) (not e!122743))))

(declare-fun lt!271353 () (_ BitVec 64))

(declare-fun lt!271351 () (_ BitVec 64))

(declare-fun lt!271350 () (_ BitVec 64))

(assert (=> d!62085 (= res!145795 (= lt!271353 (bvsub lt!271351 lt!271350)))))

(assert (=> d!62085 (or (= (bvand lt!271351 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!271350 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!271351 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!271351 lt!271350) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!62085 (= lt!271350 (remainingBits!0 ((_ sign_extend 32) (size!4194 (buf!4637 thiss!1204))) ((_ sign_extend 32) (currentByte!8772 thiss!1204)) ((_ sign_extend 32) (currentBit!8767 thiss!1204))))))

(declare-fun lt!271352 () (_ BitVec 64))

(declare-fun lt!271354 () (_ BitVec 64))

(assert (=> d!62085 (= lt!271351 (bvmul lt!271352 lt!271354))))

(assert (=> d!62085 (or (= lt!271352 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!271354 (bvsdiv (bvmul lt!271352 lt!271354) lt!271352)))))

(assert (=> d!62085 (= lt!271354 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!62085 (= lt!271352 ((_ sign_extend 32) (size!4194 (buf!4637 thiss!1204))))))

(assert (=> d!62085 (= lt!271353 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8772 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8767 thiss!1204))))))

(assert (=> d!62085 (invariant!0 (currentBit!8767 thiss!1204) (currentByte!8772 thiss!1204) (size!4194 (buf!4637 thiss!1204)))))

(assert (=> d!62085 (= (bitIndex!0 (size!4194 (buf!4637 thiss!1204)) (currentByte!8772 thiss!1204) (currentBit!8767 thiss!1204)) lt!271353)))

(declare-fun b!176049 () Bool)

(declare-fun res!145794 () Bool)

(assert (=> b!176049 (=> (not res!145794) (not e!122743))))

(assert (=> b!176049 (= res!145794 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!271353))))

(declare-fun b!176050 () Bool)

(declare-fun lt!271349 () (_ BitVec 64))

(assert (=> b!176050 (= e!122743 (bvsle lt!271353 (bvmul lt!271349 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!176050 (or (= lt!271349 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!271349 #b0000000000000000000000000000000000000000000000000000000000001000) lt!271349)))))

(assert (=> b!176050 (= lt!271349 ((_ sign_extend 32) (size!4194 (buf!4637 thiss!1204))))))

(assert (= (and d!62085 res!145795) b!176049))

(assert (= (and b!176049 res!145794) b!176050))

(declare-fun m!276251 () Bool)

(assert (=> d!62085 m!276251))

(assert (=> d!62085 m!276199))

(assert (=> b!176008 d!62085))

(declare-fun d!62089 () Bool)

(declare-fun e!122746 () Bool)

(assert (=> d!62089 e!122746))

(declare-fun res!145799 () Bool)

(assert (=> d!62089 (=> (not res!145799) (not e!122746))))

(declare-fun lt!271364 () (_ BitVec 64))

(declare-fun lt!271365 () (_ BitVec 64))

(declare-fun lt!271367 () (_ BitVec 64))

(assert (=> d!62089 (= res!145799 (= lt!271367 (bvsub lt!271365 lt!271364)))))

(assert (=> d!62089 (or (= (bvand lt!271365 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!271364 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!271365 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!271365 lt!271364) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!62089 (= lt!271364 (remainingBits!0 ((_ sign_extend 32) (size!4194 (buf!4637 (_1!8218 lt!271283)))) ((_ sign_extend 32) (currentByte!8772 (_1!8218 lt!271283))) ((_ sign_extend 32) (currentBit!8767 (_1!8218 lt!271283)))))))

(declare-fun lt!271366 () (_ BitVec 64))

(declare-fun lt!271368 () (_ BitVec 64))

(assert (=> d!62089 (= lt!271365 (bvmul lt!271366 lt!271368))))

(assert (=> d!62089 (or (= lt!271366 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!271368 (bvsdiv (bvmul lt!271366 lt!271368) lt!271366)))))

(assert (=> d!62089 (= lt!271368 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!62089 (= lt!271366 ((_ sign_extend 32) (size!4194 (buf!4637 (_1!8218 lt!271283)))))))

(assert (=> d!62089 (= lt!271367 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8772 (_1!8218 lt!271283))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8767 (_1!8218 lt!271283)))))))

(assert (=> d!62089 (invariant!0 (currentBit!8767 (_1!8218 lt!271283)) (currentByte!8772 (_1!8218 lt!271283)) (size!4194 (buf!4637 (_1!8218 lt!271283))))))

(assert (=> d!62089 (= (bitIndex!0 (size!4194 (buf!4637 (_1!8218 lt!271283))) (currentByte!8772 (_1!8218 lt!271283)) (currentBit!8767 (_1!8218 lt!271283))) lt!271367)))

(declare-fun b!176051 () Bool)

(declare-fun res!145798 () Bool)

(assert (=> b!176051 (=> (not res!145798) (not e!122746))))

(assert (=> b!176051 (= res!145798 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!271367))))

(declare-fun b!176052 () Bool)

(declare-fun lt!271363 () (_ BitVec 64))

(assert (=> b!176052 (= e!122746 (bvsle lt!271367 (bvmul lt!271363 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!176052 (or (= lt!271363 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!271363 #b0000000000000000000000000000000000000000000000000000000000001000) lt!271363)))))

(assert (=> b!176052 (= lt!271363 ((_ sign_extend 32) (size!4194 (buf!4637 (_1!8218 lt!271283)))))))

(assert (= (and d!62089 res!145799) b!176051))

(assert (= (and b!176051 res!145798) b!176052))

(declare-fun m!276253 () Bool)

(assert (=> d!62089 m!276253))

(declare-fun m!276255 () Bool)

(assert (=> d!62089 m!276255))

(assert (=> b!176013 d!62089))

(declare-fun d!62093 () Bool)

(declare-datatypes ((tuple2!15150 0))(
  ( (tuple2!15151 (_1!8220 Bool) (_2!8220 BitStream!7496)) )
))
(declare-fun lt!271379 () tuple2!15150)

(declare-fun readBit!0 (BitStream!7496) tuple2!15150)

(assert (=> d!62093 (= lt!271379 (readBit!0 (readerFrom!0 (_2!8217 lt!271280) (currentBit!8767 thiss!1204) (currentByte!8772 thiss!1204))))))

(assert (=> d!62093 (= (readBitPure!0 (readerFrom!0 (_2!8217 lt!271280) (currentBit!8767 thiss!1204) (currentByte!8772 thiss!1204))) (tuple2!15147 (_2!8220 lt!271379) (_1!8220 lt!271379)))))

(declare-fun bs!15498 () Bool)

(assert (= bs!15498 d!62093))

(assert (=> bs!15498 m!276219))

(declare-fun m!276257 () Bool)

(assert (=> bs!15498 m!276257))

(assert (=> b!176015 d!62093))

(declare-fun d!62095 () Bool)

(declare-fun e!122756 () Bool)

(assert (=> d!62095 e!122756))

(declare-fun res!145816 () Bool)

(assert (=> d!62095 (=> (not res!145816) (not e!122756))))

(assert (=> d!62095 (= res!145816 (invariant!0 (currentBit!8767 (_2!8217 lt!271280)) (currentByte!8772 (_2!8217 lt!271280)) (size!4194 (buf!4637 (_2!8217 lt!271280)))))))

(assert (=> d!62095 (= (readerFrom!0 (_2!8217 lt!271280) (currentBit!8767 thiss!1204) (currentByte!8772 thiss!1204)) (BitStream!7497 (buf!4637 (_2!8217 lt!271280)) (currentByte!8772 thiss!1204) (currentBit!8767 thiss!1204)))))

(declare-fun b!176070 () Bool)

(assert (=> b!176070 (= e!122756 (invariant!0 (currentBit!8767 thiss!1204) (currentByte!8772 thiss!1204) (size!4194 (buf!4637 (_2!8217 lt!271280)))))))

(assert (= (and d!62095 res!145816) b!176070))

(assert (=> d!62095 m!276213))

(declare-fun m!276265 () Bool)

(assert (=> b!176070 m!276265))

(assert (=> b!176015 d!62095))

(declare-fun d!62101 () Bool)

(assert (=> d!62101 (= (invariant!0 (currentBit!8767 thiss!1204) (currentByte!8772 thiss!1204) (size!4194 (buf!4637 thiss!1204))) (and (bvsge (currentBit!8767 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!8767 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!8772 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!8772 thiss!1204) (size!4194 (buf!4637 thiss!1204))) (and (= (currentBit!8767 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!8772 thiss!1204) (size!4194 (buf!4637 thiss!1204)))))))))

(assert (=> b!176009 d!62101))

(declare-fun d!62103 () Bool)

(assert (=> d!62103 (= (invariant!0 (currentBit!8767 (_2!8217 lt!271280)) (currentByte!8772 (_2!8217 lt!271280)) (size!4194 (buf!4637 (_2!8217 lt!271280)))) (and (bvsge (currentBit!8767 (_2!8217 lt!271280)) #b00000000000000000000000000000000) (bvslt (currentBit!8767 (_2!8217 lt!271280)) #b00000000000000000000000000001000) (bvsge (currentByte!8772 (_2!8217 lt!271280)) #b00000000000000000000000000000000) (or (bvslt (currentByte!8772 (_2!8217 lt!271280)) (size!4194 (buf!4637 (_2!8217 lt!271280)))) (and (= (currentBit!8767 (_2!8217 lt!271280)) #b00000000000000000000000000000000) (= (currentByte!8772 (_2!8217 lt!271280)) (size!4194 (buf!4637 (_2!8217 lt!271280))))))))))

(assert (=> b!176014 d!62103))

(declare-fun b!176099 () Bool)

(declare-fun e!122772 () Bool)

(declare-fun lt!271406 () tuple2!15146)

(declare-fun lt!271404 () tuple2!15144)

(assert (=> b!176099 (= e!122772 (= (bitIndex!0 (size!4194 (buf!4637 (_1!8218 lt!271406))) (currentByte!8772 (_1!8218 lt!271406)) (currentBit!8767 (_1!8218 lt!271406))) (bitIndex!0 (size!4194 (buf!4637 (_2!8217 lt!271404))) (currentByte!8772 (_2!8217 lt!271404)) (currentBit!8767 (_2!8217 lt!271404)))))))

(declare-fun b!176096 () Bool)

(declare-fun res!145843 () Bool)

(declare-fun e!122773 () Bool)

(assert (=> b!176096 (=> (not res!145843) (not e!122773))))

(declare-fun lt!271403 () (_ BitVec 64))

(declare-fun lt!271405 () (_ BitVec 64))

(assert (=> b!176096 (= res!145843 (= (bitIndex!0 (size!4194 (buf!4637 (_2!8217 lt!271404))) (currentByte!8772 (_2!8217 lt!271404)) (currentBit!8767 (_2!8217 lt!271404))) (bvadd lt!271405 lt!271403)))))

(assert (=> b!176096 (or (not (= (bvand lt!271405 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!271403 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!271405 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!271405 lt!271403) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!176096 (= lt!271403 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!176096 (= lt!271405 (bitIndex!0 (size!4194 (buf!4637 thiss!1204)) (currentByte!8772 thiss!1204) (currentBit!8767 thiss!1204)))))

(declare-fun b!176098 () Bool)

(assert (=> b!176098 (= e!122773 e!122772)))

(declare-fun res!145845 () Bool)

(assert (=> b!176098 (=> (not res!145845) (not e!122772))))

(assert (=> b!176098 (= res!145845 (and (= (_2!8218 lt!271406) lt!271279) (= (_1!8218 lt!271406) (_2!8217 lt!271404))))))

(assert (=> b!176098 (= lt!271406 (readBitPure!0 (readerFrom!0 (_2!8217 lt!271404) (currentBit!8767 thiss!1204) (currentByte!8772 thiss!1204))))))

(declare-fun b!176097 () Bool)

(declare-fun res!145842 () Bool)

(assert (=> b!176097 (=> (not res!145842) (not e!122773))))

(assert (=> b!176097 (= res!145842 (isPrefixOf!0 thiss!1204 (_2!8217 lt!271404)))))

(declare-fun d!62105 () Bool)

(assert (=> d!62105 e!122773))

(declare-fun res!145844 () Bool)

(assert (=> d!62105 (=> (not res!145844) (not e!122773))))

(assert (=> d!62105 (= res!145844 (= (size!4194 (buf!4637 thiss!1204)) (size!4194 (buf!4637 (_2!8217 lt!271404)))))))

(declare-fun choose!16 (BitStream!7496 Bool) tuple2!15144)

(assert (=> d!62105 (= lt!271404 (choose!16 thiss!1204 lt!271279))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!62105 (validate_offset_bit!0 ((_ sign_extend 32) (size!4194 (buf!4637 thiss!1204))) ((_ sign_extend 32) (currentByte!8772 thiss!1204)) ((_ sign_extend 32) (currentBit!8767 thiss!1204)))))

(assert (=> d!62105 (= (appendBit!0 thiss!1204 lt!271279) lt!271404)))

(assert (= (and d!62105 res!145844) b!176096))

(assert (= (and b!176096 res!145843) b!176097))

(assert (= (and b!176097 res!145842) b!176098))

(assert (= (and b!176098 res!145845) b!176099))

(declare-fun m!276277 () Bool)

(assert (=> b!176097 m!276277))

(declare-fun m!276279 () Bool)

(assert (=> b!176099 m!276279))

(declare-fun m!276281 () Bool)

(assert (=> b!176099 m!276281))

(assert (=> b!176096 m!276281))

(assert (=> b!176096 m!276209))

(declare-fun m!276283 () Bool)

(assert (=> b!176098 m!276283))

(assert (=> b!176098 m!276283))

(declare-fun m!276285 () Bool)

(assert (=> b!176098 m!276285))

(declare-fun m!276287 () Bool)

(assert (=> d!62105 m!276287))

(declare-fun m!276289 () Bool)

(assert (=> d!62105 m!276289))

(assert (=> b!176014 d!62105))

(declare-fun d!62125 () Bool)

(declare-fun res!145854 () Bool)

(declare-fun e!122779 () Bool)

(assert (=> d!62125 (=> (not res!145854) (not e!122779))))

(assert (=> d!62125 (= res!145854 (= (size!4194 (buf!4637 thiss!1204)) (size!4194 (buf!4637 (_2!8217 lt!271280)))))))

(assert (=> d!62125 (= (isPrefixOf!0 thiss!1204 (_2!8217 lt!271280)) e!122779)))

(declare-fun b!176106 () Bool)

(declare-fun res!145853 () Bool)

(assert (=> b!176106 (=> (not res!145853) (not e!122779))))

(assert (=> b!176106 (= res!145853 (bvsle (bitIndex!0 (size!4194 (buf!4637 thiss!1204)) (currentByte!8772 thiss!1204) (currentBit!8767 thiss!1204)) (bitIndex!0 (size!4194 (buf!4637 (_2!8217 lt!271280))) (currentByte!8772 (_2!8217 lt!271280)) (currentBit!8767 (_2!8217 lt!271280)))))))

(declare-fun b!176107 () Bool)

(declare-fun e!122778 () Bool)

(assert (=> b!176107 (= e!122779 e!122778)))

(declare-fun res!145852 () Bool)

(assert (=> b!176107 (=> res!145852 e!122778)))

(assert (=> b!176107 (= res!145852 (= (size!4194 (buf!4637 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!176108 () Bool)

(declare-fun arrayBitRangesEq!0 (array!9504 array!9504 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!176108 (= e!122778 (arrayBitRangesEq!0 (buf!4637 thiss!1204) (buf!4637 (_2!8217 lt!271280)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4194 (buf!4637 thiss!1204)) (currentByte!8772 thiss!1204) (currentBit!8767 thiss!1204))))))

(assert (= (and d!62125 res!145854) b!176106))

(assert (= (and b!176106 res!145853) b!176107))

(assert (= (and b!176107 (not res!145852)) b!176108))

(assert (=> b!176106 m!276209))

(assert (=> b!176106 m!276207))

(assert (=> b!176108 m!276209))

(assert (=> b!176108 m!276209))

(declare-fun m!276291 () Bool)

(assert (=> b!176108 m!276291))

(assert (=> b!176016 d!62125))

(declare-fun d!62127 () Bool)

(assert (=> d!62127 (= (array_inv!3935 (buf!4637 thiss!1204)) (bvsge (size!4194 (buf!4637 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!176010 d!62127))

(declare-fun d!62129 () Bool)

(assert (=> d!62129 (= (inv!12 thiss!1204) (invariant!0 (currentBit!8767 thiss!1204) (currentByte!8772 thiss!1204) (size!4194 (buf!4637 thiss!1204))))))

(declare-fun bs!15502 () Bool)

(assert (= bs!15502 d!62129))

(assert (=> bs!15502 m!276199))

(assert (=> start!39108 d!62129))

(declare-fun d!62131 () Bool)

(assert (=> d!62131 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4194 (buf!4637 thiss!1204))) ((_ sign_extend 32) (currentByte!8772 thiss!1204)) ((_ sign_extend 32) (currentBit!8767 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4194 (buf!4637 thiss!1204))) ((_ sign_extend 32) (currentByte!8772 thiss!1204)) ((_ sign_extend 32) (currentBit!8767 thiss!1204))) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun bs!15503 () Bool)

(assert (= bs!15503 d!62131))

(assert (=> bs!15503 m!276251))

(assert (=> b!176012 d!62131))

(push 1)

