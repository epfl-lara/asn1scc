; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!578 () Bool)

(assert start!578)

(declare-fun lt!1265 () (_ BitVec 32))

(declare-fun v!295 () (_ BitVec 64))

(declare-fun max!5 ((_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(declare-fun GetBitCountUnsigned!0 ((_ BitVec 64)) (_ BitVec 32))

(assert (=> start!578 (= lt!1265 (max!5 (bvsdiv (bvadd (GetBitCountUnsigned!0 v!295) #b00000000000000000000000000000111) #b00000000000000000000000000001000) #b00000000000000000000000000000001))))

(assert (=> start!578 (or (bvsle lt!1265 #b00000000000000000000000000000000) (bvsgt lt!1265 #b00000000000000000000000000001000))))

(assert (=> start!578 true))

(declare-fun bs!484 () Bool)

(assert (= bs!484 start!578))

(declare-fun m!1221 () Bool)

(assert (=> bs!484 m!1221))

(declare-fun m!1223 () Bool)

(assert (=> bs!484 m!1223))

(check-sat (not start!578))
(check-sat)
(get-model)

(declare-fun d!1278 () Bool)

(assert (=> d!1278 (= (max!5 (bvsdiv (bvadd (GetBitCountUnsigned!0 v!295) #b00000000000000000000000000000111) #b00000000000000000000000000001000) #b00000000000000000000000000000001) (ite (bvsge (bvsdiv (bvadd (GetBitCountUnsigned!0 v!295) #b00000000000000000000000000000111) #b00000000000000000000000000001000) #b00000000000000000000000000000001) (bvsdiv (bvadd (GetBitCountUnsigned!0 v!295) #b00000000000000000000000000000111) #b00000000000000000000000000001000) #b00000000000000000000000000000001))))

(assert (=> start!578 d!1278))

(declare-fun b!1766 () Bool)

(declare-datatypes ((Unit!67 0))(
  ( (Unit!68) )
))
(declare-datatypes ((tuple3!10 0))(
  ( (tuple3!11 (_1!64 Unit!67) (_2!64 (_ BitVec 64)) (_3!5 (_ BitVec 32))) )
))
(declare-fun e!1114 () tuple3!10)

(declare-fun lt!1288 () (_ BitVec 32))

(declare-fun Unit!69 () Unit!67)

(assert (=> b!1766 (= e!1114 (tuple3!11 Unit!69 v!295 lt!1288))))

(declare-fun b!1767 () Bool)

(declare-fun GetBitCountUnsignedWhile!0 ((_ BitVec 64) (_ BitVec 32)) tuple3!10)

(assert (=> b!1767 (= e!1114 (GetBitCountUnsignedWhile!0 v!295 lt!1288))))

(declare-fun b!1768 () Bool)

(declare-fun c!77 () Bool)

(assert (=> b!1768 (= c!77 (and (bvslt lt!1288 #b00000000000000000000000000111111) (not (= v!295 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1768 (= lt!1288 #b00000000000000000000000000000000)))

(declare-fun e!1117 () (_ BitVec 32))

(assert (=> b!1768 (= e!1117 (_3!5 e!1114))))

(declare-fun b!1770 () Bool)

(declare-fun e!1116 () (_ BitVec 32))

(assert (=> b!1770 (= e!1116 e!1117)))

(declare-datatypes ((ControlFlow!7 0))(
  ( (Return!6 (value!193 (_ BitVec 32))) (Proceed!6 (value!194 Unit!67)) )
))
(declare-fun lt!1287 () ControlFlow!7)

(declare-fun Unit!70 () Unit!67)

(assert (=> b!1770 (= lt!1287 (ite (= v!295 #b0000000000000000000000000000000000000000000000000000000000000000) (Return!6 #b00000000000000000000000000000000) (Proceed!6 Unit!70)))))

(declare-fun c!75 () Bool)

(get-info :version)

(assert (=> b!1770 (= c!75 ((_ is Return!6) lt!1287))))

(declare-fun b!1771 () Bool)

(declare-fun e!1118 () Bool)

(declare-fun lt!1289 () (_ BitVec 64))

(assert (=> b!1771 (= e!1118 (= (bvlshr v!295 lt!1289) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1771 (and (bvsge lt!1289 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!1289 #b0000000000000000000000000000000000000000000000000000000001000000))))

(declare-fun lt!1291 () (_ BitVec 32))

(assert (=> b!1771 (= lt!1289 ((_ sign_extend 32) lt!1291))))

(declare-fun b!1772 () Bool)

(declare-fun lt!1290 () ControlFlow!7)

(assert (=> b!1772 (= e!1116 (value!193 lt!1290))))

(declare-fun b!1773 () Bool)

(assert (=> b!1773 (= e!1117 (value!193 lt!1287))))

(declare-fun d!1280 () Bool)

(declare-fun e!1115 () Bool)

(assert (=> d!1280 e!1115))

(declare-fun res!3658 () Bool)

(assert (=> d!1280 (=> (not res!3658) (not e!1115))))

(assert (=> d!1280 (= res!3658 (and (bvsge lt!1291 #b00000000000000000000000000000000) (bvsle lt!1291 #b00000000000000000000000001000000)))))

(assert (=> d!1280 (= lt!1291 e!1116)))

(declare-fun c!76 () Bool)

(assert (=> d!1280 (= c!76 ((_ is Return!6) lt!1290))))

(declare-fun Unit!73 () Unit!67)

(assert (=> d!1280 (= lt!1290 (ite (bvslt v!295 #b0000000000000000000000000000000000000000000000000000000000000000) (Return!6 #b00000000000000000000000001000000) (Proceed!6 Unit!73)))))

(assert (=> d!1280 (= (GetBitCountUnsigned!0 v!295) lt!1291)))

(declare-fun b!1769 () Bool)

(assert (=> b!1769 (= e!1115 e!1118)))

(declare-fun res!3657 () Bool)

(assert (=> b!1769 (=> res!3657 e!1118)))

(assert (=> b!1769 (= res!3657 (and (= lt!1291 #b00000000000000000000000001000000) (bvslt v!295 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!1280 c!76) b!1772))

(assert (= (and d!1280 (not c!76)) b!1770))

(assert (= (and b!1770 c!75) b!1773))

(assert (= (and b!1770 (not c!75)) b!1768))

(assert (= (and b!1768 c!77) b!1767))

(assert (= (and b!1768 (not c!77)) b!1766))

(assert (= (and d!1280 res!3658) b!1769))

(assert (= (and b!1769 (not res!3657)) b!1771))

(declare-fun m!1229 () Bool)

(assert (=> b!1767 m!1229))

(assert (=> start!578 d!1280))

(check-sat (not b!1767))
(check-sat)
