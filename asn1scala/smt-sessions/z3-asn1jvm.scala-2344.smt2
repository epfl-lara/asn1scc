; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59776 () Bool)

(assert start!59776)

(declare-fun res!227176 () Bool)

(declare-fun e!192793 () Bool)

(assert (=> start!59776 (=> (not res!227176) (not e!192793))))

(declare-datatypes ((array!15265 0))(
  ( (array!15266 (arr!7625 (Array (_ BitVec 32) (_ BitVec 8))) (size!6638 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12090 0))(
  ( (BitStream!12091 (buf!7106 array!15265) (currentByte!13113 (_ BitVec 32)) (currentBit!13108 (_ BitVec 32))) )
))
(declare-fun bs!71 () BitStream!12090)

(assert (=> start!59776 (= res!227176 (not (= (size!6638 (buf!7106 bs!71)) #b00000000000000000000000000000000)))))

(assert (=> start!59776 e!192793))

(declare-fun e!192792 () Bool)

(declare-fun inv!12 (BitStream!12090) Bool)

(assert (=> start!59776 (and (inv!12 bs!71) e!192792)))

(declare-fun b!272896 () Bool)

(declare-fun lt!410761 () (_ BitVec 64))

(declare-fun lt!410762 () (_ BitVec 64))

(assert (=> b!272896 (= e!192793 (not (or (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 lt!410761) (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!410762) (bvsle lt!410762 lt!410761)))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!272896 (= lt!410762 (bitIndex!0 (size!6638 (buf!7106 bs!71)) (currentByte!13113 bs!71) (currentBit!13108 bs!71)))))

(declare-fun arrayBitRangesEq!0 (array!15265 array!15265 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!272896 (arrayBitRangesEq!0 (buf!7106 bs!71) (buf!7106 bs!71) #b0000000000000000000000000000000000000000000000000000000000000000 lt!410761)))

(assert (=> b!272896 (= lt!410761 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6638 (buf!7106 bs!71)))))))

(declare-datatypes ((Unit!19255 0))(
  ( (Unit!19256) )
))
(declare-fun lt!410760 () Unit!19255)

(declare-fun arrayBitEqImpliesRangesEqLemma!0 (array!15265) Unit!19255)

(assert (=> b!272896 (= lt!410760 (arrayBitEqImpliesRangesEqLemma!0 (buf!7106 bs!71)))))

(declare-fun b!272897 () Bool)

(declare-fun array_inv!6362 (array!15265) Bool)

(assert (=> b!272897 (= e!192792 (array_inv!6362 (buf!7106 bs!71)))))

(assert (= (and start!59776 res!227176) b!272896))

(assert (= start!59776 b!272897))

(declare-fun m!405793 () Bool)

(assert (=> start!59776 m!405793))

(declare-fun m!405795 () Bool)

(assert (=> b!272896 m!405795))

(declare-fun m!405797 () Bool)

(assert (=> b!272896 m!405797))

(declare-fun m!405799 () Bool)

(assert (=> b!272896 m!405799))

(declare-fun m!405801 () Bool)

(assert (=> b!272897 m!405801))

(check-sat (not b!272896) (not start!59776) (not b!272897))
(check-sat)
(get-model)

(declare-fun d!93336 () Bool)

(declare-fun e!192808 () Bool)

(assert (=> d!93336 e!192808))

(declare-fun res!227190 () Bool)

(assert (=> d!93336 (=> (not res!227190) (not e!192808))))

(declare-fun lt!410804 () (_ BitVec 64))

(declare-fun lt!410805 () (_ BitVec 64))

(declare-fun lt!410802 () (_ BitVec 64))

(assert (=> d!93336 (= res!227190 (= lt!410805 (bvsub lt!410804 lt!410802)))))

(assert (=> d!93336 (or (= (bvand lt!410804 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!410802 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!410804 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!410804 lt!410802) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!93336 (= lt!410802 (remainingBits!0 ((_ sign_extend 32) (size!6638 (buf!7106 bs!71))) ((_ sign_extend 32) (currentByte!13113 bs!71)) ((_ sign_extend 32) (currentBit!13108 bs!71))))))

(declare-fun lt!410803 () (_ BitVec 64))

(declare-fun lt!410807 () (_ BitVec 64))

(assert (=> d!93336 (= lt!410804 (bvmul lt!410803 lt!410807))))

(assert (=> d!93336 (or (= lt!410803 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!410807 (bvsdiv (bvmul lt!410803 lt!410807) lt!410803)))))

(assert (=> d!93336 (= lt!410807 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!93336 (= lt!410803 ((_ sign_extend 32) (size!6638 (buf!7106 bs!71))))))

(assert (=> d!93336 (= lt!410805 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13113 bs!71)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13108 bs!71))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!93336 (invariant!0 (currentBit!13108 bs!71) (currentByte!13113 bs!71) (size!6638 (buf!7106 bs!71)))))

(assert (=> d!93336 (= (bitIndex!0 (size!6638 (buf!7106 bs!71)) (currentByte!13113 bs!71) (currentBit!13108 bs!71)) lt!410805)))

(declare-fun b!272914 () Bool)

(declare-fun res!227191 () Bool)

(assert (=> b!272914 (=> (not res!227191) (not e!192808))))

(assert (=> b!272914 (= res!227191 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!410805))))

(declare-fun b!272915 () Bool)

(declare-fun lt!410806 () (_ BitVec 64))

(assert (=> b!272915 (= e!192808 (bvsle lt!410805 (bvmul lt!410806 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!272915 (or (= lt!410806 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!410806 #b0000000000000000000000000000000000000000000000000000000000001000) lt!410806)))))

(assert (=> b!272915 (= lt!410806 ((_ sign_extend 32) (size!6638 (buf!7106 bs!71))))))

(assert (= (and d!93336 res!227190) b!272914))

(assert (= (and b!272914 res!227191) b!272915))

(declare-fun m!405817 () Bool)

(assert (=> d!93336 m!405817))

(declare-fun m!405819 () Bool)

(assert (=> d!93336 m!405819))

(assert (=> b!272896 d!93336))

(declare-fun b!272960 () Bool)

(declare-fun e!192845 () Bool)

(declare-fun e!192848 () Bool)

(assert (=> b!272960 (= e!192845 e!192848)))

(declare-datatypes ((tuple4!494 0))(
  ( (tuple4!495 (_1!12230 (_ BitVec 32)) (_2!12230 (_ BitVec 32)) (_3!1027 (_ BitVec 32)) (_4!247 (_ BitVec 32))) )
))
(declare-fun lt!410850 () tuple4!494)

(declare-fun res!227229 () Bool)

(declare-fun lt!410852 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!272960 (= res!227229 (byteRangesEq!0 (select (arr!7625 (buf!7106 bs!71)) (_3!1027 lt!410850)) (select (arr!7625 (buf!7106 bs!71)) (_3!1027 lt!410850)) lt!410852 #b00000000000000000000000000001000))))

(assert (=> b!272960 (=> (not res!227229) (not e!192848))))

(declare-fun b!272961 () Bool)

(declare-fun e!192850 () Bool)

(declare-fun arrayRangesEq!1140 (array!15265 array!15265 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!272961 (= e!192850 (arrayRangesEq!1140 (buf!7106 bs!71) (buf!7106 bs!71) (_1!12230 lt!410850) (_2!12230 lt!410850)))))

(declare-fun b!272962 () Bool)

(declare-fun e!192849 () Bool)

(assert (=> b!272962 (= e!192849 e!192845)))

(declare-fun c!12579 () Bool)

(assert (=> b!272962 (= c!12579 (= (_3!1027 lt!410850) (_4!247 lt!410850)))))

(declare-fun d!93344 () Bool)

(declare-fun res!227227 () Bool)

(declare-fun e!192846 () Bool)

(assert (=> d!93344 (=> res!227227 e!192846)))

(assert (=> d!93344 (= res!227227 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!410761))))

(assert (=> d!93344 (= (arrayBitRangesEq!0 (buf!7106 bs!71) (buf!7106 bs!71) #b0000000000000000000000000000000000000000000000000000000000000000 lt!410761) e!192846)))

(declare-fun b!272963 () Bool)

(declare-fun res!227226 () Bool)

(declare-fun lt!410851 () (_ BitVec 32))

(assert (=> b!272963 (= res!227226 (= lt!410851 #b00000000000000000000000000000000))))

(declare-fun e!192847 () Bool)

(assert (=> b!272963 (=> res!227226 e!192847)))

(assert (=> b!272963 (= e!192848 e!192847)))

(declare-fun bm!4391 () Bool)

(declare-fun call!4394 () Bool)

(assert (=> bm!4391 (= call!4394 (byteRangesEq!0 (ite c!12579 (select (arr!7625 (buf!7106 bs!71)) (_3!1027 lt!410850)) (select (arr!7625 (buf!7106 bs!71)) (_4!247 lt!410850))) (ite c!12579 (select (arr!7625 (buf!7106 bs!71)) (_3!1027 lt!410850)) (select (arr!7625 (buf!7106 bs!71)) (_4!247 lt!410850))) (ite c!12579 lt!410852 #b00000000000000000000000000000000) lt!410851))))

(declare-fun b!272964 () Bool)

(assert (=> b!272964 (= e!192845 call!4394)))

(declare-fun b!272965 () Bool)

(assert (=> b!272965 (= e!192846 e!192849)))

(declare-fun res!227230 () Bool)

(assert (=> b!272965 (=> (not res!227230) (not e!192849))))

(assert (=> b!272965 (= res!227230 e!192850)))

(declare-fun res!227228 () Bool)

(assert (=> b!272965 (=> res!227228 e!192850)))

(assert (=> b!272965 (= res!227228 (bvsge (_1!12230 lt!410850) (_2!12230 lt!410850)))))

(assert (=> b!272965 (= lt!410851 ((_ extract 31 0) (bvsrem lt!410761 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!272965 (= lt!410852 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!494)

(assert (=> b!272965 (= lt!410850 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!410761))))

(declare-fun b!272966 () Bool)

(assert (=> b!272966 (= e!192847 call!4394)))

(assert (= (and d!93344 (not res!227227)) b!272965))

(assert (= (and b!272965 (not res!227228)) b!272961))

(assert (= (and b!272965 res!227230) b!272962))

(assert (= (and b!272962 c!12579) b!272964))

(assert (= (and b!272962 (not c!12579)) b!272960))

(assert (= (and b!272960 res!227229) b!272963))

(assert (= (and b!272963 (not res!227226)) b!272966))

(assert (= (or b!272964 b!272966) bm!4391))

(declare-fun m!405841 () Bool)

(assert (=> b!272960 m!405841))

(assert (=> b!272960 m!405841))

(assert (=> b!272960 m!405841))

(assert (=> b!272960 m!405841))

(declare-fun m!405843 () Bool)

(assert (=> b!272960 m!405843))

(declare-fun m!405845 () Bool)

(assert (=> b!272961 m!405845))

(declare-fun m!405847 () Bool)

(assert (=> bm!4391 m!405847))

(declare-fun m!405849 () Bool)

(assert (=> bm!4391 m!405849))

(assert (=> bm!4391 m!405841))

(assert (=> bm!4391 m!405841))

(assert (=> bm!4391 m!405847))

(declare-fun m!405851 () Bool)

(assert (=> b!272965 m!405851))

(assert (=> b!272896 d!93344))

(declare-fun d!93354 () Bool)

(declare-fun e!192865 () Bool)

(assert (=> d!93354 e!192865))

(declare-fun res!227243 () Bool)

(assert (=> d!93354 (=> (not res!227243) (not e!192865))))

(declare-fun lt!410867 () (_ BitVec 64))

(declare-fun lt!410865 () (_ BitVec 64))

(assert (=> d!93354 (= res!227243 (or (= lt!410867 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!410865 (bvsdiv (bvmul lt!410867 lt!410865) lt!410867))))))

(assert (=> d!93354 (= lt!410865 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!93354 (= lt!410867 ((_ sign_extend 32) (size!6638 (buf!7106 bs!71))))))

(declare-fun lt!410866 () Unit!19255)

(declare-fun choose!44 (array!15265) Unit!19255)

(assert (=> d!93354 (= lt!410866 (choose!44 (buf!7106 bs!71)))))

(assert (=> d!93354 (= (arrayBitEqImpliesRangesEqLemma!0 (buf!7106 bs!71)) lt!410866)))

(declare-fun b!272983 () Bool)

(assert (=> b!272983 (= e!192865 (arrayBitRangesEq!0 (buf!7106 bs!71) (buf!7106 bs!71) #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul ((_ sign_extend 32) (size!6638 (buf!7106 bs!71))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (= (and d!93354 res!227243) b!272983))

(declare-fun m!405853 () Bool)

(assert (=> d!93354 m!405853))

(declare-fun m!405855 () Bool)

(assert (=> b!272983 m!405855))

(assert (=> b!272896 d!93354))

(declare-fun d!93356 () Bool)

(assert (=> d!93356 (= (inv!12 bs!71) (invariant!0 (currentBit!13108 bs!71) (currentByte!13113 bs!71) (size!6638 (buf!7106 bs!71))))))

(declare-fun bs!23546 () Bool)

(assert (= bs!23546 d!93356))

(assert (=> bs!23546 m!405819))

(assert (=> start!59776 d!93356))

(declare-fun d!93358 () Bool)

(assert (=> d!93358 (= (array_inv!6362 (buf!7106 bs!71)) (bvsge (size!6638 (buf!7106 bs!71)) #b00000000000000000000000000000000))))

(assert (=> b!272897 d!93358))

(check-sat (not b!272961) (not b!272983) (not b!272960) (not d!93336) (not bm!4391) (not d!93356) (not d!93354) (not b!272965))
(check-sat)
