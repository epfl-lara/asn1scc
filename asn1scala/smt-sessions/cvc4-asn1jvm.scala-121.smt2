; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2862 () Bool)

(assert start!2862)

(declare-fun b!13371 () Bool)

(declare-fun e!8199 () Bool)

(declare-datatypes ((array!754 0))(
  ( (array!755 (arr!756 (Array (_ BitVec 32) (_ BitVec 8))) (size!327 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!614 0))(
  ( (BitStream!615 (buf!678 array!754) (currentByte!1777 (_ BitVec 32)) (currentBit!1772 (_ BitVec 32))) )
))
(declare-fun thiss!957 () BitStream!614)

(declare-fun array_inv!316 (array!754) Bool)

(assert (=> b!13371 (= e!8199 (array_inv!316 (buf!678 thiss!957)))))

(declare-fun b!13372 () Bool)

(declare-fun e!8204 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!13372 (= e!8204 (invariant!0 (currentBit!1772 thiss!957) (currentByte!1777 thiss!957) (size!327 (buf!678 thiss!957))))))

(declare-fun b!13373 () Bool)

(declare-fun e!8202 () Bool)

(declare-fun e!8203 () Bool)

(assert (=> b!13373 (= e!8202 e!8203)))

(declare-fun res!12685 () Bool)

(assert (=> b!13373 (=> (not res!12685) (not e!8203))))

(declare-fun lt!21038 () (_ BitVec 64))

(declare-fun lt!21039 () (_ BitVec 64))

(assert (=> b!13373 (= res!12685 (= lt!21038 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!21039)))))

(declare-datatypes ((Unit!1119 0))(
  ( (Unit!1120) )
))
(declare-datatypes ((tuple2!1588 0))(
  ( (tuple2!1589 (_1!849 Unit!1119) (_2!849 BitStream!614)) )
))
(declare-fun lt!21040 () tuple2!1588)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!13373 (= lt!21038 (bitIndex!0 (size!327 (buf!678 (_2!849 lt!21040))) (currentByte!1777 (_2!849 lt!21040)) (currentBit!1772 (_2!849 lt!21040))))))

(assert (=> b!13373 (= lt!21039 (bitIndex!0 (size!327 (buf!678 thiss!957)) (currentByte!1777 thiss!957) (currentBit!1772 thiss!957)))))

(declare-fun res!12680 () Bool)

(declare-fun e!8200 () Bool)

(assert (=> start!2862 (=> (not res!12680) (not e!8200))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!2862 (= res!12680 (validate_offset_bit!0 ((_ sign_extend 32) (size!327 (buf!678 thiss!957))) ((_ sign_extend 32) (currentByte!1777 thiss!957)) ((_ sign_extend 32) (currentBit!1772 thiss!957))))))

(assert (=> start!2862 e!8200))

(declare-fun inv!12 (BitStream!614) Bool)

(assert (=> start!2862 (and (inv!12 thiss!957) e!8199)))

(declare-fun b!13374 () Bool)

(declare-fun res!12682 () Bool)

(assert (=> b!13374 (=> (not res!12682) (not e!8203))))

(declare-fun isPrefixOf!0 (BitStream!614 BitStream!614) Bool)

(assert (=> b!13374 (= res!12682 (isPrefixOf!0 thiss!957 (_2!849 lt!21040)))))

(declare-fun b!13375 () Bool)

(assert (=> b!13375 (= e!8200 (not e!8204))))

(declare-fun res!12681 () Bool)

(assert (=> b!13375 (=> res!12681 e!8204)))

(assert (=> b!13375 (= res!12681 (not (= (size!327 (buf!678 (_2!849 lt!21040))) (size!327 (buf!678 thiss!957)))))))

(assert (=> b!13375 e!8202))

(declare-fun res!12683 () Bool)

(assert (=> b!13375 (=> (not res!12683) (not e!8202))))

