; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55782 () Bool)

(assert start!55782)

(declare-fun res!217219 () Bool)

(declare-fun e!179912 () Bool)

(assert (=> start!55782 (=> (not res!217219) (not e!179912))))

(declare-fun nBits!535 () (_ BitVec 64))

(declare-fun from!526 () (_ BitVec 64))

(assert (=> start!55782 (= res!217219 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!55782 e!179912))

(assert (=> start!55782 true))

(declare-datatypes ((array!14177 0))(
  ( (array!14178 (arr!7196 (Array (_ BitVec 32) (_ BitVec 8))) (size!6209 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11340 0))(
  ( (BitStream!11341 (buf!6731 array!14177) (currentByte!12369 (_ BitVec 32)) (currentBit!12364 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11340)

(declare-fun e!179914 () Bool)

(declare-fun inv!12 (BitStream!11340) Bool)

(assert (=> start!55782 (and (inv!12 thiss!1754) e!179914)))

(declare-fun b!259308 () Bool)

(declare-fun res!217217 () Bool)

(assert (=> b!259308 (=> (not res!217217) (not e!179912))))

(assert (=> b!259308 (= res!217217 (not (= from!526 nBits!535)))))

(declare-fun b!259309 () Bool)

(declare-fun array_inv!5950 (array!14177) Bool)

(assert (=> b!259309 (= e!179914 (array_inv!5950 (buf!6731 thiss!1754)))))

(declare-fun b!259310 () Bool)

(declare-fun e!179913 () Bool)

(assert (=> b!259310 (= e!179912 e!179913)))

(declare-fun res!217218 () Bool)

(assert (=> b!259310 (=> (not res!217218) (not e!179913))))

(declare-fun expected!109 () Bool)

(declare-datatypes ((tuple2!22216 0))(
  ( (tuple2!22217 (_1!12044 Bool) (_2!12044 BitStream!11340)) )
))
(declare-fun lt!401075 () tuple2!22216)

(assert (=> b!259310 (= res!217218 (and (= (_1!12044 lt!401075) expected!109) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!535 from!526)) (= (size!6209 (buf!6731 thiss!1754)) (size!6209 (buf!6731 (_2!12044 lt!401075))))))))

(declare-fun readBit!0 (BitStream!11340) tuple2!22216)

(assert (=> b!259310 (= lt!401075 (readBit!0 thiss!1754))))

(declare-fun b!259311 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!259311 (= e!179913 (bvsgt (bitIndex!0 (size!6209 (buf!6731 (_2!12044 lt!401075))) (currentByte!12369 (_2!12044 lt!401075)) (currentBit!12364 (_2!12044 lt!401075))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!6209 (buf!6731 thiss!1754)) (currentByte!12369 thiss!1754) (currentBit!12364 thiss!1754)))))))

(declare-fun b!259312 () Bool)

(declare-fun res!217216 () Bool)

(assert (=> b!259312 (=> (not res!217216) (not e!179912))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!259312 (= res!217216 (validate_offset_bits!1 ((_ sign_extend 32) (size!6209 (buf!6731 thiss!1754))) ((_ sign_extend 32) (currentByte!12369 thiss!1754)) ((_ sign_extend 32) (currentBit!12364 thiss!1754)) (bvsub nBits!535 from!526)))))

(assert (= (and start!55782 res!217219) b!259312))

(assert (= (and b!259312 res!217216) b!259308))

(assert (= (and b!259308 res!217217) b!259310))

(assert (= (and b!259310 res!217218) b!259311))

(assert (= start!55782 b!259309))

(declare-fun m!388625 () Bool)

(assert (=> b!259312 m!388625))

(declare-fun m!388627 () Bool)

(assert (=> start!55782 m!388627))

(declare-fun m!388629 () Bool)

(assert (=> b!259311 m!388629))

(declare-fun m!388631 () Bool)

(assert (=> b!259311 m!388631))

(declare-fun m!388633 () Bool)

(assert (=> b!259309 m!388633))

(declare-fun m!388635 () Bool)

(assert (=> b!259310 m!388635))

(check-sat (not start!55782) (not b!259309) (not b!259311) (not b!259312) (not b!259310))
(check-sat)
(get-model)

(declare-fun d!86996 () Bool)

(assert (=> d!86996 (= (array_inv!5950 (buf!6731 thiss!1754)) (bvsge (size!6209 (buf!6731 thiss!1754)) #b00000000000000000000000000000000))))

(assert (=> b!259309 d!86996))

(declare-fun d!86998 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!86998 (= (inv!12 thiss!1754) (invariant!0 (currentBit!12364 thiss!1754) (currentByte!12369 thiss!1754) (size!6209 (buf!6731 thiss!1754))))))

(declare-fun bs!22038 () Bool)

(assert (= bs!22038 d!86998))

(declare-fun m!388649 () Bool)

(assert (=> bs!22038 m!388649))

(assert (=> start!55782 d!86998))

(declare-fun d!87000 () Bool)

(declare-fun e!179929 () Bool)

(assert (=> d!87000 e!179929))

(declare-fun res!217237 () Bool)

(assert (=> d!87000 (=> (not res!217237) (not e!179929))))

(declare-fun lt!401092 () (_ BitVec 64))

(declare-fun lt!401096 () (_ BitVec 64))

(declare-fun lt!401094 () (_ BitVec 64))

(assert (=> d!87000 (= res!217237 (= lt!401096 (bvsub lt!401092 lt!401094)))))

(assert (=> d!87000 (or (= (bvand lt!401092 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!401094 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!401092 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!401092 lt!401094) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!87000 (= lt!401094 (remainingBits!0 ((_ sign_extend 32) (size!6209 (buf!6731 (_2!12044 lt!401075)))) ((_ sign_extend 32) (currentByte!12369 (_2!12044 lt!401075))) ((_ sign_extend 32) (currentBit!12364 (_2!12044 lt!401075)))))))

(declare-fun lt!401095 () (_ BitVec 64))

(declare-fun lt!401091 () (_ BitVec 64))

(assert (=> d!87000 (= lt!401092 (bvmul lt!401095 lt!401091))))

(assert (=> d!87000 (or (= lt!401095 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!401091 (bvsdiv (bvmul lt!401095 lt!401091) lt!401095)))))

(assert (=> d!87000 (= lt!401091 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!87000 (= lt!401095 ((_ sign_extend 32) (size!6209 (buf!6731 (_2!12044 lt!401075)))))))

(assert (=> d!87000 (= lt!401096 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12369 (_2!12044 lt!401075))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12364 (_2!12044 lt!401075)))))))

(assert (=> d!87000 (invariant!0 (currentBit!12364 (_2!12044 lt!401075)) (currentByte!12369 (_2!12044 lt!401075)) (size!6209 (buf!6731 (_2!12044 lt!401075))))))

(assert (=> d!87000 (= (bitIndex!0 (size!6209 (buf!6731 (_2!12044 lt!401075))) (currentByte!12369 (_2!12044 lt!401075)) (currentBit!12364 (_2!12044 lt!401075))) lt!401096)))

(declare-fun b!259332 () Bool)

(declare-fun res!217236 () Bool)

(assert (=> b!259332 (=> (not res!217236) (not e!179929))))

(assert (=> b!259332 (= res!217236 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!401096))))

(declare-fun b!259333 () Bool)

(declare-fun lt!401093 () (_ BitVec 64))

(assert (=> b!259333 (= e!179929 (bvsle lt!401096 (bvmul lt!401093 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!259333 (or (= lt!401093 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!401093 #b0000000000000000000000000000000000000000000000000000000000001000) lt!401093)))))

(assert (=> b!259333 (= lt!401093 ((_ sign_extend 32) (size!6209 (buf!6731 (_2!12044 lt!401075)))))))

(assert (= (and d!87000 res!217237) b!259332))

(assert (= (and b!259332 res!217236) b!259333))

(declare-fun m!388651 () Bool)

(assert (=> d!87000 m!388651))

(declare-fun m!388653 () Bool)

(assert (=> d!87000 m!388653))

(assert (=> b!259311 d!87000))

(declare-fun d!87004 () Bool)

(declare-fun e!179930 () Bool)

(assert (=> d!87004 e!179930))

(declare-fun res!217239 () Bool)

(assert (=> d!87004 (=> (not res!217239) (not e!179930))))

(declare-fun lt!401102 () (_ BitVec 64))

(declare-fun lt!401100 () (_ BitVec 64))

(declare-fun lt!401098 () (_ BitVec 64))

(assert (=> d!87004 (= res!217239 (= lt!401102 (bvsub lt!401098 lt!401100)))))

(assert (=> d!87004 (or (= (bvand lt!401098 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!401100 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!401098 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!401098 lt!401100) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!87004 (= lt!401100 (remainingBits!0 ((_ sign_extend 32) (size!6209 (buf!6731 thiss!1754))) ((_ sign_extend 32) (currentByte!12369 thiss!1754)) ((_ sign_extend 32) (currentBit!12364 thiss!1754))))))

(declare-fun lt!401101 () (_ BitVec 64))

(declare-fun lt!401097 () (_ BitVec 64))

(assert (=> d!87004 (= lt!401098 (bvmul lt!401101 lt!401097))))

(assert (=> d!87004 (or (= lt!401101 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!401097 (bvsdiv (bvmul lt!401101 lt!401097) lt!401101)))))

(assert (=> d!87004 (= lt!401097 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!87004 (= lt!401101 ((_ sign_extend 32) (size!6209 (buf!6731 thiss!1754))))))

(assert (=> d!87004 (= lt!401102 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12369 thiss!1754)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12364 thiss!1754))))))

(assert (=> d!87004 (invariant!0 (currentBit!12364 thiss!1754) (currentByte!12369 thiss!1754) (size!6209 (buf!6731 thiss!1754)))))

(assert (=> d!87004 (= (bitIndex!0 (size!6209 (buf!6731 thiss!1754)) (currentByte!12369 thiss!1754) (currentBit!12364 thiss!1754)) lt!401102)))

(declare-fun b!259334 () Bool)

(declare-fun res!217238 () Bool)

(assert (=> b!259334 (=> (not res!217238) (not e!179930))))

(assert (=> b!259334 (= res!217238 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!401102))))

(declare-fun b!259335 () Bool)

(declare-fun lt!401099 () (_ BitVec 64))

(assert (=> b!259335 (= e!179930 (bvsle lt!401102 (bvmul lt!401099 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!259335 (or (= lt!401099 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!401099 #b0000000000000000000000000000000000000000000000000000000000001000) lt!401099)))))

(assert (=> b!259335 (= lt!401099 ((_ sign_extend 32) (size!6209 (buf!6731 thiss!1754))))))

(assert (= (and d!87004 res!217239) b!259334))

(assert (= (and b!259334 res!217238) b!259335))

(declare-fun m!388655 () Bool)

(assert (=> d!87004 m!388655))

(assert (=> d!87004 m!388649))

(assert (=> b!259311 d!87004))

(declare-fun d!87006 () Bool)

(assert (=> d!87006 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6209 (buf!6731 thiss!1754))) ((_ sign_extend 32) (currentByte!12369 thiss!1754)) ((_ sign_extend 32) (currentBit!12364 thiss!1754)) (bvsub nBits!535 from!526)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6209 (buf!6731 thiss!1754))) ((_ sign_extend 32) (currentByte!12369 thiss!1754)) ((_ sign_extend 32) (currentBit!12364 thiss!1754))) (bvsub nBits!535 from!526)))))

(declare-fun bs!22039 () Bool)

(assert (= bs!22039 d!87006))

(assert (=> bs!22039 m!388655))

(assert (=> b!259312 d!87006))

(declare-fun d!87008 () Bool)

(declare-fun e!179949 () Bool)

(assert (=> d!87008 e!179949))

(declare-fun res!217250 () Bool)

(assert (=> d!87008 (=> (not res!217250) (not e!179949))))

(declare-datatypes ((Unit!18459 0))(
  ( (Unit!18460) )
))
(declare-datatypes ((tuple2!22220 0))(
  ( (tuple2!22221 (_1!12046 Unit!18459) (_2!12046 BitStream!11340)) )
))
(declare-fun increaseBitIndex!0 (BitStream!11340) tuple2!22220)

(assert (=> d!87008 (= res!217250 (= (buf!6731 (_2!12046 (increaseBitIndex!0 thiss!1754))) (buf!6731 thiss!1754)))))

(declare-fun lt!401141 () Bool)

(assert (=> d!87008 (= lt!401141 (not (= (bvand ((_ sign_extend 24) (select (arr!7196 (buf!6731 thiss!1754)) (currentByte!12369 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12364 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!401143 () tuple2!22216)

(assert (=> d!87008 (= lt!401143 (tuple2!22217 (not (= (bvand ((_ sign_extend 24) (select (arr!7196 (buf!6731 thiss!1754)) (currentByte!12369 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12364 thiss!1754)))) #b00000000000000000000000000000000)) (_2!12046 (increaseBitIndex!0 thiss!1754))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!87008 (validate_offset_bit!0 ((_ sign_extend 32) (size!6209 (buf!6731 thiss!1754))) ((_ sign_extend 32) (currentByte!12369 thiss!1754)) ((_ sign_extend 32) (currentBit!12364 thiss!1754)))))

(assert (=> d!87008 (= (readBit!0 thiss!1754) lt!401143)))

(declare-fun b!259346 () Bool)

(declare-fun lt!401146 () (_ BitVec 64))

(declare-fun lt!401142 () (_ BitVec 64))

(assert (=> b!259346 (= e!179949 (= (bitIndex!0 (size!6209 (buf!6731 (_2!12046 (increaseBitIndex!0 thiss!1754)))) (currentByte!12369 (_2!12046 (increaseBitIndex!0 thiss!1754))) (currentBit!12364 (_2!12046 (increaseBitIndex!0 thiss!1754)))) (bvadd lt!401146 lt!401142)))))

(assert (=> b!259346 (or (not (= (bvand lt!401146 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!401142 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!401146 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!401146 lt!401142) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!259346 (= lt!401142 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!259346 (= lt!401146 (bitIndex!0 (size!6209 (buf!6731 thiss!1754)) (currentByte!12369 thiss!1754) (currentBit!12364 thiss!1754)))))

(declare-fun lt!401147 () Bool)

(assert (=> b!259346 (= lt!401147 (not (= (bvand ((_ sign_extend 24) (select (arr!7196 (buf!6731 thiss!1754)) (currentByte!12369 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12364 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!401145 () Bool)

(assert (=> b!259346 (= lt!401145 (not (= (bvand ((_ sign_extend 24) (select (arr!7196 (buf!6731 thiss!1754)) (currentByte!12369 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12364 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!401144 () Bool)

(assert (=> b!259346 (= lt!401144 (not (= (bvand ((_ sign_extend 24) (select (arr!7196 (buf!6731 thiss!1754)) (currentByte!12369 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12364 thiss!1754)))) #b00000000000000000000000000000000)))))

(assert (= (and d!87008 res!217250) b!259346))

(declare-fun m!388665 () Bool)

(assert (=> d!87008 m!388665))

(declare-fun m!388667 () Bool)

(assert (=> d!87008 m!388667))

(declare-fun m!388669 () Bool)

(assert (=> d!87008 m!388669))

(declare-fun m!388671 () Bool)

(assert (=> d!87008 m!388671))

(assert (=> b!259346 m!388631))

(assert (=> b!259346 m!388665))

(assert (=> b!259346 m!388669))

(declare-fun m!388673 () Bool)

(assert (=> b!259346 m!388673))

(assert (=> b!259346 m!388667))

(assert (=> b!259310 d!87008))

(check-sat (not d!86998) (not d!87004) (not d!87008) (not d!87000) (not d!87006) (not b!259346))
(check-sat)
