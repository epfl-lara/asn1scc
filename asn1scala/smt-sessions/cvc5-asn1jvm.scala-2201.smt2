; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55780 () Bool)

(assert start!55780)

(declare-fun b!259293 () Bool)

(declare-fun e!179900 () Bool)

(declare-datatypes ((array!14175 0))(
  ( (array!14176 (arr!7195 (Array (_ BitVec 32) (_ BitVec 8))) (size!6208 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11338 0))(
  ( (BitStream!11339 (buf!6730 array!14175) (currentByte!12368 (_ BitVec 32)) (currentBit!12363 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11338)

(declare-fun array_inv!5949 (array!14175) Bool)

(assert (=> b!259293 (= e!179900 (array_inv!5949 (buf!6730 thiss!1754)))))

(declare-fun res!217204 () Bool)

(declare-fun e!179901 () Bool)

(assert (=> start!55780 (=> (not res!217204) (not e!179901))))

(declare-fun nBits!535 () (_ BitVec 64))

(declare-fun from!526 () (_ BitVec 64))

(assert (=> start!55780 (= res!217204 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!55780 e!179901))

(assert (=> start!55780 true))

(declare-fun inv!12 (BitStream!11338) Bool)

(assert (=> start!55780 (and (inv!12 thiss!1754) e!179900)))

(declare-fun b!259294 () Bool)

(declare-fun res!217205 () Bool)

(assert (=> b!259294 (=> (not res!217205) (not e!179901))))

(assert (=> b!259294 (= res!217205 (not (= from!526 nBits!535)))))

(declare-fun b!259295 () Bool)

(declare-fun e!179899 () Bool)

(declare-datatypes ((tuple2!22214 0))(
  ( (tuple2!22215 (_1!12043 Bool) (_2!12043 BitStream!11338)) )
))
(declare-fun lt!401072 () tuple2!22214)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!259295 (= e!179899 (bvsgt (bitIndex!0 (size!6208 (buf!6730 (_2!12043 lt!401072))) (currentByte!12368 (_2!12043 lt!401072)) (currentBit!12363 (_2!12043 lt!401072))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!6208 (buf!6730 thiss!1754)) (currentByte!12368 thiss!1754) (currentBit!12363 thiss!1754)))))))

(declare-fun b!259296 () Bool)

(declare-fun res!217207 () Bool)

(assert (=> b!259296 (=> (not res!217207) (not e!179901))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!259296 (= res!217207 (validate_offset_bits!1 ((_ sign_extend 32) (size!6208 (buf!6730 thiss!1754))) ((_ sign_extend 32) (currentByte!12368 thiss!1754)) ((_ sign_extend 32) (currentBit!12363 thiss!1754)) (bvsub nBits!535 from!526)))))

(declare-fun b!259297 () Bool)

(assert (=> b!259297 (= e!179901 e!179899)))

(declare-fun res!217206 () Bool)

(assert (=> b!259297 (=> (not res!217206) (not e!179899))))

(declare-fun expected!109 () Bool)

(assert (=> b!259297 (= res!217206 (and (= (_1!12043 lt!401072) expected!109) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!535 from!526)) (= (size!6208 (buf!6730 thiss!1754)) (size!6208 (buf!6730 (_2!12043 lt!401072))))))))

(declare-fun readBit!0 (BitStream!11338) tuple2!22214)

(assert (=> b!259297 (= lt!401072 (readBit!0 thiss!1754))))

(assert (= (and start!55780 res!217204) b!259296))

(assert (= (and b!259296 res!217207) b!259294))

(assert (= (and b!259294 res!217205) b!259297))

(assert (= (and b!259297 res!217206) b!259295))

(assert (= start!55780 b!259293))

(declare-fun m!388613 () Bool)

(assert (=> b!259293 m!388613))

(declare-fun m!388615 () Bool)

(assert (=> b!259295 m!388615))

(declare-fun m!388617 () Bool)

(assert (=> b!259295 m!388617))

(declare-fun m!388619 () Bool)

(assert (=> b!259296 m!388619))

(declare-fun m!388621 () Bool)

(assert (=> start!55780 m!388621))

(declare-fun m!388623 () Bool)

(assert (=> b!259297 m!388623))

(push 1)

(assert (not b!259297))

(assert (not b!259296))

(assert (not b!259295))

(assert (not b!259293))

(assert (not start!55780))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!87002 () Bool)

