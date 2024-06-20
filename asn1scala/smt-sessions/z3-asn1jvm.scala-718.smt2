; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20022 () Bool)

(assert start!20022)

(declare-fun b!100191 () Bool)

(declare-fun res!82268 () Bool)

(declare-fun e!65568 () Bool)

(assert (=> b!100191 (=> (not res!82268) (not e!65568))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!100191 (= res!82268 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!100192 () Bool)

(declare-fun e!65567 () Bool)

(declare-datatypes ((array!4721 0))(
  ( (array!4722 (arr!2749 (Array (_ BitVec 32) (_ BitVec 8))) (size!2156 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3786 0))(
  ( (BitStream!3787 (buf!2513 array!4721) (currentByte!4959 (_ BitVec 32)) (currentBit!4954 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!8092 0))(
  ( (tuple2!8093 (_1!4301 BitStream!3786) (_2!4301 Bool)) )
))
(declare-fun lt!144858 () tuple2!8092)

(declare-fun lt!144852 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!100192 (= e!65567 (= (bitIndex!0 (size!2156 (buf!2513 (_1!4301 lt!144858))) (currentByte!4959 (_1!4301 lt!144858)) (currentBit!4954 (_1!4301 lt!144858))) lt!144852))))

(declare-fun b!100193 () Bool)

(declare-fun e!65573 () Bool)

(declare-fun lt!144856 () tuple2!8092)

(declare-fun lt!144859 () tuple2!8092)

(assert (=> b!100193 (= e!65573 (= (_2!4301 lt!144856) (_2!4301 lt!144859)))))

(declare-fun b!100194 () Bool)

(declare-datatypes ((Unit!6139 0))(
  ( (Unit!6140) )
))
(declare-datatypes ((tuple2!8094 0))(
  ( (tuple2!8095 (_1!4302 Unit!6139) (_2!4302 BitStream!3786)) )
))
(declare-fun lt!144860 () tuple2!8094)

(declare-fun lt!144861 () tuple2!8094)

(declare-fun isPrefixOf!0 (BitStream!3786 BitStream!3786) Bool)

(assert (=> b!100194 (= e!65568 (not (isPrefixOf!0 (_2!4302 lt!144860) (_2!4302 lt!144861))))))

(declare-datatypes ((tuple2!8096 0))(
  ( (tuple2!8097 (_1!4303 BitStream!3786) (_2!4303 BitStream!3786)) )
))
(declare-fun lt!144855 () tuple2!8096)

(declare-fun thiss!1305 () BitStream!3786)

(declare-fun reader!0 (BitStream!3786 BitStream!3786) tuple2!8096)

(assert (=> b!100194 (= lt!144855 (reader!0 thiss!1305 (_2!4302 lt!144861)))))

(assert (=> b!100194 e!65573))

(declare-fun res!82275 () Bool)

(assert (=> b!100194 (=> (not res!82275) (not e!65573))))

(assert (=> b!100194 (= res!82275 (= (bitIndex!0 (size!2156 (buf!2513 (_1!4301 lt!144856))) (currentByte!4959 (_1!4301 lt!144856)) (currentBit!4954 (_1!4301 lt!144856))) (bitIndex!0 (size!2156 (buf!2513 (_1!4301 lt!144859))) (currentByte!4959 (_1!4301 lt!144859)) (currentBit!4954 (_1!4301 lt!144859)))))))

(declare-fun lt!144862 () Unit!6139)

(declare-fun lt!144854 () BitStream!3786)

(declare-fun readBitPrefixLemma!0 (BitStream!3786 BitStream!3786) Unit!6139)

(assert (=> b!100194 (= lt!144862 (readBitPrefixLemma!0 lt!144854 (_2!4302 lt!144861)))))

(declare-fun readBitPure!0 (BitStream!3786) tuple2!8092)

(assert (=> b!100194 (= lt!144859 (readBitPure!0 (BitStream!3787 (buf!2513 (_2!4302 lt!144861)) (currentByte!4959 thiss!1305) (currentBit!4954 thiss!1305))))))

(assert (=> b!100194 (= lt!144856 (readBitPure!0 lt!144854))))

(assert (=> b!100194 (= lt!144854 (BitStream!3787 (buf!2513 (_2!4302 lt!144860)) (currentByte!4959 thiss!1305) (currentBit!4954 thiss!1305)))))

(declare-fun e!65571 () Bool)

(assert (=> b!100194 e!65571))

(declare-fun res!82277 () Bool)

(assert (=> b!100194 (=> (not res!82277) (not e!65571))))

(assert (=> b!100194 (= res!82277 (isPrefixOf!0 thiss!1305 (_2!4302 lt!144861)))))

(declare-fun lt!144857 () Unit!6139)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3786 BitStream!3786 BitStream!3786) Unit!6139)

(assert (=> b!100194 (= lt!144857 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4302 lt!144860) (_2!4302 lt!144861)))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3786 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8094)

(assert (=> b!100194 (= lt!144861 (appendNLeastSignificantBitsLoop!0 (_2!4302 lt!144860) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!65570 () Bool)

(assert (=> b!100194 e!65570))

(declare-fun res!82276 () Bool)

(assert (=> b!100194 (=> (not res!82276) (not e!65570))))

(assert (=> b!100194 (= res!82276 (= (size!2156 (buf!2513 thiss!1305)) (size!2156 (buf!2513 (_2!4302 lt!144860)))))))

(declare-fun lt!144851 () Bool)

(declare-fun appendBit!0 (BitStream!3786 Bool) tuple2!8094)

(assert (=> b!100194 (= lt!144860 (appendBit!0 thiss!1305 lt!144851))))

(assert (=> b!100194 (= lt!144851 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!100195 () Bool)

(declare-fun res!82269 () Bool)

(assert (=> b!100195 (=> (not res!82269) (not e!65568))))

(assert (=> b!100195 (= res!82269 (bvslt i!615 nBits!396))))

(declare-fun b!100196 () Bool)

(declare-fun res!82274 () Bool)

(assert (=> b!100196 (=> (not res!82274) (not e!65571))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!100196 (= res!82274 (invariant!0 (currentBit!4954 thiss!1305) (currentByte!4959 thiss!1305) (size!2156 (buf!2513 (_2!4302 lt!144860)))))))

(declare-fun b!100197 () Bool)

(declare-fun e!65572 () Bool)

(declare-fun array_inv!1958 (array!4721) Bool)

(assert (=> b!100197 (= e!65572 (array_inv!1958 (buf!2513 thiss!1305)))))

(declare-fun res!82271 () Bool)

(assert (=> start!20022 (=> (not res!82271) (not e!65568))))

(assert (=> start!20022 (= res!82271 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!20022 e!65568))

(assert (=> start!20022 true))

(declare-fun inv!12 (BitStream!3786) Bool)

(assert (=> start!20022 (and (inv!12 thiss!1305) e!65572)))

(declare-fun b!100198 () Bool)

(declare-fun e!65569 () Bool)

(assert (=> b!100198 (= e!65570 e!65569)))

(declare-fun res!82272 () Bool)

(assert (=> b!100198 (=> (not res!82272) (not e!65569))))

(declare-fun lt!144853 () (_ BitVec 64))

(assert (=> b!100198 (= res!82272 (= lt!144852 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!144853)))))

(assert (=> b!100198 (= lt!144852 (bitIndex!0 (size!2156 (buf!2513 (_2!4302 lt!144860))) (currentByte!4959 (_2!4302 lt!144860)) (currentBit!4954 (_2!4302 lt!144860))))))

(assert (=> b!100198 (= lt!144853 (bitIndex!0 (size!2156 (buf!2513 thiss!1305)) (currentByte!4959 thiss!1305) (currentBit!4954 thiss!1305)))))

(declare-fun b!100199 () Bool)

(declare-fun res!82273 () Bool)

(assert (=> b!100199 (=> (not res!82273) (not e!65568))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!100199 (= res!82273 (validate_offset_bits!1 ((_ sign_extend 32) (size!2156 (buf!2513 thiss!1305))) ((_ sign_extend 32) (currentByte!4959 thiss!1305)) ((_ sign_extend 32) (currentBit!4954 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun b!100200 () Bool)

(assert (=> b!100200 (= e!65569 e!65567)))

(declare-fun res!82270 () Bool)

(assert (=> b!100200 (=> (not res!82270) (not e!65567))))

(assert (=> b!100200 (= res!82270 (and (= (_2!4301 lt!144858) lt!144851) (= (_1!4301 lt!144858) (_2!4302 lt!144860))))))

(declare-fun readerFrom!0 (BitStream!3786 (_ BitVec 32) (_ BitVec 32)) BitStream!3786)

(assert (=> b!100200 (= lt!144858 (readBitPure!0 (readerFrom!0 (_2!4302 lt!144860) (currentBit!4954 thiss!1305) (currentByte!4959 thiss!1305))))))

(declare-fun b!100201 () Bool)

(declare-fun res!82267 () Bool)

(assert (=> b!100201 (=> (not res!82267) (not e!65569))))

(assert (=> b!100201 (= res!82267 (isPrefixOf!0 thiss!1305 (_2!4302 lt!144860)))))

(declare-fun b!100202 () Bool)

(assert (=> b!100202 (= e!65571 (invariant!0 (currentBit!4954 thiss!1305) (currentByte!4959 thiss!1305) (size!2156 (buf!2513 (_2!4302 lt!144861)))))))

(assert (= (and start!20022 res!82271) b!100199))

(assert (= (and b!100199 res!82273) b!100191))

(assert (= (and b!100191 res!82268) b!100195))

(assert (= (and b!100195 res!82269) b!100194))

(assert (= (and b!100194 res!82276) b!100198))

(assert (= (and b!100198 res!82272) b!100201))

(assert (= (and b!100201 res!82267) b!100200))

(assert (= (and b!100200 res!82270) b!100192))

(assert (= (and b!100194 res!82277) b!100196))

(assert (= (and b!100196 res!82274) b!100202))

(assert (= (and b!100194 res!82275) b!100193))

(assert (= start!20022 b!100197))

(declare-fun m!145571 () Bool)

(assert (=> b!100196 m!145571))

(declare-fun m!145573 () Bool)

(assert (=> b!100191 m!145573))

(declare-fun m!145575 () Bool)

(assert (=> b!100202 m!145575))

(declare-fun m!145577 () Bool)

(assert (=> b!100201 m!145577))

(declare-fun m!145579 () Bool)

(assert (=> b!100194 m!145579))

(declare-fun m!145581 () Bool)

(assert (=> b!100194 m!145581))

(declare-fun m!145583 () Bool)

(assert (=> b!100194 m!145583))

(declare-fun m!145585 () Bool)

(assert (=> b!100194 m!145585))

(declare-fun m!145587 () Bool)

(assert (=> b!100194 m!145587))

(declare-fun m!145589 () Bool)

(assert (=> b!100194 m!145589))

(declare-fun m!145591 () Bool)

(assert (=> b!100194 m!145591))

(declare-fun m!145593 () Bool)

(assert (=> b!100194 m!145593))

(declare-fun m!145595 () Bool)

(assert (=> b!100194 m!145595))

(declare-fun m!145597 () Bool)

(assert (=> b!100194 m!145597))

(declare-fun m!145599 () Bool)

(assert (=> b!100194 m!145599))

(declare-fun m!145601 () Bool)

(assert (=> start!20022 m!145601))

(declare-fun m!145603 () Bool)

(assert (=> b!100199 m!145603))

(declare-fun m!145605 () Bool)

(assert (=> b!100197 m!145605))

(declare-fun m!145607 () Bool)

(assert (=> b!100192 m!145607))

(declare-fun m!145609 () Bool)

(assert (=> b!100200 m!145609))

(assert (=> b!100200 m!145609))

(declare-fun m!145611 () Bool)

(assert (=> b!100200 m!145611))

(declare-fun m!145613 () Bool)

(assert (=> b!100198 m!145613))

(declare-fun m!145615 () Bool)

(assert (=> b!100198 m!145615))

(check-sat (not b!100197) (not b!100191) (not b!100200) (not b!100201) (not b!100194) (not start!20022) (not b!100192) (not b!100199) (not b!100196) (not b!100202) (not b!100198))
(check-sat)
(get-model)

(declare-fun d!31380 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!31380 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2156 (buf!2513 thiss!1305))) ((_ sign_extend 32) (currentByte!4959 thiss!1305)) ((_ sign_extend 32) (currentBit!4954 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2156 (buf!2513 thiss!1305))) ((_ sign_extend 32) (currentByte!4959 thiss!1305)) ((_ sign_extend 32) (currentBit!4954 thiss!1305))) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun bs!7705 () Bool)

(assert (= bs!7705 d!31380))

(declare-fun m!145663 () Bool)

(assert (=> bs!7705 m!145663))

(assert (=> b!100199 d!31380))

(declare-fun d!31382 () Bool)

(declare-datatypes ((tuple2!8106 0))(
  ( (tuple2!8107 (_1!4308 Bool) (_2!4308 BitStream!3786)) )
))
(declare-fun lt!144901 () tuple2!8106)

(declare-fun readBit!0 (BitStream!3786) tuple2!8106)

(assert (=> d!31382 (= lt!144901 (readBit!0 (readerFrom!0 (_2!4302 lt!144860) (currentBit!4954 thiss!1305) (currentByte!4959 thiss!1305))))))

(assert (=> d!31382 (= (readBitPure!0 (readerFrom!0 (_2!4302 lt!144860) (currentBit!4954 thiss!1305) (currentByte!4959 thiss!1305))) (tuple2!8093 (_2!4308 lt!144901) (_1!4308 lt!144901)))))

(declare-fun bs!7706 () Bool)

(assert (= bs!7706 d!31382))

(assert (=> bs!7706 m!145609))

(declare-fun m!145665 () Bool)

(assert (=> bs!7706 m!145665))

(assert (=> b!100200 d!31382))

(declare-fun d!31384 () Bool)

(declare-fun e!65601 () Bool)

(assert (=> d!31384 e!65601))

(declare-fun res!82314 () Bool)

(assert (=> d!31384 (=> (not res!82314) (not e!65601))))

(assert (=> d!31384 (= res!82314 (invariant!0 (currentBit!4954 (_2!4302 lt!144860)) (currentByte!4959 (_2!4302 lt!144860)) (size!2156 (buf!2513 (_2!4302 lt!144860)))))))

(assert (=> d!31384 (= (readerFrom!0 (_2!4302 lt!144860) (currentBit!4954 thiss!1305) (currentByte!4959 thiss!1305)) (BitStream!3787 (buf!2513 (_2!4302 lt!144860)) (currentByte!4959 thiss!1305) (currentBit!4954 thiss!1305)))))

(declare-fun b!100241 () Bool)

(assert (=> b!100241 (= e!65601 (invariant!0 (currentBit!4954 thiss!1305) (currentByte!4959 thiss!1305) (size!2156 (buf!2513 (_2!4302 lt!144860)))))))

(assert (= (and d!31384 res!82314) b!100241))

(declare-fun m!145667 () Bool)

(assert (=> d!31384 m!145667))

(assert (=> b!100241 m!145571))

(assert (=> b!100200 d!31384))

(declare-fun d!31386 () Bool)

(assert (=> d!31386 (= (inv!12 thiss!1305) (invariant!0 (currentBit!4954 thiss!1305) (currentByte!4959 thiss!1305) (size!2156 (buf!2513 thiss!1305))))))

(declare-fun bs!7707 () Bool)

(assert (= bs!7707 d!31386))

(declare-fun m!145669 () Bool)

(assert (=> bs!7707 m!145669))

(assert (=> start!20022 d!31386))

(declare-fun d!31388 () Bool)

(declare-fun e!65604 () Bool)

(assert (=> d!31388 e!65604))

(declare-fun res!82320 () Bool)

(assert (=> d!31388 (=> (not res!82320) (not e!65604))))

(declare-fun lt!144915 () (_ BitVec 64))

(declare-fun lt!144918 () (_ BitVec 64))

(declare-fun lt!144914 () (_ BitVec 64))

(assert (=> d!31388 (= res!82320 (= lt!144918 (bvsub lt!144914 lt!144915)))))

(assert (=> d!31388 (or (= (bvand lt!144914 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!144915 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!144914 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!144914 lt!144915) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!31388 (= lt!144915 (remainingBits!0 ((_ sign_extend 32) (size!2156 (buf!2513 (_2!4302 lt!144860)))) ((_ sign_extend 32) (currentByte!4959 (_2!4302 lt!144860))) ((_ sign_extend 32) (currentBit!4954 (_2!4302 lt!144860)))))))

(declare-fun lt!144916 () (_ BitVec 64))

(declare-fun lt!144917 () (_ BitVec 64))

(assert (=> d!31388 (= lt!144914 (bvmul lt!144916 lt!144917))))

(assert (=> d!31388 (or (= lt!144916 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!144917 (bvsdiv (bvmul lt!144916 lt!144917) lt!144916)))))

(assert (=> d!31388 (= lt!144917 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!31388 (= lt!144916 ((_ sign_extend 32) (size!2156 (buf!2513 (_2!4302 lt!144860)))))))

(assert (=> d!31388 (= lt!144918 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4959 (_2!4302 lt!144860))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4954 (_2!4302 lt!144860)))))))

(assert (=> d!31388 (invariant!0 (currentBit!4954 (_2!4302 lt!144860)) (currentByte!4959 (_2!4302 lt!144860)) (size!2156 (buf!2513 (_2!4302 lt!144860))))))

(assert (=> d!31388 (= (bitIndex!0 (size!2156 (buf!2513 (_2!4302 lt!144860))) (currentByte!4959 (_2!4302 lt!144860)) (currentBit!4954 (_2!4302 lt!144860))) lt!144918)))

(declare-fun b!100246 () Bool)

(declare-fun res!82319 () Bool)

(assert (=> b!100246 (=> (not res!82319) (not e!65604))))

(assert (=> b!100246 (= res!82319 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!144918))))

(declare-fun b!100247 () Bool)

(declare-fun lt!144919 () (_ BitVec 64))

(assert (=> b!100247 (= e!65604 (bvsle lt!144918 (bvmul lt!144919 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!100247 (or (= lt!144919 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!144919 #b0000000000000000000000000000000000000000000000000000000000001000) lt!144919)))))

(assert (=> b!100247 (= lt!144919 ((_ sign_extend 32) (size!2156 (buf!2513 (_2!4302 lt!144860)))))))

(assert (= (and d!31388 res!82320) b!100246))

(assert (= (and b!100246 res!82319) b!100247))

(declare-fun m!145671 () Bool)

(assert (=> d!31388 m!145671))

(assert (=> d!31388 m!145667))

(assert (=> b!100198 d!31388))

(declare-fun d!31390 () Bool)

(declare-fun e!65605 () Bool)

(assert (=> d!31390 e!65605))

(declare-fun res!82322 () Bool)

(assert (=> d!31390 (=> (not res!82322) (not e!65605))))

(declare-fun lt!144920 () (_ BitVec 64))

(declare-fun lt!144921 () (_ BitVec 64))

(declare-fun lt!144924 () (_ BitVec 64))

(assert (=> d!31390 (= res!82322 (= lt!144924 (bvsub lt!144920 lt!144921)))))

(assert (=> d!31390 (or (= (bvand lt!144920 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!144921 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!144920 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!144920 lt!144921) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!31390 (= lt!144921 (remainingBits!0 ((_ sign_extend 32) (size!2156 (buf!2513 thiss!1305))) ((_ sign_extend 32) (currentByte!4959 thiss!1305)) ((_ sign_extend 32) (currentBit!4954 thiss!1305))))))

(declare-fun lt!144922 () (_ BitVec 64))

(declare-fun lt!144923 () (_ BitVec 64))

(assert (=> d!31390 (= lt!144920 (bvmul lt!144922 lt!144923))))

(assert (=> d!31390 (or (= lt!144922 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!144923 (bvsdiv (bvmul lt!144922 lt!144923) lt!144922)))))

(assert (=> d!31390 (= lt!144923 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!31390 (= lt!144922 ((_ sign_extend 32) (size!2156 (buf!2513 thiss!1305))))))

(assert (=> d!31390 (= lt!144924 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4959 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4954 thiss!1305))))))

(assert (=> d!31390 (invariant!0 (currentBit!4954 thiss!1305) (currentByte!4959 thiss!1305) (size!2156 (buf!2513 thiss!1305)))))

(assert (=> d!31390 (= (bitIndex!0 (size!2156 (buf!2513 thiss!1305)) (currentByte!4959 thiss!1305) (currentBit!4954 thiss!1305)) lt!144924)))

(declare-fun b!100248 () Bool)

(declare-fun res!82321 () Bool)

(assert (=> b!100248 (=> (not res!82321) (not e!65605))))

(assert (=> b!100248 (= res!82321 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!144924))))

(declare-fun b!100249 () Bool)

(declare-fun lt!144925 () (_ BitVec 64))

(assert (=> b!100249 (= e!65605 (bvsle lt!144924 (bvmul lt!144925 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!100249 (or (= lt!144925 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!144925 #b0000000000000000000000000000000000000000000000000000000000001000) lt!144925)))))

(assert (=> b!100249 (= lt!144925 ((_ sign_extend 32) (size!2156 (buf!2513 thiss!1305))))))

(assert (= (and d!31390 res!82322) b!100248))

(assert (= (and b!100248 res!82321) b!100249))

(assert (=> d!31390 m!145663))

(assert (=> d!31390 m!145669))

(assert (=> b!100198 d!31390))

(declare-fun d!31392 () Bool)

(assert (=> d!31392 (= (array_inv!1958 (buf!2513 thiss!1305)) (bvsge (size!2156 (buf!2513 thiss!1305)) #b00000000000000000000000000000000))))

(assert (=> b!100197 d!31392))

(declare-fun d!31394 () Bool)

(assert (=> d!31394 (= (invariant!0 (currentBit!4954 thiss!1305) (currentByte!4959 thiss!1305) (size!2156 (buf!2513 (_2!4302 lt!144860)))) (and (bvsge (currentBit!4954 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!4954 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!4959 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!4959 thiss!1305) (size!2156 (buf!2513 (_2!4302 lt!144860)))) (and (= (currentBit!4954 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!4959 thiss!1305) (size!2156 (buf!2513 (_2!4302 lt!144860))))))))))

(assert (=> b!100196 d!31394))

(declare-fun d!31396 () Bool)

(declare-fun e!65608 () Bool)

(assert (=> d!31396 e!65608))

(declare-fun res!82325 () Bool)

(assert (=> d!31396 (=> (not res!82325) (not e!65608))))

(declare-fun lt!144935 () tuple2!8092)

(declare-fun lt!144937 () tuple2!8092)

(assert (=> d!31396 (= res!82325 (= (bitIndex!0 (size!2156 (buf!2513 (_1!4301 lt!144935))) (currentByte!4959 (_1!4301 lt!144935)) (currentBit!4954 (_1!4301 lt!144935))) (bitIndex!0 (size!2156 (buf!2513 (_1!4301 lt!144937))) (currentByte!4959 (_1!4301 lt!144937)) (currentBit!4954 (_1!4301 lt!144937)))))))

(declare-fun lt!144934 () Unit!6139)

(declare-fun lt!144936 () BitStream!3786)

(declare-fun choose!50 (BitStream!3786 BitStream!3786 BitStream!3786 tuple2!8092 tuple2!8092 BitStream!3786 Bool tuple2!8092 tuple2!8092 BitStream!3786 Bool) Unit!6139)

(assert (=> d!31396 (= lt!144934 (choose!50 lt!144854 (_2!4302 lt!144861) lt!144936 lt!144935 (tuple2!8093 (_1!4301 lt!144935) (_2!4301 lt!144935)) (_1!4301 lt!144935) (_2!4301 lt!144935) lt!144937 (tuple2!8093 (_1!4301 lt!144937) (_2!4301 lt!144937)) (_1!4301 lt!144937) (_2!4301 lt!144937)))))

(assert (=> d!31396 (= lt!144937 (readBitPure!0 lt!144936))))

(assert (=> d!31396 (= lt!144935 (readBitPure!0 lt!144854))))

(assert (=> d!31396 (= lt!144936 (BitStream!3787 (buf!2513 (_2!4302 lt!144861)) (currentByte!4959 lt!144854) (currentBit!4954 lt!144854)))))

(assert (=> d!31396 (invariant!0 (currentBit!4954 lt!144854) (currentByte!4959 lt!144854) (size!2156 (buf!2513 (_2!4302 lt!144861))))))

(assert (=> d!31396 (= (readBitPrefixLemma!0 lt!144854 (_2!4302 lt!144861)) lt!144934)))

(declare-fun b!100252 () Bool)

(assert (=> b!100252 (= e!65608 (= (_2!4301 lt!144935) (_2!4301 lt!144937)))))

(assert (= (and d!31396 res!82325) b!100252))

(declare-fun m!145673 () Bool)

(assert (=> d!31396 m!145673))

(declare-fun m!145675 () Bool)

(assert (=> d!31396 m!145675))

(declare-fun m!145677 () Bool)

(assert (=> d!31396 m!145677))

(declare-fun m!145679 () Bool)

(assert (=> d!31396 m!145679))

(declare-fun m!145681 () Bool)

(assert (=> d!31396 m!145681))

(assert (=> d!31396 m!145579))

(assert (=> b!100194 d!31396))

(declare-fun d!31406 () Bool)

(declare-fun e!65686 () Bool)

(assert (=> d!31406 e!65686))

(declare-fun res!82444 () Bool)

(assert (=> d!31406 (=> (not res!82444) (not e!65686))))

(declare-fun lt!145308 () tuple2!8094)

(assert (=> d!31406 (= res!82444 (= (size!2156 (buf!2513 (_2!4302 lt!144860))) (size!2156 (buf!2513 (_2!4302 lt!145308)))))))

(declare-fun e!65690 () tuple2!8094)

(assert (=> d!31406 (= lt!145308 e!65690)))

(declare-fun c!6283 () Bool)

(assert (=> d!31406 (= c!6283 (bvslt (bvadd #b00000000000000000000000000000001 i!615) nBits!396))))

(assert (=> d!31406 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)) (bvsle (bvadd #b00000000000000000000000000000001 i!615) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!31406 (= (appendNLeastSignificantBitsLoop!0 (_2!4302 lt!144860) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) lt!145308)))

(declare-fun b!100391 () Bool)

(declare-fun res!82437 () Bool)

(assert (=> b!100391 (=> (not res!82437) (not e!65686))))

(declare-fun lt!145325 () (_ BitVec 64))

(declare-fun lt!145342 () (_ BitVec 64))

(assert (=> b!100391 (= res!82437 (= (bitIndex!0 (size!2156 (buf!2513 (_2!4302 lt!145308))) (currentByte!4959 (_2!4302 lt!145308)) (currentBit!4954 (_2!4302 lt!145308))) (bvadd lt!145342 lt!145325)))))

(assert (=> b!100391 (or (not (= (bvand lt!145342 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!145325 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!145342 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!145342 lt!145325) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!100391 (= lt!145325 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!100391 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!100391 (= lt!145342 (bitIndex!0 (size!2156 (buf!2513 (_2!4302 lt!144860))) (currentByte!4959 (_2!4302 lt!144860)) (currentBit!4954 (_2!4302 lt!144860))))))

(declare-fun b!100392 () Bool)

(declare-fun lt!145334 () tuple2!8094)

(declare-fun Unit!6149 () Unit!6139)

(assert (=> b!100392 (= e!65690 (tuple2!8095 Unit!6149 (_2!4302 lt!145334)))))

(declare-fun lt!145352 () Bool)

(assert (=> b!100392 (= lt!145352 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!145348 () tuple2!8094)

(assert (=> b!100392 (= lt!145348 (appendBit!0 (_2!4302 lt!144860) lt!145352))))

(declare-fun res!82445 () Bool)

(assert (=> b!100392 (= res!82445 (= (size!2156 (buf!2513 (_2!4302 lt!144860))) (size!2156 (buf!2513 (_2!4302 lt!145348)))))))

(declare-fun e!65688 () Bool)

(assert (=> b!100392 (=> (not res!82445) (not e!65688))))

(assert (=> b!100392 e!65688))

(declare-fun lt!145328 () tuple2!8094)

(assert (=> b!100392 (= lt!145328 lt!145348)))

(assert (=> b!100392 (= lt!145334 (appendNLeastSignificantBitsLoop!0 (_2!4302 lt!145328) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))))

(declare-fun lt!145323 () Unit!6139)

(assert (=> b!100392 (= lt!145323 (lemmaIsPrefixTransitive!0 (_2!4302 lt!144860) (_2!4302 lt!145328) (_2!4302 lt!145334)))))

(declare-fun call!1252 () Bool)

(assert (=> b!100392 call!1252))

(declare-fun lt!145316 () Unit!6139)

(assert (=> b!100392 (= lt!145316 lt!145323)))

(assert (=> b!100392 (invariant!0 (currentBit!4954 (_2!4302 lt!144860)) (currentByte!4959 (_2!4302 lt!144860)) (size!2156 (buf!2513 (_2!4302 lt!145328))))))

(declare-fun lt!145313 () BitStream!3786)

(assert (=> b!100392 (= lt!145313 (BitStream!3787 (buf!2513 (_2!4302 lt!145328)) (currentByte!4959 (_2!4302 lt!144860)) (currentBit!4954 (_2!4302 lt!144860))))))

(assert (=> b!100392 (invariant!0 (currentBit!4954 lt!145313) (currentByte!4959 lt!145313) (size!2156 (buf!2513 (_2!4302 lt!145334))))))

(declare-fun lt!145318 () BitStream!3786)

(assert (=> b!100392 (= lt!145318 (BitStream!3787 (buf!2513 (_2!4302 lt!145334)) (currentByte!4959 lt!145313) (currentBit!4954 lt!145313)))))

(declare-fun lt!145312 () tuple2!8092)

(assert (=> b!100392 (= lt!145312 (readBitPure!0 lt!145313))))

(declare-fun lt!145321 () tuple2!8092)

(assert (=> b!100392 (= lt!145321 (readBitPure!0 lt!145318))))

(declare-fun lt!145319 () Unit!6139)

(assert (=> b!100392 (= lt!145319 (readBitPrefixLemma!0 lt!145313 (_2!4302 lt!145334)))))

(declare-fun res!82442 () Bool)

(assert (=> b!100392 (= res!82442 (= (bitIndex!0 (size!2156 (buf!2513 (_1!4301 lt!145312))) (currentByte!4959 (_1!4301 lt!145312)) (currentBit!4954 (_1!4301 lt!145312))) (bitIndex!0 (size!2156 (buf!2513 (_1!4301 lt!145321))) (currentByte!4959 (_1!4301 lt!145321)) (currentBit!4954 (_1!4301 lt!145321)))))))

(declare-fun e!65687 () Bool)

(assert (=> b!100392 (=> (not res!82442) (not e!65687))))

(assert (=> b!100392 e!65687))

(declare-fun lt!145332 () Unit!6139)

(assert (=> b!100392 (= lt!145332 lt!145319)))

(declare-fun lt!145347 () tuple2!8096)

(assert (=> b!100392 (= lt!145347 (reader!0 (_2!4302 lt!144860) (_2!4302 lt!145334)))))

(declare-fun lt!145326 () tuple2!8096)

(assert (=> b!100392 (= lt!145326 (reader!0 (_2!4302 lt!145328) (_2!4302 lt!145334)))))

(declare-fun lt!145351 () tuple2!8092)

(assert (=> b!100392 (= lt!145351 (readBitPure!0 (_1!4303 lt!145347)))))

(assert (=> b!100392 (= (_2!4301 lt!145351) lt!145352)))

(declare-fun lt!145331 () Unit!6139)

(declare-fun Unit!6150 () Unit!6139)

(assert (=> b!100392 (= lt!145331 Unit!6150)))

(declare-fun lt!145315 () (_ BitVec 64))

(assert (=> b!100392 (= lt!145315 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(declare-fun lt!145335 () (_ BitVec 64))

(assert (=> b!100392 (= lt!145335 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(declare-fun lt!145344 () Unit!6139)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!3786 array!4721 (_ BitVec 64)) Unit!6139)

(assert (=> b!100392 (= lt!145344 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4302 lt!144860) (buf!2513 (_2!4302 lt!145334)) lt!145335))))

(assert (=> b!100392 (validate_offset_bits!1 ((_ sign_extend 32) (size!2156 (buf!2513 (_2!4302 lt!145334)))) ((_ sign_extend 32) (currentByte!4959 (_2!4302 lt!144860))) ((_ sign_extend 32) (currentBit!4954 (_2!4302 lt!144860))) lt!145335)))

(declare-fun lt!145324 () Unit!6139)

(assert (=> b!100392 (= lt!145324 lt!145344)))

(declare-datatypes ((tuple2!8108 0))(
  ( (tuple2!8109 (_1!4309 BitStream!3786) (_2!4309 (_ BitVec 64))) )
))
(declare-fun lt!145341 () tuple2!8108)

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!3786 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!8108)

(assert (=> b!100392 (= lt!145341 (readNLeastSignificantBitsLoopPure!0 (_1!4303 lt!145347) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!145315))))

(declare-fun lt!145350 () (_ BitVec 64))

(assert (=> b!100392 (= lt!145350 ((_ sign_extend 32) (bvsub (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b00000000000000000000000000000001)))))

(declare-fun lt!145311 () Unit!6139)

(assert (=> b!100392 (= lt!145311 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4302 lt!145328) (buf!2513 (_2!4302 lt!145334)) lt!145350))))

(assert (=> b!100392 (validate_offset_bits!1 ((_ sign_extend 32) (size!2156 (buf!2513 (_2!4302 lt!145334)))) ((_ sign_extend 32) (currentByte!4959 (_2!4302 lt!145328))) ((_ sign_extend 32) (currentBit!4954 (_2!4302 lt!145328))) lt!145350)))

(declare-fun lt!145309 () Unit!6139)

(assert (=> b!100392 (= lt!145309 lt!145311)))

(declare-fun lt!145338 () tuple2!8108)

(assert (=> b!100392 (= lt!145338 (readNLeastSignificantBitsLoopPure!0 (_1!4303 lt!145326) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!145315 (ite (_2!4301 lt!145351) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!145329 () tuple2!8108)

(assert (=> b!100392 (= lt!145329 (readNLeastSignificantBitsLoopPure!0 (_1!4303 lt!145347) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!145315))))

(declare-fun c!6284 () Bool)

(assert (=> b!100392 (= c!6284 (_2!4301 (readBitPure!0 (_1!4303 lt!145347))))))

(declare-fun lt!145339 () tuple2!8108)

(declare-fun e!65685 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!3786 (_ BitVec 64)) BitStream!3786)

(assert (=> b!100392 (= lt!145339 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4303 lt!145347) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!145315 e!65685)))))

(declare-fun lt!145333 () Unit!6139)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!3786 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!6139)

(assert (=> b!100392 (= lt!145333 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4303 lt!145347) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!145315))))

(assert (=> b!100392 (and (= (_2!4309 lt!145329) (_2!4309 lt!145339)) (= (_1!4309 lt!145329) (_1!4309 lt!145339)))))

(declare-fun lt!145317 () Unit!6139)

(assert (=> b!100392 (= lt!145317 lt!145333)))

(assert (=> b!100392 (= (_1!4303 lt!145347) (withMovedBitIndex!0 (_2!4303 lt!145347) (bvsub (bitIndex!0 (size!2156 (buf!2513 (_2!4302 lt!144860))) (currentByte!4959 (_2!4302 lt!144860)) (currentBit!4954 (_2!4302 lt!144860))) (bitIndex!0 (size!2156 (buf!2513 (_2!4302 lt!145334))) (currentByte!4959 (_2!4302 lt!145334)) (currentBit!4954 (_2!4302 lt!145334))))))))

(declare-fun lt!145322 () Unit!6139)

(declare-fun Unit!6151 () Unit!6139)

(assert (=> b!100392 (= lt!145322 Unit!6151)))

(assert (=> b!100392 (= (_1!4303 lt!145326) (withMovedBitIndex!0 (_2!4303 lt!145326) (bvsub (bitIndex!0 (size!2156 (buf!2513 (_2!4302 lt!145328))) (currentByte!4959 (_2!4302 lt!145328)) (currentBit!4954 (_2!4302 lt!145328))) (bitIndex!0 (size!2156 (buf!2513 (_2!4302 lt!145334))) (currentByte!4959 (_2!4302 lt!145334)) (currentBit!4954 (_2!4302 lt!145334))))))))

(declare-fun lt!145330 () Unit!6139)

(declare-fun Unit!6152 () Unit!6139)

(assert (=> b!100392 (= lt!145330 Unit!6152)))

(assert (=> b!100392 (= (bitIndex!0 (size!2156 (buf!2513 (_2!4302 lt!144860))) (currentByte!4959 (_2!4302 lt!144860)) (currentBit!4954 (_2!4302 lt!144860))) (bvsub (bitIndex!0 (size!2156 (buf!2513 (_2!4302 lt!145328))) (currentByte!4959 (_2!4302 lt!145328)) (currentBit!4954 (_2!4302 lt!145328))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!145337 () Unit!6139)

(declare-fun Unit!6154 () Unit!6139)

(assert (=> b!100392 (= lt!145337 Unit!6154)))

(assert (=> b!100392 (= (_2!4309 lt!145341) (_2!4309 lt!145338))))

(declare-fun lt!145327 () Unit!6139)

(declare-fun Unit!6155 () Unit!6139)

(assert (=> b!100392 (= lt!145327 Unit!6155)))

(assert (=> b!100392 (= (_1!4309 lt!145341) (_2!4303 lt!145347))))

(declare-fun b!100393 () Bool)

(declare-fun res!82443 () Bool)

(assert (=> b!100393 (= res!82443 (= (bitIndex!0 (size!2156 (buf!2513 (_2!4302 lt!145348))) (currentByte!4959 (_2!4302 lt!145348)) (currentBit!4954 (_2!4302 lt!145348))) (bvadd (bitIndex!0 (size!2156 (buf!2513 (_2!4302 lt!144860))) (currentByte!4959 (_2!4302 lt!144860)) (currentBit!4954 (_2!4302 lt!144860))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!100393 (=> (not res!82443) (not e!65688))))

(declare-fun b!100394 () Bool)

(declare-fun res!82438 () Bool)

(assert (=> b!100394 (= res!82438 (isPrefixOf!0 (_2!4302 lt!144860) (_2!4302 lt!145348)))))

(assert (=> b!100394 (=> (not res!82438) (not e!65688))))

(declare-fun b!100395 () Bool)

(declare-fun e!65689 () Bool)

(declare-fun lt!145346 () (_ BitVec 64))

(assert (=> b!100395 (= e!65689 (validate_offset_bits!1 ((_ sign_extend 32) (size!2156 (buf!2513 (_2!4302 lt!144860)))) ((_ sign_extend 32) (currentByte!4959 (_2!4302 lt!144860))) ((_ sign_extend 32) (currentBit!4954 (_2!4302 lt!144860))) lt!145346))))

(declare-fun lt!145336 () tuple2!8096)

(declare-fun lt!145349 () tuple2!8108)

(declare-fun b!100396 () Bool)

(assert (=> b!100396 (= e!65686 (and (= (_2!4309 lt!145349) v!199) (= (_1!4309 lt!145349) (_2!4303 lt!145336))))))

(declare-fun lt!145314 () (_ BitVec 64))

(assert (=> b!100396 (= lt!145349 (readNLeastSignificantBitsLoopPure!0 (_1!4303 lt!145336) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!145314))))

(declare-fun lt!145320 () Unit!6139)

(declare-fun lt!145345 () Unit!6139)

(assert (=> b!100396 (= lt!145320 lt!145345)))

(assert (=> b!100396 (validate_offset_bits!1 ((_ sign_extend 32) (size!2156 (buf!2513 (_2!4302 lt!145308)))) ((_ sign_extend 32) (currentByte!4959 (_2!4302 lt!144860))) ((_ sign_extend 32) (currentBit!4954 (_2!4302 lt!144860))) lt!145346)))

(assert (=> b!100396 (= lt!145345 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4302 lt!144860) (buf!2513 (_2!4302 lt!145308)) lt!145346))))

(assert (=> b!100396 e!65689))

(declare-fun res!82440 () Bool)

(assert (=> b!100396 (=> (not res!82440) (not e!65689))))

(assert (=> b!100396 (= res!82440 (and (= (size!2156 (buf!2513 (_2!4302 lt!144860))) (size!2156 (buf!2513 (_2!4302 lt!145308)))) (bvsge lt!145346 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!100396 (= lt!145346 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!100396 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!100396 (= lt!145314 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(assert (=> b!100396 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!100396 (= lt!145336 (reader!0 (_2!4302 lt!144860) (_2!4302 lt!145308)))))

(declare-fun b!100397 () Bool)

(assert (=> b!100397 (= e!65687 (= (_2!4301 lt!145312) (_2!4301 lt!145321)))))

(declare-fun b!100398 () Bool)

(declare-fun lt!145340 () Unit!6139)

(assert (=> b!100398 (= e!65690 (tuple2!8095 lt!145340 (_2!4302 lt!144860)))))

(declare-fun lt!145343 () BitStream!3786)

(assert (=> b!100398 (= lt!145343 (_2!4302 lt!144860))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!3786) Unit!6139)

(assert (=> b!100398 (= lt!145340 (lemmaIsPrefixRefl!0 lt!145343))))

(assert (=> b!100398 call!1252))

(declare-fun b!100399 () Bool)

(declare-fun lt!145310 () tuple2!8092)

(assert (=> b!100399 (= lt!145310 (readBitPure!0 (readerFrom!0 (_2!4302 lt!145348) (currentBit!4954 (_2!4302 lt!144860)) (currentByte!4959 (_2!4302 lt!144860)))))))

(declare-fun res!82439 () Bool)

(assert (=> b!100399 (= res!82439 (and (= (_2!4301 lt!145310) lt!145352) (= (_1!4301 lt!145310) (_2!4302 lt!145348))))))

(declare-fun e!65684 () Bool)

(assert (=> b!100399 (=> (not res!82439) (not e!65684))))

(assert (=> b!100399 (= e!65688 e!65684)))

(declare-fun b!100400 () Bool)

(assert (=> b!100400 (= e!65685 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))))))

(declare-fun bm!1249 () Bool)

(assert (=> bm!1249 (= call!1252 (isPrefixOf!0 (ite c!6283 (_2!4302 lt!144860) lt!145343) (ite c!6283 (_2!4302 lt!145334) lt!145343)))))

(declare-fun b!100401 () Bool)

(declare-fun res!82441 () Bool)

(assert (=> b!100401 (=> (not res!82441) (not e!65686))))

(assert (=> b!100401 (= res!82441 (isPrefixOf!0 (_2!4302 lt!144860) (_2!4302 lt!145308)))))

(declare-fun b!100402 () Bool)

(assert (=> b!100402 (= e!65684 (= (bitIndex!0 (size!2156 (buf!2513 (_1!4301 lt!145310))) (currentByte!4959 (_1!4301 lt!145310)) (currentBit!4954 (_1!4301 lt!145310))) (bitIndex!0 (size!2156 (buf!2513 (_2!4302 lt!145348))) (currentByte!4959 (_2!4302 lt!145348)) (currentBit!4954 (_2!4302 lt!145348)))))))

(declare-fun b!100403 () Bool)

(assert (=> b!100403 (= e!65685 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (= (and d!31406 c!6283) b!100392))

(assert (= (and d!31406 (not c!6283)) b!100398))

(assert (= (and b!100392 res!82445) b!100393))

(assert (= (and b!100393 res!82443) b!100394))

(assert (= (and b!100394 res!82438) b!100399))

(assert (= (and b!100399 res!82439) b!100402))

(assert (= (and b!100392 res!82442) b!100397))

(assert (= (and b!100392 c!6284) b!100400))

(assert (= (and b!100392 (not c!6284)) b!100403))

(assert (= (or b!100392 b!100398) bm!1249))

(assert (= (and d!31406 res!82444) b!100391))

(assert (= (and b!100391 res!82437) b!100401))

(assert (= (and b!100401 res!82441) b!100396))

(assert (= (and b!100396 res!82440) b!100395))

(declare-fun m!145857 () Bool)

(assert (=> b!100402 m!145857))

(declare-fun m!145859 () Bool)

(assert (=> b!100402 m!145859))

(declare-fun m!145861 () Bool)

(assert (=> b!100396 m!145861))

(declare-fun m!145863 () Bool)

(assert (=> b!100396 m!145863))

(declare-fun m!145865 () Bool)

(assert (=> b!100396 m!145865))

(declare-fun m!145867 () Bool)

(assert (=> b!100396 m!145867))

(declare-fun m!145869 () Bool)

(assert (=> b!100396 m!145869))

(declare-fun m!145871 () Bool)

(assert (=> b!100401 m!145871))

(declare-fun m!145873 () Bool)

(assert (=> b!100391 m!145873))

(assert (=> b!100391 m!145613))

(declare-fun m!145875 () Bool)

(assert (=> b!100395 m!145875))

(assert (=> b!100393 m!145859))

(assert (=> b!100393 m!145613))

(assert (=> b!100392 m!145869))

(declare-fun m!145877 () Bool)

(assert (=> b!100392 m!145877))

(declare-fun m!145879 () Bool)

(assert (=> b!100392 m!145879))

(declare-fun m!145881 () Bool)

(assert (=> b!100392 m!145881))

(declare-fun m!145883 () Bool)

(assert (=> b!100392 m!145883))

(declare-fun m!145885 () Bool)

(assert (=> b!100392 m!145885))

(declare-fun m!145887 () Bool)

(assert (=> b!100392 m!145887))

(declare-fun m!145889 () Bool)

(assert (=> b!100392 m!145889))

(declare-fun m!145891 () Bool)

(assert (=> b!100392 m!145891))

(declare-fun m!145893 () Bool)

(assert (=> b!100392 m!145893))

(declare-fun m!145895 () Bool)

(assert (=> b!100392 m!145895))

(declare-fun m!145897 () Bool)

(assert (=> b!100392 m!145897))

(declare-fun m!145899 () Bool)

(assert (=> b!100392 m!145899))

(declare-fun m!145901 () Bool)

(assert (=> b!100392 m!145901))

(declare-fun m!145903 () Bool)

(assert (=> b!100392 m!145903))

(declare-fun m!145905 () Bool)

(assert (=> b!100392 m!145905))

(declare-fun m!145907 () Bool)

(assert (=> b!100392 m!145907))

(declare-fun m!145909 () Bool)

(assert (=> b!100392 m!145909))

(declare-fun m!145911 () Bool)

(assert (=> b!100392 m!145911))

(declare-fun m!145913 () Bool)

(assert (=> b!100392 m!145913))

(declare-fun m!145915 () Bool)

(assert (=> b!100392 m!145915))

(declare-fun m!145917 () Bool)

(assert (=> b!100392 m!145917))

(assert (=> b!100392 m!145613))

(declare-fun m!145919 () Bool)

(assert (=> b!100392 m!145919))

(declare-fun m!145921 () Bool)

(assert (=> b!100392 m!145921))

(declare-fun m!145923 () Bool)

(assert (=> b!100392 m!145923))

(assert (=> b!100392 m!145911))

(declare-fun m!145925 () Bool)

(assert (=> b!100392 m!145925))

(declare-fun m!145927 () Bool)

(assert (=> b!100392 m!145927))

(declare-fun m!145929 () Bool)

(assert (=> b!100398 m!145929))

(declare-fun m!145931 () Bool)

(assert (=> b!100399 m!145931))

(assert (=> b!100399 m!145931))

(declare-fun m!145933 () Bool)

(assert (=> b!100399 m!145933))

(declare-fun m!145935 () Bool)

(assert (=> b!100394 m!145935))

(declare-fun m!145937 () Bool)

(assert (=> bm!1249 m!145937))

(assert (=> b!100194 d!31406))

(declare-fun d!31452 () Bool)

(declare-fun res!82452 () Bool)

(declare-fun e!65697 () Bool)

(assert (=> d!31452 (=> (not res!82452) (not e!65697))))

(assert (=> d!31452 (= res!82452 (= (size!2156 (buf!2513 (_2!4302 lt!144860))) (size!2156 (buf!2513 (_2!4302 lt!144861)))))))

(assert (=> d!31452 (= (isPrefixOf!0 (_2!4302 lt!144860) (_2!4302 lt!144861)) e!65697)))

(declare-fun b!100414 () Bool)

(declare-fun res!82453 () Bool)

(assert (=> b!100414 (=> (not res!82453) (not e!65697))))

(assert (=> b!100414 (= res!82453 (bvsle (bitIndex!0 (size!2156 (buf!2513 (_2!4302 lt!144860))) (currentByte!4959 (_2!4302 lt!144860)) (currentBit!4954 (_2!4302 lt!144860))) (bitIndex!0 (size!2156 (buf!2513 (_2!4302 lt!144861))) (currentByte!4959 (_2!4302 lt!144861)) (currentBit!4954 (_2!4302 lt!144861)))))))

(declare-fun b!100415 () Bool)

(declare-fun e!65698 () Bool)

(assert (=> b!100415 (= e!65697 e!65698)))

(declare-fun res!82454 () Bool)

(assert (=> b!100415 (=> res!82454 e!65698)))

(assert (=> b!100415 (= res!82454 (= (size!2156 (buf!2513 (_2!4302 lt!144860))) #b00000000000000000000000000000000))))

(declare-fun b!100416 () Bool)

(declare-fun arrayBitRangesEq!0 (array!4721 array!4721 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!100416 (= e!65698 (arrayBitRangesEq!0 (buf!2513 (_2!4302 lt!144860)) (buf!2513 (_2!4302 lt!144861)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2156 (buf!2513 (_2!4302 lt!144860))) (currentByte!4959 (_2!4302 lt!144860)) (currentBit!4954 (_2!4302 lt!144860)))))))

(assert (= (and d!31452 res!82452) b!100414))

(assert (= (and b!100414 res!82453) b!100415))

(assert (= (and b!100415 (not res!82454)) b!100416))

(assert (=> b!100414 m!145613))

(declare-fun m!145939 () Bool)

(assert (=> b!100414 m!145939))

(assert (=> b!100416 m!145613))

(assert (=> b!100416 m!145613))

(declare-fun m!145941 () Bool)

(assert (=> b!100416 m!145941))

(assert (=> b!100194 d!31452))

(declare-fun d!31454 () Bool)

(assert (=> d!31454 (isPrefixOf!0 thiss!1305 (_2!4302 lt!144861))))

(declare-fun lt!145395 () Unit!6139)

(declare-fun choose!30 (BitStream!3786 BitStream!3786 BitStream!3786) Unit!6139)

(assert (=> d!31454 (= lt!145395 (choose!30 thiss!1305 (_2!4302 lt!144860) (_2!4302 lt!144861)))))

(assert (=> d!31454 (isPrefixOf!0 thiss!1305 (_2!4302 lt!144860))))

(assert (=> d!31454 (= (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4302 lt!144860) (_2!4302 lt!144861)) lt!145395)))

(declare-fun bs!7713 () Bool)

(assert (= bs!7713 d!31454))

(assert (=> bs!7713 m!145591))

(declare-fun m!145943 () Bool)

(assert (=> bs!7713 m!145943))

(assert (=> bs!7713 m!145577))

(assert (=> b!100194 d!31454))

(declare-fun d!31456 () Bool)

(declare-fun res!82461 () Bool)

(declare-fun e!65701 () Bool)

(assert (=> d!31456 (=> (not res!82461) (not e!65701))))

(assert (=> d!31456 (= res!82461 (= (size!2156 (buf!2513 thiss!1305)) (size!2156 (buf!2513 (_2!4302 lt!144861)))))))

(assert (=> d!31456 (= (isPrefixOf!0 thiss!1305 (_2!4302 lt!144861)) e!65701)))

(declare-fun b!100423 () Bool)

(declare-fun res!82462 () Bool)

(assert (=> b!100423 (=> (not res!82462) (not e!65701))))

(assert (=> b!100423 (= res!82462 (bvsle (bitIndex!0 (size!2156 (buf!2513 thiss!1305)) (currentByte!4959 thiss!1305) (currentBit!4954 thiss!1305)) (bitIndex!0 (size!2156 (buf!2513 (_2!4302 lt!144861))) (currentByte!4959 (_2!4302 lt!144861)) (currentBit!4954 (_2!4302 lt!144861)))))))

(declare-fun b!100424 () Bool)

(declare-fun e!65702 () Bool)

(assert (=> b!100424 (= e!65701 e!65702)))

(declare-fun res!82463 () Bool)

(assert (=> b!100424 (=> res!82463 e!65702)))

(assert (=> b!100424 (= res!82463 (= (size!2156 (buf!2513 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!100425 () Bool)

(assert (=> b!100425 (= e!65702 (arrayBitRangesEq!0 (buf!2513 thiss!1305) (buf!2513 (_2!4302 lt!144861)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2156 (buf!2513 thiss!1305)) (currentByte!4959 thiss!1305) (currentBit!4954 thiss!1305))))))

(assert (= (and d!31456 res!82461) b!100423))

(assert (= (and b!100423 res!82462) b!100424))

(assert (= (and b!100424 (not res!82463)) b!100425))

(assert (=> b!100423 m!145615))

(assert (=> b!100423 m!145939))

(assert (=> b!100425 m!145615))

(assert (=> b!100425 m!145615))

(declare-fun m!145945 () Bool)

(assert (=> b!100425 m!145945))

(assert (=> b!100194 d!31456))

(declare-fun d!31458 () Bool)

(declare-fun e!65705 () Bool)

(assert (=> d!31458 e!65705))

(declare-fun res!82468 () Bool)

(assert (=> d!31458 (=> (not res!82468) (not e!65705))))

(declare-fun lt!145416 () (_ BitVec 64))

(declare-fun lt!145417 () (_ BitVec 64))

(declare-fun lt!145420 () (_ BitVec 64))

(assert (=> d!31458 (= res!82468 (= lt!145420 (bvsub lt!145416 lt!145417)))))

(assert (=> d!31458 (or (= (bvand lt!145416 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!145417 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!145416 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!145416 lt!145417) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!31458 (= lt!145417 (remainingBits!0 ((_ sign_extend 32) (size!2156 (buf!2513 (_1!4301 lt!144859)))) ((_ sign_extend 32) (currentByte!4959 (_1!4301 lt!144859))) ((_ sign_extend 32) (currentBit!4954 (_1!4301 lt!144859)))))))

(declare-fun lt!145418 () (_ BitVec 64))

(declare-fun lt!145419 () (_ BitVec 64))

(assert (=> d!31458 (= lt!145416 (bvmul lt!145418 lt!145419))))

(assert (=> d!31458 (or (= lt!145418 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!145419 (bvsdiv (bvmul lt!145418 lt!145419) lt!145418)))))

(assert (=> d!31458 (= lt!145419 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!31458 (= lt!145418 ((_ sign_extend 32) (size!2156 (buf!2513 (_1!4301 lt!144859)))))))

(assert (=> d!31458 (= lt!145420 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4959 (_1!4301 lt!144859))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4954 (_1!4301 lt!144859)))))))

(assert (=> d!31458 (invariant!0 (currentBit!4954 (_1!4301 lt!144859)) (currentByte!4959 (_1!4301 lt!144859)) (size!2156 (buf!2513 (_1!4301 lt!144859))))))

(assert (=> d!31458 (= (bitIndex!0 (size!2156 (buf!2513 (_1!4301 lt!144859))) (currentByte!4959 (_1!4301 lt!144859)) (currentBit!4954 (_1!4301 lt!144859))) lt!145420)))

(declare-fun b!100431 () Bool)

(declare-fun res!82467 () Bool)

(assert (=> b!100431 (=> (not res!82467) (not e!65705))))

(assert (=> b!100431 (= res!82467 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!145420))))

(declare-fun b!100432 () Bool)

(declare-fun lt!145421 () (_ BitVec 64))

(assert (=> b!100432 (= e!65705 (bvsle lt!145420 (bvmul lt!145421 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!100432 (or (= lt!145421 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!145421 #b0000000000000000000000000000000000000000000000000000000000001000) lt!145421)))))

(assert (=> b!100432 (= lt!145421 ((_ sign_extend 32) (size!2156 (buf!2513 (_1!4301 lt!144859)))))))

(assert (= (and d!31458 res!82468) b!100431))

(assert (= (and b!100431 res!82467) b!100432))

(declare-fun m!145947 () Bool)

(assert (=> d!31458 m!145947))

(declare-fun m!145949 () Bool)

(assert (=> d!31458 m!145949))

(assert (=> b!100194 d!31458))

(declare-fun d!31460 () Bool)

(declare-fun e!65706 () Bool)

(assert (=> d!31460 e!65706))

(declare-fun res!82470 () Bool)

(assert (=> d!31460 (=> (not res!82470) (not e!65706))))

(declare-fun lt!145426 () (_ BitVec 64))

(declare-fun lt!145423 () (_ BitVec 64))

(declare-fun lt!145422 () (_ BitVec 64))

(assert (=> d!31460 (= res!82470 (= lt!145426 (bvsub lt!145422 lt!145423)))))

(assert (=> d!31460 (or (= (bvand lt!145422 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!145423 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!145422 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!145422 lt!145423) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!31460 (= lt!145423 (remainingBits!0 ((_ sign_extend 32) (size!2156 (buf!2513 (_1!4301 lt!144856)))) ((_ sign_extend 32) (currentByte!4959 (_1!4301 lt!144856))) ((_ sign_extend 32) (currentBit!4954 (_1!4301 lt!144856)))))))

(declare-fun lt!145424 () (_ BitVec 64))

(declare-fun lt!145425 () (_ BitVec 64))

(assert (=> d!31460 (= lt!145422 (bvmul lt!145424 lt!145425))))

(assert (=> d!31460 (or (= lt!145424 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!145425 (bvsdiv (bvmul lt!145424 lt!145425) lt!145424)))))

(assert (=> d!31460 (= lt!145425 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!31460 (= lt!145424 ((_ sign_extend 32) (size!2156 (buf!2513 (_1!4301 lt!144856)))))))

(assert (=> d!31460 (= lt!145426 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4959 (_1!4301 lt!144856))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4954 (_1!4301 lt!144856)))))))

(assert (=> d!31460 (invariant!0 (currentBit!4954 (_1!4301 lt!144856)) (currentByte!4959 (_1!4301 lt!144856)) (size!2156 (buf!2513 (_1!4301 lt!144856))))))

(assert (=> d!31460 (= (bitIndex!0 (size!2156 (buf!2513 (_1!4301 lt!144856))) (currentByte!4959 (_1!4301 lt!144856)) (currentBit!4954 (_1!4301 lt!144856))) lt!145426)))

(declare-fun b!100433 () Bool)

(declare-fun res!82469 () Bool)

(assert (=> b!100433 (=> (not res!82469) (not e!65706))))

(assert (=> b!100433 (= res!82469 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!145426))))

(declare-fun b!100434 () Bool)

(declare-fun lt!145427 () (_ BitVec 64))

(assert (=> b!100434 (= e!65706 (bvsle lt!145426 (bvmul lt!145427 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!100434 (or (= lt!145427 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!145427 #b0000000000000000000000000000000000000000000000000000000000001000) lt!145427)))))

(assert (=> b!100434 (= lt!145427 ((_ sign_extend 32) (size!2156 (buf!2513 (_1!4301 lt!144856)))))))

(assert (= (and d!31460 res!82470) b!100433))

(assert (= (and b!100433 res!82469) b!100434))

(declare-fun m!145965 () Bool)

(assert (=> d!31460 m!145965))

(declare-fun m!145969 () Bool)

(assert (=> d!31460 m!145969))

(assert (=> b!100194 d!31460))

(declare-fun b!100481 () Bool)

(declare-fun res!82508 () Bool)

(declare-fun e!65733 () Bool)

(assert (=> b!100481 (=> (not res!82508) (not e!65733))))

(declare-fun lt!145556 () tuple2!8094)

(assert (=> b!100481 (= res!82508 (isPrefixOf!0 thiss!1305 (_2!4302 lt!145556)))))

(declare-fun b!100480 () Bool)

(declare-fun res!82509 () Bool)

(assert (=> b!100480 (=> (not res!82509) (not e!65733))))

(declare-fun lt!145555 () (_ BitVec 64))

(declare-fun lt!145553 () (_ BitVec 64))

(assert (=> b!100480 (= res!82509 (= (bitIndex!0 (size!2156 (buf!2513 (_2!4302 lt!145556))) (currentByte!4959 (_2!4302 lt!145556)) (currentBit!4954 (_2!4302 lt!145556))) (bvadd lt!145553 lt!145555)))))

(assert (=> b!100480 (or (not (= (bvand lt!145553 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!145555 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!145553 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!145553 lt!145555) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!100480 (= lt!145555 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!100480 (= lt!145553 (bitIndex!0 (size!2156 (buf!2513 thiss!1305)) (currentByte!4959 thiss!1305) (currentBit!4954 thiss!1305)))))

(declare-fun b!100482 () Bool)

(declare-fun e!65732 () Bool)

(assert (=> b!100482 (= e!65733 e!65732)))

(declare-fun res!82507 () Bool)

(assert (=> b!100482 (=> (not res!82507) (not e!65732))))

(declare-fun lt!145554 () tuple2!8092)

(assert (=> b!100482 (= res!82507 (and (= (_2!4301 lt!145554) lt!144851) (= (_1!4301 lt!145554) (_2!4302 lt!145556))))))

(assert (=> b!100482 (= lt!145554 (readBitPure!0 (readerFrom!0 (_2!4302 lt!145556) (currentBit!4954 thiss!1305) (currentByte!4959 thiss!1305))))))

(declare-fun b!100483 () Bool)

(assert (=> b!100483 (= e!65732 (= (bitIndex!0 (size!2156 (buf!2513 (_1!4301 lt!145554))) (currentByte!4959 (_1!4301 lt!145554)) (currentBit!4954 (_1!4301 lt!145554))) (bitIndex!0 (size!2156 (buf!2513 (_2!4302 lt!145556))) (currentByte!4959 (_2!4302 lt!145556)) (currentBit!4954 (_2!4302 lt!145556)))))))

(declare-fun d!31462 () Bool)

(assert (=> d!31462 e!65733))

(declare-fun res!82510 () Bool)

(assert (=> d!31462 (=> (not res!82510) (not e!65733))))

(assert (=> d!31462 (= res!82510 (= (size!2156 (buf!2513 thiss!1305)) (size!2156 (buf!2513 (_2!4302 lt!145556)))))))

(declare-fun choose!16 (BitStream!3786 Bool) tuple2!8094)

(assert (=> d!31462 (= lt!145556 (choose!16 thiss!1305 lt!144851))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!31462 (validate_offset_bit!0 ((_ sign_extend 32) (size!2156 (buf!2513 thiss!1305))) ((_ sign_extend 32) (currentByte!4959 thiss!1305)) ((_ sign_extend 32) (currentBit!4954 thiss!1305)))))

(assert (=> d!31462 (= (appendBit!0 thiss!1305 lt!144851) lt!145556)))

(assert (= (and d!31462 res!82510) b!100480))

(assert (= (and b!100480 res!82509) b!100481))

(assert (= (and b!100481 res!82508) b!100482))

(assert (= (and b!100482 res!82507) b!100483))

(declare-fun m!146007 () Bool)

(assert (=> b!100483 m!146007))

(declare-fun m!146009 () Bool)

(assert (=> b!100483 m!146009))

(declare-fun m!146011 () Bool)

(assert (=> b!100482 m!146011))

(assert (=> b!100482 m!146011))

(declare-fun m!146013 () Bool)

(assert (=> b!100482 m!146013))

(declare-fun m!146015 () Bool)

(assert (=> d!31462 m!146015))

(declare-fun m!146017 () Bool)

(assert (=> d!31462 m!146017))

(assert (=> b!100480 m!146009))

(assert (=> b!100480 m!145615))

(declare-fun m!146019 () Bool)

(assert (=> b!100481 m!146019))

(assert (=> b!100194 d!31462))

(declare-fun b!100535 () Bool)

(declare-fun res!82556 () Bool)

(declare-fun e!65762 () Bool)

(assert (=> b!100535 (=> (not res!82556) (not e!65762))))

(declare-fun lt!145678 () tuple2!8096)

(assert (=> b!100535 (= res!82556 (isPrefixOf!0 (_1!4303 lt!145678) thiss!1305))))

(declare-fun b!100536 () Bool)

(declare-fun e!65763 () Unit!6139)

(declare-fun lt!145695 () Unit!6139)

(assert (=> b!100536 (= e!65763 lt!145695)))

(declare-fun lt!145697 () (_ BitVec 64))

(assert (=> b!100536 (= lt!145697 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!145692 () (_ BitVec 64))

(assert (=> b!100536 (= lt!145692 (bitIndex!0 (size!2156 (buf!2513 thiss!1305)) (currentByte!4959 thiss!1305) (currentBit!4954 thiss!1305)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!4721 array!4721 (_ BitVec 64) (_ BitVec 64)) Unit!6139)

(assert (=> b!100536 (= lt!145695 (arrayBitRangesEqSymmetric!0 (buf!2513 thiss!1305) (buf!2513 (_2!4302 lt!144861)) lt!145697 lt!145692))))

(assert (=> b!100536 (arrayBitRangesEq!0 (buf!2513 (_2!4302 lt!144861)) (buf!2513 thiss!1305) lt!145697 lt!145692)))

(declare-fun b!100537 () Bool)

(declare-fun lt!145696 () (_ BitVec 64))

(declare-fun lt!145681 () (_ BitVec 64))

(assert (=> b!100537 (= e!65762 (= (_1!4303 lt!145678) (withMovedBitIndex!0 (_2!4303 lt!145678) (bvsub lt!145696 lt!145681))))))

(assert (=> b!100537 (or (= (bvand lt!145696 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!145681 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!145696 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!145696 lt!145681) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!100537 (= lt!145681 (bitIndex!0 (size!2156 (buf!2513 (_2!4302 lt!144861))) (currentByte!4959 (_2!4302 lt!144861)) (currentBit!4954 (_2!4302 lt!144861))))))

(assert (=> b!100537 (= lt!145696 (bitIndex!0 (size!2156 (buf!2513 thiss!1305)) (currentByte!4959 thiss!1305) (currentBit!4954 thiss!1305)))))

(declare-fun b!100538 () Bool)

(declare-fun res!82555 () Bool)

(assert (=> b!100538 (=> (not res!82555) (not e!65762))))

(assert (=> b!100538 (= res!82555 (isPrefixOf!0 (_2!4303 lt!145678) (_2!4302 lt!144861)))))

(declare-fun b!100539 () Bool)

(declare-fun Unit!6157 () Unit!6139)

(assert (=> b!100539 (= e!65763 Unit!6157)))

(declare-fun d!31476 () Bool)

(assert (=> d!31476 e!65762))

(declare-fun res!82557 () Bool)

(assert (=> d!31476 (=> (not res!82557) (not e!65762))))

(assert (=> d!31476 (= res!82557 (isPrefixOf!0 (_1!4303 lt!145678) (_2!4303 lt!145678)))))

(declare-fun lt!145693 () BitStream!3786)

(assert (=> d!31476 (= lt!145678 (tuple2!8097 lt!145693 (_2!4302 lt!144861)))))

(declare-fun lt!145687 () Unit!6139)

(declare-fun lt!145694 () Unit!6139)

(assert (=> d!31476 (= lt!145687 lt!145694)))

(assert (=> d!31476 (isPrefixOf!0 lt!145693 (_2!4302 lt!144861))))

(assert (=> d!31476 (= lt!145694 (lemmaIsPrefixTransitive!0 lt!145693 (_2!4302 lt!144861) (_2!4302 lt!144861)))))

(declare-fun lt!145685 () Unit!6139)

(declare-fun lt!145680 () Unit!6139)

(assert (=> d!31476 (= lt!145685 lt!145680)))

(assert (=> d!31476 (isPrefixOf!0 lt!145693 (_2!4302 lt!144861))))

(assert (=> d!31476 (= lt!145680 (lemmaIsPrefixTransitive!0 lt!145693 thiss!1305 (_2!4302 lt!144861)))))

(declare-fun lt!145689 () Unit!6139)

(assert (=> d!31476 (= lt!145689 e!65763)))

(declare-fun c!6296 () Bool)

(assert (=> d!31476 (= c!6296 (not (= (size!2156 (buf!2513 thiss!1305)) #b00000000000000000000000000000000)))))

(declare-fun lt!145683 () Unit!6139)

(declare-fun lt!145691 () Unit!6139)

(assert (=> d!31476 (= lt!145683 lt!145691)))

(assert (=> d!31476 (isPrefixOf!0 (_2!4302 lt!144861) (_2!4302 lt!144861))))

(assert (=> d!31476 (= lt!145691 (lemmaIsPrefixRefl!0 (_2!4302 lt!144861)))))

(declare-fun lt!145688 () Unit!6139)

(declare-fun lt!145684 () Unit!6139)

(assert (=> d!31476 (= lt!145688 lt!145684)))

(assert (=> d!31476 (= lt!145684 (lemmaIsPrefixRefl!0 (_2!4302 lt!144861)))))

(declare-fun lt!145682 () Unit!6139)

(declare-fun lt!145686 () Unit!6139)

(assert (=> d!31476 (= lt!145682 lt!145686)))

(assert (=> d!31476 (isPrefixOf!0 lt!145693 lt!145693)))

(assert (=> d!31476 (= lt!145686 (lemmaIsPrefixRefl!0 lt!145693))))

(declare-fun lt!145679 () Unit!6139)

(declare-fun lt!145690 () Unit!6139)

(assert (=> d!31476 (= lt!145679 lt!145690)))

(assert (=> d!31476 (isPrefixOf!0 thiss!1305 thiss!1305)))

(assert (=> d!31476 (= lt!145690 (lemmaIsPrefixRefl!0 thiss!1305))))

(assert (=> d!31476 (= lt!145693 (BitStream!3787 (buf!2513 (_2!4302 lt!144861)) (currentByte!4959 thiss!1305) (currentBit!4954 thiss!1305)))))

(assert (=> d!31476 (isPrefixOf!0 thiss!1305 (_2!4302 lt!144861))))

(assert (=> d!31476 (= (reader!0 thiss!1305 (_2!4302 lt!144861)) lt!145678)))

(assert (= (and d!31476 c!6296) b!100536))

(assert (= (and d!31476 (not c!6296)) b!100539))

(assert (= (and d!31476 res!82557) b!100535))

(assert (= (and b!100535 res!82556) b!100538))

(assert (= (and b!100538 res!82555) b!100537))

(assert (=> b!100536 m!145615))

(declare-fun m!146139 () Bool)

(assert (=> b!100536 m!146139))

(declare-fun m!146141 () Bool)

(assert (=> b!100536 m!146141))

(declare-fun m!146143 () Bool)

(assert (=> d!31476 m!146143))

(declare-fun m!146145 () Bool)

(assert (=> d!31476 m!146145))

(declare-fun m!146147 () Bool)

(assert (=> d!31476 m!146147))

(declare-fun m!146149 () Bool)

(assert (=> d!31476 m!146149))

(declare-fun m!146151 () Bool)

(assert (=> d!31476 m!146151))

(declare-fun m!146153 () Bool)

(assert (=> d!31476 m!146153))

(declare-fun m!146155 () Bool)

(assert (=> d!31476 m!146155))

(assert (=> d!31476 m!145591))

(declare-fun m!146157 () Bool)

(assert (=> d!31476 m!146157))

(declare-fun m!146159 () Bool)

(assert (=> d!31476 m!146159))

(declare-fun m!146161 () Bool)

(assert (=> d!31476 m!146161))

(declare-fun m!146163 () Bool)

(assert (=> b!100535 m!146163))

(declare-fun m!146165 () Bool)

(assert (=> b!100538 m!146165))

(declare-fun m!146167 () Bool)

(assert (=> b!100537 m!146167))

(assert (=> b!100537 m!145939))

(assert (=> b!100537 m!145615))

(assert (=> b!100194 d!31476))

(declare-fun d!31506 () Bool)

(declare-fun lt!145698 () tuple2!8106)

(assert (=> d!31506 (= lt!145698 (readBit!0 lt!144854))))

(assert (=> d!31506 (= (readBitPure!0 lt!144854) (tuple2!8093 (_2!4308 lt!145698) (_1!4308 lt!145698)))))

(declare-fun bs!7721 () Bool)

(assert (= bs!7721 d!31506))

(declare-fun m!146169 () Bool)

(assert (=> bs!7721 m!146169))

(assert (=> b!100194 d!31506))

(declare-fun d!31508 () Bool)

(declare-fun lt!145699 () tuple2!8106)

(assert (=> d!31508 (= lt!145699 (readBit!0 (BitStream!3787 (buf!2513 (_2!4302 lt!144861)) (currentByte!4959 thiss!1305) (currentBit!4954 thiss!1305))))))

(assert (=> d!31508 (= (readBitPure!0 (BitStream!3787 (buf!2513 (_2!4302 lt!144861)) (currentByte!4959 thiss!1305) (currentBit!4954 thiss!1305))) (tuple2!8093 (_2!4308 lt!145699) (_1!4308 lt!145699)))))

(declare-fun bs!7722 () Bool)

(assert (= bs!7722 d!31508))

(declare-fun m!146171 () Bool)

(assert (=> bs!7722 m!146171))

(assert (=> b!100194 d!31508))

(declare-fun d!31510 () Bool)

(assert (=> d!31510 (= (invariant!0 (currentBit!4954 thiss!1305) (currentByte!4959 thiss!1305) (size!2156 (buf!2513 (_2!4302 lt!144861)))) (and (bvsge (currentBit!4954 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!4954 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!4959 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!4959 thiss!1305) (size!2156 (buf!2513 (_2!4302 lt!144861)))) (and (= (currentBit!4954 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!4959 thiss!1305) (size!2156 (buf!2513 (_2!4302 lt!144861))))))))))

(assert (=> b!100202 d!31510))

(declare-fun d!31512 () Bool)

(assert (=> d!31512 (= (onesLSBLong!0 nBits!396) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!396))))))

(assert (=> b!100191 d!31512))

(declare-fun d!31514 () Bool)

(declare-fun e!65764 () Bool)

(assert (=> d!31514 e!65764))

(declare-fun res!82559 () Bool)

(assert (=> d!31514 (=> (not res!82559) (not e!65764))))

(declare-fun lt!145700 () (_ BitVec 64))

(declare-fun lt!145701 () (_ BitVec 64))

(declare-fun lt!145704 () (_ BitVec 64))

(assert (=> d!31514 (= res!82559 (= lt!145704 (bvsub lt!145700 lt!145701)))))

(assert (=> d!31514 (or (= (bvand lt!145700 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!145701 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!145700 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!145700 lt!145701) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!31514 (= lt!145701 (remainingBits!0 ((_ sign_extend 32) (size!2156 (buf!2513 (_1!4301 lt!144858)))) ((_ sign_extend 32) (currentByte!4959 (_1!4301 lt!144858))) ((_ sign_extend 32) (currentBit!4954 (_1!4301 lt!144858)))))))

(declare-fun lt!145702 () (_ BitVec 64))

(declare-fun lt!145703 () (_ BitVec 64))

(assert (=> d!31514 (= lt!145700 (bvmul lt!145702 lt!145703))))

(assert (=> d!31514 (or (= lt!145702 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!145703 (bvsdiv (bvmul lt!145702 lt!145703) lt!145702)))))

(assert (=> d!31514 (= lt!145703 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!31514 (= lt!145702 ((_ sign_extend 32) (size!2156 (buf!2513 (_1!4301 lt!144858)))))))

(assert (=> d!31514 (= lt!145704 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4959 (_1!4301 lt!144858))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4954 (_1!4301 lt!144858)))))))

(assert (=> d!31514 (invariant!0 (currentBit!4954 (_1!4301 lt!144858)) (currentByte!4959 (_1!4301 lt!144858)) (size!2156 (buf!2513 (_1!4301 lt!144858))))))

(assert (=> d!31514 (= (bitIndex!0 (size!2156 (buf!2513 (_1!4301 lt!144858))) (currentByte!4959 (_1!4301 lt!144858)) (currentBit!4954 (_1!4301 lt!144858))) lt!145704)))

(declare-fun b!100540 () Bool)

(declare-fun res!82558 () Bool)

(assert (=> b!100540 (=> (not res!82558) (not e!65764))))

(assert (=> b!100540 (= res!82558 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!145704))))

(declare-fun b!100541 () Bool)

(declare-fun lt!145705 () (_ BitVec 64))

(assert (=> b!100541 (= e!65764 (bvsle lt!145704 (bvmul lt!145705 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!100541 (or (= lt!145705 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!145705 #b0000000000000000000000000000000000000000000000000000000000001000) lt!145705)))))

(assert (=> b!100541 (= lt!145705 ((_ sign_extend 32) (size!2156 (buf!2513 (_1!4301 lt!144858)))))))

(assert (= (and d!31514 res!82559) b!100540))

(assert (= (and b!100540 res!82558) b!100541))

(declare-fun m!146173 () Bool)

(assert (=> d!31514 m!146173))

(declare-fun m!146175 () Bool)

(assert (=> d!31514 m!146175))

(assert (=> b!100192 d!31514))

(declare-fun d!31516 () Bool)

(declare-fun res!82560 () Bool)

(declare-fun e!65765 () Bool)

(assert (=> d!31516 (=> (not res!82560) (not e!65765))))

(assert (=> d!31516 (= res!82560 (= (size!2156 (buf!2513 thiss!1305)) (size!2156 (buf!2513 (_2!4302 lt!144860)))))))

(assert (=> d!31516 (= (isPrefixOf!0 thiss!1305 (_2!4302 lt!144860)) e!65765)))

(declare-fun b!100542 () Bool)

(declare-fun res!82561 () Bool)

(assert (=> b!100542 (=> (not res!82561) (not e!65765))))

(assert (=> b!100542 (= res!82561 (bvsle (bitIndex!0 (size!2156 (buf!2513 thiss!1305)) (currentByte!4959 thiss!1305) (currentBit!4954 thiss!1305)) (bitIndex!0 (size!2156 (buf!2513 (_2!4302 lt!144860))) (currentByte!4959 (_2!4302 lt!144860)) (currentBit!4954 (_2!4302 lt!144860)))))))

(declare-fun b!100543 () Bool)

(declare-fun e!65766 () Bool)

(assert (=> b!100543 (= e!65765 e!65766)))

(declare-fun res!82562 () Bool)

(assert (=> b!100543 (=> res!82562 e!65766)))

(assert (=> b!100543 (= res!82562 (= (size!2156 (buf!2513 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!100544 () Bool)

(assert (=> b!100544 (= e!65766 (arrayBitRangesEq!0 (buf!2513 thiss!1305) (buf!2513 (_2!4302 lt!144860)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2156 (buf!2513 thiss!1305)) (currentByte!4959 thiss!1305) (currentBit!4954 thiss!1305))))))

(assert (= (and d!31516 res!82560) b!100542))

(assert (= (and b!100542 res!82561) b!100543))

(assert (= (and b!100543 (not res!82562)) b!100544))

(assert (=> b!100542 m!145615))

(assert (=> b!100542 m!145613))

(assert (=> b!100544 m!145615))

(assert (=> b!100544 m!145615))

(declare-fun m!146177 () Bool)

(assert (=> b!100544 m!146177))

(assert (=> b!100201 d!31516))

(check-sat (not b!100399) (not b!100395) (not b!100391) (not b!100538) (not b!100402) (not b!100482) (not b!100542) (not d!31454) (not d!31396) (not d!31384) (not b!100544) (not b!100481) (not bm!1249) (not d!31390) (not d!31388) (not d!31380) (not d!31458) (not b!100241) (not b!100483) (not d!31476) (not d!31508) (not b!100416) (not b!100401) (not b!100537) (not d!31460) (not d!31506) (not b!100425) (not d!31514) (not b!100535) (not b!100536) (not b!100392) (not b!100480) (not b!100394) (not b!100398) (not b!100414) (not d!31386) (not b!100396) (not b!100393) (not d!31382) (not d!31462) (not b!100423))
