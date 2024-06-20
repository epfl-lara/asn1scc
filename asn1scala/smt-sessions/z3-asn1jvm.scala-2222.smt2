; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56358 () Bool)

(assert start!56358)

(declare-fun res!218213 () Bool)

(declare-fun e!181163 () Bool)

(assert (=> start!56358 (=> (not res!218213) (not e!181163))))

(declare-datatypes ((array!14345 0))(
  ( (array!14346 (arr!7259 (Array (_ BitVec 32) (_ BitVec 8))) (size!6272 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11466 0))(
  ( (BitStream!11467 (buf!6794 array!14345) (currentByte!12505 (_ BitVec 32)) (currentBit!12500 (_ BitVec 32))) )
))
(declare-fun thiss!914 () BitStream!11466)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!56358 (= res!218213 (validate_offset_bit!0 ((_ sign_extend 32) (size!6272 (buf!6794 thiss!914))) ((_ sign_extend 32) (currentByte!12505 thiss!914)) ((_ sign_extend 32) (currentBit!12500 thiss!914))))))

(assert (=> start!56358 e!181163))

(declare-fun e!181164 () Bool)

(declare-fun inv!12 (BitStream!11466) Bool)

(assert (=> start!56358 (and (inv!12 thiss!914) e!181164)))

(assert (=> start!56358 true))

(declare-fun b!260673 () Bool)

(declare-fun e!181165 () Bool)

(assert (=> b!260673 (= e!181163 (not e!181165))))

(declare-fun res!218212 () Bool)

(assert (=> b!260673 (=> res!218212 e!181165)))

(declare-datatypes ((Unit!18541 0))(
  ( (Unit!18542) )
))
(declare-datatypes ((tuple2!22342 0))(
  ( (tuple2!22343 (_1!12107 Unit!18541) (_2!12107 BitStream!11466)) )
))
(declare-fun lt!402805 () tuple2!22342)

(declare-fun increaseBitIndex!0 (BitStream!11466) tuple2!22342)

(assert (=> b!260673 (= res!218212 (not (= (size!6272 (buf!6794 thiss!914)) (size!6272 (buf!6794 (_2!12107 (increaseBitIndex!0 (_2!12107 lt!402805))))))))))

(declare-fun arrayRangesEq!939 (array!14345 array!14345 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!260673 (arrayRangesEq!939 (buf!6794 thiss!914) (array!14346 (store (arr!7259 (buf!6794 thiss!914)) (currentByte!12505 (_2!12107 lt!402805)) (select (arr!7259 (buf!6794 (_2!12107 lt!402805))) (currentByte!12505 (_2!12107 lt!402805)))) (size!6272 (buf!6794 thiss!914))) #b00000000000000000000000000000000 (currentByte!12505 (_2!12107 lt!402805)))))

(declare-fun lt!402806 () Unit!18541)

(declare-fun arrayUpdatedAtPrefixLemma!455 (array!14345 (_ BitVec 32) (_ BitVec 8)) Unit!18541)

(assert (=> b!260673 (= lt!402806 (arrayUpdatedAtPrefixLemma!455 (buf!6794 thiss!914) (currentByte!12505 (_2!12107 lt!402805)) (select (arr!7259 (buf!6794 (_2!12107 lt!402805))) (currentByte!12505 (_2!12107 lt!402805)))))))

(declare-fun b!187 () Bool)

(declare-fun Unit!18543 () Unit!18541)

(declare-fun Unit!18544 () Unit!18541)

(assert (=> b!260673 (= lt!402805 (ite b!187 (tuple2!22343 Unit!18543 (BitStream!11467 (array!14346 (store (arr!7259 (buf!6794 thiss!914)) (currentByte!12505 thiss!914) ((_ extract 7 0) (bvor ((_ sign_extend 24) (select (arr!7259 (buf!6794 thiss!914)) (currentByte!12505 thiss!914))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12500 thiss!914)))))) (size!6272 (buf!6794 thiss!914))) (currentByte!12505 thiss!914) (currentBit!12500 thiss!914))) (tuple2!22343 Unit!18544 (BitStream!11467 (array!14346 (store (arr!7259 (buf!6794 thiss!914)) (currentByte!12505 thiss!914) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!7259 (buf!6794 thiss!914)) (currentByte!12505 thiss!914))) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12500 thiss!914))))))) (size!6272 (buf!6794 thiss!914))) (currentByte!12505 thiss!914) (currentBit!12500 thiss!914)))))))