(declare-fun e!179933 () Bool)

(assert (=> d!87002 e!179933))

(declare-fun res!217244 () Bool)

(assert (=> d!87002 (=> (not res!217244) (not e!179933))))

(declare-fun lt!401119 () (_ BitVec 64))

(declare-fun lt!401120 () (_ BitVec 64))

(declare-fun lt!401117 () (_ BitVec 64))

(assert (=> d!87002 (= res!217244 (= lt!401119 (bvsub lt!401120 lt!401117)))))

(assert (=> d!87002 (or (= (bvand lt!401120 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!401117 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!401120 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!401120 lt!401117) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!87002 (= lt!401117 (remainingBits!0 ((_ sign_extend 32) (size!6208 (buf!6730 (_2!12043 lt!401072)))) ((_ sign_extend 32) (currentByte!12368 (_2!12043 lt!401072))) ((_ sign_extend 32) (currentBit!12363 (_2!12043 lt!401072)))))))

(declare-fun lt!401115 () (_ BitVec 64))

(declare-fun lt!401116 () (_ BitVec 64))

(assert (=> d!87002 (= lt!401120 (bvmul lt!401115 lt!401116))))

(assert (=> d!87002 (or (= lt!401115 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!401116 (bvsdiv (bvmul lt!401115 lt!401116) lt!401115)))))

(assert (=> d!87002 (= lt!401116 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!87002 (= lt!401115 ((_ sign_extend 32) (size!6208 (buf!6730 (_2!12043 lt!401072)))))))

(assert (=> d!87002 (= lt!401119 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12368 (_2!12043 lt!401072))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12363 (_2!12043 lt!401072)))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!87002 (invariant!0 (currentBit!12363 (_2!12043 lt!401072)) (currentByte!12368 (_2!12043 lt!401072)) (size!6208 (buf!6730 (_2!12043 lt!401072))))))

(assert (=> d!87002 (= (bitIndex!0 (size!6208 (buf!6730 (_2!12043 lt!401072))) (currentByte!12368 (_2!12043 lt!401072)) (currentBit!12363 (_2!12043 lt!401072))) lt!401119)))

(declare-fun b!259340 () Bool)

(declare-fun res!217245 () Bool)

(assert (=> b!259340 (=> (not res!217245) (not e!179933))))

(assert (=> b!259340 (= res!217245 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!401119))))

(declare-fun b!259341 () Bool)

(declare-fun lt!401118 () (_ BitVec 64))

