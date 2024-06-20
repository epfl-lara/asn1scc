; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62474 () Bool)

(assert start!62474)

(declare-fun b!279997 () Bool)

(declare-fun res!232441 () Bool)

(declare-fun e!199697 () Bool)

(assert (=> b!279997 (=> (not res!232441) (not e!199697))))

(declare-fun from!822 () (_ BitVec 64))

(declare-fun to!789 () (_ BitVec 64))

(assert (=> b!279997 (= res!232441 (bvslt from!822 to!789))))

(declare-fun b!279998 () Bool)

(declare-fun e!199698 () Bool)

(assert (=> b!279998 (= e!199697 e!199698)))

(declare-fun res!232442 () Bool)

(assert (=> b!279998 (=> (not res!232442) (not e!199698))))

(declare-datatypes ((tuple4!734 0))(
  ( (tuple4!735 (_1!12442 (_ BitVec 32)) (_2!12442 (_ BitVec 32)) (_3!1147 (_ BitVec 32)) (_4!367 (_ BitVec 32))) )
))
(declare-fun lt!416651 () tuple4!734)

(assert (=> b!279998 (= res!232442 (= (_3!1147 lt!416651) (_4!367 lt!416651)))))

(declare-datatypes ((Unit!19633 0))(
  ( (Unit!19634) )
))
(declare-fun lt!416648 () Unit!19633)

(declare-fun e!199696 () Unit!19633)

(assert (=> b!279998 (= lt!416648 e!199696)))

(declare-fun c!12951 () Bool)

(assert (=> b!279998 (= c!12951 (bvslt (_1!12442 lt!416651) (_2!12442 lt!416651)))))

(declare-fun lt!416652 () (_ BitVec 32))

