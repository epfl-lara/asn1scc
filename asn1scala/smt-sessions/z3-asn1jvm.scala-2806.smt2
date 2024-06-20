; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67586 () Bool)

(assert start!67586)

(declare-fun b!303419 () Bool)

(declare-fun res!249689 () Bool)

(declare-fun e!218314 () Bool)

(assert (=> b!303419 (=> (not res!249689) (not e!218314))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-fun lt!437790 () (_ BitVec 64))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!303419 (= res!249689 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!437790) (not (= fromSlice!52 toSlice!52))))))

(declare-fun b!303420 () Bool)

(declare-datatypes ((tuple4!1148 0))(
  ( (tuple4!1149 (_1!13229 (_ BitVec 32)) (_2!13229 (_ BitVec 32)) (_3!1531 (_ BitVec 32)) (_4!574 (_ BitVec 32))) )
))
(declare-fun lt!437787 () tuple4!1148)

(declare-datatypes ((array!18439 0))(
  ( (array!18440 (arr!9086 (Array (_ BitVec 32) (_ BitVec 8))) (size!8003 (_ BitVec 32))) )
))
(declare-fun a2!948 () array!18439)

(assert (=> b!303420 (= e!218314 (and (not (= (_3!1531 lt!437787) (_4!574 lt!437787))) (or (bvslt (_3!1531 lt!437787) #b00000000000000000000000000000000) (bvsge (_3!1531 lt!437787) (size!8003 a2!948)))))))

(declare-datatypes ((Unit!21190 0))(
  ( (Unit!21191) )
))
(declare-fun lt!437786 () Unit!21190)

(declare-fun e!218311 () Unit!21190)

(assert (=> b!303420 (= lt!437786 e!218311)))

(declare-fun c!14448 () Bool)

(declare-fun lt!437788 () tuple4!1148)

(assert (=> b!303420 (= c!14448 (bvslt (_1!13229 lt!437788) (_2!13229 lt!437788)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1148)

(assert (=> b!303420 (= lt!437788 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(assert (=> b!303420 (= lt!437787 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!303421 () Bool)

(declare-fun Unit!21192 () Unit!21190)

(assert (=> b!303421 (= e!218311 Unit!21192)))

(declare-fun b!303422 () Bool)

(declare-fun e!218312 () Bool)

(assert (=> b!303422 (= e!218312 e!218314)))

(declare-fun res!249690 () Bool)

(assert (=> b!303422 (=> (not res!249690) (not e!218314))))

(assert (=> b!303422 (= res!249690 (and (bvsle toBit!258 lt!437790) (bvsle fromBit!258 lt!437790)))))

(declare-fun a1!948 () array!18439)

(assert (=> b!303422 (= lt!437790 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8003 a1!948))))))

(declare-fun b!303423 () Bool)

(declare-fun res!249688 () Bool)

(assert (=> b!303423 (=> (not res!249688) (not e!218314))))

(declare-fun arrayBitRangesEq!0 (array!18439 array!18439 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!303423 (= res!249688 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!303424 () Bool)

(declare-fun lt!437789 () Unit!21190)

(assert (=> b!303424 (= e!218311 lt!437789)))

(declare-fun arrayRangesEqSlicedLemma!227 (array!18439 array!18439 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21190)

(assert (=> b!303424 (= lt!437789 (arrayRangesEqSlicedLemma!227 a1!948 a2!948 (_1!13229 lt!437787) (_2!13229 lt!437787) (_1!13229 lt!437788) (_2!13229 lt!437788)))))

(declare-fun arrayRangesEq!1632 (array!18439 array!18439 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!303424 (arrayRangesEq!1632 a1!948 a2!948 (_1!13229 lt!437788) (_2!13229 lt!437788))))

(declare-fun res!249687 () Bool)

(assert (=> start!67586 (=> (not res!249687) (not e!218312))))

(assert (=> start!67586 (= res!249687 (and (bvsle (size!8003 a1!948) (size!8003 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67586 e!218312))

(assert (=> start!67586 true))

(declare-fun array_inv!7615 (array!18439) Bool)

(assert (=> start!67586 (array_inv!7615 a1!948)))

(assert (=> start!67586 (array_inv!7615 a2!948)))

(assert (= (and start!67586 res!249687) b!303422))

(assert (= (and b!303422 res!249690) b!303423))

(assert (= (and b!303423 res!249688) b!303419))

(assert (= (and b!303419 res!249689) b!303420))

(assert (= (and b!303420 c!14448) b!303424))

(assert (= (and b!303420 (not c!14448)) b!303421))

(declare-fun m!442031 () Bool)

(assert (=> b!303420 m!442031))

(declare-fun m!442033 () Bool)

(assert (=> b!303420 m!442033))

(declare-fun m!442035 () Bool)

(assert (=> b!303423 m!442035))

(declare-fun m!442037 () Bool)

(assert (=> b!303424 m!442037))

(declare-fun m!442039 () Bool)

(assert (=> b!303424 m!442039))

(declare-fun m!442041 () Bool)

(assert (=> start!67586 m!442041))

(declare-fun m!442043 () Bool)

(assert (=> start!67586 m!442043))

(check-sat (not start!67586) (not b!303420) (not b!303424) (not b!303423))
(check-sat)
(get-model)

(declare-fun d!101354 () Bool)

(assert (=> d!101354 (= (array_inv!7615 a1!948) (bvsge (size!8003 a1!948) #b00000000000000000000000000000000))))

(assert (=> start!67586 d!101354))

(declare-fun d!101356 () Bool)

(assert (=> d!101356 (= (array_inv!7615 a2!948) (bvsge (size!8003 a2!948) #b00000000000000000000000000000000))))

(assert (=> start!67586 d!101356))

(declare-fun d!101358 () Bool)

(assert (=> d!101358 (= (arrayBitIndices!0 fromSlice!52 toSlice!52) (tuple4!1149 ((_ extract 31 0) (bvadd (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!303420 d!101358))

(declare-fun d!101366 () Bool)

(assert (=> d!101366 (= (arrayBitIndices!0 fromBit!258 toBit!258) (tuple4!1149 ((_ extract 31 0) (bvadd (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!303420 d!101366))

(declare-fun d!101368 () Bool)

(assert (=> d!101368 (arrayRangesEq!1632 a1!948 a2!948 (_1!13229 lt!437788) (_2!13229 lt!437788))))

(declare-fun lt!437808 () Unit!21190)

(declare-fun choose!557 (array!18439 array!18439 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21190)

(assert (=> d!101368 (= lt!437808 (choose!557 a1!948 a2!948 (_1!13229 lt!437787) (_2!13229 lt!437787) (_1!13229 lt!437788) (_2!13229 lt!437788)))))

(assert (=> d!101368 (and (bvsle #b00000000000000000000000000000000 (_1!13229 lt!437787)) (bvsle (_1!13229 lt!437787) (_2!13229 lt!437787)))))

(assert (=> d!101368 (= (arrayRangesEqSlicedLemma!227 a1!948 a2!948 (_1!13229 lt!437787) (_2!13229 lt!437787) (_1!13229 lt!437788) (_2!13229 lt!437788)) lt!437808)))

(declare-fun bs!26139 () Bool)

(assert (= bs!26139 d!101368))

(assert (=> bs!26139 m!442039))

(declare-fun m!442059 () Bool)

(assert (=> bs!26139 m!442059))

(assert (=> b!303424 d!101368))

(declare-fun d!101372 () Bool)

(declare-fun res!249723 () Bool)

(declare-fun e!218352 () Bool)

(assert (=> d!101372 (=> res!249723 e!218352)))

(assert (=> d!101372 (= res!249723 (= (_1!13229 lt!437788) (_2!13229 lt!437788)))))

(assert (=> d!101372 (= (arrayRangesEq!1632 a1!948 a2!948 (_1!13229 lt!437788) (_2!13229 lt!437788)) e!218352)))

(declare-fun b!303467 () Bool)

(declare-fun e!218353 () Bool)

(assert (=> b!303467 (= e!218352 e!218353)))

(declare-fun res!249724 () Bool)

(assert (=> b!303467 (=> (not res!249724) (not e!218353))))

(assert (=> b!303467 (= res!249724 (= (select (arr!9086 a1!948) (_1!13229 lt!437788)) (select (arr!9086 a2!948) (_1!13229 lt!437788))))))

(declare-fun b!303468 () Bool)

(assert (=> b!303468 (= e!218353 (arrayRangesEq!1632 a1!948 a2!948 (bvadd (_1!13229 lt!437788) #b00000000000000000000000000000001) (_2!13229 lt!437788)))))

(assert (= (and d!101372 (not res!249723)) b!303467))

(assert (= (and b!303467 res!249724) b!303468))

(declare-fun m!442069 () Bool)

(assert (=> b!303467 m!442069))

(declare-fun m!442071 () Bool)

(assert (=> b!303467 m!442071))

(declare-fun m!442073 () Bool)

(assert (=> b!303468 m!442073))

(assert (=> b!303424 d!101372))

(declare-fun b!303510 () Bool)

(declare-fun e!218393 () Bool)

(declare-fun e!218392 () Bool)

(assert (=> b!303510 (= e!218393 e!218392)))

(declare-fun res!249757 () Bool)

(declare-fun call!5593 () Bool)

(assert (=> b!303510 (= res!249757 call!5593)))

(assert (=> b!303510 (=> (not res!249757) (not e!218392))))

(declare-fun b!303511 () Bool)

(declare-fun e!218395 () Bool)

(declare-fun e!218391 () Bool)

(assert (=> b!303511 (= e!218395 e!218391)))

(declare-fun res!249760 () Bool)

(assert (=> b!303511 (=> (not res!249760) (not e!218391))))

(declare-fun e!218390 () Bool)

(assert (=> b!303511 (= res!249760 e!218390)))

(declare-fun res!249758 () Bool)

(assert (=> b!303511 (=> res!249758 e!218390)))

(declare-fun lt!437838 () tuple4!1148)

(assert (=> b!303511 (= res!249758 (bvsge (_1!13229 lt!437838) (_2!13229 lt!437838)))))

(declare-fun lt!437836 () (_ BitVec 32))

(assert (=> b!303511 (= lt!437836 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!437837 () (_ BitVec 32))

(assert (=> b!303511 (= lt!437837 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!303511 (= lt!437838 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!303512 () Bool)

(assert (=> b!303512 (= e!218390 (arrayRangesEq!1632 a1!948 a2!948 (_1!13229 lt!437838) (_2!13229 lt!437838)))))

(declare-fun bm!5590 () Bool)

(declare-fun c!14459 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!5590 (= call!5593 (byteRangesEq!0 (select (arr!9086 a1!948) (_3!1531 lt!437838)) (select (arr!9086 a2!948) (_3!1531 lt!437838)) lt!437837 (ite c!14459 lt!437836 #b00000000000000000000000000001000)))))

(declare-fun b!303513 () Bool)

(assert (=> b!303513 (= e!218391 e!218393)))

(assert (=> b!303513 (= c!14459 (= (_3!1531 lt!437838) (_4!574 lt!437838)))))

(declare-fun b!303514 () Bool)

(declare-fun res!249759 () Bool)

(assert (=> b!303514 (= res!249759 (= lt!437836 #b00000000000000000000000000000000))))

(declare-fun e!218394 () Bool)

(assert (=> b!303514 (=> res!249759 e!218394)))

(assert (=> b!303514 (= e!218392 e!218394)))

(declare-fun d!101378 () Bool)

(declare-fun res!249756 () Bool)

(assert (=> d!101378 (=> res!249756 e!218395)))

(assert (=> d!101378 (= res!249756 (bvsge fromBit!258 toBit!258))))

(assert (=> d!101378 (= (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258) e!218395)))

(declare-fun b!303515 () Bool)

(assert (=> b!303515 (= e!218393 call!5593)))

(declare-fun b!303516 () Bool)

(assert (=> b!303516 (= e!218394 (byteRangesEq!0 (select (arr!9086 a1!948) (_4!574 lt!437838)) (select (arr!9086 a2!948) (_4!574 lt!437838)) #b00000000000000000000000000000000 lt!437836))))

(assert (= (and d!101378 (not res!249756)) b!303511))

(assert (= (and b!303511 (not res!249758)) b!303512))

(assert (= (and b!303511 res!249760) b!303513))

(assert (= (and b!303513 c!14459) b!303515))

(assert (= (and b!303513 (not c!14459)) b!303510))

(assert (= (and b!303510 res!249757) b!303514))

(assert (= (and b!303514 (not res!249759)) b!303516))

(assert (= (or b!303515 b!303510) bm!5590))

(assert (=> b!303511 m!442033))

(declare-fun m!442097 () Bool)

(assert (=> b!303512 m!442097))

(declare-fun m!442099 () Bool)

(assert (=> bm!5590 m!442099))

(declare-fun m!442101 () Bool)

(assert (=> bm!5590 m!442101))

(assert (=> bm!5590 m!442099))

(assert (=> bm!5590 m!442101))

(declare-fun m!442103 () Bool)

(assert (=> bm!5590 m!442103))

(declare-fun m!442105 () Bool)

(assert (=> b!303516 m!442105))

(declare-fun m!442107 () Bool)

(assert (=> b!303516 m!442107))

(assert (=> b!303516 m!442105))

(assert (=> b!303516 m!442107))

(declare-fun m!442109 () Bool)

(assert (=> b!303516 m!442109))

(assert (=> b!303423 d!101378))

(check-sat (not b!303516) (not d!101368) (not b!303512) (not bm!5590) (not b!303511) (not b!303468))
(check-sat)
