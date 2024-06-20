; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!240 () Bool)

(assert start!240)

(declare-fun b!616 () Bool)

(declare-fun e!329 () Bool)

(declare-fun e!332 () Bool)

(assert (=> b!616 (= e!329 (not e!332))))

(declare-fun res!2708 () Bool)

(assert (=> b!616 (=> res!2708 e!332)))

(declare-datatypes ((array!83 0))(
  ( (array!84 (arr!419 (Array (_ BitVec 32) (_ BitVec 8))) (size!32 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!48 0))(
  ( (BitStream!49 (buf!344 array!83) (currentByte!1251 (_ BitVec 32)) (currentBit!1246 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!9 0))(
  ( (Unit!10) )
))
(declare-datatypes ((tuple2!20 0))(
  ( (tuple2!21 (_1!10 Unit!9) (_2!10 BitStream!48)) )
))
(declare-fun lt!194 () tuple2!20)

(declare-fun thiss!932 () BitStream!48)

(assert (=> b!616 (= res!2708 (not (= (size!32 (buf!344 (_2!10 lt!194))) (size!32 (buf!344 thiss!932)))))))

(declare-fun e!335 () Bool)

(assert (=> b!616 e!335))

(declare-fun res!2711 () Bool)

(assert (=> b!616 (=> (not res!2711) (not e!335))))

(assert (=> b!616 (= res!2711 (= (size!32 (buf!344 thiss!932)) (size!32 (buf!344 (_2!10 lt!194)))))))

(declare-fun appendBit!0 (BitStream!48 Bool) tuple2!20)

(assert (=> b!616 (= lt!194 (appendBit!0 thiss!932 true))))

(declare-fun b!617 () Bool)

(declare-fun e!334 () Bool)

(declare-fun e!333 () Bool)

(assert (=> b!617 (= e!334 e!333)))

(declare-fun res!2712 () Bool)

(assert (=> b!617 (=> (not res!2712) (not e!333))))

(declare-datatypes ((tuple2!22 0))(
  ( (tuple2!23 (_1!11 BitStream!48) (_2!11 Bool)) )
))
(declare-fun lt!193 () tuple2!22)

(assert (=> b!617 (= res!2712 (and (_2!11 lt!193) (= (_1!11 lt!193) (_2!10 lt!194))))))

(declare-fun readBitPure!0 (BitStream!48) tuple2!22)

(declare-fun readerFrom!0 (BitStream!48 (_ BitVec 32) (_ BitVec 32)) BitStream!48)

(assert (=> b!617 (= lt!193 (readBitPure!0 (readerFrom!0 (_2!10 lt!194) (currentBit!1246 thiss!932) (currentByte!1251 thiss!932))))))

(declare-fun res!2710 () Bool)

(assert (=> start!240 (=> (not res!2710) (not e!329))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!240 (= res!2710 (validate_offset_bit!0 ((_ sign_extend 32) (size!32 (buf!344 thiss!932))) ((_ sign_extend 32) (currentByte!1251 thiss!932)) ((_ sign_extend 32) (currentBit!1246 thiss!932))))))

(assert (=> start!240 e!329))

(declare-fun e!331 () Bool)

(declare-fun inv!12 (BitStream!48) Bool)

(assert (=> start!240 (and (inv!12 thiss!932) e!331)))

(declare-fun b!618 () Bool)

(declare-fun lt!191 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!618 (= e!333 (= (bitIndex!0 (size!32 (buf!344 (_1!11 lt!193))) (currentByte!1251 (_1!11 lt!193)) (currentBit!1246 (_1!11 lt!193))) lt!191))))

(declare-fun b!619 () Bool)

(declare-fun res!2713 () Bool)

(assert (=> b!619 (=> (not res!2713) (not e!334))))

(declare-fun isPrefixOf!0 (BitStream!48 BitStream!48) Bool)

(assert (=> b!619 (= res!2713 (isPrefixOf!0 thiss!932 (_2!10 lt!194)))))

(declare-fun b!620 () Bool)

(assert (=> b!620 (= e!335 e!334)))

(declare-fun res!2709 () Bool)

(assert (=> b!620 (=> (not res!2709) (not e!334))))

(declare-fun lt!192 () (_ BitVec 64))

(assert (=> b!620 (= res!2709 (= lt!191 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!192)))))

(assert (=> b!620 (= lt!191 (bitIndex!0 (size!32 (buf!344 (_2!10 lt!194))) (currentByte!1251 (_2!10 lt!194)) (currentBit!1246 (_2!10 lt!194))))))

(assert (=> b!620 (= lt!192 (bitIndex!0 (size!32 (buf!344 thiss!932)) (currentByte!1251 thiss!932) (currentBit!1246 thiss!932)))))

(declare-fun b!621 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!621 (= e!332 (invariant!0 (currentBit!1246 thiss!932) (currentByte!1251 thiss!932) (size!32 (buf!344 thiss!932))))))

(declare-fun b!622 () Bool)

(declare-fun array_inv!29 (array!83) Bool)

(assert (=> b!622 (= e!331 (array_inv!29 (buf!344 thiss!932)))))

(assert (= (and start!240 res!2710) b!616))

(assert (= (and b!616 res!2711) b!620))

(assert (= (and b!620 res!2709) b!619))

(assert (= (and b!619 res!2713) b!617))

(assert (= (and b!617 res!2712) b!618))

(assert (= (and b!616 (not res!2708)) b!621))

(assert (= start!240 b!622))

(declare-fun m!347 () Bool)

(assert (=> b!620 m!347))

(declare-fun m!349 () Bool)

(assert (=> b!620 m!349))

(declare-fun m!351 () Bool)

(assert (=> b!618 m!351))

(declare-fun m!353 () Bool)

(assert (=> b!622 m!353))

(declare-fun m!355 () Bool)

(assert (=> b!619 m!355))

(declare-fun m!357 () Bool)

(assert (=> start!240 m!357))

(declare-fun m!359 () Bool)

(assert (=> start!240 m!359))

(declare-fun m!361 () Bool)

(assert (=> b!617 m!361))

(assert (=> b!617 m!361))

(declare-fun m!363 () Bool)

(assert (=> b!617 m!363))

(declare-fun m!365 () Bool)

(assert (=> b!616 m!365))

(declare-fun m!367 () Bool)

(assert (=> b!621 m!367))

(check-sat (not b!620) (not b!622) (not b!619) (not b!618) (not start!240) (not b!617) (not b!616) (not b!621))
(check-sat)
(get-model)

(declare-fun d!910 () Bool)

(declare-fun res!2740 () Bool)

(declare-fun e!361 () Bool)

(assert (=> d!910 (=> (not res!2740) (not e!361))))

(assert (=> d!910 (= res!2740 (= (size!32 (buf!344 thiss!932)) (size!32 (buf!344 (_2!10 lt!194)))))))

(assert (=> d!910 (= (isPrefixOf!0 thiss!932 (_2!10 lt!194)) e!361)))

(declare-fun b!650 () Bool)

(declare-fun res!2738 () Bool)

(assert (=> b!650 (=> (not res!2738) (not e!361))))

(assert (=> b!650 (= res!2738 (bvsle (bitIndex!0 (size!32 (buf!344 thiss!932)) (currentByte!1251 thiss!932) (currentBit!1246 thiss!932)) (bitIndex!0 (size!32 (buf!344 (_2!10 lt!194))) (currentByte!1251 (_2!10 lt!194)) (currentBit!1246 (_2!10 lt!194)))))))

(declare-fun b!651 () Bool)

(declare-fun e!362 () Bool)

(assert (=> b!651 (= e!361 e!362)))

(declare-fun res!2739 () Bool)

(assert (=> b!651 (=> res!2739 e!362)))

(assert (=> b!651 (= res!2739 (= (size!32 (buf!344 thiss!932)) #b00000000000000000000000000000000))))

(declare-fun b!652 () Bool)

(declare-fun arrayBitRangesEq!0 (array!83 array!83 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!652 (= e!362 (arrayBitRangesEq!0 (buf!344 thiss!932) (buf!344 (_2!10 lt!194)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!32 (buf!344 thiss!932)) (currentByte!1251 thiss!932) (currentBit!1246 thiss!932))))))

(assert (= (and d!910 res!2740) b!650))

(assert (= (and b!650 res!2738) b!651))

(assert (= (and b!651 (not res!2739)) b!652))

(assert (=> b!650 m!349))

(assert (=> b!650 m!347))

(assert (=> b!652 m!349))

(assert (=> b!652 m!349))

(declare-fun m!391 () Bool)

(assert (=> b!652 m!391))

(assert (=> b!619 d!910))

(declare-fun d!914 () Bool)

(declare-fun e!374 () Bool)

(assert (=> d!914 e!374))

(declare-fun res!2761 () Bool)

(assert (=> d!914 (=> (not res!2761) (not e!374))))

(declare-fun lt!242 () (_ BitVec 64))

(declare-fun lt!239 () (_ BitVec 64))

(declare-fun lt!237 () (_ BitVec 64))

(assert (=> d!914 (= res!2761 (= lt!242 (bvsub lt!237 lt!239)))))

(assert (=> d!914 (or (= (bvand lt!237 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!239 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!237 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!237 lt!239) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!914 (= lt!239 (remainingBits!0 ((_ sign_extend 32) (size!32 (buf!344 (_1!11 lt!193)))) ((_ sign_extend 32) (currentByte!1251 (_1!11 lt!193))) ((_ sign_extend 32) (currentBit!1246 (_1!11 lt!193)))))))

(declare-fun lt!238 () (_ BitVec 64))

(declare-fun lt!241 () (_ BitVec 64))

(assert (=> d!914 (= lt!237 (bvmul lt!238 lt!241))))

(assert (=> d!914 (or (= lt!238 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!241 (bvsdiv (bvmul lt!238 lt!241) lt!238)))))

(assert (=> d!914 (= lt!241 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!914 (= lt!238 ((_ sign_extend 32) (size!32 (buf!344 (_1!11 lt!193)))))))

(assert (=> d!914 (= lt!242 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1251 (_1!11 lt!193))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1246 (_1!11 lt!193)))))))

(assert (=> d!914 (invariant!0 (currentBit!1246 (_1!11 lt!193)) (currentByte!1251 (_1!11 lt!193)) (size!32 (buf!344 (_1!11 lt!193))))))

(assert (=> d!914 (= (bitIndex!0 (size!32 (buf!344 (_1!11 lt!193))) (currentByte!1251 (_1!11 lt!193)) (currentBit!1246 (_1!11 lt!193))) lt!242)))

(declare-fun b!672 () Bool)

(declare-fun res!2760 () Bool)

(assert (=> b!672 (=> (not res!2760) (not e!374))))

(assert (=> b!672 (= res!2760 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!242))))

(declare-fun b!673 () Bool)

(declare-fun lt!240 () (_ BitVec 64))

(assert (=> b!673 (= e!374 (bvsle lt!242 (bvmul lt!240 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!673 (or (= lt!240 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!240 #b0000000000000000000000000000000000000000000000000000000000001000) lt!240)))))

(assert (=> b!673 (= lt!240 ((_ sign_extend 32) (size!32 (buf!344 (_1!11 lt!193)))))))

(assert (= (and d!914 res!2761) b!672))

(assert (= (and b!672 res!2760) b!673))

(declare-fun m!401 () Bool)

(assert (=> d!914 m!401))

(declare-fun m!403 () Bool)

(assert (=> d!914 m!403))

(assert (=> b!618 d!914))

(declare-fun d!928 () Bool)

(declare-fun e!375 () Bool)

(assert (=> d!928 e!375))

(declare-fun res!2763 () Bool)

(assert (=> d!928 (=> (not res!2763) (not e!375))))

(declare-fun lt!248 () (_ BitVec 64))

(declare-fun lt!245 () (_ BitVec 64))

(declare-fun lt!243 () (_ BitVec 64))

(assert (=> d!928 (= res!2763 (= lt!248 (bvsub lt!243 lt!245)))))

(assert (=> d!928 (or (= (bvand lt!243 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!245 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!243 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!243 lt!245) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!928 (= lt!245 (remainingBits!0 ((_ sign_extend 32) (size!32 (buf!344 (_2!10 lt!194)))) ((_ sign_extend 32) (currentByte!1251 (_2!10 lt!194))) ((_ sign_extend 32) (currentBit!1246 (_2!10 lt!194)))))))

(declare-fun lt!244 () (_ BitVec 64))

(declare-fun lt!247 () (_ BitVec 64))

(assert (=> d!928 (= lt!243 (bvmul lt!244 lt!247))))

(assert (=> d!928 (or (= lt!244 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!247 (bvsdiv (bvmul lt!244 lt!247) lt!244)))))

(assert (=> d!928 (= lt!247 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!928 (= lt!244 ((_ sign_extend 32) (size!32 (buf!344 (_2!10 lt!194)))))))

(assert (=> d!928 (= lt!248 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1251 (_2!10 lt!194))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1246 (_2!10 lt!194)))))))

(assert (=> d!928 (invariant!0 (currentBit!1246 (_2!10 lt!194)) (currentByte!1251 (_2!10 lt!194)) (size!32 (buf!344 (_2!10 lt!194))))))

(assert (=> d!928 (= (bitIndex!0 (size!32 (buf!344 (_2!10 lt!194))) (currentByte!1251 (_2!10 lt!194)) (currentBit!1246 (_2!10 lt!194))) lt!248)))

(declare-fun b!674 () Bool)

(declare-fun res!2762 () Bool)

(assert (=> b!674 (=> (not res!2762) (not e!375))))

(assert (=> b!674 (= res!2762 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!248))))

(declare-fun b!675 () Bool)

(declare-fun lt!246 () (_ BitVec 64))

(assert (=> b!675 (= e!375 (bvsle lt!248 (bvmul lt!246 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!675 (or (= lt!246 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!246 #b0000000000000000000000000000000000000000000000000000000000001000) lt!246)))))

(assert (=> b!675 (= lt!246 ((_ sign_extend 32) (size!32 (buf!344 (_2!10 lt!194)))))))

(assert (= (and d!928 res!2763) b!674))

(assert (= (and b!674 res!2762) b!675))

(declare-fun m!405 () Bool)

(assert (=> d!928 m!405))

(declare-fun m!407 () Bool)

(assert (=> d!928 m!407))

(assert (=> b!620 d!928))

(declare-fun d!930 () Bool)

(declare-fun e!376 () Bool)

(assert (=> d!930 e!376))

(declare-fun res!2765 () Bool)

(assert (=> d!930 (=> (not res!2765) (not e!376))))

(declare-fun lt!251 () (_ BitVec 64))

(declare-fun lt!254 () (_ BitVec 64))

(declare-fun lt!249 () (_ BitVec 64))

(assert (=> d!930 (= res!2765 (= lt!254 (bvsub lt!249 lt!251)))))

(assert (=> d!930 (or (= (bvand lt!249 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!251 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!249 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!249 lt!251) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!930 (= lt!251 (remainingBits!0 ((_ sign_extend 32) (size!32 (buf!344 thiss!932))) ((_ sign_extend 32) (currentByte!1251 thiss!932)) ((_ sign_extend 32) (currentBit!1246 thiss!932))))))

(declare-fun lt!250 () (_ BitVec 64))

(declare-fun lt!253 () (_ BitVec 64))

(assert (=> d!930 (= lt!249 (bvmul lt!250 lt!253))))

(assert (=> d!930 (or (= lt!250 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!253 (bvsdiv (bvmul lt!250 lt!253) lt!250)))))

(assert (=> d!930 (= lt!253 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!930 (= lt!250 ((_ sign_extend 32) (size!32 (buf!344 thiss!932))))))

(assert (=> d!930 (= lt!254 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1251 thiss!932)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1246 thiss!932))))))

(assert (=> d!930 (invariant!0 (currentBit!1246 thiss!932) (currentByte!1251 thiss!932) (size!32 (buf!344 thiss!932)))))

(assert (=> d!930 (= (bitIndex!0 (size!32 (buf!344 thiss!932)) (currentByte!1251 thiss!932) (currentBit!1246 thiss!932)) lt!254)))

(declare-fun b!676 () Bool)

(declare-fun res!2764 () Bool)

(assert (=> b!676 (=> (not res!2764) (not e!376))))

(assert (=> b!676 (= res!2764 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!254))))

(declare-fun b!677 () Bool)

(declare-fun lt!252 () (_ BitVec 64))

(assert (=> b!677 (= e!376 (bvsle lt!254 (bvmul lt!252 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!677 (or (= lt!252 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!252 #b0000000000000000000000000000000000000000000000000000000000001000) lt!252)))))

(assert (=> b!677 (= lt!252 ((_ sign_extend 32) (size!32 (buf!344 thiss!932))))))

(assert (= (and d!930 res!2765) b!676))

(assert (= (and b!676 res!2764) b!677))

(declare-fun m!409 () Bool)

(assert (=> d!930 m!409))

(assert (=> d!930 m!367))

(assert (=> b!620 d!930))

(declare-fun d!932 () Bool)

(assert (=> d!932 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!32 (buf!344 thiss!932))) ((_ sign_extend 32) (currentByte!1251 thiss!932)) ((_ sign_extend 32) (currentBit!1246 thiss!932))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!32 (buf!344 thiss!932))) ((_ sign_extend 32) (currentByte!1251 thiss!932)) ((_ sign_extend 32) (currentBit!1246 thiss!932))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!392 () Bool)

(assert (= bs!392 d!932))

(assert (=> bs!392 m!409))

(assert (=> start!240 d!932))

(declare-fun d!934 () Bool)

(assert (=> d!934 (= (inv!12 thiss!932) (invariant!0 (currentBit!1246 thiss!932) (currentByte!1251 thiss!932) (size!32 (buf!344 thiss!932))))))

(declare-fun bs!393 () Bool)

(assert (= bs!393 d!934))

(assert (=> bs!393 m!367))

(assert (=> start!240 d!934))

(declare-fun b!718 () Bool)

(declare-fun res!2805 () Bool)

(declare-fun e!395 () Bool)

(assert (=> b!718 (=> (not res!2805) (not e!395))))

(declare-fun lt!305 () tuple2!20)

(assert (=> b!718 (= res!2805 (isPrefixOf!0 thiss!932 (_2!10 lt!305)))))

(declare-fun b!717 () Bool)

(declare-fun res!2804 () Bool)

(assert (=> b!717 (=> (not res!2804) (not e!395))))

(declare-fun lt!304 () (_ BitVec 64))

(declare-fun lt!303 () (_ BitVec 64))

(assert (=> b!717 (= res!2804 (= (bitIndex!0 (size!32 (buf!344 (_2!10 lt!305))) (currentByte!1251 (_2!10 lt!305)) (currentBit!1246 (_2!10 lt!305))) (bvadd lt!304 lt!303)))))

(assert (=> b!717 (or (not (= (bvand lt!304 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!303 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!304 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!304 lt!303) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!717 (= lt!303 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!717 (= lt!304 (bitIndex!0 (size!32 (buf!344 thiss!932)) (currentByte!1251 thiss!932) (currentBit!1246 thiss!932)))))

(declare-fun b!719 () Bool)

(declare-fun e!396 () Bool)

(assert (=> b!719 (= e!395 e!396)))

(declare-fun res!2806 () Bool)

(assert (=> b!719 (=> (not res!2806) (not e!396))))

(declare-fun lt!302 () tuple2!22)

(assert (=> b!719 (= res!2806 (and (= (_2!11 lt!302) true) (= (_1!11 lt!302) (_2!10 lt!305))))))

(assert (=> b!719 (= lt!302 (readBitPure!0 (readerFrom!0 (_2!10 lt!305) (currentBit!1246 thiss!932) (currentByte!1251 thiss!932))))))

(declare-fun d!936 () Bool)

(assert (=> d!936 e!395))

(declare-fun res!2803 () Bool)

(assert (=> d!936 (=> (not res!2803) (not e!395))))

(assert (=> d!936 (= res!2803 (= (size!32 (buf!344 thiss!932)) (size!32 (buf!344 (_2!10 lt!305)))))))

(declare-fun choose!16 (BitStream!48 Bool) tuple2!20)

(assert (=> d!936 (= lt!305 (choose!16 thiss!932 true))))

(assert (=> d!936 (validate_offset_bit!0 ((_ sign_extend 32) (size!32 (buf!344 thiss!932))) ((_ sign_extend 32) (currentByte!1251 thiss!932)) ((_ sign_extend 32) (currentBit!1246 thiss!932)))))

(assert (=> d!936 (= (appendBit!0 thiss!932 true) lt!305)))

(declare-fun b!720 () Bool)

(assert (=> b!720 (= e!396 (= (bitIndex!0 (size!32 (buf!344 (_1!11 lt!302))) (currentByte!1251 (_1!11 lt!302)) (currentBit!1246 (_1!11 lt!302))) (bitIndex!0 (size!32 (buf!344 (_2!10 lt!305))) (currentByte!1251 (_2!10 lt!305)) (currentBit!1246 (_2!10 lt!305)))))))

(assert (= (and d!936 res!2803) b!717))

(assert (= (and b!717 res!2804) b!718))

(assert (= (and b!718 res!2805) b!719))

(assert (= (and b!719 res!2806) b!720))

(declare-fun m!443 () Bool)

(assert (=> d!936 m!443))

(assert (=> d!936 m!357))

(declare-fun m!445 () Bool)

(assert (=> b!720 m!445))

(declare-fun m!447 () Bool)

(assert (=> b!720 m!447))

(assert (=> b!717 m!447))

(assert (=> b!717 m!349))

(declare-fun m!449 () Bool)

(assert (=> b!718 m!449))

(declare-fun m!451 () Bool)

(assert (=> b!719 m!451))

(assert (=> b!719 m!451))

(declare-fun m!453 () Bool)

(assert (=> b!719 m!453))

(assert (=> b!616 d!936))

(declare-fun d!948 () Bool)

(assert (=> d!948 (= (invariant!0 (currentBit!1246 thiss!932) (currentByte!1251 thiss!932) (size!32 (buf!344 thiss!932))) (and (bvsge (currentBit!1246 thiss!932) #b00000000000000000000000000000000) (bvslt (currentBit!1246 thiss!932) #b00000000000000000000000000001000) (bvsge (currentByte!1251 thiss!932) #b00000000000000000000000000000000) (or (bvslt (currentByte!1251 thiss!932) (size!32 (buf!344 thiss!932))) (and (= (currentBit!1246 thiss!932) #b00000000000000000000000000000000) (= (currentByte!1251 thiss!932) (size!32 (buf!344 thiss!932)))))))))

(assert (=> b!621 d!948))

(declare-fun d!952 () Bool)

(declare-datatypes ((tuple2!32 0))(
  ( (tuple2!33 (_1!16 Bool) (_2!16 BitStream!48)) )
))
(declare-fun lt!308 () tuple2!32)

(declare-fun readBit!0 (BitStream!48) tuple2!32)

(assert (=> d!952 (= lt!308 (readBit!0 (readerFrom!0 (_2!10 lt!194) (currentBit!1246 thiss!932) (currentByte!1251 thiss!932))))))

(assert (=> d!952 (= (readBitPure!0 (readerFrom!0 (_2!10 lt!194) (currentBit!1246 thiss!932) (currentByte!1251 thiss!932))) (tuple2!23 (_2!16 lt!308) (_1!16 lt!308)))))

(declare-fun bs!396 () Bool)

(assert (= bs!396 d!952))

(assert (=> bs!396 m!361))

(declare-fun m!461 () Bool)

(assert (=> bs!396 m!461))

(assert (=> b!617 d!952))

(declare-fun d!958 () Bool)

(declare-fun e!408 () Bool)

(assert (=> d!958 e!408))

(declare-fun res!2822 () Bool)

(assert (=> d!958 (=> (not res!2822) (not e!408))))

(assert (=> d!958 (= res!2822 (invariant!0 (currentBit!1246 (_2!10 lt!194)) (currentByte!1251 (_2!10 lt!194)) (size!32 (buf!344 (_2!10 lt!194)))))))

(assert (=> d!958 (= (readerFrom!0 (_2!10 lt!194) (currentBit!1246 thiss!932) (currentByte!1251 thiss!932)) (BitStream!49 (buf!344 (_2!10 lt!194)) (currentByte!1251 thiss!932) (currentBit!1246 thiss!932)))))

(declare-fun b!735 () Bool)

(assert (=> b!735 (= e!408 (invariant!0 (currentBit!1246 thiss!932) (currentByte!1251 thiss!932) (size!32 (buf!344 (_2!10 lt!194)))))))

(assert (= (and d!958 res!2822) b!735))

(assert (=> d!958 m!407))

(declare-fun m!463 () Bool)

(assert (=> b!735 m!463))

(assert (=> b!617 d!958))

(declare-fun d!964 () Bool)

(assert (=> d!964 (= (array_inv!29 (buf!344 thiss!932)) (bvsge (size!32 (buf!344 thiss!932)) #b00000000000000000000000000000000))))

(assert (=> b!622 d!964))

(check-sat (not b!720) (not b!718) (not b!719) (not d!932) (not d!958) (not d!928) (not b!717) (not b!652) (not d!934) (not d!914) (not b!735) (not d!952) (not d!936) (not b!650) (not d!930))
