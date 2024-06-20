; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56404 () Bool)

(assert start!56404)

(declare-fun b!260740 () Bool)

(declare-fun res!218273 () Bool)

(declare-fun e!181222 () Bool)

(assert (=> b!260740 (=> res!218273 e!181222)))

(declare-datatypes ((array!14352 0))(
  ( (array!14353 (arr!7261 (Array (_ BitVec 32) (_ BitVec 8))) (size!6274 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11470 0))(
  ( (BitStream!11471 (buf!6796 array!14352) (currentByte!12513 (_ BitVec 32)) (currentBit!12508 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!18555 0))(
  ( (Unit!18556) )
))
(declare-datatypes ((tuple2!22346 0))(
  ( (tuple2!22347 (_1!12109 Unit!18555) (_2!12109 BitStream!11470)) )
))
(declare-fun lt!402874 () tuple2!22346)

(declare-fun thiss!914 () BitStream!11470)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!260740 (= res!218273 (not (= (bitIndex!0 (size!6274 (buf!6796 (_2!12109 lt!402874))) (currentByte!12513 (_2!12109 lt!402874)) (currentBit!12508 (_2!12109 lt!402874))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!6274 (buf!6796 thiss!914)) (currentByte!12513 thiss!914) (currentBit!12508 thiss!914))))))))

(declare-fun res!218274 () Bool)

(declare-fun e!181223 () Bool)

(assert (=> start!56404 (=> (not res!218274) (not e!181223))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!56404 (= res!218274 (validate_offset_bit!0 ((_ sign_extend 32) (size!6274 (buf!6796 thiss!914))) ((_ sign_extend 32) (currentByte!12513 thiss!914)) ((_ sign_extend 32) (currentBit!12508 thiss!914))))))

(assert (=> start!56404 e!181223))

(declare-fun e!181225 () Bool)

(declare-fun inv!12 (BitStream!11470) Bool)

(assert (=> start!56404 (and (inv!12 thiss!914) e!181225)))

(assert (=> start!56404 true))

(declare-fun b!260741 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!260741 (= e!181222 (invariant!0 (currentBit!12508 (_2!12109 lt!402874)) (currentByte!12513 (_2!12109 lt!402874)) (size!6274 (buf!6796 (_2!12109 lt!402874)))))))

(declare-fun b!260742 () Bool)

(declare-fun res!218275 () Bool)

(assert (=> b!260742 (=> res!218275 e!181222)))

(declare-fun isPrefixOf!0 (BitStream!11470 BitStream!11470) Bool)

(assert (=> b!260742 (= res!218275 (not (isPrefixOf!0 thiss!914 (_2!12109 lt!402874))))))

(declare-fun b!260743 () Bool)

(declare-fun array_inv!6015 (array!14352) Bool)

(assert (=> b!260743 (= e!181225 (array_inv!6015 (buf!6796 thiss!914)))))

(declare-fun b!260744 () Bool)

(assert (=> b!260744 (= e!181223 (not e!181222))))

(declare-fun res!218276 () Bool)

(assert (=> b!260744 (=> res!218276 e!181222)))

(assert (=> b!260744 (= res!218276 (not (= (size!6274 (buf!6796 thiss!914)) (size!6274 (buf!6796 (_2!12109 lt!402874))))))))

(declare-fun lt!402873 () tuple2!22346)

(declare-fun increaseBitIndex!0 (BitStream!11470) tuple2!22346)

(assert (=> b!260744 (= lt!402874 (increaseBitIndex!0 (_2!12109 lt!402873)))))