(declare-fun b!260674 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!260674 (= e!181165 (invariant!0 (currentBit!12500 thiss!914) (currentByte!12505 thiss!914) (size!6272 (buf!6794 thiss!914))))))

(declare-fun b!260675 () Bool)

(declare-fun array_inv!6013 (array!14345) Bool)

(assert (=> b!260675 (= e!181164 (array_inv!6013 (buf!6794 thiss!914)))))

(assert (= (and start!56358 res!218213) b!260673))

(assert (= (and b!260673 (not res!218212)) b!260674))

(assert (= start!56358 b!260675))

(declare-fun m!390135 () Bool)

(assert (=> start!56358 m!390135))

(declare-fun m!390137 () Bool)

(assert (=> start!56358 m!390137))

(declare-fun m!390139 () Bool)

(assert (=> b!260673 m!390139))

(declare-fun m!390141 () Bool)

(assert (=> b!260673 m!390141))

(declare-fun m!390143 () Bool)

(assert (=> b!260673 m!390143))

(declare-fun m!390145 () Bool)

(assert (=> b!260673 m!390145))

(declare-fun m!390147 () Bool)

(assert (=> b!260673 m!390147))

(declare-fun m!390149 () Bool)

(assert (=> b!260673 m!390149))

(declare-fun m!390151 () Bool)

(assert (=> b!260673 m!390151))

(assert (=> b!260673 m!390139))

(declare-fun m!390153 () Bool)

(assert (=> b!260673 m!390153))

(declare-fun m!390155 () Bool)

(assert (=> b!260673 m!390155))

(declare-fun m!390157 () Bool)

(assert (=> b!260674 m!390157))

(declare-fun m!390159 () Bool)

(assert (=> b!260675 m!390159))

(check-sat (not b!260673) (not b!260674) (not b!260675) (not start!56358))
(check-sat)
(get-model)

(declare-fun d!87592 () Bool)

(declare-fun e!181194 () Bool)

(assert (=> d!87592 e!181194))

(declare-fun res!218245 () Bool)

(assert (=> d!87592 (=> (not res!218245) (not e!181194))))

(declare-fun lt!402856 () (_ BitVec 64))

(declare-fun lt!402855 () tuple2!22342)

(declare-fun lt!402857 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> d!87592 (= res!218245 (= (bvadd lt!402856 lt!402857) (bitIndex!0 (size!6272 (buf!6794 (_2!12107 lt!402855))) (currentByte!12505 (_2!12107 lt!402855)) (currentBit!12500 (_2!12107 lt!402855)))))))

