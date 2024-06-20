; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55700 () Bool)

(assert start!55700)

(declare-fun b!259073 () Bool)

(declare-fun res!217024 () Bool)

(declare-fun e!179726 () Bool)

(assert (=> b!259073 (=> (not res!217024) (not e!179726))))

(declare-fun from!526 () (_ BitVec 64))

(declare-fun nBits!535 () (_ BitVec 64))

(assert (=> b!259073 (= res!217024 (not (= from!526 nBits!535)))))

(declare-fun b!259074 () Bool)

(declare-fun res!217023 () Bool)

(assert (=> b!259074 (=> (not res!217023) (not e!179726))))

(declare-datatypes ((array!14143 0))(
  ( (array!14144 (arr!7182 (Array (_ BitVec 32) (_ BitVec 8))) (size!6195 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11312 0))(
  ( (BitStream!11313 (buf!6717 array!14143) (currentByte!12346 (_ BitVec 32)) (currentBit!12341 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11312)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!259074 (= res!217023 (validate_offset_bits!1 ((_ sign_extend 32) (size!6195 (buf!6717 thiss!1754))) ((_ sign_extend 32) (currentByte!12346 thiss!1754)) ((_ sign_extend 32) (currentBit!12341 thiss!1754)) (bvsub nBits!535 from!526)))))

(declare-fun b!259075 () Bool)

(declare-fun e!179725 () Bool)

(assert (=> b!259075 (= e!179726 e!179725)))

(declare-fun res!217027 () Bool)

(assert (=> b!259075 (=> (not res!217027) (not e!179725))))

(declare-datatypes ((tuple2!22176 0))(
  ( (tuple2!22177 (_1!12024 Bool) (_2!12024 BitStream!11312)) )
))
(declare-fun lt!400853 () tuple2!22176)

(declare-fun expected!109 () Bool)

(assert (=> b!259075 (= res!217027 (not (= (_1!12024 lt!400853) expected!109)))))

(declare-fun readBit!0 (BitStream!11312) tuple2!22176)

(assert (=> b!259075 (= lt!400853 (readBit!0 thiss!1754))))

(declare-fun res!217026 () Bool)

(assert (=> start!55700 (=> (not res!217026) (not e!179726))))

(assert (=> start!55700 (= res!217026 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!55700 e!179726))

(assert (=> start!55700 true))

(declare-fun e!179727 () Bool)

(declare-fun inv!12 (BitStream!11312) Bool)

(assert (=> start!55700 (and (inv!12 thiss!1754) e!179727)))

(declare-fun b!259076 () Bool)

(declare-fun array_inv!5936 (array!14143) Bool)

(assert (=> b!259076 (= e!179727 (array_inv!5936 (buf!6717 thiss!1754)))))

(declare-fun b!259077 () Bool)

(declare-fun e!179728 () Bool)

(assert (=> b!259077 (= e!179728 (or (not (= (buf!6717 thiss!1754) (buf!6717 (_2!12024 lt!400853)))) (= nBits!535 from!526)))))

(declare-fun b!259078 () Bool)

(assert (=> b!259078 (= e!179725 e!179728)))

(declare-fun res!217025 () Bool)

(assert (=> b!259078 (=> res!217025 e!179728)))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!259078 (= res!217025 (bvslt (bvsub (bvadd (bitIndex!0 (size!6195 (buf!6717 thiss!1754)) (currentByte!12346 thiss!1754) (currentBit!12341 thiss!1754)) nBits!535) from!526) (bitIndex!0 (size!6195 (buf!6717 (_2!12024 lt!400853))) (currentByte!12346 (_2!12024 lt!400853)) (currentBit!12341 (_2!12024 lt!400853)))))))

(assert (= (and start!55700 res!217026) b!259074))

(assert (= (and b!259074 res!217023) b!259073))

(assert (= (and b!259073 res!217024) b!259075))

(assert (= (and b!259075 res!217027) b!259078))

(assert (= (and b!259078 (not res!217025)) b!259077))

(assert (= start!55700 b!259076))

(declare-fun m!388403 () Bool)

(assert (=> b!259075 m!388403))

(declare-fun m!388405 () Bool)

(assert (=> b!259076 m!388405))

(declare-fun m!388407 () Bool)

(assert (=> start!55700 m!388407))

(declare-fun m!388409 () Bool)

(assert (=> b!259074 m!388409))

(declare-fun m!388411 () Bool)

(assert (=> b!259078 m!388411))

(declare-fun m!388413 () Bool)

(assert (=> b!259078 m!388413))

(push 1)

(assert (not b!259078))

(assert (not start!55700))

(assert (not b!259074))

(assert (not b!259076))

(assert (not b!259075))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!86942 () Bool)

(declare-fun e!179750 () Bool)

(assert (=> d!86942 e!179750))

(declare-fun res!217052 () Bool)

(assert (=> d!86942 (=> (not res!217052) (not e!179750))))

(declare-fun lt!400939 () (_ BitVec 64))

(declare-fun lt!400938 () (_ BitVec 64))

(declare-fun lt!400935 () (_ BitVec 64))

(assert (=> d!86942 (= res!217052 (= lt!400938 (bvsub lt!400935 lt!400939)))))

(assert (=> d!86942 (or (= (bvand lt!400935 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!400939 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!400935 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!400935 lt!400939) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!86942 (= lt!400939 (remainingBits!0 ((_ sign_extend 32) (size!6195 (buf!6717 thiss!1754))) ((_ sign_extend 32) (currentByte!12346 thiss!1754)) ((_ sign_extend 32) (currentBit!12341 thiss!1754))))))

(declare-fun lt!400936 () (_ BitVec 64))

(declare-fun lt!400940 () (_ BitVec 64))

(assert (=> d!86942 (= lt!400935 (bvmul lt!400936 lt!400940))))

(assert (=> d!86942 (or (= lt!400936 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!400940 (bvsdiv (bvmul lt!400936 lt!400940) lt!400936)))))

(assert (=> d!86942 (= lt!400940 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!86942 (= lt!400936 ((_ sign_extend 32) (size!6195 (buf!6717 thiss!1754))))))

(assert (=> d!86942 (= lt!400938 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12346 thiss!1754)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12341 thiss!1754))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!86942 (invariant!0 (currentBit!12341 thiss!1754) (currentByte!12346 thiss!1754) (size!6195 (buf!6717 thiss!1754)))))

(assert (=> d!86942 (= (bitIndex!0 (size!6195 (buf!6717 thiss!1754)) (currentByte!12346 thiss!1754) (currentBit!12341 thiss!1754)) lt!400938)))

(declare-fun b!259102 () Bool)

(declare-fun res!217051 () Bool)

(assert (=> b!259102 (=> (not res!217051) (not e!179750))))

(assert (=> b!259102 (= res!217051 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!400938))))

(declare-fun b!259103 () Bool)

(declare-fun lt!400937 () (_ BitVec 64))

(assert (=> b!259103 (= e!179750 (bvsle lt!400938 (bvmul lt!400937 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!259103 (or (= lt!400937 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!400937 #b0000000000000000000000000000000000000000000000000000000000001000) lt!400937)))))

(assert (=> b!259103 (= lt!400937 ((_ sign_extend 32) (size!6195 (buf!6717 thiss!1754))))))

(assert (= (and d!86942 res!217052) b!259102))

(assert (= (and b!259102 res!217051) b!259103))

(declare-fun m!388441 () Bool)

(assert (=> d!86942 m!388441))

(declare-fun m!388443 () Bool)

(assert (=> d!86942 m!388443))

(assert (=> b!259078 d!86942))

(declare-fun d!86952 () Bool)

(declare-fun e!179751 () Bool)

(assert (=> d!86952 e!179751))

(declare-fun res!217054 () Bool)

(assert (=> d!86952 (=> (not res!217054) (not e!179751))))

(declare-fun lt!400944 () (_ BitVec 64))

(declare-fun lt!400941 () (_ BitVec 64))

(declare-fun lt!400945 () (_ BitVec 64))

(assert (=> d!86952 (= res!217054 (= lt!400944 (bvsub lt!400941 lt!400945)))))

(assert (=> d!86952 (or (= (bvand lt!400941 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!400945 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!400941 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!400941 lt!400945) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!86952 (= lt!400945 (remainingBits!0 ((_ sign_extend 32) (size!6195 (buf!6717 (_2!12024 lt!400853)))) ((_ sign_extend 32) (currentByte!12346 (_2!12024 lt!400853))) ((_ sign_extend 32) (currentBit!12341 (_2!12024 lt!400853)))))))

(declare-fun lt!400942 () (_ BitVec 64))

(declare-fun lt!400946 () (_ BitVec 64))

(assert (=> d!86952 (= lt!400941 (bvmul lt!400942 lt!400946))))

(assert (=> d!86952 (or (= lt!400942 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!400946 (bvsdiv (bvmul lt!400942 lt!400946) lt!400942)))))

(assert (=> d!86952 (= lt!400946 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!86952 (= lt!400942 ((_ sign_extend 32) (size!6195 (buf!6717 (_2!12024 lt!400853)))))))

(assert (=> d!86952 (= lt!400944 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12346 (_2!12024 lt!400853))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12341 (_2!12024 lt!400853)))))))

(assert (=> d!86952 (invariant!0 (currentBit!12341 (_2!12024 lt!400853)) (currentByte!12346 (_2!12024 lt!400853)) (size!6195 (buf!6717 (_2!12024 lt!400853))))))

(assert (=> d!86952 (= (bitIndex!0 (size!6195 (buf!6717 (_2!12024 lt!400853))) (currentByte!12346 (_2!12024 lt!400853)) (currentBit!12341 (_2!12024 lt!400853))) lt!400944)))

(declare-fun b!259104 () Bool)

(declare-fun res!217053 () Bool)

(assert (=> b!259104 (=> (not res!217053) (not e!179751))))

(assert (=> b!259104 (= res!217053 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!400944))))

(declare-fun b!259105 () Bool)

(declare-fun lt!400943 () (_ BitVec 64))

(assert (=> b!259105 (= e!179751 (bvsle lt!400944 (bvmul lt!400943 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!259105 (or (= lt!400943 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!400943 #b0000000000000000000000000000000000000000000000000000000000001000) lt!400943)))))

(assert (=> b!259105 (= lt!400943 ((_ sign_extend 32) (size!6195 (buf!6717 (_2!12024 lt!400853)))))))

(assert (= (and d!86952 res!217054) b!259104))

(assert (= (and b!259104 res!217053) b!259105))

(declare-fun m!388445 () Bool)

(assert (=> d!86952 m!388445))

(declare-fun m!388447 () Bool)

(assert (=> d!86952 m!388447))

(assert (=> b!259078 d!86952))

(declare-fun d!86954 () Bool)

(assert (=> d!86954 (= (array_inv!5936 (buf!6717 thiss!1754)) (bvsge (size!6195 (buf!6717 thiss!1754)) #b00000000000000000000000000000000))))

(assert (=> b!259076 d!86954))

(declare-fun d!86956 () Bool)

(declare-fun e!179761 () Bool)

(assert (=> d!86956 e!179761))

(declare-fun res!217060 () Bool)

(assert (=> d!86956 (=> (not res!217060) (not e!179761))))

(declare-datatypes ((Unit!18451 0))(
  ( (Unit!18452) )
))
(declare-datatypes ((tuple2!22182 0))(
  ( (tuple2!22183 (_1!12027 Unit!18451) (_2!12027 BitStream!11312)) )
))
(declare-fun increaseBitIndex!0 (BitStream!11312) tuple2!22182)

(assert (=> d!86956 (= res!217060 (= (buf!6717 (_2!12027 (increaseBitIndex!0 thiss!1754))) (buf!6717 thiss!1754)))))

(declare-fun lt!400988 () Bool)

(assert (=> d!86956 (= lt!400988 (not (= (bvand ((_ sign_extend 24) (select (arr!7182 (buf!6717 thiss!1754)) (currentByte!12346 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12341 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!400986 () tuple2!22176)

(assert (=> d!86956 (= lt!400986 (tuple2!22177 (not (= (bvand ((_ sign_extend 24) (select (arr!7182 (buf!6717 thiss!1754)) (currentByte!12346 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12341 thiss!1754)))) #b00000000000000000000000000000000)) (_2!12027 (increaseBitIndex!0 thiss!1754))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!86956 (validate_offset_bit!0 ((_ sign_extend 32) (size!6195 (buf!6717 thiss!1754))) ((_ sign_extend 32) (currentByte!12346 thiss!1754)) ((_ sign_extend 32) (currentBit!12341 thiss!1754)))))

(assert (=> d!86956 (= (readBit!0 thiss!1754) lt!400986)))

(declare-fun lt!400984 () (_ BitVec 64))

(declare-fun lt!400983 () (_ BitVec 64))

(declare-fun b!259111 () Bool)

(assert (=> b!259111 (= e!179761 (= (bitIndex!0 (size!6195 (buf!6717 (_2!12027 (increaseBitIndex!0 thiss!1754)))) (currentByte!12346 (_2!12027 (increaseBitIndex!0 thiss!1754))) (currentBit!12341 (_2!12027 (increaseBitIndex!0 thiss!1754)))) (bvadd lt!400984 lt!400983)))))

(assert (=> b!259111 (or (not (= (bvand lt!400984 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!400983 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!400984 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!400984 lt!400983) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!259111 (= lt!400983 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!259111 (= lt!400984 (bitIndex!0 (size!6195 (buf!6717 thiss!1754)) (currentByte!12346 thiss!1754) (currentBit!12341 thiss!1754)))))

(declare-fun lt!400985 () Bool)

(assert (=> b!259111 (= lt!400985 (not (= (bvand ((_ sign_extend 24) (select (arr!7182 (buf!6717 thiss!1754)) (currentByte!12346 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12341 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!400982 () Bool)

(assert (=> b!259111 (= lt!400982 (not (= (bvand ((_ sign_extend 24) (select (arr!7182 (buf!6717 thiss!1754)) (currentByte!12346 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12341 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!400987 () Bool)

(assert (=> b!259111 (= lt!400987 (not (= (bvand ((_ sign_extend 24) (select (arr!7182 (buf!6717 thiss!1754)) (currentByte!12346 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12341 thiss!1754)))) #b00000000000000000000000000000000)))))

(assert (= (and d!86956 res!217060) b!259111))

(declare-fun m!388459 () Bool)

(assert (=> d!86956 m!388459))

(declare-fun m!388461 () Bool)

(assert (=> d!86956 m!388461))

(declare-fun m!388463 () Bool)

(assert (=> d!86956 m!388463))

(declare-fun m!388465 () Bool)

(assert (=> d!86956 m!388465))

(assert (=> b!259111 m!388461))

(assert (=> b!259111 m!388459))

(declare-fun m!388467 () Bool)

(assert (=> b!259111 m!388467))

(assert (=> b!259111 m!388463))

(assert (=> b!259111 m!388411))

(assert (=> b!259075 d!86956))

(declare-fun d!86958 () Bool)

(assert (=> d!86958 (= (inv!12 thiss!1754) (invariant!0 (currentBit!12341 thiss!1754) (currentByte!12346 thiss!1754) (size!6195 (buf!6717 thiss!1754))))))

(declare-fun bs!22015 () Bool)

(assert (= bs!22015 d!86958))

(assert (=> bs!22015 m!388443))

(assert (=> start!55700 d!86958))

(declare-fun d!86960 () Bool)

(assert (=> d!86960 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6195 (buf!6717 thiss!1754))) ((_ sign_extend 32) (currentByte!12346 thiss!1754)) ((_ sign_extend 32) (currentBit!12341 thiss!1754)) (bvsub nBits!535 from!526)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6195 (buf!6717 thiss!1754))) ((_ sign_extend 32) (currentByte!12346 thiss!1754)) ((_ sign_extend 32) (currentBit!12341 thiss!1754))) (bvsub nBits!535 from!526)))))

(declare-fun bs!22016 () Bool)

(assert (= bs!22016 d!86960))

(assert (=> bs!22016 m!388441))

(assert (=> b!259074 d!86960))

(push 1)

(assert (not b!259111))

(assert (not d!86952))

(assert (not d!86956))

(assert (not d!86942))

(assert (not d!86960))

(assert (not d!86958))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