(declare-fun arrayRangesEq!941 (array!14352 array!14352 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!260744 (arrayRangesEq!941 (buf!6796 thiss!914) (array!14353 (store (arr!7261 (buf!6796 thiss!914)) (currentByte!12513 (_2!12109 lt!402873)) (select (arr!7261 (buf!6796 (_2!12109 lt!402873))) (currentByte!12513 (_2!12109 lt!402873)))) (size!6274 (buf!6796 thiss!914))) #b00000000000000000000000000000000 (currentByte!12513 (_2!12109 lt!402873)))))

(declare-fun lt!402875 () Unit!18555)

(declare-fun arrayUpdatedAtPrefixLemma!457 (array!14352 (_ BitVec 32) (_ BitVec 8)) Unit!18555)

(assert (=> b!260744 (= lt!402875 (arrayUpdatedAtPrefixLemma!457 (buf!6796 thiss!914) (currentByte!12513 (_2!12109 lt!402873)) (select (arr!7261 (buf!6796 (_2!12109 lt!402873))) (currentByte!12513 (_2!12109 lt!402873)))))))

(declare-fun b!187 () Bool)

(declare-fun Unit!18557 () Unit!18555)

(declare-fun Unit!18558 () Unit!18555)

(assert (=> b!260744 (= lt!402873 (ite b!187 (tuple2!22347 Unit!18557 (BitStream!11471 (array!14353 (store (arr!7261 (buf!6796 thiss!914)) (currentByte!12513 thiss!914) ((_ extract 7 0) (bvor ((_ sign_extend 24) (select (arr!7261 (buf!6796 thiss!914)) (currentByte!12513 thiss!914))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12508 thiss!914)))))) (size!6274 (buf!6796 thiss!914))) (currentByte!12513 thiss!914) (currentBit!12508 thiss!914))) (tuple2!22347 Unit!18558 (BitStream!11471 (array!14353 (store (arr!7261 (buf!6796 thiss!914)) (currentByte!12513 thiss!914) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!7261 (buf!6796 thiss!914)) (currentByte!12513 thiss!914))) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12508 thiss!914))))))) (size!6274 (buf!6796 thiss!914))) (currentByte!12513 thiss!914) (currentBit!12508 thiss!914)))))))

(assert (= (and start!56404 res!218274) b!260744))

(assert (= (and b!260744 (not res!218276)) b!260740))

(assert (= (and b!260740 (not res!218273)) b!260742))

(assert (= (and b!260742 (not res!218275)) b!260741))

(assert (= start!56404 b!260743))

(declare-fun m!390241 () Bool)

(assert (=> start!56404 m!390241))

(declare-fun m!390243 () Bool)

(assert (=> start!56404 m!390243))

(declare-fun m!390245 () Bool)

(assert (=> b!260740 m!390245))

(declare-fun m!390247 () Bool)

(assert (=> b!260740 m!390247))

(declare-fun m!390249 () Bool)

(assert (=> b!260741 m!390249))

(declare-fun m!390251 () Bool)

(assert (=> b!260744 m!390251))

(declare-fun m!390253 () Bool)

(assert (=> b!260744 m!390253))

(declare-fun m!390255 () Bool)

(assert (=> b!260744 m!390255))

(declare-fun m!390257 () Bool)

(assert (=> b!260744 m!390257))

(declare-fun m!390259 () Bool)

(assert (=> b!260744 m!390259))

(declare-fun m!390261 () Bool)

(assert (=> b!260744 m!390261))

(assert (=> b!260744 m!390257))

(declare-fun m!390263 () Bool)

(assert (=> b!260744 m!390263))

(declare-fun m!390265 () Bool)

(assert (=> b!260744 m!390265))

(declare-fun m!390267 () Bool)

(assert (=> b!260744 m!390267))

(declare-fun m!390269 () Bool)

(assert (=> b!260743 m!390269))

(declare-fun m!390271 () Bool)

(assert (=> b!260742 m!390271))

(push 1)

(assert (not b!260744))

(assert (not b!260740))

(assert (not b!260741))

(assert (not b!260742))

(assert (not b!260743))

(assert (not start!56404))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!87624 () Bool)

(declare-fun e!181252 () Bool)

(assert (=> d!87624 e!181252))

(declare-fun res!218306 () Bool)

(assert (=> d!87624 (=> (not res!218306) (not e!181252))))

(declare-fun lt!402910 () (_ BitVec 64))

(declare-fun lt!402906 () (_ BitVec 64))

