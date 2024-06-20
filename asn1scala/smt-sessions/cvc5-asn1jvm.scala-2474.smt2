; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62964 () Bool)

(assert start!62964)

(declare-fun b!281776 () Bool)

(declare-fun e!201243 () Bool)

(declare-fun e!201239 () Bool)

(assert (=> b!281776 (= e!201243 e!201239)))

(declare-fun res!233788 () Bool)

(assert (=> b!281776 (=> res!233788 e!201239)))

(declare-fun lt!417498 () (_ BitVec 32))

(assert (=> b!281776 (= res!233788 (= lt!417498 #b00000000000000000000000000000000))))

(declare-fun b!281777 () Bool)

(declare-fun res!233791 () Bool)

(declare-fun e!201242 () Bool)

(assert (=> b!281777 (=> (not res!233791) (not e!201242))))

(declare-fun from!822 () (_ BitVec 64))

(declare-datatypes ((array!16273 0))(
  ( (array!16274 (arr!8023 (Array (_ BitVec 32) (_ BitVec 8))) (size!7027 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!16273)

(declare-fun a2!699 () array!16273)

(declare-fun to!789 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!16273 array!16273 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!281777 (= res!233791 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun b!281778 () Bool)

(declare-fun res!233792 () Bool)

(assert (=> b!281778 (=> (not res!233792) (not e!201242))))

(assert (=> b!281778 (= res!233792 (bvslt from!822 to!789))))

(declare-fun b!281779 () Bool)

(declare-fun e!201236 () Bool)

(assert (=> b!281779 (= e!201242 e!201236)))

(declare-fun res!233786 () Bool)

(assert (=> b!281779 (=> (not res!233786) (not e!201236))))

(declare-datatypes ((tuple4!804 0))(
  ( (tuple4!805 (_1!12477 (_ BitVec 32)) (_2!12477 (_ BitVec 32)) (_3!1182 (_ BitVec 32)) (_4!402 (_ BitVec 32))) )
))
(declare-fun lt!417500 () tuple4!804)

(assert (=> b!281779 (= res!233786 (not (= (_3!1182 lt!417500) (_4!402 lt!417500))))))

(declare-datatypes ((Unit!19773 0))(
  ( (Unit!19774) )
))
(declare-fun lt!417501 () Unit!19773)

(declare-fun e!201237 () Unit!19773)

(assert (=> b!281779 (= lt!417501 e!201237)))

(declare-fun c!13167 () Bool)

(assert (=> b!281779 (= c!13167 (bvslt (_1!12477 lt!417500) (_2!12477 lt!417500)))))

(assert (=> b!281779 (= lt!417498 ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!417497 () (_ BitVec 32))

(assert (=> b!281779 (= lt!417497 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!804)

(assert (=> b!281779 (= lt!417500 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!281780 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!281780 (= e!201239 (byteRangesEq!0 (select (arr!8023 a1!699) (_4!402 lt!417500)) (select (arr!8023 a2!699) (_4!402 lt!417500)) #b00000000000000000000000000000000 lt!417498))))

(declare-fun b!281781 () Bool)

(declare-fun e!201238 () Bool)

(assert (=> b!281781 (= e!201236 (not e!201238))))

(declare-fun res!233790 () Bool)

(assert (=> b!281781 (=> res!233790 e!201238)))

(assert (=> b!281781 (= res!233790 (= lt!417498 #b00000000000000000000000000000000))))

(assert (=> b!281781 e!201243))

(declare-fun res!233789 () Bool)

(assert (=> b!281781 (=> (not res!233789) (not e!201243))))

(assert (=> b!281781 (= res!233789 (byteRangesEq!0 (select (arr!8023 a1!699) (_3!1182 lt!417500)) (select (arr!8023 a2!699) (_3!1182 lt!417500)) lt!417497 #b00000000000000000000000000001000))))

(declare-fun b!281782 () Bool)

(declare-fun Unit!19775 () Unit!19773)

(assert (=> b!281782 (= e!201237 Unit!19775)))

(declare-fun res!233785 () Bool)

(assert (=> start!62964 (=> (not res!233785) (not e!201242))))

(assert (=> start!62964 (= res!233785 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!7027 a1!699) (size!7027 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7027 a1!699))))))))

(assert (=> start!62964 e!201242))

(assert (=> start!62964 true))

(declare-fun array_inv!6751 (array!16273) Bool)

(assert (=> start!62964 (array_inv!6751 a1!699)))

(assert (=> start!62964 (array_inv!6751 a2!699)))

(declare-fun b!281783 () Bool)

(declare-fun res!233787 () Bool)

(assert (=> b!281783 (=> (not res!233787) (not e!201243))))

(assert (=> b!281783 (= res!233787 (byteRangesEq!0 (select (arr!8023 a2!699) (_3!1182 lt!417500)) (select (arr!8023 a1!699) (_3!1182 lt!417500)) lt!417497 #b00000000000000000000000000001000))))

(declare-fun b!281784 () Bool)

(assert (=> b!281784 (= e!201238 (byteRangesEq!0 (select (arr!8023 a2!699) (_4!402 lt!417500)) (select (arr!8023 a1!699) (_4!402 lt!417500)) #b00000000000000000000000000000000 lt!417498))))

(declare-fun b!281785 () Bool)

(declare-fun Unit!19776 () Unit!19773)

(assert (=> b!281785 (= e!201237 Unit!19776)))

(declare-fun arrayRangesEq!1295 (array!16273 array!16273 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!281785 (arrayRangesEq!1295 a1!699 a2!699 (_1!12477 lt!417500) (_2!12477 lt!417500))))

(declare-fun lt!417499 () Unit!19773)

(declare-fun arrayRangesEqSymmetricLemma!202 (array!16273 array!16273 (_ BitVec 32) (_ BitVec 32)) Unit!19773)

(assert (=> b!281785 (= lt!417499 (arrayRangesEqSymmetricLemma!202 a1!699 a2!699 (_1!12477 lt!417500) (_2!12477 lt!417500)))))

(assert (=> b!281785 (arrayRangesEq!1295 a2!699 a1!699 (_1!12477 lt!417500) (_2!12477 lt!417500))))

(assert (= (and start!62964 res!233785) b!281777))

(assert (= (and b!281777 res!233791) b!281778))

(assert (= (and b!281778 res!233792) b!281779))

(assert (= (and b!281779 c!13167) b!281785))

(assert (= (and b!281779 (not c!13167)) b!281782))

(assert (= (and b!281779 res!233786) b!281781))

(assert (= (and b!281781 res!233789) b!281783))

(assert (= (and b!281783 res!233787) b!281776))

(assert (= (and b!281776 (not res!233788)) b!281780))

(assert (= (and b!281781 (not res!233790)) b!281784))

(declare-fun m!414837 () Bool)

(assert (=> start!62964 m!414837))

(declare-fun m!414839 () Bool)

(assert (=> start!62964 m!414839))

(declare-fun m!414841 () Bool)

(assert (=> b!281779 m!414841))

(declare-fun m!414843 () Bool)

(assert (=> b!281781 m!414843))

(declare-fun m!414845 () Bool)

(assert (=> b!281781 m!414845))

(assert (=> b!281781 m!414843))

(assert (=> b!281781 m!414845))

(declare-fun m!414847 () Bool)

(assert (=> b!281781 m!414847))

(declare-fun m!414849 () Bool)

(assert (=> b!281784 m!414849))

(declare-fun m!414851 () Bool)

(assert (=> b!281784 m!414851))

(assert (=> b!281784 m!414849))

(assert (=> b!281784 m!414851))

(declare-fun m!414853 () Bool)

(assert (=> b!281784 m!414853))

(assert (=> b!281780 m!414851))

(assert (=> b!281780 m!414849))

(assert (=> b!281780 m!414851))

(assert (=> b!281780 m!414849))

(declare-fun m!414855 () Bool)

(assert (=> b!281780 m!414855))

(declare-fun m!414857 () Bool)

(assert (=> b!281785 m!414857))

(declare-fun m!414859 () Bool)

(assert (=> b!281785 m!414859))

(declare-fun m!414861 () Bool)

(assert (=> b!281785 m!414861))

(assert (=> b!281783 m!414845))

(assert (=> b!281783 m!414843))

(assert (=> b!281783 m!414845))

(assert (=> b!281783 m!414843))

(declare-fun m!414863 () Bool)

(assert (=> b!281783 m!414863))

(declare-fun m!414865 () Bool)

(assert (=> b!281777 m!414865))

(push 1)

(assert (not b!281785))

(assert (not b!281779))

(assert (not b!281784))

(assert (not b!281783))

(assert (not b!281780))

(assert (not start!62964))

(assert (not b!281781))

(assert (not b!281777))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!96956 () Bool)

(declare-fun res!233845 () Bool)

(declare-fun e!201298 () Bool)

(assert (=> d!96956 (=> res!233845 e!201298)))

(assert (=> d!96956 (= res!233845 (= (_1!12477 lt!417500) (_2!12477 lt!417500)))))

(assert (=> d!96956 (= (arrayRangesEq!1295 a1!699 a2!699 (_1!12477 lt!417500) (_2!12477 lt!417500)) e!201298)))

(declare-fun b!281850 () Bool)

(declare-fun e!201299 () Bool)

(assert (=> b!281850 (= e!201298 e!201299)))

(declare-fun res!233848 () Bool)

(assert (=> b!281850 (=> (not res!233848) (not e!201299))))

(assert (=> b!281850 (= res!233848 (= (select (arr!8023 a1!699) (_1!12477 lt!417500)) (select (arr!8023 a2!699) (_1!12477 lt!417500))))))

(declare-fun b!281851 () Bool)

(assert (=> b!281851 (= e!201299 (arrayRangesEq!1295 a1!699 a2!699 (bvadd (_1!12477 lt!417500) #b00000000000000000000000000000001) (_2!12477 lt!417500)))))

(assert (= (and d!96956 (not res!233845)) b!281850))

(assert (= (and b!281850 res!233848) b!281851))

(declare-fun m!414931 () Bool)

(assert (=> b!281850 m!414931))

(declare-fun m!414933 () Bool)

(assert (=> b!281850 m!414933))

(declare-fun m!414935 () Bool)

(assert (=> b!281851 m!414935))

(assert (=> b!281785 d!96956))

(declare-fun d!96958 () Bool)

(assert (=> d!96958 (arrayRangesEq!1295 a2!699 a1!699 (_1!12477 lt!417500) (_2!12477 lt!417500))))

(declare-fun lt!417534 () Unit!19773)

(declare-fun choose!504 (array!16273 array!16273 (_ BitVec 32) (_ BitVec 32)) Unit!19773)

(assert (=> d!96958 (= lt!417534 (choose!504 a1!699 a2!699 (_1!12477 lt!417500) (_2!12477 lt!417500)))))

(assert (=> d!96958 (and (bvsle #b00000000000000000000000000000000 (_1!12477 lt!417500)) (bvsle (_1!12477 lt!417500) (_2!12477 lt!417500)) (bvsle (_2!12477 lt!417500) (size!7027 a1!699)))))

(assert (=> d!96958 (= (arrayRangesEqSymmetricLemma!202 a1!699 a2!699 (_1!12477 lt!417500) (_2!12477 lt!417500)) lt!417534)))

(declare-fun bs!24423 () Bool)

(assert (= bs!24423 d!96958))

(assert (=> bs!24423 m!414861))

(declare-fun m!414937 () Bool)

(assert (=> bs!24423 m!414937))

(assert (=> b!281785 d!96958))

(declare-fun d!96960 () Bool)

(declare-fun res!233853 () Bool)

(declare-fun e!201304 () Bool)

(assert (=> d!96960 (=> res!233853 e!201304)))

(assert (=> d!96960 (= res!233853 (= (_1!12477 lt!417500) (_2!12477 lt!417500)))))

(assert (=> d!96960 (= (arrayRangesEq!1295 a2!699 a1!699 (_1!12477 lt!417500) (_2!12477 lt!417500)) e!201304)))

(declare-fun b!281858 () Bool)

(declare-fun e!201305 () Bool)

(assert (=> b!281858 (= e!201304 e!201305)))

(declare-fun res!233854 () Bool)

(assert (=> b!281858 (=> (not res!233854) (not e!201305))))

(assert (=> b!281858 (= res!233854 (= (select (arr!8023 a2!699) (_1!12477 lt!417500)) (select (arr!8023 a1!699) (_1!12477 lt!417500))))))

(declare-fun b!281859 () Bool)

(assert (=> b!281859 (= e!201305 (arrayRangesEq!1295 a2!699 a1!699 (bvadd (_1!12477 lt!417500) #b00000000000000000000000000000001) (_2!12477 lt!417500)))))

(assert (= (and d!96960 (not res!233853)) b!281858))

(assert (= (and b!281858 res!233854) b!281859))

(assert (=> b!281858 m!414933))

(assert (=> b!281858 m!414931))

(declare-fun m!414945 () Bool)

(assert (=> b!281859 m!414945))

(assert (=> b!281785 d!96960))

(declare-fun d!96964 () Bool)

(assert (=> d!96964 (= (array_inv!6751 a1!699) (bvsge (size!7027 a1!699) #b00000000000000000000000000000000))))

(assert (=> start!62964 d!96964))

(declare-fun d!96966 () Bool)

(assert (=> d!96966 (= (array_inv!6751 a2!699) (bvsge (size!7027 a2!699) #b00000000000000000000000000000000))))

(assert (=> start!62964 d!96966))

(declare-fun d!96968 () Bool)

(assert (=> d!96968 (= (byteRangesEq!0 (select (arr!8023 a1!699) (_4!402 lt!417500)) (select (arr!8023 a2!699) (_4!402 lt!417500)) #b00000000000000000000000000000000 lt!417498) (or (= #b00000000000000000000000000000000 lt!417498) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!8023 a1!699) (_4!402 lt!417500))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!417498))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!8023 a2!699) (_4!402 lt!417500))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!417498))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!24425 () Bool)

(assert (= bs!24425 d!96968))

(declare-fun m!414951 () Bool)

(assert (=> bs!24425 m!414951))

(declare-fun m!414953 () Bool)

(assert (=> bs!24425 m!414953))

(assert (=> b!281780 d!96968))

(declare-fun d!96976 () Bool)

(assert (=> d!96976 (= (byteRangesEq!0 (select (arr!8023 a1!699) (_3!1182 lt!417500)) (select (arr!8023 a2!699) (_3!1182 lt!417500)) lt!417497 #b00000000000000000000000000001000) (or (= lt!417497 #b00000000000000000000000000001000) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!8023 a1!699) (_3!1182 lt!417500))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!417497)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!8023 a2!699) (_3!1182 lt!417500))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!417497)))) #b00000000000000000000000011111111))))))

(declare-fun bs!24426 () Bool)

(assert (= bs!24426 d!96976))

(declare-fun m!414955 () Bool)

(assert (=> bs!24426 m!414955))

(declare-fun m!414957 () Bool)

(assert (=> bs!24426 m!414957))

(assert (=> b!281781 d!96976))

(declare-fun d!96978 () Bool)

(assert (=> d!96978 (= (byteRangesEq!0 (select (arr!8023 a2!699) (_3!1182 lt!417500)) (select (arr!8023 a1!699) (_3!1182 lt!417500)) lt!417497 #b00000000000000000000000000001000) (or (= lt!417497 #b00000000000000000000000000001000) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!8023 a2!699) (_3!1182 lt!417500))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!417497)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!8023 a1!699) (_3!1182 lt!417500))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!417497)))) #b00000000000000000000000011111111))))))

(declare-fun bs!24427 () Bool)

(assert (= bs!24427 d!96978))

(assert (=> bs!24427 m!414955))

(assert (=> bs!24427 m!414957))

(assert (=> b!281783 d!96978))

(declare-fun b!281898 () Bool)

(declare-fun e!201341 () Bool)

(declare-fun e!201345 () Bool)

(assert (=> b!281898 (= e!201341 e!201345)))

(declare-fun res!233889 () Bool)

(assert (=> b!281898 (=> (not res!233889) (not e!201345))))

(declare-fun e!201343 () Bool)

(assert (=> b!281898 (= res!233889 e!201343)))

(declare-fun res!233885 () Bool)

(assert (=> b!281898 (=> res!233885 e!201343)))

(declare-fun lt!417553 () tuple4!804)

(assert (=> b!281898 (= res!233885 (bvsge (_1!12477 lt!417553) (_2!12477 lt!417553)))))

(declare-fun lt!417555 () (_ BitVec 32))

(assert (=> b!281898 (= lt!417555 ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!417554 () (_ BitVec 32))

(assert (=> b!281898 (= lt!417554 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!281898 (= lt!417553 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!281899 () Bool)

(declare-fun res!233887 () Bool)

(assert (=> b!281899 (= res!233887 (= lt!417555 #b00000000000000000000000000000000))))

(declare-fun e!201342 () Bool)

(assert (=> b!281899 (=> res!233887 e!201342)))

(declare-fun e!201340 () Bool)

(assert (=> b!281899 (= e!201340 e!201342)))

(declare-fun b!281900 () Bool)

(declare-fun e!201344 () Bool)

(assert (=> b!281900 (= e!201345 e!201344)))

(declare-fun c!13178 () Bool)

(assert (=> b!281900 (= c!13178 (= (_3!1182 lt!417553) (_4!402 lt!417553)))))

(declare-fun bm!4711 () Bool)

(declare-fun call!4714 () Bool)

(assert (=> bm!4711 (= call!4714 (byteRangesEq!0 (select (arr!8023 a1!699) (_3!1182 lt!417553)) (select (arr!8023 a2!699) (_3!1182 lt!417553)) lt!417554 (ite c!13178 lt!417555 #b00000000000000000000000000001000)))))

(declare-fun b!281901 () Bool)

(assert (=> b!281901 (= e!201344 call!4714)))

(declare-fun d!96982 () Bool)

(declare-fun res!233888 () Bool)

(assert (=> d!96982 (=> res!233888 e!201341)))

(assert (=> d!96982 (= res!233888 (bvsge from!822 to!789))))

(assert (=> d!96982 (= (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789) e!201341)))

(declare-fun b!281902 () Bool)

(assert (=> b!281902 (= e!201342 (byteRangesEq!0 (select (arr!8023 a1!699) (_4!402 lt!417553)) (select (arr!8023 a2!699) (_4!402 lt!417553)) #b00000000000000000000000000000000 lt!417555))))

(declare-fun b!281903 () Bool)

(assert (=> b!281903 (= e!201344 e!201340)))

(declare-fun res!233886 () Bool)

(assert (=> b!281903 (= res!233886 call!4714)))

(assert (=> b!281903 (=> (not res!233886) (not e!201340))))

(declare-fun b!281904 () Bool)

(assert (=> b!281904 (= e!201343 (arrayRangesEq!1295 a1!699 a2!699 (_1!12477 lt!417553) (_2!12477 lt!417553)))))

(assert (= (and d!96982 (not res!233888)) b!281898))

(assert (= (and b!281898 (not res!233885)) b!281904))

(assert (= (and b!281898 res!233889) b!281900))

(assert (= (and b!281900 c!13178) b!281901))

(assert (= (and b!281900 (not c!13178)) b!281903))

(assert (= (and b!281903 res!233886) b!281899))

(assert (= (and b!281899 (not res!233887)) b!281902))

(assert (= (or b!281901 b!281903) bm!4711))

(assert (=> b!281898 m!414841))

(declare-fun m!414977 () Bool)

(assert (=> bm!4711 m!414977))

(declare-fun m!414979 () Bool)

(assert (=> bm!4711 m!414979))

(assert (=> bm!4711 m!414977))

(assert (=> bm!4711 m!414979))

(declare-fun m!414981 () Bool)

(assert (=> bm!4711 m!414981))

(declare-fun m!414983 () Bool)

(assert (=> b!281902 m!414983))

(declare-fun m!414985 () Bool)

(assert (=> b!281902 m!414985))

(assert (=> b!281902 m!414983))

(assert (=> b!281902 m!414985))

(declare-fun m!414987 () Bool)

(assert (=> b!281902 m!414987))

(declare-fun m!414989 () Bool)

(assert (=> b!281904 m!414989))

(assert (=> b!281777 d!96982))

(declare-fun d!97000 () Bool)

(assert (=> d!97000 (= (arrayBitIndices!0 from!822 to!789) (tuple4!805 ((_ extract 31 0) (bvadd (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!281779 d!97000))

(declare-fun d!97006 () Bool)

(assert (=> d!97006 (= (byteRangesEq!0 (select (arr!8023 a2!699) (_4!402 lt!417500)) (select (arr!8023 a1!699) (_4!402 lt!417500)) #b00000000000000000000000000000000 lt!417498) (or (= #b00000000000000000000000000000000 lt!417498) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!8023 a2!699) (_4!402 lt!417500))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!417498))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!8023 a1!699) (_4!402 lt!417500))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!417498))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!24433 () Bool)

(assert (= bs!24433 d!97006))

(assert (=> bs!24433 m!414951))

(assert (=> bs!24433 m!414953))

(assert (=> b!281784 d!97006))

(push 1)

(assert (not b!281851))

(assert (not b!281898))

(assert (not b!281902))

(assert (not bm!4711))

(assert (not b!281904))

(assert (not b!281859))

(assert (not d!96958))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

