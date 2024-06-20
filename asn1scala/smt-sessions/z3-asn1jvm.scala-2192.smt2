; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55614 () Bool)

(assert start!55614)

(declare-fun nBits!535 () (_ BitVec 64))

(declare-fun e!179515 () Bool)

(declare-fun lt!400532 () (_ BitVec 64))

(declare-fun lt!400531 () (_ BitVec 64))

(declare-fun b!258816 () Bool)

(assert (=> b!258816 (= e!179515 (and (= lt!400531 (bvand nBits!535 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!400531 (bvand (bvadd lt!400532 nBits!535) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!258816 (= lt!400531 (bvand lt!400532 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((array!14111 0))(
  ( (array!14112 (arr!7169 (Array (_ BitVec 32) (_ BitVec 8))) (size!6182 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11286 0))(
  ( (BitStream!11287 (buf!6704 array!14111) (currentByte!12321 (_ BitVec 32)) (currentBit!12316 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11286)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!258816 (= lt!400532 (bitIndex!0 (size!6182 (buf!6704 thiss!1754)) (currentByte!12321 thiss!1754) (currentBit!12316 thiss!1754)))))

(declare-fun b!258817 () Bool)

(declare-fun res!216807 () Bool)

(assert (=> b!258817 (=> (not res!216807) (not e!179515))))

(declare-fun from!526 () (_ BitVec 64))

(assert (=> b!258817 (= res!216807 (not (= from!526 nBits!535)))))

(declare-fun res!216805 () Bool)

(assert (=> start!55614 (=> (not res!216805) (not e!179515))))

(assert (=> start!55614 (= res!216805 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!55614 e!179515))

(assert (=> start!55614 true))

(declare-fun e!179514 () Bool)

(declare-fun inv!12 (BitStream!11286) Bool)

(assert (=> start!55614 (and (inv!12 thiss!1754) e!179514)))

(declare-fun b!258818 () Bool)

(declare-fun array_inv!5923 (array!14111) Bool)

(assert (=> b!258818 (= e!179514 (array_inv!5923 (buf!6704 thiss!1754)))))

(declare-fun b!258819 () Bool)

(declare-fun res!216806 () Bool)

(assert (=> b!258819 (=> (not res!216806) (not e!179515))))

(declare-fun expected!109 () Bool)

(declare-datatypes ((tuple2!22138 0))(
  ( (tuple2!22139 (_1!12005 Bool) (_2!12005 BitStream!11286)) )
))
(declare-fun readBit!0 (BitStream!11286) tuple2!22138)

(assert (=> b!258819 (= res!216806 (not (= (_1!12005 (readBit!0 thiss!1754)) expected!109)))))

(declare-fun b!258820 () Bool)

(declare-fun res!216808 () Bool)

(assert (=> b!258820 (=> (not res!216808) (not e!179515))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!258820 (= res!216808 (validate_offset_bits!1 ((_ sign_extend 32) (size!6182 (buf!6704 thiss!1754))) ((_ sign_extend 32) (currentByte!12321 thiss!1754)) ((_ sign_extend 32) (currentBit!12316 thiss!1754)) (bvsub nBits!535 from!526)))))

(assert (= (and start!55614 res!216805) b!258820))

(assert (= (and b!258820 res!216808) b!258817))

(assert (= (and b!258817 res!216807) b!258819))

(assert (= (and b!258819 res!216806) b!258816))

(assert (= start!55614 b!258818))

(declare-fun m!388173 () Bool)

(assert (=> b!258816 m!388173))

(declare-fun m!388175 () Bool)

(assert (=> b!258819 m!388175))

(declare-fun m!388177 () Bool)

(assert (=> b!258820 m!388177))

(declare-fun m!388179 () Bool)

(assert (=> start!55614 m!388179))

(declare-fun m!388181 () Bool)

(assert (=> b!258818 m!388181))

(check-sat (not start!55614) (not b!258818) (not b!258816) (not b!258820) (not b!258819))
(check-sat)
(get-model)

(declare-fun d!86858 () Bool)

(assert (=> d!86858 (= (array_inv!5923 (buf!6704 thiss!1754)) (bvsge (size!6182 (buf!6704 thiss!1754)) #b00000000000000000000000000000000))))

(assert (=> b!258818 d!86858))

(declare-fun d!86860 () Bool)

(declare-fun e!179532 () Bool)

(assert (=> d!86860 e!179532))

(declare-fun res!216823 () Bool)

(assert (=> d!86860 (=> (not res!216823) (not e!179532))))

(declare-datatypes ((Unit!18435 0))(
  ( (Unit!18436) )
))
(declare-datatypes ((tuple2!22142 0))(
  ( (tuple2!22143 (_1!12007 Unit!18435) (_2!12007 BitStream!11286)) )
))
(declare-fun increaseBitIndex!0 (BitStream!11286) tuple2!22142)

(assert (=> d!86860 (= res!216823 (= (buf!6704 (_2!12007 (increaseBitIndex!0 thiss!1754))) (buf!6704 thiss!1754)))))

(declare-fun lt!400559 () Bool)

(assert (=> d!86860 (= lt!400559 (not (= (bvand ((_ sign_extend 24) (select (arr!7169 (buf!6704 thiss!1754)) (currentByte!12321 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12316 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!400553 () tuple2!22138)

(assert (=> d!86860 (= lt!400553 (tuple2!22139 (not (= (bvand ((_ sign_extend 24) (select (arr!7169 (buf!6704 thiss!1754)) (currentByte!12321 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12316 thiss!1754)))) #b00000000000000000000000000000000)) (_2!12007 (increaseBitIndex!0 thiss!1754))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!86860 (validate_offset_bit!0 ((_ sign_extend 32) (size!6182 (buf!6704 thiss!1754))) ((_ sign_extend 32) (currentByte!12321 thiss!1754)) ((_ sign_extend 32) (currentBit!12316 thiss!1754)))))

(assert (=> d!86860 (= (readBit!0 thiss!1754) lt!400553)))

(declare-fun lt!400557 () (_ BitVec 64))

(declare-fun lt!400555 () (_ BitVec 64))

(declare-fun b!258838 () Bool)

(assert (=> b!258838 (= e!179532 (= (bitIndex!0 (size!6182 (buf!6704 (_2!12007 (increaseBitIndex!0 thiss!1754)))) (currentByte!12321 (_2!12007 (increaseBitIndex!0 thiss!1754))) (currentBit!12316 (_2!12007 (increaseBitIndex!0 thiss!1754)))) (bvadd lt!400555 lt!400557)))))

(assert (=> b!258838 (or (not (= (bvand lt!400555 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!400557 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!400555 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!400555 lt!400557) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!258838 (= lt!400557 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!258838 (= lt!400555 (bitIndex!0 (size!6182 (buf!6704 thiss!1754)) (currentByte!12321 thiss!1754) (currentBit!12316 thiss!1754)))))

(declare-fun lt!400556 () Bool)

(assert (=> b!258838 (= lt!400556 (not (= (bvand ((_ sign_extend 24) (select (arr!7169 (buf!6704 thiss!1754)) (currentByte!12321 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12316 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!400554 () Bool)

(assert (=> b!258838 (= lt!400554 (not (= (bvand ((_ sign_extend 24) (select (arr!7169 (buf!6704 thiss!1754)) (currentByte!12321 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12316 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!400558 () Bool)

(assert (=> b!258838 (= lt!400558 (not (= (bvand ((_ sign_extend 24) (select (arr!7169 (buf!6704 thiss!1754)) (currentByte!12321 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12316 thiss!1754)))) #b00000000000000000000000000000000)))))

(assert (= (and d!86860 res!216823) b!258838))

(declare-fun m!388197 () Bool)

(assert (=> d!86860 m!388197))

(declare-fun m!388199 () Bool)

(assert (=> d!86860 m!388199))

(declare-fun m!388201 () Bool)

(assert (=> d!86860 m!388201))

(declare-fun m!388203 () Bool)

(assert (=> d!86860 m!388203))

(assert (=> b!258838 m!388197))

(assert (=> b!258838 m!388173))

(assert (=> b!258838 m!388199))

(assert (=> b!258838 m!388201))

(declare-fun m!388205 () Bool)

(assert (=> b!258838 m!388205))

(assert (=> b!258819 d!86860))

(declare-fun d!86870 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!86870 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6182 (buf!6704 thiss!1754))) ((_ sign_extend 32) (currentByte!12321 thiss!1754)) ((_ sign_extend 32) (currentBit!12316 thiss!1754)) (bvsub nBits!535 from!526)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6182 (buf!6704 thiss!1754))) ((_ sign_extend 32) (currentByte!12321 thiss!1754)) ((_ sign_extend 32) (currentBit!12316 thiss!1754))) (bvsub nBits!535 from!526)))))

(declare-fun bs!21989 () Bool)

(assert (= bs!21989 d!86870))

(declare-fun m!388207 () Bool)

(assert (=> bs!21989 m!388207))

(assert (=> b!258820 d!86870))

(declare-fun d!86872 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!86872 (= (inv!12 thiss!1754) (invariant!0 (currentBit!12316 thiss!1754) (currentByte!12321 thiss!1754) (size!6182 (buf!6704 thiss!1754))))))

(declare-fun bs!21990 () Bool)

(assert (= bs!21990 d!86872))

(declare-fun m!388209 () Bool)

(assert (=> bs!21990 m!388209))

(assert (=> start!55614 d!86872))

(declare-fun d!86874 () Bool)

(declare-fun e!179541 () Bool)

(assert (=> d!86874 e!179541))

(declare-fun res!216831 () Bool)

(assert (=> d!86874 (=> (not res!216831) (not e!179541))))

(declare-fun lt!400594 () (_ BitVec 64))

(declare-fun lt!400593 () (_ BitVec 64))

(declare-fun lt!400596 () (_ BitVec 64))

(assert (=> d!86874 (= res!216831 (= lt!400594 (bvsub lt!400596 lt!400593)))))

(assert (=> d!86874 (or (= (bvand lt!400596 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!400593 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!400596 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!400596 lt!400593) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!86874 (= lt!400593 (remainingBits!0 ((_ sign_extend 32) (size!6182 (buf!6704 thiss!1754))) ((_ sign_extend 32) (currentByte!12321 thiss!1754)) ((_ sign_extend 32) (currentBit!12316 thiss!1754))))))

(declare-fun lt!400598 () (_ BitVec 64))

(declare-fun lt!400595 () (_ BitVec 64))

(assert (=> d!86874 (= lt!400596 (bvmul lt!400598 lt!400595))))

(assert (=> d!86874 (or (= lt!400598 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!400595 (bvsdiv (bvmul lt!400598 lt!400595) lt!400598)))))

(assert (=> d!86874 (= lt!400595 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!86874 (= lt!400598 ((_ sign_extend 32) (size!6182 (buf!6704 thiss!1754))))))

(assert (=> d!86874 (= lt!400594 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12321 thiss!1754)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12316 thiss!1754))))))

(assert (=> d!86874 (invariant!0 (currentBit!12316 thiss!1754) (currentByte!12321 thiss!1754) (size!6182 (buf!6704 thiss!1754)))))

(assert (=> d!86874 (= (bitIndex!0 (size!6182 (buf!6704 thiss!1754)) (currentByte!12321 thiss!1754) (currentBit!12316 thiss!1754)) lt!400594)))

(declare-fun b!258846 () Bool)

(declare-fun res!216832 () Bool)

(assert (=> b!258846 (=> (not res!216832) (not e!179541))))

(assert (=> b!258846 (= res!216832 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!400594))))

(declare-fun b!258847 () Bool)

(declare-fun lt!400597 () (_ BitVec 64))

(assert (=> b!258847 (= e!179541 (bvsle lt!400594 (bvmul lt!400597 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!258847 (or (= lt!400597 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!400597 #b0000000000000000000000000000000000000000000000000000000000001000) lt!400597)))))

(assert (=> b!258847 (= lt!400597 ((_ sign_extend 32) (size!6182 (buf!6704 thiss!1754))))))

(assert (= (and d!86874 res!216831) b!258846))

(assert (= (and b!258846 res!216832) b!258847))

(assert (=> d!86874 m!388207))

(assert (=> d!86874 m!388209))

(assert (=> b!258816 d!86874))

(check-sat (not d!86874) (not d!86860) (not d!86870) (not d!86872) (not b!258838))