(assert (=> b!13375 (= res!12683 (= (size!327 (buf!678 thiss!957)) (size!327 (buf!678 (_2!849 lt!21040)))))))

(declare-fun appendBit!0 (BitStream!614 Bool) tuple2!1588)

(assert (=> b!13375 (= lt!21040 (appendBit!0 thiss!957 false))))

(declare-fun b!13376 () Bool)

(declare-fun e!8201 () Bool)

(assert (=> b!13376 (= e!8203 e!8201)))

(declare-fun res!12684 () Bool)

(assert (=> b!13376 (=> (not res!12684) (not e!8201))))

(declare-datatypes ((tuple2!1590 0))(
  ( (tuple2!1591 (_1!850 BitStream!614) (_2!850 Bool)) )
))
(declare-fun lt!21041 () tuple2!1590)

(assert (=> b!13376 (= res!12684 (and (not (_2!850 lt!21041)) (= (_1!850 lt!21041) (_2!849 lt!21040))))))

(declare-fun readBitPure!0 (BitStream!614) tuple2!1590)

(declare-fun readerFrom!0 (BitStream!614 (_ BitVec 32) (_ BitVec 32)) BitStream!614)

(assert (=> b!13376 (= lt!21041 (readBitPure!0 (readerFrom!0 (_2!849 lt!21040) (currentBit!1772 thiss!957) (currentByte!1777 thiss!957))))))

(declare-fun b!13377 () Bool)

(assert (=> b!13377 (= e!8201 (= (bitIndex!0 (size!327 (buf!678 (_1!850 lt!21041))) (currentByte!1777 (_1!850 lt!21041)) (currentBit!1772 (_1!850 lt!21041))) lt!21038))))

(assert (= (and start!2862 res!12680) b!13375))

(assert (= (and b!13375 res!12683) b!13373))

(assert (= (and b!13373 res!12685) b!13374))

(assert (= (and b!13374 res!12682) b!13376))

(assert (= (and b!13376 res!12684) b!13377))

(assert (= (and b!13375 (not res!12681)) b!13372))

(assert (= start!2862 b!13371))

(declare-fun m!20009 () Bool)

(assert (=> b!13371 m!20009))

(declare-fun m!20011 () Bool)

(assert (=> b!13377 m!20011))

(declare-fun m!20013 () Bool)

(assert (=> b!13376 m!20013))

(assert (=> b!13376 m!20013))

(declare-fun m!20015 () Bool)

(assert (=> b!13376 m!20015))

(declare-fun m!20017 () Bool)

(assert (=> b!13374 m!20017))

(declare-fun m!20019 () Bool)

(assert (=> b!13372 m!20019))

(declare-fun m!20021 () Bool)

(assert (=> start!2862 m!20021))

(declare-fun m!20023 () Bool)

(assert (=> start!2862 m!20023))

(declare-fun m!20025 () Bool)

(assert (=> b!13375 m!20025))

(declare-fun m!20027 () Bool)

(assert (=> b!13373 m!20027))

(declare-fun m!20029 () Bool)

(assert (=> b!13373 m!20029))

(push 1)

(assert (not b!13374))

(assert (not b!13373))

(assert (not b!13371))

(assert (not b!13377))

(assert (not start!2862))

(assert (not b!13372))

(assert (not b!13375))

(assert (not b!13376))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!4302 () Bool)

