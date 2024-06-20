; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71060 () Bool)

(assert start!71060)

(declare-fun b!320884 () Bool)

(declare-fun res!263562 () Bool)

(declare-fun e!231076 () Bool)

(assert (=> b!320884 (=> (not res!263562) (not e!231076))))

(declare-datatypes ((array!20290 0))(
  ( (array!20291 (arr!9936 (Array (_ BitVec 32) (_ BitVec 8))) (size!8844 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13850 0))(
  ( (BitStream!13851 (buf!7986 array!20290) (currentByte!14721 (_ BitVec 32)) (currentBit!14716 (_ BitVec 32))) )
))
(declare-fun thiss!1780 () BitStream!13850)

(declare-fun nBits!542 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!320884 (= res!263562 (validate_offset_bits!1 ((_ sign_extend 32) (size!8844 (buf!7986 thiss!1780))) ((_ sign_extend 32) (currentByte!14721 thiss!1780)) ((_ sign_extend 32) (currentBit!14716 thiss!1780)) ((_ sign_extend 32) nBits!542)))))

(declare-fun b!320885 () Bool)

(declare-fun e!231075 () Bool)

(assert (=> b!320885 (= e!231076 e!231075)))

(declare-fun res!263561 () Bool)

(assert (=> b!320885 (=> (not res!263561) (not e!231075))))

(declare-datatypes ((tuple2!23448 0))(
  ( (tuple2!23449 (_1!13353 (_ BitVec 64)) (_2!13353 BitStream!13850)) )
))
(declare-fun lt!444113 () tuple2!23448)

(assert (=> b!320885 (= res!263561 (= (buf!7986 (_2!13353 lt!444113)) (buf!7986 thiss!1780)))))

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!13850 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!23448)

