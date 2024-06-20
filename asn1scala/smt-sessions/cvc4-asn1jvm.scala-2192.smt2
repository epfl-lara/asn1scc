; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55616 () Bool)

(assert start!55616)

(declare-fun b!258831 () Bool)

(declare-fun res!216817 () Bool)

(declare-fun e!179523 () Bool)

(assert (=> b!258831 (=> (not res!216817) (not e!179523))))

(declare-fun nBits!535 () (_ BitVec 64))

(declare-datatypes ((array!14113 0))(
  ( (array!14114 (arr!7170 (Array (_ BitVec 32) (_ BitVec 8))) (size!6183 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11288 0))(
  ( (BitStream!11289 (buf!6705 array!14113) (currentByte!12322 (_ BitVec 32)) (currentBit!12317 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11288)

(declare-fun from!526 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!258831 (= res!216817 (validate_offset_bits!1 ((_ sign_extend 32) (size!6183 (buf!6705 thiss!1754))) ((_ sign_extend 32) (currentByte!12322 thiss!1754)) ((_ sign_extend 32) (currentBit!12317 thiss!1754)) (bvsub nBits!535 from!526)))))

(declare-fun b!258832 () Bool)

(declare-fun res!216820 () Bool)

(assert (=> b!258832 (=> (not res!216820) (not e!179523))))

(assert (=> b!258832 (= res!216820 (not (= from!526 nBits!535)))))

(declare-fun lt!400538 () (_ BitVec 64))

(declare-fun b!258833 () Bool)

(declare-fun lt!400537 () (_ BitVec 64))

(assert (=> b!258833 (= e!179523 (and (= lt!400538 (bvand nBits!535 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!400538 (bvand (bvadd lt!400537 nBits!535) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!258833 (= lt!400538 (bvand lt!400537 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!258833 (= lt!400537 (bitIndex!0 (size!6183 (buf!6705 thiss!1754)) (currentByte!12322 thiss!1754) (currentBit!12317 thiss!1754)))))

(declare-fun res!216818 () Bool)

(assert (=> start!55616 (=> (not res!216818) (not e!179523))))

(assert (=> start!55616 (= res!216818 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!55616 e!179523))

(assert (=> start!55616 true))

(declare-fun e!179522 () Bool)

(declare-fun inv!12 (BitStream!11288) Bool)

(assert (=> start!55616 (and (inv!12 thiss!1754) e!179522)))

(declare-fun b!258834 () Bool)

(declare-fun array_inv!5924 (array!14113) Bool)

(assert (=> b!258834 (= e!179522 (array_inv!5924 (buf!6705 thiss!1754)))))

(declare-fun b!258835 () Bool)

(declare-fun res!216819 () Bool)

(assert (=> b!258835 (=> (not res!216819) (not e!179523))))

(declare-fun expected!109 () Bool)

(declare-datatypes ((tuple2!22140 0))(
  ( (tuple2!22141 (_1!12006 Bool) (_2!12006 BitStream!11288)) )
))
(declare-fun readBit!0 (BitStream!11288) tuple2!22140)

(assert (=> b!258835 (= res!216819 (not (= (_1!12006 (readBit!0 thiss!1754)) expected!109)))))

(assert (= (and start!55616 res!216818) b!258831))

(assert (= (and b!258831 res!216817) b!258832))

(assert (= (and b!258832 res!216820) b!258835))

(assert (= (and b!258835 res!216819) b!258833))

(assert (= start!55616 b!258834))

(declare-fun m!388183 () Bool)

(assert (=> b!258834 m!388183))

(declare-fun m!388185 () Bool)

(assert (=> b!258831 m!388185))

(declare-fun m!388187 () Bool)

(assert (=> start!55616 m!388187))

(declare-fun m!388189 () Bool)

(assert (=> b!258835 m!388189))

(declare-fun m!388191 () Bool)

(assert (=> b!258833 m!388191))

(push 1)

(assert (not b!258835))

(assert (not b!258831))

(assert (not b!258834))

(assert (not b!258833))

(assert (not start!55616))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!86876 () Bool)

(declare-fun e!179547 () Bool)

(assert (=> d!86876 e!179547))

(declare-fun res!216843 () Bool)

(assert (=> d!86876 (=> (not res!216843) (not e!179547))))

(declare-fun lt!400629 () (_ BitVec 64))

(declare-fun lt!400632 () (_ BitVec 64))

(declare-fun lt!400630 () (_ BitVec 64))

(assert (=> d!86876 (= res!216843 (= lt!400629 (bvsub lt!400630 lt!400632)))))

(assert (=> d!86876 (or (= (bvand lt!400630 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!400632 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!400630 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!400630 lt!400632) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!86876 (= lt!400632 (remainingBits!0 ((_ sign_extend 32) (size!6183 (buf!6705 thiss!1754))) ((_ sign_extend 32) (currentByte!12322 thiss!1754)) ((_ sign_extend 32) (currentBit!12317 thiss!1754))))))

(declare-fun lt!400631 () (_ BitVec 64))

(declare-fun lt!400634 () (_ BitVec 64))

(assert (=> d!86876 (= lt!400630 (bvmul lt!400631 lt!400634))))

(assert (=> d!86876 (or (= lt!400631 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!400634 (bvsdiv (bvmul lt!400631 lt!400634) lt!400631)))))

(assert (=> d!86876 (= lt!400634 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!86876 (= lt!400631 ((_ sign_extend 32) (size!6183 (buf!6705 thiss!1754))))))

(assert (=> d!86876 (= lt!400629 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12322 thiss!1754)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12317 thiss!1754))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!86876 (invariant!0 (currentBit!12317 thiss!1754) (currentByte!12322 thiss!1754) (size!6183 (buf!6705 thiss!1754)))))

(assert (=> d!86876 (= (bitIndex!0 (size!6183 (buf!6705 thiss!1754)) (currentByte!12322 thiss!1754) (currentBit!12317 thiss!1754)) lt!400629)))

(declare-fun b!258858 () Bool)

(declare-fun res!216844 () Bool)

(assert (=> b!258858 (=> (not res!216844) (not e!179547))))

(assert (=> b!258858 (= res!216844 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!400629))))

(declare-fun b!258859 () Bool)

(declare-fun lt!400633 () (_ BitVec 64))

(assert (=> b!258859 (= e!179547 (bvsle lt!400629 (bvmul lt!400633 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!258859 (or (= lt!400633 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!400633 #b0000000000000000000000000000000000000000000000000000000000001000) lt!400633)))))

(assert (=> b!258859 (= lt!400633 ((_ sign_extend 32) (size!6183 (buf!6705 thiss!1754))))))

(assert (= (and d!86876 res!216843) b!258858))

(assert (= (and b!258858 res!216844) b!258859))

(declare-fun m!388221 () Bool)

(assert (=> d!86876 m!388221))

(declare-fun m!388223 () Bool)

(assert (=> d!86876 m!388223))

(assert (=> b!258833 d!86876))

(declare-fun d!86880 () Bool)

(assert (=> d!86880 (= (array_inv!5924 (buf!6705 thiss!1754)) (bvsge (size!6183 (buf!6705 thiss!1754)) #b00000000000000000000000000000000))))

(assert (=> b!258834 d!86880))

(declare-fun d!86882 () Bool)

(declare-fun e!179554 () Bool)

(assert (=> d!86882 e!179554))

(declare-fun res!216847 () Bool)

(assert (=> d!86882 (=> (not res!216847) (not e!179554))))

(declare-datatypes ((Unit!18439 0))(
  ( (Unit!18440) )
))
(declare-datatypes ((tuple2!22146 0))(
  ( (tuple2!22147 (_1!12009 Unit!18439) (_2!12009 BitStream!11288)) )
))
(declare-fun increaseBitIndex!0 (BitStream!11288) tuple2!22146)

(assert (=> d!86882 (= res!216847 (= (buf!6705 (_2!12009 (increaseBitIndex!0 thiss!1754))) (buf!6705 thiss!1754)))))

(declare-fun lt!400652 () Bool)

(assert (=> d!86882 (= lt!400652 (not (= (bvand ((_ sign_extend 24) (select (arr!7170 (buf!6705 thiss!1754)) (currentByte!12322 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12317 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!400650 () tuple2!22140)

(assert (=> d!86882 (= lt!400650 (tuple2!22141 (not (= (bvand ((_ sign_extend 24) (select (arr!7170 (buf!6705 thiss!1754)) (currentByte!12322 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12317 thiss!1754)))) #b00000000000000000000000000000000)) (_2!12009 (increaseBitIndex!0 thiss!1754))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!86882 (validate_offset_bit!0 ((_ sign_extend 32) (size!6183 (buf!6705 thiss!1754))) ((_ sign_extend 32) (currentByte!12322 thiss!1754)) ((_ sign_extend 32) (currentBit!12317 thiss!1754)))))

(assert (=> d!86882 (= (readBit!0 thiss!1754) lt!400650)))

(declare-fun lt!400655 () (_ BitVec 64))

(declare-fun lt!400654 () (_ BitVec 64))

(declare-fun b!258862 () Bool)

(assert (=> b!258862 (= e!179554 (= (bitIndex!0 (size!6183 (buf!6705 (_2!12009 (increaseBitIndex!0 thiss!1754)))) (currentByte!12322 (_2!12009 (increaseBitIndex!0 thiss!1754))) (currentBit!12317 (_2!12009 (increaseBitIndex!0 thiss!1754)))) (bvadd lt!400654 lt!400655)))))

(assert (=> b!258862 (or (not (= (bvand lt!400654 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!400655 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!400654 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!400654 lt!400655) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!258862 (= lt!400655 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!258862 (= lt!400654 (bitIndex!0 (size!6183 (buf!6705 thiss!1754)) (currentByte!12322 thiss!1754) (currentBit!12317 thiss!1754)))))

(declare-fun lt!400651 () Bool)

(assert (=> b!258862 (= lt!400651 (not (= (bvand ((_ sign_extend 24) (select (arr!7170 (buf!6705 thiss!1754)) (currentByte!12322 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12317 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!400653 () Bool)

(assert (=> b!258862 (= lt!400653 (not (= (bvand ((_ sign_extend 24) (select (arr!7170 (buf!6705 thiss!1754)) (currentByte!12322 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12317 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!400649 () Bool)

(assert (=> b!258862 (= lt!400649 (not (= (bvand ((_ sign_extend 24) (select (arr!7170 (buf!6705 thiss!1754)) (currentByte!12322 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12317 thiss!1754)))) #b00000000000000000000000000000000)))))

(assert (= (and d!86882 res!216847) b!258862))

(declare-fun m!388225 () Bool)

(assert (=> d!86882 m!388225))

(declare-fun m!388227 () Bool)

(assert (=> d!86882 m!388227))

(declare-fun m!388229 () Bool)

(assert (=> d!86882 m!388229))

(declare-fun m!388231 () Bool)

(assert (=> d!86882 m!388231))

(declare-fun m!388233 () Bool)

(assert (=> b!258862 m!388233))

(assert (=> b!258862 m!388225))

(assert (=> b!258862 m!388191))

(assert (=> b!258862 m!388227))

(assert (=> b!258862 m!388229))

(assert (=> b!258835 d!86882))

(declare-fun d!86884 () Bool)

(assert (=> d!86884 (= (inv!12 thiss!1754) (invariant!0 (currentBit!12317 thiss!1754) (currentByte!12322 thiss!1754) (size!6183 (buf!6705 thiss!1754))))))

(declare-fun bs!21991 () Bool)

(assert (= bs!21991 d!86884))

(assert (=> bs!21991 m!388223))

(assert (=> start!55616 d!86884))

(declare-fun d!86886 () Bool)

(assert (=> d!86886 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6183 (buf!6705 thiss!1754))) ((_ sign_extend 32) (currentByte!12322 thiss!1754)) ((_ sign_extend 32) (currentBit!12317 thiss!1754)) (bvsub nBits!535 from!526)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6183 (buf!6705 thiss!1754))) ((_ sign_extend 32) (currentByte!12322 thiss!1754)) ((_ sign_extend 32) (currentBit!12317 thiss!1754))) (bvsub nBits!535 from!526)))))

(declare-fun bs!21992 () Bool)

(assert (= bs!21992 d!86886))

(assert (=> bs!21992 m!388221))

(assert (=> b!258831 d!86886))

(push 1)

(assert (not d!86884))

(assert (not b!258862))

(assert (not d!86886))

(assert (not d!86876))

(assert (not d!86882))

(check-sat)

(pop 1)

(push 1)

(check-sat)

