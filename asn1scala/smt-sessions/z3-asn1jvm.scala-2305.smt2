; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58358 () Bool)

(assert start!58358)

(declare-fun b!268054 () Bool)

(declare-fun e!188087 () Bool)

(declare-datatypes ((array!14953 0))(
  ( (array!14954 (arr!7508 (Array (_ BitVec 32) (_ BitVec 8))) (size!6521 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11856 0))(
  ( (BitStream!11857 (buf!6989 array!14953) (currentByte!12901 (_ BitVec 32)) (currentBit!12896 (_ BitVec 32))) )
))
(declare-fun w2!587 () BitStream!11856)

(declare-fun array_inv!6245 (array!14953) Bool)

(assert (=> b!268054 (= e!188087 (array_inv!6245 (buf!6989 w2!587)))))

(declare-fun b!268055 () Bool)

(declare-fun e!188091 () Bool)

(declare-fun w3!25 () BitStream!11856)

(assert (=> b!268055 (= e!188091 (array_inv!6245 (buf!6989 w3!25)))))

(declare-fun b!268056 () Bool)

(declare-fun res!223599 () Bool)

(declare-fun e!188086 () Bool)

(assert (=> b!268056 (=> (not res!223599) (not e!188086))))

(declare-fun isPrefixOf!0 (BitStream!11856 BitStream!11856) Bool)

(assert (=> b!268056 (= res!223599 (isPrefixOf!0 w2!587 w3!25))))

(declare-fun b!268057 () Bool)

(declare-fun w1!591 () BitStream!11856)

(assert (=> b!268057 (= e!188086 (not (or (bvsge (currentByte!12901 w1!591) (size!6521 (buf!6989 w1!591))) (bvslt (currentByte!12901 w1!591) (currentByte!12901 w2!587)) (bvsgt (currentBit!12896 w1!591) (currentBit!12896 w2!587)) (and (bvsle #b00000000000000000000000000000000 (currentBit!12896 w1!591)) (bvsle (currentBit!12896 w1!591) #b00000000000000000000000000001000)))))))

(declare-fun arrayRangesEq!1056 (array!14953 array!14953 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!268057 (arrayRangesEq!1056 (buf!6989 w1!591) (buf!6989 w3!25) #b00000000000000000000000000000000 (currentByte!12901 w1!591))))

(declare-datatypes ((Unit!19015 0))(
  ( (Unit!19016) )
))
(declare-fun lt!408233 () Unit!19015)

(declare-fun arrayRangesEqTransitive!331 (array!14953 array!14953 array!14953 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19015)

(assert (=> b!268057 (= lt!408233 (arrayRangesEqTransitive!331 (buf!6989 w1!591) (buf!6989 w2!587) (buf!6989 w3!25) #b00000000000000000000000000000000 (currentByte!12901 w1!591) (currentByte!12901 w2!587)))))

(declare-fun res!223600 () Bool)

(assert (=> start!58358 (=> (not res!223600) (not e!188086))))

(assert (=> start!58358 (= res!223600 (isPrefixOf!0 w1!591 w2!587))))

(assert (=> start!58358 e!188086))

(declare-fun e!188090 () Bool)

(declare-fun inv!12 (BitStream!11856) Bool)

(assert (=> start!58358 (and (inv!12 w1!591) e!188090)))

(assert (=> start!58358 (and (inv!12 w2!587) e!188087)))

(assert (=> start!58358 (and (inv!12 w3!25) e!188091)))

(declare-fun b!268058 () Bool)

(assert (=> b!268058 (= e!188090 (array_inv!6245 (buf!6989 w1!591)))))

(assert (= (and start!58358 res!223600) b!268056))

(assert (= (and b!268056 res!223599) b!268057))

(assert (= start!58358 b!268058))

(assert (= start!58358 b!268054))

(assert (= start!58358 b!268055))

(declare-fun m!399433 () Bool)

(assert (=> b!268055 m!399433))

(declare-fun m!399435 () Bool)

(assert (=> b!268054 m!399435))

(declare-fun m!399437 () Bool)

(assert (=> b!268056 m!399437))

(declare-fun m!399439 () Bool)

(assert (=> b!268057 m!399439))

(declare-fun m!399441 () Bool)

(assert (=> b!268057 m!399441))

(declare-fun m!399443 () Bool)

(assert (=> b!268058 m!399443))

(declare-fun m!399445 () Bool)

(assert (=> start!58358 m!399445))

(declare-fun m!399447 () Bool)

(assert (=> start!58358 m!399447))

(declare-fun m!399449 () Bool)

(assert (=> start!58358 m!399449))

(declare-fun m!399451 () Bool)

(assert (=> start!58358 m!399451))

(check-sat (not b!268057) (not start!58358) (not b!268055) (not b!268056) (not b!268054) (not b!268058))
(check-sat)
(get-model)

(declare-fun d!90554 () Bool)

(assert (=> d!90554 (= (array_inv!6245 (buf!6989 w3!25)) (bvsge (size!6521 (buf!6989 w3!25)) #b00000000000000000000000000000000))))

(assert (=> b!268055 d!90554))

(declare-fun d!90558 () Bool)

(declare-fun res!223649 () Bool)

(declare-fun e!188144 () Bool)

(assert (=> d!90558 (=> (not res!223649) (not e!188144))))

(assert (=> d!90558 (= res!223649 (= (size!6521 (buf!6989 w1!591)) (size!6521 (buf!6989 w2!587))))))

(assert (=> d!90558 (= (isPrefixOf!0 w1!591 w2!587) e!188144)))

(declare-fun b!268114 () Bool)

(declare-fun res!223651 () Bool)

(assert (=> b!268114 (=> (not res!223651) (not e!188144))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!268114 (= res!223651 (bvsle (bitIndex!0 (size!6521 (buf!6989 w1!591)) (currentByte!12901 w1!591) (currentBit!12896 w1!591)) (bitIndex!0 (size!6521 (buf!6989 w2!587)) (currentByte!12901 w2!587) (currentBit!12896 w2!587))))))

(declare-fun b!268116 () Bool)

(declare-fun e!188143 () Bool)

(assert (=> b!268116 (= e!188144 e!188143)))

(declare-fun res!223647 () Bool)

(assert (=> b!268116 (=> res!223647 e!188143)))

(assert (=> b!268116 (= res!223647 (= (size!6521 (buf!6989 w1!591)) #b00000000000000000000000000000000))))

(declare-fun b!268118 () Bool)

(declare-fun arrayBitRangesEq!0 (array!14953 array!14953 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!268118 (= e!188143 (arrayBitRangesEq!0 (buf!6989 w1!591) (buf!6989 w2!587) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6521 (buf!6989 w1!591)) (currentByte!12901 w1!591) (currentBit!12896 w1!591))))))

(assert (= (and d!90558 res!223649) b!268114))

(assert (= (and b!268114 res!223651) b!268116))

(assert (= (and b!268116 (not res!223647)) b!268118))

(declare-fun m!399521 () Bool)

(assert (=> b!268114 m!399521))

(declare-fun m!399523 () Bool)

(assert (=> b!268114 m!399523))

(assert (=> b!268118 m!399521))

(assert (=> b!268118 m!399521))

(declare-fun m!399525 () Bool)

(assert (=> b!268118 m!399525))

(assert (=> start!58358 d!90558))

(declare-fun d!90598 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!90598 (= (inv!12 w1!591) (invariant!0 (currentBit!12896 w1!591) (currentByte!12901 w1!591) (size!6521 (buf!6989 w1!591))))))

(declare-fun bs!23009 () Bool)

(assert (= bs!23009 d!90598))

(declare-fun m!399527 () Bool)

(assert (=> bs!23009 m!399527))

(assert (=> start!58358 d!90598))

(declare-fun d!90600 () Bool)

(assert (=> d!90600 (= (inv!12 w2!587) (invariant!0 (currentBit!12896 w2!587) (currentByte!12901 w2!587) (size!6521 (buf!6989 w2!587))))))

(declare-fun bs!23010 () Bool)

(assert (= bs!23010 d!90600))

(declare-fun m!399529 () Bool)

(assert (=> bs!23010 m!399529))

(assert (=> start!58358 d!90600))

(declare-fun d!90602 () Bool)

(assert (=> d!90602 (= (inv!12 w3!25) (invariant!0 (currentBit!12896 w3!25) (currentByte!12901 w3!25) (size!6521 (buf!6989 w3!25))))))

(declare-fun bs!23011 () Bool)

(assert (= bs!23011 d!90602))

(declare-fun m!399531 () Bool)

(assert (=> bs!23011 m!399531))

(assert (=> start!58358 d!90602))

(declare-fun d!90604 () Bool)

(declare-fun res!223653 () Bool)

(declare-fun e!188148 () Bool)

(assert (=> d!90604 (=> (not res!223653) (not e!188148))))

(assert (=> d!90604 (= res!223653 (= (size!6521 (buf!6989 w2!587)) (size!6521 (buf!6989 w3!25))))))

(assert (=> d!90604 (= (isPrefixOf!0 w2!587 w3!25) e!188148)))

(declare-fun b!268119 () Bool)

(declare-fun res!223654 () Bool)

(assert (=> b!268119 (=> (not res!223654) (not e!188148))))

(assert (=> b!268119 (= res!223654 (bvsle (bitIndex!0 (size!6521 (buf!6989 w2!587)) (currentByte!12901 w2!587) (currentBit!12896 w2!587)) (bitIndex!0 (size!6521 (buf!6989 w3!25)) (currentByte!12901 w3!25) (currentBit!12896 w3!25))))))

(declare-fun b!268120 () Bool)

(declare-fun e!188147 () Bool)

(assert (=> b!268120 (= e!188148 e!188147)))

(declare-fun res!223652 () Bool)

(assert (=> b!268120 (=> res!223652 e!188147)))

(assert (=> b!268120 (= res!223652 (= (size!6521 (buf!6989 w2!587)) #b00000000000000000000000000000000))))

(declare-fun b!268121 () Bool)

(assert (=> b!268121 (= e!188147 (arrayBitRangesEq!0 (buf!6989 w2!587) (buf!6989 w3!25) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6521 (buf!6989 w2!587)) (currentByte!12901 w2!587) (currentBit!12896 w2!587))))))

(assert (= (and d!90604 res!223653) b!268119))

(assert (= (and b!268119 res!223654) b!268120))

(assert (= (and b!268120 (not res!223652)) b!268121))

(assert (=> b!268119 m!399523))

(declare-fun m!399533 () Bool)

(assert (=> b!268119 m!399533))

(assert (=> b!268121 m!399523))

(assert (=> b!268121 m!399523))

(declare-fun m!399535 () Bool)

(assert (=> b!268121 m!399535))

(assert (=> b!268056 d!90604))

(declare-fun d!90606 () Bool)

(assert (=> d!90606 (= (array_inv!6245 (buf!6989 w1!591)) (bvsge (size!6521 (buf!6989 w1!591)) #b00000000000000000000000000000000))))

(assert (=> b!268058 d!90606))

(declare-fun d!90608 () Bool)

(declare-fun res!223659 () Bool)

(declare-fun e!188153 () Bool)

(assert (=> d!90608 (=> res!223659 e!188153)))

(assert (=> d!90608 (= res!223659 (= #b00000000000000000000000000000000 (currentByte!12901 w1!591)))))

(assert (=> d!90608 (= (arrayRangesEq!1056 (buf!6989 w1!591) (buf!6989 w3!25) #b00000000000000000000000000000000 (currentByte!12901 w1!591)) e!188153)))

(declare-fun b!268126 () Bool)

(declare-fun e!188154 () Bool)

(assert (=> b!268126 (= e!188153 e!188154)))

(declare-fun res!223660 () Bool)

(assert (=> b!268126 (=> (not res!223660) (not e!188154))))

(assert (=> b!268126 (= res!223660 (= (select (arr!7508 (buf!6989 w1!591)) #b00000000000000000000000000000000) (select (arr!7508 (buf!6989 w3!25)) #b00000000000000000000000000000000)))))

(declare-fun b!268127 () Bool)

(assert (=> b!268127 (= e!188154 (arrayRangesEq!1056 (buf!6989 w1!591) (buf!6989 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12901 w1!591)))))

(assert (= (and d!90608 (not res!223659)) b!268126))

(assert (= (and b!268126 res!223660) b!268127))

(declare-fun m!399537 () Bool)

(assert (=> b!268126 m!399537))

(declare-fun m!399539 () Bool)

(assert (=> b!268126 m!399539))

(declare-fun m!399541 () Bool)

(assert (=> b!268127 m!399541))

(assert (=> b!268057 d!90608))

(declare-fun d!90610 () Bool)

(assert (=> d!90610 (arrayRangesEq!1056 (buf!6989 w1!591) (buf!6989 w3!25) #b00000000000000000000000000000000 (currentByte!12901 w1!591))))

(declare-fun lt!408245 () Unit!19015)

(declare-fun choose!374 (array!14953 array!14953 array!14953 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19015)

(assert (=> d!90610 (= lt!408245 (choose!374 (buf!6989 w1!591) (buf!6989 w2!587) (buf!6989 w3!25) #b00000000000000000000000000000000 (currentByte!12901 w1!591) (currentByte!12901 w2!587)))))

(assert (=> d!90610 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (currentByte!12901 w1!591)) (bvsle (currentByte!12901 w1!591) (currentByte!12901 w2!587)))))

(assert (=> d!90610 (= (arrayRangesEqTransitive!331 (buf!6989 w1!591) (buf!6989 w2!587) (buf!6989 w3!25) #b00000000000000000000000000000000 (currentByte!12901 w1!591) (currentByte!12901 w2!587)) lt!408245)))

(declare-fun bs!23012 () Bool)

(assert (= bs!23012 d!90610))

(assert (=> bs!23012 m!399439))

(declare-fun m!399543 () Bool)

(assert (=> bs!23012 m!399543))

(assert (=> b!268057 d!90610))

(declare-fun d!90612 () Bool)

(assert (=> d!90612 (= (array_inv!6245 (buf!6989 w2!587)) (bvsge (size!6521 (buf!6989 w2!587)) #b00000000000000000000000000000000))))

(assert (=> b!268054 d!90612))

(check-sat (not b!268119) (not b!268114) (not b!268118) (not d!90598) (not d!90610) (not b!268121) (not d!90602) (not d!90600) (not b!268127))
(check-sat)
(get-model)

(declare-fun d!90616 () Bool)

(assert (=> d!90616 (= (invariant!0 (currentBit!12896 w1!591) (currentByte!12901 w1!591) (size!6521 (buf!6989 w1!591))) (and (bvsge (currentBit!12896 w1!591) #b00000000000000000000000000000000) (bvslt (currentBit!12896 w1!591) #b00000000000000000000000000001000) (bvsge (currentByte!12901 w1!591) #b00000000000000000000000000000000) (or (bvslt (currentByte!12901 w1!591) (size!6521 (buf!6989 w1!591))) (and (= (currentBit!12896 w1!591) #b00000000000000000000000000000000) (= (currentByte!12901 w1!591) (size!6521 (buf!6989 w1!591)))))))))

(assert (=> d!90598 d!90616))

(declare-fun b!268190 () Bool)

(declare-fun res!223715 () Bool)

(declare-fun lt!408320 () (_ BitVec 32))

(assert (=> b!268190 (= res!223715 (= lt!408320 #b00000000000000000000000000000000))))

(declare-fun e!188206 () Bool)

(assert (=> b!268190 (=> res!223715 e!188206)))

(declare-fun e!188207 () Bool)

(assert (=> b!268190 (= e!188207 e!188206)))

(declare-fun b!268191 () Bool)

(declare-fun call!4230 () Bool)

(assert (=> b!268191 (= e!188206 call!4230)))

(declare-fun b!268192 () Bool)

(declare-fun e!188205 () Bool)

(declare-fun e!188202 () Bool)

(assert (=> b!268192 (= e!188205 e!188202)))

(declare-fun res!223711 () Bool)

(assert (=> b!268192 (=> (not res!223711) (not e!188202))))

(declare-fun e!188204 () Bool)

(assert (=> b!268192 (= res!223711 e!188204)))

(declare-fun res!223712 () Bool)

(assert (=> b!268192 (=> res!223712 e!188204)))

(declare-datatypes ((tuple4!410 0))(
  ( (tuple4!411 (_1!12188 (_ BitVec 32)) (_2!12188 (_ BitVec 32)) (_3!985 (_ BitVec 32)) (_4!205 (_ BitVec 32))) )
))
(declare-fun lt!408319 () tuple4!410)

(assert (=> b!268192 (= res!223712 (bvsge (_1!12188 lt!408319) (_2!12188 lt!408319)))))

(assert (=> b!268192 (= lt!408320 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6521 (buf!6989 w2!587)) (currentByte!12901 w2!587) (currentBit!12896 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!408318 () (_ BitVec 32))

(assert (=> b!268192 (= lt!408318 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!410)

(assert (=> b!268192 (= lt!408319 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6521 (buf!6989 w2!587)) (currentByte!12901 w2!587) (currentBit!12896 w2!587))))))

(declare-fun b!268193 () Bool)

(declare-fun e!188203 () Bool)

(assert (=> b!268193 (= e!188203 call!4230)))

(declare-fun b!268194 () Bool)

(assert (=> b!268194 (= e!188204 (arrayRangesEq!1056 (buf!6989 w2!587) (buf!6989 w3!25) (_1!12188 lt!408319) (_2!12188 lt!408319)))))

(declare-fun d!90618 () Bool)

(declare-fun res!223714 () Bool)

(assert (=> d!90618 (=> res!223714 e!188205)))

(assert (=> d!90618 (= res!223714 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6521 (buf!6989 w2!587)) (currentByte!12901 w2!587) (currentBit!12896 w2!587))))))

(assert (=> d!90618 (= (arrayBitRangesEq!0 (buf!6989 w2!587) (buf!6989 w3!25) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6521 (buf!6989 w2!587)) (currentByte!12901 w2!587) (currentBit!12896 w2!587))) e!188205)))

(declare-fun b!268195 () Bool)

(assert (=> b!268195 (= e!188203 e!188207)))

(declare-fun res!223713 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!268195 (= res!223713 (byteRangesEq!0 (select (arr!7508 (buf!6989 w2!587)) (_3!985 lt!408319)) (select (arr!7508 (buf!6989 w3!25)) (_3!985 lt!408319)) lt!408318 #b00000000000000000000000000001000))))

(assert (=> b!268195 (=> (not res!223713) (not e!188207))))

(declare-fun b!268196 () Bool)

(assert (=> b!268196 (= e!188202 e!188203)))

(declare-fun c!12361 () Bool)

(assert (=> b!268196 (= c!12361 (= (_3!985 lt!408319) (_4!205 lt!408319)))))

(declare-fun bm!4227 () Bool)

(assert (=> bm!4227 (= call!4230 (byteRangesEq!0 (ite c!12361 (select (arr!7508 (buf!6989 w2!587)) (_3!985 lt!408319)) (select (arr!7508 (buf!6989 w2!587)) (_4!205 lt!408319))) (ite c!12361 (select (arr!7508 (buf!6989 w3!25)) (_3!985 lt!408319)) (select (arr!7508 (buf!6989 w3!25)) (_4!205 lt!408319))) (ite c!12361 lt!408318 #b00000000000000000000000000000000) lt!408320))))

(assert (= (and d!90618 (not res!223714)) b!268192))

(assert (= (and b!268192 (not res!223712)) b!268194))

(assert (= (and b!268192 res!223711) b!268196))

(assert (= (and b!268196 c!12361) b!268193))

(assert (= (and b!268196 (not c!12361)) b!268195))

(assert (= (and b!268195 res!223713) b!268190))

(assert (= (and b!268190 (not res!223715)) b!268191))

(assert (= (or b!268193 b!268191) bm!4227))

(assert (=> b!268192 m!399523))

(declare-fun m!399593 () Bool)

(assert (=> b!268192 m!399593))

(declare-fun m!399595 () Bool)

(assert (=> b!268194 m!399595))

(declare-fun m!399597 () Bool)

(assert (=> b!268195 m!399597))

(declare-fun m!399599 () Bool)

(assert (=> b!268195 m!399599))

(assert (=> b!268195 m!399597))

(assert (=> b!268195 m!399599))

(declare-fun m!399601 () Bool)

(assert (=> b!268195 m!399601))

(assert (=> bm!4227 m!399599))

(declare-fun m!399603 () Bool)

(assert (=> bm!4227 m!399603))

(declare-fun m!399605 () Bool)

(assert (=> bm!4227 m!399605))

(declare-fun m!399607 () Bool)

(assert (=> bm!4227 m!399607))

(assert (=> bm!4227 m!399597))

(assert (=> b!268121 d!90618))

(declare-fun d!90648 () Bool)

(declare-fun e!188237 () Bool)

(assert (=> d!90648 e!188237))

(declare-fun res!223745 () Bool)

(assert (=> d!90648 (=> (not res!223745) (not e!188237))))

(declare-fun lt!408355 () (_ BitVec 64))

(declare-fun lt!408351 () (_ BitVec 64))

(declare-fun lt!408356 () (_ BitVec 64))

(assert (=> d!90648 (= res!223745 (= lt!408351 (bvsub lt!408355 lt!408356)))))

(assert (=> d!90648 (or (= (bvand lt!408355 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!408356 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!408355 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!408355 lt!408356) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!90648 (= lt!408356 (remainingBits!0 ((_ sign_extend 32) (size!6521 (buf!6989 w2!587))) ((_ sign_extend 32) (currentByte!12901 w2!587)) ((_ sign_extend 32) (currentBit!12896 w2!587))))))

(declare-fun lt!408352 () (_ BitVec 64))

(declare-fun lt!408354 () (_ BitVec 64))

(assert (=> d!90648 (= lt!408355 (bvmul lt!408352 lt!408354))))

(assert (=> d!90648 (or (= lt!408352 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!408354 (bvsdiv (bvmul lt!408352 lt!408354) lt!408352)))))

(assert (=> d!90648 (= lt!408354 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!90648 (= lt!408352 ((_ sign_extend 32) (size!6521 (buf!6989 w2!587))))))

(assert (=> d!90648 (= lt!408351 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12901 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12896 w2!587))))))

(assert (=> d!90648 (invariant!0 (currentBit!12896 w2!587) (currentByte!12901 w2!587) (size!6521 (buf!6989 w2!587)))))

(assert (=> d!90648 (= (bitIndex!0 (size!6521 (buf!6989 w2!587)) (currentByte!12901 w2!587) (currentBit!12896 w2!587)) lt!408351)))

(declare-fun b!268233 () Bool)

(declare-fun res!223744 () Bool)

(assert (=> b!268233 (=> (not res!223744) (not e!188237))))

(assert (=> b!268233 (= res!223744 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!408351))))

(declare-fun b!268234 () Bool)

(declare-fun lt!408353 () (_ BitVec 64))

(assert (=> b!268234 (= e!188237 (bvsle lt!408351 (bvmul lt!408353 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!268234 (or (= lt!408353 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!408353 #b0000000000000000000000000000000000000000000000000000000000001000) lt!408353)))))

(assert (=> b!268234 (= lt!408353 ((_ sign_extend 32) (size!6521 (buf!6989 w2!587))))))

(assert (= (and d!90648 res!223745) b!268233))

(assert (= (and b!268233 res!223744) b!268234))

(declare-fun m!399649 () Bool)

(assert (=> d!90648 m!399649))

(assert (=> d!90648 m!399529))

(assert (=> b!268121 d!90648))

(declare-fun d!90660 () Bool)

(declare-fun res!223746 () Bool)

(declare-fun e!188238 () Bool)

(assert (=> d!90660 (=> res!223746 e!188238)))

(assert (=> d!90660 (= res!223746 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12901 w1!591)))))

(assert (=> d!90660 (= (arrayRangesEq!1056 (buf!6989 w1!591) (buf!6989 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12901 w1!591)) e!188238)))

(declare-fun b!268235 () Bool)

(declare-fun e!188239 () Bool)

(assert (=> b!268235 (= e!188238 e!188239)))

(declare-fun res!223747 () Bool)

(assert (=> b!268235 (=> (not res!223747) (not e!188239))))

(assert (=> b!268235 (= res!223747 (= (select (arr!7508 (buf!6989 w1!591)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!7508 (buf!6989 w3!25)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!268236 () Bool)

(assert (=> b!268236 (= e!188239 (arrayRangesEq!1056 (buf!6989 w1!591) (buf!6989 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!12901 w1!591)))))

(assert (= (and d!90660 (not res!223746)) b!268235))

(assert (= (and b!268235 res!223747) b!268236))

(declare-fun m!399651 () Bool)

(assert (=> b!268235 m!399651))

(declare-fun m!399653 () Bool)

(assert (=> b!268235 m!399653))

(declare-fun m!399655 () Bool)

(assert (=> b!268236 m!399655))

(assert (=> b!268127 d!90660))

(declare-fun d!90662 () Bool)

(assert (=> d!90662 (= (invariant!0 (currentBit!12896 w3!25) (currentByte!12901 w3!25) (size!6521 (buf!6989 w3!25))) (and (bvsge (currentBit!12896 w3!25) #b00000000000000000000000000000000) (bvslt (currentBit!12896 w3!25) #b00000000000000000000000000001000) (bvsge (currentByte!12901 w3!25) #b00000000000000000000000000000000) (or (bvslt (currentByte!12901 w3!25) (size!6521 (buf!6989 w3!25))) (and (= (currentBit!12896 w3!25) #b00000000000000000000000000000000) (= (currentByte!12901 w3!25) (size!6521 (buf!6989 w3!25)))))))))

(assert (=> d!90602 d!90662))

(declare-fun d!90664 () Bool)

(assert (=> d!90664 (= (invariant!0 (currentBit!12896 w2!587) (currentByte!12901 w2!587) (size!6521 (buf!6989 w2!587))) (and (bvsge (currentBit!12896 w2!587) #b00000000000000000000000000000000) (bvslt (currentBit!12896 w2!587) #b00000000000000000000000000001000) (bvsge (currentByte!12901 w2!587) #b00000000000000000000000000000000) (or (bvslt (currentByte!12901 w2!587) (size!6521 (buf!6989 w2!587))) (and (= (currentBit!12896 w2!587) #b00000000000000000000000000000000) (= (currentByte!12901 w2!587) (size!6521 (buf!6989 w2!587)))))))))

(assert (=> d!90600 d!90664))

(declare-fun b!268237 () Bool)

(declare-fun res!223752 () Bool)

(declare-fun lt!408359 () (_ BitVec 32))

(assert (=> b!268237 (= res!223752 (= lt!408359 #b00000000000000000000000000000000))))

(declare-fun e!188244 () Bool)

(assert (=> b!268237 (=> res!223752 e!188244)))

(declare-fun e!188245 () Bool)

(assert (=> b!268237 (= e!188245 e!188244)))

(declare-fun b!268238 () Bool)

(declare-fun call!4235 () Bool)

(assert (=> b!268238 (= e!188244 call!4235)))

(declare-fun b!268239 () Bool)

(declare-fun e!188243 () Bool)

(declare-fun e!188240 () Bool)

(assert (=> b!268239 (= e!188243 e!188240)))

(declare-fun res!223748 () Bool)

(assert (=> b!268239 (=> (not res!223748) (not e!188240))))

(declare-fun e!188242 () Bool)

(assert (=> b!268239 (= res!223748 e!188242)))

(declare-fun res!223749 () Bool)

(assert (=> b!268239 (=> res!223749 e!188242)))

(declare-fun lt!408358 () tuple4!410)

(assert (=> b!268239 (= res!223749 (bvsge (_1!12188 lt!408358) (_2!12188 lt!408358)))))

(assert (=> b!268239 (= lt!408359 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6521 (buf!6989 w1!591)) (currentByte!12901 w1!591) (currentBit!12896 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!408357 () (_ BitVec 32))

(assert (=> b!268239 (= lt!408357 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!268239 (= lt!408358 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6521 (buf!6989 w1!591)) (currentByte!12901 w1!591) (currentBit!12896 w1!591))))))

(declare-fun b!268240 () Bool)

(declare-fun e!188241 () Bool)

(assert (=> b!268240 (= e!188241 call!4235)))

(declare-fun b!268241 () Bool)

(assert (=> b!268241 (= e!188242 (arrayRangesEq!1056 (buf!6989 w1!591) (buf!6989 w2!587) (_1!12188 lt!408358) (_2!12188 lt!408358)))))

(declare-fun d!90666 () Bool)

(declare-fun res!223751 () Bool)

(assert (=> d!90666 (=> res!223751 e!188243)))

(assert (=> d!90666 (= res!223751 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6521 (buf!6989 w1!591)) (currentByte!12901 w1!591) (currentBit!12896 w1!591))))))

(assert (=> d!90666 (= (arrayBitRangesEq!0 (buf!6989 w1!591) (buf!6989 w2!587) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6521 (buf!6989 w1!591)) (currentByte!12901 w1!591) (currentBit!12896 w1!591))) e!188243)))

(declare-fun b!268242 () Bool)

(assert (=> b!268242 (= e!188241 e!188245)))

(declare-fun res!223750 () Bool)

(assert (=> b!268242 (= res!223750 (byteRangesEq!0 (select (arr!7508 (buf!6989 w1!591)) (_3!985 lt!408358)) (select (arr!7508 (buf!6989 w2!587)) (_3!985 lt!408358)) lt!408357 #b00000000000000000000000000001000))))

(assert (=> b!268242 (=> (not res!223750) (not e!188245))))

(declare-fun b!268243 () Bool)

(assert (=> b!268243 (= e!188240 e!188241)))

(declare-fun c!12366 () Bool)

(assert (=> b!268243 (= c!12366 (= (_3!985 lt!408358) (_4!205 lt!408358)))))

(declare-fun bm!4232 () Bool)

(assert (=> bm!4232 (= call!4235 (byteRangesEq!0 (ite c!12366 (select (arr!7508 (buf!6989 w1!591)) (_3!985 lt!408358)) (select (arr!7508 (buf!6989 w1!591)) (_4!205 lt!408358))) (ite c!12366 (select (arr!7508 (buf!6989 w2!587)) (_3!985 lt!408358)) (select (arr!7508 (buf!6989 w2!587)) (_4!205 lt!408358))) (ite c!12366 lt!408357 #b00000000000000000000000000000000) lt!408359))))

(assert (= (and d!90666 (not res!223751)) b!268239))

(assert (= (and b!268239 (not res!223749)) b!268241))

(assert (= (and b!268239 res!223748) b!268243))

(assert (= (and b!268243 c!12366) b!268240))

(assert (= (and b!268243 (not c!12366)) b!268242))

(assert (= (and b!268242 res!223750) b!268237))

(assert (= (and b!268237 (not res!223752)) b!268238))

(assert (= (or b!268240 b!268238) bm!4232))

(assert (=> b!268239 m!399521))

(declare-fun m!399657 () Bool)

(assert (=> b!268239 m!399657))

(declare-fun m!399659 () Bool)

(assert (=> b!268241 m!399659))

(declare-fun m!399661 () Bool)

(assert (=> b!268242 m!399661))

(declare-fun m!399663 () Bool)

(assert (=> b!268242 m!399663))

(assert (=> b!268242 m!399661))

(assert (=> b!268242 m!399663))

(declare-fun m!399665 () Bool)

(assert (=> b!268242 m!399665))

(assert (=> bm!4232 m!399663))

(declare-fun m!399667 () Bool)

(assert (=> bm!4232 m!399667))

(declare-fun m!399669 () Bool)

(assert (=> bm!4232 m!399669))

(declare-fun m!399671 () Bool)

(assert (=> bm!4232 m!399671))

(assert (=> bm!4232 m!399661))

(assert (=> b!268118 d!90666))

(declare-fun d!90668 () Bool)

(declare-fun e!188246 () Bool)

(assert (=> d!90668 e!188246))

(declare-fun res!223754 () Bool)

(assert (=> d!90668 (=> (not res!223754) (not e!188246))))

(declare-fun lt!408364 () (_ BitVec 64))

(declare-fun lt!408360 () (_ BitVec 64))

(declare-fun lt!408365 () (_ BitVec 64))

(assert (=> d!90668 (= res!223754 (= lt!408360 (bvsub lt!408364 lt!408365)))))

(assert (=> d!90668 (or (= (bvand lt!408364 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!408365 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!408364 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!408364 lt!408365) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!90668 (= lt!408365 (remainingBits!0 ((_ sign_extend 32) (size!6521 (buf!6989 w1!591))) ((_ sign_extend 32) (currentByte!12901 w1!591)) ((_ sign_extend 32) (currentBit!12896 w1!591))))))

(declare-fun lt!408361 () (_ BitVec 64))

(declare-fun lt!408363 () (_ BitVec 64))

(assert (=> d!90668 (= lt!408364 (bvmul lt!408361 lt!408363))))

(assert (=> d!90668 (or (= lt!408361 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!408363 (bvsdiv (bvmul lt!408361 lt!408363) lt!408361)))))

(assert (=> d!90668 (= lt!408363 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!90668 (= lt!408361 ((_ sign_extend 32) (size!6521 (buf!6989 w1!591))))))

(assert (=> d!90668 (= lt!408360 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12901 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12896 w1!591))))))

(assert (=> d!90668 (invariant!0 (currentBit!12896 w1!591) (currentByte!12901 w1!591) (size!6521 (buf!6989 w1!591)))))

(assert (=> d!90668 (= (bitIndex!0 (size!6521 (buf!6989 w1!591)) (currentByte!12901 w1!591) (currentBit!12896 w1!591)) lt!408360)))

(declare-fun b!268244 () Bool)

(declare-fun res!223753 () Bool)

(assert (=> b!268244 (=> (not res!223753) (not e!188246))))

(assert (=> b!268244 (= res!223753 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!408360))))

(declare-fun b!268245 () Bool)

(declare-fun lt!408362 () (_ BitVec 64))

(assert (=> b!268245 (= e!188246 (bvsle lt!408360 (bvmul lt!408362 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!268245 (or (= lt!408362 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!408362 #b0000000000000000000000000000000000000000000000000000000000001000) lt!408362)))))

(assert (=> b!268245 (= lt!408362 ((_ sign_extend 32) (size!6521 (buf!6989 w1!591))))))

(assert (= (and d!90668 res!223754) b!268244))

(assert (= (and b!268244 res!223753) b!268245))

(declare-fun m!399673 () Bool)

(assert (=> d!90668 m!399673))

(assert (=> d!90668 m!399527))

(assert (=> b!268118 d!90668))

(assert (=> b!268119 d!90648))

(declare-fun d!90670 () Bool)

(declare-fun e!188247 () Bool)

(assert (=> d!90670 e!188247))

(declare-fun res!223756 () Bool)

(assert (=> d!90670 (=> (not res!223756) (not e!188247))))

(declare-fun lt!408370 () (_ BitVec 64))

(declare-fun lt!408371 () (_ BitVec 64))

(declare-fun lt!408366 () (_ BitVec 64))

(assert (=> d!90670 (= res!223756 (= lt!408366 (bvsub lt!408370 lt!408371)))))

(assert (=> d!90670 (or (= (bvand lt!408370 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!408371 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!408370 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!408370 lt!408371) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!90670 (= lt!408371 (remainingBits!0 ((_ sign_extend 32) (size!6521 (buf!6989 w3!25))) ((_ sign_extend 32) (currentByte!12901 w3!25)) ((_ sign_extend 32) (currentBit!12896 w3!25))))))

(declare-fun lt!408367 () (_ BitVec 64))

(declare-fun lt!408369 () (_ BitVec 64))

(assert (=> d!90670 (= lt!408370 (bvmul lt!408367 lt!408369))))

(assert (=> d!90670 (or (= lt!408367 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!408369 (bvsdiv (bvmul lt!408367 lt!408369) lt!408367)))))

(assert (=> d!90670 (= lt!408369 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!90670 (= lt!408367 ((_ sign_extend 32) (size!6521 (buf!6989 w3!25))))))

(assert (=> d!90670 (= lt!408366 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12901 w3!25)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12896 w3!25))))))

(assert (=> d!90670 (invariant!0 (currentBit!12896 w3!25) (currentByte!12901 w3!25) (size!6521 (buf!6989 w3!25)))))

(assert (=> d!90670 (= (bitIndex!0 (size!6521 (buf!6989 w3!25)) (currentByte!12901 w3!25) (currentBit!12896 w3!25)) lt!408366)))

(declare-fun b!268246 () Bool)

(declare-fun res!223755 () Bool)

(assert (=> b!268246 (=> (not res!223755) (not e!188247))))

(assert (=> b!268246 (= res!223755 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!408366))))

(declare-fun b!268247 () Bool)

(declare-fun lt!408368 () (_ BitVec 64))

(assert (=> b!268247 (= e!188247 (bvsle lt!408366 (bvmul lt!408368 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!268247 (or (= lt!408368 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!408368 #b0000000000000000000000000000000000000000000000000000000000001000) lt!408368)))))

(assert (=> b!268247 (= lt!408368 ((_ sign_extend 32) (size!6521 (buf!6989 w3!25))))))

(assert (= (and d!90670 res!223756) b!268246))

(assert (= (and b!268246 res!223755) b!268247))

(declare-fun m!399675 () Bool)

(assert (=> d!90670 m!399675))

(assert (=> d!90670 m!399531))

(assert (=> b!268119 d!90670))

(assert (=> d!90610 d!90608))

(declare-fun d!90672 () Bool)

(assert (=> d!90672 (arrayRangesEq!1056 (buf!6989 w1!591) (buf!6989 w3!25) #b00000000000000000000000000000000 (currentByte!12901 w1!591))))

(assert (=> d!90672 true))

(declare-fun _$16!104 () Unit!19015)

(assert (=> d!90672 (= (choose!374 (buf!6989 w1!591) (buf!6989 w2!587) (buf!6989 w3!25) #b00000000000000000000000000000000 (currentByte!12901 w1!591) (currentByte!12901 w2!587)) _$16!104)))

(declare-fun bs!23015 () Bool)

(assert (= bs!23015 d!90672))

(assert (=> bs!23015 m!399439))

(assert (=> d!90610 d!90672))

(assert (=> b!268114 d!90668))

(assert (=> b!268114 d!90648))

(check-sat (not b!268192) (not bm!4227) (not b!268241) (not d!90670) (not d!90672) (not bm!4232) (not b!268195) (not b!268242) (not d!90648) (not d!90668) (not b!268239) (not b!268236) (not b!268194))
