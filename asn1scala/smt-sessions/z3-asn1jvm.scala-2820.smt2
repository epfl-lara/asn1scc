; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68126 () Bool)

(assert start!68126)

(declare-fun res!251304 () Bool)

(declare-fun e!220304 () Bool)

(assert (=> start!68126 (=> (not res!251304) (not e!220304))))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-datatypes ((array!18559 0))(
  ( (array!18560 (arr!9128 (Array (_ BitVec 32) (_ BitVec 8))) (size!8045 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18559)

(declare-fun a2!948 () array!18559)

(declare-fun fromBit!258 () (_ BitVec 64))

(assert (=> start!68126 (= res!251304 (and (bvsle (size!8045 a1!948) (size!8045 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!68126 e!220304))

(assert (=> start!68126 true))

(declare-fun array_inv!7657 (array!18559) Bool)

(assert (=> start!68126 (array_inv!7657 a1!948)))

(assert (=> start!68126 (array_inv!7657 a2!948)))

(declare-fun b!305834 () Bool)

(declare-fun e!220301 () Bool)

(declare-fun e!220296 () Bool)

(assert (=> b!305834 (= e!220301 e!220296)))

(declare-fun res!251298 () Bool)

(assert (=> b!305834 (=> (not res!251298) (not e!220296))))

(declare-fun e!220303 () Bool)

(assert (=> b!305834 (= res!251298 e!220303)))

(declare-fun c!14851 () Bool)

(declare-datatypes ((tuple4!1232 0))(
  ( (tuple4!1233 (_1!13271 (_ BitVec 32)) (_2!13271 (_ BitVec 32)) (_3!1573 (_ BitVec 32)) (_4!616 (_ BitVec 32))) )
))
(declare-fun lt!439232 () tuple4!1232)

(assert (=> b!305834 (= c!14851 (= (_3!1573 lt!439232) (_4!616 lt!439232)))))

(declare-datatypes ((Unit!21339 0))(
  ( (Unit!21340) )
))
(declare-fun lt!439240 () Unit!21339)

(declare-fun e!220298 () Unit!21339)

(assert (=> b!305834 (= lt!439240 e!220298)))

(declare-fun c!14853 () Bool)

(declare-fun lt!439235 () tuple4!1232)

(assert (=> b!305834 (= c!14853 (bvslt (_1!13271 lt!439235) (_2!13271 lt!439235)))))

(declare-fun fromSlice!52 () (_ BitVec 64))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1232)

(assert (=> b!305834 (= lt!439235 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(declare-fun lt!439241 () (_ BitVec 32))

(assert (=> b!305834 (= lt!439241 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!439242 () (_ BitVec 32))

(assert (=> b!305834 (= lt!439242 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!305834 (= lt!439232 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!305835 () Bool)

(assert (=> b!305835 (= e!220304 e!220301)))

(declare-fun res!251300 () Bool)

(assert (=> b!305835 (=> (not res!251300) (not e!220301))))

(declare-fun lt!439233 () (_ BitVec 64))

(assert (=> b!305835 (= res!251300 (and (bvsle toBit!258 lt!439233) (bvsle fromBit!258 lt!439233)))))

(assert (=> b!305835 (= lt!439233 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8045 a1!948))))))

(declare-fun b!305836 () Bool)

(declare-fun e!220297 () Unit!21339)

(declare-fun Unit!21341 () Unit!21339)

(assert (=> b!305836 (= e!220297 Unit!21341)))

(declare-fun b!305837 () Bool)

(declare-fun e!220306 () Unit!21339)

(declare-fun Unit!21342 () Unit!21339)

(assert (=> b!305837 (= e!220306 Unit!21342)))

(declare-fun b!305838 () Bool)

(declare-fun lt!439237 () Unit!21339)

(assert (=> b!305838 (= e!220298 lt!439237)))

(declare-fun arrayRangesEqSlicedLemma!269 (array!18559 array!18559 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21339)

(assert (=> b!305838 (= lt!439237 (arrayRangesEqSlicedLemma!269 a1!948 a2!948 (_1!13271 lt!439232) (_2!13271 lt!439232) (_1!13271 lt!439235) (_2!13271 lt!439235)))))

(declare-fun arrayRangesEq!1674 (array!18559 array!18559 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!305838 (arrayRangesEq!1674 a1!948 a2!948 (_1!13271 lt!439235) (_2!13271 lt!439235))))

(declare-fun b!305839 () Bool)

(declare-fun e!220299 () Bool)

(declare-fun call!5789 () Bool)

(assert (=> b!305839 (= e!220299 call!5789)))

(declare-fun b!305840 () Bool)

(declare-fun lt!439236 () Unit!21339)

(assert (=> b!305840 (= e!220306 lt!439236)))

(declare-fun arrayRangesEqImpliesEq!278 (array!18559 array!18559 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21339)

(assert (=> b!305840 (= lt!439236 (arrayRangesEqImpliesEq!278 a1!948 a2!948 (_1!13271 lt!439232) (_3!1573 lt!439235) (_2!13271 lt!439232)))))

(assert (=> b!305840 (= (select (arr!9128 a1!948) (_3!1573 lt!439235)) (select (arr!9128 a2!948) (_3!1573 lt!439235)))))

(declare-fun bm!5786 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!5786 (= call!5789 (byteRangesEq!0 (ite c!14851 (select (arr!9128 a1!948) (_3!1573 lt!439232)) (select (arr!9128 a1!948) (_4!616 lt!439232))) (ite c!14851 (select (arr!9128 a2!948) (_3!1573 lt!439232)) (select (arr!9128 a2!948) (_4!616 lt!439232))) (ite c!14851 lt!439242 #b00000000000000000000000000000000) lt!439241))))

(declare-fun b!305841 () Bool)

(declare-fun e!220302 () Bool)

(assert (=> b!305841 (= e!220303 e!220302)))

(declare-fun res!251302 () Bool)

(assert (=> b!305841 (= res!251302 (byteRangesEq!0 (select (arr!9128 a1!948) (_3!1573 lt!439232)) (select (arr!9128 a2!948) (_3!1573 lt!439232)) lt!439242 #b00000000000000000000000000000111))))

(assert (=> b!305841 (=> (not res!251302) (not e!220302))))

(declare-fun b!305842 () Bool)

(declare-fun Unit!21343 () Unit!21339)

(assert (=> b!305842 (= e!220298 Unit!21343)))

(declare-fun b!305843 () Bool)

(declare-fun res!251299 () Bool)

(assert (=> b!305843 (= res!251299 (= lt!439241 #b00000000000000000000000000000000))))

(assert (=> b!305843 (=> res!251299 e!220299)))

(assert (=> b!305843 (= e!220302 e!220299)))

(declare-fun b!305844 () Bool)

(declare-fun res!251301 () Bool)

(assert (=> b!305844 (=> (not res!251301) (not e!220301))))

(declare-fun arrayBitRangesEq!0 (array!18559 array!18559 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!305844 (= res!251301 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!305845 () Bool)

(declare-fun lt!439238 () Unit!21339)

(assert (=> b!305845 (= e!220297 lt!439238)))

(assert (=> b!305845 (= lt!439238 (arrayRangesEqImpliesEq!278 a1!948 a2!948 (_1!13271 lt!439232) (_4!616 lt!439235) (_2!13271 lt!439232)))))

(assert (=> b!305845 (= (select (arr!9128 a1!948) (_4!616 lt!439235)) (select (arr!9128 a2!948) (_4!616 lt!439235)))))

(declare-fun b!305846 () Bool)

(declare-fun res!251303 () Bool)

(assert (=> b!305846 (=> (not res!251303) (not e!220301))))

(assert (=> b!305846 (= res!251303 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!439233) (not (= fromSlice!52 toSlice!52))))))

(declare-fun b!305847 () Bool)

(assert (=> b!305847 (= e!220296 (and (= (_3!1573 lt!439235) (_4!616 lt!439235)) (or (bvslt (_3!1573 lt!439235) #b00000000000000000000000000000000) (bvsge (_3!1573 lt!439235) (size!8045 a2!948)))))))

(declare-fun lt!439239 () Unit!21339)

(assert (=> b!305847 (= lt!439239 e!220297)))

(declare-fun c!14850 () Bool)

(assert (=> b!305847 (= c!14850 (and (bvslt (_4!616 lt!439235) (_4!616 lt!439232)) (bvslt (_3!1573 lt!439232) (_4!616 lt!439235))))))

(declare-fun lt!439234 () Unit!21339)

(assert (=> b!305847 (= lt!439234 e!220306)))

(declare-fun c!14852 () Bool)

(assert (=> b!305847 (= c!14852 (and (bvslt (_3!1573 lt!439232) (_3!1573 lt!439235)) (bvslt (_3!1573 lt!439235) (_4!616 lt!439232))))))

(declare-fun b!305848 () Bool)

(assert (=> b!305848 (= e!220303 call!5789)))

(assert (= (and start!68126 res!251304) b!305835))

(assert (= (and b!305835 res!251300) b!305844))

(assert (= (and b!305844 res!251301) b!305846))

(assert (= (and b!305846 res!251303) b!305834))

(assert (= (and b!305834 c!14853) b!305838))

(assert (= (and b!305834 (not c!14853)) b!305842))

(assert (= (and b!305834 c!14851) b!305848))

(assert (= (and b!305834 (not c!14851)) b!305841))

(assert (= (and b!305841 res!251302) b!305843))

(assert (= (and b!305843 (not res!251299)) b!305839))

(assert (= (or b!305848 b!305839) bm!5786))

(assert (= (and b!305834 res!251298) b!305847))

(assert (= (and b!305847 c!14852) b!305840))

(assert (= (and b!305847 (not c!14852)) b!305837))

(assert (= (and b!305847 c!14850) b!305845))

(assert (= (and b!305847 (not c!14850)) b!305836))

(declare-fun m!444281 () Bool)

(assert (=> b!305838 m!444281))

(declare-fun m!444283 () Bool)

(assert (=> b!305838 m!444283))

(declare-fun m!444285 () Bool)

(assert (=> b!305844 m!444285))

(declare-fun m!444287 () Bool)

(assert (=> b!305834 m!444287))

(declare-fun m!444289 () Bool)

(assert (=> b!305834 m!444289))

(declare-fun m!444291 () Bool)

(assert (=> b!305845 m!444291))

(declare-fun m!444293 () Bool)

(assert (=> b!305845 m!444293))

(declare-fun m!444295 () Bool)

(assert (=> b!305845 m!444295))

(declare-fun m!444297 () Bool)

(assert (=> bm!5786 m!444297))

(declare-fun m!444299 () Bool)

(assert (=> bm!5786 m!444299))

(declare-fun m!444301 () Bool)

(assert (=> bm!5786 m!444301))

(declare-fun m!444303 () Bool)

(assert (=> bm!5786 m!444303))

(declare-fun m!444305 () Bool)

(assert (=> bm!5786 m!444305))

(declare-fun m!444307 () Bool)

(assert (=> b!305840 m!444307))

(declare-fun m!444309 () Bool)

(assert (=> b!305840 m!444309))

(declare-fun m!444311 () Bool)

(assert (=> b!305840 m!444311))

(declare-fun m!444313 () Bool)

(assert (=> start!68126 m!444313))

(declare-fun m!444315 () Bool)

(assert (=> start!68126 m!444315))

(assert (=> b!305841 m!444301))

(assert (=> b!305841 m!444299))

(assert (=> b!305841 m!444301))

(assert (=> b!305841 m!444299))

(declare-fun m!444317 () Bool)

(assert (=> b!305841 m!444317))

(check-sat (not b!305838) (not start!68126) (not b!305840) (not b!305845) (not b!305844) (not b!305841) (not b!305834) (not bm!5786))
(check-sat)
(get-model)

(declare-fun d!102054 () Bool)

(assert (=> d!102054 (= (byteRangesEq!0 (select (arr!9128 a1!948) (_3!1573 lt!439232)) (select (arr!9128 a2!948) (_3!1573 lt!439232)) lt!439242 #b00000000000000000000000000000111) (or (= lt!439242 #b00000000000000000000000000000111) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9128 a1!948) (_3!1573 lt!439232))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000000111))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!439242)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9128 a2!948) (_3!1573 lt!439232))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000000111))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!439242)))) #b00000000000000000000000011111111))))))

(declare-fun bs!26295 () Bool)

(assert (= bs!26295 d!102054))

(declare-fun m!444357 () Bool)

(assert (=> bs!26295 m!444357))

(declare-fun m!444359 () Bool)

(assert (=> bs!26295 m!444359))

(assert (=> b!305841 d!102054))

(declare-fun d!102056 () Bool)

(assert (=> d!102056 (and (bvsge (_3!1573 lt!439235) #b00000000000000000000000000000000) (bvslt (_3!1573 lt!439235) (size!8045 a1!948)) (bvslt (_3!1573 lt!439235) (size!8045 a2!948)) (= (select (arr!9128 a1!948) (_3!1573 lt!439235)) (select (arr!9128 a2!948) (_3!1573 lt!439235))))))

(declare-fun lt!439278 () Unit!21339)

(declare-fun choose!608 (array!18559 array!18559 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21339)

(assert (=> d!102056 (= lt!439278 (choose!608 a1!948 a2!948 (_1!13271 lt!439232) (_3!1573 lt!439235) (_2!13271 lt!439232)))))

(assert (=> d!102056 (and (bvsle #b00000000000000000000000000000000 (_1!13271 lt!439232)) (bvsle (_1!13271 lt!439232) (_2!13271 lt!439232)))))

(assert (=> d!102056 (= (arrayRangesEqImpliesEq!278 a1!948 a2!948 (_1!13271 lt!439232) (_3!1573 lt!439235) (_2!13271 lt!439232)) lt!439278)))

(declare-fun bs!26296 () Bool)

(assert (= bs!26296 d!102056))

(assert (=> bs!26296 m!444309))

(assert (=> bs!26296 m!444311))

(declare-fun m!444361 () Bool)

(assert (=> bs!26296 m!444361))

(assert (=> b!305840 d!102056))

(declare-fun d!102058 () Bool)

(assert (=> d!102058 (= (byteRangesEq!0 (ite c!14851 (select (arr!9128 a1!948) (_3!1573 lt!439232)) (select (arr!9128 a1!948) (_4!616 lt!439232))) (ite c!14851 (select (arr!9128 a2!948) (_3!1573 lt!439232)) (select (arr!9128 a2!948) (_4!616 lt!439232))) (ite c!14851 lt!439242 #b00000000000000000000000000000000) lt!439241) (or (= (ite c!14851 lt!439242 #b00000000000000000000000000000000) lt!439241) (= (bvand (bvand (bvand ((_ sign_extend 24) (ite c!14851 (select (arr!9128 a1!948) (_3!1573 lt!439232)) (select (arr!9128 a1!948) (_4!616 lt!439232)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!439241))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!14851 lt!439242 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (ite c!14851 (select (arr!9128 a2!948) (_3!1573 lt!439232)) (select (arr!9128 a2!948) (_4!616 lt!439232)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!439241))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!14851 lt!439242 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111))))))

(declare-fun bs!26297 () Bool)

(assert (= bs!26297 d!102058))

(declare-fun m!444363 () Bool)

(assert (=> bs!26297 m!444363))

(declare-fun m!444365 () Bool)

(assert (=> bs!26297 m!444365))

(assert (=> bm!5786 d!102058))

(declare-fun d!102060 () Bool)

(assert (=> d!102060 (and (bvsge (_4!616 lt!439235) #b00000000000000000000000000000000) (bvslt (_4!616 lt!439235) (size!8045 a1!948)) (bvslt (_4!616 lt!439235) (size!8045 a2!948)) (= (select (arr!9128 a1!948) (_4!616 lt!439235)) (select (arr!9128 a2!948) (_4!616 lt!439235))))))

(declare-fun lt!439279 () Unit!21339)

(assert (=> d!102060 (= lt!439279 (choose!608 a1!948 a2!948 (_1!13271 lt!439232) (_4!616 lt!439235) (_2!13271 lt!439232)))))

(assert (=> d!102060 (and (bvsle #b00000000000000000000000000000000 (_1!13271 lt!439232)) (bvsle (_1!13271 lt!439232) (_2!13271 lt!439232)))))

(assert (=> d!102060 (= (arrayRangesEqImpliesEq!278 a1!948 a2!948 (_1!13271 lt!439232) (_4!616 lt!439235) (_2!13271 lt!439232)) lt!439279)))

(declare-fun bs!26298 () Bool)

(assert (= bs!26298 d!102060))

(assert (=> bs!26298 m!444293))

(assert (=> bs!26298 m!444295))

(declare-fun m!444367 () Bool)

(assert (=> bs!26298 m!444367))

(assert (=> b!305845 d!102060))

(declare-fun b!305908 () Bool)

(declare-fun res!251339 () Bool)

(declare-fun lt!439293 () (_ BitVec 32))

(assert (=> b!305908 (= res!251339 (= lt!439293 #b00000000000000000000000000000000))))

(declare-fun e!220352 () Bool)

(assert (=> b!305908 (=> res!251339 e!220352)))

(declare-fun e!220354 () Bool)

(assert (=> b!305908 (= e!220354 e!220352)))

(declare-fun b!305909 () Bool)

(declare-fun e!220353 () Bool)

(assert (=> b!305909 (= e!220353 e!220354)))

(declare-fun res!251338 () Bool)

(declare-fun lt!439294 () (_ BitVec 32))

(declare-fun lt!439292 () tuple4!1232)

(assert (=> b!305909 (= res!251338 (byteRangesEq!0 (select (arr!9128 a1!948) (_3!1573 lt!439292)) (select (arr!9128 a2!948) (_3!1573 lt!439292)) lt!439294 #b00000000000000000000000000001000))))

(assert (=> b!305909 (=> (not res!251338) (not e!220354))))

(declare-fun b!305910 () Bool)

(declare-fun e!220357 () Bool)

(declare-fun e!220355 () Bool)

(assert (=> b!305910 (= e!220357 e!220355)))

(declare-fun res!251340 () Bool)

(assert (=> b!305910 (=> (not res!251340) (not e!220355))))

(declare-fun e!220356 () Bool)

(assert (=> b!305910 (= res!251340 e!220356)))

(declare-fun res!251337 () Bool)

(assert (=> b!305910 (=> res!251337 e!220356)))

(assert (=> b!305910 (= res!251337 (bvsge (_1!13271 lt!439292) (_2!13271 lt!439292)))))

(assert (=> b!305910 (= lt!439293 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!305910 (= lt!439294 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!305910 (= lt!439292 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun d!102064 () Bool)

(declare-fun res!251336 () Bool)

(assert (=> d!102064 (=> res!251336 e!220357)))

(assert (=> d!102064 (= res!251336 (bvsge fromBit!258 toBit!258))))

(assert (=> d!102064 (= (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258) e!220357)))

(declare-fun b!305911 () Bool)

(assert (=> b!305911 (= e!220355 e!220353)))

(declare-fun c!14868 () Bool)

(assert (=> b!305911 (= c!14868 (= (_3!1573 lt!439292) (_4!616 lt!439292)))))

(declare-fun b!305912 () Bool)

(declare-fun call!5795 () Bool)

(assert (=> b!305912 (= e!220352 call!5795)))

(declare-fun bm!5792 () Bool)

(assert (=> bm!5792 (= call!5795 (byteRangesEq!0 (ite c!14868 (select (arr!9128 a1!948) (_3!1573 lt!439292)) (select (arr!9128 a1!948) (_4!616 lt!439292))) (ite c!14868 (select (arr!9128 a2!948) (_3!1573 lt!439292)) (select (arr!9128 a2!948) (_4!616 lt!439292))) (ite c!14868 lt!439294 #b00000000000000000000000000000000) lt!439293))))

(declare-fun b!305913 () Bool)

(assert (=> b!305913 (= e!220356 (arrayRangesEq!1674 a1!948 a2!948 (_1!13271 lt!439292) (_2!13271 lt!439292)))))

(declare-fun b!305914 () Bool)

(assert (=> b!305914 (= e!220353 call!5795)))

(assert (= (and d!102064 (not res!251336)) b!305910))

(assert (= (and b!305910 (not res!251337)) b!305913))

(assert (= (and b!305910 res!251340) b!305911))

(assert (= (and b!305911 c!14868) b!305914))

(assert (= (and b!305911 (not c!14868)) b!305909))

(assert (= (and b!305909 res!251338) b!305908))

(assert (= (and b!305908 (not res!251339)) b!305912))

(assert (= (or b!305914 b!305912) bm!5792))

(declare-fun m!444381 () Bool)

(assert (=> b!305909 m!444381))

(declare-fun m!444383 () Bool)

(assert (=> b!305909 m!444383))

(assert (=> b!305909 m!444381))

(assert (=> b!305909 m!444383))

(declare-fun m!444385 () Bool)

(assert (=> b!305909 m!444385))

(assert (=> b!305910 m!444289))

(declare-fun m!444387 () Bool)

(assert (=> bm!5792 m!444387))

(assert (=> bm!5792 m!444381))

(assert (=> bm!5792 m!444383))

(declare-fun m!444389 () Bool)

(assert (=> bm!5792 m!444389))

(declare-fun m!444391 () Bool)

(assert (=> bm!5792 m!444391))

(declare-fun m!444393 () Bool)

(assert (=> b!305913 m!444393))

(assert (=> b!305844 d!102064))

(declare-fun d!102078 () Bool)

(assert (=> d!102078 (= (arrayBitIndices!0 fromSlice!52 toSlice!52) (tuple4!1233 ((_ extract 31 0) (bvadd (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!305834 d!102078))

(declare-fun d!102082 () Bool)

(assert (=> d!102082 (= (arrayBitIndices!0 fromBit!258 toBit!258) (tuple4!1233 ((_ extract 31 0) (bvadd (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!305834 d!102082))

(declare-fun d!102084 () Bool)

(assert (=> d!102084 (= (array_inv!7657 a1!948) (bvsge (size!8045 a1!948) #b00000000000000000000000000000000))))

(assert (=> start!68126 d!102084))

(declare-fun d!102086 () Bool)

(assert (=> d!102086 (= (array_inv!7657 a2!948) (bvsge (size!8045 a2!948) #b00000000000000000000000000000000))))

(assert (=> start!68126 d!102086))

(declare-fun d!102088 () Bool)

(assert (=> d!102088 (arrayRangesEq!1674 a1!948 a2!948 (_1!13271 lt!439235) (_2!13271 lt!439235))))

(declare-fun lt!439297 () Unit!21339)

(declare-fun choose!611 (array!18559 array!18559 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21339)

(assert (=> d!102088 (= lt!439297 (choose!611 a1!948 a2!948 (_1!13271 lt!439232) (_2!13271 lt!439232) (_1!13271 lt!439235) (_2!13271 lt!439235)))))

(assert (=> d!102088 (and (bvsle #b00000000000000000000000000000000 (_1!13271 lt!439232)) (bvsle (_1!13271 lt!439232) (_2!13271 lt!439232)))))

(assert (=> d!102088 (= (arrayRangesEqSlicedLemma!269 a1!948 a2!948 (_1!13271 lt!439232) (_2!13271 lt!439232) (_1!13271 lt!439235) (_2!13271 lt!439235)) lt!439297)))

(declare-fun bs!26303 () Bool)

(assert (= bs!26303 d!102088))

(assert (=> bs!26303 m!444283))

(declare-fun m!444401 () Bool)

(assert (=> bs!26303 m!444401))

(assert (=> b!305838 d!102088))

(declare-fun d!102090 () Bool)

(declare-fun res!251361 () Bool)

(declare-fun e!220380 () Bool)

(assert (=> d!102090 (=> res!251361 e!220380)))

(assert (=> d!102090 (= res!251361 (= (_1!13271 lt!439235) (_2!13271 lt!439235)))))

(assert (=> d!102090 (= (arrayRangesEq!1674 a1!948 a2!948 (_1!13271 lt!439235) (_2!13271 lt!439235)) e!220380)))

(declare-fun b!305939 () Bool)

(declare-fun e!220381 () Bool)

(assert (=> b!305939 (= e!220380 e!220381)))

(declare-fun res!251362 () Bool)

(assert (=> b!305939 (=> (not res!251362) (not e!220381))))

(assert (=> b!305939 (= res!251362 (= (select (arr!9128 a1!948) (_1!13271 lt!439235)) (select (arr!9128 a2!948) (_1!13271 lt!439235))))))

(declare-fun b!305940 () Bool)

(assert (=> b!305940 (= e!220381 (arrayRangesEq!1674 a1!948 a2!948 (bvadd (_1!13271 lt!439235) #b00000000000000000000000000000001) (_2!13271 lt!439235)))))

(assert (= (and d!102090 (not res!251361)) b!305939))

(assert (= (and b!305939 res!251362) b!305940))

(declare-fun m!444403 () Bool)

(assert (=> b!305939 m!444403))

(declare-fun m!444405 () Bool)

(assert (=> b!305939 m!444405))

(declare-fun m!444407 () Bool)

(assert (=> b!305940 m!444407))

(assert (=> b!305838 d!102090))

(check-sat (not d!102060) (not b!305913) (not b!305909) (not d!102056) (not d!102088) (not b!305910) (not b!305940) (not bm!5792))
(check-sat)
