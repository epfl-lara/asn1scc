; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69696 () Bool)

(assert start!69696)

(declare-fun res!256661 () Bool)

(declare-fun e!225658 () Bool)

(assert (=> start!69696 (=> (not res!256661) (not e!225658))))

(declare-fun mid!77 () (_ BitVec 64))

(declare-fun to!837 () (_ BitVec 64))

(declare-datatypes ((array!19269 0))(
  ( (array!19270 (arr!9440 (Array (_ BitVec 32) (_ BitVec 8))) (size!8360 (_ BitVec 32))) )
))
(declare-fun a1!799 () array!19269)

(declare-fun a2!799 () array!19269)

(declare-fun a3!74 () array!19269)

(declare-fun from!870 () (_ BitVec 64))

(assert (=> start!69696 (= res!256661 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!870) (bvsle from!870 mid!77) (bvsle mid!77 to!837) (= (size!8360 a1!799) (size!8360 a2!799)) (= (size!8360 a2!799) (size!8360 a3!74)) (bvsle mid!77 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8360 a1!799)))) (bvsle to!837 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8360 a2!799))))))))

(assert (=> start!69696 e!225658))

(assert (=> start!69696 true))

(declare-fun array_inv!7912 (array!19269) Bool)

(assert (=> start!69696 (array_inv!7912 a1!799)))

(assert (=> start!69696 (array_inv!7912 a2!799)))

(assert (=> start!69696 (array_inv!7912 a3!74)))

(declare-fun b!313483 () Bool)

(declare-fun res!256659 () Bool)

(assert (=> b!313483 (=> (not res!256659) (not e!225658))))

(declare-fun arrayBitRangesEq!0 (array!19269 array!19269 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!313483 (= res!256659 (arrayBitRangesEq!0 a1!799 a2!799 from!870 mid!77))))

(declare-fun b!313484 () Bool)

(declare-fun res!256660 () Bool)

(assert (=> b!313484 (=> (not res!256660) (not e!225658))))

(assert (=> b!313484 (= res!256660 (arrayBitRangesEq!0 a2!799 a3!74 from!870 to!837))))

(declare-fun b!313485 () Bool)

(assert (=> b!313485 (= e!225658 (not (arrayBitRangesEq!0 a1!799 a3!74 from!870 from!870)))))

(assert (= (and start!69696 res!256661) b!313483))

(assert (= (and b!313483 res!256659) b!313484))

(assert (= (and b!313484 res!256660) b!313485))

(declare-fun m!451079 () Bool)

(assert (=> start!69696 m!451079))

(declare-fun m!451081 () Bool)

(assert (=> start!69696 m!451081))

(declare-fun m!451083 () Bool)

(assert (=> start!69696 m!451083))

(declare-fun m!451085 () Bool)

(assert (=> b!313483 m!451085))

(declare-fun m!451087 () Bool)

(assert (=> b!313484 m!451087))

(declare-fun m!451089 () Bool)

(assert (=> b!313485 m!451089))

(check-sat (not start!69696) (not b!313485) (not b!313484) (not b!313483))
(check-sat)
(get-model)

(declare-fun d!103872 () Bool)

