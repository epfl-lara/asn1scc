; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55648 () Bool)

(assert start!55648)

(declare-fun res!216856 () Bool)

(declare-fun e!179563 () Bool)

(assert (=> start!55648 (=> (not res!216856) (not e!179563))))

(declare-fun nBits!535 () (_ BitVec 64))

(declare-fun from!526 () (_ BitVec 64))

(assert (=> start!55648 (= res!216856 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!55648 e!179563))

(assert (=> start!55648 true))

(declare-datatypes ((array!14118 0))(
  ( (array!14119 (arr!7171 (Array (_ BitVec 32) (_ BitVec 8))) (size!6184 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11290 0))(
  ( (BitStream!11291 (buf!6706 array!14118) (currentByte!12329 (_ BitVec 32)) (currentBit!12324 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11290)

(declare-fun e!179562 () Bool)

(declare-fun inv!12 (BitStream!11290) Bool)

(assert (=> start!55648 (and (inv!12 thiss!1754) e!179562)))

(declare-fun b!258873 () Bool)

(declare-fun res!216857 () Bool)

(assert (=> b!258873 (=> (not res!216857) (not e!179563))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!258873 (= res!216857 (validate_offset_bits!1 ((_ sign_extend 32) (size!6184 (buf!6706 thiss!1754))) ((_ sign_extend 32) (currentByte!12329 thiss!1754)) ((_ sign_extend 32) (currentBit!12324 thiss!1754)) (bvsub nBits!535 from!526)))))

(declare-fun lt!400661 () (_ BitVec 64))

(declare-fun b!258874 () Bool)

(declare-fun lt!400660 () (_ BitVec 64))

(assert (=> b!258874 (= e!179563 (and (not (= lt!400661 (bvand from!526 #b1000000000000000000000000000000000000000000000000000000000000000))) (not (= lt!400661 (bvand (bvsub lt!400660 from!526) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!258874 (= lt!400661 (bvand lt!400660 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!258874 (= lt!400660 (bvadd (bitIndex!0 (size!6184 (buf!6706 thiss!1754)) (currentByte!12329 thiss!1754) (currentBit!12324 thiss!1754)) nBits!535))))

(declare-fun b!258875 () Bool)

(declare-fun res!216859 () Bool)

(assert (=> b!258875 (=> (not res!216859) (not e!179563))))

(assert (=> b!258875 (= res!216859 (not (= from!526 nBits!535)))))

(declare-fun b!258876 () Bool)

(declare-fun res!216858 () Bool)

(assert (=> b!258876 (=> (not res!216858) (not e!179563))))

(declare-fun expected!109 () Bool)

(declare-datatypes ((tuple2!22148 0))(
  ( (tuple2!22149 (_1!12010 Bool) (_2!12010 BitStream!11290)) )
))
(declare-fun readBit!0 (BitStream!11290) tuple2!22148)

(assert (=> b!258876 (= res!216858 (not (= (_1!12010 (readBit!0 thiss!1754)) expected!109)))))

(declare-fun b!258877 () Bool)

(declare-fun array_inv!5925 (array!14118) Bool)

(assert (=> b!258877 (= e!179562 (array_inv!5925 (buf!6706 thiss!1754)))))

(assert (= (and start!55648 res!216856) b!258873))

(assert (= (and b!258873 res!216857) b!258875))

(assert (= (and b!258875 res!216859) b!258876))

(assert (= (and b!258876 res!216858) b!258874))

(assert (= start!55648 b!258877))

(declare-fun m!388235 () Bool)

(assert (=> b!258873 m!388235))

(declare-fun m!388237 () Bool)

(assert (=> start!55648 m!388237))

(declare-fun m!388239 () Bool)

(assert (=> b!258876 m!388239))

(declare-fun m!388241 () Bool)

(assert (=> b!258874 m!388241))

(declare-fun m!388243 () Bool)

(assert (=> b!258877 m!388243))

(push 1)

(assert (not b!258877))

(assert (not b!258873))

(assert (not start!55648))

(assert (not b!258874))

(assert (not b!258876))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!86896 () Bool)

(declare-fun e!179595 () Bool)

(assert (=> d!86896 e!179595))

(declare-fun res!216892 () Bool)

(assert (=> d!86896 (=> (not res!216892) (not e!179595))))

(declare-datatypes ((Unit!18441 0))(
  ( (Unit!18442) )
))
(declare-datatypes ((tuple2!22154 0))(
  ( (tuple2!22155 (_1!12013 Unit!18441) (_2!12013 BitStream!11290)) )
))
(declare-fun increaseBitIndex!0 (BitStream!11290) tuple2!22154)

(assert (=> d!86896 (= res!216892 (= (buf!6706 (_2!12013 (increaseBitIndex!0 thiss!1754))) (buf!6706 thiss!1754)))))

(declare-fun lt!400707 () Bool)

(assert (=> d!86896 (= lt!400707 (not (= (bvand ((_ sign_extend 24) (select (arr!7171 (buf!6706 thiss!1754)) (currentByte!12329 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12324 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!400709 () tuple2!22148)

(assert (=> d!86896 (= lt!400709 (tuple2!22149 (not (= (bvand ((_ sign_extend 24) (select (arr!7171 (buf!6706 thiss!1754)) (currentByte!12329 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12324 thiss!1754)))) #b00000000000000000000000000000000)) (_2!12013 (increaseBitIndex!0 thiss!1754))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!86896 (validate_offset_bit!0 ((_ sign_extend 32) (size!6184 (buf!6706 thiss!1754))) ((_ sign_extend 32) (currentByte!12329 thiss!1754)) ((_ sign_extend 32) (currentBit!12324 thiss!1754)))))

(assert (=> d!86896 (= (readBit!0 thiss!1754) lt!400709)))

(declare-fun b!258916 () Bool)

(declare-fun lt!400706 () (_ BitVec 64))

(declare-fun lt!400712 () (_ BitVec 64))

(assert (=> b!258916 (= e!179595 (= (bitIndex!0 (size!6184 (buf!6706 (_2!12013 (increaseBitIndex!0 thiss!1754)))) (currentByte!12329 (_2!12013 (increaseBitIndex!0 thiss!1754))) (currentBit!12324 (_2!12013 (increaseBitIndex!0 thiss!1754)))) (bvadd lt!400712 lt!400706)))))

(assert (=> b!258916 (or (not (= (bvand lt!400712 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!400706 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!400712 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!400712 lt!400706) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!258916 (= lt!400706 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!258916 (= lt!400712 (bitIndex!0 (size!6184 (buf!6706 thiss!1754)) (currentByte!12329 thiss!1754) (currentBit!12324 thiss!1754)))))

(declare-fun lt!400708 () Bool)

(assert (=> b!258916 (= lt!400708 (not (= (bvand ((_ sign_extend 24) (select (arr!7171 (buf!6706 thiss!1754)) (currentByte!12329 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12324 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!400711 () Bool)

(assert (=> b!258916 (= lt!400711 (not (= (bvand ((_ sign_extend 24) (select (arr!7171 (buf!6706 thiss!1754)) (currentByte!12329 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12324 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!400710 () Bool)

(assert (=> b!258916 (= lt!400710 (not (= (bvand ((_ sign_extend 24) (select (arr!7171 (buf!6706 thiss!1754)) (currentByte!12329 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12324 thiss!1754)))) #b00000000000000000000000000000000)))))

(assert (= (and d!86896 res!216892) b!258916))

(declare-fun m!388269 () Bool)

(assert (=> d!86896 m!388269))

(declare-fun m!388271 () Bool)

(assert (=> d!86896 m!388271))

(declare-fun m!388273 () Bool)

(assert (=> d!86896 m!388273))

(declare-fun m!388275 () Bool)

(assert (=> d!86896 m!388275))

(assert (=> b!258916 m!388271))

(assert (=> b!258916 m!388273))

(declare-fun m!388277 () Bool)

(assert (=> b!258916 m!388277))

(assert (=> b!258916 m!388241))

(assert (=> b!258916 m!388269))

(assert (=> b!258876 d!86896))

(declare-fun d!86900 () Bool)

(assert (=> d!86900 (= (array_inv!5925 (buf!6706 thiss!1754)) (bvsge (size!6184 (buf!6706 thiss!1754)) #b00000000000000000000000000000000))))

(assert (=> b!258877 d!86900))

(declare-fun d!86902 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!86902 (= (inv!12 thiss!1754) (invariant!0 (currentBit!12324 thiss!1754) (currentByte!12329 thiss!1754) (size!6184 (buf!6706 thiss!1754))))))

(declare-fun bs!21997 () Bool)

(assert (= bs!21997 d!86902))

(declare-fun m!388279 () Bool)

(assert (=> bs!21997 m!388279))

(assert (=> start!55648 d!86902))

(declare-fun d!86904 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!86904 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6184 (buf!6706 thiss!1754))) ((_ sign_extend 32) (currentByte!12329 thiss!1754)) ((_ sign_extend 32) (currentBit!12324 thiss!1754)) (bvsub nBits!535 from!526)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6184 (buf!6706 thiss!1754))) ((_ sign_extend 32) (currentByte!12329 thiss!1754)) ((_ sign_extend 32) (currentBit!12324 thiss!1754))) (bvsub nBits!535 from!526)))))

(declare-fun bs!21998 () Bool)

(assert (= bs!21998 d!86904))

(declare-fun m!388281 () Bool)

(assert (=> bs!21998 m!388281))

(assert (=> b!258873 d!86904))

(declare-fun d!86906 () Bool)

(declare-fun e!179601 () Bool)

(assert (=> d!86906 e!179601))

(declare-fun res!216900 () Bool)

(assert (=> d!86906 (=> (not res!216900) (not e!179601))))

(declare-fun lt!400749 () (_ BitVec 64))

(declare-fun lt!400748 () (_ BitVec 64))

(declare-fun lt!400752 () (_ BitVec 64))

(assert (=> d!86906 (= res!216900 (= lt!400748 (bvsub lt!400749 lt!400752)))))

(assert (=> d!86906 (or (= (bvand lt!400749 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!400752 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!400749 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!400749 lt!400752) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!86906 (= lt!400752 (remainingBits!0 ((_ sign_extend 32) (size!6184 (buf!6706 thiss!1754))) ((_ sign_extend 32) (currentByte!12329 thiss!1754)) ((_ sign_extend 32) (currentBit!12324 thiss!1754))))))

(declare-fun lt!400753 () (_ BitVec 64))

(declare-fun lt!400750 () (_ BitVec 64))

(assert (=> d!86906 (= lt!400749 (bvmul lt!400753 lt!400750))))

(assert (=> d!86906 (or (= lt!400753 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!400750 (bvsdiv (bvmul lt!400753 lt!400750) lt!400753)))))

(assert (=> d!86906 (= lt!400750 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!86906 (= lt!400753 ((_ sign_extend 32) (size!6184 (buf!6706 thiss!1754))))))

(assert (=> d!86906 (= lt!400748 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12329 thiss!1754)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12324 thiss!1754))))))

(assert (=> d!86906 (invariant!0 (currentBit!12324 thiss!1754) (currentByte!12329 thiss!1754) (size!6184 (buf!6706 thiss!1754)))))

(assert (=> d!86906 (= (bitIndex!0 (size!6184 (buf!6706 thiss!1754)) (currentByte!12329 thiss!1754) (currentBit!12324 thiss!1754)) lt!400748)))

(declare-fun b!258924 () Bool)

(declare-fun res!216901 () Bool)

(assert (=> b!258924 (=> (not res!216901) (not e!179601))))

(assert (=> b!258924 (= res!216901 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!400748))))

(declare-fun b!258925 () Bool)

(declare-fun lt!400751 () (_ BitVec 64))

(assert (=> b!258925 (= e!179601 (bvsle lt!400748 (bvmul lt!400751 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!258925 (or (= lt!400751 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!400751 #b0000000000000000000000000000000000000000000000000000000000001000) lt!400751)))))

(assert (=> b!258925 (= lt!400751 ((_ sign_extend 32) (size!6184 (buf!6706 thiss!1754))))))

(assert (= (and d!86906 res!216900) b!258924))

(assert (= (and b!258924 res!216901) b!258925))

(assert (=> d!86906 m!388281))

(assert (=> d!86906 m!388279))

(assert (=> b!258874 d!86906))

(push 1)

(assert (not d!86906))

(assert (not d!86904))

(assert (not d!86902))

(assert (not b!258916))

(assert (not d!86896))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