(declare-fun lt!402908 () (_ BitVec 64))

(assert (=> d!87624 (= res!218306 (= lt!402910 (bvsub lt!402908 lt!402906)))))

(assert (=> d!87624 (or (= (bvand lt!402908 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!402906 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!402908 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!402908 lt!402906) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!87624 (= lt!402906 (remainingBits!0 ((_ sign_extend 32) (size!6274 (buf!6796 (_2!12109 lt!402874)))) ((_ sign_extend 32) (currentByte!12513 (_2!12109 lt!402874))) ((_ sign_extend 32) (currentBit!12508 (_2!12109 lt!402874)))))))

(declare-fun lt!402911 () (_ BitVec 64))

(declare-fun lt!402909 () (_ BitVec 64))

(assert (=> d!87624 (= lt!402908 (bvmul lt!402911 lt!402909))))

(assert (=> d!87624 (or (= lt!402911 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!402909 (bvsdiv (bvmul lt!402911 lt!402909) lt!402911)))))

(assert (=> d!87624 (= lt!402909 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!87624 (= lt!402911 ((_ sign_extend 32) (size!6274 (buf!6796 (_2!12109 lt!402874)))))))

(assert (=> d!87624 (= lt!402910 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12513 (_2!12109 lt!402874))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12508 (_2!12109 lt!402874)))))))

(assert (=> d!87624 (invariant!0 (currentBit!12508 (_2!12109 lt!402874)) (currentByte!12513 (_2!12109 lt!402874)) (size!6274 (buf!6796 (_2!12109 lt!402874))))))

(assert (=> d!87624 (= (bitIndex!0 (size!6274 (buf!6796 (_2!12109 lt!402874))) (currentByte!12513 (_2!12109 lt!402874)) (currentBit!12508 (_2!12109 lt!402874))) lt!402910)))

(declare-fun b!260779 () Bool)

(declare-fun res!218305 () Bool)

(assert (=> b!260779 (=> (not res!218305) (not e!181252))))

(assert (=> b!260779 (= res!218305 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!402910))))

(declare-fun b!260780 () Bool)

(declare-fun lt!402907 () (_ BitVec 64))