(assert (=> d!103872 (= (array_inv!7912 a1!799) (bvsge (size!8360 a1!799) #b00000000000000000000000000000000))))

(assert (=> start!69696 d!103872))

(declare-fun d!103874 () Bool)

(assert (=> d!103874 (= (array_inv!7912 a2!799) (bvsge (size!8360 a2!799) #b00000000000000000000000000000000))))

(assert (=> start!69696 d!103874))

(declare-fun d!103876 () Bool)

(assert (=> d!103876 (= (array_inv!7912 a3!74) (bvsge (size!8360 a3!74) #b00000000000000000000000000000000))))

(assert (=> start!69696 d!103876))

(declare-fun b!313509 () Bool)

(declare-fun e!225688 () Bool)

(declare-fun call!5918 () Bool)

(assert (=> b!313509 (= e!225688 call!5918)))

(declare-fun b!313510 () Bool)

(declare-fun e!225687 () Bool)

(assert (=> b!313510 (= e!225688 e!225687)))

(declare-fun res!256681 () Bool)

(assert (=> b!313510 (= res!256681 call!5918)))

(assert (=> b!313510 (=> (not res!256681) (not e!225687))))

(declare-fun c!15199 () Bool)

(declare-fun lt!442293 () (_ BitVec 32))

(declare-fun bm!5915 () Bool)

(declare-fun lt!442294 () (_ BitVec 32))

(declare-datatypes ((tuple4!1272 0))(
  ( (tuple4!1273 (_1!13315 (_ BitVec 32)) (_2!13315 (_ BitVec 32)) (_3!1593 (_ BitVec 32)) (_4!636 (_ BitVec 32))) )
))
(declare-fun lt!442295 () tuple4!1272)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!5915 (= call!5918 (byteRangesEq!0 (select (arr!9440 a1!799) (_3!1593 lt!442295)) (select (arr!9440 a3!74) (_3!1593 lt!442295)) lt!442293 (ite c!15199 lt!442294 #b00000000000000000000000000001000)))))

(declare-fun b!313511 () Bool)

(declare-fun e!225689 () Bool)

(declare-fun e!225691 () Bool)

(assert (=> b!313511 (= e!225689 e!225691)))

(declare-fun res!256683 () Bool)

(assert (=> b!313511 (=> (not res!256683) (not e!225691))))

(declare-fun e!225690 () Bool)

(assert (=> b!313511 (= res!256683 e!225690)))

(declare-fun res!256685 () Bool)

(assert (=> b!313511 (=> res!256685 e!225690)))

(assert (=> b!313511 (= res!256685 (bvsge (_1!13315 lt!442295) (_2!13315 lt!442295)))))

(assert (=> b!313511 (= lt!442294 ((_ extract 31 0) (bvsrem from!870 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!313511 (= lt!442293 ((_ extract 31 0) (bvsrem from!870 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1272)

(assert (=> b!313511 (= lt!442295 (arrayBitIndices!0 from!870 from!870))))

(declare-fun b!313512 () Bool)

(declare-fun res!256684 () Bool)

(assert (=> b!313512 (= res!256684 (= lt!442294 #b00000000000000000000000000000000))))

(declare-fun e!225686 () Bool)

(assert (=> b!313512 (=> res!256684 e!225686)))

(assert (=> b!313512 (= e!225687 e!225686)))

(declare-fun b!313513 () Bool)

(assert (=> b!313513 (= e!225686 (byteRangesEq!0 (select (arr!9440 a1!799) (_4!636 lt!442295)) (select (arr!9440 a3!74) (_4!636 lt!442295)) #b00000000000000000000000000000000 lt!442294))))

(declare-fun d!103878 () Bool)

(declare-fun res!256682 () Bool)

(assert (=> d!103878 (=> res!256682 e!225689)))

(assert (=> d!103878 (= res!256682 (bvsge from!870 from!870))))

(assert (=> d!103878 (= (arrayBitRangesEq!0 a1!799 a3!74 from!870 from!870) e!225689)))

(declare-fun b!313514 () Bool)

(assert (=> b!313514 (= e!225691 e!225688)))

(assert (=> b!313514 (= c!15199 (= (_3!1593 lt!442295) (_4!636 lt!442295)))))

(declare-fun b!313515 () Bool)

(declare-fun arrayRangesEq!1790 (array!19269 array!19269 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!313515 (= e!225690 (arrayRangesEq!1790 a1!799 a3!74 (_1!13315 lt!442295) (_2!13315 lt!442295)))))

(assert (= (and d!103878 (not res!256682)) b!313511))

(assert (= (and b!313511 (not res!256685)) b!313515))

(assert (= (and b!313511 res!256683) b!313514))

(assert (= (and b!313514 c!15199) b!313509))

(assert (= (and b!313514 (not c!15199)) b!313510))

(assert (= (and b!313510 res!256681) b!313512))

(assert (= (and b!313512 (not res!256684)) b!313513))

(assert (= (or b!313509 b!313510) bm!5915))

(declare-fun m!451103 () Bool)

(assert (=> bm!5915 m!451103))

(declare-fun m!451105 () Bool)

(assert (=> bm!5915 m!451105))

(assert (=> bm!5915 m!451103))

(assert (=> bm!5915 m!451105))

(declare-fun m!451107 () Bool)

(assert (=> bm!5915 m!451107))

(declare-fun m!451109 () Bool)

(assert (=> b!313511 m!451109))

(declare-fun m!451111 () Bool)

(assert (=> b!313513 m!451111))

(declare-fun m!451113 () Bool)

(assert (=> b!313513 m!451113))

(assert (=> b!313513 m!451111))

(assert (=> b!313513 m!451113))

(declare-fun m!451115 () Bool)

(assert (=> b!313513 m!451115))

(declare-fun m!451117 () Bool)

(assert (=> b!313515 m!451117))

(assert (=> b!313485 d!103878))

(declare-fun b!313530 () Bool)

(declare-fun e!225706 () Bool)

(declare-fun call!5919 () Bool)

(assert (=> b!313530 (= e!225706 call!5919)))

(declare-fun b!313531 () Bool)

(declare-fun e!225705 () Bool)

(assert (=> b!313531 (= e!225706 e!225705)))

(declare-fun res!256696 () Bool)

(assert (=> b!313531 (= res!256696 call!5919)))

(assert (=> b!313531 (=> (not res!256696) (not e!225705))))

(declare-fun bm!5916 () Bool)

(declare-fun lt!442302 () (_ BitVec 32))

(declare-fun lt!442303 () (_ BitVec 32))

(declare-fun c!15202 () Bool)

(declare-fun lt!442304 () tuple4!1272)

(assert (=> bm!5916 (= call!5919 (byteRangesEq!0 (select (arr!9440 a2!799) (_3!1593 lt!442304)) (select (arr!9440 a3!74) (_3!1593 lt!442304)) lt!442302 (ite c!15202 lt!442303 #b00000000000000000000000000001000)))))

(declare-fun b!313532 () Bool)

(declare-fun e!225707 () Bool)

(declare-fun e!225709 () Bool)

(assert (=> b!313532 (= e!225707 e!225709)))

(declare-fun res!256698 () Bool)

(assert (=> b!313532 (=> (not res!256698) (not e!225709))))

(declare-fun e!225708 () Bool)

(assert (=> b!313532 (= res!256698 e!225708)))

(declare-fun res!256700 () Bool)

(assert (=> b!313532 (=> res!256700 e!225708)))

(assert (=> b!313532 (= res!256700 (bvsge (_1!13315 lt!442304) (_2!13315 lt!442304)))))

(assert (=> b!313532 (= lt!442303 ((_ extract 31 0) (bvsrem to!837 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!313532 (= lt!442302 ((_ extract 31 0) (bvsrem from!870 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!313532 (= lt!442304 (arrayBitIndices!0 from!870 to!837))))

(declare-fun b!313533 () Bool)

(declare-fun res!256699 () Bool)

(assert (=> b!313533 (= res!256699 (= lt!442303 #b00000000000000000000000000000000))))

(declare-fun e!225704 () Bool)

(assert (=> b!313533 (=> res!256699 e!225704)))

(assert (=> b!313533 (= e!225705 e!225704)))

(declare-fun b!313534 () Bool)

(assert (=> b!313534 (= e!225704 (byteRangesEq!0 (select (arr!9440 a2!799) (_4!636 lt!442304)) (select (arr!9440 a3!74) (_4!636 lt!442304)) #b00000000000000000000000000000000 lt!442303))))

(declare-fun d!103884 () Bool)

(declare-fun res!256697 () Bool)

(assert (=> d!103884 (=> res!256697 e!225707)))

(assert (=> d!103884 (= res!256697 (bvsge from!870 to!837))))

(assert (=> d!103884 (= (arrayBitRangesEq!0 a2!799 a3!74 from!870 to!837) e!225707)))

(declare-fun b!313535 () Bool)

(assert (=> b!313535 (= e!225709 e!225706)))

(assert (=> b!313535 (= c!15202 (= (_3!1593 lt!442304) (_4!636 lt!442304)))))

(declare-fun b!313536 () Bool)

(assert (=> b!313536 (= e!225708 (arrayRangesEq!1790 a2!799 a3!74 (_1!13315 lt!442304) (_2!13315 lt!442304)))))

(assert (= (and d!103884 (not res!256697)) b!313532))

(assert (= (and b!313532 (not res!256700)) b!313536))

(assert (= (and b!313532 res!256698) b!313535))

(assert (= (and b!313535 c!15202) b!313530))

(assert (= (and b!313535 (not c!15202)) b!313531))

(assert (= (and b!313531 res!256696) b!313533))

(assert (= (and b!313533 (not res!256699)) b!313534))

(assert (= (or b!313530 b!313531) bm!5916))

(declare-fun m!451119 () Bool)

(assert (=> bm!5916 m!451119))

(declare-fun m!451121 () Bool)

(assert (=> bm!5916 m!451121))

(assert (=> bm!5916 m!451119))

(assert (=> bm!5916 m!451121))

(declare-fun m!451123 () Bool)

(assert (=> bm!5916 m!451123))

(declare-fun m!451125 () Bool)

(assert (=> b!313532 m!451125))

(declare-fun m!451127 () Bool)

(assert (=> b!313534 m!451127))

(declare-fun m!451129 () Bool)

(assert (=> b!313534 m!451129))

(assert (=> b!313534 m!451127))

(assert (=> b!313534 m!451129))

(declare-fun m!451131 () Bool)

(assert (=> b!313534 m!451131))

(declare-fun m!451133 () Bool)

(assert (=> b!313536 m!451133))

(assert (=> b!313484 d!103884))

(declare-fun b!313537 () Bool)

(declare-fun e!225712 () Bool)

(declare-fun call!5922 () Bool)

(assert (=> b!313537 (= e!225712 call!5922)))

(declare-fun b!313538 () Bool)

(declare-fun e!225711 () Bool)

(assert (=> b!313538 (= e!225712 e!225711)))

(declare-fun res!256701 () Bool)

(assert (=> b!313538 (= res!256701 call!5922)))

(assert (=> b!313538 (=> (not res!256701) (not e!225711))))

(declare-fun lt!442306 () (_ BitVec 32))

(declare-fun lt!442307 () tuple4!1272)

(declare-fun c!15203 () Bool)

(declare-fun lt!442305 () (_ BitVec 32))

(declare-fun bm!5919 () Bool)

(assert (=> bm!5919 (= call!5922 (byteRangesEq!0 (select (arr!9440 a1!799) (_3!1593 lt!442307)) (select (arr!9440 a2!799) (_3!1593 lt!442307)) lt!442305 (ite c!15203 lt!442306 #b00000000000000000000000000001000)))))

(declare-fun b!313539 () Bool)

(declare-fun e!225713 () Bool)

(declare-fun e!225715 () Bool)

(assert (=> b!313539 (= e!225713 e!225715)))

(declare-fun res!256703 () Bool)

(assert (=> b!313539 (=> (not res!256703) (not e!225715))))

(declare-fun e!225714 () Bool)

(assert (=> b!313539 (= res!256703 e!225714)))

(declare-fun res!256705 () Bool)

(assert (=> b!313539 (=> res!256705 e!225714)))

(assert (=> b!313539 (= res!256705 (bvsge (_1!13315 lt!442307) (_2!13315 lt!442307)))))

(assert (=> b!313539 (= lt!442306 ((_ extract 31 0) (bvsrem mid!77 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!313539 (= lt!442305 ((_ extract 31 0) (bvsrem from!870 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!313539 (= lt!442307 (arrayBitIndices!0 from!870 mid!77))))

(declare-fun b!313540 () Bool)

(declare-fun res!256704 () Bool)

(assert (=> b!313540 (= res!256704 (= lt!442306 #b00000000000000000000000000000000))))

(declare-fun e!225710 () Bool)

(assert (=> b!313540 (=> res!256704 e!225710)))

(assert (=> b!313540 (= e!225711 e!225710)))

(declare-fun b!313541 () Bool)

(assert (=> b!313541 (= e!225710 (byteRangesEq!0 (select (arr!9440 a1!799) (_4!636 lt!442307)) (select (arr!9440 a2!799) (_4!636 lt!442307)) #b00000000000000000000000000000000 lt!442306))))

(declare-fun d!103886 () Bool)

(declare-fun res!256702 () Bool)

(assert (=> d!103886 (=> res!256702 e!225713)))

(assert (=> d!103886 (= res!256702 (bvsge from!870 mid!77))))

(assert (=> d!103886 (= (arrayBitRangesEq!0 a1!799 a2!799 from!870 mid!77) e!225713)))

(declare-fun b!313542 () Bool)

(assert (=> b!313542 (= e!225715 e!225712)))

(assert (=> b!313542 (= c!15203 (= (_3!1593 lt!442307) (_4!636 lt!442307)))))

(declare-fun b!313543 () Bool)

(assert (=> b!313543 (= e!225714 (arrayRangesEq!1790 a1!799 a2!799 (_1!13315 lt!442307) (_2!13315 lt!442307)))))

(assert (= (and d!103886 (not res!256702)) b!313539))

(assert (= (and b!313539 (not res!256705)) b!313543))

(assert (= (and b!313539 res!256703) b!313542))

(assert (= (and b!313542 c!15203) b!313537))

(assert (= (and b!313542 (not c!15203)) b!313538))

(assert (= (and b!313538 res!256701) b!313540))

(assert (= (and b!313540 (not res!256704)) b!313541))

(assert (= (or b!313537 b!313538) bm!5919))

(declare-fun m!451135 () Bool)

(assert (=> bm!5919 m!451135))

(declare-fun m!451137 () Bool)

(assert (=> bm!5919 m!451137))

(assert (=> bm!5919 m!451135))

(assert (=> bm!5919 m!451137))

(declare-fun m!451139 () Bool)

(assert (=> bm!5919 m!451139))

(declare-fun m!451141 () Bool)

(assert (=> b!313539 m!451141))

(declare-fun m!451143 () Bool)

(assert (=> b!313541 m!451143))

(declare-fun m!451145 () Bool)

(assert (=> b!313541 m!451145))

(assert (=> b!313541 m!451143))

(assert (=> b!313541 m!451145))

(declare-fun m!451147 () Bool)

(assert (=> b!313541 m!451147))

(declare-fun m!451149 () Bool)

(assert (=> b!313543 m!451149))

(assert (=> b!313483 d!103886))

(check-sat (not b!313541) (not b!313532) (not b!313539) (not b!313513) (not b!313543) (not bm!5919) (not b!313511) (not b!313536) (not b!313515) (not bm!5915) (not bm!5916) (not b!313534))
(check-sat)