(assert (=> b!279998 (= lt!416652 ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!416650 () (_ BitVec 32))

(assert (=> b!279998 (= lt!416650 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!734)

(assert (=> b!279998 (= lt!416651 (arrayBitIndices!0 from!822 to!789))))

(declare-fun res!232439 () Bool)

(assert (=> start!62474 (=> (not res!232439) (not e!199697))))

(declare-datatypes ((array!16167 0))(
  ( (array!16168 (arr!7988 (Array (_ BitVec 32) (_ BitVec 8))) (size!6992 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!16167)

(declare-fun a2!699 () array!16167)

(assert (=> start!62474 (= res!232439 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6992 a1!699) (size!6992 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6992 a1!699))))))))

(assert (=> start!62474 e!199697))

(assert (=> start!62474 true))

(declare-fun array_inv!6716 (array!16167) Bool)

(assert (=> start!62474 (array_inv!6716 a1!699)))

(assert (=> start!62474 (array_inv!6716 a2!699)))

(declare-fun e!199695 () Bool)

(declare-fun b!279999 () Bool)

(declare-fun arrayBitRangesEq!0 (array!16167 array!16167 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!279999 (= e!199695 (arrayBitRangesEq!0 a2!699 a1!699 from!822 to!789))))

(declare-fun b!280000 () Bool)

(declare-fun Unit!19635 () Unit!19633)

(assert (=> b!280000 (= e!199696 Unit!19635)))

(declare-fun arrayRangesEq!1260 (array!16167 array!16167 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!280000 (arrayRangesEq!1260 a1!699 a2!699 (_1!12442 lt!416651) (_2!12442 lt!416651))))

(declare-fun lt!416649 () Unit!19633)

(declare-fun arrayRangesEqSymmetricLemma!167 (array!16167 array!16167 (_ BitVec 32) (_ BitVec 32)) Unit!19633)

(assert (=> b!280000 (= lt!416649 (arrayRangesEqSymmetricLemma!167 a1!699 a2!699 (_1!12442 lt!416651) (_2!12442 lt!416651)))))

(assert (=> b!280000 (arrayRangesEq!1260 a2!699 a1!699 (_1!12442 lt!416651) (_2!12442 lt!416651))))

(declare-fun b!280001 () Bool)

(declare-fun res!232440 () Bool)

(assert (=> b!280001 (=> (not res!232440) (not e!199697))))

(assert (=> b!280001 (= res!232440 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun b!280002 () Bool)

(assert (=> b!280002 (= e!199698 (not e!199695))))

(declare-fun res!232438 () Bool)

(assert (=> b!280002 (=> res!232438 e!199695)))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!280002 (= res!232438 (not (byteRangesEq!0 (select (arr!7988 a2!699) (_3!1147 lt!416651)) (select (arr!7988 a1!699) (_3!1147 lt!416651)) lt!416650 lt!416652)))))

(assert (=> b!280002 (byteRangesEq!0 (select (arr!7988 a1!699) (_3!1147 lt!416651)) (select (arr!7988 a2!699) (_3!1147 lt!416651)) lt!416650 lt!416652)))

(declare-fun b!280003 () Bool)

(declare-fun Unit!19636 () Unit!19633)

(assert (=> b!280003 (= e!199696 Unit!19636)))

(assert (= (and start!62474 res!232439) b!280001))

(assert (= (and b!280001 res!232440) b!279997))

(assert (= (and b!279997 res!232441) b!279998))

(assert (= (and b!279998 c!12951) b!280000))

(assert (= (and b!279998 (not c!12951)) b!280003))

(assert (= (and b!279998 res!232442) b!280002))

(assert (= (and b!280002 (not res!232438)) b!279999))

(declare-fun m!413013 () Bool)

(assert (=> b!280000 m!413013))

(declare-fun m!413015 () Bool)

(assert (=> b!280000 m!413015))

(declare-fun m!413017 () Bool)

(assert (=> b!280000 m!413017))

(declare-fun m!413019 () Bool)

(assert (=> b!280001 m!413019))

(declare-fun m!413021 () Bool)

(assert (=> b!279999 m!413021))

(declare-fun m!413023 () Bool)

(assert (=> start!62474 m!413023))

(declare-fun m!413025 () Bool)

(assert (=> start!62474 m!413025))

(declare-fun m!413027 () Bool)

(assert (=> b!279998 m!413027))

(declare-fun m!413029 () Bool)

(assert (=> b!280002 m!413029))

(declare-fun m!413031 () Bool)

(assert (=> b!280002 m!413031))

(assert (=> b!280002 m!413029))

(assert (=> b!280002 m!413031))

(declare-fun m!413033 () Bool)

(assert (=> b!280002 m!413033))

(assert (=> b!280002 m!413031))

(assert (=> b!280002 m!413029))

(declare-fun m!413035 () Bool)

(assert (=> b!280002 m!413035))

(check-sat (not b!280002) (not b!279999) (not b!280001) (not start!62474) (not b!280000) (not b!279998))
(check-sat)
(get-model)

(declare-fun d!96294 () Bool)

(declare-fun res!232462 () Bool)

(declare-fun e!199721 () Bool)

(assert (=> d!96294 (=> res!232462 e!199721)))

(assert (=> d!96294 (= res!232462 (= (_1!12442 lt!416651) (_2!12442 lt!416651)))))

(assert (=> d!96294 (= (arrayRangesEq!1260 a1!699 a2!699 (_1!12442 lt!416651) (_2!12442 lt!416651)) e!199721)))

(declare-fun b!280029 () Bool)

(declare-fun e!199722 () Bool)

(assert (=> b!280029 (= e!199721 e!199722)))

(declare-fun res!232463 () Bool)

(assert (=> b!280029 (=> (not res!232463) (not e!199722))))

(assert (=> b!280029 (= res!232463 (= (select (arr!7988 a1!699) (_1!12442 lt!416651)) (select (arr!7988 a2!699) (_1!12442 lt!416651))))))

(declare-fun b!280030 () Bool)

(assert (=> b!280030 (= e!199722 (arrayRangesEq!1260 a1!699 a2!699 (bvadd (_1!12442 lt!416651) #b00000000000000000000000000000001) (_2!12442 lt!416651)))))

(assert (= (and d!96294 (not res!232462)) b!280029))

(assert (= (and b!280029 res!232463) b!280030))

(declare-fun m!413061 () Bool)

(assert (=> b!280029 m!413061))

(declare-fun m!413063 () Bool)

(assert (=> b!280029 m!413063))

(declare-fun m!413065 () Bool)

(assert (=> b!280030 m!413065))

(assert (=> b!280000 d!96294))

(declare-fun d!96296 () Bool)

(assert (=> d!96296 (arrayRangesEq!1260 a2!699 a1!699 (_1!12442 lt!416651) (_2!12442 lt!416651))))

(declare-fun lt!416670 () Unit!19633)

(declare-fun choose!474 (array!16167 array!16167 (_ BitVec 32) (_ BitVec 32)) Unit!19633)

(assert (=> d!96296 (= lt!416670 (choose!474 a1!699 a2!699 (_1!12442 lt!416651) (_2!12442 lt!416651)))))

(assert (=> d!96296 (and (bvsle #b00000000000000000000000000000000 (_1!12442 lt!416651)) (bvsle (_1!12442 lt!416651) (_2!12442 lt!416651)) (bvsle (_2!12442 lt!416651) (size!6992 a1!699)))))

(assert (=> d!96296 (= (arrayRangesEqSymmetricLemma!167 a1!699 a2!699 (_1!12442 lt!416651) (_2!12442 lt!416651)) lt!416670)))

(declare-fun bs!24290 () Bool)

(assert (= bs!24290 d!96296))

(assert (=> bs!24290 m!413017))

(declare-fun m!413067 () Bool)

(assert (=> bs!24290 m!413067))

(assert (=> b!280000 d!96296))

(declare-fun d!96298 () Bool)

(declare-fun res!232464 () Bool)

(declare-fun e!199723 () Bool)

(assert (=> d!96298 (=> res!232464 e!199723)))

(assert (=> d!96298 (= res!232464 (= (_1!12442 lt!416651) (_2!12442 lt!416651)))))

(assert (=> d!96298 (= (arrayRangesEq!1260 a2!699 a1!699 (_1!12442 lt!416651) (_2!12442 lt!416651)) e!199723)))

(declare-fun b!280031 () Bool)

(declare-fun e!199724 () Bool)

(assert (=> b!280031 (= e!199723 e!199724)))

(declare-fun res!232465 () Bool)

(assert (=> b!280031 (=> (not res!232465) (not e!199724))))

(assert (=> b!280031 (= res!232465 (= (select (arr!7988 a2!699) (_1!12442 lt!416651)) (select (arr!7988 a1!699) (_1!12442 lt!416651))))))

(declare-fun b!280032 () Bool)

(assert (=> b!280032 (= e!199724 (arrayRangesEq!1260 a2!699 a1!699 (bvadd (_1!12442 lt!416651) #b00000000000000000000000000000001) (_2!12442 lt!416651)))))

(assert (= (and d!96298 (not res!232464)) b!280031))

(assert (= (and b!280031 res!232465) b!280032))

(assert (=> b!280031 m!413063))

(assert (=> b!280031 m!413061))

(declare-fun m!413069 () Bool)

(assert (=> b!280032 m!413069))

(assert (=> b!280000 d!96298))

(declare-fun d!96300 () Bool)

(assert (=> d!96300 (= (array_inv!6716 a1!699) (bvsge (size!6992 a1!699) #b00000000000000000000000000000000))))

(assert (=> start!62474 d!96300))

(declare-fun d!96302 () Bool)

(assert (=> d!96302 (= (array_inv!6716 a2!699) (bvsge (size!6992 a2!699) #b00000000000000000000000000000000))))

(assert (=> start!62474 d!96302))

(declare-fun b!280047 () Bool)

(declare-fun e!199740 () Bool)

(declare-fun e!199741 () Bool)

(assert (=> b!280047 (= e!199740 e!199741)))

(declare-fun res!232476 () Bool)

(assert (=> b!280047 (=> (not res!232476) (not e!199741))))

(declare-fun e!199738 () Bool)

(assert (=> b!280047 (= res!232476 e!199738)))

(declare-fun res!232480 () Bool)

(assert (=> b!280047 (=> res!232480 e!199738)))

(declare-fun lt!416677 () tuple4!734)

(assert (=> b!280047 (= res!232480 (bvsge (_1!12442 lt!416677) (_2!12442 lt!416677)))))

(declare-fun lt!416679 () (_ BitVec 32))

(assert (=> b!280047 (= lt!416679 ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!416678 () (_ BitVec 32))

(assert (=> b!280047 (= lt!416678 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!280047 (= lt!416677 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!280048 () Bool)

(declare-fun e!199739 () Bool)

(declare-fun call!4601 () Bool)

(assert (=> b!280048 (= e!199739 call!4601)))

(declare-fun c!12957 () Bool)

(declare-fun bm!4598 () Bool)

(assert (=> bm!4598 (= call!4601 (byteRangesEq!0 (ite c!12957 (select (arr!7988 a2!699) (_3!1147 lt!416677)) (select (arr!7988 a2!699) (_4!367 lt!416677))) (ite c!12957 (select (arr!7988 a1!699) (_3!1147 lt!416677)) (select (arr!7988 a1!699) (_4!367 lt!416677))) (ite c!12957 lt!416678 #b00000000000000000000000000000000) lt!416679))))

(declare-fun b!280050 () Bool)

(declare-fun e!199742 () Bool)

(assert (=> b!280050 (= e!199742 call!4601)))

(declare-fun b!280051 () Bool)

(assert (=> b!280051 (= e!199741 e!199739)))

(assert (=> b!280051 (= c!12957 (= (_3!1147 lt!416677) (_4!367 lt!416677)))))

(declare-fun b!280052 () Bool)

(declare-fun e!199737 () Bool)

(assert (=> b!280052 (= e!199739 e!199737)))

(declare-fun res!232478 () Bool)

(assert (=> b!280052 (= res!232478 (byteRangesEq!0 (select (arr!7988 a2!699) (_3!1147 lt!416677)) (select (arr!7988 a1!699) (_3!1147 lt!416677)) lt!416678 #b00000000000000000000000000001000))))

(assert (=> b!280052 (=> (not res!232478) (not e!199737))))

(declare-fun b!280053 () Bool)

(assert (=> b!280053 (= e!199738 (arrayRangesEq!1260 a2!699 a1!699 (_1!12442 lt!416677) (_2!12442 lt!416677)))))

(declare-fun d!96304 () Bool)

(declare-fun res!232479 () Bool)

(assert (=> d!96304 (=> res!232479 e!199740)))

(assert (=> d!96304 (= res!232479 (bvsge from!822 to!789))))

(assert (=> d!96304 (= (arrayBitRangesEq!0 a2!699 a1!699 from!822 to!789) e!199740)))

(declare-fun b!280049 () Bool)

(declare-fun res!232477 () Bool)

(assert (=> b!280049 (= res!232477 (= lt!416679 #b00000000000000000000000000000000))))

(assert (=> b!280049 (=> res!232477 e!199742)))

(assert (=> b!280049 (= e!199737 e!199742)))

(assert (= (and d!96304 (not res!232479)) b!280047))

(assert (= (and b!280047 (not res!232480)) b!280053))

(assert (= (and b!280047 res!232476) b!280051))

(assert (= (and b!280051 c!12957) b!280048))

(assert (= (and b!280051 (not c!12957)) b!280052))

(assert (= (and b!280052 res!232478) b!280049))

(assert (= (and b!280049 (not res!232477)) b!280050))

(assert (= (or b!280048 b!280050) bm!4598))

(assert (=> b!280047 m!413027))

(declare-fun m!413071 () Bool)

(assert (=> bm!4598 m!413071))

(declare-fun m!413073 () Bool)

(assert (=> bm!4598 m!413073))

(declare-fun m!413075 () Bool)

(assert (=> bm!4598 m!413075))

(declare-fun m!413077 () Bool)

(assert (=> bm!4598 m!413077))

(declare-fun m!413079 () Bool)

(assert (=> bm!4598 m!413079))

(assert (=> b!280052 m!413071))

(assert (=> b!280052 m!413077))

(assert (=> b!280052 m!413071))

(assert (=> b!280052 m!413077))

(declare-fun m!413081 () Bool)

(assert (=> b!280052 m!413081))

(declare-fun m!413083 () Bool)

(assert (=> b!280053 m!413083))

(assert (=> b!279999 d!96304))

(declare-fun d!96306 () Bool)

(assert (=> d!96306 (= (arrayBitIndices!0 from!822 to!789) (tuple4!735 ((_ extract 31 0) (bvadd (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!279998 d!96306))

(declare-fun b!280054 () Bool)

(declare-fun e!199746 () Bool)

(declare-fun e!199747 () Bool)

(assert (=> b!280054 (= e!199746 e!199747)))

(declare-fun res!232481 () Bool)

(assert (=> b!280054 (=> (not res!232481) (not e!199747))))

(declare-fun e!199744 () Bool)

(assert (=> b!280054 (= res!232481 e!199744)))

(declare-fun res!232485 () Bool)

(assert (=> b!280054 (=> res!232485 e!199744)))

(declare-fun lt!416680 () tuple4!734)

(assert (=> b!280054 (= res!232485 (bvsge (_1!12442 lt!416680) (_2!12442 lt!416680)))))

(declare-fun lt!416682 () (_ BitVec 32))

(assert (=> b!280054 (= lt!416682 ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!416681 () (_ BitVec 32))

(assert (=> b!280054 (= lt!416681 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!280054 (= lt!416680 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!280055 () Bool)

(declare-fun e!199745 () Bool)

(declare-fun call!4602 () Bool)

(assert (=> b!280055 (= e!199745 call!4602)))

(declare-fun c!12958 () Bool)

(declare-fun bm!4599 () Bool)

(assert (=> bm!4599 (= call!4602 (byteRangesEq!0 (ite c!12958 (select (arr!7988 a1!699) (_3!1147 lt!416680)) (select (arr!7988 a1!699) (_4!367 lt!416680))) (ite c!12958 (select (arr!7988 a2!699) (_3!1147 lt!416680)) (select (arr!7988 a2!699) (_4!367 lt!416680))) (ite c!12958 lt!416681 #b00000000000000000000000000000000) lt!416682))))

(declare-fun b!280057 () Bool)

(declare-fun e!199748 () Bool)

(assert (=> b!280057 (= e!199748 call!4602)))

(declare-fun b!280058 () Bool)

(assert (=> b!280058 (= e!199747 e!199745)))

(assert (=> b!280058 (= c!12958 (= (_3!1147 lt!416680) (_4!367 lt!416680)))))

(declare-fun b!280059 () Bool)

(declare-fun e!199743 () Bool)

(assert (=> b!280059 (= e!199745 e!199743)))

(declare-fun res!232483 () Bool)

(assert (=> b!280059 (= res!232483 (byteRangesEq!0 (select (arr!7988 a1!699) (_3!1147 lt!416680)) (select (arr!7988 a2!699) (_3!1147 lt!416680)) lt!416681 #b00000000000000000000000000001000))))

(assert (=> b!280059 (=> (not res!232483) (not e!199743))))

(declare-fun b!280060 () Bool)

(assert (=> b!280060 (= e!199744 (arrayRangesEq!1260 a1!699 a2!699 (_1!12442 lt!416680) (_2!12442 lt!416680)))))

(declare-fun d!96308 () Bool)

(declare-fun res!232484 () Bool)

(assert (=> d!96308 (=> res!232484 e!199746)))

(assert (=> d!96308 (= res!232484 (bvsge from!822 to!789))))

(assert (=> d!96308 (= (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789) e!199746)))

(declare-fun b!280056 () Bool)

(declare-fun res!232482 () Bool)

(assert (=> b!280056 (= res!232482 (= lt!416682 #b00000000000000000000000000000000))))

(assert (=> b!280056 (=> res!232482 e!199748)))

(assert (=> b!280056 (= e!199743 e!199748)))

(assert (= (and d!96308 (not res!232484)) b!280054))

(assert (= (and b!280054 (not res!232485)) b!280060))

(assert (= (and b!280054 res!232481) b!280058))

(assert (= (and b!280058 c!12958) b!280055))

(assert (= (and b!280058 (not c!12958)) b!280059))

(assert (= (and b!280059 res!232483) b!280056))

(assert (= (and b!280056 (not res!232482)) b!280057))

(assert (= (or b!280055 b!280057) bm!4599))

(assert (=> b!280054 m!413027))

(declare-fun m!413085 () Bool)

(assert (=> bm!4599 m!413085))

(declare-fun m!413087 () Bool)

(assert (=> bm!4599 m!413087))

(declare-fun m!413089 () Bool)

(assert (=> bm!4599 m!413089))

(declare-fun m!413091 () Bool)

(assert (=> bm!4599 m!413091))

(declare-fun m!413093 () Bool)

(assert (=> bm!4599 m!413093))

(assert (=> b!280059 m!413085))

(assert (=> b!280059 m!413091))

(assert (=> b!280059 m!413085))

(assert (=> b!280059 m!413091))

(declare-fun m!413095 () Bool)

(assert (=> b!280059 m!413095))

(declare-fun m!413097 () Bool)

(assert (=> b!280060 m!413097))

(assert (=> b!280001 d!96308))

(declare-fun d!96310 () Bool)

(assert (=> d!96310 (= (byteRangesEq!0 (select (arr!7988 a2!699) (_3!1147 lt!416651)) (select (arr!7988 a1!699) (_3!1147 lt!416651)) lt!416650 lt!416652) (or (= lt!416650 lt!416652) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7988 a2!699) (_3!1147 lt!416651))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!416652))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!416650)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7988 a1!699) (_3!1147 lt!416651))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!416652))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!416650)))) #b00000000000000000000000011111111))))))

(declare-fun bs!24291 () Bool)

(assert (= bs!24291 d!96310))

(declare-fun m!413099 () Bool)

(assert (=> bs!24291 m!413099))

(declare-fun m!413101 () Bool)

(assert (=> bs!24291 m!413101))

(assert (=> b!280002 d!96310))

(declare-fun d!96312 () Bool)

(assert (=> d!96312 (= (byteRangesEq!0 (select (arr!7988 a1!699) (_3!1147 lt!416651)) (select (arr!7988 a2!699) (_3!1147 lt!416651)) lt!416650 lt!416652) (or (= lt!416650 lt!416652) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7988 a1!699) (_3!1147 lt!416651))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!416652))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!416650)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7988 a2!699) (_3!1147 lt!416651))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!416652))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!416650)))) #b00000000000000000000000011111111))))))

(declare-fun bs!24292 () Bool)

(assert (= bs!24292 d!96312))

(assert (=> bs!24292 m!413099))

(assert (=> bs!24292 m!413101))

(assert (=> b!280002 d!96312))

(check-sat (not bm!4598) (not b!280032) (not bm!4599) (not b!280053) (not b!280047) (not b!280054) (not b!280030) (not b!280052) (not d!96296) (not b!280059) (not b!280060))
(check-sat)