(assert (=> b!320885 (= lt!444113 (readNBitsLSBFirstsLoop!0 thiss!1780 nBits!542 #b00000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!320887 () Bool)

(declare-fun e!231078 () Bool)

(declare-fun array_inv!8396 (array!20290) Bool)

(assert (=> b!320887 (= e!231078 (array_inv!8396 (buf!7986 thiss!1780)))))

(declare-fun res!263563 () Bool)

(assert (=> start!71060 (=> (not res!263563) (not e!231076))))

(assert (=> start!71060 (= res!263563 (and (bvsge nBits!542 #b00000000000000000000000000000000) (bvsle nBits!542 #b00000000000000000000000001000000)))))

(assert (=> start!71060 e!231076))

(assert (=> start!71060 true))

(declare-fun inv!12 (BitStream!13850) Bool)

(assert (=> start!71060 (and (inv!12 thiss!1780) e!231078)))

(declare-fun b!320886 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!320886 (= e!231075 (not (invariant!0 (currentBit!14716 (_2!13353 lt!444113)) (currentByte!14721 (_2!13353 lt!444113)) (size!8844 (buf!7986 (_2!13353 lt!444113))))))))

(assert (= (and start!71060 res!263563) b!320884))

(assert (= (and b!320884 res!263562) b!320885))

(assert (= (and b!320885 res!263561) b!320886))

(assert (= start!71060 b!320887))

(declare-fun m!459233 () Bool)

(assert (=> b!320885 m!459233))

(declare-fun m!459235 () Bool)

(assert (=> b!320884 m!459235))

(declare-fun m!459237 () Bool)

(assert (=> b!320886 m!459237))

(declare-fun m!459239 () Bool)

(assert (=> start!71060 m!459239))

(declare-fun m!459241 () Bool)

(assert (=> b!320887 m!459241))

(push 1)

(assert (not b!320887))

(assert (not b!320885))

(assert (not b!320884))

(assert (not start!71060))

(assert (not b!320886))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!105070 () Bool)

(assert (=> d!105070 (= (array_inv!8396 (buf!7986 thiss!1780)) (bvsge (size!8844 (buf!7986 thiss!1780)) #b00000000000000000000000000000000))))

(assert (=> b!320887 d!105070))

(declare-fun d!105072 () Bool)

(assert (=> d!105072 (= (invariant!0 (currentBit!14716 (_2!13353 lt!444113)) (currentByte!14721 (_2!13353 lt!444113)) (size!8844 (buf!7986 (_2!13353 lt!444113)))) (and (bvsge (currentBit!14716 (_2!13353 lt!444113)) #b00000000000000000000000000000000) (bvslt (currentBit!14716 (_2!13353 lt!444113)) #b00000000000000000000000000001000) (bvsge (currentByte!14721 (_2!13353 lt!444113)) #b00000000000000000000000000000000) (or (bvslt (currentByte!14721 (_2!13353 lt!444113)) (size!8844 (buf!7986 (_2!13353 lt!444113)))) (and (= (currentBit!14716 (_2!13353 lt!444113)) #b00000000000000000000000000000000) (= (currentByte!14721 (_2!13353 lt!444113)) (size!8844 (buf!7986 (_2!13353 lt!444113))))))))))

(assert (=> b!320886 d!105072))

(declare-fun b!320902 () Bool)

(declare-fun e!231085 () tuple2!23448)

(declare-fun lt!444129 () tuple2!23448)

(assert (=> b!320902 (= e!231085 (tuple2!23449 (_1!13353 lt!444129) (_2!13353 lt!444129)))))

(declare-datatypes ((tuple2!23450 0))(
  ( (tuple2!23451 (_1!13354 Bool) (_2!13354 BitStream!13850)) )
))
(declare-fun lt!444128 () tuple2!23450)

(declare-fun readBit!0 (BitStream!13850) tuple2!23450)

(assert (=> b!320902 (= lt!444128 (readBit!0 thiss!1780))))

(assert (=> b!320902 (= lt!444129 (readNBitsLSBFirstsLoop!0 (_2!13354 lt!444128) nBits!542 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvor #b0000000000000000000000000000000000000000000000000000000000000000 (ite (_1!13354 lt!444128) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) #b00000000000000000000000000000000)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!320903 () Bool)

(declare-fun res!263577 () Bool)

(declare-fun e!231087 () Bool)

(assert (=> b!320903 (=> (not res!263577) (not e!231087))))

(declare-fun lt!444127 () tuple2!23448)

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!320903 (= res!263577 (= (bvand (_1!13353 lt!444127) (onesLSBLong!0 #b00000000000000000000000000000000)) (bvand #b0000000000000000000000000000000000000000000000000000000000000000 (onesLSBLong!0 #b00000000000000000000000000000000))))))

(declare-fun b!320904 () Bool)

(declare-fun res!263576 () Bool)

(assert (=> b!320904 (=> (not res!263576) (not e!231087))))

(declare-fun lt!444130 () (_ BitVec 64))

(declare-fun lt!444131 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!320904 (= res!263576 (= (bitIndex!0 (size!8844 (buf!7986 (_2!13353 lt!444127))) (currentByte!14721 (_2!13353 lt!444127)) (currentBit!14716 (_2!13353 lt!444127))) (bvadd lt!444130 lt!444131)))))

(assert (=> b!320904 (or (not (= (bvand lt!444130 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!444131 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!444130 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!444130 lt!444131) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!320904 (= lt!444131 ((_ sign_extend 32) (bvsub nBits!542 #b00000000000000000000000000000000)))))

(assert (=> b!320904 (or (= (bvand nBits!542 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand nBits!542 #b10000000000000000000000000000000) (bvand (bvsub nBits!542 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(assert (=> b!320904 (= lt!444130 (bitIndex!0 (size!8844 (buf!7986 thiss!1780)) (currentByte!14721 thiss!1780) (currentBit!14716 thiss!1780)))))

(declare-fun lt!444126 () (_ BitVec 64))

(declare-fun b!320905 () Bool)

(declare-fun e!231086 () Bool)

(declare-datatypes ((tuple2!23452 0))(
  ( (tuple2!23453 (_1!13355 BitStream!13850) (_2!13355 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!13850) tuple2!23452)

(assert (=> b!320905 (= e!231086 (= (= (bvand (bvlshr (_1!13353 lt!444127) lt!444126) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!13355 (readBitPure!0 thiss!1780))))))

(assert (=> b!320905 (and (bvsge lt!444126 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!444126 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!320905 (= lt!444126 ((_ sign_extend 32) #b00000000000000000000000000000000))))

(declare-fun d!105078 () Bool)

(assert (=> d!105078 e!231087))

(declare-fun res!263578 () Bool)

(assert (=> d!105078 (=> (not res!263578) (not e!231087))))

(assert (=> d!105078 (= res!263578 (= (buf!7986 (_2!13353 lt!444127)) (buf!7986 thiss!1780)))))

(assert (=> d!105078 (= lt!444127 e!231085)))

(declare-fun c!15376 () Bool)

(assert (=> d!105078 (= c!15376 (= nBits!542 #b00000000000000000000000000000000))))

(assert (=> d!105078 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 nBits!542) (bvsle nBits!542 #b00000000000000000000000001000000))))

(assert (=> d!105078 (= (readNBitsLSBFirstsLoop!0 thiss!1780 nBits!542 #b00000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) lt!444127)))

(declare-fun b!320906 () Bool)

(declare-fun res!263575 () Bool)

(assert (=> b!320906 (=> (not res!263575) (not e!231087))))

(assert (=> b!320906 (= res!263575 (= (bvand (_1!13353 lt!444127) (onesLSBLong!0 nBits!542)) (_1!13353 lt!444127)))))

(declare-fun b!320907 () Bool)

(assert (=> b!320907 (= e!231087 e!231086)))

(declare-fun res!263574 () Bool)

(assert (=> b!320907 (=> res!263574 e!231086)))

(assert (=> b!320907 (= res!263574 (not (bvslt #b00000000000000000000000000000000 nBits!542)))))

(declare-fun b!320908 () Bool)

(assert (=> b!320908 (= e!231085 (tuple2!23449 #b0000000000000000000000000000000000000000000000000000000000000000 thiss!1780))))

(assert (= (and d!105078 c!15376) b!320908))

(assert (= (and d!105078 (not c!15376)) b!320902))

(assert (= (and d!105078 res!263578) b!320904))

(assert (= (and b!320904 res!263576) b!320903))

(assert (= (and b!320903 res!263577) b!320906))

(assert (= (and b!320906 res!263575) b!320907))

(assert (= (and b!320907 (not res!263574)) b!320905))

(declare-fun m!459245 () Bool)

(assert (=> b!320906 m!459245))

(declare-fun m!459247 () Bool)

(assert (=> b!320902 m!459247))

(declare-fun m!459249 () Bool)

(assert (=> b!320902 m!459249))

(declare-fun m!459251 () Bool)

(assert (=> b!320903 m!459251))

(declare-fun m!459253 () Bool)

(assert (=> b!320904 m!459253))

(declare-fun m!459255 () Bool)

(assert (=> b!320904 m!459255))

(declare-fun m!459257 () Bool)

(assert (=> b!320905 m!459257))

(assert (=> b!320885 d!105078))

(declare-fun d!105082 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!105082 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!8844 (buf!7986 thiss!1780))) ((_ sign_extend 32) (currentByte!14721 thiss!1780)) ((_ sign_extend 32) (currentBit!14716 thiss!1780)) ((_ sign_extend 32) nBits!542)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8844 (buf!7986 thiss!1780))) ((_ sign_extend 32) (currentByte!14721 thiss!1780)) ((_ sign_extend 32) (currentBit!14716 thiss!1780))) ((_ sign_extend 32) nBits!542)))))

(declare-fun bs!27640 () Bool)

(assert (= bs!27640 d!105082))

(declare-fun m!459259 () Bool)

(assert (=> bs!27640 m!459259))

(assert (=> b!320884 d!105082))

(declare-fun d!105084 () Bool)

(assert (=> d!105084 (= (inv!12 thiss!1780) (invariant!0 (currentBit!14716 thiss!1780) (currentByte!14721 thiss!1780) (size!8844 (buf!7986 thiss!1780))))))

(declare-fun bs!27641 () Bool)

(assert (= bs!27641 d!105084))

(declare-fun m!459261 () Bool)

(assert (=> bs!27641 m!459261))

(assert (=> start!71060 d!105084))

(push 1)

(assert (not d!105084))

(assert (not b!320905))

(assert (not d!105082))

(assert (not b!320906))

(assert (not b!320903))

(assert (not b!320904))

(assert (not b!320902))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!105110 () Bool)

(assert (=> d!105110 (= (remainingBits!0 ((_ sign_extend 32) (size!8844 (buf!7986 thiss!1780))) ((_ sign_extend 32) (currentByte!14721 thiss!1780)) ((_ sign_extend 32) (currentBit!14716 thiss!1780))) (bvsub (bvmul ((_ sign_extend 32) (size!8844 (buf!7986 thiss!1780))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!14721 thiss!1780)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14716 thiss!1780)))))))

(assert (=> d!105082 d!105110))

(declare-fun d!105112 () Bool)

(declare-fun e!231122 () Bool)

(assert (=> d!105112 e!231122))

(declare-fun res!263621 () Bool)

(assert (=> d!105112 (=> (not res!263621) (not e!231122))))

(declare-datatypes ((Unit!21992 0))(
  ( (Unit!21993) )
))
(declare-datatypes ((tuple2!23462 0))(
  ( (tuple2!23463 (_1!13360 Unit!21992) (_2!13360 BitStream!13850)) )
))
(declare-fun increaseBitIndex!0 (BitStream!13850) tuple2!23462)

(assert (=> d!105112 (= res!263621 (= (buf!7986 (_2!13360 (increaseBitIndex!0 thiss!1780))) (buf!7986 thiss!1780)))))

(declare-fun lt!444214 () Bool)

(assert (=> d!105112 (= lt!444214 (not (= (bvand ((_ sign_extend 24) (select (arr!9936 (buf!7986 thiss!1780)) (currentByte!14721 thiss!1780))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14716 thiss!1780)))) #b00000000000000000000000000000000)))))

(declare-fun lt!444213 () tuple2!23450)

(assert (=> d!105112 (= lt!444213 (tuple2!23451 (not (= (bvand ((_ sign_extend 24) (select (arr!9936 (buf!7986 thiss!1780)) (currentByte!14721 thiss!1780))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14716 thiss!1780)))) #b00000000000000000000000000000000)) (_2!13360 (increaseBitIndex!0 thiss!1780))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!105112 (validate_offset_bit!0 ((_ sign_extend 32) (size!8844 (buf!7986 thiss!1780))) ((_ sign_extend 32) (currentByte!14721 thiss!1780)) ((_ sign_extend 32) (currentBit!14716 thiss!1780)))))

(assert (=> d!105112 (= (readBit!0 thiss!1780) lt!444213)))

(declare-fun b!320963 () Bool)

(declare-fun lt!444215 () (_ BitVec 64))

(declare-fun lt!444212 () (_ BitVec 64))

(assert (=> b!320963 (= e!231122 (= (bitIndex!0 (size!8844 (buf!7986 (_2!13360 (increaseBitIndex!0 thiss!1780)))) (currentByte!14721 (_2!13360 (increaseBitIndex!0 thiss!1780))) (currentBit!14716 (_2!13360 (increaseBitIndex!0 thiss!1780)))) (bvadd lt!444215 lt!444212)))))

(assert (=> b!320963 (or (not (= (bvand lt!444215 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!444212 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!444215 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!444215 lt!444212) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!320963 (= lt!444212 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!320963 (= lt!444215 (bitIndex!0 (size!8844 (buf!7986 thiss!1780)) (currentByte!14721 thiss!1780) (currentBit!14716 thiss!1780)))))

(declare-fun lt!444216 () Bool)

(assert (=> b!320963 (= lt!444216 (not (= (bvand ((_ sign_extend 24) (select (arr!9936 (buf!7986 thiss!1780)) (currentByte!14721 thiss!1780))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14716 thiss!1780)))) #b00000000000000000000000000000000)))))

(declare-fun lt!444210 () Bool)

(assert (=> b!320963 (= lt!444210 (not (= (bvand ((_ sign_extend 24) (select (arr!9936 (buf!7986 thiss!1780)) (currentByte!14721 thiss!1780))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14716 thiss!1780)))) #b00000000000000000000000000000000)))))

(declare-fun lt!444211 () Bool)

(assert (=> b!320963 (= lt!444211 (not (= (bvand ((_ sign_extend 24) (select (arr!9936 (buf!7986 thiss!1780)) (currentByte!14721 thiss!1780))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14716 thiss!1780)))) #b00000000000000000000000000000000)))))

(assert (= (and d!105112 res!263621) b!320963))

(declare-fun m!459301 () Bool)

(assert (=> d!105112 m!459301))

(declare-fun m!459303 () Bool)

(assert (=> d!105112 m!459303))

(declare-fun m!459305 () Bool)

(assert (=> d!105112 m!459305))

(declare-fun m!459307 () Bool)

(assert (=> d!105112 m!459307))

(assert (=> b!320963 m!459305))

(assert (=> b!320963 m!459255))

(declare-fun m!459309 () Bool)

(assert (=> b!320963 m!459309))

(assert (=> b!320963 m!459301))

(assert (=> b!320963 m!459303))

(assert (=> b!320902 d!105112))

(declare-fun b!320964 () Bool)

(declare-fun e!231123 () tuple2!23448)

(declare-fun lt!444230 () tuple2!23448)

(assert (=> b!320964 (= e!231123 (tuple2!23449 (_1!13353 lt!444230) (_2!13353 lt!444230)))))

(declare-fun lt!444229 () tuple2!23450)

(assert (=> b!320964 (= lt!444229 (readBit!0 (_2!13354 lt!444128)))))

(assert (=> b!320964 (= lt!444230 (readNBitsLSBFirstsLoop!0 (_2!13354 lt!444229) nBits!542 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvor (bvor #b0000000000000000000000000000000000000000000000000000000000000000 (ite (_1!13354 lt!444128) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) #b00000000000000000000000000000000)) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite (_1!13354 lt!444229) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!320965 () Bool)

(declare-fun res!263625 () Bool)

(declare-fun e!231125 () Bool)

(assert (=> b!320965 (=> (not res!263625) (not e!231125))))

(declare-fun lt!444228 () tuple2!23448)

(assert (=> b!320965 (= res!263625 (= (bvand (_1!13353 lt!444228) (onesLSBLong!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (bvand (bvor #b0000000000000000000000000000000000000000000000000000000000000000 (ite (_1!13354 lt!444128) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) #b00000000000000000000000000000000)) #b0000000000000000000000000000000000000000000000000000000000000000)) (onesLSBLong!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))))

(declare-fun b!320966 () Bool)

(declare-fun res!263624 () Bool)

(assert (=> b!320966 (=> (not res!263624) (not e!231125))))

(declare-fun lt!444232 () (_ BitVec 64))

(declare-fun lt!444231 () (_ BitVec 64))

(assert (=> b!320966 (= res!263624 (= (bitIndex!0 (size!8844 (buf!7986 (_2!13353 lt!444228))) (currentByte!14721 (_2!13353 lt!444228)) (currentBit!14716 (_2!13353 lt!444228))) (bvadd lt!444231 lt!444232)))))

(assert (=> b!320966 (or (not (= (bvand lt!444231 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!444232 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!444231 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!444231 lt!444232) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!320966 (= lt!444232 ((_ sign_extend 32) (bvsub nBits!542 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!320966 (or (= (bvand nBits!542 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b10000000000000000000000000000000)) (= (bvand nBits!542 #b10000000000000000000000000000000) (bvand (bvsub nBits!542 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) #b10000000000000000000000000000000)))))

(assert (=> b!320966 (= lt!444231 (bitIndex!0 (size!8844 (buf!7986 (_2!13354 lt!444128))) (currentByte!14721 (_2!13354 lt!444128)) (currentBit!14716 (_2!13354 lt!444128))))))

(declare-fun b!320967 () Bool)

(declare-fun e!231124 () Bool)

(declare-fun lt!444227 () (_ BitVec 64))

(assert (=> b!320967 (= e!231124 (= (= (bvand (bvlshr (_1!13353 lt!444228) lt!444227) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!13355 (readBitPure!0 (_2!13354 lt!444128)))))))

(assert (=> b!320967 (and (bvsge lt!444227 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!444227 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!320967 (= lt!444227 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun d!105116 () Bool)

(assert (=> d!105116 e!231125))

(declare-fun res!263626 () Bool)

(assert (=> d!105116 (=> (not res!263626) (not e!231125))))

(assert (=> d!105116 (= res!263626 (= (buf!7986 (_2!13353 lt!444228)) (buf!7986 (_2!13354 lt!444128))))))

(assert (=> d!105116 (= lt!444228 e!231123)))

(declare-fun c!15383 () Bool)

(assert (=> d!105116 (= c!15383 (= nBits!542 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> d!105116 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) nBits!542) (bvsle nBits!542 #b00000000000000000000000001000000))))

(assert (=> d!105116 (= (readNBitsLSBFirstsLoop!0 (_2!13354 lt!444128) nBits!542 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvor #b0000000000000000000000000000000000000000000000000000000000000000 (ite (_1!13354 lt!444128) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) #b00000000000000000000000000000000)) #b0000000000000000000000000000000000000000000000000000000000000000))) lt!444228)))

(declare-fun b!320968 () Bool)

(declare-fun res!263623 () Bool)

(assert (=> b!320968 (=> (not res!263623) (not e!231125))))

(assert (=> b!320968 (= res!263623 (= (bvand (_1!13353 lt!444228) (onesLSBLong!0 nBits!542)) (_1!13353 lt!444228)))))

(declare-fun b!320969 () Bool)

(assert (=> b!320969 (= e!231125 e!231124)))

(declare-fun res!263622 () Bool)

(assert (=> b!320969 (=> res!263622 e!231124)))

(assert (=> b!320969 (= res!263622 (not (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) nBits!542)))))

(declare-fun b!320970 () Bool)

(assert (=> b!320970 (= e!231123 (tuple2!23449 (bvor #b0000000000000000000000000000000000000000000000000000000000000000 (ite (_1!13354 lt!444128) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) #b00000000000000000000000000000000)) #b0000000000000000000000000000000000000000000000000000000000000000)) (_2!13354 lt!444128)))))

(assert (= (and d!105116 c!15383) b!320970))

(assert (= (and d!105116 (not c!15383)) b!320964))

(assert (= (and d!105116 res!263626) b!320966))

(assert (= (and b!320966 res!263624) b!320965))

(assert (= (and b!320965 res!263625) b!320968))

(assert (= (and b!320968 res!263623) b!320969))

(assert (= (and b!320969 (not res!263622)) b!320967))

(assert (=> b!320968 m!459245))

(declare-fun m!459311 () Bool)

(assert (=> b!320964 m!459311))

(declare-fun m!459313 () Bool)

(assert (=> b!320964 m!459313))

(declare-fun m!459315 () Bool)

(assert (=> b!320965 m!459315))

(declare-fun m!459317 () Bool)

(assert (=> b!320966 m!459317))

(declare-fun m!459319 () Bool)

(assert (=> b!320966 m!459319))

(declare-fun m!459321 () Bool)

(assert (=> b!320967 m!459321))

(assert (=> b!320902 d!105116))

(declare-fun d!105118 () Bool)

(assert (=> d!105118 (= (onesLSBLong!0 nBits!542) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!542))))))

(assert (=> b!320906 d!105118))

(declare-fun d!105120 () Bool)

(declare-fun lt!444247 () tuple2!23450)

(assert (=> d!105120 (= lt!444247 (readBit!0 thiss!1780))))

(assert (=> d!105120 (= (readBitPure!0 thiss!1780) (tuple2!23453 (_2!13354 lt!444247) (_1!13354 lt!444247)))))

(declare-fun bs!27645 () Bool)

(assert (= bs!27645 d!105120))

(assert (=> bs!27645 m!459247))

(assert (=> b!320905 d!105120))

(declare-fun d!105122 () Bool)

(declare-fun e!231136 () Bool)

(assert (=> d!105122 e!231136))

(declare-fun res!263646 () Bool)

(assert (=> d!105122 (=> (not res!263646) (not e!231136))))

(declare-fun lt!444291 () (_ BitVec 64))

(declare-fun lt!444290 () (_ BitVec 64))

(declare-fun lt!444288 () (_ BitVec 64))

(assert (=> d!105122 (= res!263646 (= lt!444290 (bvsub lt!444291 lt!444288)))))

(assert (=> d!105122 (or (= (bvand lt!444291 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!444288 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!444291 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!444291 lt!444288) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105122 (= lt!444288 (remainingBits!0 ((_ sign_extend 32) (size!8844 (buf!7986 (_2!13353 lt!444127)))) ((_ sign_extend 32) (currentByte!14721 (_2!13353 lt!444127))) ((_ sign_extend 32) (currentBit!14716 (_2!13353 lt!444127)))))))

(declare-fun lt!444292 () (_ BitVec 64))

(declare-fun lt!444289 () (_ BitVec 64))

(assert (=> d!105122 (= lt!444291 (bvmul lt!444292 lt!444289))))

(assert (=> d!105122 (or (= lt!444292 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!444289 (bvsdiv (bvmul lt!444292 lt!444289) lt!444292)))))

(assert (=> d!105122 (= lt!444289 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!105122 (= lt!444292 ((_ sign_extend 32) (size!8844 (buf!7986 (_2!13353 lt!444127)))))))

(assert (=> d!105122 (= lt!444290 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14721 (_2!13353 lt!444127))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14716 (_2!13353 lt!444127)))))))

(assert (=> d!105122 (invariant!0 (currentBit!14716 (_2!13353 lt!444127)) (currentByte!14721 (_2!13353 lt!444127)) (size!8844 (buf!7986 (_2!13353 lt!444127))))))

(assert (=> d!105122 (= (bitIndex!0 (size!8844 (buf!7986 (_2!13353 lt!444127))) (currentByte!14721 (_2!13353 lt!444127)) (currentBit!14716 (_2!13353 lt!444127))) lt!444290)))

(declare-fun b!320991 () Bool)

(declare-fun res!263645 () Bool)

(assert (=> b!320991 (=> (not res!263645) (not e!231136))))

(assert (=> b!320991 (= res!263645 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!444290))))

(declare-fun b!320992 () Bool)

(declare-fun lt!444293 () (_ BitVec 64))

(assert (=> b!320992 (= e!231136 (bvsle lt!444290 (bvmul lt!444293 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!320992 (or (= lt!444293 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!444293 #b0000000000000000000000000000000000000000000000000000000000001000) lt!444293)))))

(assert (=> b!320992 (= lt!444293 ((_ sign_extend 32) (size!8844 (buf!7986 (_2!13353 lt!444127)))))))

(assert (= (and d!105122 res!263646) b!320991))

(assert (= (and b!320991 res!263645) b!320992))

(declare-fun m!459349 () Bool)

(assert (=> d!105122 m!459349))

(declare-fun m!459351 () Bool)

(assert (=> d!105122 m!459351))

(assert (=> b!320904 d!105122))

(declare-fun d!105136 () Bool)

(declare-fun e!231137 () Bool)

(assert (=> d!105136 e!231137))

(declare-fun res!263648 () Bool)

(assert (=> d!105136 (=> (not res!263648) (not e!231137))))

(declare-fun lt!444296 () (_ BitVec 64))

(declare-fun lt!444297 () (_ BitVec 64))

(declare-fun lt!444294 () (_ BitVec 64))

(assert (=> d!105136 (= res!263648 (= lt!444296 (bvsub lt!444297 lt!444294)))))

(assert (=> d!105136 (or (= (bvand lt!444297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!444294 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!444297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!444297 lt!444294) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105136 (= lt!444294 (remainingBits!0 ((_ sign_extend 32) (size!8844 (buf!7986 thiss!1780))) ((_ sign_extend 32) (currentByte!14721 thiss!1780)) ((_ sign_extend 32) (currentBit!14716 thiss!1780))))))

(declare-fun lt!444298 () (_ BitVec 64))

(declare-fun lt!444295 () (_ BitVec 64))

(assert (=> d!105136 (= lt!444297 (bvmul lt!444298 lt!444295))))

(assert (=> d!105136 (or (= lt!444298 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!444295 (bvsdiv (bvmul lt!444298 lt!444295) lt!444298)))))

(assert (=> d!105136 (= lt!444295 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!105136 (= lt!444298 ((_ sign_extend 32) (size!8844 (buf!7986 thiss!1780))))))

(assert (=> d!105136 (= lt!444296 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14721 thiss!1780)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14716 thiss!1780))))))

(assert (=> d!105136 (invariant!0 (currentBit!14716 thiss!1780) (currentByte!14721 thiss!1780) (size!8844 (buf!7986 thiss!1780)))))

(assert (=> d!105136 (= (bitIndex!0 (size!8844 (buf!7986 thiss!1780)) (currentByte!14721 thiss!1780) (currentBit!14716 thiss!1780)) lt!444296)))

(declare-fun b!320993 () Bool)

(declare-fun res!263647 () Bool)

(assert (=> b!320993 (=> (not res!263647) (not e!231137))))

(assert (=> b!320993 (= res!263647 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!444296))))

(declare-fun b!320994 () Bool)

(declare-fun lt!444299 () (_ BitVec 64))

(assert (=> b!320994 (= e!231137 (bvsle lt!444296 (bvmul lt!444299 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!320994 (or (= lt!444299 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!444299 #b0000000000000000000000000000000000000000000000000000000000001000) lt!444299)))))

(assert (=> b!320994 (= lt!444299 ((_ sign_extend 32) (size!8844 (buf!7986 thiss!1780))))))

(assert (= (and d!105136 res!263648) b!320993))

(assert (= (and b!320993 res!263647) b!320994))

(assert (=> d!105136 m!459259))

(assert (=> d!105136 m!459261))

(assert (=> b!320904 d!105136))

(declare-fun d!105138 () Bool)

(assert (=> d!105138 (= (invariant!0 (currentBit!14716 thiss!1780) (currentByte!14721 thiss!1780) (size!8844 (buf!7986 thiss!1780))) (and (bvsge (currentBit!14716 thiss!1780) #b00000000000000000000000000000000) (bvslt (currentBit!14716 thiss!1780) #b00000000000000000000000000001000) (bvsge (currentByte!14721 thiss!1780) #b00000000000000000000000000000000) (or (bvslt (currentByte!14721 thiss!1780) (size!8844 (buf!7986 thiss!1780))) (and (= (currentBit!14716 thiss!1780) #b00000000000000000000000000000000) (= (currentByte!14721 thiss!1780) (size!8844 (buf!7986 thiss!1780)))))))))

(assert (=> d!105084 d!105138))

(declare-fun d!105140 () Bool)

(assert (=> d!105140 (= (onesLSBLong!0 #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!320903 d!105140))

(push 1)

(assert (not b!320967))

(assert (not b!320968))

(assert (not b!320964))

(assert (not d!105120))

(assert (not d!105112))

(assert (not d!105122))

(assert (not d!105136))

(assert (not b!320965))

(assert (not b!320966))

(assert (not b!320963))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