(assert (=> d!87592 (or (not (= (bvand lt!402856 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!402857 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!402856 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!402856 lt!402857) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!87592 (= lt!402857 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!87592 (= lt!402856 (bitIndex!0 (size!6272 (buf!6794 (_2!12107 lt!402805))) (currentByte!12505 (_2!12107 lt!402805)) (currentBit!12500 (_2!12107 lt!402805))))))

(declare-fun Unit!18551 () Unit!18541)

(declare-fun Unit!18552 () Unit!18541)

(assert (=> d!87592 (= lt!402855 (ite (bvslt (currentBit!12500 (_2!12107 lt!402805)) #b00000000000000000000000000000111) (tuple2!22343 Unit!18551 (BitStream!11467 (buf!6794 (_2!12107 lt!402805)) (currentByte!12505 (_2!12107 lt!402805)) (bvadd (currentBit!12500 (_2!12107 lt!402805)) #b00000000000000000000000000000001))) (tuple2!22343 Unit!18552 (BitStream!11467 (buf!6794 (_2!12107 lt!402805)) (bvadd (currentByte!12505 (_2!12107 lt!402805)) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!87592 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!6272 (buf!6794 (_2!12107 lt!402805)))) ((_ sign_extend 32) (currentByte!12505 (_2!12107 lt!402805))) ((_ sign_extend 32) (currentBit!12500 (_2!12107 lt!402805)))) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!87592 (= (increaseBitIndex!0 (_2!12107 lt!402805)) lt!402855)))

(declare-fun b!260709 () Bool)

(declare-fun res!218244 () Bool)

(assert (=> b!260709 (=> (not res!218244) (not e!181194))))

(declare-fun lt!402859 () (_ BitVec 64))

(declare-fun lt!402858 () (_ BitVec 64))

(assert (=> b!260709 (= res!218244 (= (bvsub lt!402859 lt!402858) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!260709 (or (= (bvand lt!402859 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!402858 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!402859 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!402859 lt!402858) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!260709 (= lt!402858 (remainingBits!0 ((_ sign_extend 32) (size!6272 (buf!6794 (_2!12107 lt!402855)))) ((_ sign_extend 32) (currentByte!12505 (_2!12107 lt!402855))) ((_ sign_extend 32) (currentBit!12500 (_2!12107 lt!402855)))))))

(assert (=> b!260709 (= lt!402859 (remainingBits!0 ((_ sign_extend 32) (size!6272 (buf!6794 (_2!12107 lt!402805)))) ((_ sign_extend 32) (currentByte!12505 (_2!12107 lt!402805))) ((_ sign_extend 32) (currentBit!12500 (_2!12107 lt!402805)))))))

(declare-fun b!260710 () Bool)

(assert (=> b!260710 (= e!181194 (= (size!6272 (buf!6794 (_2!12107 lt!402805))) (size!6272 (buf!6794 (_2!12107 lt!402855)))))))

(assert (= (and d!87592 res!218245) b!260709))

(assert (= (and b!260709 res!218244) b!260710))

(declare-fun m!390213 () Bool)

(assert (=> d!87592 m!390213))

(declare-fun m!390215 () Bool)

(assert (=> d!87592 m!390215))

(declare-fun m!390217 () Bool)

(assert (=> d!87592 m!390217))

(declare-fun m!390221 () Bool)

(assert (=> b!260709 m!390221))

(assert (=> b!260709 m!390217))

(assert (=> b!260673 d!87592))

(declare-fun d!87600 () Bool)

(declare-fun res!218257 () Bool)

(declare-fun e!181206 () Bool)

(assert (=> d!87600 (=> res!218257 e!181206)))

(assert (=> d!87600 (= res!218257 (= #b00000000000000000000000000000000 (currentByte!12505 (_2!12107 lt!402805))))))

(assert (=> d!87600 (= (arrayRangesEq!939 (buf!6794 thiss!914) (array!14346 (store (arr!7259 (buf!6794 thiss!914)) (currentByte!12505 (_2!12107 lt!402805)) (select (arr!7259 (buf!6794 (_2!12107 lt!402805))) (currentByte!12505 (_2!12107 lt!402805)))) (size!6272 (buf!6794 thiss!914))) #b00000000000000000000000000000000 (currentByte!12505 (_2!12107 lt!402805))) e!181206)))

(declare-fun b!260722 () Bool)

(declare-fun e!181207 () Bool)

(assert (=> b!260722 (= e!181206 e!181207)))

(declare-fun res!218258 () Bool)

(assert (=> b!260722 (=> (not res!218258) (not e!181207))))

(assert (=> b!260722 (= res!218258 (= (select (arr!7259 (buf!6794 thiss!914)) #b00000000000000000000000000000000) (select (arr!7259 (array!14346 (store (arr!7259 (buf!6794 thiss!914)) (currentByte!12505 (_2!12107 lt!402805)) (select (arr!7259 (buf!6794 (_2!12107 lt!402805))) (currentByte!12505 (_2!12107 lt!402805)))) (size!6272 (buf!6794 thiss!914)))) #b00000000000000000000000000000000)))))

(declare-fun b!260723 () Bool)

(assert (=> b!260723 (= e!181207 (arrayRangesEq!939 (buf!6794 thiss!914) (array!14346 (store (arr!7259 (buf!6794 thiss!914)) (currentByte!12505 (_2!12107 lt!402805)) (select (arr!7259 (buf!6794 (_2!12107 lt!402805))) (currentByte!12505 (_2!12107 lt!402805)))) (size!6272 (buf!6794 thiss!914))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12505 (_2!12107 lt!402805))))))

(assert (= (and d!87600 (not res!218257)) b!260722))

(assert (= (and b!260722 res!218258) b!260723))

(declare-fun m!390229 () Bool)

(assert (=> b!260722 m!390229))

(declare-fun m!390231 () Bool)

(assert (=> b!260722 m!390231))

(declare-fun m!390233 () Bool)

(assert (=> b!260723 m!390233))

(assert (=> b!260673 d!87600))

(declare-fun d!87608 () Bool)

(declare-fun e!181213 () Bool)

(assert (=> d!87608 e!181213))

(declare-fun res!218264 () Bool)

(assert (=> d!87608 (=> (not res!218264) (not e!181213))))

(assert (=> d!87608 (= res!218264 (and (bvsge (currentByte!12505 (_2!12107 lt!402805)) #b00000000000000000000000000000000) (bvslt (currentByte!12505 (_2!12107 lt!402805)) (size!6272 (buf!6794 thiss!914)))))))

(declare-fun lt!402866 () Unit!18541)

(declare-fun choose!349 (array!14345 (_ BitVec 32) (_ BitVec 8)) Unit!18541)

(assert (=> d!87608 (= lt!402866 (choose!349 (buf!6794 thiss!914) (currentByte!12505 (_2!12107 lt!402805)) (select (arr!7259 (buf!6794 (_2!12107 lt!402805))) (currentByte!12505 (_2!12107 lt!402805)))))))

(assert (=> d!87608 (and (bvsle #b00000000000000000000000000000000 (currentByte!12505 (_2!12107 lt!402805))) (bvslt (currentByte!12505 (_2!12107 lt!402805)) (size!6272 (buf!6794 thiss!914))))))

(assert (=> d!87608 (= (arrayUpdatedAtPrefixLemma!455 (buf!6794 thiss!914) (currentByte!12505 (_2!12107 lt!402805)) (select (arr!7259 (buf!6794 (_2!12107 lt!402805))) (currentByte!12505 (_2!12107 lt!402805)))) lt!402866)))

(declare-fun b!260729 () Bool)

(assert (=> b!260729 (= e!181213 (arrayRangesEq!939 (buf!6794 thiss!914) (array!14346 (store (arr!7259 (buf!6794 thiss!914)) (currentByte!12505 (_2!12107 lt!402805)) (select (arr!7259 (buf!6794 (_2!12107 lt!402805))) (currentByte!12505 (_2!12107 lt!402805)))) (size!6272 (buf!6794 thiss!914))) #b00000000000000000000000000000000 (currentByte!12505 (_2!12107 lt!402805))))))

(assert (= (and d!87608 res!218264) b!260729))

(assert (=> d!87608 m!390139))

(declare-fun m!390237 () Bool)

(assert (=> d!87608 m!390237))

(assert (=> b!260729 m!390147))

(assert (=> b!260729 m!390151))

(assert (=> b!260673 d!87608))

(declare-fun d!87612 () Bool)

(assert (=> d!87612 (= (invariant!0 (currentBit!12500 thiss!914) (currentByte!12505 thiss!914) (size!6272 (buf!6794 thiss!914))) (and (bvsge (currentBit!12500 thiss!914) #b00000000000000000000000000000000) (bvslt (currentBit!12500 thiss!914) #b00000000000000000000000000001000) (bvsge (currentByte!12505 thiss!914) #b00000000000000000000000000000000) (or (bvslt (currentByte!12505 thiss!914) (size!6272 (buf!6794 thiss!914))) (and (= (currentBit!12500 thiss!914) #b00000000000000000000000000000000) (= (currentByte!12505 thiss!914) (size!6272 (buf!6794 thiss!914)))))))))

(assert (=> b!260674 d!87612))

(declare-fun d!87616 () Bool)

(assert (=> d!87616 (= (array_inv!6013 (buf!6794 thiss!914)) (bvsge (size!6272 (buf!6794 thiss!914)) #b00000000000000000000000000000000))))

(assert (=> b!260675 d!87616))

(declare-fun d!87618 () Bool)

(assert (=> d!87618 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!6272 (buf!6794 thiss!914))) ((_ sign_extend 32) (currentByte!12505 thiss!914)) ((_ sign_extend 32) (currentBit!12500 thiss!914))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6272 (buf!6794 thiss!914))) ((_ sign_extend 32) (currentByte!12505 thiss!914)) ((_ sign_extend 32) (currentBit!12500 thiss!914))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!22201 () Bool)

(assert (= bs!22201 d!87618))

(declare-fun m!390239 () Bool)

(assert (=> bs!22201 m!390239))

(assert (=> start!56358 d!87618))

(declare-fun d!87620 () Bool)

(assert (=> d!87620 (= (inv!12 thiss!914) (invariant!0 (currentBit!12500 thiss!914) (currentByte!12505 thiss!914) (size!6272 (buf!6794 thiss!914))))))

(declare-fun bs!22202 () Bool)

(assert (= bs!22202 d!87620))

(assert (=> bs!22202 m!390157))

(assert (=> start!56358 d!87620))

(check-sat (not d!87618) (not d!87608) (not b!260723) (not d!87620) (not b!260729) (not d!87592) (not b!260709))