(assert (=> d!4302 (= (invariant!0 (currentBit!1772 thiss!957) (currentByte!1777 thiss!957) (size!327 (buf!678 thiss!957))) (and (bvsge (currentBit!1772 thiss!957) #b00000000000000000000000000000000) (bvslt (currentBit!1772 thiss!957) #b00000000000000000000000000001000) (bvsge (currentByte!1777 thiss!957) #b00000000000000000000000000000000) (or (bvslt (currentByte!1777 thiss!957) (size!327 (buf!678 thiss!957))) (and (= (currentBit!1772 thiss!957) #b00000000000000000000000000000000) (= (currentByte!1777 thiss!957) (size!327 (buf!678 thiss!957)))))))))

(assert (=> b!13372 d!4302))

(declare-fun d!4306 () Bool)

(declare-fun e!8210 () Bool)

(assert (=> d!4306 e!8210))

(declare-fun res!12694 () Bool)

(assert (=> d!4306 (=> (not res!12694) (not e!8210))))

(declare-fun lt!21062 () (_ BitVec 64))

(declare-fun lt!21061 () (_ BitVec 64))

(declare-fun lt!21059 () (_ BitVec 64))

(assert (=> d!4306 (= res!12694 (= lt!21059 (bvsub lt!21061 lt!21062)))))

(assert (=> d!4306 (or (= (bvand lt!21061 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!21062 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!21061 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!21061 lt!21062) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!4306 (= lt!21062 (remainingBits!0 ((_ sign_extend 32) (size!327 (buf!678 (_2!849 lt!21040)))) ((_ sign_extend 32) (currentByte!1777 (_2!849 lt!21040))) ((_ sign_extend 32) (currentBit!1772 (_2!849 lt!21040)))))))

(declare-fun lt!21057 () (_ BitVec 64))

(declare-fun lt!21060 () (_ BitVec 64))

(assert (=> d!4306 (= lt!21061 (bvmul lt!21057 lt!21060))))

(assert (=> d!4306 (or (= lt!21057 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!21060 (bvsdiv (bvmul lt!21057 lt!21060) lt!21057)))))

(assert (=> d!4306 (= lt!21060 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!4306 (= lt!21057 ((_ sign_extend 32) (size!327 (buf!678 (_2!849 lt!21040)))))))

(assert (=> d!4306 (= lt!21059 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1777 (_2!849 lt!21040))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1772 (_2!849 lt!21040)))))))

(assert (=> d!4306 (invariant!0 (currentBit!1772 (_2!849 lt!21040)) (currentByte!1777 (_2!849 lt!21040)) (size!327 (buf!678 (_2!849 lt!21040))))))

(assert (=> d!4306 (= (bitIndex!0 (size!327 (buf!678 (_2!849 lt!21040))) (currentByte!1777 (_2!849 lt!21040)) (currentBit!1772 (_2!849 lt!21040))) lt!21059)))

(declare-fun b!13385 () Bool)

(declare-fun res!12695 () Bool)

(assert (=> b!13385 (=> (not res!12695) (not e!8210))))

(assert (=> b!13385 (= res!12695 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!21059))))

(declare-fun b!13386 () Bool)

(declare-fun lt!21058 () (_ BitVec 64))

(assert (=> b!13386 (= e!8210 (bvsle lt!21059 (bvmul lt!21058 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!13386 (or (= lt!21058 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!21058 #b0000000000000000000000000000000000000000000000000000000000001000) lt!21058)))))

(assert (=> b!13386 (= lt!21058 ((_ sign_extend 32) (size!327 (buf!678 (_2!849 lt!21040)))))))

(assert (= (and d!4306 res!12694) b!13385))

(assert (= (and b!13385 res!12695) b!13386))

(declare-fun m!20037 () Bool)

(assert (=> d!4306 m!20037))

(declare-fun m!20039 () Bool)

(assert (=> d!4306 m!20039))

(assert (=> b!13373 d!4306))

(declare-fun d!4310 () Bool)

(declare-fun e!8211 () Bool)

(assert (=> d!4310 e!8211))

(declare-fun res!12696 () Bool)

(assert (=> d!4310 (=> (not res!12696) (not e!8211))))

(declare-fun lt!21067 () (_ BitVec 64))

(declare-fun lt!21068 () (_ BitVec 64))

(declare-fun lt!21065 () (_ BitVec 64))

(assert (=> d!4310 (= res!12696 (= lt!21065 (bvsub lt!21067 lt!21068)))))

(assert (=> d!4310 (or (= (bvand lt!21067 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!21068 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!21067 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!21067 lt!21068) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!4310 (= lt!21068 (remainingBits!0 ((_ sign_extend 32) (size!327 (buf!678 thiss!957))) ((_ sign_extend 32) (currentByte!1777 thiss!957)) ((_ sign_extend 32) (currentBit!1772 thiss!957))))))

(declare-fun lt!21063 () (_ BitVec 64))

(declare-fun lt!21066 () (_ BitVec 64))

(assert (=> d!4310 (= lt!21067 (bvmul lt!21063 lt!21066))))

(assert (=> d!4310 (or (= lt!21063 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!21066 (bvsdiv (bvmul lt!21063 lt!21066) lt!21063)))))

(assert (=> d!4310 (= lt!21066 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!4310 (= lt!21063 ((_ sign_extend 32) (size!327 (buf!678 thiss!957))))))

(assert (=> d!4310 (= lt!21065 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1777 thiss!957)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1772 thiss!957))))))

(assert (=> d!4310 (invariant!0 (currentBit!1772 thiss!957) (currentByte!1777 thiss!957) (size!327 (buf!678 thiss!957)))))

(assert (=> d!4310 (= (bitIndex!0 (size!327 (buf!678 thiss!957)) (currentByte!1777 thiss!957) (currentBit!1772 thiss!957)) lt!21065)))

(declare-fun b!13387 () Bool)

(declare-fun res!12697 () Bool)

(assert (=> b!13387 (=> (not res!12697) (not e!8211))))

(assert (=> b!13387 (= res!12697 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!21065))))

(declare-fun b!13388 () Bool)

(declare-fun lt!21064 () (_ BitVec 64))

(assert (=> b!13388 (= e!8211 (bvsle lt!21065 (bvmul lt!21064 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!13388 (or (= lt!21064 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!21064 #b0000000000000000000000000000000000000000000000000000000000001000) lt!21064)))))

(assert (=> b!13388 (= lt!21064 ((_ sign_extend 32) (size!327 (buf!678 thiss!957))))))

(assert (= (and d!4310 res!12696) b!13387))

(assert (= (and b!13387 res!12697) b!13388))

(declare-fun m!20041 () Bool)

(assert (=> d!4310 m!20041))

(assert (=> d!4310 m!20019))

(assert (=> b!13373 d!4310))

(declare-fun d!4312 () Bool)

(assert (=> d!4312 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!327 (buf!678 thiss!957))) ((_ sign_extend 32) (currentByte!1777 thiss!957)) ((_ sign_extend 32) (currentBit!1772 thiss!957))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!327 (buf!678 thiss!957))) ((_ sign_extend 32) (currentByte!1777 thiss!957)) ((_ sign_extend 32) (currentBit!1772 thiss!957))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!1205 () Bool)

(assert (= bs!1205 d!4312))

(assert (=> bs!1205 m!20041))

(assert (=> start!2862 d!4312))

(declare-fun d!4314 () Bool)

(assert (=> d!4314 (= (inv!12 thiss!957) (invariant!0 (currentBit!1772 thiss!957) (currentByte!1777 thiss!957) (size!327 (buf!678 thiss!957))))))

(declare-fun bs!1206 () Bool)

(assert (= bs!1206 d!4314))

(assert (=> bs!1206 m!20019))

(assert (=> start!2862 d!4314))

(declare-fun d!4316 () Bool)

(declare-fun res!12717 () Bool)

(declare-fun e!8222 () Bool)

(assert (=> d!4316 (=> (not res!12717) (not e!8222))))

(assert (=> d!4316 (= res!12717 (= (size!327 (buf!678 thiss!957)) (size!327 (buf!678 (_2!849 lt!21040)))))))

(assert (=> d!4316 (= (isPrefixOf!0 thiss!957 (_2!849 lt!21040)) e!8222)))

(declare-fun b!13408 () Bool)

(declare-fun res!12716 () Bool)

(assert (=> b!13408 (=> (not res!12716) (not e!8222))))

(assert (=> b!13408 (= res!12716 (bvsle (bitIndex!0 (size!327 (buf!678 thiss!957)) (currentByte!1777 thiss!957) (currentBit!1772 thiss!957)) (bitIndex!0 (size!327 (buf!678 (_2!849 lt!21040))) (currentByte!1777 (_2!849 lt!21040)) (currentBit!1772 (_2!849 lt!21040)))))))

(declare-fun b!13409 () Bool)

(declare-fun e!8223 () Bool)

(assert (=> b!13409 (= e!8222 e!8223)))

(declare-fun res!12718 () Bool)

(assert (=> b!13409 (=> res!12718 e!8223)))

(assert (=> b!13409 (= res!12718 (= (size!327 (buf!678 thiss!957)) #b00000000000000000000000000000000))))

(declare-fun b!13410 () Bool)

(declare-fun arrayBitRangesEq!0 (array!754 array!754 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!13410 (= e!8223 (arrayBitRangesEq!0 (buf!678 thiss!957) (buf!678 (_2!849 lt!21040)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!327 (buf!678 thiss!957)) (currentByte!1777 thiss!957) (currentBit!1772 thiss!957))))))

(assert (= (and d!4316 res!12717) b!13408))

(assert (= (and b!13408 res!12716) b!13409))

(assert (= (and b!13409 (not res!12718)) b!13410))

(assert (=> b!13408 m!20029))

(assert (=> b!13408 m!20027))

(assert (=> b!13410 m!20029))

(assert (=> b!13410 m!20029))

(declare-fun m!20055 () Bool)

(assert (=> b!13410 m!20055))

(assert (=> b!13374 d!4316))

(declare-fun b!13456 () Bool)

(declare-fun res!12763 () Bool)

(declare-fun e!8248 () Bool)

(assert (=> b!13456 (=> (not res!12763) (not e!8248))))

(declare-fun lt!21144 () (_ BitVec 64))

(declare-fun lt!21145 () tuple2!1588)

(declare-fun lt!21143 () (_ BitVec 64))

(assert (=> b!13456 (= res!12763 (= (bitIndex!0 (size!327 (buf!678 (_2!849 lt!21145))) (currentByte!1777 (_2!849 lt!21145)) (currentBit!1772 (_2!849 lt!21145))) (bvadd lt!21143 lt!21144)))))

(assert (=> b!13456 (or (not (= (bvand lt!21143 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!21144 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!21143 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!21143 lt!21144) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!13456 (= lt!21144 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!13456 (= lt!21143 (bitIndex!0 (size!327 (buf!678 thiss!957)) (currentByte!1777 thiss!957) (currentBit!1772 thiss!957)))))

(declare-fun b!13457 () Bool)

(declare-fun res!12762 () Bool)

(assert (=> b!13457 (=> (not res!12762) (not e!8248))))

(assert (=> b!13457 (= res!12762 (isPrefixOf!0 thiss!957 (_2!849 lt!21145)))))

(declare-fun b!13458 () Bool)

(declare-fun e!8247 () Bool)

(assert (=> b!13458 (= e!8248 e!8247)))

(declare-fun res!12765 () Bool)

(assert (=> b!13458 (=> (not res!12765) (not e!8247))))

(declare-fun lt!21146 () tuple2!1590)

(assert (=> b!13458 (= res!12765 (and (= (_2!850 lt!21146) false) (= (_1!850 lt!21146) (_2!849 lt!21145))))))

(assert (=> b!13458 (= lt!21146 (readBitPure!0 (readerFrom!0 (_2!849 lt!21145) (currentBit!1772 thiss!957) (currentByte!1777 thiss!957))))))

(declare-fun d!4320 () Bool)

(assert (=> d!4320 e!8248))

(declare-fun res!12764 () Bool)

(assert (=> d!4320 (=> (not res!12764) (not e!8248))))

(assert (=> d!4320 (= res!12764 (= (size!327 (buf!678 thiss!957)) (size!327 (buf!678 (_2!849 lt!21145)))))))

(declare-fun choose!16 (BitStream!614 Bool) tuple2!1588)

(assert (=> d!4320 (= lt!21145 (choose!16 thiss!957 false))))

(assert (=> d!4320 (validate_offset_bit!0 ((_ sign_extend 32) (size!327 (buf!678 thiss!957))) ((_ sign_extend 32) (currentByte!1777 thiss!957)) ((_ sign_extend 32) (currentBit!1772 thiss!957)))))

(assert (=> d!4320 (= (appendBit!0 thiss!957 false) lt!21145)))

(declare-fun b!13459 () Bool)

(assert (=> b!13459 (= e!8247 (= (bitIndex!0 (size!327 (buf!678 (_1!850 lt!21146))) (currentByte!1777 (_1!850 lt!21146)) (currentBit!1772 (_1!850 lt!21146))) (bitIndex!0 (size!327 (buf!678 (_2!849 lt!21145))) (currentByte!1777 (_2!849 lt!21145)) (currentBit!1772 (_2!849 lt!21145)))))))

(assert (= (and d!4320 res!12764) b!13456))

(assert (= (and b!13456 res!12763) b!13457))

(assert (= (and b!13457 res!12762) b!13458))

(assert (= (and b!13458 res!12765) b!13459))

(declare-fun m!20079 () Bool)

(assert (=> b!13457 m!20079))

(declare-fun m!20081 () Bool)

(assert (=> b!13459 m!20081))

(declare-fun m!20083 () Bool)

(assert (=> b!13459 m!20083))

(declare-fun m!20085 () Bool)

(assert (=> d!4320 m!20085))

(assert (=> d!4320 m!20021))

(declare-fun m!20087 () Bool)

(assert (=> b!13458 m!20087))

(assert (=> b!13458 m!20087))

(declare-fun m!20089 () Bool)

(assert (=> b!13458 m!20089))

(assert (=> b!13456 m!20083))

(assert (=> b!13456 m!20029))

(assert (=> b!13375 d!4320))

(declare-fun d!4336 () Bool)

(assert (=> d!4336 (= (array_inv!316 (buf!678 thiss!957)) (bvsge (size!327 (buf!678 thiss!957)) #b00000000000000000000000000000000))))

(assert (=> b!13371 d!4336))

(declare-fun d!4342 () Bool)

(declare-datatypes ((tuple2!1596 0))(
  ( (tuple2!1597 (_1!853 Bool) (_2!853 BitStream!614)) )
))
(declare-fun lt!21155 () tuple2!1596)

(declare-fun readBit!0 (BitStream!614) tuple2!1596)

(assert (=> d!4342 (= lt!21155 (readBit!0 (readerFrom!0 (_2!849 lt!21040) (currentBit!1772 thiss!957) (currentByte!1777 thiss!957))))))

(assert (=> d!4342 (= (readBitPure!0 (readerFrom!0 (_2!849 lt!21040) (currentBit!1772 thiss!957) (currentByte!1777 thiss!957))) (tuple2!1591 (_2!853 lt!21155) (_1!853 lt!21155)))))

(declare-fun bs!1209 () Bool)

(assert (= bs!1209 d!4342))

(assert (=> bs!1209 m!20013))

(declare-fun m!20095 () Bool)

(assert (=> bs!1209 m!20095))

(assert (=> b!13376 d!4342))

(declare-fun d!4344 () Bool)

(declare-fun e!8258 () Bool)

(assert (=> d!4344 e!8258))

(declare-fun res!12780 () Bool)

(assert (=> d!4344 (=> (not res!12780) (not e!8258))))

(assert (=> d!4344 (= res!12780 (invariant!0 (currentBit!1772 (_2!849 lt!21040)) (currentByte!1777 (_2!849 lt!21040)) (size!327 (buf!678 (_2!849 lt!21040)))))))

(assert (=> d!4344 (= (readerFrom!0 (_2!849 lt!21040) (currentBit!1772 thiss!957) (currentByte!1777 thiss!957)) (BitStream!615 (buf!678 (_2!849 lt!21040)) (currentByte!1777 thiss!957) (currentBit!1772 thiss!957)))))

(declare-fun b!13473 () Bool)

(assert (=> b!13473 (= e!8258 (invariant!0 (currentBit!1772 thiss!957) (currentByte!1777 thiss!957) (size!327 (buf!678 (_2!849 lt!21040)))))))

(assert (= (and d!4344 res!12780) b!13473))

(assert (=> d!4344 m!20039))

(declare-fun m!20099 () Bool)

(assert (=> b!13473 m!20099))

(assert (=> b!13376 d!4344))

(declare-fun d!4348 () Bool)

(declare-fun e!8259 () Bool)

(assert (=> d!4348 e!8259))

(declare-fun res!12781 () Bool)

(assert (=> d!4348 (=> (not res!12781) (not e!8259))))

(declare-fun lt!21161 () (_ BitVec 64))

(declare-fun lt!21160 () (_ BitVec 64))

(declare-fun lt!21158 () (_ BitVec 64))

(assert (=> d!4348 (= res!12781 (= lt!21158 (bvsub lt!21160 lt!21161)))))

(assert (=> d!4348 (or (= (bvand lt!21160 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!21161 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!21160 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!21160 lt!21161) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!4348 (= lt!21161 (remainingBits!0 ((_ sign_extend 32) (size!327 (buf!678 (_1!850 lt!21041)))) ((_ sign_extend 32) (currentByte!1777 (_1!850 lt!21041))) ((_ sign_extend 32) (currentBit!1772 (_1!850 lt!21041)))))))

(declare-fun lt!21156 () (_ BitVec 64))

(declare-fun lt!21159 () (_ BitVec 64))

(assert (=> d!4348 (= lt!21160 (bvmul lt!21156 lt!21159))))

(assert (=> d!4348 (or (= lt!21156 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!21159 (bvsdiv (bvmul lt!21156 lt!21159) lt!21156)))))

(assert (=> d!4348 (= lt!21159 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!4348 (= lt!21156 ((_ sign_extend 32) (size!327 (buf!678 (_1!850 lt!21041)))))))

(assert (=> d!4348 (= lt!21158 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1777 (_1!850 lt!21041))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1772 (_1!850 lt!21041)))))))

(assert (=> d!4348 (invariant!0 (currentBit!1772 (_1!850 lt!21041)) (currentByte!1777 (_1!850 lt!21041)) (size!327 (buf!678 (_1!850 lt!21041))))))

(assert (=> d!4348 (= (bitIndex!0 (size!327 (buf!678 (_1!850 lt!21041))) (currentByte!1777 (_1!850 lt!21041)) (currentBit!1772 (_1!850 lt!21041))) lt!21158)))

(declare-fun b!13474 () Bool)

(declare-fun res!12782 () Bool)

(assert (=> b!13474 (=> (not res!12782) (not e!8259))))

(assert (=> b!13474 (= res!12782 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!21158))))

(declare-fun b!13475 () Bool)

(declare-fun lt!21157 () (_ BitVec 64))

(assert (=> b!13475 (= e!8259 (bvsle lt!21158 (bvmul lt!21157 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!13475 (or (= lt!21157 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!21157 #b0000000000000000000000000000000000000000000000000000000000001000) lt!21157)))))

(assert (=> b!13475 (= lt!21157 ((_ sign_extend 32) (size!327 (buf!678 (_1!850 lt!21041)))))))

(assert (= (and d!4348 res!12781) b!13474))

