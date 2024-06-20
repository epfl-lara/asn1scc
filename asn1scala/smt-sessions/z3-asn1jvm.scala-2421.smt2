; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!61776 () Bool)

(assert start!61776)

(declare-fun b!277019 () Bool)

(declare-fun e!196973 () Bool)

(declare-datatypes ((array!15873 0))(
  ( (array!15874 (arr!7865 (Array (_ BitVec 32) (_ BitVec 8))) (size!6869 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12552 0))(
  ( (BitStream!12553 (buf!7337 array!15873) (currentByte!13593 (_ BitVec 32)) (currentBit!13588 (_ BitVec 32))) )
))
(declare-fun thiss!872 () BitStream!12552)

(declare-fun array_inv!6593 (array!15873) Bool)

(assert (=> b!277019 (= e!196973 (array_inv!6593 (buf!7337 thiss!872)))))

(declare-fun b!277020 () Bool)

(declare-fun res!230092 () Bool)

(declare-fun e!196972 () Bool)

(assert (=> b!277020 (=> (not res!230092) (not e!196972))))

(assert (=> b!277020 (= res!230092 (not (= (size!6869 (buf!7337 thiss!872)) #b00000000000000000000000000000000)))))

(declare-fun b!277021 () Bool)

(declare-fun e!196970 () Bool)

(declare-fun b2!124 () BitStream!12552)

(assert (=> b!277021 (= e!196970 (array_inv!6593 (buf!7337 b2!124)))))

(declare-fun b!277022 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!277022 (= e!196972 (not (invariant!0 (currentBit!13588 thiss!872) (currentByte!13593 thiss!872) (size!6869 (buf!7337 thiss!872)))))))

(declare-fun res!230090 () Bool)

(assert (=> start!61776 (=> (not res!230090) (not e!196972))))

(assert (=> start!61776 (= res!230090 (= (size!6869 (buf!7337 thiss!872)) (size!6869 (buf!7337 b2!124))))))

(assert (=> start!61776 e!196972))

(declare-fun inv!12 (BitStream!12552) Bool)

(assert (=> start!61776 (and (inv!12 thiss!872) e!196973)))

(assert (=> start!61776 (and (inv!12 b2!124) e!196970)))

(declare-fun b!277023 () Bool)

(declare-fun res!230091 () Bool)

(assert (=> b!277023 (=> (not res!230091) (not e!196972))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!277023 (= res!230091 (bvsle (bitIndex!0 (size!6869 (buf!7337 thiss!872)) (currentByte!13593 thiss!872) (currentBit!13588 thiss!872)) (bitIndex!0 (size!6869 (buf!7337 b2!124)) (currentByte!13593 b2!124) (currentBit!13588 b2!124))))))

(assert (= (and start!61776 res!230090) b!277023))

(assert (= (and b!277023 res!230091) b!277020))

(assert (= (and b!277020 res!230092) b!277022))

(assert (= start!61776 b!277019))

(assert (= start!61776 b!277021))

(declare-fun m!410227 () Bool)

(assert (=> b!277021 m!410227))

(declare-fun m!410229 () Bool)

(assert (=> b!277022 m!410229))

(declare-fun m!410231 () Bool)

(assert (=> b!277023 m!410231))

(declare-fun m!410233 () Bool)

(assert (=> b!277023 m!410233))

(declare-fun m!410235 () Bool)

(assert (=> start!61776 m!410235))

(declare-fun m!410237 () Bool)

(assert (=> start!61776 m!410237))

(declare-fun m!410239 () Bool)

(assert (=> b!277019 m!410239))

(check-sat (not b!277022) (not b!277019) (not b!277023) (not start!61776) (not b!277021))
(check-sat)
(get-model)

(declare-fun d!95576 () Bool)

(assert (=> d!95576 (= (array_inv!6593 (buf!7337 thiss!872)) (bvsge (size!6869 (buf!7337 thiss!872)) #b00000000000000000000000000000000))))

(assert (=> b!277019 d!95576))

(declare-fun d!95578 () Bool)

(assert (=> d!95578 (= (inv!12 thiss!872) (invariant!0 (currentBit!13588 thiss!872) (currentByte!13593 thiss!872) (size!6869 (buf!7337 thiss!872))))))

(declare-fun bs!24105 () Bool)

(assert (= bs!24105 d!95578))

(assert (=> bs!24105 m!410229))

(assert (=> start!61776 d!95578))

(declare-fun d!95580 () Bool)

(assert (=> d!95580 (= (inv!12 b2!124) (invariant!0 (currentBit!13588 b2!124) (currentByte!13593 b2!124) (size!6869 (buf!7337 b2!124))))))

(declare-fun bs!24106 () Bool)

(assert (= bs!24106 d!95580))

(declare-fun m!410255 () Bool)

(assert (=> bs!24106 m!410255))

(assert (=> start!61776 d!95580))

(declare-fun d!95582 () Bool)

(assert (=> d!95582 (= (array_inv!6593 (buf!7337 b2!124)) (bvsge (size!6869 (buf!7337 b2!124)) #b00000000000000000000000000000000))))

(assert (=> b!277021 d!95582))

(declare-fun d!95584 () Bool)

(declare-fun e!196991 () Bool)

(assert (=> d!95584 e!196991))

(declare-fun res!230106 () Bool)

(assert (=> d!95584 (=> (not res!230106) (not e!196991))))

(declare-fun lt!415162 () (_ BitVec 64))

(declare-fun lt!415165 () (_ BitVec 64))

(declare-fun lt!415167 () (_ BitVec 64))

(assert (=> d!95584 (= res!230106 (= lt!415167 (bvsub lt!415165 lt!415162)))))

(assert (=> d!95584 (or (= (bvand lt!415165 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!415162 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!415165 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!415165 lt!415162) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!95584 (= lt!415162 (remainingBits!0 ((_ sign_extend 32) (size!6869 (buf!7337 thiss!872))) ((_ sign_extend 32) (currentByte!13593 thiss!872)) ((_ sign_extend 32) (currentBit!13588 thiss!872))))))

(declare-fun lt!415163 () (_ BitVec 64))

(declare-fun lt!415164 () (_ BitVec 64))

(assert (=> d!95584 (= lt!415165 (bvmul lt!415163 lt!415164))))

(assert (=> d!95584 (or (= lt!415163 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!415164 (bvsdiv (bvmul lt!415163 lt!415164) lt!415163)))))

(assert (=> d!95584 (= lt!415164 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!95584 (= lt!415163 ((_ sign_extend 32) (size!6869 (buf!7337 thiss!872))))))

(assert (=> d!95584 (= lt!415167 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13593 thiss!872)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13588 thiss!872))))))

(assert (=> d!95584 (invariant!0 (currentBit!13588 thiss!872) (currentByte!13593 thiss!872) (size!6869 (buf!7337 thiss!872)))))

(assert (=> d!95584 (= (bitIndex!0 (size!6869 (buf!7337 thiss!872)) (currentByte!13593 thiss!872) (currentBit!13588 thiss!872)) lt!415167)))

(declare-fun b!277043 () Bool)

(declare-fun res!230107 () Bool)

(assert (=> b!277043 (=> (not res!230107) (not e!196991))))

(assert (=> b!277043 (= res!230107 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!415167))))

(declare-fun b!277044 () Bool)

(declare-fun lt!415166 () (_ BitVec 64))

(assert (=> b!277044 (= e!196991 (bvsle lt!415167 (bvmul lt!415166 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!277044 (or (= lt!415166 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!415166 #b0000000000000000000000000000000000000000000000000000000000001000) lt!415166)))))

(assert (=> b!277044 (= lt!415166 ((_ sign_extend 32) (size!6869 (buf!7337 thiss!872))))))

(assert (= (and d!95584 res!230106) b!277043))

(assert (= (and b!277043 res!230107) b!277044))

(declare-fun m!410257 () Bool)

(assert (=> d!95584 m!410257))

(assert (=> d!95584 m!410229))

(assert (=> b!277023 d!95584))

(declare-fun d!95594 () Bool)

(declare-fun e!196992 () Bool)

(assert (=> d!95594 e!196992))

(declare-fun res!230108 () Bool)

(assert (=> d!95594 (=> (not res!230108) (not e!196992))))

(declare-fun lt!415173 () (_ BitVec 64))

(declare-fun lt!415168 () (_ BitVec 64))

(declare-fun lt!415171 () (_ BitVec 64))

(assert (=> d!95594 (= res!230108 (= lt!415173 (bvsub lt!415171 lt!415168)))))

(assert (=> d!95594 (or (= (bvand lt!415171 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!415168 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!415171 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!415171 lt!415168) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!95594 (= lt!415168 (remainingBits!0 ((_ sign_extend 32) (size!6869 (buf!7337 b2!124))) ((_ sign_extend 32) (currentByte!13593 b2!124)) ((_ sign_extend 32) (currentBit!13588 b2!124))))))

(declare-fun lt!415169 () (_ BitVec 64))

(declare-fun lt!415170 () (_ BitVec 64))

(assert (=> d!95594 (= lt!415171 (bvmul lt!415169 lt!415170))))

(assert (=> d!95594 (or (= lt!415169 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!415170 (bvsdiv (bvmul lt!415169 lt!415170) lt!415169)))))

(assert (=> d!95594 (= lt!415170 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!95594 (= lt!415169 ((_ sign_extend 32) (size!6869 (buf!7337 b2!124))))))

(assert (=> d!95594 (= lt!415173 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13593 b2!124)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13588 b2!124))))))

(assert (=> d!95594 (invariant!0 (currentBit!13588 b2!124) (currentByte!13593 b2!124) (size!6869 (buf!7337 b2!124)))))

(assert (=> d!95594 (= (bitIndex!0 (size!6869 (buf!7337 b2!124)) (currentByte!13593 b2!124) (currentBit!13588 b2!124)) lt!415173)))

(declare-fun b!277045 () Bool)

(declare-fun res!230109 () Bool)

(assert (=> b!277045 (=> (not res!230109) (not e!196992))))

(assert (=> b!277045 (= res!230109 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!415173))))

(declare-fun b!277046 () Bool)

(declare-fun lt!415172 () (_ BitVec 64))

(assert (=> b!277046 (= e!196992 (bvsle lt!415173 (bvmul lt!415172 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!277046 (or (= lt!415172 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!415172 #b0000000000000000000000000000000000000000000000000000000000001000) lt!415172)))))

(assert (=> b!277046 (= lt!415172 ((_ sign_extend 32) (size!6869 (buf!7337 b2!124))))))

(assert (= (and d!95594 res!230108) b!277045))

(assert (= (and b!277045 res!230109) b!277046))

(declare-fun m!410259 () Bool)

(assert (=> d!95594 m!410259))

(assert (=> d!95594 m!410255))

(assert (=> b!277023 d!95594))

(declare-fun d!95596 () Bool)

(assert (=> d!95596 (= (invariant!0 (currentBit!13588 thiss!872) (currentByte!13593 thiss!872) (size!6869 (buf!7337 thiss!872))) (and (bvsge (currentBit!13588 thiss!872) #b00000000000000000000000000000000) (bvslt (currentBit!13588 thiss!872) #b00000000000000000000000000001000) (bvsge (currentByte!13593 thiss!872) #b00000000000000000000000000000000) (or (bvslt (currentByte!13593 thiss!872) (size!6869 (buf!7337 thiss!872))) (and (= (currentBit!13588 thiss!872) #b00000000000000000000000000000000) (= (currentByte!13593 thiss!872) (size!6869 (buf!7337 thiss!872)))))))))

(assert (=> b!277022 d!95596))

(check-sat (not d!95580) (not d!95584) (not d!95594) (not d!95578))
