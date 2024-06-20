; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58634 () Bool)

(assert start!58634)

(declare-fun b!269185 () Bool)

(declare-fun e!189161 () Bool)

(declare-datatypes ((array!15010 0))(
  ( (array!15011 (arr!7529 (Array (_ BitVec 32) (_ BitVec 8))) (size!6542 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11898 0))(
  ( (BitStream!11899 (buf!7010 array!15010) (currentByte!12946 (_ BitVec 32)) (currentBit!12941 (_ BitVec 32))) )
))
(declare-fun w1!591 () BitStream!11898)

(declare-fun array_inv!6266 (array!15010) Bool)

(assert (=> b!269185 (= e!189161 (array_inv!6266 (buf!7010 w1!591)))))

(declare-fun w3!25 () BitStream!11898)

(declare-fun w2!587 () BitStream!11898)

(declare-fun b!269186 () Bool)

(declare-fun e!189159 () Bool)

(assert (=> b!269186 (= e!189159 (and (bvsle #b00000000000000000000000000000000 (currentByte!12946 w1!591)) (bvsle (currentByte!12946 w1!591) (currentByte!12946 w2!587)) (bvsle (size!6542 (buf!7010 w1!591)) (size!6542 (buf!7010 w2!587))) (bvsle (size!6542 (buf!7010 w2!587)) (size!6542 (buf!7010 w3!25))) (or (bvsgt (currentByte!12946 w1!591) (size!6542 (buf!7010 w1!591))) (bvsgt (currentByte!12946 w2!587) (size!6542 (buf!7010 w2!587))))))))

(declare-fun b!269188 () Bool)

(declare-fun e!189158 () Bool)

(assert (=> b!269188 (= e!189158 (array_inv!6266 (buf!7010 w3!25)))))

(declare-fun b!269189 () Bool)

(declare-fun res!224409 () Bool)

(assert (=> b!269189 (=> (not res!224409) (not e!189159))))

(declare-fun isPrefixOf!0 (BitStream!11898 BitStream!11898) Bool)

(assert (=> b!269189 (= res!224409 (isPrefixOf!0 w2!587 w3!25))))

(declare-fun res!224410 () Bool)

(assert (=> start!58634 (=> (not res!224410) (not e!189159))))

(assert (=> start!58634 (= res!224410 (isPrefixOf!0 w1!591 w2!587))))

(assert (=> start!58634 e!189159))

(declare-fun inv!12 (BitStream!11898) Bool)

(assert (=> start!58634 (and (inv!12 w1!591) e!189161)))

(declare-fun e!189156 () Bool)

(assert (=> start!58634 (and (inv!12 w2!587) e!189156)))

(assert (=> start!58634 (and (inv!12 w3!25) e!189158)))

(declare-fun b!269187 () Bool)

(assert (=> b!269187 (= e!189156 (array_inv!6266 (buf!7010 w2!587)))))

(assert (= (and start!58634 res!224410) b!269189))

(assert (= (and b!269189 res!224409) b!269186))

(assert (= start!58634 b!269185))

(assert (= start!58634 b!269187))

(assert (= start!58634 b!269188))

(declare-fun m!400743 () Bool)

(assert (=> b!269188 m!400743))

(declare-fun m!400745 () Bool)

(assert (=> b!269189 m!400745))

(declare-fun m!400747 () Bool)

(assert (=> start!58634 m!400747))

(declare-fun m!400749 () Bool)

(assert (=> start!58634 m!400749))

(declare-fun m!400751 () Bool)

(assert (=> start!58634 m!400751))

(declare-fun m!400753 () Bool)

(assert (=> start!58634 m!400753))

(declare-fun m!400755 () Bool)

(assert (=> b!269185 m!400755))

(declare-fun m!400757 () Bool)

(assert (=> b!269187 m!400757))

(check-sat (not b!269187) (not b!269188) (not b!269189) (not b!269185) (not start!58634))
(check-sat)
(get-model)

(declare-fun d!91090 () Bool)

(assert (=> d!91090 (= (array_inv!6266 (buf!7010 w3!25)) (bvsge (size!6542 (buf!7010 w3!25)) #b00000000000000000000000000000000))))

(assert (=> b!269188 d!91090))

(declare-fun d!91092 () Bool)

(assert (=> d!91092 (= (array_inv!6266 (buf!7010 w2!587)) (bvsge (size!6542 (buf!7010 w2!587)) #b00000000000000000000000000000000))))

(assert (=> b!269187 d!91092))

(declare-fun d!91094 () Bool)

(declare-fun res!224438 () Bool)

(declare-fun e!189199 () Bool)

(assert (=> d!91094 (=> (not res!224438) (not e!189199))))

(assert (=> d!91094 (= res!224438 (= (size!6542 (buf!7010 w2!587)) (size!6542 (buf!7010 w3!25))))))

(assert (=> d!91094 (= (isPrefixOf!0 w2!587 w3!25) e!189199)))

(declare-fun b!269226 () Bool)

(declare-fun res!224439 () Bool)

(assert (=> b!269226 (=> (not res!224439) (not e!189199))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!269226 (= res!224439 (bvsle (bitIndex!0 (size!6542 (buf!7010 w2!587)) (currentByte!12946 w2!587) (currentBit!12941 w2!587)) (bitIndex!0 (size!6542 (buf!7010 w3!25)) (currentByte!12946 w3!25) (currentBit!12941 w3!25))))))

(declare-fun b!269227 () Bool)

(declare-fun e!189198 () Bool)

(assert (=> b!269227 (= e!189199 e!189198)))

(declare-fun res!224440 () Bool)

(assert (=> b!269227 (=> res!224440 e!189198)))

(assert (=> b!269227 (= res!224440 (= (size!6542 (buf!7010 w2!587)) #b00000000000000000000000000000000))))

(declare-fun b!269228 () Bool)

(declare-fun arrayBitRangesEq!0 (array!15010 array!15010 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!269228 (= e!189198 (arrayBitRangesEq!0 (buf!7010 w2!587) (buf!7010 w3!25) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6542 (buf!7010 w2!587)) (currentByte!12946 w2!587) (currentBit!12941 w2!587))))))

(assert (= (and d!91094 res!224438) b!269226))

(assert (= (and b!269226 res!224439) b!269227))

(assert (= (and b!269227 (not res!224440)) b!269228))

(declare-fun m!400787 () Bool)

(assert (=> b!269226 m!400787))

(declare-fun m!400789 () Bool)

(assert (=> b!269226 m!400789))

(assert (=> b!269228 m!400787))

(assert (=> b!269228 m!400787))

(declare-fun m!400795 () Bool)

(assert (=> b!269228 m!400795))

(assert (=> b!269189 d!91094))

(declare-fun d!91118 () Bool)

(assert (=> d!91118 (= (array_inv!6266 (buf!7010 w1!591)) (bvsge (size!6542 (buf!7010 w1!591)) #b00000000000000000000000000000000))))

(assert (=> b!269185 d!91118))

(declare-fun d!91122 () Bool)

(declare-fun res!224444 () Bool)

(declare-fun e!189203 () Bool)

(assert (=> d!91122 (=> (not res!224444) (not e!189203))))

(assert (=> d!91122 (= res!224444 (= (size!6542 (buf!7010 w1!591)) (size!6542 (buf!7010 w2!587))))))

(assert (=> d!91122 (= (isPrefixOf!0 w1!591 w2!587) e!189203)))

(declare-fun b!269232 () Bool)

(declare-fun res!224445 () Bool)

(assert (=> b!269232 (=> (not res!224445) (not e!189203))))

(assert (=> b!269232 (= res!224445 (bvsle (bitIndex!0 (size!6542 (buf!7010 w1!591)) (currentByte!12946 w1!591) (currentBit!12941 w1!591)) (bitIndex!0 (size!6542 (buf!7010 w2!587)) (currentByte!12946 w2!587) (currentBit!12941 w2!587))))))

(declare-fun b!269233 () Bool)

(declare-fun e!189202 () Bool)

(assert (=> b!269233 (= e!189203 e!189202)))

(declare-fun res!224446 () Bool)

(assert (=> b!269233 (=> res!224446 e!189202)))

(assert (=> b!269233 (= res!224446 (= (size!6542 (buf!7010 w1!591)) #b00000000000000000000000000000000))))

(declare-fun b!269234 () Bool)

(assert (=> b!269234 (= e!189202 (arrayBitRangesEq!0 (buf!7010 w1!591) (buf!7010 w2!587) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6542 (buf!7010 w1!591)) (currentByte!12946 w1!591) (currentBit!12941 w1!591))))))

(assert (= (and d!91122 res!224444) b!269232))

(assert (= (and b!269232 res!224445) b!269233))

(assert (= (and b!269233 (not res!224446)) b!269234))

(declare-fun m!400799 () Bool)

(assert (=> b!269232 m!400799))

(assert (=> b!269232 m!400787))

(assert (=> b!269234 m!400799))

(assert (=> b!269234 m!400799))

(declare-fun m!400803 () Bool)

(assert (=> b!269234 m!400803))

(assert (=> start!58634 d!91122))

(declare-fun d!91128 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!91128 (= (inv!12 w1!591) (invariant!0 (currentBit!12941 w1!591) (currentByte!12946 w1!591) (size!6542 (buf!7010 w1!591))))))

(declare-fun bs!23100 () Bool)

(assert (= bs!23100 d!91128))

(declare-fun m!400817 () Bool)

(assert (=> bs!23100 m!400817))

(assert (=> start!58634 d!91128))

(declare-fun d!91134 () Bool)

(assert (=> d!91134 (= (inv!12 w2!587) (invariant!0 (currentBit!12941 w2!587) (currentByte!12946 w2!587) (size!6542 (buf!7010 w2!587))))))

(declare-fun bs!23101 () Bool)

(assert (= bs!23101 d!91134))

(declare-fun m!400819 () Bool)

(assert (=> bs!23101 m!400819))

(assert (=> start!58634 d!91134))

(declare-fun d!91136 () Bool)

(assert (=> d!91136 (= (inv!12 w3!25) (invariant!0 (currentBit!12941 w3!25) (currentByte!12946 w3!25) (size!6542 (buf!7010 w3!25))))))

(declare-fun bs!23102 () Bool)

(assert (= bs!23102 d!91136))

(declare-fun m!400821 () Bool)

(assert (=> bs!23102 m!400821))

(assert (=> start!58634 d!91136))

(check-sat (not b!269226) (not d!91134) (not b!269228) (not d!91136) (not b!269234) (not b!269232) (not d!91128))
(check-sat)
(get-model)

(declare-fun lt!408864 () (_ BitVec 32))

(declare-fun bm!4271 () Bool)

(declare-fun lt!408866 () (_ BitVec 32))

(declare-fun c!12423 () Bool)

(declare-fun call!4274 () Bool)

(declare-datatypes ((tuple4!432 0))(
  ( (tuple4!433 (_1!12199 (_ BitVec 32)) (_2!12199 (_ BitVec 32)) (_3!996 (_ BitVec 32)) (_4!216 (_ BitVec 32))) )
))
(declare-fun lt!408865 () tuple4!432)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!4271 (= call!4274 (byteRangesEq!0 (select (arr!7529 (buf!7010 w1!591)) (_3!996 lt!408865)) (select (arr!7529 (buf!7010 w2!587)) (_3!996 lt!408865)) lt!408864 (ite c!12423 lt!408866 #b00000000000000000000000000001000)))))

(declare-fun d!91138 () Bool)

(declare-fun res!224465 () Bool)

(declare-fun e!189222 () Bool)

(assert (=> d!91138 (=> res!224465 e!189222)))

(assert (=> d!91138 (= res!224465 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6542 (buf!7010 w1!591)) (currentByte!12946 w1!591) (currentBit!12941 w1!591))))))

(assert (=> d!91138 (= (arrayBitRangesEq!0 (buf!7010 w1!591) (buf!7010 w2!587) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6542 (buf!7010 w1!591)) (currentByte!12946 w1!591) (currentBit!12941 w1!591))) e!189222)))

(declare-fun b!269255 () Bool)

(declare-fun e!189224 () Bool)

(declare-fun e!189220 () Bool)

(assert (=> b!269255 (= e!189224 e!189220)))

(declare-fun res!224467 () Bool)

(assert (=> b!269255 (= res!224467 call!4274)))

(assert (=> b!269255 (=> (not res!224467) (not e!189220))))

(declare-fun b!269256 () Bool)

(assert (=> b!269256 (= e!189224 call!4274)))

(declare-fun b!269257 () Bool)

(declare-fun res!224463 () Bool)

(assert (=> b!269257 (= res!224463 (= lt!408866 #b00000000000000000000000000000000))))

(declare-fun e!189223 () Bool)

(assert (=> b!269257 (=> res!224463 e!189223)))

(assert (=> b!269257 (= e!189220 e!189223)))

(declare-fun b!269258 () Bool)

(declare-fun e!189225 () Bool)

(assert (=> b!269258 (= e!189225 e!189224)))

(assert (=> b!269258 (= c!12423 (= (_3!996 lt!408865) (_4!216 lt!408865)))))

(declare-fun b!269259 () Bool)

(assert (=> b!269259 (= e!189223 (byteRangesEq!0 (select (arr!7529 (buf!7010 w1!591)) (_4!216 lt!408865)) (select (arr!7529 (buf!7010 w2!587)) (_4!216 lt!408865)) #b00000000000000000000000000000000 lt!408866))))

(declare-fun b!269260 () Bool)

(assert (=> b!269260 (= e!189222 e!189225)))

(declare-fun res!224466 () Bool)

(assert (=> b!269260 (=> (not res!224466) (not e!189225))))

(declare-fun e!189221 () Bool)

(assert (=> b!269260 (= res!224466 e!189221)))

(declare-fun res!224464 () Bool)

(assert (=> b!269260 (=> res!224464 e!189221)))

(assert (=> b!269260 (= res!224464 (bvsge (_1!12199 lt!408865) (_2!12199 lt!408865)))))

(assert (=> b!269260 (= lt!408866 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6542 (buf!7010 w1!591)) (currentByte!12946 w1!591) (currentBit!12941 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!269260 (= lt!408864 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!432)

(assert (=> b!269260 (= lt!408865 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6542 (buf!7010 w1!591)) (currentByte!12946 w1!591) (currentBit!12941 w1!591))))))

(declare-fun b!269261 () Bool)

(declare-fun arrayRangesEq!1073 (array!15010 array!15010 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!269261 (= e!189221 (arrayRangesEq!1073 (buf!7010 w1!591) (buf!7010 w2!587) (_1!12199 lt!408865) (_2!12199 lt!408865)))))

(assert (= (and d!91138 (not res!224465)) b!269260))

(assert (= (and b!269260 (not res!224464)) b!269261))

(assert (= (and b!269260 res!224466) b!269258))

(assert (= (and b!269258 c!12423) b!269256))

(assert (= (and b!269258 (not c!12423)) b!269255))

(assert (= (and b!269255 res!224467) b!269257))

(assert (= (and b!269257 (not res!224463)) b!269259))

(assert (= (or b!269256 b!269255) bm!4271))

(declare-fun m!400823 () Bool)

(assert (=> bm!4271 m!400823))

(declare-fun m!400825 () Bool)

(assert (=> bm!4271 m!400825))

(assert (=> bm!4271 m!400823))

(assert (=> bm!4271 m!400825))

(declare-fun m!400827 () Bool)

(assert (=> bm!4271 m!400827))

(declare-fun m!400829 () Bool)

(assert (=> b!269259 m!400829))

(declare-fun m!400831 () Bool)

(assert (=> b!269259 m!400831))

(assert (=> b!269259 m!400829))

(assert (=> b!269259 m!400831))

(declare-fun m!400833 () Bool)

(assert (=> b!269259 m!400833))

(assert (=> b!269260 m!400799))

(declare-fun m!400835 () Bool)

(assert (=> b!269260 m!400835))

(declare-fun m!400837 () Bool)

(assert (=> b!269261 m!400837))

(assert (=> b!269234 d!91138))

(declare-fun d!91146 () Bool)

(declare-fun e!189258 () Bool)

(assert (=> d!91146 e!189258))

(declare-fun res!224497 () Bool)

(assert (=> d!91146 (=> (not res!224497) (not e!189258))))

(declare-fun lt!408895 () (_ BitVec 64))

(declare-fun lt!408896 () (_ BitVec 64))

(declare-fun lt!408898 () (_ BitVec 64))

(assert (=> d!91146 (= res!224497 (= lt!408896 (bvsub lt!408898 lt!408895)))))

(assert (=> d!91146 (or (= (bvand lt!408898 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!408895 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!408898 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!408898 lt!408895) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!91146 (= lt!408895 (remainingBits!0 ((_ sign_extend 32) (size!6542 (buf!7010 w1!591))) ((_ sign_extend 32) (currentByte!12946 w1!591)) ((_ sign_extend 32) (currentBit!12941 w1!591))))))

(declare-fun lt!408897 () (_ BitVec 64))

(declare-fun lt!408894 () (_ BitVec 64))

(assert (=> d!91146 (= lt!408898 (bvmul lt!408897 lt!408894))))

(assert (=> d!91146 (or (= lt!408897 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!408894 (bvsdiv (bvmul lt!408897 lt!408894) lt!408897)))))

(assert (=> d!91146 (= lt!408894 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!91146 (= lt!408897 ((_ sign_extend 32) (size!6542 (buf!7010 w1!591))))))

(assert (=> d!91146 (= lt!408896 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12946 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12941 w1!591))))))

(assert (=> d!91146 (invariant!0 (currentBit!12941 w1!591) (currentByte!12946 w1!591) (size!6542 (buf!7010 w1!591)))))

(assert (=> d!91146 (= (bitIndex!0 (size!6542 (buf!7010 w1!591)) (currentByte!12946 w1!591) (currentBit!12941 w1!591)) lt!408896)))

(declare-fun b!269301 () Bool)

(declare-fun res!224498 () Bool)

(assert (=> b!269301 (=> (not res!224498) (not e!189258))))

(assert (=> b!269301 (= res!224498 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!408896))))

(declare-fun b!269302 () Bool)

(declare-fun lt!408899 () (_ BitVec 64))

(assert (=> b!269302 (= e!189258 (bvsle lt!408896 (bvmul lt!408899 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!269302 (or (= lt!408899 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!408899 #b0000000000000000000000000000000000000000000000000000000000001000) lt!408899)))))

(assert (=> b!269302 (= lt!408899 ((_ sign_extend 32) (size!6542 (buf!7010 w1!591))))))

(assert (= (and d!91146 res!224497) b!269301))

(assert (= (and b!269301 res!224498) b!269302))

(declare-fun m!400855 () Bool)

(assert (=> d!91146 m!400855))

(assert (=> d!91146 m!400817))

(assert (=> b!269234 d!91146))

(declare-fun d!91150 () Bool)

(assert (=> d!91150 (= (invariant!0 (currentBit!12941 w1!591) (currentByte!12946 w1!591) (size!6542 (buf!7010 w1!591))) (and (bvsge (currentBit!12941 w1!591) #b00000000000000000000000000000000) (bvslt (currentBit!12941 w1!591) #b00000000000000000000000000001000) (bvsge (currentByte!12946 w1!591) #b00000000000000000000000000000000) (or (bvslt (currentByte!12946 w1!591) (size!6542 (buf!7010 w1!591))) (and (= (currentBit!12941 w1!591) #b00000000000000000000000000000000) (= (currentByte!12946 w1!591) (size!6542 (buf!7010 w1!591)))))))))

(assert (=> d!91128 d!91150))

(declare-fun d!91152 () Bool)

(declare-fun e!189265 () Bool)

(assert (=> d!91152 e!189265))

(declare-fun res!224504 () Bool)

(assert (=> d!91152 (=> (not res!224504) (not e!189265))))

(declare-fun lt!408907 () (_ BitVec 64))

(declare-fun lt!408905 () (_ BitVec 64))

(declare-fun lt!408904 () (_ BitVec 64))

(assert (=> d!91152 (= res!224504 (= lt!408905 (bvsub lt!408907 lt!408904)))))

(assert (=> d!91152 (or (= (bvand lt!408907 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!408904 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!408907 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!408907 lt!408904) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!91152 (= lt!408904 (remainingBits!0 ((_ sign_extend 32) (size!6542 (buf!7010 w2!587))) ((_ sign_extend 32) (currentByte!12946 w2!587)) ((_ sign_extend 32) (currentBit!12941 w2!587))))))

(declare-fun lt!408906 () (_ BitVec 64))

(declare-fun lt!408903 () (_ BitVec 64))

(assert (=> d!91152 (= lt!408907 (bvmul lt!408906 lt!408903))))

(assert (=> d!91152 (or (= lt!408906 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!408903 (bvsdiv (bvmul lt!408906 lt!408903) lt!408906)))))

(assert (=> d!91152 (= lt!408903 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!91152 (= lt!408906 ((_ sign_extend 32) (size!6542 (buf!7010 w2!587))))))

(assert (=> d!91152 (= lt!408905 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12946 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12941 w2!587))))))

(assert (=> d!91152 (invariant!0 (currentBit!12941 w2!587) (currentByte!12946 w2!587) (size!6542 (buf!7010 w2!587)))))

(assert (=> d!91152 (= (bitIndex!0 (size!6542 (buf!7010 w2!587)) (currentByte!12946 w2!587) (currentBit!12941 w2!587)) lt!408905)))

(declare-fun b!269310 () Bool)

(declare-fun res!224505 () Bool)

(assert (=> b!269310 (=> (not res!224505) (not e!189265))))

(assert (=> b!269310 (= res!224505 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!408905))))

(declare-fun b!269311 () Bool)

(declare-fun lt!408908 () (_ BitVec 64))

(assert (=> b!269311 (= e!189265 (bvsle lt!408905 (bvmul lt!408908 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!269311 (or (= lt!408908 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!408908 #b0000000000000000000000000000000000000000000000000000000000001000) lt!408908)))))

(assert (=> b!269311 (= lt!408908 ((_ sign_extend 32) (size!6542 (buf!7010 w2!587))))))

(assert (= (and d!91152 res!224504) b!269310))

(assert (= (and b!269310 res!224505) b!269311))

(declare-fun m!400869 () Bool)

(assert (=> d!91152 m!400869))

(assert (=> d!91152 m!400819))

(assert (=> b!269226 d!91152))

(declare-fun d!91154 () Bool)

(declare-fun e!189266 () Bool)

(assert (=> d!91154 e!189266))

(declare-fun res!224506 () Bool)

(assert (=> d!91154 (=> (not res!224506) (not e!189266))))

(declare-fun lt!408910 () (_ BitVec 64))

(declare-fun lt!408913 () (_ BitVec 64))

(declare-fun lt!408911 () (_ BitVec 64))

(assert (=> d!91154 (= res!224506 (= lt!408911 (bvsub lt!408913 lt!408910)))))

(assert (=> d!91154 (or (= (bvand lt!408913 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!408910 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!408913 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!408913 lt!408910) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!91154 (= lt!408910 (remainingBits!0 ((_ sign_extend 32) (size!6542 (buf!7010 w3!25))) ((_ sign_extend 32) (currentByte!12946 w3!25)) ((_ sign_extend 32) (currentBit!12941 w3!25))))))

(declare-fun lt!408912 () (_ BitVec 64))

(declare-fun lt!408909 () (_ BitVec 64))

(assert (=> d!91154 (= lt!408913 (bvmul lt!408912 lt!408909))))

(assert (=> d!91154 (or (= lt!408912 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!408909 (bvsdiv (bvmul lt!408912 lt!408909) lt!408912)))))

(assert (=> d!91154 (= lt!408909 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!91154 (= lt!408912 ((_ sign_extend 32) (size!6542 (buf!7010 w3!25))))))

(assert (=> d!91154 (= lt!408911 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12946 w3!25)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12941 w3!25))))))

(assert (=> d!91154 (invariant!0 (currentBit!12941 w3!25) (currentByte!12946 w3!25) (size!6542 (buf!7010 w3!25)))))

(assert (=> d!91154 (= (bitIndex!0 (size!6542 (buf!7010 w3!25)) (currentByte!12946 w3!25) (currentBit!12941 w3!25)) lt!408911)))

(declare-fun b!269312 () Bool)

(declare-fun res!224507 () Bool)

(assert (=> b!269312 (=> (not res!224507) (not e!189266))))

(assert (=> b!269312 (= res!224507 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!408911))))

(declare-fun b!269313 () Bool)

(declare-fun lt!408914 () (_ BitVec 64))

(assert (=> b!269313 (= e!189266 (bvsle lt!408911 (bvmul lt!408914 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!269313 (or (= lt!408914 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!408914 #b0000000000000000000000000000000000000000000000000000000000001000) lt!408914)))))

(assert (=> b!269313 (= lt!408914 ((_ sign_extend 32) (size!6542 (buf!7010 w3!25))))))

(assert (= (and d!91154 res!224506) b!269312))

(assert (= (and b!269312 res!224507) b!269313))

(declare-fun m!400875 () Bool)

(assert (=> d!91154 m!400875))

(assert (=> d!91154 m!400821))

(assert (=> b!269226 d!91154))

(declare-fun d!91158 () Bool)

(assert (=> d!91158 (= (invariant!0 (currentBit!12941 w3!25) (currentByte!12946 w3!25) (size!6542 (buf!7010 w3!25))) (and (bvsge (currentBit!12941 w3!25) #b00000000000000000000000000000000) (bvslt (currentBit!12941 w3!25) #b00000000000000000000000000001000) (bvsge (currentByte!12946 w3!25) #b00000000000000000000000000000000) (or (bvslt (currentByte!12946 w3!25) (size!6542 (buf!7010 w3!25))) (and (= (currentBit!12941 w3!25) #b00000000000000000000000000000000) (= (currentByte!12946 w3!25) (size!6542 (buf!7010 w3!25)))))))))

(assert (=> d!91136 d!91158))

(declare-fun d!91160 () Bool)

(assert (=> d!91160 (= (invariant!0 (currentBit!12941 w2!587) (currentByte!12946 w2!587) (size!6542 (buf!7010 w2!587))) (and (bvsge (currentBit!12941 w2!587) #b00000000000000000000000000000000) (bvslt (currentBit!12941 w2!587) #b00000000000000000000000000001000) (bvsge (currentByte!12946 w2!587) #b00000000000000000000000000000000) (or (bvslt (currentByte!12946 w2!587) (size!6542 (buf!7010 w2!587))) (and (= (currentBit!12941 w2!587) #b00000000000000000000000000000000) (= (currentByte!12946 w2!587) (size!6542 (buf!7010 w2!587)))))))))

(assert (=> d!91134 d!91160))

(declare-fun bm!4278 () Bool)

(declare-fun call!4281 () Bool)

(declare-fun lt!408915 () (_ BitVec 32))

(declare-fun lt!408916 () tuple4!432)

(declare-fun lt!408917 () (_ BitVec 32))

(declare-fun c!12430 () Bool)

(assert (=> bm!4278 (= call!4281 (byteRangesEq!0 (select (arr!7529 (buf!7010 w2!587)) (_3!996 lt!408916)) (select (arr!7529 (buf!7010 w3!25)) (_3!996 lt!408916)) lt!408915 (ite c!12430 lt!408917 #b00000000000000000000000000001000)))))

(declare-fun d!91162 () Bool)

(declare-fun res!224510 () Bool)

(declare-fun e!189269 () Bool)

(assert (=> d!91162 (=> res!224510 e!189269)))

(assert (=> d!91162 (= res!224510 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6542 (buf!7010 w2!587)) (currentByte!12946 w2!587) (currentBit!12941 w2!587))))))

(assert (=> d!91162 (= (arrayBitRangesEq!0 (buf!7010 w2!587) (buf!7010 w3!25) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6542 (buf!7010 w2!587)) (currentByte!12946 w2!587) (currentBit!12941 w2!587))) e!189269)))

(declare-fun b!269314 () Bool)

(declare-fun e!189271 () Bool)

(declare-fun e!189267 () Bool)

(assert (=> b!269314 (= e!189271 e!189267)))

(declare-fun res!224512 () Bool)

(assert (=> b!269314 (= res!224512 call!4281)))

(assert (=> b!269314 (=> (not res!224512) (not e!189267))))

(declare-fun b!269315 () Bool)

(assert (=> b!269315 (= e!189271 call!4281)))

(declare-fun b!269316 () Bool)

(declare-fun res!224508 () Bool)

(assert (=> b!269316 (= res!224508 (= lt!408917 #b00000000000000000000000000000000))))

(declare-fun e!189270 () Bool)

(assert (=> b!269316 (=> res!224508 e!189270)))

(assert (=> b!269316 (= e!189267 e!189270)))

(declare-fun b!269317 () Bool)

(declare-fun e!189272 () Bool)

(assert (=> b!269317 (= e!189272 e!189271)))

(assert (=> b!269317 (= c!12430 (= (_3!996 lt!408916) (_4!216 lt!408916)))))

(declare-fun b!269318 () Bool)

(assert (=> b!269318 (= e!189270 (byteRangesEq!0 (select (arr!7529 (buf!7010 w2!587)) (_4!216 lt!408916)) (select (arr!7529 (buf!7010 w3!25)) (_4!216 lt!408916)) #b00000000000000000000000000000000 lt!408917))))

(declare-fun b!269319 () Bool)

(assert (=> b!269319 (= e!189269 e!189272)))

(declare-fun res!224511 () Bool)

(assert (=> b!269319 (=> (not res!224511) (not e!189272))))

(declare-fun e!189268 () Bool)

(assert (=> b!269319 (= res!224511 e!189268)))

(declare-fun res!224509 () Bool)

(assert (=> b!269319 (=> res!224509 e!189268)))

(assert (=> b!269319 (= res!224509 (bvsge (_1!12199 lt!408916) (_2!12199 lt!408916)))))

(assert (=> b!269319 (= lt!408917 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6542 (buf!7010 w2!587)) (currentByte!12946 w2!587) (currentBit!12941 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!269319 (= lt!408915 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!269319 (= lt!408916 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6542 (buf!7010 w2!587)) (currentByte!12946 w2!587) (currentBit!12941 w2!587))))))

(declare-fun b!269320 () Bool)

(assert (=> b!269320 (= e!189268 (arrayRangesEq!1073 (buf!7010 w2!587) (buf!7010 w3!25) (_1!12199 lt!408916) (_2!12199 lt!408916)))))

(assert (= (and d!91162 (not res!224510)) b!269319))

(assert (= (and b!269319 (not res!224509)) b!269320))

(assert (= (and b!269319 res!224511) b!269317))

(assert (= (and b!269317 c!12430) b!269315))

(assert (= (and b!269317 (not c!12430)) b!269314))

(assert (= (and b!269314 res!224512) b!269316))

(assert (= (and b!269316 (not res!224508)) b!269318))

(assert (= (or b!269315 b!269314) bm!4278))

(declare-fun m!400877 () Bool)

(assert (=> bm!4278 m!400877))

(declare-fun m!400879 () Bool)

(assert (=> bm!4278 m!400879))

(assert (=> bm!4278 m!400877))

(assert (=> bm!4278 m!400879))

(declare-fun m!400881 () Bool)

(assert (=> bm!4278 m!400881))

(declare-fun m!400883 () Bool)

(assert (=> b!269318 m!400883))

(declare-fun m!400885 () Bool)

(assert (=> b!269318 m!400885))

(assert (=> b!269318 m!400883))

(assert (=> b!269318 m!400885))

(declare-fun m!400887 () Bool)

(assert (=> b!269318 m!400887))

(assert (=> b!269319 m!400787))

(declare-fun m!400889 () Bool)

(assert (=> b!269319 m!400889))

(declare-fun m!400891 () Bool)

(assert (=> b!269320 m!400891))

(assert (=> b!269228 d!91162))

(assert (=> b!269228 d!91152))

(assert (=> b!269232 d!91146))

(assert (=> b!269232 d!91152))

(check-sat (not b!269260) (not b!269320) (not b!269318) (not bm!4278) (not bm!4271) (not b!269319) (not b!269261) (not d!91154) (not b!269259) (not d!91146) (not d!91152))
(check-sat)