(assert (=> b!260780 (= e!181252 (bvsle lt!402910 (bvmul lt!402907 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!260780 (or (= lt!402907 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!402907 #b0000000000000000000000000000000000000000000000000000000000001000) lt!402907)))))

(assert (=> b!260780 (= lt!402907 ((_ sign_extend 32) (size!6274 (buf!6796 (_2!12109 lt!402874)))))))

(assert (= (and d!87624 res!218306) b!260779))

(assert (= (and b!260779 res!218305) b!260780))

(declare-fun m!390337 () Bool)

(assert (=> d!87624 m!390337))

(assert (=> d!87624 m!390249))

(assert (=> b!260740 d!87624))

(declare-fun d!87636 () Bool)

(declare-fun e!181253 () Bool)

(assert (=> d!87636 e!181253))

(declare-fun res!218308 () Bool)

(assert (=> d!87636 (=> (not res!218308) (not e!181253))))

(declare-fun lt!402916 () (_ BitVec 64))

(declare-fun lt!402914 () (_ BitVec 64))

(declare-fun lt!402912 () (_ BitVec 64))

(assert (=> d!87636 (= res!218308 (= lt!402916 (bvsub lt!402914 lt!402912)))))

(assert (=> d!87636 (or (= (bvand lt!402914 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!402912 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!402914 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!402914 lt!402912) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!87636 (= lt!402912 (remainingBits!0 ((_ sign_extend 32) (size!6274 (buf!6796 thiss!914))) ((_ sign_extend 32) (currentByte!12513 thiss!914)) ((_ sign_extend 32) (currentBit!12508 thiss!914))))))

(declare-fun lt!402917 () (_ BitVec 64))

(declare-fun lt!402915 () (_ BitVec 64))

(assert (=> d!87636 (= lt!402914 (bvmul lt!402917 lt!402915))))

(assert (=> d!87636 (or (= lt!402917 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!402915 (bvsdiv (bvmul lt!402917 lt!402915) lt!402917)))))

(assert (=> d!87636 (= lt!402915 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!87636 (= lt!402917 ((_ sign_extend 32) (size!6274 (buf!6796 thiss!914))))))

(assert (=> d!87636 (= lt!402916 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12513 thiss!914)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12508 thiss!914))))))

(assert (=> d!87636 (invariant!0 (currentBit!12508 thiss!914) (currentByte!12513 thiss!914) (size!6274 (buf!6796 thiss!914)))))

(assert (=> d!87636 (= (bitIndex!0 (size!6274 (buf!6796 thiss!914)) (currentByte!12513 thiss!914) (currentBit!12508 thiss!914)) lt!402916)))

(declare-fun b!260781 () Bool)

(declare-fun res!218307 () Bool)

(assert (=> b!260781 (=> (not res!218307) (not e!181253))))

(assert (=> b!260781 (= res!218307 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!402916))))

(declare-fun b!260782 () Bool)

(declare-fun lt!402913 () (_ BitVec 64))

(assert (=> b!260782 (= e!181253 (bvsle lt!402916 (bvmul lt!402913 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!260782 (or (= lt!402913 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!402913 #b0000000000000000000000000000000000000000000000000000000000001000) lt!402913)))))

(assert (=> b!260782 (= lt!402913 ((_ sign_extend 32) (size!6274 (buf!6796 thiss!914))))))

(assert (= (and d!87636 res!218308) b!260781))

(assert (= (and b!260781 res!218307) b!260782))

(declare-fun m!390339 () Bool)

(assert (=> d!87636 m!390339))

(declare-fun m!390341 () Bool)

(assert (=> d!87636 m!390341))

(assert (=> b!260740 d!87636))

(declare-fun d!87638 () Bool)

(assert (=> d!87638 (= (invariant!0 (currentBit!12508 (_2!12109 lt!402874)) (currentByte!12513 (_2!12109 lt!402874)) (size!6274 (buf!6796 (_2!12109 lt!402874)))) (and (bvsge (currentBit!12508 (_2!12109 lt!402874)) #b00000000000000000000000000000000) (bvslt (currentBit!12508 (_2!12109 lt!402874)) #b00000000000000000000000000001000) (bvsge (currentByte!12513 (_2!12109 lt!402874)) #b00000000000000000000000000000000) (or (bvslt (currentByte!12513 (_2!12109 lt!402874)) (size!6274 (buf!6796 (_2!12109 lt!402874)))) (and (= (currentBit!12508 (_2!12109 lt!402874)) #b00000000000000000000000000000000) (= (currentByte!12513 (_2!12109 lt!402874)) (size!6274 (buf!6796 (_2!12109 lt!402874))))))))))

(assert (=> b!260741 d!87638))

(declare-fun d!87640 () Bool)

(assert (=> d!87640 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!6274 (buf!6796 thiss!914))) ((_ sign_extend 32) (currentByte!12513 thiss!914)) ((_ sign_extend 32) (currentBit!12508 thiss!914))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6274 (buf!6796 thiss!914))) ((_ sign_extend 32) (currentByte!12513 thiss!914)) ((_ sign_extend 32) (currentBit!12508 thiss!914))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!22206 () Bool)

(assert (= bs!22206 d!87640))

(assert (=> bs!22206 m!390339))

(assert (=> start!56404 d!87640))

(declare-fun d!87642 () Bool)

(assert (=> d!87642 (= (inv!12 thiss!914) (invariant!0 (currentBit!12508 thiss!914) (currentByte!12513 thiss!914) (size!6274 (buf!6796 thiss!914))))))

(declare-fun bs!22207 () Bool)

(assert (= bs!22207 d!87642))

(assert (=> bs!22207 m!390341))

(assert (=> start!56404 d!87642))

(declare-fun d!87644 () Bool)

(declare-fun res!218325 () Bool)

(declare-fun e!181264 () Bool)

(assert (=> d!87644 (=> (not res!218325) (not e!181264))))

(assert (=> d!87644 (= res!218325 (= (size!6274 (buf!6796 thiss!914)) (size!6274 (buf!6796 (_2!12109 lt!402874)))))))

(assert (=> d!87644 (= (isPrefixOf!0 thiss!914 (_2!12109 lt!402874)) e!181264)))

(declare-fun b!260798 () Bool)

(declare-fun res!218326 () Bool)

(assert (=> b!260798 (=> (not res!218326) (not e!181264))))

(assert (=> b!260798 (= res!218326 (bvsle (bitIndex!0 (size!6274 (buf!6796 thiss!914)) (currentByte!12513 thiss!914) (currentBit!12508 thiss!914)) (bitIndex!0 (size!6274 (buf!6796 (_2!12109 lt!402874))) (currentByte!12513 (_2!12109 lt!402874)) (currentBit!12508 (_2!12109 lt!402874)))))))

(declare-fun b!260799 () Bool)

(declare-fun e!181265 () Bool)

(assert (=> b!260799 (= e!181264 e!181265)))

(declare-fun res!218324 () Bool)

(assert (=> b!260799 (=> res!218324 e!181265)))

(assert (=> b!260799 (= res!218324 (= (size!6274 (buf!6796 thiss!914)) #b00000000000000000000000000000000))))

(declare-fun b!260800 () Bool)

(declare-fun arrayBitRangesEq!0 (array!14352 array!14352 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!260800 (= e!181265 (arrayBitRangesEq!0 (buf!6796 thiss!914) (buf!6796 (_2!12109 lt!402874)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6274 (buf!6796 thiss!914)) (currentByte!12513 thiss!914) (currentBit!12508 thiss!914))))))

(assert (= (and d!87644 res!218325) b!260798))

(assert (= (and b!260798 res!218326) b!260799))

(assert (= (and b!260799 (not res!218324)) b!260800))

(assert (=> b!260798 m!390247))

(assert (=> b!260798 m!390245))

(assert (=> b!260800 m!390247))

(assert (=> b!260800 m!390247))

(declare-fun m!390349 () Bool)

(assert (=> b!260800 m!390349))

(assert (=> b!260742 d!87644))

(declare-fun d!87652 () Bool)

(assert (=> d!87652 (= (array_inv!6015 (buf!6796 thiss!914)) (bvsge (size!6274 (buf!6796 thiss!914)) #b00000000000000000000000000000000))))

(assert (=> b!260743 d!87652))

(declare-fun d!87654 () Bool)

(declare-fun e!181285 () Bool)

(assert (=> d!87654 e!181285))

(declare-fun res!218357 () Bool)

(assert (=> d!87654 (=> (not res!218357) (not e!181285))))

(declare-fun lt!402962 () (_ BitVec 64))

(declare-fun lt!402965 () (_ BitVec 64))

(declare-fun lt!402961 () tuple2!22346)

(assert (=> d!87654 (= res!218357 (= (bvadd lt!402962 lt!402965) (bitIndex!0 (size!6274 (buf!6796 (_2!12109 lt!402961))) (currentByte!12513 (_2!12109 lt!402961)) (currentBit!12508 (_2!12109 lt!402961)))))))

(assert (=> d!87654 (or (not (= (bvand lt!402962 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!402965 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!402962 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!402962 lt!402965) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!87654 (= lt!402965 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!87654 (= lt!402962 (bitIndex!0 (size!6274 (buf!6796 (_2!12109 lt!402873))) (currentByte!12513 (_2!12109 lt!402873)) (currentBit!12508 (_2!12109 lt!402873))))))

(declare-fun Unit!18569 () Unit!18555)

(declare-fun Unit!18570 () Unit!18555)

(assert (=> d!87654 (= lt!402961 (ite (bvslt (currentBit!12508 (_2!12109 lt!402873)) #b00000000000000000000000000000111) (tuple2!22347 Unit!18569 (BitStream!11471 (buf!6796 (_2!12109 lt!402873)) (currentByte!12513 (_2!12109 lt!402873)) (bvadd (currentBit!12508 (_2!12109 lt!402873)) #b00000000000000000000000000000001))) (tuple2!22347 Unit!18570 (BitStream!11471 (buf!6796 (_2!12109 lt!402873)) (bvadd (currentByte!12513 (_2!12109 lt!402873)) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (=> d!87654 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!6274 (buf!6796 (_2!12109 lt!402873)))) ((_ sign_extend 32) (currentByte!12513 (_2!12109 lt!402873))) ((_ sign_extend 32) (currentBit!12508 (_2!12109 lt!402873)))) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!87654 (= (increaseBitIndex!0 (_2!12109 lt!402873)) lt!402961)))

(declare-fun b!260828 () Bool)

(declare-fun res!218355 () Bool)

(assert (=> b!260828 (=> (not res!218355) (not e!181285))))

(declare-fun lt!402964 () (_ BitVec 64))

(declare-fun lt!402963 () (_ BitVec 64))

(assert (=> b!260828 (= res!218355 (= (bvsub lt!402964 lt!402963) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!260828 (or (= (bvand lt!402964 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!402963 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!402964 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!402964 lt!402963) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!260828 (= lt!402963 (remainingBits!0 ((_ sign_extend 32) (size!6274 (buf!6796 (_2!12109 lt!402961)))) ((_ sign_extend 32) (currentByte!12513 (_2!12109 lt!402961))) ((_ sign_extend 32) (currentBit!12508 (_2!12109 lt!402961)))))))

(assert (=> b!260828 (= lt!402964 (remainingBits!0 ((_ sign_extend 32) (size!6274 (buf!6796 (_2!12109 lt!402873)))) ((_ sign_extend 32) (currentByte!12513 (_2!12109 lt!402873))) ((_ sign_extend 32) (currentBit!12508 (_2!12109 lt!402873)))))))

(declare-fun b!260829 () Bool)

(assert (=> b!260829 (= e!181285 (= (size!6274 (buf!6796 (_2!12109 lt!402873))) (size!6274 (buf!6796 (_2!12109 lt!402961)))))))

(assert (= (and d!87654 res!218357) b!260828))

(assert (= (and b!260828 res!218355) b!260829))

(declare-fun m!390375 () Bool)

(assert (=> d!87654 m!390375))

(declare-fun m!390377 () Bool)

(assert (=> d!87654 m!390377))

(declare-fun m!390379 () Bool)

(assert (=> d!87654 m!390379))

(declare-fun m!390381 () Bool)

(assert (=> b!260828 m!390381))

(assert (=> b!260828 m!390379))

(assert (=> b!260744 d!87654))

(declare-fun d!87664 () Bool)

(declare-fun res!218364 () Bool)

(declare-fun e!181294 () Bool)

(assert (=> d!87664 (=> res!218364 e!181294)))

(assert (=> d!87664 (= res!218364 (= #b00000000000000000000000000000000 (currentByte!12513 (_2!12109 lt!402873))))))

(assert (=> d!87664 (= (arrayRangesEq!941 (buf!6796 thiss!914) (array!14353 (store (arr!7261 (buf!6796 thiss!914)) (currentByte!12513 (_2!12109 lt!402873)) (select (arr!7261 (buf!6796 (_2!12109 lt!402873))) (currentByte!12513 (_2!12109 lt!402873)))) (size!6274 (buf!6796 thiss!914))) #b00000000000000000000000000000000 (currentByte!12513 (_2!12109 lt!402873))) e!181294)))

(declare-fun b!260838 () Bool)

(declare-fun e!181295 () Bool)

(assert (=> b!260838 (= e!181294 e!181295)))

(declare-fun res!218365 () Bool)

(assert (=> b!260838 (=> (not res!218365) (not e!181295))))

(assert (=> b!260838 (= res!218365 (= (select (arr!7261 (buf!6796 thiss!914)) #b00000000000000000000000000000000) (select (arr!7261 (array!14353 (store (arr!7261 (buf!6796 thiss!914)) (currentByte!12513 (_2!12109 lt!402873)) (select (arr!7261 (buf!6796 (_2!12109 lt!402873))) (currentByte!12513 (_2!12109 lt!402873)))) (size!6274 (buf!6796 thiss!914)))) #b00000000000000000000000000000000)))))

(declare-fun b!260839 () Bool)

(assert (=> b!260839 (= e!181295 (arrayRangesEq!941 (buf!6796 thiss!914) (array!14353 (store (arr!7261 (buf!6796 thiss!914)) (currentByte!12513 (_2!12109 lt!402873)) (select (arr!7261 (buf!6796 (_2!12109 lt!402873))) (currentByte!12513 (_2!12109 lt!402873)))) (size!6274 (buf!6796 thiss!914))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12513 (_2!12109 lt!402873))))))

(assert (= (and d!87664 (not res!218364)) b!260838))

(assert (= (and b!260838 res!218365) b!260839))

(declare-fun m!390389 () Bool)

(assert (=> b!260838 m!390389))

(declare-fun m!390391 () Bool)

(assert (=> b!260838 m!390391))

(declare-fun m!390393 () Bool)

(assert (=> b!260839 m!390393))

(assert (=> b!260744 d!87664))

(declare-fun d!87668 () Bool)

(declare-fun e!181301 () Bool)

(assert (=> d!87668 e!181301))

(declare-fun res!218371 () Bool)

(assert (=> d!87668 (=> (not res!218371) (not e!181301))))

(assert (=> d!87668 (= res!218371 (and (bvsge (currentByte!12513 (_2!12109 lt!402873)) #b00000000000000000000000000000000) (bvslt (currentByte!12513 (_2!12109 lt!402873)) (size!6274 (buf!6796 thiss!914)))))))

(declare-fun lt!402973 () Unit!18555)

(declare-fun choose!352 (array!14352 (_ BitVec 32) (_ BitVec 8)) Unit!18555)

(assert (=> d!87668 (= lt!402973 (choose!352 (buf!6796 thiss!914) (currentByte!12513 (_2!12109 lt!402873)) (select (arr!7261 (buf!6796 (_2!12109 lt!402873))) (currentByte!12513 (_2!12109 lt!402873)))))))

(assert (=> d!87668 (and (bvsle #b00000000000000000000000000000000 (currentByte!12513 (_2!12109 lt!402873))) (bvslt (currentByte!12513 (_2!12109 lt!402873)) (size!6274 (buf!6796 thiss!914))))))

(assert (=> d!87668 (= (arrayUpdatedAtPrefixLemma!457 (buf!6796 thiss!914) (currentByte!12513 (_2!12109 lt!402873)) (select (arr!7261 (buf!6796 (_2!12109 lt!402873))) (currentByte!12513 (_2!12109 lt!402873)))) lt!402973)))

(declare-fun b!260845 () Bool)

(assert (=> b!260845 (= e!181301 (arrayRangesEq!941 (buf!6796 thiss!914) (array!14353 (store (arr!7261 (buf!6796 thiss!914)) (currentByte!12513 (_2!12109 lt!402873)) (select (arr!7261 (buf!6796 (_2!12109 lt!402873))) (currentByte!12513 (_2!12109 lt!402873)))) (size!6274 (buf!6796 thiss!914))) #b00000000000000000000000000000000 (currentByte!12513 (_2!12109 lt!402873))))))

(assert (= (and d!87668 res!218371) b!260845))

(assert (=> d!87668 m!390257))

(declare-fun m!390397 () Bool)

(assert (=> d!87668 m!390397))

(assert (=> b!260845 m!390261))

(assert (=> b!260845 m!390251))

(assert (=> b!260744 d!87668))

(push 1)

(assert (not d!87642))

(assert (not d!87668))

(assert (not b!260798))

(assert (not b!260845))

(assert (not d!87654))

(assert (not b!260828))

(assert (not d!87636))

(assert (not d!87640))

(assert (not b!260800))

(assert (not b!260839))

(assert (not d!87624))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

