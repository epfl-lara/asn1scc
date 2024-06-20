; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62514 () Bool)

(assert start!62514)

(declare-fun b!280143 () Bool)

(declare-fun e!199824 () Bool)

(declare-datatypes ((tuple4!738 0))(
  ( (tuple4!739 (_1!12444 (_ BitVec 32)) (_2!12444 (_ BitVec 32)) (_3!1149 (_ BitVec 32)) (_4!369 (_ BitVec 32))) )
))
(declare-fun lt!416721 () tuple4!738)

(declare-datatypes ((array!16174 0))(
  ( (array!16175 (arr!7990 (Array (_ BitVec 32) (_ BitVec 8))) (size!6994 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!16174)

(assert (=> b!280143 (= e!199824 (and (not (= (_3!1149 lt!416721) (_4!369 lt!416721))) (or (bvslt (_3!1149 lt!416721) #b00000000000000000000000000000000) (bvsge (_3!1149 lt!416721) (size!6994 a1!699)))))))

(declare-datatypes ((Unit!19641 0))(
  ( (Unit!19642) )
))
(declare-fun lt!416719 () Unit!19641)

(declare-fun e!199822 () Unit!19641)

(assert (=> b!280143 (= lt!416719 e!199822)))

(declare-fun c!12969 () Bool)

(assert (=> b!280143 (= c!12969 (bvslt (_1!12444 lt!416721) (_2!12444 lt!416721)))))

(declare-fun from!822 () (_ BitVec 64))

(declare-fun to!789 () (_ BitVec 64))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!738)

(assert (=> b!280143 (= lt!416721 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!280144 () Bool)

(declare-fun res!232550 () Bool)

(assert (=> b!280144 (=> (not res!232550) (not e!199824))))

(declare-fun a2!699 () array!16174)

(declare-fun arrayBitRangesEq!0 (array!16174 array!16174 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!280144 (= res!232550 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun b!280145 () Bool)

(declare-fun res!232549 () Bool)

(assert (=> b!280145 (=> (not res!232549) (not e!199824))))

(assert (=> b!280145 (= res!232549 (bvslt from!822 to!789))))

(declare-fun res!232548 () Bool)

(assert (=> start!62514 (=> (not res!232548) (not e!199824))))

(assert (=> start!62514 (= res!232548 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6994 a1!699) (size!6994 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6994 a1!699))))))))

(assert (=> start!62514 e!199824))

(assert (=> start!62514 true))

(declare-fun array_inv!6718 (array!16174) Bool)

(assert (=> start!62514 (array_inv!6718 a1!699)))

(assert (=> start!62514 (array_inv!6718 a2!699)))

(declare-fun b!280146 () Bool)

(declare-fun Unit!19643 () Unit!19641)

(assert (=> b!280146 (= e!199822 Unit!19643)))

(declare-fun b!280147 () Bool)

(declare-fun Unit!19644 () Unit!19641)

(assert (=> b!280147 (= e!199822 Unit!19644)))

(declare-fun arrayRangesEq!1262 (array!16174 array!16174 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!280147 (arrayRangesEq!1262 a1!699 a2!699 (_1!12444 lt!416721) (_2!12444 lt!416721))))

(declare-fun lt!416720 () Unit!19641)

(declare-fun arrayRangesEqSymmetricLemma!169 (array!16174 array!16174 (_ BitVec 32) (_ BitVec 32)) Unit!19641)

(assert (=> b!280147 (= lt!416720 (arrayRangesEqSymmetricLemma!169 a1!699 a2!699 (_1!12444 lt!416721) (_2!12444 lt!416721)))))

(assert (=> b!280147 (arrayRangesEq!1262 a2!699 a1!699 (_1!12444 lt!416721) (_2!12444 lt!416721))))

(assert (= (and start!62514 res!232548) b!280144))

(assert (= (and b!280144 res!232550) b!280145))

(assert (= (and b!280145 res!232549) b!280143))

(assert (= (and b!280143 c!12969) b!280147))

(assert (= (and b!280143 (not c!12969)) b!280146))

(declare-fun m!413187 () Bool)

(assert (=> b!280143 m!413187))

(declare-fun m!413189 () Bool)

(assert (=> b!280144 m!413189))

(declare-fun m!413191 () Bool)

(assert (=> start!62514 m!413191))

(declare-fun m!413193 () Bool)

(assert (=> start!62514 m!413193))

(declare-fun m!413195 () Bool)

(assert (=> b!280147 m!413195))

(declare-fun m!413197 () Bool)

(assert (=> b!280147 m!413197))

(declare-fun m!413199 () Bool)

(assert (=> b!280147 m!413199))

(push 1)

(assert (not b!280143))

(assert (not b!280147))

(assert (not start!62514))

(assert (not b!280144))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!96356 () Bool)

(assert (=> d!96356 (= (arrayBitIndices!0 from!822 to!789) (tuple4!739 ((_ extract 31 0) (bvadd (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!280143 d!96356))

(declare-fun d!96358 () Bool)

(declare-fun res!232573 () Bool)

(declare-fun e!199853 () Bool)

(assert (=> d!96358 (=> res!232573 e!199853)))

(assert (=> d!96358 (= res!232573 (= (_1!12444 lt!416721) (_2!12444 lt!416721)))))

(assert (=> d!96358 (= (arrayRangesEq!1262 a1!699 a2!699 (_1!12444 lt!416721) (_2!12444 lt!416721)) e!199853)))

(declare-fun b!280182 () Bool)

(declare-fun e!199854 () Bool)

(assert (=> b!280182 (= e!199853 e!199854)))

(declare-fun res!232574 () Bool)

(assert (=> b!280182 (=> (not res!232574) (not e!199854))))

(assert (=> b!280182 (= res!232574 (= (select (arr!7990 a1!699) (_1!12444 lt!416721)) (select (arr!7990 a2!699) (_1!12444 lt!416721))))))

(declare-fun b!280183 () Bool)

(assert (=> b!280183 (= e!199854 (arrayRangesEq!1262 a1!699 a2!699 (bvadd (_1!12444 lt!416721) #b00000000000000000000000000000001) (_2!12444 lt!416721)))))

(assert (= (and d!96358 (not res!232573)) b!280182))

(assert (= (and b!280182 res!232574) b!280183))

(declare-fun m!413229 () Bool)

(assert (=> b!280182 m!413229))

(declare-fun m!413231 () Bool)

(assert (=> b!280182 m!413231))

(declare-fun m!413233 () Bool)

(assert (=> b!280183 m!413233))

(assert (=> b!280147 d!96358))

(declare-fun d!96362 () Bool)

(assert (=> d!96362 (arrayRangesEq!1262 a2!699 a1!699 (_1!12444 lt!416721) (_2!12444 lt!416721))))

(declare-fun lt!416742 () Unit!19641)

(declare-fun choose!476 (array!16174 array!16174 (_ BitVec 32) (_ BitVec 32)) Unit!19641)

(assert (=> d!96362 (= lt!416742 (choose!476 a1!699 a2!699 (_1!12444 lt!416721) (_2!12444 lt!416721)))))

(assert (=> d!96362 (and (bvsle #b00000000000000000000000000000000 (_1!12444 lt!416721)) (bvsle (_1!12444 lt!416721) (_2!12444 lt!416721)) (bvsle (_2!12444 lt!416721) (size!6994 a1!699)))))

(assert (=> d!96362 (= (arrayRangesEqSymmetricLemma!169 a1!699 a2!699 (_1!12444 lt!416721) (_2!12444 lt!416721)) lt!416742)))

(declare-fun bs!24302 () Bool)

(assert (= bs!24302 d!96362))

(assert (=> bs!24302 m!413199))

(declare-fun m!413235 () Bool)

(assert (=> bs!24302 m!413235))

(assert (=> b!280147 d!96362))

(declare-fun d!96370 () Bool)

(declare-fun res!232575 () Bool)

(declare-fun e!199855 () Bool)

(assert (=> d!96370 (=> res!232575 e!199855)))

(assert (=> d!96370 (= res!232575 (= (_1!12444 lt!416721) (_2!12444 lt!416721)))))

(assert (=> d!96370 (= (arrayRangesEq!1262 a2!699 a1!699 (_1!12444 lt!416721) (_2!12444 lt!416721)) e!199855)))

(declare-fun b!280184 () Bool)

(declare-fun e!199856 () Bool)

(assert (=> b!280184 (= e!199855 e!199856)))

(declare-fun res!232576 () Bool)

(assert (=> b!280184 (=> (not res!232576) (not e!199856))))

(assert (=> b!280184 (= res!232576 (= (select (arr!7990 a2!699) (_1!12444 lt!416721)) (select (arr!7990 a1!699) (_1!12444 lt!416721))))))

(declare-fun b!280185 () Bool)

(assert (=> b!280185 (= e!199856 (arrayRangesEq!1262 a2!699 a1!699 (bvadd (_1!12444 lt!416721) #b00000000000000000000000000000001) (_2!12444 lt!416721)))))

(assert (= (and d!96370 (not res!232575)) b!280184))

(assert (= (and b!280184 res!232576) b!280185))

(assert (=> b!280184 m!413231))

(assert (=> b!280184 m!413229))

(declare-fun m!413237 () Bool)

(assert (=> b!280185 m!413237))

(assert (=> b!280147 d!96370))

(declare-fun d!96372 () Bool)

(assert (=> d!96372 (= (array_inv!6718 a1!699) (bvsge (size!6994 a1!699) #b00000000000000000000000000000000))))

(assert (=> start!62514 d!96372))

(declare-fun d!96376 () Bool)

(assert (=> d!96376 (= (array_inv!6718 a2!699) (bvsge (size!6994 a2!699) #b00000000000000000000000000000000))))

(assert (=> start!62514 d!96376))

(declare-fun b!280216 () Bool)

(declare-fun e!199889 () Bool)

(declare-fun e!199888 () Bool)

(assert (=> b!280216 (= e!199889 e!199888)))

(declare-fun c!12978 () Bool)

(declare-fun lt!416756 () tuple4!738)

(assert (=> b!280216 (= c!12978 (= (_3!1149 lt!416756) (_4!369 lt!416756)))))

(declare-fun b!280217 () Bool)

(declare-fun call!4613 () Bool)

(assert (=> b!280217 (= e!199888 call!4613)))

(declare-fun b!280218 () Bool)

(declare-fun e!199886 () Bool)

(assert (=> b!280218 (= e!199886 e!199889)))

(declare-fun res!232607 () Bool)

(assert (=> b!280218 (=> (not res!232607) (not e!199889))))

(declare-fun e!199890 () Bool)

(assert (=> b!280218 (= res!232607 e!199890)))

(declare-fun res!232603 () Bool)

(assert (=> b!280218 (=> res!232603 e!199890)))

(assert (=> b!280218 (= res!232603 (bvsge (_1!12444 lt!416756) (_2!12444 lt!416756)))))

(declare-fun lt!416755 () (_ BitVec 32))

(assert (=> b!280218 (= lt!416755 ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!416757 () (_ BitVec 32))

(assert (=> b!280218 (= lt!416757 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!280218 (= lt!416756 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!280219 () Bool)

(declare-fun e!199885 () Bool)

(assert (=> b!280219 (= e!199888 e!199885)))

(declare-fun res!232606 () Bool)

(assert (=> b!280219 (= res!232606 call!4613)))

(assert (=> b!280219 (=> (not res!232606) (not e!199885))))

(declare-fun bm!4610 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!4610 (= call!4613 (byteRangesEq!0 (select (arr!7990 a1!699) (_3!1149 lt!416756)) (select (arr!7990 a2!699) (_3!1149 lt!416756)) lt!416757 (ite c!12978 lt!416755 #b00000000000000000000000000001000)))))

(declare-fun b!280220 () Bool)

(declare-fun e!199887 () Bool)

(assert (=> b!280220 (= e!199887 (byteRangesEq!0 (select (arr!7990 a1!699) (_4!369 lt!416756)) (select (arr!7990 a2!699) (_4!369 lt!416756)) #b00000000000000000000000000000000 lt!416755))))

(declare-fun b!280221 () Bool)

(assert (=> b!280221 (= e!199890 (arrayRangesEq!1262 a1!699 a2!699 (_1!12444 lt!416756) (_2!12444 lt!416756)))))

(declare-fun d!96378 () Bool)

(declare-fun res!232605 () Bool)

(assert (=> d!96378 (=> res!232605 e!199886)))

(assert (=> d!96378 (= res!232605 (bvsge from!822 to!789))))

(assert (=> d!96378 (= (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789) e!199886)))

(declare-fun b!280222 () Bool)

(declare-fun res!232604 () Bool)

(assert (=> b!280222 (= res!232604 (= lt!416755 #b00000000000000000000000000000000))))

(assert (=> b!280222 (=> res!232604 e!199887)))

(assert (=> b!280222 (= e!199885 e!199887)))

(assert (= (and d!96378 (not res!232605)) b!280218))

(assert (= (and b!280218 (not res!232603)) b!280221))

(assert (= (and b!280218 res!232607) b!280216))

(assert (= (and b!280216 c!12978) b!280217))

(assert (= (and b!280216 (not c!12978)) b!280219))

(assert (= (and b!280219 res!232606) b!280222))

(assert (= (and b!280222 (not res!232604)) b!280220))

(assert (= (or b!280217 b!280219) bm!4610))

(assert (=> b!280218 m!413187))

(declare-fun m!413259 () Bool)

(assert (=> bm!4610 m!413259))

(declare-fun m!413261 () Bool)

(assert (=> bm!4610 m!413261))

(assert (=> bm!4610 m!413259))

(assert (=> bm!4610 m!413261))

(declare-fun m!413263 () Bool)

(assert (=> bm!4610 m!413263))

(declare-fun m!413265 () Bool)

(assert (=> b!280220 m!413265))

(declare-fun m!413267 () Bool)

(assert (=> b!280220 m!413267))

(assert (=> b!280220 m!413265))

(assert (=> b!280220 m!413267))

(declare-fun m!413269 () Bool)

(assert (=> b!280220 m!413269))

(declare-fun m!413271 () Bool)

(assert (=> b!280221 m!413271))

(assert (=> b!280144 d!96378))

(push 1)

(assert (not d!96362))

(assert (not b!280221))

(assert (not b!280220))

(assert (not b!280218))

(assert (not b!280185))

(assert (not b!280183))

(assert (not bm!4610))

(check-sat)

(pop 1)

(push 1)

(check-sat)