(assert (=> b!259341 (= e!179933 (bvsle lt!401119 (bvmul lt!401118 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!259341 (or (= lt!401118 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!401118 #b0000000000000000000000000000000000000000000000000000000000001000) lt!401118)))))

(assert (=> b!259341 (= lt!401118 ((_ sign_extend 32) (size!6208 (buf!6730 (_2!12043 lt!401072)))))))

(assert (= (and d!87002 res!217244) b!259340))

(assert (= (and b!259340 res!217245) b!259341))

(declare-fun m!388657 () Bool)

(assert (=> d!87002 m!388657))

(declare-fun m!388659 () Bool)

(assert (=> d!87002 m!388659))

(assert (=> b!259295 d!87002))

(declare-fun d!87010 () Bool)

(declare-fun e!179934 () Bool)

(assert (=> d!87010 e!179934))

(declare-fun res!217246 () Bool)

(assert (=> d!87010 (=> (not res!217246) (not e!179934))))

(declare-fun lt!401125 () (_ BitVec 64))

(declare-fun lt!401123 () (_ BitVec 64))

(declare-fun lt!401126 () (_ BitVec 64))

(assert (=> d!87010 (= res!217246 (= lt!401125 (bvsub lt!401126 lt!401123)))))

(assert (=> d!87010 (or (= (bvand lt!401126 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!401123 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!401126 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!401126 lt!401123) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!87010 (= lt!401123 (remainingBits!0 ((_ sign_extend 32) (size!6208 (buf!6730 thiss!1754))) ((_ sign_extend 32) (currentByte!12368 thiss!1754)) ((_ sign_extend 32) (currentBit!12363 thiss!1754))))))

(declare-fun lt!401121 () (_ BitVec 64))

(declare-fun lt!401122 () (_ BitVec 64))

(assert (=> d!87010 (= lt!401126 (bvmul lt!401121 lt!401122))))

(assert (=> d!87010 (or (= lt!401121 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!401122 (bvsdiv (bvmul lt!401121 lt!401122) lt!401121)))))

(assert (=> d!87010 (= lt!401122 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!87010 (= lt!401121 ((_ sign_extend 32) (size!6208 (buf!6730 thiss!1754))))))

(assert (=> d!87010 (= lt!401125 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12368 thiss!1754)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12363 thiss!1754))))))

(assert (=> d!87010 (invariant!0 (currentBit!12363 thiss!1754) (currentByte!12368 thiss!1754) (size!6208 (buf!6730 thiss!1754)))))

(assert (=> d!87010 (= (bitIndex!0 (size!6208 (buf!6730 thiss!1754)) (currentByte!12368 thiss!1754) (currentBit!12363 thiss!1754)) lt!401125)))

(declare-fun b!259342 () Bool)

(declare-fun res!217247 () Bool)

(assert (=> b!259342 (=> (not res!217247) (not e!179934))))

(assert (=> b!259342 (= res!217247 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!401125))))

(declare-fun b!259343 () Bool)

(declare-fun lt!401124 () (_ BitVec 64))

(assert (=> b!259343 (= e!179934 (bvsle lt!401125 (bvmul lt!401124 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!259343 (or (= lt!401124 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!401124 #b0000000000000000000000000000000000000000000000000000000000001000) lt!401124)))))

(assert (=> b!259343 (= lt!401124 ((_ sign_extend 32) (size!6208 (buf!6730 thiss!1754))))))

(assert (= (and d!87010 res!217246) b!259342))

(assert (= (and b!259342 res!217247) b!259343))

(declare-fun m!388661 () Bool)

(assert (=> d!87010 m!388661))

(declare-fun m!388663 () Bool)

(assert (=> d!87010 m!388663))

(assert (=> b!259295 d!87010))

(declare-fun d!87012 () Bool)

(assert (=> d!87012 (= (array_inv!5949 (buf!6730 thiss!1754)) (bvsge (size!6208 (buf!6730 thiss!1754)) #b00000000000000000000000000000000))))

(assert (=> b!259293 d!87012))

(declare-fun d!87014 () Bool)

(declare-fun e!179954 () Bool)

(assert (=> d!87014 e!179954))

(declare-fun res!217255 () Bool)

(assert (=> d!87014 (=> (not res!217255) (not e!179954))))

(declare-datatypes ((Unit!18461 0))(
  ( (Unit!18462) )
))
(declare-datatypes ((tuple2!22222 0))(
  ( (tuple2!22223 (_1!12047 Unit!18461) (_2!12047 BitStream!11338)) )
))
(declare-fun increaseBitIndex!0 (BitStream!11338) tuple2!22222)

(assert (=> d!87014 (= res!217255 (= (buf!6730 (_2!12047 (increaseBitIndex!0 thiss!1754))) (buf!6730 thiss!1754)))))

(declare-fun lt!401177 () Bool)

(assert (=> d!87014 (= lt!401177 (not (= (bvand ((_ sign_extend 24) (select (arr!7195 (buf!6730 thiss!1754)) (currentByte!12368 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12363 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!401176 () tuple2!22214)

(assert (=> d!87014 (= lt!401176 (tuple2!22215 (not (= (bvand ((_ sign_extend 24) (select (arr!7195 (buf!6730 thiss!1754)) (currentByte!12368 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12363 thiss!1754)))) #b00000000000000000000000000000000)) (_2!12047 (increaseBitIndex!0 thiss!1754))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!87014 (validate_offset_bit!0 ((_ sign_extend 32) (size!6208 (buf!6730 thiss!1754))) ((_ sign_extend 32) (currentByte!12368 thiss!1754)) ((_ sign_extend 32) (currentBit!12363 thiss!1754)))))

(assert (=> d!87014 (= (readBit!0 thiss!1754) lt!401176)))

(declare-fun b!259351 () Bool)

(declare-fun lt!401179 () (_ BitVec 64))

(declare-fun lt!401178 () (_ BitVec 64))

(assert (=> b!259351 (= e!179954 (= (bitIndex!0 (size!6208 (buf!6730 (_2!12047 (increaseBitIndex!0 thiss!1754)))) (currentByte!12368 (_2!12047 (increaseBitIndex!0 thiss!1754))) (currentBit!12363 (_2!12047 (increaseBitIndex!0 thiss!1754)))) (bvadd lt!401179 lt!401178)))))

(assert (=> b!259351 (or (not (= (bvand lt!401179 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!401178 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!401179 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!401179 lt!401178) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!259351 (= lt!401178 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!259351 (= lt!401179 (bitIndex!0 (size!6208 (buf!6730 thiss!1754)) (currentByte!12368 thiss!1754) (currentBit!12363 thiss!1754)))))

(declare-fun lt!401182 () Bool)

(assert (=> b!259351 (= lt!401182 (not (= (bvand ((_ sign_extend 24) (select (arr!7195 (buf!6730 thiss!1754)) (currentByte!12368 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12363 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!401180 () Bool)

(assert (=> b!259351 (= lt!401180 (not (= (bvand ((_ sign_extend 24) (select (arr!7195 (buf!6730 thiss!1754)) (currentByte!12368 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12363 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!401181 () Bool)

(assert (=> b!259351 (= lt!401181 (not (= (bvand ((_ sign_extend 24) (select (arr!7195 (buf!6730 thiss!1754)) (currentByte!12368 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12363 thiss!1754)))) #b00000000000000000000000000000000)))))

(assert (= (and d!87014 res!217255) b!259351))

(declare-fun m!388675 () Bool)

(assert (=> d!87014 m!388675))

(declare-fun m!388677 () Bool)

(assert (=> d!87014 m!388677))

(declare-fun m!388679 () Bool)

(assert (=> d!87014 m!388679))

(declare-fun m!388681 () Bool)

(assert (=> d!87014 m!388681))

(assert (=> b!259351 m!388679))

(assert (=> b!259351 m!388675))

(assert (=> b!259351 m!388617))

(declare-fun m!388683 () Bool)

(assert (=> b!259351 m!388683))

(assert (=> b!259351 m!388677))

(assert (=> b!259297 d!87014))

(declare-fun d!87018 () Bool)

(assert (=> d!87018 (= (inv!12 thiss!1754) (invariant!0 (currentBit!12363 thiss!1754) (currentByte!12368 thiss!1754) (size!6208 (buf!6730 thiss!1754))))))

(declare-fun bs!22040 () Bool)

(assert (= bs!22040 d!87018))

(assert (=> bs!22040 m!388663))

(assert (=> start!55780 d!87018))

(declare-fun d!87022 () Bool)

(assert (=> d!87022 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6208 (buf!6730 thiss!1754))) ((_ sign_extend 32) (currentByte!12368 thiss!1754)) ((_ sign_extend 32) (currentBit!12363 thiss!1754)) (bvsub nBits!535 from!526)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6208 (buf!6730 thiss!1754))) ((_ sign_extend 32) (currentByte!12368 thiss!1754)) ((_ sign_extend 32) (currentBit!12363 thiss!1754))) (bvsub nBits!535 from!526)))))

(declare-fun bs!22042 () Bool)

(assert (= bs!22042 d!87022))

(assert (=> bs!22042 m!388661))

(assert (=> b!259296 d!87022))

(push 1)

(assert (not d!87010))

(assert (not d!87018))

(assert (not b!259351))

(assert (not d!87002))

(assert (not d!87022))

(assert (not d!87014))

(check-sat)

(pop 1)

(push 1)

(check-sat)

