; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55784 () Bool)

(assert start!55784)

(declare-fun b!259323 () Bool)

(declare-fun e!179925 () Bool)

(declare-fun e!179926 () Bool)

(assert (=> b!259323 (= e!179925 e!179926)))

(declare-fun res!217230 () Bool)

(assert (=> b!259323 (=> (not res!217230) (not e!179926))))

(declare-fun expected!109 () Bool)

(declare-fun nBits!535 () (_ BitVec 64))

(declare-datatypes ((array!14179 0))(
  ( (array!14180 (arr!7197 (Array (_ BitVec 32) (_ BitVec 8))) (size!6210 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11342 0))(
  ( (BitStream!11343 (buf!6732 array!14179) (currentByte!12370 (_ BitVec 32)) (currentBit!12365 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11342)

(declare-fun from!526 () (_ BitVec 64))

(declare-datatypes ((tuple2!22218 0))(
  ( (tuple2!22219 (_1!12045 Bool) (_2!12045 BitStream!11342)) )
))
(declare-fun lt!401078 () tuple2!22218)

(assert (=> b!259323 (= res!217230 (and (= (_1!12045 lt!401078) expected!109) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!535 from!526)) (= (size!6210 (buf!6732 thiss!1754)) (size!6210 (buf!6732 (_2!12045 lt!401078))))))))

(declare-fun readBit!0 (BitStream!11342) tuple2!22218)

(assert (=> b!259323 (= lt!401078 (readBit!0 thiss!1754))))

(declare-fun b!259324 () Bool)

(declare-fun res!217229 () Bool)

(assert (=> b!259324 (=> (not res!217229) (not e!179925))))

(assert (=> b!259324 (= res!217229 (not (= from!526 nBits!535)))))

(declare-fun b!259325 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!259325 (= e!179926 (bvsgt (bitIndex!0 (size!6210 (buf!6732 (_2!12045 lt!401078))) (currentByte!12370 (_2!12045 lt!401078)) (currentBit!12365 (_2!12045 lt!401078))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!6210 (buf!6732 thiss!1754)) (currentByte!12370 thiss!1754) (currentBit!12365 thiss!1754)))))))

(declare-fun res!217228 () Bool)

(assert (=> start!55784 (=> (not res!217228) (not e!179925))))

(assert (=> start!55784 (= res!217228 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!55784 e!179925))

(assert (=> start!55784 true))

(declare-fun e!179923 () Bool)

(declare-fun inv!12 (BitStream!11342) Bool)

(assert (=> start!55784 (and (inv!12 thiss!1754) e!179923)))

(declare-fun b!259326 () Bool)

(declare-fun array_inv!5951 (array!14179) Bool)

(assert (=> b!259326 (= e!179923 (array_inv!5951 (buf!6732 thiss!1754)))))

(declare-fun b!259327 () Bool)

(declare-fun res!217231 () Bool)

(assert (=> b!259327 (=> (not res!217231) (not e!179925))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!259327 (= res!217231 (validate_offset_bits!1 ((_ sign_extend 32) (size!6210 (buf!6732 thiss!1754))) ((_ sign_extend 32) (currentByte!12370 thiss!1754)) ((_ sign_extend 32) (currentBit!12365 thiss!1754)) (bvsub nBits!535 from!526)))))

(assert (= (and start!55784 res!217228) b!259327))

(assert (= (and b!259327 res!217231) b!259324))

(assert (= (and b!259324 res!217229) b!259323))

(assert (= (and b!259323 res!217230) b!259325))

(assert (= start!55784 b!259326))

(declare-fun m!388637 () Bool)

(assert (=> b!259327 m!388637))

(declare-fun m!388639 () Bool)

(assert (=> start!55784 m!388639))

(declare-fun m!388641 () Bool)

(assert (=> b!259323 m!388641))

(declare-fun m!388643 () Bool)

(assert (=> b!259326 m!388643))

(declare-fun m!388645 () Bool)

(assert (=> b!259325 m!388645))

(declare-fun m!388647 () Bool)

(assert (=> b!259325 m!388647))

(push 1)

(assert (not b!259325))

(assert (not b!259323))

(assert (not b!259327))

(assert (not start!55784))

(assert (not b!259326))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!87016 () Bool)

(declare-fun e!179955 () Bool)

(assert (=> d!87016 e!179955))

(declare-fun res!217256 () Bool)

(assert (=> d!87016 (=> (not res!217256) (not e!179955))))

(declare-datatypes ((Unit!18463 0))(
  ( (Unit!18464) )
))
(declare-datatypes ((tuple2!22224 0))(
  ( (tuple2!22225 (_1!12048 Unit!18463) (_2!12048 BitStream!11342)) )
))
(declare-fun increaseBitIndex!0 (BitStream!11342) tuple2!22224)

(assert (=> d!87016 (= res!217256 (= (buf!6732 (_2!12048 (increaseBitIndex!0 thiss!1754))) (buf!6732 thiss!1754)))))

(declare-fun lt!401188 () Bool)

(assert (=> d!87016 (= lt!401188 (not (= (bvand ((_ sign_extend 24) (select (arr!7197 (buf!6732 thiss!1754)) (currentByte!12370 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12365 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!401187 () tuple2!22218)

(assert (=> d!87016 (= lt!401187 (tuple2!22219 (not (= (bvand ((_ sign_extend 24) (select (arr!7197 (buf!6732 thiss!1754)) (currentByte!12370 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12365 thiss!1754)))) #b00000000000000000000000000000000)) (_2!12048 (increaseBitIndex!0 thiss!1754))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!87016 (validate_offset_bit!0 ((_ sign_extend 32) (size!6210 (buf!6732 thiss!1754))) ((_ sign_extend 32) (currentByte!12370 thiss!1754)) ((_ sign_extend 32) (currentBit!12365 thiss!1754)))))

(assert (=> d!87016 (= (readBit!0 thiss!1754) lt!401187)))

(declare-fun b!259352 () Bool)

(declare-fun lt!401189 () (_ BitVec 64))

(declare-fun lt!401185 () (_ BitVec 64))

(assert (=> b!259352 (= e!179955 (= (bitIndex!0 (size!6210 (buf!6732 (_2!12048 (increaseBitIndex!0 thiss!1754)))) (currentByte!12370 (_2!12048 (increaseBitIndex!0 thiss!1754))) (currentBit!12365 (_2!12048 (increaseBitIndex!0 thiss!1754)))) (bvadd lt!401189 lt!401185)))))

(assert (=> b!259352 (or (not (= (bvand lt!401189 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!401185 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!401189 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!401189 lt!401185) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!259352 (= lt!401185 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!259352 (= lt!401189 (bitIndex!0 (size!6210 (buf!6732 thiss!1754)) (currentByte!12370 thiss!1754) (currentBit!12365 thiss!1754)))))

(declare-fun lt!401184 () Bool)

(assert (=> b!259352 (= lt!401184 (not (= (bvand ((_ sign_extend 24) (select (arr!7197 (buf!6732 thiss!1754)) (currentByte!12370 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12365 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!401186 () Bool)

(assert (=> b!259352 (= lt!401186 (not (= (bvand ((_ sign_extend 24) (select (arr!7197 (buf!6732 thiss!1754)) (currentByte!12370 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12365 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!401183 () Bool)

(assert (=> b!259352 (= lt!401183 (not (= (bvand ((_ sign_extend 24) (select (arr!7197 (buf!6732 thiss!1754)) (currentByte!12370 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12365 thiss!1754)))) #b00000000000000000000000000000000)))))

(assert (= (and d!87016 res!217256) b!259352))

(declare-fun m!388685 () Bool)

(assert (=> d!87016 m!388685))

(declare-fun m!388687 () Bool)

(assert (=> d!87016 m!388687))

(declare-fun m!388689 () Bool)

(assert (=> d!87016 m!388689))

(declare-fun m!388691 () Bool)

(assert (=> d!87016 m!388691))

(declare-fun m!388693 () Bool)

(assert (=> b!259352 m!388693))

(assert (=> b!259352 m!388685))

(assert (=> b!259352 m!388687))

(assert (=> b!259352 m!388647))

(assert (=> b!259352 m!388689))

(assert (=> b!259323 d!87016))

(declare-fun d!87020 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!87020 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6210 (buf!6732 thiss!1754))) ((_ sign_extend 32) (currentByte!12370 thiss!1754)) ((_ sign_extend 32) (currentBit!12365 thiss!1754)) (bvsub nBits!535 from!526)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6210 (buf!6732 thiss!1754))) ((_ sign_extend 32) (currentByte!12370 thiss!1754)) ((_ sign_extend 32) (currentBit!12365 thiss!1754))) (bvsub nBits!535 from!526)))))

(declare-fun bs!22041 () Bool)

(assert (= bs!22041 d!87020))

(declare-fun m!388695 () Bool)

(assert (=> bs!22041 m!388695))

(assert (=> b!259327 d!87020))

(declare-fun d!87024 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!87024 (= (inv!12 thiss!1754) (invariant!0 (currentBit!12365 thiss!1754) (currentByte!12370 thiss!1754) (size!6210 (buf!6732 thiss!1754))))))

(declare-fun bs!22043 () Bool)

(assert (= bs!22043 d!87024))

(declare-fun m!388697 () Bool)

(assert (=> bs!22043 m!388697))

(assert (=> start!55784 d!87024))

(declare-fun d!87026 () Bool)

(assert (=> d!87026 (= (array_inv!5951 (buf!6732 thiss!1754)) (bvsge (size!6210 (buf!6732 thiss!1754)) #b00000000000000000000000000000000))))

(assert (=> b!259326 d!87026))

(declare-fun d!87028 () Bool)

(declare-fun e!179958 () Bool)

(assert (=> d!87028 e!179958))

(declare-fun res!217262 () Bool)

(assert (=> d!87028 (=> (not res!217262) (not e!179958))))

(declare-fun lt!401203 () (_ BitVec 64))

(declare-fun lt!401206 () (_ BitVec 64))

(declare-fun lt!401202 () (_ BitVec 64))

(assert (=> d!87028 (= res!217262 (= lt!401206 (bvsub lt!401202 lt!401203)))))

(assert (=> d!87028 (or (= (bvand lt!401202 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!401203 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!401202 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!401202 lt!401203) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!87028 (= lt!401203 (remainingBits!0 ((_ sign_extend 32) (size!6210 (buf!6732 (_2!12045 lt!401078)))) ((_ sign_extend 32) (currentByte!12370 (_2!12045 lt!401078))) ((_ sign_extend 32) (currentBit!12365 (_2!12045 lt!401078)))))))

(declare-fun lt!401205 () (_ BitVec 64))

(declare-fun lt!401204 () (_ BitVec 64))

(assert (=> d!87028 (= lt!401202 (bvmul lt!401205 lt!401204))))

(assert (=> d!87028 (or (= lt!401205 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!401204 (bvsdiv (bvmul lt!401205 lt!401204) lt!401205)))))

(assert (=> d!87028 (= lt!401204 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!87028 (= lt!401205 ((_ sign_extend 32) (size!6210 (buf!6732 (_2!12045 lt!401078)))))))

(assert (=> d!87028 (= lt!401206 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12370 (_2!12045 lt!401078))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12365 (_2!12045 lt!401078)))))))

(assert (=> d!87028 (invariant!0 (currentBit!12365 (_2!12045 lt!401078)) (currentByte!12370 (_2!12045 lt!401078)) (size!6210 (buf!6732 (_2!12045 lt!401078))))))

(assert (=> d!87028 (= (bitIndex!0 (size!6210 (buf!6732 (_2!12045 lt!401078))) (currentByte!12370 (_2!12045 lt!401078)) (currentBit!12365 (_2!12045 lt!401078))) lt!401206)))

(declare-fun b!259357 () Bool)

(declare-fun res!217261 () Bool)

(assert (=> b!259357 (=> (not res!217261) (not e!179958))))

(assert (=> b!259357 (= res!217261 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!401206))))

(declare-fun b!259358 () Bool)

(declare-fun lt!401207 () (_ BitVec 64))

(assert (=> b!259358 (= e!179958 (bvsle lt!401206 (bvmul lt!401207 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!259358 (or (= lt!401207 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!401207 #b0000000000000000000000000000000000000000000000000000000000001000) lt!401207)))))

(assert (=> b!259358 (= lt!401207 ((_ sign_extend 32) (size!6210 (buf!6732 (_2!12045 lt!401078)))))))

(assert (= (and d!87028 res!217262) b!259357))

(assert (= (and b!259357 res!217261) b!259358))

(declare-fun m!388699 () Bool)

(assert (=> d!87028 m!388699))

(declare-fun m!388701 () Bool)

(assert (=> d!87028 m!388701))

(assert (=> b!259325 d!87028))

(declare-fun d!87030 () Bool)

(declare-fun e!179959 () Bool)

(assert (=> d!87030 e!179959))

(declare-fun res!217264 () Bool)

(assert (=> d!87030 (=> (not res!217264) (not e!179959))))

(declare-fun lt!401208 () (_ BitVec 64))

(declare-fun lt!401212 () (_ BitVec 64))

(declare-fun lt!401209 () (_ BitVec 64))

(assert (=> d!87030 (= res!217264 (= lt!401212 (bvsub lt!401208 lt!401209)))))

(assert (=> d!87030 (or (= (bvand lt!401208 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!401209 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!401208 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!401208 lt!401209) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!87030 (= lt!401209 (remainingBits!0 ((_ sign_extend 32) (size!6210 (buf!6732 thiss!1754))) ((_ sign_extend 32) (currentByte!12370 thiss!1754)) ((_ sign_extend 32) (currentBit!12365 thiss!1754))))))

(declare-fun lt!401211 () (_ BitVec 64))

(declare-fun lt!401210 () (_ BitVec 64))

(assert (=> d!87030 (= lt!401208 (bvmul lt!401211 lt!401210))))

(assert (=> d!87030 (or (= lt!401211 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!401210 (bvsdiv (bvmul lt!401211 lt!401210) lt!401211)))))

(assert (=> d!87030 (= lt!401210 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!87030 (= lt!401211 ((_ sign_extend 32) (size!6210 (buf!6732 thiss!1754))))))

(assert (=> d!87030 (= lt!401212 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12370 thiss!1754)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12365 thiss!1754))))))

(assert (=> d!87030 (invariant!0 (currentBit!12365 thiss!1754) (currentByte!12370 thiss!1754) (size!6210 (buf!6732 thiss!1754)))))

(assert (=> d!87030 (= (bitIndex!0 (size!6210 (buf!6732 thiss!1754)) (currentByte!12370 thiss!1754) (currentBit!12365 thiss!1754)) lt!401212)))

(declare-fun b!259359 () Bool)

(declare-fun res!217263 () Bool)

(assert (=> b!259359 (=> (not res!217263) (not e!179959))))

(assert (=> b!259359 (= res!217263 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!401212))))

(declare-fun b!259360 () Bool)

(declare-fun lt!401213 () (_ BitVec 64))

(assert (=> b!259360 (= e!179959 (bvsle lt!401212 (bvmul lt!401213 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!259360 (or (= lt!401213 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!401213 #b0000000000000000000000000000000000000000000000000000000000001000) lt!401213)))))

(assert (=> b!259360 (= lt!401213 ((_ sign_extend 32) (size!6210 (buf!6732 thiss!1754))))))

(assert (= (and d!87030 res!217264) b!259359))

(assert (= (and b!259359 res!217263) b!259360))

(assert (=> d!87030 m!388695))

(assert (=> d!87030 m!388697))

(assert (=> b!259325 d!87030))

(push 1)

(assert (not d!87016))

(assert (not d!87020))

(assert (not d!87024))

(assert (not d!87030))

(assert (not d!87028))

(assert (not b!259352))

(check-sat)

(pop 1)

(push 1)

(check-sat)

